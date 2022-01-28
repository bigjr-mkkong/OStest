#ifndef __GATE_H__
#define __GATE_H__

typedef unsigned long		u64;
typedef unsigned int 		u32;
typedef unsigned short		u16;
typedef unsigned char		u8;
typedef	void	(*int_handler) ();

struct gate_struct{
	u16 offset1;
	u16 selector;
	u16 attri;
	u16 offset2;
	u32 offset3;
	u32 preserved;
};

struct desc_struct {
	unsigned char x[8];
};

extern struct gate_struct LABEL_IDT[];
extern unsigned int LABEL_TSS64[26];
extern struct desc_struct LABEL_GDT64[];


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

void set_tss64(u32 *table,u64 rsp0,u64 rsp1,u64 rsp2,u64 ist1,u64 ist2,u64 ist3,u64 ist4,u64 ist5,
	u64 ist6,u64 ist7){
	*(u64*)(table+1)=rsp0;
	*(u64*)(table+3)=rsp1;
	*(u64*)(table+5)=rsp2;

	*(u64*)(table+9)=ist1;
	*(u64*)(table+11)=ist2;
	*(u64*)(table+13)=ist3;
	*(u64*)(table+15)=ist4;
	*(u64*)(table+17)=ist5;
	*(u64*)(table+19)=ist6;
	*(u64*)(table+21)=ist7;	
}

void set_tss_descriptor(u32 n,void *addr){
	u64 limit=103;

	*(u64 *)(LABEL_GDT64+n)=(limit & 0xffff)|\
		(((u64)addr & 0xffff)<<16)|\
		(((u64)addr>>16&0xff)<<32)|\
		((u64)0x89<<40)|\
		((limit>>16&0xf)<<48)|\
		(((u64)addr>>24&0xff)<<56);

	*(u64 *)(LABEL_GDT64+n+1)=((u64)addr>>32&0xffffffff)|0;
}

#endif