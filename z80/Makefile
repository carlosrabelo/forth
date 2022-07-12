all:

clean:

	rm -fr *.bin
	rm -fr *.hex

step1: forth.asm

	z80asm -i forth.asm -o forth.bin

step2: forth.bin

	hexdump -C forth.bin > forth.hex

build: step1 step2
