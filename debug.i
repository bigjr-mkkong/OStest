
system:     file format elf64-x86-64


Disassembly of section .text:

ffff800000100000 <_start>:
ffff800000100000:	0f 01 15 d1 c5 00 00 	lgdt   0xc5d1(%rip)        # ffff80000010c5d8 <GDT_END>
ffff800000100007:	0f 01 1d d4 d5 00 00 	lidt   0xd5d4(%rip)        # ffff80000010d5e2 <IDT_END>
ffff80000010000e:	48 c7 c0 00 10 10 00 	mov    $0x101000,%rax
ffff800000100015:	0f 22 d8             	mov    %rax,%cr3
ffff800000100018:	48 8b 05 05 00 00 00 	mov    0x5(%rip),%rax        # ffff800000100024 <switch_seg>
ffff80000010001f:	6a 08                	pushq  $0x8
ffff800000100021:	50                   	push   %rax
ffff800000100022:	48 cb                	lretq  

ffff800000100024 <switch_seg>:
ffff800000100024:	2c 00                	sub    $0x0,%al
ffff800000100026:	10 00                	adc    %al,(%rax)
ffff800000100028:	00 80 ff ff      	add    %al,-0x38b70001(%rax)

ffff80000010002c <entry64>:
ffff80000010002c:	48 c7 c0 10 00 00 00 	mov    $0x10,%rax
ffff800000100033:	48 8e d8             	mov    %rax,%ds
ffff800000100036:	48 8e c0             	mov    %rax,%es
ffff800000100039:	48 8e e8             	mov    %rax,%gs
ffff80000010003c:	48 8e d0             	mov    %rax,%ss
ffff80000010003f:	48 8b 25 39 01 00 00 	mov    0x139(%rip),%rsp        # ffff80000010017f <_stack_start>

ffff800000100046 <setup_idt>:
ffff800000100046:	48 8d 15 a6 00 00 00 	lea    0xa6(%rip),%rdx        # ffff8000001000f3 <unrecord_int>
ffff80000010004d:	48 c7 c0 00 00 08 00 	mov    $0x80000,%rax
ffff800000100054:	66 89 d0             	mov    %dx,%ax
ffff800000100057:	48 b9 00 00 00 00 00 	movabs $0x8e0000000000,%rcx
ffff80000010005e:	8e 00 00 
ffff800000100061:	48 01 c8             	add    %rcx,%rax
ffff800000100064:	89 d1                	mov    %edx,%ecx
ffff800000100066:	c1 e9 10             	shr    $0x10,%ecx
ffff800000100069:	48 c1 e1 30          	shl    $0x30,%rcx
ffff80000010006d:	48 01 c8             	add    %rcx,%rax
ffff800000100070:	48 c1 ea 20          	shr    $0x20,%rdx
ffff800000100074:	48 8d 3d 67 c5 00 00 	lea    0xc567(%rip),%rdi        # ffff80000010c5e2 <LABEL_IDT>
ffff80000010007b:	48 c7 c1 00 01 00 00 	mov    $0x100,%rcx

ffff800000100082 <.setting>:
ffff800000100082:	48 89 07             	mov    %rax,(%rdi)
ffff800000100085:	48 89 57 08          	mov    %rdx,0x8(%rdi)
ffff800000100089:	48 83 c7 10          	add    $0x10,%rdi
ffff80000010008d:	48 ff c9             	dec    %rcx
ffff800000100090:	75 f0                	jne    ffff800000100082 <.setting>

ffff800000100092 <setup_TSS64>:
ffff800000100092:	48 8d 15 53 d5 00 00 	lea    0xd553(%rip),%rdx        # ffff80000010d5ec <LABEL_TSS64>
ffff800000100099:	48 31 c0             	xor    %rax,%rax
ffff80000010009c:	48 31 c9             	xor    %rcx,%rcx
ffff80000010009f:	48 c7 c0 89 00 00 00 	mov    $0x89,%rax
ffff8000001000a6:	48 c1 e0 28          	shl    $0x28,%rax
ffff8000001000aa:	89 d1                	mov    %edx,%ecx
ffff8000001000ac:	c1 e9 18             	shr    $0x18,%ecx
ffff8000001000af:	48 c1 e1 38          	shl    $0x38,%rcx
ffff8000001000b3:	48 01 c8             	add    %rcx,%rax
ffff8000001000b6:	48 31 c9             	xor    %rcx,%rcx
ffff8000001000b9:	89 d1                	mov    %edx,%ecx
ffff8000001000bb:	81 e1 ff ff ff 00    	and    $0xffffff,%ecx
ffff8000001000c1:	48 c1 e1 10          	shl    $0x10,%rcx
ffff8000001000c5:	48 01 c8             	add    %rcx,%rax
ffff8000001000c8:	48 83 c0 67          	add    $0x67,%rax
ffff8000001000cc:	48 8d 3d 6d c4 00 00 	lea    0xc46d(%rip),%rdi        # ffff80000010c540 <LABEL_GDT64>
ffff8000001000d3:	48 89 47 50          	mov    %rax,0x50(%rdi)
ffff8000001000d7:	48 c1 ea 20          	shr    $0x20,%rdx
ffff8000001000db:	48 89 57 58          	mov    %rdx,0x58(%rdi)
ffff8000001000df:	48 8b 05 05 00 00 00 	mov    0x5(%rip),%rax        # ffff8000001000eb <go_to_kernel>
ffff8000001000e6:	6a 08                	pushq  $0x8
ffff8000001000e8:	50                   	push   %rax
ffff8000001000e9:	48 cb                	lretq  

ffff8000001000eb <go_to_kernel>:
ffff8000001000eb:	d8 46 10             	fadds  0x10(%rsi)
ffff8000001000ee:	00 00                	add    %al,(%rax)
ffff8000001000f0:	80 ff ff             	cmp    $0xff,%bh

ffff8000001000f3 <unrecord_int>:
ffff8000001000f3:	fc                   	cld    
ffff8000001000f4:	50                   	push   %rax
ffff8000001000f5:	53                   	push   %rbx
ffff8000001000f6:	51                   	push   %rcx
ffff8000001000f7:	52                   	push   %rdx
ffff8000001000f8:	55                   	push   %rbp
ffff8000001000f9:	57                   	push   %rdi
ffff8000001000fa:	56                   	push   %rsi
ffff8000001000fb:	41 50                	push   %r8
ffff8000001000fd:	41 51                	push   %r9
ffff8000001000ff:	41 52                	push   %r10
ffff800000100101:	41 53                	push   %r11
ffff800000100103:	41 54                	push   %r12
ffff800000100105:	41 55                	push   %r13
ffff800000100107:	41 56                	push   %r14
ffff800000100109:	41 57                	push   %r15
ffff80000010010b:	48 8c c0             	mov    %es,%rax
ffff80000010010e:	50                   	push   %rax
ffff80000010010f:	48 8c d8             	mov    %ds,%rax
ffff800000100112:	50                   	push   %rax
ffff800000100113:	48 c7 c0 10 00 00 00 	mov    $0x10,%rax
ffff80000010011a:	48 8e d8             	mov    %rax,%ds
ffff80000010011d:	48 8e c0             	mov    %rax,%es
ffff800000100120:	48 8d 05 35 00 00 00 	lea    0x35(%rip),%rax        # ffff80000010015c <int_msg>
ffff800000100127:	50                   	push   %rax
ffff800000100128:	48 89 c2             	mov    %rax,%rdx
ffff80000010012b:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax
ffff800000100132:	e8 e3 4e 00 00       	callq  ffff80000010501a <printk>
ffff800000100137:	48 83 c4 08          	add    $0x8,%rsp
ffff80000010013b:	58                   	pop    %rax
ffff80000010013c:	48 8e d8             	mov    %rax,%ds
ffff80000010013f:	58                   	pop    %rax
ffff800000100140:	48 8e c0             	mov    %rax,%es
ffff800000100143:	41 5f                	pop    %r15
ffff800000100145:	41 5e                	pop    %r14
ffff800000100147:	41 5d                	pop    %r13
ffff800000100149:	41 5c                	pop    %r12
ffff80000010014b:	41 5b                	pop    %r11
ffff80000010014d:	41 5a                	pop    %r10
ffff80000010014f:	41 59                	pop    %r9
ffff800000100151:	41 58                	pop    %r8
ffff800000100153:	5e                   	pop    %rsi
ffff800000100154:	5f                   	pop    %rdi
ffff800000100155:	5d                   	pop    %rbp
ffff800000100156:	5a                   	pop    %rdx
ffff800000100157:	59                   	pop    %rcx
ffff800000100158:	5b                   	pop    %rbx
ffff800000100159:	58                   	pop    %rax
ffff80000010015a:	48 cf                	iretq  

ffff80000010015c <int_msg>:
ffff80000010015c:	55                   	push   %rbp
ffff80000010015d:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010015e:	6b 6e 6f 77          	imul   $0x77,0x6f(%rsi),%ebp
ffff800000100162:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000100163:	20 69 6e             	and    %ch,0x6e(%rcx)
ffff800000100166:	74 65                	je     ffff8000001001cd <_stack_start+0x4e>
ffff800000100168:	72 72                	jb     ffff8000001001dc <_stack_start+0x5d>
ffff80000010016a:	75 70                	jne    ffff8000001001dc <_stack_start+0x5d>
ffff80000010016c:	74 20                	je     ffff80000010018e <_stack_start+0xf>
ffff80000010016e:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010016f:	72 20                	jb     ffff800000100191 <_stack_start+0x12>
ffff800000100171:	66 61                	data16 (bad) 
ffff800000100173:	75 6c                	jne    ffff8000001001e1 <_stack_start+0x62>
ffff800000100175:	74 20                	je     ffff800000100197 <_stack_start+0x18>
ffff800000100177:	61                   	(bad)  
ffff800000100178:	74 20                	je     ffff80000010019a <_stack_start+0x1b>
ffff80000010017a:	52                   	push   %rdx
ffff80000010017b:	49 50                	rex.WB push %r8
ffff80000010017d:	0a 00                	or     (%rax),%al

ffff80000010017f <_stack_start>:
ffff80000010017f:	00 00                	add    %al,(%rax)
ffff800000100181:	12 00                	adc    (%rax),%al
ffff800000100183:	00 80 ff ff 90 00    	add    %al,0x90ffff(%rax)
	...

ffff800000101000 <__PML4E>:
ffff800000101000:	07                   	(bad)  
ffff800000101001:	20 10                	and    %dl,(%rax)
	...
ffff8000001017ff:	00 07                	add    %al,(%rdi)
ffff800000101801:	20 10                	and    %dl,(%rax)
	...

ffff800000102000 <__PDPTE>:
ffff800000102000:	07                   	(bad)  
ffff800000102001:	30 10                	xor    %dl,(%rax)
	...

ffff800000103000 <__PDE>:
ffff800000103000:	87 00                	xchg   %eax,(%rax)
ffff800000103002:	00 00                	add    %al,(%rax)
ffff800000103004:	00 00                	add    %al,(%rax)
ffff800000103006:	00 00                	add    %al,(%rax)
ffff800000103008:	87 00                	xchg   %eax,(%rax)
ffff80000010300a:	20 00                	and    %al,(%rax)
ffff80000010300c:	00 00                	add    %al,(%rax)
ffff80000010300e:	00 00                	add    %al,(%rax)
ffff800000103010:	87 00                	xchg   %eax,(%rax)
ffff800000103012:	40 00 00             	add    %al,(%rax)
ffff800000103015:	00 00                	add    %al,(%rax)
ffff800000103017:	00 87 00 60 00 00    	add    %al,0x6000(%rdi)
ffff80000010301d:	00 00                	add    %al,(%rax)
ffff80000010301f:	00 87 00 80 00 00    	add    %al,0x8000(%rdi)
ffff800000103025:	00 00                	add    %al,(%rax)
ffff800000103027:	00 87 00 a0 00 00    	add    %al,0xa000(%rdi)
ffff80000010302d:	00 00                	add    %al,(%rax)
ffff80000010302f:	00 87 00 c0 00 00    	add    %al,0xc000(%rdi)
ffff800000103035:	00 00                	add    %al,(%rax)
ffff800000103037:	00 87 00 e0 00 00    	add    %al,0xe000(%rdi)
ffff80000010303d:	00 00                	add    %al,(%rax)
ffff80000010303f:	00 87 00 00 01 00    	add    %al,0x10000(%rdi)
ffff800000103045:	00 00                	add    %al,(%rax)
ffff800000103047:	00 87 00 20 01 00    	add    %al,0x12000(%rdi)
ffff80000010304d:	00 00                	add    %al,(%rax)
ffff80000010304f:	00 87 00 40 01 00    	add    %al,0x14000(%rdi)
ffff800000103055:	00 00                	add    %al,(%rax)
ffff800000103057:	00 87 00 60 01 00    	add    %al,0x16000(%rdi)
ffff80000010305d:	00 00                	add    %al,(%rax)
ffff80000010305f:	00 87 00 80 01 00    	add    %al,0x18000(%rdi)
ffff800000103065:	00 00                	add    %al,(%rax)
ffff800000103067:	00 87 00 a0 01 00    	add    %al,0x1a000(%rdi)
ffff80000010306d:	00 00                	add    %al,(%rax)
ffff80000010306f:	00 87 00 c0 01 00    	add    %al,0x1c000(%rdi)
ffff800000103075:	00 00                	add    %al,(%rax)
ffff800000103077:	00 87 00 e0 01 00    	add    %al,0x1e000(%rdi)
ffff80000010307d:	00 00                	add    %al,(%rax)
ffff80000010307f:	00 87 00 00 02 00    	add    %al,0x20000(%rdi)
ffff800000103085:	00 00                	add    %al,(%rax)
ffff800000103087:	00 87 00 20 02 00    	add    %al,0x22000(%rdi)
ffff80000010308d:	00 00                	add    %al,(%rax)
ffff80000010308f:	00 87 00 40 02 00    	add    %al,0x24000(%rdi)
ffff800000103095:	00 00                	add    %al,(%rax)
ffff800000103097:	00 87 00 60 02 00    	add    %al,0x26000(%rdi)
ffff80000010309d:	00 00                	add    %al,(%rax)
ffff80000010309f:	00 87 00 80 02 00    	add    %al,0x28000(%rdi)
ffff8000001030a5:	00 00                	add    %al,(%rax)
ffff8000001030a7:	00 87 00 a0 02 00    	add    %al,0x2a000(%rdi)
ffff8000001030ad:	00 00                	add    %al,(%rax)
ffff8000001030af:	00 87 00 c0 02 00    	add    %al,0x2c000(%rdi)
ffff8000001030b5:	00 00                	add    %al,(%rax)
ffff8000001030b7:	00 87 00 e0 02 00    	add    %al,0x2e000(%rdi)
ffff8000001030bd:	00 00                	add    %al,(%rax)
ffff8000001030bf:	00 87 00 00 e0 00    	add    %al,0xe00000(%rdi)
ffff8000001030c5:	00 00                	add    %al,(%rax)
ffff8000001030c7:	00 87 00 20 e0 00    	add    %al,0xe02000(%rdi)
ffff8000001030cd:	00 00                	add    %al,(%rax)
ffff8000001030cf:	00 87 00 40 e0 00    	add    %al,0xe04000(%rdi)
ffff8000001030d5:	00 00                	add    %al,(%rax)
ffff8000001030d7:	00 87 00 60 e0 00    	add    %al,0xe06000(%rdi)
ffff8000001030dd:	00 00                	add    %al,(%rax)
ffff8000001030df:	00 87 00 80 e0 00    	add    %al,0xe08000(%rdi)
ffff8000001030e5:	00 00                	add    %al,(%rax)
ffff8000001030e7:	00 87 00 a0 e0 00    	add    %al,0xe0a000(%rdi)
ffff8000001030ed:	00 00                	add    %al,(%rax)
ffff8000001030ef:	00 87 00 c0 e0 00    	add    %al,0xe0c000(%rdi)
ffff8000001030f5:	00 00                	add    %al,(%rax)
ffff8000001030f7:	00 87 00 e0 e0 00    	add    %al,0xe0e000(%rdi)
	...

ffff800000104000 <RESTORE_ALL>:
ffff800000104000:	41 5f                	pop    %r15
ffff800000104002:	41 5e                	pop    %r14
ffff800000104004:	41 5d                	pop    %r13
ffff800000104006:	41 5c                	pop    %r12
ffff800000104008:	41 5b                	pop    %r11
ffff80000010400a:	41 5a                	pop    %r10
ffff80000010400c:	41 59                	pop    %r9
ffff80000010400e:	41 58                	pop    %r8
ffff800000104010:	5b                   	pop    %rbx
ffff800000104011:	59                   	pop    %rcx
ffff800000104012:	5a                   	pop    %rdx
ffff800000104013:	5e                   	pop    %rsi
ffff800000104014:	5f                   	pop    %rdi
ffff800000104015:	5d                   	pop    %rbp
ffff800000104016:	58                   	pop    %rax
ffff800000104017:	48 8e d8             	mov    %rax,%ds
ffff80000010401a:	58                   	pop    %rax
ffff80000010401b:	48 8e c0             	mov    %rax,%es
ffff80000010401e:	58                   	pop    %rax
ffff80000010401f:	48 83 c4 10          	add    $0x10,%rsp
ffff800000104023:	48 cf                	iretq  

ffff800000104025 <ret_from_intr>:
ffff800000104025:	eb d9                	jmp    ffff800000104000 <RESTORE_ALL>

ffff800000104027 <system_call>:
ffff800000104027:	fb                   	sti    
ffff800000104028:	48 83 ec 38          	sub    $0x38,%rsp
ffff80000010402c:	fc                   	cld    
ffff80000010402d:	50                   	push   %rax
ffff80000010402e:	48 8c c0             	mov    %es,%rax
ffff800000104031:	50                   	push   %rax
ffff800000104032:	48 8c d8             	mov    %ds,%rax
ffff800000104035:	50                   	push   %rax
ffff800000104036:	48 31 c0             	xor    %rax,%rax
ffff800000104039:	55                   	push   %rbp
ffff80000010403a:	57                   	push   %rdi
ffff80000010403b:	56                   	push   %rsi
ffff80000010403c:	52                   	push   %rdx
ffff80000010403d:	51                   	push   %rcx
ffff80000010403e:	53                   	push   %rbx
ffff80000010403f:	41 50                	push   %r8
ffff800000104041:	41 51                	push   %r9
ffff800000104043:	41 52                	push   %r10
ffff800000104045:	41 53                	push   %r11
ffff800000104047:	41 54                	push   %r12
ffff800000104049:	41 55                	push   %r13
ffff80000010404b:	41 56                	push   %r14
ffff80000010404d:	41 57                	push   %r15
ffff80000010404f:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000104056:	48 8e da             	mov    %rdx,%ds
ffff800000104059:	48 8e c2             	mov    %rdx,%es
ffff80000010405c:	48 89 e7             	mov    %rsp,%rdi
ffff80000010405f:	e8 d2 76 00 00       	callq  ffff80000010b736 <system_call_function>

ffff800000104064 <ret_system_call>:
ffff800000104064:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
ffff80000010406b:	00 
ffff80000010406c:	41 5f                	pop    %r15
ffff80000010406e:	41 5e                	pop    %r14
ffff800000104070:	41 5d                	pop    %r13
ffff800000104072:	41 5c                	pop    %r12
ffff800000104074:	41 5b                	pop    %r11
ffff800000104076:	41 5a                	pop    %r10
ffff800000104078:	41 59                	pop    %r9
ffff80000010407a:	41 58                	pop    %r8
ffff80000010407c:	5b                   	pop    %rbx
ffff80000010407d:	59                   	pop    %rcx
ffff80000010407e:	5a                   	pop    %rdx
ffff80000010407f:	5e                   	pop    %rsi
ffff800000104080:	5f                   	pop    %rdi
ffff800000104081:	5d                   	pop    %rbp
ffff800000104082:	58                   	pop    %rax
ffff800000104083:	48 8e d8             	mov    %rax,%ds
ffff800000104086:	58                   	pop    %rax
ffff800000104087:	48 8e c0             	mov    %rax,%es
ffff80000010408a:	58                   	pop    %rax
ffff80000010408b:	48 83 c4 38          	add    $0x38,%rsp
ffff80000010408f:	48 0f 35             	rex.W sysexit 

ffff800000104092 <error_code>:
ffff800000104092:	50                   	push   %rax
ffff800000104093:	48 8c c0             	mov    %es,%rax
ffff800000104096:	50                   	push   %rax
ffff800000104097:	48 8c d8             	mov    %ds,%rax
ffff80000010409a:	50                   	push   %rax
ffff80000010409b:	48 31 c0             	xor    %rax,%rax
ffff80000010409e:	55                   	push   %rbp
ffff80000010409f:	57                   	push   %rdi
ffff8000001040a0:	56                   	push   %rsi
ffff8000001040a1:	52                   	push   %rdx
ffff8000001040a2:	51                   	push   %rcx
ffff8000001040a3:	53                   	push   %rbx
ffff8000001040a4:	41 50                	push   %r8
ffff8000001040a6:	41 51                	push   %r9
ffff8000001040a8:	41 52                	push   %r10
ffff8000001040aa:	41 53                	push   %r11
ffff8000001040ac:	41 54                	push   %r12
ffff8000001040ae:	41 55                	push   %r13
ffff8000001040b0:	41 56                	push   %r14
ffff8000001040b2:	41 57                	push   %r15
ffff8000001040b4:	fc                   	cld    
ffff8000001040b5:	48 8b b4 24 90 00 00 	mov    0x90(%rsp),%rsi
ffff8000001040bc:	00 
ffff8000001040bd:	48 8b 94 24 88 00 00 	mov    0x88(%rsp),%rdx
ffff8000001040c4:	00 
ffff8000001040c5:	48 c7 c7 10 00 00 00 	mov    $0x10,%rdi
ffff8000001040cc:	48 8e df             	mov    %rdi,%ds
ffff8000001040cf:	48 8e c7             	mov    %rdi,%es
ffff8000001040d2:	48 89 e7             	mov    %rsp,%rdi
ffff8000001040d5:	ff d2                	callq  *%rdx
ffff8000001040d7:	e9 49 ff ff ff       	jmpq   ffff800000104025 <ret_from_intr>

ffff8000001040dc <divide_error>:
ffff8000001040dc:	6a 00                	pushq  $0x0
ffff8000001040de:	50                   	push   %rax
ffff8000001040df:	48 8d 05 ce 12 00 00 	lea    0x12ce(%rip),%rax        # ffff8000001053b4 <do_divide_error>
ffff8000001040e6:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001040ea:	eb a6                	jmp    ffff800000104092 <error_code>

ffff8000001040ec <debug>:
ffff8000001040ec:	6a 00                	pushq  $0x0
ffff8000001040ee:	50                   	push   %rax
ffff8000001040ef:	48 8d 05 41 13 00 00 	lea    0x1341(%rip),%rax        # ffff800000105437 <do_debug>
ffff8000001040f6:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001040fa:	eb 96                	jmp    ffff800000104092 <error_code>

ffff8000001040fc <nmi>:
ffff8000001040fc:	50                   	push   %rax
ffff8000001040fd:	fc                   	cld    
ffff8000001040fe:	50                   	push   %rax
ffff8000001040ff:	50                   	push   %rax
ffff800000104100:	48 8c c0             	mov    %es,%rax
ffff800000104103:	50                   	push   %rax
ffff800000104104:	48 8c d8             	mov    %ds,%rax
ffff800000104107:	50                   	push   %rax
ffff800000104108:	48 31 c0             	xor    %rax,%rax
ffff80000010410b:	55                   	push   %rbp
ffff80000010410c:	57                   	push   %rdi
ffff80000010410d:	56                   	push   %rsi
ffff80000010410e:	52                   	push   %rdx
ffff80000010410f:	51                   	push   %rcx
ffff800000104110:	53                   	push   %rbx
ffff800000104111:	41 50                	push   %r8
ffff800000104113:	41 51                	push   %r9
ffff800000104115:	41 52                	push   %r10
ffff800000104117:	41 53                	push   %r11
ffff800000104119:	41 54                	push   %r12
ffff80000010411b:	41 55                	push   %r13
ffff80000010411d:	41 56                	push   %r14
ffff80000010411f:	41 57                	push   %r15
ffff800000104121:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000104128:	48 8e da             	mov    %rdx,%ds
ffff80000010412b:	48 8e c2             	mov    %rdx,%es
ffff80000010412e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi
ffff800000104135:	48 89 e7             	mov    %rsp,%rdi
ffff800000104138:	e8 80 13 00 00       	callq  ffff8000001054bd <do_nmi>
ffff80000010413d:	e9 be fe ff ff       	jmpq   ffff800000104000 <RESTORE_ALL>

ffff800000104142 <breakpoint>:
ffff800000104142:	6a 00                	pushq  $0x0
ffff800000104144:	50                   	push   %rax
ffff800000104145:	48 8d 05 f7 13 00 00 	lea    0x13f7(%rip),%rax        # ffff800000105543 <do_breakpoint>
ffff80000010414c:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104150:	e9 3d ff ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104155 <overflow>:
ffff800000104155:	6a 00                	pushq  $0x0
ffff800000104157:	50                   	push   %rax
ffff800000104158:	48 8d 05 6a 14 00 00 	lea    0x146a(%rip),%rax        # ffff8000001055c9 <do_overflow>
ffff80000010415f:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104163:	e9 2a ff ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104168 <bounds>:
ffff800000104168:	6a 00                	pushq  $0x0
ffff80000010416a:	50                   	push   %rax
ffff80000010416b:	48 8d 05 dd 14 00 00 	lea    0x14dd(%rip),%rax        # ffff80000010564f <do_bounds>
ffff800000104172:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104176:	e9 17 ff ff ff       	jmpq   ffff800000104092 <error_code>

ffff80000010417b <undefined_opcode>:
ffff80000010417b:	6a 00                	pushq  $0x0
ffff80000010417d:	50                   	push   %rax
ffff80000010417e:	48 8d 05 50 15 00 00 	lea    0x1550(%rip),%rax        # ffff8000001056d5 <do_undefined_opcode>
ffff800000104185:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104189:	e9 04 ff ff ff       	jmpq   ffff800000104092 <error_code>

ffff80000010418e <dev_not_available>:
ffff80000010418e:	6a 00                	pushq  $0x0
ffff800000104190:	50                   	push   %rax
ffff800000104191:	48 8d 05 c3 15 00 00 	lea    0x15c3(%rip),%rax        # ffff80000010575b <do_dev_not_available>
ffff800000104198:	48 87 04 24          	xchg   %rax,(%rsp)
ffff80000010419c:	e9 f1 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041a1 <double_fault>:
ffff8000001041a1:	50                   	push   %rax
ffff8000001041a2:	48 8d 05 38 16 00 00 	lea    0x1638(%rip),%rax        # ffff8000001057e1 <do_double_fault>
ffff8000001041a9:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041ad:	e9 e0 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041b2 <coprocessor_segment_overrun>:
ffff8000001041b2:	6a 00                	pushq  $0x0
ffff8000001041b4:	50                   	push   %rax
ffff8000001041b5:	48 8d 05 ab 16 00 00 	lea    0x16ab(%rip),%rax        # ffff800000105867 <do_coprocessor_segment_overrun>
ffff8000001041bc:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041c0:	e9 cd fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041c5 <invalid_TSS>:
ffff8000001041c5:	50                   	push   %rax
ffff8000001041c6:	48 8d 05 20 17 00 00 	lea    0x1720(%rip),%rax        # ffff8000001058ed <do_invalid_TSS>
ffff8000001041cd:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041d1:	e9 bc fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041d6 <segment_not_present>:
ffff8000001041d6:	50                   	push   %rax
ffff8000001041d7:	48 8d 05 f1 18 00 00 	lea    0x18f1(%rip),%rax        # ffff800000105acf <do_segment_not_present>
ffff8000001041de:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041e2:	e9 ab fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041e7 <stack_segment_fault>:
ffff8000001041e7:	50                   	push   %rax
ffff8000001041e8:	48 8d 05 c2 1a 00 00 	lea    0x1ac2(%rip),%rax        # ffff800000105cb1 <do_stack_segment_fault>
ffff8000001041ef:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041f3:	e9 9a fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041f8 <general_protection>:
ffff8000001041f8:	50                   	push   %rax
ffff8000001041f9:	48 8d 05 93 1c 00 00 	lea    0x1c93(%rip),%rax        # ffff800000105e93 <do_general_protection>
ffff800000104200:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104204:	e9 89 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104209 <page_fault>:
ffff800000104209:	50                   	push   %rax
ffff80000010420a:	48 8d 05 64 1e 00 00 	lea    0x1e64(%rip),%rax        # ffff800000106075 <do_page_fault>
ffff800000104211:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104215:	e9 78 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff80000010421a <x87_FPU_error>:
ffff80000010421a:	6a 00                	pushq  $0x0
ffff80000010421c:	50                   	push   %rax
ffff80000010421d:	48 8d 05 a7 20 00 00 	lea    0x20a7(%rip),%rax        # ffff8000001062cb <do_x87_FPU_error>
ffff800000104224:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104228:	e9 65 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff80000010422d <alignment_check>:
ffff80000010422d:	50                   	push   %rax
ffff80000010422e:	48 8d 05 1c 21 00 00 	lea    0x211c(%rip),%rax        # ffff800000106351 <do_alignment_check>
ffff800000104235:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104239:	e9 54 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff80000010423e <machine_check>:
ffff80000010423e:	6a 00                	pushq  $0x0
ffff800000104240:	50                   	push   %rax
ffff800000104241:	48 8d 05 8f 21 00 00 	lea    0x218f(%rip),%rax        # ffff8000001063d7 <do_machine_check>
ffff800000104248:	48 87 04 24          	xchg   %rax,(%rsp)
ffff80000010424c:	e9 41 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104251 <SIMD_exception>:
ffff800000104251:	6a 00                	pushq  $0x0
ffff800000104253:	50                   	push   %rax
ffff800000104254:	48 8d 05 02 22 00 00 	lea    0x2202(%rip),%rax        # ffff80000010645d <do_SIMD_exception>
ffff80000010425b:	48 87 04 24          	xchg   %rax,(%rsp)
ffff80000010425f:	e9 2e fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104264 <virtualization_exception>:
ffff800000104264:	6a 00                	pushq  $0x0
ffff800000104266:	50                   	push   %rax
ffff800000104267:	48 8d 05 75 22 00 00 	lea    0x2275(%rip),%rax        # ffff8000001064e3 <do_virtualization_exception>
ffff80000010426e:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104272:	e9 1b fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104277 <set_idt_desc>:
ffff800000104277:	55                   	push   %rbp
ffff800000104278:	48 89 e5             	mov    %rsp,%rbp
ffff80000010427b:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010427b <set_idt_desc+0x4>
ffff800000104282:	49 bb 6d af 00 00 00 	movabs $0xaf6d,%r11
ffff800000104289:	00 00 00 
ffff80000010428c:	4c 01 d8             	add    %r11,%rax
ffff80000010428f:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
ffff800000104293:	89 f9                	mov    %edi,%ecx
ffff800000104295:	88 4d ec             	mov    %cl,-0x14(%rbp)
ffff800000104298:	89 f1                	mov    %esi,%ecx
ffff80000010429a:	88 4d e8             	mov    %cl,-0x18(%rbp)
ffff80000010429d:	88 55 e4             	mov    %dl,-0x1c(%rbp)
ffff8000001042a0:	0f b6 55 ec          	movzbl -0x14(%rbp),%edx
ffff8000001042a4:	48 63 d2             	movslq %edx,%rdx
ffff8000001042a7:	48 89 d1             	mov    %rdx,%rcx
ffff8000001042aa:	48 c1 e1 04          	shl    $0x4,%rcx
ffff8000001042ae:	48 ba 10 ff ff ff ff 	movabs $0xffffffffffffff10,%rdx
ffff8000001042b5:	ff ff ff 
ffff8000001042b8:	48 8b 04 10          	mov    (%rax,%rdx,1),%rax
ffff8000001042bc:	48 01 c8             	add    %rcx,%rax
ffff8000001042bf:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff8000001042c3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001042c7:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff8000001042cb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001042cf:	89 c2                	mov    %eax,%edx
ffff8000001042d1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001042d5:	66 89 10             	mov    %dx,(%rax)
ffff8000001042d8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001042dc:	66 c7 40 02 08 00    	movw   $0x8,0x2(%rax)
ffff8000001042e2:	0f b6 45 e4          	movzbl -0x1c(%rbp),%eax
ffff8000001042e6:	c1 e0 08             	shl    $0x8,%eax
ffff8000001042e9:	89 c2                	mov    %eax,%edx
ffff8000001042eb:	0f b6 45 e8          	movzbl -0x18(%rbp),%eax
ffff8000001042ef:	09 d0                	or     %edx,%eax
ffff8000001042f1:	89 c2                	mov    %eax,%edx
ffff8000001042f3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001042f7:	66 89 50 04          	mov    %dx,0x4(%rax)
ffff8000001042fb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001042ff:	48 c1 e8 10          	shr    $0x10,%rax
ffff800000104303:	89 c2                	mov    %eax,%edx
ffff800000104305:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000104309:	66 89 50 06          	mov    %dx,0x6(%rax)
ffff80000010430d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000104311:	48 c1 e8 20          	shr    $0x20,%rax
ffff800000104315:	89 c2                	mov    %eax,%edx
ffff800000104317:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010431b:	89 50 08             	mov    %edx,0x8(%rax)
ffff80000010431e:	90                   	nop
ffff80000010431f:	5d                   	pop    %rbp
ffff800000104320:	c3                   	retq   

ffff800000104321 <set_intr_gate>:
ffff800000104321:	55                   	push   %rbp
ffff800000104322:	48 89 e5             	mov    %rsp,%rbp
ffff800000104325:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000104329:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000104329 <set_intr_gate+0x8>
ffff800000104330:	49 bb bf ae 00 00 00 	movabs $0xaebf,%r11
ffff800000104337:	00 00 00 
ffff80000010433a:	4c 01 d8             	add    %r11,%rax
ffff80000010433d:	89 f1                	mov    %esi,%ecx
ffff80000010433f:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff800000104343:	89 fa                	mov    %edi,%edx
ffff800000104345:	88 55 fc             	mov    %dl,-0x4(%rbp)
ffff800000104348:	89 ca                	mov    %ecx,%edx
ffff80000010434a:	88 55 f8             	mov    %dl,-0x8(%rbp)
ffff80000010434d:	0f b6 75 f8          	movzbl -0x8(%rbp),%esi
ffff800000104351:	0f b6 7d fc          	movzbl -0x4(%rbp),%edi
ffff800000104355:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000104359:	48 89 d1             	mov    %rdx,%rcx
ffff80000010435c:	ba 8e 00 00 00       	mov    $0x8e,%edx
ffff800000104361:	49 b8 8f 50 ff ff ff 	movabs $0xffffffffffff508f,%r8
ffff800000104368:	ff ff ff 
ffff80000010436b:	4a 8d 04 00          	lea    (%rax,%r8,1),%rax
ffff80000010436f:	ff d0                	callq  *%rax
ffff800000104371:	90                   	nop
ffff800000104372:	c9                   	leaveq 
ffff800000104373:	c3                   	retq   

ffff800000104374 <set_trap_gate>:
ffff800000104374:	55                   	push   %rbp
ffff800000104375:	48 89 e5             	mov    %rsp,%rbp
ffff800000104378:	48 83 ec 10          	sub    $0x10,%rsp
ffff80000010437c:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010437c <set_trap_gate+0x8>
ffff800000104383:	49 bb 6c ae 00 00 00 	movabs $0xae6c,%r11
ffff80000010438a:	00 00 00 
ffff80000010438d:	4c 01 d8             	add    %r11,%rax
ffff800000104390:	89 f1                	mov    %esi,%ecx
ffff800000104392:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff800000104396:	89 fa                	mov    %edi,%edx
ffff800000104398:	88 55 fc             	mov    %dl,-0x4(%rbp)
ffff80000010439b:	89 ca                	mov    %ecx,%edx
ffff80000010439d:	88 55 f8             	mov    %dl,-0x8(%rbp)
ffff8000001043a0:	0f b6 75 f8          	movzbl -0x8(%rbp),%esi
ffff8000001043a4:	0f b6 7d fc          	movzbl -0x4(%rbp),%edi
ffff8000001043a8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff8000001043ac:	48 89 d1             	mov    %rdx,%rcx
ffff8000001043af:	ba 8f 00 00 00       	mov    $0x8f,%edx
ffff8000001043b4:	49 b8 8f 50 ff ff ff 	movabs $0xffffffffffff508f,%r8
ffff8000001043bb:	ff ff ff 
ffff8000001043be:	4a 8d 04 00          	lea    (%rax,%r8,1),%rax
ffff8000001043c2:	ff d0                	callq  *%rax
ffff8000001043c4:	90                   	nop
ffff8000001043c5:	c9                   	leaveq 
ffff8000001043c6:	c3                   	retq   

ffff8000001043c7 <set_system_gate>:
ffff8000001043c7:	55                   	push   %rbp
ffff8000001043c8:	48 89 e5             	mov    %rsp,%rbp
ffff8000001043cb:	48 83 ec 10          	sub    $0x10,%rsp
ffff8000001043cf:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff8000001043cf <set_system_gate+0x8>
ffff8000001043d6:	49 bb 19 ae 00 00 00 	movabs $0xae19,%r11
ffff8000001043dd:	00 00 00 
ffff8000001043e0:	4c 01 d8             	add    %r11,%rax
ffff8000001043e3:	89 f1                	mov    %esi,%ecx
ffff8000001043e5:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff8000001043e9:	89 fa                	mov    %edi,%edx
ffff8000001043eb:	88 55 fc             	mov    %dl,-0x4(%rbp)
ffff8000001043ee:	89 ca                	mov    %ecx,%edx
ffff8000001043f0:	88 55 f8             	mov    %dl,-0x8(%rbp)
ffff8000001043f3:	0f b6 75 f8          	movzbl -0x8(%rbp),%esi
ffff8000001043f7:	0f b6 7d fc          	movzbl -0x4(%rbp),%edi
ffff8000001043fb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff8000001043ff:	48 89 d1             	mov    %rdx,%rcx
ffff800000104402:	ba ef 00 00 00       	mov    $0xef,%edx
ffff800000104407:	49 b8 8f 50 ff ff ff 	movabs $0xffffffffffff508f,%r8
ffff80000010440e:	ff ff ff 
ffff800000104411:	4a 8d 04 00          	lea    (%rax,%r8,1),%rax
ffff800000104415:	ff d0                	callq  *%rax
ffff800000104417:	90                   	nop
ffff800000104418:	c9                   	leaveq 
ffff800000104419:	c3                   	retq   

ffff80000010441a <set_system_intr_gate>:
ffff80000010441a:	55                   	push   %rbp
ffff80000010441b:	48 89 e5             	mov    %rsp,%rbp
ffff80000010441e:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000104422:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000104422 <set_system_intr_gate+0x8>
ffff800000104429:	49 bb c6 ad 00 00 00 	movabs $0xadc6,%r11
ffff800000104430:	00 00 00 
ffff800000104433:	4c 01 d8             	add    %r11,%rax
ffff800000104436:	89 f1                	mov    %esi,%ecx
ffff800000104438:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff80000010443c:	89 fa                	mov    %edi,%edx
ffff80000010443e:	88 55 fc             	mov    %dl,-0x4(%rbp)
ffff800000104441:	89 ca                	mov    %ecx,%edx
ffff800000104443:	88 55 f8             	mov    %dl,-0x8(%rbp)
ffff800000104446:	0f b6 75 f8          	movzbl -0x8(%rbp),%esi
ffff80000010444a:	0f b6 7d fc          	movzbl -0x4(%rbp),%edi
ffff80000010444e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000104452:	48 89 d1             	mov    %rdx,%rcx
ffff800000104455:	ba ee 00 00 00       	mov    $0xee,%edx
ffff80000010445a:	49 b8 8f 50 ff ff ff 	movabs $0xffffffffffff508f,%r8
ffff800000104461:	ff ff ff 
ffff800000104464:	4a 8d 04 00          	lea    (%rax,%r8,1),%rax
ffff800000104468:	ff d0                	callq  *%rax
ffff80000010446a:	90                   	nop
ffff80000010446b:	c9                   	leaveq 
ffff80000010446c:	c3                   	retq   

ffff80000010446d <set_tss64>:
ffff80000010446d:	55                   	push   %rbp
ffff80000010446e:	48 89 e5             	mov    %rsp,%rbp
ffff800000104471:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000104471 <set_tss64+0x4>
ffff800000104478:	49 bb 77 ad 00 00 00 	movabs $0xad77,%r11
ffff80000010447f:	00 00 00 
ffff800000104482:	4c 01 d8             	add    %r11,%rax
ffff800000104485:	89 7d fc             	mov    %edi,-0x4(%rbp)
ffff800000104488:	89 75 f8             	mov    %esi,-0x8(%rbp)
ffff80000010448b:	89 55 f4             	mov    %edx,-0xc(%rbp)
ffff80000010448e:	89 4d f0             	mov    %ecx,-0x10(%rbp)
ffff800000104491:	44 89 45 ec          	mov    %r8d,-0x14(%rbp)
ffff800000104495:	44 89 4d e8          	mov    %r9d,-0x18(%rbp)
ffff800000104499:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff8000001044a0:	ff ff ff 
ffff8000001044a3:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff8000001044a7:	48 8d 52 04          	lea    0x4(%rdx),%rdx
ffff8000001044ab:	8b 4d fc             	mov    -0x4(%rbp),%ecx
ffff8000001044ae:	89 0a                	mov    %ecx,(%rdx)
ffff8000001044b0:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff8000001044b7:	ff ff ff 
ffff8000001044ba:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff8000001044be:	48 8d 52 0c          	lea    0xc(%rdx),%rdx
ffff8000001044c2:	8b 4d f8             	mov    -0x8(%rbp),%ecx
ffff8000001044c5:	89 0a                	mov    %ecx,(%rdx)
ffff8000001044c7:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff8000001044ce:	ff ff ff 
ffff8000001044d1:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff8000001044d5:	48 8d 52 14          	lea    0x14(%rdx),%rdx
ffff8000001044d9:	8b 4d f4             	mov    -0xc(%rbp),%ecx
ffff8000001044dc:	89 0a                	mov    %ecx,(%rdx)
ffff8000001044de:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff8000001044e5:	ff ff ff 
ffff8000001044e8:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff8000001044ec:	48 8d 52 24          	lea    0x24(%rdx),%rdx
ffff8000001044f0:	8b 4d f0             	mov    -0x10(%rbp),%ecx
ffff8000001044f3:	89 0a                	mov    %ecx,(%rdx)
ffff8000001044f5:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff8000001044fc:	ff ff ff 
ffff8000001044ff:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000104503:	48 8d 52 2c          	lea    0x2c(%rdx),%rdx
ffff800000104507:	8b 4d ec             	mov    -0x14(%rbp),%ecx
ffff80000010450a:	89 0a                	mov    %ecx,(%rdx)
ffff80000010450c:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000104513:	ff ff ff 
ffff800000104516:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff80000010451a:	48 8d 52 34          	lea    0x34(%rdx),%rdx
ffff80000010451e:	8b 4d e8             	mov    -0x18(%rbp),%ecx
ffff800000104521:	89 0a                	mov    %ecx,(%rdx)
ffff800000104523:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff80000010452a:	ff ff ff 
ffff80000010452d:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000104531:	48 8d 52 3c          	lea    0x3c(%rdx),%rdx
ffff800000104535:	8b 4d 10             	mov    0x10(%rbp),%ecx
ffff800000104538:	89 0a                	mov    %ecx,(%rdx)
ffff80000010453a:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000104541:	ff ff ff 
ffff800000104544:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000104548:	48 8d 52 44          	lea    0x44(%rdx),%rdx
ffff80000010454c:	8b 4d 18             	mov    0x18(%rbp),%ecx
ffff80000010454f:	89 0a                	mov    %ecx,(%rdx)
ffff800000104551:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000104558:	ff ff ff 
ffff80000010455b:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff80000010455f:	48 8d 52 4c          	lea    0x4c(%rdx),%rdx
ffff800000104563:	8b 4d 20             	mov    0x20(%rbp),%ecx
ffff800000104566:	89 0a                	mov    %ecx,(%rdx)
ffff800000104568:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff80000010456f:	ff ff ff 
ffff800000104572:	48 8b 04 10          	mov    (%rax,%rdx,1),%rax
ffff800000104576:	48 8d 40 54          	lea    0x54(%rax),%rax
ffff80000010457a:	8b 55 28             	mov    0x28(%rbp),%edx
ffff80000010457d:	89 10                	mov    %edx,(%rax)
ffff80000010457f:	90                   	nop
ffff800000104580:	5d                   	pop    %rbp
ffff800000104581:	c3                   	retq   

ffff800000104582 <get_cpuid>:
ffff800000104582:	55                   	push   %rbp
ffff800000104583:	48 89 e5             	mov    %rsp,%rbp
ffff800000104586:	53                   	push   %rbx
ffff800000104587:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000104587 <get_cpuid+0x5>
ffff80000010458e:	49 bb 61 ac 00 00 00 	movabs $0xac61,%r11
ffff800000104595:	00 00 00 
ffff800000104598:	4c 01 d8             	add    %r11,%rax
ffff80000010459b:	89 7d f4             	mov    %edi,-0xc(%rbp)
ffff80000010459e:	89 75 f0             	mov    %esi,-0x10(%rbp)
ffff8000001045a1:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff8000001045a5:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
ffff8000001045a9:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
ffff8000001045ad:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
ffff8000001045b1:	8b 45 f4             	mov    -0xc(%rbp),%eax
ffff8000001045b4:	8b 55 f0             	mov    -0x10(%rbp),%edx
ffff8000001045b7:	89 d1                	mov    %edx,%ecx
ffff8000001045b9:	0f a2                	cpuid  
ffff8000001045bb:	89 de                	mov    %ebx,%esi
ffff8000001045bd:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
ffff8000001045c1:	89 07                	mov    %eax,(%rdi)
ffff8000001045c3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001045c7:	89 30                	mov    %esi,(%rax)
ffff8000001045c9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001045cd:	89 08                	mov    %ecx,(%rax)
ffff8000001045cf:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001045d3:	89 10                	mov    %edx,(%rax)
ffff8000001045d5:	90                   	nop
ffff8000001045d6:	5b                   	pop    %rbx
ffff8000001045d7:	5d                   	pop    %rbp
ffff8000001045d8:	c3                   	retq   

ffff8000001045d9 <get_current>:
ffff8000001045d9:	55                   	push   %rbp
ffff8000001045da:	48 89 e5             	mov    %rsp,%rbp
ffff8000001045dd:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff8000001045dd <get_current+0x4>
ffff8000001045e4:	49 bb 0b ac 00 00 00 	movabs $0xac0b,%r11
ffff8000001045eb:	00 00 00 
ffff8000001045ee:	4c 01 d8             	add    %r11,%rax
ffff8000001045f1:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
ffff8000001045f8:	00 
ffff8000001045f9:	48 c7 c0 00 80 ff ff 	mov    $0xffffffffffff8000,%rax
ffff800000104600:	48 21 e0             	and    %rsp,%rax
ffff800000104603:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000104607:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010460b:	5d                   	pop    %rbp
ffff80000010460c:	c3                   	retq   

ffff80000010460d <no_system_call>:
ffff80000010460d:	55                   	push   %rbp
ffff80000010460e:	48 89 e5             	mov    %rsp,%rbp
ffff800000104611:	41 57                	push   %r15
ffff800000104613:	48 83 ec 18          	sub    $0x18,%rsp
ffff800000104617:	4c 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%r8        # ffff800000104617 <no_system_call+0xa>
ffff80000010461e:	49 bb d1 ab 00 00 00 	movabs $0xabd1,%r11
ffff800000104625:	00 00 00 
ffff800000104628:	4d 01 d8             	add    %r11,%r8
ffff80000010462b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff80000010462f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104633:	48 8b 80 80 00 00 00 	mov    0x80(%rax),%rax
ffff80000010463a:	48 89 c1             	mov    %rax,%rcx
ffff80000010463d:	48 b8 58 10 00 00 00 	movabs $0x1058,%rax
ffff800000104644:	00 00 00 
ffff800000104647:	49 8d 14 00          	lea    (%r8,%rax,1),%rdx
ffff80000010464b:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000104650:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000104655:	4d 89 c7             	mov    %r8,%r15
ffff800000104658:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010465d:	49 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r9
ffff800000104664:	ff ff ff 
ffff800000104667:	4d 01 c1             	add    %r8,%r9
ffff80000010466a:	41 ff d1             	callq  *%r9
ffff80000010466d:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffff800000104674:	48 83 c4 18          	add    $0x18,%rsp
ffff800000104678:	41 5f                	pop    %r15
ffff80000010467a:	5d                   	pop    %rbp
ffff80000010467b:	c3                   	retq   

ffff80000010467c <sys_printf>:
ffff80000010467c:	55                   	push   %rbp
ffff80000010467d:	48 89 e5             	mov    %rsp,%rbp
ffff800000104680:	41 57                	push   %r15
ffff800000104682:	48 83 ec 18          	sub    $0x18,%rsp
ffff800000104686:	48 8d 0d f9 ff ff ff 	lea    -0x7(%rip),%rcx        # ffff800000104686 <sys_printf+0xa>
ffff80000010468d:	49 bb 62 ab 00 00 00 	movabs $0xab62,%r11
ffff800000104694:	00 00 00 
ffff800000104697:	4c 01 d9             	add    %r11,%rcx
ffff80000010469a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff80000010469e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001046a2:	48 8b 40 60          	mov    0x60(%rax),%rax
ffff8000001046a6:	48 89 c2             	mov    %rax,%rdx
ffff8000001046a9:	be ff ff ff 00       	mov    $0xffffff,%esi
ffff8000001046ae:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001046b3:	49 89 cf             	mov    %rcx,%r15
ffff8000001046b6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001046bb:	49 b8 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r8
ffff8000001046c2:	ff ff ff 
ffff8000001046c5:	49 01 c8             	add    %rcx,%r8
ffff8000001046c8:	41 ff d0             	callq  *%r8
ffff8000001046cb:	b8 01 00 00 00       	mov    $0x1,%eax
ffff8000001046d0:	48 83 c4 18          	add    $0x18,%rsp
ffff8000001046d4:	41 5f                	pop    %r15
ffff8000001046d6:	5d                   	pop    %rbp
ffff8000001046d7:	c3                   	retq   

ffff8000001046d8 <Start_Kernel>:
ffff8000001046d8:	55                   	push   %rbp
ffff8000001046d9:	48 89 e5             	mov    %rsp,%rbp
ffff8000001046dc:	41 57                	push   %r15
ffff8000001046de:	53                   	push   %rbx
ffff8000001046df:	48 83 ec 10          	sub    $0x10,%rsp
ffff8000001046e3:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff8000001046e3 <Start_Kernel+0xb>
ffff8000001046ea:	49 bb 05 ab 00 00 00 	movabs $0xab05,%r11
ffff8000001046f1:	00 00 00 
ffff8000001046f4:	4c 01 db             	add    %r11,%rbx
ffff8000001046f7:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff8000001046fe:	00 00 00 
ffff800000104701:	c7 04 03 a0 05 00 00 	movl   $0x5a0,(%rbx,%rax,1)
ffff800000104708:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff80000010470f:	00 00 00 
ffff800000104712:	c7 44 03 04 84 03 00 	movl   $0x384,0x4(%rbx,%rax,1)
ffff800000104719:	00 
ffff80000010471a:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff800000104721:	00 00 00 
ffff800000104724:	c7 44 03 0c 00 00 00 	movl   $0x0,0xc(%rbx,%rax,1)
ffff80000010472b:	00 
ffff80000010472c:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff800000104733:	00 00 00 
ffff800000104736:	8b 54 03 0c          	mov    0xc(%rbx,%rax,1),%edx
ffff80000010473a:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff800000104741:	00 00 00 
ffff800000104744:	89 54 03 08          	mov    %edx,0x8(%rbx,%rax,1)
ffff800000104748:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff80000010474f:	00 00 00 
ffff800000104752:	c7 44 03 10 08 00 00 	movl   $0x8,0x10(%rbx,%rax,1)
ffff800000104759:	00 
ffff80000010475a:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff800000104761:	00 00 00 
ffff800000104764:	c7 44 03 14 10 00 00 	movl   $0x10,0x14(%rbx,%rax,1)
ffff80000010476b:	00 
ffff80000010476c:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff800000104773:	00 00 00 
ffff800000104776:	48 b9 00 00 00 03 00 	movabs $0xffff800003000000,%rcx
ffff80000010477d:	80 ff ff 
ffff800000104780:	48 89 4c 03 18       	mov    %rcx,0x18(%rbx,%rax,1)
ffff800000104785:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff80000010478c:	00 00 00 
ffff80000010478f:	8b 14 03             	mov    (%rbx,%rax,1),%edx
ffff800000104792:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff800000104799:	00 00 00 
ffff80000010479c:	8b 44 03 04          	mov    0x4(%rbx,%rax,1),%eax
ffff8000001047a0:	0f af c2             	imul   %edx,%eax
ffff8000001047a3:	c1 e0 02             	shl    $0x2,%eax
ffff8000001047a6:	05 ff 0f 00 00       	add    $0xfff,%eax
ffff8000001047ab:	25 00 f0 ff ff       	and    $0xfffff000,%eax
ffff8000001047b0:	89 c2                	mov    %eax,%edx
ffff8000001047b2:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff8000001047b9:	00 00 00 
ffff8000001047bc:	89 54 03 20          	mov    %edx,0x20(%rbx,%rax,1)
ffff8000001047c0:	b8 50 00 00 00       	mov    $0x50,%eax
ffff8000001047c5:	0f 00 d8             	ltr    %ax
ffff8000001047c8:	68 00 7c 00 00       	pushq  $0x7c00
ffff8000001047cd:	68 00 7c 00 00       	pushq  $0x7c00
ffff8000001047d2:	68 00 7c 00 00       	pushq  $0x7c00
ffff8000001047d7:	68 00 7c 00 00       	pushq  $0x7c00
ffff8000001047dc:	41 b9 00 7c 00 00    	mov    $0x7c00,%r9d
ffff8000001047e2:	41 b8 00 7c 00 00    	mov    $0x7c00,%r8d
ffff8000001047e8:	b9 00 7c 00 00       	mov    $0x7c00,%ecx
ffff8000001047ed:	ba 00 7c 00 00       	mov    $0x7c00,%edx
ffff8000001047f2:	be 00 7c 00 00       	mov    $0x7c00,%esi
ffff8000001047f7:	bf 00 7c 00 00       	mov    $0x7c00,%edi
ffff8000001047fc:	48 b8 85 52 ff ff ff 	movabs $0xffffffffffff5285,%rax
ffff800000104803:	ff ff ff 
ffff800000104806:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff80000010480a:	ff d0                	callq  *%rax
ffff80000010480c:	48 83 c4 20          	add    $0x20,%rsp
ffff800000104810:	49 89 df             	mov    %rbx,%r15
ffff800000104813:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000104818:	48 ba 81 73 ff ff ff 	movabs $0xffffffffffff7381,%rdx
ffff80000010481f:	ff ff ff 
ffff800000104822:	48 01 da             	add    %rbx,%rdx
ffff800000104825:	ff d2                	callq  *%rdx
ffff800000104827:	49 89 df             	mov    %rbx,%r15
ffff80000010482a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010482f:	48 ba 53 d1 ff ff ff 	movabs $0xffffffffffffd153,%rdx
ffff800000104836:	ff ff ff 
ffff800000104839:	48 01 da             	add    %rbx,%rdx
ffff80000010483c:	ff d2                	callq  *%rdx
ffff80000010483e:	48 b8 70 ff ff ff ff 	movabs $0xffffffffffffff70,%rax
ffff800000104845:	ff ff ff 
ffff800000104848:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010484c:	48 89 c2             	mov    %rax,%rdx
ffff80000010484f:	48 b8 78 1f 02 00 00 	movabs $0x21f78,%rax
ffff800000104856:	00 00 00 
ffff800000104859:	48 89 94 03 d0 02 00 	mov    %rdx,0x2d0(%rbx,%rax,1)
ffff800000104860:	00 
ffff800000104861:	48 b8 08 ff ff ff ff 	movabs $0xffffffffffffff08,%rax
ffff800000104868:	ff ff ff 
ffff80000010486b:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010486f:	48 89 c2             	mov    %rax,%rdx
ffff800000104872:	48 b8 78 1f 02 00 00 	movabs $0x21f78,%rax
ffff800000104879:	00 00 00 
ffff80000010487c:	48 89 94 03 d8 02 00 	mov    %rdx,0x2d8(%rbx,%rax,1)
ffff800000104883:	00 
ffff800000104884:	48 b8 b0 ff ff ff ff 	movabs $0xffffffffffffffb0,%rax
ffff80000010488b:	ff ff ff 
ffff80000010488e:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000104892:	48 89 c2             	mov    %rax,%rdx
ffff800000104895:	48 b8 78 1f 02 00 00 	movabs $0x21f78,%rax
ffff80000010489c:	00 00 00 
ffff80000010489f:	48 89 94 03 e0 02 00 	mov    %rdx,0x2e0(%rbx,%rax,1)
ffff8000001048a6:	00 
ffff8000001048a7:	48 b8 c0 ff ff ff ff 	movabs $0xffffffffffffffc0,%rax
ffff8000001048ae:	ff ff ff 
ffff8000001048b1:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001048b5:	48 89 c2             	mov    %rax,%rdx
ffff8000001048b8:	48 b8 78 1f 02 00 00 	movabs $0x21f78,%rax
ffff8000001048bf:	00 00 00 
ffff8000001048c2:	48 89 94 03 e8 02 00 	mov    %rdx,0x2e8(%rbx,%rax,1)
ffff8000001048c9:	00 
ffff8000001048ca:	49 89 df             	mov    %rbx,%r15
ffff8000001048cd:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001048d2:	48 ba 66 79 ff ff ff 	movabs $0xffffffffffff7966,%rdx
ffff8000001048d9:	ff ff ff 
ffff8000001048dc:	48 01 da             	add    %rbx,%rdx
ffff8000001048df:	ff d2                	callq  *%rdx
ffff8000001048e1:	49 89 df             	mov    %rbx,%r15
ffff8000001048e4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001048e9:	48 ba 34 be ff ff ff 	movabs $0xffffffffffffbe34,%rdx
ffff8000001048f0:	ff ff ff 
ffff8000001048f3:	48 01 da             	add    %rbx,%rdx
ffff8000001048f6:	ff d2                	callq  *%rdx
ffff8000001048f8:	49 89 df             	mov    %rbx,%r15
ffff8000001048fb:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000104900:	48 ba 01 ad ff ff ff 	movabs $0xffffffffffffad01,%rdx
ffff800000104907:	ff ff ff 
ffff80000010490a:	48 01 da             	add    %rbx,%rdx
ffff80000010490d:	ff d2                	callq  *%rdx
ffff80000010490f:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000104916:	00 
ffff800000104917:	48 b8 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rax
ffff80000010491e:	ff ff ff 
ffff800000104921:	48 8b 84 03 48 02 00 	mov    0x248(%rbx,%rax,1),%rax
ffff800000104928:	00 
ffff800000104929:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff80000010492d:	48 8b 00             	mov    (%rax),%rax
ffff800000104930:	48 89 c1             	mov    %rax,%rcx
ffff800000104933:	48 b8 80 10 00 00 00 	movabs $0x1080,%rax
ffff80000010493a:	00 00 00 
ffff80000010493d:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000104941:	be 00 ff ff 00       	mov    $0xffff00,%esi
ffff800000104946:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010494b:	49 89 df             	mov    %rbx,%r15
ffff80000010494e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000104953:	49 b8 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r8
ffff80000010495a:	ff ff ff 
ffff80000010495d:	49 01 d8             	add    %rbx,%r8
ffff800000104960:	41 ff d0             	callq  *%r8
ffff800000104963:	48 b8 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rax
ffff80000010496a:	ff ff ff 
ffff80000010496d:	48 8b 84 03 30 02 00 	mov    0x230(%rbx,%rax,1),%rax
ffff800000104974:	00 
ffff800000104975:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010497a:	48 89 c7             	mov    %rax,%rdi
ffff80000010497d:	49 89 df             	mov    %rbx,%r15
ffff800000104980:	48 b8 3e 8c ff ff ff 	movabs $0xffffffffffff8c3e,%rax
ffff800000104987:	ff ff ff 
ffff80000010498a:	48 01 d8             	add    %rbx,%rax
ffff80000010498d:	ff d0                	callq  *%rax
ffff80000010498f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000104993:	48 b8 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rax
ffff80000010499a:	ff ff ff 
ffff80000010499d:	48 8b 84 03 48 02 00 	mov    0x248(%rbx,%rax,1),%rax
ffff8000001049a4:	00 
ffff8000001049a5:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff8000001049a9:	48 8b 00             	mov    (%rax),%rax
ffff8000001049ac:	48 89 c1             	mov    %rax,%rcx
ffff8000001049af:	48 b8 a0 10 00 00 00 	movabs $0x10a0,%rax
ffff8000001049b6:	00 00 00 
ffff8000001049b9:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001049bd:	be 00 ff ff 00       	mov    $0xffff00,%esi
ffff8000001049c2:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001049c7:	49 89 df             	mov    %rbx,%r15
ffff8000001049ca:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001049cf:	49 b8 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r8
ffff8000001049d6:	ff ff ff 
ffff8000001049d9:	49 01 d8             	add    %rbx,%r8
ffff8000001049dc:	41 ff d0             	callq  *%r8
ffff8000001049df:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001049e3:	48 89 c7             	mov    %rax,%rdi
ffff8000001049e6:	49 89 df             	mov    %rbx,%r15
ffff8000001049e9:	48 b8 dc 96 ff ff ff 	movabs $0xffffffffffff96dc,%rax
ffff8000001049f0:	ff ff ff 
ffff8000001049f3:	48 01 d8             	add    %rbx,%rax
ffff8000001049f6:	ff d0                	callq  *%rax
ffff8000001049f8:	48 b8 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rax
ffff8000001049ff:	ff ff ff 
ffff800000104a02:	48 8b 84 03 48 02 00 	mov    0x248(%rbx,%rax,1),%rax
ffff800000104a09:	00 
ffff800000104a0a:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff800000104a0e:	48 8b 00             	mov    (%rax),%rax
ffff800000104a11:	48 89 c1             	mov    %rax,%rcx
ffff800000104a14:	48 b8 bf 10 00 00 00 	movabs $0x10bf,%rax
ffff800000104a1b:	00 00 00 
ffff800000104a1e:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000104a22:	be 00 ff ff 00       	mov    $0xffff00,%esi
ffff800000104a27:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000104a2c:	49 89 df             	mov    %rbx,%r15
ffff800000104a2f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000104a34:	49 b8 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r8
ffff800000104a3b:	ff ff ff 
ffff800000104a3e:	49 01 d8             	add    %rbx,%r8
ffff800000104a41:	41 ff d0             	callq  *%r8
ffff800000104a44:	eb fe                	jmp    ffff800000104a44 <Start_Kernel+0x36c>

ffff800000104a46 <putchar>:
ffff800000104a46:	55                   	push   %rbp
ffff800000104a47:	48 89 e5             	mov    %rsp,%rbp
ffff800000104a4a:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000104a4a <putchar+0x4>
ffff800000104a51:	49 bb 9e a7 00 00 00 	movabs $0xa79e,%r11
ffff800000104a58:	00 00 00 
ffff800000104a5b:	4c 01 d8             	add    %r11,%rax
ffff800000104a5e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000104a62:	89 75 d4             	mov    %esi,-0x2c(%rbp)
ffff800000104a65:	89 55 d0             	mov    %edx,-0x30(%rbp)
ffff800000104a68:	89 4d cc             	mov    %ecx,-0x34(%rbp)
ffff800000104a6b:	44 89 45 c8          	mov    %r8d,-0x38(%rbp)
ffff800000104a6f:	44 89 4d c4          	mov    %r9d,-0x3c(%rbp)
ffff800000104a73:	8b 55 10             	mov    0x10(%rbp),%edx
ffff800000104a76:	88 55 c0             	mov    %dl,-0x40(%rbp)
ffff800000104a79:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff800000104a80:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff800000104a87:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
ffff800000104a8e:	00 
ffff800000104a8f:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000104a96:	00 
ffff800000104a97:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
ffff800000104a9e:	0f b6 55 c0          	movzbl -0x40(%rbp),%edx
ffff800000104aa2:	48 63 d2             	movslq %edx,%rdx
ffff800000104aa5:	48 89 d1             	mov    %rdx,%rcx
ffff800000104aa8:	48 c1 e1 04          	shl    $0x4,%rcx
ffff800000104aac:	48 ba f8 e7 ff ff ff 	movabs $0xffffffffffffe7f8,%rdx
ffff800000104ab3:	ff ff ff 
ffff800000104ab6:	48 8d 04 10          	lea    (%rax,%rdx,1),%rax
ffff800000104aba:	48 01 c8             	add    %rcx,%rax
ffff800000104abd:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000104ac1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff800000104ac8:	eb 7a                	jmp    ffff800000104b44 <putchar+0xfe>
ffff800000104aca:	8b 55 cc             	mov    -0x34(%rbp),%edx
ffff800000104acd:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000104ad0:	01 d0                	add    %edx,%eax
ffff800000104ad2:	0f af 45 d4          	imul   -0x2c(%rbp),%eax
ffff800000104ad6:	48 63 d0             	movslq %eax,%rdx
ffff800000104ad9:	8b 45 d0             	mov    -0x30(%rbp),%eax
ffff800000104adc:	48 98                	cltq   
ffff800000104ade:	48 01 d0             	add    %rdx,%rax
ffff800000104ae1:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
ffff800000104ae8:	00 
ffff800000104ae9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000104aed:	48 01 d0             	add    %rdx,%rax
ffff800000104af0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff800000104af4:	c7 45 e4 00 01 00 00 	movl   $0x100,-0x1c(%rbp)
ffff800000104afb:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff800000104b02:	eb 31                	jmp    ffff800000104b35 <putchar+0xef>
ffff800000104b04:	d1 7d e4             	sarl   -0x1c(%rbp)
ffff800000104b07:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104b0b:	0f b6 00             	movzbl (%rax),%eax
ffff800000104b0e:	0f b6 c0             	movzbl %al,%eax
ffff800000104b11:	23 45 e4             	and    -0x1c(%rbp),%eax
ffff800000104b14:	85 c0                	test   %eax,%eax
ffff800000104b16:	74 0b                	je     ffff800000104b23 <putchar+0xdd>
ffff800000104b18:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000104b1c:	8b 55 c8             	mov    -0x38(%rbp),%edx
ffff800000104b1f:	89 10                	mov    %edx,(%rax)
ffff800000104b21:	eb 09                	jmp    ffff800000104b2c <putchar+0xe6>
ffff800000104b23:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000104b27:	8b 55 c4             	mov    -0x3c(%rbp),%edx
ffff800000104b2a:	89 10                	mov    %edx,(%rax)
ffff800000104b2c:	48 83 45 f0 04       	addq   $0x4,-0x10(%rbp)
ffff800000104b31:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
ffff800000104b35:	83 7d f8 07          	cmpl   $0x7,-0x8(%rbp)
ffff800000104b39:	7e c9                	jle    ffff800000104b04 <putchar+0xbe>
ffff800000104b3b:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
ffff800000104b40:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff800000104b44:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
ffff800000104b48:	7e 80                	jle    ffff800000104aca <putchar+0x84>
ffff800000104b4a:	90                   	nop
ffff800000104b4b:	5d                   	pop    %rbp
ffff800000104b4c:	c3                   	retq   

ffff800000104b4d <dec2hex>:
ffff800000104b4d:	55                   	push   %rbp
ffff800000104b4e:	48 89 e5             	mov    %rsp,%rbp
ffff800000104b51:	48 81 ec 78 01 00 00 	sub    $0x178,%rsp
ffff800000104b58:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000104b58 <dec2hex+0xb>
ffff800000104b5f:	49 bb 90 a6 00 00 00 	movabs $0xa690,%r11
ffff800000104b66:	00 00 00 
ffff800000104b69:	4c 01 d8             	add    %r11,%rax
ffff800000104b6c:	48 89 bd 18 fe ff ff 	mov    %rdi,-0x1e8(%rbp)
ffff800000104b73:	89 b5 14 fe ff ff    	mov    %esi,-0x1ec(%rbp)
ffff800000104b79:	c6 45 b0 30          	movb   $0x30,-0x50(%rbp)
ffff800000104b7d:	c6 45 b1 31          	movb   $0x31,-0x4f(%rbp)
ffff800000104b81:	c6 45 b2 32          	movb   $0x32,-0x4e(%rbp)
ffff800000104b85:	c6 45 b3 33          	movb   $0x33,-0x4d(%rbp)
ffff800000104b89:	c6 45 b4 34          	movb   $0x34,-0x4c(%rbp)
ffff800000104b8d:	c6 45 b5 35          	movb   $0x35,-0x4b(%rbp)
ffff800000104b91:	c6 45 b6 36          	movb   $0x36,-0x4a(%rbp)
ffff800000104b95:	c6 45 b7 37          	movb   $0x37,-0x49(%rbp)
ffff800000104b99:	c6 45 b8 38          	movb   $0x38,-0x48(%rbp)
ffff800000104b9d:	c6 45 b9 39          	movb   $0x39,-0x47(%rbp)
ffff800000104ba1:	c6 45 ba 41          	movb   $0x41,-0x46(%rbp)
ffff800000104ba5:	c6 45 bb 42          	movb   $0x42,-0x45(%rbp)
ffff800000104ba9:	c6 45 bc 43          	movb   $0x43,-0x44(%rbp)
ffff800000104bad:	c6 45 bd 44          	movb   $0x44,-0x43(%rbp)
ffff800000104bb1:	c6 45 be 45          	movb   $0x45,-0x42(%rbp)
ffff800000104bb5:	c6 45 bf 46          	movb   $0x46,-0x41(%rbp)
ffff800000104bb9:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff800000104bc0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff800000104bc7:	eb 40                	jmp    ffff800000104c09 <dec2hex+0xbc>
ffff800000104bc9:	8b 85 14 fe ff ff    	mov    -0x1ec(%rbp),%eax
ffff800000104bcf:	99                   	cltd   
ffff800000104bd0:	c1 ea 1c             	shr    $0x1c,%edx
ffff800000104bd3:	01 d0                	add    %edx,%eax
ffff800000104bd5:	83 e0 0f             	and    $0xf,%eax
ffff800000104bd8:	29 d0                	sub    %edx,%eax
ffff800000104bda:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff800000104bdd:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000104be0:	8d 50 01             	lea    0x1(%rax),%edx
ffff800000104be3:	89 55 fc             	mov    %edx,-0x4(%rbp)
ffff800000104be6:	48 98                	cltq   
ffff800000104be8:	8b 55 f4             	mov    -0xc(%rbp),%edx
ffff800000104beb:	89 94 85 20 fe ff ff 	mov    %edx,-0x1e0(%rbp,%rax,4)
ffff800000104bf2:	8b 85 14 fe ff ff    	mov    -0x1ec(%rbp),%eax
ffff800000104bf8:	8d 50 0f             	lea    0xf(%rax),%edx
ffff800000104bfb:	85 c0                	test   %eax,%eax
ffff800000104bfd:	0f 48 c2             	cmovs  %edx,%eax
ffff800000104c00:	c1 f8 04             	sar    $0x4,%eax
ffff800000104c03:	89 85 14 fe ff ff    	mov    %eax,-0x1ec(%rbp)
ffff800000104c09:	83 bd 14 fe ff ff 00 	cmpl   $0x0,-0x1ec(%rbp)
ffff800000104c10:	7f b7                	jg     ffff800000104bc9 <dec2hex+0x7c>
ffff800000104c12:	83 6d fc 01          	subl   $0x1,-0x4(%rbp)
ffff800000104c16:	eb 2c                	jmp    ffff800000104c44 <dec2hex+0xf7>
ffff800000104c18:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000104c1b:	48 98                	cltq   
ffff800000104c1d:	8b 8c 85 20 fe ff ff 	mov    -0x1e0(%rbp,%rax,4),%ecx
ffff800000104c24:	48 8b 85 18 fe ff ff 	mov    -0x1e8(%rbp),%rax
ffff800000104c2b:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104c2f:	48 89 95 18 fe ff ff 	mov    %rdx,-0x1e8(%rbp)
ffff800000104c36:	48 63 d1             	movslq %ecx,%rdx
ffff800000104c39:	0f b6 54 15 b0       	movzbl -0x50(%rbp,%rdx,1),%edx
ffff800000104c3e:	88 10                	mov    %dl,(%rax)
ffff800000104c40:	83 6d fc 01          	subl   $0x1,-0x4(%rbp)
ffff800000104c44:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
ffff800000104c48:	79 ce                	jns    ffff800000104c18 <dec2hex+0xcb>
ffff800000104c4a:	48 8b 85 18 fe ff ff 	mov    -0x1e8(%rbp),%rax
ffff800000104c51:	c9                   	leaveq 
ffff800000104c52:	c3                   	retq   

ffff800000104c53 <vsprintf>:
ffff800000104c53:	55                   	push   %rbp
ffff800000104c54:	48 89 e5             	mov    %rsp,%rbp
ffff800000104c57:	53                   	push   %rbx
ffff800000104c58:	48 83 ec 40          	sub    $0x40,%rsp
ffff800000104c5c:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000104c5c <vsprintf+0x9>
ffff800000104c63:	49 bb 8c a5 00 00 00 	movabs $0xa58c,%r11
ffff800000104c6a:	00 00 00 
ffff800000104c6d:	4c 01 db             	add    %r11,%rbx
ffff800000104c70:	48 89 7d c0          	mov    %rdi,-0x40(%rbp)
ffff800000104c74:	48 89 75 b8          	mov    %rsi,-0x48(%rbp)
ffff800000104c78:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
ffff800000104c7f:	48 b8 98 8e 01 00 00 	movabs $0x18e98,%rax
ffff800000104c86:	00 00 00 
ffff800000104c89:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000104c8d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000104c91:	e9 56 03 00 00       	jmpq   ffff800000104fec <vsprintf+0x399>
ffff800000104c96:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104c9a:	0f b6 00             	movzbl (%rax),%eax
ffff800000104c9d:	3c 25                	cmp    $0x25,%al
ffff800000104c9f:	74 17                	je     ffff800000104cb8 <vsprintf+0x65>
ffff800000104ca1:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104ca5:	0f b6 10             	movzbl (%rax),%edx
ffff800000104ca8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104cac:	88 10                	mov    %dl,(%rax)
ffff800000104cae:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
ffff800000104cb3:	e9 2f 03 00 00       	jmpq   ffff800000104fe7 <vsprintf+0x394>
ffff800000104cb8:	48 83 45 c0 01       	addq   $0x1,-0x40(%rbp)
ffff800000104cbd:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104cc1:	0f b6 00             	movzbl (%rax),%eax
ffff800000104cc4:	3c 64                	cmp    $0x64,%al
ffff800000104cc6:	0f 85 45 01 00 00    	jne    ffff800000104e11 <vsprintf+0x1be>
ffff800000104ccc:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104cd0:	8b 00                	mov    (%rax),%eax
ffff800000104cd2:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104cd5:	77 24                	ja     ffff800000104cfb <vsprintf+0xa8>
ffff800000104cd7:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104cdb:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104cdf:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104ce3:	8b 00                	mov    (%rax),%eax
ffff800000104ce5:	89 c0                	mov    %eax,%eax
ffff800000104ce7:	48 01 d0             	add    %rdx,%rax
ffff800000104cea:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104cee:	8b 12                	mov    (%rdx),%edx
ffff800000104cf0:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104cf3:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104cf7:	89 0a                	mov    %ecx,(%rdx)
ffff800000104cf9:	eb 14                	jmp    ffff800000104d0f <vsprintf+0xbc>
ffff800000104cfb:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104cff:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104d03:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104d07:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104d0b:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104d0f:	8b 00                	mov    (%rax),%eax
ffff800000104d11:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff800000104d14:	8b 4d f4             	mov    -0xc(%rbp),%ecx
ffff800000104d17:	ba 67 66 66 66       	mov    $0x66666667,%edx
ffff800000104d1c:	89 c8                	mov    %ecx,%eax
ffff800000104d1e:	f7 ea                	imul   %edx
ffff800000104d20:	c1 fa 02             	sar    $0x2,%edx
ffff800000104d23:	89 c8                	mov    %ecx,%eax
ffff800000104d25:	c1 f8 1f             	sar    $0x1f,%eax
ffff800000104d28:	29 c2                	sub    %eax,%edx
ffff800000104d2a:	89 d0                	mov    %edx,%eax
ffff800000104d2c:	c1 e0 02             	shl    $0x2,%eax
ffff800000104d2f:	01 d0                	add    %edx,%eax
ffff800000104d31:	01 c0                	add    %eax,%eax
ffff800000104d33:	29 c1                	sub    %eax,%ecx
ffff800000104d35:	89 ca                	mov    %ecx,%edx
ffff800000104d37:	89 d0                	mov    %edx,%eax
ffff800000104d39:	8d 48 30             	lea    0x30(%rax),%ecx
ffff800000104d3c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104d40:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104d44:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104d48:	89 ca                	mov    %ecx,%edx
ffff800000104d4a:	88 10                	mov    %dl,(%rax)
ffff800000104d4c:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
ffff800000104d50:	8b 4d f4             	mov    -0xc(%rbp),%ecx
ffff800000104d53:	ba 67 66 66 66       	mov    $0x66666667,%edx
ffff800000104d58:	89 c8                	mov    %ecx,%eax
ffff800000104d5a:	f7 ea                	imul   %edx
ffff800000104d5c:	c1 fa 02             	sar    $0x2,%edx
ffff800000104d5f:	89 c8                	mov    %ecx,%eax
ffff800000104d61:	c1 f8 1f             	sar    $0x1f,%eax
ffff800000104d64:	29 c2                	sub    %eax,%edx
ffff800000104d66:	89 d0                	mov    %edx,%eax
ffff800000104d68:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff800000104d6b:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
ffff800000104d6f:	75 a3                	jne    ffff800000104d14 <vsprintf+0xc1>
ffff800000104d71:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104d75:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff800000104d79:	eb 6c                	jmp    ffff800000104de7 <vsprintf+0x194>
ffff800000104d7b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000104d7f:	0f b6 00             	movzbl (%rax),%eax
ffff800000104d82:	88 45 cf             	mov    %al,-0x31(%rbp)
ffff800000104d85:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000104d89:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000104d8d:	48 29 c2             	sub    %rax,%rdx
ffff800000104d90:	48 89 d0             	mov    %rdx,%rax
ffff800000104d93:	48 89 c2             	mov    %rax,%rdx
ffff800000104d96:	8b 45 f0             	mov    -0x10(%rbp),%eax
ffff800000104d99:	48 98                	cltq   
ffff800000104d9b:	48 29 c2             	sub    %rax,%rdx
ffff800000104d9e:	48 89 d0             	mov    %rdx,%rax
ffff800000104da1:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff800000104da5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104da9:	48 01 d0             	add    %rdx,%rax
ffff800000104dac:	0f b6 10             	movzbl (%rax),%edx
ffff800000104daf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000104db3:	88 10                	mov    %dl,(%rax)
ffff800000104db5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000104db9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000104dbd:	48 29 c2             	sub    %rax,%rdx
ffff800000104dc0:	48 89 d0             	mov    %rdx,%rax
ffff800000104dc3:	48 89 c2             	mov    %rax,%rdx
ffff800000104dc6:	8b 45 f0             	mov    -0x10(%rbp),%eax
ffff800000104dc9:	48 98                	cltq   
ffff800000104dcb:	48 29 c2             	sub    %rax,%rdx
ffff800000104dce:	48 89 d0             	mov    %rdx,%rax
ffff800000104dd1:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff800000104dd5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104dd9:	48 01 c2             	add    %rax,%rdx
ffff800000104ddc:	0f b6 45 cf          	movzbl -0x31(%rbp),%eax
ffff800000104de0:	88 02                	mov    %al,(%rdx)
ffff800000104de2:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
ffff800000104de7:	8b 45 f0             	mov    -0x10(%rbp),%eax
ffff800000104dea:	89 c2                	mov    %eax,%edx
ffff800000104dec:	c1 ea 1f             	shr    $0x1f,%edx
ffff800000104def:	01 d0                	add    %edx,%eax
ffff800000104df1:	d1 f8                	sar    %eax
ffff800000104df3:	48 98                	cltq   
ffff800000104df5:	48 f7 d8             	neg    %rax
ffff800000104df8:	48 89 c2             	mov    %rax,%rdx
ffff800000104dfb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104dff:	48 01 d0             	add    %rdx,%rax
ffff800000104e02:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
ffff800000104e06:	0f 83 6f ff ff ff    	jae    ffff800000104d7b <vsprintf+0x128>
ffff800000104e0c:	e9 d6 01 00 00       	jmpq   ffff800000104fe7 <vsprintf+0x394>
ffff800000104e11:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104e15:	0f b6 00             	movzbl (%rax),%eax
ffff800000104e18:	3c 63                	cmp    $0x63,%al
ffff800000104e1a:	75 5a                	jne    ffff800000104e76 <vsprintf+0x223>
ffff800000104e1c:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104e20:	8b 00                	mov    (%rax),%eax
ffff800000104e22:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104e25:	77 24                	ja     ffff800000104e4b <vsprintf+0x1f8>
ffff800000104e27:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104e2b:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104e2f:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104e33:	8b 00                	mov    (%rax),%eax
ffff800000104e35:	89 c0                	mov    %eax,%eax
ffff800000104e37:	48 01 d0             	add    %rdx,%rax
ffff800000104e3a:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104e3e:	8b 12                	mov    (%rdx),%edx
ffff800000104e40:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104e43:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104e47:	89 0a                	mov    %ecx,(%rdx)
ffff800000104e49:	eb 14                	jmp    ffff800000104e5f <vsprintf+0x20c>
ffff800000104e4b:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104e4f:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104e53:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104e57:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104e5b:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104e5f:	8b 08                	mov    (%rax),%ecx
ffff800000104e61:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104e65:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104e69:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104e6d:	89 ca                	mov    %ecx,%edx
ffff800000104e6f:	88 10                	mov    %dl,(%rax)
ffff800000104e71:	e9 71 01 00 00       	jmpq   ffff800000104fe7 <vsprintf+0x394>
ffff800000104e76:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104e7a:	0f b6 00             	movzbl (%rax),%eax
ffff800000104e7d:	3c 73                	cmp    $0x73,%al
ffff800000104e7f:	0f 85 8f 00 00 00    	jne    ffff800000104f14 <vsprintf+0x2c1>
ffff800000104e85:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104e89:	8b 00                	mov    (%rax),%eax
ffff800000104e8b:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104e8e:	77 24                	ja     ffff800000104eb4 <vsprintf+0x261>
ffff800000104e90:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104e94:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104e98:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104e9c:	8b 00                	mov    (%rax),%eax
ffff800000104e9e:	89 c0                	mov    %eax,%eax
ffff800000104ea0:	48 01 d0             	add    %rdx,%rax
ffff800000104ea3:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104ea7:	8b 12                	mov    (%rdx),%edx
ffff800000104ea9:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104eac:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104eb0:	89 0a                	mov    %ecx,(%rdx)
ffff800000104eb2:	eb 14                	jmp    ffff800000104ec8 <vsprintf+0x275>
ffff800000104eb4:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104eb8:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104ebc:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104ec0:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104ec4:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104ec8:	48 8b 00             	mov    (%rax),%rax
ffff800000104ecb:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff800000104ecf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000104ed3:	0f b6 00             	movzbl (%rax),%eax
ffff800000104ed6:	84 c0                	test   %al,%al
ffff800000104ed8:	0f 84 08 01 00 00    	je     ffff800000104fe6 <vsprintf+0x393>
ffff800000104ede:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000104ee2:	0f b6 10             	movzbl (%rax),%edx
ffff800000104ee5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104ee9:	88 10                	mov    %dl,(%rax)
ffff800000104eeb:	eb 17                	jmp    ffff800000104f04 <vsprintf+0x2b1>
ffff800000104eed:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000104ef1:	0f b6 10             	movzbl (%rax),%edx
ffff800000104ef4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104ef8:	88 10                	mov    %dl,(%rax)
ffff800000104efa:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
ffff800000104eff:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
ffff800000104f04:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000104f08:	0f b6 00             	movzbl (%rax),%eax
ffff800000104f0b:	84 c0                	test   %al,%al
ffff800000104f0d:	75 de                	jne    ffff800000104eed <vsprintf+0x29a>
ffff800000104f0f:	e9 d3 00 00 00       	jmpq   ffff800000104fe7 <vsprintf+0x394>
ffff800000104f14:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104f18:	0f b6 00             	movzbl (%rax),%eax
ffff800000104f1b:	3c 78                	cmp    $0x78,%al
ffff800000104f1d:	0f 85 c4 00 00 00    	jne    ffff800000104fe7 <vsprintf+0x394>
ffff800000104f23:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104f27:	8b 00                	mov    (%rax),%eax
ffff800000104f29:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104f2c:	77 24                	ja     ffff800000104f52 <vsprintf+0x2ff>
ffff800000104f2e:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104f32:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104f36:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104f3a:	8b 00                	mov    (%rax),%eax
ffff800000104f3c:	89 c0                	mov    %eax,%eax
ffff800000104f3e:	48 01 d0             	add    %rdx,%rax
ffff800000104f41:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104f45:	8b 12                	mov    (%rdx),%edx
ffff800000104f47:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104f4a:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104f4e:	89 0a                	mov    %ecx,(%rdx)
ffff800000104f50:	eb 14                	jmp    ffff800000104f66 <vsprintf+0x313>
ffff800000104f52:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104f56:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104f5a:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104f5e:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104f62:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104f66:	48 8b 00             	mov    (%rax),%rax
ffff800000104f69:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff800000104f6d:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
ffff800000104f72:	75 2f                	jne    ffff800000104fa3 <vsprintf+0x350>
ffff800000104f74:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104f78:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104f7c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104f80:	c6 00 30             	movb   $0x30,(%rax)
ffff800000104f83:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104f87:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104f8b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104f8f:	c6 00 78             	movb   $0x78,(%rax)
ffff800000104f92:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104f96:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104f9a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104f9e:	c6 00 30             	movb   $0x30,(%rax)
ffff800000104fa1:	eb 44                	jmp    ffff800000104fe7 <vsprintf+0x394>
ffff800000104fa3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104fa7:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104fab:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104faf:	c6 00 30             	movb   $0x30,(%rax)
ffff800000104fb2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104fb6:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104fba:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104fbe:	c6 00 78             	movb   $0x78,(%rax)
ffff800000104fc1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000104fc5:	89 c2                	mov    %eax,%edx
ffff800000104fc7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104fcb:	89 d6                	mov    %edx,%esi
ffff800000104fcd:	48 89 c7             	mov    %rax,%rdi
ffff800000104fd0:	48 b8 65 59 ff ff ff 	movabs $0xffffffffffff5965,%rax
ffff800000104fd7:	ff ff ff 
ffff800000104fda:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000104fde:	ff d0                	callq  *%rax
ffff800000104fe0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000104fe4:	eb 01                	jmp    ffff800000104fe7 <vsprintf+0x394>
ffff800000104fe6:	90                   	nop
ffff800000104fe7:	48 83 45 c0 01       	addq   $0x1,-0x40(%rbp)
ffff800000104fec:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104ff0:	0f b6 00             	movzbl (%rax),%eax
ffff800000104ff3:	84 c0                	test   %al,%al
ffff800000104ff5:	0f 85 9b fc ff ff    	jne    ffff800000104c96 <vsprintf+0x43>
ffff800000104ffb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000104fff:	48 b8 98 8e 01 00 00 	movabs $0x18e98,%rax
ffff800000105006:	00 00 00 
ffff800000105009:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff80000010500d:	48 29 c2             	sub    %rax,%rdx
ffff800000105010:	48 89 d0             	mov    %rdx,%rax
ffff800000105013:	48 83 c4 40          	add    $0x40,%rsp
ffff800000105017:	5b                   	pop    %rbx
ffff800000105018:	5d                   	pop    %rbp
ffff800000105019:	c3                   	retq   

ffff80000010501a <printk>:
ffff80000010501a:	55                   	push   %rbp
ffff80000010501b:	48 89 e5             	mov    %rsp,%rbp
ffff80000010501e:	53                   	push   %rbx
ffff80000010501f:	48 81 ec e8 00 00 00 	sub    $0xe8,%rsp
ffff800000105026:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000105026 <printk+0xc>
ffff80000010502d:	49 bb c2 a1 00 00 00 	movabs $0xa1c2,%r11
ffff800000105034:	00 00 00 
ffff800000105037:	4c 01 db             	add    %r11,%rbx
ffff80000010503a:	89 bd 1c ff ff ff    	mov    %edi,-0xe4(%rbp)
ffff800000105040:	89 b5 18 ff ff ff    	mov    %esi,-0xe8(%rbp)
ffff800000105046:	48 89 95 10 ff ff ff 	mov    %rdx,-0xf0(%rbp)
ffff80000010504d:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
ffff800000105054:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
ffff80000010505b:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
ffff800000105062:	84 c0                	test   %al,%al
ffff800000105064:	74 23                	je     ffff800000105089 <printk+0x6f>
ffff800000105066:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
ffff80000010506d:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
ffff800000105071:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
ffff800000105075:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
ffff800000105079:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
ffff80000010507d:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
ffff800000105081:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
ffff800000105085:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
ffff800000105089:	c7 85 20 ff ff ff 18 	movl   $0x18,-0xe0(%rbp)
ffff800000105090:	00 00 00 
ffff800000105093:	c7 85 24 ff ff ff 30 	movl   $0x30,-0xdc(%rbp)
ffff80000010509a:	00 00 00 
ffff80000010509d:	48 8d 45 10          	lea    0x10(%rbp),%rax
ffff8000001050a1:	48 89 85 28 ff ff ff 	mov    %rax,-0xd8(%rbp)
ffff8000001050a8:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
ffff8000001050af:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
ffff8000001050b6:	48 8d 95 20 ff ff ff 	lea    -0xe0(%rbp),%rdx
ffff8000001050bd:	48 8b 85 10 ff ff ff 	mov    -0xf0(%rbp),%rax
ffff8000001050c4:	48 89 d6             	mov    %rdx,%rsi
ffff8000001050c7:	48 89 c7             	mov    %rax,%rdi
ffff8000001050ca:	48 b8 6b 5a ff ff ff 	movabs $0xffffffffffff5a6b,%rax
ffff8000001050d1:	ff ff ff 
ffff8000001050d4:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001050d8:	ff d0                	callq  *%rax
ffff8000001050da:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%rbp)
ffff8000001050e0:	c7 85 3c ff ff ff 00 	movl   $0x0,-0xc4(%rbp)
ffff8000001050e7:	00 00 00 
ffff8000001050ea:	e9 ac 02 00 00       	jmpq   ffff80000010539b <printk+0x381>
ffff8000001050ef:	8b 85 3c ff ff ff    	mov    -0xc4(%rbp),%eax
ffff8000001050f5:	48 63 d0             	movslq %eax,%rdx
ffff8000001050f8:	48 b8 98 8e 01 00 00 	movabs $0x18e98,%rax
ffff8000001050ff:	00 00 00 
ffff800000105102:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000105106:	48 01 d0             	add    %rdx,%rax
ffff800000105109:	0f b6 00             	movzbl (%rax),%eax
ffff80000010510c:	3c 0a                	cmp    $0xa,%al
ffff80000010510e:	75 36                	jne    ffff800000105146 <printk+0x12c>
ffff800000105110:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff800000105117:	00 00 00 
ffff80000010511a:	8b 44 03 0c          	mov    0xc(%rbx,%rax,1),%eax
ffff80000010511e:	8d 50 01             	lea    0x1(%rax),%edx
ffff800000105121:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff800000105128:	00 00 00 
ffff80000010512b:	89 54 03 0c          	mov    %edx,0xc(%rbx,%rax,1)
ffff80000010512f:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff800000105136:	00 00 00 
ffff800000105139:	c7 44 03 08 00 00 00 	movl   $0x0,0x8(%rbx,%rax,1)
ffff800000105140:	00 
ffff800000105141:	e9 4e 02 00 00       	jmpq   ffff800000105394 <printk+0x37a>
ffff800000105146:	8b 85 3c ff ff ff    	mov    -0xc4(%rbp),%eax
ffff80000010514c:	48 63 d0             	movslq %eax,%rdx
ffff80000010514f:	48 b8 98 8e 01 00 00 	movabs $0x18e98,%rax
ffff800000105156:	00 00 00 
ffff800000105159:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff80000010515d:	48 01 d0             	add    %rdx,%rax
ffff800000105160:	0f b6 00             	movzbl (%rax),%eax
ffff800000105163:	3c 08                	cmp    $0x8,%al
ffff800000105165:	0f 85 68 01 00 00    	jne    ffff8000001052d3 <printk+0x2b9>
ffff80000010516b:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff800000105172:	00 00 00 
ffff800000105175:	8b 44 03 08          	mov    0x8(%rbx,%rax,1),%eax
ffff800000105179:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff80000010517c:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff800000105183:	00 00 00 
ffff800000105186:	89 54 03 08          	mov    %edx,0x8(%rbx,%rax,1)
ffff80000010518a:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff800000105191:	00 00 00 
ffff800000105194:	8b 44 03 08          	mov    0x8(%rbx,%rax,1),%eax
ffff800000105198:	85 c0                	test   %eax,%eax
ffff80000010519a:	0f 89 b2 00 00 00    	jns    ffff800000105252 <printk+0x238>
ffff8000001051a0:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff8000001051a7:	00 00 00 
ffff8000001051aa:	8b 04 03             	mov    (%rbx,%rax,1),%eax
ffff8000001051ad:	48 ba 38 9f 01 00 00 	movabs $0x19f38,%rdx
ffff8000001051b4:	00 00 00 
ffff8000001051b7:	8b 7c 13 10          	mov    0x10(%rbx,%rdx,1),%edi
ffff8000001051bb:	99                   	cltd   
ffff8000001051bc:	f7 ff                	idiv   %edi
ffff8000001051be:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff8000001051c1:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff8000001051c8:	00 00 00 
ffff8000001051cb:	8b 44 03 10          	mov    0x10(%rbx,%rax,1),%eax
ffff8000001051cf:	0f af d0             	imul   %eax,%edx
ffff8000001051d2:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff8000001051d9:	00 00 00 
ffff8000001051dc:	89 54 03 08          	mov    %edx,0x8(%rbx,%rax,1)
ffff8000001051e0:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff8000001051e7:	00 00 00 
ffff8000001051ea:	8b 44 03 0c          	mov    0xc(%rbx,%rax,1),%eax
ffff8000001051ee:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff8000001051f1:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff8000001051f8:	00 00 00 
ffff8000001051fb:	89 54 03 0c          	mov    %edx,0xc(%rbx,%rax,1)
ffff8000001051ff:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff800000105206:	00 00 00 
ffff800000105209:	8b 44 03 0c          	mov    0xc(%rbx,%rax,1),%eax
ffff80000010520d:	85 c0                	test   %eax,%eax
ffff80000010520f:	79 41                	jns    ffff800000105252 <printk+0x238>
ffff800000105211:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff800000105218:	00 00 00 
ffff80000010521b:	8b 44 03 04          	mov    0x4(%rbx,%rax,1),%eax
ffff80000010521f:	48 ba 38 9f 01 00 00 	movabs $0x19f38,%rdx
ffff800000105226:	00 00 00 
ffff800000105229:	8b 74 13 14          	mov    0x14(%rbx,%rdx,1),%esi
ffff80000010522d:	99                   	cltd   
ffff80000010522e:	f7 fe                	idiv   %esi
ffff800000105230:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff800000105233:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff80000010523a:	00 00 00 
ffff80000010523d:	8b 44 03 14          	mov    0x14(%rbx,%rax,1),%eax
ffff800000105241:	0f af d0             	imul   %eax,%edx
ffff800000105244:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff80000010524b:	00 00 00 
ffff80000010524e:	89 54 03 0c          	mov    %edx,0xc(%rbx,%rax,1)
ffff800000105252:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff800000105259:	00 00 00 
ffff80000010525c:	8b 54 03 0c          	mov    0xc(%rbx,%rax,1),%edx
ffff800000105260:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff800000105267:	00 00 00 
ffff80000010526a:	8b 44 03 14          	mov    0x14(%rbx,%rax,1),%eax
ffff80000010526e:	89 d1                	mov    %edx,%ecx
ffff800000105270:	0f af c8             	imul   %eax,%ecx
ffff800000105273:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff80000010527a:	00 00 00 
ffff80000010527d:	8b 54 03 08          	mov    0x8(%rbx,%rax,1),%edx
ffff800000105281:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff800000105288:	00 00 00 
ffff80000010528b:	8b 44 03 10          	mov    0x10(%rbx,%rax,1),%eax
ffff80000010528f:	0f af d0             	imul   %eax,%edx
ffff800000105292:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff800000105299:	00 00 00 
ffff80000010529c:	8b 34 03             	mov    (%rbx,%rax,1),%esi
ffff80000010529f:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff8000001052a6:	00 00 00 
ffff8000001052a9:	48 8b 44 03 18       	mov    0x18(%rbx,%rax,1),%rax
ffff8000001052ae:	6a 20                	pushq  $0x20
ffff8000001052b0:	41 b9 ff ff ff 00    	mov    $0xffffff,%r9d
ffff8000001052b6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
ffff8000001052bc:	48 89 c7             	mov    %rax,%rdi
ffff8000001052bf:	48 b8 5e 58 ff ff ff 	movabs $0xffffffffffff585e,%rax
ffff8000001052c6:	ff ff ff 
ffff8000001052c9:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001052cd:	ff d0                	callq  *%rax
ffff8000001052cf:	48 83 c4 08          	add    $0x8,%rsp
ffff8000001052d3:	8b 85 3c ff ff ff    	mov    -0xc4(%rbp),%eax
ffff8000001052d9:	48 63 d0             	movslq %eax,%rdx
ffff8000001052dc:	48 b8 98 8e 01 00 00 	movabs $0x18e98,%rax
ffff8000001052e3:	00 00 00 
ffff8000001052e6:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001052ea:	48 01 d0             	add    %rdx,%rax
ffff8000001052ed:	0f b6 00             	movzbl (%rax),%eax
ffff8000001052f0:	0f b6 f8             	movzbl %al,%edi
ffff8000001052f3:	44 8b 8d 18 ff ff ff 	mov    -0xe8(%rbp),%r9d
ffff8000001052fa:	44 8b 85 1c ff ff ff 	mov    -0xe4(%rbp),%r8d
ffff800000105301:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff800000105308:	00 00 00 
ffff80000010530b:	8b 54 03 0c          	mov    0xc(%rbx,%rax,1),%edx
ffff80000010530f:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff800000105316:	00 00 00 
ffff800000105319:	8b 44 03 14          	mov    0x14(%rbx,%rax,1),%eax
ffff80000010531d:	89 d1                	mov    %edx,%ecx
ffff80000010531f:	0f af c8             	imul   %eax,%ecx
ffff800000105322:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff800000105329:	00 00 00 
ffff80000010532c:	8b 54 03 08          	mov    0x8(%rbx,%rax,1),%edx
ffff800000105330:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff800000105337:	00 00 00 
ffff80000010533a:	8b 44 03 10          	mov    0x10(%rbx,%rax,1),%eax
ffff80000010533e:	0f af d0             	imul   %eax,%edx
ffff800000105341:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff800000105348:	00 00 00 
ffff80000010534b:	8b 34 03             	mov    (%rbx,%rax,1),%esi
ffff80000010534e:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff800000105355:	00 00 00 
ffff800000105358:	48 8b 44 03 18       	mov    0x18(%rbx,%rax,1),%rax
ffff80000010535d:	57                   	push   %rdi
ffff80000010535e:	48 89 c7             	mov    %rax,%rdi
ffff800000105361:	48 b8 5e 58 ff ff ff 	movabs $0xffffffffffff585e,%rax
ffff800000105368:	ff ff ff 
ffff80000010536b:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff80000010536f:	ff d0                	callq  *%rax
ffff800000105371:	48 83 c4 08          	add    $0x8,%rsp
ffff800000105375:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff80000010537c:	00 00 00 
ffff80000010537f:	8b 44 03 08          	mov    0x8(%rbx,%rax,1),%eax
ffff800000105383:	8d 50 01             	lea    0x1(%rax),%edx
ffff800000105386:	48 b8 38 9f 01 00 00 	movabs $0x19f38,%rax
ffff80000010538d:	00 00 00 
ffff800000105390:	89 54 03 08          	mov    %edx,0x8(%rbx,%rax,1)
ffff800000105394:	83 85 3c ff ff ff 01 	addl   $0x1,-0xc4(%rbp)
ffff80000010539b:	8b 85 3c ff ff ff    	mov    -0xc4(%rbp),%eax
ffff8000001053a1:	3b 85 38 ff ff ff    	cmp    -0xc8(%rbp),%eax
ffff8000001053a7:	0f 8c 42 fd ff ff    	jl     ffff8000001050ef <printk+0xd5>
ffff8000001053ad:	90                   	nop
ffff8000001053ae:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
ffff8000001053b2:	c9                   	leaveq 
ffff8000001053b3:	c3                   	retq   

ffff8000001053b4 <do_divide_error>:
ffff8000001053b4:	55                   	push   %rbp
ffff8000001053b5:	48 89 e5             	mov    %rsp,%rbp
ffff8000001053b8:	41 57                	push   %r15
ffff8000001053ba:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001053be:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001053be <do_divide_error+0xa>
ffff8000001053c5:	49 bb 2a 9e 00 00 00 	movabs $0x9e2a,%r11
ffff8000001053cc:	00 00 00 
ffff8000001053cf:	4d 01 da             	add    %r11,%r10
ffff8000001053d2:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001053d6:	89 75 d4             	mov    %esi,-0x2c(%rbp)
ffff8000001053d9:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001053e0:	00 
ffff8000001053e1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001053e5:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001053eb:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001053ef:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001053f3:	48 8b 08             	mov    (%rax),%rcx
ffff8000001053f6:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001053fa:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff8000001053fd:	49 89 c9             	mov    %rcx,%r9
ffff800000105400:	49 89 d0             	mov    %rdx,%r8
ffff800000105403:	89 c1                	mov    %eax,%ecx
ffff800000105405:	48 b8 e0 10 00 00 00 	movabs $0x10e0,%rax
ffff80000010540c:	00 00 00 
ffff80000010540f:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000105413:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105418:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010541d:	4d 89 d7             	mov    %r10,%r15
ffff800000105420:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105425:	49 bb 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r11
ffff80000010542c:	ff ff ff 
ffff80000010542f:	4d 01 d3             	add    %r10,%r11
ffff800000105432:	41 ff d3             	callq  *%r11
ffff800000105435:	eb fe                	jmp    ffff800000105435 <do_divide_error+0x81>

ffff800000105437 <do_debug>:
ffff800000105437:	55                   	push   %rbp
ffff800000105438:	48 89 e5             	mov    %rsp,%rbp
ffff80000010543b:	41 57                	push   %r15
ffff80000010543d:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000105441:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff800000105441 <do_debug+0xa>
ffff800000105448:	49 bb a7 9d 00 00 00 	movabs $0x9da7,%r11
ffff80000010544f:	00 00 00 
ffff800000105452:	4d 01 da             	add    %r11,%r10
ffff800000105455:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105459:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff80000010545d:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105464:	00 
ffff800000105465:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105469:	48 05 98 00 00 00    	add    $0x98,%rax
ffff80000010546f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105473:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105477:	48 8b 08             	mov    (%rax),%rcx
ffff80000010547a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff80000010547e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105482:	49 89 c9             	mov    %rcx,%r9
ffff800000105485:	49 89 d0             	mov    %rdx,%r8
ffff800000105488:	48 89 c1             	mov    %rax,%rcx
ffff80000010548b:	48 b8 10 11 00 00 00 	movabs $0x1110,%rax
ffff800000105492:	00 00 00 
ffff800000105495:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000105499:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010549e:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001054a3:	4d 89 d7             	mov    %r10,%r15
ffff8000001054a6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001054ab:	49 bb 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r11
ffff8000001054b2:	ff ff ff 
ffff8000001054b5:	4d 01 d3             	add    %r10,%r11
ffff8000001054b8:	41 ff d3             	callq  *%r11
ffff8000001054bb:	eb fe                	jmp    ffff8000001054bb <do_debug+0x84>

ffff8000001054bd <do_nmi>:
ffff8000001054bd:	55                   	push   %rbp
ffff8000001054be:	48 89 e5             	mov    %rsp,%rbp
ffff8000001054c1:	41 57                	push   %r15
ffff8000001054c3:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001054c7:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001054c7 <do_nmi+0xa>
ffff8000001054ce:	49 bb 21 9d 00 00 00 	movabs $0x9d21,%r11
ffff8000001054d5:	00 00 00 
ffff8000001054d8:	4d 01 da             	add    %r11,%r10
ffff8000001054db:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001054df:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001054e3:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001054ea:	00 
ffff8000001054eb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001054ef:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001054f5:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001054f9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001054fd:	48 8b 08             	mov    (%rax),%rcx
ffff800000105500:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105504:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105508:	49 89 c9             	mov    %rcx,%r9
ffff80000010550b:	49 89 d0             	mov    %rdx,%r8
ffff80000010550e:	48 89 c1             	mov    %rax,%rcx
ffff800000105511:	48 b8 38 11 00 00 00 	movabs $0x1138,%rax
ffff800000105518:	00 00 00 
ffff80000010551b:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff80000010551f:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105524:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105529:	4d 89 d7             	mov    %r10,%r15
ffff80000010552c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105531:	49 bb 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r11
ffff800000105538:	ff ff ff 
ffff80000010553b:	4d 01 d3             	add    %r10,%r11
ffff80000010553e:	41 ff d3             	callq  *%r11
ffff800000105541:	eb fe                	jmp    ffff800000105541 <do_nmi+0x84>

ffff800000105543 <do_breakpoint>:
ffff800000105543:	55                   	push   %rbp
ffff800000105544:	48 89 e5             	mov    %rsp,%rbp
ffff800000105547:	41 57                	push   %r15
ffff800000105549:	48 83 ec 28          	sub    $0x28,%rsp
ffff80000010554d:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff80000010554d <do_breakpoint+0xa>
ffff800000105554:	49 bb 9b 9c 00 00 00 	movabs $0x9c9b,%r11
ffff80000010555b:	00 00 00 
ffff80000010555e:	4d 01 da             	add    %r11,%r10
ffff800000105561:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105565:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105569:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105570:	00 
ffff800000105571:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105575:	48 05 98 00 00 00    	add    $0x98,%rax
ffff80000010557b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff80000010557f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105583:	48 8b 08             	mov    (%rax),%rcx
ffff800000105586:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff80000010558a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010558e:	49 89 c9             	mov    %rcx,%r9
ffff800000105591:	49 89 d0             	mov    %rdx,%r8
ffff800000105594:	48 89 c1             	mov    %rax,%rcx
ffff800000105597:	48 b8 68 11 00 00 00 	movabs $0x1168,%rax
ffff80000010559e:	00 00 00 
ffff8000001055a1:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff8000001055a5:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001055aa:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001055af:	4d 89 d7             	mov    %r10,%r15
ffff8000001055b2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001055b7:	49 bb 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r11
ffff8000001055be:	ff ff ff 
ffff8000001055c1:	4d 01 d3             	add    %r10,%r11
ffff8000001055c4:	41 ff d3             	callq  *%r11
ffff8000001055c7:	eb fe                	jmp    ffff8000001055c7 <do_breakpoint+0x84>

ffff8000001055c9 <do_overflow>:
ffff8000001055c9:	55                   	push   %rbp
ffff8000001055ca:	48 89 e5             	mov    %rsp,%rbp
ffff8000001055cd:	41 57                	push   %r15
ffff8000001055cf:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001055d3:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001055d3 <do_overflow+0xa>
ffff8000001055da:	49 bb 15 9c 00 00 00 	movabs $0x9c15,%r11
ffff8000001055e1:	00 00 00 
ffff8000001055e4:	4d 01 da             	add    %r11,%r10
ffff8000001055e7:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001055eb:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001055ef:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001055f6:	00 
ffff8000001055f7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001055fb:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105601:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105605:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105609:	48 8b 08             	mov    (%rax),%rcx
ffff80000010560c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105610:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105614:	49 89 c9             	mov    %rcx,%r9
ffff800000105617:	49 89 d0             	mov    %rdx,%r8
ffff80000010561a:	48 89 c1             	mov    %rax,%rcx
ffff80000010561d:	48 b8 98 11 00 00 00 	movabs $0x1198,%rax
ffff800000105624:	00 00 00 
ffff800000105627:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff80000010562b:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105630:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105635:	4d 89 d7             	mov    %r10,%r15
ffff800000105638:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010563d:	49 bb 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r11
ffff800000105644:	ff ff ff 
ffff800000105647:	4d 01 d3             	add    %r10,%r11
ffff80000010564a:	41 ff d3             	callq  *%r11
ffff80000010564d:	eb fe                	jmp    ffff80000010564d <do_overflow+0x84>

ffff80000010564f <do_bounds>:
ffff80000010564f:	55                   	push   %rbp
ffff800000105650:	48 89 e5             	mov    %rsp,%rbp
ffff800000105653:	41 57                	push   %r15
ffff800000105655:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000105659:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff800000105659 <do_bounds+0xa>
ffff800000105660:	49 bb 8f 9b 00 00 00 	movabs $0x9b8f,%r11
ffff800000105667:	00 00 00 
ffff80000010566a:	4d 01 da             	add    %r11,%r10
ffff80000010566d:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105671:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105675:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff80000010567c:	00 
ffff80000010567d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105681:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105687:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff80000010568b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010568f:	48 8b 08             	mov    (%rax),%rcx
ffff800000105692:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105696:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010569a:	49 89 c9             	mov    %rcx,%r9
ffff80000010569d:	49 89 d0             	mov    %rdx,%r8
ffff8000001056a0:	48 89 c1             	mov    %rax,%rcx
ffff8000001056a3:	48 b8 c8 11 00 00 00 	movabs $0x11c8,%rax
ffff8000001056aa:	00 00 00 
ffff8000001056ad:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff8000001056b1:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001056b6:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001056bb:	4d 89 d7             	mov    %r10,%r15
ffff8000001056be:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001056c3:	49 bb 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r11
ffff8000001056ca:	ff ff ff 
ffff8000001056cd:	4d 01 d3             	add    %r10,%r11
ffff8000001056d0:	41 ff d3             	callq  *%r11
ffff8000001056d3:	eb fe                	jmp    ffff8000001056d3 <do_bounds+0x84>

ffff8000001056d5 <do_undefined_opcode>:
ffff8000001056d5:	55                   	push   %rbp
ffff8000001056d6:	48 89 e5             	mov    %rsp,%rbp
ffff8000001056d9:	41 57                	push   %r15
ffff8000001056db:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001056df:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001056df <do_undefined_opcode+0xa>
ffff8000001056e6:	49 bb 09 9b 00 00 00 	movabs $0x9b09,%r11
ffff8000001056ed:	00 00 00 
ffff8000001056f0:	4d 01 da             	add    %r11,%r10
ffff8000001056f3:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001056f7:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001056fb:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105702:	00 
ffff800000105703:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105707:	48 05 98 00 00 00    	add    $0x98,%rax
ffff80000010570d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105711:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105715:	48 8b 08             	mov    (%rax),%rcx
ffff800000105718:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff80000010571c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105720:	49 89 c9             	mov    %rcx,%r9
ffff800000105723:	49 89 d0             	mov    %rdx,%r8
ffff800000105726:	48 89 c1             	mov    %rax,%rcx
ffff800000105729:	48 b8 00 12 00 00 00 	movabs $0x1200,%rax
ffff800000105730:	00 00 00 
ffff800000105733:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000105737:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010573c:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105741:	4d 89 d7             	mov    %r10,%r15
ffff800000105744:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105749:	49 bb 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r11
ffff800000105750:	ff ff ff 
ffff800000105753:	4d 01 d3             	add    %r10,%r11
ffff800000105756:	41 ff d3             	callq  *%r11
ffff800000105759:	eb fe                	jmp    ffff800000105759 <do_undefined_opcode+0x84>

ffff80000010575b <do_dev_not_available>:
ffff80000010575b:	55                   	push   %rbp
ffff80000010575c:	48 89 e5             	mov    %rsp,%rbp
ffff80000010575f:	41 57                	push   %r15
ffff800000105761:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000105765:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff800000105765 <do_dev_not_available+0xa>
ffff80000010576c:	49 bb 83 9a 00 00 00 	movabs $0x9a83,%r11
ffff800000105773:	00 00 00 
ffff800000105776:	4d 01 da             	add    %r11,%r10
ffff800000105779:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff80000010577d:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105781:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105788:	00 
ffff800000105789:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010578d:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105793:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105797:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010579b:	48 8b 08             	mov    (%rax),%rcx
ffff80000010579e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001057a2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001057a6:	49 89 c9             	mov    %rcx,%r9
ffff8000001057a9:	49 89 d0             	mov    %rdx,%r8
ffff8000001057ac:	48 89 c1             	mov    %rax,%rcx
ffff8000001057af:	48 b8 48 12 00 00 00 	movabs $0x1248,%rax
ffff8000001057b6:	00 00 00 
ffff8000001057b9:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff8000001057bd:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001057c2:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001057c7:	4d 89 d7             	mov    %r10,%r15
ffff8000001057ca:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001057cf:	49 bb 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r11
ffff8000001057d6:	ff ff ff 
ffff8000001057d9:	4d 01 d3             	add    %r10,%r11
ffff8000001057dc:	41 ff d3             	callq  *%r11
ffff8000001057df:	eb fe                	jmp    ffff8000001057df <do_dev_not_available+0x84>

ffff8000001057e1 <do_double_fault>:
ffff8000001057e1:	55                   	push   %rbp
ffff8000001057e2:	48 89 e5             	mov    %rsp,%rbp
ffff8000001057e5:	41 57                	push   %r15
ffff8000001057e7:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001057eb:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001057eb <do_double_fault+0xa>
ffff8000001057f2:	49 bb fd 99 00 00 00 	movabs $0x99fd,%r11
ffff8000001057f9:	00 00 00 
ffff8000001057fc:	4d 01 da             	add    %r11,%r10
ffff8000001057ff:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105803:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105807:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff80000010580e:	00 
ffff80000010580f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105813:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105819:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff80000010581d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105821:	48 8b 08             	mov    (%rax),%rcx
ffff800000105824:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105828:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010582c:	49 89 c9             	mov    %rcx,%r9
ffff80000010582f:	49 89 d0             	mov    %rdx,%r8
ffff800000105832:	48 89 c1             	mov    %rax,%rcx
ffff800000105835:	48 b8 98 12 00 00 00 	movabs $0x1298,%rax
ffff80000010583c:	00 00 00 
ffff80000010583f:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000105843:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105848:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010584d:	4d 89 d7             	mov    %r10,%r15
ffff800000105850:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105855:	49 bb 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r11
ffff80000010585c:	ff ff ff 
ffff80000010585f:	4d 01 d3             	add    %r10,%r11
ffff800000105862:	41 ff d3             	callq  *%r11
ffff800000105865:	eb fe                	jmp    ffff800000105865 <do_double_fault+0x84>

ffff800000105867 <do_coprocessor_segment_overrun>:
ffff800000105867:	55                   	push   %rbp
ffff800000105868:	48 89 e5             	mov    %rsp,%rbp
ffff80000010586b:	41 57                	push   %r15
ffff80000010586d:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000105871:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff800000105871 <do_coprocessor_segment_overrun+0xa>
ffff800000105878:	49 bb 77 99 00 00 00 	movabs $0x9977,%r11
ffff80000010587f:	00 00 00 
ffff800000105882:	4d 01 da             	add    %r11,%r10
ffff800000105885:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105889:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff80000010588d:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105894:	00 
ffff800000105895:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105899:	48 05 98 00 00 00    	add    $0x98,%rax
ffff80000010589f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001058a3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001058a7:	48 8b 08             	mov    (%rax),%rcx
ffff8000001058aa:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001058ae:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001058b2:	49 89 c9             	mov    %rcx,%r9
ffff8000001058b5:	49 89 d0             	mov    %rdx,%r8
ffff8000001058b8:	48 89 c1             	mov    %rax,%rcx
ffff8000001058bb:	48 b8 c8 12 00 00 00 	movabs $0x12c8,%rax
ffff8000001058c2:	00 00 00 
ffff8000001058c5:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff8000001058c9:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001058ce:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001058d3:	4d 89 d7             	mov    %r10,%r15
ffff8000001058d6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001058db:	49 bb 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r11
ffff8000001058e2:	ff ff ff 
ffff8000001058e5:	4d 01 d3             	add    %r10,%r11
ffff8000001058e8:	41 ff d3             	callq  *%r11
ffff8000001058eb:	eb fe                	jmp    ffff8000001058eb <do_coprocessor_segment_overrun+0x84>

ffff8000001058ed <do_invalid_TSS>:
ffff8000001058ed:	55                   	push   %rbp
ffff8000001058ee:	48 89 e5             	mov    %rsp,%rbp
ffff8000001058f1:	41 57                	push   %r15
ffff8000001058f3:	53                   	push   %rbx
ffff8000001058f4:	48 83 ec 20          	sub    $0x20,%rsp
ffff8000001058f8:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff8000001058f8 <do_invalid_TSS+0xb>
ffff8000001058ff:	49 bb f0 98 00 00 00 	movabs $0x98f0,%r11
ffff800000105906:	00 00 00 
ffff800000105909:	4c 01 db             	add    %r11,%rbx
ffff80000010590c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105910:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105914:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff80000010591b:	00 
ffff80000010591c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105920:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105926:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff80000010592a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010592e:	48 8b 08             	mov    (%rax),%rcx
ffff800000105931:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105935:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105939:	49 89 c9             	mov    %rcx,%r9
ffff80000010593c:	49 89 d0             	mov    %rdx,%r8
ffff80000010593f:	48 89 c1             	mov    %rax,%rcx
ffff800000105942:	48 b8 18 13 00 00 00 	movabs $0x1318,%rax
ffff800000105949:	00 00 00 
ffff80000010594c:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105950:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105955:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010595a:	49 89 df             	mov    %rbx,%r15
ffff80000010595d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105962:	49 ba 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r10
ffff800000105969:	ff ff ff 
ffff80000010596c:	49 01 da             	add    %rbx,%r10
ffff80000010596f:	41 ff d2             	callq  *%r10
ffff800000105972:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105976:	83 e0 01             	and    $0x1,%eax
ffff800000105979:	48 85 c0             	test   %rax,%rax
ffff80000010597c:	74 2f                	je     ffff8000001059ad <do_invalid_TSS+0xc0>
ffff80000010597e:	48 b8 48 13 00 00 00 	movabs $0x1348,%rax
ffff800000105985:	00 00 00 
ffff800000105988:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010598c:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105991:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105996:	49 89 df             	mov    %rbx,%r15
ffff800000105999:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010599e:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff8000001059a5:	ff ff ff 
ffff8000001059a8:	48 01 d9             	add    %rbx,%rcx
ffff8000001059ab:	ff d1                	callq  *%rcx
ffff8000001059ad:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001059b1:	83 e0 02             	and    $0x2,%eax
ffff8000001059b4:	48 85 c0             	test   %rax,%rax
ffff8000001059b7:	74 31                	je     ffff8000001059ea <do_invalid_TSS+0xfd>
ffff8000001059b9:	48 b8 c8 13 00 00 00 	movabs $0x13c8,%rax
ffff8000001059c0:	00 00 00 
ffff8000001059c3:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001059c7:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001059cc:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001059d1:	49 89 df             	mov    %rbx,%r15
ffff8000001059d4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001059d9:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff8000001059e0:	ff ff ff 
ffff8000001059e3:	48 01 d9             	add    %rbx,%rcx
ffff8000001059e6:	ff d1                	callq  *%rcx
ffff8000001059e8:	eb 2f                	jmp    ffff800000105a19 <do_invalid_TSS+0x12c>
ffff8000001059ea:	48 b8 f8 13 00 00 00 	movabs $0x13f8,%rax
ffff8000001059f1:	00 00 00 
ffff8000001059f4:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001059f8:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001059fd:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105a02:	49 89 df             	mov    %rbx,%r15
ffff800000105a05:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105a0a:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000105a11:	ff ff ff 
ffff800000105a14:	48 01 d9             	add    %rbx,%rcx
ffff800000105a17:	ff d1                	callq  *%rcx
ffff800000105a19:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105a1d:	83 e0 02             	and    $0x2,%eax
ffff800000105a20:	48 85 c0             	test   %rax,%rax
ffff800000105a23:	75 6c                	jne    ffff800000105a91 <do_invalid_TSS+0x1a4>
ffff800000105a25:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105a29:	83 e0 04             	and    $0x4,%eax
ffff800000105a2c:	48 85 c0             	test   %rax,%rax
ffff800000105a2f:	74 31                	je     ffff800000105a62 <do_invalid_TSS+0x175>
ffff800000105a31:	48 b8 30 14 00 00 00 	movabs $0x1430,%rax
ffff800000105a38:	00 00 00 
ffff800000105a3b:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105a3f:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105a44:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105a49:	49 89 df             	mov    %rbx,%r15
ffff800000105a4c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105a51:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000105a58:	ff ff ff 
ffff800000105a5b:	48 01 d9             	add    %rbx,%rcx
ffff800000105a5e:	ff d1                	callq  *%rcx
ffff800000105a60:	eb 2f                	jmp    ffff800000105a91 <do_invalid_TSS+0x1a4>
ffff800000105a62:	48 b8 68 14 00 00 00 	movabs $0x1468,%rax
ffff800000105a69:	00 00 00 
ffff800000105a6c:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105a70:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105a75:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105a7a:	49 89 df             	mov    %rbx,%r15
ffff800000105a7d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105a82:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000105a89:	ff ff ff 
ffff800000105a8c:	48 01 d9             	add    %rbx,%rcx
ffff800000105a8f:	ff d1                	callq  *%rcx
ffff800000105a91:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105a95:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff800000105a9a:	48 89 c1             	mov    %rax,%rcx
ffff800000105a9d:	48 b8 94 14 00 00 00 	movabs $0x1494,%rax
ffff800000105aa4:	00 00 00 
ffff800000105aa7:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105aab:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105ab0:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105ab5:	49 89 df             	mov    %rbx,%r15
ffff800000105ab8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105abd:	49 b8 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r8
ffff800000105ac4:	ff ff ff 
ffff800000105ac7:	49 01 d8             	add    %rbx,%r8
ffff800000105aca:	41 ff d0             	callq  *%r8
ffff800000105acd:	eb fe                	jmp    ffff800000105acd <do_invalid_TSS+0x1e0>

ffff800000105acf <do_segment_not_present>:
ffff800000105acf:	55                   	push   %rbp
ffff800000105ad0:	48 89 e5             	mov    %rsp,%rbp
ffff800000105ad3:	41 57                	push   %r15
ffff800000105ad5:	53                   	push   %rbx
ffff800000105ad6:	48 83 ec 20          	sub    $0x20,%rsp
ffff800000105ada:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000105ada <do_segment_not_present+0xb>
ffff800000105ae1:	49 bb 0e 97 00 00 00 	movabs $0x970e,%r11
ffff800000105ae8:	00 00 00 
ffff800000105aeb:	4c 01 db             	add    %r11,%rbx
ffff800000105aee:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105af2:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105af6:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105afd:	00 
ffff800000105afe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105b02:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105b08:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105b0c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105b10:	48 8b 08             	mov    (%rax),%rcx
ffff800000105b13:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105b17:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105b1b:	49 89 c9             	mov    %rcx,%r9
ffff800000105b1e:	49 89 d0             	mov    %rdx,%r8
ffff800000105b21:	48 89 c1             	mov    %rax,%rcx
ffff800000105b24:	48 b8 b0 14 00 00 00 	movabs $0x14b0,%rax
ffff800000105b2b:	00 00 00 
ffff800000105b2e:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105b32:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105b37:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105b3c:	49 89 df             	mov    %rbx,%r15
ffff800000105b3f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105b44:	49 ba 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r10
ffff800000105b4b:	ff ff ff 
ffff800000105b4e:	49 01 da             	add    %rbx,%r10
ffff800000105b51:	41 ff d2             	callq  *%r10
ffff800000105b54:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105b58:	83 e0 01             	and    $0x1,%eax
ffff800000105b5b:	48 85 c0             	test   %rax,%rax
ffff800000105b5e:	74 2f                	je     ffff800000105b8f <do_segment_not_present+0xc0>
ffff800000105b60:	48 b8 48 13 00 00 00 	movabs $0x1348,%rax
ffff800000105b67:	00 00 00 
ffff800000105b6a:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105b6e:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105b73:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105b78:	49 89 df             	mov    %rbx,%r15
ffff800000105b7b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105b80:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000105b87:	ff ff ff 
ffff800000105b8a:	48 01 d9             	add    %rbx,%rcx
ffff800000105b8d:	ff d1                	callq  *%rcx
ffff800000105b8f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105b93:	83 e0 02             	and    $0x2,%eax
ffff800000105b96:	48 85 c0             	test   %rax,%rax
ffff800000105b99:	74 31                	je     ffff800000105bcc <do_segment_not_present+0xfd>
ffff800000105b9b:	48 b8 c8 13 00 00 00 	movabs $0x13c8,%rax
ffff800000105ba2:	00 00 00 
ffff800000105ba5:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105ba9:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105bae:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105bb3:	49 89 df             	mov    %rbx,%r15
ffff800000105bb6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105bbb:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000105bc2:	ff ff ff 
ffff800000105bc5:	48 01 d9             	add    %rbx,%rcx
ffff800000105bc8:	ff d1                	callq  *%rcx
ffff800000105bca:	eb 2f                	jmp    ffff800000105bfb <do_segment_not_present+0x12c>
ffff800000105bcc:	48 b8 f8 13 00 00 00 	movabs $0x13f8,%rax
ffff800000105bd3:	00 00 00 
ffff800000105bd6:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105bda:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105bdf:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105be4:	49 89 df             	mov    %rbx,%r15
ffff800000105be7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105bec:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000105bf3:	ff ff ff 
ffff800000105bf6:	48 01 d9             	add    %rbx,%rcx
ffff800000105bf9:	ff d1                	callq  *%rcx
ffff800000105bfb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105bff:	83 e0 02             	and    $0x2,%eax
ffff800000105c02:	48 85 c0             	test   %rax,%rax
ffff800000105c05:	75 6c                	jne    ffff800000105c73 <do_segment_not_present+0x1a4>
ffff800000105c07:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105c0b:	83 e0 04             	and    $0x4,%eax
ffff800000105c0e:	48 85 c0             	test   %rax,%rax
ffff800000105c11:	74 31                	je     ffff800000105c44 <do_segment_not_present+0x175>
ffff800000105c13:	48 b8 30 14 00 00 00 	movabs $0x1430,%rax
ffff800000105c1a:	00 00 00 
ffff800000105c1d:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105c21:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105c26:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105c2b:	49 89 df             	mov    %rbx,%r15
ffff800000105c2e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105c33:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000105c3a:	ff ff ff 
ffff800000105c3d:	48 01 d9             	add    %rbx,%rcx
ffff800000105c40:	ff d1                	callq  *%rcx
ffff800000105c42:	eb 2f                	jmp    ffff800000105c73 <do_segment_not_present+0x1a4>
ffff800000105c44:	48 b8 68 14 00 00 00 	movabs $0x1468,%rax
ffff800000105c4b:	00 00 00 
ffff800000105c4e:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105c52:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105c57:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105c5c:	49 89 df             	mov    %rbx,%r15
ffff800000105c5f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105c64:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000105c6b:	ff ff ff 
ffff800000105c6e:	48 01 d9             	add    %rbx,%rcx
ffff800000105c71:	ff d1                	callq  *%rcx
ffff800000105c73:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105c77:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff800000105c7c:	48 89 c1             	mov    %rax,%rcx
ffff800000105c7f:	48 b8 94 14 00 00 00 	movabs $0x1494,%rax
ffff800000105c86:	00 00 00 
ffff800000105c89:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105c8d:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105c92:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105c97:	49 89 df             	mov    %rbx,%r15
ffff800000105c9a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105c9f:	49 b8 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r8
ffff800000105ca6:	ff ff ff 
ffff800000105ca9:	49 01 d8             	add    %rbx,%r8
ffff800000105cac:	41 ff d0             	callq  *%r8
ffff800000105caf:	eb fe                	jmp    ffff800000105caf <do_segment_not_present+0x1e0>

ffff800000105cb1 <do_stack_segment_fault>:
ffff800000105cb1:	55                   	push   %rbp
ffff800000105cb2:	48 89 e5             	mov    %rsp,%rbp
ffff800000105cb5:	41 57                	push   %r15
ffff800000105cb7:	53                   	push   %rbx
ffff800000105cb8:	48 83 ec 20          	sub    $0x20,%rsp
ffff800000105cbc:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000105cbc <do_stack_segment_fault+0xb>
ffff800000105cc3:	49 bb 2c 95 00 00 00 	movabs $0x952c,%r11
ffff800000105cca:	00 00 00 
ffff800000105ccd:	4c 01 db             	add    %r11,%rbx
ffff800000105cd0:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105cd4:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105cd8:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105cdf:	00 
ffff800000105ce0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105ce4:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105cea:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105cee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105cf2:	48 8b 08             	mov    (%rax),%rcx
ffff800000105cf5:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105cf9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105cfd:	49 89 c9             	mov    %rcx,%r9
ffff800000105d00:	49 89 d0             	mov    %rdx,%r8
ffff800000105d03:	48 89 c1             	mov    %rax,%rcx
ffff800000105d06:	48 b8 e8 14 00 00 00 	movabs $0x14e8,%rax
ffff800000105d0d:	00 00 00 
ffff800000105d10:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105d14:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105d19:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105d1e:	49 89 df             	mov    %rbx,%r15
ffff800000105d21:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105d26:	49 ba 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r10
ffff800000105d2d:	ff ff ff 
ffff800000105d30:	49 01 da             	add    %rbx,%r10
ffff800000105d33:	41 ff d2             	callq  *%r10
ffff800000105d36:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105d3a:	83 e0 01             	and    $0x1,%eax
ffff800000105d3d:	48 85 c0             	test   %rax,%rax
ffff800000105d40:	74 2f                	je     ffff800000105d71 <do_stack_segment_fault+0xc0>
ffff800000105d42:	48 b8 48 13 00 00 00 	movabs $0x1348,%rax
ffff800000105d49:	00 00 00 
ffff800000105d4c:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105d50:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105d55:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105d5a:	49 89 df             	mov    %rbx,%r15
ffff800000105d5d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105d62:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000105d69:	ff ff ff 
ffff800000105d6c:	48 01 d9             	add    %rbx,%rcx
ffff800000105d6f:	ff d1                	callq  *%rcx
ffff800000105d71:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105d75:	83 e0 02             	and    $0x2,%eax
ffff800000105d78:	48 85 c0             	test   %rax,%rax
ffff800000105d7b:	74 31                	je     ffff800000105dae <do_stack_segment_fault+0xfd>
ffff800000105d7d:	48 b8 c8 13 00 00 00 	movabs $0x13c8,%rax
ffff800000105d84:	00 00 00 
ffff800000105d87:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105d8b:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105d90:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105d95:	49 89 df             	mov    %rbx,%r15
ffff800000105d98:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105d9d:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000105da4:	ff ff ff 
ffff800000105da7:	48 01 d9             	add    %rbx,%rcx
ffff800000105daa:	ff d1                	callq  *%rcx
ffff800000105dac:	eb 2f                	jmp    ffff800000105ddd <do_stack_segment_fault+0x12c>
ffff800000105dae:	48 b8 f8 13 00 00 00 	movabs $0x13f8,%rax
ffff800000105db5:	00 00 00 
ffff800000105db8:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105dbc:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105dc1:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105dc6:	49 89 df             	mov    %rbx,%r15
ffff800000105dc9:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105dce:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000105dd5:	ff ff ff 
ffff800000105dd8:	48 01 d9             	add    %rbx,%rcx
ffff800000105ddb:	ff d1                	callq  *%rcx
ffff800000105ddd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105de1:	83 e0 02             	and    $0x2,%eax
ffff800000105de4:	48 85 c0             	test   %rax,%rax
ffff800000105de7:	75 6c                	jne    ffff800000105e55 <do_stack_segment_fault+0x1a4>
ffff800000105de9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105ded:	83 e0 04             	and    $0x4,%eax
ffff800000105df0:	48 85 c0             	test   %rax,%rax
ffff800000105df3:	74 31                	je     ffff800000105e26 <do_stack_segment_fault+0x175>
ffff800000105df5:	48 b8 30 14 00 00 00 	movabs $0x1430,%rax
ffff800000105dfc:	00 00 00 
ffff800000105dff:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105e03:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105e08:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105e0d:	49 89 df             	mov    %rbx,%r15
ffff800000105e10:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105e15:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000105e1c:	ff ff ff 
ffff800000105e1f:	48 01 d9             	add    %rbx,%rcx
ffff800000105e22:	ff d1                	callq  *%rcx
ffff800000105e24:	eb 2f                	jmp    ffff800000105e55 <do_stack_segment_fault+0x1a4>
ffff800000105e26:	48 b8 68 14 00 00 00 	movabs $0x1468,%rax
ffff800000105e2d:	00 00 00 
ffff800000105e30:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105e34:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105e39:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105e3e:	49 89 df             	mov    %rbx,%r15
ffff800000105e41:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105e46:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000105e4d:	ff ff ff 
ffff800000105e50:	48 01 d9             	add    %rbx,%rcx
ffff800000105e53:	ff d1                	callq  *%rcx
ffff800000105e55:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105e59:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff800000105e5e:	48 89 c1             	mov    %rax,%rcx
ffff800000105e61:	48 b8 94 14 00 00 00 	movabs $0x1494,%rax
ffff800000105e68:	00 00 00 
ffff800000105e6b:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105e6f:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105e74:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105e79:	49 89 df             	mov    %rbx,%r15
ffff800000105e7c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105e81:	49 b8 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r8
ffff800000105e88:	ff ff ff 
ffff800000105e8b:	49 01 d8             	add    %rbx,%r8
ffff800000105e8e:	41 ff d0             	callq  *%r8
ffff800000105e91:	eb fe                	jmp    ffff800000105e91 <do_stack_segment_fault+0x1e0>

ffff800000105e93 <do_general_protection>:
ffff800000105e93:	55                   	push   %rbp
ffff800000105e94:	48 89 e5             	mov    %rsp,%rbp
ffff800000105e97:	41 57                	push   %r15
ffff800000105e99:	53                   	push   %rbx
ffff800000105e9a:	48 83 ec 20          	sub    $0x20,%rsp
ffff800000105e9e:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000105e9e <do_general_protection+0xb>
ffff800000105ea5:	49 bb 4a 93 00 00 00 	movabs $0x934a,%r11
ffff800000105eac:	00 00 00 
ffff800000105eaf:	4c 01 db             	add    %r11,%rbx
ffff800000105eb2:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105eb6:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105eba:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105ec1:	00 
ffff800000105ec2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105ec6:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105ecc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105ed0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105ed4:	48 8b 08             	mov    (%rax),%rcx
ffff800000105ed7:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105edb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105edf:	49 89 c9             	mov    %rcx,%r9
ffff800000105ee2:	49 89 d0             	mov    %rdx,%r8
ffff800000105ee5:	48 89 c1             	mov    %rax,%rcx
ffff800000105ee8:	48 b8 20 15 00 00 00 	movabs $0x1520,%rax
ffff800000105eef:	00 00 00 
ffff800000105ef2:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105ef6:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105efb:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105f00:	49 89 df             	mov    %rbx,%r15
ffff800000105f03:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105f08:	49 ba 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r10
ffff800000105f0f:	ff ff ff 
ffff800000105f12:	49 01 da             	add    %rbx,%r10
ffff800000105f15:	41 ff d2             	callq  *%r10
ffff800000105f18:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105f1c:	83 e0 01             	and    $0x1,%eax
ffff800000105f1f:	48 85 c0             	test   %rax,%rax
ffff800000105f22:	74 2f                	je     ffff800000105f53 <do_general_protection+0xc0>
ffff800000105f24:	48 b8 48 13 00 00 00 	movabs $0x1348,%rax
ffff800000105f2b:	00 00 00 
ffff800000105f2e:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105f32:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105f37:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105f3c:	49 89 df             	mov    %rbx,%r15
ffff800000105f3f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105f44:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000105f4b:	ff ff ff 
ffff800000105f4e:	48 01 d9             	add    %rbx,%rcx
ffff800000105f51:	ff d1                	callq  *%rcx
ffff800000105f53:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105f57:	83 e0 02             	and    $0x2,%eax
ffff800000105f5a:	48 85 c0             	test   %rax,%rax
ffff800000105f5d:	74 31                	je     ffff800000105f90 <do_general_protection+0xfd>
ffff800000105f5f:	48 b8 c8 13 00 00 00 	movabs $0x13c8,%rax
ffff800000105f66:	00 00 00 
ffff800000105f69:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105f6d:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105f72:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105f77:	49 89 df             	mov    %rbx,%r15
ffff800000105f7a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105f7f:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000105f86:	ff ff ff 
ffff800000105f89:	48 01 d9             	add    %rbx,%rcx
ffff800000105f8c:	ff d1                	callq  *%rcx
ffff800000105f8e:	eb 2f                	jmp    ffff800000105fbf <do_general_protection+0x12c>
ffff800000105f90:	48 b8 f8 13 00 00 00 	movabs $0x13f8,%rax
ffff800000105f97:	00 00 00 
ffff800000105f9a:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105f9e:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105fa3:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105fa8:	49 89 df             	mov    %rbx,%r15
ffff800000105fab:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105fb0:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000105fb7:	ff ff ff 
ffff800000105fba:	48 01 d9             	add    %rbx,%rcx
ffff800000105fbd:	ff d1                	callq  *%rcx
ffff800000105fbf:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105fc3:	83 e0 02             	and    $0x2,%eax
ffff800000105fc6:	48 85 c0             	test   %rax,%rax
ffff800000105fc9:	75 6c                	jne    ffff800000106037 <do_general_protection+0x1a4>
ffff800000105fcb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105fcf:	83 e0 04             	and    $0x4,%eax
ffff800000105fd2:	48 85 c0             	test   %rax,%rax
ffff800000105fd5:	74 31                	je     ffff800000106008 <do_general_protection+0x175>
ffff800000105fd7:	48 b8 30 14 00 00 00 	movabs $0x1430,%rax
ffff800000105fde:	00 00 00 
ffff800000105fe1:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105fe5:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105fea:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105fef:	49 89 df             	mov    %rbx,%r15
ffff800000105ff2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105ff7:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000105ffe:	ff ff ff 
ffff800000106001:	48 01 d9             	add    %rbx,%rcx
ffff800000106004:	ff d1                	callq  *%rcx
ffff800000106006:	eb 2f                	jmp    ffff800000106037 <do_general_protection+0x1a4>
ffff800000106008:	48 b8 68 14 00 00 00 	movabs $0x1468,%rax
ffff80000010600f:	00 00 00 
ffff800000106012:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106016:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010601b:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106020:	49 89 df             	mov    %rbx,%r15
ffff800000106023:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106028:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff80000010602f:	ff ff ff 
ffff800000106032:	48 01 d9             	add    %rbx,%rcx
ffff800000106035:	ff d1                	callq  *%rcx
ffff800000106037:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010603b:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff800000106040:	48 89 c1             	mov    %rax,%rcx
ffff800000106043:	48 b8 94 14 00 00 00 	movabs $0x1494,%rax
ffff80000010604a:	00 00 00 
ffff80000010604d:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106051:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106056:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010605b:	49 89 df             	mov    %rbx,%r15
ffff80000010605e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106063:	49 b8 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r8
ffff80000010606a:	ff ff ff 
ffff80000010606d:	49 01 d8             	add    %rbx,%r8
ffff800000106070:	41 ff d0             	callq  *%r8
ffff800000106073:	eb fe                	jmp    ffff800000106073 <do_general_protection+0x1e0>

ffff800000106075 <do_page_fault>:
ffff800000106075:	55                   	push   %rbp
ffff800000106076:	48 89 e5             	mov    %rsp,%rbp
ffff800000106079:	41 57                	push   %r15
ffff80000010607b:	53                   	push   %rbx
ffff80000010607c:	48 83 ec 20          	sub    $0x20,%rsp
ffff800000106080:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000106080 <do_page_fault+0xb>
ffff800000106087:	49 bb 68 91 00 00 00 	movabs $0x9168,%r11
ffff80000010608e:	00 00 00 
ffff800000106091:	4c 01 db             	add    %r11,%rbx
ffff800000106094:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000106098:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff80000010609c:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001060a3:	00 
ffff8000001060a4:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
ffff8000001060ab:	00 
ffff8000001060ac:	0f 20 d0             	mov    %cr2,%rax
ffff8000001060af:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff8000001060b3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001060b7:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001060bd:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001060c1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001060c5:	48 8b 08             	mov    (%rax),%rcx
ffff8000001060c8:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001060cc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001060d0:	49 89 c9             	mov    %rcx,%r9
ffff8000001060d3:	49 89 d0             	mov    %rdx,%r8
ffff8000001060d6:	48 89 c1             	mov    %rax,%rcx
ffff8000001060d9:	48 b8 58 15 00 00 00 	movabs $0x1558,%rax
ffff8000001060e0:	00 00 00 
ffff8000001060e3:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001060e7:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001060ec:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001060f1:	49 89 df             	mov    %rbx,%r15
ffff8000001060f4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001060f9:	49 ba 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r10
ffff800000106100:	ff ff ff 
ffff800000106103:	49 01 da             	add    %rbx,%r10
ffff800000106106:	41 ff d2             	callq  *%r10
ffff800000106109:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010610d:	83 e0 01             	and    $0x1,%eax
ffff800000106110:	48 85 c0             	test   %rax,%rax
ffff800000106113:	75 2f                	jne    ffff800000106144 <do_page_fault+0xcf>
ffff800000106115:	48 b8 84 15 00 00 00 	movabs $0x1584,%rax
ffff80000010611c:	00 00 00 
ffff80000010611f:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106123:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106128:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010612d:	49 89 df             	mov    %rbx,%r15
ffff800000106130:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106135:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff80000010613c:	ff ff ff 
ffff80000010613f:	48 01 d9             	add    %rbx,%rcx
ffff800000106142:	ff d1                	callq  *%rcx
ffff800000106144:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000106148:	83 e0 02             	and    $0x2,%eax
ffff80000010614b:	48 85 c0             	test   %rax,%rax
ffff80000010614e:	74 31                	je     ffff800000106181 <do_page_fault+0x10c>
ffff800000106150:	48 b8 97 15 00 00 00 	movabs $0x1597,%rax
ffff800000106157:	00 00 00 
ffff80000010615a:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010615e:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106163:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106168:	49 89 df             	mov    %rbx,%r15
ffff80000010616b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106170:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000106177:	ff ff ff 
ffff80000010617a:	48 01 d9             	add    %rbx,%rcx
ffff80000010617d:	ff d1                	callq  *%rcx
ffff80000010617f:	eb 2f                	jmp    ffff8000001061b0 <do_page_fault+0x13b>
ffff800000106181:	48 b8 ab 15 00 00 00 	movabs $0x15ab,%rax
ffff800000106188:	00 00 00 
ffff80000010618b:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010618f:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106194:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106199:	49 89 df             	mov    %rbx,%r15
ffff80000010619c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001061a1:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff8000001061a8:	ff ff ff 
ffff8000001061ab:	48 01 d9             	add    %rbx,%rcx
ffff8000001061ae:	ff d1                	callq  *%rcx
ffff8000001061b0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001061b4:	83 e0 04             	and    $0x4,%eax
ffff8000001061b7:	48 85 c0             	test   %rax,%rax
ffff8000001061ba:	74 31                	je     ffff8000001061ed <do_page_fault+0x178>
ffff8000001061bc:	48 b8 be 15 00 00 00 	movabs $0x15be,%rax
ffff8000001061c3:	00 00 00 
ffff8000001061c6:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001061ca:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001061cf:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001061d4:	49 89 df             	mov    %rbx,%r15
ffff8000001061d7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001061dc:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff8000001061e3:	ff ff ff 
ffff8000001061e6:	48 01 d9             	add    %rbx,%rcx
ffff8000001061e9:	ff d1                	callq  *%rcx
ffff8000001061eb:	eb 2f                	jmp    ffff80000010621c <do_page_fault+0x1a7>
ffff8000001061ed:	48 b8 d0 15 00 00 00 	movabs $0x15d0,%rax
ffff8000001061f4:	00 00 00 
ffff8000001061f7:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001061fb:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106200:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106205:	49 89 df             	mov    %rbx,%r15
ffff800000106208:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010620d:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000106214:	ff ff ff 
ffff800000106217:	48 01 d9             	add    %rbx,%rcx
ffff80000010621a:	ff d1                	callq  *%rcx
ffff80000010621c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000106220:	83 e0 08             	and    $0x8,%eax
ffff800000106223:	48 85 c0             	test   %rax,%rax
ffff800000106226:	74 2f                	je     ffff800000106257 <do_page_fault+0x1e2>
ffff800000106228:	48 b8 ec 15 00 00 00 	movabs $0x15ec,%rax
ffff80000010622f:	00 00 00 
ffff800000106232:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106236:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010623b:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106240:	49 89 df             	mov    %rbx,%r15
ffff800000106243:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106248:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff80000010624f:	ff ff ff 
ffff800000106252:	48 01 d9             	add    %rbx,%rcx
ffff800000106255:	ff d1                	callq  *%rcx
ffff800000106257:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010625b:	83 e0 10             	and    $0x10,%eax
ffff80000010625e:	48 85 c0             	test   %rax,%rax
ffff800000106261:	74 2f                	je     ffff800000106292 <do_page_fault+0x21d>
ffff800000106263:	48 b8 08 16 00 00 00 	movabs $0x1608,%rax
ffff80000010626a:	00 00 00 
ffff80000010626d:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106271:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106276:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010627b:	49 89 df             	mov    %rbx,%r15
ffff80000010627e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106283:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff80000010628a:	ff ff ff 
ffff80000010628d:	48 01 d9             	add    %rbx,%rcx
ffff800000106290:	ff d1                	callq  *%rcx
ffff800000106292:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106296:	48 89 c1             	mov    %rax,%rcx
ffff800000106299:	48 b8 28 16 00 00 00 	movabs $0x1628,%rax
ffff8000001062a0:	00 00 00 
ffff8000001062a3:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001062a7:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001062ac:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001062b1:	49 89 df             	mov    %rbx,%r15
ffff8000001062b4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001062b9:	49 b8 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r8
ffff8000001062c0:	ff ff ff 
ffff8000001062c3:	49 01 d8             	add    %rbx,%r8
ffff8000001062c6:	41 ff d0             	callq  *%r8
ffff8000001062c9:	eb fe                	jmp    ffff8000001062c9 <do_page_fault+0x254>

ffff8000001062cb <do_x87_FPU_error>:
ffff8000001062cb:	55                   	push   %rbp
ffff8000001062cc:	48 89 e5             	mov    %rsp,%rbp
ffff8000001062cf:	41 57                	push   %r15
ffff8000001062d1:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001062d5:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001062d5 <do_x87_FPU_error+0xa>
ffff8000001062dc:	49 bb 13 8f 00 00 00 	movabs $0x8f13,%r11
ffff8000001062e3:	00 00 00 
ffff8000001062e6:	4d 01 da             	add    %r11,%r10
ffff8000001062e9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001062ed:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001062f1:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001062f8:	00 
ffff8000001062f9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001062fd:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000106303:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000106307:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010630b:	48 8b 08             	mov    (%rax),%rcx
ffff80000010630e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000106312:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000106316:	49 89 c9             	mov    %rcx,%r9
ffff800000106319:	49 89 d0             	mov    %rdx,%r8
ffff80000010631c:	48 89 c1             	mov    %rax,%rcx
ffff80000010631f:	48 b8 30 16 00 00 00 	movabs $0x1630,%rax
ffff800000106326:	00 00 00 
ffff800000106329:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff80000010632d:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106332:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106337:	4d 89 d7             	mov    %r10,%r15
ffff80000010633a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010633f:	49 bb 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r11
ffff800000106346:	ff ff ff 
ffff800000106349:	4d 01 d3             	add    %r10,%r11
ffff80000010634c:	41 ff d3             	callq  *%r11
ffff80000010634f:	eb fe                	jmp    ffff80000010634f <do_x87_FPU_error+0x84>

ffff800000106351 <do_alignment_check>:
ffff800000106351:	55                   	push   %rbp
ffff800000106352:	48 89 e5             	mov    %rsp,%rbp
ffff800000106355:	41 57                	push   %r15
ffff800000106357:	48 83 ec 28          	sub    $0x28,%rsp
ffff80000010635b:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff80000010635b <do_alignment_check+0xa>
ffff800000106362:	49 bb 8d 8e 00 00 00 	movabs $0x8e8d,%r11
ffff800000106369:	00 00 00 
ffff80000010636c:	4d 01 da             	add    %r11,%r10
ffff80000010636f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000106373:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000106377:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff80000010637e:	00 
ffff80000010637f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000106383:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000106389:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff80000010638d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106391:	48 8b 08             	mov    (%rax),%rcx
ffff800000106394:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000106398:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010639c:	49 89 c9             	mov    %rcx,%r9
ffff80000010639f:	49 89 d0             	mov    %rdx,%r8
ffff8000001063a2:	48 89 c1             	mov    %rax,%rcx
ffff8000001063a5:	48 b8 80 16 00 00 00 	movabs $0x1680,%rax
ffff8000001063ac:	00 00 00 
ffff8000001063af:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff8000001063b3:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001063b8:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001063bd:	4d 89 d7             	mov    %r10,%r15
ffff8000001063c0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001063c5:	49 bb 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r11
ffff8000001063cc:	ff ff ff 
ffff8000001063cf:	4d 01 d3             	add    %r10,%r11
ffff8000001063d2:	41 ff d3             	callq  *%r11
ffff8000001063d5:	eb fe                	jmp    ffff8000001063d5 <do_alignment_check+0x84>

ffff8000001063d7 <do_machine_check>:
ffff8000001063d7:	55                   	push   %rbp
ffff8000001063d8:	48 89 e5             	mov    %rsp,%rbp
ffff8000001063db:	41 57                	push   %r15
ffff8000001063dd:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001063e1:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001063e1 <do_machine_check+0xa>
ffff8000001063e8:	49 bb 07 8e 00 00 00 	movabs $0x8e07,%r11
ffff8000001063ef:	00 00 00 
ffff8000001063f2:	4d 01 da             	add    %r11,%r10
ffff8000001063f5:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001063f9:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001063fd:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000106404:	00 
ffff800000106405:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000106409:	48 05 98 00 00 00    	add    $0x98,%rax
ffff80000010640f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000106413:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106417:	48 8b 08             	mov    (%rax),%rcx
ffff80000010641a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff80000010641e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000106422:	49 89 c9             	mov    %rcx,%r9
ffff800000106425:	49 89 d0             	mov    %rdx,%r8
ffff800000106428:	48 89 c1             	mov    %rax,%rcx
ffff80000010642b:	48 b8 b8 16 00 00 00 	movabs $0x16b8,%rax
ffff800000106432:	00 00 00 
ffff800000106435:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000106439:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010643e:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106443:	4d 89 d7             	mov    %r10,%r15
ffff800000106446:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010644b:	49 bb 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r11
ffff800000106452:	ff ff ff 
ffff800000106455:	4d 01 d3             	add    %r10,%r11
ffff800000106458:	41 ff d3             	callq  *%r11
ffff80000010645b:	eb fe                	jmp    ffff80000010645b <do_machine_check+0x84>

ffff80000010645d <do_SIMD_exception>:
ffff80000010645d:	55                   	push   %rbp
ffff80000010645e:	48 89 e5             	mov    %rsp,%rbp
ffff800000106461:	41 57                	push   %r15
ffff800000106463:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000106467:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff800000106467 <do_SIMD_exception+0xa>
ffff80000010646e:	49 bb 81 8d 00 00 00 	movabs $0x8d81,%r11
ffff800000106475:	00 00 00 
ffff800000106478:	4d 01 da             	add    %r11,%r10
ffff80000010647b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff80000010647f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000106483:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff80000010648a:	00 
ffff80000010648b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010648f:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000106495:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000106499:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010649d:	48 8b 08             	mov    (%rax),%rcx
ffff8000001064a0:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001064a4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001064a8:	49 89 c9             	mov    %rcx,%r9
ffff8000001064ab:	49 89 d0             	mov    %rdx,%r8
ffff8000001064ae:	48 89 c1             	mov    %rax,%rcx
ffff8000001064b1:	48 b8 e8 16 00 00 00 	movabs $0x16e8,%rax
ffff8000001064b8:	00 00 00 
ffff8000001064bb:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff8000001064bf:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001064c4:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001064c9:	4d 89 d7             	mov    %r10,%r15
ffff8000001064cc:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001064d1:	49 bb 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r11
ffff8000001064d8:	ff ff ff 
ffff8000001064db:	4d 01 d3             	add    %r10,%r11
ffff8000001064de:	41 ff d3             	callq  *%r11
ffff8000001064e1:	eb fe                	jmp    ffff8000001064e1 <do_SIMD_exception+0x84>

ffff8000001064e3 <do_virtualization_exception>:
ffff8000001064e3:	55                   	push   %rbp
ffff8000001064e4:	48 89 e5             	mov    %rsp,%rbp
ffff8000001064e7:	41 57                	push   %r15
ffff8000001064e9:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001064ed:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001064ed <do_virtualization_exception+0xa>
ffff8000001064f4:	49 bb fb 8c 00 00 00 	movabs $0x8cfb,%r11
ffff8000001064fb:	00 00 00 
ffff8000001064fe:	4d 01 da             	add    %r11,%r10
ffff800000106501:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000106505:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000106509:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000106510:	00 
ffff800000106511:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000106515:	48 05 98 00 00 00    	add    $0x98,%rax
ffff80000010651b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff80000010651f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106523:	48 8b 08             	mov    (%rax),%rcx
ffff800000106526:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff80000010652a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010652e:	49 89 c9             	mov    %rcx,%r9
ffff800000106531:	49 89 d0             	mov    %rdx,%r8
ffff800000106534:	48 89 c1             	mov    %rax,%rcx
ffff800000106537:	48 b8 30 17 00 00 00 	movabs $0x1730,%rax
ffff80000010653e:	00 00 00 
ffff800000106541:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000106545:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010654a:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010654f:	4d 89 d7             	mov    %r10,%r15
ffff800000106552:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106557:	49 bb 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r11
ffff80000010655e:	ff ff ff 
ffff800000106561:	4d 01 d3             	add    %r10,%r11
ffff800000106564:	41 ff d3             	callq  *%r11
ffff800000106567:	eb fe                	jmp    ffff800000106567 <do_virtualization_exception+0x84>

ffff800000106569 <set_sys_int>:
ffff800000106569:	55                   	push   %rbp
ffff80000010656a:	48 89 e5             	mov    %rsp,%rbp
ffff80000010656d:	41 57                	push   %r15
ffff80000010656f:	53                   	push   %rbx
ffff800000106570:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000106570 <set_sys_int+0x7>
ffff800000106577:	49 bb 78 8c 00 00 00 	movabs $0x8c78,%r11
ffff80000010657e:	00 00 00 
ffff800000106581:	4c 01 db             	add    %r11,%rbx
ffff800000106584:	48 b8 00 ff ff ff ff 	movabs $0xffffffffffffff00,%rax
ffff80000010658b:	ff ff ff 
ffff80000010658e:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106592:	48 89 c2             	mov    %rax,%rdx
ffff800000106595:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010659a:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010659f:	49 89 df             	mov    %rbx,%r15
ffff8000001065a2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001065a7:	48 b9 8c 51 ff ff ff 	movabs $0xffffffffffff518c,%rcx
ffff8000001065ae:	ff ff ff 
ffff8000001065b1:	48 01 d9             	add    %rbx,%rcx
ffff8000001065b4:	ff d1                	callq  *%rcx
ffff8000001065b6:	48 b8 30 ff ff ff ff 	movabs $0xffffffffffffff30,%rax
ffff8000001065bd:	ff ff ff 
ffff8000001065c0:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001065c4:	48 89 c2             	mov    %rax,%rdx
ffff8000001065c7:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001065cc:	bf 01 00 00 00       	mov    $0x1,%edi
ffff8000001065d1:	49 89 df             	mov    %rbx,%r15
ffff8000001065d4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001065d9:	48 b9 8c 51 ff ff ff 	movabs $0xffffffffffff518c,%rcx
ffff8000001065e0:	ff ff ff 
ffff8000001065e3:	48 01 d9             	add    %rbx,%rcx
ffff8000001065e6:	ff d1                	callq  *%rcx
ffff8000001065e8:	48 b8 e8 ff ff ff ff 	movabs $0xffffffffffffffe8,%rax
ffff8000001065ef:	ff ff ff 
ffff8000001065f2:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001065f6:	48 89 c2             	mov    %rax,%rdx
ffff8000001065f9:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001065fe:	bf 02 00 00 00       	mov    $0x2,%edi
ffff800000106603:	49 89 df             	mov    %rbx,%r15
ffff800000106606:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010660b:	48 b9 39 51 ff ff ff 	movabs $0xffffffffffff5139,%rcx
ffff800000106612:	ff ff ff 
ffff800000106615:	48 01 d9             	add    %rbx,%rcx
ffff800000106618:	ff d1                	callq  *%rcx
ffff80000010661a:	48 b8 60 ff ff ff ff 	movabs $0xffffffffffffff60,%rax
ffff800000106621:	ff ff ff 
ffff800000106624:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106628:	48 89 c2             	mov    %rax,%rdx
ffff80000010662b:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106630:	bf 03 00 00 00       	mov    $0x3,%edi
ffff800000106635:	49 89 df             	mov    %rbx,%r15
ffff800000106638:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010663d:	48 b9 df 51 ff ff ff 	movabs $0xffffffffffff51df,%rcx
ffff800000106644:	ff ff ff 
ffff800000106647:	48 01 d9             	add    %rbx,%rcx
ffff80000010664a:	ff d1                	callq  *%rcx
ffff80000010664c:	48 b8 28 ff ff ff ff 	movabs $0xffffffffffffff28,%rax
ffff800000106653:	ff ff ff 
ffff800000106656:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010665a:	48 89 c2             	mov    %rax,%rdx
ffff80000010665d:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106662:	bf 04 00 00 00       	mov    $0x4,%edi
ffff800000106667:	49 89 df             	mov    %rbx,%r15
ffff80000010666a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010666f:	48 b9 df 51 ff ff ff 	movabs $0xffffffffffff51df,%rcx
ffff800000106676:	ff ff ff 
ffff800000106679:	48 01 d9             	add    %rbx,%rcx
ffff80000010667c:	ff d1                	callq  *%rcx
ffff80000010667e:	48 b8 38 ff ff ff ff 	movabs $0xffffffffffffff38,%rax
ffff800000106685:	ff ff ff 
ffff800000106688:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010668c:	48 89 c2             	mov    %rax,%rdx
ffff80000010668f:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106694:	bf 05 00 00 00       	mov    $0x5,%edi
ffff800000106699:	49 89 df             	mov    %rbx,%r15
ffff80000010669c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001066a1:	48 b9 df 51 ff ff ff 	movabs $0xffffffffffff51df,%rcx
ffff8000001066a8:	ff ff ff 
ffff8000001066ab:	48 01 d9             	add    %rbx,%rcx
ffff8000001066ae:	ff d1                	callq  *%rcx
ffff8000001066b0:	48 b8 68 ff ff ff ff 	movabs $0xffffffffffffff68,%rax
ffff8000001066b7:	ff ff ff 
ffff8000001066ba:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001066be:	48 89 c2             	mov    %rax,%rdx
ffff8000001066c1:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001066c6:	bf 06 00 00 00       	mov    $0x6,%edi
ffff8000001066cb:	49 89 df             	mov    %rbx,%r15
ffff8000001066ce:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001066d3:	48 b9 8c 51 ff ff ff 	movabs $0xffffffffffff518c,%rcx
ffff8000001066da:	ff ff ff 
ffff8000001066dd:	48 01 d9             	add    %rbx,%rcx
ffff8000001066e0:	ff d1                	callq  *%rcx
ffff8000001066e2:	48 b8 f0 ff ff ff ff 	movabs $0xfffffffffffffff0,%rax
ffff8000001066e9:	ff ff ff 
ffff8000001066ec:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001066f0:	48 89 c2             	mov    %rax,%rdx
ffff8000001066f3:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001066f8:	bf 07 00 00 00       	mov    $0x7,%edi
ffff8000001066fd:	49 89 df             	mov    %rbx,%r15
ffff800000106700:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106705:	48 b9 8c 51 ff ff ff 	movabs $0xffffffffffff518c,%rcx
ffff80000010670c:	ff ff ff 
ffff80000010670f:	48 01 d9             	add    %rbx,%rcx
ffff800000106712:	ff d1                	callq  *%rcx
ffff800000106714:	48 b8 88 ff ff ff ff 	movabs $0xffffffffffffff88,%rax
ffff80000010671b:	ff ff ff 
ffff80000010671e:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106722:	48 89 c2             	mov    %rax,%rdx
ffff800000106725:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010672a:	bf 08 00 00 00       	mov    $0x8,%edi
ffff80000010672f:	49 89 df             	mov    %rbx,%r15
ffff800000106732:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106737:	48 b9 8c 51 ff ff ff 	movabs $0xffffffffffff518c,%rcx
ffff80000010673e:	ff ff ff 
ffff800000106741:	48 01 d9             	add    %rbx,%rcx
ffff800000106744:	ff d1                	callq  *%rcx
ffff800000106746:	48 b8 a8 ff ff ff ff 	movabs $0xffffffffffffffa8,%rax
ffff80000010674d:	ff ff ff 
ffff800000106750:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106754:	48 89 c2             	mov    %rax,%rdx
ffff800000106757:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010675c:	bf 09 00 00 00       	mov    $0x9,%edi
ffff800000106761:	49 89 df             	mov    %rbx,%r15
ffff800000106764:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106769:	48 b9 8c 51 ff ff ff 	movabs $0xffffffffffff518c,%rcx
ffff800000106770:	ff ff ff 
ffff800000106773:	48 01 d9             	add    %rbx,%rcx
ffff800000106776:	ff d1                	callq  *%rcx
ffff800000106778:	48 b8 40 ff ff ff ff 	movabs $0xffffffffffffff40,%rax
ffff80000010677f:	ff ff ff 
ffff800000106782:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106786:	48 89 c2             	mov    %rax,%rdx
ffff800000106789:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010678e:	bf 0a 00 00 00       	mov    $0xa,%edi
ffff800000106793:	49 89 df             	mov    %rbx,%r15
ffff800000106796:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010679b:	48 b9 8c 51 ff ff ff 	movabs $0xffffffffffff518c,%rcx
ffff8000001067a2:	ff ff ff 
ffff8000001067a5:	48 01 d9             	add    %rbx,%rcx
ffff8000001067a8:	ff d1                	callq  *%rcx
ffff8000001067aa:	48 b8 48 ff ff ff ff 	movabs $0xffffffffffffff48,%rax
ffff8000001067b1:	ff ff ff 
ffff8000001067b4:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001067b8:	48 89 c2             	mov    %rax,%rdx
ffff8000001067bb:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001067c0:	bf 0b 00 00 00       	mov    $0xb,%edi
ffff8000001067c5:	49 89 df             	mov    %rbx,%r15
ffff8000001067c8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001067cd:	48 b9 8c 51 ff ff ff 	movabs $0xffffffffffff518c,%rcx
ffff8000001067d4:	ff ff ff 
ffff8000001067d7:	48 01 d9             	add    %rbx,%rcx
ffff8000001067da:	ff d1                	callq  *%rcx
ffff8000001067dc:	48 b8 50 ff ff ff ff 	movabs $0xffffffffffffff50,%rax
ffff8000001067e3:	ff ff ff 
ffff8000001067e6:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001067ea:	48 89 c2             	mov    %rax,%rdx
ffff8000001067ed:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001067f2:	bf 0c 00 00 00       	mov    $0xc,%edi
ffff8000001067f7:	49 89 df             	mov    %rbx,%r15
ffff8000001067fa:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001067ff:	48 b9 8c 51 ff ff ff 	movabs $0xffffffffffff518c,%rcx
ffff800000106806:	ff ff ff 
ffff800000106809:	48 01 d9             	add    %rbx,%rcx
ffff80000010680c:	ff d1                	callq  *%rcx
ffff80000010680e:	48 b8 18 ff ff ff ff 	movabs $0xffffffffffffff18,%rax
ffff800000106815:	ff ff ff 
ffff800000106818:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010681c:	48 89 c2             	mov    %rax,%rdx
ffff80000010681f:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106824:	bf 0d 00 00 00       	mov    $0xd,%edi
ffff800000106829:	49 89 df             	mov    %rbx,%r15
ffff80000010682c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106831:	48 b9 8c 51 ff ff ff 	movabs $0xffffffffffff518c,%rcx
ffff800000106838:	ff ff ff 
ffff80000010683b:	48 01 d9             	add    %rbx,%rcx
ffff80000010683e:	ff d1                	callq  *%rcx
ffff800000106840:	48 b8 b8 ff ff ff ff 	movabs $0xffffffffffffffb8,%rax
ffff800000106847:	ff ff ff 
ffff80000010684a:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010684e:	48 89 c2             	mov    %rax,%rdx
ffff800000106851:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106856:	bf 0e 00 00 00       	mov    $0xe,%edi
ffff80000010685b:	49 89 df             	mov    %rbx,%r15
ffff80000010685e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106863:	48 b9 8c 51 ff ff ff 	movabs $0xffffffffffff518c,%rcx
ffff80000010686a:	ff ff ff 
ffff80000010686d:	48 01 d9             	add    %rbx,%rcx
ffff800000106870:	ff d1                	callq  *%rcx
ffff800000106872:	48 b8 80 ff ff ff ff 	movabs $0xffffffffffffff80,%rax
ffff800000106879:	ff ff ff 
ffff80000010687c:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106880:	48 89 c2             	mov    %rax,%rdx
ffff800000106883:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106888:	bf 10 00 00 00       	mov    $0x10,%edi
ffff80000010688d:	49 89 df             	mov    %rbx,%r15
ffff800000106890:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106895:	48 b9 8c 51 ff ff ff 	movabs $0xffffffffffff518c,%rcx
ffff80000010689c:	ff ff ff 
ffff80000010689f:	48 01 d9             	add    %rbx,%rcx
ffff8000001068a2:	ff d1                	callq  *%rcx
ffff8000001068a4:	48 b8 78 ff ff ff ff 	movabs $0xffffffffffffff78,%rax
ffff8000001068ab:	ff ff ff 
ffff8000001068ae:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001068b2:	48 89 c2             	mov    %rax,%rdx
ffff8000001068b5:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001068ba:	bf 11 00 00 00       	mov    $0x11,%edi
ffff8000001068bf:	49 89 df             	mov    %rbx,%r15
ffff8000001068c2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001068c7:	48 b9 8c 51 ff ff ff 	movabs $0xffffffffffff518c,%rcx
ffff8000001068ce:	ff ff ff 
ffff8000001068d1:	48 01 d9             	add    %rbx,%rcx
ffff8000001068d4:	ff d1                	callq  *%rcx
ffff8000001068d6:	48 b8 c8 ff ff ff ff 	movabs $0xffffffffffffffc8,%rax
ffff8000001068dd:	ff ff ff 
ffff8000001068e0:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001068e4:	48 89 c2             	mov    %rax,%rdx
ffff8000001068e7:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001068ec:	bf 12 00 00 00       	mov    $0x12,%edi
ffff8000001068f1:	49 89 df             	mov    %rbx,%r15
ffff8000001068f4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001068f9:	48 b9 8c 51 ff ff ff 	movabs $0xffffffffffff518c,%rcx
ffff800000106900:	ff ff ff 
ffff800000106903:	48 01 d9             	add    %rbx,%rcx
ffff800000106906:	ff d1                	callq  *%rcx
ffff800000106908:	48 b8 d8 ff ff ff ff 	movabs $0xffffffffffffffd8,%rax
ffff80000010690f:	ff ff ff 
ffff800000106912:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106916:	48 89 c2             	mov    %rax,%rdx
ffff800000106919:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010691e:	bf 13 00 00 00       	mov    $0x13,%edi
ffff800000106923:	49 89 df             	mov    %rbx,%r15
ffff800000106926:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010692b:	48 b9 8c 51 ff ff ff 	movabs $0xffffffffffff518c,%rcx
ffff800000106932:	ff ff ff 
ffff800000106935:	48 01 d9             	add    %rbx,%rcx
ffff800000106938:	ff d1                	callq  *%rcx
ffff80000010693a:	48 b8 98 ff ff ff ff 	movabs $0xffffffffffffff98,%rax
ffff800000106941:	ff ff ff 
ffff800000106944:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106948:	48 89 c2             	mov    %rax,%rdx
ffff80000010694b:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106950:	bf 14 00 00 00       	mov    $0x14,%edi
ffff800000106955:	49 89 df             	mov    %rbx,%r15
ffff800000106958:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010695d:	48 b9 8c 51 ff ff ff 	movabs $0xffffffffffff518c,%rcx
ffff800000106964:	ff ff ff 
ffff800000106967:	48 01 d9             	add    %rbx,%rcx
ffff80000010696a:	ff d1                	callq  *%rcx
ffff80000010696c:	90                   	nop
ffff80000010696d:	5b                   	pop    %rbx
ffff80000010696e:	41 5f                	pop    %r15
ffff800000106970:	5d                   	pop    %rbp
ffff800000106971:	c3                   	retq   

ffff800000106972 <page_init>:
ffff800000106972:	55                   	push   %rbp
ffff800000106973:	48 89 e5             	mov    %rsp,%rbp
ffff800000106976:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000106976 <page_init+0x4>
ffff80000010697d:	49 bb 72 88 00 00 00 	movabs $0x8872,%r11
ffff800000106984:	00 00 00 
ffff800000106987:	4c 01 d8             	add    %r11,%rax
ffff80000010698a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff80000010698e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000106992:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106996:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff80000010699a:	48 0b 45 f0          	or     -0x10(%rbp),%rax
ffff80000010699e:	48 89 c2             	mov    %rax,%rdx
ffff8000001069a1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001069a5:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff8000001069a9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001069ad:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001069b1:	48 85 c0             	test   %rax,%rax
ffff8000001069b4:	74 10                	je     ffff8000001069c6 <page_init+0x54>
ffff8000001069b6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001069ba:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff8000001069be:	83 e0 10             	and    $0x10,%eax
ffff8000001069c1:	48 85 c0             	test   %rax,%rax
ffff8000001069c4:	74 27                	je     ffff8000001069ed <page_init+0x7b>
ffff8000001069c6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001069ca:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001069ce:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001069d2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001069d6:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff8000001069da:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001069de:	48 8b 00             	mov    (%rax),%rax
ffff8000001069e1:	48 8b 50 48          	mov    0x48(%rax),%rdx
ffff8000001069e5:	48 83 c2 01          	add    $0x1,%rdx
ffff8000001069e9:	48 89 50 48          	mov    %rdx,0x48(%rax)
ffff8000001069ed:	b8 01 00 00 00       	mov    $0x1,%eax
ffff8000001069f2:	5d                   	pop    %rbp
ffff8000001069f3:	c3                   	retq   

ffff8000001069f4 <page_clean>:
ffff8000001069f4:	55                   	push   %rbp
ffff8000001069f5:	48 89 e5             	mov    %rsp,%rbp
ffff8000001069f8:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff8000001069f8 <page_clean+0x4>
ffff8000001069ff:	49 bb f0 87 00 00 00 	movabs $0x87f0,%r11
ffff800000106a06:	00 00 00 
ffff800000106a09:	4c 01 d8             	add    %r11,%rax
ffff800000106a0c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000106a10:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106a14:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000106a18:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff800000106a1c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106a20:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff800000106a24:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106a28:	48 8b 00             	mov    (%rax),%rax
ffff800000106a2b:	48 8b 50 48          	mov    0x48(%rax),%rdx
ffff800000106a2f:	48 83 ea 01          	sub    $0x1,%rdx
ffff800000106a33:	48 89 50 48          	mov    %rdx,0x48(%rax)
ffff800000106a37:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106a3b:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000106a3f:	48 85 c0             	test   %rax,%rax
ffff800000106a42:	75 16                	jne    ffff800000106a5a <page_clean+0x66>
ffff800000106a44:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106a48:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106a4c:	83 e0 01             	and    $0x1,%eax
ffff800000106a4f:	48 89 c2             	mov    %rax,%rdx
ffff800000106a52:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106a56:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000106a5a:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000106a5f:	5d                   	pop    %rbp
ffff800000106a60:	c3                   	retq   

ffff800000106a61 <get_page_attribute>:
ffff800000106a61:	55                   	push   %rbp
ffff800000106a62:	48 89 e5             	mov    %rsp,%rbp
ffff800000106a65:	41 57                	push   %r15
ffff800000106a67:	48 83 ec 18          	sub    $0x18,%rsp
ffff800000106a6b:	48 8d 0d f9 ff ff ff 	lea    -0x7(%rip),%rcx        # ffff800000106a6b <get_page_attribute+0xa>
ffff800000106a72:	49 bb 7d 87 00 00 00 	movabs $0x877d,%r11
ffff800000106a79:	00 00 00 
ffff800000106a7c:	4c 01 d9             	add    %r11,%rcx
ffff800000106a7f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000106a83:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
ffff800000106a88:	75 37                	jne    ffff800000106ac1 <get_page_attribute+0x60>
ffff800000106a8a:	48 b8 70 17 00 00 00 	movabs $0x1770,%rax
ffff800000106a91:	00 00 00 
ffff800000106a94:	48 8d 14 01          	lea    (%rcx,%rax,1),%rdx
ffff800000106a98:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106a9d:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106aa2:	49 89 cf             	mov    %rcx,%r15
ffff800000106aa5:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106aaa:	49 b8 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r8
ffff800000106ab1:	ff ff ff 
ffff800000106ab4:	49 01 c8             	add    %rcx,%r8
ffff800000106ab7:	41 ff d0             	callq  *%r8
ffff800000106aba:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106abf:	eb 08                	jmp    ffff800000106ac9 <get_page_attribute+0x68>
ffff800000106ac1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106ac5:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106ac9:	48 83 c4 18          	add    $0x18,%rsp
ffff800000106acd:	41 5f                	pop    %r15
ffff800000106acf:	5d                   	pop    %rbp
ffff800000106ad0:	c3                   	retq   

ffff800000106ad1 <set_page_attribute>:
ffff800000106ad1:	55                   	push   %rbp
ffff800000106ad2:	48 89 e5             	mov    %rsp,%rbp
ffff800000106ad5:	41 57                	push   %r15
ffff800000106ad7:	48 83 ec 18          	sub    $0x18,%rsp
ffff800000106adb:	48 8d 0d f9 ff ff ff 	lea    -0x7(%rip),%rcx        # ffff800000106adb <set_page_attribute+0xa>
ffff800000106ae2:	49 bb 0d 87 00 00 00 	movabs $0x870d,%r11
ffff800000106ae9:	00 00 00 
ffff800000106aec:	4c 01 d9             	add    %r11,%rcx
ffff800000106aef:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000106af3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
ffff800000106af7:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
ffff800000106afc:	75 37                	jne    ffff800000106b35 <set_page_attribute+0x64>
ffff800000106afe:	48 b8 90 17 00 00 00 	movabs $0x1790,%rax
ffff800000106b05:	00 00 00 
ffff800000106b08:	48 8d 14 01          	lea    (%rcx,%rax,1),%rdx
ffff800000106b0c:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106b11:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106b16:	49 89 cf             	mov    %rcx,%r15
ffff800000106b19:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106b1e:	49 b8 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r8
ffff800000106b25:	ff ff ff 
ffff800000106b28:	49 01 c8             	add    %rcx,%r8
ffff800000106b2b:	41 ff d0             	callq  *%r8
ffff800000106b2e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106b33:	eb 11                	jmp    ffff800000106b46 <set_page_attribute+0x75>
ffff800000106b35:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106b39:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
ffff800000106b3d:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000106b41:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000106b46:	48 83 c4 18          	add    $0x18,%rsp
ffff800000106b4a:	41 5f                	pop    %r15
ffff800000106b4c:	5d                   	pop    %rbp
ffff800000106b4d:	c3                   	retq   

ffff800000106b4e <init_mem>:
ffff800000106b4e:	55                   	push   %rbp
ffff800000106b4f:	48 89 e5             	mov    %rsp,%rbp
ffff800000106b52:	41 57                	push   %r15
ffff800000106b54:	53                   	push   %rbx
ffff800000106b55:	48 83 ec 70          	sub    $0x70,%rsp
ffff800000106b59:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000106b59 <init_mem+0xb>
ffff800000106b60:	49 bb 8f 86 00 00 00 	movabs $0x868f,%r11
ffff800000106b67:	00 00 00 
ffff800000106b6a:	4c 01 db             	add    %r11,%rbx
ffff800000106b6d:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000106b74:	00 
ffff800000106b75:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
ffff800000106b7c:	00 
ffff800000106b7d:	48 b8 b0 17 00 00 00 	movabs $0x17b0,%rax
ffff800000106b84:	00 00 00 
ffff800000106b87:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106b8b:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106b90:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000106b95:	49 89 df             	mov    %rbx,%r15
ffff800000106b98:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106b9d:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000106ba4:	ff ff ff 
ffff800000106ba7:	48 01 d9             	add    %rbx,%rcx
ffff800000106baa:	ff d1                	callq  *%rcx
ffff800000106bac:	48 b8 00 7e 00 00 00 	movabs $0xffff800000007e00,%rax
ffff800000106bb3:	80 ff ff 
ffff800000106bb6:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff800000106bba:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
ffff800000106bc1:	e9 44 01 00 00       	jmpq   ffff800000106d0a <init_mem+0x1bc>
ffff800000106bc6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106bca:	8b 48 10             	mov    0x10(%rax),%ecx
ffff800000106bcd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106bd1:	48 8b 50 08          	mov    0x8(%rax),%rdx
ffff800000106bd5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106bd9:	48 8b 00             	mov    (%rax),%rax
ffff800000106bdc:	41 89 c9             	mov    %ecx,%r9d
ffff800000106bdf:	49 89 d0             	mov    %rdx,%r8
ffff800000106be2:	48 89 c1             	mov    %rax,%rcx
ffff800000106be5:	48 b8 d5 17 00 00 00 	movabs $0x17d5,%rax
ffff800000106bec:	00 00 00 
ffff800000106bef:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106bf3:	be 00 ff 00 00       	mov    $0xff00,%esi
ffff800000106bf8:	bf ff 00 00 00       	mov    $0xff,%edi
ffff800000106bfd:	49 89 df             	mov    %rbx,%r15
ffff800000106c00:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106c05:	49 ba 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r10
ffff800000106c0c:	ff ff ff 
ffff800000106c0f:	49 01 da             	add    %rbx,%r10
ffff800000106c12:	41 ff d2             	callq  *%r10
ffff800000106c15:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106c19:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000106c1c:	83 f8 01             	cmp    $0x1,%eax
ffff800000106c1f:	75 0c                	jne    ffff800000106c2d <init_mem+0xdf>
ffff800000106c21:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106c25:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106c29:	48 01 45 e8          	add    %rax,-0x18(%rbp)
ffff800000106c2d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106c31:	48 8b 08             	mov    (%rax),%rcx
ffff800000106c34:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106c3b:	ff ff ff 
ffff800000106c3e:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000106c42:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000106c45:	48 63 d0             	movslq %eax,%rdx
ffff800000106c48:	48 89 d0             	mov    %rdx,%rax
ffff800000106c4b:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106c4f:	48 01 d0             	add    %rdx,%rax
ffff800000106c52:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106c56:	48 01 f0             	add    %rsi,%rax
ffff800000106c59:	48 89 08             	mov    %rcx,(%rax)
ffff800000106c5c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106c60:	48 8b 48 08          	mov    0x8(%rax),%rcx
ffff800000106c64:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106c6b:	ff ff ff 
ffff800000106c6e:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000106c72:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000106c75:	48 63 d0             	movslq %eax,%rdx
ffff800000106c78:	48 89 d0             	mov    %rdx,%rax
ffff800000106c7b:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106c7f:	48 01 d0             	add    %rdx,%rax
ffff800000106c82:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106c86:	48 01 f0             	add    %rsi,%rax
ffff800000106c89:	48 83 c0 08          	add    $0x8,%rax
ffff800000106c8d:	48 89 08             	mov    %rcx,(%rax)
ffff800000106c90:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106c94:	8b 48 10             	mov    0x10(%rax),%ecx
ffff800000106c97:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106c9e:	ff ff ff 
ffff800000106ca1:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000106ca5:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000106ca8:	48 63 d0             	movslq %eax,%rdx
ffff800000106cab:	48 89 d0             	mov    %rdx,%rax
ffff800000106cae:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106cb2:	48 01 d0             	add    %rdx,%rax
ffff800000106cb5:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106cb9:	48 01 f0             	add    %rsi,%rax
ffff800000106cbc:	48 83 c0 10          	add    $0x10,%rax
ffff800000106cc0:	89 08                	mov    %ecx,(%rax)
ffff800000106cc2:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000106cc5:	48 63 d0             	movslq %eax,%rdx
ffff800000106cc8:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106ccf:	ff ff ff 
ffff800000106cd2:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106cd6:	48 89 90 80 02 00 00 	mov    %rdx,0x280(%rax)
ffff800000106cdd:	48 83 45 e0 14       	addq   $0x14,-0x20(%rbp)
ffff800000106ce2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106ce6:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000106ce9:	83 f8 04             	cmp    $0x4,%eax
ffff800000106cec:	77 26                	ja     ffff800000106d14 <init_mem+0x1c6>
ffff800000106cee:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106cf2:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106cf6:	48 85 c0             	test   %rax,%rax
ffff800000106cf9:	74 19                	je     ffff800000106d14 <init_mem+0x1c6>
ffff800000106cfb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106cff:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000106d02:	85 c0                	test   %eax,%eax
ffff800000106d04:	74 0e                	je     ffff800000106d14 <init_mem+0x1c6>
ffff800000106d06:	83 45 dc 01          	addl   $0x1,-0x24(%rbp)
ffff800000106d0a:	83 7d dc 1f          	cmpl   $0x1f,-0x24(%rbp)
ffff800000106d0e:	0f 8e b2 fe ff ff    	jle    ffff800000106bc6 <init_mem+0x78>
ffff800000106d14:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106d18:	48 89 c1             	mov    %rax,%rcx
ffff800000106d1b:	48 b8 f3 17 00 00 00 	movabs $0x17f3,%rax
ffff800000106d22:	00 00 00 
ffff800000106d25:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106d29:	be ff 00 80 00       	mov    $0x8000ff,%esi
ffff800000106d2e:	bf 00 ff ff 00       	mov    $0xffff00,%edi
ffff800000106d33:	49 89 df             	mov    %rbx,%r15
ffff800000106d36:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106d3b:	49 b8 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r8
ffff800000106d42:	ff ff ff 
ffff800000106d45:	49 01 d8             	add    %rbx,%r8
ffff800000106d48:	41 ff d0             	callq  *%r8
ffff800000106d4b:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000106d52:	00 
ffff800000106d53:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
ffff800000106d5a:	e9 f1 00 00 00       	jmpq   ffff800000106e50 <init_mem+0x302>
ffff800000106d5f:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106d66:	ff ff ff 
ffff800000106d69:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000106d6d:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000106d70:	48 63 d0             	movslq %eax,%rdx
ffff800000106d73:	48 89 d0             	mov    %rdx,%rax
ffff800000106d76:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106d7a:	48 01 d0             	add    %rdx,%rax
ffff800000106d7d:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106d81:	48 01 c8             	add    %rcx,%rax
ffff800000106d84:	48 83 c0 10          	add    $0x10,%rax
ffff800000106d88:	8b 00                	mov    (%rax),%eax
ffff800000106d8a:	83 f8 01             	cmp    $0x1,%eax
ffff800000106d8d:	0f 85 b5 00 00 00    	jne    ffff800000106e48 <init_mem+0x2fa>
ffff800000106d93:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106d9a:	ff ff ff 
ffff800000106d9d:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000106da1:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000106da4:	48 63 d0             	movslq %eax,%rdx
ffff800000106da7:	48 89 d0             	mov    %rdx,%rax
ffff800000106daa:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106dae:	48 01 d0             	add    %rdx,%rax
ffff800000106db1:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106db5:	48 01 c8             	add    %rcx,%rax
ffff800000106db8:	48 8b 00             	mov    (%rax),%rax
ffff800000106dbb:	48 05 ff ff 1f 00    	add    $0x1fffff,%rax
ffff800000106dc1:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff800000106dc7:	48 89 45 90          	mov    %rax,-0x70(%rbp)
ffff800000106dcb:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106dd2:	ff ff ff 
ffff800000106dd5:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000106dd9:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000106ddc:	48 63 d0             	movslq %eax,%rdx
ffff800000106ddf:	48 89 d0             	mov    %rdx,%rax
ffff800000106de2:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106de6:	48 01 d0             	add    %rdx,%rax
ffff800000106de9:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106ded:	48 01 c8             	add    %rcx,%rax
ffff800000106df0:	48 8b 08             	mov    (%rax),%rcx
ffff800000106df3:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106dfa:	ff ff ff 
ffff800000106dfd:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000106e01:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000106e04:	48 63 d0             	movslq %eax,%rdx
ffff800000106e07:	48 89 d0             	mov    %rdx,%rax
ffff800000106e0a:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106e0e:	48 01 d0             	add    %rdx,%rax
ffff800000106e11:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106e15:	48 01 f0             	add    %rsi,%rax
ffff800000106e18:	48 83 c0 08          	add    $0x8,%rax
ffff800000106e1c:	48 8b 00             	mov    (%rax),%rax
ffff800000106e1f:	48 01 c8             	add    %rcx,%rax
ffff800000106e22:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff800000106e28:	48 89 45 88          	mov    %rax,-0x78(%rbp)
ffff800000106e2c:	48 8b 45 90          	mov    -0x70(%rbp),%rax
ffff800000106e30:	48 3b 45 88          	cmp    -0x78(%rbp),%rax
ffff800000106e34:	73 15                	jae    ffff800000106e4b <init_mem+0x2fd>
ffff800000106e36:	48 8b 45 88          	mov    -0x78(%rbp),%rax
ffff800000106e3a:	48 2b 45 90          	sub    -0x70(%rbp),%rax
ffff800000106e3e:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106e42:	48 01 45 e8          	add    %rax,-0x18(%rbp)
ffff800000106e46:	eb 04                	jmp    ffff800000106e4c <init_mem+0x2fe>
ffff800000106e48:	90                   	nop
ffff800000106e49:	eb 01                	jmp    ffff800000106e4c <init_mem+0x2fe>
ffff800000106e4b:	90                   	nop
ffff800000106e4c:	83 45 d8 01          	addl   $0x1,-0x28(%rbp)
ffff800000106e50:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000106e53:	48 63 d0             	movslq %eax,%rdx
ffff800000106e56:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106e5d:	ff ff ff 
ffff800000106e60:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106e64:	48 8b 80 80 02 00 00 	mov    0x280(%rax),%rax
ffff800000106e6b:	48 39 c2             	cmp    %rax,%rdx
ffff800000106e6e:	0f 82 eb fe ff ff    	jb     ffff800000106d5f <init_mem+0x211>
ffff800000106e74:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106e78:	48 89 c1             	mov    %rax,%rcx
ffff800000106e7b:	48 b8 09 18 00 00 00 	movabs $0x1809,%rax
ffff800000106e82:	00 00 00 
ffff800000106e85:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106e89:	be ff ff 00 00       	mov    $0xffff,%esi
ffff800000106e8e:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106e93:	49 89 df             	mov    %rbx,%r15
ffff800000106e96:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106e9b:	49 b8 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r8
ffff800000106ea2:	ff ff ff 
ffff800000106ea5:	49 01 d8             	add    %rbx,%r8
ffff800000106ea8:	41 ff d0             	callq  *%r8
ffff800000106eab:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106eb2:	ff ff ff 
ffff800000106eb5:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106eb9:	48 8b 90 80 02 00 00 	mov    0x280(%rax),%rdx
ffff800000106ec0:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106ec7:	ff ff ff 
ffff800000106eca:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000106ece:	48 89 d0             	mov    %rdx,%rax
ffff800000106ed1:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106ed5:	48 01 d0             	add    %rdx,%rax
ffff800000106ed8:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106edc:	48 01 c8             	add    %rcx,%rax
ffff800000106edf:	48 8b 08             	mov    (%rax),%rcx
ffff800000106ee2:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106ee9:	ff ff ff 
ffff800000106eec:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106ef0:	48 8b 90 80 02 00 00 	mov    0x280(%rax),%rdx
ffff800000106ef7:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106efe:	ff ff ff 
ffff800000106f01:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000106f05:	48 89 d0             	mov    %rdx,%rax
ffff800000106f08:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f0c:	48 01 d0             	add    %rdx,%rax
ffff800000106f0f:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f13:	48 01 f0             	add    %rsi,%rax
ffff800000106f16:	48 83 c0 08          	add    $0x8,%rax
ffff800000106f1a:	48 8b 00             	mov    (%rax),%rax
ffff800000106f1d:	48 01 c8             	add    %rcx,%rax
ffff800000106f20:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000106f24:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106f2b:	ff ff ff 
ffff800000106f2e:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106f32:	48 8b 80 e8 02 00 00 	mov    0x2e8(%rax),%rax
ffff800000106f39:	48 05 ff 0f 00 00    	add    $0xfff,%rax
ffff800000106f3f:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffff800000106f45:	48 89 c2             	mov    %rax,%rdx
ffff800000106f48:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106f4f:	ff ff ff 
ffff800000106f52:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106f56:	48 89 90 88 02 00 00 	mov    %rdx,0x288(%rax)
ffff800000106f5d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106f61:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106f65:	48 89 c2             	mov    %rax,%rdx
ffff800000106f68:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106f6f:	ff ff ff 
ffff800000106f72:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106f76:	48 89 90 90 02 00 00 	mov    %rdx,0x290(%rax)
ffff800000106f7d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106f81:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106f85:	48 83 c0 3f          	add    $0x3f,%rax
ffff800000106f89:	48 c1 e8 03          	shr    $0x3,%rax
ffff800000106f8d:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff800000106f91:	48 89 c2             	mov    %rax,%rdx
ffff800000106f94:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106f9b:	ff ff ff 
ffff800000106f9e:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106fa2:	48 89 90 98 02 00 00 	mov    %rdx,0x298(%rax)
ffff800000106fa9:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106fb0:	ff ff ff 
ffff800000106fb3:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106fb7:	48 8b 80 98 02 00 00 	mov    0x298(%rax),%rax
ffff800000106fbe:	48 89 c2             	mov    %rax,%rdx
ffff800000106fc1:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106fc8:	ff ff ff 
ffff800000106fcb:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106fcf:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff800000106fd6:	be ff 00 00 00       	mov    $0xff,%esi
ffff800000106fdb:	48 89 c7             	mov    %rax,%rdi
ffff800000106fde:	49 89 df             	mov    %rbx,%r15
ffff800000106fe1:	48 b8 ef b3 ff ff ff 	movabs $0xffffffffffffb3ef,%rax
ffff800000106fe8:	ff ff ff 
ffff800000106feb:	48 01 d8             	add    %rbx,%rax
ffff800000106fee:	ff d0                	callq  *%rax
ffff800000106ff0:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106ff7:	ff ff ff 
ffff800000106ffa:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106ffe:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000107005:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010700c:	ff ff ff 
ffff80000010700f:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107013:	48 8b 80 98 02 00 00 	mov    0x298(%rax),%rax
ffff80000010701a:	48 05 00 10 00 00    	add    $0x1000,%rax
ffff800000107020:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107024:	48 83 e8 08          	sub    $0x8,%rax
ffff800000107028:	48 01 d0             	add    %rdx,%rax
ffff80000010702b:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffff800000107031:	48 89 c2             	mov    %rax,%rdx
ffff800000107034:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010703b:	ff ff ff 
ffff80000010703e:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107042:	48 89 90 a0 02 00 00 	mov    %rdx,0x2a0(%rax)
ffff800000107049:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010704d:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107051:	48 89 c2             	mov    %rax,%rdx
ffff800000107054:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010705b:	ff ff ff 
ffff80000010705e:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107062:	48 89 90 a8 02 00 00 	mov    %rdx,0x2a8(%rax)
ffff800000107069:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010706d:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107071:	48 89 c2             	mov    %rax,%rdx
ffff800000107074:	48 89 d0             	mov    %rdx,%rax
ffff800000107077:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010707b:	48 01 d0             	add    %rdx,%rax
ffff80000010707e:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107082:	48 83 c0 07          	add    $0x7,%rax
ffff800000107086:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff80000010708a:	48 89 c2             	mov    %rax,%rdx
ffff80000010708d:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107094:	ff ff ff 
ffff800000107097:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010709b:	48 89 90 b0 02 00 00 	mov    %rdx,0x2b0(%rax)
ffff8000001070a2:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001070a9:	ff ff ff 
ffff8000001070ac:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001070b0:	48 8b 80 b0 02 00 00 	mov    0x2b0(%rax),%rax
ffff8000001070b7:	48 89 c2             	mov    %rax,%rdx
ffff8000001070ba:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001070c1:	ff ff ff 
ffff8000001070c4:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001070c8:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff8000001070cf:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001070d4:	48 89 c7             	mov    %rax,%rdi
ffff8000001070d7:	49 89 df             	mov    %rbx,%r15
ffff8000001070da:	48 b8 ef b3 ff ff ff 	movabs $0xffffffffffffb3ef,%rax
ffff8000001070e1:	ff ff ff 
ffff8000001070e4:	48 01 d8             	add    %rbx,%rax
ffff8000001070e7:	ff d0                	callq  *%rax
ffff8000001070e9:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001070f0:	ff ff ff 
ffff8000001070f3:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001070f7:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff8000001070fe:	48 89 c2             	mov    %rax,%rdx
ffff800000107101:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107108:	ff ff ff 
ffff80000010710b:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010710f:	48 8b 80 b0 02 00 00 	mov    0x2b0(%rax),%rax
ffff800000107116:	48 01 d0             	add    %rdx,%rax
ffff800000107119:	48 05 ff 0f 00 00    	add    $0xfff,%rax
ffff80000010711f:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffff800000107125:	48 89 c2             	mov    %rax,%rdx
ffff800000107128:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010712f:	ff ff ff 
ffff800000107132:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107136:	48 89 90 b8 02 00 00 	mov    %rdx,0x2b8(%rax)
ffff80000010713d:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107144:	ff ff ff 
ffff800000107147:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010714b:	48 c7 80 c8 02 00 00 	movq   $0x0,0x2c8(%rax)
ffff800000107152:	00 00 00 00 
ffff800000107156:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010715d:	ff ff ff 
ffff800000107160:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107164:	48 c7 80 c0 02 00 00 	movq   $0x190,0x2c0(%rax)
ffff80000010716b:	90 01 00 00 
ffff80000010716f:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107176:	ff ff ff 
ffff800000107179:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010717d:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
ffff800000107184:	48 89 c2             	mov    %rax,%rdx
ffff800000107187:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010718e:	ff ff ff 
ffff800000107191:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107195:	48 8b 80 b8 02 00 00 	mov    0x2b8(%rax),%rax
ffff80000010719c:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001071a1:	48 89 c7             	mov    %rax,%rdi
ffff8000001071a4:	49 89 df             	mov    %rbx,%r15
ffff8000001071a7:	48 b8 ef b3 ff ff ff 	movabs $0xffffffffffffb3ef,%rax
ffff8000001071ae:	ff ff ff 
ffff8000001071b1:	48 01 d8             	add    %rbx,%rax
ffff8000001071b4:	ff d0                	callq  *%rax
ffff8000001071b6:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
ffff8000001071bd:	e9 11 03 00 00       	jmpq   ffff8000001074d3 <init_mem+0x985>
ffff8000001071c2:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001071c9:	ff ff ff 
ffff8000001071cc:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff8000001071d0:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff8000001071d3:	48 63 d0             	movslq %eax,%rdx
ffff8000001071d6:	48 89 d0             	mov    %rdx,%rax
ffff8000001071d9:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001071dd:	48 01 d0             	add    %rdx,%rax
ffff8000001071e0:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001071e4:	48 01 c8             	add    %rcx,%rax
ffff8000001071e7:	48 83 c0 10          	add    $0x10,%rax
ffff8000001071eb:	8b 00                	mov    (%rax),%eax
ffff8000001071ed:	83 f8 01             	cmp    $0x1,%eax
ffff8000001071f0:	0f 85 d5 02 00 00    	jne    ffff8000001074cb <init_mem+0x97d>
ffff8000001071f6:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001071fd:	ff ff ff 
ffff800000107200:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000107204:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff800000107207:	48 63 d0             	movslq %eax,%rdx
ffff80000010720a:	48 89 d0             	mov    %rdx,%rax
ffff80000010720d:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107211:	48 01 d0             	add    %rdx,%rax
ffff800000107214:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107218:	48 01 c8             	add    %rcx,%rax
ffff80000010721b:	48 8b 00             	mov    (%rax),%rax
ffff80000010721e:	48 05 ff ff 1f 00    	add    $0x1fffff,%rax
ffff800000107224:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff80000010722a:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
ffff80000010722e:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107235:	ff ff ff 
ffff800000107238:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff80000010723c:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff80000010723f:	48 63 d0             	movslq %eax,%rdx
ffff800000107242:	48 89 d0             	mov    %rdx,%rax
ffff800000107245:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107249:	48 01 d0             	add    %rdx,%rax
ffff80000010724c:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107250:	48 01 c8             	add    %rcx,%rax
ffff800000107253:	48 8b 08             	mov    (%rax),%rcx
ffff800000107256:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010725d:	ff ff ff 
ffff800000107260:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000107264:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff800000107267:	48 63 d0             	movslq %eax,%rdx
ffff80000010726a:	48 89 d0             	mov    %rdx,%rax
ffff80000010726d:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107271:	48 01 d0             	add    %rdx,%rax
ffff800000107274:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107278:	48 01 f0             	add    %rsi,%rax
ffff80000010727b:	48 83 c0 08          	add    $0x8,%rax
ffff80000010727f:	48 8b 00             	mov    (%rax),%rax
ffff800000107282:	48 01 c8             	add    %rcx,%rax
ffff800000107285:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff80000010728b:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
ffff80000010728f:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff800000107293:	48 3b 45 a8          	cmp    -0x58(%rbp),%rax
ffff800000107297:	0f 86 31 02 00 00    	jbe    ffff8000001074ce <init_mem+0x980>
ffff80000010729d:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001072a4:	ff ff ff 
ffff8000001072a7:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001072ab:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff8000001072b2:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001072b9:	ff ff ff 
ffff8000001072bc:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001072c0:	48 8b 90 c8 02 00 00 	mov    0x2c8(%rax),%rdx
ffff8000001072c7:	48 89 d0             	mov    %rdx,%rax
ffff8000001072ca:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001072ce:	48 01 d0             	add    %rdx,%rax
ffff8000001072d1:	48 c1 e0 04          	shl    $0x4,%rax
ffff8000001072d5:	48 01 c8             	add    %rcx,%rax
ffff8000001072d8:	48 89 45 98          	mov    %rax,-0x68(%rbp)
ffff8000001072dc:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001072e3:	ff ff ff 
ffff8000001072e6:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001072ea:	48 8b 80 c8 02 00 00 	mov    0x2c8(%rax),%rax
ffff8000001072f1:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001072f5:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001072fc:	ff ff ff 
ffff8000001072ff:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107303:	48 89 90 c8 02 00 00 	mov    %rdx,0x2c8(%rax)
ffff80000010730a:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff80000010730e:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000107312:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000107316:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff80000010731a:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
ffff80000010731e:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff800000107322:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff800000107326:	48 2b 45 a8          	sub    -0x58(%rbp),%rax
ffff80000010732a:	48 89 c2             	mov    %rax,%rdx
ffff80000010732d:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107331:	48 89 50 20          	mov    %rdx,0x20(%rax)
ffff800000107335:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107339:	48 c7 40 38 00 00 00 	movq   $0x0,0x38(%rax)
ffff800000107340:	00 
ffff800000107341:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff800000107345:	48 2b 45 a8          	sub    -0x58(%rbp),%rax
ffff800000107349:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010734d:	48 89 c2             	mov    %rax,%rdx
ffff800000107350:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107354:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff800000107358:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff80000010735c:	48 c7 40 48 00 00 00 	movq   $0x0,0x48(%rax)
ffff800000107363:	00 
ffff800000107364:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107368:	48 c7 40 28 00 00 00 	movq   $0x0,0x28(%rax)
ffff80000010736f:	00 
ffff800000107370:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107374:	48 ba d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rdx
ffff80000010737b:	ff ff ff 
ffff80000010737e:	48 8b 14 13          	mov    (%rbx,%rdx,1),%rdx
ffff800000107382:	48 89 50 30          	mov    %rdx,0x30(%rax)
ffff800000107386:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff80000010738a:	48 2b 45 a8          	sub    -0x58(%rbp),%rax
ffff80000010738e:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107392:	48 89 c2             	mov    %rax,%rdx
ffff800000107395:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107399:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff80000010739d:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001073a4:	ff ff ff 
ffff8000001073a7:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001073ab:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff8000001073b2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff8000001073b6:	48 c1 e8 15          	shr    $0x15,%rax
ffff8000001073ba:	48 89 c2             	mov    %rax,%rdx
ffff8000001073bd:	48 89 d0             	mov    %rdx,%rax
ffff8000001073c0:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001073c4:	48 01 d0             	add    %rdx,%rax
ffff8000001073c7:	48 c1 e0 03          	shl    $0x3,%rax
ffff8000001073cb:	48 8d 14 01          	lea    (%rcx,%rax,1),%rdx
ffff8000001073cf:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff8000001073d3:	48 89 10             	mov    %rdx,(%rax)
ffff8000001073d6:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff8000001073da:	48 8b 00             	mov    (%rax),%rax
ffff8000001073dd:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff8000001073e1:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%rbp)
ffff8000001073e8:	e9 c5 00 00 00       	jmpq   ffff8000001074b2 <init_mem+0x964>
ffff8000001073ed:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001073f1:	48 8b 55 98          	mov    -0x68(%rbp),%rdx
ffff8000001073f5:	48 89 10             	mov    %rdx,(%rax)
ffff8000001073f8:	8b 45 c4             	mov    -0x3c(%rbp),%eax
ffff8000001073fb:	48 98                	cltq   
ffff8000001073fd:	48 c1 e0 15          	shl    $0x15,%rax
ffff800000107401:	48 89 c2             	mov    %rax,%rdx
ffff800000107404:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000107408:	48 01 c2             	add    %rax,%rdx
ffff80000010740b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010740f:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107413:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107417:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff80000010741e:	00 
ffff80000010741f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107423:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
ffff80000010742a:	00 
ffff80000010742b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010742f:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
ffff800000107436:	00 
ffff800000107437:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010743e:	ff ff ff 
ffff800000107441:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107445:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff80000010744c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107450:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107454:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000107458:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010745c:	48 01 d0             	add    %rdx,%rax
ffff80000010745f:	48 8b 10             	mov    (%rax),%rdx
ffff800000107462:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107466:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff80000010746a:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010746e:	83 e0 3f             	and    $0x3f,%eax
ffff800000107471:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000107476:	89 c1                	mov    %eax,%ecx
ffff800000107478:	48 d3 e6             	shl    %cl,%rsi
ffff80000010747b:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107482:	ff ff ff 
ffff800000107485:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107489:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
ffff800000107490:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107494:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107498:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff80000010749c:	48 c1 e0 03          	shl    $0x3,%rax
ffff8000001074a0:	48 01 c8             	add    %rcx,%rax
ffff8000001074a3:	48 31 f2             	xor    %rsi,%rdx
ffff8000001074a6:	48 89 10             	mov    %rdx,(%rax)
ffff8000001074a9:	83 45 c4 01          	addl   $0x1,-0x3c(%rbp)
ffff8000001074ad:	48 83 45 c8 28       	addq   $0x28,-0x38(%rbp)
ffff8000001074b2:	8b 45 c4             	mov    -0x3c(%rbp),%eax
ffff8000001074b5:	48 63 d0             	movslq %eax,%rdx
ffff8000001074b8:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff8000001074bc:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff8000001074c0:	48 39 c2             	cmp    %rax,%rdx
ffff8000001074c3:	0f 82 24 ff ff ff    	jb     ffff8000001073ed <init_mem+0x89f>
ffff8000001074c9:	eb 04                	jmp    ffff8000001074cf <init_mem+0x981>
ffff8000001074cb:	90                   	nop
ffff8000001074cc:	eb 01                	jmp    ffff8000001074cf <init_mem+0x981>
ffff8000001074ce:	90                   	nop
ffff8000001074cf:	83 45 d4 01          	addl   $0x1,-0x2c(%rbp)
ffff8000001074d3:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff8000001074d6:	48 63 d0             	movslq %eax,%rdx
ffff8000001074d9:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001074e0:	ff ff ff 
ffff8000001074e3:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001074e7:	48 8b 80 80 02 00 00 	mov    0x280(%rax),%rax
ffff8000001074ee:	48 39 c2             	cmp    %rax,%rdx
ffff8000001074f1:	0f 82 cb fc ff ff    	jb     ffff8000001071c2 <init_mem+0x674>
ffff8000001074f7:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001074fe:	ff ff ff 
ffff800000107501:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107505:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff80000010750c:	48 ba d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rdx
ffff800000107513:	ff ff ff 
ffff800000107516:	48 8b 14 13          	mov    (%rbx,%rdx,1),%rdx
ffff80000010751a:	48 8b 92 b8 02 00 00 	mov    0x2b8(%rdx),%rdx
ffff800000107521:	48 89 10             	mov    %rdx,(%rax)
ffff800000107524:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010752b:	ff ff ff 
ffff80000010752e:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107532:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000107539:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
ffff800000107540:	00 
ffff800000107541:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107548:	ff ff ff 
ffff80000010754b:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010754f:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000107556:	be 83 00 00 00       	mov    $0x83,%esi
ffff80000010755b:	48 89 c7             	mov    %rax,%rdi
ffff80000010755e:	48 b8 e9 78 ff ff ff 	movabs $0xffffffffffff78e9,%rax
ffff800000107565:	ff ff ff 
ffff800000107568:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff80000010756c:	ff d0                	callq  *%rax
ffff80000010756e:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107575:	ff ff ff 
ffff800000107578:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010757c:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000107583:	48 c7 40 18 01 00 00 	movq   $0x1,0x18(%rax)
ffff80000010758a:	00 
ffff80000010758b:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107592:	ff ff ff 
ffff800000107595:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107599:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff8000001075a0:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
ffff8000001075a7:	00 
ffff8000001075a8:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001075af:	ff ff ff 
ffff8000001075b2:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001075b6:	48 8b 90 c8 02 00 00 	mov    0x2c8(%rax),%rdx
ffff8000001075bd:	48 89 d0             	mov    %rdx,%rax
ffff8000001075c0:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001075c4:	48 01 d0             	add    %rdx,%rax
ffff8000001075c7:	48 c1 e0 04          	shl    $0x4,%rax
ffff8000001075cb:	48 83 c0 07          	add    $0x7,%rax
ffff8000001075cf:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff8000001075d3:	48 89 c2             	mov    %rax,%rdx
ffff8000001075d6:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001075dd:	ff ff ff 
ffff8000001075e0:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001075e4:	48 89 90 c0 02 00 00 	mov    %rdx,0x2c0(%rax)
ffff8000001075eb:	48 b8 18 8e 01 00 00 	movabs $0x18e18,%rax
ffff8000001075f2:	00 00 00 
ffff8000001075f5:	c7 04 03 00 00 00 00 	movl   $0x0,(%rbx,%rax,1)
ffff8000001075fc:	48 b8 1c 8e 01 00 00 	movabs $0x18e1c,%rax
ffff800000107603:	00 00 00 
ffff800000107606:	c7 04 03 00 00 00 00 	movl   $0x0,(%rbx,%rax,1)
ffff80000010760d:	48 b8 20 8e 01 00 00 	movabs $0x18e20,%rax
ffff800000107614:	00 00 00 
ffff800000107617:	c7 04 03 00 00 00 00 	movl   $0x0,(%rbx,%rax,1)
ffff80000010761e:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%rbp)
ffff800000107625:	e9 c8 00 00 00       	jmpq   ffff8000001076f2 <init_mem+0xba4>
ffff80000010762a:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107631:	ff ff ff 
ffff800000107634:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107638:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff80000010763f:	8b 45 c0             	mov    -0x40(%rbp),%eax
ffff800000107642:	48 63 d0             	movslq %eax,%rdx
ffff800000107645:	48 89 d0             	mov    %rdx,%rax
ffff800000107648:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010764c:	48 01 d0             	add    %rdx,%rax
ffff80000010764f:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000107653:	48 01 c8             	add    %rcx,%rax
ffff800000107656:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff80000010765a:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff80000010765e:	48 8b 70 08          	mov    0x8(%rax),%rsi
ffff800000107662:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107666:	48 8b 08             	mov    (%rax),%rcx
ffff800000107669:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff80000010766d:	48 8b 50 20          	mov    0x20(%rax),%rdx
ffff800000107671:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107675:	4c 8b 40 18          	mov    0x18(%rax),%r8
ffff800000107679:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff80000010767d:	48 8b 78 10          	mov    0x10(%rax),%rdi
ffff800000107681:	8b 45 c0             	mov    -0x40(%rbp),%eax
ffff800000107684:	48 83 ec 08          	sub    $0x8,%rsp
ffff800000107688:	56                   	push   %rsi
ffff800000107689:	51                   	push   %rcx
ffff80000010768a:	52                   	push   %rdx
ffff80000010768b:	4d 89 c1             	mov    %r8,%r9
ffff80000010768e:	49 89 f8             	mov    %rdi,%r8
ffff800000107691:	89 c1                	mov    %eax,%ecx
ffff800000107693:	48 b8 28 18 00 00 00 	movabs $0x1828,%rax
ffff80000010769a:	00 00 00 
ffff80000010769d:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001076a1:	be 00 80 ff 00       	mov    $0xff8000,%esi
ffff8000001076a6:	bf 00 ff 00 00       	mov    $0xff00,%edi
ffff8000001076ab:	49 89 df             	mov    %rbx,%r15
ffff8000001076ae:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001076b3:	49 ba 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r10
ffff8000001076ba:	ff ff ff 
ffff8000001076bd:	49 01 da             	add    %rbx,%r10
ffff8000001076c0:	41 ff d2             	callq  *%r10
ffff8000001076c3:	48 83 c4 20          	add    $0x20,%rsp
ffff8000001076c7:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff8000001076cb:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff8000001076cf:	48 b8 00 00 00 00 01 	movabs $0x100000000,%rax
ffff8000001076d6:	00 00 00 
ffff8000001076d9:	48 39 c2             	cmp    %rax,%rdx
ffff8000001076dc:	75 10                	jne    ffff8000001076ee <init_mem+0xba0>
ffff8000001076de:	48 b8 20 8e 01 00 00 	movabs $0x18e20,%rax
ffff8000001076e5:	00 00 00 
ffff8000001076e8:	8b 55 c0             	mov    -0x40(%rbp),%edx
ffff8000001076eb:	89 14 03             	mov    %edx,(%rbx,%rax,1)
ffff8000001076ee:	83 45 c0 01          	addl   $0x1,-0x40(%rbp)
ffff8000001076f2:	8b 45 c0             	mov    -0x40(%rbp),%eax
ffff8000001076f5:	48 63 d0             	movslq %eax,%rdx
ffff8000001076f8:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001076ff:	ff ff ff 
ffff800000107702:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107706:	48 8b 80 c8 02 00 00 	mov    0x2c8(%rax),%rax
ffff80000010770d:	48 39 c2             	cmp    %rax,%rdx
ffff800000107710:	0f 82 14 ff ff ff    	jb     ffff80000010762a <init_mem+0xadc>
ffff800000107716:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010771d:	ff ff ff 
ffff800000107720:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107724:	48 8b 80 b8 02 00 00 	mov    0x2b8(%rax),%rax
ffff80000010772b:	48 89 c2             	mov    %rax,%rdx
ffff80000010772e:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107735:	ff ff ff 
ffff800000107738:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010773c:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
ffff800000107743:	48 01 d0             	add    %rdx,%rax
ffff800000107746:	48 05 00 01 00 00    	add    $0x100,%rax
ffff80000010774c:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff800000107750:	48 89 c2             	mov    %rax,%rdx
ffff800000107753:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010775a:	ff ff ff 
ffff80000010775d:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107761:	48 89 90 f0 02 00 00 	mov    %rdx,0x2f0(%rax)
ffff800000107768:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010776f:	ff ff ff 
ffff800000107772:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107776:	48 8b 90 f0 02 00 00 	mov    0x2f0(%rax),%rdx
ffff80000010777d:	48 b8 00 00 00 00 00 	movabs $0x800000000000,%rax
ffff800000107784:	80 00 00 
ffff800000107787:	48 01 d0             	add    %rdx,%rax
ffff80000010778a:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010778e:	89 45 c0             	mov    %eax,-0x40(%rbp)
ffff800000107791:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%rbp)
ffff800000107798:	eb 48                	jmp    ffff8000001077e2 <init_mem+0xc94>
ffff80000010779a:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001077a1:	ff ff ff 
ffff8000001077a4:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001077a8:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff8000001077af:	8b 45 bc             	mov    -0x44(%rbp),%eax
ffff8000001077b2:	48 63 d0             	movslq %eax,%rdx
ffff8000001077b5:	48 89 d0             	mov    %rdx,%rax
ffff8000001077b8:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001077bc:	48 01 d0             	add    %rdx,%rax
ffff8000001077bf:	48 c1 e0 03          	shl    $0x3,%rax
ffff8000001077c3:	48 01 c8             	add    %rcx,%rax
ffff8000001077c6:	be 83 00 00 00       	mov    $0x83,%esi
ffff8000001077cb:	48 89 c7             	mov    %rax,%rdi
ffff8000001077ce:	48 b8 8a 77 ff ff ff 	movabs $0xffffffffffff778a,%rax
ffff8000001077d5:	ff ff ff 
ffff8000001077d8:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001077dc:	ff d0                	callq  *%rax
ffff8000001077de:	83 45 bc 01          	addl   $0x1,-0x44(%rbp)
ffff8000001077e2:	8b 45 bc             	mov    -0x44(%rbp),%eax
ffff8000001077e5:	3b 45 c0             	cmp    -0x40(%rbp),%eax
ffff8000001077e8:	7c b0                	jl     ffff80000010779a <init_mem+0xc4c>
ffff8000001077ea:	49 89 df             	mov    %rbx,%r15
ffff8000001077ed:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001077f2:	48 ba b0 b4 ff ff ff 	movabs $0xffffffffffffb4b0,%rdx
ffff8000001077f9:	ff ff ff 
ffff8000001077fc:	48 01 da             	add    %rbx,%rdx
ffff8000001077ff:	ff d2                	callq  *%rdx
ffff800000107801:	48 89 c2             	mov    %rax,%rdx
ffff800000107804:	48 b8 28 8e 01 00 00 	movabs $0x18e28,%rax
ffff80000010780b:	00 00 00 
ffff80000010780e:	48 89 14 03          	mov    %rdx,(%rbx,%rax,1)
ffff800000107812:	48 b8 28 8e 01 00 00 	movabs $0x18e28,%rax
ffff800000107819:	00 00 00 
ffff80000010781c:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107820:	48 89 c1             	mov    %rax,%rcx
ffff800000107823:	48 b8 84 18 00 00 00 	movabs $0x1884,%rax
ffff80000010782a:	00 00 00 
ffff80000010782d:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000107831:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107836:	bf ff ff 00 00       	mov    $0xffff,%edi
ffff80000010783b:	49 89 df             	mov    %rbx,%r15
ffff80000010783e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107843:	49 b8 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r8
ffff80000010784a:	ff ff ff 
ffff80000010784d:	49 01 d8             	add    %rbx,%r8
ffff800000107850:	41 ff d0             	callq  *%r8
ffff800000107853:	48 b8 28 8e 01 00 00 	movabs $0x18e28,%rax
ffff80000010785a:	00 00 00 
ffff80000010785d:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107861:	48 89 c2             	mov    %rax,%rdx
ffff800000107864:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff80000010786b:	80 ff ff 
ffff80000010786e:	48 01 d0             	add    %rdx,%rax
ffff800000107871:	48 8b 00             	mov    (%rax),%rax
ffff800000107874:	b0 00                	mov    $0x0,%al
ffff800000107876:	48 89 c1             	mov    %rax,%rcx
ffff800000107879:	48 b8 93 18 00 00 00 	movabs $0x1893,%rax
ffff800000107880:	00 00 00 
ffff800000107883:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000107887:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010788c:	bf ff ff 00 00       	mov    $0xffff,%edi
ffff800000107891:	49 89 df             	mov    %rbx,%r15
ffff800000107894:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107899:	49 b8 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r8
ffff8000001078a0:	ff ff ff 
ffff8000001078a3:	49 01 d8             	add    %rbx,%r8
ffff8000001078a6:	41 ff d0             	callq  *%r8
ffff8000001078a9:	48 b8 28 8e 01 00 00 	movabs $0x18e28,%rax
ffff8000001078b0:	00 00 00 
ffff8000001078b3:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001078b7:	48 89 c2             	mov    %rax,%rdx
ffff8000001078ba:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff8000001078c1:	80 ff ff 
ffff8000001078c4:	48 01 d0             	add    %rdx,%rax
ffff8000001078c7:	48 8b 00             	mov    (%rax),%rax
ffff8000001078ca:	b0 00                	mov    $0x0,%al
ffff8000001078cc:	48 89 c2             	mov    %rax,%rdx
ffff8000001078cf:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff8000001078d6:	80 ff ff 
ffff8000001078d9:	48 01 d0             	add    %rdx,%rax
ffff8000001078dc:	48 8b 00             	mov    (%rax),%rax
ffff8000001078df:	b0 00                	mov    $0x0,%al
ffff8000001078e1:	48 89 c1             	mov    %rax,%rcx
ffff8000001078e4:	48 b8 a3 18 00 00 00 	movabs $0x18a3,%rax
ffff8000001078eb:	00 00 00 
ffff8000001078ee:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001078f2:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001078f7:	bf ff 00 80 00       	mov    $0x8000ff,%edi
ffff8000001078fc:	49 89 df             	mov    %rbx,%r15
ffff8000001078ff:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107904:	49 b8 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r8
ffff80000010790b:	ff ff ff 
ffff80000010790e:	49 01 d8             	add    %rbx,%r8
ffff800000107911:	41 ff d0             	callq  *%r8
ffff800000107914:	90                   	nop
ffff800000107915:	48 8d 65 f0          	lea    -0x10(%rbp),%rsp
ffff800000107919:	5b                   	pop    %rbx
ffff80000010791a:	41 5f                	pop    %r15
ffff80000010791c:	5d                   	pop    %rbp
ffff80000010791d:	c3                   	retq   

ffff80000010791e <alloc_pages>:
ffff80000010791e:	55                   	push   %rbp
ffff80000010791f:	48 89 e5             	mov    %rsp,%rbp
ffff800000107922:	41 57                	push   %r15
ffff800000107924:	53                   	push   %rbx
ffff800000107925:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
ffff800000107929:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000107929 <alloc_pages+0xb>
ffff800000107930:	49 bb bf 78 00 00 00 	movabs $0x78bf,%r11
ffff800000107937:	00 00 00 
ffff80000010793a:	4c 01 db             	add    %r11,%rbx
ffff80000010793d:	89 bd 7c ff ff ff    	mov    %edi,-0x84(%rbp)
ffff800000107943:	89 b5 78 ff ff ff    	mov    %esi,-0x88(%rbp)
ffff800000107949:	48 89 95 70 ff ff ff 	mov    %rdx,-0x90(%rbp)
ffff800000107950:	48 c7 45 c0 00 00 00 	movq   $0x0,-0x40(%rbp)
ffff800000107957:	00 
ffff800000107958:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
ffff80000010795f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
ffff800000107966:	8b 85 7c ff ff ff    	mov    -0x84(%rbp),%eax
ffff80000010796c:	83 f8 02             	cmp    $0x2,%eax
ffff80000010796f:	74 26                	je     ffff800000107997 <alloc_pages+0x79>
ffff800000107971:	83 f8 04             	cmp    $0x4,%eax
ffff800000107974:	74 43                	je     ffff8000001079b9 <alloc_pages+0x9b>
ffff800000107976:	83 f8 01             	cmp    $0x1,%eax
ffff800000107979:	75 6b                	jne    ffff8000001079e6 <alloc_pages+0xc8>
ffff80000010797b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
ffff800000107982:	48 b8 18 8e 01 00 00 	movabs $0x18e18,%rax
ffff800000107989:	00 00 00 
ffff80000010798c:	8b 04 03             	mov    (%rbx,%rax,1),%eax
ffff80000010798f:	89 45 e4             	mov    %eax,-0x1c(%rbp)
ffff800000107992:	e9 88 00 00 00       	jmpq   ffff800000107a1f <alloc_pages+0x101>
ffff800000107997:	48 b8 18 8e 01 00 00 	movabs $0x18e18,%rax
ffff80000010799e:	00 00 00 
ffff8000001079a1:	8b 04 03             	mov    (%rbx,%rax,1),%eax
ffff8000001079a4:	89 45 e8             	mov    %eax,-0x18(%rbp)
ffff8000001079a7:	48 b8 1c 8e 01 00 00 	movabs $0x18e1c,%rax
ffff8000001079ae:	00 00 00 
ffff8000001079b1:	8b 04 03             	mov    (%rbx,%rax,1),%eax
ffff8000001079b4:	89 45 e4             	mov    %eax,-0x1c(%rbp)
ffff8000001079b7:	eb 66                	jmp    ffff800000107a1f <alloc_pages+0x101>
ffff8000001079b9:	48 b8 20 8e 01 00 00 	movabs $0x18e20,%rax
ffff8000001079c0:	00 00 00 
ffff8000001079c3:	8b 04 03             	mov    (%rbx,%rax,1),%eax
ffff8000001079c6:	89 45 e8             	mov    %eax,-0x18(%rbp)
ffff8000001079c9:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001079d0:	ff ff ff 
ffff8000001079d3:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001079d7:	48 8b 80 c8 02 00 00 	mov    0x2c8(%rax),%rax
ffff8000001079de:	83 e8 01             	sub    $0x1,%eax
ffff8000001079e1:	89 45 e4             	mov    %eax,-0x1c(%rbp)
ffff8000001079e4:	eb 39                	jmp    ffff800000107a1f <alloc_pages+0x101>
ffff8000001079e6:	48 b8 b8 18 00 00 00 	movabs $0x18b8,%rax
ffff8000001079ed:	00 00 00 
ffff8000001079f0:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001079f4:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001079f9:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001079fe:	49 89 df             	mov    %rbx,%r15
ffff800000107a01:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107a06:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000107a0d:	ff ff ff 
ffff800000107a10:	48 01 d9             	add    %rbx,%rcx
ffff800000107a13:	ff d1                	callq  *%rcx
ffff800000107a15:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107a1a:	e9 88 02 00 00       	jmpq   ffff800000107ca7 <alloc_pages+0x389>
ffff800000107a1f:	8b 45 e8             	mov    -0x18(%rbp),%eax
ffff800000107a22:	89 45 ec             	mov    %eax,-0x14(%rbp)
ffff800000107a25:	e9 6c 02 00 00       	jmpq   ffff800000107c96 <alloc_pages+0x378>
ffff800000107a2a:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107a31:	ff ff ff 
ffff800000107a34:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107a38:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff800000107a3f:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000107a42:	48 63 d0             	movslq %eax,%rdx
ffff800000107a45:	48 89 d0             	mov    %rdx,%rax
ffff800000107a48:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107a4c:	48 01 d0             	add    %rdx,%rax
ffff800000107a4f:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000107a53:	48 01 c8             	add    %rcx,%rax
ffff800000107a56:	48 8b 50 40          	mov    0x40(%rax),%rdx
ffff800000107a5a:	8b 85 78 ff ff ff    	mov    -0x88(%rbp),%eax
ffff800000107a60:	48 98                	cltq   
ffff800000107a62:	48 39 c2             	cmp    %rax,%rdx
ffff800000107a65:	0f 82 26 02 00 00    	jb     ffff800000107c91 <alloc_pages+0x373>
ffff800000107a6b:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107a72:	ff ff ff 
ffff800000107a75:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107a79:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff800000107a80:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000107a83:	48 63 d0             	movslq %eax,%rdx
ffff800000107a86:	48 89 d0             	mov    %rdx,%rax
ffff800000107a89:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107a8d:	48 01 d0             	add    %rdx,%rax
ffff800000107a90:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000107a94:	48 01 c8             	add    %rcx,%rax
ffff800000107a97:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
ffff800000107a9b:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000107a9f:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000107aa3:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107aa7:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff800000107aab:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000107aaf:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000107ab3:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107ab7:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
ffff800000107abb:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000107abf:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff800000107ac3:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107ac7:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
ffff800000107acb:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107acf:	83 e0 3f             	and    $0x3f,%eax
ffff800000107ad2:	ba 40 00 00 00       	mov    $0x40,%edx
ffff800000107ad7:	48 29 c2             	sub    %rax,%rdx
ffff800000107ada:	48 89 d0             	mov    %rdx,%rax
ffff800000107add:	48 89 45 98          	mov    %rax,-0x68(%rbp)
ffff800000107ae1:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107ae5:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff800000107ae9:	e9 93 01 00 00       	jmpq   ffff800000107c81 <alloc_pages+0x363>
ffff800000107aee:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107af5:	ff ff ff 
ffff800000107af8:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107afc:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff800000107b03:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000107b07:	48 c1 ea 06          	shr    $0x6,%rdx
ffff800000107b0b:	48 c1 e2 03          	shl    $0x3,%rdx
ffff800000107b0f:	48 01 d0             	add    %rdx,%rax
ffff800000107b12:	48 89 45 90          	mov    %rax,-0x70(%rbp)
ffff800000107b16:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107b1a:	83 e0 3f             	and    $0x3f,%eax
ffff800000107b1d:	48 89 45 88          	mov    %rax,-0x78(%rbp)
ffff800000107b21:	48 8b 45 88          	mov    -0x78(%rbp),%rax
ffff800000107b25:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff800000107b29:	e9 25 01 00 00       	jmpq   ffff800000107c53 <alloc_pages+0x335>
ffff800000107b2e:	48 8b 45 90          	mov    -0x70(%rbp),%rax
ffff800000107b32:	48 8b 00             	mov    (%rax),%rax
ffff800000107b35:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
ffff800000107b39:	89 d1                	mov    %edx,%ecx
ffff800000107b3b:	48 d3 e8             	shr    %cl,%rax
ffff800000107b3e:	48 89 c6             	mov    %rax,%rsi
ffff800000107b41:	48 8b 45 90          	mov    -0x70(%rbp),%rax
ffff800000107b45:	48 83 c0 08          	add    $0x8,%rax
ffff800000107b49:	48 8b 10             	mov    (%rax),%rdx
ffff800000107b4c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000107b50:	b9 40 00 00 00       	mov    $0x40,%ecx
ffff800000107b55:	29 c1                	sub    %eax,%ecx
ffff800000107b57:	89 c8                	mov    %ecx,%eax
ffff800000107b59:	89 c1                	mov    %eax,%ecx
ffff800000107b5b:	48 d3 e2             	shl    %cl,%rdx
ffff800000107b5e:	48 89 d0             	mov    %rdx,%rax
ffff800000107b61:	48 09 c6             	or     %rax,%rsi
ffff800000107b64:	48 89 f2             	mov    %rsi,%rdx
ffff800000107b67:	83 bd 78 ff ff ff 40 	cmpl   $0x40,-0x88(%rbp)
ffff800000107b6e:	74 19                	je     ffff800000107b89 <alloc_pages+0x26b>
ffff800000107b70:	8b 85 78 ff ff ff    	mov    -0x88(%rbp),%eax
ffff800000107b76:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000107b7b:	89 c1                	mov    %eax,%ecx
ffff800000107b7d:	48 d3 e6             	shl    %cl,%rsi
ffff800000107b80:	48 89 f0             	mov    %rsi,%rax
ffff800000107b83:	48 83 e8 01          	sub    $0x1,%rax
ffff800000107b87:	eb 07                	jmp    ffff800000107b90 <alloc_pages+0x272>
ffff800000107b89:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffff800000107b90:	48 21 d0             	and    %rdx,%rax
ffff800000107b93:	48 85 c0             	test   %rax,%rax
ffff800000107b96:	0f 85 b2 00 00 00    	jne    ffff800000107c4e <alloc_pages+0x330>
ffff800000107b9c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000107ba0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000107ba4:	48 01 d0             	add    %rdx,%rax
ffff800000107ba7:	48 83 e8 01          	sub    $0x1,%rax
ffff800000107bab:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
ffff800000107baf:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
ffff800000107bb6:	00 
ffff800000107bb7:	eb 5b                	jmp    ffff800000107c14 <alloc_pages+0x2f6>
ffff800000107bb9:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107bc0:	ff ff ff 
ffff800000107bc3:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107bc7:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff800000107bce:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
ffff800000107bd2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107bd6:	48 01 c2             	add    %rax,%rdx
ffff800000107bd9:	48 89 d0             	mov    %rdx,%rax
ffff800000107bdc:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107be0:	48 01 d0             	add    %rdx,%rax
ffff800000107be3:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107be7:	48 01 c8             	add    %rcx,%rax
ffff800000107bea:	48 89 45 80          	mov    %rax,-0x80(%rbp)
ffff800000107bee:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
ffff800000107bf5:	48 8b 45 80          	mov    -0x80(%rbp),%rax
ffff800000107bf9:	48 89 d6             	mov    %rdx,%rsi
ffff800000107bfc:	48 89 c7             	mov    %rax,%rdi
ffff800000107bff:	48 b8 8a 77 ff ff ff 	movabs $0xffffffffffff778a,%rax
ffff800000107c06:	ff ff ff 
ffff800000107c09:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000107c0d:	ff d0                	callq  *%rax
ffff800000107c0f:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
ffff800000107c14:	8b 85 78 ff ff ff    	mov    -0x88(%rbp),%eax
ffff800000107c1a:	48 98                	cltq   
ffff800000107c1c:	48 39 45 c8          	cmp    %rax,-0x38(%rbp)
ffff800000107c20:	72 97                	jb     ffff800000107bb9 <alloc_pages+0x29b>
ffff800000107c22:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107c29:	ff ff ff 
ffff800000107c2c:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107c30:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff800000107c37:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
ffff800000107c3b:	48 89 d0             	mov    %rdx,%rax
ffff800000107c3e:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107c42:	48 01 d0             	add    %rdx,%rax
ffff800000107c45:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107c49:	48 01 c8             	add    %rcx,%rax
ffff800000107c4c:	eb 59                	jmp    ffff800000107ca7 <alloc_pages+0x389>
ffff800000107c4e:	48 83 45 d0 01       	addq   $0x1,-0x30(%rbp)
ffff800000107c53:	b8 40 00 00 00       	mov    $0x40,%eax
ffff800000107c58:	48 2b 45 88          	sub    -0x78(%rbp),%rax
ffff800000107c5c:	48 39 45 d0          	cmp    %rax,-0x30(%rbp)
ffff800000107c60:	0f 82 c8 fe ff ff    	jb     ffff800000107b2e <alloc_pages+0x210>
ffff800000107c66:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107c6a:	83 e0 3f             	and    $0x3f,%eax
ffff800000107c6d:	48 85 c0             	test   %rax,%rax
ffff800000107c70:	74 06                	je     ffff800000107c78 <alloc_pages+0x35a>
ffff800000107c72:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107c76:	eb 05                	jmp    ffff800000107c7d <alloc_pages+0x35f>
ffff800000107c78:	b8 40 00 00 00       	mov    $0x40,%eax
ffff800000107c7d:	48 01 45 d8          	add    %rax,-0x28(%rbp)
ffff800000107c81:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107c85:	48 3b 45 a8          	cmp    -0x58(%rbp),%rax
ffff800000107c89:	0f 86 5f fe ff ff    	jbe    ffff800000107aee <alloc_pages+0x1d0>
ffff800000107c8f:	eb 01                	jmp    ffff800000107c92 <alloc_pages+0x374>
ffff800000107c91:	90                   	nop
ffff800000107c92:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
ffff800000107c96:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000107c99:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
ffff800000107c9c:	0f 8e 88 fd ff ff    	jle    ffff800000107a2a <alloc_pages+0x10c>
ffff800000107ca2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107ca7:	48 83 ec 80          	sub    $0xffffffffffffff80,%rsp
ffff800000107cab:	5b                   	pop    %rbx
ffff800000107cac:	41 5f                	pop    %r15
ffff800000107cae:	5d                   	pop    %rbp
ffff800000107caf:	c3                   	retq   

ffff800000107cb0 <free_pages>:
ffff800000107cb0:	55                   	push   %rbp
ffff800000107cb1:	48 89 e5             	mov    %rsp,%rbp
ffff800000107cb4:	41 57                	push   %r15
ffff800000107cb6:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000107cba:	4c 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%r8        # ffff800000107cba <free_pages+0xa>
ffff800000107cc1:	49 bb 2e 75 00 00 00 	movabs $0x752e,%r11
ffff800000107cc8:	00 00 00 
ffff800000107ccb:	4d 01 d8             	add    %r11,%r8
ffff800000107cce:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000107cd2:	89 75 d4             	mov    %esi,-0x2c(%rbp)
ffff800000107cd5:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
ffff800000107cda:	75 34                	jne    ffff800000107d10 <free_pages+0x60>
ffff800000107cdc:	48 b8 e0 18 00 00 00 	movabs $0x18e0,%rax
ffff800000107ce3:	00 00 00 
ffff800000107ce6:	49 8d 14 00          	lea    (%r8,%rax,1),%rdx
ffff800000107cea:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107cef:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000107cf4:	4d 89 c7             	mov    %r8,%r15
ffff800000107cf7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107cfc:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000107d03:	ff ff ff 
ffff800000107d06:	4c 01 c1             	add    %r8,%rcx
ffff800000107d09:	ff d1                	callq  *%rcx
ffff800000107d0b:	e9 0e 01 00 00       	jmpq   ffff800000107e1e <free_pages+0x16e>
ffff800000107d10:	83 7d d4 3f          	cmpl   $0x3f,-0x2c(%rbp)
ffff800000107d14:	7f 06                	jg     ffff800000107d1c <free_pages+0x6c>
ffff800000107d16:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
ffff800000107d1a:	7f 34                	jg     ffff800000107d50 <free_pages+0xa0>
ffff800000107d1c:	48 b8 08 19 00 00 00 	movabs $0x1908,%rax
ffff800000107d23:	00 00 00 
ffff800000107d26:	49 8d 14 00          	lea    (%r8,%rax,1),%rdx
ffff800000107d2a:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107d2f:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000107d34:	4d 89 c7             	mov    %r8,%r15
ffff800000107d37:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107d3c:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000107d43:	ff ff ff 
ffff800000107d46:	4c 01 c1             	add    %r8,%rcx
ffff800000107d49:	ff d1                	callq  *%rcx
ffff800000107d4b:	e9 ce 00 00 00       	jmpq   ffff800000107e1e <free_pages+0x16e>
ffff800000107d50:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
ffff800000107d57:	e9 b6 00 00 00       	jmpq   ffff800000107e12 <free_pages+0x162>
ffff800000107d5c:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107d63:	ff ff ff 
ffff800000107d66:	49 8b 04 00          	mov    (%r8,%rax,1),%rax
ffff800000107d6a:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000107d71:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107d75:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107d79:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000107d7d:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107d81:	48 01 d0             	add    %rdx,%rax
ffff800000107d84:	48 8b 10             	mov    (%rax),%rdx
ffff800000107d87:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107d8b:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107d8f:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107d93:	83 e0 3f             	and    $0x3f,%eax
ffff800000107d96:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000107d9b:	89 c1                	mov    %eax,%ecx
ffff800000107d9d:	48 d3 e6             	shl    %cl,%rsi
ffff800000107da0:	48 89 f0             	mov    %rsi,%rax
ffff800000107da3:	48 f7 d0             	not    %rax
ffff800000107da6:	48 89 c6             	mov    %rax,%rsi
ffff800000107da9:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107db0:	ff ff ff 
ffff800000107db3:	49 8b 04 00          	mov    (%r8,%rax,1),%rax
ffff800000107db7:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
ffff800000107dbe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107dc2:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107dc6:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000107dca:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107dce:	48 01 c8             	add    %rcx,%rax
ffff800000107dd1:	48 21 f2             	and    %rsi,%rdx
ffff800000107dd4:	48 89 10             	mov    %rdx,(%rax)
ffff800000107dd7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107ddb:	48 8b 00             	mov    (%rax),%rax
ffff800000107dde:	48 8b 50 38          	mov    0x38(%rax),%rdx
ffff800000107de2:	48 83 ea 01          	sub    $0x1,%rdx
ffff800000107de6:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff800000107dea:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107dee:	48 8b 00             	mov    (%rax),%rax
ffff800000107df1:	48 8b 50 40          	mov    0x40(%rax),%rdx
ffff800000107df5:	48 83 c2 01          	add    $0x1,%rdx
ffff800000107df9:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff800000107dfd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107e01:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff800000107e08:	00 
ffff800000107e09:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
ffff800000107e0d:	48 83 45 d8 28       	addq   $0x28,-0x28(%rbp)
ffff800000107e12:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000107e15:	3b 45 d4             	cmp    -0x2c(%rbp),%eax
ffff800000107e18:	0f 8c 3e ff ff ff    	jl     ffff800000107d5c <free_pages+0xac>
ffff800000107e1e:	48 83 c4 28          	add    $0x28,%rsp
ffff800000107e22:	41 5f                	pop    %r15
ffff800000107e24:	5d                   	pop    %rbp
ffff800000107e25:	c3                   	retq   

ffff800000107e26 <kmalloc>:
ffff800000107e26:	55                   	push   %rbp
ffff800000107e27:	48 89 e5             	mov    %rsp,%rbp
ffff800000107e2a:	41 57                	push   %r15
ffff800000107e2c:	53                   	push   %rbx
ffff800000107e2d:	48 83 ec 30          	sub    $0x30,%rsp
ffff800000107e31:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000107e31 <kmalloc+0xb>
ffff800000107e38:	49 bb b7 73 00 00 00 	movabs $0x73b7,%r11
ffff800000107e3f:	00 00 00 
ffff800000107e42:	4c 01 db             	add    %r11,%rbx
ffff800000107e45:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
ffff800000107e49:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
ffff800000107e4d:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000107e54:	00 
ffff800000107e55:	48 81 7d c8 00 00 10 	cmpq   $0x100000,-0x38(%rbp)
ffff800000107e5c:	00 
ffff800000107e5d:	76 39                	jbe    ffff800000107e98 <kmalloc+0x72>
ffff800000107e5f:	48 b8 30 19 00 00 00 	movabs $0x1930,%rax
ffff800000107e66:	00 00 00 
ffff800000107e69:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000107e6d:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107e72:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000107e77:	49 89 df             	mov    %rbx,%r15
ffff800000107e7a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107e7f:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000107e86:	ff ff ff 
ffff800000107e89:	48 01 d9             	add    %rbx,%rcx
ffff800000107e8c:	ff d1                	callq  *%rcx
ffff800000107e8e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107e93:	e9 ed 04 00 00       	jmpq   ffff800000108385 <kmalloc+0x55f>
ffff800000107e98:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
ffff800000107e9f:	eb 63                	jmp    ffff800000107f04 <kmalloc+0xde>
ffff800000107ea1:	48 b8 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rax
ffff800000107ea8:	ff ff ff 
ffff800000107eab:	8b 55 e4             	mov    -0x1c(%rbp),%edx
ffff800000107eae:	48 63 d2             	movslq %edx,%rdx
ffff800000107eb1:	48 8d 0c 03          	lea    (%rbx,%rax,1),%rcx
ffff800000107eb5:	48 89 d0             	mov    %rdx,%rax
ffff800000107eb8:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107ebc:	48 29 d0             	sub    %rdx,%rax
ffff800000107ebf:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107ec3:	48 01 c8             	add    %rcx,%rax
ffff800000107ec6:	48 8b 00             	mov    (%rax),%rax
ffff800000107ec9:	48 39 45 c8          	cmp    %rax,-0x38(%rbp)
ffff800000107ecd:	77 31                	ja     ffff800000107f00 <kmalloc+0xda>
ffff800000107ecf:	48 b9 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rcx
ffff800000107ed6:	ff ff ff 
ffff800000107ed9:	8b 45 e4             	mov    -0x1c(%rbp),%eax
ffff800000107edc:	48 63 d0             	movslq %eax,%rdx
ffff800000107edf:	48 89 d0             	mov    %rdx,%rax
ffff800000107ee2:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107ee6:	48 29 d0             	sub    %rdx,%rax
ffff800000107ee9:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107eed:	48 01 d8             	add    %rbx,%rax
ffff800000107ef0:	48 01 c8             	add    %rcx,%rax
ffff800000107ef3:	48 83 c0 18          	add    $0x18,%rax
ffff800000107ef7:	48 8b 00             	mov    (%rax),%rax
ffff800000107efa:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000107efe:	eb 0a                	jmp    ffff800000107f0a <kmalloc+0xe4>
ffff800000107f00:	83 45 e4 01          	addl   $0x1,-0x1c(%rbp)
ffff800000107f04:	83 7d e4 0f          	cmpl   $0xf,-0x1c(%rbp)
ffff800000107f08:	7e 97                	jle    ffff800000107ea1 <kmalloc+0x7b>
ffff800000107f0a:	48 b8 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rax
ffff800000107f11:	ff ff ff 
ffff800000107f14:	8b 55 e4             	mov    -0x1c(%rbp),%edx
ffff800000107f17:	48 63 d2             	movslq %edx,%rdx
ffff800000107f1a:	48 8d 0c 03          	lea    (%rbx,%rax,1),%rcx
ffff800000107f1e:	48 89 d0             	mov    %rdx,%rax
ffff800000107f21:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107f25:	48 29 d0             	sub    %rdx,%rax
ffff800000107f28:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107f2c:	48 01 c8             	add    %rcx,%rax
ffff800000107f2f:	48 83 c0 10          	add    $0x10,%rax
ffff800000107f33:	48 8b 00             	mov    (%rax),%rax
ffff800000107f36:	48 85 c0             	test   %rax,%rax
ffff800000107f39:	74 73                	je     ffff800000107fae <kmalloc+0x188>
ffff800000107f3b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107f3f:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff800000107f43:	48 85 c0             	test   %rax,%rax
ffff800000107f46:	0f 85 03 02 00 00    	jne    ffff80000010814f <kmalloc+0x329>
ffff800000107f4c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107f50:	48 89 c7             	mov    %rax,%rdi
ffff800000107f53:	49 89 df             	mov    %rbx,%r15
ffff800000107f56:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107f5b:	48 ba d0 b6 ff ff ff 	movabs $0xffffffffffffb6d0,%rdx
ffff800000107f62:	ff ff ff 
ffff800000107f65:	48 01 da             	add    %rbx,%rdx
ffff800000107f68:	ff d2                	callq  *%rdx
ffff800000107f6a:	48 98                	cltq   
ffff800000107f6c:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff800000107f70:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107f74:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000107f78:	48 b9 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rcx
ffff800000107f7f:	ff ff ff 
ffff800000107f82:	8b 45 e4             	mov    -0x1c(%rbp),%eax
ffff800000107f85:	48 63 d0             	movslq %eax,%rdx
ffff800000107f88:	48 89 d0             	mov    %rdx,%rax
ffff800000107f8b:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107f8f:	48 29 d0             	sub    %rdx,%rax
ffff800000107f92:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107f96:	48 01 d8             	add    %rbx,%rax
ffff800000107f99:	48 01 c8             	add    %rcx,%rax
ffff800000107f9c:	48 83 c0 18          	add    $0x18,%rax
ffff800000107fa0:	48 8b 00             	mov    (%rax),%rax
ffff800000107fa3:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
ffff800000107fa7:	75 92                	jne    ffff800000107f3b <kmalloc+0x115>
ffff800000107fa9:	e9 a2 01 00 00       	jmpq   ffff800000108150 <kmalloc+0x32a>
ffff800000107fae:	48 b8 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rax
ffff800000107fb5:	ff ff ff 
ffff800000107fb8:	8b 55 e4             	mov    -0x1c(%rbp),%edx
ffff800000107fbb:	48 63 d2             	movslq %edx,%rdx
ffff800000107fbe:	48 8d 0c 03          	lea    (%rbx,%rax,1),%rcx
ffff800000107fc2:	48 89 d0             	mov    %rdx,%rax
ffff800000107fc5:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107fc9:	48 29 d0             	sub    %rdx,%rax
ffff800000107fcc:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107fd0:	48 01 c8             	add    %rcx,%rax
ffff800000107fd3:	48 8b 00             	mov    (%rax),%rax
ffff800000107fd6:	48 89 c7             	mov    %rax,%rdi
ffff800000107fd9:	48 b8 a6 91 ff ff ff 	movabs $0xffffffffffff91a6,%rax
ffff800000107fe0:	ff ff ff 
ffff800000107fe3:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000107fe7:	ff d0                	callq  *%rax
ffff800000107fe9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000107fed:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
ffff800000107ff2:	75 39                	jne    ffff80000010802d <kmalloc+0x207>
ffff800000107ff4:	48 b8 68 19 00 00 00 	movabs $0x1968,%rax
ffff800000107ffb:	00 00 00 
ffff800000107ffe:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000108002:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108007:	bf ff 00 00 00       	mov    $0xff,%edi
ffff80000010800c:	49 89 df             	mov    %rbx,%r15
ffff80000010800f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108014:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff80000010801b:	ff ff ff 
ffff80000010801e:	48 01 d9             	add    %rbx,%rcx
ffff800000108021:	ff d1                	callq  *%rcx
ffff800000108023:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108028:	e9 58 03 00 00       	jmpq   ffff800000108385 <kmalloc+0x55f>
ffff80000010802d:	48 b8 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rax
ffff800000108034:	ff ff ff 
ffff800000108037:	8b 55 e4             	mov    -0x1c(%rbp),%edx
ffff80000010803a:	48 63 d2             	movslq %edx,%rdx
ffff80000010803d:	48 8d 0c 03          	lea    (%rbx,%rax,1),%rcx
ffff800000108041:	48 89 d0             	mov    %rdx,%rax
ffff800000108044:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108048:	48 29 d0             	sub    %rdx,%rax
ffff80000010804b:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010804f:	48 01 c8             	add    %rcx,%rax
ffff800000108052:	48 83 c0 10          	add    $0x10,%rax
ffff800000108056:	48 8b 10             	mov    (%rax),%rdx
ffff800000108059:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010805d:	48 8b 40 38          	mov    0x38(%rax),%rax
ffff800000108061:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
ffff800000108065:	48 b8 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rax
ffff80000010806c:	ff ff ff 
ffff80000010806f:	8b 55 e4             	mov    -0x1c(%rbp),%edx
ffff800000108072:	48 63 d2             	movslq %edx,%rdx
ffff800000108075:	48 8d 34 03          	lea    (%rbx,%rax,1),%rsi
ffff800000108079:	48 89 d0             	mov    %rdx,%rax
ffff80000010807c:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108080:	48 29 d0             	sub    %rdx,%rax
ffff800000108083:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108087:	48 01 f0             	add    %rsi,%rax
ffff80000010808a:	48 83 c0 10          	add    $0x10,%rax
ffff80000010808e:	48 89 08             	mov    %rcx,(%rax)
ffff800000108091:	48 83 ec 08          	sub    $0x8,%rsp
ffff800000108095:	48 b8 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rax
ffff80000010809c:	ff ff ff 
ffff80000010809f:	8b 55 e4             	mov    -0x1c(%rbp),%edx
ffff8000001080a2:	48 63 d2             	movslq %edx,%rdx
ffff8000001080a5:	48 8d 0c 03          	lea    (%rbx,%rax,1),%rcx
ffff8000001080a9:	48 89 d0             	mov    %rdx,%rax
ffff8000001080ac:	48 c1 e0 03          	shl    $0x3,%rax
ffff8000001080b0:	48 29 d0             	sub    %rdx,%rax
ffff8000001080b3:	48 c1 e0 03          	shl    $0x3,%rax
ffff8000001080b7:	48 01 c8             	add    %rcx,%rax
ffff8000001080ba:	ff 70 30             	pushq  0x30(%rax)
ffff8000001080bd:	ff 70 28             	pushq  0x28(%rax)
ffff8000001080c0:	ff 70 20             	pushq  0x20(%rax)
ffff8000001080c3:	ff 70 18             	pushq  0x18(%rax)
ffff8000001080c6:	ff 70 10             	pushq  0x10(%rax)
ffff8000001080c9:	ff 70 08             	pushq  0x8(%rax)
ffff8000001080cc:	ff 30                	pushq  (%rax)
ffff8000001080ce:	48 b8 90 19 00 00 00 	movabs $0x1990,%rax
ffff8000001080d5:	00 00 00 
ffff8000001080d8:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001080dc:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001080e1:	bf ff 00 00 00       	mov    $0xff,%edi
ffff8000001080e6:	49 89 df             	mov    %rbx,%r15
ffff8000001080e9:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001080ee:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff8000001080f5:	ff ff ff 
ffff8000001080f8:	48 01 d9             	add    %rbx,%rcx
ffff8000001080fb:	ff d1                	callq  *%rcx
ffff8000001080fd:	48 83 c4 40          	add    $0x40,%rsp
ffff800000108101:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
ffff800000108105:	48 be 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rsi
ffff80000010810c:	ff ff ff 
ffff80000010810f:	8b 45 e4             	mov    -0x1c(%rbp),%eax
ffff800000108112:	48 63 d0             	movslq %eax,%rdx
ffff800000108115:	48 89 d0             	mov    %rdx,%rax
ffff800000108118:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010811c:	48 29 d0             	sub    %rdx,%rax
ffff80000010811f:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108123:	48 01 d8             	add    %rbx,%rax
ffff800000108126:	48 01 f0             	add    %rsi,%rax
ffff800000108129:	48 83 c0 18          	add    $0x18,%rax
ffff80000010812d:	48 8b 00             	mov    (%rax),%rax
ffff800000108130:	48 89 ce             	mov    %rcx,%rsi
ffff800000108133:	48 89 c7             	mov    %rax,%rdi
ffff800000108136:	49 89 df             	mov    %rbx,%r15
ffff800000108139:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010813e:	48 ba f0 b5 ff ff ff 	movabs $0xffffffffffffb5f0,%rdx
ffff800000108145:	ff ff ff 
ffff800000108148:	48 01 da             	add    %rbx,%rdx
ffff80000010814b:	ff d2                	callq  *%rdx
ffff80000010814d:	eb 01                	jmp    ffff800000108150 <kmalloc+0x32a>
ffff80000010814f:	90                   	nop
ffff800000108150:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
ffff800000108157:	e9 de 01 00 00       	jmpq   ffff80000010833a <kmalloc+0x514>
ffff80000010815c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108160:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff800000108164:	8b 55 e0             	mov    -0x20(%rbp),%edx
ffff800000108167:	c1 fa 06             	sar    $0x6,%edx
ffff80000010816a:	48 63 d2             	movslq %edx,%rdx
ffff80000010816d:	48 c1 e2 03          	shl    $0x3,%rdx
ffff800000108171:	48 01 d0             	add    %rdx,%rax
ffff800000108174:	48 8b 00             	mov    (%rax),%rax
ffff800000108177:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
ffff80000010817b:	75 09                	jne    ffff800000108186 <kmalloc+0x360>
ffff80000010817d:	83 45 e0 3f          	addl   $0x3f,-0x20(%rbp)
ffff800000108181:	e9 b0 01 00 00       	jmpq   ffff800000108336 <kmalloc+0x510>
ffff800000108186:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010818a:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff80000010818e:	8b 55 e0             	mov    -0x20(%rbp),%edx
ffff800000108191:	c1 fa 06             	sar    $0x6,%edx
ffff800000108194:	48 63 d2             	movslq %edx,%rdx
ffff800000108197:	48 c1 e2 03          	shl    $0x3,%rdx
ffff80000010819b:	48 01 d0             	add    %rdx,%rax
ffff80000010819e:	48 8b 30             	mov    (%rax),%rsi
ffff8000001081a1:	8b 45 e0             	mov    -0x20(%rbp),%eax
ffff8000001081a4:	99                   	cltd   
ffff8000001081a5:	c1 ea 1a             	shr    $0x1a,%edx
ffff8000001081a8:	01 d0                	add    %edx,%eax
ffff8000001081aa:	83 e0 3f             	and    $0x3f,%eax
ffff8000001081ad:	29 d0                	sub    %edx,%eax
ffff8000001081af:	89 c1                	mov    %eax,%ecx
ffff8000001081b1:	48 d3 ee             	shr    %cl,%rsi
ffff8000001081b4:	48 89 f0             	mov    %rsi,%rax
ffff8000001081b7:	83 e0 01             	and    $0x1,%eax
ffff8000001081ba:	48 85 c0             	test   %rax,%rax
ffff8000001081bd:	0f 85 73 01 00 00    	jne    ffff800000108336 <kmalloc+0x510>
ffff8000001081c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001081c7:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff8000001081cb:	8b 55 e0             	mov    -0x20(%rbp),%edx
ffff8000001081ce:	c1 fa 06             	sar    $0x6,%edx
ffff8000001081d1:	48 63 d2             	movslq %edx,%rdx
ffff8000001081d4:	48 c1 e2 03          	shl    $0x3,%rdx
ffff8000001081d8:	48 01 d0             	add    %rdx,%rax
ffff8000001081db:	48 8b 30             	mov    (%rax),%rsi
ffff8000001081de:	8b 45 e0             	mov    -0x20(%rbp),%eax
ffff8000001081e1:	99                   	cltd   
ffff8000001081e2:	c1 ea 1a             	shr    $0x1a,%edx
ffff8000001081e5:	01 d0                	add    %edx,%eax
ffff8000001081e7:	83 e0 3f             	and    $0x3f,%eax
ffff8000001081ea:	29 d0                	sub    %edx,%eax
ffff8000001081ec:	ba 01 00 00 00       	mov    $0x1,%edx
ffff8000001081f1:	89 c1                	mov    %eax,%ecx
ffff8000001081f3:	48 d3 e2             	shl    %cl,%rdx
ffff8000001081f6:	48 89 d1             	mov    %rdx,%rcx
ffff8000001081f9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001081fd:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff800000108201:	8b 55 e0             	mov    -0x20(%rbp),%edx
ffff800000108204:	c1 fa 06             	sar    $0x6,%edx
ffff800000108207:	48 63 d2             	movslq %edx,%rdx
ffff80000010820a:	48 c1 e2 03          	shl    $0x3,%rdx
ffff80000010820e:	48 01 d0             	add    %rdx,%rax
ffff800000108211:	48 09 ce             	or     %rcx,%rsi
ffff800000108214:	48 89 f2             	mov    %rsi,%rdx
ffff800000108217:	48 89 10             	mov    %rdx,(%rax)
ffff80000010821a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010821e:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000108222:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000108226:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010822a:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff80000010822e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108232:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff800000108236:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff80000010823a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010823e:	48 89 50 20          	mov    %rdx,0x20(%rax)
ffff800000108242:	48 b8 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rax
ffff800000108249:	ff ff ff 
ffff80000010824c:	8b 55 e4             	mov    -0x1c(%rbp),%edx
ffff80000010824f:	48 63 d2             	movslq %edx,%rdx
ffff800000108252:	48 8d 0c 03          	lea    (%rbx,%rax,1),%rcx
ffff800000108256:	48 89 d0             	mov    %rdx,%rax
ffff800000108259:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010825d:	48 29 d0             	sub    %rdx,%rax
ffff800000108260:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108264:	48 01 c8             	add    %rcx,%rax
ffff800000108267:	48 83 c0 10          	add    $0x10,%rax
ffff80000010826b:	48 8b 00             	mov    (%rax),%rax
ffff80000010826e:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
ffff800000108272:	48 b8 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rax
ffff800000108279:	ff ff ff 
ffff80000010827c:	8b 55 e4             	mov    -0x1c(%rbp),%edx
ffff80000010827f:	48 63 d2             	movslq %edx,%rdx
ffff800000108282:	48 8d 34 03          	lea    (%rbx,%rax,1),%rsi
ffff800000108286:	48 89 d0             	mov    %rdx,%rax
ffff800000108289:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010828d:	48 29 d0             	sub    %rdx,%rax
ffff800000108290:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108294:	48 01 f0             	add    %rsi,%rax
ffff800000108297:	48 83 c0 10          	add    $0x10,%rax
ffff80000010829b:	48 89 08             	mov    %rcx,(%rax)
ffff80000010829e:	48 b9 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rcx
ffff8000001082a5:	ff ff ff 
ffff8000001082a8:	8b 45 e4             	mov    -0x1c(%rbp),%eax
ffff8000001082ab:	48 63 d0             	movslq %eax,%rdx
ffff8000001082ae:	48 89 d0             	mov    %rdx,%rax
ffff8000001082b1:	48 c1 e0 03          	shl    $0x3,%rax
ffff8000001082b5:	48 29 d0             	sub    %rdx,%rax
ffff8000001082b8:	48 c1 e0 03          	shl    $0x3,%rax
ffff8000001082bc:	48 01 d8             	add    %rbx,%rax
ffff8000001082bf:	48 01 c8             	add    %rcx,%rax
ffff8000001082c2:	48 83 c0 08          	add    $0x8,%rax
ffff8000001082c6:	48 8b 00             	mov    (%rax),%rax
ffff8000001082c9:	48 8d 48 01          	lea    0x1(%rax),%rcx
ffff8000001082cd:	48 be 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rsi
ffff8000001082d4:	ff ff ff 
ffff8000001082d7:	8b 45 e4             	mov    -0x1c(%rbp),%eax
ffff8000001082da:	48 63 d0             	movslq %eax,%rdx
ffff8000001082dd:	48 89 d0             	mov    %rdx,%rax
ffff8000001082e0:	48 c1 e0 03          	shl    $0x3,%rax
ffff8000001082e4:	48 29 d0             	sub    %rdx,%rax
ffff8000001082e7:	48 c1 e0 03          	shl    $0x3,%rax
ffff8000001082eb:	48 01 d8             	add    %rbx,%rax
ffff8000001082ee:	48 01 f0             	add    %rsi,%rax
ffff8000001082f1:	48 83 c0 08          	add    $0x8,%rax
ffff8000001082f5:	48 89 08             	mov    %rcx,(%rax)
ffff8000001082f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001082fc:	48 8b 48 28          	mov    0x28(%rax),%rcx
ffff800000108300:	48 b8 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rax
ffff800000108307:	ff ff ff 
ffff80000010830a:	8b 55 e4             	mov    -0x1c(%rbp),%edx
ffff80000010830d:	48 63 d2             	movslq %edx,%rdx
ffff800000108310:	48 8d 34 03          	lea    (%rbx,%rax,1),%rsi
ffff800000108314:	48 89 d0             	mov    %rdx,%rax
ffff800000108317:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010831b:	48 29 d0             	sub    %rdx,%rax
ffff80000010831e:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108322:	48 01 f0             	add    %rsi,%rax
ffff800000108325:	48 8b 10             	mov    (%rax),%rdx
ffff800000108328:	8b 45 e0             	mov    -0x20(%rbp),%eax
ffff80000010832b:	48 98                	cltq   
ffff80000010832d:	48 0f af c2          	imul   %rdx,%rax
ffff800000108331:	48 01 c8             	add    %rcx,%rax
ffff800000108334:	eb 4f                	jmp    ffff800000108385 <kmalloc+0x55f>
ffff800000108336:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
ffff80000010833a:	8b 45 e0             	mov    -0x20(%rbp),%eax
ffff80000010833d:	48 63 d0             	movslq %eax,%rdx
ffff800000108340:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108344:	48 8b 40 38          	mov    0x38(%rax),%rax
ffff800000108348:	48 39 c2             	cmp    %rax,%rdx
ffff80000010834b:	0f 82 0b fe ff ff    	jb     ffff80000010815c <kmalloc+0x336>
ffff800000108351:	48 b8 c0 19 00 00 00 	movabs $0x19c0,%rax
ffff800000108358:	00 00 00 
ffff80000010835b:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010835f:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108364:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108369:	49 89 df             	mov    %rbx,%r15
ffff80000010836c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108371:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000108378:	ff ff ff 
ffff80000010837b:	48 01 d9             	add    %rbx,%rcx
ffff80000010837e:	ff d1                	callq  *%rcx
ffff800000108380:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108385:	48 8d 65 f0          	lea    -0x10(%rbp),%rsp
ffff800000108389:	5b                   	pop    %rbx
ffff80000010838a:	41 5f                	pop    %r15
ffff80000010838c:	5d                   	pop    %rbp
ffff80000010838d:	c3                   	retq   

ffff80000010838e <kmalloc_create>:
ffff80000010838e:	55                   	push   %rbp
ffff80000010838f:	48 89 e5             	mov    %rsp,%rbp
ffff800000108392:	41 57                	push   %r15
ffff800000108394:	53                   	push   %rbx
ffff800000108395:	48 83 ec 40          	sub    $0x40,%rsp
ffff800000108399:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000108399 <kmalloc_create+0xb>
ffff8000001083a0:	49 bb 4f 6e 00 00 00 	movabs $0x6e4f,%r11
ffff8000001083a7:	00 00 00 
ffff8000001083aa:	4c 01 db             	add    %r11,%rbx
ffff8000001083ad:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
ffff8000001083b1:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001083b8:	00 
ffff8000001083b9:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
ffff8000001083c0:	00 
ffff8000001083c1:	48 c7 45 d0 00 00 00 	movq   $0x0,-0x30(%rbp)
ffff8000001083c8:	00 
ffff8000001083c9:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
ffff8000001083d0:	00 
ffff8000001083d1:	ba 00 00 00 00       	mov    $0x0,%edx
ffff8000001083d6:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001083db:	bf 02 00 00 00       	mov    $0x2,%edi
ffff8000001083e0:	48 b8 36 87 ff ff ff 	movabs $0xffffffffffff8736,%rax
ffff8000001083e7:	ff ff ff 
ffff8000001083ea:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001083ee:	ff d0                	callq  *%rax
ffff8000001083f0:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff8000001083f4:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
ffff8000001083f9:	75 39                	jne    ffff800000108434 <kmalloc_create+0xa6>
ffff8000001083fb:	48 b8 e8 19 00 00 00 	movabs $0x19e8,%rax
ffff800000108402:	00 00 00 
ffff800000108405:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000108409:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010840e:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108413:	49 89 df             	mov    %rbx,%r15
ffff800000108416:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010841b:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000108422:	ff ff ff 
ffff800000108425:	48 01 d9             	add    %rbx,%rcx
ffff800000108428:	ff d1                	callq  *%rcx
ffff80000010842a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010842f:	e9 87 04 00 00       	jmpq   ffff8000001088bb <kmalloc_create+0x52d>
ffff800000108434:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108438:	be 80 00 00 00       	mov    $0x80,%esi
ffff80000010843d:	48 89 c7             	mov    %rax,%rdi
ffff800000108440:	48 b8 8a 77 ff ff ff 	movabs $0xffffffffffff778a,%rax
ffff800000108447:	ff ff ff 
ffff80000010844a:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff80000010844e:	ff d0                	callq  *%rax
ffff800000108450:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000108454:	48 3d 00 10 00 00    	cmp    $0x1000,%rax
ffff80000010845a:	0f 84 77 02 00 00    	je     ffff8000001086d7 <kmalloc_create+0x349>
ffff800000108460:	48 3d 00 10 00 00    	cmp    $0x1000,%rax
ffff800000108466:	77 62                	ja     ffff8000001084ca <kmalloc_create+0x13c>
ffff800000108468:	48 3d 00 01 00 00    	cmp    $0x100,%rax
ffff80000010846e:	0f 84 d5 00 00 00    	je     ffff800000108549 <kmalloc_create+0x1bb>
ffff800000108474:	48 3d 00 01 00 00    	cmp    $0x100,%rax
ffff80000010847a:	77 25                	ja     ffff8000001084a1 <kmalloc_create+0x113>
ffff80000010847c:	48 83 f8 40          	cmp    $0x40,%rax
ffff800000108480:	0f 84 c3 00 00 00    	je     ffff800000108549 <kmalloc_create+0x1bb>
ffff800000108486:	48 3d 80 00 00 00    	cmp    $0x80,%rax
ffff80000010848c:	0f 84 b7 00 00 00    	je     ffff800000108549 <kmalloc_create+0x1bb>
ffff800000108492:	48 83 f8 20          	cmp    $0x20,%rax
ffff800000108496:	0f 84 ad 00 00 00    	je     ffff800000108549 <kmalloc_create+0x1bb>
ffff80000010849c:	e9 c4 03 00 00       	jmpq   ffff800000108865 <kmalloc_create+0x4d7>
ffff8000001084a1:	48 3d 00 04 00 00    	cmp    $0x400,%rax
ffff8000001084a7:	0f 84 2a 02 00 00    	je     ffff8000001086d7 <kmalloc_create+0x349>
ffff8000001084ad:	48 3d 00 08 00 00    	cmp    $0x800,%rax
ffff8000001084b3:	0f 84 1e 02 00 00    	je     ffff8000001086d7 <kmalloc_create+0x349>
ffff8000001084b9:	48 3d 00 02 00 00    	cmp    $0x200,%rax
ffff8000001084bf:	0f 84 84 00 00 00    	je     ffff800000108549 <kmalloc_create+0x1bb>
ffff8000001084c5:	e9 9b 03 00 00       	jmpq   ffff800000108865 <kmalloc_create+0x4d7>
ffff8000001084ca:	48 3d 00 00 01 00    	cmp    $0x10000,%rax
ffff8000001084d0:	0f 84 01 02 00 00    	je     ffff8000001086d7 <kmalloc_create+0x349>
ffff8000001084d6:	48 3d 00 00 01 00    	cmp    $0x10000,%rax
ffff8000001084dc:	77 29                	ja     ffff800000108507 <kmalloc_create+0x179>
ffff8000001084de:	48 3d 00 40 00 00    	cmp    $0x4000,%rax
ffff8000001084e4:	0f 84 ed 01 00 00    	je     ffff8000001086d7 <kmalloc_create+0x349>
ffff8000001084ea:	48 3d 00 80 00 00    	cmp    $0x8000,%rax
ffff8000001084f0:	0f 84 e1 01 00 00    	je     ffff8000001086d7 <kmalloc_create+0x349>
ffff8000001084f6:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
ffff8000001084fc:	0f 84 d5 01 00 00    	je     ffff8000001086d7 <kmalloc_create+0x349>
ffff800000108502:	e9 5e 03 00 00       	jmpq   ffff800000108865 <kmalloc_create+0x4d7>
ffff800000108507:	48 3d 00 00 04 00    	cmp    $0x40000,%rax
ffff80000010850d:	0f 84 c4 01 00 00    	je     ffff8000001086d7 <kmalloc_create+0x349>
ffff800000108513:	48 3d 00 00 04 00    	cmp    $0x40000,%rax
ffff800000108519:	77 11                	ja     ffff80000010852c <kmalloc_create+0x19e>
ffff80000010851b:	48 3d 00 00 02 00    	cmp    $0x20000,%rax
ffff800000108521:	0f 84 b0 01 00 00    	je     ffff8000001086d7 <kmalloc_create+0x349>
ffff800000108527:	e9 39 03 00 00       	jmpq   ffff800000108865 <kmalloc_create+0x4d7>
ffff80000010852c:	48 3d 00 00 08 00    	cmp    $0x80000,%rax
ffff800000108532:	0f 84 9f 01 00 00    	je     ffff8000001086d7 <kmalloc_create+0x349>
ffff800000108538:	48 3d 00 00 10 00    	cmp    $0x100000,%rax
ffff80000010853e:	0f 84 93 01 00 00    	je     ffff8000001086d7 <kmalloc_create+0x349>
ffff800000108544:	e9 1c 03 00 00       	jmpq   ffff800000108865 <kmalloc_create+0x4d7>
ffff800000108549:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010854d:	48 8b 50 08          	mov    0x8(%rax),%rdx
ffff800000108551:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff800000108558:	80 ff ff 
ffff80000010855b:	48 01 d0             	add    %rdx,%rax
ffff80000010855e:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff800000108562:	b8 00 00 04 00       	mov    $0x40000,%eax
ffff800000108567:	ba 00 00 00 00       	mov    $0x0,%edx
ffff80000010856c:	48 f7 75 b8          	divq   -0x48(%rbp)
ffff800000108570:	48 83 c0 48          	add    $0x48,%rax
ffff800000108574:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff800000108578:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010857c:	ba 00 00 20 00       	mov    $0x200000,%edx
ffff800000108581:	48 29 c2             	sub    %rax,%rdx
ffff800000108584:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000108588:	48 01 d0             	add    %rdx,%rax
ffff80000010858b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff80000010858f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108593:	48 8d 50 48          	lea    0x48(%rax),%rdx
ffff800000108597:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010859b:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff80000010859f:	b8 00 00 04 00       	mov    $0x40000,%eax
ffff8000001085a4:	ba 00 00 00 00       	mov    $0x0,%edx
ffff8000001085a9:	48 f7 75 b8          	divq   -0x48(%rbp)
ffff8000001085ad:	ba b8 ff 1f 00       	mov    $0x1fffb8,%edx
ffff8000001085b2:	48 29 c2             	sub    %rax,%rdx
ffff8000001085b5:	48 89 d0             	mov    %rdx,%rax
ffff8000001085b8:	ba 00 00 00 00       	mov    $0x0,%edx
ffff8000001085bd:	48 f7 75 b8          	divq   -0x48(%rbp)
ffff8000001085c1:	48 89 c2             	mov    %rax,%rdx
ffff8000001085c4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001085c8:	48 89 50 20          	mov    %rdx,0x20(%rax)
ffff8000001085cc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001085d0:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
ffff8000001085d7:	00 
ffff8000001085d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001085dc:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
ffff8000001085e0:	48 89 50 28          	mov    %rdx,0x28(%rax)
ffff8000001085e4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001085e8:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001085ec:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff8000001085f0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001085f4:	48 89 c7             	mov    %rax,%rdi
ffff8000001085f7:	49 89 df             	mov    %rbx,%r15
ffff8000001085fa:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001085ff:	48 ba 61 b5 ff ff ff 	movabs $0xffffffffffffb561,%rdx
ffff800000108606:	ff ff ff 
ffff800000108609:	48 01 da             	add    %rbx,%rdx
ffff80000010860c:	ff d2                	callq  *%rdx
ffff80000010860e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108612:	48 8b 40 38          	mov    0x38(%rax),%rax
ffff800000108616:	48 83 c0 3f          	add    $0x3f,%rax
ffff80000010861a:	48 c1 e8 06          	shr    $0x6,%rax
ffff80000010861e:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
ffff800000108625:	00 
ffff800000108626:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010862a:	48 89 50 30          	mov    %rdx,0x30(%rax)
ffff80000010862e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108632:	48 8b 40 30          	mov    0x30(%rax),%rax
ffff800000108636:	48 89 c2             	mov    %rax,%rdx
ffff800000108639:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010863d:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff800000108641:	be ff 00 00 00       	mov    $0xff,%esi
ffff800000108646:	48 89 c7             	mov    %rax,%rdi
ffff800000108649:	49 89 df             	mov    %rbx,%r15
ffff80000010864c:	48 b8 ef b3 ff ff ff 	movabs $0xffffffffffffb3ef,%rax
ffff800000108653:	ff ff ff 
ffff800000108656:	48 01 d8             	add    %rbx,%rax
ffff800000108659:	ff d0                	callq  *%rax
ffff80000010865b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
ffff800000108662:	eb 5b                	jmp    ffff8000001086bf <kmalloc_create+0x331>
ffff800000108664:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108668:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff80000010866c:	8b 55 e4             	mov    -0x1c(%rbp),%edx
ffff80000010866f:	c1 fa 06             	sar    $0x6,%edx
ffff800000108672:	48 63 d2             	movslq %edx,%rdx
ffff800000108675:	48 c1 e2 03          	shl    $0x3,%rdx
ffff800000108679:	48 01 d0             	add    %rdx,%rax
ffff80000010867c:	48 8b 30             	mov    (%rax),%rsi
ffff80000010867f:	8b 45 e4             	mov    -0x1c(%rbp),%eax
ffff800000108682:	99                   	cltd   
ffff800000108683:	c1 ea 1a             	shr    $0x1a,%edx
ffff800000108686:	01 d0                	add    %edx,%eax
ffff800000108688:	83 e0 3f             	and    $0x3f,%eax
ffff80000010868b:	29 d0                	sub    %edx,%eax
ffff80000010868d:	ba 01 00 00 00       	mov    $0x1,%edx
ffff800000108692:	89 c1                	mov    %eax,%ecx
ffff800000108694:	48 d3 e2             	shl    %cl,%rdx
ffff800000108697:	48 89 d1             	mov    %rdx,%rcx
ffff80000010869a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010869e:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff8000001086a2:	8b 55 e4             	mov    -0x1c(%rbp),%edx
ffff8000001086a5:	c1 fa 06             	sar    $0x6,%edx
ffff8000001086a8:	48 63 d2             	movslq %edx,%rdx
ffff8000001086ab:	48 c1 e2 03          	shl    $0x3,%rdx
ffff8000001086af:	48 01 d0             	add    %rdx,%rax
ffff8000001086b2:	48 31 ce             	xor    %rcx,%rsi
ffff8000001086b5:	48 89 f2             	mov    %rsi,%rdx
ffff8000001086b8:	48 89 10             	mov    %rdx,(%rax)
ffff8000001086bb:	83 45 e4 01          	addl   $0x1,-0x1c(%rbp)
ffff8000001086bf:	8b 45 e4             	mov    -0x1c(%rbp),%eax
ffff8000001086c2:	48 63 d0             	movslq %eax,%rdx
ffff8000001086c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001086c9:	48 8b 40 38          	mov    0x38(%rax),%rax
ffff8000001086cd:	48 39 c2             	cmp    %rax,%rdx
ffff8000001086d0:	72 92                	jb     ffff800000108664 <kmalloc_create+0x2d6>
ffff8000001086d2:	e9 e0 01 00 00       	jmpq   ffff8000001088b7 <kmalloc_create+0x529>
ffff8000001086d7:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001086dc:	bf 48 00 00 00       	mov    $0x48,%edi
ffff8000001086e1:	48 b8 3e 8c ff ff ff 	movabs $0xffffffffffff8c3e,%rax
ffff8000001086e8:	ff ff ff 
ffff8000001086eb:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001086ef:	ff d0                	callq  *%rax
ffff8000001086f1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001086f5:	b8 00 00 20 00       	mov    $0x200000,%eax
ffff8000001086fa:	ba 00 00 00 00       	mov    $0x0,%edx
ffff8000001086ff:	48 f7 75 b8          	divq   -0x48(%rbp)
ffff800000108703:	48 89 c2             	mov    %rax,%rdx
ffff800000108706:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010870a:	48 89 50 20          	mov    %rdx,0x20(%rax)
ffff80000010870e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108712:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
ffff800000108719:	00 
ffff80000010871a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010871e:	48 8b 50 20          	mov    0x20(%rax),%rdx
ffff800000108722:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108726:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff80000010872a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010872e:	48 8b 40 38          	mov    0x38(%rax),%rax
ffff800000108732:	48 83 c0 3f          	add    $0x3f,%rax
ffff800000108736:	48 c1 e8 06          	shr    $0x6,%rax
ffff80000010873a:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
ffff800000108741:	00 
ffff800000108742:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108746:	48 89 50 30          	mov    %rdx,0x30(%rax)
ffff80000010874a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010874e:	48 8b 40 30          	mov    0x30(%rax),%rax
ffff800000108752:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108757:	48 89 c7             	mov    %rax,%rdi
ffff80000010875a:	48 b8 3e 8c ff ff ff 	movabs $0xffffffffffff8c3e,%rax
ffff800000108761:	ff ff ff 
ffff800000108764:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000108768:	ff d0                	callq  *%rax
ffff80000010876a:	48 89 c2             	mov    %rax,%rdx
ffff80000010876d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108771:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff800000108775:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108779:	48 8b 40 30          	mov    0x30(%rax),%rax
ffff80000010877d:	48 89 c2             	mov    %rax,%rdx
ffff800000108780:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108784:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff800000108788:	be ff 00 00 00       	mov    $0xff,%esi
ffff80000010878d:	48 89 c7             	mov    %rax,%rdi
ffff800000108790:	49 89 df             	mov    %rbx,%r15
ffff800000108793:	48 b8 ef b3 ff ff ff 	movabs $0xffffffffffffb3ef,%rax
ffff80000010879a:	ff ff ff 
ffff80000010879d:	48 01 d8             	add    %rbx,%rax
ffff8000001087a0:	ff d0                	callq  *%rax
ffff8000001087a2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001087a6:	48 8b 50 08          	mov    0x8(%rax),%rdx
ffff8000001087aa:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff8000001087b1:	80 ff ff 
ffff8000001087b4:	48 01 d0             	add    %rdx,%rax
ffff8000001087b7:	48 89 c2             	mov    %rax,%rdx
ffff8000001087ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001087be:	48 89 50 28          	mov    %rdx,0x28(%rax)
ffff8000001087c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001087c6:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001087ca:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff8000001087ce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001087d2:	48 89 c7             	mov    %rax,%rdi
ffff8000001087d5:	49 89 df             	mov    %rbx,%r15
ffff8000001087d8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001087dd:	48 ba 61 b5 ff ff ff 	movabs $0xffffffffffffb561,%rdx
ffff8000001087e4:	ff ff ff 
ffff8000001087e7:	48 01 da             	add    %rbx,%rdx
ffff8000001087ea:	ff d2                	callq  *%rdx
ffff8000001087ec:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
ffff8000001087f3:	eb 5b                	jmp    ffff800000108850 <kmalloc_create+0x4c2>
ffff8000001087f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001087f9:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff8000001087fd:	8b 55 e0             	mov    -0x20(%rbp),%edx
ffff800000108800:	c1 fa 06             	sar    $0x6,%edx
ffff800000108803:	48 63 d2             	movslq %edx,%rdx
ffff800000108806:	48 c1 e2 03          	shl    $0x3,%rdx
ffff80000010880a:	48 01 d0             	add    %rdx,%rax
ffff80000010880d:	48 8b 30             	mov    (%rax),%rsi
ffff800000108810:	8b 45 e0             	mov    -0x20(%rbp),%eax
ffff800000108813:	99                   	cltd   
ffff800000108814:	c1 ea 1a             	shr    $0x1a,%edx
ffff800000108817:	01 d0                	add    %edx,%eax
ffff800000108819:	83 e0 3f             	and    $0x3f,%eax
ffff80000010881c:	29 d0                	sub    %edx,%eax
ffff80000010881e:	ba 01 00 00 00       	mov    $0x1,%edx
ffff800000108823:	89 c1                	mov    %eax,%ecx
ffff800000108825:	48 d3 e2             	shl    %cl,%rdx
ffff800000108828:	48 89 d1             	mov    %rdx,%rcx
ffff80000010882b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010882f:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff800000108833:	8b 55 e0             	mov    -0x20(%rbp),%edx
ffff800000108836:	c1 fa 06             	sar    $0x6,%edx
ffff800000108839:	48 63 d2             	movslq %edx,%rdx
ffff80000010883c:	48 c1 e2 03          	shl    $0x3,%rdx
ffff800000108840:	48 01 d0             	add    %rdx,%rax
ffff800000108843:	48 31 ce             	xor    %rcx,%rsi
ffff800000108846:	48 89 f2             	mov    %rsi,%rdx
ffff800000108849:	48 89 10             	mov    %rdx,(%rax)
ffff80000010884c:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
ffff800000108850:	8b 45 e0             	mov    -0x20(%rbp),%eax
ffff800000108853:	48 63 d0             	movslq %eax,%rdx
ffff800000108856:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010885a:	48 8b 40 38          	mov    0x38(%rax),%rax
ffff80000010885e:	48 39 c2             	cmp    %rax,%rdx
ffff800000108861:	72 92                	jb     ffff8000001087f5 <kmalloc_create+0x467>
ffff800000108863:	eb 52                	jmp    ffff8000001088b7 <kmalloc_create+0x529>
ffff800000108865:	48 b8 0f 1a 00 00 00 	movabs $0x1a0f,%rax
ffff80000010886c:	00 00 00 
ffff80000010886f:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000108873:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108878:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010887d:	49 89 df             	mov    %rbx,%r15
ffff800000108880:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108885:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff80000010888c:	ff ff ff 
ffff80000010888f:	48 01 d9             	add    %rbx,%rcx
ffff800000108892:	ff d1                	callq  *%rcx
ffff800000108894:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108898:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010889d:	48 89 c7             	mov    %rax,%rdi
ffff8000001088a0:	48 b8 c8 8a ff ff ff 	movabs $0xffffffffffff8ac8,%rax
ffff8000001088a7:	ff ff ff 
ffff8000001088aa:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001088ae:	ff d0                	callq  *%rax
ffff8000001088b0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001088b5:	eb 04                	jmp    ffff8000001088bb <kmalloc_create+0x52d>
ffff8000001088b7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001088bb:	48 83 c4 40          	add    $0x40,%rsp
ffff8000001088bf:	5b                   	pop    %rbx
ffff8000001088c0:	41 5f                	pop    %r15
ffff8000001088c2:	5d                   	pop    %rbp
ffff8000001088c3:	c3                   	retq   

ffff8000001088c4 <kfree>:
ffff8000001088c4:	55                   	push   %rbp
ffff8000001088c5:	48 89 e5             	mov    %rsp,%rbp
ffff8000001088c8:	41 57                	push   %r15
ffff8000001088ca:	53                   	push   %rbx
ffff8000001088cb:	48 83 ec 40          	sub    $0x40,%rsp
ffff8000001088cf:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff8000001088cf <kfree+0xb>
ffff8000001088d6:	49 bb 19 69 00 00 00 	movabs $0x6919,%r11
ffff8000001088dd:	00 00 00 
ffff8000001088e0:	4c 01 db             	add    %r11,%rbx
ffff8000001088e3:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
ffff8000001088e7:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001088ee:	00 
ffff8000001088ef:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff8000001088f3:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff8000001088f9:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff8000001088fd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
ffff800000108904:	e9 f9 04 00 00       	jmpq   ffff800000108e02 <kfree+0x53e>
ffff800000108909:	48 b9 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rcx
ffff800000108910:	ff ff ff 
ffff800000108913:	8b 45 e4             	mov    -0x1c(%rbp),%eax
ffff800000108916:	48 63 d0             	movslq %eax,%rdx
ffff800000108919:	48 89 d0             	mov    %rdx,%rax
ffff80000010891c:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108920:	48 29 d0             	sub    %rdx,%rax
ffff800000108923:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108927:	48 01 d8             	add    %rbx,%rax
ffff80000010892a:	48 01 c8             	add    %rcx,%rax
ffff80000010892d:	48 83 c0 18          	add    $0x18,%rax
ffff800000108931:	48 8b 00             	mov    (%rax),%rax
ffff800000108934:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000108938:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010893c:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000108940:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
ffff800000108944:	0f 85 2e 04 00 00    	jne    ffff800000108d78 <kfree+0x4b4>
ffff80000010894a:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff80000010894e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108952:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000108956:	48 29 c2             	sub    %rax,%rdx
ffff800000108959:	48 89 d0             	mov    %rdx,%rax
ffff80000010895c:	48 89 c6             	mov    %rax,%rsi
ffff80000010895f:	48 b8 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rax
ffff800000108966:	ff ff ff 
ffff800000108969:	8b 55 e4             	mov    -0x1c(%rbp),%edx
ffff80000010896c:	48 63 d2             	movslq %edx,%rdx
ffff80000010896f:	48 8d 0c 03          	lea    (%rbx,%rax,1),%rcx
ffff800000108973:	48 89 d0             	mov    %rdx,%rax
ffff800000108976:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010897a:	48 29 d0             	sub    %rdx,%rax
ffff80000010897d:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108981:	48 01 c8             	add    %rcx,%rax
ffff800000108984:	48 8b 38             	mov    (%rax),%rdi
ffff800000108987:	48 89 f0             	mov    %rsi,%rax
ffff80000010898a:	ba 00 00 00 00       	mov    $0x0,%edx
ffff80000010898f:	48 f7 f7             	div    %rdi
ffff800000108992:	89 45 cc             	mov    %eax,-0x34(%rbp)
ffff800000108995:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108999:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff80000010899d:	8b 55 cc             	mov    -0x34(%rbp),%edx
ffff8000001089a0:	c1 fa 06             	sar    $0x6,%edx
ffff8000001089a3:	48 63 d2             	movslq %edx,%rdx
ffff8000001089a6:	48 c1 e2 03          	shl    $0x3,%rdx
ffff8000001089aa:	48 01 d0             	add    %rdx,%rax
ffff8000001089ad:	48 8b 30             	mov    (%rax),%rsi
ffff8000001089b0:	8b 45 cc             	mov    -0x34(%rbp),%eax
ffff8000001089b3:	99                   	cltd   
ffff8000001089b4:	c1 ea 1a             	shr    $0x1a,%edx
ffff8000001089b7:	01 d0                	add    %edx,%eax
ffff8000001089b9:	83 e0 3f             	and    $0x3f,%eax
ffff8000001089bc:	29 d0                	sub    %edx,%eax
ffff8000001089be:	ba 01 00 00 00       	mov    $0x1,%edx
ffff8000001089c3:	89 c1                	mov    %eax,%ecx
ffff8000001089c5:	48 d3 e2             	shl    %cl,%rdx
ffff8000001089c8:	48 89 d1             	mov    %rdx,%rcx
ffff8000001089cb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001089cf:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff8000001089d3:	8b 55 cc             	mov    -0x34(%rbp),%edx
ffff8000001089d6:	c1 fa 06             	sar    $0x6,%edx
ffff8000001089d9:	48 63 d2             	movslq %edx,%rdx
ffff8000001089dc:	48 c1 e2 03          	shl    $0x3,%rdx
ffff8000001089e0:	48 01 d0             	add    %rdx,%rax
ffff8000001089e3:	48 31 ce             	xor    %rcx,%rsi
ffff8000001089e6:	48 89 f2             	mov    %rsi,%rdx
ffff8000001089e9:	48 89 10             	mov    %rdx,(%rax)
ffff8000001089ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001089f0:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff8000001089f4:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001089f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001089fc:	48 89 50 20          	mov    %rdx,0x20(%rax)
ffff800000108a00:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108a04:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000108a08:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff800000108a0c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108a10:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff800000108a14:	48 b8 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rax
ffff800000108a1b:	ff ff ff 
ffff800000108a1e:	8b 55 e4             	mov    -0x1c(%rbp),%edx
ffff800000108a21:	48 63 d2             	movslq %edx,%rdx
ffff800000108a24:	48 8d 0c 03          	lea    (%rbx,%rax,1),%rcx
ffff800000108a28:	48 89 d0             	mov    %rdx,%rax
ffff800000108a2b:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108a2f:	48 29 d0             	sub    %rdx,%rax
ffff800000108a32:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108a36:	48 01 c8             	add    %rcx,%rax
ffff800000108a39:	48 83 c0 10          	add    $0x10,%rax
ffff800000108a3d:	48 8b 00             	mov    (%rax),%rax
ffff800000108a40:	48 8d 48 01          	lea    0x1(%rax),%rcx
ffff800000108a44:	48 b8 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rax
ffff800000108a4b:	ff ff ff 
ffff800000108a4e:	8b 55 e4             	mov    -0x1c(%rbp),%edx
ffff800000108a51:	48 63 d2             	movslq %edx,%rdx
ffff800000108a54:	48 8d 34 03          	lea    (%rbx,%rax,1),%rsi
ffff800000108a58:	48 89 d0             	mov    %rdx,%rax
ffff800000108a5b:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108a5f:	48 29 d0             	sub    %rdx,%rax
ffff800000108a62:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108a66:	48 01 f0             	add    %rsi,%rax
ffff800000108a69:	48 83 c0 10          	add    $0x10,%rax
ffff800000108a6d:	48 89 08             	mov    %rcx,(%rax)
ffff800000108a70:	48 b9 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rcx
ffff800000108a77:	ff ff ff 
ffff800000108a7a:	8b 45 e4             	mov    -0x1c(%rbp),%eax
ffff800000108a7d:	48 63 d0             	movslq %eax,%rdx
ffff800000108a80:	48 89 d0             	mov    %rdx,%rax
ffff800000108a83:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108a87:	48 29 d0             	sub    %rdx,%rax
ffff800000108a8a:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108a8e:	48 01 d8             	add    %rbx,%rax
ffff800000108a91:	48 01 c8             	add    %rcx,%rax
ffff800000108a94:	48 83 c0 08          	add    $0x8,%rax
ffff800000108a98:	48 8b 00             	mov    (%rax),%rax
ffff800000108a9b:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
ffff800000108a9f:	48 be 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rsi
ffff800000108aa6:	ff ff ff 
ffff800000108aa9:	8b 45 e4             	mov    -0x1c(%rbp),%eax
ffff800000108aac:	48 63 d0             	movslq %eax,%rdx
ffff800000108aaf:	48 89 d0             	mov    %rdx,%rax
ffff800000108ab2:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108ab6:	48 29 d0             	sub    %rdx,%rax
ffff800000108ab9:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108abd:	48 01 d8             	add    %rbx,%rax
ffff800000108ac0:	48 01 f0             	add    %rsi,%rax
ffff800000108ac3:	48 83 c0 08          	add    $0x8,%rax
ffff800000108ac7:	48 89 08             	mov    %rcx,(%rax)
ffff800000108aca:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108ace:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000108ad2:	48 85 c0             	test   %rax,%rax
ffff800000108ad5:	0f 85 92 02 00 00    	jne    ffff800000108d6d <kfree+0x4a9>
ffff800000108adb:	48 b8 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rax
ffff800000108ae2:	ff ff ff 
ffff800000108ae5:	8b 55 e4             	mov    -0x1c(%rbp),%edx
ffff800000108ae8:	48 63 d2             	movslq %edx,%rdx
ffff800000108aeb:	48 8d 0c 03          	lea    (%rbx,%rax,1),%rcx
ffff800000108aef:	48 89 d0             	mov    %rdx,%rax
ffff800000108af2:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108af6:	48 29 d0             	sub    %rdx,%rax
ffff800000108af9:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108afd:	48 01 c8             	add    %rcx,%rax
ffff800000108b00:	48 83 c0 10          	add    $0x10,%rax
ffff800000108b04:	48 8b 08             	mov    (%rax),%rcx
ffff800000108b07:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108b0b:	48 8b 50 38          	mov    0x38(%rax),%rdx
ffff800000108b0f:	48 89 d0             	mov    %rdx,%rax
ffff800000108b12:	48 01 c0             	add    %rax,%rax
ffff800000108b15:	48 01 d0             	add    %rdx,%rax
ffff800000108b18:	48 d1 e8             	shr    %rax
ffff800000108b1b:	48 39 c1             	cmp    %rax,%rcx
ffff800000108b1e:	0f 82 49 02 00 00    	jb     ffff800000108d6d <kfree+0x4a9>
ffff800000108b24:	48 b9 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rcx
ffff800000108b2b:	ff ff ff 
ffff800000108b2e:	8b 45 e4             	mov    -0x1c(%rbp),%eax
ffff800000108b31:	48 63 d0             	movslq %eax,%rdx
ffff800000108b34:	48 89 d0             	mov    %rdx,%rax
ffff800000108b37:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108b3b:	48 29 d0             	sub    %rdx,%rax
ffff800000108b3e:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108b42:	48 01 d8             	add    %rbx,%rax
ffff800000108b45:	48 01 c8             	add    %rcx,%rax
ffff800000108b48:	48 83 c0 18          	add    $0x18,%rax
ffff800000108b4c:	48 8b 00             	mov    (%rax),%rax
ffff800000108b4f:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
ffff800000108b53:	0f 84 14 02 00 00    	je     ffff800000108d6d <kfree+0x4a9>
ffff800000108b59:	48 b8 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rax
ffff800000108b60:	ff ff ff 
ffff800000108b63:	8b 55 e4             	mov    -0x1c(%rbp),%edx
ffff800000108b66:	48 63 d2             	movslq %edx,%rdx
ffff800000108b69:	48 8d 0c 03          	lea    (%rbx,%rax,1),%rcx
ffff800000108b6d:	48 89 d0             	mov    %rdx,%rax
ffff800000108b70:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108b74:	48 29 d0             	sub    %rdx,%rax
ffff800000108b77:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108b7b:	48 01 c8             	add    %rcx,%rax
ffff800000108b7e:	48 8b 00             	mov    (%rax),%rax
ffff800000108b81:	48 3d 80 00 00 00    	cmp    $0x80,%rax
ffff800000108b87:	74 2d                	je     ffff800000108bb6 <kfree+0x2f2>
ffff800000108b89:	48 3d 80 00 00 00    	cmp    $0x80,%rax
ffff800000108b8f:	77 11                	ja     ffff800000108ba2 <kfree+0x2de>
ffff800000108b91:	48 83 f8 20          	cmp    $0x20,%rax
ffff800000108b95:	74 1f                	je     ffff800000108bb6 <kfree+0x2f2>
ffff800000108b97:	48 83 f8 40          	cmp    $0x40,%rax
ffff800000108b9b:	74 19                	je     ffff800000108bb6 <kfree+0x2f2>
ffff800000108b9d:	e9 d8 00 00 00       	jmpq   ffff800000108c7a <kfree+0x3b6>
ffff800000108ba2:	48 3d 00 01 00 00    	cmp    $0x100,%rax
ffff800000108ba8:	74 0c                	je     ffff800000108bb6 <kfree+0x2f2>
ffff800000108baa:	48 3d 00 02 00 00    	cmp    $0x200,%rax
ffff800000108bb0:	0f 85 c4 00 00 00    	jne    ffff800000108c7a <kfree+0x3b6>
ffff800000108bb6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108bba:	48 89 c7             	mov    %rax,%rdi
ffff800000108bbd:	49 89 df             	mov    %rbx,%r15
ffff800000108bc0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108bc5:	48 ba 47 b6 ff ff ff 	movabs $0xffffffffffffb647,%rdx
ffff800000108bcc:	ff ff ff 
ffff800000108bcf:	48 01 da             	add    %rbx,%rdx
ffff800000108bd2:	ff d2                	callq  *%rdx
ffff800000108bd4:	48 b8 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rax
ffff800000108bdb:	ff ff ff 
ffff800000108bde:	8b 55 e4             	mov    -0x1c(%rbp),%edx
ffff800000108be1:	48 63 d2             	movslq %edx,%rdx
ffff800000108be4:	48 8d 0c 03          	lea    (%rbx,%rax,1),%rcx
ffff800000108be8:	48 89 d0             	mov    %rdx,%rax
ffff800000108beb:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108bef:	48 29 d0             	sub    %rdx,%rax
ffff800000108bf2:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108bf6:	48 01 c8             	add    %rcx,%rax
ffff800000108bf9:	48 83 c0 10          	add    $0x10,%rax
ffff800000108bfd:	48 8b 10             	mov    (%rax),%rdx
ffff800000108c00:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108c04:	48 8b 40 38          	mov    0x38(%rax),%rax
ffff800000108c08:	48 89 d1             	mov    %rdx,%rcx
ffff800000108c0b:	48 29 c1             	sub    %rax,%rcx
ffff800000108c0e:	48 b8 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rax
ffff800000108c15:	ff ff ff 
ffff800000108c18:	8b 55 e4             	mov    -0x1c(%rbp),%edx
ffff800000108c1b:	48 63 d2             	movslq %edx,%rdx
ffff800000108c1e:	48 8d 34 03          	lea    (%rbx,%rax,1),%rsi
ffff800000108c22:	48 89 d0             	mov    %rdx,%rax
ffff800000108c25:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108c29:	48 29 d0             	sub    %rdx,%rax
ffff800000108c2c:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108c30:	48 01 f0             	add    %rsi,%rax
ffff800000108c33:	48 83 c0 10          	add    $0x10,%rax
ffff800000108c37:	48 89 08             	mov    %rcx,(%rax)
ffff800000108c3a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108c3e:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000108c42:	48 89 c7             	mov    %rax,%rdi
ffff800000108c45:	48 b8 0c 78 ff ff ff 	movabs $0xffffffffffff780c,%rax
ffff800000108c4c:	ff ff ff 
ffff800000108c4f:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000108c53:	ff d0                	callq  *%rax
ffff800000108c55:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108c59:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000108c5d:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000108c62:	48 89 c7             	mov    %rax,%rdi
ffff800000108c65:	48 b8 c8 8a ff ff ff 	movabs $0xffffffffffff8ac8,%rax
ffff800000108c6c:	ff ff ff 
ffff800000108c6f:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000108c73:	ff d0                	callq  *%rax
ffff800000108c75:	e9 f4 00 00 00       	jmpq   ffff800000108d6e <kfree+0x4aa>
ffff800000108c7a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108c7e:	48 89 c7             	mov    %rax,%rdi
ffff800000108c81:	49 89 df             	mov    %rbx,%r15
ffff800000108c84:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108c89:	48 ba 47 b6 ff ff ff 	movabs $0xffffffffffffb647,%rdx
ffff800000108c90:	ff ff ff 
ffff800000108c93:	48 01 da             	add    %rbx,%rdx
ffff800000108c96:	ff d2                	callq  *%rdx
ffff800000108c98:	48 b8 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rax
ffff800000108c9f:	ff ff ff 
ffff800000108ca2:	8b 55 e4             	mov    -0x1c(%rbp),%edx
ffff800000108ca5:	48 63 d2             	movslq %edx,%rdx
ffff800000108ca8:	48 8d 0c 03          	lea    (%rbx,%rax,1),%rcx
ffff800000108cac:	48 89 d0             	mov    %rdx,%rax
ffff800000108caf:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108cb3:	48 29 d0             	sub    %rdx,%rax
ffff800000108cb6:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108cba:	48 01 c8             	add    %rcx,%rax
ffff800000108cbd:	48 83 c0 10          	add    $0x10,%rax
ffff800000108cc1:	48 8b 10             	mov    (%rax),%rdx
ffff800000108cc4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108cc8:	48 8b 40 38          	mov    0x38(%rax),%rax
ffff800000108ccc:	48 89 d1             	mov    %rdx,%rcx
ffff800000108ccf:	48 29 c1             	sub    %rax,%rcx
ffff800000108cd2:	48 b8 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rax
ffff800000108cd9:	ff ff ff 
ffff800000108cdc:	8b 55 e4             	mov    -0x1c(%rbp),%edx
ffff800000108cdf:	48 63 d2             	movslq %edx,%rdx
ffff800000108ce2:	48 8d 34 03          	lea    (%rbx,%rax,1),%rsi
ffff800000108ce6:	48 89 d0             	mov    %rdx,%rax
ffff800000108ce9:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108ced:	48 29 d0             	sub    %rdx,%rax
ffff800000108cf0:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108cf4:	48 01 f0             	add    %rsi,%rax
ffff800000108cf7:	48 83 c0 10          	add    $0x10,%rax
ffff800000108cfb:	48 89 08             	mov    %rcx,(%rax)
ffff800000108cfe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108d02:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff800000108d06:	48 89 c7             	mov    %rax,%rdi
ffff800000108d09:	48 b8 dc 96 ff ff ff 	movabs $0xffffffffffff96dc,%rax
ffff800000108d10:	ff ff ff 
ffff800000108d13:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000108d17:	ff d0                	callq  *%rax
ffff800000108d19:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108d1d:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000108d21:	48 89 c7             	mov    %rax,%rdi
ffff800000108d24:	48 b8 0c 78 ff ff ff 	movabs $0xffffffffffff780c,%rax
ffff800000108d2b:	ff ff ff 
ffff800000108d2e:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000108d32:	ff d0                	callq  *%rax
ffff800000108d34:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108d38:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000108d3c:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000108d41:	48 89 c7             	mov    %rax,%rdi
ffff800000108d44:	48 b8 c8 8a ff ff ff 	movabs $0xffffffffffff8ac8,%rax
ffff800000108d4b:	ff ff ff 
ffff800000108d4e:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000108d52:	ff d0                	callq  *%rax
ffff800000108d54:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108d58:	48 89 c7             	mov    %rax,%rdi
ffff800000108d5b:	48 b8 dc 96 ff ff ff 	movabs $0xffffffffffff96dc,%rax
ffff800000108d62:	ff ff ff 
ffff800000108d65:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000108d69:	ff d0                	callq  *%rax
ffff800000108d6b:	eb 01                	jmp    ffff800000108d6e <kfree+0x4aa>
ffff800000108d6d:	90                   	nop
ffff800000108d6e:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000108d73:	e9 c8 00 00 00       	jmpq   ffff800000108e40 <kfree+0x57c>
ffff800000108d78:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108d7c:	48 89 c7             	mov    %rax,%rdi
ffff800000108d7f:	49 89 df             	mov    %rbx,%r15
ffff800000108d82:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108d87:	48 ba 8b b6 ff ff ff 	movabs $0xffffffffffffb68b,%rdx
ffff800000108d8e:	ff ff ff 
ffff800000108d91:	48 01 da             	add    %rbx,%rdx
ffff800000108d94:	ff d2                	callq  *%rdx
ffff800000108d96:	85 c0                	test   %eax,%eax
ffff800000108d98:	75 63                	jne    ffff800000108dfd <kfree+0x539>
ffff800000108d9a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108d9e:	48 89 c7             	mov    %rax,%rdi
ffff800000108da1:	49 89 df             	mov    %rbx,%r15
ffff800000108da4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108da9:	48 ba d0 b6 ff ff ff 	movabs $0xffffffffffffb6d0,%rdx
ffff800000108db0:	ff ff ff 
ffff800000108db3:	48 01 da             	add    %rbx,%rdx
ffff800000108db6:	ff d2                	callq  *%rdx
ffff800000108db8:	48 98                	cltq   
ffff800000108dba:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff800000108dbe:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000108dc2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000108dc6:	48 b9 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rcx
ffff800000108dcd:	ff ff ff 
ffff800000108dd0:	8b 45 e4             	mov    -0x1c(%rbp),%eax
ffff800000108dd3:	48 63 d0             	movslq %eax,%rdx
ffff800000108dd6:	48 89 d0             	mov    %rdx,%rax
ffff800000108dd9:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108ddd:	48 29 d0             	sub    %rdx,%rax
ffff800000108de0:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000108de4:	48 01 d8             	add    %rbx,%rax
ffff800000108de7:	48 01 c8             	add    %rcx,%rax
ffff800000108dea:	48 83 c0 18          	add    $0x18,%rax
ffff800000108dee:	48 8b 00             	mov    (%rax),%rax
ffff800000108df1:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
ffff800000108df5:	0f 85 3d fb ff ff    	jne    ffff800000108938 <kfree+0x74>
ffff800000108dfb:	eb 01                	jmp    ffff800000108dfe <kfree+0x53a>
ffff800000108dfd:	90                   	nop
ffff800000108dfe:	83 45 e4 01          	addl   $0x1,-0x1c(%rbp)
ffff800000108e02:	83 7d e4 0f          	cmpl   $0xf,-0x1c(%rbp)
ffff800000108e06:	0f 8e fd fa ff ff    	jle    ffff800000108909 <kfree+0x45>
ffff800000108e0c:	48 b8 28 1a 00 00 00 	movabs $0x1a28,%rax
ffff800000108e13:	00 00 00 
ffff800000108e16:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000108e1a:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108e1f:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108e24:	49 89 df             	mov    %rbx,%r15
ffff800000108e27:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e2c:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000108e33:	ff ff ff 
ffff800000108e36:	48 01 d9             	add    %rbx,%rcx
ffff800000108e39:	ff d1                	callq  *%rcx
ffff800000108e3b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e40:	48 83 c4 40          	add    $0x40,%rsp
ffff800000108e44:	5b                   	pop    %rbx
ffff800000108e45:	41 5f                	pop    %r15
ffff800000108e47:	5d                   	pop    %rbp
ffff800000108e48:	c3                   	retq   

ffff800000108e49 <slab_create>:
ffff800000108e49:	55                   	push   %rbp
ffff800000108e4a:	48 89 e5             	mov    %rsp,%rbp
ffff800000108e4d:	41 57                	push   %r15
ffff800000108e4f:	41 54                	push   %r12
ffff800000108e51:	53                   	push   %rbx
ffff800000108e52:	48 83 ec 38          	sub    $0x38,%rsp
ffff800000108e56:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000108e56 <slab_create+0xd>
ffff800000108e5d:	49 bb 92 63 00 00 00 	movabs $0x6392,%r11
ffff800000108e64:	00 00 00 
ffff800000108e67:	4c 01 db             	add    %r11,%rbx
ffff800000108e6a:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
ffff800000108e6e:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
ffff800000108e72:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
ffff800000108e76:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
ffff800000108e7a:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
ffff800000108e81:	00 
ffff800000108e82:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108e87:	bf 38 00 00 00       	mov    $0x38,%edi
ffff800000108e8c:	48 b8 3e 8c ff ff ff 	movabs $0xffffffffffff8c3e,%rax
ffff800000108e93:	ff ff ff 
ffff800000108e96:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000108e9a:	ff d0                	callq  *%rax
ffff800000108e9c:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff800000108ea0:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
ffff800000108ea5:	75 39                	jne    ffff800000108ee0 <slab_create+0x97>
ffff800000108ea7:	48 b8 50 1a 00 00 00 	movabs $0x1a50,%rax
ffff800000108eae:	00 00 00 
ffff800000108eb1:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000108eb5:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108eba:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108ebf:	49 89 df             	mov    %rbx,%r15
ffff800000108ec2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108ec7:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000108ece:	ff ff ff 
ffff800000108ed1:	48 01 d9             	add    %rbx,%rcx
ffff800000108ed4:	ff d1                	callq  *%rcx
ffff800000108ed6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108edb:	e9 c3 03 00 00       	jmpq   ffff8000001092a3 <slab_create+0x45a>
ffff800000108ee0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108ee4:	ba 38 00 00 00       	mov    $0x38,%edx
ffff800000108ee9:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108eee:	48 89 c7             	mov    %rax,%rdi
ffff800000108ef1:	49 89 df             	mov    %rbx,%r15
ffff800000108ef4:	48 b8 ef b3 ff ff ff 	movabs $0xffffffffffffb3ef,%rax
ffff800000108efb:	ff ff ff 
ffff800000108efe:	48 01 d8             	add    %rbx,%rax
ffff800000108f01:	ff d0                	callq  *%rax
ffff800000108f03:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000108f07:	48 83 c0 07          	add    $0x7,%rax
ffff800000108f0b:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff800000108f0f:	48 89 c2             	mov    %rax,%rdx
ffff800000108f12:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108f16:	48 89 10             	mov    %rdx,(%rax)
ffff800000108f19:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108f1d:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
ffff800000108f24:	00 
ffff800000108f25:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108f29:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff800000108f30:	00 
ffff800000108f31:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108f36:	bf 48 00 00 00       	mov    $0x48,%edi
ffff800000108f3b:	48 b8 3e 8c ff ff ff 	movabs $0xffffffffffff8c3e,%rax
ffff800000108f42:	ff ff ff 
ffff800000108f45:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000108f49:	ff d0                	callq  *%rax
ffff800000108f4b:	48 89 c2             	mov    %rax,%rdx
ffff800000108f4e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108f52:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff800000108f56:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108f5a:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000108f5e:	48 85 c0             	test   %rax,%rax
ffff800000108f61:	75 50                	jne    ffff800000108fb3 <slab_create+0x16a>
ffff800000108f63:	48 b8 78 1a 00 00 00 	movabs $0x1a78,%rax
ffff800000108f6a:	00 00 00 
ffff800000108f6d:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000108f71:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108f76:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108f7b:	49 89 df             	mov    %rbx,%r15
ffff800000108f7e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108f83:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000108f8a:	ff ff ff 
ffff800000108f8d:	48 01 d9             	add    %rbx,%rcx
ffff800000108f90:	ff d1                	callq  *%rcx
ffff800000108f92:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108f96:	48 89 c7             	mov    %rax,%rdi
ffff800000108f99:	48 b8 dc 96 ff ff ff 	movabs $0xffffffffffff96dc,%rax
ffff800000108fa0:	ff ff ff 
ffff800000108fa3:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000108fa7:	ff d0                	callq  *%rax
ffff800000108fa9:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108fae:	e9 f0 02 00 00       	jmpq   ffff8000001092a3 <slab_create+0x45a>
ffff800000108fb3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108fb7:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000108fbb:	ba 48 00 00 00       	mov    $0x48,%edx
ffff800000108fc0:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108fc5:	48 89 c7             	mov    %rax,%rdi
ffff800000108fc8:	49 89 df             	mov    %rbx,%r15
ffff800000108fcb:	48 b8 ef b3 ff ff ff 	movabs $0xffffffffffffb3ef,%rax
ffff800000108fd2:	ff ff ff 
ffff800000108fd5:	48 01 d8             	add    %rbx,%rax
ffff800000108fd8:	ff d0                	callq  *%rax
ffff800000108fda:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108fde:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
ffff800000108fe5:	00 
ffff800000108fe6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108fea:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
ffff800000108fee:	48 89 50 28          	mov    %rdx,0x28(%rax)
ffff800000108ff2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108ff6:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000108ffa:	48 89 50 30          	mov    %rdx,0x30(%rax)
ffff800000108ffe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000109002:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109006:	48 89 c7             	mov    %rax,%rdi
ffff800000109009:	49 89 df             	mov    %rbx,%r15
ffff80000010900c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109011:	48 ba 61 b5 ff ff ff 	movabs $0xffffffffffffb561,%rdx
ffff800000109018:	ff ff ff 
ffff80000010901b:	48 01 da             	add    %rbx,%rdx
ffff80000010901e:	ff d2                	callq  *%rdx
ffff800000109020:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000109024:	4c 8b 60 18          	mov    0x18(%rax),%r12
ffff800000109028:	ba 00 00 00 00       	mov    $0x0,%edx
ffff80000010902d:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000109032:	bf 02 00 00 00       	mov    $0x2,%edi
ffff800000109037:	48 b8 36 87 ff ff ff 	movabs $0xffffffffffff8736,%rax
ffff80000010903e:	ff ff ff 
ffff800000109041:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109045:	ff d0                	callq  *%rax
ffff800000109047:	49 89 44 24 10       	mov    %rax,0x10(%r12)
ffff80000010904c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000109050:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109054:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000109058:	48 85 c0             	test   %rax,%rax
ffff80000010905b:	75 6b                	jne    ffff8000001090c8 <slab_create+0x27f>
ffff80000010905d:	48 b8 b0 1a 00 00 00 	movabs $0x1ab0,%rax
ffff800000109064:	00 00 00 
ffff800000109067:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010906b:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109070:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000109075:	49 89 df             	mov    %rbx,%r15
ffff800000109078:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010907d:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000109084:	ff ff ff 
ffff800000109087:	48 01 d9             	add    %rbx,%rcx
ffff80000010908a:	ff d1                	callq  *%rcx
ffff80000010908c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000109090:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109094:	48 89 c7             	mov    %rax,%rdi
ffff800000109097:	48 b8 dc 96 ff ff ff 	movabs $0xffffffffffff96dc,%rax
ffff80000010909e:	ff ff ff 
ffff8000001090a1:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001090a5:	ff d0                	callq  *%rax
ffff8000001090a7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001090ab:	48 89 c7             	mov    %rax,%rdi
ffff8000001090ae:	48 b8 dc 96 ff ff ff 	movabs $0xffffffffffff96dc,%rax
ffff8000001090b5:	ff ff ff 
ffff8000001090b8:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001090bc:	ff d0                	callq  *%rax
ffff8000001090be:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001090c3:	e9 db 01 00 00       	jmpq   ffff8000001092a3 <slab_create+0x45a>
ffff8000001090c8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001090cc:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001090d0:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff8000001090d4:	be 80 00 00 00       	mov    $0x80,%esi
ffff8000001090d9:	48 89 c7             	mov    %rax,%rdi
ffff8000001090dc:	48 b8 8a 77 ff ff ff 	movabs $0xffffffffffff778a,%rax
ffff8000001090e3:	ff ff ff 
ffff8000001090e6:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001090ea:	ff d0                	callq  *%rax
ffff8000001090ec:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001090f0:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001090f4:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
ffff8000001090fb:	00 
ffff8000001090fc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000109100:	48 8b 30             	mov    (%rax),%rsi
ffff800000109103:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000109107:	48 8b 48 18          	mov    0x18(%rax),%rcx
ffff80000010910b:	b8 00 00 20 00       	mov    $0x200000,%eax
ffff800000109110:	ba 00 00 00 00       	mov    $0x0,%edx
ffff800000109115:	48 f7 f6             	div    %rsi
ffff800000109118:	48 89 41 20          	mov    %rax,0x20(%rcx)
ffff80000010911c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000109120:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109124:	48 8b 50 20          	mov    0x20(%rax),%rdx
ffff800000109128:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010912c:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000109130:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000109134:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109138:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff80000010913c:	48 8b 50 08          	mov    0x8(%rax),%rdx
ffff800000109140:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff800000109147:	80 ff ff 
ffff80000010914a:	48 01 c2             	add    %rax,%rdx
ffff80000010914d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000109151:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109155:	48 89 50 28          	mov    %rdx,0x28(%rax)
ffff800000109159:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010915d:	48 8b 50 18          	mov    0x18(%rax),%rdx
ffff800000109161:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000109165:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109169:	48 8b 52 20          	mov    0x20(%rdx),%rdx
ffff80000010916d:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff800000109171:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000109175:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109179:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff80000010917d:	48 83 c0 3f          	add    $0x3f,%rax
ffff800000109181:	48 c1 e8 06          	shr    $0x6,%rax
ffff800000109185:	48 89 c2             	mov    %rax,%rdx
ffff800000109188:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010918c:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109190:	48 c1 e2 03          	shl    $0x3,%rdx
ffff800000109194:	48 89 50 30          	mov    %rdx,0x30(%rax)
ffff800000109198:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010919c:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001091a0:	48 8b 40 30          	mov    0x30(%rax),%rax
ffff8000001091a4:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001091a8:	4c 8b 62 18          	mov    0x18(%rdx),%r12
ffff8000001091ac:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001091b1:	48 89 c7             	mov    %rax,%rdi
ffff8000001091b4:	48 b8 3e 8c ff ff ff 	movabs $0xffffffffffff8c3e,%rax
ffff8000001091bb:	ff ff ff 
ffff8000001091be:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001091c2:	ff d0                	callq  *%rax
ffff8000001091c4:	49 89 44 24 40       	mov    %rax,0x40(%r12)
ffff8000001091c9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001091cd:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001091d1:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff8000001091d5:	48 85 c0             	test   %rax,%rax
ffff8000001091d8:	0f 85 8c 00 00 00    	jne    ffff80000010926a <slab_create+0x421>
ffff8000001091de:	48 b8 f0 1a 00 00 00 	movabs $0x1af0,%rax
ffff8000001091e5:	00 00 00 
ffff8000001091e8:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001091ec:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001091f1:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001091f6:	49 89 df             	mov    %rbx,%r15
ffff8000001091f9:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001091fe:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000109205:	ff ff ff 
ffff800000109208:	48 01 d9             	add    %rbx,%rcx
ffff80000010920b:	ff d1                	callq  *%rcx
ffff80000010920d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000109211:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109215:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000109219:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010921e:	48 89 c7             	mov    %rax,%rdi
ffff800000109221:	48 b8 c8 8a ff ff ff 	movabs $0xffffffffffff8ac8,%rax
ffff800000109228:	ff ff ff 
ffff80000010922b:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff80000010922f:	ff d0                	callq  *%rax
ffff800000109231:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000109235:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109239:	48 89 c7             	mov    %rax,%rdi
ffff80000010923c:	48 b8 dc 96 ff ff ff 	movabs $0xffffffffffff96dc,%rax
ffff800000109243:	ff ff ff 
ffff800000109246:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff80000010924a:	ff d0                	callq  *%rax
ffff80000010924c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000109250:	48 89 c7             	mov    %rax,%rdi
ffff800000109253:	48 b8 dc 96 ff ff ff 	movabs $0xffffffffffff96dc,%rax
ffff80000010925a:	ff ff ff 
ffff80000010925d:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109261:	ff d0                	callq  *%rax
ffff800000109263:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109268:	eb 39                	jmp    ffff8000001092a3 <slab_create+0x45a>
ffff80000010926a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010926e:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109272:	48 8b 40 30          	mov    0x30(%rax),%rax
ffff800000109276:	48 89 c2             	mov    %rax,%rdx
ffff800000109279:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010927d:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109281:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff800000109285:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010928a:	48 89 c7             	mov    %rax,%rdi
ffff80000010928d:	49 89 df             	mov    %rbx,%r15
ffff800000109290:	48 b8 ef b3 ff ff ff 	movabs $0xffffffffffffb3ef,%rax
ffff800000109297:	ff ff ff 
ffff80000010929a:	48 01 d8             	add    %rbx,%rax
ffff80000010929d:	ff d0                	callq  *%rax
ffff80000010929f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001092a3:	48 83 c4 38          	add    $0x38,%rsp
ffff8000001092a7:	5b                   	pop    %rbx
ffff8000001092a8:	41 5c                	pop    %r12
ffff8000001092aa:	41 5f                	pop    %r15
ffff8000001092ac:	5d                   	pop    %rbp
ffff8000001092ad:	c3                   	retq   

ffff8000001092ae <slab_destroy>:
ffff8000001092ae:	55                   	push   %rbp
ffff8000001092af:	48 89 e5             	mov    %rsp,%rbp
ffff8000001092b2:	41 57                	push   %r15
ffff8000001092b4:	53                   	push   %rbx
ffff8000001092b5:	48 83 ec 30          	sub    $0x30,%rsp
ffff8000001092b9:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff8000001092b9 <slab_destroy+0xb>
ffff8000001092c0:	49 bb 2f 5f 00 00 00 	movabs $0x5f2f,%r11
ffff8000001092c7:	00 00 00 
ffff8000001092ca:	4c 01 db             	add    %r11,%rbx
ffff8000001092cd:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
ffff8000001092d1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001092d5:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001092d9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001092dd:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
ffff8000001092e4:	00 
ffff8000001092e5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001092e9:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff8000001092ed:	48 85 c0             	test   %rax,%rax
ffff8000001092f0:	0f 84 f8 00 00 00    	je     ffff8000001093ee <slab_destroy+0x140>
ffff8000001092f6:	48 b8 30 1b 00 00 00 	movabs $0x1b30,%rax
ffff8000001092fd:	00 00 00 
ffff800000109300:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000109304:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109309:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010930e:	49 89 df             	mov    %rbx,%r15
ffff800000109311:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109316:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff80000010931d:	ff ff ff 
ffff800000109320:	48 01 d9             	add    %rbx,%rcx
ffff800000109323:	ff d1                	callq  *%rcx
ffff800000109325:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010932a:	e9 6e 01 00 00       	jmpq   ffff80000010949d <slab_destroy+0x1ef>
ffff80000010932f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109333:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff800000109337:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010933b:	48 89 c7             	mov    %rax,%rdi
ffff80000010933e:	49 89 df             	mov    %rbx,%r15
ffff800000109341:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109346:	48 ba d0 b6 ff ff ff 	movabs $0xffffffffffffb6d0,%rdx
ffff80000010934d:	ff ff ff 
ffff800000109350:	48 01 da             	add    %rbx,%rdx
ffff800000109353:	ff d2                	callq  *%rdx
ffff800000109355:	48 98                	cltq   
ffff800000109357:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff80000010935b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010935f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000109363:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109367:	48 89 c7             	mov    %rax,%rdi
ffff80000010936a:	49 89 df             	mov    %rbx,%r15
ffff80000010936d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109372:	48 ba 47 b6 ff ff ff 	movabs $0xffffffffffffb647,%rdx
ffff800000109379:	ff ff ff 
ffff80000010937c:	48 01 da             	add    %rbx,%rdx
ffff80000010937f:	ff d2                	callq  *%rdx
ffff800000109381:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109385:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff800000109389:	48 89 c7             	mov    %rax,%rdi
ffff80000010938c:	48 b8 dc 96 ff ff ff 	movabs $0xffffffffffff96dc,%rax
ffff800000109393:	ff ff ff 
ffff800000109396:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff80000010939a:	ff d0                	callq  *%rax
ffff80000010939c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001093a0:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff8000001093a4:	48 89 c7             	mov    %rax,%rdi
ffff8000001093a7:	48 b8 0c 78 ff ff ff 	movabs $0xffffffffffff780c,%rax
ffff8000001093ae:	ff ff ff 
ffff8000001093b1:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001093b5:	ff d0                	callq  *%rax
ffff8000001093b7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001093bb:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff8000001093bf:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001093c4:	48 89 c7             	mov    %rax,%rdi
ffff8000001093c7:	48 b8 c8 8a ff ff ff 	movabs $0xffffffffffff8ac8,%rax
ffff8000001093ce:	ff ff ff 
ffff8000001093d1:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001093d5:	ff d0                	callq  *%rax
ffff8000001093d7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001093db:	48 89 c7             	mov    %rax,%rdi
ffff8000001093de:	48 b8 dc 96 ff ff ff 	movabs $0xffffffffffff96dc,%rax
ffff8000001093e5:	ff ff ff 
ffff8000001093e8:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001093ec:	ff d0                	callq  *%rax
ffff8000001093ee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001093f2:	48 89 c7             	mov    %rax,%rdi
ffff8000001093f5:	49 89 df             	mov    %rbx,%r15
ffff8000001093f8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001093fd:	48 ba 8b b6 ff ff ff 	movabs $0xffffffffffffb68b,%rdx
ffff800000109404:	ff ff ff 
ffff800000109407:	48 01 da             	add    %rbx,%rdx
ffff80000010940a:	ff d2                	callq  *%rdx
ffff80000010940c:	85 c0                	test   %eax,%eax
ffff80000010940e:	0f 84 1b ff ff ff    	je     ffff80000010932f <slab_destroy+0x81>
ffff800000109414:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109418:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff80000010941c:	48 89 c7             	mov    %rax,%rdi
ffff80000010941f:	48 b8 dc 96 ff ff ff 	movabs $0xffffffffffff96dc,%rax
ffff800000109426:	ff ff ff 
ffff800000109429:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff80000010942d:	ff d0                	callq  *%rax
ffff80000010942f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109433:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000109437:	48 89 c7             	mov    %rax,%rdi
ffff80000010943a:	48 b8 0c 78 ff ff ff 	movabs $0xffffffffffff780c,%rax
ffff800000109441:	ff ff ff 
ffff800000109444:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109448:	ff d0                	callq  *%rax
ffff80000010944a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010944e:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000109452:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000109457:	48 89 c7             	mov    %rax,%rdi
ffff80000010945a:	48 b8 c8 8a ff ff ff 	movabs $0xffffffffffff8ac8,%rax
ffff800000109461:	ff ff ff 
ffff800000109464:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109468:	ff d0                	callq  *%rax
ffff80000010946a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010946e:	48 89 c7             	mov    %rax,%rdi
ffff800000109471:	48 b8 dc 96 ff ff ff 	movabs $0xffffffffffff96dc,%rax
ffff800000109478:	ff ff ff 
ffff80000010947b:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff80000010947f:	ff d0                	callq  *%rax
ffff800000109481:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109485:	48 89 c7             	mov    %rax,%rdi
ffff800000109488:	48 b8 dc 96 ff ff ff 	movabs $0xffffffffffff96dc,%rax
ffff80000010948f:	ff ff ff 
ffff800000109492:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109496:	ff d0                	callq  *%rax
ffff800000109498:	b8 01 00 00 00       	mov    $0x1,%eax
ffff80000010949d:	48 83 c4 30          	add    $0x30,%rsp
ffff8000001094a1:	5b                   	pop    %rbx
ffff8000001094a2:	41 5f                	pop    %r15
ffff8000001094a4:	5d                   	pop    %rbp
ffff8000001094a5:	c3                   	retq   

ffff8000001094a6 <slab_malloc>:
ffff8000001094a6:	55                   	push   %rbp
ffff8000001094a7:	48 89 e5             	mov    %rsp,%rbp
ffff8000001094aa:	41 57                	push   %r15
ffff8000001094ac:	53                   	push   %rbx
ffff8000001094ad:	48 83 ec 30          	sub    $0x30,%rsp
ffff8000001094b1:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff8000001094b1 <slab_malloc+0xb>
ffff8000001094b8:	49 bb 37 5d 00 00 00 	movabs $0x5d37,%r11
ffff8000001094bf:	00 00 00 
ffff8000001094c2:	4c 01 db             	add    %r11,%rbx
ffff8000001094c5:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
ffff8000001094c9:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
ffff8000001094cd:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001094d1:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001094d5:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001094d9:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
ffff8000001094e0:	00 
ffff8000001094e1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001094e5:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff8000001094ec:	00 
ffff8000001094ed:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001094f1:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff8000001094f5:	48 85 c0             	test   %rax,%rax
ffff8000001094f8:	0f 84 5d 04 00 00    	je     ffff80000010995b <slab_malloc+0x4b5>
ffff8000001094fe:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109503:	bf 48 00 00 00       	mov    $0x48,%edi
ffff800000109508:	48 b8 3e 8c ff ff ff 	movabs $0xffffffffffff8c3e,%rax
ffff80000010950f:	ff ff ff 
ffff800000109512:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109516:	ff d0                	callq  *%rax
ffff800000109518:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff80000010951c:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
ffff800000109521:	75 39                	jne    ffff80000010955c <slab_malloc+0xb6>
ffff800000109523:	48 b8 50 1b 00 00 00 	movabs $0x1b50,%rax
ffff80000010952a:	00 00 00 
ffff80000010952d:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000109531:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109536:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010953b:	49 89 df             	mov    %rbx,%r15
ffff80000010953e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109543:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff80000010954a:	ff ff ff 
ffff80000010954d:	48 01 d9             	add    %rbx,%rcx
ffff800000109550:	ff d1                	callq  *%rcx
ffff800000109552:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109557:	e9 b0 06 00 00       	jmpq   ffff800000109c0c <slab_malloc+0x766>
ffff80000010955c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109560:	ba 48 00 00 00       	mov    $0x48,%edx
ffff800000109565:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010956a:	48 89 c7             	mov    %rax,%rdi
ffff80000010956d:	49 89 df             	mov    %rbx,%r15
ffff800000109570:	48 b8 ef b3 ff ff ff 	movabs $0xffffffffffffb3ef,%rax
ffff800000109577:	ff ff ff 
ffff80000010957a:	48 01 d8             	add    %rbx,%rax
ffff80000010957d:	ff d0                	callq  *%rax
ffff80000010957f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109583:	48 89 c7             	mov    %rax,%rdi
ffff800000109586:	49 89 df             	mov    %rbx,%r15
ffff800000109589:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010958e:	48 ba 61 b5 ff ff ff 	movabs $0xffffffffffffb561,%rdx
ffff800000109595:	ff ff ff 
ffff800000109598:	48 01 da             	add    %rbx,%rdx
ffff80000010959b:	ff d2                	callq  *%rdx
ffff80000010959d:	ba 00 00 00 00       	mov    $0x0,%edx
ffff8000001095a2:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001095a7:	bf 02 00 00 00       	mov    $0x2,%edi
ffff8000001095ac:	48 b8 36 87 ff ff ff 	movabs $0xffffffffffff8736,%rax
ffff8000001095b3:	ff ff ff 
ffff8000001095b6:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001095ba:	ff d0                	callq  *%rax
ffff8000001095bc:	48 89 c2             	mov    %rax,%rdx
ffff8000001095bf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001095c3:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff8000001095c7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001095cb:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff8000001095cf:	48 85 c0             	test   %rax,%rax
ffff8000001095d2:	75 50                	jne    ffff800000109624 <slab_malloc+0x17e>
ffff8000001095d4:	48 b8 78 1b 00 00 00 	movabs $0x1b78,%rax
ffff8000001095db:	00 00 00 
ffff8000001095de:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001095e2:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001095e7:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001095ec:	49 89 df             	mov    %rbx,%r15
ffff8000001095ef:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001095f4:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff8000001095fb:	ff ff ff 
ffff8000001095fe:	48 01 d9             	add    %rbx,%rcx
ffff800000109601:	ff d1                	callq  *%rcx
ffff800000109603:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109607:	48 89 c7             	mov    %rax,%rdi
ffff80000010960a:	48 b8 dc 96 ff ff ff 	movabs $0xffffffffffff96dc,%rax
ffff800000109611:	ff ff ff 
ffff800000109614:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109618:	ff d0                	callq  *%rax
ffff80000010961a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010961f:	e9 e8 05 00 00       	jmpq   ffff800000109c0c <slab_malloc+0x766>
ffff800000109624:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109628:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff80000010962c:	be 80 00 00 00       	mov    $0x80,%esi
ffff800000109631:	48 89 c7             	mov    %rax,%rdi
ffff800000109634:	48 b8 8a 77 ff ff ff 	movabs $0xffffffffffff778a,%rax
ffff80000010963b:	ff ff ff 
ffff80000010963e:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109642:	ff d0                	callq  *%rax
ffff800000109644:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109648:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
ffff80000010964f:	00 
ffff800000109650:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109654:	48 8b 38             	mov    (%rax),%rdi
ffff800000109657:	b8 00 00 20 00       	mov    $0x200000,%eax
ffff80000010965c:	ba 00 00 00 00       	mov    $0x0,%edx
ffff800000109661:	48 f7 f7             	div    %rdi
ffff800000109664:	48 89 c2             	mov    %rax,%rdx
ffff800000109667:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010966b:	48 89 50 20          	mov    %rdx,0x20(%rax)
ffff80000010966f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109673:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000109677:	48 8b 50 08          	mov    0x8(%rax),%rdx
ffff80000010967b:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff800000109682:	80 ff ff 
ffff800000109685:	48 01 d0             	add    %rdx,%rax
ffff800000109688:	48 89 c2             	mov    %rax,%rdx
ffff80000010968b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010968f:	48 89 50 28          	mov    %rdx,0x28(%rax)
ffff800000109693:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109697:	48 8b 50 20          	mov    0x20(%rax),%rdx
ffff80000010969b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010969f:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff8000001096a3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001096a7:	48 8b 40 38          	mov    0x38(%rax),%rax
ffff8000001096ab:	48 83 c0 3f          	add    $0x3f,%rax
ffff8000001096af:	48 c1 e8 06          	shr    $0x6,%rax
ffff8000001096b3:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
ffff8000001096ba:	00 
ffff8000001096bb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001096bf:	48 89 50 30          	mov    %rdx,0x30(%rax)
ffff8000001096c3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001096c7:	48 8b 40 30          	mov    0x30(%rax),%rax
ffff8000001096cb:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001096d0:	48 89 c7             	mov    %rax,%rdi
ffff8000001096d3:	48 b8 3e 8c ff ff ff 	movabs $0xffffffffffff8c3e,%rax
ffff8000001096da:	ff ff ff 
ffff8000001096dd:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001096e1:	ff d0                	callq  *%rax
ffff8000001096e3:	48 89 c2             	mov    %rax,%rdx
ffff8000001096e6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001096ea:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff8000001096ee:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001096f2:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff8000001096f6:	48 85 c0             	test   %rax,%rax
ffff8000001096f9:	75 70                	jne    ffff80000010976b <slab_malloc+0x2c5>
ffff8000001096fb:	48 b8 b0 1b 00 00 00 	movabs $0x1bb0,%rax
ffff800000109702:	00 00 00 
ffff800000109705:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000109709:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010970e:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000109713:	49 89 df             	mov    %rbx,%r15
ffff800000109716:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010971b:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000109722:	ff ff ff 
ffff800000109725:	48 01 d9             	add    %rbx,%rcx
ffff800000109728:	ff d1                	callq  *%rcx
ffff80000010972a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010972e:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000109732:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000109737:	48 89 c7             	mov    %rax,%rdi
ffff80000010973a:	48 b8 c8 8a ff ff ff 	movabs $0xffffffffffff8ac8,%rax
ffff800000109741:	ff ff ff 
ffff800000109744:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109748:	ff d0                	callq  *%rax
ffff80000010974a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010974e:	48 89 c7             	mov    %rax,%rdi
ffff800000109751:	48 b8 dc 96 ff ff ff 	movabs $0xffffffffffff96dc,%rax
ffff800000109758:	ff ff ff 
ffff80000010975b:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff80000010975f:	ff d0                	callq  *%rax
ffff800000109761:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109766:	e9 a1 04 00 00       	jmpq   ffff800000109c0c <slab_malloc+0x766>
ffff80000010976b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010976f:	48 8b 40 30          	mov    0x30(%rax),%rax
ffff800000109773:	48 89 c2             	mov    %rax,%rdx
ffff800000109776:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010977a:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff80000010977e:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109783:	48 89 c7             	mov    %rax,%rdi
ffff800000109786:	49 89 df             	mov    %rbx,%r15
ffff800000109789:	48 b8 ef b3 ff ff ff 	movabs $0xffffffffffffb3ef,%rax
ffff800000109790:	ff ff ff 
ffff800000109793:	48 01 d8             	add    %rbx,%rax
ffff800000109796:	ff d0                	callq  *%rax
ffff800000109798:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010979c:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001097a0:	48 89 c1             	mov    %rax,%rcx
ffff8000001097a3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001097a7:	48 8b 10             	mov    (%rax),%rdx
ffff8000001097aa:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff8000001097ae:	48 89 d6             	mov    %rdx,%rsi
ffff8000001097b1:	48 89 c2             	mov    %rax,%rdx
ffff8000001097b4:	48 89 cf             	mov    %rcx,%rdi
ffff8000001097b7:	49 89 df             	mov    %rbx,%r15
ffff8000001097ba:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001097bf:	48 b9 97 b5 ff ff ff 	movabs $0xffffffffffffb597,%rcx
ffff8000001097c6:	ff ff ff 
ffff8000001097c9:	48 01 d9             	add    %rbx,%rcx
ffff8000001097cc:	ff d1                	callq  *%rcx
ffff8000001097ce:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001097d2:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff8000001097d6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001097da:	48 8b 40 38          	mov    0x38(%rax),%rax
ffff8000001097de:	48 01 c2             	add    %rax,%rdx
ffff8000001097e1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001097e5:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff8000001097e9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
ffff8000001097f0:	e9 4a 01 00 00       	jmpq   ffff80000010993f <slab_malloc+0x499>
ffff8000001097f5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001097f9:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff8000001097fd:	8b 55 dc             	mov    -0x24(%rbp),%edx
ffff800000109800:	c1 fa 06             	sar    $0x6,%edx
ffff800000109803:	48 63 d2             	movslq %edx,%rdx
ffff800000109806:	48 c1 e2 03          	shl    $0x3,%rdx
ffff80000010980a:	48 01 d0             	add    %rdx,%rax
ffff80000010980d:	48 8b 30             	mov    (%rax),%rsi
ffff800000109810:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000109813:	99                   	cltd   
ffff800000109814:	c1 ea 1a             	shr    $0x1a,%edx
ffff800000109817:	01 d0                	add    %edx,%eax
ffff800000109819:	83 e0 3f             	and    $0x3f,%eax
ffff80000010981c:	29 d0                	sub    %edx,%eax
ffff80000010981e:	89 c1                	mov    %eax,%ecx
ffff800000109820:	48 d3 ee             	shr    %cl,%rsi
ffff800000109823:	48 89 f0             	mov    %rsi,%rax
ffff800000109826:	83 e0 01             	and    $0x1,%eax
ffff800000109829:	48 85 c0             	test   %rax,%rax
ffff80000010982c:	0f 85 09 01 00 00    	jne    ffff80000010993b <slab_malloc+0x495>
ffff800000109832:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109836:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff80000010983a:	8b 55 dc             	mov    -0x24(%rbp),%edx
ffff80000010983d:	c1 fa 06             	sar    $0x6,%edx
ffff800000109840:	48 63 d2             	movslq %edx,%rdx
ffff800000109843:	48 c1 e2 03          	shl    $0x3,%rdx
ffff800000109847:	48 01 d0             	add    %rdx,%rax
ffff80000010984a:	48 8b 30             	mov    (%rax),%rsi
ffff80000010984d:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000109850:	99                   	cltd   
ffff800000109851:	c1 ea 1a             	shr    $0x1a,%edx
ffff800000109854:	01 d0                	add    %edx,%eax
ffff800000109856:	83 e0 3f             	and    $0x3f,%eax
ffff800000109859:	29 d0                	sub    %edx,%eax
ffff80000010985b:	ba 01 00 00 00       	mov    $0x1,%edx
ffff800000109860:	89 c1                	mov    %eax,%ecx
ffff800000109862:	48 d3 e2             	shl    %cl,%rdx
ffff800000109865:	48 89 d1             	mov    %rdx,%rcx
ffff800000109868:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010986c:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff800000109870:	8b 55 dc             	mov    -0x24(%rbp),%edx
ffff800000109873:	c1 fa 06             	sar    $0x6,%edx
ffff800000109876:	48 63 d2             	movslq %edx,%rdx
ffff800000109879:	48 c1 e2 03          	shl    $0x3,%rdx
ffff80000010987d:	48 01 d0             	add    %rdx,%rax
ffff800000109880:	48 09 ce             	or     %rcx,%rsi
ffff800000109883:	48 89 f2             	mov    %rsi,%rdx
ffff800000109886:	48 89 10             	mov    %rdx,(%rax)
ffff800000109889:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010988d:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109891:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000109895:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109899:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff80000010989d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001098a1:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff8000001098a5:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff8000001098a9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001098ad:	48 89 50 20          	mov    %rdx,0x20(%rax)
ffff8000001098b1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001098b5:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff8000001098b9:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001098bd:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001098c1:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff8000001098c5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001098c9:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff8000001098cd:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff8000001098d1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001098d5:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff8000001098d9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001098dd:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff8000001098e1:	48 85 c0             	test   %rax,%rax
ffff8000001098e4:	74 35                	je     ffff80000010991b <slab_malloc+0x475>
ffff8000001098e6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001098ea:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff8000001098ee:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
ffff8000001098f2:	48 8b 4a 28          	mov    0x28(%rdx),%rcx
ffff8000001098f6:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
ffff8000001098fa:	48 8b 32             	mov    (%rdx),%rsi
ffff8000001098fd:	8b 55 dc             	mov    -0x24(%rbp),%edx
ffff800000109900:	48 63 d2             	movslq %edx,%rdx
ffff800000109903:	48 0f af d6          	imul   %rsi,%rdx
ffff800000109907:	48 01 d1             	add    %rdx,%rcx
ffff80000010990a:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
ffff80000010990e:	48 89 d6             	mov    %rdx,%rsi
ffff800000109911:	48 89 cf             	mov    %rcx,%rdi
ffff800000109914:	ff d0                	callq  *%rax
ffff800000109916:	e9 f1 02 00 00       	jmpq   ffff800000109c0c <slab_malloc+0x766>
ffff80000010991b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010991f:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff800000109923:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109927:	48 8b 08             	mov    (%rax),%rcx
ffff80000010992a:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff80000010992d:	48 98                	cltq   
ffff80000010992f:	48 0f af c1          	imul   %rcx,%rax
ffff800000109933:	48 01 d0             	add    %rdx,%rax
ffff800000109936:	e9 d1 02 00 00       	jmpq   ffff800000109c0c <slab_malloc+0x766>
ffff80000010993b:	83 45 dc 01          	addl   $0x1,-0x24(%rbp)
ffff80000010993f:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000109942:	48 63 d0             	movslq %eax,%rdx
ffff800000109945:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109949:	48 8b 40 38          	mov    0x38(%rax),%rax
ffff80000010994d:	48 39 c2             	cmp    %rax,%rdx
ffff800000109950:	0f 82 9f fe ff ff    	jb     ffff8000001097f5 <slab_malloc+0x34f>
ffff800000109956:	e9 e7 01 00 00       	jmpq   ffff800000109b42 <slab_malloc+0x69c>
ffff80000010995b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010995f:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff800000109963:	48 85 c0             	test   %rax,%rax
ffff800000109966:	75 31                	jne    ffff800000109999 <slab_malloc+0x4f3>
ffff800000109968:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010996c:	48 89 c7             	mov    %rax,%rdi
ffff80000010996f:	49 89 df             	mov    %rbx,%r15
ffff800000109972:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109977:	48 ba d0 b6 ff ff ff 	movabs $0xffffffffffffb6d0,%rdx
ffff80000010997e:	ff ff ff 
ffff800000109981:	48 01 da             	add    %rbx,%rdx
ffff800000109984:	ff d2                	callq  *%rdx
ffff800000109986:	48 98                	cltq   
ffff800000109988:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff80000010998c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000109990:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000109994:	e9 97 01 00 00       	jmpq   ffff800000109b30 <slab_malloc+0x68a>
ffff800000109999:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
ffff8000001099a0:	e9 74 01 00 00       	jmpq   ffff800000109b19 <slab_malloc+0x673>
ffff8000001099a5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001099a9:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff8000001099ad:	8b 55 d8             	mov    -0x28(%rbp),%edx
ffff8000001099b0:	c1 fa 06             	sar    $0x6,%edx
ffff8000001099b3:	48 63 d2             	movslq %edx,%rdx
ffff8000001099b6:	48 c1 e2 03          	shl    $0x3,%rdx
ffff8000001099ba:	48 01 d0             	add    %rdx,%rax
ffff8000001099bd:	48 8b 00             	mov    (%rax),%rax
ffff8000001099c0:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
ffff8000001099c4:	75 09                	jne    ffff8000001099cf <slab_malloc+0x529>
ffff8000001099c6:	83 45 d8 3f          	addl   $0x3f,-0x28(%rbp)
ffff8000001099ca:	e9 46 01 00 00       	jmpq   ffff800000109b15 <slab_malloc+0x66f>
ffff8000001099cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001099d3:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff8000001099d7:	8b 55 d8             	mov    -0x28(%rbp),%edx
ffff8000001099da:	c1 fa 06             	sar    $0x6,%edx
ffff8000001099dd:	48 63 d2             	movslq %edx,%rdx
ffff8000001099e0:	48 c1 e2 03          	shl    $0x3,%rdx
ffff8000001099e4:	48 01 d0             	add    %rdx,%rax
ffff8000001099e7:	48 8b 30             	mov    (%rax),%rsi
ffff8000001099ea:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff8000001099ed:	99                   	cltd   
ffff8000001099ee:	c1 ea 1a             	shr    $0x1a,%edx
ffff8000001099f1:	01 d0                	add    %edx,%eax
ffff8000001099f3:	83 e0 3f             	and    $0x3f,%eax
ffff8000001099f6:	29 d0                	sub    %edx,%eax
ffff8000001099f8:	89 c1                	mov    %eax,%ecx
ffff8000001099fa:	48 d3 ee             	shr    %cl,%rsi
ffff8000001099fd:	48 89 f0             	mov    %rsi,%rax
ffff800000109a00:	83 e0 01             	and    $0x1,%eax
ffff800000109a03:	48 85 c0             	test   %rax,%rax
ffff800000109a06:	0f 85 09 01 00 00    	jne    ffff800000109b15 <slab_malloc+0x66f>
ffff800000109a0c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109a10:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff800000109a14:	8b 55 d8             	mov    -0x28(%rbp),%edx
ffff800000109a17:	c1 fa 06             	sar    $0x6,%edx
ffff800000109a1a:	48 63 d2             	movslq %edx,%rdx
ffff800000109a1d:	48 c1 e2 03          	shl    $0x3,%rdx
ffff800000109a21:	48 01 d0             	add    %rdx,%rax
ffff800000109a24:	48 8b 30             	mov    (%rax),%rsi
ffff800000109a27:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000109a2a:	99                   	cltd   
ffff800000109a2b:	c1 ea 1a             	shr    $0x1a,%edx
ffff800000109a2e:	01 d0                	add    %edx,%eax
ffff800000109a30:	83 e0 3f             	and    $0x3f,%eax
ffff800000109a33:	29 d0                	sub    %edx,%eax
ffff800000109a35:	ba 01 00 00 00       	mov    $0x1,%edx
ffff800000109a3a:	89 c1                	mov    %eax,%ecx
ffff800000109a3c:	48 d3 e2             	shl    %cl,%rdx
ffff800000109a3f:	48 89 d1             	mov    %rdx,%rcx
ffff800000109a42:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109a46:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff800000109a4a:	8b 55 d8             	mov    -0x28(%rbp),%edx
ffff800000109a4d:	c1 fa 06             	sar    $0x6,%edx
ffff800000109a50:	48 63 d2             	movslq %edx,%rdx
ffff800000109a53:	48 c1 e2 03          	shl    $0x3,%rdx
ffff800000109a57:	48 01 d0             	add    %rdx,%rax
ffff800000109a5a:	48 09 ce             	or     %rcx,%rsi
ffff800000109a5d:	48 89 f2             	mov    %rsi,%rdx
ffff800000109a60:	48 89 10             	mov    %rdx,(%rax)
ffff800000109a63:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109a67:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109a6b:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000109a6f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109a73:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff800000109a77:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109a7b:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff800000109a7f:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff800000109a83:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109a87:	48 89 50 20          	mov    %rdx,0x20(%rax)
ffff800000109a8b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109a8f:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000109a93:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000109a97:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109a9b:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000109a9f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109aa3:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000109aa7:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff800000109aab:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109aaf:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000109ab3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109ab7:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109abb:	48 85 c0             	test   %rax,%rax
ffff800000109abe:	74 35                	je     ffff800000109af5 <slab_malloc+0x64f>
ffff800000109ac0:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109ac4:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109ac8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000109acc:	48 8b 4a 28          	mov    0x28(%rdx),%rcx
ffff800000109ad0:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
ffff800000109ad4:	48 8b 32             	mov    (%rdx),%rsi
ffff800000109ad7:	8b 55 d8             	mov    -0x28(%rbp),%edx
ffff800000109ada:	48 63 d2             	movslq %edx,%rdx
ffff800000109add:	48 0f af d6          	imul   %rsi,%rdx
ffff800000109ae1:	48 01 d1             	add    %rdx,%rcx
ffff800000109ae4:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
ffff800000109ae8:	48 89 d6             	mov    %rdx,%rsi
ffff800000109aeb:	48 89 cf             	mov    %rcx,%rdi
ffff800000109aee:	ff d0                	callq  *%rax
ffff800000109af0:	e9 17 01 00 00       	jmpq   ffff800000109c0c <slab_malloc+0x766>
ffff800000109af5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109af9:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff800000109afd:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109b01:	48 8b 08             	mov    (%rax),%rcx
ffff800000109b04:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000109b07:	48 98                	cltq   
ffff800000109b09:	48 0f af c1          	imul   %rcx,%rax
ffff800000109b0d:	48 01 d0             	add    %rdx,%rax
ffff800000109b10:	e9 f7 00 00 00       	jmpq   ffff800000109c0c <slab_malloc+0x766>
ffff800000109b15:	83 45 d8 01          	addl   $0x1,-0x28(%rbp)
ffff800000109b19:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000109b1c:	48 63 d0             	movslq %eax,%rdx
ffff800000109b1f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109b23:	48 8b 40 38          	mov    0x38(%rax),%rax
ffff800000109b27:	48 39 c2             	cmp    %rax,%rdx
ffff800000109b2a:	0f 82 75 fe ff ff    	jb     ffff8000001099a5 <slab_malloc+0x4ff>
ffff800000109b30:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109b34:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109b38:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
ffff800000109b3c:	0f 85 19 fe ff ff    	jne    ffff80000010995b <slab_malloc+0x4b5>
ffff800000109b42:	48 b8 e3 1b 00 00 00 	movabs $0x1be3,%rax
ffff800000109b49:	00 00 00 
ffff800000109b4c:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000109b50:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109b55:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000109b5a:	49 89 df             	mov    %rbx,%r15
ffff800000109b5d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109b62:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000109b69:	ff ff ff 
ffff800000109b6c:	48 01 d9             	add    %rbx,%rcx
ffff800000109b6f:	ff d1                	callq  *%rcx
ffff800000109b71:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
ffff800000109b76:	0f 84 8b 00 00 00    	je     ffff800000109c07 <slab_malloc+0x761>
ffff800000109b7c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109b80:	48 89 c7             	mov    %rax,%rdi
ffff800000109b83:	49 89 df             	mov    %rbx,%r15
ffff800000109b86:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109b8b:	48 ba 47 b6 ff ff ff 	movabs $0xffffffffffffb647,%rdx
ffff800000109b92:	ff ff ff 
ffff800000109b95:	48 01 da             	add    %rbx,%rdx
ffff800000109b98:	ff d2                	callq  *%rdx
ffff800000109b9a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109b9e:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff800000109ba2:	48 89 c7             	mov    %rax,%rdi
ffff800000109ba5:	48 b8 dc 96 ff ff ff 	movabs $0xffffffffffff96dc,%rax
ffff800000109bac:	ff ff ff 
ffff800000109baf:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109bb3:	ff d0                	callq  *%rax
ffff800000109bb5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109bb9:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000109bbd:	48 89 c7             	mov    %rax,%rdi
ffff800000109bc0:	48 b8 0c 78 ff ff ff 	movabs $0xffffffffffff780c,%rax
ffff800000109bc7:	ff ff ff 
ffff800000109bca:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109bce:	ff d0                	callq  *%rax
ffff800000109bd0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109bd4:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000109bd8:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000109bdd:	48 89 c7             	mov    %rax,%rdi
ffff800000109be0:	48 b8 c8 8a ff ff ff 	movabs $0xffffffffffff8ac8,%rax
ffff800000109be7:	ff ff ff 
ffff800000109bea:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109bee:	ff d0                	callq  *%rax
ffff800000109bf0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109bf4:	48 89 c7             	mov    %rax,%rdi
ffff800000109bf7:	48 b8 dc 96 ff ff ff 	movabs $0xffffffffffff96dc,%rax
ffff800000109bfe:	ff ff ff 
ffff800000109c01:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109c05:	ff d0                	callq  *%rax
ffff800000109c07:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109c0c:	48 83 c4 30          	add    $0x30,%rsp
ffff800000109c10:	5b                   	pop    %rbx
ffff800000109c11:	41 5f                	pop    %r15
ffff800000109c13:	5d                   	pop    %rbp
ffff800000109c14:	c3                   	retq   

ffff800000109c15 <slab_free>:
ffff800000109c15:	55                   	push   %rbp
ffff800000109c16:	48 89 e5             	mov    %rsp,%rbp
ffff800000109c19:	41 57                	push   %r15
ffff800000109c1b:	53                   	push   %rbx
ffff800000109c1c:	48 83 ec 40          	sub    $0x40,%rsp
ffff800000109c20:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000109c20 <slab_free+0xb>
ffff800000109c27:	49 bb c8 55 00 00 00 	movabs $0x55c8,%r11
ffff800000109c2e:	00 00 00 
ffff800000109c31:	4c 01 db             	add    %r11,%rbx
ffff800000109c34:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
ffff800000109c38:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
ffff800000109c3c:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
ffff800000109c40:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109c44:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109c48:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000109c4c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
ffff800000109c53:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109c57:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109c5b:	48 39 45 c0          	cmp    %rax,-0x40(%rbp)
ffff800000109c5f:	0f 82 09 02 00 00    	jb     ffff800000109e6e <slab_free+0x259>
ffff800000109c65:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109c69:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109c6d:	48 05 00 00 20 00    	add    $0x200000,%rax
ffff800000109c73:	48 39 45 c0          	cmp    %rax,-0x40(%rbp)
ffff800000109c77:	0f 83 f1 01 00 00    	jae    ffff800000109e6e <slab_free+0x259>
ffff800000109c7d:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
ffff800000109c81:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109c85:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109c89:	48 29 c2             	sub    %rax,%rdx
ffff800000109c8c:	48 89 d0             	mov    %rdx,%rax
ffff800000109c8f:	48 89 c1             	mov    %rax,%rcx
ffff800000109c92:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109c96:	48 8b 38             	mov    (%rax),%rdi
ffff800000109c99:	48 89 c8             	mov    %rcx,%rax
ffff800000109c9c:	ba 00 00 00 00       	mov    $0x0,%edx
ffff800000109ca1:	48 f7 f7             	div    %rdi
ffff800000109ca4:	89 45 e4             	mov    %eax,-0x1c(%rbp)
ffff800000109ca7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109cab:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff800000109caf:	8b 55 e4             	mov    -0x1c(%rbp),%edx
ffff800000109cb2:	c1 fa 06             	sar    $0x6,%edx
ffff800000109cb5:	48 63 d2             	movslq %edx,%rdx
ffff800000109cb8:	48 c1 e2 03          	shl    $0x3,%rdx
ffff800000109cbc:	48 01 d0             	add    %rdx,%rax
ffff800000109cbf:	48 8b 30             	mov    (%rax),%rsi
ffff800000109cc2:	8b 45 e4             	mov    -0x1c(%rbp),%eax
ffff800000109cc5:	99                   	cltd   
ffff800000109cc6:	c1 ea 1a             	shr    $0x1a,%edx
ffff800000109cc9:	01 d0                	add    %edx,%eax
ffff800000109ccb:	83 e0 3f             	and    $0x3f,%eax
ffff800000109cce:	29 d0                	sub    %edx,%eax
ffff800000109cd0:	ba 01 00 00 00       	mov    $0x1,%edx
ffff800000109cd5:	89 c1                	mov    %eax,%ecx
ffff800000109cd7:	48 d3 e2             	shl    %cl,%rdx
ffff800000109cda:	48 89 d1             	mov    %rdx,%rcx
ffff800000109cdd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109ce1:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff800000109ce5:	8b 55 e4             	mov    -0x1c(%rbp),%edx
ffff800000109ce8:	c1 fa 06             	sar    $0x6,%edx
ffff800000109ceb:	48 63 d2             	movslq %edx,%rdx
ffff800000109cee:	48 c1 e2 03          	shl    $0x3,%rdx
ffff800000109cf2:	48 01 d0             	add    %rdx,%rax
ffff800000109cf5:	48 31 ce             	xor    %rcx,%rsi
ffff800000109cf8:	48 89 f2             	mov    %rsi,%rdx
ffff800000109cfb:	48 89 10             	mov    %rdx,(%rax)
ffff800000109cfe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109d02:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff800000109d06:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000109d0a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109d0e:	48 89 50 20          	mov    %rdx,0x20(%rax)
ffff800000109d12:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109d16:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109d1a:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff800000109d1e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109d22:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff800000109d26:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109d2a:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000109d2e:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff800000109d32:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109d36:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000109d3a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109d3e:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000109d42:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000109d46:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109d4a:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000109d4e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109d52:	48 8b 40 30          	mov    0x30(%rax),%rax
ffff800000109d56:	48 85 c0             	test   %rax,%rax
ffff800000109d59:	74 30                	je     ffff800000109d8b <slab_free+0x176>
ffff800000109d5b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109d5f:	48 8b 40 30          	mov    0x30(%rax),%rax
ffff800000109d63:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000109d67:	48 8b 4a 28          	mov    0x28(%rdx),%rcx
ffff800000109d6b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
ffff800000109d6f:	48 8b 32             	mov    (%rdx),%rsi
ffff800000109d72:	8b 55 e4             	mov    -0x1c(%rbp),%edx
ffff800000109d75:	48 63 d2             	movslq %edx,%rdx
ffff800000109d78:	48 0f af d6          	imul   %rsi,%rdx
ffff800000109d7c:	48 01 d1             	add    %rdx,%rcx
ffff800000109d7f:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000109d83:	48 89 d6             	mov    %rdx,%rsi
ffff800000109d86:	48 89 cf             	mov    %rcx,%rdi
ffff800000109d89:	ff d0                	callq  *%rax
ffff800000109d8b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109d8f:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109d93:	48 85 c0             	test   %rax,%rax
ffff800000109d96:	0f 85 cb 00 00 00    	jne    ffff800000109e67 <slab_free+0x252>
ffff800000109d9c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109da0:	48 8b 48 10          	mov    0x10(%rax),%rcx
ffff800000109da4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109da8:	48 8b 50 38          	mov    0x38(%rax),%rdx
ffff800000109dac:	48 89 d0             	mov    %rdx,%rax
ffff800000109daf:	48 01 c0             	add    %rax,%rax
ffff800000109db2:	48 01 d0             	add    %rdx,%rax
ffff800000109db5:	48 d1 e8             	shr    %rax
ffff800000109db8:	48 39 c1             	cmp    %rax,%rcx
ffff800000109dbb:	0f 82 a6 00 00 00    	jb     ffff800000109e67 <slab_free+0x252>
ffff800000109dc1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109dc5:	48 89 c7             	mov    %rax,%rdi
ffff800000109dc8:	49 89 df             	mov    %rbx,%r15
ffff800000109dcb:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109dd0:	48 ba 47 b6 ff ff ff 	movabs $0xffffffffffffb647,%rdx
ffff800000109dd7:	ff ff ff 
ffff800000109dda:	48 01 da             	add    %rbx,%rdx
ffff800000109ddd:	ff d2                	callq  *%rdx
ffff800000109ddf:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109de3:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000109de7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109deb:	48 8b 40 38          	mov    0x38(%rax),%rax
ffff800000109def:	48 29 c2             	sub    %rax,%rdx
ffff800000109df2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109df6:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000109dfa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109dfe:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff800000109e02:	48 89 c7             	mov    %rax,%rdi
ffff800000109e05:	48 b8 dc 96 ff ff ff 	movabs $0xffffffffffff96dc,%rax
ffff800000109e0c:	ff ff ff 
ffff800000109e0f:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109e13:	ff d0                	callq  *%rax
ffff800000109e15:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109e19:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000109e1d:	48 89 c7             	mov    %rax,%rdi
ffff800000109e20:	48 b8 0c 78 ff ff ff 	movabs $0xffffffffffff780c,%rax
ffff800000109e27:	ff ff ff 
ffff800000109e2a:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109e2e:	ff d0                	callq  *%rax
ffff800000109e30:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109e34:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000109e38:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000109e3d:	48 89 c7             	mov    %rax,%rdi
ffff800000109e40:	48 b8 c8 8a ff ff ff 	movabs $0xffffffffffff8ac8,%rax
ffff800000109e47:	ff ff ff 
ffff800000109e4a:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109e4e:	ff d0                	callq  *%rax
ffff800000109e50:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109e54:	48 89 c7             	mov    %rax,%rdi
ffff800000109e57:	48 b8 dc 96 ff ff ff 	movabs $0xffffffffffff96dc,%rax
ffff800000109e5e:	ff ff ff 
ffff800000109e61:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109e65:	ff d0                	callq  *%rax
ffff800000109e67:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000109e6c:	eb 72                	jmp    ffff800000109ee0 <slab_free+0x2cb>
ffff800000109e6e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109e72:	48 89 c7             	mov    %rax,%rdi
ffff800000109e75:	49 89 df             	mov    %rbx,%r15
ffff800000109e78:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109e7d:	48 ba d0 b6 ff ff ff 	movabs $0xffffffffffffb6d0,%rdx
ffff800000109e84:	ff ff ff 
ffff800000109e87:	48 01 da             	add    %rbx,%rdx
ffff800000109e8a:	ff d2                	callq  *%rdx
ffff800000109e8c:	48 98                	cltq   
ffff800000109e8e:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff800000109e92:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000109e96:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000109e9a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109e9e:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109ea2:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
ffff800000109ea6:	0f 85 a7 fd ff ff    	jne    ffff800000109c53 <slab_free+0x3e>
ffff800000109eac:	48 b8 00 1c 00 00 00 	movabs $0x1c00,%rax
ffff800000109eb3:	00 00 00 
ffff800000109eb6:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000109eba:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109ebf:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000109ec4:	49 89 df             	mov    %rbx,%r15
ffff800000109ec7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109ecc:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff800000109ed3:	ff ff ff 
ffff800000109ed6:	48 01 d9             	add    %rbx,%rcx
ffff800000109ed9:	ff d1                	callq  *%rcx
ffff800000109edb:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109ee0:	48 83 c4 40          	add    $0x40,%rsp
ffff800000109ee4:	5b                   	pop    %rbx
ffff800000109ee5:	41 5f                	pop    %r15
ffff800000109ee7:	5d                   	pop    %rbp
ffff800000109ee8:	c3                   	retq   

ffff800000109ee9 <slab_init>:
ffff800000109ee9:	55                   	push   %rbp
ffff800000109eea:	48 89 e5             	mov    %rsp,%rbp
ffff800000109eed:	41 57                	push   %r15
ffff800000109eef:	53                   	push   %rbx
ffff800000109ef0:	48 83 ec 30          	sub    $0x30,%rsp
ffff800000109ef4:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000109ef4 <slab_init+0xb>
ffff800000109efb:	49 bb f4 52 00 00 00 	movabs $0x52f4,%r11
ffff800000109f02:	00 00 00 
ffff800000109f05:	4c 01 db             	add    %r11,%rbx
ffff800000109f08:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
ffff800000109f0f:	00 
ffff800000109f10:	48 c7 45 d0 00 00 00 	movq   $0x0,-0x30(%rbp)
ffff800000109f17:	00 
ffff800000109f18:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000109f1f:	ff ff ff 
ffff800000109f22:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000109f26:	48 8b 80 f0 02 00 00 	mov    0x2f0(%rax),%rax
ffff800000109f2d:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff800000109f31:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000109f38:	00 
ffff800000109f39:	e9 c0 03 00 00       	jmpq   ffff80000010a2fe <slab_init+0x415>
ffff800000109f3e:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000109f45:	ff ff ff 
ffff800000109f48:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000109f4c:	48 8b 80 f0 02 00 00 	mov    0x2f0(%rax),%rax
ffff800000109f53:	48 89 c6             	mov    %rax,%rsi
ffff800000109f56:	48 b9 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rcx
ffff800000109f5d:	ff ff ff 
ffff800000109f60:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000109f64:	48 89 d0             	mov    %rdx,%rax
ffff800000109f67:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000109f6b:	48 29 d0             	sub    %rdx,%rax
ffff800000109f6e:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000109f72:	48 01 d8             	add    %rbx,%rax
ffff800000109f75:	48 01 c8             	add    %rcx,%rax
ffff800000109f78:	48 83 c0 18          	add    $0x18,%rax
ffff800000109f7c:	48 89 30             	mov    %rsi,(%rax)
ffff800000109f7f:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000109f86:	ff ff ff 
ffff800000109f89:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000109f8d:	48 8b 80 f0 02 00 00 	mov    0x2f0(%rax),%rax
ffff800000109f94:	48 8d 90 98 00 00 00 	lea    0x98(%rax),%rdx
ffff800000109f9b:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000109fa2:	ff ff ff 
ffff800000109fa5:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000109fa9:	48 89 90 f0 02 00 00 	mov    %rdx,0x2f0(%rax)
ffff800000109fb0:	48 b9 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rcx
ffff800000109fb7:	ff ff ff 
ffff800000109fba:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000109fbe:	48 89 d0             	mov    %rdx,%rax
ffff800000109fc1:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000109fc5:	48 29 d0             	sub    %rdx,%rax
ffff800000109fc8:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000109fcc:	48 01 d8             	add    %rbx,%rax
ffff800000109fcf:	48 01 c8             	add    %rcx,%rax
ffff800000109fd2:	48 83 c0 18          	add    $0x18,%rax
ffff800000109fd6:	48 8b 00             	mov    (%rax),%rax
ffff800000109fd9:	48 89 c7             	mov    %rax,%rdi
ffff800000109fdc:	49 89 df             	mov    %rbx,%r15
ffff800000109fdf:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109fe4:	48 ba 61 b5 ff ff ff 	movabs $0xffffffffffffb561,%rdx
ffff800000109feb:	ff ff ff 
ffff800000109fee:	48 01 da             	add    %rbx,%rdx
ffff800000109ff1:	ff d2                	callq  *%rdx
ffff800000109ff3:	48 b9 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rcx
ffff800000109ffa:	ff ff ff 
ffff800000109ffd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff80000010a001:	48 89 d0             	mov    %rdx,%rax
ffff80000010a004:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a008:	48 29 d0             	sub    %rdx,%rax
ffff80000010a00b:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a00f:	48 01 d8             	add    %rbx,%rax
ffff80000010a012:	48 01 c8             	add    %rcx,%rax
ffff80000010a015:	48 83 c0 18          	add    $0x18,%rax
ffff80000010a019:	48 8b 00             	mov    (%rax),%rax
ffff80000010a01c:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
ffff80000010a023:	00 
ffff80000010a024:	48 b8 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rax
ffff80000010a02b:	ff ff ff 
ffff80000010a02e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff80000010a032:	48 8d 0c 03          	lea    (%rbx,%rax,1),%rcx
ffff80000010a036:	48 89 d0             	mov    %rdx,%rax
ffff80000010a039:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a03d:	48 29 d0             	sub    %rdx,%rax
ffff80000010a040:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a044:	48 01 c8             	add    %rcx,%rax
ffff80000010a047:	48 8b 30             	mov    (%rax),%rsi
ffff80000010a04a:	48 b9 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rcx
ffff80000010a051:	ff ff ff 
ffff80000010a054:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff80000010a058:	48 89 d0             	mov    %rdx,%rax
ffff80000010a05b:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a05f:	48 29 d0             	sub    %rdx,%rax
ffff80000010a062:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a066:	48 01 d8             	add    %rbx,%rax
ffff80000010a069:	48 01 c8             	add    %rcx,%rax
ffff80000010a06c:	48 83 c0 18          	add    $0x18,%rax
ffff80000010a070:	48 8b 08             	mov    (%rax),%rcx
ffff80000010a073:	b8 00 00 20 00       	mov    $0x200000,%eax
ffff80000010a078:	ba 00 00 00 00       	mov    $0x0,%edx
ffff80000010a07d:	48 f7 f6             	div    %rsi
ffff80000010a080:	48 89 41 20          	mov    %rax,0x20(%rcx)
ffff80000010a084:	48 b8 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rax
ffff80000010a08b:	ff ff ff 
ffff80000010a08e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff80000010a092:	48 8d 0c 03          	lea    (%rbx,%rax,1),%rcx
ffff80000010a096:	48 89 d0             	mov    %rdx,%rax
ffff80000010a099:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a09d:	48 29 d0             	sub    %rdx,%rax
ffff80000010a0a0:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a0a4:	48 01 c8             	add    %rcx,%rax
ffff80000010a0a7:	48 8b 38             	mov    (%rax),%rdi
ffff80000010a0aa:	b8 00 00 20 00       	mov    $0x200000,%eax
ffff80000010a0af:	ba 00 00 00 00       	mov    $0x0,%edx
ffff80000010a0b4:	48 f7 f7             	div    %rdi
ffff80000010a0b7:	48 83 c0 3f          	add    $0x3f,%rax
ffff80000010a0bb:	48 c1 e8 06          	shr    $0x6,%rax
ffff80000010a0bf:	48 89 c6             	mov    %rax,%rsi
ffff80000010a0c2:	48 b9 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rcx
ffff80000010a0c9:	ff ff ff 
ffff80000010a0cc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff80000010a0d0:	48 89 d0             	mov    %rdx,%rax
ffff80000010a0d3:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a0d7:	48 29 d0             	sub    %rdx,%rax
ffff80000010a0da:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a0de:	48 01 d8             	add    %rbx,%rax
ffff80000010a0e1:	48 01 c8             	add    %rcx,%rax
ffff80000010a0e4:	48 83 c0 18          	add    $0x18,%rax
ffff80000010a0e8:	48 8b 00             	mov    (%rax),%rax
ffff80000010a0eb:	48 8d 14 f5 00 00 00 	lea    0x0(,%rsi,8),%rdx
ffff80000010a0f2:	00 
ffff80000010a0f3:	48 89 50 30          	mov    %rdx,0x30(%rax)
ffff80000010a0f7:	48 b9 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rcx
ffff80000010a0fe:	ff ff ff 
ffff80000010a101:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff80000010a105:	48 89 d0             	mov    %rdx,%rax
ffff80000010a108:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a10c:	48 29 d0             	sub    %rdx,%rax
ffff80000010a10f:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a113:	48 01 d8             	add    %rbx,%rax
ffff80000010a116:	48 01 c8             	add    %rcx,%rax
ffff80000010a119:	48 83 c0 18          	add    $0x18,%rax
ffff80000010a11d:	48 8b 08             	mov    (%rax),%rcx
ffff80000010a120:	48 be 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rsi
ffff80000010a127:	ff ff ff 
ffff80000010a12a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff80000010a12e:	48 89 d0             	mov    %rdx,%rax
ffff80000010a131:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a135:	48 29 d0             	sub    %rdx,%rax
ffff80000010a138:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a13c:	48 01 d8             	add    %rbx,%rax
ffff80000010a13f:	48 01 f0             	add    %rsi,%rax
ffff80000010a142:	48 83 c0 18          	add    $0x18,%rax
ffff80000010a146:	48 8b 00             	mov    (%rax),%rax
ffff80000010a149:	48 8b 51 20          	mov    0x20(%rcx),%rdx
ffff80000010a14d:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff80000010a151:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010a158:	ff ff ff 
ffff80000010a15b:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010a15f:	48 8b 88 f0 02 00 00 	mov    0x2f0(%rax),%rcx
ffff80000010a166:	48 be 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rsi
ffff80000010a16d:	ff ff ff 
ffff80000010a170:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff80000010a174:	48 89 d0             	mov    %rdx,%rax
ffff80000010a177:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a17b:	48 29 d0             	sub    %rdx,%rax
ffff80000010a17e:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a182:	48 01 d8             	add    %rbx,%rax
ffff80000010a185:	48 01 f0             	add    %rsi,%rax
ffff80000010a188:	48 83 c0 18          	add    $0x18,%rax
ffff80000010a18c:	48 8b 00             	mov    (%rax),%rax
ffff80000010a18f:	48 89 ca             	mov    %rcx,%rdx
ffff80000010a192:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff80000010a196:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010a19d:	ff ff ff 
ffff80000010a1a0:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010a1a4:	48 8b 88 f0 02 00 00 	mov    0x2f0(%rax),%rcx
ffff80000010a1ab:	48 be 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rsi
ffff80000010a1b2:	ff ff ff 
ffff80000010a1b5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff80000010a1b9:	48 89 d0             	mov    %rdx,%rax
ffff80000010a1bc:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a1c0:	48 29 d0             	sub    %rdx,%rax
ffff80000010a1c3:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a1c7:	48 01 d8             	add    %rbx,%rax
ffff80000010a1ca:	48 01 f0             	add    %rsi,%rax
ffff80000010a1cd:	48 83 c0 18          	add    $0x18,%rax
ffff80000010a1d1:	48 8b 00             	mov    (%rax),%rax
ffff80000010a1d4:	48 8b 40 30          	mov    0x30(%rax),%rax
ffff80000010a1d8:	48 01 c8             	add    %rcx,%rax
ffff80000010a1db:	48 83 c0 50          	add    $0x50,%rax
ffff80000010a1df:	48 83 e0 f6          	and    $0xfffffffffffffff6,%rax
ffff80000010a1e3:	48 89 c2             	mov    %rax,%rdx
ffff80000010a1e6:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010a1ed:	ff ff ff 
ffff80000010a1f0:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010a1f4:	48 89 90 f0 02 00 00 	mov    %rdx,0x2f0(%rax)
ffff80000010a1fb:	48 b9 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rcx
ffff80000010a202:	ff ff ff 
ffff80000010a205:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff80000010a209:	48 89 d0             	mov    %rdx,%rax
ffff80000010a20c:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a210:	48 29 d0             	sub    %rdx,%rax
ffff80000010a213:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a217:	48 01 d8             	add    %rbx,%rax
ffff80000010a21a:	48 01 c8             	add    %rcx,%rax
ffff80000010a21d:	48 83 c0 18          	add    $0x18,%rax
ffff80000010a221:	48 8b 00             	mov    (%rax),%rax
ffff80000010a224:	48 8b 40 30          	mov    0x30(%rax),%rax
ffff80000010a228:	48 89 c6             	mov    %rax,%rsi
ffff80000010a22b:	48 b9 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rcx
ffff80000010a232:	ff ff ff 
ffff80000010a235:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff80000010a239:	48 89 d0             	mov    %rdx,%rax
ffff80000010a23c:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a240:	48 29 d0             	sub    %rdx,%rax
ffff80000010a243:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a247:	48 01 d8             	add    %rbx,%rax
ffff80000010a24a:	48 01 c8             	add    %rcx,%rax
ffff80000010a24d:	48 83 c0 18          	add    $0x18,%rax
ffff80000010a251:	48 8b 00             	mov    (%rax),%rax
ffff80000010a254:	48 8b 40 40          	mov    0x40(%rax),%rax
ffff80000010a258:	48 89 f2             	mov    %rsi,%rdx
ffff80000010a25b:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010a260:	48 89 c7             	mov    %rax,%rdi
ffff80000010a263:	49 89 df             	mov    %rbx,%r15
ffff80000010a266:	48 b8 ef b3 ff ff ff 	movabs $0xffffffffffffb3ef,%rax
ffff80000010a26d:	ff ff ff 
ffff80000010a270:	48 01 d8             	add    %rbx,%rax
ffff80000010a273:	ff d0                	callq  *%rax
ffff80000010a275:	48 b9 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rcx
ffff80000010a27c:	ff ff ff 
ffff80000010a27f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff80000010a283:	48 89 d0             	mov    %rdx,%rax
ffff80000010a286:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a28a:	48 29 d0             	sub    %rdx,%rax
ffff80000010a28d:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a291:	48 01 d8             	add    %rbx,%rax
ffff80000010a294:	48 01 c8             	add    %rcx,%rax
ffff80000010a297:	48 83 c0 18          	add    $0x18,%rax
ffff80000010a29b:	48 8b 00             	mov    (%rax),%rax
ffff80000010a29e:	48 8b 48 38          	mov    0x38(%rax),%rcx
ffff80000010a2a2:	48 b8 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rax
ffff80000010a2a9:	ff ff ff 
ffff80000010a2ac:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff80000010a2b0:	48 8d 34 03          	lea    (%rbx,%rax,1),%rsi
ffff80000010a2b4:	48 89 d0             	mov    %rdx,%rax
ffff80000010a2b7:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a2bb:	48 29 d0             	sub    %rdx,%rax
ffff80000010a2be:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a2c2:	48 01 f0             	add    %rsi,%rax
ffff80000010a2c5:	48 83 c0 10          	add    $0x10,%rax
ffff80000010a2c9:	48 89 08             	mov    %rcx,(%rax)
ffff80000010a2cc:	48 b9 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rcx
ffff80000010a2d3:	ff ff ff 
ffff80000010a2d6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff80000010a2da:	48 89 d0             	mov    %rdx,%rax
ffff80000010a2dd:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a2e1:	48 29 d0             	sub    %rdx,%rax
ffff80000010a2e4:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a2e8:	48 01 d8             	add    %rbx,%rax
ffff80000010a2eb:	48 01 c8             	add    %rcx,%rax
ffff80000010a2ee:	48 83 c0 08          	add    $0x8,%rax
ffff80000010a2f2:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
ffff80000010a2f9:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
ffff80000010a2fe:	48 83 7d e8 0f       	cmpq   $0xf,-0x18(%rbp)
ffff80000010a303:	0f 86 35 fc ff ff    	jbe    ffff800000109f3e <slab_init+0x55>
ffff80000010a309:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010a310:	ff ff ff 
ffff80000010a313:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010a317:	48 8b 90 f0 02 00 00 	mov    0x2f0(%rax),%rdx
ffff80000010a31e:	48 b8 00 00 00 00 00 	movabs $0x800000000000,%rax
ffff80000010a325:	80 00 00 
ffff80000010a328:	48 01 d0             	add    %rdx,%rax
ffff80000010a32b:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010a32f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff80000010a333:	48 ba ff ff 1f 00 00 	movabs $0x8000001fffff,%rdx
ffff80000010a33a:	80 00 00 
ffff80000010a33d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010a341:	48 01 c2             	add    %rax,%rdx
ffff80000010a344:	48 b8 ff ff ff ff ff 	movabs $0x7ffffffffff,%rax
ffff80000010a34b:	07 00 00 
ffff80000010a34e:	48 21 d0             	and    %rdx,%rax
ffff80000010a351:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff80000010a355:	e9 e7 00 00 00       	jmpq   ffff80000010a441 <slab_init+0x558>
ffff80000010a35a:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010a361:	ff ff ff 
ffff80000010a364:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010a368:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff80000010a36f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
ffff80000010a373:	48 89 d0             	mov    %rdx,%rax
ffff80000010a376:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010a37a:	48 01 d0             	add    %rdx,%rax
ffff80000010a37d:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a381:	48 01 c8             	add    %rcx,%rax
ffff80000010a384:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff80000010a388:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010a38f:	ff ff ff 
ffff80000010a392:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010a396:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff80000010a39d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010a3a1:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff80000010a3a5:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff80000010a3a9:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a3ad:	48 01 d0             	add    %rdx,%rax
ffff80000010a3b0:	48 8b 10             	mov    (%rax),%rdx
ffff80000010a3b3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010a3b7:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff80000010a3bb:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010a3bf:	83 e0 3f             	and    $0x3f,%eax
ffff80000010a3c2:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010a3c7:	89 c1                	mov    %eax,%ecx
ffff80000010a3c9:	48 d3 e6             	shl    %cl,%rsi
ffff80000010a3cc:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010a3d3:	ff ff ff 
ffff80000010a3d6:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010a3da:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
ffff80000010a3e1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010a3e5:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff80000010a3e9:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff80000010a3ed:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a3f1:	48 01 c8             	add    %rcx,%rax
ffff80000010a3f4:	48 09 f2             	or     %rsi,%rdx
ffff80000010a3f7:	48 89 10             	mov    %rdx,(%rax)
ffff80000010a3fa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010a3fe:	48 8b 00             	mov    (%rax),%rax
ffff80000010a401:	48 8b 50 38          	mov    0x38(%rax),%rdx
ffff80000010a405:	48 83 c2 01          	add    $0x1,%rdx
ffff80000010a409:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff80000010a40d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010a411:	48 8b 00             	mov    (%rax),%rax
ffff80000010a414:	48 8b 50 40          	mov    0x40(%rax),%rdx
ffff80000010a418:	48 83 ea 01          	sub    $0x1,%rdx
ffff80000010a41c:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff80000010a420:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010a424:	be 83 00 00 00       	mov    $0x83,%esi
ffff80000010a429:	48 89 c7             	mov    %rax,%rdi
ffff80000010a42c:	48 b8 8a 77 ff ff ff 	movabs $0xffffffffffff778a,%rax
ffff80000010a433:	ff ff ff 
ffff80000010a436:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff80000010a43a:	ff d0                	callq  *%rax
ffff80000010a43c:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
ffff80000010a441:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010a445:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
ffff80000010a449:	0f 86 0b ff ff ff    	jbe    ffff80000010a35a <slab_init+0x471>
ffff80000010a44f:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff80000010a456:	00 
ffff80000010a457:	e9 62 01 00 00       	jmpq   ffff80000010a5be <slab_init+0x6d5>
ffff80000010a45c:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010a463:	ff ff ff 
ffff80000010a466:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010a46a:	48 8b 80 f0 02 00 00 	mov    0x2f0(%rax),%rax
ffff80000010a471:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff80000010a475:	48 83 c2 01          	add    $0x1,%rdx
ffff80000010a479:	48 c1 e2 15          	shl    $0x15,%rdx
ffff80000010a47d:	48 01 d0             	add    %rdx,%rax
ffff80000010a480:	48 83 e8 01          	sub    $0x1,%rax
ffff80000010a484:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff80000010a48a:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff80000010a48e:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
ffff80000010a492:	48 b8 00 00 00 00 00 	movabs $0x800000000000,%rax
ffff80000010a499:	80 00 00 
ffff80000010a49c:	48 01 d0             	add    %rdx,%rax
ffff80000010a49f:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff80000010a4a3:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010a4aa:	ff ff ff 
ffff80000010a4ad:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010a4b1:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff80000010a4b8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010a4bc:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff80000010a4c0:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff80000010a4c4:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a4c8:	48 01 d0             	add    %rdx,%rax
ffff80000010a4cb:	48 8b 10             	mov    (%rax),%rdx
ffff80000010a4ce:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010a4d2:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff80000010a4d6:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010a4da:	83 e0 3f             	and    $0x3f,%eax
ffff80000010a4dd:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010a4e2:	89 c1                	mov    %eax,%ecx
ffff80000010a4e4:	48 d3 e6             	shl    %cl,%rsi
ffff80000010a4e7:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010a4ee:	ff ff ff 
ffff80000010a4f1:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010a4f5:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
ffff80000010a4fc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010a500:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff80000010a504:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff80000010a508:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a50c:	48 01 c8             	add    %rcx,%rax
ffff80000010a50f:	48 09 f2             	or     %rsi,%rdx
ffff80000010a512:	48 89 10             	mov    %rdx,(%rax)
ffff80000010a515:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010a519:	48 8b 00             	mov    (%rax),%rax
ffff80000010a51c:	48 8b 50 38          	mov    0x38(%rax),%rdx
ffff80000010a520:	48 83 c2 01          	add    $0x1,%rdx
ffff80000010a524:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff80000010a528:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010a52c:	48 8b 00             	mov    (%rax),%rax
ffff80000010a52f:	48 8b 50 40          	mov    0x40(%rax),%rdx
ffff80000010a533:	48 83 ea 01          	sub    $0x1,%rdx
ffff80000010a537:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff80000010a53b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010a53f:	be 83 00 00 00       	mov    $0x83,%esi
ffff80000010a544:	48 89 c7             	mov    %rax,%rdi
ffff80000010a547:	48 b8 8a 77 ff ff ff 	movabs $0xffffffffffff778a,%rax
ffff80000010a54e:	ff ff ff 
ffff80000010a551:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff80000010a555:	ff d0                	callq  *%rax
ffff80000010a557:	48 b9 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rcx
ffff80000010a55e:	ff ff ff 
ffff80000010a561:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff80000010a565:	48 89 d0             	mov    %rdx,%rax
ffff80000010a568:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a56c:	48 29 d0             	sub    %rdx,%rax
ffff80000010a56f:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a573:	48 01 d8             	add    %rbx,%rax
ffff80000010a576:	48 01 c8             	add    %rcx,%rax
ffff80000010a579:	48 83 c0 18          	add    $0x18,%rax
ffff80000010a57d:	48 8b 00             	mov    (%rax),%rax
ffff80000010a580:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff80000010a584:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff80000010a588:	48 b9 78 e4 ff ff ff 	movabs $0xffffffffffffe478,%rcx
ffff80000010a58f:	ff ff ff 
ffff80000010a592:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff80000010a596:	48 89 d0             	mov    %rdx,%rax
ffff80000010a599:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a59d:	48 29 d0             	sub    %rdx,%rax
ffff80000010a5a0:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010a5a4:	48 01 d8             	add    %rbx,%rax
ffff80000010a5a7:	48 01 c8             	add    %rcx,%rax
ffff80000010a5aa:	48 83 c0 18          	add    $0x18,%rax
ffff80000010a5ae:	48 8b 00             	mov    (%rax),%rax
ffff80000010a5b1:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
ffff80000010a5b5:	48 89 50 28          	mov    %rdx,0x28(%rax)
ffff80000010a5b9:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
ffff80000010a5be:	48 83 7d e8 0f       	cmpq   $0xf,-0x18(%rbp)
ffff80000010a5c3:	0f 86 93 fe ff ff    	jbe    ffff80000010a45c <slab_init+0x573>
ffff80000010a5c9:	b8 01 00 00 00       	mov    $0x1,%eax
ffff80000010a5ce:	48 83 c4 30          	add    $0x30,%rsp
ffff80000010a5d2:	5b                   	pop    %rbx
ffff80000010a5d3:	41 5f                	pop    %r15
ffff80000010a5d5:	5d                   	pop    %rbp
ffff80000010a5d6:	c3                   	retq   

ffff80000010a5d7 <memset>:
ffff80000010a5d7:	55                   	push   %rbp
ffff80000010a5d8:	48 89 e5             	mov    %rsp,%rbp
ffff80000010a5db:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010a5db <memset+0x4>
ffff80000010a5e2:	49 bb 0d 4c 00 00 00 	movabs $0x4c0d,%r11
ffff80000010a5e9:	00 00 00 
ffff80000010a5ec:	4c 01 d8             	add    %r11,%rax
ffff80000010a5ef:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff80000010a5f3:	89 f0                	mov    %esi,%eax
ffff80000010a5f5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
ffff80000010a5f9:	88 45 e4             	mov    %al,-0x1c(%rbp)
ffff80000010a5fc:	0f b6 45 e4          	movzbl -0x1c(%rbp),%eax
ffff80000010a600:	88 45 f7             	mov    %al,-0x9(%rbp)
ffff80000010a603:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010a607:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff80000010a60b:	eb 14                	jmp    ffff80000010a621 <memset+0x4a>
ffff80000010a60d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010a611:	0f b6 55 f7          	movzbl -0x9(%rbp),%edx
ffff80000010a615:	88 10                	mov    %dl,(%rax)
ffff80000010a617:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
ffff80000010a61c:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
ffff80000010a621:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
ffff80000010a626:	7f e5                	jg     ffff80000010a60d <memset+0x36>
ffff80000010a628:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010a62c:	5d                   	pop    %rbp
ffff80000010a62d:	c3                   	retq   

ffff80000010a62e <memcpy>:
ffff80000010a62e:	55                   	push   %rbp
ffff80000010a62f:	48 89 e5             	mov    %rsp,%rbp
ffff80000010a632:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010a632 <memcpy+0x4>
ffff80000010a639:	49 bb b6 4b 00 00 00 	movabs $0x4bb6,%r11
ffff80000010a640:	00 00 00 
ffff80000010a643:	4c 01 d8             	add    %r11,%rax
ffff80000010a646:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff80000010a64a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
ffff80000010a64e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
ffff80000010a652:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010a656:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff80000010a65a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010a65e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff80000010a662:	eb 1d                	jmp    ffff80000010a681 <memcpy+0x53>
ffff80000010a664:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff80000010a668:	48 8d 42 01          	lea    0x1(%rdx),%rax
ffff80000010a66c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff80000010a670:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010a674:	48 8d 48 01          	lea    0x1(%rax),%rcx
ffff80000010a678:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
ffff80000010a67c:	0f b6 12             	movzbl (%rdx),%edx
ffff80000010a67f:	88 10                	mov    %dl,(%rax)
ffff80000010a681:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010a685:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff80000010a689:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
ffff80000010a68d:	48 85 c0             	test   %rax,%rax
ffff80000010a690:	75 d2                	jne    ffff80000010a664 <memcpy+0x36>
ffff80000010a692:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010a696:	5d                   	pop    %rbp
ffff80000010a697:	c3                   	retq   

ffff80000010a698 <Get_gdt>:
ffff80000010a698:	55                   	push   %rbp
ffff80000010a699:	48 89 e5             	mov    %rsp,%rbp
ffff80000010a69c:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010a69c <Get_gdt+0x4>
ffff80000010a6a3:	49 bb 4c 4b 00 00 00 	movabs $0x4b4c,%r11
ffff80000010a6aa:	00 00 00 
ffff80000010a6ad:	4c 01 d8             	add    %r11,%rax
ffff80000010a6b0:	0f 20 d8             	mov    %cr3,%rax
ffff80000010a6b3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff80000010a6b7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010a6bb:	5d                   	pop    %rbp
ffff80000010a6bc:	c3                   	retq   

ffff80000010a6bd <flush_tlb>:
ffff80000010a6bd:	55                   	push   %rbp
ffff80000010a6be:	48 89 e5             	mov    %rsp,%rbp
ffff80000010a6c1:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010a6c1 <flush_tlb+0x4>
ffff80000010a6c8:	49 bb 27 4b 00 00 00 	movabs $0x4b27,%r11
ffff80000010a6cf:	00 00 00 
ffff80000010a6d2:	4c 01 d8             	add    %r11,%rax
ffff80000010a6d5:	0f 20 d8             	mov    %cr3,%rax
ffff80000010a6d8:	0f 22 d8             	mov    %rax,%cr3
ffff80000010a6db:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff80000010a6df:	90                   	nop
ffff80000010a6e0:	5d                   	pop    %rbp
ffff80000010a6e1:	c3                   	retq   

ffff80000010a6e2 <io_out8>:
ffff80000010a6e2:	55                   	push   %rbp
ffff80000010a6e3:	48 89 e5             	mov    %rsp,%rbp
ffff80000010a6e6:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010a6e6 <io_out8+0x4>
ffff80000010a6ed:	49 bb 02 4b 00 00 00 	movabs $0x4b02,%r11
ffff80000010a6f4:	00 00 00 
ffff80000010a6f7:	4c 01 d8             	add    %r11,%rax
ffff80000010a6fa:	89 fa                	mov    %edi,%edx
ffff80000010a6fc:	89 f0                	mov    %esi,%eax
ffff80000010a6fe:	66 89 55 fc          	mov    %dx,-0x4(%rbp)
ffff80000010a702:	88 45 f8             	mov    %al,-0x8(%rbp)
ffff80000010a705:	0f b6 45 f8          	movzbl -0x8(%rbp),%eax
ffff80000010a709:	0f b7 55 fc          	movzwl -0x4(%rbp),%edx
ffff80000010a70d:	ee                   	out    %al,(%dx)
ffff80000010a70e:	0f ae f0             	mfence 
ffff80000010a711:	90                   	nop
ffff80000010a712:	5d                   	pop    %rbp
ffff80000010a713:	c3                   	retq   

ffff80000010a714 <io_in8>:
ffff80000010a714:	55                   	push   %rbp
ffff80000010a715:	48 89 e5             	mov    %rsp,%rbp
ffff80000010a718:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010a718 <io_in8+0x4>
ffff80000010a71f:	49 bb d0 4a 00 00 00 	movabs $0x4ad0,%r11
ffff80000010a726:	00 00 00 
ffff80000010a729:	4c 01 d8             	add    %r11,%rax
ffff80000010a72c:	89 f8                	mov    %edi,%eax
ffff80000010a72e:	66 89 45 ec          	mov    %ax,-0x14(%rbp)
ffff80000010a732:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
ffff80000010a736:	0f b7 45 ec          	movzwl -0x14(%rbp),%eax
ffff80000010a73a:	89 c2                	mov    %eax,%edx
ffff80000010a73c:	ec                   	in     (%dx),%al
ffff80000010a73d:	0f ae f0             	mfence 
ffff80000010a740:	88 45 ff             	mov    %al,-0x1(%rbp)
ffff80000010a743:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
ffff80000010a747:	5d                   	pop    %rbp
ffff80000010a748:	c3                   	retq   

ffff80000010a749 <list_init>:
ffff80000010a749:	55                   	push   %rbp
ffff80000010a74a:	48 89 e5             	mov    %rsp,%rbp
ffff80000010a74d:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010a74d <list_init+0x4>
ffff80000010a754:	49 bb 9b 4a 00 00 00 	movabs $0x4a9b,%r11
ffff80000010a75b:	00 00 00 
ffff80000010a75e:	4c 01 d8             	add    %r11,%rax
ffff80000010a761:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff80000010a765:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010a769:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff80000010a76d:	48 89 10             	mov    %rdx,(%rax)
ffff80000010a770:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010a774:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff80000010a778:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff80000010a77c:	90                   	nop
ffff80000010a77d:	5d                   	pop    %rbp
ffff80000010a77e:	c3                   	retq   

ffff80000010a77f <list_add_to_behind>:
ffff80000010a77f:	55                   	push   %rbp
ffff80000010a780:	48 89 e5             	mov    %rsp,%rbp
ffff80000010a783:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010a783 <list_add_to_behind+0x4>
ffff80000010a78a:	49 bb 65 4a 00 00 00 	movabs $0x4a65,%r11
ffff80000010a791:	00 00 00 
ffff80000010a794:	4c 01 d8             	add    %r11,%rax
ffff80000010a797:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff80000010a79b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff80000010a79f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010a7a3:	48 8b 50 08          	mov    0x8(%rax),%rdx
ffff80000010a7a7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010a7ab:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff80000010a7af:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010a7b3:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff80000010a7b7:	48 89 10             	mov    %rdx,(%rax)
ffff80000010a7ba:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010a7be:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff80000010a7c2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff80000010a7c6:	48 89 10             	mov    %rdx,(%rax)
ffff80000010a7c9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010a7cd:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff80000010a7d1:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff80000010a7d5:	90                   	nop
ffff80000010a7d6:	5d                   	pop    %rbp
ffff80000010a7d7:	c3                   	retq   

ffff80000010a7d8 <list_add_to_before>:
ffff80000010a7d8:	55                   	push   %rbp
ffff80000010a7d9:	48 89 e5             	mov    %rsp,%rbp
ffff80000010a7dc:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010a7dc <list_add_to_before+0x4>
ffff80000010a7e3:	49 bb 0c 4a 00 00 00 	movabs $0x4a0c,%r11
ffff80000010a7ea:	00 00 00 
ffff80000010a7ed:	4c 01 d8             	add    %r11,%rax
ffff80000010a7f0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff80000010a7f4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff80000010a7f8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010a7fc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff80000010a800:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff80000010a804:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010a808:	48 8b 00             	mov    (%rax),%rax
ffff80000010a80b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff80000010a80f:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff80000010a813:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010a817:	48 8b 10             	mov    (%rax),%rdx
ffff80000010a81a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010a81e:	48 89 10             	mov    %rdx,(%rax)
ffff80000010a821:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010a825:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff80000010a829:	48 89 10             	mov    %rdx,(%rax)
ffff80000010a82c:	90                   	nop
ffff80000010a82d:	5d                   	pop    %rbp
ffff80000010a82e:	c3                   	retq   

ffff80000010a82f <list_del>:
ffff80000010a82f:	55                   	push   %rbp
ffff80000010a830:	48 89 e5             	mov    %rsp,%rbp
ffff80000010a833:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010a833 <list_del+0x4>
ffff80000010a83a:	49 bb b5 49 00 00 00 	movabs $0x49b5,%r11
ffff80000010a841:	00 00 00 
ffff80000010a844:	4c 01 d8             	add    %r11,%rax
ffff80000010a847:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff80000010a84b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010a84f:	48 8b 00             	mov    (%rax),%rax
ffff80000010a852:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff80000010a856:	48 8b 52 08          	mov    0x8(%rdx),%rdx
ffff80000010a85a:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff80000010a85e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010a862:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff80000010a866:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff80000010a86a:	48 8b 12             	mov    (%rdx),%rdx
ffff80000010a86d:	48 89 10             	mov    %rdx,(%rax)
ffff80000010a870:	90                   	nop
ffff80000010a871:	5d                   	pop    %rbp
ffff80000010a872:	c3                   	retq   

ffff80000010a873 <list_is_empty>:
ffff80000010a873:	55                   	push   %rbp
ffff80000010a874:	48 89 e5             	mov    %rsp,%rbp
ffff80000010a877:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010a877 <list_is_empty+0x4>
ffff80000010a87e:	49 bb 71 49 00 00 00 	movabs $0x4971,%r11
ffff80000010a885:	00 00 00 
ffff80000010a888:	4c 01 d8             	add    %r11,%rax
ffff80000010a88b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff80000010a88f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010a893:	48 8b 00             	mov    (%rax),%rax
ffff80000010a896:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
ffff80000010a89a:	75 15                	jne    ffff80000010a8b1 <list_is_empty+0x3e>
ffff80000010a89c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010a8a0:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff80000010a8a4:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
ffff80000010a8a8:	75 07                	jne    ffff80000010a8b1 <list_is_empty+0x3e>
ffff80000010a8aa:	b8 01 00 00 00       	mov    $0x1,%eax
ffff80000010a8af:	eb 05                	jmp    ffff80000010a8b6 <list_is_empty+0x43>
ffff80000010a8b1:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010a8b6:	5d                   	pop    %rbp
ffff80000010a8b7:	c3                   	retq   

ffff80000010a8b8 <list_next>:
ffff80000010a8b8:	55                   	push   %rbp
ffff80000010a8b9:	48 89 e5             	mov    %rsp,%rbp
ffff80000010a8bc:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010a8bc <list_next+0x4>
ffff80000010a8c3:	49 bb 2c 49 00 00 00 	movabs $0x492c,%r11
ffff80000010a8ca:	00 00 00 
ffff80000010a8cd:	4c 01 d8             	add    %r11,%rax
ffff80000010a8d0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff80000010a8d4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010a8d8:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff80000010a8dc:	48 85 c0             	test   %rax,%rax
ffff80000010a8df:	74 0a                	je     ffff80000010a8eb <list_next+0x33>
ffff80000010a8e1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010a8e5:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff80000010a8e9:	eb 05                	jmp    ffff80000010a8f0 <list_next+0x38>
ffff80000010a8eb:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010a8f0:	5d                   	pop    %rbp
ffff80000010a8f1:	c3                   	retq   

ffff80000010a8f2 <wrmsr>:
ffff80000010a8f2:	55                   	push   %rbp
ffff80000010a8f3:	48 89 e5             	mov    %rsp,%rbp
ffff80000010a8f6:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010a8f6 <wrmsr+0x4>
ffff80000010a8fd:	49 bb f2 48 00 00 00 	movabs $0x48f2,%r11
ffff80000010a904:	00 00 00 
ffff80000010a907:	4c 01 d8             	add    %r11,%rax
ffff80000010a90a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff80000010a90e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff80000010a912:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010a916:	48 c1 e8 20          	shr    $0x20,%rax
ffff80000010a91a:	48 89 c2             	mov    %rax,%rdx
ffff80000010a91d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010a921:	89 c0                	mov    %eax,%eax
ffff80000010a923:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
ffff80000010a927:	0f 30                	wrmsr  
ffff80000010a929:	90                   	nop
ffff80000010a92a:	5d                   	pop    %rbp
ffff80000010a92b:	c3                   	retq   

ffff80000010a92c <IRQ0x20_interrupt>:
ffff80000010a92c:	6a 00                	pushq  $0x0
ffff80000010a92e:	fc                   	cld    
ffff80000010a92f:	50                   	push   %rax
ffff80000010a930:	50                   	push   %rax
ffff80000010a931:	48 8c c0             	mov    %es,%rax
ffff80000010a934:	50                   	push   %rax
ffff80000010a935:	48 8c d8             	mov    %ds,%rax
ffff80000010a938:	50                   	push   %rax
ffff80000010a939:	48 31 c0             	xor    %rax,%rax
ffff80000010a93c:	55                   	push   %rbp
ffff80000010a93d:	57                   	push   %rdi
ffff80000010a93e:	56                   	push   %rsi
ffff80000010a93f:	52                   	push   %rdx
ffff80000010a940:	51                   	push   %rcx
ffff80000010a941:	53                   	push   %rbx
ffff80000010a942:	41 50                	push   %r8
ffff80000010a944:	41 51                	push   %r9
ffff80000010a946:	41 52                	push   %r10
ffff80000010a948:	41 53                	push   %r11
ffff80000010a94a:	41 54                	push   %r12
ffff80000010a94c:	41 55                	push   %r13
ffff80000010a94e:	41 56                	push   %r14
ffff80000010a950:	41 57                	push   %r15
ffff80000010a952:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010a959:	48 8e da             	mov    %rdx,%ds
ffff80000010a95c:	48 8e c2             	mov    %rdx,%es
ffff80000010a95f:	48 89 e7             	mov    %rsp,%rdi
ffff80000010a962:	48 8d 05 bc 96 ff ff 	lea    -0x6944(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010a969:	50                   	push   %rax
ffff80000010a96a:	48 c7 c6 20 00 00 00 	mov    $0x20,%rsi
ffff80000010a971:	e9 64 08 00 00       	jmpq   ffff80000010b1da <do_IRQ>

ffff80000010a976 <IRQ0x21_interrupt>:
ffff80000010a976:	6a 00                	pushq  $0x0
ffff80000010a978:	fc                   	cld    
ffff80000010a979:	50                   	push   %rax
ffff80000010a97a:	50                   	push   %rax
ffff80000010a97b:	48 8c c0             	mov    %es,%rax
ffff80000010a97e:	50                   	push   %rax
ffff80000010a97f:	48 8c d8             	mov    %ds,%rax
ffff80000010a982:	50                   	push   %rax
ffff80000010a983:	48 31 c0             	xor    %rax,%rax
ffff80000010a986:	55                   	push   %rbp
ffff80000010a987:	57                   	push   %rdi
ffff80000010a988:	56                   	push   %rsi
ffff80000010a989:	52                   	push   %rdx
ffff80000010a98a:	51                   	push   %rcx
ffff80000010a98b:	53                   	push   %rbx
ffff80000010a98c:	41 50                	push   %r8
ffff80000010a98e:	41 51                	push   %r9
ffff80000010a990:	41 52                	push   %r10
ffff80000010a992:	41 53                	push   %r11
ffff80000010a994:	41 54                	push   %r12
ffff80000010a996:	41 55                	push   %r13
ffff80000010a998:	41 56                	push   %r14
ffff80000010a99a:	41 57                	push   %r15
ffff80000010a99c:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010a9a3:	48 8e da             	mov    %rdx,%ds
ffff80000010a9a6:	48 8e c2             	mov    %rdx,%es
ffff80000010a9a9:	48 89 e7             	mov    %rsp,%rdi
ffff80000010a9ac:	48 8d 05 72 96 ff ff 	lea    -0x698e(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010a9b3:	50                   	push   %rax
ffff80000010a9b4:	48 c7 c6 21 00 00 00 	mov    $0x21,%rsi
ffff80000010a9bb:	e9 1a 08 00 00       	jmpq   ffff80000010b1da <do_IRQ>

ffff80000010a9c0 <IRQ0x22_interrupt>:
ffff80000010a9c0:	6a 00                	pushq  $0x0
ffff80000010a9c2:	fc                   	cld    
ffff80000010a9c3:	50                   	push   %rax
ffff80000010a9c4:	50                   	push   %rax
ffff80000010a9c5:	48 8c c0             	mov    %es,%rax
ffff80000010a9c8:	50                   	push   %rax
ffff80000010a9c9:	48 8c d8             	mov    %ds,%rax
ffff80000010a9cc:	50                   	push   %rax
ffff80000010a9cd:	48 31 c0             	xor    %rax,%rax
ffff80000010a9d0:	55                   	push   %rbp
ffff80000010a9d1:	57                   	push   %rdi
ffff80000010a9d2:	56                   	push   %rsi
ffff80000010a9d3:	52                   	push   %rdx
ffff80000010a9d4:	51                   	push   %rcx
ffff80000010a9d5:	53                   	push   %rbx
ffff80000010a9d6:	41 50                	push   %r8
ffff80000010a9d8:	41 51                	push   %r9
ffff80000010a9da:	41 52                	push   %r10
ffff80000010a9dc:	41 53                	push   %r11
ffff80000010a9de:	41 54                	push   %r12
ffff80000010a9e0:	41 55                	push   %r13
ffff80000010a9e2:	41 56                	push   %r14
ffff80000010a9e4:	41 57                	push   %r15
ffff80000010a9e6:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010a9ed:	48 8e da             	mov    %rdx,%ds
ffff80000010a9f0:	48 8e c2             	mov    %rdx,%es
ffff80000010a9f3:	48 89 e7             	mov    %rsp,%rdi
ffff80000010a9f6:	48 8d 05 28 96 ff ff 	lea    -0x69d8(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010a9fd:	50                   	push   %rax
ffff80000010a9fe:	48 c7 c6 22 00 00 00 	mov    $0x22,%rsi
ffff80000010aa05:	e9 d0 07 00 00       	jmpq   ffff80000010b1da <do_IRQ>

ffff80000010aa0a <IRQ0x23_interrupt>:
ffff80000010aa0a:	6a 00                	pushq  $0x0
ffff80000010aa0c:	fc                   	cld    
ffff80000010aa0d:	50                   	push   %rax
ffff80000010aa0e:	50                   	push   %rax
ffff80000010aa0f:	48 8c c0             	mov    %es,%rax
ffff80000010aa12:	50                   	push   %rax
ffff80000010aa13:	48 8c d8             	mov    %ds,%rax
ffff80000010aa16:	50                   	push   %rax
ffff80000010aa17:	48 31 c0             	xor    %rax,%rax
ffff80000010aa1a:	55                   	push   %rbp
ffff80000010aa1b:	57                   	push   %rdi
ffff80000010aa1c:	56                   	push   %rsi
ffff80000010aa1d:	52                   	push   %rdx
ffff80000010aa1e:	51                   	push   %rcx
ffff80000010aa1f:	53                   	push   %rbx
ffff80000010aa20:	41 50                	push   %r8
ffff80000010aa22:	41 51                	push   %r9
ffff80000010aa24:	41 52                	push   %r10
ffff80000010aa26:	41 53                	push   %r11
ffff80000010aa28:	41 54                	push   %r12
ffff80000010aa2a:	41 55                	push   %r13
ffff80000010aa2c:	41 56                	push   %r14
ffff80000010aa2e:	41 57                	push   %r15
ffff80000010aa30:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010aa37:	48 8e da             	mov    %rdx,%ds
ffff80000010aa3a:	48 8e c2             	mov    %rdx,%es
ffff80000010aa3d:	48 89 e7             	mov    %rsp,%rdi
ffff80000010aa40:	48 8d 05 de 95 ff ff 	lea    -0x6a22(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010aa47:	50                   	push   %rax
ffff80000010aa48:	48 c7 c6 23 00 00 00 	mov    $0x23,%rsi
ffff80000010aa4f:	e9 86 07 00 00       	jmpq   ffff80000010b1da <do_IRQ>

ffff80000010aa54 <IRQ0x24_interrupt>:
ffff80000010aa54:	6a 00                	pushq  $0x0
ffff80000010aa56:	fc                   	cld    
ffff80000010aa57:	50                   	push   %rax
ffff80000010aa58:	50                   	push   %rax
ffff80000010aa59:	48 8c c0             	mov    %es,%rax
ffff80000010aa5c:	50                   	push   %rax
ffff80000010aa5d:	48 8c d8             	mov    %ds,%rax
ffff80000010aa60:	50                   	push   %rax
ffff80000010aa61:	48 31 c0             	xor    %rax,%rax
ffff80000010aa64:	55                   	push   %rbp
ffff80000010aa65:	57                   	push   %rdi
ffff80000010aa66:	56                   	push   %rsi
ffff80000010aa67:	52                   	push   %rdx
ffff80000010aa68:	51                   	push   %rcx
ffff80000010aa69:	53                   	push   %rbx
ffff80000010aa6a:	41 50                	push   %r8
ffff80000010aa6c:	41 51                	push   %r9
ffff80000010aa6e:	41 52                	push   %r10
ffff80000010aa70:	41 53                	push   %r11
ffff80000010aa72:	41 54                	push   %r12
ffff80000010aa74:	41 55                	push   %r13
ffff80000010aa76:	41 56                	push   %r14
ffff80000010aa78:	41 57                	push   %r15
ffff80000010aa7a:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010aa81:	48 8e da             	mov    %rdx,%ds
ffff80000010aa84:	48 8e c2             	mov    %rdx,%es
ffff80000010aa87:	48 89 e7             	mov    %rsp,%rdi
ffff80000010aa8a:	48 8d 05 94 95 ff ff 	lea    -0x6a6c(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010aa91:	50                   	push   %rax
ffff80000010aa92:	48 c7 c6 24 00 00 00 	mov    $0x24,%rsi
ffff80000010aa99:	e9 3c 07 00 00       	jmpq   ffff80000010b1da <do_IRQ>

ffff80000010aa9e <IRQ0x25_interrupt>:
ffff80000010aa9e:	6a 00                	pushq  $0x0
ffff80000010aaa0:	fc                   	cld    
ffff80000010aaa1:	50                   	push   %rax
ffff80000010aaa2:	50                   	push   %rax
ffff80000010aaa3:	48 8c c0             	mov    %es,%rax
ffff80000010aaa6:	50                   	push   %rax
ffff80000010aaa7:	48 8c d8             	mov    %ds,%rax
ffff80000010aaaa:	50                   	push   %rax
ffff80000010aaab:	48 31 c0             	xor    %rax,%rax
ffff80000010aaae:	55                   	push   %rbp
ffff80000010aaaf:	57                   	push   %rdi
ffff80000010aab0:	56                   	push   %rsi
ffff80000010aab1:	52                   	push   %rdx
ffff80000010aab2:	51                   	push   %rcx
ffff80000010aab3:	53                   	push   %rbx
ffff80000010aab4:	41 50                	push   %r8
ffff80000010aab6:	41 51                	push   %r9
ffff80000010aab8:	41 52                	push   %r10
ffff80000010aaba:	41 53                	push   %r11
ffff80000010aabc:	41 54                	push   %r12
ffff80000010aabe:	41 55                	push   %r13
ffff80000010aac0:	41 56                	push   %r14
ffff80000010aac2:	41 57                	push   %r15
ffff80000010aac4:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010aacb:	48 8e da             	mov    %rdx,%ds
ffff80000010aace:	48 8e c2             	mov    %rdx,%es
ffff80000010aad1:	48 89 e7             	mov    %rsp,%rdi
ffff80000010aad4:	48 8d 05 4a 95 ff ff 	lea    -0x6ab6(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010aadb:	50                   	push   %rax
ffff80000010aadc:	48 c7 c6 25 00 00 00 	mov    $0x25,%rsi
ffff80000010aae3:	e9 f2 06 00 00       	jmpq   ffff80000010b1da <do_IRQ>

ffff80000010aae8 <IRQ0x26_interrupt>:
ffff80000010aae8:	6a 00                	pushq  $0x0
ffff80000010aaea:	fc                   	cld    
ffff80000010aaeb:	50                   	push   %rax
ffff80000010aaec:	50                   	push   %rax
ffff80000010aaed:	48 8c c0             	mov    %es,%rax
ffff80000010aaf0:	50                   	push   %rax
ffff80000010aaf1:	48 8c d8             	mov    %ds,%rax
ffff80000010aaf4:	50                   	push   %rax
ffff80000010aaf5:	48 31 c0             	xor    %rax,%rax
ffff80000010aaf8:	55                   	push   %rbp
ffff80000010aaf9:	57                   	push   %rdi
ffff80000010aafa:	56                   	push   %rsi
ffff80000010aafb:	52                   	push   %rdx
ffff80000010aafc:	51                   	push   %rcx
ffff80000010aafd:	53                   	push   %rbx
ffff80000010aafe:	41 50                	push   %r8
ffff80000010ab00:	41 51                	push   %r9
ffff80000010ab02:	41 52                	push   %r10
ffff80000010ab04:	41 53                	push   %r11
ffff80000010ab06:	41 54                	push   %r12
ffff80000010ab08:	41 55                	push   %r13
ffff80000010ab0a:	41 56                	push   %r14
ffff80000010ab0c:	41 57                	push   %r15
ffff80000010ab0e:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010ab15:	48 8e da             	mov    %rdx,%ds
ffff80000010ab18:	48 8e c2             	mov    %rdx,%es
ffff80000010ab1b:	48 89 e7             	mov    %rsp,%rdi
ffff80000010ab1e:	48 8d 05 00 95 ff ff 	lea    -0x6b00(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010ab25:	50                   	push   %rax
ffff80000010ab26:	48 c7 c6 26 00 00 00 	mov    $0x26,%rsi
ffff80000010ab2d:	e9 a8 06 00 00       	jmpq   ffff80000010b1da <do_IRQ>

ffff80000010ab32 <IRQ0x27_interrupt>:
ffff80000010ab32:	6a 00                	pushq  $0x0
ffff80000010ab34:	fc                   	cld    
ffff80000010ab35:	50                   	push   %rax
ffff80000010ab36:	50                   	push   %rax
ffff80000010ab37:	48 8c c0             	mov    %es,%rax
ffff80000010ab3a:	50                   	push   %rax
ffff80000010ab3b:	48 8c d8             	mov    %ds,%rax
ffff80000010ab3e:	50                   	push   %rax
ffff80000010ab3f:	48 31 c0             	xor    %rax,%rax
ffff80000010ab42:	55                   	push   %rbp
ffff80000010ab43:	57                   	push   %rdi
ffff80000010ab44:	56                   	push   %rsi
ffff80000010ab45:	52                   	push   %rdx
ffff80000010ab46:	51                   	push   %rcx
ffff80000010ab47:	53                   	push   %rbx
ffff80000010ab48:	41 50                	push   %r8
ffff80000010ab4a:	41 51                	push   %r9
ffff80000010ab4c:	41 52                	push   %r10
ffff80000010ab4e:	41 53                	push   %r11
ffff80000010ab50:	41 54                	push   %r12
ffff80000010ab52:	41 55                	push   %r13
ffff80000010ab54:	41 56                	push   %r14
ffff80000010ab56:	41 57                	push   %r15
ffff80000010ab58:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010ab5f:	48 8e da             	mov    %rdx,%ds
ffff80000010ab62:	48 8e c2             	mov    %rdx,%es
ffff80000010ab65:	48 89 e7             	mov    %rsp,%rdi
ffff80000010ab68:	48 8d 05 b6 94 ff ff 	lea    -0x6b4a(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010ab6f:	50                   	push   %rax
ffff80000010ab70:	48 c7 c6 27 00 00 00 	mov    $0x27,%rsi
ffff80000010ab77:	e9 5e 06 00 00       	jmpq   ffff80000010b1da <do_IRQ>

ffff80000010ab7c <IRQ0x28_interrupt>:
ffff80000010ab7c:	6a 00                	pushq  $0x0
ffff80000010ab7e:	fc                   	cld    
ffff80000010ab7f:	50                   	push   %rax
ffff80000010ab80:	50                   	push   %rax
ffff80000010ab81:	48 8c c0             	mov    %es,%rax
ffff80000010ab84:	50                   	push   %rax
ffff80000010ab85:	48 8c d8             	mov    %ds,%rax
ffff80000010ab88:	50                   	push   %rax
ffff80000010ab89:	48 31 c0             	xor    %rax,%rax
ffff80000010ab8c:	55                   	push   %rbp
ffff80000010ab8d:	57                   	push   %rdi
ffff80000010ab8e:	56                   	push   %rsi
ffff80000010ab8f:	52                   	push   %rdx
ffff80000010ab90:	51                   	push   %rcx
ffff80000010ab91:	53                   	push   %rbx
ffff80000010ab92:	41 50                	push   %r8
ffff80000010ab94:	41 51                	push   %r9
ffff80000010ab96:	41 52                	push   %r10
ffff80000010ab98:	41 53                	push   %r11
ffff80000010ab9a:	41 54                	push   %r12
ffff80000010ab9c:	41 55                	push   %r13
ffff80000010ab9e:	41 56                	push   %r14
ffff80000010aba0:	41 57                	push   %r15
ffff80000010aba2:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010aba9:	48 8e da             	mov    %rdx,%ds
ffff80000010abac:	48 8e c2             	mov    %rdx,%es
ffff80000010abaf:	48 89 e7             	mov    %rsp,%rdi
ffff80000010abb2:	48 8d 05 6c 94 ff ff 	lea    -0x6b94(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010abb9:	50                   	push   %rax
ffff80000010abba:	48 c7 c6 28 00 00 00 	mov    $0x28,%rsi
ffff80000010abc1:	e9 14 06 00 00       	jmpq   ffff80000010b1da <do_IRQ>

ffff80000010abc6 <IRQ0x29_interrupt>:
ffff80000010abc6:	6a 00                	pushq  $0x0
ffff80000010abc8:	fc                   	cld    
ffff80000010abc9:	50                   	push   %rax
ffff80000010abca:	50                   	push   %rax
ffff80000010abcb:	48 8c c0             	mov    %es,%rax
ffff80000010abce:	50                   	push   %rax
ffff80000010abcf:	48 8c d8             	mov    %ds,%rax
ffff80000010abd2:	50                   	push   %rax
ffff80000010abd3:	48 31 c0             	xor    %rax,%rax
ffff80000010abd6:	55                   	push   %rbp
ffff80000010abd7:	57                   	push   %rdi
ffff80000010abd8:	56                   	push   %rsi
ffff80000010abd9:	52                   	push   %rdx
ffff80000010abda:	51                   	push   %rcx
ffff80000010abdb:	53                   	push   %rbx
ffff80000010abdc:	41 50                	push   %r8
ffff80000010abde:	41 51                	push   %r9
ffff80000010abe0:	41 52                	push   %r10
ffff80000010abe2:	41 53                	push   %r11
ffff80000010abe4:	41 54                	push   %r12
ffff80000010abe6:	41 55                	push   %r13
ffff80000010abe8:	41 56                	push   %r14
ffff80000010abea:	41 57                	push   %r15
ffff80000010abec:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010abf3:	48 8e da             	mov    %rdx,%ds
ffff80000010abf6:	48 8e c2             	mov    %rdx,%es
ffff80000010abf9:	48 89 e7             	mov    %rsp,%rdi
ffff80000010abfc:	48 8d 05 22 94 ff ff 	lea    -0x6bde(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010ac03:	50                   	push   %rax
ffff80000010ac04:	48 c7 c6 29 00 00 00 	mov    $0x29,%rsi
ffff80000010ac0b:	e9 ca 05 00 00       	jmpq   ffff80000010b1da <do_IRQ>

ffff80000010ac10 <IRQ0x2a_interrupt>:
ffff80000010ac10:	6a 00                	pushq  $0x0
ffff80000010ac12:	fc                   	cld    
ffff80000010ac13:	50                   	push   %rax
ffff80000010ac14:	50                   	push   %rax
ffff80000010ac15:	48 8c c0             	mov    %es,%rax
ffff80000010ac18:	50                   	push   %rax
ffff80000010ac19:	48 8c d8             	mov    %ds,%rax
ffff80000010ac1c:	50                   	push   %rax
ffff80000010ac1d:	48 31 c0             	xor    %rax,%rax
ffff80000010ac20:	55                   	push   %rbp
ffff80000010ac21:	57                   	push   %rdi
ffff80000010ac22:	56                   	push   %rsi
ffff80000010ac23:	52                   	push   %rdx
ffff80000010ac24:	51                   	push   %rcx
ffff80000010ac25:	53                   	push   %rbx
ffff80000010ac26:	41 50                	push   %r8
ffff80000010ac28:	41 51                	push   %r9
ffff80000010ac2a:	41 52                	push   %r10
ffff80000010ac2c:	41 53                	push   %r11
ffff80000010ac2e:	41 54                	push   %r12
ffff80000010ac30:	41 55                	push   %r13
ffff80000010ac32:	41 56                	push   %r14
ffff80000010ac34:	41 57                	push   %r15
ffff80000010ac36:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010ac3d:	48 8e da             	mov    %rdx,%ds
ffff80000010ac40:	48 8e c2             	mov    %rdx,%es
ffff80000010ac43:	48 89 e7             	mov    %rsp,%rdi
ffff80000010ac46:	48 8d 05 d8 93 ff ff 	lea    -0x6c28(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010ac4d:	50                   	push   %rax
ffff80000010ac4e:	48 c7 c6 2a 00 00 00 	mov    $0x2a,%rsi
ffff80000010ac55:	e9 80 05 00 00       	jmpq   ffff80000010b1da <do_IRQ>

ffff80000010ac5a <IRQ0x2b_interrupt>:
ffff80000010ac5a:	6a 00                	pushq  $0x0
ffff80000010ac5c:	fc                   	cld    
ffff80000010ac5d:	50                   	push   %rax
ffff80000010ac5e:	50                   	push   %rax
ffff80000010ac5f:	48 8c c0             	mov    %es,%rax
ffff80000010ac62:	50                   	push   %rax
ffff80000010ac63:	48 8c d8             	mov    %ds,%rax
ffff80000010ac66:	50                   	push   %rax
ffff80000010ac67:	48 31 c0             	xor    %rax,%rax
ffff80000010ac6a:	55                   	push   %rbp
ffff80000010ac6b:	57                   	push   %rdi
ffff80000010ac6c:	56                   	push   %rsi
ffff80000010ac6d:	52                   	push   %rdx
ffff80000010ac6e:	51                   	push   %rcx
ffff80000010ac6f:	53                   	push   %rbx
ffff80000010ac70:	41 50                	push   %r8
ffff80000010ac72:	41 51                	push   %r9
ffff80000010ac74:	41 52                	push   %r10
ffff80000010ac76:	41 53                	push   %r11
ffff80000010ac78:	41 54                	push   %r12
ffff80000010ac7a:	41 55                	push   %r13
ffff80000010ac7c:	41 56                	push   %r14
ffff80000010ac7e:	41 57                	push   %r15
ffff80000010ac80:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010ac87:	48 8e da             	mov    %rdx,%ds
ffff80000010ac8a:	48 8e c2             	mov    %rdx,%es
ffff80000010ac8d:	48 89 e7             	mov    %rsp,%rdi
ffff80000010ac90:	48 8d 05 8e 93 ff ff 	lea    -0x6c72(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010ac97:	50                   	push   %rax
ffff80000010ac98:	48 c7 c6 2b 00 00 00 	mov    $0x2b,%rsi
ffff80000010ac9f:	e9 36 05 00 00       	jmpq   ffff80000010b1da <do_IRQ>

ffff80000010aca4 <IRQ0x2c_interrupt>:
ffff80000010aca4:	6a 00                	pushq  $0x0
ffff80000010aca6:	fc                   	cld    
ffff80000010aca7:	50                   	push   %rax
ffff80000010aca8:	50                   	push   %rax
ffff80000010aca9:	48 8c c0             	mov    %es,%rax
ffff80000010acac:	50                   	push   %rax
ffff80000010acad:	48 8c d8             	mov    %ds,%rax
ffff80000010acb0:	50                   	push   %rax
ffff80000010acb1:	48 31 c0             	xor    %rax,%rax
ffff80000010acb4:	55                   	push   %rbp
ffff80000010acb5:	57                   	push   %rdi
ffff80000010acb6:	56                   	push   %rsi
ffff80000010acb7:	52                   	push   %rdx
ffff80000010acb8:	51                   	push   %rcx
ffff80000010acb9:	53                   	push   %rbx
ffff80000010acba:	41 50                	push   %r8
ffff80000010acbc:	41 51                	push   %r9
ffff80000010acbe:	41 52                	push   %r10
ffff80000010acc0:	41 53                	push   %r11
ffff80000010acc2:	41 54                	push   %r12
ffff80000010acc4:	41 55                	push   %r13
ffff80000010acc6:	41 56                	push   %r14
ffff80000010acc8:	41 57                	push   %r15
ffff80000010acca:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010acd1:	48 8e da             	mov    %rdx,%ds
ffff80000010acd4:	48 8e c2             	mov    %rdx,%es
ffff80000010acd7:	48 89 e7             	mov    %rsp,%rdi
ffff80000010acda:	48 8d 05 44 93 ff ff 	lea    -0x6cbc(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010ace1:	50                   	push   %rax
ffff80000010ace2:	48 c7 c6 2c 00 00 00 	mov    $0x2c,%rsi
ffff80000010ace9:	e9 ec 04 00 00       	jmpq   ffff80000010b1da <do_IRQ>

ffff80000010acee <IRQ0x2d_interrupt>:
ffff80000010acee:	6a 00                	pushq  $0x0
ffff80000010acf0:	fc                   	cld    
ffff80000010acf1:	50                   	push   %rax
ffff80000010acf2:	50                   	push   %rax
ffff80000010acf3:	48 8c c0             	mov    %es,%rax
ffff80000010acf6:	50                   	push   %rax
ffff80000010acf7:	48 8c d8             	mov    %ds,%rax
ffff80000010acfa:	50                   	push   %rax
ffff80000010acfb:	48 31 c0             	xor    %rax,%rax
ffff80000010acfe:	55                   	push   %rbp
ffff80000010acff:	57                   	push   %rdi
ffff80000010ad00:	56                   	push   %rsi
ffff80000010ad01:	52                   	push   %rdx
ffff80000010ad02:	51                   	push   %rcx
ffff80000010ad03:	53                   	push   %rbx
ffff80000010ad04:	41 50                	push   %r8
ffff80000010ad06:	41 51                	push   %r9
ffff80000010ad08:	41 52                	push   %r10
ffff80000010ad0a:	41 53                	push   %r11
ffff80000010ad0c:	41 54                	push   %r12
ffff80000010ad0e:	41 55                	push   %r13
ffff80000010ad10:	41 56                	push   %r14
ffff80000010ad12:	41 57                	push   %r15
ffff80000010ad14:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010ad1b:	48 8e da             	mov    %rdx,%ds
ffff80000010ad1e:	48 8e c2             	mov    %rdx,%es
ffff80000010ad21:	48 89 e7             	mov    %rsp,%rdi
ffff80000010ad24:	48 8d 05 fa 92 ff ff 	lea    -0x6d06(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010ad2b:	50                   	push   %rax
ffff80000010ad2c:	48 c7 c6 2d 00 00 00 	mov    $0x2d,%rsi
ffff80000010ad33:	e9 a2 04 00 00       	jmpq   ffff80000010b1da <do_IRQ>

ffff80000010ad38 <IRQ0x2e_interrupt>:
ffff80000010ad38:	6a 00                	pushq  $0x0
ffff80000010ad3a:	fc                   	cld    
ffff80000010ad3b:	50                   	push   %rax
ffff80000010ad3c:	50                   	push   %rax
ffff80000010ad3d:	48 8c c0             	mov    %es,%rax
ffff80000010ad40:	50                   	push   %rax
ffff80000010ad41:	48 8c d8             	mov    %ds,%rax
ffff80000010ad44:	50                   	push   %rax
ffff80000010ad45:	48 31 c0             	xor    %rax,%rax
ffff80000010ad48:	55                   	push   %rbp
ffff80000010ad49:	57                   	push   %rdi
ffff80000010ad4a:	56                   	push   %rsi
ffff80000010ad4b:	52                   	push   %rdx
ffff80000010ad4c:	51                   	push   %rcx
ffff80000010ad4d:	53                   	push   %rbx
ffff80000010ad4e:	41 50                	push   %r8
ffff80000010ad50:	41 51                	push   %r9
ffff80000010ad52:	41 52                	push   %r10
ffff80000010ad54:	41 53                	push   %r11
ffff80000010ad56:	41 54                	push   %r12
ffff80000010ad58:	41 55                	push   %r13
ffff80000010ad5a:	41 56                	push   %r14
ffff80000010ad5c:	41 57                	push   %r15
ffff80000010ad5e:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010ad65:	48 8e da             	mov    %rdx,%ds
ffff80000010ad68:	48 8e c2             	mov    %rdx,%es
ffff80000010ad6b:	48 89 e7             	mov    %rsp,%rdi
ffff80000010ad6e:	48 8d 05 b0 92 ff ff 	lea    -0x6d50(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010ad75:	50                   	push   %rax
ffff80000010ad76:	48 c7 c6 2e 00 00 00 	mov    $0x2e,%rsi
ffff80000010ad7d:	e9 58 04 00 00       	jmpq   ffff80000010b1da <do_IRQ>

ffff80000010ad82 <IRQ0x2f_interrupt>:
ffff80000010ad82:	6a 00                	pushq  $0x0
ffff80000010ad84:	fc                   	cld    
ffff80000010ad85:	50                   	push   %rax
ffff80000010ad86:	50                   	push   %rax
ffff80000010ad87:	48 8c c0             	mov    %es,%rax
ffff80000010ad8a:	50                   	push   %rax
ffff80000010ad8b:	48 8c d8             	mov    %ds,%rax
ffff80000010ad8e:	50                   	push   %rax
ffff80000010ad8f:	48 31 c0             	xor    %rax,%rax
ffff80000010ad92:	55                   	push   %rbp
ffff80000010ad93:	57                   	push   %rdi
ffff80000010ad94:	56                   	push   %rsi
ffff80000010ad95:	52                   	push   %rdx
ffff80000010ad96:	51                   	push   %rcx
ffff80000010ad97:	53                   	push   %rbx
ffff80000010ad98:	41 50                	push   %r8
ffff80000010ad9a:	41 51                	push   %r9
ffff80000010ad9c:	41 52                	push   %r10
ffff80000010ad9e:	41 53                	push   %r11
ffff80000010ada0:	41 54                	push   %r12
ffff80000010ada2:	41 55                	push   %r13
ffff80000010ada4:	41 56                	push   %r14
ffff80000010ada6:	41 57                	push   %r15
ffff80000010ada8:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010adaf:	48 8e da             	mov    %rdx,%ds
ffff80000010adb2:	48 8e c2             	mov    %rdx,%es
ffff80000010adb5:	48 89 e7             	mov    %rsp,%rdi
ffff80000010adb8:	48 8d 05 66 92 ff ff 	lea    -0x6d9a(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010adbf:	50                   	push   %rax
ffff80000010adc0:	48 c7 c6 2f 00 00 00 	mov    $0x2f,%rsi
ffff80000010adc7:	e9 0e 04 00 00       	jmpq   ffff80000010b1da <do_IRQ>

ffff80000010adcc <IRQ0x30_interrupt>:
ffff80000010adcc:	6a 00                	pushq  $0x0
ffff80000010adce:	fc                   	cld    
ffff80000010adcf:	50                   	push   %rax
ffff80000010add0:	50                   	push   %rax
ffff80000010add1:	48 8c c0             	mov    %es,%rax
ffff80000010add4:	50                   	push   %rax
ffff80000010add5:	48 8c d8             	mov    %ds,%rax
ffff80000010add8:	50                   	push   %rax
ffff80000010add9:	48 31 c0             	xor    %rax,%rax
ffff80000010addc:	55                   	push   %rbp
ffff80000010addd:	57                   	push   %rdi
ffff80000010adde:	56                   	push   %rsi
ffff80000010addf:	52                   	push   %rdx
ffff80000010ade0:	51                   	push   %rcx
ffff80000010ade1:	53                   	push   %rbx
ffff80000010ade2:	41 50                	push   %r8
ffff80000010ade4:	41 51                	push   %r9
ffff80000010ade6:	41 52                	push   %r10
ffff80000010ade8:	41 53                	push   %r11
ffff80000010adea:	41 54                	push   %r12
ffff80000010adec:	41 55                	push   %r13
ffff80000010adee:	41 56                	push   %r14
ffff80000010adf0:	41 57                	push   %r15
ffff80000010adf2:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010adf9:	48 8e da             	mov    %rdx,%ds
ffff80000010adfc:	48 8e c2             	mov    %rdx,%es
ffff80000010adff:	48 89 e7             	mov    %rsp,%rdi
ffff80000010ae02:	48 8d 05 1c 92 ff ff 	lea    -0x6de4(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010ae09:	50                   	push   %rax
ffff80000010ae0a:	48 c7 c6 30 00 00 00 	mov    $0x30,%rsi
ffff80000010ae11:	e9 c4 03 00 00       	jmpq   ffff80000010b1da <do_IRQ>

ffff80000010ae16 <IRQ0x31_interrupt>:
ffff80000010ae16:	6a 00                	pushq  $0x0
ffff80000010ae18:	fc                   	cld    
ffff80000010ae19:	50                   	push   %rax
ffff80000010ae1a:	50                   	push   %rax
ffff80000010ae1b:	48 8c c0             	mov    %es,%rax
ffff80000010ae1e:	50                   	push   %rax
ffff80000010ae1f:	48 8c d8             	mov    %ds,%rax
ffff80000010ae22:	50                   	push   %rax
ffff80000010ae23:	48 31 c0             	xor    %rax,%rax
ffff80000010ae26:	55                   	push   %rbp
ffff80000010ae27:	57                   	push   %rdi
ffff80000010ae28:	56                   	push   %rsi
ffff80000010ae29:	52                   	push   %rdx
ffff80000010ae2a:	51                   	push   %rcx
ffff80000010ae2b:	53                   	push   %rbx
ffff80000010ae2c:	41 50                	push   %r8
ffff80000010ae2e:	41 51                	push   %r9
ffff80000010ae30:	41 52                	push   %r10
ffff80000010ae32:	41 53                	push   %r11
ffff80000010ae34:	41 54                	push   %r12
ffff80000010ae36:	41 55                	push   %r13
ffff80000010ae38:	41 56                	push   %r14
ffff80000010ae3a:	41 57                	push   %r15
ffff80000010ae3c:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010ae43:	48 8e da             	mov    %rdx,%ds
ffff80000010ae46:	48 8e c2             	mov    %rdx,%es
ffff80000010ae49:	48 89 e7             	mov    %rsp,%rdi
ffff80000010ae4c:	48 8d 05 d2 91 ff ff 	lea    -0x6e2e(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010ae53:	50                   	push   %rax
ffff80000010ae54:	48 c7 c6 31 00 00 00 	mov    $0x31,%rsi
ffff80000010ae5b:	e9 7a 03 00 00       	jmpq   ffff80000010b1da <do_IRQ>

ffff80000010ae60 <IRQ0x32_interrupt>:
ffff80000010ae60:	6a 00                	pushq  $0x0
ffff80000010ae62:	fc                   	cld    
ffff80000010ae63:	50                   	push   %rax
ffff80000010ae64:	50                   	push   %rax
ffff80000010ae65:	48 8c c0             	mov    %es,%rax
ffff80000010ae68:	50                   	push   %rax
ffff80000010ae69:	48 8c d8             	mov    %ds,%rax
ffff80000010ae6c:	50                   	push   %rax
ffff80000010ae6d:	48 31 c0             	xor    %rax,%rax
ffff80000010ae70:	55                   	push   %rbp
ffff80000010ae71:	57                   	push   %rdi
ffff80000010ae72:	56                   	push   %rsi
ffff80000010ae73:	52                   	push   %rdx
ffff80000010ae74:	51                   	push   %rcx
ffff80000010ae75:	53                   	push   %rbx
ffff80000010ae76:	41 50                	push   %r8
ffff80000010ae78:	41 51                	push   %r9
ffff80000010ae7a:	41 52                	push   %r10
ffff80000010ae7c:	41 53                	push   %r11
ffff80000010ae7e:	41 54                	push   %r12
ffff80000010ae80:	41 55                	push   %r13
ffff80000010ae82:	41 56                	push   %r14
ffff80000010ae84:	41 57                	push   %r15
ffff80000010ae86:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010ae8d:	48 8e da             	mov    %rdx,%ds
ffff80000010ae90:	48 8e c2             	mov    %rdx,%es
ffff80000010ae93:	48 89 e7             	mov    %rsp,%rdi
ffff80000010ae96:	48 8d 05 88 91 ff ff 	lea    -0x6e78(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010ae9d:	50                   	push   %rax
ffff80000010ae9e:	48 c7 c6 32 00 00 00 	mov    $0x32,%rsi
ffff80000010aea5:	e9 30 03 00 00       	jmpq   ffff80000010b1da <do_IRQ>

ffff80000010aeaa <IRQ0x33_interrupt>:
ffff80000010aeaa:	6a 00                	pushq  $0x0
ffff80000010aeac:	fc                   	cld    
ffff80000010aead:	50                   	push   %rax
ffff80000010aeae:	50                   	push   %rax
ffff80000010aeaf:	48 8c c0             	mov    %es,%rax
ffff80000010aeb2:	50                   	push   %rax
ffff80000010aeb3:	48 8c d8             	mov    %ds,%rax
ffff80000010aeb6:	50                   	push   %rax
ffff80000010aeb7:	48 31 c0             	xor    %rax,%rax
ffff80000010aeba:	55                   	push   %rbp
ffff80000010aebb:	57                   	push   %rdi
ffff80000010aebc:	56                   	push   %rsi
ffff80000010aebd:	52                   	push   %rdx
ffff80000010aebe:	51                   	push   %rcx
ffff80000010aebf:	53                   	push   %rbx
ffff80000010aec0:	41 50                	push   %r8
ffff80000010aec2:	41 51                	push   %r9
ffff80000010aec4:	41 52                	push   %r10
ffff80000010aec6:	41 53                	push   %r11
ffff80000010aec8:	41 54                	push   %r12
ffff80000010aeca:	41 55                	push   %r13
ffff80000010aecc:	41 56                	push   %r14
ffff80000010aece:	41 57                	push   %r15
ffff80000010aed0:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010aed7:	48 8e da             	mov    %rdx,%ds
ffff80000010aeda:	48 8e c2             	mov    %rdx,%es
ffff80000010aedd:	48 89 e7             	mov    %rsp,%rdi
ffff80000010aee0:	48 8d 05 3e 91 ff ff 	lea    -0x6ec2(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010aee7:	50                   	push   %rax
ffff80000010aee8:	48 c7 c6 33 00 00 00 	mov    $0x33,%rsi
ffff80000010aeef:	e9 e6 02 00 00       	jmpq   ffff80000010b1da <do_IRQ>

ffff80000010aef4 <IRQ0x34_interrupt>:
ffff80000010aef4:	6a 00                	pushq  $0x0
ffff80000010aef6:	fc                   	cld    
ffff80000010aef7:	50                   	push   %rax
ffff80000010aef8:	50                   	push   %rax
ffff80000010aef9:	48 8c c0             	mov    %es,%rax
ffff80000010aefc:	50                   	push   %rax
ffff80000010aefd:	48 8c d8             	mov    %ds,%rax
ffff80000010af00:	50                   	push   %rax
ffff80000010af01:	48 31 c0             	xor    %rax,%rax
ffff80000010af04:	55                   	push   %rbp
ffff80000010af05:	57                   	push   %rdi
ffff80000010af06:	56                   	push   %rsi
ffff80000010af07:	52                   	push   %rdx
ffff80000010af08:	51                   	push   %rcx
ffff80000010af09:	53                   	push   %rbx
ffff80000010af0a:	41 50                	push   %r8
ffff80000010af0c:	41 51                	push   %r9
ffff80000010af0e:	41 52                	push   %r10
ffff80000010af10:	41 53                	push   %r11
ffff80000010af12:	41 54                	push   %r12
ffff80000010af14:	41 55                	push   %r13
ffff80000010af16:	41 56                	push   %r14
ffff80000010af18:	41 57                	push   %r15
ffff80000010af1a:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010af21:	48 8e da             	mov    %rdx,%ds
ffff80000010af24:	48 8e c2             	mov    %rdx,%es
ffff80000010af27:	48 89 e7             	mov    %rsp,%rdi
ffff80000010af2a:	48 8d 05 f4 90 ff ff 	lea    -0x6f0c(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010af31:	50                   	push   %rax
ffff80000010af32:	48 c7 c6 34 00 00 00 	mov    $0x34,%rsi
ffff80000010af39:	e9 9c 02 00 00       	jmpq   ffff80000010b1da <do_IRQ>

ffff80000010af3e <IRQ0x35_interrupt>:
ffff80000010af3e:	6a 00                	pushq  $0x0
ffff80000010af40:	fc                   	cld    
ffff80000010af41:	50                   	push   %rax
ffff80000010af42:	50                   	push   %rax
ffff80000010af43:	48 8c c0             	mov    %es,%rax
ffff80000010af46:	50                   	push   %rax
ffff80000010af47:	48 8c d8             	mov    %ds,%rax
ffff80000010af4a:	50                   	push   %rax
ffff80000010af4b:	48 31 c0             	xor    %rax,%rax
ffff80000010af4e:	55                   	push   %rbp
ffff80000010af4f:	57                   	push   %rdi
ffff80000010af50:	56                   	push   %rsi
ffff80000010af51:	52                   	push   %rdx
ffff80000010af52:	51                   	push   %rcx
ffff80000010af53:	53                   	push   %rbx
ffff80000010af54:	41 50                	push   %r8
ffff80000010af56:	41 51                	push   %r9
ffff80000010af58:	41 52                	push   %r10
ffff80000010af5a:	41 53                	push   %r11
ffff80000010af5c:	41 54                	push   %r12
ffff80000010af5e:	41 55                	push   %r13
ffff80000010af60:	41 56                	push   %r14
ffff80000010af62:	41 57                	push   %r15
ffff80000010af64:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010af6b:	48 8e da             	mov    %rdx,%ds
ffff80000010af6e:	48 8e c2             	mov    %rdx,%es
ffff80000010af71:	48 89 e7             	mov    %rsp,%rdi
ffff80000010af74:	48 8d 05 aa 90 ff ff 	lea    -0x6f56(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010af7b:	50                   	push   %rax
ffff80000010af7c:	48 c7 c6 35 00 00 00 	mov    $0x35,%rsi
ffff80000010af83:	e9 52 02 00 00       	jmpq   ffff80000010b1da <do_IRQ>

ffff80000010af88 <IRQ0x36_interrupt>:
ffff80000010af88:	6a 00                	pushq  $0x0
ffff80000010af8a:	fc                   	cld    
ffff80000010af8b:	50                   	push   %rax
ffff80000010af8c:	50                   	push   %rax
ffff80000010af8d:	48 8c c0             	mov    %es,%rax
ffff80000010af90:	50                   	push   %rax
ffff80000010af91:	48 8c d8             	mov    %ds,%rax
ffff80000010af94:	50                   	push   %rax
ffff80000010af95:	48 31 c0             	xor    %rax,%rax
ffff80000010af98:	55                   	push   %rbp
ffff80000010af99:	57                   	push   %rdi
ffff80000010af9a:	56                   	push   %rsi
ffff80000010af9b:	52                   	push   %rdx
ffff80000010af9c:	51                   	push   %rcx
ffff80000010af9d:	53                   	push   %rbx
ffff80000010af9e:	41 50                	push   %r8
ffff80000010afa0:	41 51                	push   %r9
ffff80000010afa2:	41 52                	push   %r10
ffff80000010afa4:	41 53                	push   %r11
ffff80000010afa6:	41 54                	push   %r12
ffff80000010afa8:	41 55                	push   %r13
ffff80000010afaa:	41 56                	push   %r14
ffff80000010afac:	41 57                	push   %r15
ffff80000010afae:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010afb5:	48 8e da             	mov    %rdx,%ds
ffff80000010afb8:	48 8e c2             	mov    %rdx,%es
ffff80000010afbb:	48 89 e7             	mov    %rsp,%rdi
ffff80000010afbe:	48 8d 05 60 90 ff ff 	lea    -0x6fa0(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010afc5:	50                   	push   %rax
ffff80000010afc6:	48 c7 c6 36 00 00 00 	mov    $0x36,%rsi
ffff80000010afcd:	e9 08 02 00 00       	jmpq   ffff80000010b1da <do_IRQ>

ffff80000010afd2 <IRQ0x37_interrupt>:
ffff80000010afd2:	6a 00                	pushq  $0x0
ffff80000010afd4:	fc                   	cld    
ffff80000010afd5:	50                   	push   %rax
ffff80000010afd6:	50                   	push   %rax
ffff80000010afd7:	48 8c c0             	mov    %es,%rax
ffff80000010afda:	50                   	push   %rax
ffff80000010afdb:	48 8c d8             	mov    %ds,%rax
ffff80000010afde:	50                   	push   %rax
ffff80000010afdf:	48 31 c0             	xor    %rax,%rax
ffff80000010afe2:	55                   	push   %rbp
ffff80000010afe3:	57                   	push   %rdi
ffff80000010afe4:	56                   	push   %rsi
ffff80000010afe5:	52                   	push   %rdx
ffff80000010afe6:	51                   	push   %rcx
ffff80000010afe7:	53                   	push   %rbx
ffff80000010afe8:	41 50                	push   %r8
ffff80000010afea:	41 51                	push   %r9
ffff80000010afec:	41 52                	push   %r10
ffff80000010afee:	41 53                	push   %r11
ffff80000010aff0:	41 54                	push   %r12
ffff80000010aff2:	41 55                	push   %r13
ffff80000010aff4:	41 56                	push   %r14
ffff80000010aff6:	41 57                	push   %r15
ffff80000010aff8:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010afff:	48 8e da             	mov    %rdx,%ds
ffff80000010b002:	48 8e c2             	mov    %rdx,%es
ffff80000010b005:	48 89 e7             	mov    %rsp,%rdi
ffff80000010b008:	48 8d 05 16 90 ff ff 	lea    -0x6fea(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010b00f:	50                   	push   %rax
ffff80000010b010:	48 c7 c6 37 00 00 00 	mov    $0x37,%rsi
ffff80000010b017:	e9 be 01 00 00       	jmpq   ffff80000010b1da <do_IRQ>

ffff80000010b01c <init_interrupt>:
ffff80000010b01c:	55                   	push   %rbp
ffff80000010b01d:	48 89 e5             	mov    %rsp,%rbp
ffff80000010b020:	41 57                	push   %r15
ffff80000010b022:	53                   	push   %rbx
ffff80000010b023:	48 83 ec 10          	sub    $0x10,%rsp
ffff80000010b027:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff80000010b027 <init_interrupt+0xb>
ffff80000010b02e:	49 bb c1 41 00 00 00 	movabs $0x41c1,%r11
ffff80000010b035:	00 00 00 
ffff80000010b038:	4c 01 db             	add    %r11,%rbx
ffff80000010b03b:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%rbp)
ffff80000010b042:	eb 3e                	jmp    ffff80000010b082 <init_interrupt+0x66>
ffff80000010b044:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff80000010b047:	83 e8 20             	sub    $0x20,%eax
ffff80000010b04a:	48 ba 98 0f 00 00 00 	movabs $0xf98,%rdx
ffff80000010b051:	00 00 00 
ffff80000010b054:	48 98                	cltq   
ffff80000010b056:	48 01 da             	add    %rbx,%rdx
ffff80000010b059:	48 8b 14 c2          	mov    (%rdx,%rax,8),%rdx
ffff80000010b05d:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff80000010b060:	be 02 00 00 00       	mov    $0x2,%esi
ffff80000010b065:	89 c7                	mov    %eax,%edi
ffff80000010b067:	49 89 df             	mov    %rbx,%r15
ffff80000010b06a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010b06f:	48 b9 39 51 ff ff ff 	movabs $0xffffffffffff5139,%rcx
ffff80000010b076:	ff ff ff 
ffff80000010b079:	48 01 d9             	add    %rbx,%rcx
ffff80000010b07c:	ff d1                	callq  *%rcx
ffff80000010b07e:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
ffff80000010b082:	83 7d ec 37          	cmpl   $0x37,-0x14(%rbp)
ffff80000010b086:	7e bc                	jle    ffff80000010b044 <init_interrupt+0x28>
ffff80000010b088:	48 b8 22 1c 00 00 00 	movabs $0x1c22,%rax
ffff80000010b08f:	00 00 00 
ffff80000010b092:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010b096:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010b09b:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010b0a0:	49 89 df             	mov    %rbx,%r15
ffff80000010b0a3:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010b0a8:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff80000010b0af:	ff ff ff 
ffff80000010b0b2:	48 01 d9             	add    %rbx,%rcx
ffff80000010b0b5:	ff d1                	callq  *%rcx
ffff80000010b0b7:	be 11 00 00 00       	mov    $0x11,%esi
ffff80000010b0bc:	bf 20 00 00 00       	mov    $0x20,%edi
ffff80000010b0c1:	49 89 df             	mov    %rbx,%r15
ffff80000010b0c4:	48 b8 fa b4 ff ff ff 	movabs $0xffffffffffffb4fa,%rax
ffff80000010b0cb:	ff ff ff 
ffff80000010b0ce:	48 01 d8             	add    %rbx,%rax
ffff80000010b0d1:	ff d0                	callq  *%rax
ffff80000010b0d3:	be 20 00 00 00       	mov    $0x20,%esi
ffff80000010b0d8:	bf 21 00 00 00       	mov    $0x21,%edi
ffff80000010b0dd:	49 89 df             	mov    %rbx,%r15
ffff80000010b0e0:	48 b8 fa b4 ff ff ff 	movabs $0xffffffffffffb4fa,%rax
ffff80000010b0e7:	ff ff ff 
ffff80000010b0ea:	48 01 d8             	add    %rbx,%rax
ffff80000010b0ed:	ff d0                	callq  *%rax
ffff80000010b0ef:	be 04 00 00 00       	mov    $0x4,%esi
ffff80000010b0f4:	bf 21 00 00 00       	mov    $0x21,%edi
ffff80000010b0f9:	49 89 df             	mov    %rbx,%r15
ffff80000010b0fc:	48 b8 fa b4 ff ff ff 	movabs $0xffffffffffffb4fa,%rax
ffff80000010b103:	ff ff ff 
ffff80000010b106:	48 01 d8             	add    %rbx,%rax
ffff80000010b109:	ff d0                	callq  *%rax
ffff80000010b10b:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010b110:	bf 21 00 00 00       	mov    $0x21,%edi
ffff80000010b115:	49 89 df             	mov    %rbx,%r15
ffff80000010b118:	48 b8 fa b4 ff ff ff 	movabs $0xffffffffffffb4fa,%rax
ffff80000010b11f:	ff ff ff 
ffff80000010b122:	48 01 d8             	add    %rbx,%rax
ffff80000010b125:	ff d0                	callq  *%rax
ffff80000010b127:	be 11 00 00 00       	mov    $0x11,%esi
ffff80000010b12c:	bf a0 00 00 00       	mov    $0xa0,%edi
ffff80000010b131:	49 89 df             	mov    %rbx,%r15
ffff80000010b134:	48 b8 fa b4 ff ff ff 	movabs $0xffffffffffffb4fa,%rax
ffff80000010b13b:	ff ff ff 
ffff80000010b13e:	48 01 d8             	add    %rbx,%rax
ffff80000010b141:	ff d0                	callq  *%rax
ffff80000010b143:	be 28 00 00 00       	mov    $0x28,%esi
ffff80000010b148:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff80000010b14d:	49 89 df             	mov    %rbx,%r15
ffff80000010b150:	48 b8 fa b4 ff ff ff 	movabs $0xffffffffffffb4fa,%rax
ffff80000010b157:	ff ff ff 
ffff80000010b15a:	48 01 d8             	add    %rbx,%rax
ffff80000010b15d:	ff d0                	callq  *%rax
ffff80000010b15f:	be 02 00 00 00       	mov    $0x2,%esi
ffff80000010b164:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff80000010b169:	49 89 df             	mov    %rbx,%r15
ffff80000010b16c:	48 b8 fa b4 ff ff ff 	movabs $0xffffffffffffb4fa,%rax
ffff80000010b173:	ff ff ff 
ffff80000010b176:	48 01 d8             	add    %rbx,%rax
ffff80000010b179:	ff d0                	callq  *%rax
ffff80000010b17b:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010b180:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff80000010b185:	49 89 df             	mov    %rbx,%r15
ffff80000010b188:	48 b8 fa b4 ff ff ff 	movabs $0xffffffffffffb4fa,%rax
ffff80000010b18f:	ff ff ff 
ffff80000010b192:	48 01 d8             	add    %rbx,%rax
ffff80000010b195:	ff d0                	callq  *%rax
ffff80000010b197:	be fd 00 00 00       	mov    $0xfd,%esi
ffff80000010b19c:	bf 21 00 00 00       	mov    $0x21,%edi
ffff80000010b1a1:	49 89 df             	mov    %rbx,%r15
ffff80000010b1a4:	48 b8 fa b4 ff ff ff 	movabs $0xffffffffffffb4fa,%rax
ffff80000010b1ab:	ff ff ff 
ffff80000010b1ae:	48 01 d8             	add    %rbx,%rax
ffff80000010b1b1:	ff d0                	callq  *%rax
ffff80000010b1b3:	be ff 00 00 00       	mov    $0xff,%esi
ffff80000010b1b8:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff80000010b1bd:	49 89 df             	mov    %rbx,%r15
ffff80000010b1c0:	48 b8 fa b4 ff ff ff 	movabs $0xffffffffffffb4fa,%rax
ffff80000010b1c7:	ff ff ff 
ffff80000010b1ca:	48 01 d8             	add    %rbx,%rax
ffff80000010b1cd:	ff d0                	callq  *%rax
ffff80000010b1cf:	fb                   	sti    
ffff80000010b1d0:	90                   	nop
ffff80000010b1d1:	48 83 c4 10          	add    $0x10,%rsp
ffff80000010b1d5:	5b                   	pop    %rbx
ffff80000010b1d6:	41 5f                	pop    %r15
ffff80000010b1d8:	5d                   	pop    %rbp
ffff80000010b1d9:	c3                   	retq   

ffff80000010b1da <do_IRQ>:
ffff80000010b1da:	55                   	push   %rbp
ffff80000010b1db:	48 89 e5             	mov    %rsp,%rbp
ffff80000010b1de:	41 57                	push   %r15
ffff80000010b1e0:	53                   	push   %rbx
ffff80000010b1e1:	48 83 ec 20          	sub    $0x20,%rsp
ffff80000010b1e5:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff80000010b1e5 <do_IRQ+0xb>
ffff80000010b1ec:	49 bb 03 40 00 00 00 	movabs $0x4003,%r11
ffff80000010b1f3:	00 00 00 
ffff80000010b1f6:	4c 01 db             	add    %r11,%rbx
ffff80000010b1f9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff80000010b1fd:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff80000010b201:	bf 60 00 00 00       	mov    $0x60,%edi
ffff80000010b206:	49 89 df             	mov    %rbx,%r15
ffff80000010b209:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010b20e:	48 ba 2c b5 ff ff ff 	movabs $0xffffffffffffb52c,%rdx
ffff80000010b215:	ff ff ff 
ffff80000010b218:	48 01 da             	add    %rbx,%rdx
ffff80000010b21b:	ff d2                	callq  *%rdx
ffff80000010b21d:	88 45 ef             	mov    %al,-0x11(%rbp)
ffff80000010b220:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
ffff80000010b224:	89 c1                	mov    %eax,%ecx
ffff80000010b226:	48 b8 2f 1c 00 00 00 	movabs $0x1c2f,%rax
ffff80000010b22d:	00 00 00 
ffff80000010b230:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010b234:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010b239:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010b23e:	49 89 df             	mov    %rbx,%r15
ffff80000010b241:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010b246:	49 b8 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r8
ffff80000010b24d:	ff ff ff 
ffff80000010b250:	49 01 d8             	add    %rbx,%r8
ffff80000010b253:	41 ff d0             	callq  *%r8
ffff80000010b256:	be 20 00 00 00       	mov    $0x20,%esi
ffff80000010b25b:	bf 20 00 00 00       	mov    $0x20,%edi
ffff80000010b260:	49 89 df             	mov    %rbx,%r15
ffff80000010b263:	48 b8 fa b4 ff ff ff 	movabs $0xffffffffffffb4fa,%rax
ffff80000010b26a:	ff ff ff 
ffff80000010b26d:	48 01 d8             	add    %rbx,%rax
ffff80000010b270:	ff d0                	callq  *%rax
ffff80000010b272:	90                   	nop
ffff80000010b273:	48 83 c4 20          	add    $0x20,%rsp
ffff80000010b277:	5b                   	pop    %rbx
ffff80000010b278:	41 5f                	pop    %r15
ffff80000010b27a:	5d                   	pop    %rbp
ffff80000010b27b:	c3                   	retq   
ffff80000010b27c:	55                   	push   %rbp
ffff80000010b27d:	48 89 e5             	mov    %rsp,%rbp
ffff80000010b280:	53                   	push   %rbx
ffff80000010b281:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010b281 <do_IRQ+0xa7>
ffff80000010b288:	49 bb 67 3f 00 00 00 	movabs $0x3f67,%r11
ffff80000010b28f:	00 00 00 
ffff80000010b292:	4c 01 d8             	add    %r11,%rax
ffff80000010b295:	89 7d f4             	mov    %edi,-0xc(%rbp)
ffff80000010b298:	89 75 f0             	mov    %esi,-0x10(%rbp)
ffff80000010b29b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff80000010b29f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
ffff80000010b2a3:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
ffff80000010b2a7:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
ffff80000010b2ab:	8b 45 f4             	mov    -0xc(%rbp),%eax
ffff80000010b2ae:	8b 55 f0             	mov    -0x10(%rbp),%edx
ffff80000010b2b1:	89 d1                	mov    %edx,%ecx
ffff80000010b2b3:	0f a2                	cpuid  
ffff80000010b2b5:	89 de                	mov    %ebx,%esi
ffff80000010b2b7:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
ffff80000010b2bb:	89 07                	mov    %eax,(%rdi)
ffff80000010b2bd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010b2c1:	89 30                	mov    %esi,(%rax)
ffff80000010b2c3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010b2c7:	89 08                	mov    %ecx,(%rax)
ffff80000010b2c9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010b2cd:	89 10                	mov    %edx,(%rax)
ffff80000010b2cf:	90                   	nop
ffff80000010b2d0:	5b                   	pop    %rbx
ffff80000010b2d1:	5d                   	pop    %rbp
ffff80000010b2d2:	c3                   	retq   
ffff80000010b2d3:	55                   	push   %rbp
ffff80000010b2d4:	48 89 e5             	mov    %rsp,%rbp
ffff80000010b2d7:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010b2d7 <do_IRQ+0xfd>
ffff80000010b2de:	49 bb 11 3f 00 00 00 	movabs $0x3f11,%r11
ffff80000010b2e5:	00 00 00 
ffff80000010b2e8:	4c 01 d8             	add    %r11,%rax
ffff80000010b2eb:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
ffff80000010b2f2:	00 
ffff80000010b2f3:	48 c7 c0 00 80 ff ff 	mov    $0xffffffffffff8000,%rax
ffff80000010b2fa:	48 21 e0             	and    %rsp,%rax
ffff80000010b2fd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff80000010b301:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010b305:	5d                   	pop    %rbp
ffff80000010b306:	c3                   	retq   
ffff80000010b307:	55                   	push   %rbp
ffff80000010b308:	48 89 e5             	mov    %rsp,%rbp
ffff80000010b30b:	41 57                	push   %r15
ffff80000010b30d:	48 83 ec 18          	sub    $0x18,%rsp
ffff80000010b311:	4c 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%r8        # ffff80000010b311 <do_IRQ+0x137>
ffff80000010b318:	49 bb d7 3e 00 00 00 	movabs $0x3ed7,%r11
ffff80000010b31f:	00 00 00 
ffff80000010b322:	4d 01 d8             	add    %r11,%r8
ffff80000010b325:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff80000010b329:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010b32d:	48 8b 80 80 00 00 00 	mov    0x80(%rax),%rax
ffff80000010b334:	48 89 c1             	mov    %rax,%rcx
ffff80000010b337:	48 b8 40 1c 00 00 00 	movabs $0x1c40,%rax
ffff80000010b33e:	00 00 00 
ffff80000010b341:	49 8d 14 00          	lea    (%r8,%rax,1),%rdx
ffff80000010b345:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010b34a:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010b34f:	4d 89 c7             	mov    %r8,%r15
ffff80000010b352:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010b357:	49 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r9
ffff80000010b35e:	ff ff ff 
ffff80000010b361:	4d 01 c1             	add    %r8,%r9
ffff80000010b364:	41 ff d1             	callq  *%r9
ffff80000010b367:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffff80000010b36e:	48 83 c4 18          	add    $0x18,%rsp
ffff80000010b372:	41 5f                	pop    %r15
ffff80000010b374:	5d                   	pop    %rbp
ffff80000010b375:	c3                   	retq   
ffff80000010b376:	55                   	push   %rbp
ffff80000010b377:	48 89 e5             	mov    %rsp,%rbp
ffff80000010b37a:	41 57                	push   %r15
ffff80000010b37c:	48 83 ec 18          	sub    $0x18,%rsp
ffff80000010b380:	48 8d 0d f9 ff ff ff 	lea    -0x7(%rip),%rcx        # ffff80000010b380 <do_IRQ+0x1a6>
ffff80000010b387:	49 bb 68 3e 00 00 00 	movabs $0x3e68,%r11
ffff80000010b38e:	00 00 00 
ffff80000010b391:	4c 01 d9             	add    %r11,%rcx
ffff80000010b394:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff80000010b398:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010b39c:	48 8b 40 60          	mov    0x60(%rax),%rax
ffff80000010b3a0:	48 89 c2             	mov    %rax,%rdx
ffff80000010b3a3:	be ff ff ff 00       	mov    $0xffffff,%esi
ffff80000010b3a8:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010b3ad:	49 89 cf             	mov    %rcx,%r15
ffff80000010b3b0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010b3b5:	49 b8 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r8
ffff80000010b3bc:	ff ff ff 
ffff80000010b3bf:	49 01 c8             	add    %rcx,%r8
ffff80000010b3c2:	41 ff d0             	callq  *%r8
ffff80000010b3c5:	b8 01 00 00 00       	mov    $0x1,%eax
ffff80000010b3ca:	48 83 c4 18          	add    $0x18,%rsp
ffff80000010b3ce:	41 5f                	pop    %r15
ffff80000010b3d0:	5d                   	pop    %rbp
ffff80000010b3d1:	c3                   	retq   
ffff80000010b3d2:	55                   	push   %rbp
ffff80000010b3d3:	48 89 e5             	mov    %rsp,%rbp
ffff80000010b3d6:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010b3d6 <do_IRQ+0x1fc>
ffff80000010b3dd:	49 bb 12 3e 00 00 00 	movabs $0x3e12,%r11
ffff80000010b3e4:	00 00 00 
ffff80000010b3e7:	4c 01 d8             	add    %r11,%rax
ffff80000010b3ea:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
ffff80000010b3ee:	89 f9                	mov    %edi,%ecx
ffff80000010b3f0:	88 4d ec             	mov    %cl,-0x14(%rbp)
ffff80000010b3f3:	89 f1                	mov    %esi,%ecx
ffff80000010b3f5:	88 4d e8             	mov    %cl,-0x18(%rbp)
ffff80000010b3f8:	88 55 e4             	mov    %dl,-0x1c(%rbp)
ffff80000010b3fb:	0f b6 55 ec          	movzbl -0x14(%rbp),%edx
ffff80000010b3ff:	48 63 d2             	movslq %edx,%rdx
ffff80000010b402:	48 89 d1             	mov    %rdx,%rcx
ffff80000010b405:	48 c1 e1 04          	shl    $0x4,%rcx
ffff80000010b409:	48 ba 10 ff ff ff ff 	movabs $0xffffffffffffff10,%rdx
ffff80000010b410:	ff ff ff 
ffff80000010b413:	48 8b 04 10          	mov    (%rax,%rdx,1),%rax
ffff80000010b417:	48 01 c8             	add    %rcx,%rax
ffff80000010b41a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff80000010b41e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010b422:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff80000010b426:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010b42a:	89 c2                	mov    %eax,%edx
ffff80000010b42c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010b430:	66 89 10             	mov    %dx,(%rax)
ffff80000010b433:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010b437:	66 c7 40 02 08 00    	movw   $0x8,0x2(%rax)
ffff80000010b43d:	0f b6 45 e4          	movzbl -0x1c(%rbp),%eax
ffff80000010b441:	c1 e0 08             	shl    $0x8,%eax
ffff80000010b444:	89 c2                	mov    %eax,%edx
ffff80000010b446:	0f b6 45 e8          	movzbl -0x18(%rbp),%eax
ffff80000010b44a:	09 d0                	or     %edx,%eax
ffff80000010b44c:	89 c2                	mov    %eax,%edx
ffff80000010b44e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010b452:	66 89 50 04          	mov    %dx,0x4(%rax)
ffff80000010b456:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010b45a:	48 c1 e8 10          	shr    $0x10,%rax
ffff80000010b45e:	89 c2                	mov    %eax,%edx
ffff80000010b460:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010b464:	66 89 50 06          	mov    %dx,0x6(%rax)
ffff80000010b468:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010b46c:	48 c1 e8 20          	shr    $0x20,%rax
ffff80000010b470:	89 c2                	mov    %eax,%edx
ffff80000010b472:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010b476:	89 50 08             	mov    %edx,0x8(%rax)
ffff80000010b479:	90                   	nop
ffff80000010b47a:	5d                   	pop    %rbp
ffff80000010b47b:	c3                   	retq   
ffff80000010b47c:	55                   	push   %rbp
ffff80000010b47d:	48 89 e5             	mov    %rsp,%rbp
ffff80000010b480:	48 83 ec 10          	sub    $0x10,%rsp
ffff80000010b484:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010b484 <do_IRQ+0x2aa>
ffff80000010b48b:	49 bb 64 3d 00 00 00 	movabs $0x3d64,%r11
ffff80000010b492:	00 00 00 
ffff80000010b495:	4c 01 d8             	add    %r11,%rax
ffff80000010b498:	89 f1                	mov    %esi,%ecx
ffff80000010b49a:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff80000010b49e:	89 fa                	mov    %edi,%edx
ffff80000010b4a0:	88 55 fc             	mov    %dl,-0x4(%rbp)
ffff80000010b4a3:	89 ca                	mov    %ecx,%edx
ffff80000010b4a5:	88 55 f8             	mov    %dl,-0x8(%rbp)
ffff80000010b4a8:	0f b6 75 f8          	movzbl -0x8(%rbp),%esi
ffff80000010b4ac:	0f b6 7d fc          	movzbl -0x4(%rbp),%edi
ffff80000010b4b0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff80000010b4b4:	48 89 d1             	mov    %rdx,%rcx
ffff80000010b4b7:	ba 8e 00 00 00       	mov    $0x8e,%edx
ffff80000010b4bc:	49 b8 8f 50 ff ff ff 	movabs $0xffffffffffff508f,%r8
ffff80000010b4c3:	ff ff ff 
ffff80000010b4c6:	4a 8d 04 00          	lea    (%rax,%r8,1),%rax
ffff80000010b4ca:	ff d0                	callq  *%rax
ffff80000010b4cc:	90                   	nop
ffff80000010b4cd:	c9                   	leaveq 
ffff80000010b4ce:	c3                   	retq   
ffff80000010b4cf:	55                   	push   %rbp
ffff80000010b4d0:	48 89 e5             	mov    %rsp,%rbp
ffff80000010b4d3:	48 83 ec 10          	sub    $0x10,%rsp
ffff80000010b4d7:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010b4d7 <do_IRQ+0x2fd>
ffff80000010b4de:	49 bb 11 3d 00 00 00 	movabs $0x3d11,%r11
ffff80000010b4e5:	00 00 00 
ffff80000010b4e8:	4c 01 d8             	add    %r11,%rax
ffff80000010b4eb:	89 f1                	mov    %esi,%ecx
ffff80000010b4ed:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff80000010b4f1:	89 fa                	mov    %edi,%edx
ffff80000010b4f3:	88 55 fc             	mov    %dl,-0x4(%rbp)
ffff80000010b4f6:	89 ca                	mov    %ecx,%edx
ffff80000010b4f8:	88 55 f8             	mov    %dl,-0x8(%rbp)
ffff80000010b4fb:	0f b6 75 f8          	movzbl -0x8(%rbp),%esi
ffff80000010b4ff:	0f b6 7d fc          	movzbl -0x4(%rbp),%edi
ffff80000010b503:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff80000010b507:	48 89 d1             	mov    %rdx,%rcx
ffff80000010b50a:	ba 8f 00 00 00       	mov    $0x8f,%edx
ffff80000010b50f:	49 b8 8f 50 ff ff ff 	movabs $0xffffffffffff508f,%r8
ffff80000010b516:	ff ff ff 
ffff80000010b519:	4a 8d 04 00          	lea    (%rax,%r8,1),%rax
ffff80000010b51d:	ff d0                	callq  *%rax
ffff80000010b51f:	90                   	nop
ffff80000010b520:	c9                   	leaveq 
ffff80000010b521:	c3                   	retq   
ffff80000010b522:	55                   	push   %rbp
ffff80000010b523:	48 89 e5             	mov    %rsp,%rbp
ffff80000010b526:	48 83 ec 10          	sub    $0x10,%rsp
ffff80000010b52a:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010b52a <do_IRQ+0x350>
ffff80000010b531:	49 bb be 3c 00 00 00 	movabs $0x3cbe,%r11
ffff80000010b538:	00 00 00 
ffff80000010b53b:	4c 01 d8             	add    %r11,%rax
ffff80000010b53e:	89 f1                	mov    %esi,%ecx
ffff80000010b540:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff80000010b544:	89 fa                	mov    %edi,%edx
ffff80000010b546:	88 55 fc             	mov    %dl,-0x4(%rbp)
ffff80000010b549:	89 ca                	mov    %ecx,%edx
ffff80000010b54b:	88 55 f8             	mov    %dl,-0x8(%rbp)
ffff80000010b54e:	0f b6 75 f8          	movzbl -0x8(%rbp),%esi
ffff80000010b552:	0f b6 7d fc          	movzbl -0x4(%rbp),%edi
ffff80000010b556:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff80000010b55a:	48 89 d1             	mov    %rdx,%rcx
ffff80000010b55d:	ba ef 00 00 00       	mov    $0xef,%edx
ffff80000010b562:	49 b8 8f 50 ff ff ff 	movabs $0xffffffffffff508f,%r8
ffff80000010b569:	ff ff ff 
ffff80000010b56c:	4a 8d 04 00          	lea    (%rax,%r8,1),%rax
ffff80000010b570:	ff d0                	callq  *%rax
ffff80000010b572:	90                   	nop
ffff80000010b573:	c9                   	leaveq 
ffff80000010b574:	c3                   	retq   
ffff80000010b575:	55                   	push   %rbp
ffff80000010b576:	48 89 e5             	mov    %rsp,%rbp
ffff80000010b579:	48 83 ec 10          	sub    $0x10,%rsp
ffff80000010b57d:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010b57d <do_IRQ+0x3a3>
ffff80000010b584:	49 bb 6b 3c 00 00 00 	movabs $0x3c6b,%r11
ffff80000010b58b:	00 00 00 
ffff80000010b58e:	4c 01 d8             	add    %r11,%rax
ffff80000010b591:	89 f1                	mov    %esi,%ecx
ffff80000010b593:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff80000010b597:	89 fa                	mov    %edi,%edx
ffff80000010b599:	88 55 fc             	mov    %dl,-0x4(%rbp)
ffff80000010b59c:	89 ca                	mov    %ecx,%edx
ffff80000010b59e:	88 55 f8             	mov    %dl,-0x8(%rbp)
ffff80000010b5a1:	0f b6 75 f8          	movzbl -0x8(%rbp),%esi
ffff80000010b5a5:	0f b6 7d fc          	movzbl -0x4(%rbp),%edi
ffff80000010b5a9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff80000010b5ad:	48 89 d1             	mov    %rdx,%rcx
ffff80000010b5b0:	ba ee 00 00 00       	mov    $0xee,%edx
ffff80000010b5b5:	49 b8 8f 50 ff ff ff 	movabs $0xffffffffffff508f,%r8
ffff80000010b5bc:	ff ff ff 
ffff80000010b5bf:	4a 8d 04 00          	lea    (%rax,%r8,1),%rax
ffff80000010b5c3:	ff d0                	callq  *%rax
ffff80000010b5c5:	90                   	nop
ffff80000010b5c6:	c9                   	leaveq 
ffff80000010b5c7:	c3                   	retq   
ffff80000010b5c8:	55                   	push   %rbp
ffff80000010b5c9:	48 89 e5             	mov    %rsp,%rbp
ffff80000010b5cc:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010b5cc <do_IRQ+0x3f2>
ffff80000010b5d3:	49 bb 1c 3c 00 00 00 	movabs $0x3c1c,%r11
ffff80000010b5da:	00 00 00 
ffff80000010b5dd:	4c 01 d8             	add    %r11,%rax
ffff80000010b5e0:	89 7d fc             	mov    %edi,-0x4(%rbp)
ffff80000010b5e3:	89 75 f8             	mov    %esi,-0x8(%rbp)
ffff80000010b5e6:	89 55 f4             	mov    %edx,-0xc(%rbp)
ffff80000010b5e9:	89 4d f0             	mov    %ecx,-0x10(%rbp)
ffff80000010b5ec:	44 89 45 ec          	mov    %r8d,-0x14(%rbp)
ffff80000010b5f0:	44 89 4d e8          	mov    %r9d,-0x18(%rbp)
ffff80000010b5f4:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff80000010b5fb:	ff ff ff 
ffff80000010b5fe:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff80000010b602:	48 8d 52 04          	lea    0x4(%rdx),%rdx
ffff80000010b606:	8b 4d fc             	mov    -0x4(%rbp),%ecx
ffff80000010b609:	89 0a                	mov    %ecx,(%rdx)
ffff80000010b60b:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff80000010b612:	ff ff ff 
ffff80000010b615:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff80000010b619:	48 8d 52 0c          	lea    0xc(%rdx),%rdx
ffff80000010b61d:	8b 4d f8             	mov    -0x8(%rbp),%ecx
ffff80000010b620:	89 0a                	mov    %ecx,(%rdx)
ffff80000010b622:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff80000010b629:	ff ff ff 
ffff80000010b62c:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff80000010b630:	48 8d 52 14          	lea    0x14(%rdx),%rdx
ffff80000010b634:	8b 4d f4             	mov    -0xc(%rbp),%ecx
ffff80000010b637:	89 0a                	mov    %ecx,(%rdx)
ffff80000010b639:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff80000010b640:	ff ff ff 
ffff80000010b643:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff80000010b647:	48 8d 52 24          	lea    0x24(%rdx),%rdx
ffff80000010b64b:	8b 4d f0             	mov    -0x10(%rbp),%ecx
ffff80000010b64e:	89 0a                	mov    %ecx,(%rdx)
ffff80000010b650:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff80000010b657:	ff ff ff 
ffff80000010b65a:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff80000010b65e:	48 8d 52 2c          	lea    0x2c(%rdx),%rdx
ffff80000010b662:	8b 4d ec             	mov    -0x14(%rbp),%ecx
ffff80000010b665:	89 0a                	mov    %ecx,(%rdx)
ffff80000010b667:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff80000010b66e:	ff ff ff 
ffff80000010b671:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff80000010b675:	48 8d 52 34          	lea    0x34(%rdx),%rdx
ffff80000010b679:	8b 4d e8             	mov    -0x18(%rbp),%ecx
ffff80000010b67c:	89 0a                	mov    %ecx,(%rdx)
ffff80000010b67e:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff80000010b685:	ff ff ff 
ffff80000010b688:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff80000010b68c:	48 8d 52 3c          	lea    0x3c(%rdx),%rdx
ffff80000010b690:	8b 4d 10             	mov    0x10(%rbp),%ecx
ffff80000010b693:	89 0a                	mov    %ecx,(%rdx)
ffff80000010b695:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff80000010b69c:	ff ff ff 
ffff80000010b69f:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff80000010b6a3:	48 8d 52 44          	lea    0x44(%rdx),%rdx
ffff80000010b6a7:	8b 4d 18             	mov    0x18(%rbp),%ecx
ffff80000010b6aa:	89 0a                	mov    %ecx,(%rdx)
ffff80000010b6ac:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff80000010b6b3:	ff ff ff 
ffff80000010b6b6:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff80000010b6ba:	48 8d 52 4c          	lea    0x4c(%rdx),%rdx
ffff80000010b6be:	8b 4d 20             	mov    0x20(%rbp),%ecx
ffff80000010b6c1:	89 0a                	mov    %ecx,(%rdx)
ffff80000010b6c3:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff80000010b6ca:	ff ff ff 
ffff80000010b6cd:	48 8b 04 10          	mov    (%rax,%rdx,1),%rax
ffff80000010b6d1:	48 8d 40 54          	lea    0x54(%rax),%rax
ffff80000010b6d5:	8b 55 28             	mov    0x28(%rbp),%edx
ffff80000010b6d8:	89 10                	mov    %edx,(%rax)
ffff80000010b6da:	90                   	nop
ffff80000010b6db:	5d                   	pop    %rbp
ffff80000010b6dc:	c3                   	retq   

ffff80000010b6dd <user_level_function>:
ffff80000010b6dd:	55                   	push   %rbp
ffff80000010b6de:	48 89 e5             	mov    %rsp,%rbp
ffff80000010b6e1:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010b6e1 <user_level_function+0x4>
ffff80000010b6e8:	49 bb 07 3b 00 00 00 	movabs $0x3b07,%r11
ffff80000010b6ef:	00 00 00 
ffff80000010b6f2:	4c 01 d8             	add    %r11,%rax
ffff80000010b6f5:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
ffff80000010b6fc:	00 
ffff80000010b6fd:	48 b8 48 65 6c 6c 6f 	movabs $0x6f57206f6c6c6548,%rax
ffff80000010b704:	20 57 6f 
ffff80000010b707:	48 89 45 ea          	mov    %rax,-0x16(%rbp)
ffff80000010b70b:	c7 45 f2 72 6c 64 21 	movl   $0x21646c72,-0xe(%rbp)
ffff80000010b712:	66 c7 45 f6 0a 00    	movw   $0xa,-0xa(%rbp)
ffff80000010b718:	b8 01 00 00 00       	mov    $0x1,%eax
ffff80000010b71d:	48 8d 55 ea          	lea    -0x16(%rbp),%rdx
ffff80000010b721:	48 89 d7             	mov    %rdx,%rdi
ffff80000010b724:	48 8d 15 05 00 00 00 	lea    0x5(%rip),%rdx        # ffff80000010b730 <sysexit_return_address>
ffff80000010b72b:	48 89 e1             	mov    %rsp,%rcx
ffff80000010b72e:	0f 34                	sysenter 

ffff80000010b730 <sysexit_return_address>:
ffff80000010b730:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff80000010b734:	eb fe                	jmp    ffff80000010b734 <sysexit_return_address+0x4>

ffff80000010b736 <system_call_function>:
ffff80000010b736:	55                   	push   %rbp
ffff80000010b737:	48 89 e5             	mov    %rsp,%rbp
ffff80000010b73a:	48 83 ec 10          	sub    $0x10,%rsp
ffff80000010b73e:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010b73e <system_call_function+0x8>
ffff80000010b745:	49 bb aa 3a 00 00 00 	movabs $0x3aaa,%r11
ffff80000010b74c:	00 00 00 
ffff80000010b74f:	4c 01 d8             	add    %r11,%rax
ffff80000010b752:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff80000010b756:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff80000010b75a:	48 8b 92 80 00 00 00 	mov    0x80(%rdx),%rdx
ffff80000010b761:	48 b9 d8 03 00 00 00 	movabs $0x3d8,%rcx
ffff80000010b768:	00 00 00 
ffff80000010b76b:	48 01 c8             	add    %rcx,%rax
ffff80000010b76e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
ffff80000010b772:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff80000010b776:	48 89 d7             	mov    %rdx,%rdi
ffff80000010b779:	ff d0                	callq  *%rax
ffff80000010b77b:	c9                   	leaveq 
ffff80000010b77c:	c3                   	retq   

ffff80000010b77d <do_execve>:
ffff80000010b77d:	55                   	push   %rbp
ffff80000010b77e:	48 89 e5             	mov    %rsp,%rbp
ffff80000010b781:	41 57                	push   %r15
ffff80000010b783:	53                   	push   %rbx
ffff80000010b784:	48 83 ec 10          	sub    $0x10,%rsp
ffff80000010b788:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff80000010b788 <do_execve+0xb>
ffff80000010b78f:	49 bb 60 3a 00 00 00 	movabs $0x3a60,%r11
ffff80000010b796:	00 00 00 
ffff80000010b799:	4c 01 db             	add    %r11,%rbx
ffff80000010b79c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff80000010b7a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010b7a4:	48 c7 40 50 00 00 80 	movq   $0x800000,0x50(%rax)
ffff80000010b7ab:	00 
ffff80000010b7ac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010b7b0:	48 c7 40 48 00 00 a0 	movq   $0xa00000,0x48(%rax)
ffff80000010b7b7:	00 
ffff80000010b7b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010b7bc:	48 c7 80 80 00 00 00 	movq   $0x0,0x80(%rax)
ffff80000010b7c3:	00 00 00 00 
ffff80000010b7c7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010b7cb:	48 c7 40 70 00 00 00 	movq   $0x0,0x70(%rax)
ffff80000010b7d2:	00 
ffff80000010b7d3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010b7d7:	48 c7 40 78 00 00 00 	movq   $0x0,0x78(%rax)
ffff80000010b7de:	00 
ffff80000010b7df:	48 b8 61 1c 00 00 00 	movabs $0x1c61,%rax
ffff80000010b7e6:	00 00 00 
ffff80000010b7e9:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010b7ed:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010b7f2:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010b7f7:	49 89 df             	mov    %rbx,%r15
ffff80000010b7fa:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010b7ff:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff80000010b806:	ff ff ff 
ffff80000010b809:	48 01 d9             	add    %rbx,%rcx
ffff80000010b80c:	ff d1                	callq  *%rcx
ffff80000010b80e:	ba 00 04 00 00       	mov    $0x400,%edx
ffff80000010b813:	be 00 00 80 00       	mov    $0x800000,%esi
ffff80000010b818:	48 b8 f5 c4 ff ff ff 	movabs $0xffffffffffffc4f5,%rax
ffff80000010b81f:	ff ff ff 
ffff80000010b822:	48 8d 3c 03          	lea    (%rbx,%rax,1),%rdi
ffff80000010b826:	49 89 df             	mov    %rbx,%r15
ffff80000010b829:	48 b8 46 b4 ff ff ff 	movabs $0xffffffffffffb446,%rax
ffff80000010b830:	ff ff ff 
ffff80000010b833:	48 01 d8             	add    %rbx,%rax
ffff80000010b836:	ff d0                	callq  *%rax
ffff80000010b838:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010b83d:	48 83 c4 10          	add    $0x10,%rsp
ffff80000010b841:	5b                   	pop    %rbx
ffff80000010b842:	41 5f                	pop    %r15
ffff80000010b844:	5d                   	pop    %rbp
ffff80000010b845:	c3                   	retq   

ffff80000010b846 <kernel_thread_func>:
ffff80000010b846:	55                   	push   %rbp
ffff80000010b847:	48 89 e5             	mov    %rsp,%rbp
ffff80000010b84a:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010b84a <kernel_thread_func+0x4>
ffff80000010b851:	49 bb 9e 39 00 00 00 	movabs $0x399e,%r11
ffff80000010b858:	00 00 00 
ffff80000010b85b:	4c 01 d8             	add    %r11,%rax
ffff80000010b85e:	41 5f                	pop    %r15
ffff80000010b860:	41 5e                	pop    %r14
ffff80000010b862:	41 5d                	pop    %r13
ffff80000010b864:	41 5c                	pop    %r12
ffff80000010b866:	41 5b                	pop    %r11
ffff80000010b868:	41 5a                	pop    %r10
ffff80000010b86a:	41 59                	pop    %r9
ffff80000010b86c:	41 58                	pop    %r8
ffff80000010b86e:	5b                   	pop    %rbx
ffff80000010b86f:	59                   	pop    %rcx
ffff80000010b870:	5a                   	pop    %rdx
ffff80000010b871:	5e                   	pop    %rsi
ffff80000010b872:	5f                   	pop    %rdi
ffff80000010b873:	5d                   	pop    %rbp
ffff80000010b874:	58                   	pop    %rax
ffff80000010b875:	48 8e d8             	mov    %rax,%ds
ffff80000010b878:	58                   	pop    %rax
ffff80000010b879:	48 8e c0             	mov    %rax,%es
ffff80000010b87c:	58                   	pop    %rax
ffff80000010b87d:	48 83 c4 38          	add    $0x38,%rsp
ffff80000010b881:	48 89 cf             	mov    %rcx,%rdi
ffff80000010b884:	ff d1                	callq  *%rcx
ffff80000010b886:	48 89 c7             	mov    %rax,%rdi
ffff80000010b889:	e8 02 0a 00 00       	callq  ffff80000010c290 <do_exit>
ffff80000010b88e:	90                   	nop
ffff80000010b88f:	5d                   	pop    %rbp
ffff80000010b890:	c3                   	retq   

ffff80000010b891 <init>:
ffff80000010b891:	55                   	push   %rbp
ffff80000010b892:	48 89 e5             	mov    %rsp,%rbp
ffff80000010b895:	41 57                	push   %r15
ffff80000010b897:	41 54                	push   %r12
ffff80000010b899:	53                   	push   %rbx
ffff80000010b89a:	48 83 ec 28          	sub    $0x28,%rsp
ffff80000010b89e:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff80000010b89e <init+0xd>
ffff80000010b8a5:	49 bb 4a 39 00 00 00 	movabs $0x394a,%r11
ffff80000010b8ac:	00 00 00 
ffff80000010b8af:	4c 01 db             	add    %r11,%rbx
ffff80000010b8b2:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
ffff80000010b8b6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010b8ba:	48 89 c1             	mov    %rax,%rcx
ffff80000010b8bd:	48 b8 7c 1c 00 00 00 	movabs $0x1c7c,%rax
ffff80000010b8c4:	00 00 00 
ffff80000010b8c7:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010b8cb:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010b8d0:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010b8d5:	49 89 df             	mov    %rbx,%r15
ffff80000010b8d8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010b8dd:	49 b8 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r8
ffff80000010b8e4:	ff ff ff 
ffff80000010b8e7:	49 01 d8             	add    %rbx,%r8
ffff80000010b8ea:	41 ff d0             	callq  *%r8
ffff80000010b8ed:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010b8f2:	48 ba f1 53 ff ff ff 	movabs $0xffffffffffff53f1,%rdx
ffff80000010b8f9:	ff ff ff 
ffff80000010b8fc:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff80000010b900:	ff d2                	callq  *%rdx
ffff80000010b902:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff80000010b906:	48 ba f8 fe ff ff ff 	movabs $0xfffffffffffffef8,%rdx
ffff80000010b90d:	ff ff ff 
ffff80000010b910:	48 8b 14 13          	mov    (%rbx,%rdx,1),%rdx
ffff80000010b914:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff80000010b918:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010b91d:	48 ba f1 53 ff ff ff 	movabs $0xffffffffffff53f1,%rdx
ffff80000010b924:	ff ff ff 
ffff80000010b927:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff80000010b92b:	ff d2                	callq  *%rdx
ffff80000010b92d:	49 89 c4             	mov    %rax,%r12
ffff80000010b930:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010b935:	48 ba f1 53 ff ff ff 	movabs $0xffffffffffff53f1,%rdx
ffff80000010b93c:	ff ff ff 
ffff80000010b93f:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff80000010b943:	ff d2                	callq  *%rdx
ffff80000010b945:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff80000010b949:	49 8d 94 24 40 7f 00 	lea    0x7f40(%r12),%rdx
ffff80000010b950:	00 
ffff80000010b951:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff80000010b955:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010b95a:	48 ba f1 53 ff ff ff 	movabs $0xffffffffffff53f1,%rdx
ffff80000010b961:	ff ff ff 
ffff80000010b964:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff80000010b968:	ff d2                	callq  *%rdx
ffff80000010b96a:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff80000010b96e:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff80000010b972:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff80000010b976:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010b97b:	48 ba f1 53 ff ff ff 	movabs $0xffffffffffff53f1,%rdx
ffff80000010b982:	ff ff ff 
ffff80000010b985:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff80000010b989:	ff d2                	callq  *%rdx
ffff80000010b98b:	4c 8b 60 28          	mov    0x28(%rax),%r12
ffff80000010b98f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010b994:	48 ba f1 53 ff ff ff 	movabs $0xffffffffffff53f1,%rdx
ffff80000010b99b:	ff ff ff 
ffff80000010b99e:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff80000010b9a2:	ff d2                	callq  *%rdx
ffff80000010b9a4:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff80000010b9a8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010b9ac:	48 89 c7             	mov    %rax,%rdi
ffff80000010b9af:	49 8b 64 24 10       	mov    0x10(%r12),%rsp
ffff80000010b9b4:	ff 72 08             	pushq  0x8(%rdx)
ffff80000010b9b7:	e9 c1 fd ff ff       	jmpq   ffff80000010b77d <do_execve>
ffff80000010b9bc:	b8 01 00 00 00       	mov    $0x1,%eax
ffff80000010b9c1:	48 83 c4 28          	add    $0x28,%rsp
ffff80000010b9c5:	5b                   	pop    %rbx
ffff80000010b9c6:	41 5c                	pop    %r12
ffff80000010b9c8:	41 5f                	pop    %r15
ffff80000010b9ca:	5d                   	pop    %rbp
ffff80000010b9cb:	c3                   	retq   

ffff80000010b9cc <__switch_to>:
ffff80000010b9cc:	55                   	push   %rbp
ffff80000010b9cd:	48 89 e5             	mov    %rsp,%rbp
ffff80000010b9d0:	41 55                	push   %r13
ffff80000010b9d2:	41 54                	push   %r12
ffff80000010b9d4:	53                   	push   %rbx
ffff80000010b9d5:	48 83 ec 10          	sub    $0x10,%rsp
ffff80000010b9d9:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010b9d9 <__switch_to+0xd>
ffff80000010b9e0:	49 bb 0f 38 00 00 00 	movabs $0x380f,%r11
ffff80000010b9e7:	00 00 00 
ffff80000010b9ea:	4c 01 d8             	add    %r11,%rax
ffff80000010b9ed:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
ffff80000010b9f1:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
ffff80000010b9f5:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff80000010b9f9:	48 8b 52 28          	mov    0x28(%rdx),%rdx
ffff80000010b9fd:	48 8b 0a             	mov    (%rdx),%rcx
ffff80000010ba00:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff80000010ba07:	00 00 00 
ffff80000010ba0a:	48 89 4c 10 04       	mov    %rcx,0x4(%rax,%rdx,1)
ffff80000010ba0f:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff80000010ba16:	00 00 00 
ffff80000010ba19:	48 8b 54 10 54       	mov    0x54(%rax,%rdx,1),%rdx
ffff80000010ba1e:	89 d3                	mov    %edx,%ebx
ffff80000010ba20:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff80000010ba27:	00 00 00 
ffff80000010ba2a:	48 8b 54 10 4c       	mov    0x4c(%rax,%rdx,1),%rdx
ffff80000010ba2f:	41 89 d3             	mov    %edx,%r11d
ffff80000010ba32:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff80000010ba39:	00 00 00 
ffff80000010ba3c:	48 8b 54 10 44       	mov    0x44(%rax,%rdx,1),%rdx
ffff80000010ba41:	41 89 d1             	mov    %edx,%r9d
ffff80000010ba44:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff80000010ba4b:	00 00 00 
ffff80000010ba4e:	48 8b 54 10 3c       	mov    0x3c(%rax,%rdx,1),%rdx
ffff80000010ba53:	41 89 d0             	mov    %edx,%r8d
ffff80000010ba56:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff80000010ba5d:	00 00 00 
ffff80000010ba60:	48 8b 54 10 34       	mov    0x34(%rax,%rdx,1),%rdx
ffff80000010ba65:	41 89 d5             	mov    %edx,%r13d
ffff80000010ba68:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff80000010ba6f:	00 00 00 
ffff80000010ba72:	48 8b 54 10 2c       	mov    0x2c(%rax,%rdx,1),%rdx
ffff80000010ba77:	41 89 d4             	mov    %edx,%r12d
ffff80000010ba7a:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff80000010ba81:	00 00 00 
ffff80000010ba84:	48 8b 54 10 24       	mov    0x24(%rax,%rdx,1),%rdx
ffff80000010ba89:	89 d1                	mov    %edx,%ecx
ffff80000010ba8b:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff80000010ba92:	00 00 00 
ffff80000010ba95:	48 8b 54 10 14       	mov    0x14(%rax,%rdx,1),%rdx
ffff80000010ba9a:	41 89 d2             	mov    %edx,%r10d
ffff80000010ba9d:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff80000010baa4:	00 00 00 
ffff80000010baa7:	48 8b 54 10 0c       	mov    0xc(%rax,%rdx,1),%rdx
ffff80000010baac:	89 d6                	mov    %edx,%esi
ffff80000010baae:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff80000010bab5:	00 00 00 
ffff80000010bab8:	48 8b 54 10 04       	mov    0x4(%rax,%rdx,1),%rdx
ffff80000010babd:	89 d7                	mov    %edx,%edi
ffff80000010babf:	53                   	push   %rbx
ffff80000010bac0:	41 53                	push   %r11
ffff80000010bac2:	41 51                	push   %r9
ffff80000010bac4:	41 50                	push   %r8
ffff80000010bac6:	45 89 e9             	mov    %r13d,%r9d
ffff80000010bac9:	45 89 e0             	mov    %r12d,%r8d
ffff80000010bacc:	44 89 d2             	mov    %r10d,%edx
ffff80000010bacf:	49 ba 85 52 ff ff ff 	movabs $0xffffffffffff5285,%r10
ffff80000010bad6:	ff ff ff 
ffff80000010bad9:	4a 8d 04 10          	lea    (%rax,%r10,1),%rax
ffff80000010badd:	ff d0                	callq  *%rax
ffff80000010badf:	48 83 c4 20          	add    $0x20,%rsp
ffff80000010bae3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010bae7:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff80000010baeb:	48 8c e0             	mov    %fs,%rax
ffff80000010baee:	48 89 42 18          	mov    %rax,0x18(%rdx)
ffff80000010baf2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010baf6:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff80000010bafa:	48 8c e8             	mov    %gs,%rax
ffff80000010bafd:	48 89 42 20          	mov    %rax,0x20(%rdx)
ffff80000010bb01:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010bb05:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff80000010bb09:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff80000010bb0d:	48 8e e0             	mov    %rax,%fs
ffff80000010bb10:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010bb14:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff80000010bb18:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff80000010bb1c:	48 8e e8             	mov    %rax,%gs
ffff80000010bb1f:	90                   	nop
ffff80000010bb20:	48 8d 65 e8          	lea    -0x18(%rbp),%rsp
ffff80000010bb24:	5b                   	pop    %rbx
ffff80000010bb25:	41 5c                	pop    %r12
ffff80000010bb27:	41 5d                	pop    %r13
ffff80000010bb29:	5d                   	pop    %rbp
ffff80000010bb2a:	c3                   	retq   

ffff80000010bb2b <task_init>:
ffff80000010bb2b:	55                   	push   %rbp
ffff80000010bb2c:	48 89 e5             	mov    %rsp,%rbp
ffff80000010bb2f:	41 57                	push   %r15
ffff80000010bb31:	41 56                	push   %r14
ffff80000010bb33:	41 55                	push   %r13
ffff80000010bb35:	41 54                	push   %r12
ffff80000010bb37:	53                   	push   %rbx
ffff80000010bb38:	48 83 ec 18          	sub    $0x18,%rsp
ffff80000010bb3c:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff80000010bb3c <task_init+0x11>
ffff80000010bb43:	49 bb ac 36 00 00 00 	movabs $0x36ac,%r11
ffff80000010bb4a:	00 00 00 
ffff80000010bb4d:	4c 01 db             	add    %r11,%rbx
ffff80000010bb50:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
ffff80000010bb57:	00 
ffff80000010bb58:	48 b8 28 8e 01 00 00 	movabs $0x18e28,%rax
ffff80000010bb5f:	00 00 00 
ffff80000010bb62:	48 8b 14 03          	mov    (%rbx,%rax,1),%rdx
ffff80000010bb66:	48 b8 38 8e 01 00 00 	movabs $0x18e38,%rax
ffff80000010bb6d:	00 00 00 
ffff80000010bb70:	48 89 14 03          	mov    %rdx,(%rbx,%rax,1)
ffff80000010bb74:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010bb7b:	ff ff ff 
ffff80000010bb7e:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010bb82:	48 8b 90 d0 02 00 00 	mov    0x2d0(%rax),%rdx
ffff80000010bb89:	48 b8 38 8e 01 00 00 	movabs $0x18e38,%rax
ffff80000010bb90:	00 00 00 
ffff80000010bb93:	48 89 54 03 08       	mov    %rdx,0x8(%rbx,%rax,1)
ffff80000010bb98:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010bb9f:	ff ff ff 
ffff80000010bba2:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010bba6:	48 8b 90 d8 02 00 00 	mov    0x2d8(%rax),%rdx
ffff80000010bbad:	48 b8 38 8e 01 00 00 	movabs $0x18e38,%rax
ffff80000010bbb4:	00 00 00 
ffff80000010bbb7:	48 89 54 03 10       	mov    %rdx,0x10(%rbx,%rax,1)
ffff80000010bbbc:	48 b8 a0 ff ff ff ff 	movabs $0xffffffffffffffa0,%rax
ffff80000010bbc3:	ff ff ff 
ffff80000010bbc6:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010bbca:	48 89 c2             	mov    %rax,%rdx
ffff80000010bbcd:	48 b8 38 8e 01 00 00 	movabs $0x18e38,%rax
ffff80000010bbd4:	00 00 00 
ffff80000010bbd7:	48 89 54 03 18       	mov    %rdx,0x18(%rbx,%rax,1)
ffff80000010bbdc:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010bbe3:	ff ff ff 
ffff80000010bbe6:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010bbea:	48 8b 90 e0 02 00 00 	mov    0x2e0(%rax),%rdx
ffff80000010bbf1:	48 b8 38 8e 01 00 00 	movabs $0x18e38,%rax
ffff80000010bbf8:	00 00 00 
ffff80000010bbfb:	48 89 54 03 20       	mov    %rdx,0x20(%rbx,%rax,1)
ffff80000010bc00:	48 b8 58 ff ff ff ff 	movabs $0xffffffffffffff58,%rax
ffff80000010bc07:	ff ff ff 
ffff80000010bc0a:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010bc0e:	48 89 c2             	mov    %rax,%rdx
ffff80000010bc11:	48 b8 38 8e 01 00 00 	movabs $0x18e38,%rax
ffff80000010bc18:	00 00 00 
ffff80000010bc1b:	48 89 54 03 28       	mov    %rdx,0x28(%rbx,%rax,1)
ffff80000010bc20:	48 b8 f8 ff ff ff ff 	movabs $0xfffffffffffffff8,%rax
ffff80000010bc27:	ff ff ff 
ffff80000010bc2a:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010bc2e:	48 89 c2             	mov    %rax,%rdx
ffff80000010bc31:	48 b8 38 8e 01 00 00 	movabs $0x18e38,%rax
ffff80000010bc38:	00 00 00 
ffff80000010bc3b:	48 89 54 03 30       	mov    %rdx,0x30(%rbx,%rax,1)
ffff80000010bc40:	48 b8 38 8e 01 00 00 	movabs $0x18e38,%rax
ffff80000010bc47:	00 00 00 
ffff80000010bc4a:	48 c7 44 03 38 00 00 	movq   $0x0,0x38(%rbx,%rax,1)
ffff80000010bc51:	00 00 
ffff80000010bc53:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010bc5a:	ff ff ff 
ffff80000010bc5d:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010bc61:	48 8b 90 e8 02 00 00 	mov    0x2e8(%rax),%rdx
ffff80000010bc68:	48 b8 38 8e 01 00 00 	movabs $0x18e38,%rax
ffff80000010bc6f:	00 00 00 
ffff80000010bc72:	48 89 54 03 40       	mov    %rdx,0x40(%rbx,%rax,1)
ffff80000010bc77:	48 b8 90 ff ff ff ff 	movabs $0xffffffffffffff90,%rax
ffff80000010bc7e:	ff ff ff 
ffff80000010bc81:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010bc85:	48 8b 10             	mov    (%rax),%rdx
ffff80000010bc88:	48 b8 38 8e 01 00 00 	movabs $0x18e38,%rax
ffff80000010bc8f:	00 00 00 
ffff80000010bc92:	48 89 54 03 48       	mov    %rdx,0x48(%rbx,%rax,1)
ffff80000010bc97:	be 08 00 00 00       	mov    $0x8,%esi
ffff80000010bc9c:	bf 74 01 00 00       	mov    $0x174,%edi
ffff80000010bca1:	49 89 df             	mov    %rbx,%r15
ffff80000010bca4:	48 b8 0a b7 ff ff ff 	movabs $0xffffffffffffb70a,%rax
ffff80000010bcab:	ff ff ff 
ffff80000010bcae:	48 01 d8             	add    %rbx,%rax
ffff80000010bcb1:	ff d0                	callq  *%rax
ffff80000010bcb3:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010bcb8:	48 ba f1 53 ff ff ff 	movabs $0xffffffffffff53f1,%rdx
ffff80000010bcbf:	ff ff ff 
ffff80000010bcc2:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff80000010bcc6:	ff d2                	callq  *%rdx
ffff80000010bcc8:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff80000010bccc:	48 8b 00             	mov    (%rax),%rax
ffff80000010bccf:	48 89 c6             	mov    %rax,%rsi
ffff80000010bcd2:	bf 75 01 00 00       	mov    $0x175,%edi
ffff80000010bcd7:	49 89 df             	mov    %rbx,%r15
ffff80000010bcda:	48 b8 0a b7 ff ff ff 	movabs $0xffffffffffffb70a,%rax
ffff80000010bce1:	ff ff ff 
ffff80000010bce4:	48 01 d8             	add    %rbx,%rax
ffff80000010bce7:	ff d0                	callq  *%rax
ffff80000010bce9:	48 b8 e0 ff ff ff ff 	movabs $0xffffffffffffffe0,%rax
ffff80000010bcf0:	ff ff ff 
ffff80000010bcf3:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010bcf7:	48 89 c6             	mov    %rax,%rsi
ffff80000010bcfa:	bf 76 01 00 00       	mov    $0x176,%edi
ffff80000010bcff:	49 89 df             	mov    %rbx,%r15
ffff80000010bd02:	48 b8 0a b7 ff ff ff 	movabs $0xffffffffffffb70a,%rax
ffff80000010bd09:	ff ff ff 
ffff80000010bd0c:	48 01 d8             	add    %rbx,%rax
ffff80000010bd0f:	ff d0                	callq  *%rax
ffff80000010bd11:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff80000010bd18:	00 00 00 
ffff80000010bd1b:	48 8b 44 03 54       	mov    0x54(%rbx,%rax,1),%rax
ffff80000010bd20:	41 89 c2             	mov    %eax,%r10d
ffff80000010bd23:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff80000010bd2a:	00 00 00 
ffff80000010bd2d:	48 8b 44 03 4c       	mov    0x4c(%rbx,%rax,1),%rax
ffff80000010bd32:	41 89 c1             	mov    %eax,%r9d
ffff80000010bd35:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff80000010bd3c:	00 00 00 
ffff80000010bd3f:	48 8b 44 03 44       	mov    0x44(%rbx,%rax,1),%rax
ffff80000010bd44:	41 89 c0             	mov    %eax,%r8d
ffff80000010bd47:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff80000010bd4e:	00 00 00 
ffff80000010bd51:	48 8b 44 03 3c       	mov    0x3c(%rbx,%rax,1),%rax
ffff80000010bd56:	89 c7                	mov    %eax,%edi
ffff80000010bd58:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff80000010bd5f:	00 00 00 
ffff80000010bd62:	48 8b 44 03 34       	mov    0x34(%rbx,%rax,1),%rax
ffff80000010bd67:	41 89 c4             	mov    %eax,%r12d
ffff80000010bd6a:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff80000010bd71:	00 00 00 
ffff80000010bd74:	48 8b 44 03 2c       	mov    0x2c(%rbx,%rax,1),%rax
ffff80000010bd79:	41 89 c3             	mov    %eax,%r11d
ffff80000010bd7c:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff80000010bd83:	00 00 00 
ffff80000010bd86:	48 8b 44 03 24       	mov    0x24(%rbx,%rax,1),%rax
ffff80000010bd8b:	89 c1                	mov    %eax,%ecx
ffff80000010bd8d:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff80000010bd94:	00 00 00 
ffff80000010bd97:	48 8b 44 03 14       	mov    0x14(%rbx,%rax,1),%rax
ffff80000010bd9c:	89 c2                	mov    %eax,%edx
ffff80000010bd9e:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff80000010bda5:	00 00 00 
ffff80000010bda8:	48 8b 44 03 0c       	mov    0xc(%rbx,%rax,1),%rax
ffff80000010bdad:	89 c6                	mov    %eax,%esi
ffff80000010bdaf:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff80000010bdb6:	00 00 00 
ffff80000010bdb9:	48 8b 44 03 04       	mov    0x4(%rbx,%rax,1),%rax
ffff80000010bdbe:	41 52                	push   %r10
ffff80000010bdc0:	41 51                	push   %r9
ffff80000010bdc2:	41 50                	push   %r8
ffff80000010bdc4:	57                   	push   %rdi
ffff80000010bdc5:	45 89 e1             	mov    %r12d,%r9d
ffff80000010bdc8:	45 89 d8             	mov    %r11d,%r8d
ffff80000010bdcb:	89 c7                	mov    %eax,%edi
ffff80000010bdcd:	48 b8 85 52 ff ff ff 	movabs $0xffffffffffff5285,%rax
ffff80000010bdd4:	ff ff ff 
ffff80000010bdd7:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff80000010bddb:	ff d0                	callq  *%rax
ffff80000010bddd:	48 83 c4 20          	add    $0x20,%rsp
ffff80000010bde1:	48 b8 18 00 00 00 00 	movabs $0x18,%rax
ffff80000010bde8:	00 00 00 
ffff80000010bdeb:	48 8b 14 03          	mov    (%rbx,%rax,1),%rdx
ffff80000010bdef:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff80000010bdf6:	00 00 00 
ffff80000010bdf9:	48 89 54 03 04       	mov    %rdx,0x4(%rbx,%rax,1)
ffff80000010bdfe:	48 b8 18 8e 00 00 00 	movabs $0x8e18,%rax
ffff80000010be05:	00 00 00 
ffff80000010be08:	48 8d 3c 03          	lea    (%rbx,%rax,1),%rdi
ffff80000010be0c:	49 89 df             	mov    %rbx,%r15
ffff80000010be0f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010be14:	48 ba 61 b5 ff ff ff 	movabs $0xffffffffffffb561,%rdx
ffff80000010be1b:	ff ff ff 
ffff80000010be1e:	48 01 da             	add    %rbx,%rdx
ffff80000010be21:	ff d2                	callq  *%rdx
ffff80000010be23:	ba 07 00 00 00       	mov    $0x7,%edx
ffff80000010be28:	be 0a 00 00 00       	mov    $0xa,%esi
ffff80000010be2d:	48 b8 a9 c6 ff ff ff 	movabs $0xffffffffffffc6a9,%rax
ffff80000010be34:	ff ff ff 
ffff80000010be37:	48 8d 3c 03          	lea    (%rbx,%rax,1),%rdi
ffff80000010be3b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010be40:	48 b9 4e cd ff ff ff 	movabs $0xffffffffffffcd4e,%rcx
ffff80000010be47:	ff ff ff 
ffff80000010be4a:	48 8d 0c 0b          	lea    (%rbx,%rcx,1),%rcx
ffff80000010be4e:	ff d1                	callq  *%rcx
ffff80000010be50:	48 b8 18 8e 00 00 00 	movabs $0x8e18,%rax
ffff80000010be57:	00 00 00 
ffff80000010be5a:	48 c7 44 03 10 01 00 	movq   $0x1,0x10(%rbx,%rax,1)
ffff80000010be61:	00 00 
ffff80000010be63:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010be68:	48 ba f1 53 ff ff ff 	movabs $0xffffffffffff53f1,%rdx
ffff80000010be6f:	ff ff ff 
ffff80000010be72:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff80000010be76:	ff d2                	callq  *%rdx
ffff80000010be78:	48 89 c7             	mov    %rax,%rdi
ffff80000010be7b:	49 89 df             	mov    %rbx,%r15
ffff80000010be7e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010be83:	48 ba d0 b6 ff ff ff 	movabs $0xffffffffffffb6d0,%rdx
ffff80000010be8a:	ff ff ff 
ffff80000010be8d:	48 01 da             	add    %rbx,%rdx
ffff80000010be90:	ff d2                	callq  *%rdx
ffff80000010be92:	48 98                	cltq   
ffff80000010be94:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
ffff80000010be98:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff80000010be9c:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff80000010bea0:	90                   	nop
ffff80000010bea1:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010bea6:	48 ba f1 53 ff ff ff 	movabs $0xffffffffffff53f1,%rdx
ffff80000010bead:	ff ff ff 
ffff80000010beb0:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff80000010beb4:	ff d2                	callq  *%rdx
ffff80000010beb6:	4c 8b 60 28          	mov    0x28(%rax),%r12
ffff80000010beba:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010bebf:	48 ba f1 53 ff ff ff 	movabs $0xffffffffffff53f1,%rdx
ffff80000010bec6:	ff ff ff 
ffff80000010bec9:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff80000010becd:	ff d2                	callq  *%rdx
ffff80000010becf:	4c 8b 78 28          	mov    0x28(%rax),%r15
ffff80000010bed3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010bed7:	4c 8b 68 28          	mov    0x28(%rax),%r13
ffff80000010bedb:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010bedf:	4c 8b 70 28          	mov    0x28(%rax),%r14
ffff80000010bee3:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010bee8:	48 ba f1 53 ff ff ff 	movabs $0xffffffffffff53f1,%rdx
ffff80000010beef:	ff ff ff 
ffff80000010bef2:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff80000010bef6:	ff d2                	callq  *%rdx
ffff80000010bef8:	48 89 c2             	mov    %rax,%rdx
ffff80000010befb:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010beff:	48 89 d7             	mov    %rdx,%rdi
ffff80000010bf02:	48 89 c6             	mov    %rax,%rsi
ffff80000010bf05:	55                   	push   %rbp
ffff80000010bf06:	50                   	push   %rax
ffff80000010bf07:	49 89 64 24 10       	mov    %rsp,0x10(%r12)
ffff80000010bf0c:	49 8b 65 10          	mov    0x10(%r13),%rsp
ffff80000010bf10:	48 8d 05 0d 00 00 00 	lea    0xd(%rip),%rax        # ffff80000010bf24 <task_init+0x3f9>
ffff80000010bf17:	49 89 47 08          	mov    %rax,0x8(%r15)
ffff80000010bf1b:	41 ff 76 08          	pushq  0x8(%r14)
ffff80000010bf1f:	e9 a8 fa ff ff       	jmpq   ffff80000010b9cc <__switch_to>
ffff80000010bf24:	58                   	pop    %rax
ffff80000010bf25:	5d                   	pop    %rbp
ffff80000010bf26:	90                   	nop
ffff80000010bf27:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
ffff80000010bf2b:	5b                   	pop    %rbx
ffff80000010bf2c:	41 5c                	pop    %r12
ffff80000010bf2e:	41 5d                	pop    %r13
ffff80000010bf30:	41 5e                	pop    %r14
ffff80000010bf32:	41 5f                	pop    %r15
ffff80000010bf34:	5d                   	pop    %rbp
ffff80000010bf35:	c3                   	retq   

ffff80000010bf36 <kernel_thread>:
ffff80000010bf36:	55                   	push   %rbp
ffff80000010bf37:	48 89 e5             	mov    %rsp,%rbp
ffff80000010bf3a:	41 57                	push   %r15
ffff80000010bf3c:	53                   	push   %rbx
ffff80000010bf3d:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
ffff80000010bf44:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff80000010bf44 <kernel_thread+0xe>
ffff80000010bf4b:	49 bb a4 32 00 00 00 	movabs $0x32a4,%r11
ffff80000010bf52:	00 00 00 
ffff80000010bf55:	4c 01 db             	add    %r11,%rbx
ffff80000010bf58:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
ffff80000010bf5f:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
ffff80000010bf66:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
ffff80000010bf6d:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
ffff80000010bf74:	ba c0 00 00 00       	mov    $0xc0,%edx
ffff80000010bf79:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010bf7e:	48 89 c7             	mov    %rax,%rdi
ffff80000010bf81:	49 89 df             	mov    %rbx,%r15
ffff80000010bf84:	48 b8 ef b3 ff ff ff 	movabs $0xffffffffffffb3ef,%rax
ffff80000010bf8b:	ff ff ff 
ffff80000010bf8e:	48 01 d8             	add    %rbx,%rax
ffff80000010bf91:	ff d0                	callq  *%rax
ffff80000010bf93:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
ffff80000010bf9a:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
ffff80000010bfa1:	48 8b 85 20 ff ff ff 	mov    -0xe0(%rbp),%rax
ffff80000010bfa8:	48 89 45 80          	mov    %rax,-0x80(%rbp)
ffff80000010bfac:	48 c7 45 a0 10 00 00 	movq   $0x10,-0x60(%rbp)
ffff80000010bfb3:	00 
ffff80000010bfb4:	48 c7 45 a8 10 00 00 	movq   $0x10,-0x58(%rbp)
ffff80000010bfbb:	00 
ffff80000010bfbc:	48 c7 45 d0 08 00 00 	movq   $0x8,-0x30(%rbp)
ffff80000010bfc3:	00 
ffff80000010bfc4:	48 c7 45 e8 10 00 00 	movq   $0x10,-0x18(%rbp)
ffff80000010bfcb:	00 
ffff80000010bfcc:	48 c7 45 d8 00 02 00 	movq   $0x200,-0x28(%rbp)
ffff80000010bfd3:	00 
ffff80000010bfd4:	48 b8 5e c6 ff ff ff 	movabs $0xffffffffffffc65e,%rax
ffff80000010bfdb:	ff ff ff 
ffff80000010bfde:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff80000010bfe2:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff80000010bfe6:	48 8b b5 18 ff ff ff 	mov    -0xe8(%rbp),%rsi
ffff80000010bfed:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
ffff80000010bff4:	b9 00 00 00 00       	mov    $0x0,%ecx
ffff80000010bff9:	ba 00 00 00 00       	mov    $0x0,%edx
ffff80000010bffe:	48 89 c7             	mov    %rax,%rdi
ffff80000010c001:	48 b8 35 ce ff ff ff 	movabs $0xffffffffffffce35,%rax
ffff80000010c008:	ff ff ff 
ffff80000010c00b:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff80000010c00f:	ff d0                	callq  *%rax
ffff80000010c011:	48 81 c4 e0 00 00 00 	add    $0xe0,%rsp
ffff80000010c018:	5b                   	pop    %rbx
ffff80000010c019:	41 5f                	pop    %r15
ffff80000010c01b:	5d                   	pop    %rbp
ffff80000010c01c:	c3                   	retq   

ffff80000010c01d <do_fork>:
ffff80000010c01d:	55                   	push   %rbp
ffff80000010c01e:	48 89 e5             	mov    %rsp,%rbp
ffff80000010c021:	41 57                	push   %r15
ffff80000010c023:	53                   	push   %rbx
ffff80000010c024:	48 83 ec 40          	sub    $0x40,%rsp
ffff80000010c028:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff80000010c028 <do_fork+0xb>
ffff80000010c02f:	49 bb c0 31 00 00 00 	movabs $0x31c0,%r11
ffff80000010c036:	00 00 00 
ffff80000010c039:	4c 01 db             	add    %r11,%rbx
ffff80000010c03c:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
ffff80000010c040:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
ffff80000010c044:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
ffff80000010c048:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
ffff80000010c04c:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff80000010c053:	00 
ffff80000010c054:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
ffff80000010c05b:	00 
ffff80000010c05c:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
ffff80000010c063:	00 
ffff80000010c064:	ba 91 00 00 00       	mov    $0x91,%edx
ffff80000010c069:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010c06e:	bf 02 00 00 00       	mov    $0x2,%edi
ffff80000010c073:	49 89 df             	mov    %rbx,%r15
ffff80000010c076:	48 b8 36 87 ff ff ff 	movabs $0xffffffffffff8736,%rax
ffff80000010c07d:	ff ff ff 
ffff80000010c080:	48 01 d8             	add    %rbx,%rax
ffff80000010c083:	ff d0                	callq  *%rax
ffff80000010c085:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff80000010c089:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010c08d:	48 8b 50 08          	mov    0x8(%rax),%rdx
ffff80000010c091:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff80000010c098:	80 ff ff 
ffff80000010c09b:	48 01 d0             	add    %rdx,%rax
ffff80000010c09e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff80000010c0a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010c0a6:	ba 08 00 00 00       	mov    $0x8,%edx
ffff80000010c0ab:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010c0b0:	48 89 c7             	mov    %rax,%rdi
ffff80000010c0b3:	49 89 df             	mov    %rbx,%r15
ffff80000010c0b6:	48 b8 ef b3 ff ff ff 	movabs $0xffffffffffffb3ef,%rax
ffff80000010c0bd:	ff ff ff 
ffff80000010c0c0:	48 01 d8             	add    %rbx,%rax
ffff80000010c0c3:	ff d0                	callq  *%rax
ffff80000010c0c5:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010c0ca:	48 ba f1 53 ff ff ff 	movabs $0xffffffffffff53f1,%rdx
ffff80000010c0d1:	ff ff ff 
ffff80000010c0d4:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff80000010c0d8:	ff d2                	callq  *%rdx
ffff80000010c0da:	48 89 c2             	mov    %rax,%rdx
ffff80000010c0dd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010c0e1:	48 8b 32             	mov    (%rdx),%rsi
ffff80000010c0e4:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
ffff80000010c0e8:	48 89 30             	mov    %rsi,(%rax)
ffff80000010c0eb:	48 89 78 08          	mov    %rdi,0x8(%rax)
ffff80000010c0ef:	48 8b 72 10          	mov    0x10(%rdx),%rsi
ffff80000010c0f3:	48 8b 7a 18          	mov    0x18(%rdx),%rdi
ffff80000010c0f7:	48 89 70 10          	mov    %rsi,0x10(%rax)
ffff80000010c0fb:	48 89 78 18          	mov    %rdi,0x18(%rax)
ffff80000010c0ff:	48 8b 72 20          	mov    0x20(%rdx),%rsi
ffff80000010c103:	48 8b 7a 28          	mov    0x28(%rdx),%rdi
ffff80000010c107:	48 89 70 20          	mov    %rsi,0x20(%rax)
ffff80000010c10b:	48 89 78 28          	mov    %rdi,0x28(%rax)
ffff80000010c10f:	48 8b 72 30          	mov    0x30(%rdx),%rsi
ffff80000010c113:	48 8b 7a 38          	mov    0x38(%rdx),%rdi
ffff80000010c117:	48 89 70 30          	mov    %rsi,0x30(%rax)
ffff80000010c11b:	48 89 78 38          	mov    %rdi,0x38(%rax)
ffff80000010c11f:	48 8b 72 40          	mov    0x40(%rdx),%rsi
ffff80000010c123:	48 8b 7a 48          	mov    0x48(%rdx),%rdi
ffff80000010c127:	48 89 70 40          	mov    %rsi,0x40(%rax)
ffff80000010c12b:	48 89 78 48          	mov    %rdi,0x48(%rax)
ffff80000010c12f:	48 8b 52 50          	mov    0x50(%rdx),%rdx
ffff80000010c133:	48 89 50 50          	mov    %rdx,0x50(%rax)
ffff80000010c137:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010c13b:	48 89 c7             	mov    %rax,%rdi
ffff80000010c13e:	49 89 df             	mov    %rbx,%r15
ffff80000010c141:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010c146:	48 ba 61 b5 ff ff ff 	movabs $0xffffffffffffb561,%rdx
ffff80000010c14d:	ff ff ff 
ffff80000010c150:	48 01 da             	add    %rbx,%rdx
ffff80000010c153:	ff d2                	callq  *%rdx
ffff80000010c155:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010c159:	48 89 c6             	mov    %rax,%rsi
ffff80000010c15c:	48 b8 18 8e 00 00 00 	movabs $0x8e18,%rax
ffff80000010c163:	00 00 00 
ffff80000010c166:	48 8d 3c 03          	lea    (%rbx,%rax,1),%rdi
ffff80000010c16a:	49 89 df             	mov    %rbx,%r15
ffff80000010c16d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010c172:	48 ba f0 b5 ff ff ff 	movabs $0xffffffffffffb5f0,%rdx
ffff80000010c179:	ff ff ff 
ffff80000010c17c:	48 01 da             	add    %rbx,%rdx
ffff80000010c17f:	ff d2                	callq  *%rdx
ffff80000010c181:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010c185:	48 8b 40 38          	mov    0x38(%rax),%rax
ffff80000010c189:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff80000010c18d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010c191:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff80000010c195:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010c199:	48 c7 40 10 04 00 00 	movq   $0x4,0x10(%rax)
ffff80000010c1a0:	00 
ffff80000010c1a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010c1a5:	48 83 c0 58          	add    $0x58,%rax
ffff80000010c1a9:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff80000010c1ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010c1b1:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
ffff80000010c1b5:	48 89 50 28          	mov    %rdx,0x28(%rax)
ffff80000010c1b9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010c1bd:	48 05 40 7f 00 00    	add    $0x7f40,%rax
ffff80000010c1c3:	48 89 c1             	mov    %rax,%rcx
ffff80000010c1c6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010c1ca:	ba c0 00 00 00       	mov    $0xc0,%edx
ffff80000010c1cf:	48 89 ce             	mov    %rcx,%rsi
ffff80000010c1d2:	48 89 c7             	mov    %rax,%rdi
ffff80000010c1d5:	49 89 df             	mov    %rbx,%r15
ffff80000010c1d8:	48 b8 46 b4 ff ff ff 	movabs $0xffffffffffffb446,%rax
ffff80000010c1df:	ff ff ff 
ffff80000010c1e2:	48 01 d8             	add    %rbx,%rax
ffff80000010c1e5:	ff d0                	callq  *%rax
ffff80000010c1e7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010c1eb:	48 8d 90 00 80 00 00 	lea    0x8000(%rax),%rdx
ffff80000010c1f2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010c1f6:	48 89 10             	mov    %rdx,(%rax)
ffff80000010c1f9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010c1fd:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
ffff80000010c204:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010c208:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff80000010c20c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010c210:	48 8d 90 40 7f 00 00 	lea    0x7f40(%rax),%rdx
ffff80000010c217:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010c21b:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff80000010c21f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010c223:	48 c7 40 18 10 00 00 	movq   $0x10,0x18(%rax)
ffff80000010c22a:	00 
ffff80000010c22b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010c22f:	48 c7 40 20 10 00 00 	movq   $0x10,0x20(%rax)
ffff80000010c236:	00 
ffff80000010c237:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010c23b:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff80000010c23f:	83 e0 01             	and    $0x1,%eax
ffff80000010c242:	48 85 c0             	test   %rax,%rax
ffff80000010c245:	75 2f                	jne    ffff80000010c276 <do_fork+0x259>
ffff80000010c247:	48 b8 f8 fe ff ff ff 	movabs $0xfffffffffffffef8,%rax
ffff80000010c24e:	ff ff ff 
ffff80000010c251:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010c255:	48 89 c2             	mov    %rax,%rdx
ffff80000010c258:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010c25c:	48 89 90 98 00 00 00 	mov    %rdx,0x98(%rax)
ffff80000010c263:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010c267:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
ffff80000010c26e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010c272:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff80000010c276:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010c27a:	48 c7 40 10 01 00 00 	movq   $0x1,0x10(%rax)
ffff80000010c281:	00 
ffff80000010c282:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010c287:	48 83 c4 40          	add    $0x40,%rsp
ffff80000010c28b:	5b                   	pop    %rbx
ffff80000010c28c:	41 5f                	pop    %r15
ffff80000010c28e:	5d                   	pop    %rbp
ffff80000010c28f:	c3                   	retq   

ffff80000010c290 <do_exit>:
ffff80000010c290:	55                   	push   %rbp
ffff80000010c291:	48 89 e5             	mov    %rsp,%rbp
ffff80000010c294:	41 57                	push   %r15
ffff80000010c296:	48 83 ec 18          	sub    $0x18,%rsp
ffff80000010c29a:	48 8d 0d f9 ff ff ff 	lea    -0x7(%rip),%rcx        # ffff80000010c29a <do_exit+0xa>
ffff80000010c2a1:	49 bb 4e 2f 00 00 00 	movabs $0x2f4e,%r11
ffff80000010c2a8:	00 00 00 
ffff80000010c2ab:	4c 01 d9             	add    %r11,%rcx
ffff80000010c2ae:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff80000010c2b2:	48 b8 99 1c 00 00 00 	movabs $0x1c99,%rax
ffff80000010c2b9:	00 00 00 
ffff80000010c2bc:	48 8d 14 01          	lea    (%rcx,%rax,1),%rdx
ffff80000010c2c0:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010c2c5:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010c2ca:	49 89 cf             	mov    %rcx,%r15
ffff80000010c2cd:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010c2d2:	49 b8 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r8
ffff80000010c2d9:	ff ff ff 
ffff80000010c2dc:	49 01 c8             	add    %rcx,%r8
ffff80000010c2df:	41 ff d0             	callq  *%r8
ffff80000010c2e2:	eb fe                	jmp    ffff80000010c2e2 <do_exit+0x52>
ffff80000010c2e4:	55                   	push   %rbp
ffff80000010c2e5:	48 89 e5             	mov    %rsp,%rbp
ffff80000010c2e8:	53                   	push   %rbx
ffff80000010c2e9:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010c2e9 <do_exit+0x59>
ffff80000010c2f0:	49 bb ff 2e 00 00 00 	movabs $0x2eff,%r11
ffff80000010c2f7:	00 00 00 
ffff80000010c2fa:	4c 01 d8             	add    %r11,%rax
ffff80000010c2fd:	89 7d f4             	mov    %edi,-0xc(%rbp)
ffff80000010c300:	89 75 f0             	mov    %esi,-0x10(%rbp)
ffff80000010c303:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff80000010c307:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
ffff80000010c30b:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
ffff80000010c30f:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
ffff80000010c313:	8b 45 f4             	mov    -0xc(%rbp),%eax
ffff80000010c316:	8b 55 f0             	mov    -0x10(%rbp),%edx
ffff80000010c319:	89 d1                	mov    %edx,%ecx
ffff80000010c31b:	0f a2                	cpuid  
ffff80000010c31d:	89 de                	mov    %ebx,%esi
ffff80000010c31f:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
ffff80000010c323:	89 07                	mov    %eax,(%rdi)
ffff80000010c325:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010c329:	89 30                	mov    %esi,(%rax)
ffff80000010c32b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010c32f:	89 08                	mov    %ecx,(%rax)
ffff80000010c331:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010c335:	89 10                	mov    %edx,(%rax)
ffff80000010c337:	90                   	nop
ffff80000010c338:	5b                   	pop    %rbx
ffff80000010c339:	5d                   	pop    %rbp
ffff80000010c33a:	c3                   	retq   

ffff80000010c33b <init_cpu>:
ffff80000010c33b:	55                   	push   %rbp
ffff80000010c33c:	48 89 e5             	mov    %rsp,%rbp
ffff80000010c33f:	41 57                	push   %r15
ffff80000010c341:	53                   	push   %rbx
ffff80000010c342:	48 83 ec 40          	sub    $0x40,%rsp
ffff80000010c346:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff80000010c346 <init_cpu+0xb>
ffff80000010c34d:	49 bb a2 2e 00 00 00 	movabs $0x2ea2,%r11
ffff80000010c354:	00 00 00 
ffff80000010c357:	4c 01 db             	add    %r11,%rbx
ffff80000010c35a:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%rbp)
ffff80000010c361:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
ffff80000010c368:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
ffff80000010c36f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
ffff80000010c376:	48 c7 45 b0 00 00 00 	movq   $0x0,-0x50(%rbp)
ffff80000010c37d:	00 
ffff80000010c37e:	48 c7 45 b8 00 00 00 	movq   $0x0,-0x48(%rbp)
ffff80000010c385:	00 
ffff80000010c386:	c6 45 c0 00          	movb   $0x0,-0x40(%rbp)
ffff80000010c38a:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff80000010c38e:	48 8d 70 0c          	lea    0xc(%rax),%rsi
ffff80000010c392:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff80000010c396:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff80000010c39a:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff80000010c39e:	48 8d 50 04          	lea    0x4(%rax),%rdx
ffff80000010c3a2:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff80000010c3a6:	49 89 f1             	mov    %rsi,%r9
ffff80000010c3a9:	49 89 c8             	mov    %rcx,%r8
ffff80000010c3ac:	48 89 d1             	mov    %rdx,%rcx
ffff80000010c3af:	48 89 c2             	mov    %rax,%rdx
ffff80000010c3b2:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010c3b7:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010c3bc:	48 b8 9a 53 ff ff ff 	movabs $0xffffffffffff539a,%rax
ffff80000010c3c3:	ff ff ff 
ffff80000010c3c6:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff80000010c3ca:	ff d0                	callq  *%rax
ffff80000010c3cc:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff80000010c3d0:	8b 55 d4             	mov    -0x2c(%rbp),%edx
ffff80000010c3d3:	89 10                	mov    %edx,(%rax)
ffff80000010c3d5:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff80000010c3d9:	48 8d 50 04          	lea    0x4(%rax),%rdx
ffff80000010c3dd:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff80000010c3e0:	89 02                	mov    %eax,(%rdx)
ffff80000010c3e2:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff80000010c3e6:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff80000010c3ea:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff80000010c3ed:	89 02                	mov    %eax,(%rdx)
ffff80000010c3ef:	c6 45 bc 0a          	movb   $0xa,-0x44(%rbp)
ffff80000010c3f3:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff80000010c3f7:	48 89 c1             	mov    %rax,%rcx
ffff80000010c3fa:	48 b8 b1 1c 00 00 00 	movabs $0x1cb1,%rax
ffff80000010c401:	00 00 00 
ffff80000010c404:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010c408:	be ff 00 00 00       	mov    $0xff,%esi
ffff80000010c40d:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff80000010c412:	49 89 df             	mov    %rbx,%r15
ffff80000010c415:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010c41a:	49 b8 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r8
ffff80000010c421:	ff ff ff 
ffff80000010c424:	49 01 d8             	add    %rbx,%r8
ffff80000010c427:	41 ff d0             	callq  *%r8
ffff80000010c42a:	c7 45 ec 02 00 00 80 	movl   $0x80000002,-0x14(%rbp)
ffff80000010c431:	e9 ab 00 00 00       	jmpq   ffff80000010c4e1 <init_cpu+0x1a6>
ffff80000010c436:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff80000010c43a:	48 8d 78 0c          	lea    0xc(%rax),%rdi
ffff80000010c43e:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff80000010c442:	48 8d 70 08          	lea    0x8(%rax),%rsi
ffff80000010c446:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff80000010c44a:	48 8d 48 04          	lea    0x4(%rax),%rcx
ffff80000010c44e:	48 8d 55 d0          	lea    -0x30(%rbp),%rdx
ffff80000010c452:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff80000010c455:	49 89 f9             	mov    %rdi,%r9
ffff80000010c458:	49 89 f0             	mov    %rsi,%r8
ffff80000010c45b:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010c460:	89 c7                	mov    %eax,%edi
ffff80000010c462:	48 b8 9a 53 ff ff ff 	movabs $0xffffffffffff539a,%rax
ffff80000010c469:	ff ff ff 
ffff80000010c46c:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff80000010c470:	ff d0                	callq  *%rax
ffff80000010c472:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff80000010c476:	8b 55 d0             	mov    -0x30(%rbp),%edx
ffff80000010c479:	89 10                	mov    %edx,(%rax)
ffff80000010c47b:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff80000010c47f:	48 8d 50 04          	lea    0x4(%rax),%rdx
ffff80000010c483:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff80000010c486:	89 02                	mov    %eax,(%rdx)
ffff80000010c488:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff80000010c48c:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff80000010c490:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff80000010c493:	89 02                	mov    %eax,(%rdx)
ffff80000010c495:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff80000010c499:	48 8d 50 0c          	lea    0xc(%rax),%rdx
ffff80000010c49d:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff80000010c4a0:	89 02                	mov    %eax,(%rdx)
ffff80000010c4a2:	c6 45 c0 00          	movb   $0x0,-0x40(%rbp)
ffff80000010c4a6:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff80000010c4aa:	48 89 c1             	mov    %rax,%rcx
ffff80000010c4ad:	48 b8 c1 1c 00 00 00 	movabs $0x1cc1,%rax
ffff80000010c4b4:	00 00 00 
ffff80000010c4b7:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010c4bb:	be ff 00 00 00       	mov    $0xff,%esi
ffff80000010c4c0:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff80000010c4c5:	49 89 df             	mov    %rbx,%r15
ffff80000010c4c8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010c4cd:	49 b8 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%r8
ffff80000010c4d4:	ff ff ff 
ffff80000010c4d7:	49 01 d8             	add    %rbx,%r8
ffff80000010c4da:	41 ff d0             	callq  *%r8
ffff80000010c4dd:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
ffff80000010c4e1:	81 7d ec 04 00 00 80 	cmpl   $0x80000004,-0x14(%rbp)
ffff80000010c4e8:	0f 86 48 ff ff ff    	jbe    ffff80000010c436 <init_cpu+0xfb>
ffff80000010c4ee:	48 b8 c4 1c 00 00 00 	movabs $0x1cc4,%rax
ffff80000010c4f5:	00 00 00 
ffff80000010c4f8:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010c4fc:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010c501:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010c506:	49 89 df             	mov    %rbx,%r15
ffff80000010c509:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010c50e:	48 b9 32 5e ff ff ff 	movabs $0xffffffffffff5e32,%rcx
ffff80000010c515:	ff ff ff 
ffff80000010c518:	48 01 d9             	add    %rbx,%rcx
ffff80000010c51b:	ff d1                	callq  *%rcx
ffff80000010c51d:	90                   	nop
ffff80000010c51e:	48 83 c4 40          	add    $0x40,%rsp
ffff80000010c522:	5b                   	pop    %rbx
ffff80000010c523:	41 5f                	pop    %r15
ffff80000010c525:	5d                   	pop    %rbp
ffff80000010c526:	c3                   	retq   

Disassembly of section .data:

ffff80000010c540 <LABEL_GDT64>:
	...

ffff80000010c548 <LABEL_DESC_KERNEL_CODE64>:
ffff80000010c548:	00 00                	add    %al,(%rax)
ffff80000010c54a:	00 00                	add    %al,(%rax)
ffff80000010c54c:	00 98 20 00      	add    %bl,0x20(%rax)

ffff80000010c550 <LABEL_DESC_KERNEL_DATA64>:
ffff80000010c550:	00 00                	add    %al,(%rax)
ffff80000010c552:	00 00                	add    %al,(%rax)
ffff80000010c554:	00 92 00 00      	add    %dl,0x0(%rdx)

ffff80000010c558 <LABEL_DESC_USER_CODE32>:
	...

ffff80000010c560 <LABEL_DESC_USER_DATA32>:
	...

ffff80000010c568 <LABEL_DESC_USER_CODE64>:
ffff80000010c568:	00 00                	add    %al,(%rax)
ffff80000010c56a:	00 00                	add    %al,(%rax)
ffff80000010c56c:	00 f8                	add    %bh,%al
ffff80000010c56e:	20 00                	and    %al,(%rax)

ffff80000010c570 <LABEL_DESC_USER_DATA64>:
ffff80000010c570:	00 00                	add    %al,(%rax)
ffff80000010c572:	00 00                	add    %al,(%rax)
ffff80000010c574:	00 f2                	add    %dh,%dl
	...

ffff80000010c578 <LABEL_DESC_KERNEL_CODE32>:
ffff80000010c578:	ff                   	(bad)  
ffff80000010c579:	ff 00                	incl   (%rax)
ffff80000010c57b:	00 00                	add    %al,(%rax)
ffff80000010c57d:	9a                   	(bad)  
ffff80000010c57e:	cf                   	iret   
	...

ffff80000010c580 <LABEL_DESC_KERNEL_DATA32>:
ffff80000010c580:	ff                   	(bad)  
ffff80000010c581:	ff 00                	incl   (%rax)
ffff80000010c583:	00 00                	add    %al,(%rax)
ffff80000010c585:	92                   	xchg   %eax,%edx
ffff80000010c586:	cf                   	iret   
	...

ffff80000010c5d8 <GDT_END>:
ffff80000010c5d8:	97                   	xchg   %eax,%edi
ffff80000010c5d9:	00 40 c5             	add    %al,-0x3b(%rax)
ffff80000010c5dc:	10 00                	adc    %al,(%rax)
ffff80000010c5de:	00 80 ff ff      	add    %al,0xffff(%rax)

ffff80000010c5e2 <LABEL_IDT>:
	...

ffff80000010d5e2 <IDT_END>:
ffff80000010d5e2:	ff 0f                	decl   (%rdi)
ffff80000010d5e4:	e2 c5                	loop   ffff80000010d5ab <LABEL_IDT+0xfc9>
ffff80000010d5e6:	10 00                	adc    %al,(%rax)
ffff80000010d5e8:	00 80 ff ff      	add    %al,0xffff(%rax)

ffff80000010d5ec <LABEL_TSS64>:
	...

ffff80000010d654 <TSS64_END>:
ffff80000010d654:	67 00 ec             	addr32 add %ch,%ah
ffff80000010d657:	d5                   	(bad)  
ffff80000010d658:	10 00                	adc    %al,(%rax)
ffff80000010d65a:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)

ffff80000010d660 <kmalloc_cache_size>:
ffff80000010d660:	20 00                	and    %al,(%rax)
	...
ffff80000010d696:	00 00                	add    %al,(%rax)
ffff80000010d698:	40 00 00             	add    %al,(%rax)
	...
ffff80000010d6cf:	00 80 00 00 00 00    	add    %al,0x0(%rax)
	...
ffff80000010d709:	01 00                	add    %eax,(%rax)
	...
ffff80000010d73f:	00 00                	add    %al,(%rax)
ffff80000010d741:	02 00                	add    (%rax),%al
	...
ffff80000010d777:	00 00                	add    %al,(%rax)
ffff80000010d779:	04 00                	add    $0x0,%al
	...
ffff80000010d7af:	00 00                	add    %al,(%rax)
ffff80000010d7b1:	08 00                	or     %al,(%rax)
	...
ffff80000010d7e7:	00 00                	add    %al,(%rax)
ffff80000010d7e9:	10 00                	adc    %al,(%rax)
	...
ffff80000010d81f:	00 00                	add    %al,(%rax)
ffff80000010d821:	20 00                	and    %al,(%rax)
	...
ffff80000010d857:	00 00                	add    %al,(%rax)
ffff80000010d859:	40 00 00             	add    %al,(%rax)
	...
ffff80000010d890:	00 80 00 00 00 00    	add    %al,0x0(%rax)
	...
ffff80000010d8ca:	01 00                	add    %eax,(%rax)
	...
ffff80000010d900:	00 00                	add    %al,(%rax)
ffff80000010d902:	02 00                	add    (%rax),%al
	...
ffff80000010d938:	00 00                	add    %al,(%rax)
ffff80000010d93a:	04 00                	add    $0x0,%al
	...
ffff80000010d970:	00 00                	add    %al,(%rax)
ffff80000010d972:	08 00                	or     %al,(%rax)
	...
ffff80000010d9a8:	00 00                	add    %al,(%rax)
ffff80000010d9aa:	10 00                	adc    %al,(%rax)
	...

ffff80000010d9e0 <font_ascii>:
	...
ffff80000010dbf0:	00 10                	add    %dl,(%rax)
ffff80000010dbf2:	10 10                	adc    %dl,(%rax)
ffff80000010dbf4:	10 10                	adc    %dl,(%rax)
ffff80000010dbf6:	10 10                	adc    %dl,(%rax)
ffff80000010dbf8:	10 10                	adc    %dl,(%rax)
ffff80000010dbfa:	00 00                	add    %al,(%rax)
ffff80000010dbfc:	10 10                	adc    %dl,(%rax)
ffff80000010dbfe:	00 00                	add    %al,(%rax)
ffff80000010dc00:	28 28                	sub    %ch,(%rax)
ffff80000010dc02:	28 00                	sub    %al,(%rax)
	...
ffff80000010dc10:	00 44 44 44          	add    %al,0x44(%rsp,%rax,2)
ffff80000010dc14:	fe 44 44 44          	incb   0x44(%rsp,%rax,2)
ffff80000010dc18:	44                   	rex.R
ffff80000010dc19:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010dc1e:	00 00                	add    %al,(%rax)
ffff80000010dc20:	10 3a                	adc    %bh,(%rdx)
ffff80000010dc22:	56                   	push   %rsi
ffff80000010dc23:	92                   	xchg   %eax,%edx
ffff80000010dc24:	92                   	xchg   %eax,%edx
ffff80000010dc25:	90                   	nop
ffff80000010dc26:	50                   	push   %rax
ffff80000010dc27:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010dc2a:	92                   	xchg   %eax,%edx
ffff80000010dc2b:	92                   	xchg   %eax,%edx
ffff80000010dc2c:	d4                   	(bad)  
ffff80000010dc2d:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010dc32:	94                   	xchg   %eax,%esp
ffff80000010dc33:	94                   	xchg   %eax,%esp
ffff80000010dc34:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010dc39:	2c 52                	sub    $0x52,%al
ffff80000010dc3b:	52                   	push   %rdx
ffff80000010dc3c:	92                   	xchg   %eax,%edx
ffff80000010dc3d:	8c 00                	mov    %es,(%rax)
ffff80000010dc3f:	00 00                	add    %al,(%rax)
ffff80000010dc41:	70 88                	jo     ffff80000010dbcb <font_ascii+0x1eb>
ffff80000010dc43:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010dc49:	92                   	xchg   %eax,%edx
ffff80000010dc4a:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010dc51:	08 10                	or     %dl,(%rax)
	...
ffff80000010dc5f:	00 02                	add    %al,(%rdx)
ffff80000010dc61:	04 08                	add    $0x8,%al
ffff80000010dc63:	08 10                	or     %dl,(%rax)
ffff80000010dc65:	10 10                	adc    %dl,(%rax)
ffff80000010dc67:	10 10                	adc    %dl,(%rax)
ffff80000010dc69:	10 10                	adc    %dl,(%rax)
ffff80000010dc6b:	08 08                	or     %cl,(%rax)
ffff80000010dc6d:	04 02                	add    $0x2,%al
ffff80000010dc6f:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010dc75:	10 10                	adc    %dl,(%rax)
ffff80000010dc77:	10 10                	adc    %dl,(%rax)
ffff80000010dc79:	10 10                	adc    %dl,(%rax)
ffff80000010dc7b:	20 20                	and    %ah,(%rax)
ffff80000010dc7d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010dc81:	00 00                	add    %al,(%rax)
ffff80000010dc83:	00 00                	add    %al,(%rax)
ffff80000010dc85:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010dc8b:	10 00                	adc    %al,(%rax)
	...
ffff80000010dc95:	10 10                	adc    %dl,(%rax)
ffff80000010dc97:	10 fe                	adc    %bh,%dh
ffff80000010dc99:	10 10                	adc    %dl,(%rax)
ffff80000010dc9b:	10 00                	adc    %al,(%rax)
	...
ffff80000010dca9:	00 00                	add    %al,(%rax)
ffff80000010dcab:	18 18                	sbb    %bl,(%rax)
ffff80000010dcad:	08 08                	or     %cl,(%rax)
ffff80000010dcaf:	10 00                	adc    %al,(%rax)
ffff80000010dcb1:	00 00                	add    %al,(%rax)
ffff80000010dcb3:	00 00                	add    %al,(%rax)
ffff80000010dcb5:	00 00                	add    %al,(%rax)
ffff80000010dcb7:	00 fe                	add    %bh,%dh
	...
ffff80000010dcc9:	00 00                	add    %al,(%rax)
ffff80000010dccb:	00 18                	add    %bl,(%rax)
ffff80000010dccd:	18 00                	sbb    %al,(%rax)
ffff80000010dccf:	00 02                	add    %al,(%rdx)
ffff80000010dcd1:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010dcd4:	08 08                	or     %cl,(%rax)
ffff80000010dcd6:	08 10                	or     %dl,(%rax)
ffff80000010dcd8:	10 20                	adc    %ah,(%rax)
ffff80000010dcda:	20 40 40             	and    %al,0x40(%rax)
ffff80000010dcdd:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010dce4:	42 
ffff80000010dce5:	42                   	rex.X
ffff80000010dce6:	42                   	rex.X
ffff80000010dce7:	42                   	rex.X
ffff80000010dce8:	42                   	rex.X
ffff80000010dce9:	42                   	rex.X
ffff80000010dcea:	42 24 24             	rex.X and $0x24,%al
ffff80000010dced:	18 00                	sbb    %al,(%rax)
ffff80000010dcef:	00 00                	add    %al,(%rax)
ffff80000010dcf1:	08 18                	or     %bl,(%rax)
ffff80000010dcf3:	28 08                	sub    %cl,(%rax)
ffff80000010dcf5:	08 08                	or     %cl,(%rax)
ffff80000010dcf7:	08 08                	or     %cl,(%rax)
ffff80000010dcf9:	08 08                	or     %cl,(%rax)
ffff80000010dcfb:	08 08                	or     %cl,(%rax)
ffff80000010dcfd:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010dd00:	00 18                	add    %bl,(%rax)
ffff80000010dd02:	24 42                	and    $0x42,%al
ffff80000010dd04:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010dd08:	10 20                	adc    %ah,(%rax)
ffff80000010dd0a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010dd0d:	7e 00                	jle    ffff80000010dd0f <font_ascii+0x32f>
ffff80000010dd0f:	00 00                	add    %al,(%rax)
ffff80000010dd11:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010dd14:	02 02                	add    (%rdx),%al
ffff80000010dd16:	04 18                	add    $0x18,%al
ffff80000010dd18:	04 02                	add    $0x2,%al
ffff80000010dd1a:	02 42 24             	add    0x24(%rdx),%al
ffff80000010dd1d:	18 00                	sbb    %al,(%rax)
ffff80000010dd1f:	00 00                	add    %al,(%rax)
ffff80000010dd21:	0c 0c                	or     $0xc,%al
ffff80000010dd23:	0c 14                	or     $0x14,%al
ffff80000010dd25:	14 14                	adc    $0x14,%al
ffff80000010dd27:	24 24                	and    $0x24,%al
ffff80000010dd29:	44 7e 04             	rex.R jle ffff80000010dd30 <font_ascii+0x350>
ffff80000010dd2c:	04 1e                	add    $0x1e,%al
ffff80000010dd2e:	00 00                	add    %al,(%rax)
ffff80000010dd30:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010dd34:	40 58                	rex pop %rax
ffff80000010dd36:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010dd39:	02 02                	add    (%rdx),%al
ffff80000010dd3b:	42 24 18             	rex.X and $0x18,%al
ffff80000010dd3e:	00 00                	add    %al,(%rax)
ffff80000010dd40:	00 18                	add    %bl,(%rax)
ffff80000010dd42:	24 42                	and    $0x42,%al
ffff80000010dd44:	40 58                	rex pop %rax
ffff80000010dd46:	64 42                	fs rex.X
ffff80000010dd48:	42                   	rex.X
ffff80000010dd49:	42                   	rex.X
ffff80000010dd4a:	42                   	rex.X
ffff80000010dd4b:	42 24 18             	rex.X and $0x18,%al
ffff80000010dd4e:	00 00                	add    %al,(%rax)
ffff80000010dd50:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010dd53:	42 04 04             	rex.X add $0x4,%al
ffff80000010dd56:	08 08                	or     %cl,(%rax)
ffff80000010dd58:	08 10                	or     %dl,(%rax)
ffff80000010dd5a:	10 10                	adc    %dl,(%rax)
ffff80000010dd5c:	10 38                	adc    %bh,(%rax)
ffff80000010dd5e:	00 00                	add    %al,(%rax)
ffff80000010dd60:	00 18                	add    %bl,(%rax)
ffff80000010dd62:	24 42                	and    $0x42,%al
ffff80000010dd64:	42                   	rex.X
ffff80000010dd65:	42 24 18             	rex.X and $0x18,%al
ffff80000010dd68:	24 42                	and    $0x42,%al
ffff80000010dd6a:	42                   	rex.X
ffff80000010dd6b:	42 24 18             	rex.X and $0x18,%al
ffff80000010dd6e:	00 00                	add    %al,(%rax)
ffff80000010dd70:	00 18                	add    %bl,(%rax)
ffff80000010dd72:	24 42                	and    $0x42,%al
ffff80000010dd74:	42                   	rex.X
ffff80000010dd75:	42                   	rex.X
ffff80000010dd76:	42                   	rex.X
ffff80000010dd77:	42                   	rex.X
ffff80000010dd78:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010dd7b:	42 24 18             	rex.X and $0x18,%al
ffff80000010dd7e:	00 00                	add    %al,(%rax)
ffff80000010dd80:	00 00                	add    %al,(%rax)
ffff80000010dd82:	00 00                	add    %al,(%rax)
ffff80000010dd84:	00 18                	add    %bl,(%rax)
ffff80000010dd86:	18 00                	sbb    %al,(%rax)
ffff80000010dd88:	00 00                	add    %al,(%rax)
ffff80000010dd8a:	00 00                	add    %al,(%rax)
ffff80000010dd8c:	18 18                	sbb    %bl,(%rax)
ffff80000010dd8e:	00 00                	add    %al,(%rax)
ffff80000010dd90:	00 00                	add    %al,(%rax)
ffff80000010dd92:	00 00                	add    %al,(%rax)
ffff80000010dd94:	00 18                	add    %bl,(%rax)
ffff80000010dd96:	18 00                	sbb    %al,(%rax)
ffff80000010dd98:	00 00                	add    %al,(%rax)
ffff80000010dd9a:	00 18                	add    %bl,(%rax)
ffff80000010dd9c:	18 08                	sbb    %cl,(%rax)
ffff80000010dd9e:	08 10                	or     %dl,(%rax)
ffff80000010dda0:	00 02                	add    %al,(%rdx)
ffff80000010dda2:	04 08                	add    $0x8,%al
ffff80000010dda4:	10 20                	adc    %ah,(%rax)
ffff80000010dda6:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010ddad:	04 
ffff80000010ddae:	02 00                	add    (%rax),%al
ffff80000010ddb0:	00 00                	add    %al,(%rax)
ffff80000010ddb2:	00 00                	add    %al,(%rax)
ffff80000010ddb4:	00 00                	add    %al,(%rax)
ffff80000010ddb6:	fe 00                	incb   (%rax)
ffff80000010ddb8:	00 fe                	add    %bh,%dh
ffff80000010ddba:	00 00                	add    %al,(%rax)
ffff80000010ddbc:	00 00                	add    %al,(%rax)
ffff80000010ddbe:	00 00                	add    %al,(%rax)
ffff80000010ddc0:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010ddc6:	04 02                	add    $0x2,%al
ffff80000010ddc8:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010ddcb:	10 20                	adc    %ah,(%rax)
ffff80000010ddcd:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010ddd1:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010ddd5:	82                   	(bad)  
ffff80000010ddd6:	04 08                	add    $0x8,%al
ffff80000010ddd8:	10 10                	adc    %dl,(%rax)
ffff80000010ddda:	00 00                	add    %al,(%rax)
ffff80000010dddc:	18 18                	sbb    %bl,(%rax)
ffff80000010ddde:	00 00                	add    %al,(%rax)
ffff80000010dde0:	00 38                	add    %bh,(%rax)
ffff80000010dde2:	44 82                	rex.R (bad) 
ffff80000010dde4:	9a                   	(bad)  
ffff80000010dde5:	aa                   	stos   %al,%es:(%rdi)
ffff80000010dde6:	aa                   	stos   %al,%es:(%rdi)
ffff80000010dde7:	aa                   	stos   %al,%es:(%rdi)
ffff80000010dde8:	aa                   	stos   %al,%es:(%rdi)
ffff80000010dde9:	aa                   	stos   %al,%es:(%rdi)
ffff80000010ddea:	9c                   	pushfq 
ffff80000010ddeb:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010ddef:	00 00                	add    %al,(%rax)
ffff80000010ddf1:	18 18                	sbb    %bl,(%rax)
ffff80000010ddf3:	18 18                	sbb    %bl,(%rax)
ffff80000010ddf5:	24 24                	and    $0x24,%al
ffff80000010ddf7:	24 24                	and    $0x24,%al
ffff80000010ddf9:	7e 42                	jle    ffff80000010de3d <font_ascii+0x45d>
ffff80000010ddfb:	42                   	rex.X
ffff80000010ddfc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010ddff:	00 00                	add    %al,(%rax)
ffff80000010de01:	f0 48                	lock rex.W
ffff80000010de03:	44                   	rex.R
ffff80000010de04:	44                   	rex.R
ffff80000010de05:	44                   	rex.R
ffff80000010de06:	48 78 44             	rex.W js ffff80000010de4d <font_ascii+0x46d>
ffff80000010de09:	42                   	rex.X
ffff80000010de0a:	42                   	rex.X
ffff80000010de0b:	42                   	rex.X
ffff80000010de0c:	44 f8                	rex.R clc 
ffff80000010de0e:	00 00                	add    %al,(%rax)
ffff80000010de10:	00 3a                	add    %bh,(%rdx)
ffff80000010de12:	46                   	rex.RX
ffff80000010de13:	42 82                	rex.X (bad) 
ffff80000010de15:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010de1c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010de1f:	00 00                	add    %al,(%rax)
ffff80000010de21:	f8                   	clc    
ffff80000010de22:	44                   	rex.R
ffff80000010de23:	44                   	rex.R
ffff80000010de24:	42                   	rex.X
ffff80000010de25:	42                   	rex.X
ffff80000010de26:	42                   	rex.X
ffff80000010de27:	42                   	rex.X
ffff80000010de28:	42                   	rex.X
ffff80000010de29:	42                   	rex.X
ffff80000010de2a:	42                   	rex.X
ffff80000010de2b:	44                   	rex.R
ffff80000010de2c:	44 f8                	rex.R clc 
ffff80000010de2e:	00 00                	add    %al,(%rax)
ffff80000010de30:	00 fe                	add    %bh,%dh
ffff80000010de32:	42                   	rex.X
ffff80000010de33:	42                   	rex.X
ffff80000010de34:	40                   	rex
ffff80000010de35:	40                   	rex
ffff80000010de36:	44 7c 44             	rex.R jl ffff80000010de7d <font_ascii+0x49d>
ffff80000010de39:	40                   	rex
ffff80000010de3a:	40                   	rex
ffff80000010de3b:	42                   	rex.X
ffff80000010de3c:	42 fe 00             	rex.X incb (%rax)
ffff80000010de3f:	00 00                	add    %al,(%rax)
ffff80000010de41:	fe 42 42             	incb   0x42(%rdx)
ffff80000010de44:	40                   	rex
ffff80000010de45:	40                   	rex
ffff80000010de46:	44 7c 44             	rex.R jl ffff80000010de8d <font_ascii+0x4ad>
ffff80000010de49:	44                   	rex.R
ffff80000010de4a:	40                   	rex
ffff80000010de4b:	40                   	rex
ffff80000010de4c:	40                   	rex
ffff80000010de4d:	f0 00 00             	lock add %al,(%rax)
ffff80000010de50:	00 3a                	add    %bh,(%rdx)
ffff80000010de52:	46                   	rex.RX
ffff80000010de53:	42 82                	rex.X (bad) 
ffff80000010de55:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010de5c:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010de5f:	00 00                	add    %al,(%rax)
ffff80000010de61:	e7 42                	out    %eax,$0x42
ffff80000010de63:	42                   	rex.X
ffff80000010de64:	42                   	rex.X
ffff80000010de65:	42                   	rex.X
ffff80000010de66:	42 7e 42             	rex.X jle ffff80000010deab <font_ascii+0x4cb>
ffff80000010de69:	42                   	rex.X
ffff80000010de6a:	42                   	rex.X
ffff80000010de6b:	42                   	rex.X
ffff80000010de6c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010de6f:	00 00                	add    %al,(%rax)
ffff80000010de71:	7c 10                	jl     ffff80000010de83 <font_ascii+0x4a3>
ffff80000010de73:	10 10                	adc    %dl,(%rax)
ffff80000010de75:	10 10                	adc    %dl,(%rax)
ffff80000010de77:	10 10                	adc    %dl,(%rax)
ffff80000010de79:	10 10                	adc    %dl,(%rax)
ffff80000010de7b:	10 10                	adc    %dl,(%rax)
ffff80000010de7d:	7c 00                	jl     ffff80000010de7f <font_ascii+0x49f>
ffff80000010de7f:	00 00                	add    %al,(%rax)
ffff80000010de81:	1f                   	(bad)  
ffff80000010de82:	04 04                	add    $0x4,%al
ffff80000010de84:	04 04                	add    $0x4,%al
ffff80000010de86:	04 04                	add    $0x4,%al
ffff80000010de88:	04 04                	add    $0x4,%al
ffff80000010de8a:	04 04                	add    $0x4,%al
ffff80000010de8c:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010de8f:	00 00                	add    %al,(%rax)
ffff80000010de91:	e7 42                	out    %eax,$0x42
ffff80000010de93:	44                   	rex.R
ffff80000010de94:	48 50                	rex.W push %rax
ffff80000010de96:	50                   	push   %rax
ffff80000010de97:	60                   	(bad)  
ffff80000010de98:	50                   	push   %rax
ffff80000010de99:	50                   	push   %rax
ffff80000010de9a:	48                   	rex.W
ffff80000010de9b:	44                   	rex.R
ffff80000010de9c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010de9f:	00 00                	add    %al,(%rax)
ffff80000010dea1:	f0 40                	lock rex
ffff80000010dea3:	40                   	rex
ffff80000010dea4:	40                   	rex
ffff80000010dea5:	40                   	rex
ffff80000010dea6:	40                   	rex
ffff80000010dea7:	40                   	rex
ffff80000010dea8:	40                   	rex
ffff80000010dea9:	40                   	rex
ffff80000010deaa:	40                   	rex
ffff80000010deab:	42                   	rex.X
ffff80000010deac:	42 fe 00             	rex.X incb (%rax)
ffff80000010deaf:	00 00                	add    %al,(%rax)
ffff80000010deb1:	c3                   	retq   
ffff80000010deb2:	42                   	rex.X
ffff80000010deb3:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010deb7:	5a                   	pop    %rdx
ffff80000010deb8:	5a                   	pop    %rdx
ffff80000010deb9:	42                   	rex.X
ffff80000010deba:	42                   	rex.X
ffff80000010debb:	42                   	rex.X
ffff80000010debc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010debf:	00 00                	add    %al,(%rax)
ffff80000010dec1:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010dec8:	4a                   	rex.WX
ffff80000010dec9:	4a                   	rex.WX
ffff80000010deca:	4a                   	rex.WX
ffff80000010decb:	46                   	rex.RX
ffff80000010decc:	46 e2 00             	rex.RX loop ffff80000010decf <font_ascii+0x4ef>
ffff80000010decf:	00 00                	add    %al,(%rax)
ffff80000010ded1:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010ded5:	82                   	(bad)  
ffff80000010ded6:	82                   	(bad)  
ffff80000010ded7:	82                   	(bad)  
ffff80000010ded8:	82                   	(bad)  
ffff80000010ded9:	82                   	(bad)  
ffff80000010deda:	82                   	(bad)  
ffff80000010dedb:	82                   	(bad)  
ffff80000010dedc:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010dedf:	00 00                	add    %al,(%rax)
ffff80000010dee1:	f8                   	clc    
ffff80000010dee2:	44                   	rex.R
ffff80000010dee3:	42                   	rex.X
ffff80000010dee4:	42                   	rex.X
ffff80000010dee5:	42                   	rex.X
ffff80000010dee6:	44 78 40             	rex.R js ffff80000010df29 <font_ascii+0x549>
ffff80000010dee9:	40                   	rex
ffff80000010deea:	40                   	rex
ffff80000010deeb:	40                   	rex
ffff80000010deec:	40                   	rex
ffff80000010deed:	f0 00 00             	lock add %al,(%rax)
ffff80000010def0:	00 38                	add    %bh,(%rax)
ffff80000010def2:	44 82                	rex.R (bad) 
ffff80000010def4:	82                   	(bad)  
ffff80000010def5:	82                   	(bad)  
ffff80000010def6:	82                   	(bad)  
ffff80000010def7:	82                   	(bad)  
ffff80000010def8:	82                   	(bad)  
ffff80000010def9:	82                   	(bad)  
ffff80000010defa:	92                   	xchg   %eax,%edx
ffff80000010defb:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010deff:	00 00                	add    %al,(%rax)
ffff80000010df01:	fc                   	cld    
ffff80000010df02:	42                   	rex.X
ffff80000010df03:	42                   	rex.X
ffff80000010df04:	42                   	rex.X
ffff80000010df05:	42 7c 44             	rex.X jl ffff80000010df4c <font_ascii+0x56c>
ffff80000010df08:	42                   	rex.X
ffff80000010df09:	42                   	rex.X
ffff80000010df0a:	42                   	rex.X
ffff80000010df0b:	42                   	rex.X
ffff80000010df0c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010df0f:	00 00                	add    %al,(%rax)
ffff80000010df11:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010df14:	82                   	(bad)  
ffff80000010df15:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010df19:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010df1f:	00 00                	add    %al,(%rax)
ffff80000010df21:	fe                   	(bad)  
ffff80000010df22:	92                   	xchg   %eax,%edx
ffff80000010df23:	92                   	xchg   %eax,%edx
ffff80000010df24:	10 10                	adc    %dl,(%rax)
ffff80000010df26:	10 10                	adc    %dl,(%rax)
ffff80000010df28:	10 10                	adc    %dl,(%rax)
ffff80000010df2a:	10 10                	adc    %dl,(%rax)
ffff80000010df2c:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010df30:	00 e7                	add    %ah,%bh
ffff80000010df32:	42                   	rex.X
ffff80000010df33:	42                   	rex.X
ffff80000010df34:	42                   	rex.X
ffff80000010df35:	42                   	rex.X
ffff80000010df36:	42                   	rex.X
ffff80000010df37:	42                   	rex.X
ffff80000010df38:	42                   	rex.X
ffff80000010df39:	42                   	rex.X
ffff80000010df3a:	42                   	rex.X
ffff80000010df3b:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010df3e:	00 00                	add    %al,(%rax)
ffff80000010df40:	00 e7                	add    %ah,%bh
ffff80000010df42:	42                   	rex.X
ffff80000010df43:	42                   	rex.X
ffff80000010df44:	42                   	rex.X
ffff80000010df45:	42 24 24             	rex.X and $0x24,%al
ffff80000010df48:	24 24                	and    $0x24,%al
ffff80000010df4a:	18 18                	sbb    %bl,(%rax)
ffff80000010df4c:	18 18                	sbb    %bl,(%rax)
ffff80000010df4e:	00 00                	add    %al,(%rax)
ffff80000010df50:	00 e7                	add    %ah,%bh
ffff80000010df52:	42                   	rex.X
ffff80000010df53:	42                   	rex.X
ffff80000010df54:	42 5a                	rex.X pop %rdx
ffff80000010df56:	5a                   	pop    %rdx
ffff80000010df57:	5a                   	pop    %rdx
ffff80000010df58:	5a                   	pop    %rdx
ffff80000010df59:	24 24                	and    $0x24,%al
ffff80000010df5b:	24 24                	and    $0x24,%al
ffff80000010df5d:	24 00                	and    $0x0,%al
ffff80000010df5f:	00 00                	add    %al,(%rax)
ffff80000010df61:	e7 42                	out    %eax,$0x42
ffff80000010df63:	42 24 24             	rex.X and $0x24,%al
ffff80000010df66:	24 18                	and    $0x18,%al
ffff80000010df68:	24 24                	and    $0x24,%al
ffff80000010df6a:	24 42                	and    $0x42,%al
ffff80000010df6c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010df6f:	00 00                	add    %al,(%rax)
ffff80000010df71:	ee                   	out    %al,(%dx)
ffff80000010df72:	44                   	rex.R
ffff80000010df73:	44                   	rex.R
ffff80000010df74:	44 28 28             	sub    %r13b,(%rax)
ffff80000010df77:	28 10                	sub    %dl,(%rax)
ffff80000010df79:	10 10                	adc    %dl,(%rax)
ffff80000010df7b:	10 10                	adc    %dl,(%rax)
ffff80000010df7d:	7c 00                	jl     ffff80000010df7f <font_ascii+0x59f>
ffff80000010df7f:	00 00                	add    %al,(%rax)
ffff80000010df81:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010df88:	20 20                	and    %ah,(%rax)
ffff80000010df8a:	40                   	rex
ffff80000010df8b:	42 82                	rex.X (bad) 
ffff80000010df8d:	fe 00                	incb   (%rax)
ffff80000010df8f:	00 00                	add    %al,(%rax)
ffff80000010df91:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010df94:	20 20                	and    %ah,(%rax)
ffff80000010df96:	20 20                	and    %ah,(%rax)
ffff80000010df98:	20 20                	and    %ah,(%rax)
ffff80000010df9a:	20 20                	and    %ah,(%rax)
ffff80000010df9c:	20 20                	and    %ah,(%rax)
ffff80000010df9e:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010dfa5:	20 20                	and    %ah,(%rax)
ffff80000010dfa7:	10 10                	adc    %dl,(%rax)
ffff80000010dfa9:	08 08                	or     %cl,(%rax)
ffff80000010dfab:	04 04                	add    $0x4,%al
ffff80000010dfad:	04 02                	add    $0x2,%al
ffff80000010dfaf:	02 00                	add    (%rax),%al
ffff80000010dfb1:	7c 04                	jl     ffff80000010dfb7 <font_ascii+0x5d7>
ffff80000010dfb3:	04 04                	add    $0x4,%al
ffff80000010dfb5:	04 04                	add    $0x4,%al
ffff80000010dfb7:	04 04                	add    $0x4,%al
ffff80000010dfb9:	04 04                	add    $0x4,%al
ffff80000010dfbb:	04 04                	add    $0x4,%al
ffff80000010dfbd:	04 7c                	add    $0x7c,%al
ffff80000010dfbf:	00 00                	add    %al,(%rax)
ffff80000010dfc1:	10 28                	adc    %ch,(%rax)
ffff80000010dfc3:	44 82                	rex.R (bad) 
	...
ffff80000010dfdd:	00 fe                	add    %bh,%dh
ffff80000010dfdf:	00 10                	add    %dl,(%rax)
ffff80000010dfe1:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010dff4:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010dff7:	04 3c                	add    $0x3c,%al
ffff80000010dff9:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010e000:	c0 
ffff80000010e001:	40                   	rex
ffff80000010e002:	40                   	rex
ffff80000010e003:	40                   	rex
ffff80000010e004:	40 58                	rex pop %rax
ffff80000010e006:	64 42                	fs rex.X
ffff80000010e008:	42                   	rex.X
ffff80000010e009:	42                   	rex.X
ffff80000010e00a:	42                   	rex.X
ffff80000010e00b:	42                   	rex.X
ffff80000010e00c:	64 58                	fs pop %rax
ffff80000010e00e:	00 00                	add    %al,(%rax)
ffff80000010e010:	00 00                	add    %al,(%rax)
ffff80000010e012:	00 00                	add    %al,(%rax)
ffff80000010e014:	00 30                	add    %dh,(%rax)
ffff80000010e016:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010e01d:	38 
ffff80000010e01e:	00 00                	add    %al,(%rax)
ffff80000010e020:	0c 04                	or     $0x4,%al
ffff80000010e022:	04 04                	add    $0x4,%al
ffff80000010e024:	04 34                	add    $0x34,%al
ffff80000010e026:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010e02d:	36 
ffff80000010e02e:	00 00                	add    %al,(%rax)
ffff80000010e030:	00 00                	add    %al,(%rax)
ffff80000010e032:	00 00                	add    %al,(%rax)
ffff80000010e034:	00 38                	add    %bh,(%rax)
ffff80000010e036:	44 82                	rex.R (bad) 
ffff80000010e038:	82                   	(bad)  
ffff80000010e039:	fc                   	cld    
ffff80000010e03a:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010e041:	10 10                	adc    %dl,(%rax)
ffff80000010e043:	10 10                	adc    %dl,(%rax)
ffff80000010e045:	7c 10                	jl     ffff80000010e057 <font_ascii+0x677>
ffff80000010e047:	10 10                	adc    %dl,(%rax)
ffff80000010e049:	10 10                	adc    %dl,(%rax)
ffff80000010e04b:	10 10                	adc    %dl,(%rax)
ffff80000010e04d:	7c 00                	jl     ffff80000010e04f <font_ascii+0x66f>
ffff80000010e04f:	00 00                	add    %al,(%rax)
ffff80000010e051:	00 00                	add    %al,(%rax)
ffff80000010e053:	00 00                	add    %al,(%rax)
ffff80000010e055:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010e05c:	34 04 
ffff80000010e05e:	04 38                	add    $0x38,%al
ffff80000010e060:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010e064:	40 58                	rex pop %rax
ffff80000010e066:	64 42                	fs rex.X
ffff80000010e068:	42                   	rex.X
ffff80000010e069:	42                   	rex.X
ffff80000010e06a:	42                   	rex.X
ffff80000010e06b:	42                   	rex.X
ffff80000010e06c:	42 e3 00             	rex.X jrcxz ffff80000010e06f <font_ascii+0x68f>
ffff80000010e06f:	00 00                	add    %al,(%rax)
ffff80000010e071:	10 10                	adc    %dl,(%rax)
ffff80000010e073:	00 00                	add    %al,(%rax)
ffff80000010e075:	30 10                	xor    %dl,(%rax)
ffff80000010e077:	10 10                	adc    %dl,(%rax)
ffff80000010e079:	10 10                	adc    %dl,(%rax)
ffff80000010e07b:	10 10                	adc    %dl,(%rax)
ffff80000010e07d:	38 00                	cmp    %al,(%rax)
ffff80000010e07f:	00 00                	add    %al,(%rax)
ffff80000010e081:	04 04                	add    $0x4,%al
ffff80000010e083:	00 00                	add    %al,(%rax)
ffff80000010e085:	0c 04                	or     $0x4,%al
ffff80000010e087:	04 04                	add    $0x4,%al
ffff80000010e089:	04 04                	add    $0x4,%al
ffff80000010e08b:	04 04                	add    $0x4,%al
ffff80000010e08d:	08 08                	or     %cl,(%rax)
ffff80000010e08f:	30 c0                	xor    %al,%al
ffff80000010e091:	40                   	rex
ffff80000010e092:	40                   	rex
ffff80000010e093:	40                   	rex
ffff80000010e094:	40                   	rex
ffff80000010e095:	4e                   	rex.WRX
ffff80000010e096:	44                   	rex.R
ffff80000010e097:	48 50                	rex.W push %rax
ffff80000010e099:	60                   	(bad)  
ffff80000010e09a:	50                   	push   %rax
ffff80000010e09b:	48                   	rex.W
ffff80000010e09c:	44 e6 00             	rex.R out %al,$0x0
ffff80000010e09f:	00 30                	add    %dh,(%rax)
ffff80000010e0a1:	10 10                	adc    %dl,(%rax)
ffff80000010e0a3:	10 10                	adc    %dl,(%rax)
ffff80000010e0a5:	10 10                	adc    %dl,(%rax)
ffff80000010e0a7:	10 10                	adc    %dl,(%rax)
ffff80000010e0a9:	10 10                	adc    %dl,(%rax)
ffff80000010e0ab:	10 10                	adc    %dl,(%rax)
ffff80000010e0ad:	38 00                	cmp    %al,(%rax)
ffff80000010e0af:	00 00                	add    %al,(%rax)
ffff80000010e0b1:	00 00                	add    %al,(%rax)
ffff80000010e0b3:	00 00                	add    %al,(%rax)
ffff80000010e0b5:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010e0b9:	49                   	rex.WB
ffff80000010e0ba:	49                   	rex.WB
ffff80000010e0bb:	49                   	rex.WB
ffff80000010e0bc:	49 db 00             	rex.WB fildl (%r8)
ffff80000010e0bf:	00 00                	add    %al,(%rax)
ffff80000010e0c1:	00 00                	add    %al,(%rax)
ffff80000010e0c3:	00 00                	add    %al,(%rax)
ffff80000010e0c5:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010e0c9:	42                   	rex.X
ffff80000010e0ca:	42                   	rex.X
ffff80000010e0cb:	42                   	rex.X
ffff80000010e0cc:	42 e3 00             	rex.X jrcxz ffff80000010e0cf <font_ascii+0x6ef>
ffff80000010e0cf:	00 00                	add    %al,(%rax)
ffff80000010e0d1:	00 00                	add    %al,(%rax)
ffff80000010e0d3:	00 00                	add    %al,(%rax)
ffff80000010e0d5:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010e0d9:	82                   	(bad)  
ffff80000010e0da:	82                   	(bad)  
ffff80000010e0db:	82                   	(bad)  
ffff80000010e0dc:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010e0df:	00 00                	add    %al,(%rax)
ffff80000010e0e1:	00 00                	add    %al,(%rax)
ffff80000010e0e3:	00 d8                	add    %bl,%al
ffff80000010e0e5:	64 42                	fs rex.X
ffff80000010e0e7:	42                   	rex.X
ffff80000010e0e8:	42                   	rex.X
ffff80000010e0e9:	42                   	rex.X
ffff80000010e0ea:	42                   	rex.X
ffff80000010e0eb:	64 58                	fs pop %rax
ffff80000010e0ed:	40                   	rex
ffff80000010e0ee:	40 e0 00             	rex loopne ffff80000010e0f1 <font_ascii+0x711>
ffff80000010e0f1:	00 00                	add    %al,(%rax)
ffff80000010e0f3:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010e0f6:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010e0fd:	04 04                	add    $0x4,%al
ffff80000010e0ff:	0e                   	(bad)  
ffff80000010e100:	00 00                	add    %al,(%rax)
ffff80000010e102:	00 00                	add    %al,(%rax)
ffff80000010e104:	00 dc                	add    %bl,%ah
ffff80000010e106:	62 42                	(bad)  
ffff80000010e108:	40                   	rex
ffff80000010e109:	40                   	rex
ffff80000010e10a:	40                   	rex
ffff80000010e10b:	40                   	rex
ffff80000010e10c:	40 e0 00             	rex loopne ffff80000010e10f <font_ascii+0x72f>
ffff80000010e10f:	00 00                	add    %al,(%rax)
ffff80000010e111:	00 00                	add    %al,(%rax)
ffff80000010e113:	00 00                	add    %al,(%rax)
ffff80000010e115:	7a 86                	jp     ffff80000010e09d <font_ascii+0x6bd>
ffff80000010e117:	82                   	(bad)  
ffff80000010e118:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010e11b:	82                   	(bad)  
ffff80000010e11c:	c2 bc 00             	retq   $0xbc
ffff80000010e11f:	00 00                	add    %al,(%rax)
ffff80000010e121:	00 10                	add    %dl,(%rax)
ffff80000010e123:	10 10                	adc    %dl,(%rax)
ffff80000010e125:	7c 10                	jl     ffff80000010e137 <font_ascii+0x757>
ffff80000010e127:	10 10                	adc    %dl,(%rax)
ffff80000010e129:	10 10                	adc    %dl,(%rax)
ffff80000010e12b:	10 10                	adc    %dl,(%rax)
ffff80000010e12d:	0e                   	(bad)  
ffff80000010e12e:	00 00                	add    %al,(%rax)
ffff80000010e130:	00 00                	add    %al,(%rax)
ffff80000010e132:	00 00                	add    %al,(%rax)
ffff80000010e134:	00 c6                	add    %al,%dh
ffff80000010e136:	42                   	rex.X
ffff80000010e137:	42                   	rex.X
ffff80000010e138:	42                   	rex.X
ffff80000010e139:	42                   	rex.X
ffff80000010e13a:	42                   	rex.X
ffff80000010e13b:	42                   	rex.X
ffff80000010e13c:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010e13f:	00 00                	add    %al,(%rax)
ffff80000010e141:	00 00                	add    %al,(%rax)
ffff80000010e143:	00 00                	add    %al,(%rax)
ffff80000010e145:	e7 42                	out    %eax,$0x42
ffff80000010e147:	42                   	rex.X
ffff80000010e148:	42 24 24             	rex.X and $0x24,%al
ffff80000010e14b:	24 18                	and    $0x18,%al
ffff80000010e14d:	18 00                	sbb    %al,(%rax)
ffff80000010e14f:	00 00                	add    %al,(%rax)
ffff80000010e151:	00 00                	add    %al,(%rax)
ffff80000010e153:	00 00                	add    %al,(%rax)
ffff80000010e155:	e7 42                	out    %eax,$0x42
ffff80000010e157:	42 5a                	rex.X pop %rdx
ffff80000010e159:	5a                   	pop    %rdx
ffff80000010e15a:	5a                   	pop    %rdx
ffff80000010e15b:	24 24                	and    $0x24,%al
ffff80000010e15d:	24 00                	and    $0x0,%al
ffff80000010e15f:	00 00                	add    %al,(%rax)
ffff80000010e161:	00 00                	add    %al,(%rax)
ffff80000010e163:	00 00                	add    %al,(%rax)
ffff80000010e165:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010e16a:	28 28                	sub    %ch,(%rax)
ffff80000010e16c:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010e170:	00 00                	add    %al,(%rax)
ffff80000010e172:	00 00                	add    %al,(%rax)
ffff80000010e174:	00 e7                	add    %ah,%bh
ffff80000010e176:	42                   	rex.X
ffff80000010e177:	42 24 24             	rex.X and $0x24,%al
ffff80000010e17a:	24 18                	and    $0x18,%al
ffff80000010e17c:	18 10                	sbb    %dl,(%rax)
ffff80000010e17e:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010e181:	00 00                	add    %al,(%rax)
ffff80000010e183:	00 00                	add    %al,(%rax)
ffff80000010e185:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010e18b:	42 82                	rex.X (bad) 
ffff80000010e18d:	fe 00                	incb   (%rax)
ffff80000010e18f:	00 00                	add    %al,(%rax)
ffff80000010e191:	06                   	(bad)  
ffff80000010e192:	08 10                	or     %dl,(%rax)
ffff80000010e194:	10 10                	adc    %dl,(%rax)
ffff80000010e196:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010e199:	10 10                	adc    %dl,(%rax)
ffff80000010e19b:	10 08                	adc    %cl,(%rax)
ffff80000010e19d:	06                   	(bad)  
ffff80000010e19e:	00 00                	add    %al,(%rax)
ffff80000010e1a0:	10 10                	adc    %dl,(%rax)
ffff80000010e1a2:	10 10                	adc    %dl,(%rax)
ffff80000010e1a4:	10 10                	adc    %dl,(%rax)
ffff80000010e1a6:	10 10                	adc    %dl,(%rax)
ffff80000010e1a8:	10 10                	adc    %dl,(%rax)
ffff80000010e1aa:	10 10                	adc    %dl,(%rax)
ffff80000010e1ac:	10 10                	adc    %dl,(%rax)
ffff80000010e1ae:	10 10                	adc    %dl,(%rax)
ffff80000010e1b0:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010e1b3:	08 08                	or     %cl,(%rax)
ffff80000010e1b5:	08 08                	or     %cl,(%rax)
ffff80000010e1b7:	06                   	(bad)  
ffff80000010e1b8:	08 08                	or     %cl,(%rax)
ffff80000010e1ba:	08 08                	or     %cl,(%rax)
ffff80000010e1bc:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010e1bf:	00 00                	add    %al,(%rax)
ffff80000010e1c1:	72 8c                	jb     ffff80000010e14f <font_ascii+0x76f>
	...
ffff80000010e9df:	00 20                	add    %ah,(%rax)
	...
ffff80000010ea15:	00 00                	add    %al,(%rax)
ffff80000010ea17:	00 40 00             	add    %al,0x0(%rax)
	...
ffff80000010ea4e:	00 00                	add    %al,(%rax)
ffff80000010ea50:	80 00 00             	addb   $0x0,(%rax)
	...
ffff80000010ea87:	00 00                	add    %al,(%rax)
ffff80000010ea89:	01 00                	add    %eax,(%rax)
	...
ffff80000010eabf:	00 00                	add    %al,(%rax)
ffff80000010eac1:	02 00                	add    (%rax),%al
	...
ffff80000010eaf7:	00 00                	add    %al,(%rax)
ffff80000010eaf9:	04 00                	add    $0x0,%al
	...
ffff80000010eb2f:	00 00                	add    %al,(%rax)
ffff80000010eb31:	08 00                	or     %al,(%rax)
	...
ffff80000010eb67:	00 00                	add    %al,(%rax)
ffff80000010eb69:	10 00                	adc    %al,(%rax)
	...
ffff80000010eb9f:	00 00                	add    %al,(%rax)
ffff80000010eba1:	20 00                	and    %al,(%rax)
	...
ffff80000010ebd7:	00 00                	add    %al,(%rax)
ffff80000010ebd9:	40 00 00             	add    %al,(%rax)
	...
ffff80000010ec10:	00 80 00 00 00 00    	add    %al,0x0(%rax)
	...
ffff80000010ec4a:	01 00                	add    %eax,(%rax)
	...
ffff80000010ec80:	00 00                	add    %al,(%rax)
ffff80000010ec82:	02 00                	add    (%rax),%al
	...
ffff80000010ecb8:	00 00                	add    %al,(%rax)
ffff80000010ecba:	04 00                	add    $0x0,%al
	...
ffff80000010ecf0:	00 00                	add    %al,(%rax)
ffff80000010ecf2:	08 00                	or     %al,(%rax)
	...
ffff80000010ed28:	00 00                	add    %al,(%rax)
ffff80000010ed2a:	10 00                	adc    %al,(%rax)
	...
ffff80000010ed60:	20 00                	and    %al,(%rax)
	...
ffff80000010ed96:	00 00                	add    %al,(%rax)
ffff80000010ed98:	40 00 00             	add    %al,(%rax)
	...
ffff80000010edcf:	00 80 00 00 00 00    	add    %al,0x0(%rax)
	...
ffff80000010ee09:	01 00                	add    %eax,(%rax)
	...
ffff80000010ee3f:	00 00                	add    %al,(%rax)
ffff80000010ee41:	02 00                	add    (%rax),%al
	...
ffff80000010ee77:	00 00                	add    %al,(%rax)
ffff80000010ee79:	04 00                	add    $0x0,%al
	...
ffff80000010eeaf:	00 00                	add    %al,(%rax)
ffff80000010eeb1:	08 00                	or     %al,(%rax)
	...
ffff80000010eee7:	00 00                	add    %al,(%rax)
ffff80000010eee9:	10 00                	adc    %al,(%rax)
	...
ffff80000010ef1f:	00 00                	add    %al,(%rax)
ffff80000010ef21:	20 00                	and    %al,(%rax)
	...
ffff80000010ef57:	00 00                	add    %al,(%rax)
ffff80000010ef59:	40 00 00             	add    %al,(%rax)
	...
ffff80000010ef90:	00 80 00 00 00 00    	add    %al,0x0(%rax)
	...
ffff80000010efca:	01 00                	add    %eax,(%rax)
	...
ffff80000010f000:	00 00                	add    %al,(%rax)
ffff80000010f002:	02 00                	add    (%rax),%al
	...
ffff80000010f038:	00 00                	add    %al,(%rax)
ffff80000010f03a:	04 00                	add    $0x0,%al
	...
ffff80000010f070:	00 00                	add    %al,(%rax)
ffff80000010f072:	08 00                	or     %al,(%rax)
	...
ffff80000010f0a8:	00 00                	add    %al,(%rax)
ffff80000010f0aa:	10 00                	adc    %al,(%rax)
	...

Disassembly of section .got:

ffff80000010f0e0 <.got>:
ffff80000010f0e0:	64 40 10 00          	adc    %al,%fs:(%rax)
ffff80000010f0e4:	00 80 ff ff dc 40    	add    %al,0x40dcffff(%rax)
ffff80000010f0ea:	10 00                	adc    %al,(%rax)
ffff80000010f0ec:	00 80 ff ff 27 c5    	add    %al,-0x3ad80001(%rax)
ffff80000010f0f2:	10 00                	adc    %al,(%rax)
ffff80000010f0f4:	00 80 ff ff e2 c5    	add    %al,-0x3a1d0001(%rax)
ffff80000010f0fa:	10 00                	adc    %al,(%rax)
ffff80000010f0fc:	00 80 ff ff f8 41    	add    %al,0x41f8ffff(%rax)
ffff80000010f102:	10 00                	adc    %al,(%rax)
ffff80000010f104:	00 80 ff ff ec d5    	add    %al,-0x2a130001(%rax)
ffff80000010f10a:	10 00                	adc    %al,(%rax)
ffff80000010f10c:	00 80 ff ff 55 41    	add    %al,0x4155ffff(%rax)
ffff80000010f112:	10 00                	adc    %al,(%rax)
ffff80000010f114:	00 80 ff ff ec 40    	add    %al,0x40ecffff(%rax)
ffff80000010f11a:	10 00                	adc    %al,(%rax)
ffff80000010f11c:	00 80 ff ff 68 41    	add    %al,0x4168ffff(%rax)
ffff80000010f122:	10 00                	adc    %al,(%rax)
ffff80000010f124:	00 80 ff ff c5 41    	add    %al,0x41c5ffff(%rax)
ffff80000010f12a:	10 00                	adc    %al,(%rax)
ffff80000010f12c:	00 80 ff ff d6 41    	add    %al,0x41d6ffff(%rax)
ffff80000010f132:	10 00                	adc    %al,(%rax)
ffff80000010f134:	00 80 ff ff e7 41    	add    %al,0x41e7ffff(%rax)
ffff80000010f13a:	10 00                	adc    %al,(%rax)
ffff80000010f13c:	00 80 ff ff 40 02    	add    %al,0x240ffff(%rax)
ffff80000010f142:	11 00                	adc    %eax,(%rax)
ffff80000010f144:	00 80 ff ff 42 41    	add    %al,0x4142ffff(%rax)
ffff80000010f14a:	10 00                	adc    %al,(%rax)
ffff80000010f14c:	00 80 ff ff 7b 41    	add    %al,0x417bffff(%rax)
ffff80000010f152:	10 00                	adc    %al,(%rax)
ffff80000010f154:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f15a:	10 00                	adc    %al,(%rax)
ffff80000010f15c:	00 80 ff ff 2d 42    	add    %al,0x422dffff(%rax)
ffff80000010f162:	10 00                	adc    %al,(%rax)
ffff80000010f164:	00 80 ff ff 1a 42    	add    %al,0x421affff(%rax)
ffff80000010f16a:	10 00                	adc    %al,(%rax)
ffff80000010f16c:	00 80 ff ff a1 41    	add    %al,0x41a1ffff(%rax)
ffff80000010f172:	10 00                	adc    %al,(%rax)
ffff80000010f174:	00 80 ff ff 7f 01    	add    %al,0x17fffff(%rax)
ffff80000010f17a:	10 00                	adc    %al,(%rax)
ffff80000010f17c:	00 80 ff ff 64 42    	add    %al,0x4264ffff(%rax)
ffff80000010f182:	10 00                	adc    %al,(%rax)
ffff80000010f184:	00 80 ff ff 40 c5    	add    %al,-0x3abf0001(%rax)
ffff80000010f18a:	10 00                	adc    %al,(%rax)
ffff80000010f18c:	00 80 ff ff b2 41    	add    %al,0x41b2ffff(%rax)
ffff80000010f192:	10 00                	adc    %al,(%rax)
ffff80000010f194:	00 80 ff ff e0 f0    	add    %al,-0xf1f0001(%rax)
ffff80000010f19a:	10 00                	adc    %al,(%rax)
ffff80000010f19c:	00 80 ff ff 09 42    	add    %al,0x4209ffff(%rax)
ffff80000010f1a2:	10 00                	adc    %al,(%rax)
ffff80000010f1a4:	00 80 ff ff 58 14    	add    %al,0x1458ffff(%rax)
ffff80000010f1aa:	13 00                	adc    (%rax),%eax
ffff80000010f1ac:	00 80 ff ff 3e 42    	add    %al,0x423effff(%rax)
ffff80000010f1b2:	10 00                	adc    %al,(%rax)
ffff80000010f1b4:	00 80 ff ff 60 11    	add    %al,0x1160ffff(%rax)
ffff80000010f1ba:	13 00                	adc    (%rax),%eax
ffff80000010f1bc:	00 80 ff ff 51 42    	add    %al,0x4251ffff(%rax)
ffff80000010f1c2:	10 00                	adc    %al,(%rax)
ffff80000010f1c4:	00 80 ff ff 27 40    	add    %al,0x4027ffff(%rax)
ffff80000010f1ca:	10 00                	adc    %al,(%rax)
ffff80000010f1cc:	00 80 ff ff fc 40    	add    %al,0x40fcffff(%rax)
ffff80000010f1d2:	10 00                	adc    %al,(%rax)
ffff80000010f1d4:	00 80 ff ff 8e 41    	add    %al,0x418effff(%rax)
ffff80000010f1da:	10 00                	adc    %al,(%rax)
ffff80000010f1dc:	00 80 ff ff ae 0e    	add    %al,0xeaeffff(%rax)
ffff80000010f1e2:	11 00                	adc    %eax,(%rax)
ffff80000010f1e4:	00                   	.byte 0x0
ffff80000010f1e5:	80 ff ff             	cmp    $0xff,%bh

Disassembly of section .got.plt:

ffff80000010f1e8 <_GLOBAL_OFFSET_TABLE_>:
	...

Disassembly of section .data.rel.local:

ffff80000010f200 <init_thread>:
ffff80000010f200:	00 00                	add    %al,(%rax)
ffff80000010f202:	12 00                	adc    (%rax),%al
ffff80000010f204:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010f212:	12 00                	adc    (%rax),%al
ffff80000010f214:	00 80 ff ff 10 00    	add    %al,0x10ffff(%rax)
ffff80000010f21a:	00 00                	add    %al,(%rax)
ffff80000010f21c:	00 00                	add    %al,(%rax)
ffff80000010f21e:	00 00                	add    %al,(%rax)
ffff80000010f220:	10 00                	adc    %al,(%rax)
	...

ffff80000010f240 <init_task>:
ffff80000010f240:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010f246:	ff                   	(bad)  
ffff80000010f247:	ff 00                	incl   (%rax)
	...

ffff80000010f280 <init_tss>:
ffff80000010f280:	00 00                	add    %al,(%rax)
ffff80000010f282:	00 00                	add    %al,(%rax)
ffff80000010f284:	00 00                	add    %al,(%rax)
ffff80000010f286:	12 00                	adc    (%rax),%al
ffff80000010f288:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f28e:	12 00                	adc    (%rax),%al
ffff80000010f290:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f296:	12 00                	adc    (%rax),%al
ffff80000010f298:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f29e:	00 00                	add    %al,(%rax)
ffff80000010f2a0:	00 00                	add    %al,(%rax)
ffff80000010f2a2:	00 00                	add    %al,(%rax)
ffff80000010f2a4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010f2a8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f2ae:	00 00                	add    %al,(%rax)
ffff80000010f2b0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f2b6:	00 00                	add    %al,(%rax)
ffff80000010f2b8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f2be:	00 00                	add    %al,(%rax)
ffff80000010f2c0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f2c6:	00 00                	add    %al,(%rax)
ffff80000010f2c8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f2ce:	00 00                	add    %al,(%rax)
ffff80000010f2d0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f2d6:	00 00                	add    %al,(%rax)
ffff80000010f2d8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010f2ee:	12 00                	adc    (%rax),%al
ffff80000010f2f0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f2f6:	12 00                	adc    (%rax),%al
ffff80000010f2f8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f2fe:	12 00                	adc    (%rax),%al
ffff80000010f300:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f306:	00 00                	add    %al,(%rax)
ffff80000010f308:	00 00                	add    %al,(%rax)
ffff80000010f30a:	00 00                	add    %al,(%rax)
ffff80000010f30c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010f310:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f316:	00 00                	add    %al,(%rax)
ffff80000010f318:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f31e:	00 00                	add    %al,(%rax)
ffff80000010f320:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f326:	00 00                	add    %al,(%rax)
ffff80000010f328:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f32e:	00 00                	add    %al,(%rax)
ffff80000010f330:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f336:	00 00                	add    %al,(%rax)
ffff80000010f338:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f33e:	00 00                	add    %al,(%rax)
ffff80000010f340:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010f356:	12 00                	adc    (%rax),%al
ffff80000010f358:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f35e:	12 00                	adc    (%rax),%al
ffff80000010f360:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f366:	12 00                	adc    (%rax),%al
ffff80000010f368:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f36e:	00 00                	add    %al,(%rax)
ffff80000010f370:	00 00                	add    %al,(%rax)
ffff80000010f372:	00 00                	add    %al,(%rax)
ffff80000010f374:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010f378:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f37e:	00 00                	add    %al,(%rax)
ffff80000010f380:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f386:	00 00                	add    %al,(%rax)
ffff80000010f388:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f38e:	00 00                	add    %al,(%rax)
ffff80000010f390:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f396:	00 00                	add    %al,(%rax)
ffff80000010f398:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f39e:	00 00                	add    %al,(%rax)
ffff80000010f3a0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f3a6:	00 00                	add    %al,(%rax)
ffff80000010f3a8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010f3be:	12 00                	adc    (%rax),%al
ffff80000010f3c0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f3c6:	12 00                	adc    (%rax),%al
ffff80000010f3c8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f3ce:	12 00                	adc    (%rax),%al
ffff80000010f3d0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f3d6:	00 00                	add    %al,(%rax)
ffff80000010f3d8:	00 00                	add    %al,(%rax)
ffff80000010f3da:	00 00                	add    %al,(%rax)
ffff80000010f3dc:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010f3e0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f3e6:	00 00                	add    %al,(%rax)
ffff80000010f3e8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f3ee:	00 00                	add    %al,(%rax)
ffff80000010f3f0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f3f6:	00 00                	add    %al,(%rax)
ffff80000010f3f8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f3fe:	00 00                	add    %al,(%rax)
ffff80000010f400:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f406:	00 00                	add    %al,(%rax)
ffff80000010f408:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f40e:	00 00                	add    %al,(%rax)
ffff80000010f410:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010f426:	12 00                	adc    (%rax),%al
ffff80000010f428:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f42e:	12 00                	adc    (%rax),%al
ffff80000010f430:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f436:	12 00                	adc    (%rax),%al
ffff80000010f438:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f43e:	00 00                	add    %al,(%rax)
ffff80000010f440:	00 00                	add    %al,(%rax)
ffff80000010f442:	00 00                	add    %al,(%rax)
ffff80000010f444:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010f448:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f44e:	00 00                	add    %al,(%rax)
ffff80000010f450:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f456:	00 00                	add    %al,(%rax)
ffff80000010f458:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f45e:	00 00                	add    %al,(%rax)
ffff80000010f460:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f466:	00 00                	add    %al,(%rax)
ffff80000010f468:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f46e:	00 00                	add    %al,(%rax)
ffff80000010f470:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f476:	00 00                	add    %al,(%rax)
ffff80000010f478:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010f48e:	12 00                	adc    (%rax),%al
ffff80000010f490:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f496:	12 00                	adc    (%rax),%al
ffff80000010f498:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f49e:	12 00                	adc    (%rax),%al
ffff80000010f4a0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f4a6:	00 00                	add    %al,(%rax)
ffff80000010f4a8:	00 00                	add    %al,(%rax)
ffff80000010f4aa:	00 00                	add    %al,(%rax)
ffff80000010f4ac:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010f4b0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f4b6:	00 00                	add    %al,(%rax)
ffff80000010f4b8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f4be:	00 00                	add    %al,(%rax)
ffff80000010f4c0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f4c6:	00 00                	add    %al,(%rax)
ffff80000010f4c8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f4ce:	00 00                	add    %al,(%rax)
ffff80000010f4d0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f4d6:	00 00                	add    %al,(%rax)
ffff80000010f4d8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f4de:	00 00                	add    %al,(%rax)
ffff80000010f4e0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010f4f6:	12 00                	adc    (%rax),%al
ffff80000010f4f8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f4fe:	12 00                	adc    (%rax),%al
ffff80000010f500:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f506:	12 00                	adc    (%rax),%al
ffff80000010f508:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f50e:	00 00                	add    %al,(%rax)
ffff80000010f510:	00 00                	add    %al,(%rax)
ffff80000010f512:	00 00                	add    %al,(%rax)
ffff80000010f514:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010f518:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f51e:	00 00                	add    %al,(%rax)
ffff80000010f520:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f526:	00 00                	add    %al,(%rax)
ffff80000010f528:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f52e:	00 00                	add    %al,(%rax)
ffff80000010f530:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f536:	00 00                	add    %al,(%rax)
ffff80000010f538:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f53e:	00 00                	add    %al,(%rax)
ffff80000010f540:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f546:	00 00                	add    %al,(%rax)
ffff80000010f548:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010f55e:	12 00                	adc    (%rax),%al
ffff80000010f560:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f566:	12 00                	adc    (%rax),%al
ffff80000010f568:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f56e:	12 00                	adc    (%rax),%al
ffff80000010f570:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f576:	00 00                	add    %al,(%rax)
ffff80000010f578:	00 00                	add    %al,(%rax)
ffff80000010f57a:	00 00                	add    %al,(%rax)
ffff80000010f57c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010f580:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f586:	00 00                	add    %al,(%rax)
ffff80000010f588:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f58e:	00 00                	add    %al,(%rax)
ffff80000010f590:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f596:	00 00                	add    %al,(%rax)
ffff80000010f598:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f59e:	00 00                	add    %al,(%rax)
ffff80000010f5a0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f5a6:	00 00                	add    %al,(%rax)
ffff80000010f5a8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010f5ae:	00 00                	add    %al,(%rax)
ffff80000010f5b0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...

ffff80000010f5c0 <system_call_table>:
ffff80000010f5c0:	0d 46 10 00 00       	or     $0x1046,%eax
ffff80000010f5c5:	80 ff ff             	cmp    $0xff,%bh
ffff80000010f5c8:	7c 46                	jl     ffff80000010f610 <system_call_table+0x50>
ffff80000010f5ca:	10 00                	adc    %al,(%rax)
ffff80000010f5cc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f5d2:	10 00                	adc    %al,(%rax)
ffff80000010f5d4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f5da:	10 00                	adc    %al,(%rax)
ffff80000010f5dc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f5e2:	10 00                	adc    %al,(%rax)
ffff80000010f5e4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f5ea:	10 00                	adc    %al,(%rax)
ffff80000010f5ec:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f5f2:	10 00                	adc    %al,(%rax)
ffff80000010f5f4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f5fa:	10 00                	adc    %al,(%rax)
ffff80000010f5fc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f602:	10 00                	adc    %al,(%rax)
ffff80000010f604:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f60a:	10 00                	adc    %al,(%rax)
ffff80000010f60c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f612:	10 00                	adc    %al,(%rax)
ffff80000010f614:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f61a:	10 00                	adc    %al,(%rax)
ffff80000010f61c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f622:	10 00                	adc    %al,(%rax)
ffff80000010f624:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f62a:	10 00                	adc    %al,(%rax)
ffff80000010f62c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f632:	10 00                	adc    %al,(%rax)
ffff80000010f634:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f63a:	10 00                	adc    %al,(%rax)
ffff80000010f63c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f642:	10 00                	adc    %al,(%rax)
ffff80000010f644:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f64a:	10 00                	adc    %al,(%rax)
ffff80000010f64c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f652:	10 00                	adc    %al,(%rax)
ffff80000010f654:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f65a:	10 00                	adc    %al,(%rax)
ffff80000010f65c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f662:	10 00                	adc    %al,(%rax)
ffff80000010f664:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f66a:	10 00                	adc    %al,(%rax)
ffff80000010f66c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f672:	10 00                	adc    %al,(%rax)
ffff80000010f674:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f67a:	10 00                	adc    %al,(%rax)
ffff80000010f67c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f682:	10 00                	adc    %al,(%rax)
ffff80000010f684:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f68a:	10 00                	adc    %al,(%rax)
ffff80000010f68c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f692:	10 00                	adc    %al,(%rax)
ffff80000010f694:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f69a:	10 00                	adc    %al,(%rax)
ffff80000010f69c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f6a2:	10 00                	adc    %al,(%rax)
ffff80000010f6a4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f6aa:	10 00                	adc    %al,(%rax)
ffff80000010f6ac:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f6b2:	10 00                	adc    %al,(%rax)
ffff80000010f6b4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f6ba:	10 00                	adc    %al,(%rax)
ffff80000010f6bc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f6c2:	10 00                	adc    %al,(%rax)
ffff80000010f6c4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f6ca:	10 00                	adc    %al,(%rax)
ffff80000010f6cc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f6d2:	10 00                	adc    %al,(%rax)
ffff80000010f6d4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f6da:	10 00                	adc    %al,(%rax)
ffff80000010f6dc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f6e2:	10 00                	adc    %al,(%rax)
ffff80000010f6e4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f6ea:	10 00                	adc    %al,(%rax)
ffff80000010f6ec:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f6f2:	10 00                	adc    %al,(%rax)
ffff80000010f6f4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f6fa:	10 00                	adc    %al,(%rax)
ffff80000010f6fc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f702:	10 00                	adc    %al,(%rax)
ffff80000010f704:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f70a:	10 00                	adc    %al,(%rax)
ffff80000010f70c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f712:	10 00                	adc    %al,(%rax)
ffff80000010f714:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f71a:	10 00                	adc    %al,(%rax)
ffff80000010f71c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f722:	10 00                	adc    %al,(%rax)
ffff80000010f724:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f72a:	10 00                	adc    %al,(%rax)
ffff80000010f72c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f732:	10 00                	adc    %al,(%rax)
ffff80000010f734:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f73a:	10 00                	adc    %al,(%rax)
ffff80000010f73c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f742:	10 00                	adc    %al,(%rax)
ffff80000010f744:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f74a:	10 00                	adc    %al,(%rax)
ffff80000010f74c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f752:	10 00                	adc    %al,(%rax)
ffff80000010f754:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f75a:	10 00                	adc    %al,(%rax)
ffff80000010f75c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f762:	10 00                	adc    %al,(%rax)
ffff80000010f764:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f76a:	10 00                	adc    %al,(%rax)
ffff80000010f76c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f772:	10 00                	adc    %al,(%rax)
ffff80000010f774:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f77a:	10 00                	adc    %al,(%rax)
ffff80000010f77c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f782:	10 00                	adc    %al,(%rax)
ffff80000010f784:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f78a:	10 00                	adc    %al,(%rax)
ffff80000010f78c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f792:	10 00                	adc    %al,(%rax)
ffff80000010f794:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f79a:	10 00                	adc    %al,(%rax)
ffff80000010f79c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f7a2:	10 00                	adc    %al,(%rax)
ffff80000010f7a4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f7aa:	10 00                	adc    %al,(%rax)
ffff80000010f7ac:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f7b2:	10 00                	adc    %al,(%rax)
ffff80000010f7b4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f7ba:	10 00                	adc    %al,(%rax)
ffff80000010f7bc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f7c2:	10 00                	adc    %al,(%rax)
ffff80000010f7c4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f7ca:	10 00                	adc    %al,(%rax)
ffff80000010f7cc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f7d2:	10 00                	adc    %al,(%rax)
ffff80000010f7d4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f7da:	10 00                	adc    %al,(%rax)
ffff80000010f7dc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f7e2:	10 00                	adc    %al,(%rax)
ffff80000010f7e4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f7ea:	10 00                	adc    %al,(%rax)
ffff80000010f7ec:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f7f2:	10 00                	adc    %al,(%rax)
ffff80000010f7f4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f7fa:	10 00                	adc    %al,(%rax)
ffff80000010f7fc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f802:	10 00                	adc    %al,(%rax)
ffff80000010f804:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f80a:	10 00                	adc    %al,(%rax)
ffff80000010f80c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f812:	10 00                	adc    %al,(%rax)
ffff80000010f814:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f81a:	10 00                	adc    %al,(%rax)
ffff80000010f81c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f822:	10 00                	adc    %al,(%rax)
ffff80000010f824:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f82a:	10 00                	adc    %al,(%rax)
ffff80000010f82c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f832:	10 00                	adc    %al,(%rax)
ffff80000010f834:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f83a:	10 00                	adc    %al,(%rax)
ffff80000010f83c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f842:	10 00                	adc    %al,(%rax)
ffff80000010f844:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f84a:	10 00                	adc    %al,(%rax)
ffff80000010f84c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f852:	10 00                	adc    %al,(%rax)
ffff80000010f854:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f85a:	10 00                	adc    %al,(%rax)
ffff80000010f85c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f862:	10 00                	adc    %al,(%rax)
ffff80000010f864:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f86a:	10 00                	adc    %al,(%rax)
ffff80000010f86c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f872:	10 00                	adc    %al,(%rax)
ffff80000010f874:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f87a:	10 00                	adc    %al,(%rax)
ffff80000010f87c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f882:	10 00                	adc    %al,(%rax)
ffff80000010f884:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f88a:	10 00                	adc    %al,(%rax)
ffff80000010f88c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f892:	10 00                	adc    %al,(%rax)
ffff80000010f894:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f89a:	10 00                	adc    %al,(%rax)
ffff80000010f89c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f8a2:	10 00                	adc    %al,(%rax)
ffff80000010f8a4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f8aa:	10 00                	adc    %al,(%rax)
ffff80000010f8ac:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f8b2:	10 00                	adc    %al,(%rax)
ffff80000010f8b4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f8ba:	10 00                	adc    %al,(%rax)
ffff80000010f8bc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f8c2:	10 00                	adc    %al,(%rax)
ffff80000010f8c4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f8ca:	10 00                	adc    %al,(%rax)
ffff80000010f8cc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f8d2:	10 00                	adc    %al,(%rax)
ffff80000010f8d4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f8da:	10 00                	adc    %al,(%rax)
ffff80000010f8dc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f8e2:	10 00                	adc    %al,(%rax)
ffff80000010f8e4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f8ea:	10 00                	adc    %al,(%rax)
ffff80000010f8ec:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f8f2:	10 00                	adc    %al,(%rax)
ffff80000010f8f4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f8fa:	10 00                	adc    %al,(%rax)
ffff80000010f8fc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f902:	10 00                	adc    %al,(%rax)
ffff80000010f904:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f90a:	10 00                	adc    %al,(%rax)
ffff80000010f90c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f912:	10 00                	adc    %al,(%rax)
ffff80000010f914:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f91a:	10 00                	adc    %al,(%rax)
ffff80000010f91c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f922:	10 00                	adc    %al,(%rax)
ffff80000010f924:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f92a:	10 00                	adc    %al,(%rax)
ffff80000010f92c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f932:	10 00                	adc    %al,(%rax)
ffff80000010f934:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f93a:	10 00                	adc    %al,(%rax)
ffff80000010f93c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f942:	10 00                	adc    %al,(%rax)
ffff80000010f944:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f94a:	10 00                	adc    %al,(%rax)
ffff80000010f94c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f952:	10 00                	adc    %al,(%rax)
ffff80000010f954:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f95a:	10 00                	adc    %al,(%rax)
ffff80000010f95c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f962:	10 00                	adc    %al,(%rax)
ffff80000010f964:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f96a:	10 00                	adc    %al,(%rax)
ffff80000010f96c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f972:	10 00                	adc    %al,(%rax)
ffff80000010f974:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f97a:	10 00                	adc    %al,(%rax)
ffff80000010f97c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f982:	10 00                	adc    %al,(%rax)
ffff80000010f984:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f98a:	10 00                	adc    %al,(%rax)
ffff80000010f98c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f992:	10 00                	adc    %al,(%rax)
ffff80000010f994:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f99a:	10 00                	adc    %al,(%rax)
ffff80000010f99c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f9a2:	10 00                	adc    %al,(%rax)
ffff80000010f9a4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f9aa:	10 00                	adc    %al,(%rax)
ffff80000010f9ac:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f9b2:	10 00                	adc    %al,(%rax)
ffff80000010f9b4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010f9ba:	10 00                	adc    %al,(%rax)
ffff80000010f9bc:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010f9c2:	12 00                	adc    (%rax),%al
ffff80000010f9c4:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010f9d2:	12 00                	adc    (%rax),%al
ffff80000010f9d4:	00 80 ff ff 10 00    	add    %al,0x10ffff(%rax)
ffff80000010f9da:	00 00                	add    %al,(%rax)
ffff80000010f9dc:	00 00                	add    %al,(%rax)
ffff80000010f9de:	00 00                	add    %al,(%rax)
ffff80000010f9e0:	10 00                	adc    %al,(%rax)
	...
ffff80000010f9fe:	00 00                	add    %al,(%rax)
ffff80000010fa00:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010fa06:	ff                   	(bad)  
ffff80000010fa07:	ff 00                	incl   (%rax)
	...
ffff80000010fa45:	00 12                	add    %dl,(%rdx)
ffff80000010fa47:	00 00                	add    %al,(%rax)
ffff80000010fa49:	80 ff ff             	cmp    $0xff,%bh
ffff80000010fa4c:	00 00                	add    %al,(%rax)
ffff80000010fa4e:	12 00                	adc    (%rax),%al
ffff80000010fa50:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010fa56:	12 00                	adc    (%rax),%al
ffff80000010fa58:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010fa5e:	00 00                	add    %al,(%rax)
ffff80000010fa60:	00 00                	add    %al,(%rax)
ffff80000010fa62:	00 00                	add    %al,(%rax)
ffff80000010fa64:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010fa68:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fa6e:	00 00                	add    %al,(%rax)
ffff80000010fa70:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fa76:	00 00                	add    %al,(%rax)
ffff80000010fa78:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fa7e:	00 00                	add    %al,(%rax)
ffff80000010fa80:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fa86:	00 00                	add    %al,(%rax)
ffff80000010fa88:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fa8e:	00 00                	add    %al,(%rax)
ffff80000010fa90:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fa96:	00 00                	add    %al,(%rax)
ffff80000010fa98:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010faae:	12 00                	adc    (%rax),%al
ffff80000010fab0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010fab6:	12 00                	adc    (%rax),%al
ffff80000010fab8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010fabe:	12 00                	adc    (%rax),%al
ffff80000010fac0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010fac6:	00 00                	add    %al,(%rax)
ffff80000010fac8:	00 00                	add    %al,(%rax)
ffff80000010faca:	00 00                	add    %al,(%rax)
ffff80000010facc:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010fad0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fad6:	00 00                	add    %al,(%rax)
ffff80000010fad8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fade:	00 00                	add    %al,(%rax)
ffff80000010fae0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fae6:	00 00                	add    %al,(%rax)
ffff80000010fae8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010faee:	00 00                	add    %al,(%rax)
ffff80000010faf0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010faf6:	00 00                	add    %al,(%rax)
ffff80000010faf8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fafe:	00 00                	add    %al,(%rax)
ffff80000010fb00:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010fb16:	12 00                	adc    (%rax),%al
ffff80000010fb18:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010fb1e:	12 00                	adc    (%rax),%al
ffff80000010fb20:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010fb26:	12 00                	adc    (%rax),%al
ffff80000010fb28:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010fb2e:	00 00                	add    %al,(%rax)
ffff80000010fb30:	00 00                	add    %al,(%rax)
ffff80000010fb32:	00 00                	add    %al,(%rax)
ffff80000010fb34:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010fb38:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fb3e:	00 00                	add    %al,(%rax)
ffff80000010fb40:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fb46:	00 00                	add    %al,(%rax)
ffff80000010fb48:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fb4e:	00 00                	add    %al,(%rax)
ffff80000010fb50:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fb56:	00 00                	add    %al,(%rax)
ffff80000010fb58:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fb5e:	00 00                	add    %al,(%rax)
ffff80000010fb60:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fb66:	00 00                	add    %al,(%rax)
ffff80000010fb68:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010fb7e:	12 00                	adc    (%rax),%al
ffff80000010fb80:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010fb86:	12 00                	adc    (%rax),%al
ffff80000010fb88:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010fb8e:	12 00                	adc    (%rax),%al
ffff80000010fb90:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010fb96:	00 00                	add    %al,(%rax)
ffff80000010fb98:	00 00                	add    %al,(%rax)
ffff80000010fb9a:	00 00                	add    %al,(%rax)
ffff80000010fb9c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010fba0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fba6:	00 00                	add    %al,(%rax)
ffff80000010fba8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fbae:	00 00                	add    %al,(%rax)
ffff80000010fbb0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fbb6:	00 00                	add    %al,(%rax)
ffff80000010fbb8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fbbe:	00 00                	add    %al,(%rax)
ffff80000010fbc0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fbc6:	00 00                	add    %al,(%rax)
ffff80000010fbc8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fbce:	00 00                	add    %al,(%rax)
ffff80000010fbd0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010fbe6:	12 00                	adc    (%rax),%al
ffff80000010fbe8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010fbee:	12 00                	adc    (%rax),%al
ffff80000010fbf0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010fbf6:	12 00                	adc    (%rax),%al
ffff80000010fbf8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010fbfe:	00 00                	add    %al,(%rax)
ffff80000010fc00:	00 00                	add    %al,(%rax)
ffff80000010fc02:	00 00                	add    %al,(%rax)
ffff80000010fc04:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010fc08:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fc0e:	00 00                	add    %al,(%rax)
ffff80000010fc10:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fc16:	00 00                	add    %al,(%rax)
ffff80000010fc18:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fc1e:	00 00                	add    %al,(%rax)
ffff80000010fc20:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fc26:	00 00                	add    %al,(%rax)
ffff80000010fc28:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fc2e:	00 00                	add    %al,(%rax)
ffff80000010fc30:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fc36:	00 00                	add    %al,(%rax)
ffff80000010fc38:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010fc4e:	12 00                	adc    (%rax),%al
ffff80000010fc50:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010fc56:	12 00                	adc    (%rax),%al
ffff80000010fc58:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010fc5e:	12 00                	adc    (%rax),%al
ffff80000010fc60:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010fc66:	00 00                	add    %al,(%rax)
ffff80000010fc68:	00 00                	add    %al,(%rax)
ffff80000010fc6a:	00 00                	add    %al,(%rax)
ffff80000010fc6c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010fc70:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fc76:	00 00                	add    %al,(%rax)
ffff80000010fc78:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fc7e:	00 00                	add    %al,(%rax)
ffff80000010fc80:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fc86:	00 00                	add    %al,(%rax)
ffff80000010fc88:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fc8e:	00 00                	add    %al,(%rax)
ffff80000010fc90:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fc96:	00 00                	add    %al,(%rax)
ffff80000010fc98:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fc9e:	00 00                	add    %al,(%rax)
ffff80000010fca0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010fcb6:	12 00                	adc    (%rax),%al
ffff80000010fcb8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010fcbe:	12 00                	adc    (%rax),%al
ffff80000010fcc0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010fcc6:	12 00                	adc    (%rax),%al
ffff80000010fcc8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010fcce:	00 00                	add    %al,(%rax)
ffff80000010fcd0:	00 00                	add    %al,(%rax)
ffff80000010fcd2:	00 00                	add    %al,(%rax)
ffff80000010fcd4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010fcd8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fcde:	00 00                	add    %al,(%rax)
ffff80000010fce0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fce6:	00 00                	add    %al,(%rax)
ffff80000010fce8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fcee:	00 00                	add    %al,(%rax)
ffff80000010fcf0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fcf6:	00 00                	add    %al,(%rax)
ffff80000010fcf8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fcfe:	00 00                	add    %al,(%rax)
ffff80000010fd00:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fd06:	00 00                	add    %al,(%rax)
ffff80000010fd08:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010fd1e:	12 00                	adc    (%rax),%al
ffff80000010fd20:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010fd26:	12 00                	adc    (%rax),%al
ffff80000010fd28:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010fd2e:	12 00                	adc    (%rax),%al
ffff80000010fd30:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010fd36:	00 00                	add    %al,(%rax)
ffff80000010fd38:	00 00                	add    %al,(%rax)
ffff80000010fd3a:	00 00                	add    %al,(%rax)
ffff80000010fd3c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010fd40:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fd46:	00 00                	add    %al,(%rax)
ffff80000010fd48:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fd4e:	00 00                	add    %al,(%rax)
ffff80000010fd50:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fd56:	00 00                	add    %al,(%rax)
ffff80000010fd58:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fd5e:	00 00                	add    %al,(%rax)
ffff80000010fd60:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fd66:	00 00                	add    %al,(%rax)
ffff80000010fd68:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010fd6e:	00 00                	add    %al,(%rax)
ffff80000010fd70:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010fd7e:	00 00                	add    %al,(%rax)
ffff80000010fd80:	0d 46 10 00 00       	or     $0x1046,%eax
ffff80000010fd85:	80 ff ff             	cmp    $0xff,%bh
ffff80000010fd88:	7c 46                	jl     ffff80000010fdd0 <system_call_table+0x810>
ffff80000010fd8a:	10 00                	adc    %al,(%rax)
ffff80000010fd8c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fd92:	10 00                	adc    %al,(%rax)
ffff80000010fd94:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fd9a:	10 00                	adc    %al,(%rax)
ffff80000010fd9c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fda2:	10 00                	adc    %al,(%rax)
ffff80000010fda4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fdaa:	10 00                	adc    %al,(%rax)
ffff80000010fdac:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fdb2:	10 00                	adc    %al,(%rax)
ffff80000010fdb4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fdba:	10 00                	adc    %al,(%rax)
ffff80000010fdbc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fdc2:	10 00                	adc    %al,(%rax)
ffff80000010fdc4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fdca:	10 00                	adc    %al,(%rax)
ffff80000010fdcc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fdd2:	10 00                	adc    %al,(%rax)
ffff80000010fdd4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fdda:	10 00                	adc    %al,(%rax)
ffff80000010fddc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fde2:	10 00                	adc    %al,(%rax)
ffff80000010fde4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fdea:	10 00                	adc    %al,(%rax)
ffff80000010fdec:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fdf2:	10 00                	adc    %al,(%rax)
ffff80000010fdf4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fdfa:	10 00                	adc    %al,(%rax)
ffff80000010fdfc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fe02:	10 00                	adc    %al,(%rax)
ffff80000010fe04:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fe0a:	10 00                	adc    %al,(%rax)
ffff80000010fe0c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fe12:	10 00                	adc    %al,(%rax)
ffff80000010fe14:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fe1a:	10 00                	adc    %al,(%rax)
ffff80000010fe1c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fe22:	10 00                	adc    %al,(%rax)
ffff80000010fe24:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fe2a:	10 00                	adc    %al,(%rax)
ffff80000010fe2c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fe32:	10 00                	adc    %al,(%rax)
ffff80000010fe34:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fe3a:	10 00                	adc    %al,(%rax)
ffff80000010fe3c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fe42:	10 00                	adc    %al,(%rax)
ffff80000010fe44:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fe4a:	10 00                	adc    %al,(%rax)
ffff80000010fe4c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fe52:	10 00                	adc    %al,(%rax)
ffff80000010fe54:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fe5a:	10 00                	adc    %al,(%rax)
ffff80000010fe5c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fe62:	10 00                	adc    %al,(%rax)
ffff80000010fe64:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fe6a:	10 00                	adc    %al,(%rax)
ffff80000010fe6c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fe72:	10 00                	adc    %al,(%rax)
ffff80000010fe74:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fe7a:	10 00                	adc    %al,(%rax)
ffff80000010fe7c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fe82:	10 00                	adc    %al,(%rax)
ffff80000010fe84:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fe8a:	10 00                	adc    %al,(%rax)
ffff80000010fe8c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fe92:	10 00                	adc    %al,(%rax)
ffff80000010fe94:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fe9a:	10 00                	adc    %al,(%rax)
ffff80000010fe9c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fea2:	10 00                	adc    %al,(%rax)
ffff80000010fea4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010feaa:	10 00                	adc    %al,(%rax)
ffff80000010feac:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010feb2:	10 00                	adc    %al,(%rax)
ffff80000010feb4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010feba:	10 00                	adc    %al,(%rax)
ffff80000010febc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fec2:	10 00                	adc    %al,(%rax)
ffff80000010fec4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010feca:	10 00                	adc    %al,(%rax)
ffff80000010fecc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fed2:	10 00                	adc    %al,(%rax)
ffff80000010fed4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010feda:	10 00                	adc    %al,(%rax)
ffff80000010fedc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fee2:	10 00                	adc    %al,(%rax)
ffff80000010fee4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010feea:	10 00                	adc    %al,(%rax)
ffff80000010feec:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fef2:	10 00                	adc    %al,(%rax)
ffff80000010fef4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fefa:	10 00                	adc    %al,(%rax)
ffff80000010fefc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ff02:	10 00                	adc    %al,(%rax)
ffff80000010ff04:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ff0a:	10 00                	adc    %al,(%rax)
ffff80000010ff0c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ff12:	10 00                	adc    %al,(%rax)
ffff80000010ff14:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ff1a:	10 00                	adc    %al,(%rax)
ffff80000010ff1c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ff22:	10 00                	adc    %al,(%rax)
ffff80000010ff24:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ff2a:	10 00                	adc    %al,(%rax)
ffff80000010ff2c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ff32:	10 00                	adc    %al,(%rax)
ffff80000010ff34:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ff3a:	10 00                	adc    %al,(%rax)
ffff80000010ff3c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ff42:	10 00                	adc    %al,(%rax)
ffff80000010ff44:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ff4a:	10 00                	adc    %al,(%rax)
ffff80000010ff4c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ff52:	10 00                	adc    %al,(%rax)
ffff80000010ff54:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ff5a:	10 00                	adc    %al,(%rax)
ffff80000010ff5c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ff62:	10 00                	adc    %al,(%rax)
ffff80000010ff64:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ff6a:	10 00                	adc    %al,(%rax)
ffff80000010ff6c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ff72:	10 00                	adc    %al,(%rax)
ffff80000010ff74:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ff7a:	10 00                	adc    %al,(%rax)
ffff80000010ff7c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ff82:	10 00                	adc    %al,(%rax)
ffff80000010ff84:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ff8a:	10 00                	adc    %al,(%rax)
ffff80000010ff8c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ff92:	10 00                	adc    %al,(%rax)
ffff80000010ff94:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ff9a:	10 00                	adc    %al,(%rax)
ffff80000010ff9c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ffa2:	10 00                	adc    %al,(%rax)
ffff80000010ffa4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ffaa:	10 00                	adc    %al,(%rax)
ffff80000010ffac:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ffb2:	10 00                	adc    %al,(%rax)
ffff80000010ffb4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ffba:	10 00                	adc    %al,(%rax)
ffff80000010ffbc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ffc2:	10 00                	adc    %al,(%rax)
ffff80000010ffc4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ffca:	10 00                	adc    %al,(%rax)
ffff80000010ffcc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ffd2:	10 00                	adc    %al,(%rax)
ffff80000010ffd4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ffda:	10 00                	adc    %al,(%rax)
ffff80000010ffdc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ffe2:	10 00                	adc    %al,(%rax)
ffff80000010ffe4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ffea:	10 00                	adc    %al,(%rax)
ffff80000010ffec:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fff2:	10 00                	adc    %al,(%rax)
ffff80000010fff4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010fffa:	10 00                	adc    %al,(%rax)
ffff80000010fffc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff800000110002:	10 00                	adc    %al,(%rax)
ffff800000110004:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000011000a:	10 00                	adc    %al,(%rax)
ffff80000011000c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff800000110012:	10 00                	adc    %al,(%rax)
ffff800000110014:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000011001a:	10 00                	adc    %al,(%rax)
ffff80000011001c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff800000110022:	10 00                	adc    %al,(%rax)
ffff800000110024:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000011002a:	10 00                	adc    %al,(%rax)
ffff80000011002c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff800000110032:	10 00                	adc    %al,(%rax)
ffff800000110034:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000011003a:	10 00                	adc    %al,(%rax)
ffff80000011003c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff800000110042:	10 00                	adc    %al,(%rax)
ffff800000110044:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000011004a:	10 00                	adc    %al,(%rax)
ffff80000011004c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff800000110052:	10 00                	adc    %al,(%rax)
ffff800000110054:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000011005a:	10 00                	adc    %al,(%rax)
ffff80000011005c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff800000110062:	10 00                	adc    %al,(%rax)
ffff800000110064:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000011006a:	10 00                	adc    %al,(%rax)
ffff80000011006c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff800000110072:	10 00                	adc    %al,(%rax)
ffff800000110074:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000011007a:	10 00                	adc    %al,(%rax)
ffff80000011007c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff800000110082:	10 00                	adc    %al,(%rax)
ffff800000110084:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000011008a:	10 00                	adc    %al,(%rax)
ffff80000011008c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff800000110092:	10 00                	adc    %al,(%rax)
ffff800000110094:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000011009a:	10 00                	adc    %al,(%rax)
ffff80000011009c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff8000001100a2:	10 00                	adc    %al,(%rax)
ffff8000001100a4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff8000001100aa:	10 00                	adc    %al,(%rax)
ffff8000001100ac:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff8000001100b2:	10 00                	adc    %al,(%rax)
ffff8000001100b4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff8000001100ba:	10 00                	adc    %al,(%rax)
ffff8000001100bc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff8000001100c2:	10 00                	adc    %al,(%rax)
ffff8000001100c4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff8000001100ca:	10 00                	adc    %al,(%rax)
ffff8000001100cc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff8000001100d2:	10 00                	adc    %al,(%rax)
ffff8000001100d4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff8000001100da:	10 00                	adc    %al,(%rax)
ffff8000001100dc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff8000001100e2:	10 00                	adc    %al,(%rax)
ffff8000001100e4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff8000001100ea:	10 00                	adc    %al,(%rax)
ffff8000001100ec:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff8000001100f2:	10 00                	adc    %al,(%rax)
ffff8000001100f4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff8000001100fa:	10 00                	adc    %al,(%rax)
ffff8000001100fc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff800000110102:	10 00                	adc    %al,(%rax)
ffff800000110104:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000011010a:	10 00                	adc    %al,(%rax)
ffff80000011010c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff800000110112:	10 00                	adc    %al,(%rax)
ffff800000110114:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000011011a:	10 00                	adc    %al,(%rax)
ffff80000011011c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff800000110122:	10 00                	adc    %al,(%rax)
ffff800000110124:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000011012a:	10 00                	adc    %al,(%rax)
ffff80000011012c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff800000110132:	10 00                	adc    %al,(%rax)
ffff800000110134:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000011013a:	10 00                	adc    %al,(%rax)
ffff80000011013c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff800000110142:	10 00                	adc    %al,(%rax)
ffff800000110144:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000011014a:	10 00                	adc    %al,(%rax)
ffff80000011014c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff800000110152:	10 00                	adc    %al,(%rax)
ffff800000110154:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000011015a:	10 00                	adc    %al,(%rax)
ffff80000011015c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff800000110162:	10 00                	adc    %al,(%rax)
ffff800000110164:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000011016a:	10 00                	adc    %al,(%rax)
ffff80000011016c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff800000110172:	10 00                	adc    %al,(%rax)
ffff800000110174:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000011017a:	10 00                	adc    %al,(%rax)
ffff80000011017c:	00                   	.byte 0x0
ffff80000011017d:	80 ff ff             	cmp    $0xff,%bh

Disassembly of section .data.rel:

ffff800000110180 <interrupt>:
ffff800000110180:	2c a9                	sub    $0xa9,%al
ffff800000110182:	10 00                	adc    %al,(%rax)
ffff800000110184:	00 80 ff ff 76 a9    	add    %al,-0x56890001(%rax)
ffff80000011018a:	10 00                	adc    %al,(%rax)
ffff80000011018c:	00 80 ff ff c0 a9    	add    %al,-0x563f0001(%rax)
ffff800000110192:	10 00                	adc    %al,(%rax)
ffff800000110194:	00 80 ff ff 0a aa    	add    %al,-0x55f50001(%rax)
ffff80000011019a:	10 00                	adc    %al,(%rax)
ffff80000011019c:	00 80 ff ff 54 aa    	add    %al,-0x55ab0001(%rax)
ffff8000001101a2:	10 00                	adc    %al,(%rax)
ffff8000001101a4:	00 80 ff ff 9e aa    	add    %al,-0x55610001(%rax)
ffff8000001101aa:	10 00                	adc    %al,(%rax)
ffff8000001101ac:	00 80 ff ff e8 aa    	add    %al,-0x55170001(%rax)
ffff8000001101b2:	10 00                	adc    %al,(%rax)
ffff8000001101b4:	00 80 ff ff 32 ab    	add    %al,-0x54cd0001(%rax)
ffff8000001101ba:	10 00                	adc    %al,(%rax)
ffff8000001101bc:	00 80 ff ff 7c ab    	add    %al,-0x54830001(%rax)
ffff8000001101c2:	10 00                	adc    %al,(%rax)
ffff8000001101c4:	00 80 ff ff c6 ab    	add    %al,-0x54390001(%rax)
ffff8000001101ca:	10 00                	adc    %al,(%rax)
ffff8000001101cc:	00 80 ff ff 10 ac    	add    %al,-0x53ef0001(%rax)
ffff8000001101d2:	10 00                	adc    %al,(%rax)
ffff8000001101d4:	00 80 ff ff 5a ac    	add    %al,-0x53a50001(%rax)
ffff8000001101da:	10 00                	adc    %al,(%rax)
ffff8000001101dc:	00 80 ff ff a4 ac    	add    %al,-0x535b0001(%rax)
ffff8000001101e2:	10 00                	adc    %al,(%rax)
ffff8000001101e4:	00 80 ff ff ee ac    	add    %al,-0x53110001(%rax)
ffff8000001101ea:	10 00                	adc    %al,(%rax)
ffff8000001101ec:	00 80 ff ff 38 ad    	add    %al,-0x52c70001(%rax)
ffff8000001101f2:	10 00                	adc    %al,(%rax)
ffff8000001101f4:	00 80 ff ff 82 ad    	add    %al,-0x527d0001(%rax)
ffff8000001101fa:	10 00                	adc    %al,(%rax)
ffff8000001101fc:	00 80 ff ff cc ad    	add    %al,-0x52330001(%rax)
ffff800000110202:	10 00                	adc    %al,(%rax)
ffff800000110204:	00 80 ff ff 16 ae    	add    %al,-0x51e90001(%rax)
ffff80000011020a:	10 00                	adc    %al,(%rax)
ffff80000011020c:	00 80 ff ff 60 ae    	add    %al,-0x519f0001(%rax)
ffff800000110212:	10 00                	adc    %al,(%rax)
ffff800000110214:	00 80 ff ff aa ae    	add    %al,-0x51550001(%rax)
ffff80000011021a:	10 00                	adc    %al,(%rax)
ffff80000011021c:	00 80 ff ff f4 ae    	add    %al,-0x510b0001(%rax)
ffff800000110222:	10 00                	adc    %al,(%rax)
ffff800000110224:	00 80 ff ff 3e af    	add    %al,-0x50c10001(%rax)
ffff80000011022a:	10 00                	adc    %al,(%rax)
ffff80000011022c:	00 80 ff ff 88 af    	add    %al,-0x50770001(%rax)
ffff800000110232:	10 00                	adc    %al,(%rax)
ffff800000110234:	00 80 ff ff d2 af    	add    %al,-0x502d0001(%rax)
ffff80000011023a:	10 00                	adc    %al,(%rax)
ffff80000011023c:	00                   	.byte 0x0
ffff80000011023d:	80 ff ff             	cmp    $0xff,%bh

Disassembly of section .rodata:

ffff800000110240 <_rodata>:
ffff800000110240:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110241:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110242:	5f                   	pop    %rdi
ffff800000110243:	73 79                	jae    ffff8000001102be <.LC3+0x17>
ffff800000110245:	73 74                	jae    ffff8000001102bb <.LC3+0x14>
ffff800000110247:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff800000110249:	5f                   	pop    %rdi
ffff80000011024a:	63 61 6c             	movslq 0x6c(%rcx),%esp
ffff80000011024d:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011024e:	20 69 73             	and    %ch,0x73(%rcx)
ffff800000110251:	20 63 61             	and    %ah,0x61(%rbx)
ffff800000110254:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110255:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110256:	69 6e 67 2c 4e 52 3a 	imul   $0x3a524e2c,0x67(%rsi),%ebp
ffff80000011025d:	25 78 0a 00 00       	and    $0xa78,%eax
ffff800000110262:	00 00                	add    %al,(%rax)
ffff800000110264:	00 00                	add    %al,(%rax)
	...

ffff800000110268 <.LC1>:
ffff800000110268:	43 6f                	rex.XB outsl %ds:(%rsi),(%dx)
ffff80000011026a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011026b:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011026c:	72 20                	jb     ffff80000011028e <.LC2+0x6>
ffff80000011026e:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000011026f:	61                   	(bad)  
ffff800000110270:	70 20                	jo     ffff800000110292 <.LC2+0xa>
ffff800000110272:	42                   	rex.X
ffff800000110273:	45                   	rex.RB
ffff800000110274:	46                   	rex.RX
ffff800000110275:	4f 52                	rex.WRXB push %r10
ffff800000110277:	45 20 6b 6d          	and    %r13b,0x6d(%r11)
ffff80000011027b:	61                   	(bad)  
ffff80000011027c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011027d:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011027e:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011027f:	63 28                	movslq (%rax),%ebp
ffff800000110281:	29 3a                	sub    %edi,(%rdx)
ffff800000110283:	20 25 64 0a 00     	and    %ah,0x43000a64(%rip)        # ffff800043110ced <_end+0x42fdf895>

ffff800000110288 <.LC2>:
ffff800000110288:	43 6f                	rex.XB outsl %ds:(%rsi),(%dx)
ffff80000011028a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011028b:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011028c:	72 20                	jb     ffff8000001102ae <.LC3+0x7>
ffff80000011028e:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000011028f:	61                   	(bad)  
ffff800000110290:	70 20                	jo     ffff8000001102b2 <.LC3+0xb>
ffff800000110292:	41                   	rex.B
ffff800000110293:	46 54                	rex.RX push %rsp
ffff800000110295:	45 52                	rex.RB push %r10
ffff800000110297:	20 6b 6d             	and    %ch,0x6d(%rbx)
ffff80000011029a:	61                   	(bad)  
ffff80000011029b:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011029c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011029d:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011029e:	63 28                	movslq (%rax),%ebp
ffff8000001102a0:	29 3a                	sub    %edi,(%rdx)
ffff8000001102a2:	20 25 64 0a 00     	and    %ah,0x43000a64(%rip)        # ffff800043110d0c <_end+0x42fdf8b4>

ffff8000001102a7 <.LC3>:
ffff8000001102a7:	43 6f                	rex.XB outsl %ds:(%rsi),(%dx)
ffff8000001102a9:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001102aa:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001102ab:	72 20                	jb     ffff8000001102cd <.LC0+0x5>
ffff8000001102ad:	6d                   	insl   (%dx),%es:(%rdi)
ffff8000001102ae:	61                   	(bad)  
ffff8000001102af:	70 20                	jo     ffff8000001102d1 <.LC0+0x9>
ffff8000001102b1:	41                   	rex.B
ffff8000001102b2:	46 54                	rex.RX push %rsp
ffff8000001102b4:	45 52                	rex.RB push %r10
ffff8000001102b6:	20 6b 66             	and    %ch,0x66(%rbx)
ffff8000001102b9:	72 65                	jb     ffff800000110320 <.LC2>
ffff8000001102bb:	65 28 29             	sub    %ch,%gs:(%rcx)
ffff8000001102be:	3a 20                	cmp    (%rax),%ah
ffff8000001102c0:	25 64 00 00 00       	and    $0x64,%eax
ffff8000001102c5:	00 00                	add    %al,(%rax)
	...

ffff8000001102c8 <.LC0>:
ffff8000001102c8:	44 69 76 69 64 65 20 	imul   $0x45206564,0x69(%rsi),%r14d
ffff8000001102cf:	45 
ffff8000001102d0:	72 72                	jb     ffff800000110344 <.LC2+0x24>
ffff8000001102d2:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001102d3:	72 28                	jb     ffff8000001102fd <.LC1+0x5>
ffff8000001102d5:	23 44 45 29          	and    0x29(%rbp,%rax,2),%eax
ffff8000001102d9:	0a 45 72             	or     0x72(%rbp),%al
ffff8000001102dc:	72 6f                	jb     ffff80000011034d <.LC2+0x2d>
ffff8000001102de:	72 43                	jb     ffff800000110323 <.LC2+0x3>
ffff8000001102e0:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001102e1:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff8000001102e5:	25 64 20 52 53       	and    $0x53522064,%eax
ffff8000001102ea:	50                   	push   %rax
ffff8000001102eb:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff800049632369 <_end+0x49500f11>
ffff8000001102f1:	50                   	push   %rax
ffff8000001102f2:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff800000110d70 <.LC26+0x10>

ffff8000001102f8 <.LC1>:
ffff8000001102f8:	44                   	rex.R
ffff8000001102f9:	65 62                	gs (bad) 
ffff8000001102fb:	75 67                	jne    ffff800000110364 <.LC3+0x14>
ffff8000001102fd:	28 23                	sub    %ah,(%rbx)
ffff8000001102ff:	44                   	rex.R
ffff800000110300:	42 29 0a             	rex.X sub %ecx,(%rdx)
ffff800000110303:	45 72 72             	rex.RB jb ffff800000110378 <.LC3+0x28>
ffff800000110306:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110307:	72 43                	jb     ffff80000011034c <.LC2+0x2c>
ffff800000110309:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011030a:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000011030e:	25 64 20 52 53       	and    $0x53522064,%eax
ffff800000110313:	50                   	push   %rax
ffff800000110314:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff800049632392 <_end+0x49500f3a>
ffff80000011031a:	50                   	push   %rax
ffff80000011031b:	3a 25 78 0a 00     	cmp    0x4e000a78(%rip),%ah        # ffff80004e110d99 <_end+0x4dfdf941>

ffff800000110320 <.LC2>:
ffff800000110320:	4e                   	rex.WRX
ffff800000110321:	4d                   	rex.WRB
ffff800000110322:	49 20 49 6e          	rex.WB and %cl,0x6e(%r9)
ffff800000110326:	74 65                	je     ffff80000011038d <.LC4+0xd>
ffff800000110328:	72 72                	jb     ffff80000011039c <.LC4+0x1c>
ffff80000011032a:	75 70                	jne    ffff80000011039c <.LC4+0x1c>
ffff80000011032c:	74 28                	je     ffff800000110356 <.LC3+0x6>
ffff80000011032e:	2d 29 0a 45 72       	sub    $0x72450a29,%eax
ffff800000110333:	72 6f                	jb     ffff8000001103a4 <.LC4+0x24>
ffff800000110335:	72 43                	jb     ffff80000011037a <.LC3+0x2a>
ffff800000110337:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110338:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000011033c:	25 64 20 52 53       	and    $0x53522064,%eax
ffff800000110341:	50                   	push   %rax
ffff800000110342:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff8000496323c0 <_end+0x49500f68>
ffff800000110348:	50                   	push   %rax
ffff800000110349:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff800000110dc7 <.LC27+0x2f>
	...

ffff800000110350 <.LC3>:
ffff800000110350:	42 72 65             	rex.X jb ffff8000001103b8 <.LC5+0x8>
ffff800000110353:	61                   	(bad)  
ffff800000110354:	6b 50 6f 69          	imul   $0x69,0x6f(%rax),%edx
ffff800000110358:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110359:	74 28                	je     ffff800000110383 <.LC4+0x3>
ffff80000011035b:	23 42 50             	and    0x50(%rdx),%eax
ffff80000011035e:	29 0a                	sub    %ecx,(%rdx)
ffff800000110360:	45 72 72             	rex.RB jb ffff8000001103d5 <.LC5+0x25>
ffff800000110363:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110364:	72 43                	jb     ffff8000001103a9 <.LC4+0x29>
ffff800000110366:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110367:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000011036b:	25 64 20 52 53       	and    $0x53522064,%eax
ffff800000110370:	50                   	push   %rax
ffff800000110371:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff8000496323ef <_end+0x49500f97>
ffff800000110377:	50                   	push   %rax
ffff800000110378:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff800000110df6 <.LC29+0xe>
	...

ffff800000110380 <.LC4>:
ffff800000110380:	4f 76 65             	rex.WRXB jbe ffff8000001103e8 <.LC6>
ffff800000110383:	72 46                	jb     ffff8000001103cb <.LC5+0x1b>
ffff800000110385:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110386:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110387:	77 28                	ja     ffff8000001103b1 <.LC5+0x1>
ffff800000110389:	23 4f 46             	and    0x46(%rdi),%ecx
ffff80000011038c:	29 0a                	sub    %ecx,(%rdx)
ffff80000011038e:	45 72 72             	rex.RB jb ffff800000110403 <.LC6+0x1b>
ffff800000110391:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110392:	72 43                	jb     ffff8000001103d7 <.LC5+0x27>
ffff800000110394:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110395:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff800000110399:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000011039e:	50                   	push   %rax
ffff80000011039f:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004963241d <_end+0x49500fc5>
ffff8000001103a5:	50                   	push   %rax
ffff8000001103a6:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff800000110e24 <.LC1+0xd>
ffff8000001103ac:	00 00                	add    %al,(%rax)
	...

ffff8000001103b0 <.LC5>:
ffff8000001103b0:	42                   	rex.X
ffff8000001103b1:	4f 55                	rex.WRXB push %r13
ffff8000001103b3:	4e                   	rex.WRX
ffff8000001103b4:	44 20 52 61          	and    %r10b,0x61(%rdx)
ffff8000001103b8:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001103b9:	67 65 20 45 78       	and    %al,%gs:0x78(%ebp)
ffff8000001103be:	63 65 65             	movslq 0x65(%rbp),%esp
ffff8000001103c1:	64 65 64 28 23       	fs gs sub %ah,%fs:(%rbx)
ffff8000001103c6:	42 52                	rex.X push %rdx
ffff8000001103c8:	29 0a                	sub    %ecx,(%rdx)
ffff8000001103ca:	45 72 72             	rex.RB jb ffff80000011043f <.LC7+0xf>
ffff8000001103cd:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001103ce:	72 43                	jb     ffff800000110413 <.LC6+0x2b>
ffff8000001103d0:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001103d1:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff8000001103d5:	25 64 20 52 53       	and    $0x53522064,%eax
ffff8000001103da:	50                   	push   %rax
ffff8000001103db:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff800049632459 <_end+0x49501001>
ffff8000001103e1:	50                   	push   %rax
ffff8000001103e2:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff800000110e60 <.LC1+0x17>

ffff8000001103e8 <.LC6>:
ffff8000001103e8:	49 6e                	rex.WB outsb %ds:(%rsi),(%dx)
ffff8000001103ea:	76 61                	jbe    ffff80000011044d <.LC7+0x1d>
ffff8000001103ec:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001103ed:	69 64 20 4f 70 63 6f 	imul   $0x646f6370,0x4f(%rax,%riz,1),%esp
ffff8000001103f4:	64 
ffff8000001103f5:	65 20 28             	and    %ch,%gs:(%rax)
ffff8000001103f8:	55                   	push   %rbp
ffff8000001103f9:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001103fa:	64 65 66 69 6e 65 64 	fs imul $0x2064,%gs:0x65(%rsi),%bp
ffff800000110401:	20 
ffff800000110402:	4f 70 63             	rex.WRXB jo ffff800000110468 <.LC7+0x38>
ffff800000110405:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110406:	64 65 29 28          	fs sub %ebp,%gs:(%rax)
ffff80000011040a:	23 55 44             	and    0x44(%rbp),%edx
ffff80000011040d:	29 0a                	sub    %ecx,(%rdx)
ffff80000011040f:	09 09                	or     %ecx,(%rcx)
ffff800000110411:	45 72 72             	rex.RB jb ffff800000110486 <.LC8+0x6>
ffff800000110414:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110415:	72 43                	jb     ffff80000011045a <.LC7+0x2a>
ffff800000110417:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110418:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000011041c:	25 64 20 52 53       	and    $0x53522064,%eax
ffff800000110421:	50                   	push   %rax
ffff800000110422:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff8000496324a0 <_end+0x49501048>
ffff800000110428:	50                   	push   %rax
ffff800000110429:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff800000110ea7 <.LC0+0xe>
	...

ffff800000110430 <.LC7>:
ffff800000110430:	20 44 65 76          	and    %al,0x76(%rbp,%riz,2)
ffff800000110434:	69 63 65 20 4e 6f 74 	imul   $0x746f4e20,0x65(%rbx),%esp
ffff80000011043b:	20 41 76             	and    %al,0x76(%rcx)
ffff80000011043e:	61                   	(bad)  
ffff80000011043f:	69 6c 61 62 6c 65 20 	imul   $0x2820656c,0x62(%rcx,%riz,2),%ebp
ffff800000110446:	28 
ffff800000110447:	4e 6f                	rex.WRX outsl %ds:(%rsi),(%dx)
ffff800000110449:	20 4d 61             	and    %cl,0x61(%rbp)
ffff80000011044c:	74 68                	je     ffff8000001104b6 <.LC9+0x6>
ffff80000011044e:	20 43 6f             	and    %al,0x6f(%rbx)
ffff800000110451:	70 72                	jo     ffff8000001104c5 <.LC9+0x15>
ffff800000110453:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110454:	63 65 73             	movslq 0x73(%rbp),%esp
ffff800000110457:	73 6f                	jae    ffff8000001104c8 <.LC9+0x18>
ffff800000110459:	72 29                	jb     ffff800000110484 <.LC8+0x4>
ffff80000011045b:	28 23                	sub    %ah,(%rbx)
ffff80000011045d:	4e                   	rex.WRX
ffff80000011045e:	4d 29 0a             	sub    %r9,(%r10)
ffff800000110461:	09 09                	or     %ecx,(%rcx)
ffff800000110463:	45 72 72             	rex.RB jb ffff8000001104d8 <.LC9+0x28>
ffff800000110466:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110467:	72 43                	jb     ffff8000001104ac <.LC8+0x2c>
ffff800000110469:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011046a:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000011046e:	25 64 20 52 53       	and    $0x53522064,%eax
ffff800000110473:	50                   	push   %rax
ffff800000110474:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff8000496324f2 <_end+0x4950109a>
ffff80000011047a:	50                   	push   %rax
ffff80000011047b:	3a 25 78 0a 00     	cmp    0x44000a78(%rip),%ah        # ffff800044110ef9 <_end+0x43fdfaa1>

ffff800000110480 <.LC8>:
ffff800000110480:	44 6f                	rex.R outsl %ds:(%rsi),(%dx)
ffff800000110482:	75 62                	jne    ffff8000001104e6 <.LC9+0x36>
ffff800000110484:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110485:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff800000110489:	75 6c                	jne    ffff8000001104f7 <.LC9+0x47>
ffff80000011048b:	74 28                	je     ffff8000001104b5 <.LC9+0x5>
ffff80000011048d:	23 44 46 29          	and    0x29(%rsi,%rax,2),%eax
ffff800000110491:	0a 45 72             	or     0x72(%rbp),%al
ffff800000110494:	72 6f                	jb     ffff800000110505 <.LC10+0x5>
ffff800000110496:	72 43                	jb     ffff8000001104db <.LC9+0x2b>
ffff800000110498:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110499:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000011049d:	25 64 20 52 53       	and    $0x53522064,%eax
ffff8000001104a2:	50                   	push   %rax
ffff8000001104a3:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff800049632521 <_end+0x495010c9>
ffff8000001104a9:	50                   	push   %rax
ffff8000001104aa:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff800000110f28 <_erodata+0x7a>

ffff8000001104b0 <.LC9>:
ffff8000001104b0:	43 6f                	rex.XB outsl %ds:(%rsi),(%dx)
ffff8000001104b2:	70 72                	jo     ffff800000110526 <.LC10+0x26>
ffff8000001104b4:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001104b5:	63 65 73             	movslq 0x73(%rbp),%esp
ffff8000001104b8:	73 6f                	jae    ffff800000110529 <.LC10+0x29>
ffff8000001104ba:	72 20                	jb     ffff8000001104dc <.LC9+0x2c>
ffff8000001104bc:	53                   	push   %rbx
ffff8000001104bd:	65 67 6d             	gs insl (%dx),%es:(%edi)
ffff8000001104c0:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001104c2:	74 20                	je     ffff8000001104e4 <.LC9+0x34>
ffff8000001104c4:	4f 76 65             	rex.WRXB jbe ffff80000011052c <.LC10+0x2c>
ffff8000001104c7:	72 72                	jb     ffff80000011053b <.LC11+0xb>
ffff8000001104c9:	75 6e                	jne    ffff800000110539 <.LC11+0x9>
ffff8000001104cb:	20 28                	and    %ch,(%rax)
ffff8000001104cd:	72 65                	jb     ffff800000110534 <.LC11+0x4>
ffff8000001104cf:	73 65                	jae    ffff800000110536 <.LC11+0x6>
ffff8000001104d1:	72 76                	jb     ffff800000110549 <.LC11+0x19>
ffff8000001104d3:	65 64 29 28          	gs sub %ebp,%fs:(%rax)
ffff8000001104d7:	20 29                	and    %ch,(%rcx)
ffff8000001104d9:	09 09                	or     %ecx,(%rcx)
ffff8000001104db:	0a 45 72             	or     0x72(%rbp),%al
ffff8000001104de:	72 6f                	jb     ffff80000011054f <.LC11+0x1f>
ffff8000001104e0:	72 43                	jb     ffff800000110525 <.LC10+0x25>
ffff8000001104e2:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001104e3:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff8000001104e7:	25 64 20 52 53       	and    $0x53522064,%eax
ffff8000001104ec:	50                   	push   %rax
ffff8000001104ed:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004963256b <_end+0x49501113>
ffff8000001104f3:	50                   	push   %rax
ffff8000001104f4:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff800000110f72 <_erodata+0xc4>
ffff8000001104fa:	00 00                	add    %al,(%rax)
ffff8000001104fc:	00 00                	add    %al,(%rax)
	...

ffff800000110500 <.LC10>:
ffff800000110500:	49 6e                	rex.WB outsb %ds:(%rsi),(%dx)
ffff800000110502:	76 61                	jbe    ffff800000110565 <.LC11+0x35>
ffff800000110504:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110505:	69 64 20 54 53 53 28 	imul   $0x23285353,0x54(%rax,%riz,1),%esp
ffff80000011050c:	23 
ffff80000011050d:	54                   	push   %rsp
ffff80000011050e:	53                   	push   %rbx
ffff80000011050f:	29 0a                	sub    %ecx,(%rdx)
ffff800000110511:	45 72 72             	rex.RB jb ffff800000110586 <.LC11+0x56>
ffff800000110514:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110515:	72 43                	jb     ffff80000011055a <.LC11+0x2a>
ffff800000110517:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110518:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000011051c:	25 64 20 52 53       	and    $0x53522064,%eax
ffff800000110521:	50                   	push   %rax
ffff800000110522:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff8000496325a0 <_end+0x49501148>
ffff800000110528:	50                   	push   %rax
ffff800000110529:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff800000110fa7 <_erodata+0xf9>
	...

ffff800000110530 <.LC11>:
ffff800000110530:	54                   	push   %rsp
ffff800000110531:	68 65 20 65 78       	pushq  $0x78652065
ffff800000110536:	63 65 70             	movslq 0x70(%rbp),%esp
ffff800000110539:	74 69                	je     ffff8000001105a4 <.LC11+0x74>
ffff80000011053b:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011053c:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011053d:	20 6f 63             	and    %ch,0x63(%rdi)
ffff800000110540:	63 75 72             	movslq 0x72(%rbp),%esi
ffff800000110543:	72 65                	jb     ffff8000001105aa <.LC11+0x7a>
ffff800000110545:	64 20 64 75 72       	and    %ah,%fs:0x72(%rbp,%rsi,2)
ffff80000011054a:	69 6e 67 20 64 65 6c 	imul   $0x6c656420,0x67(%rsi),%ebp
ffff800000110551:	69 76 65 72 79 20 6f 	imul   $0x6f207972,0x65(%rsi),%esi
ffff800000110558:	66 20 61 6e          	data16 and %ah,0x6e(%rcx)
ffff80000011055c:	20 65 76             	and    %ah,0x76(%rbp)
ffff80000011055f:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000110561:	74 20                	je     ffff800000110583 <.LC11+0x53>
ffff800000110563:	09 09                	or     %ecx,(%rcx)
ffff800000110565:	65 78 74             	gs js  ffff8000001105dc <.LC12+0x2c>
ffff800000110568:	65 72 6e             	gs jb  ffff8000001105d9 <.LC12+0x29>
ffff80000011056b:	61                   	(bad)  
ffff80000011056c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011056d:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff800000110571:	74 68                	je     ffff8000001105db <.LC12+0x2b>
ffff800000110573:	65 20 70 72          	and    %dh,%gs:0x72(%rax)
ffff800000110577:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110578:	67 72 61             	addr32 jb ffff8000001105dc <.LC12+0x2c>
ffff80000011057b:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000011057c:	2c 73                	sub    $0x73,%al
ffff80000011057e:	75 63                	jne    ffff8000001105e3 <.LC13+0x3>
ffff800000110580:	68 20 61 73 20       	pushq  $0x20736120
ffff800000110585:	61                   	(bad)  
ffff800000110586:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110587:	20 69 6e             	and    %ch,0x6e(%rcx)
ffff80000011058a:	74 65                	je     ffff8000001105f1 <.LC13+0x11>
ffff80000011058c:	72 72                	jb     ffff800000110600 <.LC13+0x20>
ffff80000011058e:	75 70                	jne    ffff800000110600 <.LC13+0x20>
ffff800000110590:	74 20                	je     ffff8000001105b2 <.LC12+0x2>
ffff800000110592:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110593:	72 20                	jb     ffff8000001105b5 <.LC12+0x5>
ffff800000110595:	61                   	(bad)  
ffff800000110596:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110597:	20 65 61             	and    %ah,0x61(%rbp)
ffff80000011059a:	72 6c                	jb     ffff800000110608 <.LC13+0x28>
ffff80000011059c:	69 65 72 20 65 78 63 	imul   $0x63786520,0x72(%rbp),%esp
ffff8000001105a3:	65 70 74             	gs jo  ffff80000011061a <.LC14+0x2>
ffff8000001105a6:	69 6f 6e 2e 0a 00 00 	imul   $0xa2e,0x6e(%rdi),%ebp
ffff8000001105ad:	00 00                	add    %al,(%rax)
	...

ffff8000001105b0 <.LC12>:
ffff8000001105b0:	52                   	push   %rdx
ffff8000001105b1:	65 66 65 72 73       	gs data16 gs jb ffff800000110629 <.LC14+0x11>
ffff8000001105b6:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff8000001105ba:	61                   	(bad)  
ffff8000001105bb:	20 67 61             	and    %ah,0x61(%rdi)
ffff8000001105be:	74 65                	je     ffff800000110625 <.LC14+0xd>
ffff8000001105c0:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff8000001105c4:	63 72 69             	movslq 0x69(%rdx),%esi
ffff8000001105c7:	70 74                	jo     ffff80000011063d <.LC14+0x25>
ffff8000001105c9:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001105ca:	72 20                	jb     ffff8000001105ec <.LC13+0xc>
ffff8000001105cc:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff8000001105d3:	49                   	rex.WB
ffff8000001105d4:	44 54                	rex.R push %rsp
ffff8000001105d6:	3b 0a                	cmp    (%rdx),%ecx
	...

ffff8000001105e0 <.LC13>:
ffff8000001105e0:	52                   	push   %rdx
ffff8000001105e1:	65 66 65 72 73       	gs data16 gs jb ffff800000110659 <.LC15+0x9>
ffff8000001105e6:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff8000001105ea:	61                   	(bad)  
ffff8000001105eb:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff8000001105ef:	63 72 69             	movslq 0x69(%rdx),%esi
ffff8000001105f2:	70 74                	jo     ffff800000110668 <.LC15+0x18>
ffff8000001105f4:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001105f5:	72 20                	jb     ffff800000110617 <.LC13+0x37>
ffff8000001105f7:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff8000001105fe:	47                   	rex.RXB
ffff8000001105ff:	44 54                	rex.R push %rsp
ffff800000110601:	20 6f 72             	and    %ch,0x72(%rdi)
ffff800000110604:	20 74 68 65          	and    %dh,0x65(%rax,%rbp,2)
ffff800000110608:	20 63 75             	and    %ah,0x75(%rbx)
ffff80000011060b:	72 72                	jb     ffff80000011067f <.LC16+0x3>
ffff80000011060d:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000011060f:	74 20                	je     ffff800000110631 <.LC14+0x19>
ffff800000110611:	4c                   	rex.WR
ffff800000110612:	44 54                	rex.R push %rsp
ffff800000110614:	3b 0a                	cmp    (%rdx),%ecx
	...

ffff800000110618 <.LC14>:
ffff800000110618:	52                   	push   %rdx
ffff800000110619:	65 66 65 72 73       	gs data16 gs jb ffff800000110691 <.LC16+0x15>
ffff80000011061e:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff800000110622:	61                   	(bad)  
ffff800000110623:	20 73 65             	and    %dh,0x65(%rbx)
ffff800000110626:	67 6d                	insl   (%dx),%es:(%edi)
ffff800000110628:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000011062a:	74 20                	je     ffff80000011064c <.LC14+0x34>
ffff80000011062c:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011062d:	72 20                	jb     ffff80000011064f <.LC14+0x37>
ffff80000011062f:	67 61                	addr32 (bad) 
ffff800000110631:	74 65                	je     ffff800000110698 <.LC17>
ffff800000110633:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff800000110637:	63 72 69             	movslq 0x69(%rdx),%esi
ffff80000011063a:	70 74                	jo     ffff8000001106b0 <.LC17+0x18>
ffff80000011063c:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011063d:	72 20                	jb     ffff80000011065f <.LC15+0xf>
ffff80000011063f:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff800000110646:	4c                   	rex.WR
ffff800000110647:	44 54                	rex.R push %rsp
ffff800000110649:	3b 0a                	cmp    (%rdx),%ecx
ffff80000011064b:	00 00                	add    %al,(%rax)
ffff80000011064d:	00 00                	add    %al,(%rax)
	...

ffff800000110650 <.LC15>:
ffff800000110650:	52                   	push   %rdx
ffff800000110651:	65 66 65 72 73       	gs data16 gs jb ffff8000001106c9 <.LC17+0x31>
ffff800000110656:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000011065a:	61                   	(bad)  
ffff80000011065b:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff80000011065f:	63 72 69             	movslq 0x69(%rdx),%esi
ffff800000110662:	70 74                	jo     ffff8000001106d8 <.LC18+0x8>
ffff800000110664:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110665:	72 20                	jb     ffff800000110687 <.LC16+0xb>
ffff800000110667:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff80000011066e:	63 75 72             	movslq 0x72(%rbp),%esi
ffff800000110671:	72 65                	jb     ffff8000001106d8 <.LC18+0x8>
ffff800000110673:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110674:	74 20                	je     ffff800000110696 <.LC16+0x1a>
ffff800000110676:	47                   	rex.RXB
ffff800000110677:	44 54                	rex.R push %rsp
ffff800000110679:	3b 0a                	cmp    (%rdx),%ecx
	...

ffff80000011067c <.LC16>:
ffff80000011067c:	53                   	push   %rbx
ffff80000011067d:	65 67 6d             	gs insl (%dx),%es:(%edi)
ffff800000110680:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000110682:	74 20                	je     ffff8000001106a4 <.LC17+0xc>
ffff800000110684:	53                   	push   %rbx
ffff800000110685:	65 6c                	gs insb (%dx),%es:(%rdi)
ffff800000110687:	65 63 74 6f 72       	movslq %gs:0x72(%rdi,%rbp,2),%esi
ffff80000011068c:	20 49 6e             	and    %cl,0x6e(%rcx)
ffff80000011068f:	64 65 78 3a          	fs gs js ffff8000001106cd <.LC17+0x35>
ffff800000110693:	25 78 0a 00 00       	and    $0xa78,%eax

ffff800000110698 <.LC17>:
ffff800000110698:	20 53 65             	and    %dl,0x65(%rbx)
ffff80000011069b:	67 6d                	insl   (%dx),%es:(%edi)
ffff80000011069d:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000011069f:	74 20                	je     ffff8000001106c1 <.LC17+0x29>
ffff8000001106a1:	4e 6f                	rex.WRX outsl %ds:(%rsi),(%dx)
ffff8000001106a3:	74 20                	je     ffff8000001106c5 <.LC17+0x2d>
ffff8000001106a5:	50                   	push   %rax
ffff8000001106a6:	72 65                	jb     ffff80000011070d <.LC19+0x5>
ffff8000001106a8:	73 65                	jae    ffff80000011070f <.LC19+0x7>
ffff8000001106aa:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001106ab:	74 28                	je     ffff8000001106d5 <.LC18+0x5>
ffff8000001106ad:	23 4e 50             	and    0x50(%rsi),%ecx
ffff8000001106b0:	29 0a                	sub    %ecx,(%rdx)
ffff8000001106b2:	45 72 72             	rex.RB jb ffff800000110727 <.LC19+0x1f>
ffff8000001106b5:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001106b6:	72 43                	jb     ffff8000001106fb <.LC18+0x2b>
ffff8000001106b8:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001106b9:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff8000001106bd:	25 64 20 52 53       	and    $0x53522064,%eax
ffff8000001106c2:	50                   	push   %rax
ffff8000001106c3:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff800049632741 <_end+0x495012e9>
ffff8000001106c9:	50                   	push   %rax
ffff8000001106ca:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff800000111148 <_erodata+0x29a>

ffff8000001106d0 <.LC18>:
ffff8000001106d0:	53                   	push   %rbx
ffff8000001106d1:	74 61                	je     ffff800000110734 <.LC19+0x2c>
ffff8000001106d3:	63 6b 2d             	movslq 0x2d(%rbx),%ebp
ffff8000001106d6:	53                   	push   %rbx
ffff8000001106d7:	65 67 6d             	gs insl (%dx),%es:(%edi)
ffff8000001106da:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001106dc:	74 20                	je     ffff8000001106fe <.LC18+0x2e>
ffff8000001106de:	46 61                	rex.RX (bad) 
ffff8000001106e0:	75 6c                	jne    ffff80000011074e <.LC20+0xe>
ffff8000001106e2:	74 28                	je     ffff80000011070c <.LC19+0x4>
ffff8000001106e4:	23 53 53             	and    0x53(%rbx),%edx
ffff8000001106e7:	29 0a                	sub    %ecx,(%rdx)
ffff8000001106e9:	45 72 72             	rex.RB jb ffff80000011075e <.LC20+0x1e>
ffff8000001106ec:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001106ed:	72 43                	jb     ffff800000110732 <.LC19+0x2a>
ffff8000001106ef:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001106f0:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff8000001106f4:	25 64 20 52 53       	and    $0x53522064,%eax
ffff8000001106f9:	50                   	push   %rax
ffff8000001106fa:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff800049632778 <_end+0x49501320>
ffff800000110700:	50                   	push   %rax
ffff800000110701:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000011117f <_erodata+0x2d1>
	...

ffff800000110708 <.LC19>:
ffff800000110708:	47                   	rex.RXB
ffff800000110709:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000011070b:	65 72 61             	gs jb  ffff80000011076f <.LC21+0x3>
ffff80000011070e:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011070f:	20 50 72             	and    %dl,0x72(%rax)
ffff800000110712:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110713:	74 65                	je     ffff80000011077a <.LC21+0xe>
ffff800000110715:	63 74 69 6f          	movslq 0x6f(%rcx,%rbp,2),%esi
ffff800000110719:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011071a:	28 23                	sub    %ah,(%rbx)
ffff80000011071c:	47 50                	rex.RXB push %r8
ffff80000011071e:	29 0a                	sub    %ecx,(%rdx)
ffff800000110720:	45 72 72             	rex.RB jb ffff800000110795 <.LC23+0x2>
ffff800000110723:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110724:	72 43                	jb     ffff800000110769 <.LC20+0x29>
ffff800000110726:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110727:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000011072b:	25 64 20 52 53       	and    $0x53522064,%eax
ffff800000110730:	50                   	push   %rax
ffff800000110731:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff8000496327af <_end+0x49501357>
ffff800000110737:	50                   	push   %rax
ffff800000110738:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff8000001111b6 <_erodata+0x308>
	...

ffff800000110740 <.LC20>:
ffff800000110740:	50                   	push   %rax
ffff800000110741:	61                   	(bad)  
ffff800000110742:	67 65 20 46 61       	and    %al,%gs:0x61(%esi)
ffff800000110747:	75 6c                	jne    ffff8000001107b5 <.LC24+0xf>
ffff800000110749:	74 28                	je     ffff800000110773 <.LC21+0x7>
ffff80000011074b:	23 50 46             	and    0x46(%rax),%edx
ffff80000011074e:	29 0a                	sub    %ecx,(%rdx)
ffff800000110750:	45 72 72             	rex.RB jb ffff8000001107c5 <.LC25+0xd>
ffff800000110753:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110754:	72 43                	jb     ffff800000110799 <.LC23+0x6>
ffff800000110756:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110757:	64 65 3a 25 64 20 52 	fs cmp %gs:0x53522064(%rip),%ah        # ffff8000536327c3 <_end+0x5350136b>
ffff80000011075e:	53 
ffff80000011075f:	50                   	push   %rax
ffff800000110760:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff8000496327de <_end+0x49501386>
ffff800000110766:	50                   	push   %rax
ffff800000110767:	3a 25 78 0a 00     	cmp    0x50000a78(%rip),%ah        # ffff8000501111e5 <_end+0x4ffdfd8d>

ffff80000011076c <.LC21>:
ffff80000011076c:	50                   	push   %rax
ffff80000011076d:	61                   	(bad)  
ffff80000011076e:	67 65 20 4e 6f       	and    %cl,%gs:0x6f(%esi)
ffff800000110773:	74 2d                	je     ffff8000001107a2 <.LC23+0xf>
ffff800000110775:	50                   	push   %rax
ffff800000110776:	72 65                	jb     ffff8000001107dd <.LC26+0x9>
ffff800000110778:	73 65                	jae    ffff8000001107df <.LC26+0xb>
ffff80000011077a:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011077b:	74 2c                	je     ffff8000001107a9 <.LC24+0x3>
ffff80000011077d:	0a 00                	or     (%rax),%al

ffff80000011077f <.LC22>:
ffff80000011077f:	57                   	push   %rdi
ffff800000110780:	72 69                	jb     ffff8000001107eb <.LC26+0x17>
ffff800000110782:	74 65                	je     ffff8000001107e9 <.LC26+0x15>
ffff800000110784:	20 43 61             	and    %al,0x61(%rbx)
ffff800000110787:	75 73                	jne    ffff8000001107fc <.LC27+0xc>
ffff800000110789:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff80000011078d:	75 6c                	jne    ffff8000001107fb <.LC27+0xb>
ffff80000011078f:	74 2c                	je     ffff8000001107bd <.LC25+0x5>
ffff800000110791:	0a 00                	or     (%rax),%al

ffff800000110793 <.LC23>:
ffff800000110793:	52                   	push   %rdx
ffff800000110794:	65 61                	gs (bad) 
ffff800000110796:	64 20 43 61          	and    %al,%fs:0x61(%rbx)
ffff80000011079a:	75 73                	jne    ffff80000011080f <.LC27+0x1f>
ffff80000011079c:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff8000001107a0:	75 6c                	jne    ffff80000011080e <.LC27+0x1e>
ffff8000001107a2:	74 2c                	je     ffff8000001107d0 <.LC25+0x18>
ffff8000001107a4:	0a 00                	or     (%rax),%al

ffff8000001107a6 <.LC24>:
ffff8000001107a6:	46 61                	rex.RX (bad) 
ffff8000001107a8:	75 6c                	jne    ffff800000110816 <.LC28+0x6>
ffff8000001107aa:	74 20                	je     ffff8000001107cc <.LC25+0x14>
ffff8000001107ac:	69 6e 20 75 73 65 72 	imul   $0x72657375,0x20(%rsi),%ebp
ffff8000001107b3:	28 33                	sub    %dh,(%rbx)
ffff8000001107b5:	29 0a                	sub    %ecx,(%rdx)
	...

ffff8000001107b8 <.LC25>:
ffff8000001107b8:	46 61                	rex.RX (bad) 
ffff8000001107ba:	75 6c                	jne    ffff800000110828 <.LC29+0x10>
ffff8000001107bc:	74 20                	je     ffff8000001107de <.LC26+0xa>
ffff8000001107be:	69 6e 20 73 75 70 65 	imul   $0x65707573,0x20(%rsi),%ebp
ffff8000001107c5:	72 76                	jb     ffff80000011083d <.LC29+0x25>
ffff8000001107c7:	69 73 6f 72 28 30 2c 	imul   $0x2c302872,0x6f(%rbx),%esi
ffff8000001107ce:	31 2c 32             	xor    %ebp,(%rdx,%rsi,1)
ffff8000001107d1:	29 0a                	sub    %ecx,(%rdx)
	...

ffff8000001107d4 <.LC26>:
ffff8000001107d4:	2c 52                	sub    $0x52,%al
ffff8000001107d6:	65 73 65             	gs jae ffff80000011083e <.LC29+0x26>
ffff8000001107d9:	72 76                	jb     ffff800000110851 <.LC29+0x39>
ffff8000001107db:	65 64 20 42 69       	gs and %al,%fs:0x69(%rdx)
ffff8000001107e0:	74 20                	je     ffff800000110802 <.LC27+0x12>
ffff8000001107e2:	43 61                	rex.XB (bad) 
ffff8000001107e4:	75 73                	jne    ffff800000110859 <.LC29+0x41>
ffff8000001107e6:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff8000001107ea:	75 6c                	jne    ffff800000110858 <.LC29+0x40>
ffff8000001107ec:	74 0a                	je     ffff8000001107f8 <.LC27+0x8>
	...

ffff8000001107f0 <.LC27>:
ffff8000001107f0:	2c 49                	sub    $0x49,%al
ffff8000001107f2:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001107f3:	73 74                	jae    ffff800000110869 <.LC30+0x1>
ffff8000001107f5:	72 75                	jb     ffff80000011086c <.LC30+0x4>
ffff8000001107f7:	63 74 69 6f          	movslq 0x6f(%rcx,%rbp,2),%esi
ffff8000001107fb:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001107fc:	20 66 65             	and    %ah,0x65(%rsi)
ffff8000001107ff:	74 63                	je     ffff800000110864 <.LC29+0x4c>
ffff800000110801:	68 20 43 61 75       	pushq  $0x75614320
ffff800000110806:	73 65                	jae    ffff80000011086d <.LC30+0x5>
ffff800000110808:	20 46 61             	and    %al,0x61(%rsi)
ffff80000011080b:	75 6c                	jne    ffff800000110879 <.LC30+0x11>
ffff80000011080d:	74 0a                	je     ffff800000110819 <.LC29+0x1>
	...

ffff800000110810 <.LC28>:
ffff800000110810:	43 52                	rex.XB push %r10
ffff800000110812:	32 3a                	xor    (%rdx),%bh
ffff800000110814:	25 78 0a 00        	and    $0x78000a78,%eax

ffff800000110818 <.LC29>:
ffff800000110818:	78 38                	js     ffff800000110852 <.LC29+0x3a>
ffff80000011081a:	37                   	(bad)  
ffff80000011081b:	20 46 50             	and    %al,0x50(%rsi)
ffff80000011081e:	55                   	push   %rbp
ffff80000011081f:	20 46 6c             	and    %al,0x6c(%rsi)
ffff800000110822:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110823:	61                   	(bad)  
ffff800000110824:	74 69                	je     ffff80000011088f <.LC30+0x27>
ffff800000110826:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110827:	67 2d 50 6f 69 6e    	addr32 sub $0x6e696f50,%eax
ffff80000011082d:	74 20                	je     ffff80000011084f <.LC29+0x37>
ffff80000011082f:	45 72 72             	rex.RB jb ffff8000001108a4 <.LC31+0x4>
ffff800000110832:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110833:	72 20                	jb     ffff800000110855 <.LC29+0x3d>
ffff800000110835:	28 4d 61             	sub    %cl,0x61(%rbp)
ffff800000110838:	74 68                	je     ffff8000001108a2 <.LC31+0x2>
ffff80000011083a:	20 46 61             	and    %al,0x61(%rsi)
ffff80000011083d:	75 6c                	jne    ffff8000001108ab <.LC31+0xb>
ffff80000011083f:	74 29                	je     ffff80000011086a <.LC30+0x2>
ffff800000110841:	28 23                	sub    %ah,(%rbx)
ffff800000110843:	4d                   	rex.WRB
ffff800000110844:	46 29 20             	rex.RX sub %r12d,(%rax)
ffff800000110847:	09 09                	or     %ecx,(%rcx)
ffff800000110849:	0a 45 72             	or     0x72(%rbp),%al
ffff80000011084c:	72 6f                	jb     ffff8000001108bd <.LC31+0x1d>
ffff80000011084e:	72 43                	jb     ffff800000110893 <.LC30+0x2b>
ffff800000110850:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110851:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff800000110855:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000011085a:	50                   	push   %rax
ffff80000011085b:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff8000496328d9 <_end+0x49501481>
ffff800000110861:	50                   	push   %rax
ffff800000110862:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff8000001112e0 <_erodata+0x432>

ffff800000110868 <.LC30>:
ffff800000110868:	41 6c                	rex.B insb (%dx),%es:(%rdi)
ffff80000011086a:	69 67 6e 6d 65 6e 74 	imul   $0x746e656d,0x6e(%rdi),%esp
ffff800000110871:	20 43 68             	and    %al,0x68(%rbx)
ffff800000110874:	65 63 6b 28          	movslq %gs:0x28(%rbx),%ebp
ffff800000110878:	23 41 43             	and    0x43(%rcx),%eax
ffff80000011087b:	29 0a                	sub    %ecx,(%rdx)
ffff80000011087d:	45 72 72             	rex.RB jb ffff8000001108f2 <.LC32+0x22>
ffff800000110880:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110881:	72 43                	jb     ffff8000001108c6 <.LC31+0x26>
ffff800000110883:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110884:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff800000110888:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000011088d:	50                   	push   %rax
ffff80000011088e:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004963290c <_end+0x495014b4>
ffff800000110894:	50                   	push   %rax
ffff800000110895:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff800000111313 <_erodata+0x465>
ffff80000011089b:	00 00                	add    %al,(%rax)
ffff80000011089d:	00 00                	add    %al,(%rax)
	...

ffff8000001108a0 <.LC31>:
ffff8000001108a0:	4d 61                	rex.WRB (bad) 
ffff8000001108a2:	63 68 69             	movslq 0x69(%rax),%ebp
ffff8000001108a5:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001108a6:	65 20 43 68          	and    %al,%gs:0x68(%rbx)
ffff8000001108aa:	65 63 6b 28          	movslq %gs:0x28(%rbx),%ebp
ffff8000001108ae:	23 4d 43             	and    0x43(%rbp),%ecx
ffff8000001108b1:	29 0a                	sub    %ecx,(%rdx)
ffff8000001108b3:	45 72 72             	rex.RB jb ffff800000110928 <.LC33+0x10>
ffff8000001108b6:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001108b7:	72 43                	jb     ffff8000001108fc <.LC32+0x2c>
ffff8000001108b9:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001108ba:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff8000001108be:	25 64 20 52 53       	and    $0x53522064,%eax
ffff8000001108c3:	50                   	push   %rax
ffff8000001108c4:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff800049632942 <_end+0x495014ea>
ffff8000001108ca:	50                   	push   %rax
ffff8000001108cb:	3a 25 78 0a 00     	cmp    0x53000a78(%rip),%ah        # ffff800053111349 <_end+0x52fdfef1>

ffff8000001108d0 <.LC32>:
ffff8000001108d0:	53                   	push   %rbx
ffff8000001108d1:	49                   	rex.WB
ffff8000001108d2:	4d                   	rex.WRB
ffff8000001108d3:	44 20 46 6c          	and    %r8b,0x6c(%rsi)
ffff8000001108d7:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001108d8:	61                   	(bad)  
ffff8000001108d9:	74 69                	je     ffff800000110944 <.LC33+0x2c>
ffff8000001108db:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001108dc:	67 2d 50 6f 69 6e    	addr32 sub $0x6e696f50,%eax
ffff8000001108e2:	74 20                	je     ffff800000110904 <.LC32+0x34>
ffff8000001108e4:	45 78 63             	rex.RB js ffff80000011094a <.LC33+0x32>
ffff8000001108e7:	65 70 74             	gs jo  ffff80000011095e <.LC0+0x6>
ffff8000001108ea:	69 6f 6e 28 23 58 4d 	imul   $0x4d582328,0x6e(%rdi),%ebp
ffff8000001108f1:	29 09                	sub    %ecx,(%rcx)
ffff8000001108f3:	09 0a                	or     %ecx,(%rdx)
ffff8000001108f5:	45 72 72             	rex.RB jb ffff80000011096a <.LC0+0x12>
ffff8000001108f8:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001108f9:	72 43                	jb     ffff80000011093e <.LC33+0x26>
ffff8000001108fb:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001108fc:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff800000110900:	25 64 20 52 53       	and    $0x53522064,%eax
ffff800000110905:	50                   	push   %rax
ffff800000110906:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff800049632984 <_end+0x4950152c>
ffff80000011090c:	50                   	push   %rax
ffff80000011090d:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000011138b <_erodata+0x4dd>
ffff800000110913:	00 00                	add    %al,(%rax)
ffff800000110915:	00 00                	add    %al,(%rax)
	...

ffff800000110918 <.LC33>:
ffff800000110918:	20 56 69             	and    %dl,0x69(%rsi)
ffff80000011091b:	72 74                	jb     ffff800000110991 <.LC1+0x19>
ffff80000011091d:	75 61                	jne    ffff800000110980 <.LC1+0x8>
ffff80000011091f:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110920:	69 7a 61 74 69 6f 6e 	imul   $0x6e6f6974,0x61(%rdx),%edi
ffff800000110927:	20 45 78             	and    %al,0x78(%rbp)
ffff80000011092a:	63 65 70             	movslq 0x70(%rbp),%esp
ffff80000011092d:	74 69                	je     ffff800000110998 <.LC2>
ffff80000011092f:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110930:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110931:	28 23                	sub    %ah,(%rbx)
ffff800000110933:	56                   	push   %rsi
ffff800000110934:	45 29 0a             	sub    %r9d,(%r10)
ffff800000110937:	45 72 72             	rex.RB jb ffff8000001109ac <.LC2+0x14>
ffff80000011093a:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011093b:	72 43                	jb     ffff800000110980 <.LC1+0x8>
ffff80000011093d:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011093e:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff800000110942:	25 64 20 52 53       	and    $0x53522064,%eax
ffff800000110947:	50                   	push   %rax
ffff800000110948:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff8000496329c6 <_end+0x4950156e>
ffff80000011094e:	50                   	push   %rax
ffff80000011094f:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff8000001113cd <_erodata+0x51f>
ffff800000110955:	00 00                	add    %al,(%rax)
	...

ffff800000110958 <.LC0>:
ffff800000110958:	67 65 74 5f          	addr32 gs je ffff8000001109bb <.LC2+0x23>
ffff80000011095c:	70 61                	jo     ffff8000001109bf <.LC3+0x2>
ffff80000011095e:	67 65 5f             	addr32 gs pop %rdi
ffff800000110961:	61                   	(bad)  
ffff800000110962:	74 74                	je     ffff8000001109d8 <.LC3+0x1b>
ffff800000110964:	72 69                	jb     ffff8000001109cf <.LC3+0x12>
ffff800000110966:	62                   	(bad)  
ffff800000110967:	75 74                	jne    ffff8000001109dd <.LC4+0x2>
ffff800000110969:	65 28 29             	sub    %ch,%gs:(%rcx)
ffff80000011096c:	3a 20                	cmp    (%rax),%ah
ffff80000011096e:	70 3d                	jo     ffff8000001109ad <.LC2+0x15>
ffff800000110970:	3d 4e 55 4c 4c       	cmp    $0x4c4c554e,%eax
ffff800000110975:	0a 00                	or     (%rax),%al
	...

ffff800000110978 <.LC1>:
ffff800000110978:	73 65                	jae    ffff8000001109df <.LC4+0x4>
ffff80000011097a:	74 5f                	je     ffff8000001109db <.LC4>
ffff80000011097c:	70 61                	jo     ffff8000001109df <.LC4+0x4>
ffff80000011097e:	67 65 5f             	addr32 gs pop %rdi
ffff800000110981:	61                   	(bad)  
ffff800000110982:	74 74                	je     ffff8000001109f8 <.LC5+0x7>
ffff800000110984:	72 69                	jb     ffff8000001109ef <.LC4+0x14>
ffff800000110986:	62                   	(bad)  
ffff800000110987:	75 74                	jne    ffff8000001109fd <.LC5+0xc>
ffff800000110989:	65 28 29             	sub    %ch,%gs:(%rcx)
ffff80000011098c:	3a 20                	cmp    (%rax),%ah
ffff80000011098e:	70 3d                	jo     ffff8000001109cd <.LC3+0x10>
ffff800000110990:	3d 4e 55 4c 4c       	cmp    $0x4c4c554e,%eax
ffff800000110995:	0a 00                	or     (%rax),%al
	...

ffff800000110998 <.LC2>:
ffff800000110998:	44 69 73 70 6c 61 79 	imul   $0x2079616c,0x70(%rbx),%r14d
ffff80000011099f:	20 
ffff8000001109a0:	50                   	push   %rax
ffff8000001109a1:	68 79 73 69 63       	pushq  $0x63697379
ffff8000001109a6:	73 20                	jae    ffff8000001109c8 <.LC3+0xb>
ffff8000001109a8:	4d                   	rex.WRB
ffff8000001109a9:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff8000001109ab:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001109ac:	72 79                	jb     ffff800000110a27 <.LC6+0x17>
ffff8000001109ae:	20 44 69 73          	and    %al,0x73(%rcx,%rbp,2)
ffff8000001109b2:	74 72                	je     ffff800000110a26 <.LC6+0x16>
ffff8000001109b4:	69 62 75 74 69 6f 6e 	imul   $0x6e6f6974,0x75(%rdx),%esp
ffff8000001109bb:	0a 00                	or     (%rax),%al

ffff8000001109bd <.LC3>:
ffff8000001109bd:	41                   	rex.B
ffff8000001109be:	64 64 72 65          	fs fs jb ffff800000110a27 <.LC6+0x17>
ffff8000001109c2:	73 73                	jae    ffff800000110a37 <.LC6+0x27>
ffff8000001109c4:	3a 25 78 20 4c 65    	cmp    0x654c2078(%rip),%ah        # ffff8000655d2a42 <_end+0x654a15ea>
ffff8000001109ca:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001109cb:	67 74 68             	addr32 je ffff800000110a36 <.LC6+0x26>
ffff8000001109ce:	3a 25 78 20 54 79    	cmp    0x79542078(%rip),%ah        # ffff800079652a4c <_end+0x795215f4>
ffff8000001109d4:	70 65                	jo     ffff800000110a3b <.LC6+0x2b>
ffff8000001109d6:	3a 25 78 0a 00     	cmp    0x55000a78(%rip),%ah        # ffff800055111454 <_end+0x54fdfffc>

ffff8000001109db <.LC4>:
ffff8000001109db:	55                   	push   %rbp
ffff8000001109dc:	73 65                	jae    ffff800000110a43 <.LC6+0x33>
ffff8000001109de:	61                   	(bad)  
ffff8000001109df:	62                   	(bad)  
ffff8000001109e0:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001109e1:	65 20 54 6f 74       	and    %dl,%gs:0x74(%rdi,%rbp,2)
ffff8000001109e6:	61                   	(bad)  
ffff8000001109e7:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001109e8:	20 52 41             	and    %dl,0x41(%rdx)
ffff8000001109eb:	4d 3a 25 78 0a 00  	rex.WRB cmp 0x55000a78(%rip),%r12b        # ffff80005511146a <_end+0x54fe0012>

ffff8000001109f1 <.LC5>:
ffff8000001109f1:	55                   	push   %rbp
ffff8000001109f2:	73 65                	jae    ffff800000110a59 <.LC6+0x49>
ffff8000001109f4:	61                   	(bad)  
ffff8000001109f5:	62                   	(bad)  
ffff8000001109f6:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001109f7:	65 20 54 6f 74       	and    %dl,%gs:0x74(%rdi,%rbp,2)
ffff8000001109fc:	61                   	(bad)  
ffff8000001109fd:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001109fe:	20 50 61             	and    %dl,0x61(%rax)
ffff800000110a01:	67 65 20 4e 75       	and    %cl,%gs:0x75(%esi)
ffff800000110a06:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000110a07:	62                   	(bad)  
ffff800000110a08:	65 72 3a             	gs jb  ffff800000110a45 <.LC6+0x35>
ffff800000110a0b:	25 64 0a 00 00       	and    $0xa64,%eax

ffff800000110a10 <.LC6>:
ffff800000110a10:	5a                   	pop    %rdx
ffff800000110a11:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110a12:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110a13:	65 20 20             	and    %ah,%gs:(%rax)
ffff800000110a16:	25 64 0a 7a 6f       	and    $0x6f7a0a64,%eax
ffff800000110a1b:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110a1c:	65 5f                	gs pop %rdi
ffff800000110a1e:	73 74                	jae    ffff800000110a94 <.LC9+0x9>
ffff800000110a20:	61                   	(bad)  
ffff800000110a21:	72 74                	jb     ffff800000110a97 <.LC9+0xc>
ffff800000110a23:	5f                   	pop    %rdi
ffff800000110a24:	61                   	(bad)  
ffff800000110a25:	64 64 72 3a          	fs fs jb ffff800000110a63 <.LC6+0x53>
ffff800000110a29:	25 78 20 7a 6f       	and    $0x6f7a2078,%eax
ffff800000110a2e:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110a2f:	65 5f                	gs pop %rdi
ffff800000110a31:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000110a33:	64 5f                	fs pop %rdi
ffff800000110a35:	61                   	(bad)  
ffff800000110a36:	64 64 72 3a          	fs fs jb ffff800000110a74 <.LC7+0x8>
ffff800000110a3a:	25 78 20 7a 6f       	and    $0x6f7a2078,%eax
ffff800000110a3f:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110a40:	65 5f                	gs pop %rdi
ffff800000110a42:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110a43:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000110a45:	67 74 68             	addr32 je ffff800000110ab0 <.LC10+0x10>
ffff800000110a48:	3a 25 78 0a 70 61    	cmp    0x61700a78(%rip),%ah        # ffff8000618114c6 <_end+0x616e006e>
ffff800000110a4e:	67 65 73 5f          	addr32 gs jae ffff800000110ab1 <.LC10+0x11>
ffff800000110a52:	67 72 6f             	addr32 jb ffff800000110ac4 <.LC10+0x24>
ffff800000110a55:	75 70                	jne    ffff800000110ac7 <.LC10+0x27>
ffff800000110a57:	3a 25 78 20 70 61    	cmp    0x61702078(%rip),%ah        # ffff800061812ad5 <_end+0x616e167d>
ffff800000110a5d:	67 65 73 5f          	addr32 gs jae ffff800000110ac0 <.LC10+0x20>
ffff800000110a61:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110a62:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000110a64:	67 74 68             	addr32 je ffff800000110acf <.LC11+0x7>
ffff800000110a67:	3a 25 78 0a 00     	cmp    0x47000a78(%rip),%ah        # ffff8000471114e5 <_end+0x46fe008d>

ffff800000110a6c <.LC7>:
ffff800000110a6c:	47 6c                	rex.RXB insb (%dx),%es:(%rdi)
ffff800000110a6e:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110a6f:	62 61 6c 5f 43       	(bad)  {%k7}
ffff800000110a74:	52                   	push   %rdx
ffff800000110a75:	33 3a                	xor    (%rdx),%edi
ffff800000110a77:	25 78 0a 00        	and    $0x2a000a78,%eax

ffff800000110a7b <.LC8>:
ffff800000110a7b:	2a 47 6c             	sub    0x6c(%rdi),%al
ffff800000110a7e:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110a7f:	62 61 6c 5f 43       	(bad)  {%k7}
ffff800000110a84:	52                   	push   %rdx
ffff800000110a85:	33 3a                	xor    (%rdx),%edi
ffff800000110a87:	25 78 0a 00        	and    $0x2a000a78,%eax

ffff800000110a8b <.LC9>:
ffff800000110a8b:	2a 2a                	sub    (%rdx),%ch
ffff800000110a8d:	47 6c                	rex.RXB insb (%dx),%es:(%rdi)
ffff800000110a8f:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110a90:	62 61 6c 5f 43       	(bad)  {%k7}
ffff800000110a95:	52                   	push   %rdx
ffff800000110a96:	33 3a                	xor    (%rdx),%edi
ffff800000110a98:	25 78 0a 00 00       	and    $0xa78,%eax
ffff800000110a9d:	00 00                	add    %al,(%rax)
	...

ffff800000110aa0 <.LC10>:
ffff800000110aa0:	61                   	(bad)  
ffff800000110aa1:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110aa2:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110aa3:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110aa4:	63 5f 70             	movslq 0x70(%rdi),%ebx
ffff800000110aa7:	61                   	(bad)  
ffff800000110aa8:	67 65 73 20          	addr32 gs jae ffff800000110acc <.LC11+0x4>
ffff800000110aac:	65 72 72             	gs jb  ffff800000110b21 <.LC13+0x9>
ffff800000110aaf:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110ab0:	72 20                	jb     ffff800000110ad2 <.LC11+0xa>
ffff800000110ab2:	7a 6f                	jp     ffff800000110b23 <.LC13+0xb>
ffff800000110ab4:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110ab5:	65 5f                	gs pop %rdi
ffff800000110ab7:	73 65                	jae    ffff800000110b1e <.LC13+0x6>
ffff800000110ab9:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110aba:	65 63 74 20 69       	movslq %gs:0x69(%rax,%riz,1),%esi
ffff800000110abf:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110ac0:	64 65 78 0a          	fs gs js ffff800000110ace <.LC11+0x6>
ffff800000110ac4:	00 00                	add    %al,(%rax)
	...

ffff800000110ac8 <.LC11>:
ffff800000110ac8:	66 72 65             	data16 jb ffff800000110b30 <.LC13+0x18>
ffff800000110acb:	65 5f                	gs pop %rdi
ffff800000110acd:	70 61                	jo     ffff800000110b30 <.LC13+0x18>
ffff800000110acf:	67 65 73 28          	addr32 gs jae ffff800000110afb <.LC12+0xb>
ffff800000110ad3:	29 20                	sub    %esp,(%rax)
ffff800000110ad5:	45 52                	rex.RB push %r10
ffff800000110ad7:	52                   	push   %rdx
ffff800000110ad8:	4f 52                	rex.WRXB push %r10
ffff800000110ada:	3a 20                	cmp    (%rax),%ah
ffff800000110adc:	70 61                	jo     ffff800000110b3f <.LC13+0x27>
ffff800000110ade:	67 65 20 69 73       	and    %ch,%gs:0x73(%ecx)
ffff800000110ae3:	20 69 6e             	and    %ch,0x6e(%rcx)
ffff800000110ae6:	76 61                	jbe    ffff800000110b49 <.LC13+0x31>
ffff800000110ae8:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110ae9:	69 64 0a 00 00 00 00 	imul   $0x66000000,0x0(%rdx,%rcx,1),%esp
ffff800000110af0:	 

ffff800000110af0 <.LC12>:
ffff800000110af0:	66 72 65             	data16 jb ffff800000110b58 <.LC14+0x8>
ffff800000110af3:	65 5f                	gs pop %rdi
ffff800000110af5:	70 61                	jo     ffff800000110b58 <.LC14+0x8>
ffff800000110af7:	67 65 73 28          	addr32 gs jae ffff800000110b23 <.LC13+0xb>
ffff800000110afb:	29 20                	sub    %esp,(%rax)
ffff800000110afd:	45 52                	rex.RB push %r10
ffff800000110aff:	52                   	push   %rdx
ffff800000110b00:	4f 52                	rex.WRXB push %r10
ffff800000110b02:	3a 20                	cmp    (%rax),%ah
ffff800000110b04:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110b05:	75 6d                	jne    ffff800000110b74 <.LC14+0x24>
ffff800000110b07:	62                   	(bad)  
ffff800000110b08:	65 72 20             	gs jb  ffff800000110b2b <.LC13+0x13>
ffff800000110b0b:	69 73 20 69 6e 76 61 	imul   $0x61766e69,0x20(%rbx),%esi
ffff800000110b12:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110b13:	69 64 0a 00 00   	imul   $0x616d6b00,0x0(%rdx,%rcx,1),%esp
ffff800000110b1a:	 

ffff800000110b18 <.LC13>:
ffff800000110b18:	6b 6d 61 6c          	imul   $0x6c,0x61(%rbp),%ebp
ffff800000110b1c:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110b1d:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110b1e:	63 28                	movslq (%rax),%ebp
ffff800000110b20:	29 3a                	sub    %edi,(%rdx)
ffff800000110b22:	20 63 61             	and    %ah,0x61(%rbx)
ffff800000110b25:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110b26:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110b27:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110b28:	74 20                	je     ffff800000110b4a <.LC13+0x32>
ffff800000110b2a:	61                   	(bad)  
ffff800000110b2b:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110b2c:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110b2d:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110b2e:	63 61 74             	movslq 0x74(%rcx),%esp
ffff800000110b31:	65 20 6d 65          	and    %ch,%gs:0x65(%rbp)
ffff800000110b35:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000110b36:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110b37:	72 79                	jb     ffff800000110bb2 <.LC16+0xa>
ffff800000110b39:	20 73 69             	and    %dh,0x69(%rbx)
ffff800000110b3c:	7a 65                	jp     ffff800000110ba3 <.LC15+0x2b>
ffff800000110b3e:	20 6f 76             	and    %ch,0x76(%rdi)
ffff800000110b41:	65 72 20             	gs jb  ffff800000110b64 <.LC14+0x14>
ffff800000110b44:	31 30                	xor    %esi,(%rax)
ffff800000110b46:	34 38                	xor    $0x38,%al
ffff800000110b48:	35 37 36 0a 00       	xor    $0xa3637,%eax
ffff800000110b4d:	00 00                	add    %al,(%rax)
	...

ffff800000110b50 <.LC14>:
ffff800000110b50:	6b 6d 61 6c          	imul   $0x6c,0x61(%rbp),%ebp
ffff800000110b54:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110b55:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110b56:	63 28                	movslq (%rax),%ebp
ffff800000110b58:	29 3a                	sub    %edi,(%rdx)
ffff800000110b5a:	20 6b 6d             	and    %ch,0x6d(%rbx)
ffff800000110b5d:	61                   	(bad)  
ffff800000110b5e:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110b5f:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110b60:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110b61:	63 5f 63             	movslq 0x63(%rdi),%ebx
ffff800000110b64:	72 65                	jb     ffff800000110bcb <.LC16+0x23>
ffff800000110b66:	61                   	(bad)  
ffff800000110b67:	74 65                	je     ffff800000110bce <.LC16+0x26>
ffff800000110b69:	28 29                	sub    %ch,(%rcx)
ffff800000110b6b:	3d 3d 4e 55 4c       	cmp    $0x4c554e3d,%eax
ffff800000110b70:	4c 0a 00             	rex.WR or (%rax),%r8b
ffff800000110b73:	00 00                	add    %al,(%rax)
ffff800000110b75:	00 00                	add    %al,(%rax)
	...

ffff800000110b78 <.LC15>:
ffff800000110b78:	6b 6d 61 6c          	imul   $0x6c,0x61(%rbp),%ebp
ffff800000110b7c:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110b7d:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110b7e:	63 28                	movslq (%rax),%ebp
ffff800000110b80:	29 3a                	sub    %edi,(%rdx)
ffff800000110b82:	20 6b 6d             	and    %ch,0x6d(%rbx)
ffff800000110b85:	61                   	(bad)  
ffff800000110b86:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110b87:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110b88:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110b89:	63 5f 63             	movslq 0x63(%rdi),%ebx
ffff800000110b8c:	72 65                	jb     ffff800000110bf3 <.LC17+0x23>
ffff800000110b8e:	61                   	(bad)  
ffff800000110b8f:	74 65                	je     ffff800000110bf6 <.LC17+0x26>
ffff800000110b91:	28 29                	sub    %ch,(%rcx)
ffff800000110b93:	3a 20                	cmp    (%rax),%ah
ffff800000110b95:	63 72 65             	movslq 0x65(%rdx),%esi
ffff800000110b98:	61                   	(bad)  
ffff800000110b99:	74 65                	je     ffff800000110c00 <.LC18+0x9>
ffff800000110b9b:	20 73 69             	and    %dh,0x69(%rbx)
ffff800000110b9e:	7a 65                	jp     ffff800000110c05 <.LC18+0xe>
ffff800000110ba0:	3a 20                	cmp    (%rax),%ah
ffff800000110ba2:	25 78 00 00 00       	and    $0x78,%eax
	...

ffff800000110ba8 <.LC16>:
ffff800000110ba8:	6b 6d 61 6c          	imul   $0x6c,0x61(%rbp),%ebp
ffff800000110bac:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110bad:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110bae:	63 28                	movslq (%rax),%ebp
ffff800000110bb0:	29 3a                	sub    %edi,(%rdx)
ffff800000110bb2:	20 4e 6f             	and    %cl,0x6f(%rsi)
ffff800000110bb5:	20 6d 65             	and    %ch,0x65(%rbp)
ffff800000110bb8:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000110bb9:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110bba:	72 79                	jb     ffff800000110c35 <.LC19+0x25>
ffff800000110bbc:	20 63 61             	and    %ah,0x61(%rbx)
ffff800000110bbf:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110bc0:	20 62 65             	and    %ah,0x65(%rdx)
ffff800000110bc3:	20 61 6c             	and    %ah,0x6c(%rcx)
ffff800000110bc6:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110bc7:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110bc8:	63 61 74             	movslq 0x74(%rcx),%esp
ffff800000110bcb:	65 0a 00             	or     %gs:(%rax),%al
	...

ffff800000110bd0 <.LC17>:
ffff800000110bd0:	6b 6d 61 6c          	imul   $0x6c,0x61(%rbp),%ebp
ffff800000110bd4:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110bd5:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110bd6:	63 5f 63             	movslq 0x63(%rdi),%ebx
ffff800000110bd9:	72 65                	jb     ffff800000110c40 <.LC20+0x8>
ffff800000110bdb:	61                   	(bad)  
ffff800000110bdc:	74 65                	je     ffff800000110c43 <.LC20+0xb>
ffff800000110bde:	28 29                	sub    %ch,(%rcx)
ffff800000110be0:	3a 20                	cmp    (%rax),%ah
ffff800000110be2:	61                   	(bad)  
ffff800000110be3:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110be4:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110be5:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110be6:	63 5f 70             	movslq 0x70(%rdi),%ebx
ffff800000110be9:	61                   	(bad)  
ffff800000110bea:	67 65 73 28          	addr32 gs jae ffff800000110c16 <.LC19+0x6>
ffff800000110bee:	29 3d 3d 4e 55 4c    	sub    %edi,0x4c554e3d(%rip)        # ffff80004c665a31 <_end+0x4c5345d9>
ffff800000110bf4:	4c 0a 00             	rex.WR or (%rax),%r8b

ffff800000110bf7 <.LC18>:
ffff800000110bf7:	6b 6d 61 6c          	imul   $0x6c,0x61(%rbp),%ebp
ffff800000110bfb:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110bfc:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110bfd:	63 28                	movslq (%rax),%ebp
ffff800000110bff:	29 3a                	sub    %edi,(%rdx)
ffff800000110c01:	20 77 72             	and    %dh,0x72(%rdi)
ffff800000110c04:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110c05:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110c06:	67 20 73 69          	and    %dh,0x69(%ebx)
ffff800000110c0a:	7a 65                	jp     ffff800000110c71 <.LC21+0x11>
ffff800000110c0c:	0a 00                	or     (%rax),%al
	...

ffff800000110c10 <.LC19>:
ffff800000110c10:	6b 66 72 65          	imul   $0x65,0x72(%rsi),%esp
ffff800000110c14:	65 28 29             	sub    %ch,%gs:(%rcx)
ffff800000110c17:	20 45 52             	and    %al,0x52(%rbp)
ffff800000110c1a:	52                   	push   %rdx
ffff800000110c1b:	4f 52                	rex.WRXB push %r10
ffff800000110c1d:	3a 20                	cmp    (%rax),%ah
ffff800000110c1f:	63 61 6e             	movslq 0x6e(%rcx),%esp
ffff800000110c22:	60                   	(bad)  
ffff800000110c23:	74 20                	je     ffff800000110c45 <.LC20+0xd>
ffff800000110c25:	66 72 65             	data16 jb ffff800000110c8d <.LC21+0x2d>
ffff800000110c28:	65 20 6d 65          	and    %ch,%gs:0x65(%rbp)
ffff800000110c2c:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000110c2d:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110c2e:	72 79                	jb     ffff800000110ca9 <.LC22+0x11>
ffff800000110c30:	0a 00                	or     (%rax),%al
ffff800000110c32:	00 00                	add    %al,(%rax)
ffff800000110c34:	00 00                	add    %al,(%rax)
	...

ffff800000110c38 <.LC20>:
ffff800000110c38:	73 6c                	jae    ffff800000110ca6 <.LC22+0xe>
ffff800000110c3a:	61                   	(bad)  
ffff800000110c3b:	62                   	(bad)  
ffff800000110c3c:	5f                   	pop    %rdi
ffff800000110c3d:	63 72 65             	movslq 0x65(%rdx),%esi
ffff800000110c40:	61                   	(bad)  
ffff800000110c41:	74 65                	je     ffff800000110ca8 <.LC22+0x10>
ffff800000110c43:	3a 20                	cmp    (%rax),%ah
ffff800000110c45:	73 6c                	jae    ffff800000110cb3 <.LC22+0x1b>
ffff800000110c47:	61                   	(bad)  
ffff800000110c48:	62                   	(bad)  
ffff800000110c49:	5f                   	pop    %rdi
ffff800000110c4a:	63 61 63             	movslq 0x63(%rcx),%esp
ffff800000110c4d:	68 65 3d 6b 6d       	pushq  $0x6d6b3d65
ffff800000110c52:	61                   	(bad)  
ffff800000110c53:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110c54:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110c55:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110c56:	63 28                	movslq (%rax),%ebp
ffff800000110c58:	29 3a                	sub    %edi,(%rdx)
ffff800000110c5a:	20 4e 55             	and    %cl,0x55(%rsi)
ffff800000110c5d:	4c                   	rex.WR
ffff800000110c5e:	4c 00            	rex.WR add %r14b,0x6c(%rbx)

ffff800000110c60 <.LC21>:
ffff800000110c60:	73 6c                	jae    ffff800000110cce <.LC22+0x36>
ffff800000110c62:	61                   	(bad)  
ffff800000110c63:	62                   	(bad)  
ffff800000110c64:	5f                   	pop    %rdi
ffff800000110c65:	63 72 65             	movslq 0x65(%rdx),%esi
ffff800000110c68:	61                   	(bad)  
ffff800000110c69:	74 65                	je     ffff800000110cd0 <.LC22+0x38>
ffff800000110c6b:	28 29                	sub    %ch,(%rcx)
ffff800000110c6d:	3a 20                	cmp    (%rax),%ah
ffff800000110c6f:	73 6c                	jae    ffff800000110cdd <.LC23+0x5>
ffff800000110c71:	61                   	(bad)  
ffff800000110c72:	62                   	(bad)  
ffff800000110c73:	5f                   	pop    %rdi
ffff800000110c74:	63 61 63             	movslq 0x63(%rcx),%esp
ffff800000110c77:	68 65 2d 3e 63       	pushq  $0x633e2d65
ffff800000110c7c:	61                   	(bad)  
ffff800000110c7d:	63 68 65             	movslq 0x65(%rax),%ebp
ffff800000110c80:	5f                   	pop    %rdi
ffff800000110c81:	70 6f                	jo     ffff800000110cf2 <.LC23+0x1a>
ffff800000110c83:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110c84:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110c85:	3d 6b 6d 61 6c       	cmp    $0x6c616d6b,%eax
ffff800000110c8a:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110c8b:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110c8c:	63 28                	movslq (%rax),%ebp
ffff800000110c8e:	29 3a                	sub    %edi,(%rdx)
ffff800000110c90:	20 4e 55             	and    %cl,0x55(%rsi)
ffff800000110c93:	4c                   	rex.WR
ffff800000110c94:	4c 00 00             	rex.WR add %r8b,(%rax)
	...

ffff800000110c98 <.LC22>:
ffff800000110c98:	73 6c                	jae    ffff800000110d06 <.LC23+0x2e>
ffff800000110c9a:	61                   	(bad)  
ffff800000110c9b:	62                   	(bad)  
ffff800000110c9c:	5f                   	pop    %rdi
ffff800000110c9d:	63 72 65             	movslq 0x65(%rdx),%esi
ffff800000110ca0:	61                   	(bad)  
ffff800000110ca1:	74 65                	je     ffff800000110d08 <.LC23+0x30>
ffff800000110ca3:	28 29                	sub    %ch,(%rcx)
ffff800000110ca5:	3a 20                	cmp    (%rax),%ah
ffff800000110ca7:	73 6c                	jae    ffff800000110d15 <.LC23+0x3d>
ffff800000110ca9:	61                   	(bad)  
ffff800000110caa:	62                   	(bad)  
ffff800000110cab:	5f                   	pop    %rdi
ffff800000110cac:	63 61 63             	movslq 0x63(%rcx),%esp
ffff800000110caf:	68 65 2d 3e 63       	pushq  $0x633e2d65
ffff800000110cb4:	61                   	(bad)  
ffff800000110cb5:	63 68 65             	movslq 0x65(%rax),%ebp
ffff800000110cb8:	5f                   	pop    %rdi
ffff800000110cb9:	70 6f                	jo     ffff800000110d2a <.LC24+0x12>
ffff800000110cbb:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110cbc:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110cbd:	2d 3e 70 61 67       	sub    $0x6761703e,%eax
ffff800000110cc2:	65 3d 61 6c 6c 6f    	gs cmp $0x6f6c6c61,%eax
ffff800000110cc8:	63 5f 70             	movslq 0x70(%rdi),%ebx
ffff800000110ccb:	61                   	(bad)  
ffff800000110ccc:	67 65 73 28          	addr32 gs jae ffff800000110cf8 <.LC23+0x20>
ffff800000110cd0:	29 3a                	sub    %edi,(%rdx)
ffff800000110cd2:	20 4e 55             	and    %cl,0x55(%rsi)
ffff800000110cd5:	4c                   	rex.WR
ffff800000110cd6:	4c 00            	rex.WR add %r14b,0x6c(%rbx)

ffff800000110cd8 <.LC23>:
ffff800000110cd8:	73 6c                	jae    ffff800000110d46 <.LC25+0xe>
ffff800000110cda:	61                   	(bad)  
ffff800000110cdb:	62                   	(bad)  
ffff800000110cdc:	5f                   	pop    %rdi
ffff800000110cdd:	63 72 65             	movslq 0x65(%rdx),%esi
ffff800000110ce0:	61                   	(bad)  
ffff800000110ce1:	74 65                	je     ffff800000110d48 <.LC25+0x10>
ffff800000110ce3:	28 29                	sub    %ch,(%rcx)
ffff800000110ce5:	3a 20                	cmp    (%rax),%ah
ffff800000110ce7:	73 6c                	jae    ffff800000110d55 <.LC25+0x1d>
ffff800000110ce9:	61                   	(bad)  
ffff800000110cea:	62                   	(bad)  
ffff800000110ceb:	5f                   	pop    %rdi
ffff800000110cec:	63 61 63             	movslq 0x63(%rcx),%esp
ffff800000110cef:	68 65 2d 3e 63       	pushq  $0x633e2d65
ffff800000110cf4:	61                   	(bad)  
ffff800000110cf5:	63 68 65             	movslq 0x65(%rax),%ebp
ffff800000110cf8:	5f                   	pop    %rdi
ffff800000110cf9:	70 6f                	jo     ffff800000110d6a <.LC26+0xa>
ffff800000110cfb:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110cfc:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110cfd:	2d 63 6f 6c 6f       	sub    $0x6f6c6f63,%eax
ffff800000110d02:	72 5f                	jb     ffff800000110d63 <.LC26+0x3>
ffff800000110d04:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000110d05:	61                   	(bad)  
ffff800000110d06:	70 3d                	jo     ffff800000110d45 <.LC25+0xd>
ffff800000110d08:	6b 6d 61 6c          	imul   $0x6c,0x61(%rbp),%ebp
ffff800000110d0c:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110d0d:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110d0e:	63 28                	movslq (%rax),%ebp
ffff800000110d10:	29 3a                	sub    %edi,(%rdx)
ffff800000110d12:	20 4e 55             	and    %cl,0x55(%rsi)
ffff800000110d15:	4c                   	rex.WR
ffff800000110d16:	4c 00            	rex.WR add %r14b,0x6c(%rbx)

ffff800000110d18 <.LC24>:
ffff800000110d18:	73 6c                	jae    ffff800000110d86 <.LC26+0x26>
ffff800000110d1a:	61                   	(bad)  
ffff800000110d1b:	62                   	(bad)  
ffff800000110d1c:	5f                   	pop    %rdi
ffff800000110d1d:	63 61 63             	movslq 0x63(%rcx),%esp
ffff800000110d20:	68 65 2d 3e 74       	pushq  $0x743e2d65
ffff800000110d25:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110d26:	74 61                	je     ffff800000110d89 <.LC26+0x29>
ffff800000110d28:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110d29:	5f                   	pop    %rdi
ffff800000110d2a:	75 73                	jne    ffff800000110d9f <.LC27+0x7>
ffff800000110d2c:	69 6e 67 20 21 3d 20 	imul   $0x203d2120,0x67(%rsi),%ebp
ffff800000110d33:	30 0a                	xor    %cl,(%rdx)
ffff800000110d35:	00 00                	add    %al,(%rax)
	...

ffff800000110d38 <.LC25>:
ffff800000110d38:	73 6c                	jae    ffff800000110da6 <.LC27+0xe>
ffff800000110d3a:	61                   	(bad)  
ffff800000110d3b:	62                   	(bad)  
ffff800000110d3c:	5f                   	pop    %rdi
ffff800000110d3d:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000110d3e:	61                   	(bad)  
ffff800000110d3f:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110d40:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110d41:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110d42:	63 28                	movslq (%rax),%ebp
ffff800000110d44:	29 3a                	sub    %edi,(%rdx)
ffff800000110d46:	20 74 6d 70          	and    %dh,0x70(%rbp,%rbp,2)
ffff800000110d4a:	5f                   	pop    %rdi
ffff800000110d4b:	73 6c                	jae    ffff800000110db9 <.LC27+0x21>
ffff800000110d4d:	61                   	(bad)  
ffff800000110d4e:	62                   	(bad)  
ffff800000110d4f:	3d 6b 6d 61 6c       	cmp    $0x6c616d6b,%eax
ffff800000110d54:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110d55:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110d56:	63 28                	movslq (%rax),%ebp
ffff800000110d58:	29 3d 3d 4e 55 4c    	sub    %edi,0x4c554e3d(%rip)        # ffff80004c665b9b <_end+0x4c534743>
ffff800000110d5e:	4c 00            	rex.WR add %r14b,0x6c(%rbx)

ffff800000110d60 <.LC26>:
ffff800000110d60:	73 6c                	jae    ffff800000110dce <.LC28+0x3>
ffff800000110d62:	61                   	(bad)  
ffff800000110d63:	62                   	(bad)  
ffff800000110d64:	5f                   	pop    %rdi
ffff800000110d65:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000110d66:	61                   	(bad)  
ffff800000110d67:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110d68:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110d69:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110d6a:	63 28                	movslq (%rax),%ebp
ffff800000110d6c:	29 3a                	sub    %edi,(%rdx)
ffff800000110d6e:	20 74 6d 70          	and    %dh,0x70(%rbp,%rbp,2)
ffff800000110d72:	5f                   	pop    %rdi
ffff800000110d73:	73 6c                	jae    ffff800000110de1 <.LC28+0x16>
ffff800000110d75:	61                   	(bad)  
ffff800000110d76:	62                   	(bad)  
ffff800000110d77:	2d 3e 70 61 67       	sub    $0x6761703e,%eax
ffff800000110d7c:	65 3d 61 6c 6c 6f    	gs cmp $0x6f6c6c61,%eax
ffff800000110d82:	63 5f 70             	movslq 0x70(%rdi),%ebx
ffff800000110d85:	61                   	(bad)  
ffff800000110d86:	67 65 73 28          	addr32 gs jae ffff800000110db2 <.LC27+0x1a>
ffff800000110d8a:	29 3d 3d 4e 55 4c    	sub    %edi,0x4c554e3d(%rip)        # ffff80004c665bcd <_end+0x4c534775>
ffff800000110d90:	4c 00 00             	rex.WR add %r8b,(%rax)
ffff800000110d93:	00 00                	add    %al,(%rax)
ffff800000110d95:	00 00                	add    %al,(%rax)
	...

ffff800000110d98 <.LC27>:
ffff800000110d98:	73 6c                	jae    ffff800000110e06 <.LC29+0x1e>
ffff800000110d9a:	61                   	(bad)  
ffff800000110d9b:	62                   	(bad)  
ffff800000110d9c:	5f                   	pop    %rdi
ffff800000110d9d:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000110d9e:	61                   	(bad)  
ffff800000110d9f:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110da0:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110da1:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110da2:	63 28                	movslq (%rax),%ebp
ffff800000110da4:	29 3a                	sub    %edi,(%rdx)
ffff800000110da6:	20 74 6d 70          	and    %dh,0x70(%rbp,%rbp,2)
ffff800000110daa:	5f                   	pop    %rdi
ffff800000110dab:	73 6c                	jae    ffff800000110e19 <.LC1+0x2>
ffff800000110dad:	61                   	(bad)  
ffff800000110dae:	62                   	(bad)  
ffff800000110daf:	2d 3e 63 6f 6c       	sub    $0x6c6f633e,%eax
ffff800000110db4:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110db5:	72 5f                	jb     ffff800000110e16 <.LC0+0xc>
ffff800000110db7:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000110db8:	61                   	(bad)  
ffff800000110db9:	70 3d                	jo     ffff800000110df8 <.LC29+0x10>
ffff800000110dbb:	6b 6d 61 6c          	imul   $0x6c,0x61(%rbp),%ebp
ffff800000110dbf:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110dc0:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110dc1:	63 28                	movslq (%rax),%ebp
ffff800000110dc3:	29 3d 3d 4e 55 4c    	sub    %edi,0x4c554e3d(%rip)        # ffff80004c665c06 <_end+0x4c5347ae>
ffff800000110dc9:	4c 00            	rex.WR add %r14b,0x6c(%rbx)

ffff800000110dcb <.LC28>:
ffff800000110dcb:	73 6c                	jae    ffff800000110e39 <.LC0+0x11>
ffff800000110dcd:	61                   	(bad)  
ffff800000110dce:	62                   	(bad)  
ffff800000110dcf:	5f                   	pop    %rdi
ffff800000110dd0:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000110dd1:	61                   	(bad)  
ffff800000110dd2:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110dd3:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110dd4:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110dd5:	63 28                	movslq (%rax),%ebp
ffff800000110dd7:	29 3a                	sub    %edi,(%rdx)
ffff800000110dd9:	20 63 61             	and    %ah,0x61(%rbx)
ffff800000110ddc:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110ddd:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110dde:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110ddf:	74 20                	je     ffff800000110e01 <.LC29+0x19>
ffff800000110de1:	61                   	(bad)  
ffff800000110de2:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110de3:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110de4:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110de5:	63 0a                	movslq (%rdx),%ecx
	...

ffff800000110de8 <.LC29>:
ffff800000110de8:	73 6c                	jae    ffff800000110e56 <.LC1+0xd>
ffff800000110dea:	61                   	(bad)  
ffff800000110deb:	62                   	(bad)  
ffff800000110dec:	5f                   	pop    %rdi
ffff800000110ded:	66 72 65             	data16 jb ffff800000110e55 <.LC1+0xc>
ffff800000110df0:	65 28 29             	sub    %ch,%gs:(%rcx)
ffff800000110df3:	3a 20                	cmp    (%rax),%ah
ffff800000110df5:	61                   	(bad)  
ffff800000110df6:	64 64 72 65          	fs fs jb ffff800000110e5f <.LC1+0x16>
ffff800000110dfa:	73 73                	jae    ffff800000110e6f <.LC2+0xb>
ffff800000110dfc:	20 6e 6f             	and    %ch,0x6f(%rsi)
ffff800000110dff:	74 20                	je     ffff800000110e21 <.LC1+0xa>
ffff800000110e01:	69 6e 20 73 6c 61 62 	imul   $0x62616c73,0x20(%rsi),%ebp
ffff800000110e08:	0a 00                	or     (%rax),%al

ffff800000110e0a <.LC0>:
ffff800000110e0a:	38 32                	cmp    %dh,(%rdx)
ffff800000110e0c:	35 39 41 20 69       	xor    $0x69204139,%eax
ffff800000110e11:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110e12:	69 74 20 0a 00   	imul   $0x79656b00,0xa(%rax,%riz,1),%esi
ffff800000110e19:	 

ffff800000110e17 <.LC1>:
ffff800000110e17:	6b 65 79 20          	imul   $0x20,0x79(%rbp),%esp
ffff800000110e1b:	63 6f 64             	movslq 0x64(%rdi),%ebp
ffff800000110e1e:	65 3a 25 78 00 00 00 	cmp    %gs:0x78(%rip),%ah        # ffff800000110e9d <.LC0+0x4>
ffff800000110e25:	00 00                	add    %al,(%rax)
	...

ffff800000110e28 <.LC0>:
ffff800000110e28:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110e29:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110e2a:	5f                   	pop    %rdi
ffff800000110e2b:	73 79                	jae    ffff800000110ea6 <.LC0+0xd>
ffff800000110e2d:	73 74                	jae    ffff800000110ea3 <.LC0+0xa>
ffff800000110e2f:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff800000110e31:	5f                   	pop    %rdi
ffff800000110e32:	63 61 6c             	movslq 0x6c(%rcx),%esp
ffff800000110e35:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110e36:	20 69 73             	and    %ch,0x73(%rcx)
ffff800000110e39:	20 63 61             	and    %ah,0x61(%rbx)
ffff800000110e3c:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110e3d:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110e3e:	69 6e 67 2c 4e 52 3a 	imul   $0x3a524e2c,0x67(%rsi),%ebp
ffff800000110e45:	25 78 0a 00        	and    $0x64000a78,%eax

ffff800000110e49 <.LC1>:
ffff800000110e49:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000110e4b:	5f                   	pop    %rdi
ffff800000110e4c:	65 78 65             	gs js  ffff800000110eb4 <_erodata+0x6>
ffff800000110e4f:	63 76 65             	movslq 0x65(%rsi),%esi
ffff800000110e52:	20 74 61 73          	and    %dh,0x73(%rcx,%riz,2)
ffff800000110e56:	6b 20 69             	imul   $0x69,(%rax),%esp
ffff800000110e59:	73 20                	jae    ffff800000110e7b <.LC2+0x17>
ffff800000110e5b:	72 75                	jb     ffff800000110ed2 <_erodata+0x24>
ffff800000110e5d:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110e5e:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110e5f:	69 6e 67 0a 00   	imul   $0x6e69000a,0x67(%rsi),%ebp

ffff800000110e64 <.LC2>:
ffff800000110e64:	69 6e 69 74 20 74 61 	imul   $0x61742074,0x69(%rsi),%ebp
ffff800000110e6b:	73 6b                	jae    ffff800000110ed8 <_erodata+0x2a>
ffff800000110e6d:	20 69 73             	and    %ch,0x73(%rcx)
ffff800000110e70:	20 72 75             	and    %dh,0x75(%rdx)
ffff800000110e73:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110e74:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110e75:	69 6e 67 2c 61 72 67 	imul   $0x6772612c,0x67(%rsi),%ebp
ffff800000110e7c:	3a 25 64 0a 00     	cmp    0x65000a64(%rip),%ah        # ffff8000651118e6 <_end+0x64fe048e>

ffff800000110e81 <.LC3>:
ffff800000110e81:	65 78 69             	gs js  ffff800000110eed <_erodata+0x3f>
ffff800000110e84:	74 28                	je     ffff800000110eae <_erodata>
ffff800000110e86:	29 20                	sub    %esp,(%rax)
ffff800000110e88:	74 61                	je     ffff800000110eeb <_erodata+0x3d>
ffff800000110e8a:	73 6b                	jae    ffff800000110ef7 <_erodata+0x49>
ffff800000110e8c:	20 69 73             	and    %ch,0x73(%rcx)
ffff800000110e8f:	20 72 75             	and    %dh,0x75(%rdx)
ffff800000110e92:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110e93:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110e94:	69 6e 67 0a 00   	imul   $0x6146000a,0x67(%rsi),%ebp

ffff800000110e99 <.LC0>:
ffff800000110e99:	46 61                	rex.RX (bad) 
ffff800000110e9b:	63 74 6f 72          	movslq 0x72(%rdi,%rbp,2),%esi
ffff800000110e9f:	79 4e                	jns    ffff800000110eef <_erodata+0x41>
ffff800000110ea1:	61                   	(bad)  
ffff800000110ea2:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000110ea3:	65 3a 20             	cmp    %gs:(%rax),%ah
ffff800000110ea6:	25 73 00         	and    $0x73250073,%eax

ffff800000110ea9 <.LC1>:
ffff800000110ea9:	25 73 00         	and    $0xa0073,%eax

ffff800000110eac <.LC2>:
ffff800000110eac:	0a 00                	or     (%rax),%al

Disassembly of section .eh_frame:

ffff800000110eb0 <.eh_frame>:
ffff800000110eb0:	14 00                	adc    $0x0,%al
ffff800000110eb2:	00 00                	add    %al,(%rax)
ffff800000110eb4:	00 00                	add    %al,(%rax)
ffff800000110eb6:	00 00                	add    %al,(%rax)
ffff800000110eb8:	01 7a 52             	add    %edi,0x52(%rdx)
ffff800000110ebb:	00 01                	add    %al,(%rcx)
ffff800000110ebd:	78 10                	js     ffff800000110ecf <_erodata+0x21>
ffff800000110ebf:	01 1b                	add    %ebx,(%rbx)
ffff800000110ec1:	0c 07                	or     $0x7,%al
ffff800000110ec3:	08 90 01 00 00 1c    	or     %dl,0x1c000001(%rax)
ffff800000110ec9:	00 00                	add    %al,(%rax)
ffff800000110ecb:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000110ece:	00 00                	add    %al,(%rax)
ffff800000110ed0:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
ffff800000110ed1:	33 ff                	xor    %edi,%edi
ffff800000110ed3:	ff aa 00 00 00 00    	ljmp   *0x0(%rdx)
ffff800000110ed9:	41 0e                	rex.B (bad) 
ffff800000110edb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000110ee1:	02 a5 0c 07 08 00    	add    0x8070c(%rbp),%ah
ffff800000110ee7:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000110eea:	00 00                	add    %al,(%rax)
ffff800000110eec:	3c 00                	cmp    $0x0,%al
ffff800000110eee:	00 00                	add    %al,(%rax)
ffff800000110ef0:	31 34 ff             	xor    %esi,(%rdi,%rdi,8)
ffff800000110ef3:	ff 53 00             	callq  *0x0(%rbx)
ffff800000110ef6:	00 00                	add    %al,(%rax)
ffff800000110ef8:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000110efb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000110f01:	02 4e 0c             	add    0xc(%rsi),%cl
ffff800000110f04:	07                   	(bad)  
ffff800000110f05:	08 00                	or     %al,(%rax)
ffff800000110f07:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000110f0a:	00 00                	add    %al,(%rax)
ffff800000110f0c:	5c                   	pop    %rsp
ffff800000110f0d:	00 00                	add    %al,(%rax)
ffff800000110f0f:	00 64 34 ff          	add    %ah,-0x1(%rsp,%rsi,1)
ffff800000110f13:	ff 53 00             	callq  *0x0(%rbx)
ffff800000110f16:	00 00                	add    %al,(%rax)
ffff800000110f18:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000110f1b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000110f21:	02 4e 0c             	add    0xc(%rsi),%cl
ffff800000110f24:	07                   	(bad)  
ffff800000110f25:	08 00                	or     %al,(%rax)
ffff800000110f27:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000110f2a:	00 00                	add    %al,(%rax)
ffff800000110f2c:	7c 00                	jl     ffff800000110f2e <_erodata+0x80>
ffff800000110f2e:	00 00                	add    %al,(%rax)
ffff800000110f30:	97                   	xchg   %eax,%edi
ffff800000110f31:	34 ff                	xor    $0xff,%al
ffff800000110f33:	ff 53 00             	callq  *0x0(%rbx)
ffff800000110f36:	00 00                	add    %al,(%rax)
ffff800000110f38:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000110f3b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000110f41:	02 4e 0c             	add    0xc(%rsi),%cl
ffff800000110f44:	07                   	(bad)  
ffff800000110f45:	08 00                	or     %al,(%rax)
ffff800000110f47:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000110f4a:	00 00                	add    %al,(%rax)
ffff800000110f4c:	9c                   	pushfq 
ffff800000110f4d:	00 00                	add    %al,(%rax)
ffff800000110f4f:	00 ca                	add    %cl,%dl
ffff800000110f51:	34 ff                	xor    $0xff,%al
ffff800000110f53:	ff 53 00             	callq  *0x0(%rbx)
ffff800000110f56:	00 00                	add    %al,(%rax)
ffff800000110f58:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000110f5b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000110f61:	02 4e 0c             	add    0xc(%rsi),%cl
ffff800000110f64:	07                   	(bad)  
ffff800000110f65:	08 00                	or     %al,(%rax)
ffff800000110f67:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000110f6a:	00 00                	add    %al,(%rax)
ffff800000110f6c:	bc 00 00 00 fd       	mov    $0xfd000000,%esp
ffff800000110f71:	34 ff                	xor    $0xff,%al
ffff800000110f73:	ff 15 01 00 00 00    	callq  *0x1(%rip)        # ffff800000110f7a <_erodata+0xcc>
ffff800000110f79:	41 0e                	rex.B (bad) 
ffff800000110f7b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000110f81:	03 10                	add    (%rax),%edx
ffff800000110f83:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff800000110f86:	08 00                	or     %al,(%rax)
ffff800000110f88:	20 00                	and    %al,(%rax)
ffff800000110f8a:	00 00                	add    %al,(%rax)
ffff800000110f8c:	dc 00                	faddl  (%rax)
ffff800000110f8e:	00 00                	add    %al,(%rax)
ffff800000110f90:	f2 35 ff ff 57 00    	repnz xor $0x57ffff,%eax
ffff800000110f96:	00 00                	add    %al,(%rax)
ffff800000110f98:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000110f9b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000110fa1:	41 83 03 02          	addl   $0x2,(%r11)
ffff800000110fa5:	51                   	push   %rcx
ffff800000110fa6:	0c 07                	or     $0x7,%al
ffff800000110fa8:	08 00                	or     %al,(%rax)
ffff800000110faa:	00 00                	add    %al,(%rax)
ffff800000110fac:	1c 00                	sbb    $0x0,%al
ffff800000110fae:	00 00                	add    %al,(%rax)
ffff800000110fb0:	00 01                	add    %al,(%rcx)
ffff800000110fb2:	00 00                	add    %al,(%rax)
ffff800000110fb4:	25 36 ff ff 34       	and    $0x34ffff36,%eax
ffff800000110fb9:	00 00                	add    %al,(%rax)
ffff800000110fbb:	00 00                	add    %al,(%rax)
ffff800000110fbd:	41 0e                	rex.B (bad) 
ffff800000110fbf:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000110fc5:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110fc6:	0c 07                	or     $0x7,%al
ffff800000110fc8:	08 00                	or     %al,(%rax)
ffff800000110fca:	00 00                	add    %al,(%rax)
ffff800000110fcc:	20 00                	and    %al,(%rax)
ffff800000110fce:	00 00                	add    %al,(%rax)
ffff800000110fd0:	20 01                	and    %al,(%rcx)
ffff800000110fd2:	00 00                	add    %al,(%rax)
ffff800000110fd4:	39 36                	cmp    %esi,(%rsi)
ffff800000110fd6:	ff                   	(bad)  
ffff800000110fd7:	ff 6f 00             	ljmp   *0x0(%rdi)
ffff800000110fda:	00 00                	add    %al,(%rax)
ffff800000110fdc:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000110fdf:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000110fe5:	46 8f 03             	rex.RX popq (%rbx)
ffff800000110fe8:	02 64 0c 07          	add    0x7(%rsp,%rcx,1),%ah
ffff800000110fec:	08 00                	or     %al,(%rax)
ffff800000110fee:	00 00                	add    %al,(%rax)
ffff800000110ff0:	20 00                	and    %al,(%rax)
ffff800000110ff2:	00 00                	add    %al,(%rax)
ffff800000110ff4:	44 01 00             	add    %r8d,(%rax)
ffff800000110ff7:	00 84 36 ff ff 5c 00 	add    %al,0x5cffff(%rsi,%rsi,1)
ffff800000110ffe:	00 00                	add    %al,(%rax)
ffff800000111000:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000111003:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111009:	46 8f 03             	rex.RX popq (%rbx)
ffff80000011100c:	02 51 0c             	add    0xc(%rcx),%dl
ffff80000011100f:	07                   	(bad)  
ffff800000111010:	08 00                	or     %al,(%rax)
ffff800000111012:	00 00                	add    %al,(%rax)
ffff800000111014:	20 00                	and    %al,(%rax)
ffff800000111016:	00 00                	add    %al,(%rax)
ffff800000111018:	68 01 00 00 bc       	pushq  $0xffffffffbc000001
ffff80000011101d:	36 ff                	ss (bad) 
ffff80000011101f:	ff 6e 03             	ljmp   *0x3(%rsi)
ffff800000111022:	00 00                	add    %al,(%rax)
ffff800000111024:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000111027:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000011102d:	47 8f 03             	rex.RXB popq (%r11)
ffff800000111030:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
ffff800000111034:	00 00                	add    %al,(%rax)
ffff800000111036:	00 00                	add    %al,(%rax)
ffff800000111038:	1c 00                	sbb    $0x0,%al
ffff80000011103a:	00 00                	add    %al,(%rax)
ffff80000011103c:	8c 01                	mov    %es,(%rcx)
ffff80000011103e:	00 00                	add    %al,(%rax)
ffff800000111040:	06                   	(bad)  
ffff800000111041:	3a ff                	cmp    %bh,%bh
ffff800000111043:	ff 07                	incl   (%rdi)
ffff800000111045:	01 00                	add    %eax,(%rax)
ffff800000111047:	00 00                	add    %al,(%rax)
ffff800000111049:	41 0e                	rex.B (bad) 
ffff80000011104b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111051:	03 02                	add    (%rdx),%eax
ffff800000111053:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff800000111056:	08 00                	or     %al,(%rax)
ffff800000111058:	1c 00                	sbb    $0x0,%al
ffff80000011105a:	00 00                	add    %al,(%rax)
ffff80000011105c:	ac                   	lods   %ds:(%rsi),%al
ffff80000011105d:	01 00                	add    %eax,(%rax)
ffff80000011105f:	00 ed                	add    %ch,%ch
ffff800000111061:	3a ff                	cmp    %bh,%bh
ffff800000111063:	ff 06                	incl   (%rsi)
ffff800000111065:	01 00                	add    %eax,(%rax)
ffff800000111067:	00 00                	add    %al,(%rax)
ffff800000111069:	41 0e                	rex.B (bad) 
ffff80000011106b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111071:	03 01                	add    (%rcx),%eax
ffff800000111073:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff800000111076:	08 00                	or     %al,(%rax)
ffff800000111078:	20 00                	and    %al,(%rax)
ffff80000011107a:	00 00                	add    %al,(%rax)
ffff80000011107c:	cc                   	int3   
ffff80000011107d:	01 00                	add    %eax,(%rax)
ffff80000011107f:	00 d3                	add    %dl,%bl
ffff800000111081:	3b ff                	cmp    %edi,%edi
ffff800000111083:	ff c7                	inc    %edi
ffff800000111085:	03 00                	add    (%rax),%eax
ffff800000111087:	00 00                	add    %al,(%rax)
ffff800000111089:	41 0e                	rex.B (bad) 
ffff80000011108b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111091:	45 83 03 03          	rex.RB addl $0x3,(%r11)
ffff800000111095:	bd 03 0c 07 08       	mov    $0x8070c03,%ebp
ffff80000011109a:	00 00                	add    %al,(%rax)
ffff80000011109c:	20 00                	and    %al,(%rax)
ffff80000011109e:	00 00                	add    %al,(%rax)
ffff8000001110a0:	f0 01 00             	lock add %eax,(%rax)
ffff8000001110a3:	00 76 3f             	add    %dh,0x3f(%rsi)
ffff8000001110a6:	ff                   	(bad)  
ffff8000001110a7:	ff 9a 03 00 00 00    	lcall  *0x3(%rdx)
ffff8000001110ad:	41 0e                	rex.B (bad) 
ffff8000001110af:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001110b5:	48 83 03 03          	addq   $0x3,(%rbx)
ffff8000001110b9:	8d 03                	lea    (%rbx),%eax
ffff8000001110bb:	0c 07                	or     $0x7,%al
ffff8000001110bd:	08 00                	or     %al,(%rax)
ffff8000001110bf:	00 18                	add    %bl,(%rax)
ffff8000001110c1:	00 00                	add    %al,(%rax)
ffff8000001110c3:	00 14 02             	add    %dl,(%rdx,%rax,1)
ffff8000001110c6:	00 00                	add    %al,(%rax)
ffff8000001110c8:	ec                   	in     (%dx),%al
ffff8000001110c9:	42 ff                	rex.X (bad) 
ffff8000001110cb:	ff 83 00 00 00 00    	incl   0x0(%rbx)
ffff8000001110d1:	41 0e                	rex.B (bad) 
ffff8000001110d3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001110d9:	46 8f 03             	rex.RX popq (%rbx)
ffff8000001110dc:	18 00                	sbb    %al,(%rax)
ffff8000001110de:	00 00                	add    %al,(%rax)
ffff8000001110e0:	30 02                	xor    %al,(%rdx)
ffff8000001110e2:	00 00                	add    %al,(%rax)
ffff8000001110e4:	53                   	push   %rbx
ffff8000001110e5:	43 ff                	rex.XB (bad) 
ffff8000001110e7:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff8000001110ed:	41 0e                	rex.B (bad) 
ffff8000001110ef:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001110f5:	46 8f 03             	rex.RX popq (%rbx)
ffff8000001110f8:	18 00                	sbb    %al,(%rax)
ffff8000001110fa:	00 00                	add    %al,(%rax)
ffff8000001110fc:	4c 02 00             	rex.WR add (%rax),%r8b
ffff8000001110ff:	00 bd 43 ff ff 86    	add    %bh,-0x790000bd(%rbp)
ffff800000111105:	00 00                	add    %al,(%rax)
ffff800000111107:	00 00                	add    %al,(%rax)
ffff800000111109:	41 0e                	rex.B (bad) 
ffff80000011110b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111111:	46 8f 03             	rex.RX popq (%rbx)
ffff800000111114:	18 00                	sbb    %al,(%rax)
ffff800000111116:	00 00                	add    %al,(%rax)
ffff800000111118:	68 02 00 00 27       	pushq  $0x27000002
ffff80000011111d:	44 ff                	rex.R (bad) 
ffff80000011111f:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff800000111125:	41 0e                	rex.B (bad) 
ffff800000111127:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000011112d:	46 8f 03             	rex.RX popq (%rbx)
ffff800000111130:	18 00                	sbb    %al,(%rax)
ffff800000111132:	00 00                	add    %al,(%rax)
ffff800000111134:	84 02                	test   %al,(%rdx)
ffff800000111136:	00 00                	add    %al,(%rax)
ffff800000111138:	91                   	xchg   %eax,%ecx
ffff800000111139:	44 ff                	rex.R (bad) 
ffff80000011113b:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff800000111141:	41 0e                	rex.B (bad) 
ffff800000111143:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111149:	46 8f 03             	rex.RX popq (%rbx)
ffff80000011114c:	18 00                	sbb    %al,(%rax)
ffff80000011114e:	00 00                	add    %al,(%rax)
ffff800000111150:	a0 02 00 00 fb 44 ff 	movabs 0x86ffff44fb000002,%al
ffff800000111157:	ff 86 
ffff800000111159:	00 00                	add    %al,(%rax)
ffff80000011115b:	00 00                	add    %al,(%rax)
ffff80000011115d:	41 0e                	rex.B (bad) 
ffff80000011115f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111165:	46 8f 03             	rex.RX popq (%rbx)
ffff800000111168:	18 00                	sbb    %al,(%rax)
ffff80000011116a:	00 00                	add    %al,(%rax)
ffff80000011116c:	bc 02 00 00 65       	mov    $0x65000002,%esp
ffff800000111171:	45 ff                	rex.RB (bad) 
ffff800000111173:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff800000111179:	41 0e                	rex.B (bad) 
ffff80000011117b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111181:	46 8f 03             	rex.RX popq (%rbx)
ffff800000111184:	18 00                	sbb    %al,(%rax)
ffff800000111186:	00 00                	add    %al,(%rax)
ffff800000111188:	d8 02                	fadds  (%rdx)
ffff80000011118a:	00 00                	add    %al,(%rax)
ffff80000011118c:	cf                   	iret   
ffff80000011118d:	45 ff                	rex.RB (bad) 
ffff80000011118f:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff800000111195:	41 0e                	rex.B (bad) 
ffff800000111197:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000011119d:	46 8f 03             	rex.RX popq (%rbx)
ffff8000001111a0:	18 00                	sbb    %al,(%rax)
ffff8000001111a2:	00 00                	add    %al,(%rax)
ffff8000001111a4:	f4                   	hlt    
ffff8000001111a5:	02 00                	add    (%rax),%al
ffff8000001111a7:	00 39                	add    %bh,(%rcx)
ffff8000001111a9:	46 ff                	rex.RX (bad) 
ffff8000001111ab:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff8000001111b1:	41 0e                	rex.B (bad) 
ffff8000001111b3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001111b9:	46 8f 03             	rex.RX popq (%rbx)
ffff8000001111bc:	18 00                	sbb    %al,(%rax)
ffff8000001111be:	00 00                	add    %al,(%rax)
ffff8000001111c0:	10 03                	adc    %al,(%rbx)
ffff8000001111c2:	00 00                	add    %al,(%rax)
ffff8000001111c4:	a3 46 ff ff 86 00 00 	movabs %eax,0x86ffff46
ffff8000001111cb:	00 00 
ffff8000001111cd:	41 0e                	rex.B (bad) 
ffff8000001111cf:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001111d5:	46 8f 03             	rex.RX popq (%rbx)
ffff8000001111d8:	1c 00                	sbb    $0x0,%al
ffff8000001111da:	00 00                	add    %al,(%rax)
ffff8000001111dc:	2c 03                	sub    $0x3,%al
ffff8000001111de:	00 00                	add    %al,(%rax)
ffff8000001111e0:	0d 47 ff ff e2       	or     $0xe2ffff47,%eax
ffff8000001111e5:	01 00                	add    %eax,(%rax)
ffff8000001111e7:	00 00                	add    %al,(%rax)
ffff8000001111e9:	41 0e                	rex.B (bad) 
ffff8000001111eb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001111f1:	47 8f 03             	rex.RXB popq (%r11)
ffff8000001111f4:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
ffff8000001111f8:	1c 00                	sbb    $0x0,%al
ffff8000001111fa:	00 00                	add    %al,(%rax)
ffff8000001111fc:	4c 03 00             	add    (%rax),%r8
ffff8000001111ff:	00 cf                	add    %cl,%bh
ffff800000111201:	48 ff                	rex.W (bad) 
ffff800000111203:	ff e2                	jmpq   *%rdx
ffff800000111205:	01 00                	add    %eax,(%rax)
ffff800000111207:	00 00                	add    %al,(%rax)
ffff800000111209:	41 0e                	rex.B (bad) 
ffff80000011120b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111211:	47 8f 03             	rex.RXB popq (%r11)
ffff800000111214:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
ffff800000111218:	1c 00                	sbb    $0x0,%al
ffff80000011121a:	00 00                	add    %al,(%rax)
ffff80000011121c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011121d:	03 00                	add    (%rax),%eax
ffff80000011121f:	00 91 4a ff ff e2    	add    %dl,-0x1d0000b6(%rcx)
ffff800000111225:	01 00                	add    %eax,(%rax)
ffff800000111227:	00 00                	add    %al,(%rax)
ffff800000111229:	41 0e                	rex.B (bad) 
ffff80000011122b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111231:	47 8f 03             	rex.RXB popq (%r11)
ffff800000111234:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
ffff800000111238:	1c 00                	sbb    $0x0,%al
ffff80000011123a:	00 00                	add    %al,(%rax)
ffff80000011123c:	8c 03                	mov    %es,(%rbx)
ffff80000011123e:	00 00                	add    %al,(%rax)
ffff800000111240:	53                   	push   %rbx
ffff800000111241:	4c ff                	rex.WR (bad) 
ffff800000111243:	ff e2                	jmpq   *%rdx
ffff800000111245:	01 00                	add    %eax,(%rax)
ffff800000111247:	00 00                	add    %al,(%rax)
ffff800000111249:	41 0e                	rex.B (bad) 
ffff80000011124b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111251:	47 8f 03             	rex.RXB popq (%r11)
ffff800000111254:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
ffff800000111258:	1c 00                	sbb    $0x0,%al
ffff80000011125a:	00 00                	add    %al,(%rax)
ffff80000011125c:	ac                   	lods   %ds:(%rsi),%al
ffff80000011125d:	03 00                	add    (%rax),%eax
ffff80000011125f:	00 15 4e ff ff 56    	add    %dl,0x56ffff4e(%rip)        # ffff8000571111b3 <_end+0x56fdfd5b>
ffff800000111265:	02 00                	add    (%rax),%al
ffff800000111267:	00 00                	add    %al,(%rax)
ffff800000111269:	41 0e                	rex.B (bad) 
ffff80000011126b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111271:	47 8f 03             	rex.RXB popq (%r11)
ffff800000111274:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
ffff800000111278:	18 00                	sbb    %al,(%rax)
ffff80000011127a:	00 00                	add    %al,(%rax)
ffff80000011127c:	cc                   	int3   
ffff80000011127d:	03 00                	add    (%rax),%eax
ffff80000011127f:	00 4b 50             	add    %cl,0x50(%rbx)
ffff800000111282:	ff                   	(bad)  
ffff800000111283:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff800000111289:	41 0e                	rex.B (bad) 
ffff80000011128b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111291:	46 8f 03             	rex.RX popq (%rbx)
ffff800000111294:	18 00                	sbb    %al,(%rax)
ffff800000111296:	00 00                	add    %al,(%rax)
ffff800000111298:	e8 03 00 00 b5       	callq  ffff7fffb51112a0 <OLDSS+0xffff7fffb51111e8>
ffff80000011129d:	50                   	push   %rax
ffff80000011129e:	ff                   	(bad)  
ffff80000011129f:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff8000001112a5:	41 0e                	rex.B (bad) 
ffff8000001112a7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001112ad:	46 8f 03             	rex.RX popq (%rbx)
ffff8000001112b0:	18 00                	sbb    %al,(%rax)
ffff8000001112b2:	00 00                	add    %al,(%rax)
ffff8000001112b4:	04 04                	add    $0x4,%al
ffff8000001112b6:	00 00                	add    %al,(%rax)
ffff8000001112b8:	1f                   	(bad)  
ffff8000001112b9:	51                   	push   %rcx
ffff8000001112ba:	ff                   	(bad)  
ffff8000001112bb:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff8000001112c1:	41 0e                	rex.B (bad) 
ffff8000001112c3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001112c9:	46 8f 03             	rex.RX popq (%rbx)
ffff8000001112cc:	18 00                	sbb    %al,(%rax)
ffff8000001112ce:	00 00                	add    %al,(%rax)
ffff8000001112d0:	20 04 00             	and    %al,(%rax,%rax,1)
ffff8000001112d3:	00 89 51 ff ff 86    	add    %cl,-0x790000af(%rcx)
ffff8000001112d9:	00 00                	add    %al,(%rax)
ffff8000001112db:	00 00                	add    %al,(%rax)
ffff8000001112dd:	41 0e                	rex.B (bad) 
ffff8000001112df:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001112e5:	46 8f 03             	rex.RX popq (%rbx)
ffff8000001112e8:	18 00                	sbb    %al,(%rax)
ffff8000001112ea:	00 00                	add    %al,(%rax)
ffff8000001112ec:	3c 04                	cmp    $0x4,%al
ffff8000001112ee:	00 00                	add    %al,(%rax)
ffff8000001112f0:	f3 51                	repz push %rcx
ffff8000001112f2:	ff                   	(bad)  
ffff8000001112f3:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff8000001112f9:	41 0e                	rex.B (bad) 
ffff8000001112fb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111301:	46 8f 03             	rex.RX popq (%rbx)
ffff800000111304:	20 00                	and    %al,(%rax)
ffff800000111306:	00 00                	add    %al,(%rax)
ffff800000111308:	58                   	pop    %rax
ffff800000111309:	04 00                	add    $0x0,%al
ffff80000011130b:	00 5d 52             	add    %bl,0x52(%rbp)
ffff80000011130e:	ff                   	(bad)  
ffff80000011130f:	ff 09                	decl   (%rcx)
ffff800000111311:	04 00                	add    $0x0,%al
ffff800000111313:	00 00                	add    %al,(%rax)
ffff800000111315:	41 0e                	rex.B (bad) 
ffff800000111317:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000011131d:	43 8f 03             	rex.XB popq (%r11)
ffff800000111320:	83 04 03 01          	addl   $0x1,(%rbx,%rax,1)
ffff800000111324:	04 0c                	add    $0xc,%al
ffff800000111326:	07                   	(bad)  
ffff800000111327:	08 1c 00             	or     %bl,(%rax,%rax,1)
ffff80000011132a:	00 00                	add    %al,(%rax)
ffff80000011132c:	7c 04                	jl     ffff800000111332 <_erodata+0x484>
ffff80000011132e:	00 00                	add    %al,(%rax)
ffff800000111330:	42 56                	rex.X push %rsi
ffff800000111332:	ff                   	(bad)  
ffff800000111333:	ff 82 00 00 00 00    	incl   0x0(%rdx)
ffff800000111339:	41 0e                	rex.B (bad) 
ffff80000011133b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111341:	02 7d 0c             	add    0xc(%rbp),%bh
ffff800000111344:	07                   	(bad)  
ffff800000111345:	08 00                	or     %al,(%rax)
ffff800000111347:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000011134a:	00 00                	add    %al,(%rax)
ffff80000011134c:	9c                   	pushfq 
ffff80000011134d:	04 00                	add    $0x0,%al
ffff80000011134f:	00 a4 56 ff ff 6d 00 	add    %ah,0x6dffff(%rsi,%rdx,2)
ffff800000111356:	00 00                	add    %al,(%rax)
ffff800000111358:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011135b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111361:	02 68 0c             	add    0xc(%rax),%ch
ffff800000111364:	07                   	(bad)  
ffff800000111365:	08 00                	or     %al,(%rax)
ffff800000111367:	00 20                	add    %ah,(%rax)
ffff800000111369:	00 00                	add    %al,(%rax)
ffff80000011136b:	00 bc 04 00 00 f1 56 	add    %bh,0x56f10000(%rsp,%rax,1)
ffff800000111372:	ff                   	(bad)  
ffff800000111373:	ff 70 00             	pushq  0x0(%rax)
ffff800000111376:	00 00                	add    %al,(%rax)
ffff800000111378:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011137b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111381:	46 8f 03             	rex.RX popq (%rbx)
ffff800000111384:	02 65 0c             	add    0xc(%rbp),%ah
ffff800000111387:	07                   	(bad)  
ffff800000111388:	08 00                	or     %al,(%rax)
ffff80000011138a:	00 00                	add    %al,(%rax)
ffff80000011138c:	20 00                	and    %al,(%rax)
ffff80000011138e:	00 00                	add    %al,(%rax)
ffff800000111390:	e0 04                	loopne ffff800000111396 <_erodata+0x4e8>
ffff800000111392:	00 00                	add    %al,(%rax)
ffff800000111394:	3d 57 ff ff 7d       	cmp    $0x7dffff57,%eax
ffff800000111399:	00 00                	add    %al,(%rax)
ffff80000011139b:	00 00                	add    %al,(%rax)
ffff80000011139d:	41 0e                	rex.B (bad) 
ffff80000011139f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001113a5:	46 8f 03             	rex.RX popq (%rbx)
ffff8000001113a8:	02 72 0c             	add    0xc(%rdx),%dh
ffff8000001113ab:	07                   	(bad)  
ffff8000001113ac:	08 00                	or     %al,(%rax)
ffff8000001113ae:	00 00                	add    %al,(%rax)
ffff8000001113b0:	20 00                	and    %al,(%rax)
ffff8000001113b2:	00 00                	add    %al,(%rax)
ffff8000001113b4:	04 05                	add    $0x5,%al
ffff8000001113b6:	00 00                	add    %al,(%rax)
ffff8000001113b8:	96                   	xchg   %eax,%esi
ffff8000001113b9:	57                   	push   %rdi
ffff8000001113ba:	ff                   	(bad)  
ffff8000001113bb:	ff d0                	callq  *%rax
ffff8000001113bd:	0d 00 00 00 41       	or     $0x41000000,%eax
ffff8000001113c2:	0e                   	(bad)  
ffff8000001113c3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001113c9:	47 8f 03             	rex.RXB popq (%r11)
ffff8000001113cc:	83 04 03 c4          	addl   $0xffffffc4,(%rbx,%rax,1)
ffff8000001113d0:	0d 0c 07 08 20       	or     $0x2008070c,%eax
ffff8000001113d5:	00 00                	add    %al,(%rax)
ffff8000001113d7:	00 28                	add    %ch,(%rax)
ffff8000001113d9:	05 00 00 42 65       	add    $0x65420000,%eax
ffff8000001113de:	ff                   	(bad)  
ffff8000001113df:	ff 92 03 00 00 00    	callq  *0x3(%rdx)
ffff8000001113e5:	41 0e                	rex.B (bad) 
ffff8000001113e7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001113ed:	47 8f 03             	rex.RXB popq (%r11)
ffff8000001113f0:	83 04 03 86          	addl   $0xffffff86,(%rbx,%rax,1)
ffff8000001113f4:	03 0c 07             	add    (%rdi,%rax,1),%ecx
ffff8000001113f7:	08 20                	or     %ah,(%rax)
ffff8000001113f9:	00 00                	add    %al,(%rax)
ffff8000001113fb:	00 4c 05 00          	add    %cl,0x0(%rbp,%rax,1)
ffff8000001113ff:	00 b0 68 ff ff 76    	add    %dh,0x76ffff68(%rax)
ffff800000111405:	01 00                	add    %eax,(%rax)
ffff800000111407:	00 00                	add    %al,(%rax)
ffff800000111409:	41 0e                	rex.B (bad) 
ffff80000011140b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111411:	46 8f 03             	rex.RX popq (%rbx)
ffff800000111414:	03 6b 01             	add    0x1(%rbx),%ebp
ffff800000111417:	0c 07                	or     $0x7,%al
ffff800000111419:	08 00                	or     %al,(%rax)
ffff80000011141b:	00 20                	add    %ah,(%rax)
ffff80000011141d:	00 00                	add    %al,(%rax)
ffff80000011141f:	00 70 05             	add    %dh,0x5(%rax)
ffff800000111422:	00 00                	add    %al,(%rax)
ffff800000111424:	02 6a ff             	add    -0x1(%rdx),%ch
ffff800000111427:	ff 68 05             	ljmp   *0x5(%rax)
ffff80000011142a:	00 00                	add    %al,(%rax)
ffff80000011142c:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011142f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111435:	47 8f 03             	rex.RXB popq (%r11)
ffff800000111438:	83 04 03 5c          	addl   $0x5c,(%rbx,%rax,1)
ffff80000011143c:	05 0c 07 08 20       	add    $0x2008070c,%eax
ffff800000111441:	00 00                	add    %al,(%rax)
ffff800000111443:	00 94 05 00 00 46 6f 	add    %dl,0x6f460000(%rbp,%rax,1)
ffff80000011144a:	ff                   	(bad)  
ffff80000011144b:	ff 36                	pushq  (%rsi)
ffff80000011144d:	05 00 00 00 41       	add    $0x41000000,%eax
ffff800000111452:	0e                   	(bad)  
ffff800000111453:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111459:	47 8f 03             	rex.RXB popq (%r11)
ffff80000011145c:	83 04 03 2a          	addl   $0x2a,(%rbx,%rax,1)
ffff800000111460:	05 0c 07 08 20       	add    $0x2008070c,%eax
ffff800000111465:	00 00                	add    %al,(%rax)
ffff800000111467:	00 b8 05 00 00 58    	add    %bh,0x58000005(%rax)
ffff80000011146d:	74 ff                	je     ffff80000011146e <_erodata+0x5c0>
ffff80000011146f:	ff 85 05 00 00 00    	incl   0x5(%rbp)
ffff800000111475:	41 0e                	rex.B (bad) 
ffff800000111477:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000011147d:	47 8f 03             	rex.RXB popq (%r11)
ffff800000111480:	83 04 03 79          	addl   $0x79,(%rbx,%rax,1)
ffff800000111484:	05 0c 07 08 24       	add    $0x2408070c,%eax
ffff800000111489:	00 00                	add    %al,(%rax)
ffff80000011148b:	00 dc                	add    %bl,%ah
ffff80000011148d:	05 00 00 b9 79       	add    $0x79b90000,%eax
ffff800000111492:	ff                   	(bad)  
ffff800000111493:	ff 65 04             	jmpq   *0x4(%rbp)
ffff800000111496:	00 00                	add    %al,(%rax)
ffff800000111498:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011149b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001114a1:	49 8f 03             	rex.WB popq (%r11)
ffff8000001114a4:	8c 04 83             	mov    %es,(%rbx,%rax,4)
ffff8000001114a7:	05 03 57 04 0c       	add    $0xc045703,%eax
ffff8000001114ac:	07                   	(bad)  
ffff8000001114ad:	08 00                	or     %al,(%rax)
ffff8000001114af:	00 20                	add    %ah,(%rax)
ffff8000001114b1:	00 00                	add    %al,(%rax)
ffff8000001114b3:	00 04 06             	add    %al,(%rsi,%rax,1)
ffff8000001114b6:	00 00                	add    %al,(%rax)
ffff8000001114b8:	f6 7d ff             	idivb  -0x1(%rbp)
ffff8000001114bb:	ff                   	(bad)  
ffff8000001114bc:	f8                   	clc    
ffff8000001114bd:	01 00                	add    %eax,(%rax)
ffff8000001114bf:	00 00                	add    %al,(%rax)
ffff8000001114c1:	41 0e                	rex.B (bad) 
ffff8000001114c3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001114c9:	47 8f 03             	rex.RXB popq (%r11)
ffff8000001114cc:	83 04 03 ec          	addl   $0xffffffec,(%rbx,%rax,1)
ffff8000001114d0:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff8000001114d3:	08 20                	or     %ah,(%rax)
ffff8000001114d5:	00 00                	add    %al,(%rax)
ffff8000001114d7:	00 28                	add    %ch,(%rax)
ffff8000001114d9:	06                   	(bad)  
ffff8000001114da:	00 00                	add    %al,(%rax)
ffff8000001114dc:	ca 7f ff             	lret   $0xff7f
ffff8000001114df:	ff 6f 07             	ljmp   *0x7(%rdi)
ffff8000001114e2:	00 00                	add    %al,(%rax)
ffff8000001114e4:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001114e7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001114ed:	47 8f 03             	rex.RXB popq (%r11)
ffff8000001114f0:	83 04 03 63          	addl   $0x63,(%rbx,%rax,1)
ffff8000001114f4:	07                   	(bad)  
ffff8000001114f5:	0c 07                	or     $0x7,%al
ffff8000001114f7:	08 20                	or     %ah,(%rax)
ffff8000001114f9:	00 00                	add    %al,(%rax)
ffff8000001114fb:	00 4c 06 00          	add    %cl,0x0(%rsi,%rax,1)
ffff8000001114ff:	00 15 87 ff ff d4    	add    %dl,-0x2b000079(%rip)        # ffff7fffd511148c <OLDSS+0xffff7fffd51113d4>
ffff800000111505:	02 00                	add    (%rax),%al
ffff800000111507:	00 00                	add    %al,(%rax)
ffff800000111509:	41 0e                	rex.B (bad) 
ffff80000011150b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111511:	47 8f 03             	rex.RXB popq (%r11)
ffff800000111514:	83 04 03 c8          	addl   $0xffffffc8,(%rbx,%rax,1)
ffff800000111518:	02 0c 07             	add    (%rdi,%rax,1),%cl
ffff80000011151b:	08 20                	or     %ah,(%rax)
ffff80000011151d:	00 00                	add    %al,(%rax)
ffff80000011151f:	00 70 06             	add    %dh,0x6(%rax)
ffff800000111522:	00 00                	add    %al,(%rax)
ffff800000111524:	c5 89 ff             	(bad)  
ffff800000111527:	ff                   	(bad)  
ffff800000111528:	ee                   	out    %al,(%dx)
ffff800000111529:	06                   	(bad)  
ffff80000011152a:	00 00                	add    %al,(%rax)
ffff80000011152c:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011152f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111535:	47 8f 03             	rex.RXB popq (%r11)
ffff800000111538:	83 04 03 e2          	addl   $0xffffffe2,(%rbx,%rax,1)
ffff80000011153c:	06                   	(bad)  
ffff80000011153d:	0c 07                	or     $0x7,%al
ffff80000011153f:	08 1c 00             	or     %bl,(%rax,%rax,1)
ffff800000111542:	00 00                	add    %al,(%rax)
ffff800000111544:	94                   	xchg   %eax,%esp
ffff800000111545:	06                   	(bad)  
ffff800000111546:	00 00                	add    %al,(%rax)
ffff800000111548:	8f                   	(bad)  
ffff800000111549:	90                   	nop
ffff80000011154a:	ff                   	(bad)  
ffff80000011154b:	ff 57 00             	callq  *0x0(%rdi)
ffff80000011154e:	00 00                	add    %al,(%rax)
ffff800000111550:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000111553:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111559:	02 52 0c             	add    0xc(%rdx),%dl
ffff80000011155c:	07                   	(bad)  
ffff80000011155d:	08 00                	or     %al,(%rax)
ffff80000011155f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000111562:	00 00                	add    %al,(%rax)
ffff800000111564:	b4 06                	mov    $0x6,%ah
ffff800000111566:	00 00                	add    %al,(%rax)
ffff800000111568:	c6                   	(bad)  
ffff800000111569:	90                   	nop
ffff80000011156a:	ff                   	(bad)  
ffff80000011156b:	ff 6a 00             	ljmp   *0x0(%rdx)
ffff80000011156e:	00 00                	add    %al,(%rax)
ffff800000111570:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000111573:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111579:	02 65 0c             	add    0xc(%rbp),%ah
ffff80000011157c:	07                   	(bad)  
ffff80000011157d:	08 00                	or     %al,(%rax)
ffff80000011157f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000111582:	00 00                	add    %al,(%rax)
ffff800000111584:	d4                   	(bad)  
ffff800000111585:	06                   	(bad)  
ffff800000111586:	00 00                	add    %al,(%rax)
ffff800000111588:	10 91 ff ff 25 00    	adc    %dl,0x25ffff(%rcx)
ffff80000011158e:	00 00                	add    %al,(%rax)
ffff800000111590:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000111593:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111599:	60                   	(bad)  
ffff80000011159a:	0c 07                	or     $0x7,%al
ffff80000011159c:	08 00                	or     %al,(%rax)
ffff80000011159e:	00 00                	add    %al,(%rax)
ffff8000001115a0:	1c 00                	sbb    $0x0,%al
ffff8000001115a2:	00 00                	add    %al,(%rax)
ffff8000001115a4:	f4                   	hlt    
ffff8000001115a5:	06                   	(bad)  
ffff8000001115a6:	00 00                	add    %al,(%rax)
ffff8000001115a8:	15 91 ff ff 25       	adc    $0x25ffff91,%eax
ffff8000001115ad:	00 00                	add    %al,(%rax)
ffff8000001115af:	00 00                	add    %al,(%rax)
ffff8000001115b1:	41 0e                	rex.B (bad) 
ffff8000001115b3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001115b9:	60                   	(bad)  
ffff8000001115ba:	0c 07                	or     $0x7,%al
ffff8000001115bc:	08 00                	or     %al,(%rax)
ffff8000001115be:	00 00                	add    %al,(%rax)
ffff8000001115c0:	1c 00                	sbb    $0x0,%al
ffff8000001115c2:	00 00                	add    %al,(%rax)
ffff8000001115c4:	14 07                	adc    $0x7,%al
ffff8000001115c6:	00 00                	add    %al,(%rax)
ffff8000001115c8:	1a 91 ff ff 32 00    	sbb    0x32ffff(%rcx),%dl
ffff8000001115ce:	00 00                	add    %al,(%rax)
ffff8000001115d0:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001115d3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001115d9:	6d                   	insl   (%dx),%es:(%rdi)
ffff8000001115da:	0c 07                	or     $0x7,%al
ffff8000001115dc:	08 00                	or     %al,(%rax)
ffff8000001115de:	00 00                	add    %al,(%rax)
ffff8000001115e0:	1c 00                	sbb    $0x0,%al
ffff8000001115e2:	00 00                	add    %al,(%rax)
ffff8000001115e4:	34 07                	xor    $0x7,%al
ffff8000001115e6:	00 00                	add    %al,(%rax)
ffff8000001115e8:	2c 91                	sub    $0x91,%al
ffff8000001115ea:	ff                   	(bad)  
ffff8000001115eb:	ff 35 00 00 00 00    	pushq  0x0(%rip)        # ffff8000001115f1 <_erodata+0x743>
ffff8000001115f1:	41 0e                	rex.B (bad) 
ffff8000001115f3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001115f9:	70 0c                	jo     ffff800000111607 <_erodata+0x759>
ffff8000001115fb:	07                   	(bad)  
ffff8000001115fc:	08 00                	or     %al,(%rax)
ffff8000001115fe:	00 00                	add    %al,(%rax)
ffff800000111600:	1c 00                	sbb    $0x0,%al
ffff800000111602:	00 00                	add    %al,(%rax)
ffff800000111604:	54                   	push   %rsp
ffff800000111605:	07                   	(bad)  
ffff800000111606:	00 00                	add    %al,(%rax)
ffff800000111608:	41 91                	xchg   %eax,%r9d
ffff80000011160a:	ff                   	(bad)  
ffff80000011160b:	ff 36                	pushq  (%rsi)
ffff80000011160d:	00 00                	add    %al,(%rax)
ffff80000011160f:	00 00                	add    %al,(%rax)
ffff800000111611:	41 0e                	rex.B (bad) 
ffff800000111613:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111619:	71 0c                	jno    ffff800000111627 <_erodata+0x779>
ffff80000011161b:	07                   	(bad)  
ffff80000011161c:	08 00                	or     %al,(%rax)
ffff80000011161e:	00 00                	add    %al,(%rax)
ffff800000111620:	1c 00                	sbb    $0x0,%al
ffff800000111622:	00 00                	add    %al,(%rax)
ffff800000111624:	74 07                	je     ffff80000011162d <_erodata+0x77f>
ffff800000111626:	00 00                	add    %al,(%rax)
ffff800000111628:	57                   	push   %rdi
ffff800000111629:	91                   	xchg   %eax,%ecx
ffff80000011162a:	ff                   	(bad)  
ffff80000011162b:	ff 59 00             	lcall  *0x0(%rcx)
ffff80000011162e:	00 00                	add    %al,(%rax)
ffff800000111630:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000111633:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111639:	02 54 0c 07          	add    0x7(%rsp,%rcx,1),%dl
ffff80000011163d:	08 00                	or     %al,(%rax)
ffff80000011163f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000111642:	00 00                	add    %al,(%rax)
ffff800000111644:	94                   	xchg   %eax,%esp
ffff800000111645:	07                   	(bad)  
ffff800000111646:	00 00                	add    %al,(%rax)
ffff800000111648:	90                   	nop
ffff800000111649:	91                   	xchg   %eax,%ecx
ffff80000011164a:	ff                   	(bad)  
ffff80000011164b:	ff 57 00             	callq  *0x0(%rdi)
ffff80000011164e:	00 00                	add    %al,(%rax)
ffff800000111650:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000111653:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111659:	02 52 0c             	add    0xc(%rdx),%dl
ffff80000011165c:	07                   	(bad)  
ffff80000011165d:	08 00                	or     %al,(%rax)
ffff80000011165f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000111662:	00 00                	add    %al,(%rax)
ffff800000111664:	b4 07                	mov    $0x7,%ah
ffff800000111666:	00 00                	add    %al,(%rax)
ffff800000111668:	c7                   	(bad)  
ffff800000111669:	91                   	xchg   %eax,%ecx
ffff80000011166a:	ff                   	(bad)  
ffff80000011166b:	ff 44 00 00          	incl   0x0(%rax,%rax,1)
ffff80000011166f:	00 00                	add    %al,(%rax)
ffff800000111671:	41 0e                	rex.B (bad) 
ffff800000111673:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111679:	7f 0c                	jg     ffff800000111687 <_erodata+0x7d9>
ffff80000011167b:	07                   	(bad)  
ffff80000011167c:	08 00                	or     %al,(%rax)
ffff80000011167e:	00 00                	add    %al,(%rax)
ffff800000111680:	1c 00                	sbb    $0x0,%al
ffff800000111682:	00 00                	add    %al,(%rax)
ffff800000111684:	d4                   	(bad)  
ffff800000111685:	07                   	(bad)  
ffff800000111686:	00 00                	add    %al,(%rax)
ffff800000111688:	eb 91                	jmp    ffff80000011161b <_erodata+0x76d>
ffff80000011168a:	ff                   	(bad)  
ffff80000011168b:	ff 45 00             	incl   0x0(%rbp)
ffff80000011168e:	00 00                	add    %al,(%rax)
ffff800000111690:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000111693:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111699:	02 40 0c             	add    0xc(%rax),%al
ffff80000011169c:	07                   	(bad)  
ffff80000011169d:	08 00                	or     %al,(%rax)
ffff80000011169f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff8000001116a2:	00 00                	add    %al,(%rax)
ffff8000001116a4:	f4                   	hlt    
ffff8000001116a5:	07                   	(bad)  
ffff8000001116a6:	00 00                	add    %al,(%rax)
ffff8000001116a8:	10 92 ff ff 3a 00    	adc    %dl,0x3affff(%rdx)
ffff8000001116ae:	00 00                	add    %al,(%rax)
ffff8000001116b0:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001116b3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001116b9:	75 0c                	jne    ffff8000001116c7 <_erodata+0x819>
ffff8000001116bb:	07                   	(bad)  
ffff8000001116bc:	08 00                	or     %al,(%rax)
ffff8000001116be:	00 00                	add    %al,(%rax)
ffff8000001116c0:	1c 00                	sbb    $0x0,%al
ffff8000001116c2:	00 00                	add    %al,(%rax)
ffff8000001116c4:	14 08                	adc    $0x8,%al
ffff8000001116c6:	00 00                	add    %al,(%rax)
ffff8000001116c8:	2a 92 ff ff 3a 00    	sub    0x3affff(%rdx),%dl
ffff8000001116ce:	00 00                	add    %al,(%rax)
ffff8000001116d0:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001116d3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001116d9:	75 0c                	jne    ffff8000001116e7 <_erodata+0x839>
ffff8000001116db:	07                   	(bad)  
ffff8000001116dc:	08 00                	or     %al,(%rax)
ffff8000001116de:	00 00                	add    %al,(%rax)
ffff8000001116e0:	20 00                	and    %al,(%rax)
ffff8000001116e2:	00 00                	add    %al,(%rax)
ffff8000001116e4:	34 08                	xor    $0x8,%al
ffff8000001116e6:	00 00                	add    %al,(%rax)
ffff8000001116e8:	34 99                	xor    $0x99,%al
ffff8000001116ea:	ff                   	(bad)  
ffff8000001116eb:	ff                   	(bad)  
ffff8000001116ec:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001116f1:	41 0e                	rex.B (bad) 
ffff8000001116f3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001116f9:	47 8f 03             	rex.RXB popq (%r11)
ffff8000001116fc:	83 04 03 b2          	addl   $0xffffffb2,(%rbx,%rax,1)
ffff800000111700:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff800000111703:	08 20                	or     %ah,(%rax)
ffff800000111705:	00 00                	add    %al,(%rax)
ffff800000111707:	00 58 08             	add    %bl,0x8(%rax)
ffff80000011170a:	00 00                	add    %al,(%rax)
ffff80000011170c:	ce                   	(bad)  
ffff80000011170d:	9a                   	(bad)  
ffff80000011170e:	ff                   	(bad)  
ffff80000011170f:	ff a2 00 00 00 00    	jmpq   *0x0(%rdx)
ffff800000111715:	41 0e                	rex.B (bad) 
ffff800000111717:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000011171d:	47 8f 03             	rex.RXB popq (%r11)
ffff800000111720:	83 04 02 96          	addl   $0xffffff96,(%rdx,%rax,1)
ffff800000111724:	0c 07                	or     $0x7,%al
ffff800000111726:	08 00                	or     %al,(%rax)
ffff800000111728:	20 00                	and    %al,(%rax)
ffff80000011172a:	00 00                	add    %al,(%rax)
ffff80000011172c:	7c 08                	jl     ffff800000111736 <_erodata+0x888>
ffff80000011172e:	00 00                	add    %al,(%rax)
ffff800000111730:	4c                   	rex.WR
ffff800000111731:	9b                   	fwait
ffff800000111732:	ff                   	(bad)  
ffff800000111733:	ff 57 00             	callq  *0x0(%rdi)
ffff800000111736:	00 00                	add    %al,(%rax)
ffff800000111738:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011173b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111741:	41 83 03 02          	addl   $0x2,(%r11)
ffff800000111745:	51                   	push   %rcx
ffff800000111746:	0c 07                	or     $0x7,%al
ffff800000111748:	08 00                	or     %al,(%rax)
ffff80000011174a:	00 00                	add    %al,(%rax)
ffff80000011174c:	1c 00                	sbb    $0x0,%al
ffff80000011174e:	00 00                	add    %al,(%rax)
ffff800000111750:	a0 08 00 00 7f 9b ff 	movabs 0x34ffff9b7f000008,%al
ffff800000111757:	ff 34 
ffff800000111759:	00 00                	add    %al,(%rax)
ffff80000011175b:	00 00                	add    %al,(%rax)
ffff80000011175d:	41 0e                	rex.B (bad) 
ffff80000011175f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111765:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111766:	0c 07                	or     $0x7,%al
ffff800000111768:	08 00                	or     %al,(%rax)
ffff80000011176a:	00 00                	add    %al,(%rax)
ffff80000011176c:	20 00                	and    %al,(%rax)
ffff80000011176e:	00 00                	add    %al,(%rax)
ffff800000111770:	c0 08 00             	rorb   $0x0,(%rax)
ffff800000111773:	00 93 9b ff ff 6f    	add    %dl,0x6fffff9b(%rbx)
ffff800000111779:	00 00                	add    %al,(%rax)
ffff80000011177b:	00 00                	add    %al,(%rax)
ffff80000011177d:	41 0e                	rex.B (bad) 
ffff80000011177f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111785:	46 8f 03             	rex.RX popq (%rbx)
ffff800000111788:	02 64 0c 07          	add    0x7(%rsp,%rcx,1),%ah
ffff80000011178c:	08 00                	or     %al,(%rax)
ffff80000011178e:	00 00                	add    %al,(%rax)
ffff800000111790:	20 00                	and    %al,(%rax)
ffff800000111792:	00 00                	add    %al,(%rax)
ffff800000111794:	e4 08                	in     $0x8,%al
ffff800000111796:	00 00                	add    %al,(%rax)
ffff800000111798:	de 9b ff ff 5c 00    	ficomps 0x5cffff(%rbx)
ffff80000011179e:	00 00                	add    %al,(%rax)
ffff8000001117a0:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001117a3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001117a9:	46 8f 03             	rex.RX popq (%rbx)
ffff8000001117ac:	02 51 0c             	add    0xc(%rcx),%dl
ffff8000001117af:	07                   	(bad)  
ffff8000001117b0:	08 00                	or     %al,(%rax)
ffff8000001117b2:	00 00                	add    %al,(%rax)
ffff8000001117b4:	1c 00                	sbb    $0x0,%al
ffff8000001117b6:	00 00                	add    %al,(%rax)
ffff8000001117b8:	08 09                	or     %cl,(%rcx)
ffff8000001117ba:	00 00                	add    %al,(%rax)
ffff8000001117bc:	16                   	(bad)  
ffff8000001117bd:	9c                   	pushfq 
ffff8000001117be:	ff                   	(bad)  
ffff8000001117bf:	ff aa 00 00 00 00    	ljmp   *0x0(%rdx)
ffff8000001117c5:	41 0e                	rex.B (bad) 
ffff8000001117c7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001117cd:	02 a5 0c 07 08 00    	add    0x8070c(%rbp),%ah
ffff8000001117d3:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff8000001117d6:	00 00                	add    %al,(%rax)
ffff8000001117d8:	28 09                	sub    %cl,(%rcx)
ffff8000001117da:	00 00                	add    %al,(%rax)
ffff8000001117dc:	a0 9c ff ff 53 00 00 	movabs 0x53ffff9c,%al
ffff8000001117e3:	00 00 
ffff8000001117e5:	41 0e                	rex.B (bad) 
ffff8000001117e7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001117ed:	02 4e 0c             	add    0xc(%rsi),%cl
ffff8000001117f0:	07                   	(bad)  
ffff8000001117f1:	08 00                	or     %al,(%rax)
ffff8000001117f3:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff8000001117f6:	00 00                	add    %al,(%rax)
ffff8000001117f8:	48 09 00             	or     %rax,(%rax)
ffff8000001117fb:	00 d3                	add    %dl,%bl
ffff8000001117fd:	9c                   	pushfq 
ffff8000001117fe:	ff                   	(bad)  
ffff8000001117ff:	ff 53 00             	callq  *0x0(%rbx)
ffff800000111802:	00 00                	add    %al,(%rax)
ffff800000111804:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000111807:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000011180d:	02 4e 0c             	add    0xc(%rsi),%cl
ffff800000111810:	07                   	(bad)  
ffff800000111811:	08 00                	or     %al,(%rax)
ffff800000111813:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000111816:	00 00                	add    %al,(%rax)
ffff800000111818:	68 09 00 00 06       	pushq  $0x6000009
ffff80000011181d:	9d                   	popfq  
ffff80000011181e:	ff                   	(bad)  
ffff80000011181f:	ff 53 00             	callq  *0x0(%rbx)
ffff800000111822:	00 00                	add    %al,(%rax)
ffff800000111824:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000111827:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000011182d:	02 4e 0c             	add    0xc(%rsi),%cl
ffff800000111830:	07                   	(bad)  
ffff800000111831:	08 00                	or     %al,(%rax)
ffff800000111833:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000111836:	00 00                	add    %al,(%rax)
ffff800000111838:	88 09                	mov    %cl,(%rcx)
ffff80000011183a:	00 00                	add    %al,(%rax)
ffff80000011183c:	39 9d ff ff 53 00    	cmp    %ebx,0x53ffff(%rbp)
ffff800000111842:	00 00                	add    %al,(%rax)
ffff800000111844:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000111847:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000011184d:	02 4e 0c             	add    0xc(%rsi),%cl
ffff800000111850:	07                   	(bad)  
ffff800000111851:	08 00                	or     %al,(%rax)
ffff800000111853:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000111856:	00 00                	add    %al,(%rax)
ffff800000111858:	a8 09                	test   $0x9,%al
ffff80000011185a:	00 00                	add    %al,(%rax)
ffff80000011185c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011185d:	9d                   	popfq  
ffff80000011185e:	ff                   	(bad)  
ffff80000011185f:	ff 15 01 00 00 00    	callq  *0x1(%rip)        # ffff800000111866 <_erodata+0x9b8>
ffff800000111865:	41 0e                	rex.B (bad) 
ffff800000111867:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000011186d:	03 10                	add    (%rax),%edx
ffff80000011186f:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff800000111872:	08 00                	or     %al,(%rax)
ffff800000111874:	18 00                	sbb    %al,(%rax)
ffff800000111876:	00 00                	add    %al,(%rax)
ffff800000111878:	c8 09 00 00          	enterq $0x9,$0x0
ffff80000011187c:	61                   	(bad)  
ffff80000011187d:	9e                   	sahf   
ffff80000011187e:	ff                   	(bad)  
ffff80000011187f:	ff 59 00             	lcall  *0x0(%rcx)
ffff800000111882:	00 00                	add    %al,(%rax)
ffff800000111884:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000111887:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000011188d:	00 00                	add    %al,(%rax)
ffff80000011188f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000111892:	00 00                	add    %al,(%rax)
ffff800000111894:	e4 09                	in     $0x9,%al
ffff800000111896:	00 00                	add    %al,(%rax)
ffff800000111898:	9e                   	sahf   
ffff800000111899:	9e                   	sahf   
ffff80000011189a:	ff                   	(bad)  
ffff80000011189b:	ff 47 00             	incl   0x0(%rdi)
ffff80000011189e:	00 00                	add    %al,(%rax)
ffff8000001118a0:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001118a3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001118a9:	02 42 0c             	add    0xc(%rdx),%al
ffff8000001118ac:	07                   	(bad)  
ffff8000001118ad:	08 00                	or     %al,(%rax)
ffff8000001118af:	00 20                	add    %ah,(%rax)
ffff8000001118b1:	00 00                	add    %al,(%rax)
ffff8000001118b3:	00 04 0a             	add    %al,(%rdx,%rcx,1)
ffff8000001118b6:	00 00                	add    %al,(%rax)
ffff8000001118b8:	c5 9e ff             	(bad)  
ffff8000001118bb:	ff c9                	dec    %ecx
ffff8000001118bd:	00 00                	add    %al,(%rax)
ffff8000001118bf:	00 00                	add    %al,(%rax)
ffff8000001118c1:	41 0e                	rex.B (bad) 
ffff8000001118c3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001118c9:	47 8f 03             	rex.RXB popq (%r11)
ffff8000001118cc:	83 04 02 bd          	addl   $0xffffffbd,(%rdx,%rax,1)
ffff8000001118d0:	0c 07                	or     $0x7,%al
ffff8000001118d2:	08 00                	or     %al,(%rax)
ffff8000001118d4:	1c 00                	sbb    $0x0,%al
ffff8000001118d6:	00 00                	add    %al,(%rax)
ffff8000001118d8:	28 0a                	sub    %cl,(%rdx)
ffff8000001118da:	00 00                	add    %al,(%rax)
ffff8000001118dc:	6a 9f                	pushq  $0xffffffffffffff9f
ffff8000001118de:	ff                   	(bad)  
ffff8000001118df:	ff 4b 00             	decl   0x0(%rbx)
ffff8000001118e2:	00 00                	add    %al,(%rax)
ffff8000001118e4:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001118e7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001118ed:	02 46 0c             	add    0xc(%rsi),%al
ffff8000001118f0:	07                   	(bad)  
ffff8000001118f1:	08 00                	or     %al,(%rax)
ffff8000001118f3:	00 24 00             	add    %ah,(%rax,%rax,1)
ffff8000001118f6:	00 00                	add    %al,(%rax)
ffff8000001118f8:	48 0a 00             	rex.W or (%rax),%al
ffff8000001118fb:	00 95 9f ff ff 3b    	add    %dl,0x3bffff9f(%rbp)
ffff800000111901:	01 00                	add    %eax,(%rax)
ffff800000111903:	00 00                	add    %al,(%rax)
ffff800000111905:	41 0e                	rex.B (bad) 
ffff800000111907:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000011190d:	49 8f 03             	rex.WB popq (%r11)
ffff800000111910:	8c 04 83             	mov    %es,(%rbx,%rax,4)
ffff800000111913:	05 03 2d 01 0c       	add    $0xc012d03,%eax
ffff800000111918:	07                   	(bad)  
ffff800000111919:	08 00                	or     %al,(%rax)
ffff80000011191b:	00 24 00             	add    %ah,(%rax,%rax,1)
ffff80000011191e:	00 00                	add    %al,(%rax)
ffff800000111920:	70 0a                	jo     ffff80000011192c <_erodata+0xa7e>
ffff800000111922:	00 00                	add    %al,(%rax)
ffff800000111924:	a8 a0                	test   $0xa0,%al
ffff800000111926:	ff                   	(bad)  
ffff800000111927:	ff 5f 01             	lcall  *0x1(%rdi)
ffff80000011192a:	00 00                	add    %al,(%rax)
ffff80000011192c:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011192f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111935:	49 8d 03             	lea    (%r11),%rax
ffff800000111938:	8c 04 83             	mov    %es,(%rbx,%rax,4)
ffff80000011193b:	05 03 51 01 0c       	add    $0xc015103,%eax
ffff800000111940:	07                   	(bad)  
ffff800000111941:	08 00                	or     %al,(%rax)
ffff800000111943:	00 28                	add    %ch,(%rax)
ffff800000111945:	00 00                	add    %al,(%rax)
ffff800000111947:	00 98 0a 00 00 df    	add    %bl,-0x20fffff6(%rax)
ffff80000011194d:	a1 ff ff 0b 04 00 00 	movabs 0x41000000040bffff,%eax
ffff800000111954:	00 41 
ffff800000111956:	0e                   	(bad)  
ffff800000111957:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000011195d:	4d 8f 03             	rex.WRB popq (%r11)
ffff800000111960:	8e 04 8d 05 8c 06 83 	mov    -0x7cf973fb(,%rcx,4),%es
ffff800000111967:	07                   	(bad)  
ffff800000111968:	03 f9                	add    %ecx,%edi
ffff80000011196a:	03 0c 07             	add    (%rdi,%rax,1),%ecx
ffff80000011196d:	08 00                	or     %al,(%rax)
ffff80000011196f:	00 20                	add    %ah,(%rax)
ffff800000111971:	00 00                	add    %al,(%rax)
ffff800000111973:	00 c4                	add    %al,%ah
ffff800000111975:	0a 00                	or     (%rax),%al
ffff800000111977:	00 be a5 ff ff e7    	add    %bh,-0x1800005b(%rsi)
ffff80000011197d:	00 00                	add    %al,(%rax)
ffff80000011197f:	00 00                	add    %al,(%rax)
ffff800000111981:	41 0e                	rex.B (bad) 
ffff800000111983:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111989:	4a 8f 03             	rex.WX popq (%rbx)
ffff80000011198c:	83 04 02 d8          	addl   $0xffffffd8,(%rdx,%rax,1)
ffff800000111990:	0c 07                	or     $0x7,%al
ffff800000111992:	08 00                	or     %al,(%rax)
ffff800000111994:	20 00                	and    %al,(%rax)
ffff800000111996:	00 00                	add    %al,(%rax)
ffff800000111998:	e8 0a 00 00 81       	callq  ffff7fff811119a7 <OLDSS+0xffff7fff811118ef>
ffff80000011199d:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
ffff80000011199e:	ff                   	(bad)  
ffff80000011199f:	ff 73 02             	pushq  0x2(%rbx)
ffff8000001119a2:	00 00                	add    %al,(%rax)
ffff8000001119a4:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001119a7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001119ad:	47 8f 03             	rex.RXB popq (%r11)
ffff8000001119b0:	83 04 03 67          	addl   $0x67,(%rbx,%rax,1)
ffff8000001119b4:	02 0c 07             	add    (%rdi,%rax,1),%cl
ffff8000001119b7:	08 1c 00             	or     %bl,(%rax,%rax,1)
ffff8000001119ba:	00 00                	add    %al,(%rax)
ffff8000001119bc:	0c 0b                	or     $0xb,%al
ffff8000001119be:	00 00                	add    %al,(%rax)
ffff8000001119c0:	d0 a8 ff ff 54 00    	shrb   0x54ffff(%rax)
ffff8000001119c6:	00 00                	add    %al,(%rax)
ffff8000001119c8:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001119cb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001119d1:	46 8f 03             	rex.RX popq (%rbx)
ffff8000001119d4:	00 00                	add    %al,(%rax)
ffff8000001119d6:	00 00                	add    %al,(%rax)
ffff8000001119d8:	20 00                	and    %al,(%rax)
ffff8000001119da:	00 00                	add    %al,(%rax)
ffff8000001119dc:	2c 0b                	sub    $0xb,%al
ffff8000001119de:	00 00                	add    %al,(%rax)
ffff8000001119e0:	04 a9                	add    $0xa9,%al
ffff8000001119e2:	ff                   	(bad)  
ffff8000001119e3:	ff 57 00             	callq  *0x0(%rdi)
ffff8000001119e6:	00 00                	add    %al,(%rax)
ffff8000001119e8:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001119eb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001119f1:	41 83 03 02          	addl   $0x2,(%r11)
ffff8000001119f5:	51                   	push   %rcx
ffff8000001119f6:	0c 07                	or     $0x7,%al
ffff8000001119f8:	08 00                	or     %al,(%rax)
ffff8000001119fa:	00 00                	add    %al,(%rax)
ffff8000001119fc:	20 00                	and    %al,(%rax)
ffff8000001119fe:	00 00                	add    %al,(%rax)
ffff800000111a00:	50                   	push   %rax
ffff800000111a01:	0b 00                	or     (%rax),%eax
ffff800000111a03:	00 37                	add    %dh,(%rdi)
ffff800000111a05:	a9 ff ff ec 01       	test   $0x1ecffff,%eax
ffff800000111a0a:	00 00                	add    %al,(%rax)
ffff800000111a0c:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000111a0f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111a15:	47 8f 03             	rex.RXB popq (%r11)
ffff800000111a18:	83 04 03 e0          	addl   $0xffffffe0,(%rbx,%rax,1)
ffff800000111a1c:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff800000111a1f:	08                   	.byte 0x8

Disassembly of section .data.init_task:

ffff800000118000 <init_task_union>:
	...
ffff800000118010:	04 00                	add    $0x0,%al
ffff800000118012:	00 00                	add    %al,(%rax)
ffff800000118014:	00 00                	add    %al,(%rax)
ffff800000118016:	00 00                	add    %al,(%rax)
ffff800000118018:	01 00                	add    %eax,(%rax)
ffff80000011801a:	00 00                	add    %al,(%rax)
ffff80000011801c:	00 00                	add    %al,(%rax)
ffff80000011801e:	00 00                	add    %al,(%rax)
ffff800000118020:	20 80 12 00 00 80    	and    %al,-0x7fffffee(%rax)
ffff800000118026:	ff                   	(bad)  
ffff800000118027:	ff 00                	incl   (%rax)
ffff800000118029:	f2 10 00             	repnz adc %al,(%rax)
ffff80000011802c:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000118032:	00 00                	add    %al,(%rax)
ffff800000118034:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011803a:	00 00                	add    %al,(%rax)
ffff80000011803c:	00 00                	add    %al,(%rax)
ffff80000011803e:	00 00                	add    %al,(%rax)
ffff800000118040:	01 00                	add    %eax,(%rax)
	...
ffff80000012000e:	00 00                	add    %al,(%rax)
ffff800000120010:	04 00                	add    $0x0,%al
ffff800000120012:	00 00                	add    %al,(%rax)
ffff800000120014:	00 00                	add    %al,(%rax)
ffff800000120016:	00 00                	add    %al,(%rax)
ffff800000120018:	01 00                	add    %eax,(%rax)
ffff80000012001a:	00 00                	add    %al,(%rax)
ffff80000012001c:	00 00                	add    %al,(%rax)
ffff80000012001e:	00 00                	add    %al,(%rax)
ffff800000120020:	20 80 12 00 00 80    	and    %al,-0x7fffffee(%rax)
ffff800000120026:	ff                   	(bad)  
ffff800000120027:	ff 00                	incl   (%rax)
ffff800000120029:	f2 10 00             	repnz adc %al,(%rax)
ffff80000012002c:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000120032:	00 00                	add    %al,(%rax)
ffff800000120034:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000012003a:	00 00                	add    %al,(%rax)
ffff80000012003c:	00 00                	add    %al,(%rax)
ffff80000012003e:	00 00                	add    %al,(%rax)
ffff800000120040:	01 00                	add    %eax,(%rax)
	...

Disassembly of section .bss:

ffff800000128000 <ZONE_DMA_INDEX>:
ffff800000128000:	00 00                	add    %al,(%rax)
	...

ffff800000128004 <ZONE_NORMAL_INDEX>:
ffff800000128004:	00 00                	add    %al,(%rax)
	...

ffff800000128008 <ZONE_UNMAPPED_INDEX>:
	...

ffff800000128010 <Global_CR3>:
	...

ffff800000128020 <init_mm>:
	...

ffff800000128080 <buf>:
	...

ffff800000129110 <_ebss>:
	...

ffff800000129120 <pos>:
	...

ffff800000129160 <__>:
	...

ffff800000131160 <mman_struct>:
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	47                   	rex.RXB
   1:	43                   	rex.XB
   2:	43 3a 20             	rex.XB cmp (%r8),%spl
   5:	28 55 62             	sub    %dl,0x62(%rbp)
   8:	75 6e                	jne    78 <ES>
   a:	74 75                	je     81 <RAX+0x1>
   c:	20 37                	and    %dh,(%rdi)
   e:	2e 35 2e 30 2d 33    	cs xor $0x332d302e,%eax
  14:	75 62                	jne    78 <ES>
  16:	75 6e                	jne    86 <RAX+0x6>
  18:	74 75                	je     8f <FUNC+0x7>
  1a:	31 7e 31             	xor    %edi,0x31(%rsi)
  1d:	38 2e                	cmp    %ch,(%rsi)
  1f:	30 34 29             	xor    %dh,(%rcx,%rbp,1)
  22:	20 37                	and    %dh,(%rdi)
  24:	2e                   	cs
  25:	35                   	.byte 0x35
  26:	2e 30 00             	xor    %al,%cs:(%rax)
