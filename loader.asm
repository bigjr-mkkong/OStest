org 10000h
	jmp LABEL_LOADER_START
	nop

%include "include/fat12.inc"
%include "include/pm.inc"

BaseOfKernelFile	equ		0x00
OffsetOfKernelFile	equ		0x100000

BaseTmpOfKernelAddr	equ		0x00
OffsetTmpOfKernelFile	equ		0x7e00

MemoryStructBufferAddr	equ		0x7e00

[SECTION .gdt]
LABEL_GDT			Descriptor			0,			0,			0
LABEL_DESC_CODE32	Descriptor			0,		0fffffh,	DA_32|DA_CR|DA_LIMIT_4K
LABEL_DESC_DATA32	Descriptor			0,		0fffffh,	DA_32|DA_DRW|DA_LIMIT_4K
LABEL_DESC_VIDEO	Descriptor		0b8000h,	0ffffh,		DA_DRW|DA_DPL3

GdtLen	equ		$ - LABEL_GDT
GdtPtr	dw  GdtLen - 1
dd LABEL_GDT

SelectorCode32		equ		LABEL_DESC_CODE32 - LABEL_GDT
SelectorData32		equ		LABEL_DESC_DATA32 - LABEL_GDT
SelectorVideo		equ		LABEL_DESC_VIDEO - LABEL_GDT

[SECTION .s16]
[BITS	16]
LABEL_LOADER_START:
	mov ax,cs
	mov ds,ax
	mov es,ax
	mov ax,0
	mov ss,ax
	mov sp,0x7c00

	mov	ax,	1301h
	mov	bx,	000fh
	mov	dx,	0200h		;row 2
	mov	cx,	StartLoaderMsgLen
	push	ax
	mov	ax,	ds
	mov	es,	ax
	pop	ax
	mov	bp,	StartLoaderMsg
	int	10h

;Enter big real mode, update FS then quit to real mode
	push ax
	in al,92h
	or al,00000010b
	out	92h,al
	pop	ax

	dd 0x66
	lgdt [GdtPtr]

	cli
	mov	eax,cr0
	or eax,1
	mov	cr0,eax

	mov	ax,SelectorData32
	mov	fs,ax
	mov	eax,cr0
	and	al,11111110b
	mov	cr0,eax

	sti
	; refresh disk driver
	xor ah,ah
	xor dl,dl
	int 13h

;looking for KERNEL.BIN

	mov word [SecLoadStart],SectorNumOfRootDirStart ;0x7c68
LABEL_START_LOADING_SECTOR:
	cmp word [RootDirSectorForLoop],0
	jz LABEL_NO_KERNEL
	dec word [RootDirSectorForLoop]

	mov	ax,00h
	mov	es,ax
	mov	bx,8000h
	mov	ax,[SecLoadStart]
	mov	cl,1
	call ReadSector ;es:bx = start addr of loaded sector
	mov	si,KernelFileName
	mov	di,8000h
	cld
	mov dx,10h

LABEL_SEARCH_FOR_KERNEL:
	cmp dx,0
	jz LABEL_SEARCH_NEXT_SECTOR
	dec dx
	mov cx,11
LABEL_COMPARING_NAME:
	cmp cx,0
	jz LABEL_FILENAME_FOUND
	dec cx
	lodsb
	cmp al,byte [es:di]
	jz LABEL_CONTINUE
	jmp LABEL_DIFFERENT_NAME
LABEL_CONTINUE:
	inc di
	jmp LABEL_COMPARING_NAME
LABEL_DIFFERENT_NAME:
	and	di,0ffe0h
	add	di,20h
	mov si,KernelFileName
	jmp LABEL_SEARCH_FOR_KERNEL

LABEL_SEARCH_NEXT_SECTOR:
	add word [SecLoadStart],1
	jmp LABEL_START_LOADING_SECTOR

LABEL_NO_KERNEL:
	mov	ax,1301h
	mov	bx,008Ch
	mov	dx,0300h
	mov	cx,MissKernelMsglen
	push ax
	mov	ax,ds
	mov	es,ax
	pop	ax
	mov	bp,MissKernelMsg
	int	10h
	jmp	$


LABEL_FILENAME_FOUND:

	jmp	$

ReadSector:
; ax: reading start sector number
; cl: number of sector going to read
; [es:bx]: buffer of sectors in mem

;ans1=sector_number/sec_per_trk
;start sector=remainder-1
;cylinder=ans1>>1
;head=ans1&1

	push	bp
	mov	bp,	sp
	sub	esp,	2
	mov	byte	[bp - 2],	cl
	push	bx
	mov	bl,	[BPB_SecPerTrk]
	div	bl
	inc	ah
	mov	cl,	ah
	mov	dh,	al
	shr	al,	1
	mov	ch,	al
	and	dh,	1
	pop	bx
	mov	dl,	[BS_DrvNum]
.Go_On_Reading:
	mov	ah,	2
	mov	al,	byte	[bp - 2]
	int	13h
	jc	.Go_On_Reading
	add	esp,	2
	pop	bp
	ret


RootDirSectorForLoop	dw   RootDirSectors
SecLoadStart			dw 	 0

StartLoaderMsg 		db		"Loading......"
StartLoaderMsgLen	equ		$ - StartLoaderMsg

MissKernelMsg 		db		"No KernelFile Exists"
MissKernelMsglen	equ		$ - MissKernelMsg

KernelFileName		db	"KERNEL  BIN",0