all: system boot
	objcopy -I elf64-x86-64 -S -R ".eh_frame" -R ".comment" -O binary system kernel.bin
	dd if=boot/boot.bin of=a.img bs=512 count=1 conv=notrunc
	sudo mount -t msdos -o loop a.img /mnt/floppy/
	sudo cp -fv boot/loader.bin /mnt/floppy/
	sudo cp -fv kernel.bin /mnt/floppy/
	sudo umount /mnt/floppy/
	bochs -f bochsrc
	make clean

system:	head.o entry.o main.o printk.o trap.o
	ld -b elf64-x86-64 -o system head.o entry.o main.o printk.o trap.o -T Kernel.lds 

head.o:	head.S
	gcc -E  head.S > head.s
	#nasm selfhead.asm -o head.s
	as --64 -o head.o head.s

entry.o:entry.S
	gcc -E  entry.S > entry.s
	#nasm selfhead.asm -o head.s
	as --64 -o entry.o entry.s

main.o:	main.c
	gcc  -mcmodel=large -fno-builtin -m64 -c -fno-stack-protector main.c

printk.o:printk.c
	gcc  -mcmodel=large -fno-builtin -m64 -c -fno-stack-protector printk.c

trap.o:trap.c
	gcc  -mcmodel=large -fno-builtin -m64 -c -fno-stack-protector trap.c


#------------------------bootup-------------------------------
boot: boot/loader.bin boot/boot.bin

boot/loader.bin: boot/loader.asm
	nasm boot/loader.asm -o boot/loader.bin

boot/boot.bin: boot/boot.bin
	nasm boot/boot.asm -o boot/boot.bin

clean:
	rm -rf *.s *.bin *.o *.txt system