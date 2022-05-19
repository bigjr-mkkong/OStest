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

struct FAT32_Directory *lookup(char *name, int namelen, struct FAT32_Directory *dentry, int flags){
    
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
            kfree(path);
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

    
}