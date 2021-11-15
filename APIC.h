#ifndef __APIC_H__
#define __APIC_H__

#include "linkage.h"
#include "ptrace.h"
#include "interrupt.h"

void do_IRQ(struct pt_regs *regs,unsigned long nr);

void local_APIC_init();
void APIC_IOAPIC_init();

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


#endif