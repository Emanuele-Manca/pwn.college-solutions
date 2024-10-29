import os

os.write(1, b'390451573\n11\n')
# 22dd
for _ in range(53):
    os.write(1, b'\x3f\x16')
