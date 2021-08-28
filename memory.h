#ifndef __MEMORY_H__
#define __MEMORY_H__

#define PAGE_OFFSET ((unsigned long)0xffff800000000000)

#define PAGE_GDT_SHIFT	39
#define PAGE_1G_SHIFT	30
#define PAGE_2M_SHIFT	21
#define PAGE_4K_SHIFT	12

#define PAGE_2M_SIZE	(1UL<<PAGE_2M_SHIFT)
#define PAGE_4K_SIZE	(1UL<<PAGE_4K_SHIFT)

#define PAGE_2M_MASK	(~(PAGE_2M_SIZE-1))
#define PAGE_4K_MASK	(~(PAGE_4K_SIZE-1))

#define PAGE_2M_ALIGN(addr)		((unsigned long)(addr)+PAGE_2M_SIZE-1)&(PAGE_2M_MASK)
#define PAGE_4K_ALIGN(addr)		((unsigned long)(addr)+PAGE_4K_SIZE-1)&(PAGE_4K_MASK)

#define Virt_To_2M_Page(kernel_addr)	((unsigned long)(addr)-PAGE_OFFSET)

#define Phy_to_2M_Page(kernel_addr)		((unsigned long*)(unsigned long)(addr)+PAGE_OFFSET)


struct int15_e820{
	unsigned long address;
	unsigned long length;
	unsigned int type;
}__attribute__((packed));

struct Global_Memory_Descriptor{
	struct int15_e820	e820[32];
	unsigned long e820_length;
};

extern struct Global_Memory_Descriptor memory_management_struct;


void init_mem();
#endif