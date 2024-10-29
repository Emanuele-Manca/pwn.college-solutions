#/!bin/bash

gcc -nostdlib -static -g -o exec.out inj$1.s &&
objcopy --dump-section .text=.text exec.out 
/challenge/babyshell_level$1 < .text
