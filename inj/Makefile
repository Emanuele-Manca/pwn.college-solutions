
chllg: text
	/challenge/babyshell_level$(lvl) < .text

text: inj$(lvl).s
	gcc -nostdlib -static -g -o exec.out inj$(lvl).s
	objcopy --dump-section .text=.text exec.out

stack: inj-stack.s
	gcc -nostdlib -static -g -o exec.out inj-stack.s 
	objcopy --dump-section .text=.text-stack exec.out

test: test.s
	gcc -nostdlib -static -g -o test.out test.s
