# 1 "head.S"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 32 "<command-line>" 2
# 1 "head.S"
.section .text

.globl _start

_start:

 mov $SelectorData64,%ax
 mov %ax,%ds
 mov %ax,%es
 mov %ax,%fs
 mov %ax,%ss
 mov $0x7E00,%esp

 lgdt GdtPtr(%rip)

 lidt IdtPtr(%rip)
# 29 "head.S"
 movq $0x101000,%rax
 movq %rax,%cr3
 movq switch_seg(%rip),%rax
 pushq $0x08
 pushq %rax
 lretq



switch_seg:
 .quad entry64

entry64:
 movq $SelectorData64,%rax
 movq %rax,%ds
 movq %rax,%es
 movq %rax,%gs
 movq %rax,%ss
 movq $0xffff800000007E00,%rsp

setup_idt:
 leaq unrecord_int(%rip),%rdx
 movq $(0x08<<16),%rax
 movw %dx,%ax
 movq $(0x8E00<<32),%rcx
 addq %rcx,%rax
 movl %edx,%ecx
 shrl $16,%ecx
 shlq $48,%rcx

 addq %rcx,%rax


 shrq $32,%rdx
 leaq LABEL_IDT(%rip),%rdi
 mov $256,%rcx
.setting:
 movq %rax,(%rdi)
 movq %rdx,8(%rdi)
 addq $0x10,%rdi
 dec %rcx
 jne .setting

setup_TSS64:
 leaq LABEL_TSS64(%rip),%rdx
 xorq %rax,%rax
 xorq %rcx,%rcx
 movq $0x89,%rax
 shlq $40,%rax
 movl %edx,%ecx
 shrl $24,%ecx
 shlq $56,%rcx
 addq %rcx,%rax
 xorq %rcx,%rcx
 movl %edx,%ecx
 andl $0xffffff,%ecx
 shlq $16,%rcx
 addq %rcx,%rax
 addq $103,%rax
 leaq LABEL_GDT64(%rip),%rdi
 movq %rax,SelectorTss64_1(%rdi)
 shrq $32,%rdx
 movq %rdx,SelectorTss64_2(%rdi)





 movq go_to_kernel(%rip),%rax
 pushq $0x08
 pushq %rax
 lretq


go_to_kernel:
 .quad Start_Kernel

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

.align 8

.org 0x1000

__PML4E:

 .quad 0x102007
 .fill 255,8,0
 .quad 0x102007
 .fill 255,8,0

.org 0x2000

__PDPTE:

 .quad 0x103003
 .fill 511,8,0

.org 0x3000

__PDE:

 .quad 0x000083
 .quad 0x200083
 .quad 0x400083
 .quad 0x600083
 .quad 0x800083
 .quad 0xe0000083
 .quad 0xe0200083
 .quad 0xe0400083
 .quad 0xe0600083
 .quad 0xe0800083
 .quad 0xe0a00083
 .quad 0xe0c00083
 .quad 0xe0e00083
 .fill 499,8,0



.section .data

.globl LABEL_GDT64

 LABEL_GDT64: .quad 0x0000000000000000
 LABEL_DESC_KERNEL_CODE64: .quad 0x0020980000000000
 LABEL_DESC_KERNEL_DATA64: .quad 0x0000920000000000
 LABEL_DESC_USER_CODE64: .quad 0x0020f80000000000
 LABEL_DESC_USER_DATA64: .quad 0x0000f20000000000
 .fill 3,8,0
 LABEL_DESC_TSS64_1: .quad 0x0000000000000000
 LABEL_DESC_TSS64_2: .quad 0x0000000000000000
 .fill 7,8,0
GDT_END:

.equ SelectorData64 , LABEL_DESC_KERNEL_DATA64 - LABEL_GDT64
.equ SelectorCode64 , LABEL_DESC_KERNEL_CODE64 - LABEL_GDT64
.equ SelectorTss64_1, LABEL_DESC_TSS64_1 - LABEL_GDT64
.equ SelectorTss64_2, LABEL_DESC_TSS64_2 - LABEL_GDT64

GdtPtr:
GdtLen: .word GDT_END - LABEL_GDT64 - 1
.quad LABEL_GDT64



.globl LABEL_IDT

LABEL_IDT:
 .fill 512,8,0
IDT_END:

IdtPtr:
IdtLen: .word IDT_END - LABEL_IDT - 1
.quad LABEL_IDT



.globl LABEL_TSS64

LABEL_TSS64:
 .fill 13,8,0
TSS64_END:

Tss64Ptr:
Tss64Len: .word TSS64_END - LABEL_TSS64 - 1
.quad LABEL_TSS64
