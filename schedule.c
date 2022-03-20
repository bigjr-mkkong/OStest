#include "schedule.h"
#include "printk.h"
#include "task.h"
#include "SMP.h"


struct schedule task_schedule[NR_CPUS]; 
//0x114cdc

struct task_struct *get_next_task(){
	struct task_struct *tsk=NULL;

	if(list_is_empty(&task_schedule[SMP_cpu_id()].task_queue.list)){
		return init_task[SMP_cpu_id()];
	}

	tsk=phy2vir(container_of(list_next(&task_schedule[SMP_cpu_id()].task_queue.list),struct task_struct,list));
	list_del(&tsk->list);

	task_schedule[SMP_cpu_id()].running_task_count-=1;

	return tsk;
}

void insert_task_queue(struct task_struct *tsk){
	struct task_struct *tmp=NULL;
	
	if(tsk==init_task[SMP_cpu_id()]){
		return;
	}

	tmp=phy2vir(container_of(list_next(&task_schedule[SMP_cpu_id()].task_queue.list),struct task_struct,list));

	if(!list_is_empty(&task_schedule[SMP_cpu_id()].task_queue.list)){
		while(tmp->vir_runtime < tsk->vir_runtime)
			tmp = phy2vir(container_of(list_next(&tmp->list),struct task_struct,list));
	}

	list_add_to_before(&tmp->list,&tsk->list);
	task_schedule[SMP_cpu_id()].running_task_count+=1;
}

void schedule(){
	struct task_struct *tsk = NULL;
	long cpu_id=SMP_cpu_id();

	cli();

	current->flags &= ~NEED_SCHEDULE;//clear NEED_SCHEDULE bit
	
	tsk=get_next_task();

	printk(BLACK,WHITE,"scheduler(CPU: %x): [current: %x tsk: %x]\n",cpu_id,current,tsk);

	if(current->vir_runtime >= tsk->vir_runtime){
		if(current->state == TASK_RUNNING)
			insert_task_queue(current);
			
		if(!task_schedule[cpu_id].CPU_exec_task_jiffies){
			switch(tsk->priority){
				case 0:
				case 1:
					task_schedule[cpu_id].CPU_exec_task_jiffies=4/task_schedule[cpu_id].running_task_count;
					break;
				case 2:
				default:
					task_schedule[cpu_id].CPU_exec_task_jiffies=4/task_schedule[cpu_id].running_task_count*3;
					break;
			}
		}
		switch_to(current,tsk);	//0xffff800000114cdc
	}else{
		insert_task_queue(tsk);
		
		if(!task_schedule[cpu_id].CPU_exec_task_jiffies){
			switch(tsk->priority){
				case 0:
				case 1:
					task_schedule[cpu_id].CPU_exec_task_jiffies=4/task_schedule[cpu_id].running_task_count;
					break;
				case 2:
				default:
					task_schedule[cpu_id].CPU_exec_task_jiffies=4/task_schedule[cpu_id].running_task_count*3;
					break;
			}
		}
	}

	sti();
	
}

void schedule_init(){
	memset(&task_schedule,0,sizeof(struct schedule)*NR_CPUS);

	for(int i=0;i<NR_CPUS;i++){
		list_init(&task_schedule[i].task_queue.list);
		task_schedule[i].task_queue.vir_runtime=0x7fffffffffffffff;

		task_schedule[i].running_task_count=1;
		task_schedule[i].CPU_exec_task_jiffies=4;
	}
}
