org 10000h
	jmp LABEL_LOADER_START
	nop

%include "boot/include/fat12.inc"
%include "boot/include/pm.inc"

BaseOfKernelFile	equ		0x00
OffsetOfKernelFile	equ		0x100000

BaseTmpOfKernelAddr	equ		0x00
OffsetTmpOfKernelFile	equ		0x7e00

MemoryStructBufferAddr	equ		0x7e00

[SECTION .gdt]
LABEL_GDT			Descriptor			0,			0,			0
LABEL_DESC_CODE32	Descriptor			0,		0fffffh,	DA_32|DA_CR|DA_LIMIT_4K
LABEL_DESC_DATA32	Descriptor			0,		0fffffh,	DA_32|DA_DRW|DA_LIMIT_4K

GdtLen	equ		$ - LABEL_GDT
GdtPtr	dw  GdtLen - 1
dd LABEL_GDT

SelectorCode32		equ		LABEL_DESC_CODE32 - LABEL_GDT
SelectorData32		equ		LABEL_DESC_DATA32 - LABEL_GDT


[SECTION .gdt64]

LABEL_GDT64:		dq	0x0000000000000000
LABEL_DESC_CODE64:	dq	0x0020980000000000
LABEL_DESC_DATA64:	dq	0x0000920000000000

GdtLen64	equ	$ - LABEL_GDT64
GdtPtr64	dw	GdtLen64 - 1
dd	LABEL_GDT64

SelectorCode64	equ	LABEL_DESC_CODE64 - LABEL_GDT64
SelectorData64	equ	LABEL_DESC_DATA64 - LABEL_GDT64

[SECTION .s16]
[BITS	16]
LABEL_LOADER_START:
	mov ax,cs
	mov ds,ax
	mov es,ax
	mov ax,0x00
	mov ss,ax
	mov sp,0x7c00

	mov	ax,1301h
	mov	bx,000fh
	mov	dx,0200h
	mov	cx,StartLoaderMsgLen
	push ax
	mov	ax,ds
	mov	es,ax
	pop	ax
	mov	bp,StartLoaderMsg
	int	10h

;Enter big real mode, update FS then quit to real mode
	push ax
	in al,92h
	or al,00000010b
	out	92h,al
	pop	ax


	db 0x66
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
	mov ax,RootDirSectors
	and di,0FFE0h
	add di,01Ah
	mov cx, word [es:di]
	push cx
	add cx,ax
	add cx,SectorBalance
	mov eax,BaseTmpOfKernelAddr
	mov es,eax
	mov bx,OffsetTmpOfKernelFile
	mov ax,cx

LABEL_CONTINUE_LOADING_FILE:
	mov cl,1
	call ReadSector
	pop ax

;Start to mov kernel from temp position to real position

	push cx
	push eax
	push fs
	push edi
	push ds
	push esi

	mov cx,200h
	mov ax,BaseOfKernelFile
	mov fs,ax
	mov edi,dword [OffsetOfKernelFileCount]

	mov ax,BaseTmpOfKernelAddr
	mov ds,ax
	mov esi,OffsetTmpOfKernelFile

LABEL_MOVING_KERNEL:
	mov al,byte [ds:esi]
	mov byte [fs:edi],al

	inc esi
	inc edi

	loop LABEL_MOVING_KERNEL

	mov eax,0x1000
	mov ds,eax

	mov dword [OffsetOfKernelFileCount],edi

	pop	esi
	pop	ds
	pop	edi
	pop	fs
	pop	eax
	pop	cx

	call GetFATEntry
	cmp	ax,0FFFh
	jz LABEL_KERNEL_LOADED
	push ax
	mov	dx,RootDirSectors
	add	ax,dx
	add	ax,SectorBalance

	jmp	LABEL_CONTINUE_LOADING_FILE

LABEL_KERNEL_LOADED:
		
	mov	ax,0B800h
	mov	gs,ax
	mov	ah,0Fh
	mov	al,'K'
	mov	[gs:((80 * 3 + 0) * 2)],ax

KillMotor:
	push dx
	mov dx,03f2h
	mov al,0
	out dx,al
	pop dx
	
LABEL_GET_MEM_INFO:
	mov	ax,1301h
	mov	bx,000Fh
	mov	dx,0400h
	mov	cx,StartGetMemStructMessageLen
	push ax
	mov	ax,ds
	mov	es,ax
	pop	ax
	mov	bp,StartGetMemStructMessage
	int	10h

	mov ax,0x00
	mov es,ax
	mov di,MemoryStructBufferAddr
	xor ebx,ebx

LABEL_GET_MEM_STRUCT:
	mov eax,0x0e820
	mov ecx,20
	mov edx,0x534d4150

	int 15h

	jc LABEL_FAIL_TO_GET_MEM_STRUCTURE
	add di,20

	cmp ebx,0
	jne LABEL_GET_MEM_STRUCT
	jmp LABEL_GET_MEM_SUCC 

LABEL_FAIL_TO_GET_MEM_STRUCTURE:
	mov	ax,1301h
	mov	bx,008ch
	mov	dx,0500h
	mov	cx,ErrToGetMemLen
	push ax
	mov	ax,ds
	mov	es,ax
	pop	ax
	mov	bp,ErrToGetMem
	int	10h

	jmp $

LABEL_GET_MEM_SUCC:
	mov	ax,1301h
	mov	bx,000Fh
	mov	dx,0500h
	mov	cx,SuccToGetMemInfoLen
	push ax
	mov	ax,ds
	mov	es,ax
	pop	ax
	mov	bp,SuccToGetMemInfo
	int	10h

;Set SVGA mode(VESA VBE)
	mov ax,4F02h
	mov bx,4180h
	int 10h

	cli

	db 0x66
	lgdt [GdtPtr]

	mov	eax,cr0
	or eax,1
	mov	cr0,eax
	jmp	dword SelectorCode32:LABEL_TEMP_PROTECT_MODE

[SECTION .s32]
[BITS 32]

LABEL_TEMP_PROTECT_MODE:
	mov ax,SelectorData32
	mov ds,ax
	mov es,ax
	mov fs,ax
	mov ss,ax
	mov sp,0x7e00

	mov	dword [0x90000],0x91007
	mov	dword [0x90004],0x00000
	mov	dword [0x90800],0x91007
	mov	dword [0x90804],0x00000

	mov	dword [0x91000],0x92007
	mov	dword [0x91004],0x00000

	mov	dword [0x92000],0x000083
	mov	dword [0x92004],0x000000
	mov	dword [0x92008],0x200083
	mov	dword [0x9200c],0x000000
	mov	dword [0x92010],0x400083
	mov	dword [0x92014],0x000000
	mov	dword [0x92018],0x600083
	mov	dword [0x9201c],0x000000
	mov	dword [0x92020],0x800083
	mov	dword [0x92024],0x000000
	mov	dword [0x92028],0xa00083
	mov	dword [0x9202c],0x000000

	db 0x66
	lgdt [GdtPtr64]
	mov	ax,SelectorData64
	mov	ds,ax
	mov	es,ax
	mov	fs,ax
	mov	gs,ax
	mov	ss,ax

	mov	esp,7E00h

;open PAE
	mov	eax,cr4
	or eax,0x20
	mov	cr4,eax

;load cr3

	mov	eax,0x90000
	mov	cr3,eax

;enable long-mode

	mov	ecx,0C0000080h	;IA32_EFER
	rdmsr

	or eax,0x100
	wrmsr

;open PE and paging

	mov	eax,cr0
	or eax,0x80000001
	mov	cr0,eax

	jmp	SelectorCode64:OffsetOfKernelFile

[SECTION .s16lib]
[BITS 16]
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

GetFATEntry:

	push es
	push bx
	push ax
	mov	ax,00
	mov	es,ax
	pop	ax
	mov	byte [Odd],0
	mov	bx,3
	mul	bx
	mov	bx,2
	div	bx
	cmp	dx,0
	jz	.Label_Even
	mov	byte [Odd],1; ax is odd number

.Label_Even:
	xor	dx,dx
	mov	bx,[BPB_BytesPerSec]
	div	bx; ax: consult, the offset of sector which have fatentry base on fat table
		  ; dx:remainder, the offset of fatentry base on the sector which contains fatentry 
	push dx
	mov	bx,8000h
	add	ax,SectorNumOfFAT1Start; ax: sector number which has fatentry
	mov	cl,2
	call ReadSector
	
	pop	dx
	add	bx,dx;bx: offset of fat entry
	mov	ax,[es:bx]
	cmp	byte [Odd],1
	jnz	.Label_Even_2
	shr	ax,4

.Label_Even_2:
	and	ax,0fffh
	pop	bx
	pop	es
	ret

DispAL:

	push ecx
	push edx
	push edi
	
	mov	edi,[DisplayPosition]
	mov	ah,0Fh
	mov	dl,al
	shr	al,4
	mov	ecx,2
.begin:
	and	al,0Fh
	cmp	al,9
	ja .1
	add	al,'0'
	jmp .2
.1:

	sub	al,0Ah
	add	al,'A'
.2:

	mov	[gs:edi],ax
	add	edi,2
	
	mov	al,dl
	loop .begin

	mov	[DisplayPosition],edi

	pop	edi
	pop	edx
	pop	ecx
	
	ret



RootDirSectorForLoop	dw   RootDirSectors
SecLoadStart			dw 	 0
Odd		db 	0
OffsetOfKernelFileCount	dd	OffsetOfKernelFile
DisplayPosition		dd 		(80*6+0)*2		

StartLoaderMsg 		db		"Loading......"
StartLoaderMsgLen	equ		$ - StartLoaderMsg

MissKernelMsg 		db		"No KernelFile Exists"
MissKernelMsglen	equ		$ - MissKernelMsg

StartGetMemStructMessage 	db		"Start Getting Memory Structure......"
StartGetMemStructMessageLen	equ		$ - StartGetMemStructMessage

ErrToGetMem			db		"Fail to get memory information......"
ErrToGetMemLen		equ		$ - ErrToGetMem

SuccToGetMemInfo	db		"Success to get memory information"
SuccToGetMemInfoLen	equ		$ - SuccToGetMemInfo

KernelFileName		db	"KERNEL  BIN",0