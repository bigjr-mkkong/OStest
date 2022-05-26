#include "printk.h"
#include "fat32.h"
#include "disk.h"
#include "lib.h"
#include "memory.h"

struct Disk_Partition_Table DPT;
struct FAT32_BootSector fat32_bootsector;
struct FAT32_FSInfo fat32_fsinfo;

unsigned long FirstDataSector=0;    //First sector number of data sector
unsigned long BytesPerClus=0;
unsigned long FirstFAT1Sector=0;
unsigned long FirstFAT2Sector=0;

unsigned int DISK0_FAT32_read_FAT_Entry(unsigned int fat_entry){
    unsigned int buf[128];
    memset(buf,0,512);

    IDE_device_operation.transfer(ATA_READ_CMD,FirstFAT1Sector+(fat_entry>>7),1,(unsigned char*)buf);
    return buf[fat_entry&0x7f];
}
unsigned int DISK0_FAT32_write_FAT_Entry(unsigned int fat_entry, unsigned int value){
    unsigned int buf[128];
    memset(buf,0,512);

    IDE_device_operation.transfer(ATA_READ_CMD,FirstFAT1Sector+(fat_entry>>7),1,(unsigned char*)buf);
    buf[fat_entry & 0x7f]=(buf[fat_entry & 0x7f] & 0xf0000000) | (value & 0x0fffffff);
    //update both FAT1 and FAT2
	IDE_device_operation.transfer(ATA_WRITE_CMD,FirstFAT1Sector+(fat_entry>>7),1,(unsigned char*)buf);
	IDE_device_operation.transfer(ATA_WRITE_CMD,FirstFAT2Sector+(fat_entry>>7),1,(unsigned char*)buf);
	return 1;
}
/*
lookup(): search directory entry in given directory
*/
struct FAT32_Directory *lookup(char *name, int namelen, struct FAT32_Directory *dentry, int flags){
    unsigned int cluster=0;
    unsigned long sector=0;
    unsigned char *buf=NULL;

    unsigned int j=0;

    struct FAT32_Directory *tmpdentry=NULL,*p=NULL;
    struct FAT32_LongDirectory *tmpldentry=NULL;

    buf=kmalloc(BytesPerClus,0);
    cluster=(dentry->DIR_FirstClus_HIGH<<16)|(dentry->DIR_FirstClus_LOW);

next_cluster:
    //read parent cluster sector
    sector=FirstDataSector+(cluster-2)*fat32_bootsector.BPB_SecPerClus;
    if(!IDE_device_operation.transfer(ATA_READ_CMD,sector,fat32_bootsector.BPB_SecPerClus,(unsigned char *)buf)){
        printk(RED,YELLOW,"[FS]: lookup() failed to read disk\n");
        kfree(buf);
        return NULL;
    }
    tmpdentry=(struct FAT32_Directory*)buf;
    //search in directory entry
    for(int i=0;i<BytesPerClus;i+=32,tmpdentry++){
        if(tmpdentry->DIR_Attr==ATTR_LONGNAME){
            continue;
        }
        if(tmpdentry->DIR_Name[0]==0xe5||tmpdentry->DIR_Name[0]==0x00||tmpdentry->DIR_Name==0x05){
            continue;
        }
        tmpldentry=(struct FAT32_LongDirectory*)tmpdentry-1;
        j=0;
        //long directory entry search
        while(tmpldentry->LDIR_Attr==ATTR_LONGNAME && tmpldentry->LDIR_Ord!=0xe5){
            for(int x=0;x<5;x++){
                if(j>namelen&&tmpldentry->LDIR_Name1[x]==0xffff){
                    continue;
                }else if(j>namelen||tmpldentry->LDIR_Name1[x]!=(unsigned short*)(name[j++])){
                    goto continue_cmp_fail;
                }
            }

            for(int x=0;x<6;x++){
                if(j>namelen&&tmpldentry->LDIR_Name2[x]==0xffff){
                    continue;
                }else if(j>namelen||tmpldentry->LDIR_Name2[x]!=(unsigned short*)(name[j++])){
                    goto continue_cmp_fail;
                }
            }

            for(int x=0;x<2;x++){
                if(j>namelen&&tmpldentry->LDIR_Name3[x]==0xffff){
                    continue;
                }else if(j>namelen||tmpldentry->LDIR_Name3[x]!=(unsigned short*)(name[j++])){
                    goto continue_cmp_fail;
                }
            }

            if(j>=namelen){
                p=(struct FAT32_Directory*)kmalloc(sizeof(struct FAT32_Directory),0);
                *p=*tmpdentry;

                kfree(buf);
                return p;
            }
            tmpldentry--;
        }

        //short directory entry search
        j=0;
        for(int x=0;x<8;x++){
            switch(tmpdentry->DIR_Name[x]){
                case ' ':
                    if(!(tmpdentry->DIR_Attr&ATTR_DIRECTORY)){
                        if(name[j]=='.'){
                            continue;
                        }else if(tmpdentry->DIR_Name[x]==name[j]){
                            j++;
                            break;
                        }else{
                            goto continue_cmp_fail;
                        }
                    }else{
                        if(j<namelen&&tmpdentry->DIR_Name[x]==name[j]){
                            j++;
                            break;
                        }else if(j==namelen){
                            continue;
                        }else{
                            goto continue_cmp_fail;
                        }
                    }
                case 'A' ... 'Z':
                case 'a' ... 'z':
                case '0' ... '9':
                    if(j<namelen && tmpdentry->DIR_Name[x]==name[j]){
                        j++;
                        break;
                    }else{
                        goto continue_cmp_fail;
                    }
                
                default:
                    j++;
                    break;
            }
        }
        //file extension compare
        if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY)){
			j++;
			for(int x=8;x<11;x++){
				switch(tmpdentry->DIR_Name[x]){
					case 'A' ... 'Z':
					case 'a' ... 'z':
                    case '0' ... '9':
						if(tmpdentry->DIR_Name[x] == name[j]){
						    j++;
						    break;
						}else{
						    goto continue_cmp_fail;
                        }
					case ' ':
						if(tmpdentry->DIR_Name[x] == name[j]){
							j++;
							break;
						}else{
							goto continue_cmp_fail;
                        }
					default :
						goto continue_cmp_fail;
				}
			}
		}
		p=(struct FAT32_Directory *)kmalloc(sizeof(struct FAT32_Directory),0);
		*p=*tmpdentry;
		kfree(buf);
		return p;
        
        continue_cmp_fail:;//goto next entry
    }

    //read LBA of next cluster from FAT table
    cluster=DISK0_FAT32_read_FAT_Entry(cluster);
	if(cluster < 0x0ffffff7)
		goto next_cluster;

	kfree(buf);
	return NULL;
}

/*
FS path walk
name is the path for certain file
*/
struct FAT32_Directory *path_walk(char *name, unsigned long flags){
    char *tmpname=NULL;
    int tmpnamelen=0;
    struct FAT32_Directory *parent=NULL;
    struct FAT32_Directory *path=NULL;
    char *dentryname=NULL;

    while(*name=='/'){
        name++;
    }

    if(!(*name)){
        return NULL;
    }

    parent=(struct FAT32_Directory *)kmalloc(sizeof(struct FAT32_Directory),0);
    dentryname=kmalloc(PAGE_4K_SIZE,0);
    memset(parent,0,sizeof(struct FAT32_Directory));
    memset(dentryname,0,PAGE_4K_SIZE);

    /*
    set the root directory start clus as the beginning clus number of fat32
    just 4 convenience
    */ 
    parent->DIR_FirstClus_LOW=fat32_bootsector.BPB_RootClus&0xffff;
    parent->DIR_FirstClus_HIGH=(fat32_bootsector.BPB_RootClus>>16)&0xffff;

    while(1){
        tmpname=name;
        while(*name && (*name!='/')){
            name++;
        }
        tmpnamelen=name-tmpname;
        memcpy(tmpname,dentryname,tmpnamelen);
        dentryname[tmpnamelen]='\0';

        /*
        dentryname contain next level's dir/file name which is wait to search
        parent contains the current directory which is wait to be search
                parent.DIR_Name
                    /     \
                   /       \
              dentryname   ...
        */
        path=lookup(dentryname,tmpnamelen,parent,flags);

        //unable to find dentryname in parent
        if(path==NULL){
            printk(RED,YELLOW,"Cannot find file or dir: %s\n",dentryname);
            kfree(dentryname);
            kfree(parent);
            return NULL;
        }

        /*
        cases when search end: if the target is not a directory
        example: name="/xxx/yyy"
        */
        if(!(*name)){
            if(flags & ATTR_HIDDEN){
                kfree(dentryname);
                kfree(path);
                return parent;
            }
            kfree(dentryname);
            kfree(parent);
            return path;
        }
        
        //filte out following '/'
        while(*name=='/'){
            name++;
        }

        /*
        cases when search end: if is a directory
        example: name="/xxx/yyy/"
        */
        if(!(*name)){
            if(flags & ATTR_HIDDEN){
                kfree(dentryname);
                kfree(path);
                return parent;
            }
            kfree(dentryname);
            kfree(parent);
            return path;
        }

        *parent=*path;
        kfree(path);//better to use kfree() instead memset() 2 prevent memory leak
    }
}

void DISK0_FAT32_FS_init(){
    unsigned char buf[512];

    struct FAT32_Directory *dentry=NULL;

    /*
    Read Disk Partition Table
    */
    printk(RED,YELLOW,"Primary Partition Table:\n");
    memset(buf,0,512);
    IDE_device_operation.transfer(ATA_READ_CMD,0x00,1,(unsigned char*)buf);
    DPT=*(struct Disk_Partition_Table*)buf;
    printk(RED,YELLOW,"Start: %x End: %x ID: %x Sectors: %x\n",\
        DPT.DPTE[0].start_LBA,\
        DPT.DPTE[0].sectors_limit+DPT.DPTE[0].start_LBA-1,\
        DPT.DPTE[0].type,\
        DPT.DPTE[0].sectors_limit);

    /*
    Read FAT32 Boot Sector
    */
    printk(RED,YELLOW,"FAT32 Boot Sector:\n");
    memset(buf,0,512);
    IDE_device_operation.transfer(ATA_READ_CMD,\
        DPT.DPTE[0].start_LBA,\
        1,\
        (unsigned char*)buf);
    fat32_bootsector=*(struct FAT32_BootSector*)buf;
    printk(RED,YELLOW,"OEMName: %s\nSecNum for FSInfo: %x\nTotal SectorNum: %x\n",\
    fat32_bootsector.BS_OEMName,\
    fat32_bootsector.BPB_FSInfo,\
    fat32_bootsector.BPB_TotSec32);

    /*
    Read FSInfo Sector
    */
    memset(buf,0,512);
    IDE_device_operation.transfer(ATA_READ_CMD,\
        DPT.DPTE[0].start_LBA+fat32_bootsector.BPB_FSInfo,\
        1,\
        (unsigned char*)buf);
    fat32_fsinfo=*(struct FAT32_FSInfo*)buf;
    printk(RED,YELLOW,"FSI LeadSig: %x\n",fat32_fsinfo.FSI_LeadSig);

    /*
    Initialize FS Data
    */
    FirstDataSector=DPT.DPTE[0].start_LBA+fat32_bootsector.BPB_RsvdSecCnt+ \
        fat32_bootsector.BPB_FATSz32*fat32_bootsector.BPB_NumFATs;
    FirstFAT1Sector=DPT.DPTE[0].start_LBA+fat32_bootsector.BPB_RsvdSecCnt;
    FirstFAT2Sector=FirstFAT1Sector+fat32_bootsector.BPB_FATSz32;
    BytesPerClus=fat32_bootsector.BPB_SecPerClus*fat32_bootsector.BPB_BytesPerSec;

    dentry=path_walk("/abcd",0);

    if(dentry!=NULL){
        printk(RED,YELLOW,"File /abcd Found, File Size: %x\n",dentry->DIR_FileSize);
    }else{
        printk(RED,YELLOW,"File Not Found\n");
    }

    dentry=path_walk("/testdir/longfilenametest.txt",0);

    if(dentry!=NULL){
        printk(RED,YELLOW,"File /testdir/longfilenametest.txt Found, File Size: %x\n",dentry->DIR_FileSize);
    }else{
        printk(RED,YELLOW,"File Not Found\n");
    }

    dentry=path_walk("/do_not_exist",0);

    if(dentry!=NULL){
        printk(RED,YELLOW,"File /do_not_exist Found, File Size: %x\n",dentry->DIR_FileSize);
    }else{
        printk(RED,YELLOW,"File Not Found\n");
    }
}