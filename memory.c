#include "memory.h"
#include "lib.h"
#include "printk.h"

unsigned long page_init(struct page* p, unsigned long flags){
	p->attribute|=flags;
	if(!p->ref_count||(p->attribute&PG_Shared)){
		p->ref_count++;
		p->zone_struct->total_page_link++;
	}
	return 1;
}

unsigned long page_clean(struct page *p){
	p->ref_count--;
	p->zone_struct->total_page_link--;
	if(!p->ref_count){
		p->attribute&=PG_PTable_Maped;
	}
	return 1;
}

unsigned long get_page_attribute(struct page *p){
	if(p==NULL){
		printk(RED,BLACK,"get_page_attribute(): p==NULL\n");
		return 0;
	}
	return p->attribute;
}

unsigned long set_page_attribute(struct page *p, unsigned long flags){
	if(p==NULL){
		printk(RED,BLACK,"set_page_attribute(): p==NULL\n");
		return 0;
	}
	p->attribute=flags;
	return 1;
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

		mman_struct.e820[i].address=p->address;//initialize the basic mm info in mman_struct
		mman_struct.e820[i].length=p->length;
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
	set_page_attribute(mman_struct.pages_struct,PG_PTable_Maped|PG_Kernel_Init|PG_Kernel);
	mman_struct.pages_struct->ref_count=1;
	mman_struct.pages_struct->age=0;

	
	mman_struct.zones_length=\
	(mman_struct.zones_size*sizeof(struct zone)+sizeof(long)-1)&\
	(~(sizeof(long)-1));


	ZONE_DMA_INDEX=0;
	ZONE_NORMAL_INDEX=0;
	ZONE_UNMAPPED_INDEX=0;

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

void free_pages(struct page *page,int number){
	if(page==NULL){
		printk(RED,BLACK,"free_pages() ERROR: page is invalid\n");
		return ;
	}	

	if(number>=64||number<=0){
		printk(RED,BLACK,"free_pages() ERROR: number is invalid\n");
		return ;	
	}
	
	for(int i=0;i<number;i++,page++){
		*(mman_struct.bits_map+((page->phy_addr>>PAGE_2M_SHIFT)>>6))&=
			~(1UL<<(page->phy_addr>>PAGE_2M_SHIFT)%64);
		page->zone_struct->page_using_count--;
		page->zone_struct->page_free_count++;
		page->attribute = 0;
	}
}


struct Slab_cache *slab_create(unsigned long size,\
	void *(* constructor)(void *Vaddress, unsigned long arg),\
	void *(* destructor)(void *Vaddress, unsigned long arg),unsigned long arg){
	
	struct Slab_cache *slab_cache=NULL;
	slab_cache=(struct Slab_cache*)kmalloc(sizeof(struct Slab_cache),0);

	if(slab_cache==NULL){
		printk(RED,BLACK,"slab_create: slab_cache=kmalloc(): NULL");
		return NULL;
	}
	memset(slab_cache,0,sizeof(struct Slab_cache));

	slab_cache->size=SIZEOF_LONG_ALIGN(size);
	slab_cache->total_using=0;
	slab_cache->total_free=0;
	slab_cache->cache_pool=(struct Slab*)kmalloc(sizeof(struct Slab),0);

	if(slab_cache->cache_pool==NULL){
		printk(RED,BLACK,"slab_create(): slab_cache->cache_pool=kmalloc(): NULL");
		kfree(slab_cache);
		return NULL;
	}
	memset(slab_cache->cache_pool,0,sizeof(struct Slab));

	slab_cache->cache_dma_pool=NULL;
	slab_cache->constructor=constructor;
	slab_cache->destructor=destructor;

	list_init(&slab_cache->cache_pool->list);

	slab_cache->cache_pool->page=alloc_pages(ZONE_NORMAL,1,0);
	if(slab_cache->cache_pool->page==NULL){
		printk(RED,BLACK,"slab_create(): slab_cache->cache_pool->page=alloc_pages(): NULL");
		kfree(slab_cache->cache_pool);
		kfree(slab_cache);
		return NULL;
	}
	page_init(slab_cache->cache_pool->page,PG_Kernel);
	slab_cache->cache_pool->using_count=0;
	slab_cache->cache_pool->free_count=PAGE_2M_SIZE/slab_cache->size;
	slab_cache->total_free=slab_cache->cache_pool->free_count;
	slab_cache->cache_pool->Vaddress=phy2vir(slab_cache->cache_pool->page->phy_addr);
	slab_cache->cache_pool->color_count=slab_cache->cache_pool->free_count;
	slab_cache->cache_pool->color_length=\
		((slab_cache->cache_pool->free_count+sizeof(unsigned long)*8-1)>>6)<<3;
	slab_cache->cache_pool->color_map=(unsigned long *)\
		kmalloc(slab_cache->cache_pool->color_length,0);
	if(slab_cache->cache_pool->color_map==NULL){
		printk(RED,BLACK,"slab_create(): slab_cache->cache_pool-color_map=kmalloc(): NULL");
		free_pages(slab_cache->cache_pool->page,1);
		kfree(slab_cache->cache_pool);
		kfree(slab_cache);
		return NULL;
	}
	memset(slab_cache->cache_pool->color_map,0,slab_cache->cache_pool->color_length);
	return slab_cache;
}

unsigned long slab_destroy(struct Slab_cache *slab_cache){
	struct Slab *slab_p=slab_cache->cache_pool;
	struct Slab *tmp_slab=NULL;

	if(slab_cache->total_using!=0){
		printk(RED,BLACK,"slab_cache->total_using != 0\n");
		return 0;
	}
	while(!list_is_empty(&slab_p->list)){
		tmp_slab=slab_p;
		slab_p=container_of(list_next(&slab_p->list),struct Slab,list);
		list_del(&tmp_slab->list);
		
		kfree(tmp_slab->color_map);
		page_clean(tmp_slab->page);
		
		free_pages(tmp_slab->page,1);
		kfree(tmp_slab);
	}
	kfree(slab_p->color_map);
	page_clean(slab_p->page);
		
	free_pages(slab_p->page,1);
	kfree(slab_p);
	kfree(slab_cache);
	return 1;

}

void *slab_malloc(struct Slab_cache* slab_cache, unsigned long arg){
	struct Slab *slab_p=slab_cache->cache_pool;
	struct Slab *tmp_slab=NULL;
	if(slab_cache->total_free=0){
		tmp_slab=(struct Slab*)kmalloc(sizeof(struct Slab),0);
		if(tmp_slab==NULL){
			printk(RED,BLACK,"slab_malloc(): tmp_slab=kmalloc()==NULL");
			return NULL;
		}
		memset(tmp_slab,0,sizeof(struct Slab));
		list_init(&tmp_slab->list);
		tmp_slab->page=alloc_pages(ZONE_NORMAL,1,0);
		if(tmp_slab->page==NULL){
			printk(RED,BLACK,"slab_malloc(): tmp_slab->page=alloc_pages()==NULL");
			kfree(tmp_slab);
			return NULL;
		}
		page_init(tmp_slab->page,PG_Kernel);
		tmp_slab->using_count=0;
		tmp_slab->free_count=PAGE_2M_SIZE/slab_cache->size;
		tmp_slab->Vaddress=phy2vir(tmp_slab->page->phy_addr);
		tmp_slab->color_count=tmp_slab->free_count;
		tmp_slab->color_length=((tmp_slab->color_count+sizeof(unsigned long)*8-1)>>6)<<3;
		tmp_slab->color_map=(unsigned long*)kmalloc(tmp_slab->color_length,0);

		if(tmp_slab->color_map==NULL){
			printk(RED,BLACK,"slab_malloc(): tmp_slab->color_map=kmalloc()==NULL");
			free_pages(tmp_slab->page,1);
			kfree(tmp_slab);
			return NULL;
		}
		memset(tmp_slab->color_map,0,tmp_slab->color_length);
		list_add_to_behind(&slab_cache->cache_pool->list,tmp_slab->list);
		slab_cache->total_free+=tmp_slab->color_count;

		for(int i=0;i<tmp_slab->color_count;i++){
			if( (*(tmp_slab->color_map+(i>>6)) & (1UL<<(i%64)))==0){
				*(tmp_slab->color_map+(i>>6)) |= (1UL<<(i%64));
				
				tmp_slab->using_count++;
				tmp_slab->free_count--;

				slab_cache->total_using++;
				slab_cache->total_free--;

				if(slab_cache->constructor!=NULL){
					return slab_cache->\
						constructor((char*)tmp_slab->Vaddress+slab_cache->size*i,arg);
				}else{
					return (void*)((char*)tmp_slab->Vaddress+slab_cache->size*i);
				}
			}
		}
	}else{
		do{
			if(slab_p->free_count==0){
				slab_p=container_of(list_next(&slab_p->list),struct Slab,list);
				continue;
			}
			for(int i=0;i<slab_p->color_count;i++){
				if(*(slab_p->color_map+(i>>6))==0xffffffffffffffffUL){
					i+=63;
					continue;
				}
				if( (*(slab_p->color_map+(i>>6)) & (1UL<<(i%64)))==0){
					*(slab_p->color_map+(i>>6)) |= (1UL<<(i%64));

					slab_p->using_count++;
					slab_p->free_count--;

					slab_cache->total_using++;
					slab_cache->total_free--;

					if(slab_cache->constructor!=NULL){
						return slab_cache->\
							constructor((char*)slab_p->Vaddress+slab_cache->size*i,arg);
					}else{
						return (void*)((char*)slab_p->Vaddress+slab_cache->size*i);
					}
				}
			}
		}while(slab_p!=slab_cache->cache_pool);
	}
	printk(RED,BLACK,"slab_malloc(): cannot alloc\n");
	if(tmp_slab!=NULL){
		list_del(&tmp_slab->list);
		kfree(tmp_slab->color_map);
		page_clean(tmp_slab->page);
		free_pages(tmp_slab->page,1);
		kfree(tmp_slab);
	}
	return NULL;
}

unsigned long slab_free(struct Slab_cache *slab_cache, void *address, unsigned long arg){
	struct Slab * slab_p=slab_cache->cache_pool;
	int index=0;

	do{
		if((slab_p->Vaddress<=address)&&(address<slab_p->Vaddress+PAGE_2M_SIZE)){
			index=(address-slab_p->Vaddress)/slab_cache->size;
			*(slab_p->color_map+(index >> 6)) ^= (1UL<<index % 64);
			slab_p->free_count++;
			slab_p->using_count--;

			slab_cache->total_using--;
			slab_cache->total_free++;
			
			if(slab_cache->destructor!=NULL){
				slab_cache->\
					destructor((char *)slab_p->Vaddress+slab_cache->size*index,arg);
			}

			if((slab_p->using_count==0)&&(slab_cache->total_free>=slab_p->color_count*3/2)){
				list_del(&slab_p->list);
				slab_cache->total_free-=slab_p->color_count;

				kfree(slab_p->color_map);
				
				page_clean(slab_p->page);
				free_pages(slab_p->page,1);
				kfree(slab_p);				
			}

			return 1;
		}else{
			slab_p=container_of(list_next(&slab_p->list),struct Slab,list);
			continue;	
		}		

	}while(slab_p!=slab_cache->cache_pool);

	printk(RED,BLACK,"slab_free(): address not in slab\n");

	return 0;
}

