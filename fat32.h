#ifndef __FAT32_H__
#define __FAT32_H__

struct Disk_Partition_Entry{
    unsigned char flag;
    unsigned char start_head;
    unsigned short  start_sector    :6,
                    start_cylinder  :10;
    unsigned char type;
    unsigned char end_head;
    unsigned short  end_sector      :6,
                    end_cylinder    :10;
    unsigned int start_LBA;
    unsigned int sectors_limit;
}__attribute__((packed));

struct Disk_Partition_Table{
    unsigned char BS_Reserved[446];
    struct Disk_Partition_Entry DPTE[4];
    unsigned short BS_TrailSig;
}__attribute__((packed));

struct FAT32_BootSector{
	unsigned char BS_jmpBoot[3];
	unsigned char BS_OEMName[8];
	unsigned short BPB_BytesPerSec;
	unsigned char BPB_SecPerClus;
	unsigned short BPB_RsvdSecCnt;
	unsigned char BPB_NumFATs;
	unsigned short BPB_RootEntCnt;
	unsigned short BPB_TotSec16;
	unsigned char BPB_Media;
	unsigned short BPB_FATSz16;
	unsigned short BPB_SecPerTrk;
	unsigned short BPB_NumHeads;
	unsigned int BPB_HiddSec;
	unsigned int BPB_TotSec32;
	
	unsigned int BPB_FATSz32;
	unsigned short BPB_ExtFlags;
	unsigned short BPB_FSVer;
	unsigned int BPB_RootClus;
	unsigned short BPB_FSInfo;
	unsigned short BPB_BkBootSec;
	unsigned char BPB_Reserved[12];

	unsigned char BS_DrvNum;
	unsigned char BS_Reserved1;
	unsigned char BS_BootSig;
	unsigned int BS_VolID;
	unsigned char BS_VolLab[11];
	unsigned char BS_FilSysType[8];

	unsigned char BootCode[420];

	unsigned short BS_TrailSig;
}__attribute__((packed));

struct FAT32_FSInfo{
    unsigned int FSI_LeadSig;
    unsigned char FSI_Reserved[480];
    unsigned int FSI_StructSig;
    unsigned int FSI_Free_Count;
    unsigned int FSI_Nxt_Free;
    unsigned char FSI_Reserved2[12];
    unsigned int FSI_TrailSig;
}__attribute__((packed));

void DISK0_FAT32_FS_init();

#endif