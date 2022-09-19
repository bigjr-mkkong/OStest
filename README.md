# OStest

I'm still working on this 64 bits OS kernel, see TODO for current progress.

### Environment:

Host OS:

Ubuntu 20.04.3 LTS

Emulator: 

QEMU emulator version 4.2.1

Compiler: 

NASM 2.13.02 and GCC 7.5.0

### microarchitecture for this OS:

Intel Nehalem

### Architecture for this OS:

x86_64

### How to view this system through simulator:

clone the code in to local computer(Ubuntu) and make sure the environment has been set up, then use

`make`

to compile and load system in to qemu

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

+APIC initialization- Finished

+Device drive(keyboard, mouse, hdd) - Finished

+SMP and IPI - Finished

+Task management: - Finished

+Schd - Finished

@@Filesystem(FAT32) - Working@@

-API lib - Unfinished

-Shell - Unfinished

```

