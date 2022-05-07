#include "printk.h"
#include "fat32.h"
#include "disk.h"
#include "lib.h"

void DISK0_FAT32_FS_init(){
    unsigned char buf[512];
    struct Disk_Partition_Table DPT;
    struct FAT32_BootSector fat32_bootsector;
    struct FAT32_FSInfo fat32_fsinfo;

    printk(RED,YELLOW,"Primary Partition Table:\n");
    memset(buf,0,512);
    IDE_device_operation.transfer(ATA_READ_CMD,0x00,1,(unsigned char*)buf);
    DPT=*(struct Disk_Partition_Table*)buf;
    printk(RED,YELLOW,"Start: %x End: %x ID: %x Sectors: %x\n",\
        DPT.DPTE[0].start_LBA,\
        DPT.DPTE[0].sectors_limit+DPT.DPTE[0].start_LBA-1,\
        DPT.DPTE[0].type,\
        DPT.DPTE[0].sectors_limit);

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

    memset(buf,0,512);
    IDE_device_operation.transfer(ATA_READ_CMD,\
        DPT.DPTE[0].start_LBA+fat32_bootsector.BPB_FSInfo,\
        1,\
        (unsigned char*)buf);
    /*fat32_fsinfo=*(struct FAT32_FSInfo*)buf;
    printk(RED,YELLOW,"FSI LeadSig: %x\n",fat32_fsinfo.FSI_LeadSig);*/
    for(int i=0;i<512;i++){
        printk(RED,YELLOW,"%x ",buf[i]);
    }
}