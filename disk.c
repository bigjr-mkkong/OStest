#include "disk.h"
#include "interrupt.h"
#include "APIC.h"
#include "memory.h"
#include "printk.h"
#include "lib.h"

hw_int_controller disk_int_controller={
	.enable=IOAPIC_enable,
	.disable=IOAPIC_disable,
	.install=IOAPIC_install,
	.uninstall=IOAPIC_uninstall,
	.ack=IOAPIC_edge_ack,
};

void disk_handler(unsigned long nr, unsigned long parameter, struct pt_regs *regs){
    printk(BLACK,WHITE,"Write One Sector Finished:%x\n",io_in8(PORT_DISK0_STATUS_CMD));
}

void disk_init(){
	unsigned char a[512];
    struct IO_APIC_RET_entry entry;
    
    entry.vector=0x2e;
	entry.deliver_mode=APIC_ICR_IOAPIC_Fixed ;
	entry.dest_mode=ICR_IOAPIC_DELV_PHYSICAL;
	entry.deliver_status=APIC_ICR_IOAPIC_Idle;
	entry.polarity=APIC_IOAPIC_POLARITY_HIGH;
	entry.irr=APIC_IOAPIC_IRR_RESET;
	entry.trigger=APIC_ICR_IOAPIC_Edge;
	entry.mask=APIC_ICR_IOAPIC_Masked;
	entry.reserved=0;

	entry.destination.physical.reserved1=0;
	entry.destination.physical.phy_dest=0;
	entry.destination.physical.reserved2=0;

	register_irq(0x2e, &entry, &disk_handler, 0, &disk_int_controller, "disk0");

	io_out8(PORT_DISK0_ALT_STA_CTL,0);
	
	while(io_in8(PORT_DISK0_STATUS_CMD)&DISK_STATUS_BUSY);
	printk(BLACK,WHITE,"Write One Sector Starting:%x\n",io_in8(PORT_DISK0_STATUS_CMD));

	io_out8(PORT_DISK0_DEVICE,0x40);

	io_out8(PORT_DISK0_ERR_FEATURE,0);
	io_out8(PORT_DISK0_SECTOR_CNT,0);
	io_out8(PORT_DISK0_SECTOR_LOW,0x0);
	io_out8(PORT_DISK0_SECTOR_MID,0);
	io_out8(PORT_DISK0_SECTOR_HIGH,0);

	io_out8(PORT_DISK0_ERR_FEATURE,0);
	io_out8(PORT_DISK0_SECTOR_CNT,1);
	io_out8(PORT_DISK0_SECTOR_LOW,0x3);
	io_out8(PORT_DISK0_SECTOR_MID,0x0);
	io_out8(PORT_DISK0_SECTOR_HIGH,0x0);

	while(!(io_in8(PORT_DISK0_STATUS_CMD)&DISK_STATUS_READY));
	printk(BLACK,WHITE,"Send CMD:%x\n",io_in8(PORT_DISK0_STATUS_CMD));

	io_out8(PORT_DISK0_STATUS_CMD,0x34);	////write
	
	while(!(io_in8(PORT_DISK0_STATUS_CMD)&DISK_STATUS_REQ));
	memset(&a,0xA5,512);
	port_outsw(PORT_DISK0_DATA,&a,256);
}

void disk_exit(){
    unregister_irq(0x2f);
}