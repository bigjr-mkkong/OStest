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
    int i = 0;
	struct Disk_Identify_Info a;
	unsigned short *p = NULL;
	port_insw(PORT_DISK1_DATA,&a,256);
	
	printk(ORANGE,WHITE,"\nSerial Number:");
	for(i = 0;i<10;i++)
		printk(ORANGE,WHITE,"%c%c",(a.Serial_Number[i] >> 8) & 0xff,a.Serial_Number[i] & 0xff);
	
	printk(ORANGE,WHITE,"\nFirmware revision:");
	for(i = 0;i<4;i++)
		printk(ORANGE,WHITE,"%c%c",(a.Firmware_Version[i] >> 8 ) & 0xff,a.Firmware_Version[i] & 0xff);
	
	printk(ORANGE,WHITE,"\nModel number:");
	for(i = 0;i<20;i++)
		printk(ORANGE,WHITE,"%c%c",(a.Model_Number[i] >> 8) & 0xff,a.Model_Number[i] & 0xff);
	printk(ORANGE,WHITE,"\n");

	p = (unsigned short *)&a;
	for(i = 0;i<256;i++)
		printk(ORANGE,WHITE,"%x ",*(p+i));
}

void disk_init(){
    struct IO_APIC_RET_entry entry;
    
    entry.vector=0x2f;
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

	register_irq(0x2f, &entry, &disk_handler, 0, &disk_int_controller, "disk1");

	io_out8(PORT_DISK1_ALT_STA_CTL,0);	

	io_out8(PORT_DISK1_ERR_FEATURE,0);
	io_out8(PORT_DISK1_SECTOR_CNT,0);
	io_out8(PORT_DISK1_SECTOR_LOW,0);
	io_out8(PORT_DISK1_SECTOR_MID,0);
	io_out8(PORT_DISK1_SECTOR_HIGH,0);
	io_out8(PORT_DISK1_DEVICE,0xe0);
	io_out8(PORT_DISK1_STATUS_CMD,0xec);
}

void disk_exit(){
    unregister_irq(0x2f);
}