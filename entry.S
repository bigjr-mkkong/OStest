#include "linkage.h"
/*stack offset map*/
R15=0x00
R14=0x08
R13=0x10
R12=0x18
R11=0x20
R10=0x28
R9=0x30
R8=0x38
RBX=0x40
RCX=0x48
RDX=0x50
RSI=0x58
RDI=0x60
RBP=0x68
DS=0x70
ES=0x78
RAX=0x80
FUNC=0x88
ERRCODE=0x90
RIP=0x98
CS=0xa0
RFLAGS=0xa8
OLDRSP=0xb0
OLDSS=0xb8

TSK_STATE=0x0
TSK_FLAGS=0x08
TSK_SPINCOUNTER=0x10
TSK_SIGNAL=0x18

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

#define GET_CURRENT(reg)	\
	movq $-32768,reg;	\
	andq %rsp,reg


ret_from_exception:
	
/*
Task with one(or more) spin_lock should be prevent from schedule in order to make sure two different task willl
not access one resource(schedule() can have the potential to switch current task away when current task is using
some resource)
*/
ENTRY(ret_from_intr)
	movq $-1,%rcx
	testq softirq_status(%rip),%rcx		/*check for soft irq*/
	jnz softirq_handler					/*any bits in softirq_status is 1, means there's a softirq, jump to handler*/
	GET_CURRENT(%rbx)					/*get current task base address(PCB base)*/
	movq TSK_SPINCOUNTER(%rbx),%rcx		/*move spin_counter to rcx waiting for check*/
	cmpq $0,%rcx
	jne RESTORE_ALL						/*if spin_counter(%rcx)!=0, current task is holding some spin_lock, should not schedule*/
	movq TSK_FLAGS(%rbx),%rcx			/*move flags in to %rcx*/
	testq $2,%rcx						/*if current task NEED_SCHEDULE bit is set*/
	jnz reschedule						/*schedule it*/
	jmp	RESTORE_ALL

softirq_handler:						/*now handling soft irq*/
	callq do_softirq					/*execute softiq handler program*/
	GET_CURRENT(%rbx)
	/*same as ret_from_intr, prevent task with one(or more) spin_lock from schedule()*/
	movq TSK_SPINCOUNTER(%rbx),%rcx
	cmpq $0,%rcx
	jne RESTORE_ALL
	movq TSK_FLAGS(%rbx),%rcx
	testq $2,%rcx						/*check current task NEED_SCHEDULE bit*/
	jnz reschedule						/*schedule it*/
	jmp RESTORE_ALL

reschedule:
	call schedule
	jmp RESTORE_ALL

ENTRY(system_call)
	sti
	subq $0x38,%rsp			 

	pushq %rax;				 	
	movq %es,%rax;			 	
	pushq %rax;				 	
	movq %ds,%rax;			 	
	pushq %rax;				 	
	xorq %rax,%rax;			 	
	pushq %rbp;				 	
	pushq %rdi;				 	
	pushq %rsi;				 	
	pushq %rdx;				 	
	pushq %rcx;				 
	pushq %rbx;				 	
	pushq %r8;				 	
	pushq %r9;				 	
	pushq %r10;				 
	pushq %r11;				 
	pushq %r12;				 	
	pushq %r13;				 
	pushq %r14;				 	
	pushq %r15;				 	
	movq $0x10,%rdx;			 	
	movq %rdx,%ds;			 	
	movq %rdx,%es;			 
	movq %rsp,%rdi			 	
			
	callq	system_call_function

/*
ret_system_call:

*/

ENTRY(ret_system_call)			
	movq %rax,0x80(%rsp)		 
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
	addq $0x38,%rsp
	sti
	.byte 0x48		 
	sysexit

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

/*
If fault do not have error code, push $0
*/

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

ENTRY(nmi)
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
