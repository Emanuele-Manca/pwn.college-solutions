#!/bin/bash

if [ -z "$1" ]; then
    echo "insert level number"
    exit 1
fi

echo -e ".intel_syntax noprefix\n\n.section .text\n\t" > ~/asm/asm$1.s
/challenge/embryoasm_level* & 
