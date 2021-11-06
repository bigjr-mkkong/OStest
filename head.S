#include "linkage.h"
.section .text

.globl _start

ENTRY(_start)

	lgdt	GdtPtr(%rip)

	lidt	IdtPtr(%rip)

/*====================load cr3*/

	movq $0x101000,%rax
	movq %rax,%cr3
	movq switch_seg(%rip),%rax
	pushq $0x08
	pushq %rax
	lretq

/*code below execute in 64-bit*/

switch_seg:
	.quad entry64

entry64:
	movq $SelectorData64,%rax
	movq %rax,%ds
	movq %rax,%es
	movq %rax,%gs
	movq %rax,%ss
	movq _stack_start(%rip),%rsp

setup_idt:
	leaq unrecord_int(%rip),%rdx			/*rdx: 64:0 offset of unrecord_int*/
	movq $(0x08<<16),%rax					/*rax: selecotr*/
	movw %dx,%ax							/*rax: 15:0 offset in rdx move to rax*/
	movq $(0x8E00<<32),%rcx					/*attribute in rcx*/
	addq %rcx,%rax							/*rax:attribute & selector & 15:0 offset*/
	movl %edx,%ecx 							/*ecx: 32:0 offset*/  
	shrl $16,%ecx 							/*ecx:32:16 offset*/
	shlq $48,%rcx 							/*rcx:32:16 offset(MSB)*/
	
	addq %rcx,%rax 							
	/*rax:32:16 offset & attribute & selector & 16:0 offset*/

	shrq $32,%rdx 							/*rdx:64:32 offset*/
	leaq LABEL_IDT(%rip),%rdi				/*rdi: base addr for idt*/
	mov $256,%rcx
.setting:
	movq %rax,(%rdi)
	movq %rdx,8(%rdi)
	addq $0x10,%rdi
	dec %rcx
	jne .setting

setup_TSS64:
	leaq LABEL_TSS64(%rip),%rdx					/*rdx: 64 bits tss offset*/
	xorq %rax,%rax								/*clear rax and rcx*/
	xorq %rcx,%rcx
	movq $0x89,%rax								/*rax:1000 1001*/
	shlq $40,%rax								/*rax:attri*/
	movl %edx,%ecx 								/*ecx:31:0  for tss*/
	shrl $24,%ecx 								/*ecx:31:24 for tss*/
	shlq $56,%rcx 								/*rcx:31:24 for tss*/
	addq %rcx,%rax								/*rax:31:24 for tss & attri*/
	xorq %rcx,%rcx								/*clear rcx*/
	movl %edx,%ecx 								/*ecx:31:0 for tss*/
	andl $0xffffff,%ecx 						/*ecx:23:0 for tss*/
	shlq $16,%rcx 								/*rcx: 47:16->23:0 for tss*/
	addq %rcx,%rax
	addq $103,%rax
	leaq LABEL_GDT64(%rip),%rdi
	movq %rax,80(%rdi)
	shrq $32,%rdx 								/*rdx:15:0 for tss & limit*/
	movq %rdx,88(%rdi)

	/*mov $SelectorTss64_1,%ax
	ltr	%ax*/


	movq go_to_kernel(%rip),%rax
	pushq $0x08
	pushq %rax
	lretq


go_to_kernel:
	.quad 	Start_Kernel
	
unrecord_int:
	cld
	pushq %rax
	pushq %rbx
	pushq %rcx
	pushq %rdx
	pushq %rbp
	pushq %rdi
	pushq %rsi

	pushq %r8
	pushq %r9
	pushq %r10
	pushq %r11
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15

	movq %es,%rax
	pushq %rax
	movq %ds,%rax
	pushq %rax

	movq $0x10,%rax
	movq %rax,%ds
	movq %rax,%es

	leaq int_msg(%rip),%rax
	pushq %rax
	movq %rax,%rdx
	movq $0,%rax
	callq printk
	addq $0x8,%rsp	

	popq %rax
	movq %rax,%ds
	popq %rax
	movq %rax,%es

	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %r11
	popq %r10
	popq %r9
	popq %r8

	popq %rsi
	popq %rdi
	popq %rbp
	popq %rdx
	popq %rcx
	popq %rbx
	popq %rax
	iretq

int_msg:
	.asciz "Unknown interrupt or fault at RIP\n"

ENTRY(_stack_start)
	.quad	init_task_union + 32768

/*======================page table=====================*/
.align 8

.org	0x1000

__PML4E:

	.quad	0x102003
	.fill	255,8,0
	.quad	0x102003
	.fill	255,8,0

.org	0x2000

__PDPTE:
	
	.quad	0x103003	/* 0x103003 */
	.fill	511,8,0

.org	0x3000

__PDE:

	.quad	0x000083	
	.quad	0x200083
	.quad	0x400083
	.quad	0x600083
	.quad	0x800083  	/* 0x800083 */
	.quad	0xa00083
	.quad	0xc00083
	.quad	0xe00083
	.quad	0x1000083
	.quad	0x1200083
	.quad	0x1400083
	.quad	0x1600083
	.quad	0x1800083
	.quad	0x1a00083
	.quad	0x1c00083
	.quad	0x1e00083
	.quad	0x2000083
	.quad	0x2200083
	.quad	0x2400083
	.quad	0x2600083
	.quad	0x2800083
	.quad	0x2a00083
	.quad	0x2c00083
	.quad	0x2e00083



	.quad	0xe0000083  	/*0x 3000000*/
	.quad	0xe0200083
	.quad	0xe0400083
	.quad	0xe0600083
	.quad	0xe0800083
	.quad	0xe0a00083
	.quad	0xe0c00083
	.quad	0xe0e00083
	.fill	480,8,0

/*=============GDT=========================*/

.section .data

.globl LABEL_GDT64

	LABEL_GDT64:				.quad	0x0000000000000000 /*0 0x00*/
	LABEL_DESC_KERNEL_CODE64:	.quad	0x0020980000000000 /*1 0x08*/
	LABEL_DESC_KERNEL_DATA64:	.quad	0x0000920000000000 /*2 0x10*/
	LABEL_DESC_USER_CODE32:		.quad	0x0000000000000000 
	LABEL_DESC_USER_DATA32:		.quad	0x0000000000000000
	LABEL_DESC_USER_CODE64:		.quad	0x0020f80000000000
	LABEL_DESC_USER_DATA64:		.quad	0x0000f20000000000
	LABEL_DESC_KERNEL_CODE32:	.quad	0x00cf9a000000ffff
	LABEL_DESC_KERNEL_DATA32:	.quad 	0x00cf92000000ffff
	.fill 10,8,0
GDT_END:
		
.equ	SelectorData64 , LABEL_DESC_KERNEL_DATA64 - LABEL_GDT64
.equ	SelectorCode64 , LABEL_DESC_KERNEL_CODE64 - LABEL_GDT64

GdtPtr:
GdtLen:	.word	GDT_END - LABEL_GDT64 - 1
.quad	LABEL_GDT64

/*===============IDT=======================*/

.globl LABEL_IDT

LABEL_IDT:
	.fill  512,8,0
IDT_END:

IdtPtr:
IdtLen:	.word	IDT_END - LABEL_IDT - 1
.quad	LABEL_IDT

/*=============TSS=========================*/

.globl LABEL_TSS64

LABEL_TSS64:
	.fill  13,8,0
TSS64_END:

Tss64Ptr:
Tss64Len:	.word	TSS64_END - LABEL_TSS64 - 1
.quad	LABEL_TSS64

