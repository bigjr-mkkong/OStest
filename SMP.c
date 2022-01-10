#include "SMP.h"
#include "lib.h"
#include "printk.h"

extern unsigned char APU_boot_start[];
extern unsigned char APU_boot_end[];
void SMP_init(){
    unsigned int a,b,c,d;
    for(int i=0;;i++){
        get_cpuid(0xb,i,&a,&b,&c,&d);
        if((c>>8&0xff)==0) break;
        
        if((c>>8&0xff)==1){
            printk(WHITE,BLACK,"Type: SMT ID  ");
        }else if((c>>8&0xff)==2){
            printk(WHITE,BLACK,"Type: Core ID ");
        }
        printk(WHITE,BLACK,"Width: %x number of logical processor: %x\n",a&0x1f,b&0xff);
    }
    printk(WHITE,BLACK,"SMP(): copy bytes: %x\n",(unsigned long)&APU_boot_end-(unsigned long)&APU_boot_start);
    memcpy(APU_boot_start,\
    (unsigned char*)0xffff800000020000,\
    (unsigned long)&APU_boot_end-(unsigned long)&APU_boot_start);
}

void Start_SMP(){
    unsigned long x,y;

    printk(BLACK,WHITE,"APU Started\n");
    
    //enable xAPIC and x2APIC for APU
    x=y=0;
	__asm__ __volatile__(
		"movq $0x1b,%%rcx	\n\t"
		"rdmsr				\n\t"
		"or $0xc00,%%rax	\n\t"
		"wrmsr			\n\t"
		:
		:
		:"memory");
	
	__asm__ __volatile__(
		"movq $0x1b,%%rcx	\n\t"
		"rdmsr				\n\t"
		:"=a"(x),"=d"(y)
		:
		:"memory"
		);

	if(x&0xc00){
		printk(WHITE,BLACK,"APU: xAPIC and x2APIC enabled\n");
	}

    //enable SVR[8] and SVR[12] for APU
    __asm__ __volatile__(
		"movq $0x80f,%%rcx	\n\t"
		"rdmsr				\n\t"
		"or $0x1100,%%rax	\n\t"
		"wrmsr			    \n\t"
        "movq $0x80f,%%rcx  \n\t"
        "rdmsr"
		:"=a"(x),"=d"(y)
		:
		:"memory");

    if(x&0x100){
        printk(WHITE,BLACK,"APU: SVR[8] enabled\n");
    }
    if(x&0x1000){
        printk(WHITE,BLACK,"APU: SVR[12] enabled\n");
    }

    //check x2APIC ID for APU
    __asm__ __volatile__(
		"movq $0x802,%%rcx	\n\t"
		"rdmsr				\n\t"
		:"=a"(x),"=d"(y)
		:
		:"memory"
		);
	printk(WHITE,BLACK,"APU: x2APIC_ID: %x\n",x);
    hlt();
}