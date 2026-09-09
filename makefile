.PHONY: all

all:
	nasm -f bin invader.asm -o invader.bin
run:
	qemu-system-i386 -drive format=raw,file=invader.bin

