PIC := APIC

APUNUM := 3

CFLAGS := -mcmodel=large -fno-builtin -m64 -c -fno-stack-protector -g

Object := head.o entry.o main.o printk.o trap.o memory.o \
	lib.o interrupt.o task.o cpu.o PIC.o keyboard.o mouse.o disk.o SMP.o APU_boot.o \
	spinlock.o time.o HPET.o softirq.o timer.o schedule.o atomic.o semaphore.o 

QemuParameter := -cpu Nehalem,+x2apic -m 512 \
	-enable-kvm -D ./log.txt -s -S -fda a.img -hda 80m.img -smp cores=$(APUNUM)

all: system boot
	objcopy --only-keep-debug system kernel.debug
	objcopy -I elf64-x86-64 -S -R ".eh_frame" -R ".comment" -O binary system kernel.bin
	dd if=boot/boot.bin of=a.img bs=512 count=1 conv=notrunc
	sudo mount -t msdos -o loop a.img /mnt/floppy/
	sudo cp -fv boot/loader.bin /mnt/floppy/
	sudo cp -fv kernel.bin /mnt/floppy/
	sudo umount /mnt/floppy/
	qemu-system-x86_64 $(QemuParameter)


system:	$(Object)
	ld -b elf64-x86-64 -z muldefs -o system $(Object) -T Kernel.lds 

head.o:	head.S
	gcc -E  head.S > head.s
	as --64 -o head.o head.s

entry.o:entry.S
	gcc -E  entry.S > entry.s
	as --64 -o entry.o entry.s

main.o:	main.c
	gcc  $(CFLAGS) main.c -D$(PIC) -D APUNUM=$(APUNUM)

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

ifeq ($(PIC),APIC)
PIC.o:APIC.c
	gcc  $(CFLAGS) APIC.c -o PIC.o
else
PIC.o:8259a.c
	gcc  $(CFLAGS) 8259a.c -o PIC.o
endif

keyboard.o:keyboard.c
	gcc  $(CFLAGS) keyboard.c

mouse.o:mouse.c
	gcc  $(CFLAGS) mouse.c

disk.o:disk.c
	gcc  $(CFLAGS) disk.c

SMP.o:SMP.c
	gcc  $(CFLAGS) SMP.c

APU_boot.o:APU_boot.S
	gcc -E  APU_boot.S > APU_boot.s
	as --64 -o APU_boot.o APU_boot.s

spinlock.o:spinlock.c
	gcc  $(CFLAGS) spinlock.c

time.o:time.c
	gcc  $(CFLAGS) time.c

HPET.o:HPET.c
	gcc  $(CFLAGS) HPET.c

softirq.o:softirq.c
	gcc  $(CFLAGS) softirq.c

timer.o:timer.c
	gcc  $(CFLAGS) timer.c

schedule.o:schedule.c
	gcc  $(CFLAGS) schedule.c

atomic.o:atomic.c
	gcc  $(CFLAGS) atomic.c

semaphore.o:semaphore.c
	gcc  $(CFLAGS) semaphore.c
#------------------------bootup-------------------------------
boot: boot/loader.bin boot/boot.bin

boot/loader.bin: boot/loader.asm
	nasm boot/loader.asm -o boot/loader.bin

boot/boot.bin: boot/boot.bin
	nasm boot/boot.asm -o boot/boot.bin

clean:
	rm -rf *.s *.bin *.o *.txt system *.i *.debug
	rm boot/*.bin