# OStest

I'm still working on this 64 bits kernel, and the reason is just for fun.

### Environment:

System:

Ubuntu 20.04.3 LTS

Emulator: 

QEMU emulator version 4.2.1

Compiler: 

NASM 2.13.02 and GCC 7.5.0

### CPU architecture for the system:

Nehalem

### How to view this system through simulator:

clone the code in to local computer(Ubuntu) and make sure the environment has been set up, then use

`make`

to compile and load system in to bochs

### TODO:

```diff

+Load system in to memory and jump in to IA-32 mode - Finished

+Initialize GDT, IDT, TSS and primitive page table - Finished

+Print function(string, decimal, hex, char) - Finished

+8295A PIC Initialize - Finished

+Memory information&physical page allocation - Finished

+Task and thread initialization - Finished

+Jump to ring3 and implement system call - Finished

+Slab allocator and kmalloc()/kfree() - Finished

+APIC - Finished

+Device drive(keyboard, mouse, hdd) - Finished

@@Task management: - Working@@

-MP(IPI) - Unfinished

-Schd - Unfinished

-Filesystem(FAT32) - Unfinished

-API lib - Unfinished

```

