import sys, struct
import serial, binascii

if len(sys.argv) != 2:
    print 'usage: %s <device>' % sys.argv[0]
    sys.exit(1)


dev = sys.argv[1]


class UART2AVA():
    def __init__(self,dev):
        self.ser = serial.Serial(dev,115200)

    def send_transaction(self,addr,data):
        addr = struct.pack('!I',addr)
        data = struct.pack('!I',data)
        print binascii.hexlify(addr), binascii.hexlify(data)

        self.ser.write(addr)
        self.ser.write(data)



a = UART2AVA(dev)
a.send_transaction(0x12345678,0x9abcdef0)





