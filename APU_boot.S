#include "linkage.h"

.balign 0x1000

.text
.code16

ENTRY(APU_boot_start)

APU_boot_base=.

    /*close interrupt and synchronize APU cache to memory*/
    cli
    wbinvd

    /*initializing APU registers(include esp)*/
    mov %cs,%ax
    mov %ax,%ds
    mov %ax,%es
    mov %ax,%ss
    mov %ax,%fs
    mov %ax,%gs

    movl $(APU_boot_tmp_stack_end-APU_boot_base),%esp
    
    /*calculate boot program's base address*/
    mov %cs,%ax
    movzx %ax,%esi
    shll $4,%esi

    /*add up base address and offset*/
    leal (APU_Code32-APU_boot_base)(%esi),%eax
    movl %eax,APU_Code32_vector-APU_boot_base

    leal (APU_Code64-APU_boot_base)(%esi),%eax
    movl %eax,APU_Code64_vector-APU_boot_base

    leal (APU_tmp_GDT-APU_boot_base)(%esi),%eax
    movl %eax,(APU_tmp_GDT+2-APU_boot_base)

    /*load temp idt and gdt*/
    lidtl APU_tmp_IDT-APU_boot_base
    lgdtl APU_tmp_GDT-APU_boot_base

    /*set CR0.PE in to 1*/
    mov	%cr0,%eax
	or $1,%eax
	mov	%eax,%cr0

    /*jmp to 32bits protect mode*/
    ljmpl *(APU_Code32_vector-APU_boot_base)

.code32
.balign 4
APU_Code32:
    /*initializing registers*/
    mov $0x10,%ax
    mov %ax,%ds
    mov %ax,%es
    mov %ax,%ss
    mov %ax,%fs
    mov %ax,%gs

    hlt

.code64
.balign 4
APU_Code64:


.balign 4
APU_tmp_IDT:
    .word 0
    .word 0,0

.balign 4
APU_tmp_GDT:
    .short APU_tmp_GDT_end-APU_tmp_GDT-1/*data in GDTR*/
    .long APU_tmp_GDT-APU_boot_base
    .short 0
    .quad 0x00cf9a000000ffff/*32 bits kernel code segment*/
	.quad 0x00cf92000000ffff/*32 bits kernel data segment*/
	.quad 0x0020980000000000/*64 bits kernel code segment*/
	.quad 0x0000920000000000/*64 bits kernel data segment*/
APU_tmp_GDT_end:

.balign 4
APU_Code32_vector:
    .long APU_Code32-APU_boot_base
    .word 0x08,0/*code segment in 64 bits*/

.balign 4
APU_Code64_vector:
    .long APU_Code64-APU_boot_base
    .word 0x18,0/*code segment in 64 bits*/

.balign 4
APU_boot_tmp_stack_start:/*reserved stack space for boot program*/
    .org 0x400
APU_boot_tmp_stack_end:

ENTRY(APU_boot_end)