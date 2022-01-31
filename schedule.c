#include "schedule.h"
#include "printk.h"
#include "task.h"

struct task_struct *get_next_task(){
	struct task_struct * tsk = NULL;
	
	if(list_is_empty(&task_schedule.task_queue.list)){
		return &init_task_union.task;
	}

	tsk = phy2vir(container_of(list_next(&task_schedule.task_queue.list),struct task_struct,list));

	list_del(&tsk->list);

	task_schedule.running_task_count -= 1;

	return tsk;
}

void insert_task_queue(struct task_struct *tsk){
	struct task_struct *tmp = phy2vir(container_of(list_next(&task_schedule.task_queue.list),struct task_struct,list));

	if(tsk == &init_task_union.task)
		return ;

	if(!list_is_empty(&task_schedule.task_queue.list)){
		while(tmp->vir_runtime < tsk->vir_runtime)
			tmp = phy2vir(container_of(list_next(&tmp->list),struct task_struct,list));
	}

	list_add_to_before(&tmp->list,&tsk->list);
	task_schedule.running_task_count += 1;
}

void schedule(){
	struct task_struct *tsk = NULL;

	current->flags &= ~NEED_SCHEDULE;
	tsk = get_next_task();

	printk(PURPLE,WHITE,"schedule() next task:%x HPET_counter: %x\n",tsk,HPET_counter);

	if(current->vir_runtime >= tsk->vir_runtime){
		if(current->state == TASK_RUNNING)
			insert_task_queue(current);
			
		if(!task_schedule.CPU_exec_task_jiffies){
			switch(tsk->priority){
				case 0:
				case 1:
					task_schedule.CPU_exec_task_jiffies = 4/task_schedule.running_task_count;
					break;
				case 2:
				default:
					task_schedule.CPU_exec_task_jiffies = 4/task_schedule.running_task_count*3;
					break;
			}
		}	
		switch_to(current,tsk);	
	}else{
		insert_task_queue(tsk);
		
		if(!task_schedule.CPU_exec_task_jiffies){
			switch(tsk->priority){
				case 0:
				case 1:
					task_schedule.CPU_exec_task_jiffies = 4/task_schedule.running_task_count;
					break;
				case 2:
				default:
					task_schedule.CPU_exec_task_jiffies = 4/task_schedule.running_task_count*3;
					break;
			}
		}
	}
	
}

void schedule_init(){
	memset(&task_schedule,0,sizeof(struct schedule));

	list_init(&task_schedule.task_queue.list);
	task_schedule.task_queue.vir_runtime = 0x7fffffffffffffff;

	task_schedule.running_task_count = 1;
	task_schedule.CPU_exec_task_jiffies = 4;
}
