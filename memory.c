#include "memory.h"
#include "lib.h"
#include "printk.h"

unsigned long page_init(struct page* p, unsigned long flags){
	if(!p->attribute){
		*(mman_struct.bits_map+((p->phy_addr>>PAGE_2M_SHIFT)>>6))|=\
		1UL<<(p->phy_addr>>PAGE_2M_SHIFT)%64; //regist page p in bitmap
		p->attribute=flags;
		p->ref_count++;//refresh some count value for paging
		p->zone_struct->page_using_count++;
		p->zone_struct->page_free_count--;
		p->zone_struct->total_page_link++;
	}else if((p->attribute&PG_Referenced)||(p->attribute&PG_K_Share_To_U)||\
			 (flags&PG_Referenced)||(flags&PG_K_Share_To_U)){
		p->attribute|flags;
		p->ref_count++;
		p->zone_struct->total_page_link++;
	}else{
		*(mman_struct.bits_map+((p->phy_addr>>PAGE_2M_SHIFT)>>6))|=\
		1UL<<(p->phy_addr>>PAGE_2M_SHIFT)%64;
		p->attribute|flags;
	}
	return 0;
}


void init_mem(){
	unsigned long tot=0 ;
	struct int15_e820 *p=NULL;	
	printk(WHITE,BLACK,"Display Physics Memory Distribution\n");
	p=(struct int15_e820*)0xffff800000007e00;

	for(int i=0;i<32;i++){
		printk(BLUE,GREEN,"Address:%x Length:%x Type:%x\n",p->address,p->length,p->type);
		if(p->type==1){
			tot+=p->length;
		}

		mman_struct.e820[i].address+=p->address;//initialize the basic mm info in mman_struct
		mman_struct.e820[i].length+=p->length;
		mman_struct.e820[i].type=p->type;
		mman_struct.e820_length=i;

		p++;
		if(p->type > 4||p->length==0||p->type<1){//dirty data
			break;
		}		
	}
	printk(YELLOW,PURPLE,"Useable Total RAM:%x\n",tot);

	tot=0;
	for(int j=0;j<mman_struct.e820_length;j++){
		if(mman_struct.e820[j].type!=1) continue;//if not RAM part memory
		unsigned long st,ed;
		st=PAGE_2M_ALIGN(mman_struct.e820[j].address);
		ed=((mman_struct.e820[j].address+\
			mman_struct.e820[j].length)>>PAGE_2M_SHIFT)<<PAGE_2M_SHIFT;
		if(st>=ed) continue;
		tot+=(ed-st)>>PAGE_2M_SHIFT;
	}
	printk(BLACK,INDIGO,"Useable Total Page Number:%d\n",tot);
/*-------------------------init bits_map in mm--------------------------------------------*/
	tot=mman_struct.e820[mman_struct.e820_length].address+\
		mman_struct.e820[mman_struct.e820_length].length;

	mman_struct.bits_map=(unsigned long*)((mman_struct.end_brk+\
		PAGE_4K_SIZE-1)&PAGE_4K_MASK);/*add 4K space between end_brk and start of bitmap
		in order to prevent the miss operation*/

	mman_struct.bits_size=tot>>PAGE_2M_SHIFT;// tot/2M=number of pages

	mman_struct.bits_length=(((unsigned long)(tot>>PAGE_2M_SHIFT)+\
		sizeof(long)*8-1)/8)&(~(sizeof(long)-1));

	memset(mman_struct.bits_map,0xff,mman_struct.bits_length);//set all to 1 means avaliable

/*-------------------------init pages in mm-----------------------------------------------*/
	mman_struct.pages_struct=(struct page*)\
	(((unsigned long)(mman_struct.bits_map+mman_struct.bits_length+\
	PAGE_4K_SIZE-1))&PAGE_4K_MASK);/*add 4K spabe between bits_map and start of page
		in order to prevent the miss operation*/

	mman_struct.pages_size=tot>>PAGE_2M_SHIFT;// tot/2M=number of pages

	mman_struct.pages_length=((tot>>PAGE_2M_SHIFT)*sizeof(struct page)+\
		sizeof(long)-1)&(~(sizeof(long)-1));

	memset(mman_struct.pages_struct,0x00,mman_struct.pages_length);//seta all to 0 means not ready
/*------------------------init zones in mm------------------------------------------------*/
	mman_struct.zones_struct=(struct zone*)\
	(((unsigned long)mman_struct.pages_struct+mman_struct.pages_length+\
	PAGE_4K_SIZE-1)&PAGE_4K_MASK);/*add 4K space between page and start of zone struct
		in order to prevent the miss operation*/

	mman_struct.zones_size=0;//havem't initialize zones number

	mman_struct.zones_length=(5*sizeof(struct zone)+sizeof(long)-1)&(~(sizeof(long)-1));

	memset(mman_struct.zones_struct,0x00,mman_struct.zones_length);





	for(int i=0;i<mman_struct.e820_length;i++){//go through every mm segment in e820
		unsigned long start,end;
		struct page *p;
		struct zone *z;
		unsigned long* b;

		if(mman_struct.e820[i].type!=1) continue;//if not RAM space, continue

		start=PAGE_2M_ALIGN(mman_struct.e820[i].address);
		end=((mman_struct.e820[i].address+\
		mman_struct.e820[i].length)>>PAGE_2M_SHIFT)<<PAGE_2M_SHIFT;

		if(end<=start) continue;

		z=mman_struct.zones_struct+mman_struct.zones_size;//locate to certain zone_struct
		mman_struct.zones_size++;

		z->zone_start_addr=start;
		z->zone_end_addr=end;
		z->zone_length=end-start;

		z->page_using_count=0;
		z->page_free_count=(end-start)>>PAGE_2M_SHIFT;
		z->total_page_link=0;

		z->attribute=0;
		z->GMD_struct=&mman_struct;

		z->pages_length=(end-start)>>PAGE_2M_SHIFT;
		//number of pages which in zone z=length of zone/2M
		z->pages_group=(struct page*)(mman_struct.pages_struct+(start>>PAGE_2M_SHIFT));
		//first number of page in zone z=start of page struct + (start/2M) 
		
		p=z->pages_group;//point p to the pages group in zone z
		for(int j=0;j<z->pages_length;j++,p++){
			p->zone_struct=z;
			p->phy_addr=start+PAGE_2M_SIZE*j;//each page is 2M size
			p->attribute=0;

			p->ref_count=0;
			p->age=0;

			*(mman_struct.bits_map+((p->phy_addr>>PAGE_2M_SHIFT)>>6))^=\
			1UL<<(p->phy_addr>>PAGE_2M_SHIFT)%64;//set bits_map with correspond pages
		}

	}
	/*init first pages in to 0*/
	mman_struct.pages_struct->zone_struct=mman_struct.zones_struct;
	mman_struct.pages_struct->phy_addr=0UL;
	mman_struct.pages_struct->attribute=0;
	mman_struct.pages_struct->ref_count=0;
	mman_struct.pages_struct->age=0;

	
	mman_struct.zones_length=\
	(mman_struct.zones_size*sizeof(struct zone)+sizeof(long)-1)&\
	(~(sizeof(long)-1));


	ZONE_DMA_INDEX=0;
	ZONE_NORMAL_INDEX=0;

/*=======find out the last zone which included in to 1GB mem=================*/
	int end_zone_num;
	for(end_zone_num=0;end_zone_num<mman_struct.zones_size;end_zone_num++){
		struct zone* z=mman_struct.zones_struct+end_zone_num;
		printk(GREEN,ORANGE,"Zone  %d\nzone_start_addr:%x zone_end_addr:%x zone_length:%x\n\
pages_group:%x pages_length:%x\n",\
			end_zone_num,z->zone_start_addr,z->zone_end_addr,z->zone_length,\
			z->pages_group,z->pages_length);
		if(z->zone_start_addr==0x100000000){
			ZONE_UNMAPPED_INDEX=end_zone_num;
		}
	}

	mman_struct.end_of_struct=(unsigned long)\
		((unsigned long)mman_struct.zones_struct+\
		mman_struct.zones_length+sizeof(long)*32)&(~(sizeof(long)-1));
		//set up end of mm struct address with (end of zone struct+1M(4*8*32))

	end_zone_num=vir2phy(mman_struct.end_of_struct)>>PAGE_2M_SHIFT;

	for(int i=0;i<end_zone_num;i++){
		page_init(mman_struct.pages_struct+i,\
			PG_PTable_Maped|PG_Kernel_Init|PG_Active|PG_Kernel);
	}



	Global_CR3=Get_gdt();

	printk(INDIGO,BLACK,"Global_CR3:%x\n",Global_CR3);
	printk(INDIGO,BLACK,"*Global_CR3:%x\n",*phy2vir(Global_CR3)&(~0xff));
	printk(PURPLE,BLACK,"**Global_CR3:%x\n",*phy2vir(*phy2vir(Global_CR3)&(~0xff))&(~0xff));
	/*
	for(int i=0;i<10;i++){
		*(phy2vir(Global_CR3)+i)=0UL;
	}
	//clear first 10 entries in PML4 page table set in head.S
	flush_tlb();
	//clear tlb in cache
	*/
	
}


struct page* alloc_pages(int zone_select,int number,unsigned long page_flags){
	int i;
	unsigned long page=0;

	int zone_start=0;
	int zone_end=0;

	switch(zone_select){//locate to certain mm part
		case ZONE_DMA:
				zone_start=0;
				zone_end=ZONE_DMA_INDEX;
			break;

		case ZONE_NORMAL:
				zone_start=ZONE_DMA_INDEX;
				zone_end=ZONE_NORMAL_INDEX;
			break;

		case ZONE_UNMAPED:
				zone_start=ZONE_UNMAPPED_INDEX;
				zone_end=mman_struct.zones_size - 1;
			break;

		default:
			printk(RED,BLACK,"alloc_pages error zone_select index\n");
			return NULL;
			break;
	}

	for(i = zone_start;i <= zone_end; i++){
		struct zone* z;
		unsigned long j;
		unsigned long start,end,length;
		unsigned long tmp;

		if((mman_struct.zones_struct+i)->page_free_count<number)
			continue;

		z=mman_struct.zones_struct+i;
		start=z->zone_start_addr>>PAGE_2M_SHIFT;
		end=z->zone_end_addr>>PAGE_2M_SHIFT;
		length=z->zone_length>>PAGE_2M_SHIFT;
		
		tmp=64-start % 64;

		for(j=start;j<=end;j+=j%64?tmp:64){
			unsigned long* p=mman_struct.bits_map+(j>>6);
			unsigned long shift=j%64;
			unsigned long k;
			for(k=shift;k<64-shift;k++){
				if(!(((*p>>k)|(*(p+1)<<(64-k)))&(number==64?0xffffffffffffffffUL:((1UL<<number)-1)))){
					unsigned long l;
					page=j+k-1;
					for(l=0;l<number;l++){
						struct page* x = mman_struct.pages_struct+page+l;
						page_init(x,page_flags);

					}
					return (struct page*)(mman_struct.pages_struct+page);
				}
			}
		
		}
	}
	return NULL;
}