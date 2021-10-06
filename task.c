#include "task.h"
#include "printk.h"
#include "gate.h"
#include "memory.h"


extern void ret_system_call(void);
void user_level_function(){
	while(1);
	printk(RED,BLACK,"user task is running\n");
	while(1);
}

unsigned long do_execve(struct pt_regs *regs){
	regs->rdx=0x800000;	//rip
	regs->rcx=0xa00000;	//rsp
	regs->rax=0;	
	regs->ds=0;
	regs->es=0;

	printk(RED,BLACK,"do_execve task is running\n");

	memcpy(user_level_function,(void *)0x800000,2048);

	return 0;
}
extern void kernel_thread_func(void);
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

	__asm__	__volatile__(	
				"movq %1,%%rsp	\n\t"
				"pushq %2 		\n\t"
				"jmp do_execve	\n\t"
				::"D"(regs),"m"(current->thread->rsp),"m"(current->thread->rip):"memory");
	return 1;
}

void __switch_to(struct task_struct *prev,struct task_struct *next){
	init_tss[0].rsp0=next->thread->rsp0;

	set_tss64(init_tss[0].rsp0,init_tss[0].rsp1,init_tss[0].rsp2,init_tss[0].ist1,\
		init_tss[0].ist2,init_tss[0].ist3,init_tss[0].ist4,init_tss[0].ist5,\
		init_tss[0].ist6,init_tss[0].ist7);

	__asm__ __volatile__("movq %%fs,%0 \n\t":"=a"(prev->thread->fs));
	__asm__ __volatile__("movq %%gs,%0 \n\t":"=a"(prev->thread->gs));

	__asm__ __volatile__("movq %0,%%fs \n\t"::"a"(next->thread->fs));
	__asm__ __volatile__("movq %0,%%gs \n\t"::"a"(next->thread->gs));
	
}

void task_init(){
	struct task_struct *p=NULL;
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

	wrmsr(0x174,KERNEL_CS);

	set_tss64(init_tss[0].rsp0,init_tss[0].rsp1,init_tss[0].rsp2,init_tss[0].ist1,\
		init_tss[0].ist2,init_tss[0].ist3,init_tss[0].ist4,init_tss[0].ist5,\
		init_tss[0].ist6,init_tss[0].ist7);

	init_tss[0].rsp0=init_thread.rsp0;

	list_init(&init_task_union.task.list);
	kernel_thread(init,10,CLONE_FS|CLONE_FILES|CLONE_SIGNAL);
	init_task_union.task.state=TASK_RUNNING;
	p=container_of(list_next(&current->list),struct task_struct,list);
	switch_to(current,p);
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

	p=alloc_pages(ZONE_NORMAL,1,PG_PTable_Maped|PG_Active|PG_Kernel);

	tsk=(struct task_struct*) phy2vir(p->phy_addr);

	memset(tsk,0,sizeof(tsk));
	*tsk=*current;

	list_init(&tsk->list);
	list_add_to_before(&init_task_union.task.list,&tsk->list);
	tsk->pid++;
	tsk->state=TASK_UNINTERRUPTIBLE;

	thd=(struct thread_struct *)(tsk+1);
	tsk->thread=thd;

	memcpy(regs,(void *)((unsigned long)tsk+STACK_SIZE-sizeof(struct pt_regs)),\
		sizeof(struct pt_regs));

	thd->rsp0=(unsigned long)tsk+STACK_SIZE;
	thd->rip=regs->rip;
	thd->rsp=(unsigned long)tsk+STACK_SIZE-sizeof(struct pt_regs);

	if(!(tsk->flags&PF_KTHREAD))
		thd->rip=regs->rip=(unsigned long)ret_system_call;

	tsk->state=TASK_RUNNING;

	return 0;
}

unsigned long do_exit(unsigned long code){
	printk(RED,BLACK,"exit() task is running\n");
	while(1);
}

