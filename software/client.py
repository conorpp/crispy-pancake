import sys, struct
import serial, binascii

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print 'usage: %s <device>' % sys.argv[0]
        sys.exit(1)



class Opcodes():
    CG_START_RECONFIG = 0
    CG_WRITE = 1
    CG_READ = 2
    CG_RESET_RECONFIG = 3

class UART2AVA():
    def __init__(self,dev):
        self.ser = serial.Serial(dev,115200)


    def send_transaction(self,op,arg1,arg2):
        op = struct.pack('!I',op)
        arg1 = struct.pack('!I',arg1)
        arg2 = struct.pack('!I',arg2)
        print binascii.hexlify(op), binascii.hexlify(arg1), binascii.hexlify(arg2)

        self.ser.write(op)
        self.ser.write(arg1)
        self.ser.write(arg2)

        ret = self.ser.read(4)
        ret = struct.unpack('!I', ret)[0]
        if ret is not 0:
            print 'Error: return code ', ret

    def ava_write(self,addr,data):
        self.send_transaction(Opcodes.CG_WRITE, addr, data)

    def ava_read(self,addr):
        self.send_transaction(Opcodes.CG_READ, addr, 0)
        ret = self.ser.read(4)
        ret = struct.unpack('!I', ret)[0]
        print 'read ', hex(ret)



#dev = sys.argv[1]
#a = UART2AVA(dev)
#a.send_read(,0x9abcdef0)





