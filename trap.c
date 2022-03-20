#include "trap.h"
#include "printk.h"
#include "lib.h"
#include "task.h"
#include "SMP.h"

void do_divide_error(unsigned long rsp, unsigned error_code){
	unsigned long *p=NULL;
	p=(unsigned long*)(rsp+0x98);
	printk(BLACK,RED,"Divide Error(#DE)\nErrorCode: %d RSP:%x RIP:%x\n CPU:%x",
		error_code,
		rsp,
		*p,
		SMP_cpu_id());
	while(1);
}

void do_debug(unsigned long rsp,unsigned long error_code){
	unsigned long *p=NULL;
	p=(unsigned long*)(rsp+0x98);
	printk(BLACK,RED,"Debug(#DB)\nErrorCode: %d RSP:%x RIP:%x CPU:%x\n",
		error_code,
		rsp,
		*p,
		SMP_cpu_id());
	while(1);
}

void do_nmi(unsigned long rsp,unsigned long error_code){
	unsigned long *p=NULL;
	p=(unsigned long*)(rsp+0x98);
	printk(BLACK,RED,"NMI Interrupt(-)\nErrorCode: %d RSP:%x RIP:%x CPU:%x\n",
		error_code,
		rsp,
		*p,
		SMP_cpu_id());
	while(1);
}

void do_breakpoint(unsigned long rsp,unsigned long error_code){
	unsigned long *p=NULL;
	p=(unsigned long*)(rsp+0x98);
	printk(BLACK,RED,"BreakPoint(#BP)\nErrorCode: %d RSP:%x RIP:%x CPU:%x\n",
		error_code,
		rsp,
		*p,
		SMP_cpu_id());
	while(1);
}

void do_overflow(unsigned long rsp,unsigned long error_code){
	unsigned long *p=NULL;
	p=(unsigned long*)(rsp+0x98);
	printk(BLACK,RED,"OverFlow(#OF)\nErrorCode: %d RSP:%x RIP:%x CPU:%x\n",
		error_code,
		rsp,
		*p,
		SMP_cpu_id());
	while(1);
}

void do_bounds(unsigned long rsp,unsigned long error_code){
	unsigned long *p=NULL;
	p=(unsigned long*)(rsp+0x98);
	printk(BLACK,RED,"BOUND Range Exceeded(#BR)\nErrorCode: %d RSP:%x RIP:%x CPU:%x\n",
		error_code,
		rsp,
		*p,
		SMP_cpu_id());
	while(1);
}

void do_undefined_opcode(unsigned long rsp,unsigned long error_code){
	unsigned long *p=NULL;
	p=(unsigned long*)(rsp+0x98);
	printk(BLACK,RED,"Invalid Opcode (Undefined Opcode)(#UD)\n\
		ErrorCode: %d RSP:%x RIP:%x CPU:%x\n",
		error_code,
		rsp,
		*p,
		SMP_cpu_id());
	while(1);
}

void do_dev_not_available(unsigned long rsp,unsigned long error_code){
	unsigned long *p=NULL;
	p=(unsigned long*)(rsp+0x98);
	printk(BLACK,RED," Device Not Available (No Math Coprocessor)(#NM)\n\
		ErrorCode: %d RSP:%x RIP:%x CPU:%x\n",
		error_code,
		rsp,
		*p,
		SMP_cpu_id());
	while(1);
}

void do_double_fault(unsigned long rsp,unsigned long error_code){
	unsigned long *p=NULL;
	p=(unsigned long*)(rsp+0x98);
	printk(BLACK,RED,"Double Fault(#DF)\nErrorCode: %d RSP:%x RIP:%x CPU:%x\n",
		error_code,
		rsp,
		*p,
		SMP_cpu_id());
	while(1);
}

void do_coprocessor_segment_overrun(unsigned long rsp,unsigned long error_code){
	unsigned long *p=NULL;
	p=(unsigned long*)(rsp+0x98);
	printk(BLACK,RED,"Coprocessor Segment Overrun (reserved)( )\
		\nErrorCode: %d RSP:%x RIP:%x CPU:%x\n",
		error_code,
		rsp,
		*p,
		SMP_cpu_id());
	while(1);
}

void do_invalid_TSS(unsigned long rsp,unsigned long error_code){
	unsigned long *p=NULL;
	p=(unsigned long*)(rsp+0x98);
	printk(BLACK,RED,"Invalid TSS(#TS)\nErrorCode: %d RSP:%x RIP:%x CPU:%x\n",
		error_code,
		rsp,
		*p,
		SMP_cpu_id());
	if(error_code&0x01){
		printk(BLACK,RED,"The exception occurred during delivery of an event \
		external to the program,such as an interrupt or an earlier exception.\n");
	}
	if(error_code&0x02){
		printk(BLACK,RED,"Refers to a gate descriptor in the IDT;\n");
	}else{
		printk(BLACK,RED,"Refers to a descriptor in the GDT or the current LDT;\n");
	}

	if((error_code&0x02) == 0){
		if(error_code&0x04){
			printk(BLACK,RED,"Refers to a segment or gate descriptor in the LDT;\n");
		}else{
			printk(BLACK,RED,"Refers to a descriptor in the current GDT;\n");
		}
	}

	printk(BLACK,RED,"Segment Selector Index:%x\n",error_code&0xfff8);

	while(1);
}
void do_segment_not_present(unsigned long rsp,unsigned long error_code){
	unsigned long *p=NULL;
	p=(unsigned long*)(rsp+0x98);
	printk(BLACK,RED," Segment Not Present(#NP)\nErrorCode: %d RSP:%x RIP:%x CPU:%x\n",
		error_code,
		rsp,
		*p,
		SMP_cpu_id());
	if(error_code&0x01){
		printk(BLACK,RED,"The exception occurred during delivery of an event \
		external to the program,such as an interrupt or an earlier exception.\n");
	}
	if(error_code&0x02){
		printk(BLACK,RED,"Refers to a gate descriptor in the IDT;\n");
	}else{
		printk(BLACK,RED,"Refers to a descriptor in the GDT or the current LDT;\n");
	}

	if((error_code&0x02) == 0){
		if(error_code&0x04){
			printk(BLACK,RED,"Refers to a segment or gate descriptor in the LDT;\n");
		}else{
			printk(BLACK,RED,"Refers to a descriptor in the current GDT;\n");
		}
	}

	printk(BLACK,RED,"Segment Selector Index:%x\n",error_code&0xfff8);

	while(1);
}
void do_stack_segment_fault(unsigned long rsp,unsigned long error_code){
	unsigned long *p=NULL;
	p=(unsigned long*)(rsp+0x98);
	printk(BLACK,RED,"Stack-Segment Fault(#SS)\nErrorCode: %d RSP:%x RIP:%x CPU:%x\n",
		error_code,
		rsp,
		*p,
		SMP_cpu_id());

	if(error_code&0x01){
		printk(BLACK,RED,"The exception occurred during delivery of an event \
		external to the program,such as an interrupt or an earlier exception.\n");
	}
	if(error_code&0x02){
		printk(BLACK,RED,"Refers to a gate descriptor in the IDT;\n");
	}else{
		printk(BLACK,RED,"Refers to a descriptor in the GDT or the current LDT;\n");
	}

	if((error_code&0x02) == 0){
		if(error_code&0x04){
			printk(BLACK,RED,"Refers to a segment or gate descriptor in the LDT;\n");
		}else{
			printk(BLACK,RED,"Refers to a descriptor in the current GDT;\n");
		}
	}

	printk(BLACK,RED,"Segment Selector Index:%x\n",error_code&0xfff8);

	while(1);
}
void do_general_protection(unsigned long rsp,unsigned long error_code){
	unsigned long *p=NULL;
	p=(unsigned long*)(rsp+0x98);
	printk(BLACK,RED,"General Protection(#GP)\nErrorCode: %d RSP:%x RIP:%x CPU:%x\n",
		error_code,
		rsp,
		*p,
		SMP_cpu_id());

	if(error_code&0x01){
		printk(BLACK,RED,"The exception occurred during delivery of an event \
		external to the program,such as an interrupt or an earlier exception.\n");
	}
	if(error_code&0x02){
		printk(BLACK,RED,"Refers to a gate descriptor in the IDT;\n");
	}else{
		printk(BLACK,RED,"Refers to a descriptor in the GDT or the current LDT;\n");
	}

	if((error_code&0x02)==0){
		if(error_code&0x04){
			printk(BLACK,RED,"Refers to a segment or gate descriptor in the LDT;\n");
		}else{
			printk(BLACK,RED,"Refers to a descriptor in the current GDT;\n");
		}
	}

	printk(BLACK,RED,"Segment Selector Index:%x\n",error_code&0xfff8);

	while(1);
}
void do_page_fault(unsigned long rsp,unsigned long error_code){
	unsigned long *p=NULL;
	unsigned long cr2=0;

	__asm__	__volatile__("movq %%cr2,%0":"=r"(cr2)::"memory");

	p=(unsigned long *)(rsp+0x98);
	printk(BLACK,RED,"Page Fault(#PF)\nErrorCode:%d RSP:%x RIP:%x CPU:%x\n"
		,error_code,rsp,*p,SMP_cpu_id());

	if(!(error_code&0x01)){
		printk(BLACK,RED,"Page Not-Present,\n");
	}

	if(error_code&0x02){
		printk(BLACK,RED,"Write Cause Fault,\n");
	}else{
		printk(BLACK,RED,"Read Cause Fault,\n");
	}

	if(error_code&0x04){
		printk(BLACK,RED,"Fault in user(3)\n");
	}else{
		printk(BLACK,RED,"Fault in supervisor(0,1,2)\n");
	}

	if(error_code&0x08){
		printk(BLACK,RED,",Reserved Bit Cause Fault\n");
	}

	if(error_code&0x10){
		printk(BLACK,RED,",Instruction fetch Cause Fault\n");
	}

	printk(BLACK,RED,"CR2:%x\n",cr2);

	while(1);
}

void do_x87_FPU_error(unsigned long rsp,unsigned long error_code){
	unsigned long *p=NULL;
	p=(unsigned long*)(rsp+0x98);
	printk(BLACK,RED,"x87 FPU Floating-Point Error (Math Fault)(#MF) \
		\nErrorCode: %d RSP:%x RIP:%x CPU:%x\n",
		error_code,
		rsp,
		*p,
		SMP_cpu_id());
	while(1);
}

void do_alignment_check(unsigned long rsp,unsigned long error_code){
	unsigned long *p=NULL;
	p=(unsigned long*)(rsp+0x98);
	printk(BLACK,RED,"Alignment Check(#AC)\nErrorCode: %d RSP:%x RIP:%x CPU:%x\n",
		error_code,
		rsp,
		*p,
		SMP_cpu_id());
	while(1);
}
void do_machine_check(unsigned long rsp,unsigned long error_code){
	unsigned long *p=NULL;
	p=(unsigned long*)(rsp+0x98);
	printk(BLACK,RED,"Machine Check(#MC)\nErrorCode: %d RSP:%x RIP:%x CPU:%x\n",
		error_code,
		rsp,
		*p,
		SMP_cpu_id());
	while(1);
}
void do_SIMD_exception(unsigned long rsp,unsigned long error_code){
	unsigned long *p=NULL;
	p=(unsigned long*)(rsp+0x98);
	printk(BLACK,RED,"SIMD Floating-Point Exception(#XM)\
		\nErrorCode: %d RSP:%x RIP:%x CPU:%x\n",
		error_code,
		rsp,
		*p,
		SMP_cpu_id());
	while(1);
}
void do_virtualization_exception(unsigned long rsp,unsigned long error_code){
	unsigned long *p=NULL;
	p=(unsigned long*)(rsp+0x98);
	printk(BLACK,RED," Virtualization Exception(#VE)\nErrorCode: %d RSP:%x RIP:%x CPU:%x\n",
		error_code,
		rsp,
		*p,
		SMP_cpu_id());
	while(1);
}

void set_sys_int(){
	set_trap_gate(0,0,divide_error);
	set_trap_gate(1,0,debug);
	set_intr_gate(2,0,nmi);
	set_system_gate(3,0,breakpoint);
	set_system_gate(4,0,overflow);
	set_system_gate(5,0,bounds);
	set_trap_gate(6,0,undefined_opcode);
	set_trap_gate(7,0,dev_not_available);
	set_trap_gate(8,0,double_fault);
	set_trap_gate(9,0,coprocessor_segment_overrun);
	set_trap_gate(10,0,invalid_TSS);
	set_trap_gate(11,0,segment_not_present);
	set_trap_gate(12,0,stack_segment_fault);
	set_trap_gate(13,0,general_protection);
	set_trap_gate(14,0,page_fault);
	//int 15 reserved
	set_trap_gate(16,0,x87_FPU_error);
	set_trap_gate(17,0,alignment_check);
	set_trap_gate(18,0,machine_check);
	set_trap_gate(19,0,SIMD_exception);
	set_trap_gate(20,0,virtualization_exception);
}