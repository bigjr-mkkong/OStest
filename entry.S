#include "linkage.h"
/*stack offset map*/
R15	= 0x00
R14	= 0x08
R13	= 0x10
R12	= 0x18
R11	= 0x20
R10	= 0x28
R9	= 0x30
R8	= 0x38
RBX	= 0x40
RCX	= 0x48
RDX	= 0x50
RSI	= 0x58
RDI	= 0x60
RBP	= 0x68
DS	= 0x70
ES	= 0x78
RAX	= 0x80
FUNC = 0x88
ERRCODE	= 0x90
RIP	= 0x98
CS = 0xa0
RFLAGS = 0xa8
OLDRSP = 0xb0
OLDSS =	0xb8


RESTORE_ALL:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %r11
	popq %r10
	popq %r9
	popq %r8
	popq %rbx
	popq %rcx
	popq %rdx
	popq %rsi
	popq %rdi
	popq %rbp
	popq %rax
	movq %rax,%ds
	popq %rax	
	movq %rax,%es
	popq %rax	
	addq $0x10,%rsp	
	iretq

ret_from_exception:
	

ENTRY(ret_from_intr)
	jmp	RESTORE_ALL

error_code:
	pushq %rax
	movq %es,%rax
	pushq %rax
	movq %ds,%rax
	pushq %rax
	xorq %rax,%rax

	pushq %rbp
	pushq %rdi
	pushq %rsi
	pushq %rdx
	pushq %rcx
	pushq %rbx
	pushq %r8
	pushq %r9
	pushq %r10
	pushq %r11
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15	

	cld //0x104049
	movq ERRCODE(%rsp),%rsi
	movq FUNC(%rsp),%rdx	

	movq $0x10,%rdi
	movq %rdi,%ds
	movq %rdi,%es

	movq %rsp,%rdi

	callq *%rdx

	jmp	ret_from_exception

ENTRY(divide_error)
	pushq $0 //0x10406e
	pushq %rax
	leaq do_divide_error(%rip),%rax
	xchgq %rax,(%rsp)
	/*push address of FUNC in to stack without modify any register*/
	jmp error_code //0x104078

ENTRY(debug)
	pushq $0
	pushq %rax
	leaq do_debug(%rip),%rax
	xchgq %rax,(%rsp)
	jmp	error_code

ENTRY(nmi) /*nmi cannot use normal stack to handle with?*/
	pushq %rax
	cld
	pushq %rax
	
	pushq %rax
	movq %es,%rax
	pushq %rax
	movq %ds,%rax
	pushq %rax
	xorq %rax,%rax
	
	pushq %rbp
	pushq %rdi
	pushq %rsi
	pushq %rdx
	pushq %rcx
	pushq %rbx
	pushq %r8
	pushq %r9
	pushq %r10
	pushq %r11
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
	
	movq $0x10,%rdx	
	movq %rdx,%ds	
	movq %rdx,%es
	
	movq $0,%rsi
	movq %rsp,%rdi

	callq do_nmi

	jmp	RESTORE_ALL

ENTRY(breakpoint)
	pushq $0
	pushq %rax
	leaq do_breakpoint(%rip),%rax
	xchgq %rax,(%rsp)
	jmp	error_code

ENTRY(overflow)
	pushq $0
	pushq %rax
	leaq do_overflow(%rip),%rax
	xchgq %rax,(%rsp)
	jmp	error_code

ENTRY(bounds)
	pushq $0
	pushq %rax
	leaq do_bounds(%rip),%rax
	xchgq %rax,(%rsp)
	jmp	error_code

ENTRY(undefined_opcode)
	pushq $0
	pushq %rax
	leaq do_undefined_opcode(%rip),%rax
	xchgq %rax,(%rsp)
	jmp	error_code

ENTRY(dev_not_available)
	pushq $0
	pushq %rax
	leaq do_dev_not_available(%rip),%rax
	xchgq %rax,(%rsp)
	jmp	error_code


ENTRY(double_fault)
	pushq %rax
	leaq do_double_fault(%rip),%rax
	xchgq %rax,(%rsp)
	jmp	error_code

ENTRY(coprocessor_segment_overrun)
	pushq $0
	pushq %rax
	leaq do_coprocessor_segment_overrun(%rip),%rax
	xchgq %rax,(%rsp)
	jmp	error_code

ENTRY(invalid_TSS)
	pushq %rax
	leaq do_invalid_TSS(%rip),%rax
	xchgq %rax,(%rsp)
	jmp	error_code

ENTRY(segment_not_present)
	pushq %rax
	leaq do_segment_not_present(%rip),%rax
	xchgq %rax,(%rsp)
	jmp	error_code

ENTRY(stack_segment_fault)
	pushq %rax
	leaq do_stack_segment_fault(%rip),%rax
	xchgq %rax,(%rsp)
	jmp	error_code

ENTRY(general_protection)
	pushq %rax
	leaq do_general_protection(%rip),%rax
	xchgq %rax,(%rsp)
	jmp	error_code

ENTRY(page_fault)
	pushq %rax
	leaq do_page_fault(%rip),%rax
	xchgq %rax,(%rsp)
	jmp	error_code

ENTRY(x87_FPU_error)
	pushq $0
	pushq %rax
	leaq do_x87_FPU_error(%rip),%rax
	xchgq %rax,(%rsp)
	jmp	error_code

ENTRY(alignment_check)
	pushq %rax
	leaq do_alignment_check(%rip),%rax
	xchgq %rax,(%rsp)
	jmp	error_code

ENTRY(machine_check)
	pushq $0
	pushq %rax
	leaq do_machine_check(%rip),%rax
	xchgq %rax,(%rsp)
	jmp	error_code

ENTRY(SIMD_exception)
	pushq $0
	pushq %rax
	leaq do_SIMD_exception(%rip),%rax
	xchgq %rax,(%rsp)
	jmp	error_code

ENTRY(virtualization_exception)
	pushq $0
	pushq %rax
	leaq do_virtualization_exception(%rip),%rax
	xchgq %rax,(%rsp)
	jmp	error_code