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
    def __init__(self,dev):
        self.ser = serial.Serial(dev,115200)
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
        for key,val in self.mem_map.iteritems():
            self.mem_map_rev[val] = key

    def send_transaction(self,op,arg1,arg2):
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
        if isinstance(addr, basestring):
            self.send_transaction(Opcodes.CG_WRITE, self.mem_map[addr], data)
        else:
            self.send_transaction(Opcodes.CG_WRITE, addr, data)

    def read(self,addr):
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
        frac = self.get_rational(factor*2)
        M = frac[0]
        D = frac[1]
        C = max(D & 0xff, (D & 0xff00)>>1)
        N = min(D & 0xff, (D & 0xff00)>>1)
        if N == 0: N += 1

        self.reconfigure(M=M,N=N,C=C,duty=duty,phase=phase)



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
        phase = 14 + kwargs.get('phase',0)
        duty = kwargs.get('duty', 0.5)

        # set to polling mode
        self.pll_reset()

        if M <= 0 or C <= 0 or N <= 0:
            raise ValueError('PLL parameters cant be <= 0')

        if phase < 0:
            raise ValueError('PLL phase cant be < 0')

        if duty > 2 or duty < 0.01:
            raise ValueError('Duty cycle must be > 0.01 and < 0.99')

        s = 20/max(M,C)
        M = self._format(M*s, duty)
        C = self._format(C*s, duty)
        N = self._format(N, duty)


        # set phase in forward direction
        phase = phase | (1<<21)

        self.write('mode',1)
        self.write('M',M)
        self.write('N',N)
        self.write('C',C)
        self.write('phase',phase)
        self.write('start',1)
        while self.read('status') == 0: pass




#dev = sys.argv[1]
#a = UART2AVA(dev)
#a.send_read(,0x9abcdef0)





