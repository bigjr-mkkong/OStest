#ifndef __MEMORY_H__
#define __MEMORY_H__

#include "lib.h"

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

#define vir2phy(addr)	((unsigned long)(addr) - PAGE_OFFSET)
#define phy2vir(addr)	((unsigned long *)((unsigned long)(addr) + PAGE_OFFSET))

#define vir2_2M_page(kernel_addr)	((unsigned long)(kernel_addr)-PAGE_OFFSET)

#define phy2_2M_page(kernel_addr) 	((unsigned long*)(unsigned long)(kernel_addr)+PAGE_OFFSET)


#define ZONE_DMA		1

#define ZONE_NORMAL		2

#define ZONE_UNMAPED	3


////page table attribute

//	bit 63	Execution Disable:
#define PAGE_XD		(unsigned long)0x1000000000000000

//	bit 12	Page Attribute Table
#define	PAGE_PAT	(unsigned long)0x1000

//	bit 8	Global Page:1,global;0,part
#define	PAGE_Global	(unsigned long)0x0100

//	bit 7	Page Size:1,big page;0,small page;
#define	PAGE_PS		(unsigned long)0x0080

//	bit 6	Dirty:1,dirty;0,clean;
#define	PAGE_Dirty	(unsigned long)0x0040

//	bit 5	Accessed:1,visited;0,unvisited;
#define	PAGE_Accessed	(unsigned long)0x0020

//	bit 4	Page Level Cache Disable
#define PAGE_PCD	(unsigned long)0x0010

//	bit 3	Page Level Write Through
#define PAGE_PWT	(unsigned long)0x0008

//	bit 2	User Supervisor:1,user and supervisor;0,supervisor;
#define	PAGE_U_S	(unsigned long)0x0004

//	bit 1	Read Write:1,read and write;0,read;
#define	PAGE_R_W	(unsigned long)0x0002

//	bit 0	Present:1,present;0,no present;
#define	PAGE_Present	(unsigned long)0x0001

//1,0
#define PAGE_KERNEL_GDT		(PAGE_R_W | PAGE_Present)

//1,0	
#define PAGE_KERNEL_Dir		(PAGE_R_W | PAGE_Present)

//7,1,0
#define	PAGE_KERNEL_Page	(PAGE_PS  | PAGE_R_W | PAGE_Present)

//1,0
#define PAGE_USER_GDT		(PAGE_U_S | PAGE_R_W | PAGE_Present)

//2,1,0
#define PAGE_USER_Dir		(PAGE_U_S | PAGE_R_W | PAGE_Present)

//1,0
#define PAGE_USER_GDT		(PAGE_U_S | PAGE_R_W | PAGE_Present)

//7,2,1,0
#define	PAGE_USER_Page		(PAGE_PS  | PAGE_U_S | PAGE_R_W | PAGE_Present)




typedef struct {unsigned long pml4t;} pml4t_t;
#define	mk_mpl4t(addr,attr)	((unsigned long)(addr) | (unsigned long)(attr))
#define set_mpl4t(mpl4tptr,mpl4tval)	(*(mpl4tptr) = (mpl4tval))


typedef struct {unsigned long pdpt;} pdpt_t;
#define mk_pdpt(addr,attr)	((unsigned long)(addr) | (unsigned long)(attr))
#define set_pdpt(pdptptr,pdptval)	(*(pdptptr) = (pdptval))


typedef struct {unsigned long pdt;} pdt_t;
#define mk_pdt(addr,attr)	((unsigned long)(addr) | (unsigned long)(attr))
#define set_pdt(pdtptr,pdtval)		(*(pdtptr) = (pdtval))


typedef struct {unsigned long pt;} pt_t;
#define mk_pt(addr,attr)	((unsigned long)(addr) | (unsigned long)(attr))
#define set_pt(ptptr,ptval)		(*(ptptr) = (ptval))


////alloc_pages zone_select

//
#define ZONE_DMA	(1 << 0)

//
#define ZONE_NORMAL	(1 << 1)

//
#define ZONE_UNMAPED	(1 << 2)

////struct page attribute (alloc_pages flags)

//mapped=1 or unmapped=0
#define PG_PTable_Maped	(1 << 0)

//init-code=1 or normal-code/data=0
#define PG_Kernel_Init	(1 << 1)

//device=1 or memory=0
#define PG_Device	(1 << 6)

//kernel=1 or user=0
#define PG_Kernel	(1 << 7)

//shared=1 or single-use=0
#define PG_Shared	(1 << 4)

struct int15_e820{
	unsigned long address;
	unsigned long length;
	unsigned int type;
}__attribute__((packed));//no auto alignment

struct page{
	struct zone* zone_struct;
	unsigned long phy_addr;
	unsigned long attribute;
	unsigned long ref_count; //total reference times for single page

	unsigned long age;  //time to create the single page
};

struct zone{
	struct page* pages_group;//point to start of page group in zone
	unsigned long pages_length;//number of pages

	unsigned long zone_start_addr;
	unsigned long zone_end_addr;
	unsigned long zone_length;
	unsigned long attribute;

	struct Global_Memory_Descriptor* GMD_struct;

	unsigned long page_using_count;//number of used pages
	unsigned long page_free_count;//number of free page

	unsigned long total_page_link;//number of total page linkage(!=page_using_count)
};

struct Global_Memory_Descriptor{
	struct int15_e820 e820[32];
	unsigned long e820_length;//e820 struct and length

	unsigned long* bits_map;  //map for all page in phy addr
	unsigned long bits_size;  //number of page in phy addr
	unsigned long bits_length;//length of bits_map

	struct page* pages_struct;
	unsigned long pages_size;  //total number of struct page
	unsigned long pages_length;//length of struct page array

	struct zone* zones_struct;
	unsigned long zones_length;//length of struct zone array
	unsigned long zones_size;//total number of struct zone

	unsigned long start_code,end_code,end_data,end_brk;
	//start/end for code segment and data segment for kernel

	unsigned long end_of_struct;//end addr for mm page management struct 
};

extern struct Global_Memory_Descriptor mman_struct;

int ZONE_DMA_INDEX=0;//mark start of DMA zone
int ZONE_NORMAL_INDEX=0;//mark start of NORMAL zone
int ZONE_UNMAPPED_INDEX=0;//mark start of UNMAPPED ZONE
unsigned long* Global_CR3=NULL;

/*
struct Slab_cache is a cache to store the slab
*/
struct Slab_cache{
	unsigned long size;//size of each slab in certain Slab_cache
	unsigned long total_using;
	unsigned long total_free;
	struct Slab *cache_pool;//first slab struct
	struct Slab *cache_dma_pool;//first slab struct in DMA memory area

	void *(* constructor)(void * Vaddress, unsigned long arg);
	void *(* destructor)(void * Vaddress, unsigned long arg);
};

struct Slab{
	struct List list;//list to connect each 
	struct page *page;//assigned page of each slab
	unsigned long using_count;
	unsigned long free_count;
	void *Vaddress;

	unsigned long color_length;
	/*
	length is the space taken by color map, should align to 8 so always bigger than
	color_count
	*/
	unsigned long color_count;//number of bits in color map

	unsigned long *color_map;
	//a map to represent the avaliability of all pages in one slab
};


/*
Preset Slab_cache struct in order to support the kmalloc()
*/
struct Slab_cache kmalloc_cache_size[16]={
{32 	,0,0,NULL,NULL,NULL,NULL},
{64 	,0,0,NULL,NULL,NULL,NULL},
{128 	,0,0,NULL,NULL,NULL,NULL},
{256 	,0,0,NULL,NULL,NULL,NULL},
{512  	,0,0,NULL,NULL,NULL,NULL},
{1024  	,0,0,NULL,NULL,NULL,NULL},//1KB
{2048  	,0,0,NULL,NULL,NULL,NULL},
{4096  	,0,0,NULL,NULL,NULL,NULL},//4KB
{8192  	,0,0,NULL,NULL,NULL,NULL},
{16384	,0,0,NULL,NULL,NULL,NULL},
{32768	,0,0,NULL,NULL,NULL,NULL},
{65536	,0,0,NULL,NULL,NULL,NULL},//64KB
{131072	,0,0,NULL,NULL,NULL,NULL},//128KB
{262144	,0,0,NULL,NULL,NULL,NULL},
{524288	,0,0,NULL,NULL,NULL,NULL},
{1048576,0,0,NULL,NULL,NULL,NULL},//1MB
};

#define SIZEOF_LONG_ALIGN(size) ((size+sizeof(long)-1)&~(sizeof(long)-1))

void init_mem();

void flush_tlb();

struct page* alloc_pages(int zone_select,int number,unsigned long page_flags);

void free_pages(struct page *page,int number);

void *kmalloc(unsigned long size, unsigned long gpf_flags);

struct Slab* kmalloc_create(unsigned long size);

unsigned long kfree(void *adress);

struct Slab_cache *slab_create(unsigned long size,\
	void *(* constructor)(void *Vaddress, unsigned long arg),\
	void *(* destructor)(void *Vaddress, unsigned long arg),unsigned long arg);

unsigned long slab_destroy(struct Slab_cache *slab_cache);

void *slab_malloc(struct Slab_cache* slab_cache, unsigned long arg);

unsigned long slab_free(struct Slab_cache *slab_cache, void *address, unsigned long arg);

unsigned long slab_init();
#endif