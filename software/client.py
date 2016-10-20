#!/usr/bin/python
import sys, struct
import serial, binascii

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print 'usage: %s <device>' % sys.argv[0]
        sys.exit(1)



class Opcodes():
    CG_WRITE = 1
    CG_READ = 2
    CG_RESET_RECONFIG = 3

class CG():
    def __init__(self,dev,**kwargs):
        """
            dev = the path to USB/serial device e.g. /dev/ttyUSB0
            kwargs['freq'] = input frequency to PLL in Hz, default 50 MHz
        """
        self.ser = serial.Serial(dev,115200)
        self.Fin = kwargs.get('freq',50 * 10e6)
        # See Altera doc AN-661
        self.mem_map = {
                'mode':     0b000000,
                'status':   0b000001,
                'start':    0b000010,
                'N':        0b000011,
                'M':        0b000100,
                'C':        0b000101,
                'phase':    0b000110,
                'fraction': 0b000111,
                'bandwidth':0b001000,
                'charge':   0b001001,
                'vcodiv':   0b011100,
            }
        self.mem_map_rev = {}
        self.last_write = {}
        for key,val in self.mem_map.iteritems():
            self.mem_map_rev[val] = key

    def send_transaction(self,op,arg1,arg2):
        """ Abstraction layer for Nios 2 UART to AVALON bus """
        op = struct.pack('!I',op)
        arg1 = struct.pack('!I',arg1)
        arg2 = struct.pack('!I',arg2)
        #print binascii.hexlify(op), binascii.hexlify(arg1), binascii.hexlify(arg2)

        self.ser.write(op)
        self.ser.write(arg1)
        self.ser.write(arg2)

        ret = self.ser.read(4)
        ret = struct.unpack('!I', ret)[0]
        if ret is not 0:
            print 'Error: return code ', ret

    def write(self,addr,data):
        """ Write to Altera PLL register """
        if isinstance(addr, basestring):
            self.last_write[addr] = data
            self.send_transaction(Opcodes.CG_WRITE, self.mem_map[addr], data)
        else:
            self.last_write[ self.mem_map_rev[addr] ] = data
            self.send_transaction(Opcodes.CG_WRITE, addr, data)

    def read(self,addr):
        """ Read from Altera PLL register """
        if isinstance(addr, basestring):
            self.send_transaction(Opcodes.CG_READ, self.mem_map[addr],0)
        else:
            self.send_transaction(Opcodes.CG_READ, addr, 0)

        ret = self.ser.read(4)
        ret = struct.unpack('!I', ret)[0]
        #print 'read ', hex(ret)
        return ret

    def pll_reset(self,):
        self.send_transaction(Opcodes.CG_RESET_RECONFIG, 0, 0)

    def get_rational(self,dec):
        """
            returns a tuple representing rational fraction for given float.
            up to 8 bits numerator and 16 bits denominator
        """
        n = 1.0
        d = 1.0
        tol = 1e-3
        while True:
            r = n/d
            if r > (dec - tol) and r < (dec + tol):
                break
            elif r > dec:
                d += 1.0
            else:
                n += 1.0
            if n >= 0xfd:
                break
            if d >= 0xfff0:
                break
        return (int(n),int(d))


    def _format(self,num,duty=1.0):
        """
            Format argument for altera PLL register and duty cycle
        """
        num &= 0xff
        leftover = num - max(int(num* duty),1)
        if duty > 1:
            leftover = max( num - int(num * (duty-1)), 1)
        
        num |= (max(int(num*duty),1) << 8)
        num += leftover
        if duty > 1:
            num &= (num & 0xff00)
            num |= leftover

        return num

    def set_glitch(self,factor,duty,phase):
        """
            Main interface.
            factor = the scalar to multiply input clock by to get output clock i.e. Fout = Fin * factor.  float type.
            duty = percent of time that output clock is high.  Must be > 0 and <= 1
            phase = percent of period to be offset relative to input frequency. Must be >= 0 and <= 1
        """
        frac = self.get_rational(factor*2)
        M = frac[0]
        D = frac[1]
        C = max(D & 0xff, (D & 0xff00)>>1)
        N = min(D & 0xff, (D & 0xff00)>>1)
        if N == 0: N += 1

        self.reconfigure(M=M,N=N,C=C,duty=duty*2 - 1e-6,phase=phase)

    def info(self,):
        M = (self.last_write['M'] & 0xff) + (self.last_write['M'] >> 8)
        N = (self.last_write['N'] & 0xff) + (self.last_write['N'] >> 8)
        C = (self.last_write['C'] & 0xff) + (self.last_write['C'] >> 8)
        print ' M / ( N * C) == %d / ( %d * %d ) == %f' % (M,N,C,float(M)/(N*C))
        print 'VCO == Fin * %f' % (float(M)/(N))


    def reconfigure(self,**kwargs):
        # TODO add a duty cycle option (it alters M and C parameters for duty cycle ratio).
        """
            keywords M, N, C, phase

            F_out = F_in * M / (N * C)
            p phase shift steps

        """
        M = kwargs.get('M',1)
        C = kwargs.get('C',1)
        N = kwargs.get('N',1)
        phase = kwargs.get('phase',0)
        duty = kwargs.get('duty', 0.5)

        # set to polling mode
        self.pll_reset()
        self.pll_reset()

        if M <= 0 or C <= 0 or N <= 0:
            raise ValueError('PLL parameters cant be <= 0')

        if phase < 0 or phase > 1:
            raise ValueError('PLL phase cant be < 0 or > 1')

        if duty > 2 or duty < 0.01:
            raise ValueError('Duty cycle must be > 0.01 and < 0.99')


        s = 20/max(M,C)
        M = self._format(M*s, duty)
        C = self._format(C*s, duty)
        N = self._format(N, duty)

        # add offset to phase that aligns it to input clock
        Fin = 50.0 * 10 ** 6
        VCO = Fin * ((M & 0xff) + (M >> 8)) / ((N & 0xff) + (N >> 8))

        # the minimun step for phase increments, based on VCO
        phase_quantum = ((VCO ** -1) / 8 )

        # the number of offsets to get input clk and output clk in phase
        offset = int(17.70 * 10e-9 / phase_quantum)

        # compensate for duty cycle change

        # total number of phase increments in a period
        phase_quanta = (Fin ** -1) / phase_quantum


        # Percent * total period increments + offset to be in phase | (bit set to indicate increments not decrements)
        # also some compensation for duty cycle changes (found experimentally...)
        P = int(((phase + 2*(duty/2 -.5)) * phase_quanta + offset) % phase_quanta) | (1<<21)


        self.write('mode',1)
        self.write('M',M)
        self.write('N',N)
        self.write('N',N)
        self.write('C',C)
        self.write('phase',P)
        self.write('start',1)
        while self.read('status') == 0: pass







