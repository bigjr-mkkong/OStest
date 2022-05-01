#include "printk.h"
#include "fat32.h"
#include "disk.h"
#include "lib.h"

void DISK0_FAT32_FS_init(){
    unsigned char buf[512];
    struct Disk_Partition_Table DPT;
    struct FAT32_BootSector fat32_bootsector;
    struct FAT32_FSInfo fat32_fsinfo;

    memset(buf,0,512);
    IDE_device_operation.transfer(ATA_READ_CMD,0X0,1,(unsigned char*)buf);
    DPT=*(struct Disk_Partition_Table*)buf;
    printk(RED,YELLOW,"Start LBA: %x\n",DPT.DPTE[0].start_LBA);

    memset(buf,0,512);
    IDE_device_operation.transfer(ATA_READ_CMD,DPT.DPTE[0].start_LBA,1,(unsigned char*)buf);
    fat32_bootsector=*(struct FAT32_BootSector*)buf;
    printk(RED,YELLOW,"BPB_BytesPerSec: %x\n",fat32_bootsector.BPB_BytesPerSec);
}