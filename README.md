# OStest

I'm still working on this 64 bits kernel, and the reason is just for fun.

### Environment:

Simulator: 

Bochs x86 Emulator 2.6

Compiler: 

NASM 2.13.02 and GCC 7.5.0



### How to view this system through simulator:

clone the code in to local computer and make sure the environment has been set up, then use

`make`

to compile and load system in to bochs

### TODO:

Load system in to memory and jump in to IA-32 mode					Finished

Initialize GDT, IDT, TSS and primitive page table								Finished

Print function(string, decimal, hex, char)											 Finished

8295A PIC Initialize																				  Finished

Memory information&physical page allocation								 Finished

Task and thread initialization																Finished

Jump to ring3 and implement system call									      Finished

Slab allocator and kmalloc()/kfree()													 Finished

APIC																										   Unfinished

Device drive(keyboard, hdd)																 Unfinished

Task management:																				 Unfinished

​			MP(IPI)																						  Unfinished

​			Schd																							  Unfinished

Filesystem(FAT32)																				  Unfinished

API lib																										Unfinished
