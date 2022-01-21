#include "task.h"
#include "printk.h"
#include "gate.h"
#include "memory.h"
#include "schedule.h"
#include "keyboard.h"
#include "mouse.h"

extern void ret_system_call(void);
extern void system_call(void);

void user_level_function(){
	long ret = 0;
	char str[]="Hello World!\n";

	__asm__	__volatile__(
					"leaq sysexit_return_address(%%rip),%%rdx	\n\t"
					"movq %%rsp,%%rcx	\n\t"
					"sysenter			\n\t"
					"sysexit_return_address:	\n\t"
					:"=a"(ret):"0"(1),"D"(str):"memory"
					);	
	while(1);
}

unsigned long  system_call_function(struct pt_regs * regs){
	return system_call_table[regs->rax](regs);
}

unsigned long do_execve(struct pt_regs *regs){
	unsigned long addr=0x800000;
	unsigned long *tmp;
	unsigned long *virtual=NULL;
	struct page *p=NULL;

	regs->rdx=0x800000;	//rip
	regs->rcx=0xa00000;	//rsp
	regs->rax=1;
	regs->ds=0;
	regs->es=0;
	printk(RED,BLACK,"do_execve task is running\n");

	virtual=kmalloc(PAGE_4K_SIZE,0);
	virtual=kmalloc(PAGE_4K_SIZE,0);
	while(1);

	Global_CR3=Get_gdt();
	tmp=phy2vir((unsigned long*)((unsigned long)Global_CR3&(~0xfffUL))+((addr>>PAGE_GDT_SHIFT)&0x1ff));

	virtual=kmalloc(PAGE_4K_SIZE,0);
	set_mpl4t(tmp,mk_mpl4t(vir2phy(virtual),PAGE_USER_GDT));

	virtual=kmalloc(PAGE_4K_SIZE,0);
	tmp=phy2vir((unsigned long*)(*tmp&(~0xfffUL))+((addr>>PAGE_1G_SHIFT)&0x1ff));
	set_pdpt(tmp,mk_pdpt(vir2phy(virtual),PAGE_USER_Dir));

	tmp=phy2vir((unsigned long*)(*tmp&(~0xfffUL))+((addr>>PAGE_2M_SHIFT)&0x1ff));
	p=alloc_pages(ZONE_NORMAL,1,PG_PTable_Maped);
	set_pdt(tmp,mk_pdt(p->phy_addr,PAGE_USER_Page));

	flush_tlb();

	if(!(current->flags&PF_KTHREAD))
		current->addr_limit=0xffff800000000000;

	memcpy(user_level_function,(void *)0x800000,1024);

	return 0;
}
extern void kernel_thread_func(void);
/*
kernel_thread_func() runs before task, in order to pop context stored in 
stack in to registers(context will be stored in stack by do_fork())
*/
void kernel_thread_func(){
	__asm__ (
		"popq %r15 \n\t"
		"popq %r14 \n\t"
		"popq %r13 \n\t"
		"popq %r12 \n\t"
		"popq %r11 \n\t"
		"popq %r10 \n\t"
		"popq %r9 \n\t"
		"popq %r8 \n\t"
		"popq %rbx \n\t"
		"popq %rcx \n\t"
		"popq %rdx \n\t"
		"popq %rsi \n\t"
		"popq %rdi \n\t"
		"popq %rbp \n\t"
		"popq %rax \n\t"
		"movq %rax,%ds \n\t"
		"popq %rax \n\t"
		"movq %rax,%es \n\t"
		"popq %rax \n\t"
		"addq $0x38,%rsp \n\t"
		"movq %rcx, %rdi \n\t"
		"callq *%rcx \n\t"
		"movq %rax, %rdi \n\t"
		"callq do_exit \n\t"
	);
}

unsigned long init(unsigned long arg){
	struct pt_regs *regs;

	printk(RED,BLACK,"init task is running,arg:%d\n",arg);

	current->thread->rip=(unsigned long)ret_system_call;
	current->thread->rsp=(unsigned long)current + STACK_SIZE - sizeof(struct pt_regs);
	regs=(struct pt_regs *)current->thread->rsp;
	current->flags=0;

	__asm__	__volatile__(	
				"movq %1,%%rsp	\n\t"
				"pushq %2 		\n\t"
				"jmp do_execve	\n\t"
				::"D"(regs),"m"(current->thread->rsp),"m"(current->thread->rip):"memory");
	return 1;
}

void __switch_to(struct task_struct *prev,struct task_struct *next){
	init_tss[0].rsp0=next->thread->rsp0;

	set_tss64(LABEL_TSS64,init_tss[0].rsp0,init_tss[0].rsp1,init_tss[0].rsp2,init_tss[0].ist1,\
		init_tss[0].ist2,init_tss[0].ist3,init_tss[0].ist4,init_tss[0].ist5,\
		init_tss[0].ist6,init_tss[0].ist7);

	__asm__ __volatile__("movq %%fs,%0 \n\t":"=a"(prev->thread->fs));
	__asm__ __volatile__("movq %%gs,%0 \n\t":"=a"(prev->thread->gs));

	__asm__ __volatile__("movq %0,%%fs \n\t"::"a"(next->thread->fs));
	__asm__ __volatile__("movq %0,%%gs \n\t"::"a"(next->thread->gs));


}

void task_init(){
	struct task_struct *tmp=NULL;
	init_mm.pgd=(pml4t_t *)Global_CR3;
	init_mm.start_code=mman_struct.start_code;
	init_mm.end_code=mman_struct.end_code;
	init_mm.start_data=(unsigned long)&_data;
	init_mm.end_data=mman_struct.end_data;
	init_mm.start_rodata=(unsigned long)&_rodata;
	init_mm.end_rodata=(unsigned long)&_erodata;
	init_mm.start_brk=0;
	init_mm.end_brk=mman_struct.end_brk;
	init_mm.start_stack=_stack_start;

	/*
	These code write MSR register to preserve the selector,stack,and address of
	link programe after execute SYSEXIT
	*/
	wrmsr(0x174,KERNEL_CS);
	wrmsr(0x175,current->thread->rsp0);
	wrmsr(0x176,(unsigned long)system_call);

	set_tss64(LABEL_TSS64,init_thread.rsp0,init_tss[0].rsp1,init_tss[0].rsp2,init_tss[0].ist1,\
		init_tss[0].ist2,init_tss[0].ist3,init_tss[0].ist4,init_tss[0].ist5,\
		init_tss[0].ist6,init_tss[0].ist7);

	init_tss[0].rsp0=init_thread.rsp0;
	list_init(&init_task_union.task.list);

	//setting the first thread in init()
	//entry funciton is kernel_thread_func in order to recover the context
	kernel_thread(init,10,CLONE_FS|CLONE_FILES|CLONE_SIGNAL);
	init_task_union.task.state=TASK_RUNNING;
	tmp=container_of(list_next(&task_schedule.task_queue.list),struct task_struct,list);
	switch_to(current,tmp);
}

int kernel_thread(unsigned long (*fn)(unsigned long),unsigned long arg,unsigned long flags){
	struct pt_regs regs;
	memset(&regs,0,sizeof(regs));

	regs.rbx=(unsigned long)fn;
	regs.rdx=(unsigned long)arg;

	regs.ds=KERNEL_DS;
	regs.es=KERNEL_DS;
	regs.cs=KERNEL_CS;
	regs.ss=KERNEL_DS;
	
	regs.rflags=(1<<9);
	regs.rip=(unsigned long)kernel_thread_func;

	return do_fork(&regs,flags,0,0);
}

unsigned long do_fork(struct pt_regs *regs, unsigned long clone_flags, \
	unsigned long stack_start, unsigned long stack_size){
	struct task_struct *tsk=NULL;
	struct thread_struct *thd=NULL;
	struct page *p=NULL;

	p=alloc_pages(ZONE_NORMAL,1,PG_PTable_Maped|PG_Kernel);

	tsk=(struct task_struct*) phy2vir(p->phy_addr);

	memset(tsk,0,sizeof(tsk));
	*tsk=*current;

	list_init(&tsk->list);
	//list_add_to_before(&init_task_union.task.list,&tsk->list);
	tsk->priority=2;
	tsk->pid++;
	tsk->state=TASK_UNINTERRUPTIBLE;

	thd=(struct thread_struct *)(tsk+1);
	memset(thd,0,sizeof(*thd));
	tsk->thread=thd;

	//copy runtime context(registers value) in to stack
	memcpy(regs,(void *)((unsigned long)tsk+STACK_SIZE-sizeof(struct pt_regs)),\
		sizeof(struct pt_regs));

	thd->rsp0=(unsigned long)tsk+STACK_SIZE;
	thd->rip=regs->rip;
	thd->rsp=(unsigned long)tsk+STACK_SIZE-sizeof(struct pt_regs);
	thd->fs=KERNEL_DS;
	thd->gs=KERNEL_DS;

	if(!(tsk->flags&PF_KTHREAD))
		thd->rip=regs->rip=(unsigned long)ret_system_call;

	tsk->state=TASK_RUNNING;
	insert_task_queue(tsk);

	return 1;
}

unsigned long do_exit(unsigned long code){
	printk(RED,BLACK,"exit() task is running\n");
	while(1);
}

