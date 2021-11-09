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

Load system in to memory and jump in to IA-32 mode - <font color=green>Finished</font>

Initialize GDT, IDT, TSS and primitive page table - <font color=green>Finished</font>

Print function(string, decimal, hex, char) - <font color=green>Finished</font>

8295A PIC Initialize - <font color=green>Finished</font>

Memory information&physical page allocation - <font color=green>Finished</font>

Task and thread initialization - <font color=green>Finished</font>

Jump to ring3 and implement system call - <font color=green>Finished</font>

Slab allocator and kmalloc()/kfree() - <font color=green>Finished</font>

APIC - <font color=blue>Working</font>

Device drive(keyboard, hdd) - <font color=red>Unfinished</font>

Task management: - <font color=red>Unfinished</font>

​			MP(IPI) - <font color=red>Unfinished</font>

​			Schd - <font color=red>Unfinished</font>

Filesystem(FAT32) - <font color=red>Unfinished</font>

API lib - <font color=red>Unfinished</font>
