#ifndef __FAT32_H__
#define __FAT32_H__

struct Disk_Partition_Table_Entry{
    unsigned char flag;						//boot indicator
    unsigned char start_head;
    unsigned short  start_sector    :6,
                    start_cylinder  :10;
    unsigned char type;						//system id
    unsigned char end_head;
    unsigned short  end_sector      :6,
                    end_cylinder    :10;
    unsigned int start_LBA;					//relative sector
    unsigned int sectors_limit;				//total sector
}__attribute__((packed));

struct Disk_Partition_Table{
    unsigned char BS_Reserved[446];
    struct Disk_Partition_Table_Entry DPTE[4];
    unsigned short BS_TrailSig;
}__attribute__((packed));

struct FAT32_BootSector{
	unsigned char BS_jmpBoot[3];		//JMP+NOP ins
	unsigned char BS_OEMName[8];		//OEM name
	unsigned short BPB_BytesPerSec;		//Bytes Per Sector
	unsigned char BPB_SecPerClus;		//Sector Per Clus
	unsigned short BPB_RsvdSecCnt;		//Reserved Sector Count
	unsigned char BPB_NumFATs;			//Nuber of FAT
	unsigned short BPB_RootEntCnt;		//Maximun Root Dir Entries
	unsigned short BPB_TotSec16;		//Number of Sectors Smaller than 32MB
	unsigned char BPB_Media;			//Medis Discriptor
	unsigned short BPB_FATSz16;			//Sector Per FAT
	unsigned short BPB_SecPerTrk;		//Sector Per Track
	unsigned short BPB_NumHeads;		//Number of Head
	unsigned int BPB_HiddSec;			//Number of Hidden Section In Partition
	unsigned int BPB_TotSec32;			//Number of Sectors In Partition
	
	unsigned int BPB_FATSz32;			//Number of Sector Per FAT
	unsigned short BPB_ExtFlags;		//FLAGS
	unsigned short BPB_FSVer;			//Version of FAT driver
	unsigned int BPB_RootClus;			//Cluster Number of the Start of the Root Directory
	unsigned short BPB_FSInfo;			//Sector Number of the FS Info Sector
	unsigned short BPB_BkBootSec;		//Sector Number of the Backup Boot Sector
	unsigned char BPB_Reserved[12];		//Reserved

	unsigned char BS_DrvNum;			//Logical Driver Number of Partition
	unsigned char BS_Reserved1;			//Unused
	unsigned char BS_BootSig;			//Extended Signature
	unsigned int BS_VolID;				//Serial Number of Partition
	unsigned char BS_VolLab[11];		//Volume Name of Partition
	unsigned char BS_FilSysType[8];		//FAT Name

	unsigned char BootCode[420];

	unsigned short BS_TrailSig;			//55AA
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