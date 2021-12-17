#ifndef __APIC_H__
#define __APIC_H__

#include "linkage.h"
#include "ptrace.h"
#include "interrupt.h"
/*
IDT 0-255:
0-21: Embedded trap fault
22-31: reserved
32-55: ioapic
	32	8259A
	33	keyboard
	34	HPET timer 0,8254 counter 0
	35	serial port A
	36	serial port B
	37	parallel port
	38	floppy
	39	parallel port
	40	RTC,HPET timer 1
	41	Generic
	42	Generic
	43	HPET timer 2
	44	HPET timer 3
	45	FERR#
	46	SATA primary
	47	SATA secondary
	48	PIRQA
	49	PIRQB
	50	PIRQC
	51	PIRQD
	52	PIRQE
	53	PIRQF
	54	PIRQG
	55	PIRQH		
(PIRQA-PIRQH: PCI Bus Shared Interrupt)
128: system call

150-200: local apic
	150		timer
	151		thermal monitor
	152		performance counter
	153		LINT0
	154		LINT1
	155		Error

200-255:	MP IPI
*/

/*
Format of LVT(APIC_LVT):
0-7 	Interrupt Vector
8-10 	Deliver mode
			000: Fixed
			010: SMI
			100: NMI
			111: ExtINT
			101: INIT
12		status of deliver
			0: Idle
			1: Send Pending
13		polarity( high:0 ; low:1)
14		Remote IRR
15		Trigger Mode
			0: Edge
			1: Level
16		Mask(0: Masked ; 1: Unmask)
17-18	Time Mode
		00: One shot
		01: Periodic
		10: TSC-Deadline
*/
struct APIC_LVT{					//Work Range
	unsigned int vector :8,			//0~7 ALL 
				deliver_mode :3,	//8~10 CMCI LINT0 LINT1 PerformCounter ThermalSensor
				res_1 :1,			//11
				deliver_status :1,	//12 ALL
				polarity :1,		//13 LINT0 LINT1
				irr	:1,				//14 LINT0 LINT1
				trigger	:1,			//15 LINT0 LINT1
				mask :1,			//16 ALL
				timer_mode :2,		//17~18 Timer
				res_2 :13; 			//19~31
}__attribute__((packed));
/*
Format of Interrupt Command Register (INT_CMD_REG)
*This register used for sending interrupts to different processors
visit https://wiki.osdev.org/APIC#Interrupt_Command_Register for more infomation
*/
struct INT_CMD_REG{
	unsigned int vector :8,			//0~7
				deliver_mode :3,	//8~10
				dest_mode :1,		//11
				deliver_status :1,	//12
				res_1 :1,			//13
				level :1,			//14
				trigger :1,			//15
				res_2 :2,			//16~17
				dest_shorthand :2,	//18~19
				res_3 :12;			//20~31
	union {
		struct {
			unsigned int res_4 :24, //32~55
			dest_field :8;			//56~63		
		}apic_destination;
			
		unsigned int x2apic_destination; 	//32~63
	}destination;
		
}__attribute__((packed));
/*
Format of RTE register (IO_APIC_RET_entry)

(*Ignore the attributes same with APIC_LVT)

8-10: Delivery Mode
			000: Fixed
			010: SMI
			100: NMI
			111: ExtINT
			101: INIT
			001: Lowest Priority
11: Destination Mode
			0: Physical Mode
			1: Logic Mode
17-55: reserved

56-63: Destination
		Physical Mode: APIC ID of interrupt receiver
		Logical Mode: Use LDR and DFR (MP)

*/
struct IO_APIC_RET_entry{
	unsigned int vector :8,			//0~7
				deliver_mode :3,	//8~10
				dest_mode :1, 		//11
				deliver_status :1,	//12
				polarity:1, 		//13
				irr :1,				//14
				trigger :1,			//15
				mask :1,			//16
				reserved:15;		//17~31
	union{
		struct {
			unsigned int reserved1 :24,	//32~55
						phy_dest :4,	//56~59
				    	reserved2 :4;	//60~63
			}physical;
		struct{
			unsigned int reserved1 :24,	//32~55
						logical_dest :8;//56~63
			}logical;
		}destination;
}__attribute__((packed));

//delivery mode
#define	APIC_ICR_IOAPIC_Fixed 		 0	//LAPIC	IOAPIC 	ICR
#define	IOAPIC_ICR_Lowest_Priority 	 1	//	IOAPIC 	ICR
#define	APIC_ICR_IOAPIC_SMI		 	 2	//LAPIC	IOAPIC 	ICR

#define	APIC_ICR_IOAPIC_NMI		 	 4	//LAPIC	IOAPIC 	ICR
#define	APIC_ICR_IOAPIC_INIT		 5	//LAPIC	IOAPIC 	ICR
#define	ICR_Start_up			 	 6	//		ICR
#define	IOAPIC_ExtINT			 	 7	//	IOAPIC


/*

*/
//timer mode
#define APIC_LVT_Timer_One_Shot		0
#define APIC_LVT_Timer_Periodic		1
#define APIC_LVT_Timer_TSC_Deadline	2

//mask
#define APIC_ICR_IOAPIC_Masked		1
#define APIC_ICR_IOAPIC_UN_Masked	0

//trigger mode
#define APIC_ICR_IOAPIC_Edge		0
#define APIC_ICR_IOAPIC_Level		1

//delivery status
#define APIC_ICR_IOAPIC_Idle			0
#define APIC_ICR_IOAPIC_Send_Pending	1

//destination shorthand
#define ICR_No_Shorthand			0
#define ICR_Self					1
#define ICR_ALL_INCLUDE_Self		2
#define ICR_ALL_EXCLUDE_Self		3

//destination mode
#define ICR_IOAPIC_DELV_PHYSICAL	0
#define ICR_IOAPIC_DELV_LOGIC		1

//level
#define ICR_LEVEL_DE_ASSERT			0
#define ICR_LEVLE_ASSERT			1

//remote irr
#define APIC_IOAPIC_IRR_RESET		0
#define APIC_IOAPIC_IRR_ACCEPT		1

//pin polarity
#define APIC_IOAPIC_POLARITY_HIGH	0
#define APIC_IOAPIC_POLARITY_LOW	1

/*
ctrl reg for io apic was mapped in FECxy000h(xy means alterable, default: 00)
IOREGSEL: FECxy000
IOWIN: FECxy010
EOI: FECxy040
*/
struct IOAPIC_map{//an intermediate structure in order to access IO APIC
	unsigned int phy_addr;//physical address of apic ctrl reg
	unsigned char *vir_index_addr;//virture address for IOREGSEL
	unsigned int *vir_data_addr;//virture address for IOWIN
	unsigned int *vir_EOI_addr;//virture address for EOI
}ioapic_map;

void do_IRQ(struct pt_regs *regs,unsigned long nr);
void local_APIC_init();
void APIC_IOAPIC_init();
void IOAPIC_init();
void IOAPIC_pagetable_remap();

unsigned long ioapic_rte_read(unsigned char index);
void ioapic_rte_write(unsigned char index,unsigned long value);

void IOAPIC_enable(unsigned long irq);
void IOAPIC_disable(unsigned long irq);
unsigned long IOAPIC_install(unsigned long irq,void * arg);
void IOAPIC_uninstall(unsigned long irq);
void IOAPIC_level_ack(unsigned long irq);
void IOAPIC_edge_ack(unsigned long irq);

#endif