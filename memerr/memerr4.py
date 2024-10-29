import random
import os

os.write(1, b'58\n')

#print(size, end='')

# for _ in range(size):
#     print('a', end='')

# 1bc4

for _ in range(100):
    os.write(1, b'\x27\x1b')
