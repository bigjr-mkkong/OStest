.section .text

.globl _start

_start:

	mov	$SelectorData64,%ax
	mov	%ax,%ds
	mov	%ax,%es
	mov	%ax,%fs
	mov	%ax,%ss
	mov	$0x7E00,%esp

	lgdt	GdtPtr(%rip)

	lidt	IdtPtr(%rip)
/*
	mov	$SelectorData64,%ax
	mov	%ax,%ds
	mov	%ax,%es
	mov	%ax,%fs
	mov	%ax,%gs
	mov	%ax,%ss

	movq $0x7E00,%rsp*/

//====================load cr3

	movq $0x101000,%rax
	movq %rax,%cr3
	movq switch_seg(%rip),%rax
	pushq $0x08
	pushq %rax
	lretq

//code below execute in 64-bit

switch_seg:
	.quad entry64

entry64:
	movq $SelectorData64,%rax
	movq %rax,%ds
	movq %rax,%es
	movq %rax,%gs
	movq %rax,%ss
	movq $0xffff800000007E00,%rsp

	movq go_to_kernel(%rip),%rax
	pushq $0x08
	pushq %rax
	lretq

go_to_kernel:
	.quad 	Start_Kernel

//=======	init page
.align 8

.org 0x1000

__PML4E:

	.quad	0x102007
	.fill	255,8,0
	.quad	0x102007
	.fill	255,8,0

.org 0x2000

__PDPTE:
	
	.quad	0x103003
	.fill	511,8,0

.org 0x3000

__PDE:

	.quad	0x000083	
	.quad	0x200083
	.quad	0x400083
	.quad	0x600083
	.quad	0x800083
	.quad	0xe0000083		/*0x a00000*/
	.quad	0xe0200083
	.quad	0xe0400083
	.quad	0xe0600083		/*0x1000000*/
	.quad	0xe0800083
	.quad	0xe0a00083
	.quad	0xe0c00083
	.quad	0xe0e00083
	.fill	499,8,0

/*=============GDT=========================*/

.section .data

.globl LABEL_GDT64

	LABEL_GDT64:				.quad	0x0000000000000000
	LABEL_DESC_KERNEL_CODE64:	.quad	0x0020980000000000
	LABEL_DESC_KERNEL_DATA64:	.quad	0x0000920000000000
	LABEL_DESC_USER_CODE64:		.quad	0x0020f80000000000
	LABEL_DESC_USER_DATA64:		.quad	0x0000f20000000000
	.fill	12,8,0
GDT_END:
		
.equ	SelectorData64 , LABEL_DESC_KERNEL_DATA64 - LABEL_GDT64

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

.globl	LABEL_TSS64

LABEL_TSS64:
	.fill  13,8,0
TSS64_END:

Tss64Ptr:
Tss64Len:	.word	TSS64_END - LABEL_TSS64 - 1
.quad	LABEL_TSS64

