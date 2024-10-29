#/!bin/bash

gcc -nostdlib -static -c -o obj.o asm$1.s &&
objcopy -O binary obj.o .text 
#/challenge/embryoasm_level* < .text
