#ifndef __GATE_H__
#define __GATE_H__

typedef unsigned long long		u64;
typedef unsigned int 			u32;
typedef unsigned short			u16;
typedef unsigned char			u8;
typedef	void	(*int_handler) ();

struct gate_struct{
	u16 offset1;
	u16 selector;
	u16 attri;
	u16 offset2;
	u32 offset3;
	u32 preserved;
};

extern struct gate_struct LABEL_IDT[];
extern unsigned int LABEL_TSS64[26];


void set_idt_desc(u8 vector, u8 ist ,u8 attri, int_handler handler){
	struct gate_struct *p=&LABEL_IDT[vector];
	u64 func=(u64)handler;
	p->offset1=func&(0xffff);
	p->selector=0x08;
	p->attri=(attri<<8)|(ist);
	p->offset2=(u16)((func&(0x00000000ffff0000))>>16);
	p->offset3=func>>32;
}

#define load_TR(n)\
do{\
	__asm__ __volatile__("ltr %%ax"\
	:\
	:"a"(n << 3)\
	:"memory");\
}while(0)

void set_intr_gate(u8 vector,u8 ist, int_handler handler){
	set_idt_desc(vector,ist,0x8e,handler);
}

void set_trap_gate(u8 vector,u8 ist, int_handler handler){
	set_idt_desc(vector,ist,0x8f,handler);
}

void set_system_gate(u8 vector,u8 ist, int_handler handler){
	set_idt_desc(vector,ist,0xEF,handler);	//P,DPL=3,TYPE=F
}


void set_system_intr_gate(u8 vector,u8 ist, int_handler handler){
	set_idt_desc(vector,ist,0xEE,handler);	//P,DPL=3,TYPE=E
}

void set_tss64(u32 rsp0,u32 rsp1,u32 rsp2,u32 ist1,u32 ist2,u32 ist3,u32 ist4,u32 ist5,
	u32 ist6,u32 ist7){
	*(u32*)(LABEL_TSS64+1)=rsp0;
	*(u32*)(LABEL_TSS64+3)=rsp1;
	*(u32*)(LABEL_TSS64+5)=rsp2;

	*(u32*)(LABEL_TSS64+9)=ist1;
	*(u32*)(LABEL_TSS64+11)=ist2;
	*(u32*)(LABEL_TSS64+13)=ist3;
	*(u32*)(LABEL_TSS64+15)=ist4;
	*(u32*)(LABEL_TSS64+17)=ist5;
	*(u32*)(LABEL_TSS64+19)=ist6;
	*(u32*)(LABEL_TSS64+21)=ist7;	
}

#endif