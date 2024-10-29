import random

size = 68*8

print(size)

while size > 0:
    print(chr(random.randint(1, 255)))
    size -= 1