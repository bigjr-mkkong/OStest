#include "cpu.h"


void init_cpu(){
	unsigned int cpufacname[4]={0,0,0,0};
	char factoryname[17]={0};

	get_cpuid(0,0,&cpufacname[0],&cpufacname[1],&cpufacname[2],&cpufacname[3]);

	*(unsigned int*) &factoryname[0]=cpufacname[1];
	*(unsigned int*) &factoryname[4]=cpufacname[3];
	*(unsigned int*) &factoryname[8]=cpufacname[2];

	factoryname[12]='\n';

	printk(WHITE,BLUE,"FactoryName: %s",factoryname);

	for(unsigned int i=0x80000002;i<0x80000005;i++){
		get_cpuid(i,0,&cpufacname[0],&cpufacname[1],&cpufacname[2],&cpufacname[3]);

		*(unsigned int*) &factoryname[0]=cpufacname[0];
		*(unsigned int*) &factoryname[4]=cpufacname[1];
		*(unsigned int*) &factoryname[8]=cpufacname[2];
		*(unsigned int*) &factoryname[12]=cpufacname[3];

		factoryname[16]='\0';
		printk(WHITE,BLUE,"%s",factoryname);
	}
	printk(BLACK,BLACK,"\n");

	return;

}