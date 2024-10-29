#/!bin/bash

echo -e ".intel_syntax noprefix\n\n.section .text\n\t" > ~/inj/temp.s
cat - >> ~/inj/temp.s
gcc -nostdlib -static -c -o ~/inj/obj.o ~/inj/temp.s &&
objcopy -O binary ~/inj/obj.o ~/inj/.text &&
hexdump ~/inj/.text