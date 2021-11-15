CFLAGS := -mcmodel=large -fno-builtin -m64 -c -fno-stack-protector

all: system boot
	objcopy -I elf64-x86-64 -S -R ".eh_frame" -R ".comment" -O binary system kernel.bin
	dd if=boot/boot.bin of=a.img bs=512 count=1 conv=notrunc
	sudo mount -t msdos -o loop a.img /mnt/floppy/
	sudo cp -fv boot/loader.bin /mnt/floppy/
	sudo cp -fv kernel.bin /mnt/floppy/
	sudo umount /mnt/floppy/
	bochs -f bochsrc

system:	head.o entry.o main.o printk.o trap.o memory.o lib.o interrupt.o task.o cpu.o 8259a.o APIC.o
	ld -b elf64-x86-64 -z muldefs -o system head.o entry.o main.o printk.o trap.o memory.o \
	lib.o interrupt.o task.o cpu.o 8259a.o APIC.o \
	-T Kernel.lds 

head.o:	head.S
	gcc -E  head.S > head.s
	as --64 -o head.o head.s

entry.o:entry.S
	gcc -E  entry.S > entry.s
	as --64 -o entry.o entry.s

main.o:	main.c
	gcc  $(CFLAGS) main.c

printk.o:printk.c
	gcc  $(CFLAGS) printk.c

trap.o:trap.c
	gcc  $(CFLAGS) trap.c

memory.o:memory.c
	gcc  $(CFLAGS) memory.c

lib.o:lib.c
	gcc  $(CFLAGS) lib.c

interrupt.o:interrupt.c
	gcc  $(CFLAGS) interrupt.c

task.o:task.c
	gcc  $(CFLAGS) task.c

cpu.o:cpu.c
	gcc  $(CFLAGS) cpu.c

8259a.o:8259a.c
	gcc  $(CFLAGS) 8259a.c

APIC.o:APIC.c
	gcc  $(CFLAGS) APIC.c
#------------------------bootup-------------------------------
boot: boot/loader.bin boot/boot.bin

boot/loader.bin: boot/loader.asm
	nasm boot/loader.asm -o boot/loader.bin

boot/boot.bin: boot/boot.bin
	nasm boot/boot.asm -o boot/boot.bin

clean:
	rm -rf *.s *.bin *.o *.txt system *.i