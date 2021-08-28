#include "memory.h"
#include "lib.h"
#include "printk.h"

void init_mem(){
	unsigned long tot = 0 ;
	struct int15_e820 *p = NULL;	
	printk(WHITE,BLACK,"Display Physics Memory Distribution\n");
	p=(struct int15_e820*)0xffff800000007e00;

	for(int i = 0;i < 32;i++){
		printk(BLUE,GREEN,"Address:%x Length:%x Type:%x\n",p->address,p->length,p->type);
		if(p->type == 1){
			tot+=p->length;
		}

		memory_management_struct.e820[i].address+=p->address;
		memory_management_struct.e820[i].length+=p->length;
		memory_management_struct.e820[i].type=p->type;
		memory_management_struct.e820_length=i;

		p++;
		if(p->type > 4){
			break;
		}		
	}
	printk(YELLOW,PURPLE,"OS Can Used Total RAM:%x\n",tot);

	tot=0;
	for(int j=0;j<memory_management_struct.e820_length;j++){
		if(memory_management_struct.e820[j].type!=1) continue;
		unsigned long st,ed;
		st=PAGE_2M_ALIGN(memory_management_struct.e820[j].address);
		ed=((memory_management_struct.e820[j].address+\
			memory_management_struct.e820[j].length)>>PAGE_2M_SHIFT)<<PAGE_2M_SHIFT;
		if(st>=ed) continue;
		tot+=(ed-st)>>PAGE_2M_SHIFT;
	}
	printk(BLACK,INDIGO,"OS Can Used Total Page Number:%x\n",tot);
}