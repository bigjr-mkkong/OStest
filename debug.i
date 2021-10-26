
system:     file format elf64-x86-64


Disassembly of section .text:

ffff800000100000 <_start>:
ffff800000100000:	0f 01 15 11 9d 00 00 	lgdt   0x9d11(%rip)        # ffff800000109d18 <GDT_END>
ffff800000100007:	0f 01 1d 14 ad 00 00 	lidt   0xad14(%rip)        # ffff80000010ad22 <IDT_END>
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
ffff800000100074:	48 8d 3d a7 9c 00 00 	lea    0x9ca7(%rip),%rdi        # ffff800000109d22 <LABEL_IDT>
ffff80000010007b:	48 c7 c1 00 01 00 00 	mov    $0x100,%rcx

ffff800000100082 <.setting>:
ffff800000100082:	48 89 07             	mov    %rax,(%rdi)
ffff800000100085:	48 89 57 08          	mov    %rdx,0x8(%rdi)
ffff800000100089:	48 83 c7 10          	add    $0x10,%rdi
ffff80000010008d:	48 ff c9             	dec    %rcx
ffff800000100090:	75 f0                	jne    ffff800000100082 <.setting>

ffff800000100092 <setup_TSS64>:
ffff800000100092:	48 8d 15 93 ac 00 00 	lea    0xac93(%rip),%rdx        # ffff80000010ad2c <LABEL_TSS64>
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
ffff8000001000cc:	48 8d 3d ad 9b 00 00 	lea    0x9bad(%rip),%rdi        # ffff800000109c80 <LABEL_GDT64>
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
ffff800000100132:	e8 d9 4d 00 00       	callq  ffff800000104f10 <printk>
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
ffff80000010017f:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff800000100185:	ff                   	(bad)  
ffff800000100186:	ff 90 00 00 00 00    	callq  *0x0(%rax)
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
ffff80000010405f:	e8 17 4e 00 00       	callq  ffff800000108e7b <system_call_function>

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
ffff8000001040df:	48 8d 05 c4 11 00 00 	lea    0x11c4(%rip),%rax        # ffff8000001052aa <do_divide_error>
ffff8000001040e6:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001040ea:	eb a6                	jmp    ffff800000104092 <error_code>

ffff8000001040ec <debug>:
ffff8000001040ec:	6a 00                	pushq  $0x0
ffff8000001040ee:	50                   	push   %rax
ffff8000001040ef:	48 8d 05 37 12 00 00 	lea    0x1237(%rip),%rax        # ffff80000010532d <do_debug>
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
ffff800000104138:	e8 76 12 00 00       	callq  ffff8000001053b3 <do_nmi>
ffff80000010413d:	e9 be fe ff ff       	jmpq   ffff800000104000 <RESTORE_ALL>

ffff800000104142 <breakpoint>:
ffff800000104142:	6a 00                	pushq  $0x0
ffff800000104144:	50                   	push   %rax
ffff800000104145:	48 8d 05 ed 12 00 00 	lea    0x12ed(%rip),%rax        # ffff800000105439 <do_breakpoint>
ffff80000010414c:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104150:	e9 3d ff ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104155 <overflow>:
ffff800000104155:	6a 00                	pushq  $0x0
ffff800000104157:	50                   	push   %rax
ffff800000104158:	48 8d 05 60 13 00 00 	lea    0x1360(%rip),%rax        # ffff8000001054bf <do_overflow>
ffff80000010415f:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104163:	e9 2a ff ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104168 <bounds>:
ffff800000104168:	6a 00                	pushq  $0x0
ffff80000010416a:	50                   	push   %rax
ffff80000010416b:	48 8d 05 d3 13 00 00 	lea    0x13d3(%rip),%rax        # ffff800000105545 <do_bounds>
ffff800000104172:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104176:	e9 17 ff ff ff       	jmpq   ffff800000104092 <error_code>

ffff80000010417b <undefined_opcode>:
ffff80000010417b:	6a 00                	pushq  $0x0
ffff80000010417d:	50                   	push   %rax
ffff80000010417e:	48 8d 05 46 14 00 00 	lea    0x1446(%rip),%rax        # ffff8000001055cb <do_undefined_opcode>
ffff800000104185:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104189:	e9 04 ff ff ff       	jmpq   ffff800000104092 <error_code>

ffff80000010418e <dev_not_available>:
ffff80000010418e:	6a 00                	pushq  $0x0
ffff800000104190:	50                   	push   %rax
ffff800000104191:	48 8d 05 b9 14 00 00 	lea    0x14b9(%rip),%rax        # ffff800000105651 <do_dev_not_available>
ffff800000104198:	48 87 04 24          	xchg   %rax,(%rsp)
ffff80000010419c:	e9 f1 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041a1 <double_fault>:
ffff8000001041a1:	50                   	push   %rax
ffff8000001041a2:	48 8d 05 2e 15 00 00 	lea    0x152e(%rip),%rax        # ffff8000001056d7 <do_double_fault>
ffff8000001041a9:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041ad:	e9 e0 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041b2 <coprocessor_segment_overrun>:
ffff8000001041b2:	6a 00                	pushq  $0x0
ffff8000001041b4:	50                   	push   %rax
ffff8000001041b5:	48 8d 05 a1 15 00 00 	lea    0x15a1(%rip),%rax        # ffff80000010575d <do_coprocessor_segment_overrun>
ffff8000001041bc:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041c0:	e9 cd fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041c5 <invalid_TSS>:
ffff8000001041c5:	50                   	push   %rax
ffff8000001041c6:	48 8d 05 16 16 00 00 	lea    0x1616(%rip),%rax        # ffff8000001057e3 <do_invalid_TSS>
ffff8000001041cd:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041d1:	e9 bc fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041d6 <segment_not_present>:
ffff8000001041d6:	50                   	push   %rax
ffff8000001041d7:	48 8d 05 e7 17 00 00 	lea    0x17e7(%rip),%rax        # ffff8000001059c5 <do_segment_not_present>
ffff8000001041de:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041e2:	e9 ab fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041e7 <stack_segment_fault>:
ffff8000001041e7:	50                   	push   %rax
ffff8000001041e8:	48 8d 05 b8 19 00 00 	lea    0x19b8(%rip),%rax        # ffff800000105ba7 <do_stack_segment_fault>
ffff8000001041ef:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041f3:	e9 9a fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041f8 <general_protection>:
ffff8000001041f8:	50                   	push   %rax
ffff8000001041f9:	48 8d 05 89 1b 00 00 	lea    0x1b89(%rip),%rax        # ffff800000105d89 <do_general_protection>
ffff800000104200:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104204:	e9 89 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104209 <page_fault>:
ffff800000104209:	50                   	push   %rax
ffff80000010420a:	48 8d 05 5a 1d 00 00 	lea    0x1d5a(%rip),%rax        # ffff800000105f6b <do_page_fault>
ffff800000104211:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104215:	e9 78 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff80000010421a <x87_FPU_error>:
ffff80000010421a:	6a 00                	pushq  $0x0
ffff80000010421c:	50                   	push   %rax
ffff80000010421d:	48 8d 05 9d 1f 00 00 	lea    0x1f9d(%rip),%rax        # ffff8000001061c1 <do_x87_FPU_error>
ffff800000104224:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104228:	e9 65 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff80000010422d <alignment_check>:
ffff80000010422d:	50                   	push   %rax
ffff80000010422e:	48 8d 05 12 20 00 00 	lea    0x2012(%rip),%rax        # ffff800000106247 <do_alignment_check>
ffff800000104235:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104239:	e9 54 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff80000010423e <machine_check>:
ffff80000010423e:	6a 00                	pushq  $0x0
ffff800000104240:	50                   	push   %rax
ffff800000104241:	48 8d 05 85 20 00 00 	lea    0x2085(%rip),%rax        # ffff8000001062cd <do_machine_check>
ffff800000104248:	48 87 04 24          	xchg   %rax,(%rsp)
ffff80000010424c:	e9 41 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104251 <SIMD_exception>:
ffff800000104251:	6a 00                	pushq  $0x0
ffff800000104253:	50                   	push   %rax
ffff800000104254:	48 8d 05 f8 20 00 00 	lea    0x20f8(%rip),%rax        # ffff800000106353 <do_SIMD_exception>
ffff80000010425b:	48 87 04 24          	xchg   %rax,(%rsp)
ffff80000010425f:	e9 2e fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104264 <virtualization_exception>:
ffff800000104264:	6a 00                	pushq  $0x0
ffff800000104266:	50                   	push   %rax
ffff800000104267:	48 8d 05 6b 21 00 00 	lea    0x216b(%rip),%rax        # ffff8000001063d9 <do_virtualization_exception>
ffff80000010426e:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104272:	e9 1b fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104277 <set_idt_desc>:
ffff800000104277:	55                   	push   %rbp
ffff800000104278:	48 89 e5             	mov    %rsp,%rbp
ffff80000010427b:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010427b <set_idt_desc+0x4>
ffff800000104282:	49 bb ad 86 00 00 00 	movabs $0x86ad,%r11
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
ffff800000104330:	49 bb ff 85 00 00 00 	movabs $0x85ff,%r11
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
ffff800000104361:	49 b8 4f 79 ff ff ff 	movabs $0xffffffffffff794f,%r8
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
ffff800000104383:	49 bb ac 85 00 00 00 	movabs $0x85ac,%r11
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
ffff8000001043b4:	49 b8 4f 79 ff ff ff 	movabs $0xffffffffffff794f,%r8
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
ffff8000001043d6:	49 bb 59 85 00 00 00 	movabs $0x8559,%r11
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
ffff800000104407:	49 b8 4f 79 ff ff ff 	movabs $0xffffffffffff794f,%r8
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
ffff800000104429:	49 bb 06 85 00 00 00 	movabs $0x8506,%r11
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
ffff80000010445a:	49 b8 4f 79 ff ff ff 	movabs $0xffffffffffff794f,%r8
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
ffff800000104478:	49 bb b7 84 00 00 00 	movabs $0x84b7,%r11
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
ffff80000010458e:	49 bb a1 83 00 00 00 	movabs $0x83a1,%r11
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
ffff8000001045e4:	49 bb 4b 83 00 00 00 	movabs $0x834b,%r11
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
ffff80000010461e:	49 bb 11 83 00 00 00 	movabs $0x8311,%r11
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
ffff80000010465d:	49 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r9
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
ffff80000010468d:	49 bb a2 82 00 00 00 	movabs $0x82a2,%r11
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
ffff8000001046bb:	49 b8 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r8
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
ffff8000001046df:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff8000001046df <Start_Kernel+0x7>
ffff8000001046e6:	49 bb 49 82 00 00 00 	movabs $0x8249,%r11
ffff8000001046ed:	00 00 00 
ffff8000001046f0:	4c 01 db             	add    %r11,%rbx
ffff8000001046f3:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff8000001046fa:	00 00 00 
ffff8000001046fd:	c7 04 03 a0 05 00 00 	movl   $0x5a0,(%rbx,%rax,1)
ffff800000104704:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff80000010470b:	00 00 00 
ffff80000010470e:	c7 44 03 04 84 03 00 	movl   $0x384,0x4(%rbx,%rax,1)
ffff800000104715:	00 
ffff800000104716:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff80000010471d:	00 00 00 
ffff800000104720:	c7 44 03 0c 00 00 00 	movl   $0x0,0xc(%rbx,%rax,1)
ffff800000104727:	00 
ffff800000104728:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff80000010472f:	00 00 00 
ffff800000104732:	8b 54 03 0c          	mov    0xc(%rbx,%rax,1),%edx
ffff800000104736:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff80000010473d:	00 00 00 
ffff800000104740:	89 54 03 08          	mov    %edx,0x8(%rbx,%rax,1)
ffff800000104744:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff80000010474b:	00 00 00 
ffff80000010474e:	c7 44 03 10 08 00 00 	movl   $0x8,0x10(%rbx,%rax,1)
ffff800000104755:	00 
ffff800000104756:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff80000010475d:	00 00 00 
ffff800000104760:	c7 44 03 14 10 00 00 	movl   $0x10,0x14(%rbx,%rax,1)
ffff800000104767:	00 
ffff800000104768:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff80000010476f:	00 00 00 
ffff800000104772:	48 be 00 00 00 03 00 	movabs $0xffff800003000000,%rsi
ffff800000104779:	80 ff ff 
ffff80000010477c:	48 89 74 03 18       	mov    %rsi,0x18(%rbx,%rax,1)
ffff800000104781:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000104788:	00 00 00 
ffff80000010478b:	8b 14 03             	mov    (%rbx,%rax,1),%edx
ffff80000010478e:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000104795:	00 00 00 
ffff800000104798:	8b 44 03 04          	mov    0x4(%rbx,%rax,1),%eax
ffff80000010479c:	0f af c2             	imul   %edx,%eax
ffff80000010479f:	c1 e0 02             	shl    $0x2,%eax
ffff8000001047a2:	05 ff 0f 00 00       	add    $0xfff,%eax
ffff8000001047a7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
ffff8000001047ac:	89 c2                	mov    %eax,%edx
ffff8000001047ae:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff8000001047b5:	00 00 00 
ffff8000001047b8:	89 54 03 20          	mov    %edx,0x20(%rbx,%rax,1)
ffff8000001047bc:	48 b8 79 10 00 00 00 	movabs $0x1079,%rax
ffff8000001047c3:	00 00 00 
ffff8000001047c6:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001047ca:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001047cf:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff8000001047d4:	49 89 df             	mov    %rbx,%r15
ffff8000001047d7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001047dc:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff8000001047e3:	ff ff ff 
ffff8000001047e6:	48 01 d9             	add    %rbx,%rcx
ffff8000001047e9:	ff d1                	callq  *%rcx
ffff8000001047eb:	b8 50 00 00 00       	mov    $0x50,%eax
ffff8000001047f0:	0f 00 d8             	ltr    %ax
ffff8000001047f3:	68 00 7c 00 00       	pushq  $0x7c00
ffff8000001047f8:	68 00 7c 00 00       	pushq  $0x7c00
ffff8000001047fd:	68 00 7c 00 00       	pushq  $0x7c00
ffff800000104802:	68 00 7c 00 00       	pushq  $0x7c00
ffff800000104807:	41 b9 00 7c 00 00    	mov    $0x7c00,%r9d
ffff80000010480d:	41 b8 00 7c 00 00    	mov    $0x7c00,%r8d
ffff800000104813:	b9 00 7c 00 00       	mov    $0x7c00,%ecx
ffff800000104818:	ba 00 7c 00 00       	mov    $0x7c00,%edx
ffff80000010481d:	be 00 7c 00 00       	mov    $0x7c00,%esi
ffff800000104822:	bf 00 7c 00 00       	mov    $0x7c00,%edi
ffff800000104827:	48 b8 45 7b ff ff ff 	movabs $0xffffffffffff7b45,%rax
ffff80000010482e:	ff ff ff 
ffff800000104831:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000104835:	ff d0                	callq  *%rax
ffff800000104837:	48 83 c4 20          	add    $0x20,%rsp
ffff80000010483b:	49 89 df             	mov    %rbx,%r15
ffff80000010483e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000104843:	48 ba 37 9b ff ff ff 	movabs $0xffffffffffff9b37,%rdx
ffff80000010484a:	ff ff ff 
ffff80000010484d:	48 01 da             	add    %rbx,%rdx
ffff800000104850:	ff d2                	callq  *%rdx
ffff800000104852:	49 89 df             	mov    %rbx,%r15
ffff800000104855:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010485a:	48 ba 58 d1 ff ff ff 	movabs $0xffffffffffffd158,%rdx
ffff800000104861:	ff ff ff 
ffff800000104864:	48 01 da             	add    %rbx,%rdx
ffff800000104867:	ff d2                	callq  *%rdx
ffff800000104869:	48 b8 70 ff ff ff ff 	movabs $0xffffffffffffff70,%rax
ffff800000104870:	ff ff ff 
ffff800000104873:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000104877:	48 89 c2             	mov    %rax,%rdx
ffff80000010487a:	48 b8 38 c8 01 00 00 	movabs $0x1c838,%rax
ffff800000104881:	00 00 00 
ffff800000104884:	48 89 94 03 d0 02 00 	mov    %rdx,0x2d0(%rbx,%rax,1)
ffff80000010488b:	00 
ffff80000010488c:	48 b8 08 ff ff ff ff 	movabs $0xffffffffffffff08,%rax
ffff800000104893:	ff ff ff 
ffff800000104896:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010489a:	48 89 c2             	mov    %rax,%rdx
ffff80000010489d:	48 b8 38 c8 01 00 00 	movabs $0x1c838,%rax
ffff8000001048a4:	00 00 00 
ffff8000001048a7:	48 89 94 03 d8 02 00 	mov    %rdx,0x2d8(%rbx,%rax,1)
ffff8000001048ae:	00 
ffff8000001048af:	48 b8 b0 ff ff ff ff 	movabs $0xffffffffffffffb0,%rax
ffff8000001048b6:	ff ff ff 
ffff8000001048b9:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001048bd:	48 89 c2             	mov    %rax,%rdx
ffff8000001048c0:	48 b8 38 c8 01 00 00 	movabs $0x1c838,%rax
ffff8000001048c7:	00 00 00 
ffff8000001048ca:	48 89 94 03 e0 02 00 	mov    %rdx,0x2e0(%rbx,%rax,1)
ffff8000001048d1:	00 
ffff8000001048d2:	48 b8 c0 ff ff ff ff 	movabs $0xffffffffffffffc0,%rax
ffff8000001048d9:	ff ff ff 
ffff8000001048dc:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001048e0:	48 89 c2             	mov    %rax,%rdx
ffff8000001048e3:	48 b8 38 c8 01 00 00 	movabs $0x1c838,%rax
ffff8000001048ea:	00 00 00 
ffff8000001048ed:	48 89 94 03 e8 02 00 	mov    %rdx,0x2e8(%rbx,%rax,1)
ffff8000001048f4:	00 
ffff8000001048f5:	49 89 df             	mov    %rbx,%r15
ffff8000001048f8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001048fd:	48 ba 1c a1 ff ff ff 	movabs $0xffffffffffffa11c,%rdx
ffff800000104904:	ff ff ff 
ffff800000104907:	48 01 da             	add    %rbx,%rdx
ffff80000010490a:	ff d2                	callq  *%rdx
ffff80000010490c:	49 89 df             	mov    %rbx,%r15
ffff80000010490f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000104914:	48 ba 39 be ff ff ff 	movabs $0xffffffffffffbe39,%rdx
ffff80000010491b:	ff ff ff 
ffff80000010491e:	48 01 da             	add    %rbx,%rdx
ffff800000104921:	ff d2                	callq  *%rdx
ffff800000104923:	49 89 df             	mov    %rbx,%r15
ffff800000104926:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010492b:	48 ba 48 c9 ff ff ff 	movabs $0xffffffffffffc948,%rdx
ffff800000104932:	ff ff ff 
ffff800000104935:	48 01 da             	add    %rbx,%rdx
ffff800000104938:	ff d2                	callq  *%rdx
ffff80000010493a:	eb fe                	jmp    ffff80000010493a <Start_Kernel+0x262>

ffff80000010493c <putchar>:
ffff80000010493c:	55                   	push   %rbp
ffff80000010493d:	48 89 e5             	mov    %rsp,%rbp
ffff800000104940:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000104940 <putchar+0x4>
ffff800000104947:	49 bb e8 7f 00 00 00 	movabs $0x7fe8,%r11
ffff80000010494e:	00 00 00 
ffff800000104951:	4c 01 d8             	add    %r11,%rax
ffff800000104954:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000104958:	89 75 d4             	mov    %esi,-0x2c(%rbp)
ffff80000010495b:	89 55 d0             	mov    %edx,-0x30(%rbp)
ffff80000010495e:	89 4d cc             	mov    %ecx,-0x34(%rbp)
ffff800000104961:	44 89 45 c8          	mov    %r8d,-0x38(%rbp)
ffff800000104965:	44 89 4d c4          	mov    %r9d,-0x3c(%rbp)
ffff800000104969:	8b 55 10             	mov    0x10(%rbp),%edx
ffff80000010496c:	88 55 c0             	mov    %dl,-0x40(%rbp)
ffff80000010496f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff800000104976:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff80000010497d:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
ffff800000104984:	00 
ffff800000104985:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff80000010498c:	00 
ffff80000010498d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
ffff800000104994:	0f b6 55 c0          	movzbl -0x40(%rbp),%edx
ffff800000104998:	48 63 d2             	movslq %edx,%rdx
ffff80000010499b:	48 89 d1             	mov    %rdx,%rcx
ffff80000010499e:	48 c1 e1 04          	shl    $0x4,%rcx
ffff8000001049a2:	48 ba f8 e7 ff ff ff 	movabs $0xffffffffffffe7f8,%rdx
ffff8000001049a9:	ff ff ff 
ffff8000001049ac:	48 8d 04 10          	lea    (%rax,%rdx,1),%rax
ffff8000001049b0:	48 01 c8             	add    %rcx,%rax
ffff8000001049b3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001049b7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff8000001049be:	eb 7a                	jmp    ffff800000104a3a <putchar+0xfe>
ffff8000001049c0:	8b 55 cc             	mov    -0x34(%rbp),%edx
ffff8000001049c3:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff8000001049c6:	01 d0                	add    %edx,%eax
ffff8000001049c8:	0f af 45 d4          	imul   -0x2c(%rbp),%eax
ffff8000001049cc:	48 63 d0             	movslq %eax,%rdx
ffff8000001049cf:	8b 45 d0             	mov    -0x30(%rbp),%eax
ffff8000001049d2:	48 98                	cltq   
ffff8000001049d4:	48 01 d0             	add    %rdx,%rax
ffff8000001049d7:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
ffff8000001049de:	00 
ffff8000001049df:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001049e3:	48 01 d0             	add    %rdx,%rax
ffff8000001049e6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff8000001049ea:	c7 45 e4 00 01 00 00 	movl   $0x100,-0x1c(%rbp)
ffff8000001049f1:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff8000001049f8:	eb 31                	jmp    ffff800000104a2b <putchar+0xef>
ffff8000001049fa:	d1 7d e4             	sarl   -0x1c(%rbp)
ffff8000001049fd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104a01:	0f b6 00             	movzbl (%rax),%eax
ffff800000104a04:	0f b6 c0             	movzbl %al,%eax
ffff800000104a07:	23 45 e4             	and    -0x1c(%rbp),%eax
ffff800000104a0a:	85 c0                	test   %eax,%eax
ffff800000104a0c:	74 0b                	je     ffff800000104a19 <putchar+0xdd>
ffff800000104a0e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000104a12:	8b 55 c8             	mov    -0x38(%rbp),%edx
ffff800000104a15:	89 10                	mov    %edx,(%rax)
ffff800000104a17:	eb 09                	jmp    ffff800000104a22 <putchar+0xe6>
ffff800000104a19:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000104a1d:	8b 55 c4             	mov    -0x3c(%rbp),%edx
ffff800000104a20:	89 10                	mov    %edx,(%rax)
ffff800000104a22:	48 83 45 f0 04       	addq   $0x4,-0x10(%rbp)
ffff800000104a27:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
ffff800000104a2b:	83 7d f8 07          	cmpl   $0x7,-0x8(%rbp)
ffff800000104a2f:	7e c9                	jle    ffff8000001049fa <putchar+0xbe>
ffff800000104a31:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
ffff800000104a36:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff800000104a3a:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
ffff800000104a3e:	7e 80                	jle    ffff8000001049c0 <putchar+0x84>
ffff800000104a40:	90                   	nop
ffff800000104a41:	5d                   	pop    %rbp
ffff800000104a42:	c3                   	retq   

ffff800000104a43 <dec2hex>:
ffff800000104a43:	55                   	push   %rbp
ffff800000104a44:	48 89 e5             	mov    %rsp,%rbp
ffff800000104a47:	48 81 ec 78 01 00 00 	sub    $0x178,%rsp
ffff800000104a4e:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000104a4e <dec2hex+0xb>
ffff800000104a55:	49 bb da 7e 00 00 00 	movabs $0x7eda,%r11
ffff800000104a5c:	00 00 00 
ffff800000104a5f:	4c 01 d8             	add    %r11,%rax
ffff800000104a62:	48 89 bd 18 fe ff ff 	mov    %rdi,-0x1e8(%rbp)
ffff800000104a69:	89 b5 14 fe ff ff    	mov    %esi,-0x1ec(%rbp)
ffff800000104a6f:	c6 45 b0 30          	movb   $0x30,-0x50(%rbp)
ffff800000104a73:	c6 45 b1 31          	movb   $0x31,-0x4f(%rbp)
ffff800000104a77:	c6 45 b2 32          	movb   $0x32,-0x4e(%rbp)
ffff800000104a7b:	c6 45 b3 33          	movb   $0x33,-0x4d(%rbp)
ffff800000104a7f:	c6 45 b4 34          	movb   $0x34,-0x4c(%rbp)
ffff800000104a83:	c6 45 b5 35          	movb   $0x35,-0x4b(%rbp)
ffff800000104a87:	c6 45 b6 36          	movb   $0x36,-0x4a(%rbp)
ffff800000104a8b:	c6 45 b7 37          	movb   $0x37,-0x49(%rbp)
ffff800000104a8f:	c6 45 b8 38          	movb   $0x38,-0x48(%rbp)
ffff800000104a93:	c6 45 b9 39          	movb   $0x39,-0x47(%rbp)
ffff800000104a97:	c6 45 ba 41          	movb   $0x41,-0x46(%rbp)
ffff800000104a9b:	c6 45 bb 42          	movb   $0x42,-0x45(%rbp)
ffff800000104a9f:	c6 45 bc 43          	movb   $0x43,-0x44(%rbp)
ffff800000104aa3:	c6 45 bd 44          	movb   $0x44,-0x43(%rbp)
ffff800000104aa7:	c6 45 be 45          	movb   $0x45,-0x42(%rbp)
ffff800000104aab:	c6 45 bf 46          	movb   $0x46,-0x41(%rbp)
ffff800000104aaf:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff800000104ab6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff800000104abd:	eb 40                	jmp    ffff800000104aff <dec2hex+0xbc>
ffff800000104abf:	8b 85 14 fe ff ff    	mov    -0x1ec(%rbp),%eax
ffff800000104ac5:	99                   	cltd   
ffff800000104ac6:	c1 ea 1c             	shr    $0x1c,%edx
ffff800000104ac9:	01 d0                	add    %edx,%eax
ffff800000104acb:	83 e0 0f             	and    $0xf,%eax
ffff800000104ace:	29 d0                	sub    %edx,%eax
ffff800000104ad0:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff800000104ad3:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000104ad6:	8d 50 01             	lea    0x1(%rax),%edx
ffff800000104ad9:	89 55 fc             	mov    %edx,-0x4(%rbp)
ffff800000104adc:	48 98                	cltq   
ffff800000104ade:	8b 55 f4             	mov    -0xc(%rbp),%edx
ffff800000104ae1:	89 94 85 20 fe ff ff 	mov    %edx,-0x1e0(%rbp,%rax,4)
ffff800000104ae8:	8b 85 14 fe ff ff    	mov    -0x1ec(%rbp),%eax
ffff800000104aee:	8d 50 0f             	lea    0xf(%rax),%edx
ffff800000104af1:	85 c0                	test   %eax,%eax
ffff800000104af3:	0f 48 c2             	cmovs  %edx,%eax
ffff800000104af6:	c1 f8 04             	sar    $0x4,%eax
ffff800000104af9:	89 85 14 fe ff ff    	mov    %eax,-0x1ec(%rbp)
ffff800000104aff:	83 bd 14 fe ff ff 00 	cmpl   $0x0,-0x1ec(%rbp)
ffff800000104b06:	7f b7                	jg     ffff800000104abf <dec2hex+0x7c>
ffff800000104b08:	83 6d fc 01          	subl   $0x1,-0x4(%rbp)
ffff800000104b0c:	eb 2c                	jmp    ffff800000104b3a <dec2hex+0xf7>
ffff800000104b0e:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000104b11:	48 98                	cltq   
ffff800000104b13:	8b 8c 85 20 fe ff ff 	mov    -0x1e0(%rbp,%rax,4),%ecx
ffff800000104b1a:	48 8b 85 18 fe ff ff 	mov    -0x1e8(%rbp),%rax
ffff800000104b21:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104b25:	48 89 95 18 fe ff ff 	mov    %rdx,-0x1e8(%rbp)
ffff800000104b2c:	48 63 d1             	movslq %ecx,%rdx
ffff800000104b2f:	0f b6 54 15 b0       	movzbl -0x50(%rbp,%rdx,1),%edx
ffff800000104b34:	88 10                	mov    %dl,(%rax)
ffff800000104b36:	83 6d fc 01          	subl   $0x1,-0x4(%rbp)
ffff800000104b3a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
ffff800000104b3e:	79 ce                	jns    ffff800000104b0e <dec2hex+0xcb>
ffff800000104b40:	48 8b 85 18 fe ff ff 	mov    -0x1e8(%rbp),%rax
ffff800000104b47:	c9                   	leaveq 
ffff800000104b48:	c3                   	retq   

ffff800000104b49 <vsprintf>:
ffff800000104b49:	55                   	push   %rbp
ffff800000104b4a:	48 89 e5             	mov    %rsp,%rbp
ffff800000104b4d:	53                   	push   %rbx
ffff800000104b4e:	48 83 ec 40          	sub    $0x40,%rsp
ffff800000104b52:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000104b52 <vsprintf+0x9>
ffff800000104b59:	49 bb d6 7d 00 00 00 	movabs $0x7dd6,%r11
ffff800000104b60:	00 00 00 
ffff800000104b63:	4c 01 db             	add    %r11,%rbx
ffff800000104b66:	48 89 7d c0          	mov    %rdi,-0x40(%rbp)
ffff800000104b6a:	48 89 75 b8          	mov    %rsi,-0x48(%rbp)
ffff800000104b6e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
ffff800000104b75:	48 b8 58 37 01 00 00 	movabs $0x13758,%rax
ffff800000104b7c:	00 00 00 
ffff800000104b7f:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000104b83:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000104b87:	e9 56 03 00 00       	jmpq   ffff800000104ee2 <vsprintf+0x399>
ffff800000104b8c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104b90:	0f b6 00             	movzbl (%rax),%eax
ffff800000104b93:	3c 25                	cmp    $0x25,%al
ffff800000104b95:	74 17                	je     ffff800000104bae <vsprintf+0x65>
ffff800000104b97:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104b9b:	0f b6 10             	movzbl (%rax),%edx
ffff800000104b9e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104ba2:	88 10                	mov    %dl,(%rax)
ffff800000104ba4:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
ffff800000104ba9:	e9 2f 03 00 00       	jmpq   ffff800000104edd <vsprintf+0x394>
ffff800000104bae:	48 83 45 c0 01       	addq   $0x1,-0x40(%rbp)
ffff800000104bb3:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104bb7:	0f b6 00             	movzbl (%rax),%eax
ffff800000104bba:	3c 64                	cmp    $0x64,%al
ffff800000104bbc:	0f 85 45 01 00 00    	jne    ffff800000104d07 <vsprintf+0x1be>
ffff800000104bc2:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104bc6:	8b 00                	mov    (%rax),%eax
ffff800000104bc8:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104bcb:	77 24                	ja     ffff800000104bf1 <vsprintf+0xa8>
ffff800000104bcd:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104bd1:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104bd5:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104bd9:	8b 00                	mov    (%rax),%eax
ffff800000104bdb:	89 c0                	mov    %eax,%eax
ffff800000104bdd:	48 01 d0             	add    %rdx,%rax
ffff800000104be0:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104be4:	8b 12                	mov    (%rdx),%edx
ffff800000104be6:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104be9:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104bed:	89 0a                	mov    %ecx,(%rdx)
ffff800000104bef:	eb 14                	jmp    ffff800000104c05 <vsprintf+0xbc>
ffff800000104bf1:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104bf5:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104bf9:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104bfd:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104c01:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104c05:	8b 00                	mov    (%rax),%eax
ffff800000104c07:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff800000104c0a:	8b 4d f4             	mov    -0xc(%rbp),%ecx
ffff800000104c0d:	ba 67 66 66 66       	mov    $0x66666667,%edx
ffff800000104c12:	89 c8                	mov    %ecx,%eax
ffff800000104c14:	f7 ea                	imul   %edx
ffff800000104c16:	c1 fa 02             	sar    $0x2,%edx
ffff800000104c19:	89 c8                	mov    %ecx,%eax
ffff800000104c1b:	c1 f8 1f             	sar    $0x1f,%eax
ffff800000104c1e:	29 c2                	sub    %eax,%edx
ffff800000104c20:	89 d0                	mov    %edx,%eax
ffff800000104c22:	c1 e0 02             	shl    $0x2,%eax
ffff800000104c25:	01 d0                	add    %edx,%eax
ffff800000104c27:	01 c0                	add    %eax,%eax
ffff800000104c29:	29 c1                	sub    %eax,%ecx
ffff800000104c2b:	89 ca                	mov    %ecx,%edx
ffff800000104c2d:	89 d0                	mov    %edx,%eax
ffff800000104c2f:	8d 48 30             	lea    0x30(%rax),%ecx
ffff800000104c32:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104c36:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104c3a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104c3e:	89 ca                	mov    %ecx,%edx
ffff800000104c40:	88 10                	mov    %dl,(%rax)
ffff800000104c42:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
ffff800000104c46:	8b 4d f4             	mov    -0xc(%rbp),%ecx
ffff800000104c49:	ba 67 66 66 66       	mov    $0x66666667,%edx
ffff800000104c4e:	89 c8                	mov    %ecx,%eax
ffff800000104c50:	f7 ea                	imul   %edx
ffff800000104c52:	c1 fa 02             	sar    $0x2,%edx
ffff800000104c55:	89 c8                	mov    %ecx,%eax
ffff800000104c57:	c1 f8 1f             	sar    $0x1f,%eax
ffff800000104c5a:	29 c2                	sub    %eax,%edx
ffff800000104c5c:	89 d0                	mov    %edx,%eax
ffff800000104c5e:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff800000104c61:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
ffff800000104c65:	75 a3                	jne    ffff800000104c0a <vsprintf+0xc1>
ffff800000104c67:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104c6b:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff800000104c6f:	eb 6c                	jmp    ffff800000104cdd <vsprintf+0x194>
ffff800000104c71:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000104c75:	0f b6 00             	movzbl (%rax),%eax
ffff800000104c78:	88 45 cf             	mov    %al,-0x31(%rbp)
ffff800000104c7b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000104c7f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000104c83:	48 29 c2             	sub    %rax,%rdx
ffff800000104c86:	48 89 d0             	mov    %rdx,%rax
ffff800000104c89:	48 89 c2             	mov    %rax,%rdx
ffff800000104c8c:	8b 45 f0             	mov    -0x10(%rbp),%eax
ffff800000104c8f:	48 98                	cltq   
ffff800000104c91:	48 29 c2             	sub    %rax,%rdx
ffff800000104c94:	48 89 d0             	mov    %rdx,%rax
ffff800000104c97:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff800000104c9b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104c9f:	48 01 d0             	add    %rdx,%rax
ffff800000104ca2:	0f b6 10             	movzbl (%rax),%edx
ffff800000104ca5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000104ca9:	88 10                	mov    %dl,(%rax)
ffff800000104cab:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000104caf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000104cb3:	48 29 c2             	sub    %rax,%rdx
ffff800000104cb6:	48 89 d0             	mov    %rdx,%rax
ffff800000104cb9:	48 89 c2             	mov    %rax,%rdx
ffff800000104cbc:	8b 45 f0             	mov    -0x10(%rbp),%eax
ffff800000104cbf:	48 98                	cltq   
ffff800000104cc1:	48 29 c2             	sub    %rax,%rdx
ffff800000104cc4:	48 89 d0             	mov    %rdx,%rax
ffff800000104cc7:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff800000104ccb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104ccf:	48 01 c2             	add    %rax,%rdx
ffff800000104cd2:	0f b6 45 cf          	movzbl -0x31(%rbp),%eax
ffff800000104cd6:	88 02                	mov    %al,(%rdx)
ffff800000104cd8:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
ffff800000104cdd:	8b 45 f0             	mov    -0x10(%rbp),%eax
ffff800000104ce0:	89 c2                	mov    %eax,%edx
ffff800000104ce2:	c1 ea 1f             	shr    $0x1f,%edx
ffff800000104ce5:	01 d0                	add    %edx,%eax
ffff800000104ce7:	d1 f8                	sar    %eax
ffff800000104ce9:	48 98                	cltq   
ffff800000104ceb:	48 f7 d8             	neg    %rax
ffff800000104cee:	48 89 c2             	mov    %rax,%rdx
ffff800000104cf1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104cf5:	48 01 d0             	add    %rdx,%rax
ffff800000104cf8:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
ffff800000104cfc:	0f 83 6f ff ff ff    	jae    ffff800000104c71 <vsprintf+0x128>
ffff800000104d02:	e9 d6 01 00 00       	jmpq   ffff800000104edd <vsprintf+0x394>
ffff800000104d07:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104d0b:	0f b6 00             	movzbl (%rax),%eax
ffff800000104d0e:	3c 63                	cmp    $0x63,%al
ffff800000104d10:	75 5a                	jne    ffff800000104d6c <vsprintf+0x223>
ffff800000104d12:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104d16:	8b 00                	mov    (%rax),%eax
ffff800000104d18:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104d1b:	77 24                	ja     ffff800000104d41 <vsprintf+0x1f8>
ffff800000104d1d:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104d21:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104d25:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104d29:	8b 00                	mov    (%rax),%eax
ffff800000104d2b:	89 c0                	mov    %eax,%eax
ffff800000104d2d:	48 01 d0             	add    %rdx,%rax
ffff800000104d30:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104d34:	8b 12                	mov    (%rdx),%edx
ffff800000104d36:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104d39:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104d3d:	89 0a                	mov    %ecx,(%rdx)
ffff800000104d3f:	eb 14                	jmp    ffff800000104d55 <vsprintf+0x20c>
ffff800000104d41:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104d45:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104d49:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104d4d:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104d51:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104d55:	8b 08                	mov    (%rax),%ecx
ffff800000104d57:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104d5b:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104d5f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104d63:	89 ca                	mov    %ecx,%edx
ffff800000104d65:	88 10                	mov    %dl,(%rax)
ffff800000104d67:	e9 71 01 00 00       	jmpq   ffff800000104edd <vsprintf+0x394>
ffff800000104d6c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104d70:	0f b6 00             	movzbl (%rax),%eax
ffff800000104d73:	3c 73                	cmp    $0x73,%al
ffff800000104d75:	0f 85 8f 00 00 00    	jne    ffff800000104e0a <vsprintf+0x2c1>
ffff800000104d7b:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104d7f:	8b 00                	mov    (%rax),%eax
ffff800000104d81:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104d84:	77 24                	ja     ffff800000104daa <vsprintf+0x261>
ffff800000104d86:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104d8a:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104d8e:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104d92:	8b 00                	mov    (%rax),%eax
ffff800000104d94:	89 c0                	mov    %eax,%eax
ffff800000104d96:	48 01 d0             	add    %rdx,%rax
ffff800000104d99:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104d9d:	8b 12                	mov    (%rdx),%edx
ffff800000104d9f:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104da2:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104da6:	89 0a                	mov    %ecx,(%rdx)
ffff800000104da8:	eb 14                	jmp    ffff800000104dbe <vsprintf+0x275>
ffff800000104daa:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104dae:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104db2:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104db6:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104dba:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104dbe:	48 8b 00             	mov    (%rax),%rax
ffff800000104dc1:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff800000104dc5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000104dc9:	0f b6 00             	movzbl (%rax),%eax
ffff800000104dcc:	84 c0                	test   %al,%al
ffff800000104dce:	0f 84 08 01 00 00    	je     ffff800000104edc <vsprintf+0x393>
ffff800000104dd4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000104dd8:	0f b6 10             	movzbl (%rax),%edx
ffff800000104ddb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104ddf:	88 10                	mov    %dl,(%rax)
ffff800000104de1:	eb 17                	jmp    ffff800000104dfa <vsprintf+0x2b1>
ffff800000104de3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000104de7:	0f b6 10             	movzbl (%rax),%edx
ffff800000104dea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104dee:	88 10                	mov    %dl,(%rax)
ffff800000104df0:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
ffff800000104df5:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
ffff800000104dfa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000104dfe:	0f b6 00             	movzbl (%rax),%eax
ffff800000104e01:	84 c0                	test   %al,%al
ffff800000104e03:	75 de                	jne    ffff800000104de3 <vsprintf+0x29a>
ffff800000104e05:	e9 d3 00 00 00       	jmpq   ffff800000104edd <vsprintf+0x394>
ffff800000104e0a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104e0e:	0f b6 00             	movzbl (%rax),%eax
ffff800000104e11:	3c 78                	cmp    $0x78,%al
ffff800000104e13:	0f 85 c4 00 00 00    	jne    ffff800000104edd <vsprintf+0x394>
ffff800000104e19:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104e1d:	8b 00                	mov    (%rax),%eax
ffff800000104e1f:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104e22:	77 24                	ja     ffff800000104e48 <vsprintf+0x2ff>
ffff800000104e24:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104e28:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104e2c:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104e30:	8b 00                	mov    (%rax),%eax
ffff800000104e32:	89 c0                	mov    %eax,%eax
ffff800000104e34:	48 01 d0             	add    %rdx,%rax
ffff800000104e37:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104e3b:	8b 12                	mov    (%rdx),%edx
ffff800000104e3d:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104e40:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104e44:	89 0a                	mov    %ecx,(%rdx)
ffff800000104e46:	eb 14                	jmp    ffff800000104e5c <vsprintf+0x313>
ffff800000104e48:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104e4c:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104e50:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104e54:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104e58:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104e5c:	48 8b 00             	mov    (%rax),%rax
ffff800000104e5f:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff800000104e63:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
ffff800000104e68:	75 2f                	jne    ffff800000104e99 <vsprintf+0x350>
ffff800000104e6a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104e6e:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104e72:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104e76:	c6 00 30             	movb   $0x30,(%rax)
ffff800000104e79:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104e7d:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104e81:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104e85:	c6 00 78             	movb   $0x78,(%rax)
ffff800000104e88:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104e8c:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104e90:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104e94:	c6 00 30             	movb   $0x30,(%rax)
ffff800000104e97:	eb 44                	jmp    ffff800000104edd <vsprintf+0x394>
ffff800000104e99:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104e9d:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104ea1:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104ea5:	c6 00 30             	movb   $0x30,(%rax)
ffff800000104ea8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104eac:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104eb0:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104eb4:	c6 00 78             	movb   $0x78,(%rax)
ffff800000104eb7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000104ebb:	89 c2                	mov    %eax,%edx
ffff800000104ebd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104ec1:	89 d6                	mov    %edx,%esi
ffff800000104ec3:	48 89 c7             	mov    %rax,%rdi
ffff800000104ec6:	48 b8 1b 81 ff ff ff 	movabs $0xffffffffffff811b,%rax
ffff800000104ecd:	ff ff ff 
ffff800000104ed0:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000104ed4:	ff d0                	callq  *%rax
ffff800000104ed6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000104eda:	eb 01                	jmp    ffff800000104edd <vsprintf+0x394>
ffff800000104edc:	90                   	nop
ffff800000104edd:	48 83 45 c0 01       	addq   $0x1,-0x40(%rbp)
ffff800000104ee2:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104ee6:	0f b6 00             	movzbl (%rax),%eax
ffff800000104ee9:	84 c0                	test   %al,%al
ffff800000104eeb:	0f 85 9b fc ff ff    	jne    ffff800000104b8c <vsprintf+0x43>
ffff800000104ef1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000104ef5:	48 b8 58 37 01 00 00 	movabs $0x13758,%rax
ffff800000104efc:	00 00 00 
ffff800000104eff:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000104f03:	48 29 c2             	sub    %rax,%rdx
ffff800000104f06:	48 89 d0             	mov    %rdx,%rax
ffff800000104f09:	48 83 c4 40          	add    $0x40,%rsp
ffff800000104f0d:	5b                   	pop    %rbx
ffff800000104f0e:	5d                   	pop    %rbp
ffff800000104f0f:	c3                   	retq   

ffff800000104f10 <printk>:
ffff800000104f10:	55                   	push   %rbp
ffff800000104f11:	48 89 e5             	mov    %rsp,%rbp
ffff800000104f14:	53                   	push   %rbx
ffff800000104f15:	48 81 ec e8 00 00 00 	sub    $0xe8,%rsp
ffff800000104f1c:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000104f1c <printk+0xc>
ffff800000104f23:	49 bb 0c 7a 00 00 00 	movabs $0x7a0c,%r11
ffff800000104f2a:	00 00 00 
ffff800000104f2d:	4c 01 db             	add    %r11,%rbx
ffff800000104f30:	89 bd 1c ff ff ff    	mov    %edi,-0xe4(%rbp)
ffff800000104f36:	89 b5 18 ff ff ff    	mov    %esi,-0xe8(%rbp)
ffff800000104f3c:	48 89 95 10 ff ff ff 	mov    %rdx,-0xf0(%rbp)
ffff800000104f43:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
ffff800000104f4a:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
ffff800000104f51:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
ffff800000104f58:	84 c0                	test   %al,%al
ffff800000104f5a:	74 23                	je     ffff800000104f7f <printk+0x6f>
ffff800000104f5c:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
ffff800000104f63:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
ffff800000104f67:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
ffff800000104f6b:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
ffff800000104f6f:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
ffff800000104f73:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
ffff800000104f77:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
ffff800000104f7b:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
ffff800000104f7f:	c7 85 20 ff ff ff 18 	movl   $0x18,-0xe0(%rbp)
ffff800000104f86:	00 00 00 
ffff800000104f89:	c7 85 24 ff ff ff 30 	movl   $0x30,-0xdc(%rbp)
ffff800000104f90:	00 00 00 
ffff800000104f93:	48 8d 45 10          	lea    0x10(%rbp),%rax
ffff800000104f97:	48 89 85 28 ff ff ff 	mov    %rax,-0xd8(%rbp)
ffff800000104f9e:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
ffff800000104fa5:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
ffff800000104fac:	48 8d 95 20 ff ff ff 	lea    -0xe0(%rbp),%rdx
ffff800000104fb3:	48 8b 85 10 ff ff ff 	mov    -0xf0(%rbp),%rax
ffff800000104fba:	48 89 d6             	mov    %rdx,%rsi
ffff800000104fbd:	48 89 c7             	mov    %rax,%rdi
ffff800000104fc0:	48 b8 21 82 ff ff ff 	movabs $0xffffffffffff8221,%rax
ffff800000104fc7:	ff ff ff 
ffff800000104fca:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000104fce:	ff d0                	callq  *%rax
ffff800000104fd0:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%rbp)
ffff800000104fd6:	c7 85 3c ff ff ff 00 	movl   $0x0,-0xc4(%rbp)
ffff800000104fdd:	00 00 00 
ffff800000104fe0:	e9 ac 02 00 00       	jmpq   ffff800000105291 <printk+0x381>
ffff800000104fe5:	8b 85 3c ff ff ff    	mov    -0xc4(%rbp),%eax
ffff800000104feb:	48 63 d0             	movslq %eax,%rdx
ffff800000104fee:	48 b8 58 37 01 00 00 	movabs $0x13758,%rax
ffff800000104ff5:	00 00 00 
ffff800000104ff8:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000104ffc:	48 01 d0             	add    %rdx,%rax
ffff800000104fff:	0f b6 00             	movzbl (%rax),%eax
ffff800000105002:	3c 0a                	cmp    $0xa,%al
ffff800000105004:	75 36                	jne    ffff80000010503c <printk+0x12c>
ffff800000105006:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff80000010500d:	00 00 00 
ffff800000105010:	8b 44 03 0c          	mov    0xc(%rbx,%rax,1),%eax
ffff800000105014:	8d 50 01             	lea    0x1(%rax),%edx
ffff800000105017:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff80000010501e:	00 00 00 
ffff800000105021:	89 54 03 0c          	mov    %edx,0xc(%rbx,%rax,1)
ffff800000105025:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff80000010502c:	00 00 00 
ffff80000010502f:	c7 44 03 08 00 00 00 	movl   $0x0,0x8(%rbx,%rax,1)
ffff800000105036:	00 
ffff800000105037:	e9 4e 02 00 00       	jmpq   ffff80000010528a <printk+0x37a>
ffff80000010503c:	8b 85 3c ff ff ff    	mov    -0xc4(%rbp),%eax
ffff800000105042:	48 63 d0             	movslq %eax,%rdx
ffff800000105045:	48 b8 58 37 01 00 00 	movabs $0x13758,%rax
ffff80000010504c:	00 00 00 
ffff80000010504f:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000105053:	48 01 d0             	add    %rdx,%rax
ffff800000105056:	0f b6 00             	movzbl (%rax),%eax
ffff800000105059:	3c 08                	cmp    $0x8,%al
ffff80000010505b:	0f 85 68 01 00 00    	jne    ffff8000001051c9 <printk+0x2b9>
ffff800000105061:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105068:	00 00 00 
ffff80000010506b:	8b 44 03 08          	mov    0x8(%rbx,%rax,1),%eax
ffff80000010506f:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff800000105072:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105079:	00 00 00 
ffff80000010507c:	89 54 03 08          	mov    %edx,0x8(%rbx,%rax,1)
ffff800000105080:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105087:	00 00 00 
ffff80000010508a:	8b 44 03 08          	mov    0x8(%rbx,%rax,1),%eax
ffff80000010508e:	85 c0                	test   %eax,%eax
ffff800000105090:	0f 89 b2 00 00 00    	jns    ffff800000105148 <printk+0x238>
ffff800000105096:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff80000010509d:	00 00 00 
ffff8000001050a0:	8b 04 03             	mov    (%rbx,%rax,1),%eax
ffff8000001050a3:	48 ba f8 47 01 00 00 	movabs $0x147f8,%rdx
ffff8000001050aa:	00 00 00 
ffff8000001050ad:	8b 7c 13 10          	mov    0x10(%rbx,%rdx,1),%edi
ffff8000001050b1:	99                   	cltd   
ffff8000001050b2:	f7 ff                	idiv   %edi
ffff8000001050b4:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff8000001050b7:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff8000001050be:	00 00 00 
ffff8000001050c1:	8b 44 03 10          	mov    0x10(%rbx,%rax,1),%eax
ffff8000001050c5:	0f af d0             	imul   %eax,%edx
ffff8000001050c8:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff8000001050cf:	00 00 00 
ffff8000001050d2:	89 54 03 08          	mov    %edx,0x8(%rbx,%rax,1)
ffff8000001050d6:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff8000001050dd:	00 00 00 
ffff8000001050e0:	8b 44 03 0c          	mov    0xc(%rbx,%rax,1),%eax
ffff8000001050e4:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff8000001050e7:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff8000001050ee:	00 00 00 
ffff8000001050f1:	89 54 03 0c          	mov    %edx,0xc(%rbx,%rax,1)
ffff8000001050f5:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff8000001050fc:	00 00 00 
ffff8000001050ff:	8b 44 03 0c          	mov    0xc(%rbx,%rax,1),%eax
ffff800000105103:	85 c0                	test   %eax,%eax
ffff800000105105:	79 41                	jns    ffff800000105148 <printk+0x238>
ffff800000105107:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff80000010510e:	00 00 00 
ffff800000105111:	8b 44 03 04          	mov    0x4(%rbx,%rax,1),%eax
ffff800000105115:	48 ba f8 47 01 00 00 	movabs $0x147f8,%rdx
ffff80000010511c:	00 00 00 
ffff80000010511f:	8b 74 13 14          	mov    0x14(%rbx,%rdx,1),%esi
ffff800000105123:	99                   	cltd   
ffff800000105124:	f7 fe                	idiv   %esi
ffff800000105126:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff800000105129:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105130:	00 00 00 
ffff800000105133:	8b 44 03 14          	mov    0x14(%rbx,%rax,1),%eax
ffff800000105137:	0f af d0             	imul   %eax,%edx
ffff80000010513a:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105141:	00 00 00 
ffff800000105144:	89 54 03 0c          	mov    %edx,0xc(%rbx,%rax,1)
ffff800000105148:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff80000010514f:	00 00 00 
ffff800000105152:	8b 54 03 0c          	mov    0xc(%rbx,%rax,1),%edx
ffff800000105156:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff80000010515d:	00 00 00 
ffff800000105160:	8b 44 03 14          	mov    0x14(%rbx,%rax,1),%eax
ffff800000105164:	89 d1                	mov    %edx,%ecx
ffff800000105166:	0f af c8             	imul   %eax,%ecx
ffff800000105169:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105170:	00 00 00 
ffff800000105173:	8b 54 03 08          	mov    0x8(%rbx,%rax,1),%edx
ffff800000105177:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff80000010517e:	00 00 00 
ffff800000105181:	8b 44 03 10          	mov    0x10(%rbx,%rax,1),%eax
ffff800000105185:	0f af d0             	imul   %eax,%edx
ffff800000105188:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff80000010518f:	00 00 00 
ffff800000105192:	8b 34 03             	mov    (%rbx,%rax,1),%esi
ffff800000105195:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff80000010519c:	00 00 00 
ffff80000010519f:	48 8b 44 03 18       	mov    0x18(%rbx,%rax,1),%rax
ffff8000001051a4:	6a 20                	pushq  $0x20
ffff8000001051a6:	41 b9 ff ff ff 00    	mov    $0xffffff,%r9d
ffff8000001051ac:	41 b8 00 00 00 00    	mov    $0x0,%r8d
ffff8000001051b2:	48 89 c7             	mov    %rax,%rdi
ffff8000001051b5:	48 b8 14 80 ff ff ff 	movabs $0xffffffffffff8014,%rax
ffff8000001051bc:	ff ff ff 
ffff8000001051bf:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001051c3:	ff d0                	callq  *%rax
ffff8000001051c5:	48 83 c4 08          	add    $0x8,%rsp
ffff8000001051c9:	8b 85 3c ff ff ff    	mov    -0xc4(%rbp),%eax
ffff8000001051cf:	48 63 d0             	movslq %eax,%rdx
ffff8000001051d2:	48 b8 58 37 01 00 00 	movabs $0x13758,%rax
ffff8000001051d9:	00 00 00 
ffff8000001051dc:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001051e0:	48 01 d0             	add    %rdx,%rax
ffff8000001051e3:	0f b6 00             	movzbl (%rax),%eax
ffff8000001051e6:	0f b6 f8             	movzbl %al,%edi
ffff8000001051e9:	44 8b 8d 18 ff ff ff 	mov    -0xe8(%rbp),%r9d
ffff8000001051f0:	44 8b 85 1c ff ff ff 	mov    -0xe4(%rbp),%r8d
ffff8000001051f7:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff8000001051fe:	00 00 00 
ffff800000105201:	8b 54 03 0c          	mov    0xc(%rbx,%rax,1),%edx
ffff800000105205:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff80000010520c:	00 00 00 
ffff80000010520f:	8b 44 03 14          	mov    0x14(%rbx,%rax,1),%eax
ffff800000105213:	89 d1                	mov    %edx,%ecx
ffff800000105215:	0f af c8             	imul   %eax,%ecx
ffff800000105218:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff80000010521f:	00 00 00 
ffff800000105222:	8b 54 03 08          	mov    0x8(%rbx,%rax,1),%edx
ffff800000105226:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff80000010522d:	00 00 00 
ffff800000105230:	8b 44 03 10          	mov    0x10(%rbx,%rax,1),%eax
ffff800000105234:	0f af d0             	imul   %eax,%edx
ffff800000105237:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff80000010523e:	00 00 00 
ffff800000105241:	8b 34 03             	mov    (%rbx,%rax,1),%esi
ffff800000105244:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff80000010524b:	00 00 00 
ffff80000010524e:	48 8b 44 03 18       	mov    0x18(%rbx,%rax,1),%rax
ffff800000105253:	57                   	push   %rdi
ffff800000105254:	48 89 c7             	mov    %rax,%rdi
ffff800000105257:	48 b8 14 80 ff ff ff 	movabs $0xffffffffffff8014,%rax
ffff80000010525e:	ff ff ff 
ffff800000105261:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000105265:	ff d0                	callq  *%rax
ffff800000105267:	48 83 c4 08          	add    $0x8,%rsp
ffff80000010526b:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105272:	00 00 00 
ffff800000105275:	8b 44 03 08          	mov    0x8(%rbx,%rax,1),%eax
ffff800000105279:	8d 50 01             	lea    0x1(%rax),%edx
ffff80000010527c:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105283:	00 00 00 
ffff800000105286:	89 54 03 08          	mov    %edx,0x8(%rbx,%rax,1)
ffff80000010528a:	83 85 3c ff ff ff 01 	addl   $0x1,-0xc4(%rbp)
ffff800000105291:	8b 85 3c ff ff ff    	mov    -0xc4(%rbp),%eax
ffff800000105297:	3b 85 38 ff ff ff    	cmp    -0xc8(%rbp),%eax
ffff80000010529d:	0f 8c 42 fd ff ff    	jl     ffff800000104fe5 <printk+0xd5>
ffff8000001052a3:	90                   	nop
ffff8000001052a4:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
ffff8000001052a8:	c9                   	leaveq 
ffff8000001052a9:	c3                   	retq   

ffff8000001052aa <do_divide_error>:
ffff8000001052aa:	55                   	push   %rbp
ffff8000001052ab:	48 89 e5             	mov    %rsp,%rbp
ffff8000001052ae:	41 57                	push   %r15
ffff8000001052b0:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001052b4:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001052b4 <do_divide_error+0xa>
ffff8000001052bb:	49 bb 74 76 00 00 00 	movabs $0x7674,%r11
ffff8000001052c2:	00 00 00 
ffff8000001052c5:	4d 01 da             	add    %r11,%r10
ffff8000001052c8:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001052cc:	89 75 d4             	mov    %esi,-0x2c(%rbp)
ffff8000001052cf:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001052d6:	00 
ffff8000001052d7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001052db:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001052e1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001052e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001052e9:	48 8b 08             	mov    (%rax),%rcx
ffff8000001052ec:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001052f0:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff8000001052f3:	49 89 c9             	mov    %rcx,%r9
ffff8000001052f6:	49 89 d0             	mov    %rdx,%r8
ffff8000001052f9:	89 c1                	mov    %eax,%ecx
ffff8000001052fb:	48 b8 80 10 00 00 00 	movabs $0x1080,%rax
ffff800000105302:	00 00 00 
ffff800000105305:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000105309:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010530e:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105313:	4d 89 d7             	mov    %r10,%r15
ffff800000105316:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010531b:	49 bb e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r11
ffff800000105322:	ff ff ff 
ffff800000105325:	4d 01 d3             	add    %r10,%r11
ffff800000105328:	41 ff d3             	callq  *%r11
ffff80000010532b:	eb fe                	jmp    ffff80000010532b <do_divide_error+0x81>

ffff80000010532d <do_debug>:
ffff80000010532d:	55                   	push   %rbp
ffff80000010532e:	48 89 e5             	mov    %rsp,%rbp
ffff800000105331:	41 57                	push   %r15
ffff800000105333:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000105337:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff800000105337 <do_debug+0xa>
ffff80000010533e:	49 bb f1 75 00 00 00 	movabs $0x75f1,%r11
ffff800000105345:	00 00 00 
ffff800000105348:	4d 01 da             	add    %r11,%r10
ffff80000010534b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff80000010534f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105353:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff80000010535a:	00 
ffff80000010535b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010535f:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105365:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105369:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010536d:	48 8b 08             	mov    (%rax),%rcx
ffff800000105370:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105374:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105378:	49 89 c9             	mov    %rcx,%r9
ffff80000010537b:	49 89 d0             	mov    %rdx,%r8
ffff80000010537e:	48 89 c1             	mov    %rax,%rcx
ffff800000105381:	48 b8 b0 10 00 00 00 	movabs $0x10b0,%rax
ffff800000105388:	00 00 00 
ffff80000010538b:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff80000010538f:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105394:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105399:	4d 89 d7             	mov    %r10,%r15
ffff80000010539c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001053a1:	49 bb e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r11
ffff8000001053a8:	ff ff ff 
ffff8000001053ab:	4d 01 d3             	add    %r10,%r11
ffff8000001053ae:	41 ff d3             	callq  *%r11
ffff8000001053b1:	eb fe                	jmp    ffff8000001053b1 <do_debug+0x84>

ffff8000001053b3 <do_nmi>:
ffff8000001053b3:	55                   	push   %rbp
ffff8000001053b4:	48 89 e5             	mov    %rsp,%rbp
ffff8000001053b7:	41 57                	push   %r15
ffff8000001053b9:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001053bd:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001053bd <do_nmi+0xa>
ffff8000001053c4:	49 bb 6b 75 00 00 00 	movabs $0x756b,%r11
ffff8000001053cb:	00 00 00 
ffff8000001053ce:	4d 01 da             	add    %r11,%r10
ffff8000001053d1:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001053d5:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001053d9:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001053e0:	00 
ffff8000001053e1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001053e5:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001053eb:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001053ef:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001053f3:	48 8b 08             	mov    (%rax),%rcx
ffff8000001053f6:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001053fa:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001053fe:	49 89 c9             	mov    %rcx,%r9
ffff800000105401:	49 89 d0             	mov    %rdx,%r8
ffff800000105404:	48 89 c1             	mov    %rax,%rcx
ffff800000105407:	48 b8 d8 10 00 00 00 	movabs $0x10d8,%rax
ffff80000010540e:	00 00 00 
ffff800000105411:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000105415:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010541a:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010541f:	4d 89 d7             	mov    %r10,%r15
ffff800000105422:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105427:	49 bb e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r11
ffff80000010542e:	ff ff ff 
ffff800000105431:	4d 01 d3             	add    %r10,%r11
ffff800000105434:	41 ff d3             	callq  *%r11
ffff800000105437:	eb fe                	jmp    ffff800000105437 <do_nmi+0x84>

ffff800000105439 <do_breakpoint>:
ffff800000105439:	55                   	push   %rbp
ffff80000010543a:	48 89 e5             	mov    %rsp,%rbp
ffff80000010543d:	41 57                	push   %r15
ffff80000010543f:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000105443:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff800000105443 <do_breakpoint+0xa>
ffff80000010544a:	49 bb e5 74 00 00 00 	movabs $0x74e5,%r11
ffff800000105451:	00 00 00 
ffff800000105454:	4d 01 da             	add    %r11,%r10
ffff800000105457:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff80000010545b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff80000010545f:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105466:	00 
ffff800000105467:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010546b:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105471:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105475:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105479:	48 8b 08             	mov    (%rax),%rcx
ffff80000010547c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105480:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105484:	49 89 c9             	mov    %rcx,%r9
ffff800000105487:	49 89 d0             	mov    %rdx,%r8
ffff80000010548a:	48 89 c1             	mov    %rax,%rcx
ffff80000010548d:	48 b8 08 11 00 00 00 	movabs $0x1108,%rax
ffff800000105494:	00 00 00 
ffff800000105497:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff80000010549b:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001054a0:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001054a5:	4d 89 d7             	mov    %r10,%r15
ffff8000001054a8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001054ad:	49 bb e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r11
ffff8000001054b4:	ff ff ff 
ffff8000001054b7:	4d 01 d3             	add    %r10,%r11
ffff8000001054ba:	41 ff d3             	callq  *%r11
ffff8000001054bd:	eb fe                	jmp    ffff8000001054bd <do_breakpoint+0x84>

ffff8000001054bf <do_overflow>:
ffff8000001054bf:	55                   	push   %rbp
ffff8000001054c0:	48 89 e5             	mov    %rsp,%rbp
ffff8000001054c3:	41 57                	push   %r15
ffff8000001054c5:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001054c9:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001054c9 <do_overflow+0xa>
ffff8000001054d0:	49 bb 5f 74 00 00 00 	movabs $0x745f,%r11
ffff8000001054d7:	00 00 00 
ffff8000001054da:	4d 01 da             	add    %r11,%r10
ffff8000001054dd:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001054e1:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001054e5:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001054ec:	00 
ffff8000001054ed:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001054f1:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001054f7:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001054fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001054ff:	48 8b 08             	mov    (%rax),%rcx
ffff800000105502:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105506:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010550a:	49 89 c9             	mov    %rcx,%r9
ffff80000010550d:	49 89 d0             	mov    %rdx,%r8
ffff800000105510:	48 89 c1             	mov    %rax,%rcx
ffff800000105513:	48 b8 38 11 00 00 00 	movabs $0x1138,%rax
ffff80000010551a:	00 00 00 
ffff80000010551d:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000105521:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105526:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010552b:	4d 89 d7             	mov    %r10,%r15
ffff80000010552e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105533:	49 bb e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r11
ffff80000010553a:	ff ff ff 
ffff80000010553d:	4d 01 d3             	add    %r10,%r11
ffff800000105540:	41 ff d3             	callq  *%r11
ffff800000105543:	eb fe                	jmp    ffff800000105543 <do_overflow+0x84>

ffff800000105545 <do_bounds>:
ffff800000105545:	55                   	push   %rbp
ffff800000105546:	48 89 e5             	mov    %rsp,%rbp
ffff800000105549:	41 57                	push   %r15
ffff80000010554b:	48 83 ec 28          	sub    $0x28,%rsp
ffff80000010554f:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff80000010554f <do_bounds+0xa>
ffff800000105556:	49 bb d9 73 00 00 00 	movabs $0x73d9,%r11
ffff80000010555d:	00 00 00 
ffff800000105560:	4d 01 da             	add    %r11,%r10
ffff800000105563:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105567:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff80000010556b:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105572:	00 
ffff800000105573:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105577:	48 05 98 00 00 00    	add    $0x98,%rax
ffff80000010557d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105581:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105585:	48 8b 08             	mov    (%rax),%rcx
ffff800000105588:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff80000010558c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105590:	49 89 c9             	mov    %rcx,%r9
ffff800000105593:	49 89 d0             	mov    %rdx,%r8
ffff800000105596:	48 89 c1             	mov    %rax,%rcx
ffff800000105599:	48 b8 68 11 00 00 00 	movabs $0x1168,%rax
ffff8000001055a0:	00 00 00 
ffff8000001055a3:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff8000001055a7:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001055ac:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001055b1:	4d 89 d7             	mov    %r10,%r15
ffff8000001055b4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001055b9:	49 bb e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r11
ffff8000001055c0:	ff ff ff 
ffff8000001055c3:	4d 01 d3             	add    %r10,%r11
ffff8000001055c6:	41 ff d3             	callq  *%r11
ffff8000001055c9:	eb fe                	jmp    ffff8000001055c9 <do_bounds+0x84>

ffff8000001055cb <do_undefined_opcode>:
ffff8000001055cb:	55                   	push   %rbp
ffff8000001055cc:	48 89 e5             	mov    %rsp,%rbp
ffff8000001055cf:	41 57                	push   %r15
ffff8000001055d1:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001055d5:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001055d5 <do_undefined_opcode+0xa>
ffff8000001055dc:	49 bb 53 73 00 00 00 	movabs $0x7353,%r11
ffff8000001055e3:	00 00 00 
ffff8000001055e6:	4d 01 da             	add    %r11,%r10
ffff8000001055e9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001055ed:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001055f1:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001055f8:	00 
ffff8000001055f9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001055fd:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105603:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105607:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010560b:	48 8b 08             	mov    (%rax),%rcx
ffff80000010560e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105612:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105616:	49 89 c9             	mov    %rcx,%r9
ffff800000105619:	49 89 d0             	mov    %rdx,%r8
ffff80000010561c:	48 89 c1             	mov    %rax,%rcx
ffff80000010561f:	48 b8 a0 11 00 00 00 	movabs $0x11a0,%rax
ffff800000105626:	00 00 00 
ffff800000105629:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff80000010562d:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105632:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105637:	4d 89 d7             	mov    %r10,%r15
ffff80000010563a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010563f:	49 bb e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r11
ffff800000105646:	ff ff ff 
ffff800000105649:	4d 01 d3             	add    %r10,%r11
ffff80000010564c:	41 ff d3             	callq  *%r11
ffff80000010564f:	eb fe                	jmp    ffff80000010564f <do_undefined_opcode+0x84>

ffff800000105651 <do_dev_not_available>:
ffff800000105651:	55                   	push   %rbp
ffff800000105652:	48 89 e5             	mov    %rsp,%rbp
ffff800000105655:	41 57                	push   %r15
ffff800000105657:	48 83 ec 28          	sub    $0x28,%rsp
ffff80000010565b:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff80000010565b <do_dev_not_available+0xa>
ffff800000105662:	49 bb cd 72 00 00 00 	movabs $0x72cd,%r11
ffff800000105669:	00 00 00 
ffff80000010566c:	4d 01 da             	add    %r11,%r10
ffff80000010566f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105673:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105677:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff80000010567e:	00 
ffff80000010567f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105683:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105689:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff80000010568d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105691:	48 8b 08             	mov    (%rax),%rcx
ffff800000105694:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105698:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010569c:	49 89 c9             	mov    %rcx,%r9
ffff80000010569f:	49 89 d0             	mov    %rdx,%r8
ffff8000001056a2:	48 89 c1             	mov    %rax,%rcx
ffff8000001056a5:	48 b8 e8 11 00 00 00 	movabs $0x11e8,%rax
ffff8000001056ac:	00 00 00 
ffff8000001056af:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff8000001056b3:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001056b8:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001056bd:	4d 89 d7             	mov    %r10,%r15
ffff8000001056c0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001056c5:	49 bb e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r11
ffff8000001056cc:	ff ff ff 
ffff8000001056cf:	4d 01 d3             	add    %r10,%r11
ffff8000001056d2:	41 ff d3             	callq  *%r11
ffff8000001056d5:	eb fe                	jmp    ffff8000001056d5 <do_dev_not_available+0x84>

ffff8000001056d7 <do_double_fault>:
ffff8000001056d7:	55                   	push   %rbp
ffff8000001056d8:	48 89 e5             	mov    %rsp,%rbp
ffff8000001056db:	41 57                	push   %r15
ffff8000001056dd:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001056e1:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001056e1 <do_double_fault+0xa>
ffff8000001056e8:	49 bb 47 72 00 00 00 	movabs $0x7247,%r11
ffff8000001056ef:	00 00 00 
ffff8000001056f2:	4d 01 da             	add    %r11,%r10
ffff8000001056f5:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001056f9:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001056fd:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105704:	00 
ffff800000105705:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105709:	48 05 98 00 00 00    	add    $0x98,%rax
ffff80000010570f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105713:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105717:	48 8b 08             	mov    (%rax),%rcx
ffff80000010571a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff80000010571e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105722:	49 89 c9             	mov    %rcx,%r9
ffff800000105725:	49 89 d0             	mov    %rdx,%r8
ffff800000105728:	48 89 c1             	mov    %rax,%rcx
ffff80000010572b:	48 b8 38 12 00 00 00 	movabs $0x1238,%rax
ffff800000105732:	00 00 00 
ffff800000105735:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000105739:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010573e:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105743:	4d 89 d7             	mov    %r10,%r15
ffff800000105746:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010574b:	49 bb e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r11
ffff800000105752:	ff ff ff 
ffff800000105755:	4d 01 d3             	add    %r10,%r11
ffff800000105758:	41 ff d3             	callq  *%r11
ffff80000010575b:	eb fe                	jmp    ffff80000010575b <do_double_fault+0x84>

ffff80000010575d <do_coprocessor_segment_overrun>:
ffff80000010575d:	55                   	push   %rbp
ffff80000010575e:	48 89 e5             	mov    %rsp,%rbp
ffff800000105761:	41 57                	push   %r15
ffff800000105763:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000105767:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff800000105767 <do_coprocessor_segment_overrun+0xa>
ffff80000010576e:	49 bb c1 71 00 00 00 	movabs $0x71c1,%r11
ffff800000105775:	00 00 00 
ffff800000105778:	4d 01 da             	add    %r11,%r10
ffff80000010577b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff80000010577f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105783:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff80000010578a:	00 
ffff80000010578b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010578f:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105795:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105799:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010579d:	48 8b 08             	mov    (%rax),%rcx
ffff8000001057a0:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001057a4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001057a8:	49 89 c9             	mov    %rcx,%r9
ffff8000001057ab:	49 89 d0             	mov    %rdx,%r8
ffff8000001057ae:	48 89 c1             	mov    %rax,%rcx
ffff8000001057b1:	48 b8 68 12 00 00 00 	movabs $0x1268,%rax
ffff8000001057b8:	00 00 00 
ffff8000001057bb:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff8000001057bf:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001057c4:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001057c9:	4d 89 d7             	mov    %r10,%r15
ffff8000001057cc:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001057d1:	49 bb e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r11
ffff8000001057d8:	ff ff ff 
ffff8000001057db:	4d 01 d3             	add    %r10,%r11
ffff8000001057de:	41 ff d3             	callq  *%r11
ffff8000001057e1:	eb fe                	jmp    ffff8000001057e1 <do_coprocessor_segment_overrun+0x84>

ffff8000001057e3 <do_invalid_TSS>:
ffff8000001057e3:	55                   	push   %rbp
ffff8000001057e4:	48 89 e5             	mov    %rsp,%rbp
ffff8000001057e7:	41 57                	push   %r15
ffff8000001057e9:	53                   	push   %rbx
ffff8000001057ea:	48 83 ec 20          	sub    $0x20,%rsp
ffff8000001057ee:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff8000001057ee <do_invalid_TSS+0xb>
ffff8000001057f5:	49 bb 3a 71 00 00 00 	movabs $0x713a,%r11
ffff8000001057fc:	00 00 00 
ffff8000001057ff:	4c 01 db             	add    %r11,%rbx
ffff800000105802:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105806:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff80000010580a:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105811:	00 
ffff800000105812:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105816:	48 05 98 00 00 00    	add    $0x98,%rax
ffff80000010581c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105820:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105824:	48 8b 08             	mov    (%rax),%rcx
ffff800000105827:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff80000010582b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010582f:	49 89 c9             	mov    %rcx,%r9
ffff800000105832:	49 89 d0             	mov    %rdx,%r8
ffff800000105835:	48 89 c1             	mov    %rax,%rcx
ffff800000105838:	48 b8 b8 12 00 00 00 	movabs $0x12b8,%rax
ffff80000010583f:	00 00 00 
ffff800000105842:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105846:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010584b:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105850:	49 89 df             	mov    %rbx,%r15
ffff800000105853:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105858:	49 ba e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r10
ffff80000010585f:	ff ff ff 
ffff800000105862:	49 01 da             	add    %rbx,%r10
ffff800000105865:	41 ff d2             	callq  *%r10
ffff800000105868:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010586c:	83 e0 01             	and    $0x1,%eax
ffff80000010586f:	48 85 c0             	test   %rax,%rax
ffff800000105872:	74 2f                	je     ffff8000001058a3 <do_invalid_TSS+0xc0>
ffff800000105874:	48 b8 e8 12 00 00 00 	movabs $0x12e8,%rax
ffff80000010587b:	00 00 00 
ffff80000010587e:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105882:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105887:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010588c:	49 89 df             	mov    %rbx,%r15
ffff80000010588f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105894:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff80000010589b:	ff ff ff 
ffff80000010589e:	48 01 d9             	add    %rbx,%rcx
ffff8000001058a1:	ff d1                	callq  *%rcx
ffff8000001058a3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001058a7:	83 e0 02             	and    $0x2,%eax
ffff8000001058aa:	48 85 c0             	test   %rax,%rax
ffff8000001058ad:	74 31                	je     ffff8000001058e0 <do_invalid_TSS+0xfd>
ffff8000001058af:	48 b8 68 13 00 00 00 	movabs $0x1368,%rax
ffff8000001058b6:	00 00 00 
ffff8000001058b9:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001058bd:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001058c2:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001058c7:	49 89 df             	mov    %rbx,%r15
ffff8000001058ca:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001058cf:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff8000001058d6:	ff ff ff 
ffff8000001058d9:	48 01 d9             	add    %rbx,%rcx
ffff8000001058dc:	ff d1                	callq  *%rcx
ffff8000001058de:	eb 2f                	jmp    ffff80000010590f <do_invalid_TSS+0x12c>
ffff8000001058e0:	48 b8 98 13 00 00 00 	movabs $0x1398,%rax
ffff8000001058e7:	00 00 00 
ffff8000001058ea:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001058ee:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001058f3:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001058f8:	49 89 df             	mov    %rbx,%r15
ffff8000001058fb:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105900:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff800000105907:	ff ff ff 
ffff80000010590a:	48 01 d9             	add    %rbx,%rcx
ffff80000010590d:	ff d1                	callq  *%rcx
ffff80000010590f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105913:	83 e0 02             	and    $0x2,%eax
ffff800000105916:	48 85 c0             	test   %rax,%rax
ffff800000105919:	75 6c                	jne    ffff800000105987 <do_invalid_TSS+0x1a4>
ffff80000010591b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010591f:	83 e0 04             	and    $0x4,%eax
ffff800000105922:	48 85 c0             	test   %rax,%rax
ffff800000105925:	74 31                	je     ffff800000105958 <do_invalid_TSS+0x175>
ffff800000105927:	48 b8 d0 13 00 00 00 	movabs $0x13d0,%rax
ffff80000010592e:	00 00 00 
ffff800000105931:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105935:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010593a:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010593f:	49 89 df             	mov    %rbx,%r15
ffff800000105942:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105947:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff80000010594e:	ff ff ff 
ffff800000105951:	48 01 d9             	add    %rbx,%rcx
ffff800000105954:	ff d1                	callq  *%rcx
ffff800000105956:	eb 2f                	jmp    ffff800000105987 <do_invalid_TSS+0x1a4>
ffff800000105958:	48 b8 08 14 00 00 00 	movabs $0x1408,%rax
ffff80000010595f:	00 00 00 
ffff800000105962:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105966:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010596b:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105970:	49 89 df             	mov    %rbx,%r15
ffff800000105973:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105978:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff80000010597f:	ff ff ff 
ffff800000105982:	48 01 d9             	add    %rbx,%rcx
ffff800000105985:	ff d1                	callq  *%rcx
ffff800000105987:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010598b:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff800000105990:	48 89 c1             	mov    %rax,%rcx
ffff800000105993:	48 b8 34 14 00 00 00 	movabs $0x1434,%rax
ffff80000010599a:	00 00 00 
ffff80000010599d:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001059a1:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001059a6:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001059ab:	49 89 df             	mov    %rbx,%r15
ffff8000001059ae:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001059b3:	49 b8 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r8
ffff8000001059ba:	ff ff ff 
ffff8000001059bd:	49 01 d8             	add    %rbx,%r8
ffff8000001059c0:	41 ff d0             	callq  *%r8
ffff8000001059c3:	eb fe                	jmp    ffff8000001059c3 <do_invalid_TSS+0x1e0>

ffff8000001059c5 <do_segment_not_present>:
ffff8000001059c5:	55                   	push   %rbp
ffff8000001059c6:	48 89 e5             	mov    %rsp,%rbp
ffff8000001059c9:	41 57                	push   %r15
ffff8000001059cb:	53                   	push   %rbx
ffff8000001059cc:	48 83 ec 20          	sub    $0x20,%rsp
ffff8000001059d0:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff8000001059d0 <do_segment_not_present+0xb>
ffff8000001059d7:	49 bb 58 6f 00 00 00 	movabs $0x6f58,%r11
ffff8000001059de:	00 00 00 
ffff8000001059e1:	4c 01 db             	add    %r11,%rbx
ffff8000001059e4:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001059e8:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001059ec:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001059f3:	00 
ffff8000001059f4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001059f8:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001059fe:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105a02:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105a06:	48 8b 08             	mov    (%rax),%rcx
ffff800000105a09:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105a0d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105a11:	49 89 c9             	mov    %rcx,%r9
ffff800000105a14:	49 89 d0             	mov    %rdx,%r8
ffff800000105a17:	48 89 c1             	mov    %rax,%rcx
ffff800000105a1a:	48 b8 50 14 00 00 00 	movabs $0x1450,%rax
ffff800000105a21:	00 00 00 
ffff800000105a24:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105a28:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105a2d:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105a32:	49 89 df             	mov    %rbx,%r15
ffff800000105a35:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105a3a:	49 ba e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r10
ffff800000105a41:	ff ff ff 
ffff800000105a44:	49 01 da             	add    %rbx,%r10
ffff800000105a47:	41 ff d2             	callq  *%r10
ffff800000105a4a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105a4e:	83 e0 01             	and    $0x1,%eax
ffff800000105a51:	48 85 c0             	test   %rax,%rax
ffff800000105a54:	74 2f                	je     ffff800000105a85 <do_segment_not_present+0xc0>
ffff800000105a56:	48 b8 e8 12 00 00 00 	movabs $0x12e8,%rax
ffff800000105a5d:	00 00 00 
ffff800000105a60:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105a64:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105a69:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105a6e:	49 89 df             	mov    %rbx,%r15
ffff800000105a71:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105a76:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff800000105a7d:	ff ff ff 
ffff800000105a80:	48 01 d9             	add    %rbx,%rcx
ffff800000105a83:	ff d1                	callq  *%rcx
ffff800000105a85:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105a89:	83 e0 02             	and    $0x2,%eax
ffff800000105a8c:	48 85 c0             	test   %rax,%rax
ffff800000105a8f:	74 31                	je     ffff800000105ac2 <do_segment_not_present+0xfd>
ffff800000105a91:	48 b8 68 13 00 00 00 	movabs $0x1368,%rax
ffff800000105a98:	00 00 00 
ffff800000105a9b:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105a9f:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105aa4:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105aa9:	49 89 df             	mov    %rbx,%r15
ffff800000105aac:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105ab1:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff800000105ab8:	ff ff ff 
ffff800000105abb:	48 01 d9             	add    %rbx,%rcx
ffff800000105abe:	ff d1                	callq  *%rcx
ffff800000105ac0:	eb 2f                	jmp    ffff800000105af1 <do_segment_not_present+0x12c>
ffff800000105ac2:	48 b8 98 13 00 00 00 	movabs $0x1398,%rax
ffff800000105ac9:	00 00 00 
ffff800000105acc:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105ad0:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105ad5:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105ada:	49 89 df             	mov    %rbx,%r15
ffff800000105add:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105ae2:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff800000105ae9:	ff ff ff 
ffff800000105aec:	48 01 d9             	add    %rbx,%rcx
ffff800000105aef:	ff d1                	callq  *%rcx
ffff800000105af1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105af5:	83 e0 02             	and    $0x2,%eax
ffff800000105af8:	48 85 c0             	test   %rax,%rax
ffff800000105afb:	75 6c                	jne    ffff800000105b69 <do_segment_not_present+0x1a4>
ffff800000105afd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105b01:	83 e0 04             	and    $0x4,%eax
ffff800000105b04:	48 85 c0             	test   %rax,%rax
ffff800000105b07:	74 31                	je     ffff800000105b3a <do_segment_not_present+0x175>
ffff800000105b09:	48 b8 d0 13 00 00 00 	movabs $0x13d0,%rax
ffff800000105b10:	00 00 00 
ffff800000105b13:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105b17:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105b1c:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105b21:	49 89 df             	mov    %rbx,%r15
ffff800000105b24:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105b29:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff800000105b30:	ff ff ff 
ffff800000105b33:	48 01 d9             	add    %rbx,%rcx
ffff800000105b36:	ff d1                	callq  *%rcx
ffff800000105b38:	eb 2f                	jmp    ffff800000105b69 <do_segment_not_present+0x1a4>
ffff800000105b3a:	48 b8 08 14 00 00 00 	movabs $0x1408,%rax
ffff800000105b41:	00 00 00 
ffff800000105b44:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105b48:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105b4d:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105b52:	49 89 df             	mov    %rbx,%r15
ffff800000105b55:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105b5a:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff800000105b61:	ff ff ff 
ffff800000105b64:	48 01 d9             	add    %rbx,%rcx
ffff800000105b67:	ff d1                	callq  *%rcx
ffff800000105b69:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105b6d:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff800000105b72:	48 89 c1             	mov    %rax,%rcx
ffff800000105b75:	48 b8 34 14 00 00 00 	movabs $0x1434,%rax
ffff800000105b7c:	00 00 00 
ffff800000105b7f:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105b83:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105b88:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105b8d:	49 89 df             	mov    %rbx,%r15
ffff800000105b90:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105b95:	49 b8 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r8
ffff800000105b9c:	ff ff ff 
ffff800000105b9f:	49 01 d8             	add    %rbx,%r8
ffff800000105ba2:	41 ff d0             	callq  *%r8
ffff800000105ba5:	eb fe                	jmp    ffff800000105ba5 <do_segment_not_present+0x1e0>

ffff800000105ba7 <do_stack_segment_fault>:
ffff800000105ba7:	55                   	push   %rbp
ffff800000105ba8:	48 89 e5             	mov    %rsp,%rbp
ffff800000105bab:	41 57                	push   %r15
ffff800000105bad:	53                   	push   %rbx
ffff800000105bae:	48 83 ec 20          	sub    $0x20,%rsp
ffff800000105bb2:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000105bb2 <do_stack_segment_fault+0xb>
ffff800000105bb9:	49 bb 76 6d 00 00 00 	movabs $0x6d76,%r11
ffff800000105bc0:	00 00 00 
ffff800000105bc3:	4c 01 db             	add    %r11,%rbx
ffff800000105bc6:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105bca:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105bce:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105bd5:	00 
ffff800000105bd6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105bda:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105be0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105be4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105be8:	48 8b 08             	mov    (%rax),%rcx
ffff800000105beb:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105bef:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105bf3:	49 89 c9             	mov    %rcx,%r9
ffff800000105bf6:	49 89 d0             	mov    %rdx,%r8
ffff800000105bf9:	48 89 c1             	mov    %rax,%rcx
ffff800000105bfc:	48 b8 88 14 00 00 00 	movabs $0x1488,%rax
ffff800000105c03:	00 00 00 
ffff800000105c06:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105c0a:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105c0f:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105c14:	49 89 df             	mov    %rbx,%r15
ffff800000105c17:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105c1c:	49 ba e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r10
ffff800000105c23:	ff ff ff 
ffff800000105c26:	49 01 da             	add    %rbx,%r10
ffff800000105c29:	41 ff d2             	callq  *%r10
ffff800000105c2c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105c30:	83 e0 01             	and    $0x1,%eax
ffff800000105c33:	48 85 c0             	test   %rax,%rax
ffff800000105c36:	74 2f                	je     ffff800000105c67 <do_stack_segment_fault+0xc0>
ffff800000105c38:	48 b8 e8 12 00 00 00 	movabs $0x12e8,%rax
ffff800000105c3f:	00 00 00 
ffff800000105c42:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105c46:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105c4b:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105c50:	49 89 df             	mov    %rbx,%r15
ffff800000105c53:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105c58:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff800000105c5f:	ff ff ff 
ffff800000105c62:	48 01 d9             	add    %rbx,%rcx
ffff800000105c65:	ff d1                	callq  *%rcx
ffff800000105c67:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105c6b:	83 e0 02             	and    $0x2,%eax
ffff800000105c6e:	48 85 c0             	test   %rax,%rax
ffff800000105c71:	74 31                	je     ffff800000105ca4 <do_stack_segment_fault+0xfd>
ffff800000105c73:	48 b8 68 13 00 00 00 	movabs $0x1368,%rax
ffff800000105c7a:	00 00 00 
ffff800000105c7d:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105c81:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105c86:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105c8b:	49 89 df             	mov    %rbx,%r15
ffff800000105c8e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105c93:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff800000105c9a:	ff ff ff 
ffff800000105c9d:	48 01 d9             	add    %rbx,%rcx
ffff800000105ca0:	ff d1                	callq  *%rcx
ffff800000105ca2:	eb 2f                	jmp    ffff800000105cd3 <do_stack_segment_fault+0x12c>
ffff800000105ca4:	48 b8 98 13 00 00 00 	movabs $0x1398,%rax
ffff800000105cab:	00 00 00 
ffff800000105cae:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105cb2:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105cb7:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105cbc:	49 89 df             	mov    %rbx,%r15
ffff800000105cbf:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105cc4:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff800000105ccb:	ff ff ff 
ffff800000105cce:	48 01 d9             	add    %rbx,%rcx
ffff800000105cd1:	ff d1                	callq  *%rcx
ffff800000105cd3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105cd7:	83 e0 02             	and    $0x2,%eax
ffff800000105cda:	48 85 c0             	test   %rax,%rax
ffff800000105cdd:	75 6c                	jne    ffff800000105d4b <do_stack_segment_fault+0x1a4>
ffff800000105cdf:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105ce3:	83 e0 04             	and    $0x4,%eax
ffff800000105ce6:	48 85 c0             	test   %rax,%rax
ffff800000105ce9:	74 31                	je     ffff800000105d1c <do_stack_segment_fault+0x175>
ffff800000105ceb:	48 b8 d0 13 00 00 00 	movabs $0x13d0,%rax
ffff800000105cf2:	00 00 00 
ffff800000105cf5:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105cf9:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105cfe:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105d03:	49 89 df             	mov    %rbx,%r15
ffff800000105d06:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105d0b:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff800000105d12:	ff ff ff 
ffff800000105d15:	48 01 d9             	add    %rbx,%rcx
ffff800000105d18:	ff d1                	callq  *%rcx
ffff800000105d1a:	eb 2f                	jmp    ffff800000105d4b <do_stack_segment_fault+0x1a4>
ffff800000105d1c:	48 b8 08 14 00 00 00 	movabs $0x1408,%rax
ffff800000105d23:	00 00 00 
ffff800000105d26:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105d2a:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105d2f:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105d34:	49 89 df             	mov    %rbx,%r15
ffff800000105d37:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105d3c:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff800000105d43:	ff ff ff 
ffff800000105d46:	48 01 d9             	add    %rbx,%rcx
ffff800000105d49:	ff d1                	callq  *%rcx
ffff800000105d4b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105d4f:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff800000105d54:	48 89 c1             	mov    %rax,%rcx
ffff800000105d57:	48 b8 34 14 00 00 00 	movabs $0x1434,%rax
ffff800000105d5e:	00 00 00 
ffff800000105d61:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105d65:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105d6a:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105d6f:	49 89 df             	mov    %rbx,%r15
ffff800000105d72:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105d77:	49 b8 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r8
ffff800000105d7e:	ff ff ff 
ffff800000105d81:	49 01 d8             	add    %rbx,%r8
ffff800000105d84:	41 ff d0             	callq  *%r8
ffff800000105d87:	eb fe                	jmp    ffff800000105d87 <do_stack_segment_fault+0x1e0>

ffff800000105d89 <do_general_protection>:
ffff800000105d89:	55                   	push   %rbp
ffff800000105d8a:	48 89 e5             	mov    %rsp,%rbp
ffff800000105d8d:	41 57                	push   %r15
ffff800000105d8f:	53                   	push   %rbx
ffff800000105d90:	48 83 ec 20          	sub    $0x20,%rsp
ffff800000105d94:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000105d94 <do_general_protection+0xb>
ffff800000105d9b:	49 bb 94 6b 00 00 00 	movabs $0x6b94,%r11
ffff800000105da2:	00 00 00 
ffff800000105da5:	4c 01 db             	add    %r11,%rbx
ffff800000105da8:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105dac:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105db0:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105db7:	00 
ffff800000105db8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105dbc:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105dc2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105dc6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105dca:	48 8b 08             	mov    (%rax),%rcx
ffff800000105dcd:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105dd1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105dd5:	49 89 c9             	mov    %rcx,%r9
ffff800000105dd8:	49 89 d0             	mov    %rdx,%r8
ffff800000105ddb:	48 89 c1             	mov    %rax,%rcx
ffff800000105dde:	48 b8 c0 14 00 00 00 	movabs $0x14c0,%rax
ffff800000105de5:	00 00 00 
ffff800000105de8:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105dec:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105df1:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105df6:	49 89 df             	mov    %rbx,%r15
ffff800000105df9:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105dfe:	49 ba e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r10
ffff800000105e05:	ff ff ff 
ffff800000105e08:	49 01 da             	add    %rbx,%r10
ffff800000105e0b:	41 ff d2             	callq  *%r10
ffff800000105e0e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105e12:	83 e0 01             	and    $0x1,%eax
ffff800000105e15:	48 85 c0             	test   %rax,%rax
ffff800000105e18:	74 2f                	je     ffff800000105e49 <do_general_protection+0xc0>
ffff800000105e1a:	48 b8 e8 12 00 00 00 	movabs $0x12e8,%rax
ffff800000105e21:	00 00 00 
ffff800000105e24:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105e28:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105e2d:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105e32:	49 89 df             	mov    %rbx,%r15
ffff800000105e35:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105e3a:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff800000105e41:	ff ff ff 
ffff800000105e44:	48 01 d9             	add    %rbx,%rcx
ffff800000105e47:	ff d1                	callq  *%rcx
ffff800000105e49:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105e4d:	83 e0 02             	and    $0x2,%eax
ffff800000105e50:	48 85 c0             	test   %rax,%rax
ffff800000105e53:	74 31                	je     ffff800000105e86 <do_general_protection+0xfd>
ffff800000105e55:	48 b8 68 13 00 00 00 	movabs $0x1368,%rax
ffff800000105e5c:	00 00 00 
ffff800000105e5f:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105e63:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105e68:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105e6d:	49 89 df             	mov    %rbx,%r15
ffff800000105e70:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105e75:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff800000105e7c:	ff ff ff 
ffff800000105e7f:	48 01 d9             	add    %rbx,%rcx
ffff800000105e82:	ff d1                	callq  *%rcx
ffff800000105e84:	eb 2f                	jmp    ffff800000105eb5 <do_general_protection+0x12c>
ffff800000105e86:	48 b8 98 13 00 00 00 	movabs $0x1398,%rax
ffff800000105e8d:	00 00 00 
ffff800000105e90:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105e94:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105e99:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105e9e:	49 89 df             	mov    %rbx,%r15
ffff800000105ea1:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105ea6:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff800000105ead:	ff ff ff 
ffff800000105eb0:	48 01 d9             	add    %rbx,%rcx
ffff800000105eb3:	ff d1                	callq  *%rcx
ffff800000105eb5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105eb9:	83 e0 02             	and    $0x2,%eax
ffff800000105ebc:	48 85 c0             	test   %rax,%rax
ffff800000105ebf:	75 6c                	jne    ffff800000105f2d <do_general_protection+0x1a4>
ffff800000105ec1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105ec5:	83 e0 04             	and    $0x4,%eax
ffff800000105ec8:	48 85 c0             	test   %rax,%rax
ffff800000105ecb:	74 31                	je     ffff800000105efe <do_general_protection+0x175>
ffff800000105ecd:	48 b8 d0 13 00 00 00 	movabs $0x13d0,%rax
ffff800000105ed4:	00 00 00 
ffff800000105ed7:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105edb:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105ee0:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105ee5:	49 89 df             	mov    %rbx,%r15
ffff800000105ee8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105eed:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff800000105ef4:	ff ff ff 
ffff800000105ef7:	48 01 d9             	add    %rbx,%rcx
ffff800000105efa:	ff d1                	callq  *%rcx
ffff800000105efc:	eb 2f                	jmp    ffff800000105f2d <do_general_protection+0x1a4>
ffff800000105efe:	48 b8 08 14 00 00 00 	movabs $0x1408,%rax
ffff800000105f05:	00 00 00 
ffff800000105f08:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105f0c:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105f11:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105f16:	49 89 df             	mov    %rbx,%r15
ffff800000105f19:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105f1e:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff800000105f25:	ff ff ff 
ffff800000105f28:	48 01 d9             	add    %rbx,%rcx
ffff800000105f2b:	ff d1                	callq  *%rcx
ffff800000105f2d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105f31:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff800000105f36:	48 89 c1             	mov    %rax,%rcx
ffff800000105f39:	48 b8 34 14 00 00 00 	movabs $0x1434,%rax
ffff800000105f40:	00 00 00 
ffff800000105f43:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105f47:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105f4c:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105f51:	49 89 df             	mov    %rbx,%r15
ffff800000105f54:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105f59:	49 b8 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r8
ffff800000105f60:	ff ff ff 
ffff800000105f63:	49 01 d8             	add    %rbx,%r8
ffff800000105f66:	41 ff d0             	callq  *%r8
ffff800000105f69:	eb fe                	jmp    ffff800000105f69 <do_general_protection+0x1e0>

ffff800000105f6b <do_page_fault>:
ffff800000105f6b:	55                   	push   %rbp
ffff800000105f6c:	48 89 e5             	mov    %rsp,%rbp
ffff800000105f6f:	41 57                	push   %r15
ffff800000105f71:	53                   	push   %rbx
ffff800000105f72:	48 83 ec 20          	sub    $0x20,%rsp
ffff800000105f76:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000105f76 <do_page_fault+0xb>
ffff800000105f7d:	49 bb b2 69 00 00 00 	movabs $0x69b2,%r11
ffff800000105f84:	00 00 00 
ffff800000105f87:	4c 01 db             	add    %r11,%rbx
ffff800000105f8a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105f8e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105f92:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105f99:	00 
ffff800000105f9a:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
ffff800000105fa1:	00 
ffff800000105fa2:	0f 20 d0             	mov    %cr2,%rax
ffff800000105fa5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff800000105fa9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105fad:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105fb3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105fb7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105fbb:	48 8b 08             	mov    (%rax),%rcx
ffff800000105fbe:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105fc2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105fc6:	49 89 c9             	mov    %rcx,%r9
ffff800000105fc9:	49 89 d0             	mov    %rdx,%r8
ffff800000105fcc:	48 89 c1             	mov    %rax,%rcx
ffff800000105fcf:	48 b8 f8 14 00 00 00 	movabs $0x14f8,%rax
ffff800000105fd6:	00 00 00 
ffff800000105fd9:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105fdd:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105fe2:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105fe7:	49 89 df             	mov    %rbx,%r15
ffff800000105fea:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105fef:	49 ba e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r10
ffff800000105ff6:	ff ff ff 
ffff800000105ff9:	49 01 da             	add    %rbx,%r10
ffff800000105ffc:	41 ff d2             	callq  *%r10
ffff800000105fff:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000106003:	83 e0 01             	and    $0x1,%eax
ffff800000106006:	48 85 c0             	test   %rax,%rax
ffff800000106009:	75 2f                	jne    ffff80000010603a <do_page_fault+0xcf>
ffff80000010600b:	48 b8 24 15 00 00 00 	movabs $0x1524,%rax
ffff800000106012:	00 00 00 
ffff800000106015:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106019:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010601e:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106023:	49 89 df             	mov    %rbx,%r15
ffff800000106026:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010602b:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff800000106032:	ff ff ff 
ffff800000106035:	48 01 d9             	add    %rbx,%rcx
ffff800000106038:	ff d1                	callq  *%rcx
ffff80000010603a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010603e:	83 e0 02             	and    $0x2,%eax
ffff800000106041:	48 85 c0             	test   %rax,%rax
ffff800000106044:	74 31                	je     ffff800000106077 <do_page_fault+0x10c>
ffff800000106046:	48 b8 37 15 00 00 00 	movabs $0x1537,%rax
ffff80000010604d:	00 00 00 
ffff800000106050:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106054:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106059:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010605e:	49 89 df             	mov    %rbx,%r15
ffff800000106061:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106066:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff80000010606d:	ff ff ff 
ffff800000106070:	48 01 d9             	add    %rbx,%rcx
ffff800000106073:	ff d1                	callq  *%rcx
ffff800000106075:	eb 2f                	jmp    ffff8000001060a6 <do_page_fault+0x13b>
ffff800000106077:	48 b8 4b 15 00 00 00 	movabs $0x154b,%rax
ffff80000010607e:	00 00 00 
ffff800000106081:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106085:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010608a:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010608f:	49 89 df             	mov    %rbx,%r15
ffff800000106092:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106097:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff80000010609e:	ff ff ff 
ffff8000001060a1:	48 01 d9             	add    %rbx,%rcx
ffff8000001060a4:	ff d1                	callq  *%rcx
ffff8000001060a6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001060aa:	83 e0 04             	and    $0x4,%eax
ffff8000001060ad:	48 85 c0             	test   %rax,%rax
ffff8000001060b0:	74 31                	je     ffff8000001060e3 <do_page_fault+0x178>
ffff8000001060b2:	48 b8 5e 15 00 00 00 	movabs $0x155e,%rax
ffff8000001060b9:	00 00 00 
ffff8000001060bc:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001060c0:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001060c5:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001060ca:	49 89 df             	mov    %rbx,%r15
ffff8000001060cd:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001060d2:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff8000001060d9:	ff ff ff 
ffff8000001060dc:	48 01 d9             	add    %rbx,%rcx
ffff8000001060df:	ff d1                	callq  *%rcx
ffff8000001060e1:	eb 2f                	jmp    ffff800000106112 <do_page_fault+0x1a7>
ffff8000001060e3:	48 b8 70 15 00 00 00 	movabs $0x1570,%rax
ffff8000001060ea:	00 00 00 
ffff8000001060ed:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001060f1:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001060f6:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001060fb:	49 89 df             	mov    %rbx,%r15
ffff8000001060fe:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106103:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff80000010610a:	ff ff ff 
ffff80000010610d:	48 01 d9             	add    %rbx,%rcx
ffff800000106110:	ff d1                	callq  *%rcx
ffff800000106112:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000106116:	83 e0 08             	and    $0x8,%eax
ffff800000106119:	48 85 c0             	test   %rax,%rax
ffff80000010611c:	74 2f                	je     ffff80000010614d <do_page_fault+0x1e2>
ffff80000010611e:	48 b8 8c 15 00 00 00 	movabs $0x158c,%rax
ffff800000106125:	00 00 00 
ffff800000106128:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010612c:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106131:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106136:	49 89 df             	mov    %rbx,%r15
ffff800000106139:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010613e:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff800000106145:	ff ff ff 
ffff800000106148:	48 01 d9             	add    %rbx,%rcx
ffff80000010614b:	ff d1                	callq  *%rcx
ffff80000010614d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000106151:	83 e0 10             	and    $0x10,%eax
ffff800000106154:	48 85 c0             	test   %rax,%rax
ffff800000106157:	74 2f                	je     ffff800000106188 <do_page_fault+0x21d>
ffff800000106159:	48 b8 a8 15 00 00 00 	movabs $0x15a8,%rax
ffff800000106160:	00 00 00 
ffff800000106163:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106167:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010616c:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106171:	49 89 df             	mov    %rbx,%r15
ffff800000106174:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106179:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff800000106180:	ff ff ff 
ffff800000106183:	48 01 d9             	add    %rbx,%rcx
ffff800000106186:	ff d1                	callq  *%rcx
ffff800000106188:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010618c:	48 89 c1             	mov    %rax,%rcx
ffff80000010618f:	48 b8 c8 15 00 00 00 	movabs $0x15c8,%rax
ffff800000106196:	00 00 00 
ffff800000106199:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010619d:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001061a2:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001061a7:	49 89 df             	mov    %rbx,%r15
ffff8000001061aa:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001061af:	49 b8 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r8
ffff8000001061b6:	ff ff ff 
ffff8000001061b9:	49 01 d8             	add    %rbx,%r8
ffff8000001061bc:	41 ff d0             	callq  *%r8
ffff8000001061bf:	eb fe                	jmp    ffff8000001061bf <do_page_fault+0x254>

ffff8000001061c1 <do_x87_FPU_error>:
ffff8000001061c1:	55                   	push   %rbp
ffff8000001061c2:	48 89 e5             	mov    %rsp,%rbp
ffff8000001061c5:	41 57                	push   %r15
ffff8000001061c7:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001061cb:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001061cb <do_x87_FPU_error+0xa>
ffff8000001061d2:	49 bb 5d 67 00 00 00 	movabs $0x675d,%r11
ffff8000001061d9:	00 00 00 
ffff8000001061dc:	4d 01 da             	add    %r11,%r10
ffff8000001061df:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001061e3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001061e7:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001061ee:	00 
ffff8000001061ef:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001061f3:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001061f9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001061fd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106201:	48 8b 08             	mov    (%rax),%rcx
ffff800000106204:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000106208:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010620c:	49 89 c9             	mov    %rcx,%r9
ffff80000010620f:	49 89 d0             	mov    %rdx,%r8
ffff800000106212:	48 89 c1             	mov    %rax,%rcx
ffff800000106215:	48 b8 d0 15 00 00 00 	movabs $0x15d0,%rax
ffff80000010621c:	00 00 00 
ffff80000010621f:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000106223:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106228:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010622d:	4d 89 d7             	mov    %r10,%r15
ffff800000106230:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106235:	49 bb e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r11
ffff80000010623c:	ff ff ff 
ffff80000010623f:	4d 01 d3             	add    %r10,%r11
ffff800000106242:	41 ff d3             	callq  *%r11
ffff800000106245:	eb fe                	jmp    ffff800000106245 <do_x87_FPU_error+0x84>

ffff800000106247 <do_alignment_check>:
ffff800000106247:	55                   	push   %rbp
ffff800000106248:	48 89 e5             	mov    %rsp,%rbp
ffff80000010624b:	41 57                	push   %r15
ffff80000010624d:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000106251:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff800000106251 <do_alignment_check+0xa>
ffff800000106258:	49 bb d7 66 00 00 00 	movabs $0x66d7,%r11
ffff80000010625f:	00 00 00 
ffff800000106262:	4d 01 da             	add    %r11,%r10
ffff800000106265:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000106269:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff80000010626d:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000106274:	00 
ffff800000106275:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000106279:	48 05 98 00 00 00    	add    $0x98,%rax
ffff80000010627f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000106283:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106287:	48 8b 08             	mov    (%rax),%rcx
ffff80000010628a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff80000010628e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000106292:	49 89 c9             	mov    %rcx,%r9
ffff800000106295:	49 89 d0             	mov    %rdx,%r8
ffff800000106298:	48 89 c1             	mov    %rax,%rcx
ffff80000010629b:	48 b8 20 16 00 00 00 	movabs $0x1620,%rax
ffff8000001062a2:	00 00 00 
ffff8000001062a5:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff8000001062a9:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001062ae:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001062b3:	4d 89 d7             	mov    %r10,%r15
ffff8000001062b6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001062bb:	49 bb e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r11
ffff8000001062c2:	ff ff ff 
ffff8000001062c5:	4d 01 d3             	add    %r10,%r11
ffff8000001062c8:	41 ff d3             	callq  *%r11
ffff8000001062cb:	eb fe                	jmp    ffff8000001062cb <do_alignment_check+0x84>

ffff8000001062cd <do_machine_check>:
ffff8000001062cd:	55                   	push   %rbp
ffff8000001062ce:	48 89 e5             	mov    %rsp,%rbp
ffff8000001062d1:	41 57                	push   %r15
ffff8000001062d3:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001062d7:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001062d7 <do_machine_check+0xa>
ffff8000001062de:	49 bb 51 66 00 00 00 	movabs $0x6651,%r11
ffff8000001062e5:	00 00 00 
ffff8000001062e8:	4d 01 da             	add    %r11,%r10
ffff8000001062eb:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001062ef:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001062f3:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001062fa:	00 
ffff8000001062fb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001062ff:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000106305:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000106309:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010630d:	48 8b 08             	mov    (%rax),%rcx
ffff800000106310:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000106314:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000106318:	49 89 c9             	mov    %rcx,%r9
ffff80000010631b:	49 89 d0             	mov    %rdx,%r8
ffff80000010631e:	48 89 c1             	mov    %rax,%rcx
ffff800000106321:	48 b8 58 16 00 00 00 	movabs $0x1658,%rax
ffff800000106328:	00 00 00 
ffff80000010632b:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff80000010632f:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106334:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106339:	4d 89 d7             	mov    %r10,%r15
ffff80000010633c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106341:	49 bb e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r11
ffff800000106348:	ff ff ff 
ffff80000010634b:	4d 01 d3             	add    %r10,%r11
ffff80000010634e:	41 ff d3             	callq  *%r11
ffff800000106351:	eb fe                	jmp    ffff800000106351 <do_machine_check+0x84>

ffff800000106353 <do_SIMD_exception>:
ffff800000106353:	55                   	push   %rbp
ffff800000106354:	48 89 e5             	mov    %rsp,%rbp
ffff800000106357:	41 57                	push   %r15
ffff800000106359:	48 83 ec 28          	sub    $0x28,%rsp
ffff80000010635d:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff80000010635d <do_SIMD_exception+0xa>
ffff800000106364:	49 bb cb 65 00 00 00 	movabs $0x65cb,%r11
ffff80000010636b:	00 00 00 
ffff80000010636e:	4d 01 da             	add    %r11,%r10
ffff800000106371:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000106375:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000106379:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000106380:	00 
ffff800000106381:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000106385:	48 05 98 00 00 00    	add    $0x98,%rax
ffff80000010638b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff80000010638f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106393:	48 8b 08             	mov    (%rax),%rcx
ffff800000106396:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff80000010639a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010639e:	49 89 c9             	mov    %rcx,%r9
ffff8000001063a1:	49 89 d0             	mov    %rdx,%r8
ffff8000001063a4:	48 89 c1             	mov    %rax,%rcx
ffff8000001063a7:	48 b8 88 16 00 00 00 	movabs $0x1688,%rax
ffff8000001063ae:	00 00 00 
ffff8000001063b1:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff8000001063b5:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001063ba:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001063bf:	4d 89 d7             	mov    %r10,%r15
ffff8000001063c2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001063c7:	49 bb e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r11
ffff8000001063ce:	ff ff ff 
ffff8000001063d1:	4d 01 d3             	add    %r10,%r11
ffff8000001063d4:	41 ff d3             	callq  *%r11
ffff8000001063d7:	eb fe                	jmp    ffff8000001063d7 <do_SIMD_exception+0x84>

ffff8000001063d9 <do_virtualization_exception>:
ffff8000001063d9:	55                   	push   %rbp
ffff8000001063da:	48 89 e5             	mov    %rsp,%rbp
ffff8000001063dd:	41 57                	push   %r15
ffff8000001063df:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001063e3:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001063e3 <do_virtualization_exception+0xa>
ffff8000001063ea:	49 bb 45 65 00 00 00 	movabs $0x6545,%r11
ffff8000001063f1:	00 00 00 
ffff8000001063f4:	4d 01 da             	add    %r11,%r10
ffff8000001063f7:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001063fb:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001063ff:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000106406:	00 
ffff800000106407:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010640b:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000106411:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000106415:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106419:	48 8b 08             	mov    (%rax),%rcx
ffff80000010641c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000106420:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000106424:	49 89 c9             	mov    %rcx,%r9
ffff800000106427:	49 89 d0             	mov    %rdx,%r8
ffff80000010642a:	48 89 c1             	mov    %rax,%rcx
ffff80000010642d:	48 b8 d0 16 00 00 00 	movabs $0x16d0,%rax
ffff800000106434:	00 00 00 
ffff800000106437:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff80000010643b:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106440:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106445:	4d 89 d7             	mov    %r10,%r15
ffff800000106448:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010644d:	49 bb e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r11
ffff800000106454:	ff ff ff 
ffff800000106457:	4d 01 d3             	add    %r10,%r11
ffff80000010645a:	41 ff d3             	callq  *%r11
ffff80000010645d:	eb fe                	jmp    ffff80000010645d <do_virtualization_exception+0x84>

ffff80000010645f <set_sys_int>:
ffff80000010645f:	55                   	push   %rbp
ffff800000106460:	48 89 e5             	mov    %rsp,%rbp
ffff800000106463:	41 57                	push   %r15
ffff800000106465:	53                   	push   %rbx
ffff800000106466:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000106466 <set_sys_int+0x7>
ffff80000010646d:	49 bb c2 64 00 00 00 	movabs $0x64c2,%r11
ffff800000106474:	00 00 00 
ffff800000106477:	4c 01 db             	add    %r11,%rbx
ffff80000010647a:	48 b8 00 ff ff ff ff 	movabs $0xffffffffffffff00,%rax
ffff800000106481:	ff ff ff 
ffff800000106484:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106488:	48 89 c2             	mov    %rax,%rdx
ffff80000010648b:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106490:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106495:	49 89 df             	mov    %rbx,%r15
ffff800000106498:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010649d:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff8000001064a4:	ff ff ff 
ffff8000001064a7:	48 01 d9             	add    %rbx,%rcx
ffff8000001064aa:	ff d1                	callq  *%rcx
ffff8000001064ac:	48 b8 30 ff ff ff ff 	movabs $0xffffffffffffff30,%rax
ffff8000001064b3:	ff ff ff 
ffff8000001064b6:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001064ba:	48 89 c2             	mov    %rax,%rdx
ffff8000001064bd:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001064c2:	bf 01 00 00 00       	mov    $0x1,%edi
ffff8000001064c7:	49 89 df             	mov    %rbx,%r15
ffff8000001064ca:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001064cf:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff8000001064d6:	ff ff ff 
ffff8000001064d9:	48 01 d9             	add    %rbx,%rcx
ffff8000001064dc:	ff d1                	callq  *%rcx
ffff8000001064de:	48 b8 e8 ff ff ff ff 	movabs $0xffffffffffffffe8,%rax
ffff8000001064e5:	ff ff ff 
ffff8000001064e8:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001064ec:	48 89 c2             	mov    %rax,%rdx
ffff8000001064ef:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001064f4:	bf 02 00 00 00       	mov    $0x2,%edi
ffff8000001064f9:	49 89 df             	mov    %rbx,%r15
ffff8000001064fc:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106501:	48 b9 f9 79 ff ff ff 	movabs $0xffffffffffff79f9,%rcx
ffff800000106508:	ff ff ff 
ffff80000010650b:	48 01 d9             	add    %rbx,%rcx
ffff80000010650e:	ff d1                	callq  *%rcx
ffff800000106510:	48 b8 60 ff ff ff ff 	movabs $0xffffffffffffff60,%rax
ffff800000106517:	ff ff ff 
ffff80000010651a:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010651e:	48 89 c2             	mov    %rax,%rdx
ffff800000106521:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106526:	bf 03 00 00 00       	mov    $0x3,%edi
ffff80000010652b:	49 89 df             	mov    %rbx,%r15
ffff80000010652e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106533:	48 b9 9f 7a ff ff ff 	movabs $0xffffffffffff7a9f,%rcx
ffff80000010653a:	ff ff ff 
ffff80000010653d:	48 01 d9             	add    %rbx,%rcx
ffff800000106540:	ff d1                	callq  *%rcx
ffff800000106542:	48 b8 28 ff ff ff ff 	movabs $0xffffffffffffff28,%rax
ffff800000106549:	ff ff ff 
ffff80000010654c:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106550:	48 89 c2             	mov    %rax,%rdx
ffff800000106553:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106558:	bf 04 00 00 00       	mov    $0x4,%edi
ffff80000010655d:	49 89 df             	mov    %rbx,%r15
ffff800000106560:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106565:	48 b9 9f 7a ff ff ff 	movabs $0xffffffffffff7a9f,%rcx
ffff80000010656c:	ff ff ff 
ffff80000010656f:	48 01 d9             	add    %rbx,%rcx
ffff800000106572:	ff d1                	callq  *%rcx
ffff800000106574:	48 b8 38 ff ff ff ff 	movabs $0xffffffffffffff38,%rax
ffff80000010657b:	ff ff ff 
ffff80000010657e:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106582:	48 89 c2             	mov    %rax,%rdx
ffff800000106585:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010658a:	bf 05 00 00 00       	mov    $0x5,%edi
ffff80000010658f:	49 89 df             	mov    %rbx,%r15
ffff800000106592:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106597:	48 b9 9f 7a ff ff ff 	movabs $0xffffffffffff7a9f,%rcx
ffff80000010659e:	ff ff ff 
ffff8000001065a1:	48 01 d9             	add    %rbx,%rcx
ffff8000001065a4:	ff d1                	callq  *%rcx
ffff8000001065a6:	48 b8 68 ff ff ff ff 	movabs $0xffffffffffffff68,%rax
ffff8000001065ad:	ff ff ff 
ffff8000001065b0:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001065b4:	48 89 c2             	mov    %rax,%rdx
ffff8000001065b7:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001065bc:	bf 06 00 00 00       	mov    $0x6,%edi
ffff8000001065c1:	49 89 df             	mov    %rbx,%r15
ffff8000001065c4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001065c9:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff8000001065d0:	ff ff ff 
ffff8000001065d3:	48 01 d9             	add    %rbx,%rcx
ffff8000001065d6:	ff d1                	callq  *%rcx
ffff8000001065d8:	48 b8 f0 ff ff ff ff 	movabs $0xfffffffffffffff0,%rax
ffff8000001065df:	ff ff ff 
ffff8000001065e2:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001065e6:	48 89 c2             	mov    %rax,%rdx
ffff8000001065e9:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001065ee:	bf 07 00 00 00       	mov    $0x7,%edi
ffff8000001065f3:	49 89 df             	mov    %rbx,%r15
ffff8000001065f6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001065fb:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff800000106602:	ff ff ff 
ffff800000106605:	48 01 d9             	add    %rbx,%rcx
ffff800000106608:	ff d1                	callq  *%rcx
ffff80000010660a:	48 b8 88 ff ff ff ff 	movabs $0xffffffffffffff88,%rax
ffff800000106611:	ff ff ff 
ffff800000106614:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106618:	48 89 c2             	mov    %rax,%rdx
ffff80000010661b:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106620:	bf 08 00 00 00       	mov    $0x8,%edi
ffff800000106625:	49 89 df             	mov    %rbx,%r15
ffff800000106628:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010662d:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff800000106634:	ff ff ff 
ffff800000106637:	48 01 d9             	add    %rbx,%rcx
ffff80000010663a:	ff d1                	callq  *%rcx
ffff80000010663c:	48 b8 a8 ff ff ff ff 	movabs $0xffffffffffffffa8,%rax
ffff800000106643:	ff ff ff 
ffff800000106646:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010664a:	48 89 c2             	mov    %rax,%rdx
ffff80000010664d:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106652:	bf 09 00 00 00       	mov    $0x9,%edi
ffff800000106657:	49 89 df             	mov    %rbx,%r15
ffff80000010665a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010665f:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff800000106666:	ff ff ff 
ffff800000106669:	48 01 d9             	add    %rbx,%rcx
ffff80000010666c:	ff d1                	callq  *%rcx
ffff80000010666e:	48 b8 40 ff ff ff ff 	movabs $0xffffffffffffff40,%rax
ffff800000106675:	ff ff ff 
ffff800000106678:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010667c:	48 89 c2             	mov    %rax,%rdx
ffff80000010667f:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106684:	bf 0a 00 00 00       	mov    $0xa,%edi
ffff800000106689:	49 89 df             	mov    %rbx,%r15
ffff80000010668c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106691:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff800000106698:	ff ff ff 
ffff80000010669b:	48 01 d9             	add    %rbx,%rcx
ffff80000010669e:	ff d1                	callq  *%rcx
ffff8000001066a0:	48 b8 48 ff ff ff ff 	movabs $0xffffffffffffff48,%rax
ffff8000001066a7:	ff ff ff 
ffff8000001066aa:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001066ae:	48 89 c2             	mov    %rax,%rdx
ffff8000001066b1:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001066b6:	bf 0b 00 00 00       	mov    $0xb,%edi
ffff8000001066bb:	49 89 df             	mov    %rbx,%r15
ffff8000001066be:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001066c3:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff8000001066ca:	ff ff ff 
ffff8000001066cd:	48 01 d9             	add    %rbx,%rcx
ffff8000001066d0:	ff d1                	callq  *%rcx
ffff8000001066d2:	48 b8 50 ff ff ff ff 	movabs $0xffffffffffffff50,%rax
ffff8000001066d9:	ff ff ff 
ffff8000001066dc:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001066e0:	48 89 c2             	mov    %rax,%rdx
ffff8000001066e3:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001066e8:	bf 0c 00 00 00       	mov    $0xc,%edi
ffff8000001066ed:	49 89 df             	mov    %rbx,%r15
ffff8000001066f0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001066f5:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff8000001066fc:	ff ff ff 
ffff8000001066ff:	48 01 d9             	add    %rbx,%rcx
ffff800000106702:	ff d1                	callq  *%rcx
ffff800000106704:	48 b8 18 ff ff ff ff 	movabs $0xffffffffffffff18,%rax
ffff80000010670b:	ff ff ff 
ffff80000010670e:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106712:	48 89 c2             	mov    %rax,%rdx
ffff800000106715:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010671a:	bf 0d 00 00 00       	mov    $0xd,%edi
ffff80000010671f:	49 89 df             	mov    %rbx,%r15
ffff800000106722:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106727:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff80000010672e:	ff ff ff 
ffff800000106731:	48 01 d9             	add    %rbx,%rcx
ffff800000106734:	ff d1                	callq  *%rcx
ffff800000106736:	48 b8 b8 ff ff ff ff 	movabs $0xffffffffffffffb8,%rax
ffff80000010673d:	ff ff ff 
ffff800000106740:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106744:	48 89 c2             	mov    %rax,%rdx
ffff800000106747:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010674c:	bf 0e 00 00 00       	mov    $0xe,%edi
ffff800000106751:	49 89 df             	mov    %rbx,%r15
ffff800000106754:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106759:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff800000106760:	ff ff ff 
ffff800000106763:	48 01 d9             	add    %rbx,%rcx
ffff800000106766:	ff d1                	callq  *%rcx
ffff800000106768:	48 b8 80 ff ff ff ff 	movabs $0xffffffffffffff80,%rax
ffff80000010676f:	ff ff ff 
ffff800000106772:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106776:	48 89 c2             	mov    %rax,%rdx
ffff800000106779:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010677e:	bf 10 00 00 00       	mov    $0x10,%edi
ffff800000106783:	49 89 df             	mov    %rbx,%r15
ffff800000106786:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010678b:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff800000106792:	ff ff ff 
ffff800000106795:	48 01 d9             	add    %rbx,%rcx
ffff800000106798:	ff d1                	callq  *%rcx
ffff80000010679a:	48 b8 78 ff ff ff ff 	movabs $0xffffffffffffff78,%rax
ffff8000001067a1:	ff ff ff 
ffff8000001067a4:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001067a8:	48 89 c2             	mov    %rax,%rdx
ffff8000001067ab:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001067b0:	bf 11 00 00 00       	mov    $0x11,%edi
ffff8000001067b5:	49 89 df             	mov    %rbx,%r15
ffff8000001067b8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001067bd:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff8000001067c4:	ff ff ff 
ffff8000001067c7:	48 01 d9             	add    %rbx,%rcx
ffff8000001067ca:	ff d1                	callq  *%rcx
ffff8000001067cc:	48 b8 c8 ff ff ff ff 	movabs $0xffffffffffffffc8,%rax
ffff8000001067d3:	ff ff ff 
ffff8000001067d6:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001067da:	48 89 c2             	mov    %rax,%rdx
ffff8000001067dd:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001067e2:	bf 12 00 00 00       	mov    $0x12,%edi
ffff8000001067e7:	49 89 df             	mov    %rbx,%r15
ffff8000001067ea:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001067ef:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff8000001067f6:	ff ff ff 
ffff8000001067f9:	48 01 d9             	add    %rbx,%rcx
ffff8000001067fc:	ff d1                	callq  *%rcx
ffff8000001067fe:	48 b8 d8 ff ff ff ff 	movabs $0xffffffffffffffd8,%rax
ffff800000106805:	ff ff ff 
ffff800000106808:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010680c:	48 89 c2             	mov    %rax,%rdx
ffff80000010680f:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106814:	bf 13 00 00 00       	mov    $0x13,%edi
ffff800000106819:	49 89 df             	mov    %rbx,%r15
ffff80000010681c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106821:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff800000106828:	ff ff ff 
ffff80000010682b:	48 01 d9             	add    %rbx,%rcx
ffff80000010682e:	ff d1                	callq  *%rcx
ffff800000106830:	48 b8 98 ff ff ff ff 	movabs $0xffffffffffffff98,%rax
ffff800000106837:	ff ff ff 
ffff80000010683a:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010683e:	48 89 c2             	mov    %rax,%rdx
ffff800000106841:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106846:	bf 14 00 00 00       	mov    $0x14,%edi
ffff80000010684b:	49 89 df             	mov    %rbx,%r15
ffff80000010684e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106853:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff80000010685a:	ff ff ff 
ffff80000010685d:	48 01 d9             	add    %rbx,%rcx
ffff800000106860:	ff d1                	callq  *%rcx
ffff800000106862:	90                   	nop
ffff800000106863:	5b                   	pop    %rbx
ffff800000106864:	41 5f                	pop    %r15
ffff800000106866:	5d                   	pop    %rbp
ffff800000106867:	c3                   	retq   

ffff800000106868 <page_init>:
ffff800000106868:	55                   	push   %rbp
ffff800000106869:	48 89 e5             	mov    %rsp,%rbp
ffff80000010686c:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010686c <page_init+0x4>
ffff800000106873:	49 bb bc 60 00 00 00 	movabs $0x60bc,%r11
ffff80000010687a:	00 00 00 
ffff80000010687d:	4c 01 d8             	add    %r11,%rax
ffff800000106880:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000106884:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000106888:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010688c:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106890:	48 0b 45 f0          	or     -0x10(%rbp),%rax
ffff800000106894:	48 89 c2             	mov    %rax,%rdx
ffff800000106897:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010689b:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff80000010689f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001068a3:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001068a7:	48 85 c0             	test   %rax,%rax
ffff8000001068aa:	74 10                	je     ffff8000001068bc <page_init+0x54>
ffff8000001068ac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001068b0:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff8000001068b4:	83 e0 10             	and    $0x10,%eax
ffff8000001068b7:	48 85 c0             	test   %rax,%rax
ffff8000001068ba:	74 27                	je     ffff8000001068e3 <page_init+0x7b>
ffff8000001068bc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001068c0:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001068c4:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001068c8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001068cc:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff8000001068d0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001068d4:	48 8b 00             	mov    (%rax),%rax
ffff8000001068d7:	48 8b 50 48          	mov    0x48(%rax),%rdx
ffff8000001068db:	48 83 c2 01          	add    $0x1,%rdx
ffff8000001068df:	48 89 50 48          	mov    %rdx,0x48(%rax)
ffff8000001068e3:	b8 01 00 00 00       	mov    $0x1,%eax
ffff8000001068e8:	5d                   	pop    %rbp
ffff8000001068e9:	c3                   	retq   

ffff8000001068ea <page_clean>:
ffff8000001068ea:	55                   	push   %rbp
ffff8000001068eb:	48 89 e5             	mov    %rsp,%rbp
ffff8000001068ee:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff8000001068ee <page_clean+0x4>
ffff8000001068f5:	49 bb 3a 60 00 00 00 	movabs $0x603a,%r11
ffff8000001068fc:	00 00 00 
ffff8000001068ff:	4c 01 d8             	add    %r11,%rax
ffff800000106902:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000106906:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010690a:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff80000010690e:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff800000106912:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106916:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff80000010691a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010691e:	48 8b 00             	mov    (%rax),%rax
ffff800000106921:	48 8b 50 48          	mov    0x48(%rax),%rdx
ffff800000106925:	48 83 ea 01          	sub    $0x1,%rdx
ffff800000106929:	48 89 50 48          	mov    %rdx,0x48(%rax)
ffff80000010692d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106931:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000106935:	48 85 c0             	test   %rax,%rax
ffff800000106938:	75 16                	jne    ffff800000106950 <page_clean+0x66>
ffff80000010693a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010693e:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106942:	83 e0 01             	and    $0x1,%eax
ffff800000106945:	48 89 c2             	mov    %rax,%rdx
ffff800000106948:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010694c:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000106950:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000106955:	5d                   	pop    %rbp
ffff800000106956:	c3                   	retq   

ffff800000106957 <get_page_attribute>:
ffff800000106957:	55                   	push   %rbp
ffff800000106958:	48 89 e5             	mov    %rsp,%rbp
ffff80000010695b:	41 57                	push   %r15
ffff80000010695d:	48 83 ec 18          	sub    $0x18,%rsp
ffff800000106961:	48 8d 0d f9 ff ff ff 	lea    -0x7(%rip),%rcx        # ffff800000106961 <get_page_attribute+0xa>
ffff800000106968:	49 bb c7 5f 00 00 00 	movabs $0x5fc7,%r11
ffff80000010696f:	00 00 00 
ffff800000106972:	4c 01 d9             	add    %r11,%rcx
ffff800000106975:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000106979:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
ffff80000010697e:	75 37                	jne    ffff8000001069b7 <get_page_attribute+0x60>
ffff800000106980:	48 b8 10 17 00 00 00 	movabs $0x1710,%rax
ffff800000106987:	00 00 00 
ffff80000010698a:	48 8d 14 01          	lea    (%rcx,%rax,1),%rdx
ffff80000010698e:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106993:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106998:	49 89 cf             	mov    %rcx,%r15
ffff80000010699b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001069a0:	49 b8 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r8
ffff8000001069a7:	ff ff ff 
ffff8000001069aa:	49 01 c8             	add    %rcx,%r8
ffff8000001069ad:	41 ff d0             	callq  *%r8
ffff8000001069b0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001069b5:	eb 08                	jmp    ffff8000001069bf <get_page_attribute+0x68>
ffff8000001069b7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001069bb:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff8000001069bf:	48 83 c4 18          	add    $0x18,%rsp
ffff8000001069c3:	41 5f                	pop    %r15
ffff8000001069c5:	5d                   	pop    %rbp
ffff8000001069c6:	c3                   	retq   

ffff8000001069c7 <set_page_attribute>:
ffff8000001069c7:	55                   	push   %rbp
ffff8000001069c8:	48 89 e5             	mov    %rsp,%rbp
ffff8000001069cb:	41 57                	push   %r15
ffff8000001069cd:	48 83 ec 18          	sub    $0x18,%rsp
ffff8000001069d1:	48 8d 0d f9 ff ff ff 	lea    -0x7(%rip),%rcx        # ffff8000001069d1 <set_page_attribute+0xa>
ffff8000001069d8:	49 bb 57 5f 00 00 00 	movabs $0x5f57,%r11
ffff8000001069df:	00 00 00 
ffff8000001069e2:	4c 01 d9             	add    %r11,%rcx
ffff8000001069e5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff8000001069e9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
ffff8000001069ed:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
ffff8000001069f2:	75 37                	jne    ffff800000106a2b <set_page_attribute+0x64>
ffff8000001069f4:	48 b8 30 17 00 00 00 	movabs $0x1730,%rax
ffff8000001069fb:	00 00 00 
ffff8000001069fe:	48 8d 14 01          	lea    (%rcx,%rax,1),%rdx
ffff800000106a02:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106a07:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106a0c:	49 89 cf             	mov    %rcx,%r15
ffff800000106a0f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106a14:	49 b8 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r8
ffff800000106a1b:	ff ff ff 
ffff800000106a1e:	49 01 c8             	add    %rcx,%r8
ffff800000106a21:	41 ff d0             	callq  *%r8
ffff800000106a24:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106a29:	eb 11                	jmp    ffff800000106a3c <set_page_attribute+0x75>
ffff800000106a2b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106a2f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
ffff800000106a33:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000106a37:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000106a3c:	48 83 c4 18          	add    $0x18,%rsp
ffff800000106a40:	41 5f                	pop    %r15
ffff800000106a42:	5d                   	pop    %rbp
ffff800000106a43:	c3                   	retq   

ffff800000106a44 <init_mem>:
ffff800000106a44:	55                   	push   %rbp
ffff800000106a45:	48 89 e5             	mov    %rsp,%rbp
ffff800000106a48:	41 57                	push   %r15
ffff800000106a4a:	53                   	push   %rbx
ffff800000106a4b:	48 83 ec 70          	sub    $0x70,%rsp
ffff800000106a4f:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000106a4f <init_mem+0xb>
ffff800000106a56:	49 bb d9 5e 00 00 00 	movabs $0x5ed9,%r11
ffff800000106a5d:	00 00 00 
ffff800000106a60:	4c 01 db             	add    %r11,%rbx
ffff800000106a63:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000106a6a:	00 
ffff800000106a6b:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
ffff800000106a72:	00 
ffff800000106a73:	48 b8 50 17 00 00 00 	movabs $0x1750,%rax
ffff800000106a7a:	00 00 00 
ffff800000106a7d:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106a81:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106a86:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000106a8b:	49 89 df             	mov    %rbx,%r15
ffff800000106a8e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106a93:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff800000106a9a:	ff ff ff 
ffff800000106a9d:	48 01 d9             	add    %rbx,%rcx
ffff800000106aa0:	ff d1                	callq  *%rcx
ffff800000106aa2:	48 b8 00 7e 00 00 00 	movabs $0xffff800000007e00,%rax
ffff800000106aa9:	80 ff ff 
ffff800000106aac:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff800000106ab0:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
ffff800000106ab7:	e9 44 01 00 00       	jmpq   ffff800000106c00 <init_mem+0x1bc>
ffff800000106abc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106ac0:	8b 48 10             	mov    0x10(%rax),%ecx
ffff800000106ac3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106ac7:	48 8b 50 08          	mov    0x8(%rax),%rdx
ffff800000106acb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106acf:	48 8b 00             	mov    (%rax),%rax
ffff800000106ad2:	41 89 c9             	mov    %ecx,%r9d
ffff800000106ad5:	49 89 d0             	mov    %rdx,%r8
ffff800000106ad8:	48 89 c1             	mov    %rax,%rcx
ffff800000106adb:	48 b8 75 17 00 00 00 	movabs $0x1775,%rax
ffff800000106ae2:	00 00 00 
ffff800000106ae5:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106ae9:	be 00 ff 00 00       	mov    $0xff00,%esi
ffff800000106aee:	bf ff 00 00 00       	mov    $0xff,%edi
ffff800000106af3:	49 89 df             	mov    %rbx,%r15
ffff800000106af6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106afb:	49 ba e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r10
ffff800000106b02:	ff ff ff 
ffff800000106b05:	49 01 da             	add    %rbx,%r10
ffff800000106b08:	41 ff d2             	callq  *%r10
ffff800000106b0b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106b0f:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000106b12:	83 f8 01             	cmp    $0x1,%eax
ffff800000106b15:	75 0c                	jne    ffff800000106b23 <init_mem+0xdf>
ffff800000106b17:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106b1b:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106b1f:	48 01 45 e8          	add    %rax,-0x18(%rbp)
ffff800000106b23:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106b27:	48 8b 08             	mov    (%rax),%rcx
ffff800000106b2a:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106b31:	ff ff ff 
ffff800000106b34:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000106b38:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000106b3b:	48 63 d0             	movslq %eax,%rdx
ffff800000106b3e:	48 89 d0             	mov    %rdx,%rax
ffff800000106b41:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106b45:	48 01 d0             	add    %rdx,%rax
ffff800000106b48:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106b4c:	48 01 f0             	add    %rsi,%rax
ffff800000106b4f:	48 89 08             	mov    %rcx,(%rax)
ffff800000106b52:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106b56:	48 8b 48 08          	mov    0x8(%rax),%rcx
ffff800000106b5a:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106b61:	ff ff ff 
ffff800000106b64:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000106b68:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000106b6b:	48 63 d0             	movslq %eax,%rdx
ffff800000106b6e:	48 89 d0             	mov    %rdx,%rax
ffff800000106b71:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106b75:	48 01 d0             	add    %rdx,%rax
ffff800000106b78:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106b7c:	48 01 f0             	add    %rsi,%rax
ffff800000106b7f:	48 83 c0 08          	add    $0x8,%rax
ffff800000106b83:	48 89 08             	mov    %rcx,(%rax)
ffff800000106b86:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106b8a:	8b 48 10             	mov    0x10(%rax),%ecx
ffff800000106b8d:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106b94:	ff ff ff 
ffff800000106b97:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000106b9b:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000106b9e:	48 63 d0             	movslq %eax,%rdx
ffff800000106ba1:	48 89 d0             	mov    %rdx,%rax
ffff800000106ba4:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106ba8:	48 01 d0             	add    %rdx,%rax
ffff800000106bab:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106baf:	48 01 f0             	add    %rsi,%rax
ffff800000106bb2:	48 83 c0 10          	add    $0x10,%rax
ffff800000106bb6:	89 08                	mov    %ecx,(%rax)
ffff800000106bb8:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000106bbb:	48 63 d0             	movslq %eax,%rdx
ffff800000106bbe:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106bc5:	ff ff ff 
ffff800000106bc8:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106bcc:	48 89 90 80 02 00 00 	mov    %rdx,0x280(%rax)
ffff800000106bd3:	48 83 45 e0 14       	addq   $0x14,-0x20(%rbp)
ffff800000106bd8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106bdc:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000106bdf:	83 f8 04             	cmp    $0x4,%eax
ffff800000106be2:	77 26                	ja     ffff800000106c0a <init_mem+0x1c6>
ffff800000106be4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106be8:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106bec:	48 85 c0             	test   %rax,%rax
ffff800000106bef:	74 19                	je     ffff800000106c0a <init_mem+0x1c6>
ffff800000106bf1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106bf5:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000106bf8:	85 c0                	test   %eax,%eax
ffff800000106bfa:	74 0e                	je     ffff800000106c0a <init_mem+0x1c6>
ffff800000106bfc:	83 45 dc 01          	addl   $0x1,-0x24(%rbp)
ffff800000106c00:	83 7d dc 1f          	cmpl   $0x1f,-0x24(%rbp)
ffff800000106c04:	0f 8e b2 fe ff ff    	jle    ffff800000106abc <init_mem+0x78>
ffff800000106c0a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106c0e:	48 89 c1             	mov    %rax,%rcx
ffff800000106c11:	48 b8 93 17 00 00 00 	movabs $0x1793,%rax
ffff800000106c18:	00 00 00 
ffff800000106c1b:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106c1f:	be ff 00 80 00       	mov    $0x8000ff,%esi
ffff800000106c24:	bf 00 ff ff 00       	mov    $0xffff00,%edi
ffff800000106c29:	49 89 df             	mov    %rbx,%r15
ffff800000106c2c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106c31:	49 b8 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r8
ffff800000106c38:	ff ff ff 
ffff800000106c3b:	49 01 d8             	add    %rbx,%r8
ffff800000106c3e:	41 ff d0             	callq  *%r8
ffff800000106c41:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000106c48:	00 
ffff800000106c49:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
ffff800000106c50:	e9 f1 00 00 00       	jmpq   ffff800000106d46 <init_mem+0x302>
ffff800000106c55:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106c5c:	ff ff ff 
ffff800000106c5f:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000106c63:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000106c66:	48 63 d0             	movslq %eax,%rdx
ffff800000106c69:	48 89 d0             	mov    %rdx,%rax
ffff800000106c6c:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106c70:	48 01 d0             	add    %rdx,%rax
ffff800000106c73:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106c77:	48 01 c8             	add    %rcx,%rax
ffff800000106c7a:	48 83 c0 10          	add    $0x10,%rax
ffff800000106c7e:	8b 00                	mov    (%rax),%eax
ffff800000106c80:	83 f8 01             	cmp    $0x1,%eax
ffff800000106c83:	0f 85 b5 00 00 00    	jne    ffff800000106d3e <init_mem+0x2fa>
ffff800000106c89:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106c90:	ff ff ff 
ffff800000106c93:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000106c97:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000106c9a:	48 63 d0             	movslq %eax,%rdx
ffff800000106c9d:	48 89 d0             	mov    %rdx,%rax
ffff800000106ca0:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106ca4:	48 01 d0             	add    %rdx,%rax
ffff800000106ca7:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106cab:	48 01 c8             	add    %rcx,%rax
ffff800000106cae:	48 8b 00             	mov    (%rax),%rax
ffff800000106cb1:	48 05 ff ff 1f 00    	add    $0x1fffff,%rax
ffff800000106cb7:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff800000106cbd:	48 89 45 90          	mov    %rax,-0x70(%rbp)
ffff800000106cc1:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106cc8:	ff ff ff 
ffff800000106ccb:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000106ccf:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000106cd2:	48 63 d0             	movslq %eax,%rdx
ffff800000106cd5:	48 89 d0             	mov    %rdx,%rax
ffff800000106cd8:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106cdc:	48 01 d0             	add    %rdx,%rax
ffff800000106cdf:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106ce3:	48 01 c8             	add    %rcx,%rax
ffff800000106ce6:	48 8b 08             	mov    (%rax),%rcx
ffff800000106ce9:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106cf0:	ff ff ff 
ffff800000106cf3:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000106cf7:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000106cfa:	48 63 d0             	movslq %eax,%rdx
ffff800000106cfd:	48 89 d0             	mov    %rdx,%rax
ffff800000106d00:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106d04:	48 01 d0             	add    %rdx,%rax
ffff800000106d07:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106d0b:	48 01 f0             	add    %rsi,%rax
ffff800000106d0e:	48 83 c0 08          	add    $0x8,%rax
ffff800000106d12:	48 8b 00             	mov    (%rax),%rax
ffff800000106d15:	48 01 c8             	add    %rcx,%rax
ffff800000106d18:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff800000106d1e:	48 89 45 88          	mov    %rax,-0x78(%rbp)
ffff800000106d22:	48 8b 45 90          	mov    -0x70(%rbp),%rax
ffff800000106d26:	48 3b 45 88          	cmp    -0x78(%rbp),%rax
ffff800000106d2a:	73 15                	jae    ffff800000106d41 <init_mem+0x2fd>
ffff800000106d2c:	48 8b 45 88          	mov    -0x78(%rbp),%rax
ffff800000106d30:	48 2b 45 90          	sub    -0x70(%rbp),%rax
ffff800000106d34:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106d38:	48 01 45 e8          	add    %rax,-0x18(%rbp)
ffff800000106d3c:	eb 04                	jmp    ffff800000106d42 <init_mem+0x2fe>
ffff800000106d3e:	90                   	nop
ffff800000106d3f:	eb 01                	jmp    ffff800000106d42 <init_mem+0x2fe>
ffff800000106d41:	90                   	nop
ffff800000106d42:	83 45 d8 01          	addl   $0x1,-0x28(%rbp)
ffff800000106d46:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000106d49:	48 63 d0             	movslq %eax,%rdx
ffff800000106d4c:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106d53:	ff ff ff 
ffff800000106d56:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106d5a:	48 8b 80 80 02 00 00 	mov    0x280(%rax),%rax
ffff800000106d61:	48 39 c2             	cmp    %rax,%rdx
ffff800000106d64:	0f 82 eb fe ff ff    	jb     ffff800000106c55 <init_mem+0x211>
ffff800000106d6a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106d6e:	48 89 c1             	mov    %rax,%rcx
ffff800000106d71:	48 b8 a9 17 00 00 00 	movabs $0x17a9,%rax
ffff800000106d78:	00 00 00 
ffff800000106d7b:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106d7f:	be ff ff 00 00       	mov    $0xffff,%esi
ffff800000106d84:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106d89:	49 89 df             	mov    %rbx,%r15
ffff800000106d8c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106d91:	49 b8 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r8
ffff800000106d98:	ff ff ff 
ffff800000106d9b:	49 01 d8             	add    %rbx,%r8
ffff800000106d9e:	41 ff d0             	callq  *%r8
ffff800000106da1:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106da8:	ff ff ff 
ffff800000106dab:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106daf:	48 8b 90 80 02 00 00 	mov    0x280(%rax),%rdx
ffff800000106db6:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106dbd:	ff ff ff 
ffff800000106dc0:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000106dc4:	48 89 d0             	mov    %rdx,%rax
ffff800000106dc7:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106dcb:	48 01 d0             	add    %rdx,%rax
ffff800000106dce:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106dd2:	48 01 c8             	add    %rcx,%rax
ffff800000106dd5:	48 8b 08             	mov    (%rax),%rcx
ffff800000106dd8:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106ddf:	ff ff ff 
ffff800000106de2:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106de6:	48 8b 90 80 02 00 00 	mov    0x280(%rax),%rdx
ffff800000106ded:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106df4:	ff ff ff 
ffff800000106df7:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000106dfb:	48 89 d0             	mov    %rdx,%rax
ffff800000106dfe:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106e02:	48 01 d0             	add    %rdx,%rax
ffff800000106e05:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106e09:	48 01 f0             	add    %rsi,%rax
ffff800000106e0c:	48 83 c0 08          	add    $0x8,%rax
ffff800000106e10:	48 8b 00             	mov    (%rax),%rax
ffff800000106e13:	48 01 c8             	add    %rcx,%rax
ffff800000106e16:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000106e1a:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106e21:	ff ff ff 
ffff800000106e24:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106e28:	48 8b 80 e8 02 00 00 	mov    0x2e8(%rax),%rax
ffff800000106e2f:	48 05 ff 0f 00 00    	add    $0xfff,%rax
ffff800000106e35:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffff800000106e3b:	48 89 c2             	mov    %rax,%rdx
ffff800000106e3e:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106e45:	ff ff ff 
ffff800000106e48:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106e4c:	48 89 90 88 02 00 00 	mov    %rdx,0x288(%rax)
ffff800000106e53:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106e57:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106e5b:	48 89 c2             	mov    %rax,%rdx
ffff800000106e5e:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106e65:	ff ff ff 
ffff800000106e68:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106e6c:	48 89 90 90 02 00 00 	mov    %rdx,0x290(%rax)
ffff800000106e73:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106e77:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106e7b:	48 83 c0 3f          	add    $0x3f,%rax
ffff800000106e7f:	48 c1 e8 03          	shr    $0x3,%rax
ffff800000106e83:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff800000106e87:	48 89 c2             	mov    %rax,%rdx
ffff800000106e8a:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106e91:	ff ff ff 
ffff800000106e94:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106e98:	48 89 90 98 02 00 00 	mov    %rdx,0x298(%rax)
ffff800000106e9f:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106ea6:	ff ff ff 
ffff800000106ea9:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106ead:	48 8b 80 98 02 00 00 	mov    0x298(%rax),%rax
ffff800000106eb4:	48 89 c2             	mov    %rax,%rdx
ffff800000106eb7:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106ebe:	ff ff ff 
ffff800000106ec1:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106ec5:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff800000106ecc:	be ff 00 00 00       	mov    $0xff,%esi
ffff800000106ed1:	48 89 c7             	mov    %rax,%rdi
ffff800000106ed4:	49 89 df             	mov    %rbx,%r15
ffff800000106ed7:	48 b8 f4 b3 ff ff ff 	movabs $0xffffffffffffb3f4,%rax
ffff800000106ede:	ff ff ff 
ffff800000106ee1:	48 01 d8             	add    %rbx,%rax
ffff800000106ee4:	ff d0                	callq  *%rax
ffff800000106ee6:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106eed:	ff ff ff 
ffff800000106ef0:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106ef4:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000106efb:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106f02:	ff ff ff 
ffff800000106f05:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106f09:	48 8b 80 98 02 00 00 	mov    0x298(%rax),%rax
ffff800000106f10:	48 05 00 10 00 00    	add    $0x1000,%rax
ffff800000106f16:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106f1a:	48 83 e8 08          	sub    $0x8,%rax
ffff800000106f1e:	48 01 d0             	add    %rdx,%rax
ffff800000106f21:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffff800000106f27:	48 89 c2             	mov    %rax,%rdx
ffff800000106f2a:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106f31:	ff ff ff 
ffff800000106f34:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106f38:	48 89 90 a0 02 00 00 	mov    %rdx,0x2a0(%rax)
ffff800000106f3f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106f43:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106f47:	48 89 c2             	mov    %rax,%rdx
ffff800000106f4a:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106f51:	ff ff ff 
ffff800000106f54:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106f58:	48 89 90 a8 02 00 00 	mov    %rdx,0x2a8(%rax)
ffff800000106f5f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106f63:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106f67:	48 89 c2             	mov    %rax,%rdx
ffff800000106f6a:	48 89 d0             	mov    %rdx,%rax
ffff800000106f6d:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f71:	48 01 d0             	add    %rdx,%rax
ffff800000106f74:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106f78:	48 83 c0 07          	add    $0x7,%rax
ffff800000106f7c:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff800000106f80:	48 89 c2             	mov    %rax,%rdx
ffff800000106f83:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106f8a:	ff ff ff 
ffff800000106f8d:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106f91:	48 89 90 b0 02 00 00 	mov    %rdx,0x2b0(%rax)
ffff800000106f98:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106f9f:	ff ff ff 
ffff800000106fa2:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106fa6:	48 8b 80 b0 02 00 00 	mov    0x2b0(%rax),%rax
ffff800000106fad:	48 89 c2             	mov    %rax,%rdx
ffff800000106fb0:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106fb7:	ff ff ff 
ffff800000106fba:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106fbe:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000106fc5:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106fca:	48 89 c7             	mov    %rax,%rdi
ffff800000106fcd:	49 89 df             	mov    %rbx,%r15
ffff800000106fd0:	48 b8 f4 b3 ff ff ff 	movabs $0xffffffffffffb3f4,%rax
ffff800000106fd7:	ff ff ff 
ffff800000106fda:	48 01 d8             	add    %rbx,%rax
ffff800000106fdd:	ff d0                	callq  *%rax
ffff800000106fdf:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106fe6:	ff ff ff 
ffff800000106fe9:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106fed:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000106ff4:	48 89 c2             	mov    %rax,%rdx
ffff800000106ff7:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106ffe:	ff ff ff 
ffff800000107001:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107005:	48 8b 80 b0 02 00 00 	mov    0x2b0(%rax),%rax
ffff80000010700c:	48 01 d0             	add    %rdx,%rax
ffff80000010700f:	48 05 ff 0f 00 00    	add    $0xfff,%rax
ffff800000107015:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffff80000010701b:	48 89 c2             	mov    %rax,%rdx
ffff80000010701e:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107025:	ff ff ff 
ffff800000107028:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010702c:	48 89 90 b8 02 00 00 	mov    %rdx,0x2b8(%rax)
ffff800000107033:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010703a:	ff ff ff 
ffff80000010703d:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107041:	48 c7 80 c8 02 00 00 	movq   $0x0,0x2c8(%rax)
ffff800000107048:	00 00 00 00 
ffff80000010704c:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107053:	ff ff ff 
ffff800000107056:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010705a:	48 c7 80 c0 02 00 00 	movq   $0x190,0x2c0(%rax)
ffff800000107061:	90 01 00 00 
ffff800000107065:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010706c:	ff ff ff 
ffff80000010706f:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107073:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
ffff80000010707a:	48 89 c2             	mov    %rax,%rdx
ffff80000010707d:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107084:	ff ff ff 
ffff800000107087:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010708b:	48 8b 80 b8 02 00 00 	mov    0x2b8(%rax),%rax
ffff800000107092:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107097:	48 89 c7             	mov    %rax,%rdi
ffff80000010709a:	49 89 df             	mov    %rbx,%r15
ffff80000010709d:	48 b8 f4 b3 ff ff ff 	movabs $0xffffffffffffb3f4,%rax
ffff8000001070a4:	ff ff ff 
ffff8000001070a7:	48 01 d8             	add    %rbx,%rax
ffff8000001070aa:	ff d0                	callq  *%rax
ffff8000001070ac:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
ffff8000001070b3:	e9 11 03 00 00       	jmpq   ffff8000001073c9 <init_mem+0x985>
ffff8000001070b8:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001070bf:	ff ff ff 
ffff8000001070c2:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff8000001070c6:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff8000001070c9:	48 63 d0             	movslq %eax,%rdx
ffff8000001070cc:	48 89 d0             	mov    %rdx,%rax
ffff8000001070cf:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001070d3:	48 01 d0             	add    %rdx,%rax
ffff8000001070d6:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001070da:	48 01 c8             	add    %rcx,%rax
ffff8000001070dd:	48 83 c0 10          	add    $0x10,%rax
ffff8000001070e1:	8b 00                	mov    (%rax),%eax
ffff8000001070e3:	83 f8 01             	cmp    $0x1,%eax
ffff8000001070e6:	0f 85 d5 02 00 00    	jne    ffff8000001073c1 <init_mem+0x97d>
ffff8000001070ec:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001070f3:	ff ff ff 
ffff8000001070f6:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff8000001070fa:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff8000001070fd:	48 63 d0             	movslq %eax,%rdx
ffff800000107100:	48 89 d0             	mov    %rdx,%rax
ffff800000107103:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107107:	48 01 d0             	add    %rdx,%rax
ffff80000010710a:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010710e:	48 01 c8             	add    %rcx,%rax
ffff800000107111:	48 8b 00             	mov    (%rax),%rax
ffff800000107114:	48 05 ff ff 1f 00    	add    $0x1fffff,%rax
ffff80000010711a:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff800000107120:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
ffff800000107124:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010712b:	ff ff ff 
ffff80000010712e:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000107132:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff800000107135:	48 63 d0             	movslq %eax,%rdx
ffff800000107138:	48 89 d0             	mov    %rdx,%rax
ffff80000010713b:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010713f:	48 01 d0             	add    %rdx,%rax
ffff800000107142:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107146:	48 01 c8             	add    %rcx,%rax
ffff800000107149:	48 8b 08             	mov    (%rax),%rcx
ffff80000010714c:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107153:	ff ff ff 
ffff800000107156:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff80000010715a:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff80000010715d:	48 63 d0             	movslq %eax,%rdx
ffff800000107160:	48 89 d0             	mov    %rdx,%rax
ffff800000107163:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107167:	48 01 d0             	add    %rdx,%rax
ffff80000010716a:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010716e:	48 01 f0             	add    %rsi,%rax
ffff800000107171:	48 83 c0 08          	add    $0x8,%rax
ffff800000107175:	48 8b 00             	mov    (%rax),%rax
ffff800000107178:	48 01 c8             	add    %rcx,%rax
ffff80000010717b:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff800000107181:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
ffff800000107185:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff800000107189:	48 3b 45 a8          	cmp    -0x58(%rbp),%rax
ffff80000010718d:	0f 86 31 02 00 00    	jbe    ffff8000001073c4 <init_mem+0x980>
ffff800000107193:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010719a:	ff ff ff 
ffff80000010719d:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001071a1:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff8000001071a8:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001071af:	ff ff ff 
ffff8000001071b2:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001071b6:	48 8b 90 c8 02 00 00 	mov    0x2c8(%rax),%rdx
ffff8000001071bd:	48 89 d0             	mov    %rdx,%rax
ffff8000001071c0:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001071c4:	48 01 d0             	add    %rdx,%rax
ffff8000001071c7:	48 c1 e0 04          	shl    $0x4,%rax
ffff8000001071cb:	48 01 c8             	add    %rcx,%rax
ffff8000001071ce:	48 89 45 98          	mov    %rax,-0x68(%rbp)
ffff8000001071d2:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001071d9:	ff ff ff 
ffff8000001071dc:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001071e0:	48 8b 80 c8 02 00 00 	mov    0x2c8(%rax),%rax
ffff8000001071e7:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001071eb:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001071f2:	ff ff ff 
ffff8000001071f5:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001071f9:	48 89 90 c8 02 00 00 	mov    %rdx,0x2c8(%rax)
ffff800000107200:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107204:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000107208:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff80000010720c:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107210:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
ffff800000107214:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff800000107218:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff80000010721c:	48 2b 45 a8          	sub    -0x58(%rbp),%rax
ffff800000107220:	48 89 c2             	mov    %rax,%rdx
ffff800000107223:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107227:	48 89 50 20          	mov    %rdx,0x20(%rax)
ffff80000010722b:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff80000010722f:	48 c7 40 38 00 00 00 	movq   $0x0,0x38(%rax)
ffff800000107236:	00 
ffff800000107237:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff80000010723b:	48 2b 45 a8          	sub    -0x58(%rbp),%rax
ffff80000010723f:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107243:	48 89 c2             	mov    %rax,%rdx
ffff800000107246:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff80000010724a:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff80000010724e:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107252:	48 c7 40 48 00 00 00 	movq   $0x0,0x48(%rax)
ffff800000107259:	00 
ffff80000010725a:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff80000010725e:	48 c7 40 28 00 00 00 	movq   $0x0,0x28(%rax)
ffff800000107265:	00 
ffff800000107266:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff80000010726a:	48 ba d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rdx
ffff800000107271:	ff ff ff 
ffff800000107274:	48 8b 14 13          	mov    (%rbx,%rdx,1),%rdx
ffff800000107278:	48 89 50 30          	mov    %rdx,0x30(%rax)
ffff80000010727c:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff800000107280:	48 2b 45 a8          	sub    -0x58(%rbp),%rax
ffff800000107284:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107288:	48 89 c2             	mov    %rax,%rdx
ffff80000010728b:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff80000010728f:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107293:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010729a:	ff ff ff 
ffff80000010729d:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001072a1:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff8000001072a8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff8000001072ac:	48 c1 e8 15          	shr    $0x15,%rax
ffff8000001072b0:	48 89 c2             	mov    %rax,%rdx
ffff8000001072b3:	48 89 d0             	mov    %rdx,%rax
ffff8000001072b6:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001072ba:	48 01 d0             	add    %rdx,%rax
ffff8000001072bd:	48 c1 e0 03          	shl    $0x3,%rax
ffff8000001072c1:	48 8d 14 01          	lea    (%rcx,%rax,1),%rdx
ffff8000001072c5:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff8000001072c9:	48 89 10             	mov    %rdx,(%rax)
ffff8000001072cc:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff8000001072d0:	48 8b 00             	mov    (%rax),%rax
ffff8000001072d3:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff8000001072d7:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%rbp)
ffff8000001072de:	e9 c5 00 00 00       	jmpq   ffff8000001073a8 <init_mem+0x964>
ffff8000001072e3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001072e7:	48 8b 55 98          	mov    -0x68(%rbp),%rdx
ffff8000001072eb:	48 89 10             	mov    %rdx,(%rax)
ffff8000001072ee:	8b 45 c4             	mov    -0x3c(%rbp),%eax
ffff8000001072f1:	48 98                	cltq   
ffff8000001072f3:	48 c1 e0 15          	shl    $0x15,%rax
ffff8000001072f7:	48 89 c2             	mov    %rax,%rdx
ffff8000001072fa:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff8000001072fe:	48 01 c2             	add    %rax,%rdx
ffff800000107301:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107305:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107309:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010730d:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff800000107314:	00 
ffff800000107315:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107319:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
ffff800000107320:	00 
ffff800000107321:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107325:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
ffff80000010732c:	00 
ffff80000010732d:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107334:	ff ff ff 
ffff800000107337:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010733b:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000107342:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107346:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff80000010734a:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff80000010734e:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107352:	48 01 d0             	add    %rdx,%rax
ffff800000107355:	48 8b 10             	mov    (%rax),%rdx
ffff800000107358:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010735c:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107360:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107364:	83 e0 3f             	and    $0x3f,%eax
ffff800000107367:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010736c:	89 c1                	mov    %eax,%ecx
ffff80000010736e:	48 d3 e6             	shl    %cl,%rsi
ffff800000107371:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107378:	ff ff ff 
ffff80000010737b:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010737f:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
ffff800000107386:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010738a:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff80000010738e:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000107392:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107396:	48 01 c8             	add    %rcx,%rax
ffff800000107399:	48 31 f2             	xor    %rsi,%rdx
ffff80000010739c:	48 89 10             	mov    %rdx,(%rax)
ffff80000010739f:	83 45 c4 01          	addl   $0x1,-0x3c(%rbp)
ffff8000001073a3:	48 83 45 c8 28       	addq   $0x28,-0x38(%rbp)
ffff8000001073a8:	8b 45 c4             	mov    -0x3c(%rbp),%eax
ffff8000001073ab:	48 63 d0             	movslq %eax,%rdx
ffff8000001073ae:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff8000001073b2:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff8000001073b6:	48 39 c2             	cmp    %rax,%rdx
ffff8000001073b9:	0f 82 24 ff ff ff    	jb     ffff8000001072e3 <init_mem+0x89f>
ffff8000001073bf:	eb 04                	jmp    ffff8000001073c5 <init_mem+0x981>
ffff8000001073c1:	90                   	nop
ffff8000001073c2:	eb 01                	jmp    ffff8000001073c5 <init_mem+0x981>
ffff8000001073c4:	90                   	nop
ffff8000001073c5:	83 45 d4 01          	addl   $0x1,-0x2c(%rbp)
ffff8000001073c9:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff8000001073cc:	48 63 d0             	movslq %eax,%rdx
ffff8000001073cf:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001073d6:	ff ff ff 
ffff8000001073d9:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001073dd:	48 8b 80 80 02 00 00 	mov    0x280(%rax),%rax
ffff8000001073e4:	48 39 c2             	cmp    %rax,%rdx
ffff8000001073e7:	0f 82 cb fc ff ff    	jb     ffff8000001070b8 <init_mem+0x674>
ffff8000001073ed:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001073f4:	ff ff ff 
ffff8000001073f7:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001073fb:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000107402:	48 ba d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rdx
ffff800000107409:	ff ff ff 
ffff80000010740c:	48 8b 14 13          	mov    (%rbx,%rdx,1),%rdx
ffff800000107410:	48 8b 92 b8 02 00 00 	mov    0x2b8(%rdx),%rdx
ffff800000107417:	48 89 10             	mov    %rdx,(%rax)
ffff80000010741a:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107421:	ff ff ff 
ffff800000107424:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107428:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff80000010742f:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
ffff800000107436:	00 
ffff800000107437:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010743e:	ff ff ff 
ffff800000107441:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107445:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff80000010744c:	be 83 00 00 00       	mov    $0x83,%esi
ffff800000107451:	48 89 c7             	mov    %rax,%rdi
ffff800000107454:	48 b8 9f a0 ff ff ff 	movabs $0xffffffffffffa09f,%rax
ffff80000010745b:	ff ff ff 
ffff80000010745e:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000107462:	ff d0                	callq  *%rax
ffff800000107464:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010746b:	ff ff ff 
ffff80000010746e:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107472:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000107479:	48 c7 40 18 01 00 00 	movq   $0x1,0x18(%rax)
ffff800000107480:	00 
ffff800000107481:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107488:	ff ff ff 
ffff80000010748b:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010748f:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000107496:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
ffff80000010749d:	00 
ffff80000010749e:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001074a5:	ff ff ff 
ffff8000001074a8:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001074ac:	48 8b 90 c8 02 00 00 	mov    0x2c8(%rax),%rdx
ffff8000001074b3:	48 89 d0             	mov    %rdx,%rax
ffff8000001074b6:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001074ba:	48 01 d0             	add    %rdx,%rax
ffff8000001074bd:	48 c1 e0 04          	shl    $0x4,%rax
ffff8000001074c1:	48 83 c0 07          	add    $0x7,%rax
ffff8000001074c5:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff8000001074c9:	48 89 c2             	mov    %rax,%rdx
ffff8000001074cc:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001074d3:	ff ff ff 
ffff8000001074d6:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001074da:	48 89 90 c0 02 00 00 	mov    %rdx,0x2c0(%rax)
ffff8000001074e1:	48 b8 d8 36 01 00 00 	movabs $0x136d8,%rax
ffff8000001074e8:	00 00 00 
ffff8000001074eb:	c7 04 03 00 00 00 00 	movl   $0x0,(%rbx,%rax,1)
ffff8000001074f2:	48 b8 dc 36 01 00 00 	movabs $0x136dc,%rax
ffff8000001074f9:	00 00 00 
ffff8000001074fc:	c7 04 03 00 00 00 00 	movl   $0x0,(%rbx,%rax,1)
ffff800000107503:	48 b8 e0 36 01 00 00 	movabs $0x136e0,%rax
ffff80000010750a:	00 00 00 
ffff80000010750d:	c7 04 03 00 00 00 00 	movl   $0x0,(%rbx,%rax,1)
ffff800000107514:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%rbp)
ffff80000010751b:	e9 c8 00 00 00       	jmpq   ffff8000001075e8 <init_mem+0xba4>
ffff800000107520:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107527:	ff ff ff 
ffff80000010752a:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010752e:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff800000107535:	8b 45 c0             	mov    -0x40(%rbp),%eax
ffff800000107538:	48 63 d0             	movslq %eax,%rdx
ffff80000010753b:	48 89 d0             	mov    %rdx,%rax
ffff80000010753e:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107542:	48 01 d0             	add    %rdx,%rax
ffff800000107545:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000107549:	48 01 c8             	add    %rcx,%rax
ffff80000010754c:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff800000107550:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107554:	48 8b 70 08          	mov    0x8(%rax),%rsi
ffff800000107558:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff80000010755c:	48 8b 08             	mov    (%rax),%rcx
ffff80000010755f:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107563:	48 8b 50 20          	mov    0x20(%rax),%rdx
ffff800000107567:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff80000010756b:	4c 8b 40 18          	mov    0x18(%rax),%r8
ffff80000010756f:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107573:	48 8b 78 10          	mov    0x10(%rax),%rdi
ffff800000107577:	8b 45 c0             	mov    -0x40(%rbp),%eax
ffff80000010757a:	48 83 ec 08          	sub    $0x8,%rsp
ffff80000010757e:	56                   	push   %rsi
ffff80000010757f:	51                   	push   %rcx
ffff800000107580:	52                   	push   %rdx
ffff800000107581:	4d 89 c1             	mov    %r8,%r9
ffff800000107584:	49 89 f8             	mov    %rdi,%r8
ffff800000107587:	89 c1                	mov    %eax,%ecx
ffff800000107589:	48 b8 c8 17 00 00 00 	movabs $0x17c8,%rax
ffff800000107590:	00 00 00 
ffff800000107593:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000107597:	be 00 80 ff 00       	mov    $0xff8000,%esi
ffff80000010759c:	bf 00 ff 00 00       	mov    $0xff00,%edi
ffff8000001075a1:	49 89 df             	mov    %rbx,%r15
ffff8000001075a4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001075a9:	49 ba e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r10
ffff8000001075b0:	ff ff ff 
ffff8000001075b3:	49 01 da             	add    %rbx,%r10
ffff8000001075b6:	41 ff d2             	callq  *%r10
ffff8000001075b9:	48 83 c4 20          	add    $0x20,%rsp
ffff8000001075bd:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff8000001075c1:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff8000001075c5:	48 b8 00 00 00 00 01 	movabs $0x100000000,%rax
ffff8000001075cc:	00 00 00 
ffff8000001075cf:	48 39 c2             	cmp    %rax,%rdx
ffff8000001075d2:	75 10                	jne    ffff8000001075e4 <init_mem+0xba0>
ffff8000001075d4:	48 b8 e0 36 01 00 00 	movabs $0x136e0,%rax
ffff8000001075db:	00 00 00 
ffff8000001075de:	8b 55 c0             	mov    -0x40(%rbp),%edx
ffff8000001075e1:	89 14 03             	mov    %edx,(%rbx,%rax,1)
ffff8000001075e4:	83 45 c0 01          	addl   $0x1,-0x40(%rbp)
ffff8000001075e8:	8b 45 c0             	mov    -0x40(%rbp),%eax
ffff8000001075eb:	48 63 d0             	movslq %eax,%rdx
ffff8000001075ee:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001075f5:	ff ff ff 
ffff8000001075f8:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001075fc:	48 8b 80 c8 02 00 00 	mov    0x2c8(%rax),%rax
ffff800000107603:	48 39 c2             	cmp    %rax,%rdx
ffff800000107606:	0f 82 14 ff ff ff    	jb     ffff800000107520 <init_mem+0xadc>
ffff80000010760c:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107613:	ff ff ff 
ffff800000107616:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010761a:	48 8b 80 b8 02 00 00 	mov    0x2b8(%rax),%rax
ffff800000107621:	48 89 c2             	mov    %rax,%rdx
ffff800000107624:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010762b:	ff ff ff 
ffff80000010762e:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107632:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
ffff800000107639:	48 01 d0             	add    %rdx,%rax
ffff80000010763c:	48 05 00 01 00 00    	add    $0x100,%rax
ffff800000107642:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff800000107646:	48 89 c2             	mov    %rax,%rdx
ffff800000107649:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107650:	ff ff ff 
ffff800000107653:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107657:	48 89 90 f0 02 00 00 	mov    %rdx,0x2f0(%rax)
ffff80000010765e:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107665:	ff ff ff 
ffff800000107668:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010766c:	48 8b 90 f0 02 00 00 	mov    0x2f0(%rax),%rdx
ffff800000107673:	48 b8 00 00 00 00 00 	movabs $0x800000000000,%rax
ffff80000010767a:	80 00 00 
ffff80000010767d:	48 01 d0             	add    %rdx,%rax
ffff800000107680:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107684:	89 45 c0             	mov    %eax,-0x40(%rbp)
ffff800000107687:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%rbp)
ffff80000010768e:	eb 48                	jmp    ffff8000001076d8 <init_mem+0xc94>
ffff800000107690:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107697:	ff ff ff 
ffff80000010769a:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010769e:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff8000001076a5:	8b 45 bc             	mov    -0x44(%rbp),%eax
ffff8000001076a8:	48 63 d0             	movslq %eax,%rdx
ffff8000001076ab:	48 89 d0             	mov    %rdx,%rax
ffff8000001076ae:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001076b2:	48 01 d0             	add    %rdx,%rax
ffff8000001076b5:	48 c1 e0 03          	shl    $0x3,%rax
ffff8000001076b9:	48 01 c8             	add    %rcx,%rax
ffff8000001076bc:	be 93 00 00 00       	mov    $0x93,%esi
ffff8000001076c1:	48 89 c7             	mov    %rax,%rdi
ffff8000001076c4:	48 b8 40 9f ff ff ff 	movabs $0xffffffffffff9f40,%rax
ffff8000001076cb:	ff ff ff 
ffff8000001076ce:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001076d2:	ff d0                	callq  *%rax
ffff8000001076d4:	83 45 bc 01          	addl   $0x1,-0x44(%rbp)
ffff8000001076d8:	8b 45 bc             	mov    -0x44(%rbp),%eax
ffff8000001076db:	3b 45 c0             	cmp    -0x40(%rbp),%eax
ffff8000001076de:	7c b0                	jl     ffff800000107690 <init_mem+0xc4c>
ffff8000001076e0:	49 89 df             	mov    %rbx,%r15
ffff8000001076e3:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001076e8:	48 ba b5 b4 ff ff ff 	movabs $0xffffffffffffb4b5,%rdx
ffff8000001076ef:	ff ff ff 
ffff8000001076f2:	48 01 da             	add    %rbx,%rdx
ffff8000001076f5:	ff d2                	callq  *%rdx
ffff8000001076f7:	48 89 c2             	mov    %rax,%rdx
ffff8000001076fa:	48 b8 e8 36 01 00 00 	movabs $0x136e8,%rax
ffff800000107701:	00 00 00 
ffff800000107704:	48 89 14 03          	mov    %rdx,(%rbx,%rax,1)
ffff800000107708:	48 b8 e8 36 01 00 00 	movabs $0x136e8,%rax
ffff80000010770f:	00 00 00 
ffff800000107712:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107716:	48 89 c1             	mov    %rax,%rcx
ffff800000107719:	48 b8 24 18 00 00 00 	movabs $0x1824,%rax
ffff800000107720:	00 00 00 
ffff800000107723:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000107727:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010772c:	bf ff ff 00 00       	mov    $0xffff,%edi
ffff800000107731:	49 89 df             	mov    %rbx,%r15
ffff800000107734:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107739:	49 b8 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r8
ffff800000107740:	ff ff ff 
ffff800000107743:	49 01 d8             	add    %rbx,%r8
ffff800000107746:	41 ff d0             	callq  *%r8
ffff800000107749:	48 b8 e8 36 01 00 00 	movabs $0x136e8,%rax
ffff800000107750:	00 00 00 
ffff800000107753:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107757:	48 89 c2             	mov    %rax,%rdx
ffff80000010775a:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff800000107761:	80 ff ff 
ffff800000107764:	48 01 d0             	add    %rdx,%rax
ffff800000107767:	48 8b 00             	mov    (%rax),%rax
ffff80000010776a:	b0 00                	mov    $0x0,%al
ffff80000010776c:	48 89 c1             	mov    %rax,%rcx
ffff80000010776f:	48 b8 33 18 00 00 00 	movabs $0x1833,%rax
ffff800000107776:	00 00 00 
ffff800000107779:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010777d:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107782:	bf ff ff 00 00       	mov    $0xffff,%edi
ffff800000107787:	49 89 df             	mov    %rbx,%r15
ffff80000010778a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010778f:	49 b8 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r8
ffff800000107796:	ff ff ff 
ffff800000107799:	49 01 d8             	add    %rbx,%r8
ffff80000010779c:	41 ff d0             	callq  *%r8
ffff80000010779f:	48 b8 e8 36 01 00 00 	movabs $0x136e8,%rax
ffff8000001077a6:	00 00 00 
ffff8000001077a9:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001077ad:	48 89 c2             	mov    %rax,%rdx
ffff8000001077b0:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff8000001077b7:	80 ff ff 
ffff8000001077ba:	48 01 d0             	add    %rdx,%rax
ffff8000001077bd:	48 8b 00             	mov    (%rax),%rax
ffff8000001077c0:	b0 00                	mov    $0x0,%al
ffff8000001077c2:	48 89 c2             	mov    %rax,%rdx
ffff8000001077c5:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff8000001077cc:	80 ff ff 
ffff8000001077cf:	48 01 d0             	add    %rdx,%rax
ffff8000001077d2:	48 8b 00             	mov    (%rax),%rax
ffff8000001077d5:	b0 00                	mov    $0x0,%al
ffff8000001077d7:	48 89 c1             	mov    %rax,%rcx
ffff8000001077da:	48 b8 43 18 00 00 00 	movabs $0x1843,%rax
ffff8000001077e1:	00 00 00 
ffff8000001077e4:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001077e8:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001077ed:	bf ff 00 80 00       	mov    $0x8000ff,%edi
ffff8000001077f2:	49 89 df             	mov    %rbx,%r15
ffff8000001077f5:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001077fa:	49 b8 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r8
ffff800000107801:	ff ff ff 
ffff800000107804:	49 01 d8             	add    %rbx,%r8
ffff800000107807:	41 ff d0             	callq  *%r8
ffff80000010780a:	90                   	nop
ffff80000010780b:	48 8d 65 f0          	lea    -0x10(%rbp),%rsp
ffff80000010780f:	5b                   	pop    %rbx
ffff800000107810:	41 5f                	pop    %r15
ffff800000107812:	5d                   	pop    %rbp
ffff800000107813:	c3                   	retq   

ffff800000107814 <alloc_pages>:
ffff800000107814:	55                   	push   %rbp
ffff800000107815:	48 89 e5             	mov    %rsp,%rbp
ffff800000107818:	41 57                	push   %r15
ffff80000010781a:	53                   	push   %rbx
ffff80000010781b:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
ffff80000010781f:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff80000010781f <alloc_pages+0xb>
ffff800000107826:	49 bb 09 51 00 00 00 	movabs $0x5109,%r11
ffff80000010782d:	00 00 00 
ffff800000107830:	4c 01 db             	add    %r11,%rbx
ffff800000107833:	89 bd 7c ff ff ff    	mov    %edi,-0x84(%rbp)
ffff800000107839:	89 b5 78 ff ff ff    	mov    %esi,-0x88(%rbp)
ffff80000010783f:	48 89 95 70 ff ff ff 	mov    %rdx,-0x90(%rbp)
ffff800000107846:	48 c7 45 c0 00 00 00 	movq   $0x0,-0x40(%rbp)
ffff80000010784d:	00 
ffff80000010784e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
ffff800000107855:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
ffff80000010785c:	8b 85 7c ff ff ff    	mov    -0x84(%rbp),%eax
ffff800000107862:	83 f8 02             	cmp    $0x2,%eax
ffff800000107865:	74 26                	je     ffff80000010788d <alloc_pages+0x79>
ffff800000107867:	83 f8 04             	cmp    $0x4,%eax
ffff80000010786a:	74 43                	je     ffff8000001078af <alloc_pages+0x9b>
ffff80000010786c:	83 f8 01             	cmp    $0x1,%eax
ffff80000010786f:	75 6b                	jne    ffff8000001078dc <alloc_pages+0xc8>
ffff800000107871:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
ffff800000107878:	48 b8 d8 36 01 00 00 	movabs $0x136d8,%rax
ffff80000010787f:	00 00 00 
ffff800000107882:	8b 04 03             	mov    (%rbx,%rax,1),%eax
ffff800000107885:	89 45 e4             	mov    %eax,-0x1c(%rbp)
ffff800000107888:	e9 88 00 00 00       	jmpq   ffff800000107915 <alloc_pages+0x101>
ffff80000010788d:	48 b8 d8 36 01 00 00 	movabs $0x136d8,%rax
ffff800000107894:	00 00 00 
ffff800000107897:	8b 04 03             	mov    (%rbx,%rax,1),%eax
ffff80000010789a:	89 45 e8             	mov    %eax,-0x18(%rbp)
ffff80000010789d:	48 b8 dc 36 01 00 00 	movabs $0x136dc,%rax
ffff8000001078a4:	00 00 00 
ffff8000001078a7:	8b 04 03             	mov    (%rbx,%rax,1),%eax
ffff8000001078aa:	89 45 e4             	mov    %eax,-0x1c(%rbp)
ffff8000001078ad:	eb 66                	jmp    ffff800000107915 <alloc_pages+0x101>
ffff8000001078af:	48 b8 e0 36 01 00 00 	movabs $0x136e0,%rax
ffff8000001078b6:	00 00 00 
ffff8000001078b9:	8b 04 03             	mov    (%rbx,%rax,1),%eax
ffff8000001078bc:	89 45 e8             	mov    %eax,-0x18(%rbp)
ffff8000001078bf:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001078c6:	ff ff ff 
ffff8000001078c9:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001078cd:	48 8b 80 c8 02 00 00 	mov    0x2c8(%rax),%rax
ffff8000001078d4:	83 e8 01             	sub    $0x1,%eax
ffff8000001078d7:	89 45 e4             	mov    %eax,-0x1c(%rbp)
ffff8000001078da:	eb 39                	jmp    ffff800000107915 <alloc_pages+0x101>
ffff8000001078dc:	48 b8 58 18 00 00 00 	movabs $0x1858,%rax
ffff8000001078e3:	00 00 00 
ffff8000001078e6:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001078ea:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001078ef:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001078f4:	49 89 df             	mov    %rbx,%r15
ffff8000001078f7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001078fc:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff800000107903:	ff ff ff 
ffff800000107906:	48 01 d9             	add    %rbx,%rcx
ffff800000107909:	ff d1                	callq  *%rcx
ffff80000010790b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107910:	e9 88 02 00 00       	jmpq   ffff800000107b9d <alloc_pages+0x389>
ffff800000107915:	8b 45 e8             	mov    -0x18(%rbp),%eax
ffff800000107918:	89 45 ec             	mov    %eax,-0x14(%rbp)
ffff80000010791b:	e9 6c 02 00 00       	jmpq   ffff800000107b8c <alloc_pages+0x378>
ffff800000107920:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107927:	ff ff ff 
ffff80000010792a:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010792e:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff800000107935:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000107938:	48 63 d0             	movslq %eax,%rdx
ffff80000010793b:	48 89 d0             	mov    %rdx,%rax
ffff80000010793e:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107942:	48 01 d0             	add    %rdx,%rax
ffff800000107945:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000107949:	48 01 c8             	add    %rcx,%rax
ffff80000010794c:	48 8b 50 40          	mov    0x40(%rax),%rdx
ffff800000107950:	8b 85 78 ff ff ff    	mov    -0x88(%rbp),%eax
ffff800000107956:	48 98                	cltq   
ffff800000107958:	48 39 c2             	cmp    %rax,%rdx
ffff80000010795b:	0f 82 26 02 00 00    	jb     ffff800000107b87 <alloc_pages+0x373>
ffff800000107961:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107968:	ff ff ff 
ffff80000010796b:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010796f:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff800000107976:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000107979:	48 63 d0             	movslq %eax,%rdx
ffff80000010797c:	48 89 d0             	mov    %rdx,%rax
ffff80000010797f:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107983:	48 01 d0             	add    %rdx,%rax
ffff800000107986:	48 c1 e0 04          	shl    $0x4,%rax
ffff80000010798a:	48 01 c8             	add    %rcx,%rax
ffff80000010798d:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
ffff800000107991:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000107995:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000107999:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010799d:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff8000001079a1:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff8000001079a5:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001079a9:	48 c1 e8 15          	shr    $0x15,%rax
ffff8000001079ad:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
ffff8000001079b1:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff8000001079b5:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff8000001079b9:	48 c1 e8 15          	shr    $0x15,%rax
ffff8000001079bd:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
ffff8000001079c1:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff8000001079c5:	83 e0 3f             	and    $0x3f,%eax
ffff8000001079c8:	ba 40 00 00 00       	mov    $0x40,%edx
ffff8000001079cd:	48 29 c2             	sub    %rax,%rdx
ffff8000001079d0:	48 89 d0             	mov    %rdx,%rax
ffff8000001079d3:	48 89 45 98          	mov    %rax,-0x68(%rbp)
ffff8000001079d7:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff8000001079db:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff8000001079df:	e9 93 01 00 00       	jmpq   ffff800000107b77 <alloc_pages+0x363>
ffff8000001079e4:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001079eb:	ff ff ff 
ffff8000001079ee:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001079f2:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff8000001079f9:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001079fd:	48 c1 ea 06          	shr    $0x6,%rdx
ffff800000107a01:	48 c1 e2 03          	shl    $0x3,%rdx
ffff800000107a05:	48 01 d0             	add    %rdx,%rax
ffff800000107a08:	48 89 45 90          	mov    %rax,-0x70(%rbp)
ffff800000107a0c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107a10:	83 e0 3f             	and    $0x3f,%eax
ffff800000107a13:	48 89 45 88          	mov    %rax,-0x78(%rbp)
ffff800000107a17:	48 8b 45 88          	mov    -0x78(%rbp),%rax
ffff800000107a1b:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff800000107a1f:	e9 25 01 00 00       	jmpq   ffff800000107b49 <alloc_pages+0x335>
ffff800000107a24:	48 8b 45 90          	mov    -0x70(%rbp),%rax
ffff800000107a28:	48 8b 00             	mov    (%rax),%rax
ffff800000107a2b:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
ffff800000107a2f:	89 d1                	mov    %edx,%ecx
ffff800000107a31:	48 d3 e8             	shr    %cl,%rax
ffff800000107a34:	48 89 c6             	mov    %rax,%rsi
ffff800000107a37:	48 8b 45 90          	mov    -0x70(%rbp),%rax
ffff800000107a3b:	48 83 c0 08          	add    $0x8,%rax
ffff800000107a3f:	48 8b 10             	mov    (%rax),%rdx
ffff800000107a42:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000107a46:	b9 40 00 00 00       	mov    $0x40,%ecx
ffff800000107a4b:	29 c1                	sub    %eax,%ecx
ffff800000107a4d:	89 c8                	mov    %ecx,%eax
ffff800000107a4f:	89 c1                	mov    %eax,%ecx
ffff800000107a51:	48 d3 e2             	shl    %cl,%rdx
ffff800000107a54:	48 89 d0             	mov    %rdx,%rax
ffff800000107a57:	48 09 c6             	or     %rax,%rsi
ffff800000107a5a:	48 89 f2             	mov    %rsi,%rdx
ffff800000107a5d:	83 bd 78 ff ff ff 40 	cmpl   $0x40,-0x88(%rbp)
ffff800000107a64:	74 19                	je     ffff800000107a7f <alloc_pages+0x26b>
ffff800000107a66:	8b 85 78 ff ff ff    	mov    -0x88(%rbp),%eax
ffff800000107a6c:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000107a71:	89 c1                	mov    %eax,%ecx
ffff800000107a73:	48 d3 e6             	shl    %cl,%rsi
ffff800000107a76:	48 89 f0             	mov    %rsi,%rax
ffff800000107a79:	48 83 e8 01          	sub    $0x1,%rax
ffff800000107a7d:	eb 07                	jmp    ffff800000107a86 <alloc_pages+0x272>
ffff800000107a7f:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffff800000107a86:	48 21 d0             	and    %rdx,%rax
ffff800000107a89:	48 85 c0             	test   %rax,%rax
ffff800000107a8c:	0f 85 b2 00 00 00    	jne    ffff800000107b44 <alloc_pages+0x330>
ffff800000107a92:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000107a96:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000107a9a:	48 01 d0             	add    %rdx,%rax
ffff800000107a9d:	48 83 e8 01          	sub    $0x1,%rax
ffff800000107aa1:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
ffff800000107aa5:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
ffff800000107aac:	00 
ffff800000107aad:	eb 5b                	jmp    ffff800000107b0a <alloc_pages+0x2f6>
ffff800000107aaf:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107ab6:	ff ff ff 
ffff800000107ab9:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107abd:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff800000107ac4:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
ffff800000107ac8:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107acc:	48 01 c2             	add    %rax,%rdx
ffff800000107acf:	48 89 d0             	mov    %rdx,%rax
ffff800000107ad2:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107ad6:	48 01 d0             	add    %rdx,%rax
ffff800000107ad9:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107add:	48 01 c8             	add    %rcx,%rax
ffff800000107ae0:	48 89 45 80          	mov    %rax,-0x80(%rbp)
ffff800000107ae4:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
ffff800000107aeb:	48 8b 45 80          	mov    -0x80(%rbp),%rax
ffff800000107aef:	48 89 d6             	mov    %rdx,%rsi
ffff800000107af2:	48 89 c7             	mov    %rax,%rdi
ffff800000107af5:	48 b8 40 9f ff ff ff 	movabs $0xffffffffffff9f40,%rax
ffff800000107afc:	ff ff ff 
ffff800000107aff:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000107b03:	ff d0                	callq  *%rax
ffff800000107b05:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
ffff800000107b0a:	8b 85 78 ff ff ff    	mov    -0x88(%rbp),%eax
ffff800000107b10:	48 98                	cltq   
ffff800000107b12:	48 39 45 c8          	cmp    %rax,-0x38(%rbp)
ffff800000107b16:	72 97                	jb     ffff800000107aaf <alloc_pages+0x29b>
ffff800000107b18:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107b1f:	ff ff ff 
ffff800000107b22:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107b26:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff800000107b2d:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
ffff800000107b31:	48 89 d0             	mov    %rdx,%rax
ffff800000107b34:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107b38:	48 01 d0             	add    %rdx,%rax
ffff800000107b3b:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107b3f:	48 01 c8             	add    %rcx,%rax
ffff800000107b42:	eb 59                	jmp    ffff800000107b9d <alloc_pages+0x389>
ffff800000107b44:	48 83 45 d0 01       	addq   $0x1,-0x30(%rbp)
ffff800000107b49:	b8 40 00 00 00       	mov    $0x40,%eax
ffff800000107b4e:	48 2b 45 88          	sub    -0x78(%rbp),%rax
ffff800000107b52:	48 39 45 d0          	cmp    %rax,-0x30(%rbp)
ffff800000107b56:	0f 82 c8 fe ff ff    	jb     ffff800000107a24 <alloc_pages+0x210>
ffff800000107b5c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107b60:	83 e0 3f             	and    $0x3f,%eax
ffff800000107b63:	48 85 c0             	test   %rax,%rax
ffff800000107b66:	74 06                	je     ffff800000107b6e <alloc_pages+0x35a>
ffff800000107b68:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107b6c:	eb 05                	jmp    ffff800000107b73 <alloc_pages+0x35f>
ffff800000107b6e:	b8 40 00 00 00       	mov    $0x40,%eax
ffff800000107b73:	48 01 45 d8          	add    %rax,-0x28(%rbp)
ffff800000107b77:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107b7b:	48 3b 45 a8          	cmp    -0x58(%rbp),%rax
ffff800000107b7f:	0f 86 5f fe ff ff    	jbe    ffff8000001079e4 <alloc_pages+0x1d0>
ffff800000107b85:	eb 01                	jmp    ffff800000107b88 <alloc_pages+0x374>
ffff800000107b87:	90                   	nop
ffff800000107b88:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
ffff800000107b8c:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000107b8f:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
ffff800000107b92:	0f 8e 88 fd ff ff    	jle    ffff800000107920 <alloc_pages+0x10c>
ffff800000107b98:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107b9d:	48 83 ec 80          	sub    $0xffffffffffffff80,%rsp
ffff800000107ba1:	5b                   	pop    %rbx
ffff800000107ba2:	41 5f                	pop    %r15
ffff800000107ba4:	5d                   	pop    %rbp
ffff800000107ba5:	c3                   	retq   

ffff800000107ba6 <free_pages>:
ffff800000107ba6:	55                   	push   %rbp
ffff800000107ba7:	48 89 e5             	mov    %rsp,%rbp
ffff800000107baa:	41 57                	push   %r15
ffff800000107bac:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000107bb0:	4c 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%r8        # ffff800000107bb0 <free_pages+0xa>
ffff800000107bb7:	49 bb 78 4d 00 00 00 	movabs $0x4d78,%r11
ffff800000107bbe:	00 00 00 
ffff800000107bc1:	4d 01 d8             	add    %r11,%r8
ffff800000107bc4:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000107bc8:	89 75 d4             	mov    %esi,-0x2c(%rbp)
ffff800000107bcb:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
ffff800000107bd0:	75 34                	jne    ffff800000107c06 <free_pages+0x60>
ffff800000107bd2:	48 b8 80 18 00 00 00 	movabs $0x1880,%rax
ffff800000107bd9:	00 00 00 
ffff800000107bdc:	49 8d 14 00          	lea    (%r8,%rax,1),%rdx
ffff800000107be0:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107be5:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000107bea:	4d 89 c7             	mov    %r8,%r15
ffff800000107bed:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107bf2:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff800000107bf9:	ff ff ff 
ffff800000107bfc:	4c 01 c1             	add    %r8,%rcx
ffff800000107bff:	ff d1                	callq  *%rcx
ffff800000107c01:	e9 0e 01 00 00       	jmpq   ffff800000107d14 <free_pages+0x16e>
ffff800000107c06:	83 7d d4 3f          	cmpl   $0x3f,-0x2c(%rbp)
ffff800000107c0a:	7f 06                	jg     ffff800000107c12 <free_pages+0x6c>
ffff800000107c0c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
ffff800000107c10:	7f 34                	jg     ffff800000107c46 <free_pages+0xa0>
ffff800000107c12:	48 b8 a8 18 00 00 00 	movabs $0x18a8,%rax
ffff800000107c19:	00 00 00 
ffff800000107c1c:	49 8d 14 00          	lea    (%r8,%rax,1),%rdx
ffff800000107c20:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107c25:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000107c2a:	4d 89 c7             	mov    %r8,%r15
ffff800000107c2d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107c32:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff800000107c39:	ff ff ff 
ffff800000107c3c:	4c 01 c1             	add    %r8,%rcx
ffff800000107c3f:	ff d1                	callq  *%rcx
ffff800000107c41:	e9 ce 00 00 00       	jmpq   ffff800000107d14 <free_pages+0x16e>
ffff800000107c46:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
ffff800000107c4d:	e9 b6 00 00 00       	jmpq   ffff800000107d08 <free_pages+0x162>
ffff800000107c52:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107c59:	ff ff ff 
ffff800000107c5c:	49 8b 04 00          	mov    (%r8,%rax,1),%rax
ffff800000107c60:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000107c67:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107c6b:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107c6f:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000107c73:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107c77:	48 01 d0             	add    %rdx,%rax
ffff800000107c7a:	48 8b 10             	mov    (%rax),%rdx
ffff800000107c7d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107c81:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107c85:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107c89:	83 e0 3f             	and    $0x3f,%eax
ffff800000107c8c:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000107c91:	89 c1                	mov    %eax,%ecx
ffff800000107c93:	48 d3 e6             	shl    %cl,%rsi
ffff800000107c96:	48 89 f0             	mov    %rsi,%rax
ffff800000107c99:	48 f7 d0             	not    %rax
ffff800000107c9c:	48 89 c6             	mov    %rax,%rsi
ffff800000107c9f:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107ca6:	ff ff ff 
ffff800000107ca9:	49 8b 04 00          	mov    (%r8,%rax,1),%rax
ffff800000107cad:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
ffff800000107cb4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107cb8:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107cbc:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000107cc0:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107cc4:	48 01 c8             	add    %rcx,%rax
ffff800000107cc7:	48 21 f2             	and    %rsi,%rdx
ffff800000107cca:	48 89 10             	mov    %rdx,(%rax)
ffff800000107ccd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107cd1:	48 8b 00             	mov    (%rax),%rax
ffff800000107cd4:	48 8b 50 38          	mov    0x38(%rax),%rdx
ffff800000107cd8:	48 83 ea 01          	sub    $0x1,%rdx
ffff800000107cdc:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff800000107ce0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107ce4:	48 8b 00             	mov    (%rax),%rax
ffff800000107ce7:	48 8b 50 40          	mov    0x40(%rax),%rdx
ffff800000107ceb:	48 83 c2 01          	add    $0x1,%rdx
ffff800000107cef:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff800000107cf3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107cf7:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff800000107cfe:	00 
ffff800000107cff:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
ffff800000107d03:	48 83 45 d8 28       	addq   $0x28,-0x28(%rbp)
ffff800000107d08:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000107d0b:	3b 45 d4             	cmp    -0x2c(%rbp),%eax
ffff800000107d0e:	0f 8c 3e ff ff ff    	jl     ffff800000107c52 <free_pages+0xac>
ffff800000107d14:	48 83 c4 28          	add    $0x28,%rsp
ffff800000107d18:	41 5f                	pop    %r15
ffff800000107d1a:	5d                   	pop    %rbp
ffff800000107d1b:	c3                   	retq   

ffff800000107d1c <memset>:
ffff800000107d1c:	55                   	push   %rbp
ffff800000107d1d:	48 89 e5             	mov    %rsp,%rbp
ffff800000107d20:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107d20 <memset+0x4>
ffff800000107d27:	49 bb 08 4c 00 00 00 	movabs $0x4c08,%r11
ffff800000107d2e:	00 00 00 
ffff800000107d31:	4c 01 d8             	add    %r11,%rax
ffff800000107d34:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000107d38:	89 f0                	mov    %esi,%eax
ffff800000107d3a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
ffff800000107d3e:	88 45 e4             	mov    %al,-0x1c(%rbp)
ffff800000107d41:	0f b6 45 e4          	movzbl -0x1c(%rbp),%eax
ffff800000107d45:	88 45 f7             	mov    %al,-0x9(%rbp)
ffff800000107d48:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107d4c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000107d50:	eb 14                	jmp    ffff800000107d66 <memset+0x4a>
ffff800000107d52:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107d56:	0f b6 55 f7          	movzbl -0x9(%rbp),%edx
ffff800000107d5a:	88 10                	mov    %dl,(%rax)
ffff800000107d5c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
ffff800000107d61:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
ffff800000107d66:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
ffff800000107d6b:	7f e5                	jg     ffff800000107d52 <memset+0x36>
ffff800000107d6d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107d71:	5d                   	pop    %rbp
ffff800000107d72:	c3                   	retq   

ffff800000107d73 <memcpy>:
ffff800000107d73:	55                   	push   %rbp
ffff800000107d74:	48 89 e5             	mov    %rsp,%rbp
ffff800000107d77:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107d77 <memcpy+0x4>
ffff800000107d7e:	49 bb b1 4b 00 00 00 	movabs $0x4bb1,%r11
ffff800000107d85:	00 00 00 
ffff800000107d88:	4c 01 d8             	add    %r11,%rax
ffff800000107d8b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000107d8f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
ffff800000107d93:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
ffff800000107d97:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107d9b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000107d9f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107da3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff800000107da7:	eb 1d                	jmp    ffff800000107dc6 <memcpy+0x53>
ffff800000107da9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000107dad:	48 8d 42 01          	lea    0x1(%rdx),%rax
ffff800000107db1:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff800000107db5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107db9:	48 8d 48 01          	lea    0x1(%rax),%rcx
ffff800000107dbd:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
ffff800000107dc1:	0f b6 12             	movzbl (%rdx),%edx
ffff800000107dc4:	88 10                	mov    %dl,(%rax)
ffff800000107dc6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107dca:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff800000107dce:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
ffff800000107dd2:	48 85 c0             	test   %rax,%rax
ffff800000107dd5:	75 d2                	jne    ffff800000107da9 <memcpy+0x36>
ffff800000107dd7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107ddb:	5d                   	pop    %rbp
ffff800000107ddc:	c3                   	retq   

ffff800000107ddd <Get_gdt>:
ffff800000107ddd:	55                   	push   %rbp
ffff800000107dde:	48 89 e5             	mov    %rsp,%rbp
ffff800000107de1:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107de1 <Get_gdt+0x4>
ffff800000107de8:	49 bb 47 4b 00 00 00 	movabs $0x4b47,%r11
ffff800000107def:	00 00 00 
ffff800000107df2:	4c 01 d8             	add    %r11,%rax
ffff800000107df5:	0f 20 d8             	mov    %cr3,%rax
ffff800000107df8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000107dfc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107e00:	5d                   	pop    %rbp
ffff800000107e01:	c3                   	retq   

ffff800000107e02 <flush_tlb>:
ffff800000107e02:	55                   	push   %rbp
ffff800000107e03:	48 89 e5             	mov    %rsp,%rbp
ffff800000107e06:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107e06 <flush_tlb+0x4>
ffff800000107e0d:	49 bb 22 4b 00 00 00 	movabs $0x4b22,%r11
ffff800000107e14:	00 00 00 
ffff800000107e17:	4c 01 d8             	add    %r11,%rax
ffff800000107e1a:	0f 20 d8             	mov    %cr3,%rax
ffff800000107e1d:	0f 22 d8             	mov    %rax,%cr3
ffff800000107e20:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000107e24:	90                   	nop
ffff800000107e25:	5d                   	pop    %rbp
ffff800000107e26:	c3                   	retq   

ffff800000107e27 <io_out8>:
ffff800000107e27:	55                   	push   %rbp
ffff800000107e28:	48 89 e5             	mov    %rsp,%rbp
ffff800000107e2b:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107e2b <io_out8+0x4>
ffff800000107e32:	49 bb fd 4a 00 00 00 	movabs $0x4afd,%r11
ffff800000107e39:	00 00 00 
ffff800000107e3c:	4c 01 d8             	add    %r11,%rax
ffff800000107e3f:	89 fa                	mov    %edi,%edx
ffff800000107e41:	89 f0                	mov    %esi,%eax
ffff800000107e43:	66 89 55 fc          	mov    %dx,-0x4(%rbp)
ffff800000107e47:	88 45 f8             	mov    %al,-0x8(%rbp)
ffff800000107e4a:	0f b6 45 f8          	movzbl -0x8(%rbp),%eax
ffff800000107e4e:	0f b7 55 fc          	movzwl -0x4(%rbp),%edx
ffff800000107e52:	ee                   	out    %al,(%dx)
ffff800000107e53:	0f ae f0             	mfence 
ffff800000107e56:	90                   	nop
ffff800000107e57:	5d                   	pop    %rbp
ffff800000107e58:	c3                   	retq   

ffff800000107e59 <io_in8>:
ffff800000107e59:	55                   	push   %rbp
ffff800000107e5a:	48 89 e5             	mov    %rsp,%rbp
ffff800000107e5d:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107e5d <io_in8+0x4>
ffff800000107e64:	49 bb cb 4a 00 00 00 	movabs $0x4acb,%r11
ffff800000107e6b:	00 00 00 
ffff800000107e6e:	4c 01 d8             	add    %r11,%rax
ffff800000107e71:	89 f8                	mov    %edi,%eax
ffff800000107e73:	66 89 45 ec          	mov    %ax,-0x14(%rbp)
ffff800000107e77:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
ffff800000107e7b:	0f b7 45 ec          	movzwl -0x14(%rbp),%eax
ffff800000107e7f:	89 c2                	mov    %eax,%edx
ffff800000107e81:	ec                   	in     (%dx),%al
ffff800000107e82:	0f ae f0             	mfence 
ffff800000107e85:	88 45 ff             	mov    %al,-0x1(%rbp)
ffff800000107e88:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
ffff800000107e8c:	5d                   	pop    %rbp
ffff800000107e8d:	c3                   	retq   

ffff800000107e8e <list_init>:
ffff800000107e8e:	55                   	push   %rbp
ffff800000107e8f:	48 89 e5             	mov    %rsp,%rbp
ffff800000107e92:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107e92 <list_init+0x4>
ffff800000107e99:	49 bb 96 4a 00 00 00 	movabs $0x4a96,%r11
ffff800000107ea0:	00 00 00 
ffff800000107ea3:	4c 01 d8             	add    %r11,%rax
ffff800000107ea6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000107eaa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107eae:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000107eb2:	48 89 10             	mov    %rdx,(%rax)
ffff800000107eb5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107eb9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000107ebd:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107ec1:	90                   	nop
ffff800000107ec2:	5d                   	pop    %rbp
ffff800000107ec3:	c3                   	retq   

ffff800000107ec4 <list_add_to_behind>:
ffff800000107ec4:	55                   	push   %rbp
ffff800000107ec5:	48 89 e5             	mov    %rsp,%rbp
ffff800000107ec8:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107ec8 <list_add_to_behind+0x4>
ffff800000107ecf:	49 bb 60 4a 00 00 00 	movabs $0x4a60,%r11
ffff800000107ed6:	00 00 00 
ffff800000107ed9:	4c 01 d8             	add    %r11,%rax
ffff800000107edc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000107ee0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000107ee4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107ee8:	48 8b 50 08          	mov    0x8(%rax),%rdx
ffff800000107eec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107ef0:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107ef4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107ef8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000107efc:	48 89 10             	mov    %rdx,(%rax)
ffff800000107eff:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107f03:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107f07:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000107f0b:	48 89 10             	mov    %rdx,(%rax)
ffff800000107f0e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107f12:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000107f16:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107f1a:	90                   	nop
ffff800000107f1b:	5d                   	pop    %rbp
ffff800000107f1c:	c3                   	retq   

ffff800000107f1d <list_add_to_before>:
ffff800000107f1d:	55                   	push   %rbp
ffff800000107f1e:	48 89 e5             	mov    %rsp,%rbp
ffff800000107f21:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107f21 <list_add_to_before+0x4>
ffff800000107f28:	49 bb 07 4a 00 00 00 	movabs $0x4a07,%r11
ffff800000107f2f:	00 00 00 
ffff800000107f32:	4c 01 d8             	add    %r11,%rax
ffff800000107f35:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000107f39:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000107f3d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107f41:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000107f45:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107f49:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107f4d:	48 8b 00             	mov    (%rax),%rax
ffff800000107f50:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000107f54:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107f58:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107f5c:	48 8b 10             	mov    (%rax),%rdx
ffff800000107f5f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107f63:	48 89 10             	mov    %rdx,(%rax)
ffff800000107f66:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107f6a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000107f6e:	48 89 10             	mov    %rdx,(%rax)
ffff800000107f71:	90                   	nop
ffff800000107f72:	5d                   	pop    %rbp
ffff800000107f73:	c3                   	retq   

ffff800000107f74 <list_del>:
ffff800000107f74:	55                   	push   %rbp
ffff800000107f75:	48 89 e5             	mov    %rsp,%rbp
ffff800000107f78:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107f78 <list_del+0x4>
ffff800000107f7f:	49 bb b0 49 00 00 00 	movabs $0x49b0,%r11
ffff800000107f86:	00 00 00 
ffff800000107f89:	4c 01 d8             	add    %r11,%rax
ffff800000107f8c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000107f90:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107f94:	48 8b 00             	mov    (%rax),%rax
ffff800000107f97:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000107f9b:	48 8b 52 08          	mov    0x8(%rdx),%rdx
ffff800000107f9f:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107fa3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107fa7:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107fab:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000107faf:	48 8b 12             	mov    (%rdx),%rdx
ffff800000107fb2:	48 89 10             	mov    %rdx,(%rax)
ffff800000107fb5:	90                   	nop
ffff800000107fb6:	5d                   	pop    %rbp
ffff800000107fb7:	c3                   	retq   

ffff800000107fb8 <list_is_empty>:
ffff800000107fb8:	55                   	push   %rbp
ffff800000107fb9:	48 89 e5             	mov    %rsp,%rbp
ffff800000107fbc:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107fbc <list_is_empty+0x4>
ffff800000107fc3:	49 bb 6c 49 00 00 00 	movabs $0x496c,%r11
ffff800000107fca:	00 00 00 
ffff800000107fcd:	4c 01 d8             	add    %r11,%rax
ffff800000107fd0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000107fd4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107fd8:	48 8b 00             	mov    (%rax),%rax
ffff800000107fdb:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
ffff800000107fdf:	75 15                	jne    ffff800000107ff6 <list_is_empty+0x3e>
ffff800000107fe1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107fe5:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107fe9:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
ffff800000107fed:	75 07                	jne    ffff800000107ff6 <list_is_empty+0x3e>
ffff800000107fef:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000107ff4:	eb 05                	jmp    ffff800000107ffb <list_is_empty+0x43>
ffff800000107ff6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107ffb:	5d                   	pop    %rbp
ffff800000107ffc:	c3                   	retq   

ffff800000107ffd <list_next>:
ffff800000107ffd:	55                   	push   %rbp
ffff800000107ffe:	48 89 e5             	mov    %rsp,%rbp
ffff800000108001:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108001 <list_next+0x4>
ffff800000108008:	49 bb 27 49 00 00 00 	movabs $0x4927,%r11
ffff80000010800f:	00 00 00 
ffff800000108012:	4c 01 d8             	add    %r11,%rax
ffff800000108015:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108019:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010801d:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000108021:	48 85 c0             	test   %rax,%rax
ffff800000108024:	74 0a                	je     ffff800000108030 <list_next+0x33>
ffff800000108026:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010802a:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff80000010802e:	eb 05                	jmp    ffff800000108035 <list_next+0x38>
ffff800000108030:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108035:	5d                   	pop    %rbp
ffff800000108036:	c3                   	retq   

ffff800000108037 <wrmsr>:
ffff800000108037:	55                   	push   %rbp
ffff800000108038:	48 89 e5             	mov    %rsp,%rbp
ffff80000010803b:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010803b <wrmsr+0x4>
ffff800000108042:	49 bb ed 48 00 00 00 	movabs $0x48ed,%r11
ffff800000108049:	00 00 00 
ffff80000010804c:	4c 01 d8             	add    %r11,%rax
ffff80000010804f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108053:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000108057:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010805b:	48 c1 e8 20          	shr    $0x20,%rax
ffff80000010805f:	48 89 c2             	mov    %rax,%rdx
ffff800000108062:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108066:	89 c0                	mov    %eax,%eax
ffff800000108068:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
ffff80000010806c:	0f 30                	wrmsr  
ffff80000010806e:	90                   	nop
ffff80000010806f:	5d                   	pop    %rbp
ffff800000108070:	c3                   	retq   

ffff800000108071 <IRQ0x20_interrupt>:
ffff800000108071:	6a 00                	pushq  $0x0
ffff800000108073:	fc                   	cld    
ffff800000108074:	50                   	push   %rax
ffff800000108075:	50                   	push   %rax
ffff800000108076:	48 8c c0             	mov    %es,%rax
ffff800000108079:	50                   	push   %rax
ffff80000010807a:	48 8c d8             	mov    %ds,%rax
ffff80000010807d:	50                   	push   %rax
ffff80000010807e:	48 31 c0             	xor    %rax,%rax
ffff800000108081:	55                   	push   %rbp
ffff800000108082:	57                   	push   %rdi
ffff800000108083:	56                   	push   %rsi
ffff800000108084:	52                   	push   %rdx
ffff800000108085:	51                   	push   %rcx
ffff800000108086:	53                   	push   %rbx
ffff800000108087:	41 50                	push   %r8
ffff800000108089:	41 51                	push   %r9
ffff80000010808b:	41 52                	push   %r10
ffff80000010808d:	41 53                	push   %r11
ffff80000010808f:	41 54                	push   %r12
ffff800000108091:	41 55                	push   %r13
ffff800000108093:	41 56                	push   %r14
ffff800000108095:	41 57                	push   %r15
ffff800000108097:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010809e:	48 8e da             	mov    %rdx,%ds
ffff8000001080a1:	48 8e c2             	mov    %rdx,%es
ffff8000001080a4:	48 89 e7             	mov    %rsp,%rdi
ffff8000001080a7:	48 8d 05 77 bf ff ff 	lea    -0x4089(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001080ae:	50                   	push   %rax
ffff8000001080af:	48 c7 c6 20 00 00 00 	mov    $0x20,%rsi
ffff8000001080b6:	e9 64 08 00 00       	jmpq   ffff80000010891f <do_IRQ>

ffff8000001080bb <IRQ0x21_interrupt>:
ffff8000001080bb:	6a 00                	pushq  $0x0
ffff8000001080bd:	fc                   	cld    
ffff8000001080be:	50                   	push   %rax
ffff8000001080bf:	50                   	push   %rax
ffff8000001080c0:	48 8c c0             	mov    %es,%rax
ffff8000001080c3:	50                   	push   %rax
ffff8000001080c4:	48 8c d8             	mov    %ds,%rax
ffff8000001080c7:	50                   	push   %rax
ffff8000001080c8:	48 31 c0             	xor    %rax,%rax
ffff8000001080cb:	55                   	push   %rbp
ffff8000001080cc:	57                   	push   %rdi
ffff8000001080cd:	56                   	push   %rsi
ffff8000001080ce:	52                   	push   %rdx
ffff8000001080cf:	51                   	push   %rcx
ffff8000001080d0:	53                   	push   %rbx
ffff8000001080d1:	41 50                	push   %r8
ffff8000001080d3:	41 51                	push   %r9
ffff8000001080d5:	41 52                	push   %r10
ffff8000001080d7:	41 53                	push   %r11
ffff8000001080d9:	41 54                	push   %r12
ffff8000001080db:	41 55                	push   %r13
ffff8000001080dd:	41 56                	push   %r14
ffff8000001080df:	41 57                	push   %r15
ffff8000001080e1:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001080e8:	48 8e da             	mov    %rdx,%ds
ffff8000001080eb:	48 8e c2             	mov    %rdx,%es
ffff8000001080ee:	48 89 e7             	mov    %rsp,%rdi
ffff8000001080f1:	48 8d 05 2d bf ff ff 	lea    -0x40d3(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001080f8:	50                   	push   %rax
ffff8000001080f9:	48 c7 c6 21 00 00 00 	mov    $0x21,%rsi
ffff800000108100:	e9 1a 08 00 00       	jmpq   ffff80000010891f <do_IRQ>

ffff800000108105 <IRQ0x22_interrupt>:
ffff800000108105:	6a 00                	pushq  $0x0
ffff800000108107:	fc                   	cld    
ffff800000108108:	50                   	push   %rax
ffff800000108109:	50                   	push   %rax
ffff80000010810a:	48 8c c0             	mov    %es,%rax
ffff80000010810d:	50                   	push   %rax
ffff80000010810e:	48 8c d8             	mov    %ds,%rax
ffff800000108111:	50                   	push   %rax
ffff800000108112:	48 31 c0             	xor    %rax,%rax
ffff800000108115:	55                   	push   %rbp
ffff800000108116:	57                   	push   %rdi
ffff800000108117:	56                   	push   %rsi
ffff800000108118:	52                   	push   %rdx
ffff800000108119:	51                   	push   %rcx
ffff80000010811a:	53                   	push   %rbx
ffff80000010811b:	41 50                	push   %r8
ffff80000010811d:	41 51                	push   %r9
ffff80000010811f:	41 52                	push   %r10
ffff800000108121:	41 53                	push   %r11
ffff800000108123:	41 54                	push   %r12
ffff800000108125:	41 55                	push   %r13
ffff800000108127:	41 56                	push   %r14
ffff800000108129:	41 57                	push   %r15
ffff80000010812b:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108132:	48 8e da             	mov    %rdx,%ds
ffff800000108135:	48 8e c2             	mov    %rdx,%es
ffff800000108138:	48 89 e7             	mov    %rsp,%rdi
ffff80000010813b:	48 8d 05 e3 be ff ff 	lea    -0x411d(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108142:	50                   	push   %rax
ffff800000108143:	48 c7 c6 22 00 00 00 	mov    $0x22,%rsi
ffff80000010814a:	e9 d0 07 00 00       	jmpq   ffff80000010891f <do_IRQ>

ffff80000010814f <IRQ0x23_interrupt>:
ffff80000010814f:	6a 00                	pushq  $0x0
ffff800000108151:	fc                   	cld    
ffff800000108152:	50                   	push   %rax
ffff800000108153:	50                   	push   %rax
ffff800000108154:	48 8c c0             	mov    %es,%rax
ffff800000108157:	50                   	push   %rax
ffff800000108158:	48 8c d8             	mov    %ds,%rax
ffff80000010815b:	50                   	push   %rax
ffff80000010815c:	48 31 c0             	xor    %rax,%rax
ffff80000010815f:	55                   	push   %rbp
ffff800000108160:	57                   	push   %rdi
ffff800000108161:	56                   	push   %rsi
ffff800000108162:	52                   	push   %rdx
ffff800000108163:	51                   	push   %rcx
ffff800000108164:	53                   	push   %rbx
ffff800000108165:	41 50                	push   %r8
ffff800000108167:	41 51                	push   %r9
ffff800000108169:	41 52                	push   %r10
ffff80000010816b:	41 53                	push   %r11
ffff80000010816d:	41 54                	push   %r12
ffff80000010816f:	41 55                	push   %r13
ffff800000108171:	41 56                	push   %r14
ffff800000108173:	41 57                	push   %r15
ffff800000108175:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010817c:	48 8e da             	mov    %rdx,%ds
ffff80000010817f:	48 8e c2             	mov    %rdx,%es
ffff800000108182:	48 89 e7             	mov    %rsp,%rdi
ffff800000108185:	48 8d 05 99 be ff ff 	lea    -0x4167(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010818c:	50                   	push   %rax
ffff80000010818d:	48 c7 c6 23 00 00 00 	mov    $0x23,%rsi
ffff800000108194:	e9 86 07 00 00       	jmpq   ffff80000010891f <do_IRQ>

ffff800000108199 <IRQ0x24_interrupt>:
ffff800000108199:	6a 00                	pushq  $0x0
ffff80000010819b:	fc                   	cld    
ffff80000010819c:	50                   	push   %rax
ffff80000010819d:	50                   	push   %rax
ffff80000010819e:	48 8c c0             	mov    %es,%rax
ffff8000001081a1:	50                   	push   %rax
ffff8000001081a2:	48 8c d8             	mov    %ds,%rax
ffff8000001081a5:	50                   	push   %rax
ffff8000001081a6:	48 31 c0             	xor    %rax,%rax
ffff8000001081a9:	55                   	push   %rbp
ffff8000001081aa:	57                   	push   %rdi
ffff8000001081ab:	56                   	push   %rsi
ffff8000001081ac:	52                   	push   %rdx
ffff8000001081ad:	51                   	push   %rcx
ffff8000001081ae:	53                   	push   %rbx
ffff8000001081af:	41 50                	push   %r8
ffff8000001081b1:	41 51                	push   %r9
ffff8000001081b3:	41 52                	push   %r10
ffff8000001081b5:	41 53                	push   %r11
ffff8000001081b7:	41 54                	push   %r12
ffff8000001081b9:	41 55                	push   %r13
ffff8000001081bb:	41 56                	push   %r14
ffff8000001081bd:	41 57                	push   %r15
ffff8000001081bf:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001081c6:	48 8e da             	mov    %rdx,%ds
ffff8000001081c9:	48 8e c2             	mov    %rdx,%es
ffff8000001081cc:	48 89 e7             	mov    %rsp,%rdi
ffff8000001081cf:	48 8d 05 4f be ff ff 	lea    -0x41b1(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001081d6:	50                   	push   %rax
ffff8000001081d7:	48 c7 c6 24 00 00 00 	mov    $0x24,%rsi
ffff8000001081de:	e9 3c 07 00 00       	jmpq   ffff80000010891f <do_IRQ>

ffff8000001081e3 <IRQ0x25_interrupt>:
ffff8000001081e3:	6a 00                	pushq  $0x0
ffff8000001081e5:	fc                   	cld    
ffff8000001081e6:	50                   	push   %rax
ffff8000001081e7:	50                   	push   %rax
ffff8000001081e8:	48 8c c0             	mov    %es,%rax
ffff8000001081eb:	50                   	push   %rax
ffff8000001081ec:	48 8c d8             	mov    %ds,%rax
ffff8000001081ef:	50                   	push   %rax
ffff8000001081f0:	48 31 c0             	xor    %rax,%rax
ffff8000001081f3:	55                   	push   %rbp
ffff8000001081f4:	57                   	push   %rdi
ffff8000001081f5:	56                   	push   %rsi
ffff8000001081f6:	52                   	push   %rdx
ffff8000001081f7:	51                   	push   %rcx
ffff8000001081f8:	53                   	push   %rbx
ffff8000001081f9:	41 50                	push   %r8
ffff8000001081fb:	41 51                	push   %r9
ffff8000001081fd:	41 52                	push   %r10
ffff8000001081ff:	41 53                	push   %r11
ffff800000108201:	41 54                	push   %r12
ffff800000108203:	41 55                	push   %r13
ffff800000108205:	41 56                	push   %r14
ffff800000108207:	41 57                	push   %r15
ffff800000108209:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108210:	48 8e da             	mov    %rdx,%ds
ffff800000108213:	48 8e c2             	mov    %rdx,%es
ffff800000108216:	48 89 e7             	mov    %rsp,%rdi
ffff800000108219:	48 8d 05 05 be ff ff 	lea    -0x41fb(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108220:	50                   	push   %rax
ffff800000108221:	48 c7 c6 25 00 00 00 	mov    $0x25,%rsi
ffff800000108228:	e9 f2 06 00 00       	jmpq   ffff80000010891f <do_IRQ>

ffff80000010822d <IRQ0x26_interrupt>:
ffff80000010822d:	6a 00                	pushq  $0x0
ffff80000010822f:	fc                   	cld    
ffff800000108230:	50                   	push   %rax
ffff800000108231:	50                   	push   %rax
ffff800000108232:	48 8c c0             	mov    %es,%rax
ffff800000108235:	50                   	push   %rax
ffff800000108236:	48 8c d8             	mov    %ds,%rax
ffff800000108239:	50                   	push   %rax
ffff80000010823a:	48 31 c0             	xor    %rax,%rax
ffff80000010823d:	55                   	push   %rbp
ffff80000010823e:	57                   	push   %rdi
ffff80000010823f:	56                   	push   %rsi
ffff800000108240:	52                   	push   %rdx
ffff800000108241:	51                   	push   %rcx
ffff800000108242:	53                   	push   %rbx
ffff800000108243:	41 50                	push   %r8
ffff800000108245:	41 51                	push   %r9
ffff800000108247:	41 52                	push   %r10
ffff800000108249:	41 53                	push   %r11
ffff80000010824b:	41 54                	push   %r12
ffff80000010824d:	41 55                	push   %r13
ffff80000010824f:	41 56                	push   %r14
ffff800000108251:	41 57                	push   %r15
ffff800000108253:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010825a:	48 8e da             	mov    %rdx,%ds
ffff80000010825d:	48 8e c2             	mov    %rdx,%es
ffff800000108260:	48 89 e7             	mov    %rsp,%rdi
ffff800000108263:	48 8d 05 bb bd ff ff 	lea    -0x4245(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010826a:	50                   	push   %rax
ffff80000010826b:	48 c7 c6 26 00 00 00 	mov    $0x26,%rsi
ffff800000108272:	e9 a8 06 00 00       	jmpq   ffff80000010891f <do_IRQ>

ffff800000108277 <IRQ0x27_interrupt>:
ffff800000108277:	6a 00                	pushq  $0x0
ffff800000108279:	fc                   	cld    
ffff80000010827a:	50                   	push   %rax
ffff80000010827b:	50                   	push   %rax
ffff80000010827c:	48 8c c0             	mov    %es,%rax
ffff80000010827f:	50                   	push   %rax
ffff800000108280:	48 8c d8             	mov    %ds,%rax
ffff800000108283:	50                   	push   %rax
ffff800000108284:	48 31 c0             	xor    %rax,%rax
ffff800000108287:	55                   	push   %rbp
ffff800000108288:	57                   	push   %rdi
ffff800000108289:	56                   	push   %rsi
ffff80000010828a:	52                   	push   %rdx
ffff80000010828b:	51                   	push   %rcx
ffff80000010828c:	53                   	push   %rbx
ffff80000010828d:	41 50                	push   %r8
ffff80000010828f:	41 51                	push   %r9
ffff800000108291:	41 52                	push   %r10
ffff800000108293:	41 53                	push   %r11
ffff800000108295:	41 54                	push   %r12
ffff800000108297:	41 55                	push   %r13
ffff800000108299:	41 56                	push   %r14
ffff80000010829b:	41 57                	push   %r15
ffff80000010829d:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001082a4:	48 8e da             	mov    %rdx,%ds
ffff8000001082a7:	48 8e c2             	mov    %rdx,%es
ffff8000001082aa:	48 89 e7             	mov    %rsp,%rdi
ffff8000001082ad:	48 8d 05 71 bd ff ff 	lea    -0x428f(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001082b4:	50                   	push   %rax
ffff8000001082b5:	48 c7 c6 27 00 00 00 	mov    $0x27,%rsi
ffff8000001082bc:	e9 5e 06 00 00       	jmpq   ffff80000010891f <do_IRQ>

ffff8000001082c1 <IRQ0x28_interrupt>:
ffff8000001082c1:	6a 00                	pushq  $0x0
ffff8000001082c3:	fc                   	cld    
ffff8000001082c4:	50                   	push   %rax
ffff8000001082c5:	50                   	push   %rax
ffff8000001082c6:	48 8c c0             	mov    %es,%rax
ffff8000001082c9:	50                   	push   %rax
ffff8000001082ca:	48 8c d8             	mov    %ds,%rax
ffff8000001082cd:	50                   	push   %rax
ffff8000001082ce:	48 31 c0             	xor    %rax,%rax
ffff8000001082d1:	55                   	push   %rbp
ffff8000001082d2:	57                   	push   %rdi
ffff8000001082d3:	56                   	push   %rsi
ffff8000001082d4:	52                   	push   %rdx
ffff8000001082d5:	51                   	push   %rcx
ffff8000001082d6:	53                   	push   %rbx
ffff8000001082d7:	41 50                	push   %r8
ffff8000001082d9:	41 51                	push   %r9
ffff8000001082db:	41 52                	push   %r10
ffff8000001082dd:	41 53                	push   %r11
ffff8000001082df:	41 54                	push   %r12
ffff8000001082e1:	41 55                	push   %r13
ffff8000001082e3:	41 56                	push   %r14
ffff8000001082e5:	41 57                	push   %r15
ffff8000001082e7:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001082ee:	48 8e da             	mov    %rdx,%ds
ffff8000001082f1:	48 8e c2             	mov    %rdx,%es
ffff8000001082f4:	48 89 e7             	mov    %rsp,%rdi
ffff8000001082f7:	48 8d 05 27 bd ff ff 	lea    -0x42d9(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001082fe:	50                   	push   %rax
ffff8000001082ff:	48 c7 c6 28 00 00 00 	mov    $0x28,%rsi
ffff800000108306:	e9 14 06 00 00       	jmpq   ffff80000010891f <do_IRQ>

ffff80000010830b <IRQ0x29_interrupt>:
ffff80000010830b:	6a 00                	pushq  $0x0
ffff80000010830d:	fc                   	cld    
ffff80000010830e:	50                   	push   %rax
ffff80000010830f:	50                   	push   %rax
ffff800000108310:	48 8c c0             	mov    %es,%rax
ffff800000108313:	50                   	push   %rax
ffff800000108314:	48 8c d8             	mov    %ds,%rax
ffff800000108317:	50                   	push   %rax
ffff800000108318:	48 31 c0             	xor    %rax,%rax
ffff80000010831b:	55                   	push   %rbp
ffff80000010831c:	57                   	push   %rdi
ffff80000010831d:	56                   	push   %rsi
ffff80000010831e:	52                   	push   %rdx
ffff80000010831f:	51                   	push   %rcx
ffff800000108320:	53                   	push   %rbx
ffff800000108321:	41 50                	push   %r8
ffff800000108323:	41 51                	push   %r9
ffff800000108325:	41 52                	push   %r10
ffff800000108327:	41 53                	push   %r11
ffff800000108329:	41 54                	push   %r12
ffff80000010832b:	41 55                	push   %r13
ffff80000010832d:	41 56                	push   %r14
ffff80000010832f:	41 57                	push   %r15
ffff800000108331:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108338:	48 8e da             	mov    %rdx,%ds
ffff80000010833b:	48 8e c2             	mov    %rdx,%es
ffff80000010833e:	48 89 e7             	mov    %rsp,%rdi
ffff800000108341:	48 8d 05 dd bc ff ff 	lea    -0x4323(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108348:	50                   	push   %rax
ffff800000108349:	48 c7 c6 29 00 00 00 	mov    $0x29,%rsi
ffff800000108350:	e9 ca 05 00 00       	jmpq   ffff80000010891f <do_IRQ>

ffff800000108355 <IRQ0x2a_interrupt>:
ffff800000108355:	6a 00                	pushq  $0x0
ffff800000108357:	fc                   	cld    
ffff800000108358:	50                   	push   %rax
ffff800000108359:	50                   	push   %rax
ffff80000010835a:	48 8c c0             	mov    %es,%rax
ffff80000010835d:	50                   	push   %rax
ffff80000010835e:	48 8c d8             	mov    %ds,%rax
ffff800000108361:	50                   	push   %rax
ffff800000108362:	48 31 c0             	xor    %rax,%rax
ffff800000108365:	55                   	push   %rbp
ffff800000108366:	57                   	push   %rdi
ffff800000108367:	56                   	push   %rsi
ffff800000108368:	52                   	push   %rdx
ffff800000108369:	51                   	push   %rcx
ffff80000010836a:	53                   	push   %rbx
ffff80000010836b:	41 50                	push   %r8
ffff80000010836d:	41 51                	push   %r9
ffff80000010836f:	41 52                	push   %r10
ffff800000108371:	41 53                	push   %r11
ffff800000108373:	41 54                	push   %r12
ffff800000108375:	41 55                	push   %r13
ffff800000108377:	41 56                	push   %r14
ffff800000108379:	41 57                	push   %r15
ffff80000010837b:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108382:	48 8e da             	mov    %rdx,%ds
ffff800000108385:	48 8e c2             	mov    %rdx,%es
ffff800000108388:	48 89 e7             	mov    %rsp,%rdi
ffff80000010838b:	48 8d 05 93 bc ff ff 	lea    -0x436d(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108392:	50                   	push   %rax
ffff800000108393:	48 c7 c6 2a 00 00 00 	mov    $0x2a,%rsi
ffff80000010839a:	e9 80 05 00 00       	jmpq   ffff80000010891f <do_IRQ>

ffff80000010839f <IRQ0x2b_interrupt>:
ffff80000010839f:	6a 00                	pushq  $0x0
ffff8000001083a1:	fc                   	cld    
ffff8000001083a2:	50                   	push   %rax
ffff8000001083a3:	50                   	push   %rax
ffff8000001083a4:	48 8c c0             	mov    %es,%rax
ffff8000001083a7:	50                   	push   %rax
ffff8000001083a8:	48 8c d8             	mov    %ds,%rax
ffff8000001083ab:	50                   	push   %rax
ffff8000001083ac:	48 31 c0             	xor    %rax,%rax
ffff8000001083af:	55                   	push   %rbp
ffff8000001083b0:	57                   	push   %rdi
ffff8000001083b1:	56                   	push   %rsi
ffff8000001083b2:	52                   	push   %rdx
ffff8000001083b3:	51                   	push   %rcx
ffff8000001083b4:	53                   	push   %rbx
ffff8000001083b5:	41 50                	push   %r8
ffff8000001083b7:	41 51                	push   %r9
ffff8000001083b9:	41 52                	push   %r10
ffff8000001083bb:	41 53                	push   %r11
ffff8000001083bd:	41 54                	push   %r12
ffff8000001083bf:	41 55                	push   %r13
ffff8000001083c1:	41 56                	push   %r14
ffff8000001083c3:	41 57                	push   %r15
ffff8000001083c5:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001083cc:	48 8e da             	mov    %rdx,%ds
ffff8000001083cf:	48 8e c2             	mov    %rdx,%es
ffff8000001083d2:	48 89 e7             	mov    %rsp,%rdi
ffff8000001083d5:	48 8d 05 49 bc ff ff 	lea    -0x43b7(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001083dc:	50                   	push   %rax
ffff8000001083dd:	48 c7 c6 2b 00 00 00 	mov    $0x2b,%rsi
ffff8000001083e4:	e9 36 05 00 00       	jmpq   ffff80000010891f <do_IRQ>

ffff8000001083e9 <IRQ0x2c_interrupt>:
ffff8000001083e9:	6a 00                	pushq  $0x0
ffff8000001083eb:	fc                   	cld    
ffff8000001083ec:	50                   	push   %rax
ffff8000001083ed:	50                   	push   %rax
ffff8000001083ee:	48 8c c0             	mov    %es,%rax
ffff8000001083f1:	50                   	push   %rax
ffff8000001083f2:	48 8c d8             	mov    %ds,%rax
ffff8000001083f5:	50                   	push   %rax
ffff8000001083f6:	48 31 c0             	xor    %rax,%rax
ffff8000001083f9:	55                   	push   %rbp
ffff8000001083fa:	57                   	push   %rdi
ffff8000001083fb:	56                   	push   %rsi
ffff8000001083fc:	52                   	push   %rdx
ffff8000001083fd:	51                   	push   %rcx
ffff8000001083fe:	53                   	push   %rbx
ffff8000001083ff:	41 50                	push   %r8
ffff800000108401:	41 51                	push   %r9
ffff800000108403:	41 52                	push   %r10
ffff800000108405:	41 53                	push   %r11
ffff800000108407:	41 54                	push   %r12
ffff800000108409:	41 55                	push   %r13
ffff80000010840b:	41 56                	push   %r14
ffff80000010840d:	41 57                	push   %r15
ffff80000010840f:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108416:	48 8e da             	mov    %rdx,%ds
ffff800000108419:	48 8e c2             	mov    %rdx,%es
ffff80000010841c:	48 89 e7             	mov    %rsp,%rdi
ffff80000010841f:	48 8d 05 ff bb ff ff 	lea    -0x4401(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108426:	50                   	push   %rax
ffff800000108427:	48 c7 c6 2c 00 00 00 	mov    $0x2c,%rsi
ffff80000010842e:	e9 ec 04 00 00       	jmpq   ffff80000010891f <do_IRQ>

ffff800000108433 <IRQ0x2d_interrupt>:
ffff800000108433:	6a 00                	pushq  $0x0
ffff800000108435:	fc                   	cld    
ffff800000108436:	50                   	push   %rax
ffff800000108437:	50                   	push   %rax
ffff800000108438:	48 8c c0             	mov    %es,%rax
ffff80000010843b:	50                   	push   %rax
ffff80000010843c:	48 8c d8             	mov    %ds,%rax
ffff80000010843f:	50                   	push   %rax
ffff800000108440:	48 31 c0             	xor    %rax,%rax
ffff800000108443:	55                   	push   %rbp
ffff800000108444:	57                   	push   %rdi
ffff800000108445:	56                   	push   %rsi
ffff800000108446:	52                   	push   %rdx
ffff800000108447:	51                   	push   %rcx
ffff800000108448:	53                   	push   %rbx
ffff800000108449:	41 50                	push   %r8
ffff80000010844b:	41 51                	push   %r9
ffff80000010844d:	41 52                	push   %r10
ffff80000010844f:	41 53                	push   %r11
ffff800000108451:	41 54                	push   %r12
ffff800000108453:	41 55                	push   %r13
ffff800000108455:	41 56                	push   %r14
ffff800000108457:	41 57                	push   %r15
ffff800000108459:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108460:	48 8e da             	mov    %rdx,%ds
ffff800000108463:	48 8e c2             	mov    %rdx,%es
ffff800000108466:	48 89 e7             	mov    %rsp,%rdi
ffff800000108469:	48 8d 05 b5 bb ff ff 	lea    -0x444b(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108470:	50                   	push   %rax
ffff800000108471:	48 c7 c6 2d 00 00 00 	mov    $0x2d,%rsi
ffff800000108478:	e9 a2 04 00 00       	jmpq   ffff80000010891f <do_IRQ>

ffff80000010847d <IRQ0x2e_interrupt>:
ffff80000010847d:	6a 00                	pushq  $0x0
ffff80000010847f:	fc                   	cld    
ffff800000108480:	50                   	push   %rax
ffff800000108481:	50                   	push   %rax
ffff800000108482:	48 8c c0             	mov    %es,%rax
ffff800000108485:	50                   	push   %rax
ffff800000108486:	48 8c d8             	mov    %ds,%rax
ffff800000108489:	50                   	push   %rax
ffff80000010848a:	48 31 c0             	xor    %rax,%rax
ffff80000010848d:	55                   	push   %rbp
ffff80000010848e:	57                   	push   %rdi
ffff80000010848f:	56                   	push   %rsi
ffff800000108490:	52                   	push   %rdx
ffff800000108491:	51                   	push   %rcx
ffff800000108492:	53                   	push   %rbx
ffff800000108493:	41 50                	push   %r8
ffff800000108495:	41 51                	push   %r9
ffff800000108497:	41 52                	push   %r10
ffff800000108499:	41 53                	push   %r11
ffff80000010849b:	41 54                	push   %r12
ffff80000010849d:	41 55                	push   %r13
ffff80000010849f:	41 56                	push   %r14
ffff8000001084a1:	41 57                	push   %r15
ffff8000001084a3:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001084aa:	48 8e da             	mov    %rdx,%ds
ffff8000001084ad:	48 8e c2             	mov    %rdx,%es
ffff8000001084b0:	48 89 e7             	mov    %rsp,%rdi
ffff8000001084b3:	48 8d 05 6b bb ff ff 	lea    -0x4495(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001084ba:	50                   	push   %rax
ffff8000001084bb:	48 c7 c6 2e 00 00 00 	mov    $0x2e,%rsi
ffff8000001084c2:	e9 58 04 00 00       	jmpq   ffff80000010891f <do_IRQ>

ffff8000001084c7 <IRQ0x2f_interrupt>:
ffff8000001084c7:	6a 00                	pushq  $0x0
ffff8000001084c9:	fc                   	cld    
ffff8000001084ca:	50                   	push   %rax
ffff8000001084cb:	50                   	push   %rax
ffff8000001084cc:	48 8c c0             	mov    %es,%rax
ffff8000001084cf:	50                   	push   %rax
ffff8000001084d0:	48 8c d8             	mov    %ds,%rax
ffff8000001084d3:	50                   	push   %rax
ffff8000001084d4:	48 31 c0             	xor    %rax,%rax
ffff8000001084d7:	55                   	push   %rbp
ffff8000001084d8:	57                   	push   %rdi
ffff8000001084d9:	56                   	push   %rsi
ffff8000001084da:	52                   	push   %rdx
ffff8000001084db:	51                   	push   %rcx
ffff8000001084dc:	53                   	push   %rbx
ffff8000001084dd:	41 50                	push   %r8
ffff8000001084df:	41 51                	push   %r9
ffff8000001084e1:	41 52                	push   %r10
ffff8000001084e3:	41 53                	push   %r11
ffff8000001084e5:	41 54                	push   %r12
ffff8000001084e7:	41 55                	push   %r13
ffff8000001084e9:	41 56                	push   %r14
ffff8000001084eb:	41 57                	push   %r15
ffff8000001084ed:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001084f4:	48 8e da             	mov    %rdx,%ds
ffff8000001084f7:	48 8e c2             	mov    %rdx,%es
ffff8000001084fa:	48 89 e7             	mov    %rsp,%rdi
ffff8000001084fd:	48 8d 05 21 bb ff ff 	lea    -0x44df(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108504:	50                   	push   %rax
ffff800000108505:	48 c7 c6 2f 00 00 00 	mov    $0x2f,%rsi
ffff80000010850c:	e9 0e 04 00 00       	jmpq   ffff80000010891f <do_IRQ>

ffff800000108511 <IRQ0x30_interrupt>:
ffff800000108511:	6a 00                	pushq  $0x0
ffff800000108513:	fc                   	cld    
ffff800000108514:	50                   	push   %rax
ffff800000108515:	50                   	push   %rax
ffff800000108516:	48 8c c0             	mov    %es,%rax
ffff800000108519:	50                   	push   %rax
ffff80000010851a:	48 8c d8             	mov    %ds,%rax
ffff80000010851d:	50                   	push   %rax
ffff80000010851e:	48 31 c0             	xor    %rax,%rax
ffff800000108521:	55                   	push   %rbp
ffff800000108522:	57                   	push   %rdi
ffff800000108523:	56                   	push   %rsi
ffff800000108524:	52                   	push   %rdx
ffff800000108525:	51                   	push   %rcx
ffff800000108526:	53                   	push   %rbx
ffff800000108527:	41 50                	push   %r8
ffff800000108529:	41 51                	push   %r9
ffff80000010852b:	41 52                	push   %r10
ffff80000010852d:	41 53                	push   %r11
ffff80000010852f:	41 54                	push   %r12
ffff800000108531:	41 55                	push   %r13
ffff800000108533:	41 56                	push   %r14
ffff800000108535:	41 57                	push   %r15
ffff800000108537:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010853e:	48 8e da             	mov    %rdx,%ds
ffff800000108541:	48 8e c2             	mov    %rdx,%es
ffff800000108544:	48 89 e7             	mov    %rsp,%rdi
ffff800000108547:	48 8d 05 d7 ba ff ff 	lea    -0x4529(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010854e:	50                   	push   %rax
ffff80000010854f:	48 c7 c6 30 00 00 00 	mov    $0x30,%rsi
ffff800000108556:	e9 c4 03 00 00       	jmpq   ffff80000010891f <do_IRQ>

ffff80000010855b <IRQ0x31_interrupt>:
ffff80000010855b:	6a 00                	pushq  $0x0
ffff80000010855d:	fc                   	cld    
ffff80000010855e:	50                   	push   %rax
ffff80000010855f:	50                   	push   %rax
ffff800000108560:	48 8c c0             	mov    %es,%rax
ffff800000108563:	50                   	push   %rax
ffff800000108564:	48 8c d8             	mov    %ds,%rax
ffff800000108567:	50                   	push   %rax
ffff800000108568:	48 31 c0             	xor    %rax,%rax
ffff80000010856b:	55                   	push   %rbp
ffff80000010856c:	57                   	push   %rdi
ffff80000010856d:	56                   	push   %rsi
ffff80000010856e:	52                   	push   %rdx
ffff80000010856f:	51                   	push   %rcx
ffff800000108570:	53                   	push   %rbx
ffff800000108571:	41 50                	push   %r8
ffff800000108573:	41 51                	push   %r9
ffff800000108575:	41 52                	push   %r10
ffff800000108577:	41 53                	push   %r11
ffff800000108579:	41 54                	push   %r12
ffff80000010857b:	41 55                	push   %r13
ffff80000010857d:	41 56                	push   %r14
ffff80000010857f:	41 57                	push   %r15
ffff800000108581:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108588:	48 8e da             	mov    %rdx,%ds
ffff80000010858b:	48 8e c2             	mov    %rdx,%es
ffff80000010858e:	48 89 e7             	mov    %rsp,%rdi
ffff800000108591:	48 8d 05 8d ba ff ff 	lea    -0x4573(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108598:	50                   	push   %rax
ffff800000108599:	48 c7 c6 31 00 00 00 	mov    $0x31,%rsi
ffff8000001085a0:	e9 7a 03 00 00       	jmpq   ffff80000010891f <do_IRQ>

ffff8000001085a5 <IRQ0x32_interrupt>:
ffff8000001085a5:	6a 00                	pushq  $0x0
ffff8000001085a7:	fc                   	cld    
ffff8000001085a8:	50                   	push   %rax
ffff8000001085a9:	50                   	push   %rax
ffff8000001085aa:	48 8c c0             	mov    %es,%rax
ffff8000001085ad:	50                   	push   %rax
ffff8000001085ae:	48 8c d8             	mov    %ds,%rax
ffff8000001085b1:	50                   	push   %rax
ffff8000001085b2:	48 31 c0             	xor    %rax,%rax
ffff8000001085b5:	55                   	push   %rbp
ffff8000001085b6:	57                   	push   %rdi
ffff8000001085b7:	56                   	push   %rsi
ffff8000001085b8:	52                   	push   %rdx
ffff8000001085b9:	51                   	push   %rcx
ffff8000001085ba:	53                   	push   %rbx
ffff8000001085bb:	41 50                	push   %r8
ffff8000001085bd:	41 51                	push   %r9
ffff8000001085bf:	41 52                	push   %r10
ffff8000001085c1:	41 53                	push   %r11
ffff8000001085c3:	41 54                	push   %r12
ffff8000001085c5:	41 55                	push   %r13
ffff8000001085c7:	41 56                	push   %r14
ffff8000001085c9:	41 57                	push   %r15
ffff8000001085cb:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001085d2:	48 8e da             	mov    %rdx,%ds
ffff8000001085d5:	48 8e c2             	mov    %rdx,%es
ffff8000001085d8:	48 89 e7             	mov    %rsp,%rdi
ffff8000001085db:	48 8d 05 43 ba ff ff 	lea    -0x45bd(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001085e2:	50                   	push   %rax
ffff8000001085e3:	48 c7 c6 32 00 00 00 	mov    $0x32,%rsi
ffff8000001085ea:	e9 30 03 00 00       	jmpq   ffff80000010891f <do_IRQ>

ffff8000001085ef <IRQ0x33_interrupt>:
ffff8000001085ef:	6a 00                	pushq  $0x0
ffff8000001085f1:	fc                   	cld    
ffff8000001085f2:	50                   	push   %rax
ffff8000001085f3:	50                   	push   %rax
ffff8000001085f4:	48 8c c0             	mov    %es,%rax
ffff8000001085f7:	50                   	push   %rax
ffff8000001085f8:	48 8c d8             	mov    %ds,%rax
ffff8000001085fb:	50                   	push   %rax
ffff8000001085fc:	48 31 c0             	xor    %rax,%rax
ffff8000001085ff:	55                   	push   %rbp
ffff800000108600:	57                   	push   %rdi
ffff800000108601:	56                   	push   %rsi
ffff800000108602:	52                   	push   %rdx
ffff800000108603:	51                   	push   %rcx
ffff800000108604:	53                   	push   %rbx
ffff800000108605:	41 50                	push   %r8
ffff800000108607:	41 51                	push   %r9
ffff800000108609:	41 52                	push   %r10
ffff80000010860b:	41 53                	push   %r11
ffff80000010860d:	41 54                	push   %r12
ffff80000010860f:	41 55                	push   %r13
ffff800000108611:	41 56                	push   %r14
ffff800000108613:	41 57                	push   %r15
ffff800000108615:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010861c:	48 8e da             	mov    %rdx,%ds
ffff80000010861f:	48 8e c2             	mov    %rdx,%es
ffff800000108622:	48 89 e7             	mov    %rsp,%rdi
ffff800000108625:	48 8d 05 f9 b9 ff ff 	lea    -0x4607(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010862c:	50                   	push   %rax
ffff80000010862d:	48 c7 c6 33 00 00 00 	mov    $0x33,%rsi
ffff800000108634:	e9 e6 02 00 00       	jmpq   ffff80000010891f <do_IRQ>

ffff800000108639 <IRQ0x34_interrupt>:
ffff800000108639:	6a 00                	pushq  $0x0
ffff80000010863b:	fc                   	cld    
ffff80000010863c:	50                   	push   %rax
ffff80000010863d:	50                   	push   %rax
ffff80000010863e:	48 8c c0             	mov    %es,%rax
ffff800000108641:	50                   	push   %rax
ffff800000108642:	48 8c d8             	mov    %ds,%rax
ffff800000108645:	50                   	push   %rax
ffff800000108646:	48 31 c0             	xor    %rax,%rax
ffff800000108649:	55                   	push   %rbp
ffff80000010864a:	57                   	push   %rdi
ffff80000010864b:	56                   	push   %rsi
ffff80000010864c:	52                   	push   %rdx
ffff80000010864d:	51                   	push   %rcx
ffff80000010864e:	53                   	push   %rbx
ffff80000010864f:	41 50                	push   %r8
ffff800000108651:	41 51                	push   %r9
ffff800000108653:	41 52                	push   %r10
ffff800000108655:	41 53                	push   %r11
ffff800000108657:	41 54                	push   %r12
ffff800000108659:	41 55                	push   %r13
ffff80000010865b:	41 56                	push   %r14
ffff80000010865d:	41 57                	push   %r15
ffff80000010865f:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108666:	48 8e da             	mov    %rdx,%ds
ffff800000108669:	48 8e c2             	mov    %rdx,%es
ffff80000010866c:	48 89 e7             	mov    %rsp,%rdi
ffff80000010866f:	48 8d 05 af b9 ff ff 	lea    -0x4651(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108676:	50                   	push   %rax
ffff800000108677:	48 c7 c6 34 00 00 00 	mov    $0x34,%rsi
ffff80000010867e:	e9 9c 02 00 00       	jmpq   ffff80000010891f <do_IRQ>

ffff800000108683 <IRQ0x35_interrupt>:
ffff800000108683:	6a 00                	pushq  $0x0
ffff800000108685:	fc                   	cld    
ffff800000108686:	50                   	push   %rax
ffff800000108687:	50                   	push   %rax
ffff800000108688:	48 8c c0             	mov    %es,%rax
ffff80000010868b:	50                   	push   %rax
ffff80000010868c:	48 8c d8             	mov    %ds,%rax
ffff80000010868f:	50                   	push   %rax
ffff800000108690:	48 31 c0             	xor    %rax,%rax
ffff800000108693:	55                   	push   %rbp
ffff800000108694:	57                   	push   %rdi
ffff800000108695:	56                   	push   %rsi
ffff800000108696:	52                   	push   %rdx
ffff800000108697:	51                   	push   %rcx
ffff800000108698:	53                   	push   %rbx
ffff800000108699:	41 50                	push   %r8
ffff80000010869b:	41 51                	push   %r9
ffff80000010869d:	41 52                	push   %r10
ffff80000010869f:	41 53                	push   %r11
ffff8000001086a1:	41 54                	push   %r12
ffff8000001086a3:	41 55                	push   %r13
ffff8000001086a5:	41 56                	push   %r14
ffff8000001086a7:	41 57                	push   %r15
ffff8000001086a9:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001086b0:	48 8e da             	mov    %rdx,%ds
ffff8000001086b3:	48 8e c2             	mov    %rdx,%es
ffff8000001086b6:	48 89 e7             	mov    %rsp,%rdi
ffff8000001086b9:	48 8d 05 65 b9 ff ff 	lea    -0x469b(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001086c0:	50                   	push   %rax
ffff8000001086c1:	48 c7 c6 35 00 00 00 	mov    $0x35,%rsi
ffff8000001086c8:	e9 52 02 00 00       	jmpq   ffff80000010891f <do_IRQ>

ffff8000001086cd <IRQ0x36_interrupt>:
ffff8000001086cd:	6a 00                	pushq  $0x0
ffff8000001086cf:	fc                   	cld    
ffff8000001086d0:	50                   	push   %rax
ffff8000001086d1:	50                   	push   %rax
ffff8000001086d2:	48 8c c0             	mov    %es,%rax
ffff8000001086d5:	50                   	push   %rax
ffff8000001086d6:	48 8c d8             	mov    %ds,%rax
ffff8000001086d9:	50                   	push   %rax
ffff8000001086da:	48 31 c0             	xor    %rax,%rax
ffff8000001086dd:	55                   	push   %rbp
ffff8000001086de:	57                   	push   %rdi
ffff8000001086df:	56                   	push   %rsi
ffff8000001086e0:	52                   	push   %rdx
ffff8000001086e1:	51                   	push   %rcx
ffff8000001086e2:	53                   	push   %rbx
ffff8000001086e3:	41 50                	push   %r8
ffff8000001086e5:	41 51                	push   %r9
ffff8000001086e7:	41 52                	push   %r10
ffff8000001086e9:	41 53                	push   %r11
ffff8000001086eb:	41 54                	push   %r12
ffff8000001086ed:	41 55                	push   %r13
ffff8000001086ef:	41 56                	push   %r14
ffff8000001086f1:	41 57                	push   %r15
ffff8000001086f3:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001086fa:	48 8e da             	mov    %rdx,%ds
ffff8000001086fd:	48 8e c2             	mov    %rdx,%es
ffff800000108700:	48 89 e7             	mov    %rsp,%rdi
ffff800000108703:	48 8d 05 1b b9 ff ff 	lea    -0x46e5(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010870a:	50                   	push   %rax
ffff80000010870b:	48 c7 c6 36 00 00 00 	mov    $0x36,%rsi
ffff800000108712:	e9 08 02 00 00       	jmpq   ffff80000010891f <do_IRQ>

ffff800000108717 <IRQ0x37_interrupt>:
ffff800000108717:	6a 00                	pushq  $0x0
ffff800000108719:	fc                   	cld    
ffff80000010871a:	50                   	push   %rax
ffff80000010871b:	50                   	push   %rax
ffff80000010871c:	48 8c c0             	mov    %es,%rax
ffff80000010871f:	50                   	push   %rax
ffff800000108720:	48 8c d8             	mov    %ds,%rax
ffff800000108723:	50                   	push   %rax
ffff800000108724:	48 31 c0             	xor    %rax,%rax
ffff800000108727:	55                   	push   %rbp
ffff800000108728:	57                   	push   %rdi
ffff800000108729:	56                   	push   %rsi
ffff80000010872a:	52                   	push   %rdx
ffff80000010872b:	51                   	push   %rcx
ffff80000010872c:	53                   	push   %rbx
ffff80000010872d:	41 50                	push   %r8
ffff80000010872f:	41 51                	push   %r9
ffff800000108731:	41 52                	push   %r10
ffff800000108733:	41 53                	push   %r11
ffff800000108735:	41 54                	push   %r12
ffff800000108737:	41 55                	push   %r13
ffff800000108739:	41 56                	push   %r14
ffff80000010873b:	41 57                	push   %r15
ffff80000010873d:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108744:	48 8e da             	mov    %rdx,%ds
ffff800000108747:	48 8e c2             	mov    %rdx,%es
ffff80000010874a:	48 89 e7             	mov    %rsp,%rdi
ffff80000010874d:	48 8d 05 d1 b8 ff ff 	lea    -0x472f(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108754:	50                   	push   %rax
ffff800000108755:	48 c7 c6 37 00 00 00 	mov    $0x37,%rsi
ffff80000010875c:	e9 be 01 00 00       	jmpq   ffff80000010891f <do_IRQ>

ffff800000108761 <init_interrupt>:
ffff800000108761:	55                   	push   %rbp
ffff800000108762:	48 89 e5             	mov    %rsp,%rbp
ffff800000108765:	41 57                	push   %r15
ffff800000108767:	53                   	push   %rbx
ffff800000108768:	48 83 ec 10          	sub    $0x10,%rsp
ffff80000010876c:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff80000010876c <init_interrupt+0xb>
ffff800000108773:	49 bb bc 41 00 00 00 	movabs $0x41bc,%r11
ffff80000010877a:	00 00 00 
ffff80000010877d:	4c 01 db             	add    %r11,%rbx
ffff800000108780:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%rbp)
ffff800000108787:	eb 3e                	jmp    ffff8000001087c7 <init_interrupt+0x66>
ffff800000108789:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff80000010878c:	83 e8 20             	sub    $0x20,%eax
ffff80000010878f:	48 ba 98 0f 00 00 00 	movabs $0xf98,%rdx
ffff800000108796:	00 00 00 
ffff800000108799:	48 98                	cltq   
ffff80000010879b:	48 01 da             	add    %rbx,%rdx
ffff80000010879e:	48 8b 14 c2          	mov    (%rdx,%rax,8),%rdx
ffff8000001087a2:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff8000001087a5:	be 02 00 00 00       	mov    $0x2,%esi
ffff8000001087aa:	89 c7                	mov    %eax,%edi
ffff8000001087ac:	49 89 df             	mov    %rbx,%r15
ffff8000001087af:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001087b4:	48 b9 f9 79 ff ff ff 	movabs $0xffffffffffff79f9,%rcx
ffff8000001087bb:	ff ff ff 
ffff8000001087be:	48 01 d9             	add    %rbx,%rcx
ffff8000001087c1:	ff d1                	callq  *%rcx
ffff8000001087c3:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
ffff8000001087c7:	83 7d ec 37          	cmpl   $0x37,-0x14(%rbp)
ffff8000001087cb:	7e bc                	jle    ffff800000108789 <init_interrupt+0x28>
ffff8000001087cd:	48 b8 cf 18 00 00 00 	movabs $0x18cf,%rax
ffff8000001087d4:	00 00 00 
ffff8000001087d7:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001087db:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001087e0:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001087e5:	49 89 df             	mov    %rbx,%r15
ffff8000001087e8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001087ed:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff8000001087f4:	ff ff ff 
ffff8000001087f7:	48 01 d9             	add    %rbx,%rcx
ffff8000001087fa:	ff d1                	callq  *%rcx
ffff8000001087fc:	be 11 00 00 00       	mov    $0x11,%esi
ffff800000108801:	bf 20 00 00 00       	mov    $0x20,%edi
ffff800000108806:	49 89 df             	mov    %rbx,%r15
ffff800000108809:	48 b8 ff b4 ff ff ff 	movabs $0xffffffffffffb4ff,%rax
ffff800000108810:	ff ff ff 
ffff800000108813:	48 01 d8             	add    %rbx,%rax
ffff800000108816:	ff d0                	callq  *%rax
ffff800000108818:	be 20 00 00 00       	mov    $0x20,%esi
ffff80000010881d:	bf 21 00 00 00       	mov    $0x21,%edi
ffff800000108822:	49 89 df             	mov    %rbx,%r15
ffff800000108825:	48 b8 ff b4 ff ff ff 	movabs $0xffffffffffffb4ff,%rax
ffff80000010882c:	ff ff ff 
ffff80000010882f:	48 01 d8             	add    %rbx,%rax
ffff800000108832:	ff d0                	callq  *%rax
ffff800000108834:	be 04 00 00 00       	mov    $0x4,%esi
ffff800000108839:	bf 21 00 00 00       	mov    $0x21,%edi
ffff80000010883e:	49 89 df             	mov    %rbx,%r15
ffff800000108841:	48 b8 ff b4 ff ff ff 	movabs $0xffffffffffffb4ff,%rax
ffff800000108848:	ff ff ff 
ffff80000010884b:	48 01 d8             	add    %rbx,%rax
ffff80000010884e:	ff d0                	callq  *%rax
ffff800000108850:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000108855:	bf 21 00 00 00       	mov    $0x21,%edi
ffff80000010885a:	49 89 df             	mov    %rbx,%r15
ffff80000010885d:	48 b8 ff b4 ff ff ff 	movabs $0xffffffffffffb4ff,%rax
ffff800000108864:	ff ff ff 
ffff800000108867:	48 01 d8             	add    %rbx,%rax
ffff80000010886a:	ff d0                	callq  *%rax
ffff80000010886c:	be 11 00 00 00       	mov    $0x11,%esi
ffff800000108871:	bf a0 00 00 00       	mov    $0xa0,%edi
ffff800000108876:	49 89 df             	mov    %rbx,%r15
ffff800000108879:	48 b8 ff b4 ff ff ff 	movabs $0xffffffffffffb4ff,%rax
ffff800000108880:	ff ff ff 
ffff800000108883:	48 01 d8             	add    %rbx,%rax
ffff800000108886:	ff d0                	callq  *%rax
ffff800000108888:	be 28 00 00 00       	mov    $0x28,%esi
ffff80000010888d:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff800000108892:	49 89 df             	mov    %rbx,%r15
ffff800000108895:	48 b8 ff b4 ff ff ff 	movabs $0xffffffffffffb4ff,%rax
ffff80000010889c:	ff ff ff 
ffff80000010889f:	48 01 d8             	add    %rbx,%rax
ffff8000001088a2:	ff d0                	callq  *%rax
ffff8000001088a4:	be 02 00 00 00       	mov    $0x2,%esi
ffff8000001088a9:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff8000001088ae:	49 89 df             	mov    %rbx,%r15
ffff8000001088b1:	48 b8 ff b4 ff ff ff 	movabs $0xffffffffffffb4ff,%rax
ffff8000001088b8:	ff ff ff 
ffff8000001088bb:	48 01 d8             	add    %rbx,%rax
ffff8000001088be:	ff d0                	callq  *%rax
ffff8000001088c0:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001088c5:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff8000001088ca:	49 89 df             	mov    %rbx,%r15
ffff8000001088cd:	48 b8 ff b4 ff ff ff 	movabs $0xffffffffffffb4ff,%rax
ffff8000001088d4:	ff ff ff 
ffff8000001088d7:	48 01 d8             	add    %rbx,%rax
ffff8000001088da:	ff d0                	callq  *%rax
ffff8000001088dc:	be fd 00 00 00       	mov    $0xfd,%esi
ffff8000001088e1:	bf 21 00 00 00       	mov    $0x21,%edi
ffff8000001088e6:	49 89 df             	mov    %rbx,%r15
ffff8000001088e9:	48 b8 ff b4 ff ff ff 	movabs $0xffffffffffffb4ff,%rax
ffff8000001088f0:	ff ff ff 
ffff8000001088f3:	48 01 d8             	add    %rbx,%rax
ffff8000001088f6:	ff d0                	callq  *%rax
ffff8000001088f8:	be ff 00 00 00       	mov    $0xff,%esi
ffff8000001088fd:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff800000108902:	49 89 df             	mov    %rbx,%r15
ffff800000108905:	48 b8 ff b4 ff ff ff 	movabs $0xffffffffffffb4ff,%rax
ffff80000010890c:	ff ff ff 
ffff80000010890f:	48 01 d8             	add    %rbx,%rax
ffff800000108912:	ff d0                	callq  *%rax
ffff800000108914:	fb                   	sti    
ffff800000108915:	90                   	nop
ffff800000108916:	48 83 c4 10          	add    $0x10,%rsp
ffff80000010891a:	5b                   	pop    %rbx
ffff80000010891b:	41 5f                	pop    %r15
ffff80000010891d:	5d                   	pop    %rbp
ffff80000010891e:	c3                   	retq   

ffff80000010891f <do_IRQ>:
ffff80000010891f:	55                   	push   %rbp
ffff800000108920:	48 89 e5             	mov    %rsp,%rbp
ffff800000108923:	41 57                	push   %r15
ffff800000108925:	53                   	push   %rbx
ffff800000108926:	48 83 ec 20          	sub    $0x20,%rsp
ffff80000010892a:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff80000010892a <do_IRQ+0xb>
ffff800000108931:	49 bb fe 3f 00 00 00 	movabs $0x3ffe,%r11
ffff800000108938:	00 00 00 
ffff80000010893b:	4c 01 db             	add    %r11,%rbx
ffff80000010893e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000108942:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000108946:	bf 60 00 00 00       	mov    $0x60,%edi
ffff80000010894b:	49 89 df             	mov    %rbx,%r15
ffff80000010894e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108953:	48 ba 31 b5 ff ff ff 	movabs $0xffffffffffffb531,%rdx
ffff80000010895a:	ff ff ff 
ffff80000010895d:	48 01 da             	add    %rbx,%rdx
ffff800000108960:	ff d2                	callq  *%rdx
ffff800000108962:	88 45 ef             	mov    %al,-0x11(%rbp)
ffff800000108965:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
ffff800000108969:	89 c1                	mov    %eax,%ecx
ffff80000010896b:	48 b8 dc 18 00 00 00 	movabs $0x18dc,%rax
ffff800000108972:	00 00 00 
ffff800000108975:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000108979:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010897e:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108983:	49 89 df             	mov    %rbx,%r15
ffff800000108986:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010898b:	49 b8 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r8
ffff800000108992:	ff ff ff 
ffff800000108995:	49 01 d8             	add    %rbx,%r8
ffff800000108998:	41 ff d0             	callq  *%r8
ffff80000010899b:	be 20 00 00 00       	mov    $0x20,%esi
ffff8000001089a0:	bf 20 00 00 00       	mov    $0x20,%edi
ffff8000001089a5:	49 89 df             	mov    %rbx,%r15
ffff8000001089a8:	48 b8 ff b4 ff ff ff 	movabs $0xffffffffffffb4ff,%rax
ffff8000001089af:	ff ff ff 
ffff8000001089b2:	48 01 d8             	add    %rbx,%rax
ffff8000001089b5:	ff d0                	callq  *%rax
ffff8000001089b7:	90                   	nop
ffff8000001089b8:	48 83 c4 20          	add    $0x20,%rsp
ffff8000001089bc:	5b                   	pop    %rbx
ffff8000001089bd:	41 5f                	pop    %r15
ffff8000001089bf:	5d                   	pop    %rbp
ffff8000001089c0:	c3                   	retq   
ffff8000001089c1:	55                   	push   %rbp
ffff8000001089c2:	48 89 e5             	mov    %rsp,%rbp
ffff8000001089c5:	53                   	push   %rbx
ffff8000001089c6:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff8000001089c6 <do_IRQ+0xa7>
ffff8000001089cd:	49 bb 62 3f 00 00 00 	movabs $0x3f62,%r11
ffff8000001089d4:	00 00 00 
ffff8000001089d7:	4c 01 d8             	add    %r11,%rax
ffff8000001089da:	89 7d f4             	mov    %edi,-0xc(%rbp)
ffff8000001089dd:	89 75 f0             	mov    %esi,-0x10(%rbp)
ffff8000001089e0:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff8000001089e4:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
ffff8000001089e8:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
ffff8000001089ec:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
ffff8000001089f0:	8b 45 f4             	mov    -0xc(%rbp),%eax
ffff8000001089f3:	8b 55 f0             	mov    -0x10(%rbp),%edx
ffff8000001089f6:	89 d1                	mov    %edx,%ecx
ffff8000001089f8:	0f a2                	cpuid  
ffff8000001089fa:	89 de                	mov    %ebx,%esi
ffff8000001089fc:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
ffff800000108a00:	89 07                	mov    %eax,(%rdi)
ffff800000108a02:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000108a06:	89 30                	mov    %esi,(%rax)
ffff800000108a08:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108a0c:	89 08                	mov    %ecx,(%rax)
ffff800000108a0e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000108a12:	89 10                	mov    %edx,(%rax)
ffff800000108a14:	90                   	nop
ffff800000108a15:	5b                   	pop    %rbx
ffff800000108a16:	5d                   	pop    %rbp
ffff800000108a17:	c3                   	retq   
ffff800000108a18:	55                   	push   %rbp
ffff800000108a19:	48 89 e5             	mov    %rsp,%rbp
ffff800000108a1c:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108a1c <do_IRQ+0xfd>
ffff800000108a23:	49 bb 0c 3f 00 00 00 	movabs $0x3f0c,%r11
ffff800000108a2a:	00 00 00 
ffff800000108a2d:	4c 01 d8             	add    %r11,%rax
ffff800000108a30:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
ffff800000108a37:	00 
ffff800000108a38:	48 c7 c0 00 80 ff ff 	mov    $0xffffffffffff8000,%rax
ffff800000108a3f:	48 21 e0             	and    %rsp,%rax
ffff800000108a42:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108a46:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108a4a:	5d                   	pop    %rbp
ffff800000108a4b:	c3                   	retq   
ffff800000108a4c:	55                   	push   %rbp
ffff800000108a4d:	48 89 e5             	mov    %rsp,%rbp
ffff800000108a50:	41 57                	push   %r15
ffff800000108a52:	48 83 ec 18          	sub    $0x18,%rsp
ffff800000108a56:	4c 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%r8        # ffff800000108a56 <do_IRQ+0x137>
ffff800000108a5d:	49 bb d2 3e 00 00 00 	movabs $0x3ed2,%r11
ffff800000108a64:	00 00 00 
ffff800000108a67:	4d 01 d8             	add    %r11,%r8
ffff800000108a6a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000108a6e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108a72:	48 8b 80 80 00 00 00 	mov    0x80(%rax),%rax
ffff800000108a79:	48 89 c1             	mov    %rax,%rcx
ffff800000108a7c:	48 b8 e8 18 00 00 00 	movabs $0x18e8,%rax
ffff800000108a83:	00 00 00 
ffff800000108a86:	49 8d 14 00          	lea    (%r8,%rax,1),%rdx
ffff800000108a8a:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108a8f:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108a94:	4d 89 c7             	mov    %r8,%r15
ffff800000108a97:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108a9c:	49 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r9
ffff800000108aa3:	ff ff ff 
ffff800000108aa6:	4d 01 c1             	add    %r8,%r9
ffff800000108aa9:	41 ff d1             	callq  *%r9
ffff800000108aac:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffff800000108ab3:	48 83 c4 18          	add    $0x18,%rsp
ffff800000108ab7:	41 5f                	pop    %r15
ffff800000108ab9:	5d                   	pop    %rbp
ffff800000108aba:	c3                   	retq   
ffff800000108abb:	55                   	push   %rbp
ffff800000108abc:	48 89 e5             	mov    %rsp,%rbp
ffff800000108abf:	41 57                	push   %r15
ffff800000108ac1:	48 83 ec 18          	sub    $0x18,%rsp
ffff800000108ac5:	48 8d 0d f9 ff ff ff 	lea    -0x7(%rip),%rcx        # ffff800000108ac5 <do_IRQ+0x1a6>
ffff800000108acc:	49 bb 63 3e 00 00 00 	movabs $0x3e63,%r11
ffff800000108ad3:	00 00 00 
ffff800000108ad6:	4c 01 d9             	add    %r11,%rcx
ffff800000108ad9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000108add:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108ae1:	48 8b 40 60          	mov    0x60(%rax),%rax
ffff800000108ae5:	48 89 c2             	mov    %rax,%rdx
ffff800000108ae8:	be ff ff ff 00       	mov    $0xffffff,%esi
ffff800000108aed:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000108af2:	49 89 cf             	mov    %rcx,%r15
ffff800000108af5:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108afa:	49 b8 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r8
ffff800000108b01:	ff ff ff 
ffff800000108b04:	49 01 c8             	add    %rcx,%r8
ffff800000108b07:	41 ff d0             	callq  *%r8
ffff800000108b0a:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000108b0f:	48 83 c4 18          	add    $0x18,%rsp
ffff800000108b13:	41 5f                	pop    %r15
ffff800000108b15:	5d                   	pop    %rbp
ffff800000108b16:	c3                   	retq   
ffff800000108b17:	55                   	push   %rbp
ffff800000108b18:	48 89 e5             	mov    %rsp,%rbp
ffff800000108b1b:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108b1b <do_IRQ+0x1fc>
ffff800000108b22:	49 bb 0d 3e 00 00 00 	movabs $0x3e0d,%r11
ffff800000108b29:	00 00 00 
ffff800000108b2c:	4c 01 d8             	add    %r11,%rax
ffff800000108b2f:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
ffff800000108b33:	89 f9                	mov    %edi,%ecx
ffff800000108b35:	88 4d ec             	mov    %cl,-0x14(%rbp)
ffff800000108b38:	89 f1                	mov    %esi,%ecx
ffff800000108b3a:	88 4d e8             	mov    %cl,-0x18(%rbp)
ffff800000108b3d:	88 55 e4             	mov    %dl,-0x1c(%rbp)
ffff800000108b40:	0f b6 55 ec          	movzbl -0x14(%rbp),%edx
ffff800000108b44:	48 63 d2             	movslq %edx,%rdx
ffff800000108b47:	48 89 d1             	mov    %rdx,%rcx
ffff800000108b4a:	48 c1 e1 04          	shl    $0x4,%rcx
ffff800000108b4e:	48 ba 10 ff ff ff ff 	movabs $0xffffffffffffff10,%rdx
ffff800000108b55:	ff ff ff 
ffff800000108b58:	48 8b 04 10          	mov    (%rax,%rdx,1),%rax
ffff800000108b5c:	48 01 c8             	add    %rcx,%rax
ffff800000108b5f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108b63:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108b67:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff800000108b6b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108b6f:	89 c2                	mov    %eax,%edx
ffff800000108b71:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108b75:	66 89 10             	mov    %dx,(%rax)
ffff800000108b78:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108b7c:	66 c7 40 02 08 00    	movw   $0x8,0x2(%rax)
ffff800000108b82:	0f b6 45 e4          	movzbl -0x1c(%rbp),%eax
ffff800000108b86:	c1 e0 08             	shl    $0x8,%eax
ffff800000108b89:	89 c2                	mov    %eax,%edx
ffff800000108b8b:	0f b6 45 e8          	movzbl -0x18(%rbp),%eax
ffff800000108b8f:	09 d0                	or     %edx,%eax
ffff800000108b91:	89 c2                	mov    %eax,%edx
ffff800000108b93:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108b97:	66 89 50 04          	mov    %dx,0x4(%rax)
ffff800000108b9b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108b9f:	48 c1 e8 10          	shr    $0x10,%rax
ffff800000108ba3:	89 c2                	mov    %eax,%edx
ffff800000108ba5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108ba9:	66 89 50 06          	mov    %dx,0x6(%rax)
ffff800000108bad:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108bb1:	48 c1 e8 20          	shr    $0x20,%rax
ffff800000108bb5:	89 c2                	mov    %eax,%edx
ffff800000108bb7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108bbb:	89 50 08             	mov    %edx,0x8(%rax)
ffff800000108bbe:	90                   	nop
ffff800000108bbf:	5d                   	pop    %rbp
ffff800000108bc0:	c3                   	retq   
ffff800000108bc1:	55                   	push   %rbp
ffff800000108bc2:	48 89 e5             	mov    %rsp,%rbp
ffff800000108bc5:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108bc9:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108bc9 <do_IRQ+0x2aa>
ffff800000108bd0:	49 bb 5f 3d 00 00 00 	movabs $0x3d5f,%r11
ffff800000108bd7:	00 00 00 
ffff800000108bda:	4c 01 d8             	add    %r11,%rax
ffff800000108bdd:	89 f1                	mov    %esi,%ecx
ffff800000108bdf:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff800000108be3:	89 fa                	mov    %edi,%edx
ffff800000108be5:	88 55 fc             	mov    %dl,-0x4(%rbp)
ffff800000108be8:	89 ca                	mov    %ecx,%edx
ffff800000108bea:	88 55 f8             	mov    %dl,-0x8(%rbp)
ffff800000108bed:	0f b6 75 f8          	movzbl -0x8(%rbp),%esi
ffff800000108bf1:	0f b6 7d fc          	movzbl -0x4(%rbp),%edi
ffff800000108bf5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000108bf9:	48 89 d1             	mov    %rdx,%rcx
ffff800000108bfc:	ba 8e 00 00 00       	mov    $0x8e,%edx
ffff800000108c01:	49 b8 4f 79 ff ff ff 	movabs $0xffffffffffff794f,%r8
ffff800000108c08:	ff ff ff 
ffff800000108c0b:	4a 8d 04 00          	lea    (%rax,%r8,1),%rax
ffff800000108c0f:	ff d0                	callq  *%rax
ffff800000108c11:	90                   	nop
ffff800000108c12:	c9                   	leaveq 
ffff800000108c13:	c3                   	retq   
ffff800000108c14:	55                   	push   %rbp
ffff800000108c15:	48 89 e5             	mov    %rsp,%rbp
ffff800000108c18:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108c1c:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108c1c <do_IRQ+0x2fd>
ffff800000108c23:	49 bb 0c 3d 00 00 00 	movabs $0x3d0c,%r11
ffff800000108c2a:	00 00 00 
ffff800000108c2d:	4c 01 d8             	add    %r11,%rax
ffff800000108c30:	89 f1                	mov    %esi,%ecx
ffff800000108c32:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff800000108c36:	89 fa                	mov    %edi,%edx
ffff800000108c38:	88 55 fc             	mov    %dl,-0x4(%rbp)
ffff800000108c3b:	89 ca                	mov    %ecx,%edx
ffff800000108c3d:	88 55 f8             	mov    %dl,-0x8(%rbp)
ffff800000108c40:	0f b6 75 f8          	movzbl -0x8(%rbp),%esi
ffff800000108c44:	0f b6 7d fc          	movzbl -0x4(%rbp),%edi
ffff800000108c48:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000108c4c:	48 89 d1             	mov    %rdx,%rcx
ffff800000108c4f:	ba 8f 00 00 00       	mov    $0x8f,%edx
ffff800000108c54:	49 b8 4f 79 ff ff ff 	movabs $0xffffffffffff794f,%r8
ffff800000108c5b:	ff ff ff 
ffff800000108c5e:	4a 8d 04 00          	lea    (%rax,%r8,1),%rax
ffff800000108c62:	ff d0                	callq  *%rax
ffff800000108c64:	90                   	nop
ffff800000108c65:	c9                   	leaveq 
ffff800000108c66:	c3                   	retq   
ffff800000108c67:	55                   	push   %rbp
ffff800000108c68:	48 89 e5             	mov    %rsp,%rbp
ffff800000108c6b:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108c6f:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108c6f <do_IRQ+0x350>
ffff800000108c76:	49 bb b9 3c 00 00 00 	movabs $0x3cb9,%r11
ffff800000108c7d:	00 00 00 
ffff800000108c80:	4c 01 d8             	add    %r11,%rax
ffff800000108c83:	89 f1                	mov    %esi,%ecx
ffff800000108c85:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff800000108c89:	89 fa                	mov    %edi,%edx
ffff800000108c8b:	88 55 fc             	mov    %dl,-0x4(%rbp)
ffff800000108c8e:	89 ca                	mov    %ecx,%edx
ffff800000108c90:	88 55 f8             	mov    %dl,-0x8(%rbp)
ffff800000108c93:	0f b6 75 f8          	movzbl -0x8(%rbp),%esi
ffff800000108c97:	0f b6 7d fc          	movzbl -0x4(%rbp),%edi
ffff800000108c9b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000108c9f:	48 89 d1             	mov    %rdx,%rcx
ffff800000108ca2:	ba ef 00 00 00       	mov    $0xef,%edx
ffff800000108ca7:	49 b8 4f 79 ff ff ff 	movabs $0xffffffffffff794f,%r8
ffff800000108cae:	ff ff ff 
ffff800000108cb1:	4a 8d 04 00          	lea    (%rax,%r8,1),%rax
ffff800000108cb5:	ff d0                	callq  *%rax
ffff800000108cb7:	90                   	nop
ffff800000108cb8:	c9                   	leaveq 
ffff800000108cb9:	c3                   	retq   
ffff800000108cba:	55                   	push   %rbp
ffff800000108cbb:	48 89 e5             	mov    %rsp,%rbp
ffff800000108cbe:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108cc2:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108cc2 <do_IRQ+0x3a3>
ffff800000108cc9:	49 bb 66 3c 00 00 00 	movabs $0x3c66,%r11
ffff800000108cd0:	00 00 00 
ffff800000108cd3:	4c 01 d8             	add    %r11,%rax
ffff800000108cd6:	89 f1                	mov    %esi,%ecx
ffff800000108cd8:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff800000108cdc:	89 fa                	mov    %edi,%edx
ffff800000108cde:	88 55 fc             	mov    %dl,-0x4(%rbp)
ffff800000108ce1:	89 ca                	mov    %ecx,%edx
ffff800000108ce3:	88 55 f8             	mov    %dl,-0x8(%rbp)
ffff800000108ce6:	0f b6 75 f8          	movzbl -0x8(%rbp),%esi
ffff800000108cea:	0f b6 7d fc          	movzbl -0x4(%rbp),%edi
ffff800000108cee:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000108cf2:	48 89 d1             	mov    %rdx,%rcx
ffff800000108cf5:	ba ee 00 00 00       	mov    $0xee,%edx
ffff800000108cfa:	49 b8 4f 79 ff ff ff 	movabs $0xffffffffffff794f,%r8
ffff800000108d01:	ff ff ff 
ffff800000108d04:	4a 8d 04 00          	lea    (%rax,%r8,1),%rax
ffff800000108d08:	ff d0                	callq  *%rax
ffff800000108d0a:	90                   	nop
ffff800000108d0b:	c9                   	leaveq 
ffff800000108d0c:	c3                   	retq   
ffff800000108d0d:	55                   	push   %rbp
ffff800000108d0e:	48 89 e5             	mov    %rsp,%rbp
ffff800000108d11:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108d11 <do_IRQ+0x3f2>
ffff800000108d18:	49 bb 17 3c 00 00 00 	movabs $0x3c17,%r11
ffff800000108d1f:	00 00 00 
ffff800000108d22:	4c 01 d8             	add    %r11,%rax
ffff800000108d25:	89 7d fc             	mov    %edi,-0x4(%rbp)
ffff800000108d28:	89 75 f8             	mov    %esi,-0x8(%rbp)
ffff800000108d2b:	89 55 f4             	mov    %edx,-0xc(%rbp)
ffff800000108d2e:	89 4d f0             	mov    %ecx,-0x10(%rbp)
ffff800000108d31:	44 89 45 ec          	mov    %r8d,-0x14(%rbp)
ffff800000108d35:	44 89 4d e8          	mov    %r9d,-0x18(%rbp)
ffff800000108d39:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108d40:	ff ff ff 
ffff800000108d43:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108d47:	48 8d 52 04          	lea    0x4(%rdx),%rdx
ffff800000108d4b:	8b 4d fc             	mov    -0x4(%rbp),%ecx
ffff800000108d4e:	89 0a                	mov    %ecx,(%rdx)
ffff800000108d50:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108d57:	ff ff ff 
ffff800000108d5a:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108d5e:	48 8d 52 0c          	lea    0xc(%rdx),%rdx
ffff800000108d62:	8b 4d f8             	mov    -0x8(%rbp),%ecx
ffff800000108d65:	89 0a                	mov    %ecx,(%rdx)
ffff800000108d67:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108d6e:	ff ff ff 
ffff800000108d71:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108d75:	48 8d 52 14          	lea    0x14(%rdx),%rdx
ffff800000108d79:	8b 4d f4             	mov    -0xc(%rbp),%ecx
ffff800000108d7c:	89 0a                	mov    %ecx,(%rdx)
ffff800000108d7e:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108d85:	ff ff ff 
ffff800000108d88:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108d8c:	48 8d 52 24          	lea    0x24(%rdx),%rdx
ffff800000108d90:	8b 4d f0             	mov    -0x10(%rbp),%ecx
ffff800000108d93:	89 0a                	mov    %ecx,(%rdx)
ffff800000108d95:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108d9c:	ff ff ff 
ffff800000108d9f:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108da3:	48 8d 52 2c          	lea    0x2c(%rdx),%rdx
ffff800000108da7:	8b 4d ec             	mov    -0x14(%rbp),%ecx
ffff800000108daa:	89 0a                	mov    %ecx,(%rdx)
ffff800000108dac:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108db3:	ff ff ff 
ffff800000108db6:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108dba:	48 8d 52 34          	lea    0x34(%rdx),%rdx
ffff800000108dbe:	8b 4d e8             	mov    -0x18(%rbp),%ecx
ffff800000108dc1:	89 0a                	mov    %ecx,(%rdx)
ffff800000108dc3:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108dca:	ff ff ff 
ffff800000108dcd:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108dd1:	48 8d 52 3c          	lea    0x3c(%rdx),%rdx
ffff800000108dd5:	8b 4d 10             	mov    0x10(%rbp),%ecx
ffff800000108dd8:	89 0a                	mov    %ecx,(%rdx)
ffff800000108dda:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108de1:	ff ff ff 
ffff800000108de4:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108de8:	48 8d 52 44          	lea    0x44(%rdx),%rdx
ffff800000108dec:	8b 4d 18             	mov    0x18(%rbp),%ecx
ffff800000108def:	89 0a                	mov    %ecx,(%rdx)
ffff800000108df1:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108df8:	ff ff ff 
ffff800000108dfb:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108dff:	48 8d 52 4c          	lea    0x4c(%rdx),%rdx
ffff800000108e03:	8b 4d 20             	mov    0x20(%rbp),%ecx
ffff800000108e06:	89 0a                	mov    %ecx,(%rdx)
ffff800000108e08:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108e0f:	ff ff ff 
ffff800000108e12:	48 8b 04 10          	mov    (%rax,%rdx,1),%rax
ffff800000108e16:	48 8d 40 54          	lea    0x54(%rax),%rax
ffff800000108e1a:	8b 55 28             	mov    0x28(%rbp),%edx
ffff800000108e1d:	89 10                	mov    %edx,(%rax)
ffff800000108e1f:	90                   	nop
ffff800000108e20:	5d                   	pop    %rbp
ffff800000108e21:	c3                   	retq   

ffff800000108e22 <user_level_function>:
ffff800000108e22:	55                   	push   %rbp
ffff800000108e23:	48 89 e5             	mov    %rsp,%rbp
ffff800000108e26:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108e26 <user_level_function+0x4>
ffff800000108e2d:	49 bb 02 3b 00 00 00 	movabs $0x3b02,%r11
ffff800000108e34:	00 00 00 
ffff800000108e37:	4c 01 d8             	add    %r11,%rax
ffff800000108e3a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
ffff800000108e41:	00 
ffff800000108e42:	48 b8 48 65 6c 6c 6f 	movabs $0x6f57206f6c6c6548,%rax
ffff800000108e49:	20 57 6f 
ffff800000108e4c:	48 89 45 ea          	mov    %rax,-0x16(%rbp)
ffff800000108e50:	c7 45 f2 72 6c 64 21 	movl   $0x21646c72,-0xe(%rbp)
ffff800000108e57:	66 c7 45 f6 0a 00    	movw   $0xa,-0xa(%rbp)
ffff800000108e5d:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000108e62:	48 8d 55 ea          	lea    -0x16(%rbp),%rdx
ffff800000108e66:	48 89 d7             	mov    %rdx,%rdi
ffff800000108e69:	48 8d 15 05 00 00 00 	lea    0x5(%rip),%rdx        # ffff800000108e75 <sysexit_return_address>
ffff800000108e70:	48 89 e1             	mov    %rsp,%rcx
ffff800000108e73:	0f 34                	sysenter 

ffff800000108e75 <sysexit_return_address>:
ffff800000108e75:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108e79:	eb fe                	jmp    ffff800000108e79 <sysexit_return_address+0x4>

ffff800000108e7b <system_call_function>:
ffff800000108e7b:	55                   	push   %rbp
ffff800000108e7c:	48 89 e5             	mov    %rsp,%rbp
ffff800000108e7f:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108e83:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108e83 <system_call_function+0x8>
ffff800000108e8a:	49 bb a5 3a 00 00 00 	movabs $0x3aa5,%r11
ffff800000108e91:	00 00 00 
ffff800000108e94:	4c 01 d8             	add    %r11,%rax
ffff800000108e97:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108e9b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000108e9f:	48 8b 92 80 00 00 00 	mov    0x80(%rdx),%rdx
ffff800000108ea6:	48 b9 d8 03 00 00 00 	movabs $0x3d8,%rcx
ffff800000108ead:	00 00 00 
ffff800000108eb0:	48 01 c8             	add    %rcx,%rax
ffff800000108eb3:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
ffff800000108eb7:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000108ebb:	48 89 d7             	mov    %rdx,%rdi
ffff800000108ebe:	ff d0                	callq  *%rax
ffff800000108ec0:	c9                   	leaveq 
ffff800000108ec1:	c3                   	retq   

ffff800000108ec2 <do_execve>:
ffff800000108ec2:	55                   	push   %rbp
ffff800000108ec3:	48 89 e5             	mov    %rsp,%rbp
ffff800000108ec6:	41 57                	push   %r15
ffff800000108ec8:	53                   	push   %rbx
ffff800000108ec9:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108ecd:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000108ecd <do_execve+0xb>
ffff800000108ed4:	49 bb 5b 3a 00 00 00 	movabs $0x3a5b,%r11
ffff800000108edb:	00 00 00 
ffff800000108ede:	4c 01 db             	add    %r11,%rbx
ffff800000108ee1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000108ee5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108ee9:	48 c7 40 50 00 00 80 	movq   $0x800000,0x50(%rax)
ffff800000108ef0:	00 
ffff800000108ef1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108ef5:	48 c7 40 48 00 00 a0 	movq   $0xa00000,0x48(%rax)
ffff800000108efc:	00 
ffff800000108efd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108f01:	48 c7 80 80 00 00 00 	movq   $0x0,0x80(%rax)
ffff800000108f08:	00 00 00 00 
ffff800000108f0c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108f10:	48 c7 40 70 00 00 00 	movq   $0x0,0x70(%rax)
ffff800000108f17:	00 
ffff800000108f18:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108f1c:	48 c7 40 78 00 00 00 	movq   $0x0,0x78(%rax)
ffff800000108f23:	00 
ffff800000108f24:	48 b8 09 19 00 00 00 	movabs $0x1909,%rax
ffff800000108f2b:	00 00 00 
ffff800000108f2e:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000108f32:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108f37:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108f3c:	49 89 df             	mov    %rbx,%r15
ffff800000108f3f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108f44:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff800000108f4b:	ff ff ff 
ffff800000108f4e:	48 01 d9             	add    %rbx,%rcx
ffff800000108f51:	ff d1                	callq  *%rcx
ffff800000108f53:	ba 00 04 00 00       	mov    $0x400,%edx
ffff800000108f58:	be 00 00 80 00       	mov    $0x800000,%esi
ffff800000108f5d:	48 b8 fa c4 ff ff ff 	movabs $0xffffffffffffc4fa,%rax
ffff800000108f64:	ff ff ff 
ffff800000108f67:	48 8d 3c 03          	lea    (%rbx,%rax,1),%rdi
ffff800000108f6b:	49 89 df             	mov    %rbx,%r15
ffff800000108f6e:	48 b8 4b b4 ff ff ff 	movabs $0xffffffffffffb44b,%rax
ffff800000108f75:	ff ff ff 
ffff800000108f78:	48 01 d8             	add    %rbx,%rax
ffff800000108f7b:	ff d0                	callq  *%rax
ffff800000108f7d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108f82:	48 83 c4 10          	add    $0x10,%rsp
ffff800000108f86:	5b                   	pop    %rbx
ffff800000108f87:	41 5f                	pop    %r15
ffff800000108f89:	5d                   	pop    %rbp
ffff800000108f8a:	c3                   	retq   

ffff800000108f8b <kernel_thread_func>:
ffff800000108f8b:	55                   	push   %rbp
ffff800000108f8c:	48 89 e5             	mov    %rsp,%rbp
ffff800000108f8f:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108f8f <kernel_thread_func+0x4>
ffff800000108f96:	49 bb 99 39 00 00 00 	movabs $0x3999,%r11
ffff800000108f9d:	00 00 00 
ffff800000108fa0:	4c 01 d8             	add    %r11,%rax
ffff800000108fa3:	41 5f                	pop    %r15
ffff800000108fa5:	41 5e                	pop    %r14
ffff800000108fa7:	41 5d                	pop    %r13
ffff800000108fa9:	41 5c                	pop    %r12
ffff800000108fab:	41 5b                	pop    %r11
ffff800000108fad:	41 5a                	pop    %r10
ffff800000108faf:	41 59                	pop    %r9
ffff800000108fb1:	41 58                	pop    %r8
ffff800000108fb3:	5b                   	pop    %rbx
ffff800000108fb4:	59                   	pop    %rcx
ffff800000108fb5:	5a                   	pop    %rdx
ffff800000108fb6:	5e                   	pop    %rsi
ffff800000108fb7:	5f                   	pop    %rdi
ffff800000108fb8:	5d                   	pop    %rbp
ffff800000108fb9:	58                   	pop    %rax
ffff800000108fba:	48 8e d8             	mov    %rax,%ds
ffff800000108fbd:	58                   	pop    %rax
ffff800000108fbe:	48 8e c0             	mov    %rax,%es
ffff800000108fc1:	58                   	pop    %rax
ffff800000108fc2:	48 83 c4 38          	add    $0x38,%rsp
ffff800000108fc6:	48 89 cf             	mov    %rcx,%rdi
ffff800000108fc9:	ff d1                	callq  *%rcx
ffff800000108fcb:	48 89 c7             	mov    %rax,%rdi
ffff800000108fce:	e8 02 0a 00 00       	callq  ffff8000001099d5 <do_exit>
ffff800000108fd3:	90                   	nop
ffff800000108fd4:	5d                   	pop    %rbp
ffff800000108fd5:	c3                   	retq   

ffff800000108fd6 <init>:
ffff800000108fd6:	55                   	push   %rbp
ffff800000108fd7:	48 89 e5             	mov    %rsp,%rbp
ffff800000108fda:	41 57                	push   %r15
ffff800000108fdc:	41 54                	push   %r12
ffff800000108fde:	53                   	push   %rbx
ffff800000108fdf:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000108fe3:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000108fe3 <init+0xd>
ffff800000108fea:	49 bb 45 39 00 00 00 	movabs $0x3945,%r11
ffff800000108ff1:	00 00 00 
ffff800000108ff4:	4c 01 db             	add    %r11,%rbx
ffff800000108ff7:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
ffff800000108ffb:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000108fff:	48 89 c1             	mov    %rax,%rcx
ffff800000109002:	48 b8 24 19 00 00 00 	movabs $0x1924,%rax
ffff800000109009:	00 00 00 
ffff80000010900c:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000109010:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109015:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010901a:	49 89 df             	mov    %rbx,%r15
ffff80000010901d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109022:	49 b8 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r8
ffff800000109029:	ff ff ff 
ffff80000010902c:	49 01 d8             	add    %rbx,%r8
ffff80000010902f:	41 ff d0             	callq  *%r8
ffff800000109032:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109037:	48 ba b1 7c ff ff ff 	movabs $0xffffffffffff7cb1,%rdx
ffff80000010903e:	ff ff ff 
ffff800000109041:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff800000109045:	ff d2                	callq  *%rdx
ffff800000109047:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff80000010904b:	48 ba f8 fe ff ff ff 	movabs $0xfffffffffffffef8,%rdx
ffff800000109052:	ff ff ff 
ffff800000109055:	48 8b 14 13          	mov    (%rbx,%rdx,1),%rdx
ffff800000109059:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff80000010905d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109062:	48 ba b1 7c ff ff ff 	movabs $0xffffffffffff7cb1,%rdx
ffff800000109069:	ff ff ff 
ffff80000010906c:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff800000109070:	ff d2                	callq  *%rdx
ffff800000109072:	49 89 c4             	mov    %rax,%r12
ffff800000109075:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010907a:	48 ba b1 7c ff ff ff 	movabs $0xffffffffffff7cb1,%rdx
ffff800000109081:	ff ff ff 
ffff800000109084:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff800000109088:	ff d2                	callq  *%rdx
ffff80000010908a:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff80000010908e:	49 8d 94 24 40 7f 00 	lea    0x7f40(%r12),%rdx
ffff800000109095:	00 
ffff800000109096:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff80000010909a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010909f:	48 ba b1 7c ff ff ff 	movabs $0xffffffffffff7cb1,%rdx
ffff8000001090a6:	ff ff ff 
ffff8000001090a9:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff8000001090ad:	ff d2                	callq  *%rdx
ffff8000001090af:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff8000001090b3:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff8000001090b7:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff8000001090bb:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001090c0:	48 ba b1 7c ff ff ff 	movabs $0xffffffffffff7cb1,%rdx
ffff8000001090c7:	ff ff ff 
ffff8000001090ca:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff8000001090ce:	ff d2                	callq  *%rdx
ffff8000001090d0:	4c 8b 60 28          	mov    0x28(%rax),%r12
ffff8000001090d4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001090d9:	48 ba b1 7c ff ff ff 	movabs $0xffffffffffff7cb1,%rdx
ffff8000001090e0:	ff ff ff 
ffff8000001090e3:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff8000001090e7:	ff d2                	callq  *%rdx
ffff8000001090e9:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff8000001090ed:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001090f1:	48 89 c7             	mov    %rax,%rdi
ffff8000001090f4:	49 8b 64 24 10       	mov    0x10(%r12),%rsp
ffff8000001090f9:	ff 72 08             	pushq  0x8(%rdx)
ffff8000001090fc:	e9 c1 fd ff ff       	jmpq   ffff800000108ec2 <do_execve>
ffff800000109101:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000109106:	48 83 c4 28          	add    $0x28,%rsp
ffff80000010910a:	5b                   	pop    %rbx
ffff80000010910b:	41 5c                	pop    %r12
ffff80000010910d:	41 5f                	pop    %r15
ffff80000010910f:	5d                   	pop    %rbp
ffff800000109110:	c3                   	retq   

ffff800000109111 <__switch_to>:
ffff800000109111:	55                   	push   %rbp
ffff800000109112:	48 89 e5             	mov    %rsp,%rbp
ffff800000109115:	41 55                	push   %r13
ffff800000109117:	41 54                	push   %r12
ffff800000109119:	53                   	push   %rbx
ffff80000010911a:	48 83 ec 10          	sub    $0x10,%rsp
ffff80000010911e:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010911e <__switch_to+0xd>
ffff800000109125:	49 bb 0a 38 00 00 00 	movabs $0x380a,%r11
ffff80000010912c:	00 00 00 
ffff80000010912f:	4c 01 d8             	add    %r11,%rax
ffff800000109132:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
ffff800000109136:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
ffff80000010913a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff80000010913e:	48 8b 52 28          	mov    0x28(%rdx),%rdx
ffff800000109142:	48 8b 0a             	mov    (%rdx),%rcx
ffff800000109145:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff80000010914c:	00 00 00 
ffff80000010914f:	48 89 4c 10 04       	mov    %rcx,0x4(%rax,%rdx,1)
ffff800000109154:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff80000010915b:	00 00 00 
ffff80000010915e:	48 8b 54 10 54       	mov    0x54(%rax,%rdx,1),%rdx
ffff800000109163:	89 d3                	mov    %edx,%ebx
ffff800000109165:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff80000010916c:	00 00 00 
ffff80000010916f:	48 8b 54 10 4c       	mov    0x4c(%rax,%rdx,1),%rdx
ffff800000109174:	41 89 d3             	mov    %edx,%r11d
ffff800000109177:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff80000010917e:	00 00 00 
ffff800000109181:	48 8b 54 10 44       	mov    0x44(%rax,%rdx,1),%rdx
ffff800000109186:	41 89 d1             	mov    %edx,%r9d
ffff800000109189:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff800000109190:	00 00 00 
ffff800000109193:	48 8b 54 10 3c       	mov    0x3c(%rax,%rdx,1),%rdx
ffff800000109198:	41 89 d0             	mov    %edx,%r8d
ffff80000010919b:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff8000001091a2:	00 00 00 
ffff8000001091a5:	48 8b 54 10 34       	mov    0x34(%rax,%rdx,1),%rdx
ffff8000001091aa:	41 89 d5             	mov    %edx,%r13d
ffff8000001091ad:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff8000001091b4:	00 00 00 
ffff8000001091b7:	48 8b 54 10 2c       	mov    0x2c(%rax,%rdx,1),%rdx
ffff8000001091bc:	41 89 d4             	mov    %edx,%r12d
ffff8000001091bf:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff8000001091c6:	00 00 00 
ffff8000001091c9:	48 8b 54 10 24       	mov    0x24(%rax,%rdx,1),%rdx
ffff8000001091ce:	89 d1                	mov    %edx,%ecx
ffff8000001091d0:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff8000001091d7:	00 00 00 
ffff8000001091da:	48 8b 54 10 14       	mov    0x14(%rax,%rdx,1),%rdx
ffff8000001091df:	41 89 d2             	mov    %edx,%r10d
ffff8000001091e2:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff8000001091e9:	00 00 00 
ffff8000001091ec:	48 8b 54 10 0c       	mov    0xc(%rax,%rdx,1),%rdx
ffff8000001091f1:	89 d6                	mov    %edx,%esi
ffff8000001091f3:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff8000001091fa:	00 00 00 
ffff8000001091fd:	48 8b 54 10 04       	mov    0x4(%rax,%rdx,1),%rdx
ffff800000109202:	89 d7                	mov    %edx,%edi
ffff800000109204:	53                   	push   %rbx
ffff800000109205:	41 53                	push   %r11
ffff800000109207:	41 51                	push   %r9
ffff800000109209:	41 50                	push   %r8
ffff80000010920b:	45 89 e9             	mov    %r13d,%r9d
ffff80000010920e:	45 89 e0             	mov    %r12d,%r8d
ffff800000109211:	44 89 d2             	mov    %r10d,%edx
ffff800000109214:	49 ba 45 7b ff ff ff 	movabs $0xffffffffffff7b45,%r10
ffff80000010921b:	ff ff ff 
ffff80000010921e:	4a 8d 04 10          	lea    (%rax,%r10,1),%rax
ffff800000109222:	ff d0                	callq  *%rax
ffff800000109224:	48 83 c4 20          	add    $0x20,%rsp
ffff800000109228:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010922c:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff800000109230:	48 8c e0             	mov    %fs,%rax
ffff800000109233:	48 89 42 18          	mov    %rax,0x18(%rdx)
ffff800000109237:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010923b:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff80000010923f:	48 8c e8             	mov    %gs,%rax
ffff800000109242:	48 89 42 20          	mov    %rax,0x20(%rdx)
ffff800000109246:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010924a:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff80000010924e:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109252:	48 8e e0             	mov    %rax,%fs
ffff800000109255:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000109259:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff80000010925d:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff800000109261:	48 8e e8             	mov    %rax,%gs
ffff800000109264:	90                   	nop
ffff800000109265:	48 8d 65 e8          	lea    -0x18(%rbp),%rsp
ffff800000109269:	5b                   	pop    %rbx
ffff80000010926a:	41 5c                	pop    %r12
ffff80000010926c:	41 5d                	pop    %r13
ffff80000010926e:	5d                   	pop    %rbp
ffff80000010926f:	c3                   	retq   

ffff800000109270 <task_init>:
ffff800000109270:	55                   	push   %rbp
ffff800000109271:	48 89 e5             	mov    %rsp,%rbp
ffff800000109274:	41 57                	push   %r15
ffff800000109276:	41 56                	push   %r14
ffff800000109278:	41 55                	push   %r13
ffff80000010927a:	41 54                	push   %r12
ffff80000010927c:	53                   	push   %rbx
ffff80000010927d:	48 83 ec 18          	sub    $0x18,%rsp
ffff800000109281:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000109281 <task_init+0x11>
ffff800000109288:	49 bb a7 36 00 00 00 	movabs $0x36a7,%r11
ffff80000010928f:	00 00 00 
ffff800000109292:	4c 01 db             	add    %r11,%rbx
ffff800000109295:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
ffff80000010929c:	00 
ffff80000010929d:	48 b8 e8 36 01 00 00 	movabs $0x136e8,%rax
ffff8000001092a4:	00 00 00 
ffff8000001092a7:	48 8b 14 03          	mov    (%rbx,%rax,1),%rdx
ffff8000001092ab:	48 b8 f8 36 01 00 00 	movabs $0x136f8,%rax
ffff8000001092b2:	00 00 00 
ffff8000001092b5:	48 89 14 03          	mov    %rdx,(%rbx,%rax,1)
ffff8000001092b9:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001092c0:	ff ff ff 
ffff8000001092c3:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001092c7:	48 8b 90 d0 02 00 00 	mov    0x2d0(%rax),%rdx
ffff8000001092ce:	48 b8 f8 36 01 00 00 	movabs $0x136f8,%rax
ffff8000001092d5:	00 00 00 
ffff8000001092d8:	48 89 54 03 08       	mov    %rdx,0x8(%rbx,%rax,1)
ffff8000001092dd:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001092e4:	ff ff ff 
ffff8000001092e7:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001092eb:	48 8b 90 d8 02 00 00 	mov    0x2d8(%rax),%rdx
ffff8000001092f2:	48 b8 f8 36 01 00 00 	movabs $0x136f8,%rax
ffff8000001092f9:	00 00 00 
ffff8000001092fc:	48 89 54 03 10       	mov    %rdx,0x10(%rbx,%rax,1)
ffff800000109301:	48 b8 a0 ff ff ff ff 	movabs $0xffffffffffffffa0,%rax
ffff800000109308:	ff ff ff 
ffff80000010930b:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010930f:	48 89 c2             	mov    %rax,%rdx
ffff800000109312:	48 b8 f8 36 01 00 00 	movabs $0x136f8,%rax
ffff800000109319:	00 00 00 
ffff80000010931c:	48 89 54 03 18       	mov    %rdx,0x18(%rbx,%rax,1)
ffff800000109321:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000109328:	ff ff ff 
ffff80000010932b:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010932f:	48 8b 90 e0 02 00 00 	mov    0x2e0(%rax),%rdx
ffff800000109336:	48 b8 f8 36 01 00 00 	movabs $0x136f8,%rax
ffff80000010933d:	00 00 00 
ffff800000109340:	48 89 54 03 20       	mov    %rdx,0x20(%rbx,%rax,1)
ffff800000109345:	48 b8 58 ff ff ff ff 	movabs $0xffffffffffffff58,%rax
ffff80000010934c:	ff ff ff 
ffff80000010934f:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000109353:	48 89 c2             	mov    %rax,%rdx
ffff800000109356:	48 b8 f8 36 01 00 00 	movabs $0x136f8,%rax
ffff80000010935d:	00 00 00 
ffff800000109360:	48 89 54 03 28       	mov    %rdx,0x28(%rbx,%rax,1)
ffff800000109365:	48 b8 f8 ff ff ff ff 	movabs $0xfffffffffffffff8,%rax
ffff80000010936c:	ff ff ff 
ffff80000010936f:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000109373:	48 89 c2             	mov    %rax,%rdx
ffff800000109376:	48 b8 f8 36 01 00 00 	movabs $0x136f8,%rax
ffff80000010937d:	00 00 00 
ffff800000109380:	48 89 54 03 30       	mov    %rdx,0x30(%rbx,%rax,1)
ffff800000109385:	48 b8 f8 36 01 00 00 	movabs $0x136f8,%rax
ffff80000010938c:	00 00 00 
ffff80000010938f:	48 c7 44 03 38 00 00 	movq   $0x0,0x38(%rbx,%rax,1)
ffff800000109396:	00 00 
ffff800000109398:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010939f:	ff ff ff 
ffff8000001093a2:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001093a6:	48 8b 90 e8 02 00 00 	mov    0x2e8(%rax),%rdx
ffff8000001093ad:	48 b8 f8 36 01 00 00 	movabs $0x136f8,%rax
ffff8000001093b4:	00 00 00 
ffff8000001093b7:	48 89 54 03 40       	mov    %rdx,0x40(%rbx,%rax,1)
ffff8000001093bc:	48 b8 90 ff ff ff ff 	movabs $0xffffffffffffff90,%rax
ffff8000001093c3:	ff ff ff 
ffff8000001093c6:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001093ca:	48 8b 10             	mov    (%rax),%rdx
ffff8000001093cd:	48 b8 f8 36 01 00 00 	movabs $0x136f8,%rax
ffff8000001093d4:	00 00 00 
ffff8000001093d7:	48 89 54 03 48       	mov    %rdx,0x48(%rbx,%rax,1)
ffff8000001093dc:	be 08 00 00 00       	mov    $0x8,%esi
ffff8000001093e1:	bf 74 01 00 00       	mov    $0x174,%edi
ffff8000001093e6:	49 89 df             	mov    %rbx,%r15
ffff8000001093e9:	48 b8 0f b7 ff ff ff 	movabs $0xffffffffffffb70f,%rax
ffff8000001093f0:	ff ff ff 
ffff8000001093f3:	48 01 d8             	add    %rbx,%rax
ffff8000001093f6:	ff d0                	callq  *%rax
ffff8000001093f8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001093fd:	48 ba b1 7c ff ff ff 	movabs $0xffffffffffff7cb1,%rdx
ffff800000109404:	ff ff ff 
ffff800000109407:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff80000010940b:	ff d2                	callq  *%rdx
ffff80000010940d:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109411:	48 8b 00             	mov    (%rax),%rax
ffff800000109414:	48 89 c6             	mov    %rax,%rsi
ffff800000109417:	bf 75 01 00 00       	mov    $0x175,%edi
ffff80000010941c:	49 89 df             	mov    %rbx,%r15
ffff80000010941f:	48 b8 0f b7 ff ff ff 	movabs $0xffffffffffffb70f,%rax
ffff800000109426:	ff ff ff 
ffff800000109429:	48 01 d8             	add    %rbx,%rax
ffff80000010942c:	ff d0                	callq  *%rax
ffff80000010942e:	48 b8 e0 ff ff ff ff 	movabs $0xffffffffffffffe0,%rax
ffff800000109435:	ff ff ff 
ffff800000109438:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010943c:	48 89 c6             	mov    %rax,%rsi
ffff80000010943f:	bf 76 01 00 00       	mov    $0x176,%edi
ffff800000109444:	49 89 df             	mov    %rbx,%r15
ffff800000109447:	48 b8 0f b7 ff ff ff 	movabs $0xffffffffffffb70f,%rax
ffff80000010944e:	ff ff ff 
ffff800000109451:	48 01 d8             	add    %rbx,%rax
ffff800000109454:	ff d0                	callq  *%rax
ffff800000109456:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff80000010945d:	00 00 00 
ffff800000109460:	48 8b 44 03 54       	mov    0x54(%rbx,%rax,1),%rax
ffff800000109465:	41 89 c2             	mov    %eax,%r10d
ffff800000109468:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff80000010946f:	00 00 00 
ffff800000109472:	48 8b 44 03 4c       	mov    0x4c(%rbx,%rax,1),%rax
ffff800000109477:	41 89 c1             	mov    %eax,%r9d
ffff80000010947a:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff800000109481:	00 00 00 
ffff800000109484:	48 8b 44 03 44       	mov    0x44(%rbx,%rax,1),%rax
ffff800000109489:	41 89 c0             	mov    %eax,%r8d
ffff80000010948c:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff800000109493:	00 00 00 
ffff800000109496:	48 8b 44 03 3c       	mov    0x3c(%rbx,%rax,1),%rax
ffff80000010949b:	89 c7                	mov    %eax,%edi
ffff80000010949d:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff8000001094a4:	00 00 00 
ffff8000001094a7:	48 8b 44 03 34       	mov    0x34(%rbx,%rax,1),%rax
ffff8000001094ac:	41 89 c4             	mov    %eax,%r12d
ffff8000001094af:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff8000001094b6:	00 00 00 
ffff8000001094b9:	48 8b 44 03 2c       	mov    0x2c(%rbx,%rax,1),%rax
ffff8000001094be:	41 89 c3             	mov    %eax,%r11d
ffff8000001094c1:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff8000001094c8:	00 00 00 
ffff8000001094cb:	48 8b 44 03 24       	mov    0x24(%rbx,%rax,1),%rax
ffff8000001094d0:	89 c1                	mov    %eax,%ecx
ffff8000001094d2:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff8000001094d9:	00 00 00 
ffff8000001094dc:	48 8b 44 03 14       	mov    0x14(%rbx,%rax,1),%rax
ffff8000001094e1:	89 c2                	mov    %eax,%edx
ffff8000001094e3:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff8000001094ea:	00 00 00 
ffff8000001094ed:	48 8b 44 03 0c       	mov    0xc(%rbx,%rax,1),%rax
ffff8000001094f2:	89 c6                	mov    %eax,%esi
ffff8000001094f4:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff8000001094fb:	00 00 00 
ffff8000001094fe:	48 8b 44 03 04       	mov    0x4(%rbx,%rax,1),%rax
ffff800000109503:	41 52                	push   %r10
ffff800000109505:	41 51                	push   %r9
ffff800000109507:	41 50                	push   %r8
ffff800000109509:	57                   	push   %rdi
ffff80000010950a:	45 89 e1             	mov    %r12d,%r9d
ffff80000010950d:	45 89 d8             	mov    %r11d,%r8d
ffff800000109510:	89 c7                	mov    %eax,%edi
ffff800000109512:	48 b8 45 7b ff ff ff 	movabs $0xffffffffffff7b45,%rax
ffff800000109519:	ff ff ff 
ffff80000010951c:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109520:	ff d0                	callq  *%rax
ffff800000109522:	48 83 c4 20          	add    $0x20,%rsp
ffff800000109526:	48 b8 18 00 00 00 00 	movabs $0x18,%rax
ffff80000010952d:	00 00 00 
ffff800000109530:	48 8b 14 03          	mov    (%rbx,%rax,1),%rdx
ffff800000109534:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff80000010953b:	00 00 00 
ffff80000010953e:	48 89 54 03 04       	mov    %rdx,0x4(%rbx,%rax,1)
ffff800000109543:	48 b8 d8 36 00 00 00 	movabs $0x36d8,%rax
ffff80000010954a:	00 00 00 
ffff80000010954d:	48 8d 3c 03          	lea    (%rbx,%rax,1),%rdi
ffff800000109551:	49 89 df             	mov    %rbx,%r15
ffff800000109554:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109559:	48 ba 66 b5 ff ff ff 	movabs $0xffffffffffffb566,%rdx
ffff800000109560:	ff ff ff 
ffff800000109563:	48 01 da             	add    %rbx,%rdx
ffff800000109566:	ff d2                	callq  *%rdx
ffff800000109568:	ba 07 00 00 00       	mov    $0x7,%edx
ffff80000010956d:	be 0a 00 00 00       	mov    $0xa,%esi
ffff800000109572:	48 b8 ae c6 ff ff ff 	movabs $0xffffffffffffc6ae,%rax
ffff800000109579:	ff ff ff 
ffff80000010957c:	48 8d 3c 03          	lea    (%rbx,%rax,1),%rdi
ffff800000109580:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109585:	48 b9 53 cd ff ff ff 	movabs $0xffffffffffffcd53,%rcx
ffff80000010958c:	ff ff ff 
ffff80000010958f:	48 8d 0c 0b          	lea    (%rbx,%rcx,1),%rcx
ffff800000109593:	ff d1                	callq  *%rcx
ffff800000109595:	48 b8 d8 36 00 00 00 	movabs $0x36d8,%rax
ffff80000010959c:	00 00 00 
ffff80000010959f:	48 c7 44 03 10 01 00 	movq   $0x1,0x10(%rbx,%rax,1)
ffff8000001095a6:	00 00 
ffff8000001095a8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001095ad:	48 ba b1 7c ff ff ff 	movabs $0xffffffffffff7cb1,%rdx
ffff8000001095b4:	ff ff ff 
ffff8000001095b7:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff8000001095bb:	ff d2                	callq  *%rdx
ffff8000001095bd:	48 89 c7             	mov    %rax,%rdi
ffff8000001095c0:	49 89 df             	mov    %rbx,%r15
ffff8000001095c3:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001095c8:	48 ba d5 b6 ff ff ff 	movabs $0xffffffffffffb6d5,%rdx
ffff8000001095cf:	ff ff ff 
ffff8000001095d2:	48 01 da             	add    %rbx,%rdx
ffff8000001095d5:	ff d2                	callq  *%rdx
ffff8000001095d7:	48 98                	cltq   
ffff8000001095d9:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
ffff8000001095dd:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff8000001095e1:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff8000001095e5:	90                   	nop
ffff8000001095e6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001095eb:	48 ba b1 7c ff ff ff 	movabs $0xffffffffffff7cb1,%rdx
ffff8000001095f2:	ff ff ff 
ffff8000001095f5:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff8000001095f9:	ff d2                	callq  *%rdx
ffff8000001095fb:	4c 8b 60 28          	mov    0x28(%rax),%r12
ffff8000001095ff:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109604:	48 ba b1 7c ff ff ff 	movabs $0xffffffffffff7cb1,%rdx
ffff80000010960b:	ff ff ff 
ffff80000010960e:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff800000109612:	ff d2                	callq  *%rdx
ffff800000109614:	4c 8b 78 28          	mov    0x28(%rax),%r15
ffff800000109618:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010961c:	4c 8b 68 28          	mov    0x28(%rax),%r13
ffff800000109620:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109624:	4c 8b 70 28          	mov    0x28(%rax),%r14
ffff800000109628:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010962d:	48 ba b1 7c ff ff ff 	movabs $0xffffffffffff7cb1,%rdx
ffff800000109634:	ff ff ff 
ffff800000109637:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff80000010963b:	ff d2                	callq  *%rdx
ffff80000010963d:	48 89 c2             	mov    %rax,%rdx
ffff800000109640:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109644:	48 89 d7             	mov    %rdx,%rdi
ffff800000109647:	48 89 c6             	mov    %rax,%rsi
ffff80000010964a:	55                   	push   %rbp
ffff80000010964b:	50                   	push   %rax
ffff80000010964c:	49 89 64 24 10       	mov    %rsp,0x10(%r12)
ffff800000109651:	49 8b 65 10          	mov    0x10(%r13),%rsp
ffff800000109655:	48 8d 05 0d 00 00 00 	lea    0xd(%rip),%rax        # ffff800000109669 <task_init+0x3f9>
ffff80000010965c:	49 89 47 08          	mov    %rax,0x8(%r15)
ffff800000109660:	41 ff 76 08          	pushq  0x8(%r14)
ffff800000109664:	e9 a8 fa ff ff       	jmpq   ffff800000109111 <__switch_to>
ffff800000109669:	58                   	pop    %rax
ffff80000010966a:	5d                   	pop    %rbp
ffff80000010966b:	90                   	nop
ffff80000010966c:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
ffff800000109670:	5b                   	pop    %rbx
ffff800000109671:	41 5c                	pop    %r12
ffff800000109673:	41 5d                	pop    %r13
ffff800000109675:	41 5e                	pop    %r14
ffff800000109677:	41 5f                	pop    %r15
ffff800000109679:	5d                   	pop    %rbp
ffff80000010967a:	c3                   	retq   

ffff80000010967b <kernel_thread>:
ffff80000010967b:	55                   	push   %rbp
ffff80000010967c:	48 89 e5             	mov    %rsp,%rbp
ffff80000010967f:	41 57                	push   %r15
ffff800000109681:	53                   	push   %rbx
ffff800000109682:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
ffff800000109689:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000109689 <kernel_thread+0xe>
ffff800000109690:	49 bb 9f 32 00 00 00 	movabs $0x329f,%r11
ffff800000109697:	00 00 00 
ffff80000010969a:	4c 01 db             	add    %r11,%rbx
ffff80000010969d:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
ffff8000001096a4:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
ffff8000001096ab:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
ffff8000001096b2:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
ffff8000001096b9:	ba c0 00 00 00       	mov    $0xc0,%edx
ffff8000001096be:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001096c3:	48 89 c7             	mov    %rax,%rdi
ffff8000001096c6:	49 89 df             	mov    %rbx,%r15
ffff8000001096c9:	48 b8 f4 b3 ff ff ff 	movabs $0xffffffffffffb3f4,%rax
ffff8000001096d0:	ff ff ff 
ffff8000001096d3:	48 01 d8             	add    %rbx,%rax
ffff8000001096d6:	ff d0                	callq  *%rax
ffff8000001096d8:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
ffff8000001096df:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
ffff8000001096e6:	48 8b 85 20 ff ff ff 	mov    -0xe0(%rbp),%rax
ffff8000001096ed:	48 89 45 80          	mov    %rax,-0x80(%rbp)
ffff8000001096f1:	48 c7 45 a0 10 00 00 	movq   $0x10,-0x60(%rbp)
ffff8000001096f8:	00 
ffff8000001096f9:	48 c7 45 a8 10 00 00 	movq   $0x10,-0x58(%rbp)
ffff800000109700:	00 
ffff800000109701:	48 c7 45 d0 08 00 00 	movq   $0x8,-0x30(%rbp)
ffff800000109708:	00 
ffff800000109709:	48 c7 45 e8 10 00 00 	movq   $0x10,-0x18(%rbp)
ffff800000109710:	00 
ffff800000109711:	48 c7 45 d8 00 02 00 	movq   $0x200,-0x28(%rbp)
ffff800000109718:	00 
ffff800000109719:	48 b8 63 c6 ff ff ff 	movabs $0xffffffffffffc663,%rax
ffff800000109720:	ff ff ff 
ffff800000109723:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109727:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff80000010972b:	48 8b b5 18 ff ff ff 	mov    -0xe8(%rbp),%rsi
ffff800000109732:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
ffff800000109739:	b9 00 00 00 00       	mov    $0x0,%ecx
ffff80000010973e:	ba 00 00 00 00       	mov    $0x0,%edx
ffff800000109743:	48 89 c7             	mov    %rax,%rdi
ffff800000109746:	48 b8 3a ce ff ff ff 	movabs $0xffffffffffffce3a,%rax
ffff80000010974d:	ff ff ff 
ffff800000109750:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109754:	ff d0                	callq  *%rax
ffff800000109756:	48 81 c4 e0 00 00 00 	add    $0xe0,%rsp
ffff80000010975d:	5b                   	pop    %rbx
ffff80000010975e:	41 5f                	pop    %r15
ffff800000109760:	5d                   	pop    %rbp
ffff800000109761:	c3                   	retq   

ffff800000109762 <do_fork>:
ffff800000109762:	55                   	push   %rbp
ffff800000109763:	48 89 e5             	mov    %rsp,%rbp
ffff800000109766:	41 57                	push   %r15
ffff800000109768:	53                   	push   %rbx
ffff800000109769:	48 83 ec 40          	sub    $0x40,%rsp
ffff80000010976d:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff80000010976d <do_fork+0xb>
ffff800000109774:	49 bb bb 31 00 00 00 	movabs $0x31bb,%r11
ffff80000010977b:	00 00 00 
ffff80000010977e:	4c 01 db             	add    %r11,%rbx
ffff800000109781:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
ffff800000109785:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
ffff800000109789:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
ffff80000010978d:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
ffff800000109791:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000109798:	00 
ffff800000109799:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
ffff8000001097a0:	00 
ffff8000001097a1:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
ffff8000001097a8:	00 
ffff8000001097a9:	ba 91 00 00 00       	mov    $0x91,%edx
ffff8000001097ae:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001097b3:	bf 02 00 00 00       	mov    $0x2,%edi
ffff8000001097b8:	49 89 df             	mov    %rbx,%r15
ffff8000001097bb:	48 b8 ec ae ff ff ff 	movabs $0xffffffffffffaeec,%rax
ffff8000001097c2:	ff ff ff 
ffff8000001097c5:	48 01 d8             	add    %rbx,%rax
ffff8000001097c8:	ff d0                	callq  *%rax
ffff8000001097ca:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff8000001097ce:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001097d2:	48 8b 50 08          	mov    0x8(%rax),%rdx
ffff8000001097d6:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff8000001097dd:	80 ff ff 
ffff8000001097e0:	48 01 d0             	add    %rdx,%rax
ffff8000001097e3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001097e7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001097eb:	ba 08 00 00 00       	mov    $0x8,%edx
ffff8000001097f0:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001097f5:	48 89 c7             	mov    %rax,%rdi
ffff8000001097f8:	49 89 df             	mov    %rbx,%r15
ffff8000001097fb:	48 b8 f4 b3 ff ff ff 	movabs $0xffffffffffffb3f4,%rax
ffff800000109802:	ff ff ff 
ffff800000109805:	48 01 d8             	add    %rbx,%rax
ffff800000109808:	ff d0                	callq  *%rax
ffff80000010980a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010980f:	48 ba b1 7c ff ff ff 	movabs $0xffffffffffff7cb1,%rdx
ffff800000109816:	ff ff ff 
ffff800000109819:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff80000010981d:	ff d2                	callq  *%rdx
ffff80000010981f:	48 89 c2             	mov    %rax,%rdx
ffff800000109822:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109826:	48 8b 32             	mov    (%rdx),%rsi
ffff800000109829:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
ffff80000010982d:	48 89 30             	mov    %rsi,(%rax)
ffff800000109830:	48 89 78 08          	mov    %rdi,0x8(%rax)
ffff800000109834:	48 8b 72 10          	mov    0x10(%rdx),%rsi
ffff800000109838:	48 8b 7a 18          	mov    0x18(%rdx),%rdi
ffff80000010983c:	48 89 70 10          	mov    %rsi,0x10(%rax)
ffff800000109840:	48 89 78 18          	mov    %rdi,0x18(%rax)
ffff800000109844:	48 8b 72 20          	mov    0x20(%rdx),%rsi
ffff800000109848:	48 8b 7a 28          	mov    0x28(%rdx),%rdi
ffff80000010984c:	48 89 70 20          	mov    %rsi,0x20(%rax)
ffff800000109850:	48 89 78 28          	mov    %rdi,0x28(%rax)
ffff800000109854:	48 8b 72 30          	mov    0x30(%rdx),%rsi
ffff800000109858:	48 8b 7a 38          	mov    0x38(%rdx),%rdi
ffff80000010985c:	48 89 70 30          	mov    %rsi,0x30(%rax)
ffff800000109860:	48 89 78 38          	mov    %rdi,0x38(%rax)
ffff800000109864:	48 8b 72 40          	mov    0x40(%rdx),%rsi
ffff800000109868:	48 8b 7a 48          	mov    0x48(%rdx),%rdi
ffff80000010986c:	48 89 70 40          	mov    %rsi,0x40(%rax)
ffff800000109870:	48 89 78 48          	mov    %rdi,0x48(%rax)
ffff800000109874:	48 8b 52 50          	mov    0x50(%rdx),%rdx
ffff800000109878:	48 89 50 50          	mov    %rdx,0x50(%rax)
ffff80000010987c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109880:	48 89 c7             	mov    %rax,%rdi
ffff800000109883:	49 89 df             	mov    %rbx,%r15
ffff800000109886:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010988b:	48 ba 66 b5 ff ff ff 	movabs $0xffffffffffffb566,%rdx
ffff800000109892:	ff ff ff 
ffff800000109895:	48 01 da             	add    %rbx,%rdx
ffff800000109898:	ff d2                	callq  *%rdx
ffff80000010989a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010989e:	48 89 c6             	mov    %rax,%rsi
ffff8000001098a1:	48 b8 d8 36 00 00 00 	movabs $0x36d8,%rax
ffff8000001098a8:	00 00 00 
ffff8000001098ab:	48 8d 3c 03          	lea    (%rbx,%rax,1),%rdi
ffff8000001098af:	49 89 df             	mov    %rbx,%r15
ffff8000001098b2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001098b7:	48 ba f5 b5 ff ff ff 	movabs $0xffffffffffffb5f5,%rdx
ffff8000001098be:	ff ff ff 
ffff8000001098c1:	48 01 da             	add    %rbx,%rdx
ffff8000001098c4:	ff d2                	callq  *%rdx
ffff8000001098c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001098ca:	48 8b 40 38          	mov    0x38(%rax),%rax
ffff8000001098ce:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001098d2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001098d6:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff8000001098da:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001098de:	48 c7 40 10 04 00 00 	movq   $0x4,0x10(%rax)
ffff8000001098e5:	00 
ffff8000001098e6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001098ea:	48 83 c0 58          	add    $0x58,%rax
ffff8000001098ee:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff8000001098f2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001098f6:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
ffff8000001098fa:	48 89 50 28          	mov    %rdx,0x28(%rax)
ffff8000001098fe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109902:	48 05 40 7f 00 00    	add    $0x7f40,%rax
ffff800000109908:	48 89 c1             	mov    %rax,%rcx
ffff80000010990b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010990f:	ba c0 00 00 00       	mov    $0xc0,%edx
ffff800000109914:	48 89 ce             	mov    %rcx,%rsi
ffff800000109917:	48 89 c7             	mov    %rax,%rdi
ffff80000010991a:	49 89 df             	mov    %rbx,%r15
ffff80000010991d:	48 b8 4b b4 ff ff ff 	movabs $0xffffffffffffb44b,%rax
ffff800000109924:	ff ff ff 
ffff800000109927:	48 01 d8             	add    %rbx,%rax
ffff80000010992a:	ff d0                	callq  *%rax
ffff80000010992c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109930:	48 8d 90 00 80 00 00 	lea    0x8000(%rax),%rdx
ffff800000109937:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010993b:	48 89 10             	mov    %rdx,(%rax)
ffff80000010993e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109942:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
ffff800000109949:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010994d:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000109951:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109955:	48 8d 90 40 7f 00 00 	lea    0x7f40(%rax),%rdx
ffff80000010995c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109960:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000109964:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109968:	48 c7 40 18 10 00 00 	movq   $0x10,0x18(%rax)
ffff80000010996f:	00 
ffff800000109970:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109974:	48 c7 40 20 10 00 00 	movq   $0x10,0x20(%rax)
ffff80000010997b:	00 
ffff80000010997c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109980:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109984:	83 e0 01             	and    $0x1,%eax
ffff800000109987:	48 85 c0             	test   %rax,%rax
ffff80000010998a:	75 2f                	jne    ffff8000001099bb <do_fork+0x259>
ffff80000010998c:	48 b8 f8 fe ff ff ff 	movabs $0xfffffffffffffef8,%rax
ffff800000109993:	ff ff ff 
ffff800000109996:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010999a:	48 89 c2             	mov    %rax,%rdx
ffff80000010999d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001099a1:	48 89 90 98 00 00 00 	mov    %rdx,0x98(%rax)
ffff8000001099a8:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001099ac:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
ffff8000001099b3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001099b7:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff8000001099bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001099bf:	48 c7 40 10 01 00 00 	movq   $0x1,0x10(%rax)
ffff8000001099c6:	00 
ffff8000001099c7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001099cc:	48 83 c4 40          	add    $0x40,%rsp
ffff8000001099d0:	5b                   	pop    %rbx
ffff8000001099d1:	41 5f                	pop    %r15
ffff8000001099d3:	5d                   	pop    %rbp
ffff8000001099d4:	c3                   	retq   

ffff8000001099d5 <do_exit>:
ffff8000001099d5:	55                   	push   %rbp
ffff8000001099d6:	48 89 e5             	mov    %rsp,%rbp
ffff8000001099d9:	41 57                	push   %r15
ffff8000001099db:	48 83 ec 18          	sub    $0x18,%rsp
ffff8000001099df:	48 8d 0d f9 ff ff ff 	lea    -0x7(%rip),%rcx        # ffff8000001099df <do_exit+0xa>
ffff8000001099e6:	49 bb 49 2f 00 00 00 	movabs $0x2f49,%r11
ffff8000001099ed:	00 00 00 
ffff8000001099f0:	4c 01 d9             	add    %r11,%rcx
ffff8000001099f3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff8000001099f7:	48 b8 41 19 00 00 00 	movabs $0x1941,%rax
ffff8000001099fe:	00 00 00 
ffff800000109a01:	48 8d 14 01          	lea    (%rcx,%rax,1),%rdx
ffff800000109a05:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109a0a:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000109a0f:	49 89 cf             	mov    %rcx,%r15
ffff800000109a12:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109a17:	49 b8 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r8
ffff800000109a1e:	ff ff ff 
ffff800000109a21:	49 01 c8             	add    %rcx,%r8
ffff800000109a24:	41 ff d0             	callq  *%r8
ffff800000109a27:	eb fe                	jmp    ffff800000109a27 <do_exit+0x52>
ffff800000109a29:	55                   	push   %rbp
ffff800000109a2a:	48 89 e5             	mov    %rsp,%rbp
ffff800000109a2d:	53                   	push   %rbx
ffff800000109a2e:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000109a2e <do_exit+0x59>
ffff800000109a35:	49 bb fa 2e 00 00 00 	movabs $0x2efa,%r11
ffff800000109a3c:	00 00 00 
ffff800000109a3f:	4c 01 d8             	add    %r11,%rax
ffff800000109a42:	89 7d f4             	mov    %edi,-0xc(%rbp)
ffff800000109a45:	89 75 f0             	mov    %esi,-0x10(%rbp)
ffff800000109a48:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000109a4c:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
ffff800000109a50:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
ffff800000109a54:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
ffff800000109a58:	8b 45 f4             	mov    -0xc(%rbp),%eax
ffff800000109a5b:	8b 55 f0             	mov    -0x10(%rbp),%edx
ffff800000109a5e:	89 d1                	mov    %edx,%ecx
ffff800000109a60:	0f a2                	cpuid  
ffff800000109a62:	89 de                	mov    %ebx,%esi
ffff800000109a64:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
ffff800000109a68:	89 07                	mov    %eax,(%rdi)
ffff800000109a6a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109a6e:	89 30                	mov    %esi,(%rax)
ffff800000109a70:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000109a74:	89 08                	mov    %ecx,(%rax)
ffff800000109a76:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000109a7a:	89 10                	mov    %edx,(%rax)
ffff800000109a7c:	90                   	nop
ffff800000109a7d:	5b                   	pop    %rbx
ffff800000109a7e:	5d                   	pop    %rbp
ffff800000109a7f:	c3                   	retq   

ffff800000109a80 <init_cpu>:
ffff800000109a80:	55                   	push   %rbp
ffff800000109a81:	48 89 e5             	mov    %rsp,%rbp
ffff800000109a84:	41 57                	push   %r15
ffff800000109a86:	53                   	push   %rbx
ffff800000109a87:	48 83 ec 40          	sub    $0x40,%rsp
ffff800000109a8b:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000109a8b <init_cpu+0xb>
ffff800000109a92:	49 bb 9d 2e 00 00 00 	movabs $0x2e9d,%r11
ffff800000109a99:	00 00 00 
ffff800000109a9c:	4c 01 db             	add    %r11,%rbx
ffff800000109a9f:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%rbp)
ffff800000109aa6:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
ffff800000109aad:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
ffff800000109ab4:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
ffff800000109abb:	48 c7 45 b0 00 00 00 	movq   $0x0,-0x50(%rbp)
ffff800000109ac2:	00 
ffff800000109ac3:	48 c7 45 b8 00 00 00 	movq   $0x0,-0x48(%rbp)
ffff800000109aca:	00 
ffff800000109acb:	c6 45 c0 00          	movb   $0x0,-0x40(%rbp)
ffff800000109acf:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff800000109ad3:	48 8d 70 0c          	lea    0xc(%rax),%rsi
ffff800000109ad7:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff800000109adb:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000109adf:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff800000109ae3:	48 8d 50 04          	lea    0x4(%rax),%rdx
ffff800000109ae7:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff800000109aeb:	49 89 f1             	mov    %rsi,%r9
ffff800000109aee:	49 89 c8             	mov    %rcx,%r8
ffff800000109af1:	48 89 d1             	mov    %rdx,%rcx
ffff800000109af4:	48 89 c2             	mov    %rax,%rdx
ffff800000109af7:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109afc:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000109b01:	48 b8 5a 7c ff ff ff 	movabs $0xffffffffffff7c5a,%rax
ffff800000109b08:	ff ff ff 
ffff800000109b0b:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109b0f:	ff d0                	callq  *%rax
ffff800000109b11:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109b15:	8b 55 d4             	mov    -0x2c(%rbp),%edx
ffff800000109b18:	89 10                	mov    %edx,(%rax)
ffff800000109b1a:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109b1e:	48 8d 50 04          	lea    0x4(%rax),%rdx
ffff800000109b22:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000109b25:	89 02                	mov    %eax,(%rdx)
ffff800000109b27:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109b2b:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff800000109b2f:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000109b32:	89 02                	mov    %eax,(%rdx)
ffff800000109b34:	c6 45 bc 0a          	movb   $0xa,-0x44(%rbp)
ffff800000109b38:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109b3c:	48 89 c1             	mov    %rax,%rcx
ffff800000109b3f:	48 b8 59 19 00 00 00 	movabs $0x1959,%rax
ffff800000109b46:	00 00 00 
ffff800000109b49:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000109b4d:	be ff 00 00 00       	mov    $0xff,%esi
ffff800000109b52:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000109b57:	49 89 df             	mov    %rbx,%r15
ffff800000109b5a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109b5f:	49 b8 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r8
ffff800000109b66:	ff ff ff 
ffff800000109b69:	49 01 d8             	add    %rbx,%r8
ffff800000109b6c:	41 ff d0             	callq  *%r8
ffff800000109b6f:	c7 45 ec 02 00 00 80 	movl   $0x80000002,-0x14(%rbp)
ffff800000109b76:	e9 ab 00 00 00       	jmpq   ffff800000109c26 <init_cpu+0x1a6>
ffff800000109b7b:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff800000109b7f:	48 8d 78 0c          	lea    0xc(%rax),%rdi
ffff800000109b83:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff800000109b87:	48 8d 70 08          	lea    0x8(%rax),%rsi
ffff800000109b8b:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff800000109b8f:	48 8d 48 04          	lea    0x4(%rax),%rcx
ffff800000109b93:	48 8d 55 d0          	lea    -0x30(%rbp),%rdx
ffff800000109b97:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000109b9a:	49 89 f9             	mov    %rdi,%r9
ffff800000109b9d:	49 89 f0             	mov    %rsi,%r8
ffff800000109ba0:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109ba5:	89 c7                	mov    %eax,%edi
ffff800000109ba7:	48 b8 5a 7c ff ff ff 	movabs $0xffffffffffff7c5a,%rax
ffff800000109bae:	ff ff ff 
ffff800000109bb1:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109bb5:	ff d0                	callq  *%rax
ffff800000109bb7:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109bbb:	8b 55 d0             	mov    -0x30(%rbp),%edx
ffff800000109bbe:	89 10                	mov    %edx,(%rax)
ffff800000109bc0:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109bc4:	48 8d 50 04          	lea    0x4(%rax),%rdx
ffff800000109bc8:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff800000109bcb:	89 02                	mov    %eax,(%rdx)
ffff800000109bcd:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109bd1:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff800000109bd5:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000109bd8:	89 02                	mov    %eax,(%rdx)
ffff800000109bda:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109bde:	48 8d 50 0c          	lea    0xc(%rax),%rdx
ffff800000109be2:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000109be5:	89 02                	mov    %eax,(%rdx)
ffff800000109be7:	c6 45 c0 00          	movb   $0x0,-0x40(%rbp)
ffff800000109beb:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109bef:	48 89 c1             	mov    %rax,%rcx
ffff800000109bf2:	48 b8 69 19 00 00 00 	movabs $0x1969,%rax
ffff800000109bf9:	00 00 00 
ffff800000109bfc:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000109c00:	be ff 00 00 00       	mov    $0xff,%esi
ffff800000109c05:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000109c0a:	49 89 df             	mov    %rbx,%r15
ffff800000109c0d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109c12:	49 b8 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%r8
ffff800000109c19:	ff ff ff 
ffff800000109c1c:	49 01 d8             	add    %rbx,%r8
ffff800000109c1f:	41 ff d0             	callq  *%r8
ffff800000109c22:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
ffff800000109c26:	81 7d ec 04 00 00 80 	cmpl   $0x80000004,-0x14(%rbp)
ffff800000109c2d:	0f 86 48 ff ff ff    	jbe    ffff800000109b7b <init_cpu+0xfb>
ffff800000109c33:	48 b8 6c 19 00 00 00 	movabs $0x196c,%rax
ffff800000109c3a:	00 00 00 
ffff800000109c3d:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000109c41:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109c46:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000109c4b:	49 89 df             	mov    %rbx,%r15
ffff800000109c4e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109c53:	48 b9 e8 85 ff ff ff 	movabs $0xffffffffffff85e8,%rcx
ffff800000109c5a:	ff ff ff 
ffff800000109c5d:	48 01 d9             	add    %rbx,%rcx
ffff800000109c60:	ff d1                	callq  *%rcx
ffff800000109c62:	90                   	nop
ffff800000109c63:	48 83 c4 40          	add    $0x40,%rsp
ffff800000109c67:	5b                   	pop    %rbx
ffff800000109c68:	41 5f                	pop    %r15
ffff800000109c6a:	5d                   	pop    %rbp
ffff800000109c6b:	c3                   	retq   

Disassembly of section .data:

ffff800000109c80 <LABEL_GDT64>:
	...

ffff800000109c88 <LABEL_DESC_KERNEL_CODE64>:
ffff800000109c88:	00 00                	add    %al,(%rax)
ffff800000109c8a:	00 00                	add    %al,(%rax)
ffff800000109c8c:	00 98 20 00      	add    %bl,0x20(%rax)

ffff800000109c90 <LABEL_DESC_KERNEL_DATA64>:
ffff800000109c90:	00 00                	add    %al,(%rax)
ffff800000109c92:	00 00                	add    %al,(%rax)
ffff800000109c94:	00 92 00 00      	add    %dl,0x0(%rdx)

ffff800000109c98 <LABEL_DESC_USER_CODE32>:
	...

ffff800000109ca0 <LABEL_DESC_USER_DATA32>:
	...

ffff800000109ca8 <LABEL_DESC_USER_CODE64>:
ffff800000109ca8:	00 00                	add    %al,(%rax)
ffff800000109caa:	00 00                	add    %al,(%rax)
ffff800000109cac:	00 f8                	add    %bh,%al
ffff800000109cae:	20 00                	and    %al,(%rax)

ffff800000109cb0 <LABEL_DESC_USER_DATA64>:
ffff800000109cb0:	00 00                	add    %al,(%rax)
ffff800000109cb2:	00 00                	add    %al,(%rax)
ffff800000109cb4:	00 f2                	add    %dh,%dl
	...

ffff800000109cb8 <LABEL_DESC_KERNEL_CODE32>:
ffff800000109cb8:	ff                   	(bad)  
ffff800000109cb9:	ff 00                	incl   (%rax)
ffff800000109cbb:	00 00                	add    %al,(%rax)
ffff800000109cbd:	9a                   	(bad)  
ffff800000109cbe:	cf                   	iret   
	...

ffff800000109cc0 <LABEL_DESC_KERNEL_DATA32>:
ffff800000109cc0:	ff                   	(bad)  
ffff800000109cc1:	ff 00                	incl   (%rax)
ffff800000109cc3:	00 00                	add    %al,(%rax)
ffff800000109cc5:	92                   	xchg   %eax,%edx
ffff800000109cc6:	cf                   	iret   
	...

ffff800000109d18 <GDT_END>:
ffff800000109d18:	97                   	xchg   %eax,%edi
ffff800000109d19:	00 80 9c 10 00 00    	add    %al,0x109c(%rax)
ffff800000109d1f:	80 ff ff             	cmp    $0xff,%bh

ffff800000109d22 <LABEL_IDT>:
	...

ffff80000010ad22 <IDT_END>:
ffff80000010ad22:	ff 0f                	decl   (%rdi)
ffff80000010ad24:	22 9d 10 00 00 80    	and    -0x7ffffff0(%rbp),%bl
ffff80000010ad2a:	ff                   	(bad)  
ffff80000010ad2b:	ff                 	incl   (%rax)

ffff80000010ad2c <LABEL_TSS64>:
	...

ffff80000010ad94 <TSS64_END>:
ffff80000010ad94:	67 00 2c ad 10 00 00 	add    %ch,-0x7ffffff0(,%ebp,4)
ffff80000010ad9b:	80 
ffff80000010ad9c:	ff                   	(bad)  
ffff80000010ad9d:	ff 00                	incl   (%rax)
	...

ffff80000010ada0 <kmalloc_cache_size>:
ffff80000010ada0:	20 00                	and    %al,(%rax)
	...
ffff80000010add6:	00 00                	add    %al,(%rax)
ffff80000010add8:	40 00 00             	add    %al,(%rax)
	...
ffff80000010ae0f:	00 80 00 00 00 00    	add    %al,0x0(%rax)
	...
ffff80000010ae49:	01 00                	add    %eax,(%rax)
	...
ffff80000010ae7f:	00 00                	add    %al,(%rax)
ffff80000010ae81:	02 00                	add    (%rax),%al
	...
ffff80000010aeb7:	00 00                	add    %al,(%rax)
ffff80000010aeb9:	04 00                	add    $0x0,%al
	...
ffff80000010aeef:	00 00                	add    %al,(%rax)
ffff80000010aef1:	08 00                	or     %al,(%rax)
	...
ffff80000010af27:	00 00                	add    %al,(%rax)
ffff80000010af29:	10 00                	adc    %al,(%rax)
	...
ffff80000010af5f:	00 00                	add    %al,(%rax)
ffff80000010af61:	20 00                	and    %al,(%rax)
	...
ffff80000010af97:	00 00                	add    %al,(%rax)
ffff80000010af99:	40 00 00             	add    %al,(%rax)
	...
ffff80000010afd0:	00 80 00 00 00 00    	add    %al,0x0(%rax)
	...
ffff80000010b00a:	01 00                	add    %eax,(%rax)
	...
ffff80000010b040:	00 00                	add    %al,(%rax)
ffff80000010b042:	02 00                	add    (%rax),%al
	...
ffff80000010b078:	00 00                	add    %al,(%rax)
ffff80000010b07a:	04 00                	add    $0x0,%al
	...
ffff80000010b0b0:	00 00                	add    %al,(%rax)
ffff80000010b0b2:	08 00                	or     %al,(%rax)
	...
ffff80000010b0e8:	00 00                	add    %al,(%rax)
ffff80000010b0ea:	10 00                	adc    %al,(%rax)
	...

ffff80000010b120 <font_ascii>:
	...
ffff80000010b330:	00 10                	add    %dl,(%rax)
ffff80000010b332:	10 10                	adc    %dl,(%rax)
ffff80000010b334:	10 10                	adc    %dl,(%rax)
ffff80000010b336:	10 10                	adc    %dl,(%rax)
ffff80000010b338:	10 10                	adc    %dl,(%rax)
ffff80000010b33a:	00 00                	add    %al,(%rax)
ffff80000010b33c:	10 10                	adc    %dl,(%rax)
ffff80000010b33e:	00 00                	add    %al,(%rax)
ffff80000010b340:	28 28                	sub    %ch,(%rax)
ffff80000010b342:	28 00                	sub    %al,(%rax)
	...
ffff80000010b350:	00 44 44 44          	add    %al,0x44(%rsp,%rax,2)
ffff80000010b354:	fe 44 44 44          	incb   0x44(%rsp,%rax,2)
ffff80000010b358:	44                   	rex.R
ffff80000010b359:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010b35e:	00 00                	add    %al,(%rax)
ffff80000010b360:	10 3a                	adc    %bh,(%rdx)
ffff80000010b362:	56                   	push   %rsi
ffff80000010b363:	92                   	xchg   %eax,%edx
ffff80000010b364:	92                   	xchg   %eax,%edx
ffff80000010b365:	90                   	nop
ffff80000010b366:	50                   	push   %rax
ffff80000010b367:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010b36a:	92                   	xchg   %eax,%edx
ffff80000010b36b:	92                   	xchg   %eax,%edx
ffff80000010b36c:	d4                   	(bad)  
ffff80000010b36d:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010b372:	94                   	xchg   %eax,%esp
ffff80000010b373:	94                   	xchg   %eax,%esp
ffff80000010b374:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010b379:	2c 52                	sub    $0x52,%al
ffff80000010b37b:	52                   	push   %rdx
ffff80000010b37c:	92                   	xchg   %eax,%edx
ffff80000010b37d:	8c 00                	mov    %es,(%rax)
ffff80000010b37f:	00 00                	add    %al,(%rax)
ffff80000010b381:	70 88                	jo     ffff80000010b30b <font_ascii+0x1eb>
ffff80000010b383:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010b389:	92                   	xchg   %eax,%edx
ffff80000010b38a:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010b391:	08 10                	or     %dl,(%rax)
	...
ffff80000010b39f:	00 02                	add    %al,(%rdx)
ffff80000010b3a1:	04 08                	add    $0x8,%al
ffff80000010b3a3:	08 10                	or     %dl,(%rax)
ffff80000010b3a5:	10 10                	adc    %dl,(%rax)
ffff80000010b3a7:	10 10                	adc    %dl,(%rax)
ffff80000010b3a9:	10 10                	adc    %dl,(%rax)
ffff80000010b3ab:	08 08                	or     %cl,(%rax)
ffff80000010b3ad:	04 02                	add    $0x2,%al
ffff80000010b3af:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010b3b5:	10 10                	adc    %dl,(%rax)
ffff80000010b3b7:	10 10                	adc    %dl,(%rax)
ffff80000010b3b9:	10 10                	adc    %dl,(%rax)
ffff80000010b3bb:	20 20                	and    %ah,(%rax)
ffff80000010b3bd:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010b3c1:	00 00                	add    %al,(%rax)
ffff80000010b3c3:	00 00                	add    %al,(%rax)
ffff80000010b3c5:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010b3cb:	10 00                	adc    %al,(%rax)
	...
ffff80000010b3d5:	10 10                	adc    %dl,(%rax)
ffff80000010b3d7:	10 fe                	adc    %bh,%dh
ffff80000010b3d9:	10 10                	adc    %dl,(%rax)
ffff80000010b3db:	10 00                	adc    %al,(%rax)
	...
ffff80000010b3e9:	00 00                	add    %al,(%rax)
ffff80000010b3eb:	18 18                	sbb    %bl,(%rax)
ffff80000010b3ed:	08 08                	or     %cl,(%rax)
ffff80000010b3ef:	10 00                	adc    %al,(%rax)
ffff80000010b3f1:	00 00                	add    %al,(%rax)
ffff80000010b3f3:	00 00                	add    %al,(%rax)
ffff80000010b3f5:	00 00                	add    %al,(%rax)
ffff80000010b3f7:	00 fe                	add    %bh,%dh
	...
ffff80000010b409:	00 00                	add    %al,(%rax)
ffff80000010b40b:	00 18                	add    %bl,(%rax)
ffff80000010b40d:	18 00                	sbb    %al,(%rax)
ffff80000010b40f:	00 02                	add    %al,(%rdx)
ffff80000010b411:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010b414:	08 08                	or     %cl,(%rax)
ffff80000010b416:	08 10                	or     %dl,(%rax)
ffff80000010b418:	10 20                	adc    %ah,(%rax)
ffff80000010b41a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010b41d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010b424:	42 
ffff80000010b425:	42                   	rex.X
ffff80000010b426:	42                   	rex.X
ffff80000010b427:	42                   	rex.X
ffff80000010b428:	42                   	rex.X
ffff80000010b429:	42                   	rex.X
ffff80000010b42a:	42 24 24             	rex.X and $0x24,%al
ffff80000010b42d:	18 00                	sbb    %al,(%rax)
ffff80000010b42f:	00 00                	add    %al,(%rax)
ffff80000010b431:	08 18                	or     %bl,(%rax)
ffff80000010b433:	28 08                	sub    %cl,(%rax)
ffff80000010b435:	08 08                	or     %cl,(%rax)
ffff80000010b437:	08 08                	or     %cl,(%rax)
ffff80000010b439:	08 08                	or     %cl,(%rax)
ffff80000010b43b:	08 08                	or     %cl,(%rax)
ffff80000010b43d:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010b440:	00 18                	add    %bl,(%rax)
ffff80000010b442:	24 42                	and    $0x42,%al
ffff80000010b444:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010b448:	10 20                	adc    %ah,(%rax)
ffff80000010b44a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010b44d:	7e 00                	jle    ffff80000010b44f <font_ascii+0x32f>
ffff80000010b44f:	00 00                	add    %al,(%rax)
ffff80000010b451:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010b454:	02 02                	add    (%rdx),%al
ffff80000010b456:	04 18                	add    $0x18,%al
ffff80000010b458:	04 02                	add    $0x2,%al
ffff80000010b45a:	02 42 24             	add    0x24(%rdx),%al
ffff80000010b45d:	18 00                	sbb    %al,(%rax)
ffff80000010b45f:	00 00                	add    %al,(%rax)
ffff80000010b461:	0c 0c                	or     $0xc,%al
ffff80000010b463:	0c 14                	or     $0x14,%al
ffff80000010b465:	14 14                	adc    $0x14,%al
ffff80000010b467:	24 24                	and    $0x24,%al
ffff80000010b469:	44 7e 04             	rex.R jle ffff80000010b470 <font_ascii+0x350>
ffff80000010b46c:	04 1e                	add    $0x1e,%al
ffff80000010b46e:	00 00                	add    %al,(%rax)
ffff80000010b470:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010b474:	40 58                	rex pop %rax
ffff80000010b476:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010b479:	02 02                	add    (%rdx),%al
ffff80000010b47b:	42 24 18             	rex.X and $0x18,%al
ffff80000010b47e:	00 00                	add    %al,(%rax)
ffff80000010b480:	00 18                	add    %bl,(%rax)
ffff80000010b482:	24 42                	and    $0x42,%al
ffff80000010b484:	40 58                	rex pop %rax
ffff80000010b486:	64 42                	fs rex.X
ffff80000010b488:	42                   	rex.X
ffff80000010b489:	42                   	rex.X
ffff80000010b48a:	42                   	rex.X
ffff80000010b48b:	42 24 18             	rex.X and $0x18,%al
ffff80000010b48e:	00 00                	add    %al,(%rax)
ffff80000010b490:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010b493:	42 04 04             	rex.X add $0x4,%al
ffff80000010b496:	08 08                	or     %cl,(%rax)
ffff80000010b498:	08 10                	or     %dl,(%rax)
ffff80000010b49a:	10 10                	adc    %dl,(%rax)
ffff80000010b49c:	10 38                	adc    %bh,(%rax)
ffff80000010b49e:	00 00                	add    %al,(%rax)
ffff80000010b4a0:	00 18                	add    %bl,(%rax)
ffff80000010b4a2:	24 42                	and    $0x42,%al
ffff80000010b4a4:	42                   	rex.X
ffff80000010b4a5:	42 24 18             	rex.X and $0x18,%al
ffff80000010b4a8:	24 42                	and    $0x42,%al
ffff80000010b4aa:	42                   	rex.X
ffff80000010b4ab:	42 24 18             	rex.X and $0x18,%al
ffff80000010b4ae:	00 00                	add    %al,(%rax)
ffff80000010b4b0:	00 18                	add    %bl,(%rax)
ffff80000010b4b2:	24 42                	and    $0x42,%al
ffff80000010b4b4:	42                   	rex.X
ffff80000010b4b5:	42                   	rex.X
ffff80000010b4b6:	42                   	rex.X
ffff80000010b4b7:	42                   	rex.X
ffff80000010b4b8:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010b4bb:	42 24 18             	rex.X and $0x18,%al
ffff80000010b4be:	00 00                	add    %al,(%rax)
ffff80000010b4c0:	00 00                	add    %al,(%rax)
ffff80000010b4c2:	00 00                	add    %al,(%rax)
ffff80000010b4c4:	00 18                	add    %bl,(%rax)
ffff80000010b4c6:	18 00                	sbb    %al,(%rax)
ffff80000010b4c8:	00 00                	add    %al,(%rax)
ffff80000010b4ca:	00 00                	add    %al,(%rax)
ffff80000010b4cc:	18 18                	sbb    %bl,(%rax)
ffff80000010b4ce:	00 00                	add    %al,(%rax)
ffff80000010b4d0:	00 00                	add    %al,(%rax)
ffff80000010b4d2:	00 00                	add    %al,(%rax)
ffff80000010b4d4:	00 18                	add    %bl,(%rax)
ffff80000010b4d6:	18 00                	sbb    %al,(%rax)
ffff80000010b4d8:	00 00                	add    %al,(%rax)
ffff80000010b4da:	00 18                	add    %bl,(%rax)
ffff80000010b4dc:	18 08                	sbb    %cl,(%rax)
ffff80000010b4de:	08 10                	or     %dl,(%rax)
ffff80000010b4e0:	00 02                	add    %al,(%rdx)
ffff80000010b4e2:	04 08                	add    $0x8,%al
ffff80000010b4e4:	10 20                	adc    %ah,(%rax)
ffff80000010b4e6:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010b4ed:	04 
ffff80000010b4ee:	02 00                	add    (%rax),%al
ffff80000010b4f0:	00 00                	add    %al,(%rax)
ffff80000010b4f2:	00 00                	add    %al,(%rax)
ffff80000010b4f4:	00 00                	add    %al,(%rax)
ffff80000010b4f6:	fe 00                	incb   (%rax)
ffff80000010b4f8:	00 fe                	add    %bh,%dh
ffff80000010b4fa:	00 00                	add    %al,(%rax)
ffff80000010b4fc:	00 00                	add    %al,(%rax)
ffff80000010b4fe:	00 00                	add    %al,(%rax)
ffff80000010b500:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010b506:	04 02                	add    $0x2,%al
ffff80000010b508:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010b50b:	10 20                	adc    %ah,(%rax)
ffff80000010b50d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010b511:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010b515:	82                   	(bad)  
ffff80000010b516:	04 08                	add    $0x8,%al
ffff80000010b518:	10 10                	adc    %dl,(%rax)
ffff80000010b51a:	00 00                	add    %al,(%rax)
ffff80000010b51c:	18 18                	sbb    %bl,(%rax)
ffff80000010b51e:	00 00                	add    %al,(%rax)
ffff80000010b520:	00 38                	add    %bh,(%rax)
ffff80000010b522:	44 82                	rex.R (bad) 
ffff80000010b524:	9a                   	(bad)  
ffff80000010b525:	aa                   	stos   %al,%es:(%rdi)
ffff80000010b526:	aa                   	stos   %al,%es:(%rdi)
ffff80000010b527:	aa                   	stos   %al,%es:(%rdi)
ffff80000010b528:	aa                   	stos   %al,%es:(%rdi)
ffff80000010b529:	aa                   	stos   %al,%es:(%rdi)
ffff80000010b52a:	9c                   	pushfq 
ffff80000010b52b:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010b52f:	00 00                	add    %al,(%rax)
ffff80000010b531:	18 18                	sbb    %bl,(%rax)
ffff80000010b533:	18 18                	sbb    %bl,(%rax)
ffff80000010b535:	24 24                	and    $0x24,%al
ffff80000010b537:	24 24                	and    $0x24,%al
ffff80000010b539:	7e 42                	jle    ffff80000010b57d <font_ascii+0x45d>
ffff80000010b53b:	42                   	rex.X
ffff80000010b53c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010b53f:	00 00                	add    %al,(%rax)
ffff80000010b541:	f0 48                	lock rex.W
ffff80000010b543:	44                   	rex.R
ffff80000010b544:	44                   	rex.R
ffff80000010b545:	44                   	rex.R
ffff80000010b546:	48 78 44             	rex.W js ffff80000010b58d <font_ascii+0x46d>
ffff80000010b549:	42                   	rex.X
ffff80000010b54a:	42                   	rex.X
ffff80000010b54b:	42                   	rex.X
ffff80000010b54c:	44 f8                	rex.R clc 
ffff80000010b54e:	00 00                	add    %al,(%rax)
ffff80000010b550:	00 3a                	add    %bh,(%rdx)
ffff80000010b552:	46                   	rex.RX
ffff80000010b553:	42 82                	rex.X (bad) 
ffff80000010b555:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010b55c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010b55f:	00 00                	add    %al,(%rax)
ffff80000010b561:	f8                   	clc    
ffff80000010b562:	44                   	rex.R
ffff80000010b563:	44                   	rex.R
ffff80000010b564:	42                   	rex.X
ffff80000010b565:	42                   	rex.X
ffff80000010b566:	42                   	rex.X
ffff80000010b567:	42                   	rex.X
ffff80000010b568:	42                   	rex.X
ffff80000010b569:	42                   	rex.X
ffff80000010b56a:	42                   	rex.X
ffff80000010b56b:	44                   	rex.R
ffff80000010b56c:	44 f8                	rex.R clc 
ffff80000010b56e:	00 00                	add    %al,(%rax)
ffff80000010b570:	00 fe                	add    %bh,%dh
ffff80000010b572:	42                   	rex.X
ffff80000010b573:	42                   	rex.X
ffff80000010b574:	40                   	rex
ffff80000010b575:	40                   	rex
ffff80000010b576:	44 7c 44             	rex.R jl ffff80000010b5bd <font_ascii+0x49d>
ffff80000010b579:	40                   	rex
ffff80000010b57a:	40                   	rex
ffff80000010b57b:	42                   	rex.X
ffff80000010b57c:	42 fe 00             	rex.X incb (%rax)
ffff80000010b57f:	00 00                	add    %al,(%rax)
ffff80000010b581:	fe 42 42             	incb   0x42(%rdx)
ffff80000010b584:	40                   	rex
ffff80000010b585:	40                   	rex
ffff80000010b586:	44 7c 44             	rex.R jl ffff80000010b5cd <font_ascii+0x4ad>
ffff80000010b589:	44                   	rex.R
ffff80000010b58a:	40                   	rex
ffff80000010b58b:	40                   	rex
ffff80000010b58c:	40                   	rex
ffff80000010b58d:	f0 00 00             	lock add %al,(%rax)
ffff80000010b590:	00 3a                	add    %bh,(%rdx)
ffff80000010b592:	46                   	rex.RX
ffff80000010b593:	42 82                	rex.X (bad) 
ffff80000010b595:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010b59c:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010b59f:	00 00                	add    %al,(%rax)
ffff80000010b5a1:	e7 42                	out    %eax,$0x42
ffff80000010b5a3:	42                   	rex.X
ffff80000010b5a4:	42                   	rex.X
ffff80000010b5a5:	42                   	rex.X
ffff80000010b5a6:	42 7e 42             	rex.X jle ffff80000010b5eb <font_ascii+0x4cb>
ffff80000010b5a9:	42                   	rex.X
ffff80000010b5aa:	42                   	rex.X
ffff80000010b5ab:	42                   	rex.X
ffff80000010b5ac:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010b5af:	00 00                	add    %al,(%rax)
ffff80000010b5b1:	7c 10                	jl     ffff80000010b5c3 <font_ascii+0x4a3>
ffff80000010b5b3:	10 10                	adc    %dl,(%rax)
ffff80000010b5b5:	10 10                	adc    %dl,(%rax)
ffff80000010b5b7:	10 10                	adc    %dl,(%rax)
ffff80000010b5b9:	10 10                	adc    %dl,(%rax)
ffff80000010b5bb:	10 10                	adc    %dl,(%rax)
ffff80000010b5bd:	7c 00                	jl     ffff80000010b5bf <font_ascii+0x49f>
ffff80000010b5bf:	00 00                	add    %al,(%rax)
ffff80000010b5c1:	1f                   	(bad)  
ffff80000010b5c2:	04 04                	add    $0x4,%al
ffff80000010b5c4:	04 04                	add    $0x4,%al
ffff80000010b5c6:	04 04                	add    $0x4,%al
ffff80000010b5c8:	04 04                	add    $0x4,%al
ffff80000010b5ca:	04 04                	add    $0x4,%al
ffff80000010b5cc:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010b5cf:	00 00                	add    %al,(%rax)
ffff80000010b5d1:	e7 42                	out    %eax,$0x42
ffff80000010b5d3:	44                   	rex.R
ffff80000010b5d4:	48 50                	rex.W push %rax
ffff80000010b5d6:	50                   	push   %rax
ffff80000010b5d7:	60                   	(bad)  
ffff80000010b5d8:	50                   	push   %rax
ffff80000010b5d9:	50                   	push   %rax
ffff80000010b5da:	48                   	rex.W
ffff80000010b5db:	44                   	rex.R
ffff80000010b5dc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010b5df:	00 00                	add    %al,(%rax)
ffff80000010b5e1:	f0 40                	lock rex
ffff80000010b5e3:	40                   	rex
ffff80000010b5e4:	40                   	rex
ffff80000010b5e5:	40                   	rex
ffff80000010b5e6:	40                   	rex
ffff80000010b5e7:	40                   	rex
ffff80000010b5e8:	40                   	rex
ffff80000010b5e9:	40                   	rex
ffff80000010b5ea:	40                   	rex
ffff80000010b5eb:	42                   	rex.X
ffff80000010b5ec:	42 fe 00             	rex.X incb (%rax)
ffff80000010b5ef:	00 00                	add    %al,(%rax)
ffff80000010b5f1:	c3                   	retq   
ffff80000010b5f2:	42                   	rex.X
ffff80000010b5f3:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010b5f7:	5a                   	pop    %rdx
ffff80000010b5f8:	5a                   	pop    %rdx
ffff80000010b5f9:	42                   	rex.X
ffff80000010b5fa:	42                   	rex.X
ffff80000010b5fb:	42                   	rex.X
ffff80000010b5fc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010b5ff:	00 00                	add    %al,(%rax)
ffff80000010b601:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010b608:	4a                   	rex.WX
ffff80000010b609:	4a                   	rex.WX
ffff80000010b60a:	4a                   	rex.WX
ffff80000010b60b:	46                   	rex.RX
ffff80000010b60c:	46 e2 00             	rex.RX loop ffff80000010b60f <font_ascii+0x4ef>
ffff80000010b60f:	00 00                	add    %al,(%rax)
ffff80000010b611:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010b615:	82                   	(bad)  
ffff80000010b616:	82                   	(bad)  
ffff80000010b617:	82                   	(bad)  
ffff80000010b618:	82                   	(bad)  
ffff80000010b619:	82                   	(bad)  
ffff80000010b61a:	82                   	(bad)  
ffff80000010b61b:	82                   	(bad)  
ffff80000010b61c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010b61f:	00 00                	add    %al,(%rax)
ffff80000010b621:	f8                   	clc    
ffff80000010b622:	44                   	rex.R
ffff80000010b623:	42                   	rex.X
ffff80000010b624:	42                   	rex.X
ffff80000010b625:	42                   	rex.X
ffff80000010b626:	44 78 40             	rex.R js ffff80000010b669 <font_ascii+0x549>
ffff80000010b629:	40                   	rex
ffff80000010b62a:	40                   	rex
ffff80000010b62b:	40                   	rex
ffff80000010b62c:	40                   	rex
ffff80000010b62d:	f0 00 00             	lock add %al,(%rax)
ffff80000010b630:	00 38                	add    %bh,(%rax)
ffff80000010b632:	44 82                	rex.R (bad) 
ffff80000010b634:	82                   	(bad)  
ffff80000010b635:	82                   	(bad)  
ffff80000010b636:	82                   	(bad)  
ffff80000010b637:	82                   	(bad)  
ffff80000010b638:	82                   	(bad)  
ffff80000010b639:	82                   	(bad)  
ffff80000010b63a:	92                   	xchg   %eax,%edx
ffff80000010b63b:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010b63f:	00 00                	add    %al,(%rax)
ffff80000010b641:	fc                   	cld    
ffff80000010b642:	42                   	rex.X
ffff80000010b643:	42                   	rex.X
ffff80000010b644:	42                   	rex.X
ffff80000010b645:	42 7c 44             	rex.X jl ffff80000010b68c <font_ascii+0x56c>
ffff80000010b648:	42                   	rex.X
ffff80000010b649:	42                   	rex.X
ffff80000010b64a:	42                   	rex.X
ffff80000010b64b:	42                   	rex.X
ffff80000010b64c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010b64f:	00 00                	add    %al,(%rax)
ffff80000010b651:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010b654:	82                   	(bad)  
ffff80000010b655:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010b659:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010b65f:	00 00                	add    %al,(%rax)
ffff80000010b661:	fe                   	(bad)  
ffff80000010b662:	92                   	xchg   %eax,%edx
ffff80000010b663:	92                   	xchg   %eax,%edx
ffff80000010b664:	10 10                	adc    %dl,(%rax)
ffff80000010b666:	10 10                	adc    %dl,(%rax)
ffff80000010b668:	10 10                	adc    %dl,(%rax)
ffff80000010b66a:	10 10                	adc    %dl,(%rax)
ffff80000010b66c:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010b670:	00 e7                	add    %ah,%bh
ffff80000010b672:	42                   	rex.X
ffff80000010b673:	42                   	rex.X
ffff80000010b674:	42                   	rex.X
ffff80000010b675:	42                   	rex.X
ffff80000010b676:	42                   	rex.X
ffff80000010b677:	42                   	rex.X
ffff80000010b678:	42                   	rex.X
ffff80000010b679:	42                   	rex.X
ffff80000010b67a:	42                   	rex.X
ffff80000010b67b:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010b67e:	00 00                	add    %al,(%rax)
ffff80000010b680:	00 e7                	add    %ah,%bh
ffff80000010b682:	42                   	rex.X
ffff80000010b683:	42                   	rex.X
ffff80000010b684:	42                   	rex.X
ffff80000010b685:	42 24 24             	rex.X and $0x24,%al
ffff80000010b688:	24 24                	and    $0x24,%al
ffff80000010b68a:	18 18                	sbb    %bl,(%rax)
ffff80000010b68c:	18 18                	sbb    %bl,(%rax)
ffff80000010b68e:	00 00                	add    %al,(%rax)
ffff80000010b690:	00 e7                	add    %ah,%bh
ffff80000010b692:	42                   	rex.X
ffff80000010b693:	42                   	rex.X
ffff80000010b694:	42 5a                	rex.X pop %rdx
ffff80000010b696:	5a                   	pop    %rdx
ffff80000010b697:	5a                   	pop    %rdx
ffff80000010b698:	5a                   	pop    %rdx
ffff80000010b699:	24 24                	and    $0x24,%al
ffff80000010b69b:	24 24                	and    $0x24,%al
ffff80000010b69d:	24 00                	and    $0x0,%al
ffff80000010b69f:	00 00                	add    %al,(%rax)
ffff80000010b6a1:	e7 42                	out    %eax,$0x42
ffff80000010b6a3:	42 24 24             	rex.X and $0x24,%al
ffff80000010b6a6:	24 18                	and    $0x18,%al
ffff80000010b6a8:	24 24                	and    $0x24,%al
ffff80000010b6aa:	24 42                	and    $0x42,%al
ffff80000010b6ac:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010b6af:	00 00                	add    %al,(%rax)
ffff80000010b6b1:	ee                   	out    %al,(%dx)
ffff80000010b6b2:	44                   	rex.R
ffff80000010b6b3:	44                   	rex.R
ffff80000010b6b4:	44 28 28             	sub    %r13b,(%rax)
ffff80000010b6b7:	28 10                	sub    %dl,(%rax)
ffff80000010b6b9:	10 10                	adc    %dl,(%rax)
ffff80000010b6bb:	10 10                	adc    %dl,(%rax)
ffff80000010b6bd:	7c 00                	jl     ffff80000010b6bf <font_ascii+0x59f>
ffff80000010b6bf:	00 00                	add    %al,(%rax)
ffff80000010b6c1:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010b6c8:	20 20                	and    %ah,(%rax)
ffff80000010b6ca:	40                   	rex
ffff80000010b6cb:	42 82                	rex.X (bad) 
ffff80000010b6cd:	fe 00                	incb   (%rax)
ffff80000010b6cf:	00 00                	add    %al,(%rax)
ffff80000010b6d1:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010b6d4:	20 20                	and    %ah,(%rax)
ffff80000010b6d6:	20 20                	and    %ah,(%rax)
ffff80000010b6d8:	20 20                	and    %ah,(%rax)
ffff80000010b6da:	20 20                	and    %ah,(%rax)
ffff80000010b6dc:	20 20                	and    %ah,(%rax)
ffff80000010b6de:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010b6e5:	20 20                	and    %ah,(%rax)
ffff80000010b6e7:	10 10                	adc    %dl,(%rax)
ffff80000010b6e9:	08 08                	or     %cl,(%rax)
ffff80000010b6eb:	04 04                	add    $0x4,%al
ffff80000010b6ed:	04 02                	add    $0x2,%al
ffff80000010b6ef:	02 00                	add    (%rax),%al
ffff80000010b6f1:	7c 04                	jl     ffff80000010b6f7 <font_ascii+0x5d7>
ffff80000010b6f3:	04 04                	add    $0x4,%al
ffff80000010b6f5:	04 04                	add    $0x4,%al
ffff80000010b6f7:	04 04                	add    $0x4,%al
ffff80000010b6f9:	04 04                	add    $0x4,%al
ffff80000010b6fb:	04 04                	add    $0x4,%al
ffff80000010b6fd:	04 7c                	add    $0x7c,%al
ffff80000010b6ff:	00 00                	add    %al,(%rax)
ffff80000010b701:	10 28                	adc    %ch,(%rax)
ffff80000010b703:	44 82                	rex.R (bad) 
	...
ffff80000010b71d:	00 fe                	add    %bh,%dh
ffff80000010b71f:	00 10                	add    %dl,(%rax)
ffff80000010b721:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010b734:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010b737:	04 3c                	add    $0x3c,%al
ffff80000010b739:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010b740:	c0 
ffff80000010b741:	40                   	rex
ffff80000010b742:	40                   	rex
ffff80000010b743:	40                   	rex
ffff80000010b744:	40 58                	rex pop %rax
ffff80000010b746:	64 42                	fs rex.X
ffff80000010b748:	42                   	rex.X
ffff80000010b749:	42                   	rex.X
ffff80000010b74a:	42                   	rex.X
ffff80000010b74b:	42                   	rex.X
ffff80000010b74c:	64 58                	fs pop %rax
ffff80000010b74e:	00 00                	add    %al,(%rax)
ffff80000010b750:	00 00                	add    %al,(%rax)
ffff80000010b752:	00 00                	add    %al,(%rax)
ffff80000010b754:	00 30                	add    %dh,(%rax)
ffff80000010b756:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010b75d:	38 
ffff80000010b75e:	00 00                	add    %al,(%rax)
ffff80000010b760:	0c 04                	or     $0x4,%al
ffff80000010b762:	04 04                	add    $0x4,%al
ffff80000010b764:	04 34                	add    $0x34,%al
ffff80000010b766:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010b76d:	36 
ffff80000010b76e:	00 00                	add    %al,(%rax)
ffff80000010b770:	00 00                	add    %al,(%rax)
ffff80000010b772:	00 00                	add    %al,(%rax)
ffff80000010b774:	00 38                	add    %bh,(%rax)
ffff80000010b776:	44 82                	rex.R (bad) 
ffff80000010b778:	82                   	(bad)  
ffff80000010b779:	fc                   	cld    
ffff80000010b77a:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010b781:	10 10                	adc    %dl,(%rax)
ffff80000010b783:	10 10                	adc    %dl,(%rax)
ffff80000010b785:	7c 10                	jl     ffff80000010b797 <font_ascii+0x677>
ffff80000010b787:	10 10                	adc    %dl,(%rax)
ffff80000010b789:	10 10                	adc    %dl,(%rax)
ffff80000010b78b:	10 10                	adc    %dl,(%rax)
ffff80000010b78d:	7c 00                	jl     ffff80000010b78f <font_ascii+0x66f>
ffff80000010b78f:	00 00                	add    %al,(%rax)
ffff80000010b791:	00 00                	add    %al,(%rax)
ffff80000010b793:	00 00                	add    %al,(%rax)
ffff80000010b795:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010b79c:	34 04 
ffff80000010b79e:	04 38                	add    $0x38,%al
ffff80000010b7a0:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010b7a4:	40 58                	rex pop %rax
ffff80000010b7a6:	64 42                	fs rex.X
ffff80000010b7a8:	42                   	rex.X
ffff80000010b7a9:	42                   	rex.X
ffff80000010b7aa:	42                   	rex.X
ffff80000010b7ab:	42                   	rex.X
ffff80000010b7ac:	42 e3 00             	rex.X jrcxz ffff80000010b7af <font_ascii+0x68f>
ffff80000010b7af:	00 00                	add    %al,(%rax)
ffff80000010b7b1:	10 10                	adc    %dl,(%rax)
ffff80000010b7b3:	00 00                	add    %al,(%rax)
ffff80000010b7b5:	30 10                	xor    %dl,(%rax)
ffff80000010b7b7:	10 10                	adc    %dl,(%rax)
ffff80000010b7b9:	10 10                	adc    %dl,(%rax)
ffff80000010b7bb:	10 10                	adc    %dl,(%rax)
ffff80000010b7bd:	38 00                	cmp    %al,(%rax)
ffff80000010b7bf:	00 00                	add    %al,(%rax)
ffff80000010b7c1:	04 04                	add    $0x4,%al
ffff80000010b7c3:	00 00                	add    %al,(%rax)
ffff80000010b7c5:	0c 04                	or     $0x4,%al
ffff80000010b7c7:	04 04                	add    $0x4,%al
ffff80000010b7c9:	04 04                	add    $0x4,%al
ffff80000010b7cb:	04 04                	add    $0x4,%al
ffff80000010b7cd:	08 08                	or     %cl,(%rax)
ffff80000010b7cf:	30 c0                	xor    %al,%al
ffff80000010b7d1:	40                   	rex
ffff80000010b7d2:	40                   	rex
ffff80000010b7d3:	40                   	rex
ffff80000010b7d4:	40                   	rex
ffff80000010b7d5:	4e                   	rex.WRX
ffff80000010b7d6:	44                   	rex.R
ffff80000010b7d7:	48 50                	rex.W push %rax
ffff80000010b7d9:	60                   	(bad)  
ffff80000010b7da:	50                   	push   %rax
ffff80000010b7db:	48                   	rex.W
ffff80000010b7dc:	44 e6 00             	rex.R out %al,$0x0
ffff80000010b7df:	00 30                	add    %dh,(%rax)
ffff80000010b7e1:	10 10                	adc    %dl,(%rax)
ffff80000010b7e3:	10 10                	adc    %dl,(%rax)
ffff80000010b7e5:	10 10                	adc    %dl,(%rax)
ffff80000010b7e7:	10 10                	adc    %dl,(%rax)
ffff80000010b7e9:	10 10                	adc    %dl,(%rax)
ffff80000010b7eb:	10 10                	adc    %dl,(%rax)
ffff80000010b7ed:	38 00                	cmp    %al,(%rax)
ffff80000010b7ef:	00 00                	add    %al,(%rax)
ffff80000010b7f1:	00 00                	add    %al,(%rax)
ffff80000010b7f3:	00 00                	add    %al,(%rax)
ffff80000010b7f5:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010b7f9:	49                   	rex.WB
ffff80000010b7fa:	49                   	rex.WB
ffff80000010b7fb:	49                   	rex.WB
ffff80000010b7fc:	49 db 00             	rex.WB fildl (%r8)
ffff80000010b7ff:	00 00                	add    %al,(%rax)
ffff80000010b801:	00 00                	add    %al,(%rax)
ffff80000010b803:	00 00                	add    %al,(%rax)
ffff80000010b805:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010b809:	42                   	rex.X
ffff80000010b80a:	42                   	rex.X
ffff80000010b80b:	42                   	rex.X
ffff80000010b80c:	42 e3 00             	rex.X jrcxz ffff80000010b80f <font_ascii+0x6ef>
ffff80000010b80f:	00 00                	add    %al,(%rax)
ffff80000010b811:	00 00                	add    %al,(%rax)
ffff80000010b813:	00 00                	add    %al,(%rax)
ffff80000010b815:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010b819:	82                   	(bad)  
ffff80000010b81a:	82                   	(bad)  
ffff80000010b81b:	82                   	(bad)  
ffff80000010b81c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010b81f:	00 00                	add    %al,(%rax)
ffff80000010b821:	00 00                	add    %al,(%rax)
ffff80000010b823:	00 d8                	add    %bl,%al
ffff80000010b825:	64 42                	fs rex.X
ffff80000010b827:	42                   	rex.X
ffff80000010b828:	42                   	rex.X
ffff80000010b829:	42                   	rex.X
ffff80000010b82a:	42                   	rex.X
ffff80000010b82b:	64 58                	fs pop %rax
ffff80000010b82d:	40                   	rex
ffff80000010b82e:	40 e0 00             	rex loopne ffff80000010b831 <font_ascii+0x711>
ffff80000010b831:	00 00                	add    %al,(%rax)
ffff80000010b833:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010b836:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010b83d:	04 04                	add    $0x4,%al
ffff80000010b83f:	0e                   	(bad)  
ffff80000010b840:	00 00                	add    %al,(%rax)
ffff80000010b842:	00 00                	add    %al,(%rax)
ffff80000010b844:	00 dc                	add    %bl,%ah
ffff80000010b846:	62 42                	(bad)  
ffff80000010b848:	40                   	rex
ffff80000010b849:	40                   	rex
ffff80000010b84a:	40                   	rex
ffff80000010b84b:	40                   	rex
ffff80000010b84c:	40 e0 00             	rex loopne ffff80000010b84f <font_ascii+0x72f>
ffff80000010b84f:	00 00                	add    %al,(%rax)
ffff80000010b851:	00 00                	add    %al,(%rax)
ffff80000010b853:	00 00                	add    %al,(%rax)
ffff80000010b855:	7a 86                	jp     ffff80000010b7dd <font_ascii+0x6bd>
ffff80000010b857:	82                   	(bad)  
ffff80000010b858:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010b85b:	82                   	(bad)  
ffff80000010b85c:	c2 bc 00             	retq   $0xbc
ffff80000010b85f:	00 00                	add    %al,(%rax)
ffff80000010b861:	00 10                	add    %dl,(%rax)
ffff80000010b863:	10 10                	adc    %dl,(%rax)
ffff80000010b865:	7c 10                	jl     ffff80000010b877 <font_ascii+0x757>
ffff80000010b867:	10 10                	adc    %dl,(%rax)
ffff80000010b869:	10 10                	adc    %dl,(%rax)
ffff80000010b86b:	10 10                	adc    %dl,(%rax)
ffff80000010b86d:	0e                   	(bad)  
ffff80000010b86e:	00 00                	add    %al,(%rax)
ffff80000010b870:	00 00                	add    %al,(%rax)
ffff80000010b872:	00 00                	add    %al,(%rax)
ffff80000010b874:	00 c6                	add    %al,%dh
ffff80000010b876:	42                   	rex.X
ffff80000010b877:	42                   	rex.X
ffff80000010b878:	42                   	rex.X
ffff80000010b879:	42                   	rex.X
ffff80000010b87a:	42                   	rex.X
ffff80000010b87b:	42                   	rex.X
ffff80000010b87c:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010b87f:	00 00                	add    %al,(%rax)
ffff80000010b881:	00 00                	add    %al,(%rax)
ffff80000010b883:	00 00                	add    %al,(%rax)
ffff80000010b885:	e7 42                	out    %eax,$0x42
ffff80000010b887:	42                   	rex.X
ffff80000010b888:	42 24 24             	rex.X and $0x24,%al
ffff80000010b88b:	24 18                	and    $0x18,%al
ffff80000010b88d:	18 00                	sbb    %al,(%rax)
ffff80000010b88f:	00 00                	add    %al,(%rax)
ffff80000010b891:	00 00                	add    %al,(%rax)
ffff80000010b893:	00 00                	add    %al,(%rax)
ffff80000010b895:	e7 42                	out    %eax,$0x42
ffff80000010b897:	42 5a                	rex.X pop %rdx
ffff80000010b899:	5a                   	pop    %rdx
ffff80000010b89a:	5a                   	pop    %rdx
ffff80000010b89b:	24 24                	and    $0x24,%al
ffff80000010b89d:	24 00                	and    $0x0,%al
ffff80000010b89f:	00 00                	add    %al,(%rax)
ffff80000010b8a1:	00 00                	add    %al,(%rax)
ffff80000010b8a3:	00 00                	add    %al,(%rax)
ffff80000010b8a5:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010b8aa:	28 28                	sub    %ch,(%rax)
ffff80000010b8ac:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010b8b0:	00 00                	add    %al,(%rax)
ffff80000010b8b2:	00 00                	add    %al,(%rax)
ffff80000010b8b4:	00 e7                	add    %ah,%bh
ffff80000010b8b6:	42                   	rex.X
ffff80000010b8b7:	42 24 24             	rex.X and $0x24,%al
ffff80000010b8ba:	24 18                	and    $0x18,%al
ffff80000010b8bc:	18 10                	sbb    %dl,(%rax)
ffff80000010b8be:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010b8c1:	00 00                	add    %al,(%rax)
ffff80000010b8c3:	00 00                	add    %al,(%rax)
ffff80000010b8c5:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010b8cb:	42 82                	rex.X (bad) 
ffff80000010b8cd:	fe 00                	incb   (%rax)
ffff80000010b8cf:	00 00                	add    %al,(%rax)
ffff80000010b8d1:	06                   	(bad)  
ffff80000010b8d2:	08 10                	or     %dl,(%rax)
ffff80000010b8d4:	10 10                	adc    %dl,(%rax)
ffff80000010b8d6:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010b8d9:	10 10                	adc    %dl,(%rax)
ffff80000010b8db:	10 08                	adc    %cl,(%rax)
ffff80000010b8dd:	06                   	(bad)  
ffff80000010b8de:	00 00                	add    %al,(%rax)
ffff80000010b8e0:	10 10                	adc    %dl,(%rax)
ffff80000010b8e2:	10 10                	adc    %dl,(%rax)
ffff80000010b8e4:	10 10                	adc    %dl,(%rax)
ffff80000010b8e6:	10 10                	adc    %dl,(%rax)
ffff80000010b8e8:	10 10                	adc    %dl,(%rax)
ffff80000010b8ea:	10 10                	adc    %dl,(%rax)
ffff80000010b8ec:	10 10                	adc    %dl,(%rax)
ffff80000010b8ee:	10 10                	adc    %dl,(%rax)
ffff80000010b8f0:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010b8f3:	08 08                	or     %cl,(%rax)
ffff80000010b8f5:	08 08                	or     %cl,(%rax)
ffff80000010b8f7:	06                   	(bad)  
ffff80000010b8f8:	08 08                	or     %cl,(%rax)
ffff80000010b8fa:	08 08                	or     %cl,(%rax)
ffff80000010b8fc:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010b8ff:	00 00                	add    %al,(%rax)
ffff80000010b901:	72 8c                	jb     ffff80000010b88f <font_ascii+0x76f>
	...
ffff80000010c11f:	00 20                	add    %ah,(%rax)
	...
ffff80000010c155:	00 00                	add    %al,(%rax)
ffff80000010c157:	00 40 00             	add    %al,0x0(%rax)
	...
ffff80000010c18e:	00 00                	add    %al,(%rax)
ffff80000010c190:	80 00 00             	addb   $0x0,(%rax)
	...
ffff80000010c1c7:	00 00                	add    %al,(%rax)
ffff80000010c1c9:	01 00                	add    %eax,(%rax)
	...
ffff80000010c1ff:	00 00                	add    %al,(%rax)
ffff80000010c201:	02 00                	add    (%rax),%al
	...
ffff80000010c237:	00 00                	add    %al,(%rax)
ffff80000010c239:	04 00                	add    $0x0,%al
	...
ffff80000010c26f:	00 00                	add    %al,(%rax)
ffff80000010c271:	08 00                	or     %al,(%rax)
	...
ffff80000010c2a7:	00 00                	add    %al,(%rax)
ffff80000010c2a9:	10 00                	adc    %al,(%rax)
	...
ffff80000010c2df:	00 00                	add    %al,(%rax)
ffff80000010c2e1:	20 00                	and    %al,(%rax)
	...
ffff80000010c317:	00 00                	add    %al,(%rax)
ffff80000010c319:	40 00 00             	add    %al,(%rax)
	...
ffff80000010c350:	00 80 00 00 00 00    	add    %al,0x0(%rax)
	...
ffff80000010c38a:	01 00                	add    %eax,(%rax)
	...
ffff80000010c3c0:	00 00                	add    %al,(%rax)
ffff80000010c3c2:	02 00                	add    (%rax),%al
	...
ffff80000010c3f8:	00 00                	add    %al,(%rax)
ffff80000010c3fa:	04 00                	add    $0x0,%al
	...
ffff80000010c430:	00 00                	add    %al,(%rax)
ffff80000010c432:	08 00                	or     %al,(%rax)
	...
ffff80000010c468:	00 00                	add    %al,(%rax)
ffff80000010c46a:	10 00                	adc    %al,(%rax)
	...
ffff80000010c4a0:	20 00                	and    %al,(%rax)
	...
ffff80000010c4d6:	00 00                	add    %al,(%rax)
ffff80000010c4d8:	40 00 00             	add    %al,(%rax)
	...
ffff80000010c50f:	00 80 00 00 00 00    	add    %al,0x0(%rax)
	...
ffff80000010c549:	01 00                	add    %eax,(%rax)
	...
ffff80000010c57f:	00 00                	add    %al,(%rax)
ffff80000010c581:	02 00                	add    (%rax),%al
	...
ffff80000010c5b7:	00 00                	add    %al,(%rax)
ffff80000010c5b9:	04 00                	add    $0x0,%al
	...
ffff80000010c5ef:	00 00                	add    %al,(%rax)
ffff80000010c5f1:	08 00                	or     %al,(%rax)
	...
ffff80000010c627:	00 00                	add    %al,(%rax)
ffff80000010c629:	10 00                	adc    %al,(%rax)
	...
ffff80000010c65f:	00 00                	add    %al,(%rax)
ffff80000010c661:	20 00                	and    %al,(%rax)
	...
ffff80000010c697:	00 00                	add    %al,(%rax)
ffff80000010c699:	40 00 00             	add    %al,(%rax)
	...
ffff80000010c6d0:	00 80 00 00 00 00    	add    %al,0x0(%rax)
	...
ffff80000010c70a:	01 00                	add    %eax,(%rax)
	...
ffff80000010c740:	00 00                	add    %al,(%rax)
ffff80000010c742:	02 00                	add    (%rax),%al
	...
ffff80000010c778:	00 00                	add    %al,(%rax)
ffff80000010c77a:	04 00                	add    $0x0,%al
	...
ffff80000010c7b0:	00 00                	add    %al,(%rax)
ffff80000010c7b2:	08 00                	or     %al,(%rax)
	...
ffff80000010c7e8:	00 00                	add    %al,(%rax)
ffff80000010c7ea:	10 00                	adc    %al,(%rax)
	...

Disassembly of section .got:

ffff80000010c820 <.got>:
ffff80000010c820:	64 40 10 00          	adc    %al,%fs:(%rax)
ffff80000010c824:	00 80 ff ff dc 40    	add    %al,0x40dcffff(%rax)
ffff80000010c82a:	10 00                	adc    %al,(%rax)
ffff80000010c82c:	00 80 ff ff 6c 9c    	add    %al,-0x63930001(%rax)
ffff80000010c832:	10 00                	adc    %al,(%rax)
ffff80000010c834:	00 80 ff ff 22 9d    	add    %al,-0x62dd0001(%rax)
ffff80000010c83a:	10 00                	adc    %al,(%rax)
ffff80000010c83c:	00 80 ff ff f8 41    	add    %al,0x41f8ffff(%rax)
ffff80000010c842:	10 00                	adc    %al,(%rax)
ffff80000010c844:	00 80 ff ff 2c ad    	add    %al,-0x52d30001(%rax)
ffff80000010c84a:	10 00                	adc    %al,(%rax)
ffff80000010c84c:	00 80 ff ff 55 41    	add    %al,0x4155ffff(%rax)
ffff80000010c852:	10 00                	adc    %al,(%rax)
ffff80000010c854:	00 80 ff ff ec 40    	add    %al,0x40ecffff(%rax)
ffff80000010c85a:	10 00                	adc    %al,(%rax)
ffff80000010c85c:	00 80 ff ff 68 41    	add    %al,0x4168ffff(%rax)
ffff80000010c862:	10 00                	adc    %al,(%rax)
ffff80000010c864:	00 80 ff ff c5 41    	add    %al,0x41c5ffff(%rax)
ffff80000010c86a:	10 00                	adc    %al,(%rax)
ffff80000010c86c:	00 80 ff ff d6 41    	add    %al,0x41d6ffff(%rax)
ffff80000010c872:	10 00                	adc    %al,(%rax)
ffff80000010c874:	00 80 ff ff e7 41    	add    %al,0x41e7ffff(%rax)
ffff80000010c87a:	10 00                	adc    %al,(%rax)
ffff80000010c87c:	00 80 ff ff 80 d9    	add    %al,-0x267f0001(%rax)
ffff80000010c882:	10 00                	adc    %al,(%rax)
ffff80000010c884:	00 80 ff ff 42 41    	add    %al,0x4142ffff(%rax)
ffff80000010c88a:	10 00                	adc    %al,(%rax)
ffff80000010c88c:	00 80 ff ff 7b 41    	add    %al,0x417bffff(%rax)
ffff80000010c892:	10 00                	adc    %al,(%rax)
ffff80000010c894:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c89a:	10 00                	adc    %al,(%rax)
ffff80000010c89c:	00 80 ff ff 2d 42    	add    %al,0x422dffff(%rax)
ffff80000010c8a2:	10 00                	adc    %al,(%rax)
ffff80000010c8a4:	00 80 ff ff 1a 42    	add    %al,0x421affff(%rax)
ffff80000010c8aa:	10 00                	adc    %al,(%rax)
ffff80000010c8ac:	00 80 ff ff a1 41    	add    %al,0x41a1ffff(%rax)
ffff80000010c8b2:	10 00                	adc    %al,(%rax)
ffff80000010c8b4:	00 80 ff ff 7f 01    	add    %al,0x17fffff(%rax)
ffff80000010c8ba:	10 00                	adc    %al,(%rax)
ffff80000010c8bc:	00 80 ff ff 64 42    	add    %al,0x4264ffff(%rax)
ffff80000010c8c2:	10 00                	adc    %al,(%rax)
ffff80000010c8c4:	00 80 ff ff 80 9c    	add    %al,-0x637f0001(%rax)
ffff80000010c8ca:	10 00                	adc    %al,(%rax)
ffff80000010c8cc:	00 80 ff ff b2 41    	add    %al,0x41b2ffff(%rax)
ffff80000010c8d2:	10 00                	adc    %al,(%rax)
ffff80000010c8d4:	00 80 ff ff 20 c8    	add    %al,-0x37df0001(%rax)
ffff80000010c8da:	10 00                	adc    %al,(%rax)
ffff80000010c8dc:	00 80 ff ff 09 42    	add    %al,0x4209ffff(%rax)
ffff80000010c8e2:	10 00                	adc    %al,(%rax)
ffff80000010c8e4:	00 80 ff ff 58 94    	add    %al,-0x6ba70001(%rax)
ffff80000010c8ea:	12 00                	adc    (%rax),%al
ffff80000010c8ec:	00 80 ff ff 3e 42    	add    %al,0x423effff(%rax)
ffff80000010c8f2:	10 00                	adc    %al,(%rax)
ffff80000010c8f4:	00 80 ff ff 60 91    	add    %al,-0x6e9f0001(%rax)
ffff80000010c8fa:	12 00                	adc    (%rax),%al
ffff80000010c8fc:	00 80 ff ff 51 42    	add    %al,0x4251ffff(%rax)
ffff80000010c902:	10 00                	adc    %al,(%rax)
ffff80000010c904:	00 80 ff ff 27 40    	add    %al,0x4027ffff(%rax)
ffff80000010c90a:	10 00                	adc    %al,(%rax)
ffff80000010c90c:	00 80 ff ff fc 40    	add    %al,0x40fcffff(%rax)
ffff80000010c912:	10 00                	adc    %al,(%rax)
ffff80000010c914:	00 80 ff ff 8e 41    	add    %al,0x418effff(%rax)
ffff80000010c91a:	10 00                	adc    %al,(%rax)
ffff80000010c91c:	00 80 ff ff 96 e2    	add    %al,-0x1d690001(%rax)
ffff80000010c922:	10 00                	adc    %al,(%rax)
ffff80000010c924:	00                   	.byte 0x0
ffff80000010c925:	80 ff ff             	cmp    $0xff,%bh

Disassembly of section .got.plt:

ffff80000010c928 <_GLOBAL_OFFSET_TABLE_>:
	...

Disassembly of section .data.rel.local:

ffff80000010c940 <init_thread>:
ffff80000010c940:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010c946:	ff                   	(bad)  
ffff80000010c947:	ff 00                	incl   (%rax)
	...
ffff80000010c951:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010c954:	00 80 ff ff 10 00    	add    %al,0x10ffff(%rax)
ffff80000010c95a:	00 00                	add    %al,(%rax)
ffff80000010c95c:	00 00                	add    %al,(%rax)
ffff80000010c95e:	00 00                	add    %al,(%rax)
ffff80000010c960:	10 00                	adc    %al,(%rax)
	...

ffff80000010c980 <init_task>:
ffff80000010c980:	00 00                	add    %al,(%rax)
ffff80000010c982:	11 00                	adc    %eax,(%rax)
ffff80000010c984:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...

ffff80000010c9c0 <init_tss>:
ffff80000010c9c0:	00 00                	add    %al,(%rax)
ffff80000010c9c2:	00 00                	add    %al,(%rax)
ffff80000010c9c4:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010c9ca:	ff                   	(bad)  
ffff80000010c9cb:	ff 00                	incl   (%rax)
ffff80000010c9cd:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010c9d0:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010c9d6:	11 00                	adc    %eax,(%rax)
ffff80000010c9d8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c9de:	00 00                	add    %al,(%rax)
ffff80000010c9e0:	00 00                	add    %al,(%rax)
ffff80000010c9e2:	00 00                	add    %al,(%rax)
ffff80000010c9e4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010c9e8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c9ee:	00 00                	add    %al,(%rax)
ffff80000010c9f0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c9f6:	00 00                	add    %al,(%rax)
ffff80000010c9f8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c9fe:	00 00                	add    %al,(%rax)
ffff80000010ca00:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010ca06:	00 00                	add    %al,(%rax)
ffff80000010ca08:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010ca0e:	00 00                	add    %al,(%rax)
ffff80000010ca10:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010ca16:	00 00                	add    %al,(%rax)
ffff80000010ca18:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010ca2a:	00 00                	add    %al,(%rax)
ffff80000010ca2c:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010ca32:	ff                   	(bad)  
ffff80000010ca33:	ff 00                	incl   (%rax)
ffff80000010ca35:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010ca38:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010ca3e:	11 00                	adc    %eax,(%rax)
ffff80000010ca40:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010ca46:	00 00                	add    %al,(%rax)
ffff80000010ca48:	00 00                	add    %al,(%rax)
ffff80000010ca4a:	00 00                	add    %al,(%rax)
ffff80000010ca4c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010ca50:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010ca56:	00 00                	add    %al,(%rax)
ffff80000010ca58:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010ca5e:	00 00                	add    %al,(%rax)
ffff80000010ca60:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010ca66:	00 00                	add    %al,(%rax)
ffff80000010ca68:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010ca6e:	00 00                	add    %al,(%rax)
ffff80000010ca70:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010ca76:	00 00                	add    %al,(%rax)
ffff80000010ca78:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010ca7e:	00 00                	add    %al,(%rax)
ffff80000010ca80:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010ca92:	00 00                	add    %al,(%rax)
ffff80000010ca94:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010ca9a:	ff                   	(bad)  
ffff80000010ca9b:	ff 00                	incl   (%rax)
ffff80000010ca9d:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010caa0:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010caa6:	11 00                	adc    %eax,(%rax)
ffff80000010caa8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010caae:	00 00                	add    %al,(%rax)
ffff80000010cab0:	00 00                	add    %al,(%rax)
ffff80000010cab2:	00 00                	add    %al,(%rax)
ffff80000010cab4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010cab8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cabe:	00 00                	add    %al,(%rax)
ffff80000010cac0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cac6:	00 00                	add    %al,(%rax)
ffff80000010cac8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cace:	00 00                	add    %al,(%rax)
ffff80000010cad0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cad6:	00 00                	add    %al,(%rax)
ffff80000010cad8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cade:	00 00                	add    %al,(%rax)
ffff80000010cae0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cae6:	00 00                	add    %al,(%rax)
ffff80000010cae8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010cafa:	00 00                	add    %al,(%rax)
ffff80000010cafc:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010cb02:	ff                   	(bad)  
ffff80000010cb03:	ff 00                	incl   (%rax)
ffff80000010cb05:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010cb08:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010cb0e:	11 00                	adc    %eax,(%rax)
ffff80000010cb10:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010cb16:	00 00                	add    %al,(%rax)
ffff80000010cb18:	00 00                	add    %al,(%rax)
ffff80000010cb1a:	00 00                	add    %al,(%rax)
ffff80000010cb1c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010cb20:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cb26:	00 00                	add    %al,(%rax)
ffff80000010cb28:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cb2e:	00 00                	add    %al,(%rax)
ffff80000010cb30:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cb36:	00 00                	add    %al,(%rax)
ffff80000010cb38:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cb3e:	00 00                	add    %al,(%rax)
ffff80000010cb40:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cb46:	00 00                	add    %al,(%rax)
ffff80000010cb48:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cb4e:	00 00                	add    %al,(%rax)
ffff80000010cb50:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010cb62:	00 00                	add    %al,(%rax)
ffff80000010cb64:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010cb6a:	ff                   	(bad)  
ffff80000010cb6b:	ff 00                	incl   (%rax)
ffff80000010cb6d:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010cb70:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010cb76:	11 00                	adc    %eax,(%rax)
ffff80000010cb78:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010cb7e:	00 00                	add    %al,(%rax)
ffff80000010cb80:	00 00                	add    %al,(%rax)
ffff80000010cb82:	00 00                	add    %al,(%rax)
ffff80000010cb84:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010cb88:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cb8e:	00 00                	add    %al,(%rax)
ffff80000010cb90:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cb96:	00 00                	add    %al,(%rax)
ffff80000010cb98:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cb9e:	00 00                	add    %al,(%rax)
ffff80000010cba0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cba6:	00 00                	add    %al,(%rax)
ffff80000010cba8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cbae:	00 00                	add    %al,(%rax)
ffff80000010cbb0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cbb6:	00 00                	add    %al,(%rax)
ffff80000010cbb8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010cbca:	00 00                	add    %al,(%rax)
ffff80000010cbcc:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010cbd2:	ff                   	(bad)  
ffff80000010cbd3:	ff 00                	incl   (%rax)
ffff80000010cbd5:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010cbd8:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010cbde:	11 00                	adc    %eax,(%rax)
ffff80000010cbe0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010cbe6:	00 00                	add    %al,(%rax)
ffff80000010cbe8:	00 00                	add    %al,(%rax)
ffff80000010cbea:	00 00                	add    %al,(%rax)
ffff80000010cbec:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010cbf0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cbf6:	00 00                	add    %al,(%rax)
ffff80000010cbf8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cbfe:	00 00                	add    %al,(%rax)
ffff80000010cc00:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cc06:	00 00                	add    %al,(%rax)
ffff80000010cc08:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cc0e:	00 00                	add    %al,(%rax)
ffff80000010cc10:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cc16:	00 00                	add    %al,(%rax)
ffff80000010cc18:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cc1e:	00 00                	add    %al,(%rax)
ffff80000010cc20:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010cc32:	00 00                	add    %al,(%rax)
ffff80000010cc34:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010cc3a:	ff                   	(bad)  
ffff80000010cc3b:	ff 00                	incl   (%rax)
ffff80000010cc3d:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010cc40:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010cc46:	11 00                	adc    %eax,(%rax)
ffff80000010cc48:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010cc4e:	00 00                	add    %al,(%rax)
ffff80000010cc50:	00 00                	add    %al,(%rax)
ffff80000010cc52:	00 00                	add    %al,(%rax)
ffff80000010cc54:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010cc58:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cc5e:	00 00                	add    %al,(%rax)
ffff80000010cc60:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cc66:	00 00                	add    %al,(%rax)
ffff80000010cc68:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cc6e:	00 00                	add    %al,(%rax)
ffff80000010cc70:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cc76:	00 00                	add    %al,(%rax)
ffff80000010cc78:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cc7e:	00 00                	add    %al,(%rax)
ffff80000010cc80:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cc86:	00 00                	add    %al,(%rax)
ffff80000010cc88:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010cc9a:	00 00                	add    %al,(%rax)
ffff80000010cc9c:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010cca2:	ff                   	(bad)  
ffff80000010cca3:	ff 00                	incl   (%rax)
ffff80000010cca5:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010cca8:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010ccae:	11 00                	adc    %eax,(%rax)
ffff80000010ccb0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010ccb6:	00 00                	add    %al,(%rax)
ffff80000010ccb8:	00 00                	add    %al,(%rax)
ffff80000010ccba:	00 00                	add    %al,(%rax)
ffff80000010ccbc:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010ccc0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010ccc6:	00 00                	add    %al,(%rax)
ffff80000010ccc8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010ccce:	00 00                	add    %al,(%rax)
ffff80000010ccd0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010ccd6:	00 00                	add    %al,(%rax)
ffff80000010ccd8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010ccde:	00 00                	add    %al,(%rax)
ffff80000010cce0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010cce6:	00 00                	add    %al,(%rax)
ffff80000010cce8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010ccee:	00 00                	add    %al,(%rax)
ffff80000010ccf0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...

ffff80000010cd00 <system_call_table>:
ffff80000010cd00:	0d 46 10 00 00       	or     $0x1046,%eax
ffff80000010cd05:	80 ff ff             	cmp    $0xff,%bh
ffff80000010cd08:	7c 46                	jl     ffff80000010cd50 <system_call_table+0x50>
ffff80000010cd0a:	10 00                	adc    %al,(%rax)
ffff80000010cd0c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cd12:	10 00                	adc    %al,(%rax)
ffff80000010cd14:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cd1a:	10 00                	adc    %al,(%rax)
ffff80000010cd1c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cd22:	10 00                	adc    %al,(%rax)
ffff80000010cd24:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cd2a:	10 00                	adc    %al,(%rax)
ffff80000010cd2c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cd32:	10 00                	adc    %al,(%rax)
ffff80000010cd34:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cd3a:	10 00                	adc    %al,(%rax)
ffff80000010cd3c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cd42:	10 00                	adc    %al,(%rax)
ffff80000010cd44:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cd4a:	10 00                	adc    %al,(%rax)
ffff80000010cd4c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cd52:	10 00                	adc    %al,(%rax)
ffff80000010cd54:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cd5a:	10 00                	adc    %al,(%rax)
ffff80000010cd5c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cd62:	10 00                	adc    %al,(%rax)
ffff80000010cd64:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cd6a:	10 00                	adc    %al,(%rax)
ffff80000010cd6c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cd72:	10 00                	adc    %al,(%rax)
ffff80000010cd74:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cd7a:	10 00                	adc    %al,(%rax)
ffff80000010cd7c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cd82:	10 00                	adc    %al,(%rax)
ffff80000010cd84:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cd8a:	10 00                	adc    %al,(%rax)
ffff80000010cd8c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cd92:	10 00                	adc    %al,(%rax)
ffff80000010cd94:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cd9a:	10 00                	adc    %al,(%rax)
ffff80000010cd9c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cda2:	10 00                	adc    %al,(%rax)
ffff80000010cda4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cdaa:	10 00                	adc    %al,(%rax)
ffff80000010cdac:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cdb2:	10 00                	adc    %al,(%rax)
ffff80000010cdb4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cdba:	10 00                	adc    %al,(%rax)
ffff80000010cdbc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cdc2:	10 00                	adc    %al,(%rax)
ffff80000010cdc4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cdca:	10 00                	adc    %al,(%rax)
ffff80000010cdcc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cdd2:	10 00                	adc    %al,(%rax)
ffff80000010cdd4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cdda:	10 00                	adc    %al,(%rax)
ffff80000010cddc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cde2:	10 00                	adc    %al,(%rax)
ffff80000010cde4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cdea:	10 00                	adc    %al,(%rax)
ffff80000010cdec:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cdf2:	10 00                	adc    %al,(%rax)
ffff80000010cdf4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cdfa:	10 00                	adc    %al,(%rax)
ffff80000010cdfc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ce02:	10 00                	adc    %al,(%rax)
ffff80000010ce04:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ce0a:	10 00                	adc    %al,(%rax)
ffff80000010ce0c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ce12:	10 00                	adc    %al,(%rax)
ffff80000010ce14:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ce1a:	10 00                	adc    %al,(%rax)
ffff80000010ce1c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ce22:	10 00                	adc    %al,(%rax)
ffff80000010ce24:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ce2a:	10 00                	adc    %al,(%rax)
ffff80000010ce2c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ce32:	10 00                	adc    %al,(%rax)
ffff80000010ce34:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ce3a:	10 00                	adc    %al,(%rax)
ffff80000010ce3c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ce42:	10 00                	adc    %al,(%rax)
ffff80000010ce44:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ce4a:	10 00                	adc    %al,(%rax)
ffff80000010ce4c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ce52:	10 00                	adc    %al,(%rax)
ffff80000010ce54:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ce5a:	10 00                	adc    %al,(%rax)
ffff80000010ce5c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ce62:	10 00                	adc    %al,(%rax)
ffff80000010ce64:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ce6a:	10 00                	adc    %al,(%rax)
ffff80000010ce6c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ce72:	10 00                	adc    %al,(%rax)
ffff80000010ce74:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ce7a:	10 00                	adc    %al,(%rax)
ffff80000010ce7c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ce82:	10 00                	adc    %al,(%rax)
ffff80000010ce84:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ce8a:	10 00                	adc    %al,(%rax)
ffff80000010ce8c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ce92:	10 00                	adc    %al,(%rax)
ffff80000010ce94:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ce9a:	10 00                	adc    %al,(%rax)
ffff80000010ce9c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cea2:	10 00                	adc    %al,(%rax)
ffff80000010cea4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ceaa:	10 00                	adc    %al,(%rax)
ffff80000010ceac:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ceb2:	10 00                	adc    %al,(%rax)
ffff80000010ceb4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ceba:	10 00                	adc    %al,(%rax)
ffff80000010cebc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cec2:	10 00                	adc    %al,(%rax)
ffff80000010cec4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ceca:	10 00                	adc    %al,(%rax)
ffff80000010cecc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ced2:	10 00                	adc    %al,(%rax)
ffff80000010ced4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ceda:	10 00                	adc    %al,(%rax)
ffff80000010cedc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cee2:	10 00                	adc    %al,(%rax)
ffff80000010cee4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ceea:	10 00                	adc    %al,(%rax)
ffff80000010ceec:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cef2:	10 00                	adc    %al,(%rax)
ffff80000010cef4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cefa:	10 00                	adc    %al,(%rax)
ffff80000010cefc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cf02:	10 00                	adc    %al,(%rax)
ffff80000010cf04:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cf0a:	10 00                	adc    %al,(%rax)
ffff80000010cf0c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cf12:	10 00                	adc    %al,(%rax)
ffff80000010cf14:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cf1a:	10 00                	adc    %al,(%rax)
ffff80000010cf1c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cf22:	10 00                	adc    %al,(%rax)
ffff80000010cf24:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cf2a:	10 00                	adc    %al,(%rax)
ffff80000010cf2c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cf32:	10 00                	adc    %al,(%rax)
ffff80000010cf34:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cf3a:	10 00                	adc    %al,(%rax)
ffff80000010cf3c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cf42:	10 00                	adc    %al,(%rax)
ffff80000010cf44:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cf4a:	10 00                	adc    %al,(%rax)
ffff80000010cf4c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cf52:	10 00                	adc    %al,(%rax)
ffff80000010cf54:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cf5a:	10 00                	adc    %al,(%rax)
ffff80000010cf5c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cf62:	10 00                	adc    %al,(%rax)
ffff80000010cf64:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cf6a:	10 00                	adc    %al,(%rax)
ffff80000010cf6c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cf72:	10 00                	adc    %al,(%rax)
ffff80000010cf74:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cf7a:	10 00                	adc    %al,(%rax)
ffff80000010cf7c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cf82:	10 00                	adc    %al,(%rax)
ffff80000010cf84:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cf8a:	10 00                	adc    %al,(%rax)
ffff80000010cf8c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cf92:	10 00                	adc    %al,(%rax)
ffff80000010cf94:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cf9a:	10 00                	adc    %al,(%rax)
ffff80000010cf9c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cfa2:	10 00                	adc    %al,(%rax)
ffff80000010cfa4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cfaa:	10 00                	adc    %al,(%rax)
ffff80000010cfac:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cfb2:	10 00                	adc    %al,(%rax)
ffff80000010cfb4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cfba:	10 00                	adc    %al,(%rax)
ffff80000010cfbc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cfc2:	10 00                	adc    %al,(%rax)
ffff80000010cfc4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cfca:	10 00                	adc    %al,(%rax)
ffff80000010cfcc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cfd2:	10 00                	adc    %al,(%rax)
ffff80000010cfd4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cfda:	10 00                	adc    %al,(%rax)
ffff80000010cfdc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cfe2:	10 00                	adc    %al,(%rax)
ffff80000010cfe4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cfea:	10 00                	adc    %al,(%rax)
ffff80000010cfec:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cff2:	10 00                	adc    %al,(%rax)
ffff80000010cff4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cffa:	10 00                	adc    %al,(%rax)
ffff80000010cffc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d002:	10 00                	adc    %al,(%rax)
ffff80000010d004:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d00a:	10 00                	adc    %al,(%rax)
ffff80000010d00c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d012:	10 00                	adc    %al,(%rax)
ffff80000010d014:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d01a:	10 00                	adc    %al,(%rax)
ffff80000010d01c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d022:	10 00                	adc    %al,(%rax)
ffff80000010d024:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d02a:	10 00                	adc    %al,(%rax)
ffff80000010d02c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d032:	10 00                	adc    %al,(%rax)
ffff80000010d034:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d03a:	10 00                	adc    %al,(%rax)
ffff80000010d03c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d042:	10 00                	adc    %al,(%rax)
ffff80000010d044:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d04a:	10 00                	adc    %al,(%rax)
ffff80000010d04c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d052:	10 00                	adc    %al,(%rax)
ffff80000010d054:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d05a:	10 00                	adc    %al,(%rax)
ffff80000010d05c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d062:	10 00                	adc    %al,(%rax)
ffff80000010d064:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d06a:	10 00                	adc    %al,(%rax)
ffff80000010d06c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d072:	10 00                	adc    %al,(%rax)
ffff80000010d074:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d07a:	10 00                	adc    %al,(%rax)
ffff80000010d07c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d082:	10 00                	adc    %al,(%rax)
ffff80000010d084:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d08a:	10 00                	adc    %al,(%rax)
ffff80000010d08c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d092:	10 00                	adc    %al,(%rax)
ffff80000010d094:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d09a:	10 00                	adc    %al,(%rax)
ffff80000010d09c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d0a2:	10 00                	adc    %al,(%rax)
ffff80000010d0a4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d0aa:	10 00                	adc    %al,(%rax)
ffff80000010d0ac:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d0b2:	10 00                	adc    %al,(%rax)
ffff80000010d0b4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d0ba:	10 00                	adc    %al,(%rax)
ffff80000010d0bc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d0c2:	10 00                	adc    %al,(%rax)
ffff80000010d0c4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d0ca:	10 00                	adc    %al,(%rax)
ffff80000010d0cc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d0d2:	10 00                	adc    %al,(%rax)
ffff80000010d0d4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d0da:	10 00                	adc    %al,(%rax)
ffff80000010d0dc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d0e2:	10 00                	adc    %al,(%rax)
ffff80000010d0e4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d0ea:	10 00                	adc    %al,(%rax)
ffff80000010d0ec:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d0f2:	10 00                	adc    %al,(%rax)
ffff80000010d0f4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d0fa:	10 00                	adc    %al,(%rax)
ffff80000010d0fc:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010d102:	11 00                	adc    %eax,(%rax)
ffff80000010d104:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010d10a:	00 00                	add    %al,(%rax)
ffff80000010d10c:	00 00                	add    %al,(%rax)
ffff80000010d10e:	00 00                	add    %al,(%rax)
ffff80000010d110:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010d116:	ff                   	(bad)  
ffff80000010d117:	ff 10                	callq  *(%rax)
ffff80000010d119:	00 00                	add    %al,(%rax)
ffff80000010d11b:	00 00                	add    %al,(%rax)
ffff80000010d11d:	00 00                	add    %al,(%rax)
ffff80000010d11f:	00 10                	add    %dl,(%rax)
	...
ffff80000010d141:	00 11                	add    %dl,(%rcx)
ffff80000010d143:	00 00                	add    %al,(%rax)
ffff80000010d145:	80 ff ff             	cmp    $0xff,%bh
	...
ffff80000010d184:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010d18a:	ff                   	(bad)  
ffff80000010d18b:	ff 00                	incl   (%rax)
ffff80000010d18d:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010d190:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010d196:	11 00                	adc    %eax,(%rax)
ffff80000010d198:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010d19e:	00 00                	add    %al,(%rax)
ffff80000010d1a0:	00 00                	add    %al,(%rax)
ffff80000010d1a2:	00 00                	add    %al,(%rax)
ffff80000010d1a4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010d1a8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d1ae:	00 00                	add    %al,(%rax)
ffff80000010d1b0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d1b6:	00 00                	add    %al,(%rax)
ffff80000010d1b8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d1be:	00 00                	add    %al,(%rax)
ffff80000010d1c0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d1c6:	00 00                	add    %al,(%rax)
ffff80000010d1c8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d1ce:	00 00                	add    %al,(%rax)
ffff80000010d1d0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d1d6:	00 00                	add    %al,(%rax)
ffff80000010d1d8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010d1ea:	00 00                	add    %al,(%rax)
ffff80000010d1ec:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010d1f2:	ff                   	(bad)  
ffff80000010d1f3:	ff 00                	incl   (%rax)
ffff80000010d1f5:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010d1f8:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010d1fe:	11 00                	adc    %eax,(%rax)
ffff80000010d200:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010d206:	00 00                	add    %al,(%rax)
ffff80000010d208:	00 00                	add    %al,(%rax)
ffff80000010d20a:	00 00                	add    %al,(%rax)
ffff80000010d20c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010d210:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d216:	00 00                	add    %al,(%rax)
ffff80000010d218:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d21e:	00 00                	add    %al,(%rax)
ffff80000010d220:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d226:	00 00                	add    %al,(%rax)
ffff80000010d228:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d22e:	00 00                	add    %al,(%rax)
ffff80000010d230:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d236:	00 00                	add    %al,(%rax)
ffff80000010d238:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d23e:	00 00                	add    %al,(%rax)
ffff80000010d240:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010d252:	00 00                	add    %al,(%rax)
ffff80000010d254:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010d25a:	ff                   	(bad)  
ffff80000010d25b:	ff 00                	incl   (%rax)
ffff80000010d25d:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010d260:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010d266:	11 00                	adc    %eax,(%rax)
ffff80000010d268:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010d26e:	00 00                	add    %al,(%rax)
ffff80000010d270:	00 00                	add    %al,(%rax)
ffff80000010d272:	00 00                	add    %al,(%rax)
ffff80000010d274:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010d278:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d27e:	00 00                	add    %al,(%rax)
ffff80000010d280:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d286:	00 00                	add    %al,(%rax)
ffff80000010d288:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d28e:	00 00                	add    %al,(%rax)
ffff80000010d290:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d296:	00 00                	add    %al,(%rax)
ffff80000010d298:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d29e:	00 00                	add    %al,(%rax)
ffff80000010d2a0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d2a6:	00 00                	add    %al,(%rax)
ffff80000010d2a8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010d2ba:	00 00                	add    %al,(%rax)
ffff80000010d2bc:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010d2c2:	ff                   	(bad)  
ffff80000010d2c3:	ff 00                	incl   (%rax)
ffff80000010d2c5:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010d2c8:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010d2ce:	11 00                	adc    %eax,(%rax)
ffff80000010d2d0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010d2d6:	00 00                	add    %al,(%rax)
ffff80000010d2d8:	00 00                	add    %al,(%rax)
ffff80000010d2da:	00 00                	add    %al,(%rax)
ffff80000010d2dc:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010d2e0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d2e6:	00 00                	add    %al,(%rax)
ffff80000010d2e8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d2ee:	00 00                	add    %al,(%rax)
ffff80000010d2f0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d2f6:	00 00                	add    %al,(%rax)
ffff80000010d2f8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d2fe:	00 00                	add    %al,(%rax)
ffff80000010d300:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d306:	00 00                	add    %al,(%rax)
ffff80000010d308:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d30e:	00 00                	add    %al,(%rax)
ffff80000010d310:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010d322:	00 00                	add    %al,(%rax)
ffff80000010d324:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010d32a:	ff                   	(bad)  
ffff80000010d32b:	ff 00                	incl   (%rax)
ffff80000010d32d:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010d330:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010d336:	11 00                	adc    %eax,(%rax)
ffff80000010d338:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010d33e:	00 00                	add    %al,(%rax)
ffff80000010d340:	00 00                	add    %al,(%rax)
ffff80000010d342:	00 00                	add    %al,(%rax)
ffff80000010d344:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010d348:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d34e:	00 00                	add    %al,(%rax)
ffff80000010d350:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d356:	00 00                	add    %al,(%rax)
ffff80000010d358:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d35e:	00 00                	add    %al,(%rax)
ffff80000010d360:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d366:	00 00                	add    %al,(%rax)
ffff80000010d368:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d36e:	00 00                	add    %al,(%rax)
ffff80000010d370:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d376:	00 00                	add    %al,(%rax)
ffff80000010d378:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010d38a:	00 00                	add    %al,(%rax)
ffff80000010d38c:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010d392:	ff                   	(bad)  
ffff80000010d393:	ff 00                	incl   (%rax)
ffff80000010d395:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010d398:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010d39e:	11 00                	adc    %eax,(%rax)
ffff80000010d3a0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010d3a6:	00 00                	add    %al,(%rax)
ffff80000010d3a8:	00 00                	add    %al,(%rax)
ffff80000010d3aa:	00 00                	add    %al,(%rax)
ffff80000010d3ac:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010d3b0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d3b6:	00 00                	add    %al,(%rax)
ffff80000010d3b8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d3be:	00 00                	add    %al,(%rax)
ffff80000010d3c0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d3c6:	00 00                	add    %al,(%rax)
ffff80000010d3c8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d3ce:	00 00                	add    %al,(%rax)
ffff80000010d3d0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d3d6:	00 00                	add    %al,(%rax)
ffff80000010d3d8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d3de:	00 00                	add    %al,(%rax)
ffff80000010d3e0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010d3f2:	00 00                	add    %al,(%rax)
ffff80000010d3f4:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010d3fa:	ff                   	(bad)  
ffff80000010d3fb:	ff 00                	incl   (%rax)
ffff80000010d3fd:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010d400:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010d406:	11 00                	adc    %eax,(%rax)
ffff80000010d408:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010d40e:	00 00                	add    %al,(%rax)
ffff80000010d410:	00 00                	add    %al,(%rax)
ffff80000010d412:	00 00                	add    %al,(%rax)
ffff80000010d414:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010d418:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d41e:	00 00                	add    %al,(%rax)
ffff80000010d420:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d426:	00 00                	add    %al,(%rax)
ffff80000010d428:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d42e:	00 00                	add    %al,(%rax)
ffff80000010d430:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d436:	00 00                	add    %al,(%rax)
ffff80000010d438:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d43e:	00 00                	add    %al,(%rax)
ffff80000010d440:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d446:	00 00                	add    %al,(%rax)
ffff80000010d448:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010d45a:	00 00                	add    %al,(%rax)
ffff80000010d45c:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010d462:	ff                   	(bad)  
ffff80000010d463:	ff 00                	incl   (%rax)
ffff80000010d465:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010d468:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010d46e:	11 00                	adc    %eax,(%rax)
ffff80000010d470:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010d476:	00 00                	add    %al,(%rax)
ffff80000010d478:	00 00                	add    %al,(%rax)
ffff80000010d47a:	00 00                	add    %al,(%rax)
ffff80000010d47c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010d480:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d486:	00 00                	add    %al,(%rax)
ffff80000010d488:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d48e:	00 00                	add    %al,(%rax)
ffff80000010d490:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d496:	00 00                	add    %al,(%rax)
ffff80000010d498:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d49e:	00 00                	add    %al,(%rax)
ffff80000010d4a0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d4a6:	00 00                	add    %al,(%rax)
ffff80000010d4a8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010d4ae:	00 00                	add    %al,(%rax)
ffff80000010d4b0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010d4be:	00 00                	add    %al,(%rax)
ffff80000010d4c0:	0d 46 10 00 00       	or     $0x1046,%eax
ffff80000010d4c5:	80 ff ff             	cmp    $0xff,%bh
ffff80000010d4c8:	7c 46                	jl     ffff80000010d510 <system_call_table+0x810>
ffff80000010d4ca:	10 00                	adc    %al,(%rax)
ffff80000010d4cc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d4d2:	10 00                	adc    %al,(%rax)
ffff80000010d4d4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d4da:	10 00                	adc    %al,(%rax)
ffff80000010d4dc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d4e2:	10 00                	adc    %al,(%rax)
ffff80000010d4e4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d4ea:	10 00                	adc    %al,(%rax)
ffff80000010d4ec:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d4f2:	10 00                	adc    %al,(%rax)
ffff80000010d4f4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d4fa:	10 00                	adc    %al,(%rax)
ffff80000010d4fc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d502:	10 00                	adc    %al,(%rax)
ffff80000010d504:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d50a:	10 00                	adc    %al,(%rax)
ffff80000010d50c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d512:	10 00                	adc    %al,(%rax)
ffff80000010d514:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d51a:	10 00                	adc    %al,(%rax)
ffff80000010d51c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d522:	10 00                	adc    %al,(%rax)
ffff80000010d524:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d52a:	10 00                	adc    %al,(%rax)
ffff80000010d52c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d532:	10 00                	adc    %al,(%rax)
ffff80000010d534:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d53a:	10 00                	adc    %al,(%rax)
ffff80000010d53c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d542:	10 00                	adc    %al,(%rax)
ffff80000010d544:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d54a:	10 00                	adc    %al,(%rax)
ffff80000010d54c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d552:	10 00                	adc    %al,(%rax)
ffff80000010d554:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d55a:	10 00                	adc    %al,(%rax)
ffff80000010d55c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d562:	10 00                	adc    %al,(%rax)
ffff80000010d564:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d56a:	10 00                	adc    %al,(%rax)
ffff80000010d56c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d572:	10 00                	adc    %al,(%rax)
ffff80000010d574:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d57a:	10 00                	adc    %al,(%rax)
ffff80000010d57c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d582:	10 00                	adc    %al,(%rax)
ffff80000010d584:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d58a:	10 00                	adc    %al,(%rax)
ffff80000010d58c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d592:	10 00                	adc    %al,(%rax)
ffff80000010d594:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d59a:	10 00                	adc    %al,(%rax)
ffff80000010d59c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d5a2:	10 00                	adc    %al,(%rax)
ffff80000010d5a4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d5aa:	10 00                	adc    %al,(%rax)
ffff80000010d5ac:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d5b2:	10 00                	adc    %al,(%rax)
ffff80000010d5b4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d5ba:	10 00                	adc    %al,(%rax)
ffff80000010d5bc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d5c2:	10 00                	adc    %al,(%rax)
ffff80000010d5c4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d5ca:	10 00                	adc    %al,(%rax)
ffff80000010d5cc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d5d2:	10 00                	adc    %al,(%rax)
ffff80000010d5d4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d5da:	10 00                	adc    %al,(%rax)
ffff80000010d5dc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d5e2:	10 00                	adc    %al,(%rax)
ffff80000010d5e4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d5ea:	10 00                	adc    %al,(%rax)
ffff80000010d5ec:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d5f2:	10 00                	adc    %al,(%rax)
ffff80000010d5f4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d5fa:	10 00                	adc    %al,(%rax)
ffff80000010d5fc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d602:	10 00                	adc    %al,(%rax)
ffff80000010d604:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d60a:	10 00                	adc    %al,(%rax)
ffff80000010d60c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d612:	10 00                	adc    %al,(%rax)
ffff80000010d614:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d61a:	10 00                	adc    %al,(%rax)
ffff80000010d61c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d622:	10 00                	adc    %al,(%rax)
ffff80000010d624:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d62a:	10 00                	adc    %al,(%rax)
ffff80000010d62c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d632:	10 00                	adc    %al,(%rax)
ffff80000010d634:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d63a:	10 00                	adc    %al,(%rax)
ffff80000010d63c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d642:	10 00                	adc    %al,(%rax)
ffff80000010d644:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d64a:	10 00                	adc    %al,(%rax)
ffff80000010d64c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d652:	10 00                	adc    %al,(%rax)
ffff80000010d654:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d65a:	10 00                	adc    %al,(%rax)
ffff80000010d65c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d662:	10 00                	adc    %al,(%rax)
ffff80000010d664:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d66a:	10 00                	adc    %al,(%rax)
ffff80000010d66c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d672:	10 00                	adc    %al,(%rax)
ffff80000010d674:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d67a:	10 00                	adc    %al,(%rax)
ffff80000010d67c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d682:	10 00                	adc    %al,(%rax)
ffff80000010d684:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d68a:	10 00                	adc    %al,(%rax)
ffff80000010d68c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d692:	10 00                	adc    %al,(%rax)
ffff80000010d694:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d69a:	10 00                	adc    %al,(%rax)
ffff80000010d69c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d6a2:	10 00                	adc    %al,(%rax)
ffff80000010d6a4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d6aa:	10 00                	adc    %al,(%rax)
ffff80000010d6ac:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d6b2:	10 00                	adc    %al,(%rax)
ffff80000010d6b4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d6ba:	10 00                	adc    %al,(%rax)
ffff80000010d6bc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d6c2:	10 00                	adc    %al,(%rax)
ffff80000010d6c4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d6ca:	10 00                	adc    %al,(%rax)
ffff80000010d6cc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d6d2:	10 00                	adc    %al,(%rax)
ffff80000010d6d4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d6da:	10 00                	adc    %al,(%rax)
ffff80000010d6dc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d6e2:	10 00                	adc    %al,(%rax)
ffff80000010d6e4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d6ea:	10 00                	adc    %al,(%rax)
ffff80000010d6ec:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d6f2:	10 00                	adc    %al,(%rax)
ffff80000010d6f4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d6fa:	10 00                	adc    %al,(%rax)
ffff80000010d6fc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d702:	10 00                	adc    %al,(%rax)
ffff80000010d704:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d70a:	10 00                	adc    %al,(%rax)
ffff80000010d70c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d712:	10 00                	adc    %al,(%rax)
ffff80000010d714:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d71a:	10 00                	adc    %al,(%rax)
ffff80000010d71c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d722:	10 00                	adc    %al,(%rax)
ffff80000010d724:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d72a:	10 00                	adc    %al,(%rax)
ffff80000010d72c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d732:	10 00                	adc    %al,(%rax)
ffff80000010d734:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d73a:	10 00                	adc    %al,(%rax)
ffff80000010d73c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d742:	10 00                	adc    %al,(%rax)
ffff80000010d744:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d74a:	10 00                	adc    %al,(%rax)
ffff80000010d74c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d752:	10 00                	adc    %al,(%rax)
ffff80000010d754:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d75a:	10 00                	adc    %al,(%rax)
ffff80000010d75c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d762:	10 00                	adc    %al,(%rax)
ffff80000010d764:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d76a:	10 00                	adc    %al,(%rax)
ffff80000010d76c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d772:	10 00                	adc    %al,(%rax)
ffff80000010d774:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d77a:	10 00                	adc    %al,(%rax)
ffff80000010d77c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d782:	10 00                	adc    %al,(%rax)
ffff80000010d784:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d78a:	10 00                	adc    %al,(%rax)
ffff80000010d78c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d792:	10 00                	adc    %al,(%rax)
ffff80000010d794:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d79a:	10 00                	adc    %al,(%rax)
ffff80000010d79c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d7a2:	10 00                	adc    %al,(%rax)
ffff80000010d7a4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d7aa:	10 00                	adc    %al,(%rax)
ffff80000010d7ac:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d7b2:	10 00                	adc    %al,(%rax)
ffff80000010d7b4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d7ba:	10 00                	adc    %al,(%rax)
ffff80000010d7bc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d7c2:	10 00                	adc    %al,(%rax)
ffff80000010d7c4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d7ca:	10 00                	adc    %al,(%rax)
ffff80000010d7cc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d7d2:	10 00                	adc    %al,(%rax)
ffff80000010d7d4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d7da:	10 00                	adc    %al,(%rax)
ffff80000010d7dc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d7e2:	10 00                	adc    %al,(%rax)
ffff80000010d7e4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d7ea:	10 00                	adc    %al,(%rax)
ffff80000010d7ec:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d7f2:	10 00                	adc    %al,(%rax)
ffff80000010d7f4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d7fa:	10 00                	adc    %al,(%rax)
ffff80000010d7fc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d802:	10 00                	adc    %al,(%rax)
ffff80000010d804:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d80a:	10 00                	adc    %al,(%rax)
ffff80000010d80c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d812:	10 00                	adc    %al,(%rax)
ffff80000010d814:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d81a:	10 00                	adc    %al,(%rax)
ffff80000010d81c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d822:	10 00                	adc    %al,(%rax)
ffff80000010d824:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d82a:	10 00                	adc    %al,(%rax)
ffff80000010d82c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d832:	10 00                	adc    %al,(%rax)
ffff80000010d834:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d83a:	10 00                	adc    %al,(%rax)
ffff80000010d83c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d842:	10 00                	adc    %al,(%rax)
ffff80000010d844:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d84a:	10 00                	adc    %al,(%rax)
ffff80000010d84c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d852:	10 00                	adc    %al,(%rax)
ffff80000010d854:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d85a:	10 00                	adc    %al,(%rax)
ffff80000010d85c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d862:	10 00                	adc    %al,(%rax)
ffff80000010d864:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d86a:	10 00                	adc    %al,(%rax)
ffff80000010d86c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d872:	10 00                	adc    %al,(%rax)
ffff80000010d874:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d87a:	10 00                	adc    %al,(%rax)
ffff80000010d87c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d882:	10 00                	adc    %al,(%rax)
ffff80000010d884:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d88a:	10 00                	adc    %al,(%rax)
ffff80000010d88c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d892:	10 00                	adc    %al,(%rax)
ffff80000010d894:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d89a:	10 00                	adc    %al,(%rax)
ffff80000010d89c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d8a2:	10 00                	adc    %al,(%rax)
ffff80000010d8a4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d8aa:	10 00                	adc    %al,(%rax)
ffff80000010d8ac:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d8b2:	10 00                	adc    %al,(%rax)
ffff80000010d8b4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010d8ba:	10 00                	adc    %al,(%rax)
ffff80000010d8bc:	00                   	.byte 0x0
ffff80000010d8bd:	80 ff ff             	cmp    $0xff,%bh

Disassembly of section .data.rel:

ffff80000010d8c0 <interrupt>:
ffff80000010d8c0:	71 80                	jno    ffff80000010d842 <system_call_table+0xb42>
ffff80000010d8c2:	10 00                	adc    %al,(%rax)
ffff80000010d8c4:	00 80 ff ff bb 80    	add    %al,-0x7f440001(%rax)
ffff80000010d8ca:	10 00                	adc    %al,(%rax)
ffff80000010d8cc:	00 80 ff ff 05 81    	add    %al,-0x7efa0001(%rax)
ffff80000010d8d2:	10 00                	adc    %al,(%rax)
ffff80000010d8d4:	00 80 ff ff 4f 81    	add    %al,-0x7eb00001(%rax)
ffff80000010d8da:	10 00                	adc    %al,(%rax)
ffff80000010d8dc:	00 80 ff ff 99 81    	add    %al,-0x7e660001(%rax)
ffff80000010d8e2:	10 00                	adc    %al,(%rax)
ffff80000010d8e4:	00 80 ff ff e3 81    	add    %al,-0x7e1c0001(%rax)
ffff80000010d8ea:	10 00                	adc    %al,(%rax)
ffff80000010d8ec:	00 80 ff ff 2d 82    	add    %al,-0x7dd20001(%rax)
ffff80000010d8f2:	10 00                	adc    %al,(%rax)
ffff80000010d8f4:	00 80 ff ff 77 82    	add    %al,-0x7d880001(%rax)
ffff80000010d8fa:	10 00                	adc    %al,(%rax)
ffff80000010d8fc:	00 80 ff ff c1 82    	add    %al,-0x7d3e0001(%rax)
ffff80000010d902:	10 00                	adc    %al,(%rax)
ffff80000010d904:	00 80 ff ff 0b 83    	add    %al,-0x7cf40001(%rax)
ffff80000010d90a:	10 00                	adc    %al,(%rax)
ffff80000010d90c:	00 80 ff ff 55 83    	add    %al,-0x7caa0001(%rax)
ffff80000010d912:	10 00                	adc    %al,(%rax)
ffff80000010d914:	00 80 ff ff 9f 83    	add    %al,-0x7c600001(%rax)
ffff80000010d91a:	10 00                	adc    %al,(%rax)
ffff80000010d91c:	00 80 ff ff e9 83    	add    %al,-0x7c160001(%rax)
ffff80000010d922:	10 00                	adc    %al,(%rax)
ffff80000010d924:	00 80 ff ff 33 84    	add    %al,-0x7bcc0001(%rax)
ffff80000010d92a:	10 00                	adc    %al,(%rax)
ffff80000010d92c:	00 80 ff ff 7d 84    	add    %al,-0x7b820001(%rax)
ffff80000010d932:	10 00                	adc    %al,(%rax)
ffff80000010d934:	00 80 ff ff c7 84    	add    %al,-0x7b380001(%rax)
ffff80000010d93a:	10 00                	adc    %al,(%rax)
ffff80000010d93c:	00 80 ff ff 11 85    	add    %al,-0x7aee0001(%rax)
ffff80000010d942:	10 00                	adc    %al,(%rax)
ffff80000010d944:	00 80 ff ff 5b 85    	add    %al,-0x7aa40001(%rax)
ffff80000010d94a:	10 00                	adc    %al,(%rax)
ffff80000010d94c:	00 80 ff ff a5 85    	add    %al,-0x7a5a0001(%rax)
ffff80000010d952:	10 00                	adc    %al,(%rax)
ffff80000010d954:	00 80 ff ff ef 85    	add    %al,-0x7a100001(%rax)
ffff80000010d95a:	10 00                	adc    %al,(%rax)
ffff80000010d95c:	00 80 ff ff 39 86    	add    %al,-0x79c60001(%rax)
ffff80000010d962:	10 00                	adc    %al,(%rax)
ffff80000010d964:	00 80 ff ff 83 86    	add    %al,-0x797c0001(%rax)
ffff80000010d96a:	10 00                	adc    %al,(%rax)
ffff80000010d96c:	00 80 ff ff cd 86    	add    %al,-0x79320001(%rax)
ffff80000010d972:	10 00                	adc    %al,(%rax)
ffff80000010d974:	00 80 ff ff 17 87    	add    %al,-0x78e80001(%rax)
ffff80000010d97a:	10 00                	adc    %al,(%rax)
ffff80000010d97c:	00                   	.byte 0x0
ffff80000010d97d:	80 ff ff             	cmp    $0xff,%bh

Disassembly of section .rodata:

ffff80000010d980 <_rodata>:
ffff80000010d980:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d981:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d982:	5f                   	pop    %rdi
ffff80000010d983:	73 79                	jae    ffff80000010d9fe <.LC1+0x26>
ffff80000010d985:	73 74                	jae    ffff80000010d9fb <.LC1+0x23>
ffff80000010d987:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff80000010d989:	5f                   	pop    %rdi
ffff80000010d98a:	63 61 6c             	movslq 0x6c(%rcx),%esp
ffff80000010d98d:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d98e:	20 69 73             	and    %ch,0x73(%rcx)
ffff80000010d991:	20 63 61             	and    %ah,0x61(%rbx)
ffff80000010d994:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d995:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d996:	69 6e 67 2c 4e 52 3a 	imul   $0x3a524e2c,0x67(%rsi),%ebp
ffff80000010d99d:	25 78 0a 00        	and    $0xa000a78,%eax

ffff80000010d9a1 <.LC1>:
ffff80000010d9a1:	0a 68 65             	or     0x65(%rax),%ch
ffff80000010d9a4:	72 65                	jb     ffff80000010da0b <.LC2+0xb>
ffff80000010d9a6:	0a 00                	or     (%rax),%al

ffff80000010d9a8 <.LC0>:
ffff80000010d9a8:	44 69 76 69 64 65 20 	imul   $0x45206564,0x69(%rsi),%r14d
ffff80000010d9af:	45 
ffff80000010d9b0:	72 72                	jb     ffff80000010da24 <.LC2+0x24>
ffff80000010d9b2:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d9b3:	72 28                	jb     ffff80000010d9dd <.LC1+0x5>
ffff80000010d9b5:	23 44 45 29          	and    0x29(%rbp,%rax,2),%eax
ffff80000010d9b9:	0a 45 72             	or     0x72(%rbp),%al
ffff80000010d9bc:	72 6f                	jb     ffff80000010da2d <.LC2+0x2d>
ffff80000010d9be:	72 43                	jb     ffff80000010da03 <.LC2+0x3>
ffff80000010d9c0:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d9c1:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010d9c5:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010d9ca:	50                   	push   %rax
ffff80000010d9cb:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962fa49 <_end+0x495065f1>
ffff80000010d9d1:	50                   	push   %rax
ffff80000010d9d2:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010e450 <_erodata+0x1ba>

ffff80000010d9d8 <.LC1>:
ffff80000010d9d8:	44                   	rex.R
ffff80000010d9d9:	65 62                	gs (bad) 
ffff80000010d9db:	75 67                	jne    ffff80000010da44 <.LC3+0x14>
ffff80000010d9dd:	28 23                	sub    %ah,(%rbx)
ffff80000010d9df:	44                   	rex.R
ffff80000010d9e0:	42 29 0a             	rex.X sub %ecx,(%rdx)
ffff80000010d9e3:	45 72 72             	rex.RB jb ffff80000010da58 <.LC3+0x28>
ffff80000010d9e6:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d9e7:	72 43                	jb     ffff80000010da2c <.LC2+0x2c>
ffff80000010d9e9:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d9ea:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010d9ee:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010d9f3:	50                   	push   %rax
ffff80000010d9f4:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962fa72 <_end+0x4950661a>
ffff80000010d9fa:	50                   	push   %rax
ffff80000010d9fb:	3a 25 78 0a 00     	cmp    0x4e000a78(%rip),%ah        # ffff80004e10e479 <_end+0x4dfe5021>

ffff80000010da00 <.LC2>:
ffff80000010da00:	4e                   	rex.WRX
ffff80000010da01:	4d                   	rex.WRB
ffff80000010da02:	49 20 49 6e          	rex.WB and %cl,0x6e(%r9)
ffff80000010da06:	74 65                	je     ffff80000010da6d <.LC4+0xd>
ffff80000010da08:	72 72                	jb     ffff80000010da7c <.LC4+0x1c>
ffff80000010da0a:	75 70                	jne    ffff80000010da7c <.LC4+0x1c>
ffff80000010da0c:	74 28                	je     ffff80000010da36 <.LC3+0x6>
ffff80000010da0e:	2d 29 0a 45 72       	sub    $0x72450a29,%eax
ffff80000010da13:	72 6f                	jb     ffff80000010da84 <.LC4+0x24>
ffff80000010da15:	72 43                	jb     ffff80000010da5a <.LC3+0x2a>
ffff80000010da17:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010da18:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010da1c:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010da21:	50                   	push   %rax
ffff80000010da22:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962faa0 <_end+0x49506648>
ffff80000010da28:	50                   	push   %rax
ffff80000010da29:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010e4a7 <_erodata+0x211>
	...

ffff80000010da30 <.LC3>:
ffff80000010da30:	42 72 65             	rex.X jb ffff80000010da98 <.LC5+0x8>
ffff80000010da33:	61                   	(bad)  
ffff80000010da34:	6b 50 6f 69          	imul   $0x69,0x6f(%rax),%edx
ffff80000010da38:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010da39:	74 28                	je     ffff80000010da63 <.LC4+0x3>
ffff80000010da3b:	23 42 50             	and    0x50(%rdx),%eax
ffff80000010da3e:	29 0a                	sub    %ecx,(%rdx)
ffff80000010da40:	45 72 72             	rex.RB jb ffff80000010dab5 <.LC5+0x25>
ffff80000010da43:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010da44:	72 43                	jb     ffff80000010da89 <.LC4+0x29>
ffff80000010da46:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010da47:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010da4b:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010da50:	50                   	push   %rax
ffff80000010da51:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962facf <_end+0x49506677>
ffff80000010da57:	50                   	push   %rax
ffff80000010da58:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010e4d6 <_erodata+0x240>
	...

ffff80000010da60 <.LC4>:
ffff80000010da60:	4f 76 65             	rex.WRXB jbe ffff80000010dac8 <.LC6>
ffff80000010da63:	72 46                	jb     ffff80000010daab <.LC5+0x1b>
ffff80000010da65:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010da66:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010da67:	77 28                	ja     ffff80000010da91 <.LC5+0x1>
ffff80000010da69:	23 4f 46             	and    0x46(%rdi),%ecx
ffff80000010da6c:	29 0a                	sub    %ecx,(%rdx)
ffff80000010da6e:	45 72 72             	rex.RB jb ffff80000010dae3 <.LC6+0x1b>
ffff80000010da71:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010da72:	72 43                	jb     ffff80000010dab7 <.LC5+0x27>
ffff80000010da74:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010da75:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010da79:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010da7e:	50                   	push   %rax
ffff80000010da7f:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962fafd <_end+0x495066a5>
ffff80000010da85:	50                   	push   %rax
ffff80000010da86:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010e504 <_erodata+0x26e>
ffff80000010da8c:	00 00                	add    %al,(%rax)
	...

ffff80000010da90 <.LC5>:
ffff80000010da90:	42                   	rex.X
ffff80000010da91:	4f 55                	rex.WRXB push %r13
ffff80000010da93:	4e                   	rex.WRX
ffff80000010da94:	44 20 52 61          	and    %r10b,0x61(%rdx)
ffff80000010da98:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010da99:	67 65 20 45 78       	and    %al,%gs:0x78(%ebp)
ffff80000010da9e:	63 65 65             	movslq 0x65(%rbp),%esp
ffff80000010daa1:	64 65 64 28 23       	fs gs sub %ah,%fs:(%rbx)
ffff80000010daa6:	42 52                	rex.X push %rdx
ffff80000010daa8:	29 0a                	sub    %ecx,(%rdx)
ffff80000010daaa:	45 72 72             	rex.RB jb ffff80000010db1f <.LC7+0xf>
ffff80000010daad:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010daae:	72 43                	jb     ffff80000010daf3 <.LC6+0x2b>
ffff80000010dab0:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010dab1:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010dab5:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010daba:	50                   	push   %rax
ffff80000010dabb:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962fb39 <_end+0x495066e1>
ffff80000010dac1:	50                   	push   %rax
ffff80000010dac2:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010e540 <_erodata+0x2aa>

ffff80000010dac8 <.LC6>:
ffff80000010dac8:	49 6e                	rex.WB outsb %ds:(%rsi),(%dx)
ffff80000010daca:	76 61                	jbe    ffff80000010db2d <.LC7+0x1d>
ffff80000010dacc:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010dacd:	69 64 20 4f 70 63 6f 	imul   $0x646f6370,0x4f(%rax,%riz,1),%esp
ffff80000010dad4:	64 
ffff80000010dad5:	65 20 28             	and    %ch,%gs:(%rax)
ffff80000010dad8:	55                   	push   %rbp
ffff80000010dad9:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010dada:	64 65 66 69 6e 65 64 	fs imul $0x2064,%gs:0x65(%rsi),%bp
ffff80000010dae1:	20 
ffff80000010dae2:	4f 70 63             	rex.WRXB jo ffff80000010db48 <.LC7+0x38>
ffff80000010dae5:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010dae6:	64 65 29 28          	fs sub %ebp,%gs:(%rax)
ffff80000010daea:	23 55 44             	and    0x44(%rbp),%edx
ffff80000010daed:	29 0a                	sub    %ecx,(%rdx)
ffff80000010daef:	09 09                	or     %ecx,(%rcx)
ffff80000010daf1:	45 72 72             	rex.RB jb ffff80000010db66 <.LC8+0x6>
ffff80000010daf4:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010daf5:	72 43                	jb     ffff80000010db3a <.LC7+0x2a>
ffff80000010daf7:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010daf8:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010dafc:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010db01:	50                   	push   %rax
ffff80000010db02:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962fb80 <_end+0x49506728>
ffff80000010db08:	50                   	push   %rax
ffff80000010db09:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010e587 <_erodata+0x2f1>
	...

ffff80000010db10 <.LC7>:
ffff80000010db10:	20 44 65 76          	and    %al,0x76(%rbp,%riz,2)
ffff80000010db14:	69 63 65 20 4e 6f 74 	imul   $0x746f4e20,0x65(%rbx),%esp
ffff80000010db1b:	20 41 76             	and    %al,0x76(%rcx)
ffff80000010db1e:	61                   	(bad)  
ffff80000010db1f:	69 6c 61 62 6c 65 20 	imul   $0x2820656c,0x62(%rcx,%riz,2),%ebp
ffff80000010db26:	28 
ffff80000010db27:	4e 6f                	rex.WRX outsl %ds:(%rsi),(%dx)
ffff80000010db29:	20 4d 61             	and    %cl,0x61(%rbp)
ffff80000010db2c:	74 68                	je     ffff80000010db96 <.LC9+0x6>
ffff80000010db2e:	20 43 6f             	and    %al,0x6f(%rbx)
ffff80000010db31:	70 72                	jo     ffff80000010dba5 <.LC9+0x15>
ffff80000010db33:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010db34:	63 65 73             	movslq 0x73(%rbp),%esp
ffff80000010db37:	73 6f                	jae    ffff80000010dba8 <.LC9+0x18>
ffff80000010db39:	72 29                	jb     ffff80000010db64 <.LC8+0x4>
ffff80000010db3b:	28 23                	sub    %ah,(%rbx)
ffff80000010db3d:	4e                   	rex.WRX
ffff80000010db3e:	4d 29 0a             	sub    %r9,(%r10)
ffff80000010db41:	09 09                	or     %ecx,(%rcx)
ffff80000010db43:	45 72 72             	rex.RB jb ffff80000010dbb8 <.LC9+0x28>
ffff80000010db46:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010db47:	72 43                	jb     ffff80000010db8c <.LC8+0x2c>
ffff80000010db49:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010db4a:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010db4e:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010db53:	50                   	push   %rax
ffff80000010db54:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962fbd2 <_end+0x4950677a>
ffff80000010db5a:	50                   	push   %rax
ffff80000010db5b:	3a 25 78 0a 00     	cmp    0x44000a78(%rip),%ah        # ffff80004410e5d9 <_end+0x43fe5181>

ffff80000010db60 <.LC8>:
ffff80000010db60:	44 6f                	rex.R outsl %ds:(%rsi),(%dx)
ffff80000010db62:	75 62                	jne    ffff80000010dbc6 <.LC9+0x36>
ffff80000010db64:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010db65:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff80000010db69:	75 6c                	jne    ffff80000010dbd7 <.LC9+0x47>
ffff80000010db6b:	74 28                	je     ffff80000010db95 <.LC9+0x5>
ffff80000010db6d:	23 44 46 29          	and    0x29(%rsi,%rax,2),%eax
ffff80000010db71:	0a 45 72             	or     0x72(%rbp),%al
ffff80000010db74:	72 6f                	jb     ffff80000010dbe5 <.LC10+0x5>
ffff80000010db76:	72 43                	jb     ffff80000010dbbb <.LC9+0x2b>
ffff80000010db78:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010db79:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010db7d:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010db82:	50                   	push   %rax
ffff80000010db83:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962fc01 <_end+0x495067a9>
ffff80000010db89:	50                   	push   %rax
ffff80000010db8a:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010e608 <_erodata+0x372>

ffff80000010db90 <.LC9>:
ffff80000010db90:	43 6f                	rex.XB outsl %ds:(%rsi),(%dx)
ffff80000010db92:	70 72                	jo     ffff80000010dc06 <.LC10+0x26>
ffff80000010db94:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010db95:	63 65 73             	movslq 0x73(%rbp),%esp
ffff80000010db98:	73 6f                	jae    ffff80000010dc09 <.LC10+0x29>
ffff80000010db9a:	72 20                	jb     ffff80000010dbbc <.LC9+0x2c>
ffff80000010db9c:	53                   	push   %rbx
ffff80000010db9d:	65 67 6d             	gs insl (%dx),%es:(%edi)
ffff80000010dba0:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010dba2:	74 20                	je     ffff80000010dbc4 <.LC9+0x34>
ffff80000010dba4:	4f 76 65             	rex.WRXB jbe ffff80000010dc0c <.LC10+0x2c>
ffff80000010dba7:	72 72                	jb     ffff80000010dc1b <.LC11+0xb>
ffff80000010dba9:	75 6e                	jne    ffff80000010dc19 <.LC11+0x9>
ffff80000010dbab:	20 28                	and    %ch,(%rax)
ffff80000010dbad:	72 65                	jb     ffff80000010dc14 <.LC11+0x4>
ffff80000010dbaf:	73 65                	jae    ffff80000010dc16 <.LC11+0x6>
ffff80000010dbb1:	72 76                	jb     ffff80000010dc29 <.LC11+0x19>
ffff80000010dbb3:	65 64 29 28          	gs sub %ebp,%fs:(%rax)
ffff80000010dbb7:	20 29                	and    %ch,(%rcx)
ffff80000010dbb9:	09 09                	or     %ecx,(%rcx)
ffff80000010dbbb:	0a 45 72             	or     0x72(%rbp),%al
ffff80000010dbbe:	72 6f                	jb     ffff80000010dc2f <.LC11+0x1f>
ffff80000010dbc0:	72 43                	jb     ffff80000010dc05 <.LC10+0x25>
ffff80000010dbc2:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010dbc3:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010dbc7:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010dbcc:	50                   	push   %rax
ffff80000010dbcd:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962fc4b <_end+0x495067f3>
ffff80000010dbd3:	50                   	push   %rax
ffff80000010dbd4:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010e652 <_erodata+0x3bc>
ffff80000010dbda:	00 00                	add    %al,(%rax)
ffff80000010dbdc:	00 00                	add    %al,(%rax)
	...

ffff80000010dbe0 <.LC10>:
ffff80000010dbe0:	49 6e                	rex.WB outsb %ds:(%rsi),(%dx)
ffff80000010dbe2:	76 61                	jbe    ffff80000010dc45 <.LC11+0x35>
ffff80000010dbe4:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010dbe5:	69 64 20 54 53 53 28 	imul   $0x23285353,0x54(%rax,%riz,1),%esp
ffff80000010dbec:	23 
ffff80000010dbed:	54                   	push   %rsp
ffff80000010dbee:	53                   	push   %rbx
ffff80000010dbef:	29 0a                	sub    %ecx,(%rdx)
ffff80000010dbf1:	45 72 72             	rex.RB jb ffff80000010dc66 <.LC11+0x56>
ffff80000010dbf4:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010dbf5:	72 43                	jb     ffff80000010dc3a <.LC11+0x2a>
ffff80000010dbf7:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010dbf8:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010dbfc:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010dc01:	50                   	push   %rax
ffff80000010dc02:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962fc80 <_end+0x49506828>
ffff80000010dc08:	50                   	push   %rax
ffff80000010dc09:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010e687 <_erodata+0x3f1>
	...

ffff80000010dc10 <.LC11>:
ffff80000010dc10:	54                   	push   %rsp
ffff80000010dc11:	68 65 20 65 78       	pushq  $0x78652065
ffff80000010dc16:	63 65 70             	movslq 0x70(%rbp),%esp
ffff80000010dc19:	74 69                	je     ffff80000010dc84 <.LC11+0x74>
ffff80000010dc1b:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010dc1c:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010dc1d:	20 6f 63             	and    %ch,0x63(%rdi)
ffff80000010dc20:	63 75 72             	movslq 0x72(%rbp),%esi
ffff80000010dc23:	72 65                	jb     ffff80000010dc8a <.LC11+0x7a>
ffff80000010dc25:	64 20 64 75 72       	and    %ah,%fs:0x72(%rbp,%rsi,2)
ffff80000010dc2a:	69 6e 67 20 64 65 6c 	imul   $0x6c656420,0x67(%rsi),%ebp
ffff80000010dc31:	69 76 65 72 79 20 6f 	imul   $0x6f207972,0x65(%rsi),%esi
ffff80000010dc38:	66 20 61 6e          	data16 and %ah,0x6e(%rcx)
ffff80000010dc3c:	20 65 76             	and    %ah,0x76(%rbp)
ffff80000010dc3f:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010dc41:	74 20                	je     ffff80000010dc63 <.LC11+0x53>
ffff80000010dc43:	09 09                	or     %ecx,(%rcx)
ffff80000010dc45:	65 78 74             	gs js  ffff80000010dcbc <.LC12+0x2c>
ffff80000010dc48:	65 72 6e             	gs jb  ffff80000010dcb9 <.LC12+0x29>
ffff80000010dc4b:	61                   	(bad)  
ffff80000010dc4c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010dc4d:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000010dc51:	74 68                	je     ffff80000010dcbb <.LC12+0x2b>
ffff80000010dc53:	65 20 70 72          	and    %dh,%gs:0x72(%rax)
ffff80000010dc57:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010dc58:	67 72 61             	addr32 jb ffff80000010dcbc <.LC12+0x2c>
ffff80000010dc5b:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000010dc5c:	2c 73                	sub    $0x73,%al
ffff80000010dc5e:	75 63                	jne    ffff80000010dcc3 <.LC13+0x3>
ffff80000010dc60:	68 20 61 73 20       	pushq  $0x20736120
ffff80000010dc65:	61                   	(bad)  
ffff80000010dc66:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010dc67:	20 69 6e             	and    %ch,0x6e(%rcx)
ffff80000010dc6a:	74 65                	je     ffff80000010dcd1 <.LC13+0x11>
ffff80000010dc6c:	72 72                	jb     ffff80000010dce0 <.LC13+0x20>
ffff80000010dc6e:	75 70                	jne    ffff80000010dce0 <.LC13+0x20>
ffff80000010dc70:	74 20                	je     ffff80000010dc92 <.LC12+0x2>
ffff80000010dc72:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010dc73:	72 20                	jb     ffff80000010dc95 <.LC12+0x5>
ffff80000010dc75:	61                   	(bad)  
ffff80000010dc76:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010dc77:	20 65 61             	and    %ah,0x61(%rbp)
ffff80000010dc7a:	72 6c                	jb     ffff80000010dce8 <.LC13+0x28>
ffff80000010dc7c:	69 65 72 20 65 78 63 	imul   $0x63786520,0x72(%rbp),%esp
ffff80000010dc83:	65 70 74             	gs jo  ffff80000010dcfa <.LC14+0x2>
ffff80000010dc86:	69 6f 6e 2e 0a 00 00 	imul   $0xa2e,0x6e(%rdi),%ebp
ffff80000010dc8d:	00 00                	add    %al,(%rax)
	...

ffff80000010dc90 <.LC12>:
ffff80000010dc90:	52                   	push   %rdx
ffff80000010dc91:	65 66 65 72 73       	gs data16 gs jb ffff80000010dd09 <.LC14+0x11>
ffff80000010dc96:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000010dc9a:	61                   	(bad)  
ffff80000010dc9b:	20 67 61             	and    %ah,0x61(%rdi)
ffff80000010dc9e:	74 65                	je     ffff80000010dd05 <.LC14+0xd>
ffff80000010dca0:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff80000010dca4:	63 72 69             	movslq 0x69(%rdx),%esi
ffff80000010dca7:	70 74                	jo     ffff80000010dd1d <.LC14+0x25>
ffff80000010dca9:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010dcaa:	72 20                	jb     ffff80000010dccc <.LC13+0xc>
ffff80000010dcac:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff80000010dcb3:	49                   	rex.WB
ffff80000010dcb4:	44 54                	rex.R push %rsp
ffff80000010dcb6:	3b 0a                	cmp    (%rdx),%ecx
	...

ffff80000010dcc0 <.LC13>:
ffff80000010dcc0:	52                   	push   %rdx
ffff80000010dcc1:	65 66 65 72 73       	gs data16 gs jb ffff80000010dd39 <.LC15+0x9>
ffff80000010dcc6:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000010dcca:	61                   	(bad)  
ffff80000010dccb:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff80000010dccf:	63 72 69             	movslq 0x69(%rdx),%esi
ffff80000010dcd2:	70 74                	jo     ffff80000010dd48 <.LC15+0x18>
ffff80000010dcd4:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010dcd5:	72 20                	jb     ffff80000010dcf7 <.LC13+0x37>
ffff80000010dcd7:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff80000010dcde:	47                   	rex.RXB
ffff80000010dcdf:	44 54                	rex.R push %rsp
ffff80000010dce1:	20 6f 72             	and    %ch,0x72(%rdi)
ffff80000010dce4:	20 74 68 65          	and    %dh,0x65(%rax,%rbp,2)
ffff80000010dce8:	20 63 75             	and    %ah,0x75(%rbx)
ffff80000010dceb:	72 72                	jb     ffff80000010dd5f <.LC16+0x3>
ffff80000010dced:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010dcef:	74 20                	je     ffff80000010dd11 <.LC14+0x19>
ffff80000010dcf1:	4c                   	rex.WR
ffff80000010dcf2:	44 54                	rex.R push %rsp
ffff80000010dcf4:	3b 0a                	cmp    (%rdx),%ecx
	...

ffff80000010dcf8 <.LC14>:
ffff80000010dcf8:	52                   	push   %rdx
ffff80000010dcf9:	65 66 65 72 73       	gs data16 gs jb ffff80000010dd71 <.LC16+0x15>
ffff80000010dcfe:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000010dd02:	61                   	(bad)  
ffff80000010dd03:	20 73 65             	and    %dh,0x65(%rbx)
ffff80000010dd06:	67 6d                	insl   (%dx),%es:(%edi)
ffff80000010dd08:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010dd0a:	74 20                	je     ffff80000010dd2c <.LC14+0x34>
ffff80000010dd0c:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010dd0d:	72 20                	jb     ffff80000010dd2f <.LC14+0x37>
ffff80000010dd0f:	67 61                	addr32 (bad) 
ffff80000010dd11:	74 65                	je     ffff80000010dd78 <.LC17>
ffff80000010dd13:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff80000010dd17:	63 72 69             	movslq 0x69(%rdx),%esi
ffff80000010dd1a:	70 74                	jo     ffff80000010dd90 <.LC17+0x18>
ffff80000010dd1c:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010dd1d:	72 20                	jb     ffff80000010dd3f <.LC15+0xf>
ffff80000010dd1f:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff80000010dd26:	4c                   	rex.WR
ffff80000010dd27:	44 54                	rex.R push %rsp
ffff80000010dd29:	3b 0a                	cmp    (%rdx),%ecx
ffff80000010dd2b:	00 00                	add    %al,(%rax)
ffff80000010dd2d:	00 00                	add    %al,(%rax)
	...

ffff80000010dd30 <.LC15>:
ffff80000010dd30:	52                   	push   %rdx
ffff80000010dd31:	65 66 65 72 73       	gs data16 gs jb ffff80000010dda9 <.LC17+0x31>
ffff80000010dd36:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000010dd3a:	61                   	(bad)  
ffff80000010dd3b:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff80000010dd3f:	63 72 69             	movslq 0x69(%rdx),%esi
ffff80000010dd42:	70 74                	jo     ffff80000010ddb8 <.LC18+0x8>
ffff80000010dd44:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010dd45:	72 20                	jb     ffff80000010dd67 <.LC16+0xb>
ffff80000010dd47:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff80000010dd4e:	63 75 72             	movslq 0x72(%rbp),%esi
ffff80000010dd51:	72 65                	jb     ffff80000010ddb8 <.LC18+0x8>
ffff80000010dd53:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010dd54:	74 20                	je     ffff80000010dd76 <.LC16+0x1a>
ffff80000010dd56:	47                   	rex.RXB
ffff80000010dd57:	44 54                	rex.R push %rsp
ffff80000010dd59:	3b 0a                	cmp    (%rdx),%ecx
	...

ffff80000010dd5c <.LC16>:
ffff80000010dd5c:	53                   	push   %rbx
ffff80000010dd5d:	65 67 6d             	gs insl (%dx),%es:(%edi)
ffff80000010dd60:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010dd62:	74 20                	je     ffff80000010dd84 <.LC17+0xc>
ffff80000010dd64:	53                   	push   %rbx
ffff80000010dd65:	65 6c                	gs insb (%dx),%es:(%rdi)
ffff80000010dd67:	65 63 74 6f 72       	movslq %gs:0x72(%rdi,%rbp,2),%esi
ffff80000010dd6c:	20 49 6e             	and    %cl,0x6e(%rcx)
ffff80000010dd6f:	64 65 78 3a          	fs gs js ffff80000010ddad <.LC17+0x35>
ffff80000010dd73:	25 78 0a 00 00       	and    $0xa78,%eax

ffff80000010dd78 <.LC17>:
ffff80000010dd78:	20 53 65             	and    %dl,0x65(%rbx)
ffff80000010dd7b:	67 6d                	insl   (%dx),%es:(%edi)
ffff80000010dd7d:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010dd7f:	74 20                	je     ffff80000010dda1 <.LC17+0x29>
ffff80000010dd81:	4e 6f                	rex.WRX outsl %ds:(%rsi),(%dx)
ffff80000010dd83:	74 20                	je     ffff80000010dda5 <.LC17+0x2d>
ffff80000010dd85:	50                   	push   %rax
ffff80000010dd86:	72 65                	jb     ffff80000010dded <.LC19+0x5>
ffff80000010dd88:	73 65                	jae    ffff80000010ddef <.LC19+0x7>
ffff80000010dd8a:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010dd8b:	74 28                	je     ffff80000010ddb5 <.LC18+0x5>
ffff80000010dd8d:	23 4e 50             	and    0x50(%rsi),%ecx
ffff80000010dd90:	29 0a                	sub    %ecx,(%rdx)
ffff80000010dd92:	45 72 72             	rex.RB jb ffff80000010de07 <.LC19+0x1f>
ffff80000010dd95:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010dd96:	72 43                	jb     ffff80000010dddb <.LC18+0x2b>
ffff80000010dd98:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010dd99:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010dd9d:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010dda2:	50                   	push   %rax
ffff80000010dda3:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962fe21 <_end+0x495069c9>
ffff80000010dda9:	50                   	push   %rax
ffff80000010ddaa:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010e828 <_erodata+0x592>

ffff80000010ddb0 <.LC18>:
ffff80000010ddb0:	53                   	push   %rbx
ffff80000010ddb1:	74 61                	je     ffff80000010de14 <.LC19+0x2c>
ffff80000010ddb3:	63 6b 2d             	movslq 0x2d(%rbx),%ebp
ffff80000010ddb6:	53                   	push   %rbx
ffff80000010ddb7:	65 67 6d             	gs insl (%dx),%es:(%edi)
ffff80000010ddba:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010ddbc:	74 20                	je     ffff80000010ddde <.LC18+0x2e>
ffff80000010ddbe:	46 61                	rex.RX (bad) 
ffff80000010ddc0:	75 6c                	jne    ffff80000010de2e <.LC20+0xe>
ffff80000010ddc2:	74 28                	je     ffff80000010ddec <.LC19+0x4>
ffff80000010ddc4:	23 53 53             	and    0x53(%rbx),%edx
ffff80000010ddc7:	29 0a                	sub    %ecx,(%rdx)
ffff80000010ddc9:	45 72 72             	rex.RB jb ffff80000010de3e <.LC20+0x1e>
ffff80000010ddcc:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010ddcd:	72 43                	jb     ffff80000010de12 <.LC19+0x2a>
ffff80000010ddcf:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010ddd0:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010ddd4:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010ddd9:	50                   	push   %rax
ffff80000010ddda:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962fe58 <_end+0x49506a00>
ffff80000010dde0:	50                   	push   %rax
ffff80000010dde1:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010e85f <_erodata+0x5c9>
	...

ffff80000010dde8 <.LC19>:
ffff80000010dde8:	47                   	rex.RXB
ffff80000010dde9:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010ddeb:	65 72 61             	gs jb  ffff80000010de4f <.LC21+0x3>
ffff80000010ddee:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010ddef:	20 50 72             	and    %dl,0x72(%rax)
ffff80000010ddf2:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010ddf3:	74 65                	je     ffff80000010de5a <.LC21+0xe>
ffff80000010ddf5:	63 74 69 6f          	movslq 0x6f(%rcx,%rbp,2),%esi
ffff80000010ddf9:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010ddfa:	28 23                	sub    %ah,(%rbx)
ffff80000010ddfc:	47 50                	rex.RXB push %r8
ffff80000010ddfe:	29 0a                	sub    %ecx,(%rdx)
ffff80000010de00:	45 72 72             	rex.RB jb ffff80000010de75 <.LC23+0x2>
ffff80000010de03:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010de04:	72 43                	jb     ffff80000010de49 <.LC20+0x29>
ffff80000010de06:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010de07:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010de0b:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010de10:	50                   	push   %rax
ffff80000010de11:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962fe8f <_end+0x49506a37>
ffff80000010de17:	50                   	push   %rax
ffff80000010de18:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010e896 <_erodata+0x600>
	...

ffff80000010de20 <.LC20>:
ffff80000010de20:	50                   	push   %rax
ffff80000010de21:	61                   	(bad)  
ffff80000010de22:	67 65 20 46 61       	and    %al,%gs:0x61(%esi)
ffff80000010de27:	75 6c                	jne    ffff80000010de95 <.LC24+0xf>
ffff80000010de29:	74 28                	je     ffff80000010de53 <.LC21+0x7>
ffff80000010de2b:	23 50 46             	and    0x46(%rax),%edx
ffff80000010de2e:	29 0a                	sub    %ecx,(%rdx)
ffff80000010de30:	45 72 72             	rex.RB jb ffff80000010dea5 <.LC25+0xd>
ffff80000010de33:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010de34:	72 43                	jb     ffff80000010de79 <.LC23+0x6>
ffff80000010de36:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010de37:	64 65 3a 25 64 20 52 	fs cmp %gs:0x53522064(%rip),%ah        # ffff80005362fea3 <_end+0x53506a4b>
ffff80000010de3e:	53 
ffff80000010de3f:	50                   	push   %rax
ffff80000010de40:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962febe <_end+0x49506a66>
ffff80000010de46:	50                   	push   %rax
ffff80000010de47:	3a 25 78 0a 00     	cmp    0x50000a78(%rip),%ah        # ffff80005010e8c5 <_end+0x4ffe546d>

ffff80000010de4c <.LC21>:
ffff80000010de4c:	50                   	push   %rax
ffff80000010de4d:	61                   	(bad)  
ffff80000010de4e:	67 65 20 4e 6f       	and    %cl,%gs:0x6f(%esi)
ffff80000010de53:	74 2d                	je     ffff80000010de82 <.LC23+0xf>
ffff80000010de55:	50                   	push   %rax
ffff80000010de56:	72 65                	jb     ffff80000010debd <.LC26+0x9>
ffff80000010de58:	73 65                	jae    ffff80000010debf <.LC26+0xb>
ffff80000010de5a:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010de5b:	74 2c                	je     ffff80000010de89 <.LC24+0x3>
ffff80000010de5d:	0a 00                	or     (%rax),%al

ffff80000010de5f <.LC22>:
ffff80000010de5f:	57                   	push   %rdi
ffff80000010de60:	72 69                	jb     ffff80000010decb <.LC26+0x17>
ffff80000010de62:	74 65                	je     ffff80000010dec9 <.LC26+0x15>
ffff80000010de64:	20 43 61             	and    %al,0x61(%rbx)
ffff80000010de67:	75 73                	jne    ffff80000010dedc <.LC27+0xc>
ffff80000010de69:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff80000010de6d:	75 6c                	jne    ffff80000010dedb <.LC27+0xb>
ffff80000010de6f:	74 2c                	je     ffff80000010de9d <.LC25+0x5>
ffff80000010de71:	0a 00                	or     (%rax),%al

ffff80000010de73 <.LC23>:
ffff80000010de73:	52                   	push   %rdx
ffff80000010de74:	65 61                	gs (bad) 
ffff80000010de76:	64 20 43 61          	and    %al,%fs:0x61(%rbx)
ffff80000010de7a:	75 73                	jne    ffff80000010deef <.LC27+0x1f>
ffff80000010de7c:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff80000010de80:	75 6c                	jne    ffff80000010deee <.LC27+0x1e>
ffff80000010de82:	74 2c                	je     ffff80000010deb0 <.LC25+0x18>
ffff80000010de84:	0a 00                	or     (%rax),%al

ffff80000010de86 <.LC24>:
ffff80000010de86:	46 61                	rex.RX (bad) 
ffff80000010de88:	75 6c                	jne    ffff80000010def6 <.LC28+0x6>
ffff80000010de8a:	74 20                	je     ffff80000010deac <.LC25+0x14>
ffff80000010de8c:	69 6e 20 75 73 65 72 	imul   $0x72657375,0x20(%rsi),%ebp
ffff80000010de93:	28 33                	sub    %dh,(%rbx)
ffff80000010de95:	29 0a                	sub    %ecx,(%rdx)
	...

ffff80000010de98 <.LC25>:
ffff80000010de98:	46 61                	rex.RX (bad) 
ffff80000010de9a:	75 6c                	jne    ffff80000010df08 <.LC29+0x10>
ffff80000010de9c:	74 20                	je     ffff80000010debe <.LC26+0xa>
ffff80000010de9e:	69 6e 20 73 75 70 65 	imul   $0x65707573,0x20(%rsi),%ebp
ffff80000010dea5:	72 76                	jb     ffff80000010df1d <.LC29+0x25>
ffff80000010dea7:	69 73 6f 72 28 30 2c 	imul   $0x2c302872,0x6f(%rbx),%esi
ffff80000010deae:	31 2c 32             	xor    %ebp,(%rdx,%rsi,1)
ffff80000010deb1:	29 0a                	sub    %ecx,(%rdx)
	...

ffff80000010deb4 <.LC26>:
ffff80000010deb4:	2c 52                	sub    $0x52,%al
ffff80000010deb6:	65 73 65             	gs jae ffff80000010df1e <.LC29+0x26>
ffff80000010deb9:	72 76                	jb     ffff80000010df31 <.LC29+0x39>
ffff80000010debb:	65 64 20 42 69       	gs and %al,%fs:0x69(%rdx)
ffff80000010dec0:	74 20                	je     ffff80000010dee2 <.LC27+0x12>
ffff80000010dec2:	43 61                	rex.XB (bad) 
ffff80000010dec4:	75 73                	jne    ffff80000010df39 <.LC29+0x41>
ffff80000010dec6:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff80000010deca:	75 6c                	jne    ffff80000010df38 <.LC29+0x40>
ffff80000010decc:	74 0a                	je     ffff80000010ded8 <.LC27+0x8>
	...

ffff80000010ded0 <.LC27>:
ffff80000010ded0:	2c 49                	sub    $0x49,%al
ffff80000010ded2:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010ded3:	73 74                	jae    ffff80000010df49 <.LC30+0x1>
ffff80000010ded5:	72 75                	jb     ffff80000010df4c <.LC30+0x4>
ffff80000010ded7:	63 74 69 6f          	movslq 0x6f(%rcx,%rbp,2),%esi
ffff80000010dedb:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010dedc:	20 66 65             	and    %ah,0x65(%rsi)
ffff80000010dedf:	74 63                	je     ffff80000010df44 <.LC29+0x4c>
ffff80000010dee1:	68 20 43 61 75       	pushq  $0x75614320
ffff80000010dee6:	73 65                	jae    ffff80000010df4d <.LC30+0x5>
ffff80000010dee8:	20 46 61             	and    %al,0x61(%rsi)
ffff80000010deeb:	75 6c                	jne    ffff80000010df59 <.LC30+0x11>
ffff80000010deed:	74 0a                	je     ffff80000010def9 <.LC29+0x1>
	...

ffff80000010def0 <.LC28>:
ffff80000010def0:	43 52                	rex.XB push %r10
ffff80000010def2:	32 3a                	xor    (%rdx),%bh
ffff80000010def4:	25 78 0a 00        	and    $0x78000a78,%eax

ffff80000010def8 <.LC29>:
ffff80000010def8:	78 38                	js     ffff80000010df32 <.LC29+0x3a>
ffff80000010defa:	37                   	(bad)  
ffff80000010defb:	20 46 50             	and    %al,0x50(%rsi)
ffff80000010defe:	55                   	push   %rbp
ffff80000010deff:	20 46 6c             	and    %al,0x6c(%rsi)
ffff80000010df02:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010df03:	61                   	(bad)  
ffff80000010df04:	74 69                	je     ffff80000010df6f <.LC30+0x27>
ffff80000010df06:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010df07:	67 2d 50 6f 69 6e    	addr32 sub $0x6e696f50,%eax
ffff80000010df0d:	74 20                	je     ffff80000010df2f <.LC29+0x37>
ffff80000010df0f:	45 72 72             	rex.RB jb ffff80000010df84 <.LC31+0x4>
ffff80000010df12:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010df13:	72 20                	jb     ffff80000010df35 <.LC29+0x3d>
ffff80000010df15:	28 4d 61             	sub    %cl,0x61(%rbp)
ffff80000010df18:	74 68                	je     ffff80000010df82 <.LC31+0x2>
ffff80000010df1a:	20 46 61             	and    %al,0x61(%rsi)
ffff80000010df1d:	75 6c                	jne    ffff80000010df8b <.LC31+0xb>
ffff80000010df1f:	74 29                	je     ffff80000010df4a <.LC30+0x2>
ffff80000010df21:	28 23                	sub    %ah,(%rbx)
ffff80000010df23:	4d                   	rex.WRB
ffff80000010df24:	46 29 20             	rex.RX sub %r12d,(%rax)
ffff80000010df27:	09 09                	or     %ecx,(%rcx)
ffff80000010df29:	0a 45 72             	or     0x72(%rbp),%al
ffff80000010df2c:	72 6f                	jb     ffff80000010df9d <.LC31+0x1d>
ffff80000010df2e:	72 43                	jb     ffff80000010df73 <.LC30+0x2b>
ffff80000010df30:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010df31:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010df35:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010df3a:	50                   	push   %rax
ffff80000010df3b:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962ffb9 <_end+0x49506b61>
ffff80000010df41:	50                   	push   %rax
ffff80000010df42:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010e9c0 <_erodata+0x72a>

ffff80000010df48 <.LC30>:
ffff80000010df48:	41 6c                	rex.B insb (%dx),%es:(%rdi)
ffff80000010df4a:	69 67 6e 6d 65 6e 74 	imul   $0x746e656d,0x6e(%rdi),%esp
ffff80000010df51:	20 43 68             	and    %al,0x68(%rbx)
ffff80000010df54:	65 63 6b 28          	movslq %gs:0x28(%rbx),%ebp
ffff80000010df58:	23 41 43             	and    0x43(%rcx),%eax
ffff80000010df5b:	29 0a                	sub    %ecx,(%rdx)
ffff80000010df5d:	45 72 72             	rex.RB jb ffff80000010dfd2 <.LC32+0x22>
ffff80000010df60:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010df61:	72 43                	jb     ffff80000010dfa6 <.LC31+0x26>
ffff80000010df63:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010df64:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010df68:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010df6d:	50                   	push   %rax
ffff80000010df6e:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962ffec <_end+0x49506b94>
ffff80000010df74:	50                   	push   %rax
ffff80000010df75:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010e9f3 <_erodata+0x75d>
ffff80000010df7b:	00 00                	add    %al,(%rax)
ffff80000010df7d:	00 00                	add    %al,(%rax)
	...

ffff80000010df80 <.LC31>:
ffff80000010df80:	4d 61                	rex.WRB (bad) 
ffff80000010df82:	63 68 69             	movslq 0x69(%rax),%ebp
ffff80000010df85:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010df86:	65 20 43 68          	and    %al,%gs:0x68(%rbx)
ffff80000010df8a:	65 63 6b 28          	movslq %gs:0x28(%rbx),%ebp
ffff80000010df8e:	23 4d 43             	and    0x43(%rbp),%ecx
ffff80000010df91:	29 0a                	sub    %ecx,(%rdx)
ffff80000010df93:	45 72 72             	rex.RB jb ffff80000010e008 <.LC33+0x10>
ffff80000010df96:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010df97:	72 43                	jb     ffff80000010dfdc <.LC32+0x2c>
ffff80000010df99:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010df9a:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010df9e:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010dfa3:	50                   	push   %rax
ffff80000010dfa4:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff800049630022 <_end+0x49506bca>
ffff80000010dfaa:	50                   	push   %rax
ffff80000010dfab:	3a 25 78 0a 00     	cmp    0x53000a78(%rip),%ah        # ffff80005310ea29 <_end+0x52fe55d1>

ffff80000010dfb0 <.LC32>:
ffff80000010dfb0:	53                   	push   %rbx
ffff80000010dfb1:	49                   	rex.WB
ffff80000010dfb2:	4d                   	rex.WRB
ffff80000010dfb3:	44 20 46 6c          	and    %r8b,0x6c(%rsi)
ffff80000010dfb7:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010dfb8:	61                   	(bad)  
ffff80000010dfb9:	74 69                	je     ffff80000010e024 <.LC33+0x2c>
ffff80000010dfbb:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010dfbc:	67 2d 50 6f 69 6e    	addr32 sub $0x6e696f50,%eax
ffff80000010dfc2:	74 20                	je     ffff80000010dfe4 <.LC32+0x34>
ffff80000010dfc4:	45 78 63             	rex.RB js ffff80000010e02a <.LC33+0x32>
ffff80000010dfc7:	65 70 74             	gs jo  ffff80000010e03e <.LC0+0x6>
ffff80000010dfca:	69 6f 6e 28 23 58 4d 	imul   $0x4d582328,0x6e(%rdi),%ebp
ffff80000010dfd1:	29 09                	sub    %ecx,(%rcx)
ffff80000010dfd3:	09 0a                	or     %ecx,(%rdx)
ffff80000010dfd5:	45 72 72             	rex.RB jb ffff80000010e04a <.LC0+0x12>
ffff80000010dfd8:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010dfd9:	72 43                	jb     ffff80000010e01e <.LC33+0x26>
ffff80000010dfdb:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010dfdc:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010dfe0:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010dfe5:	50                   	push   %rax
ffff80000010dfe6:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff800049630064 <_end+0x49506c0c>
ffff80000010dfec:	50                   	push   %rax
ffff80000010dfed:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010ea6b <_erodata+0x7d5>
ffff80000010dff3:	00 00                	add    %al,(%rax)
ffff80000010dff5:	00 00                	add    %al,(%rax)
	...

ffff80000010dff8 <.LC33>:
ffff80000010dff8:	20 56 69             	and    %dl,0x69(%rsi)
ffff80000010dffb:	72 74                	jb     ffff80000010e071 <.LC1+0x19>
ffff80000010dffd:	75 61                	jne    ffff80000010e060 <.LC1+0x8>
ffff80000010dfff:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010e000:	69 7a 61 74 69 6f 6e 	imul   $0x6e6f6974,0x61(%rdx),%edi
ffff80000010e007:	20 45 78             	and    %al,0x78(%rbp)
ffff80000010e00a:	63 65 70             	movslq 0x70(%rbp),%esp
ffff80000010e00d:	74 69                	je     ffff80000010e078 <.LC2>
ffff80000010e00f:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010e010:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010e011:	28 23                	sub    %ah,(%rbx)
ffff80000010e013:	56                   	push   %rsi
ffff80000010e014:	45 29 0a             	sub    %r9d,(%r10)
ffff80000010e017:	45 72 72             	rex.RB jb ffff80000010e08c <.LC2+0x14>
ffff80000010e01a:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010e01b:	72 43                	jb     ffff80000010e060 <.LC1+0x8>
ffff80000010e01d:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010e01e:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010e022:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010e027:	50                   	push   %rax
ffff80000010e028:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff8000496300a6 <_end+0x49506c4e>
ffff80000010e02e:	50                   	push   %rax
ffff80000010e02f:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010eaad <_erodata+0x817>
ffff80000010e035:	00 00                	add    %al,(%rax)
	...

ffff80000010e038 <.LC0>:
ffff80000010e038:	67 65 74 5f          	addr32 gs je ffff80000010e09b <.LC2+0x23>
ffff80000010e03c:	70 61                	jo     ffff80000010e09f <.LC3+0x2>
ffff80000010e03e:	67 65 5f             	addr32 gs pop %rdi
ffff80000010e041:	61                   	(bad)  
ffff80000010e042:	74 74                	je     ffff80000010e0b8 <.LC3+0x1b>
ffff80000010e044:	72 69                	jb     ffff80000010e0af <.LC3+0x12>
ffff80000010e046:	62                   	(bad)  
ffff80000010e047:	75 74                	jne    ffff80000010e0bd <.LC4+0x2>
ffff80000010e049:	65 28 29             	sub    %ch,%gs:(%rcx)
ffff80000010e04c:	3a 20                	cmp    (%rax),%ah
ffff80000010e04e:	70 3d                	jo     ffff80000010e08d <.LC2+0x15>
ffff80000010e050:	3d 4e 55 4c 4c       	cmp    $0x4c4c554e,%eax
ffff80000010e055:	0a 00                	or     (%rax),%al
	...

ffff80000010e058 <.LC1>:
ffff80000010e058:	73 65                	jae    ffff80000010e0bf <.LC4+0x4>
ffff80000010e05a:	74 5f                	je     ffff80000010e0bb <.LC4>
ffff80000010e05c:	70 61                	jo     ffff80000010e0bf <.LC4+0x4>
ffff80000010e05e:	67 65 5f             	addr32 gs pop %rdi
ffff80000010e061:	61                   	(bad)  
ffff80000010e062:	74 74                	je     ffff80000010e0d8 <.LC5+0x7>
ffff80000010e064:	72 69                	jb     ffff80000010e0cf <.LC4+0x14>
ffff80000010e066:	62                   	(bad)  
ffff80000010e067:	75 74                	jne    ffff80000010e0dd <.LC5+0xc>
ffff80000010e069:	65 28 29             	sub    %ch,%gs:(%rcx)
ffff80000010e06c:	3a 20                	cmp    (%rax),%ah
ffff80000010e06e:	70 3d                	jo     ffff80000010e0ad <.LC3+0x10>
ffff80000010e070:	3d 4e 55 4c 4c       	cmp    $0x4c4c554e,%eax
ffff80000010e075:	0a 00                	or     (%rax),%al
	...

ffff80000010e078 <.LC2>:
ffff80000010e078:	44 69 73 70 6c 61 79 	imul   $0x2079616c,0x70(%rbx),%r14d
ffff80000010e07f:	20 
ffff80000010e080:	50                   	push   %rax
ffff80000010e081:	68 79 73 69 63       	pushq  $0x63697379
ffff80000010e086:	73 20                	jae    ffff80000010e0a8 <.LC3+0xb>
ffff80000010e088:	4d                   	rex.WRB
ffff80000010e089:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff80000010e08b:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010e08c:	72 79                	jb     ffff80000010e107 <.LC6+0x17>
ffff80000010e08e:	20 44 69 73          	and    %al,0x73(%rcx,%rbp,2)
ffff80000010e092:	74 72                	je     ffff80000010e106 <.LC6+0x16>
ffff80000010e094:	69 62 75 74 69 6f 6e 	imul   $0x6e6f6974,0x75(%rdx),%esp
ffff80000010e09b:	0a 00                	or     (%rax),%al

ffff80000010e09d <.LC3>:
ffff80000010e09d:	41                   	rex.B
ffff80000010e09e:	64 64 72 65          	fs fs jb ffff80000010e107 <.LC6+0x17>
ffff80000010e0a2:	73 73                	jae    ffff80000010e117 <.LC6+0x27>
ffff80000010e0a4:	3a 25 78 20 4c 65    	cmp    0x654c2078(%rip),%ah        # ffff8000655d0122 <_end+0x654a6cca>
ffff80000010e0aa:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010e0ab:	67 74 68             	addr32 je ffff80000010e116 <.LC6+0x26>
ffff80000010e0ae:	3a 25 78 20 54 79    	cmp    0x79542078(%rip),%ah        # ffff80007965012c <_end+0x79526cd4>
ffff80000010e0b4:	70 65                	jo     ffff80000010e11b <.LC6+0x2b>
ffff80000010e0b6:	3a 25 78 0a 00     	cmp    0x55000a78(%rip),%ah        # ffff80005510eb34 <_end+0x54fe56dc>

ffff80000010e0bb <.LC4>:
ffff80000010e0bb:	55                   	push   %rbp
ffff80000010e0bc:	73 65                	jae    ffff80000010e123 <.LC6+0x33>
ffff80000010e0be:	61                   	(bad)  
ffff80000010e0bf:	62                   	(bad)  
ffff80000010e0c0:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010e0c1:	65 20 54 6f 74       	and    %dl,%gs:0x74(%rdi,%rbp,2)
ffff80000010e0c6:	61                   	(bad)  
ffff80000010e0c7:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010e0c8:	20 52 41             	and    %dl,0x41(%rdx)
ffff80000010e0cb:	4d 3a 25 78 0a 00  	rex.WRB cmp 0x55000a78(%rip),%r12b        # ffff80005510eb4a <_end+0x54fe56f2>

ffff80000010e0d1 <.LC5>:
ffff80000010e0d1:	55                   	push   %rbp
ffff80000010e0d2:	73 65                	jae    ffff80000010e139 <.LC6+0x49>
ffff80000010e0d4:	61                   	(bad)  
ffff80000010e0d5:	62                   	(bad)  
ffff80000010e0d6:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010e0d7:	65 20 54 6f 74       	and    %dl,%gs:0x74(%rdi,%rbp,2)
ffff80000010e0dc:	61                   	(bad)  
ffff80000010e0dd:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010e0de:	20 50 61             	and    %dl,0x61(%rax)
ffff80000010e0e1:	67 65 20 4e 75       	and    %cl,%gs:0x75(%esi)
ffff80000010e0e6:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000010e0e7:	62                   	(bad)  
ffff80000010e0e8:	65 72 3a             	gs jb  ffff80000010e125 <.LC6+0x35>
ffff80000010e0eb:	25 64 0a 00 00       	and    $0xa64,%eax

ffff80000010e0f0 <.LC6>:
ffff80000010e0f0:	5a                   	pop    %rdx
ffff80000010e0f1:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010e0f2:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010e0f3:	65 20 20             	and    %ah,%gs:(%rax)
ffff80000010e0f6:	25 64 0a 7a 6f       	and    $0x6f7a0a64,%eax
ffff80000010e0fb:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010e0fc:	65 5f                	gs pop %rdi
ffff80000010e0fe:	73 74                	jae    ffff80000010e174 <.LC9+0x9>
ffff80000010e100:	61                   	(bad)  
ffff80000010e101:	72 74                	jb     ffff80000010e177 <.LC9+0xc>
ffff80000010e103:	5f                   	pop    %rdi
ffff80000010e104:	61                   	(bad)  
ffff80000010e105:	64 64 72 3a          	fs fs jb ffff80000010e143 <.LC6+0x53>
ffff80000010e109:	25 78 20 7a 6f       	and    $0x6f7a2078,%eax
ffff80000010e10e:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010e10f:	65 5f                	gs pop %rdi
ffff80000010e111:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010e113:	64 5f                	fs pop %rdi
ffff80000010e115:	61                   	(bad)  
ffff80000010e116:	64 64 72 3a          	fs fs jb ffff80000010e154 <.LC7+0x8>
ffff80000010e11a:	25 78 20 7a 6f       	and    $0x6f7a2078,%eax
ffff80000010e11f:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010e120:	65 5f                	gs pop %rdi
ffff80000010e122:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010e123:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010e125:	67 74 68             	addr32 je ffff80000010e190 <.LC10+0x10>
ffff80000010e128:	3a 25 78 0a 70 61    	cmp    0x61700a78(%rip),%ah        # ffff80006180eba6 <_end+0x616e574e>
ffff80000010e12e:	67 65 73 5f          	addr32 gs jae ffff80000010e191 <.LC10+0x11>
ffff80000010e132:	67 72 6f             	addr32 jb ffff80000010e1a4 <.LC10+0x24>
ffff80000010e135:	75 70                	jne    ffff80000010e1a7 <.LC10+0x27>
ffff80000010e137:	3a 25 78 20 70 61    	cmp    0x61702078(%rip),%ah        # ffff8000618101b5 <_end+0x616e6d5d>
ffff80000010e13d:	67 65 73 5f          	addr32 gs jae ffff80000010e1a0 <.LC10+0x20>
ffff80000010e141:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010e142:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010e144:	67 74 68             	addr32 je ffff80000010e1af <.LC11+0x7>
ffff80000010e147:	3a 25 78 0a 00     	cmp    0x47000a78(%rip),%ah        # ffff80004710ebc5 <_end+0x46fe576d>

ffff80000010e14c <.LC7>:
ffff80000010e14c:	47 6c                	rex.RXB insb (%dx),%es:(%rdi)
ffff80000010e14e:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010e14f:	62 61 6c 5f 43       	(bad)  {%k7}
ffff80000010e154:	52                   	push   %rdx
ffff80000010e155:	33 3a                	xor    (%rdx),%edi
ffff80000010e157:	25 78 0a 00        	and    $0x2a000a78,%eax

ffff80000010e15b <.LC8>:
ffff80000010e15b:	2a 47 6c             	sub    0x6c(%rdi),%al
ffff80000010e15e:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010e15f:	62 61 6c 5f 43       	(bad)  {%k7}
ffff80000010e164:	52                   	push   %rdx
ffff80000010e165:	33 3a                	xor    (%rdx),%edi
ffff80000010e167:	25 78 0a 00        	and    $0x2a000a78,%eax

ffff80000010e16b <.LC9>:
ffff80000010e16b:	2a 2a                	sub    (%rdx),%ch
ffff80000010e16d:	47 6c                	rex.RXB insb (%dx),%es:(%rdi)
ffff80000010e16f:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010e170:	62 61 6c 5f 43       	(bad)  {%k7}
ffff80000010e175:	52                   	push   %rdx
ffff80000010e176:	33 3a                	xor    (%rdx),%edi
ffff80000010e178:	25 78 0a 00 00       	and    $0xa78,%eax
ffff80000010e17d:	00 00                	add    %al,(%rax)
	...

ffff80000010e180 <.LC10>:
ffff80000010e180:	61                   	(bad)  
ffff80000010e181:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010e182:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010e183:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010e184:	63 5f 70             	movslq 0x70(%rdi),%ebx
ffff80000010e187:	61                   	(bad)  
ffff80000010e188:	67 65 73 20          	addr32 gs jae ffff80000010e1ac <.LC11+0x4>
ffff80000010e18c:	65 72 72             	gs jb  ffff80000010e201 <.LC0+0xa>
ffff80000010e18f:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010e190:	72 20                	jb     ffff80000010e1b2 <.LC11+0xa>
ffff80000010e192:	7a 6f                	jp     ffff80000010e203 <.LC0+0xc>
ffff80000010e194:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010e195:	65 5f                	gs pop %rdi
ffff80000010e197:	73 65                	jae    ffff80000010e1fe <.LC0+0x7>
ffff80000010e199:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010e19a:	65 63 74 20 69       	movslq %gs:0x69(%rax,%riz,1),%esi
ffff80000010e19f:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010e1a0:	64 65 78 0a          	fs gs js ffff80000010e1ae <.LC11+0x6>
ffff80000010e1a4:	00 00                	add    %al,(%rax)
	...

ffff80000010e1a8 <.LC11>:
ffff80000010e1a8:	66 72 65             	data16 jb ffff80000010e210 <.LC0>
ffff80000010e1ab:	65 5f                	gs pop %rdi
ffff80000010e1ad:	70 61                	jo     ffff80000010e210 <.LC0>
ffff80000010e1af:	67 65 73 28          	addr32 gs jae ffff80000010e1db <.LC12+0xb>
ffff80000010e1b3:	29 20                	sub    %esp,(%rax)
ffff80000010e1b5:	45 52                	rex.RB push %r10
ffff80000010e1b7:	52                   	push   %rdx
ffff80000010e1b8:	4f 52                	rex.WRXB push %r10
ffff80000010e1ba:	3a 20                	cmp    (%rax),%ah
ffff80000010e1bc:	70 61                	jo     ffff80000010e21f <.LC0+0xf>
ffff80000010e1be:	67 65 20 69 73       	and    %ch,%gs:0x73(%ecx)
ffff80000010e1c3:	20 69 6e             	and    %ch,0x6e(%rcx)
ffff80000010e1c6:	76 61                	jbe    ffff80000010e229 <.LC0+0x19>
ffff80000010e1c8:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010e1c9:	69 64 0a 00 00 00 00 	imul   $0x66000000,0x0(%rdx,%rcx,1),%esp
ffff80000010e1d0:	 

ffff80000010e1d0 <.LC12>:
ffff80000010e1d0:	66 72 65             	data16 jb ffff80000010e238 <.LC1+0x7>
ffff80000010e1d3:	65 5f                	gs pop %rdi
ffff80000010e1d5:	70 61                	jo     ffff80000010e238 <.LC1+0x7>
ffff80000010e1d7:	67 65 73 28          	addr32 gs jae ffff80000010e203 <.LC0+0xc>
ffff80000010e1db:	29 20                	sub    %esp,(%rax)
ffff80000010e1dd:	45 52                	rex.RB push %r10
ffff80000010e1df:	52                   	push   %rdx
ffff80000010e1e0:	4f 52                	rex.WRXB push %r10
ffff80000010e1e2:	3a 20                	cmp    (%rax),%ah
ffff80000010e1e4:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010e1e5:	75 6d                	jne    ffff80000010e254 <.LC2+0x8>
ffff80000010e1e7:	62                   	(bad)  
ffff80000010e1e8:	65 72 20             	gs jb  ffff80000010e20b <.LC1+0x7>
ffff80000010e1eb:	69 73 20 69 6e 76 61 	imul   $0x61766e69,0x20(%rbx),%esi
ffff80000010e1f2:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010e1f3:	69 64 0a 00    	imul   $0x39353238,0x0(%rdx,%rcx,1),%esp
ffff80000010e1fa:	 

ffff80000010e1f7 <.LC0>:
ffff80000010e1f7:	38 32                	cmp    %dh,(%rdx)
ffff80000010e1f9:	35 39 41 20 69       	xor    $0x69204139,%eax
ffff80000010e1fe:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010e1ff:	69 74 20 0a 00   	imul   $0x79656b00,0xa(%rax,%riz,1),%esi
ffff80000010e206:	 

ffff80000010e204 <.LC1>:
ffff80000010e204:	6b 65 79 20          	imul   $0x20,0x79(%rbp),%esp
ffff80000010e208:	63 6f 64             	movslq 0x64(%rdi),%ebp
ffff80000010e20b:	65 3a 25 78 00   	cmp    %gs:0x6f6e0078(%rip),%ah        # ffff80006f7ee28a <_end+0x6f6c4e32>

ffff80000010e210 <.LC0>:
ffff80000010e210:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010e211:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010e212:	5f                   	pop    %rdi
ffff80000010e213:	73 79                	jae    ffff80000010e28e <.LC0+0xd>
ffff80000010e215:	73 74                	jae    ffff80000010e28b <.LC0+0xa>
ffff80000010e217:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff80000010e219:	5f                   	pop    %rdi
ffff80000010e21a:	63 61 6c             	movslq 0x6c(%rcx),%esp
ffff80000010e21d:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010e21e:	20 69 73             	and    %ch,0x73(%rcx)
ffff80000010e221:	20 63 61             	and    %ah,0x61(%rbx)
ffff80000010e224:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010e225:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010e226:	69 6e 67 2c 4e 52 3a 	imul   $0x3a524e2c,0x67(%rsi),%ebp
ffff80000010e22d:	25 78 0a 00        	and    $0x64000a78,%eax

ffff80000010e231 <.LC1>:
ffff80000010e231:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff80000010e233:	5f                   	pop    %rdi
ffff80000010e234:	65 78 65             	gs js  ffff80000010e29c <_erodata+0x6>
ffff80000010e237:	63 76 65             	movslq 0x65(%rsi),%esi
ffff80000010e23a:	20 74 61 73          	and    %dh,0x73(%rcx,%riz,2)
ffff80000010e23e:	6b 20 69             	imul   $0x69,(%rax),%esp
ffff80000010e241:	73 20                	jae    ffff80000010e263 <.LC2+0x17>
ffff80000010e243:	72 75                	jb     ffff80000010e2ba <_erodata+0x24>
ffff80000010e245:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010e246:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010e247:	69 6e 67 0a 00   	imul   $0x6e69000a,0x67(%rsi),%ebp

ffff80000010e24c <.LC2>:
ffff80000010e24c:	69 6e 69 74 20 74 61 	imul   $0x61742074,0x69(%rsi),%ebp
ffff80000010e253:	73 6b                	jae    ffff80000010e2c0 <_erodata+0x2a>
ffff80000010e255:	20 69 73             	and    %ch,0x73(%rcx)
ffff80000010e258:	20 72 75             	and    %dh,0x75(%rdx)
ffff80000010e25b:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010e25c:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010e25d:	69 6e 67 2c 61 72 67 	imul   $0x6772612c,0x67(%rsi),%ebp
ffff80000010e264:	3a 25 64 0a 00     	cmp    0x65000a64(%rip),%ah        # ffff80006510ecce <_end+0x64fe5876>

ffff80000010e269 <.LC3>:
ffff80000010e269:	65 78 69             	gs js  ffff80000010e2d5 <_erodata+0x3f>
ffff80000010e26c:	74 28                	je     ffff80000010e296 <_erodata>
ffff80000010e26e:	29 20                	sub    %esp,(%rax)
ffff80000010e270:	74 61                	je     ffff80000010e2d3 <_erodata+0x3d>
ffff80000010e272:	73 6b                	jae    ffff80000010e2df <_erodata+0x49>
ffff80000010e274:	20 69 73             	and    %ch,0x73(%rcx)
ffff80000010e277:	20 72 75             	and    %dh,0x75(%rdx)
ffff80000010e27a:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010e27b:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010e27c:	69 6e 67 0a 00   	imul   $0x6146000a,0x67(%rsi),%ebp

ffff80000010e281 <.LC0>:
ffff80000010e281:	46 61                	rex.RX (bad) 
ffff80000010e283:	63 74 6f 72          	movslq 0x72(%rdi,%rbp,2),%esi
ffff80000010e287:	79 4e                	jns    ffff80000010e2d7 <_erodata+0x41>
ffff80000010e289:	61                   	(bad)  
ffff80000010e28a:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000010e28b:	65 3a 20             	cmp    %gs:(%rax),%ah
ffff80000010e28e:	25 73 00         	and    $0x73250073,%eax

ffff80000010e291 <.LC1>:
ffff80000010e291:	25 73 00         	and    $0xa0073,%eax

ffff80000010e294 <.LC2>:
ffff80000010e294:	0a 00                	or     (%rax),%al

Disassembly of section .eh_frame:

ffff80000010e298 <.eh_frame>:
ffff80000010e298:	14 00                	adc    $0x0,%al
ffff80000010e29a:	00 00                	add    %al,(%rax)
ffff80000010e29c:	00 00                	add    %al,(%rax)
ffff80000010e29e:	00 00                	add    %al,(%rax)
ffff80000010e2a0:	01 7a 52             	add    %edi,0x52(%rdx)
ffff80000010e2a3:	00 01                	add    %al,(%rcx)
ffff80000010e2a5:	78 10                	js     ffff80000010e2b7 <_erodata+0x21>
ffff80000010e2a7:	01 1b                	add    %ebx,(%rbx)
ffff80000010e2a9:	0c 07                	or     $0x7,%al
ffff80000010e2ab:	08 90 01 00 00 1c    	or     %dl,0x1c000001(%rax)
ffff80000010e2b1:	00 00                	add    %al,(%rax)
ffff80000010e2b3:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010e2b6:	00 00                	add    %al,(%rax)
ffff80000010e2b8:	bf 5f ff ff aa       	mov    $0xaaffff5f,%edi
ffff80000010e2bd:	00 00                	add    %al,(%rax)
ffff80000010e2bf:	00 00                	add    %al,(%rax)
ffff80000010e2c1:	41 0e                	rex.B (bad) 
ffff80000010e2c3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e2c9:	02 a5 0c 07 08 00    	add    0x8070c(%rbp),%ah
ffff80000010e2cf:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010e2d2:	00 00                	add    %al,(%rax)
ffff80000010e2d4:	3c 00                	cmp    $0x0,%al
ffff80000010e2d6:	00 00                	add    %al,(%rax)
ffff80000010e2d8:	49 60                	rex.WB (bad) 
ffff80000010e2da:	ff                   	(bad)  
ffff80000010e2db:	ff 53 00             	callq  *0x0(%rbx)
ffff80000010e2de:	00 00                	add    %al,(%rax)
ffff80000010e2e0:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e2e3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e2e9:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010e2ec:	07                   	(bad)  
ffff80000010e2ed:	08 00                	or     %al,(%rax)
ffff80000010e2ef:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010e2f2:	00 00                	add    %al,(%rax)
ffff80000010e2f4:	5c                   	pop    %rsp
ffff80000010e2f5:	00 00                	add    %al,(%rax)
ffff80000010e2f7:	00 7c 60 ff          	add    %bh,-0x1(%rax,%riz,2)
ffff80000010e2fb:	ff 53 00             	callq  *0x0(%rbx)
ffff80000010e2fe:	00 00                	add    %al,(%rax)
ffff80000010e300:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e303:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e309:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010e30c:	07                   	(bad)  
ffff80000010e30d:	08 00                	or     %al,(%rax)
ffff80000010e30f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010e312:	00 00                	add    %al,(%rax)
ffff80000010e314:	7c 00                	jl     ffff80000010e316 <_erodata+0x80>
ffff80000010e316:	00 00                	add    %al,(%rax)
ffff80000010e318:	af                   	scas   %es:(%rdi),%eax
ffff80000010e319:	60                   	(bad)  
ffff80000010e31a:	ff                   	(bad)  
ffff80000010e31b:	ff 53 00             	callq  *0x0(%rbx)
ffff80000010e31e:	00 00                	add    %al,(%rax)
ffff80000010e320:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e323:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e329:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010e32c:	07                   	(bad)  
ffff80000010e32d:	08 00                	or     %al,(%rax)
ffff80000010e32f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010e332:	00 00                	add    %al,(%rax)
ffff80000010e334:	9c                   	pushfq 
ffff80000010e335:	00 00                	add    %al,(%rax)
ffff80000010e337:	00 e2                	add    %ah,%dl
ffff80000010e339:	60                   	(bad)  
ffff80000010e33a:	ff                   	(bad)  
ffff80000010e33b:	ff 53 00             	callq  *0x0(%rbx)
ffff80000010e33e:	00 00                	add    %al,(%rax)
ffff80000010e340:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e343:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e349:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010e34c:	07                   	(bad)  
ffff80000010e34d:	08 00                	or     %al,(%rax)
ffff80000010e34f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010e352:	00 00                	add    %al,(%rax)
ffff80000010e354:	bc 00 00 00 15       	mov    $0x15000000,%esp
ffff80000010e359:	61                   	(bad)  
ffff80000010e35a:	ff                   	(bad)  
ffff80000010e35b:	ff 15 01 00 00 00    	callq  *0x1(%rip)        # ffff80000010e362 <_erodata+0xcc>
ffff80000010e361:	41 0e                	rex.B (bad) 
ffff80000010e363:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e369:	03 10                	add    (%rax),%edx
ffff80000010e36b:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff80000010e36e:	08 00                	or     %al,(%rax)
ffff80000010e370:	20 00                	and    %al,(%rax)
ffff80000010e372:	00 00                	add    %al,(%rax)
ffff80000010e374:	dc 00                	faddl  (%rax)
ffff80000010e376:	00 00                	add    %al,(%rax)
ffff80000010e378:	0a 62 ff             	or     -0x1(%rdx),%ah
ffff80000010e37b:	ff 57 00             	callq  *0x0(%rdi)
ffff80000010e37e:	00 00                	add    %al,(%rax)
ffff80000010e380:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e383:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e389:	41 83 03 02          	addl   $0x2,(%r11)
ffff80000010e38d:	51                   	push   %rcx
ffff80000010e38e:	0c 07                	or     $0x7,%al
ffff80000010e390:	08 00                	or     %al,(%rax)
ffff80000010e392:	00 00                	add    %al,(%rax)
ffff80000010e394:	1c 00                	sbb    $0x0,%al
ffff80000010e396:	00 00                	add    %al,(%rax)
ffff80000010e398:	00 01                	add    %al,(%rcx)
ffff80000010e39a:	00 00                	add    %al,(%rax)
ffff80000010e39c:	3d 62 ff ff 34       	cmp    $0x34ffff62,%eax
ffff80000010e3a1:	00 00                	add    %al,(%rax)
ffff80000010e3a3:	00 00                	add    %al,(%rax)
ffff80000010e3a5:	41 0e                	rex.B (bad) 
ffff80000010e3a7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e3ad:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010e3ae:	0c 07                	or     $0x7,%al
ffff80000010e3b0:	08 00                	or     %al,(%rax)
ffff80000010e3b2:	00 00                	add    %al,(%rax)
ffff80000010e3b4:	20 00                	and    %al,(%rax)
ffff80000010e3b6:	00 00                	add    %al,(%rax)
ffff80000010e3b8:	20 01                	and    %al,(%rcx)
ffff80000010e3ba:	00 00                	add    %al,(%rax)
ffff80000010e3bc:	51                   	push   %rcx
ffff80000010e3bd:	62                   	(bad)  
ffff80000010e3be:	ff                   	(bad)  
ffff80000010e3bf:	ff 6f 00             	ljmp   *0x0(%rdi)
ffff80000010e3c2:	00 00                	add    %al,(%rax)
ffff80000010e3c4:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e3c7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e3cd:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e3d0:	02 64 0c 07          	add    0x7(%rsp,%rcx,1),%ah
ffff80000010e3d4:	08 00                	or     %al,(%rax)
ffff80000010e3d6:	00 00                	add    %al,(%rax)
ffff80000010e3d8:	20 00                	and    %al,(%rax)
ffff80000010e3da:	00 00                	add    %al,(%rax)
ffff80000010e3dc:	44 01 00             	add    %r8d,(%rax)
ffff80000010e3df:	00 9c 62 ff ff 5c 00 	add    %bl,0x5cffff(%rdx,%riz,2)
ffff80000010e3e6:	00 00                	add    %al,(%rax)
ffff80000010e3e8:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e3eb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e3f1:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e3f4:	02 51 0c             	add    0xc(%rcx),%dl
ffff80000010e3f7:	07                   	(bad)  
ffff80000010e3f8:	08 00                	or     %al,(%rax)
ffff80000010e3fa:	00 00                	add    %al,(%rax)
ffff80000010e3fc:	20 00                	and    %al,(%rax)
ffff80000010e3fe:	00 00                	add    %al,(%rax)
ffff80000010e400:	68 01 00 00 d4       	pushq  $0xffffffffd4000001
ffff80000010e405:	62                   	(bad)  
ffff80000010e406:	ff                   	(bad)  
ffff80000010e407:	ff 64 02 00          	jmpq   *0x0(%rdx,%rax,1)
ffff80000010e40b:	00 00                	add    %al,(%rax)
ffff80000010e40d:	41 0e                	rex.B (bad) 
ffff80000010e40f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e415:	43 8f 03             	rex.XB popq (%r11)
ffff80000010e418:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
ffff80000010e41c:	00 00                	add    %al,(%rax)
ffff80000010e41e:	00 00                	add    %al,(%rax)
ffff80000010e420:	1c 00                	sbb    $0x0,%al
ffff80000010e422:	00 00                	add    %al,(%rax)
ffff80000010e424:	8c 01                	mov    %es,(%rcx)
ffff80000010e426:	00 00                	add    %al,(%rax)
ffff80000010e428:	14 65                	adc    $0x65,%al
ffff80000010e42a:	ff                   	(bad)  
ffff80000010e42b:	ff 07                	incl   (%rdi)
ffff80000010e42d:	01 00                	add    %eax,(%rax)
ffff80000010e42f:	00 00                	add    %al,(%rax)
ffff80000010e431:	41 0e                	rex.B (bad) 
ffff80000010e433:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e439:	03 02                	add    (%rdx),%eax
ffff80000010e43b:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff80000010e43e:	08 00                	or     %al,(%rax)
ffff80000010e440:	1c 00                	sbb    $0x0,%al
ffff80000010e442:	00 00                	add    %al,(%rax)
ffff80000010e444:	ac                   	lods   %ds:(%rsi),%al
ffff80000010e445:	01 00                	add    %eax,(%rax)
ffff80000010e447:	00 fb                	add    %bh,%bl
ffff80000010e449:	65 ff                	gs (bad) 
ffff80000010e44b:	ff 06                	incl   (%rsi)
ffff80000010e44d:	01 00                	add    %eax,(%rax)
ffff80000010e44f:	00 00                	add    %al,(%rax)
ffff80000010e451:	41 0e                	rex.B (bad) 
ffff80000010e453:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e459:	03 01                	add    (%rcx),%eax
ffff80000010e45b:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff80000010e45e:	08 00                	or     %al,(%rax)
ffff80000010e460:	20 00                	and    %al,(%rax)
ffff80000010e462:	00 00                	add    %al,(%rax)
ffff80000010e464:	cc                   	int3   
ffff80000010e465:	01 00                	add    %eax,(%rax)
ffff80000010e467:	00 e1                	add    %ah,%cl
ffff80000010e469:	66 ff                	data16 (bad) 
ffff80000010e46b:	ff c7                	inc    %edi
ffff80000010e46d:	03 00                	add    (%rax),%eax
ffff80000010e46f:	00 00                	add    %al,(%rax)
ffff80000010e471:	41 0e                	rex.B (bad) 
ffff80000010e473:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e479:	45 83 03 03          	rex.RB addl $0x3,(%r11)
ffff80000010e47d:	bd 03 0c 07 08       	mov    $0x8070c03,%ebp
ffff80000010e482:	00 00                	add    %al,(%rax)
ffff80000010e484:	20 00                	and    %al,(%rax)
ffff80000010e486:	00 00                	add    %al,(%rax)
ffff80000010e488:	f0 01 00             	lock add %eax,(%rax)
ffff80000010e48b:	00 84 6a ff ff 9a 03 	add    %al,0x39affff(%rdx,%rbp,2)
ffff80000010e492:	00 00                	add    %al,(%rax)
ffff80000010e494:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e497:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e49d:	48 83 03 03          	addq   $0x3,(%rbx)
ffff80000010e4a1:	8d 03                	lea    (%rbx),%eax
ffff80000010e4a3:	0c 07                	or     $0x7,%al
ffff80000010e4a5:	08 00                	or     %al,(%rax)
ffff80000010e4a7:	00 18                	add    %bl,(%rax)
ffff80000010e4a9:	00 00                	add    %al,(%rax)
ffff80000010e4ab:	00 14 02             	add    %dl,(%rdx,%rax,1)
ffff80000010e4ae:	00 00                	add    %al,(%rax)
ffff80000010e4b0:	fa                   	cli    
ffff80000010e4b1:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000010e4b2:	ff                   	(bad)  
ffff80000010e4b3:	ff 83 00 00 00 00    	incl   0x0(%rbx)
ffff80000010e4b9:	41 0e                	rex.B (bad) 
ffff80000010e4bb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e4c1:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e4c4:	18 00                	sbb    %al,(%rax)
ffff80000010e4c6:	00 00                	add    %al,(%rax)
ffff80000010e4c8:	30 02                	xor    %al,(%rdx)
ffff80000010e4ca:	00 00                	add    %al,(%rax)
ffff80000010e4cc:	61                   	(bad)  
ffff80000010e4cd:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010e4ce:	ff                   	(bad)  
ffff80000010e4cf:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010e4d5:	41 0e                	rex.B (bad) 
ffff80000010e4d7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e4dd:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e4e0:	18 00                	sbb    %al,(%rax)
ffff80000010e4e2:	00 00                	add    %al,(%rax)
ffff80000010e4e4:	4c 02 00             	rex.WR add (%rax),%r8b
ffff80000010e4e7:	00 cb                	add    %cl,%bl
ffff80000010e4e9:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010e4ea:	ff                   	(bad)  
ffff80000010e4eb:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010e4f1:	41 0e                	rex.B (bad) 
ffff80000010e4f3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e4f9:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e4fc:	18 00                	sbb    %al,(%rax)
ffff80000010e4fe:	00 00                	add    %al,(%rax)
ffff80000010e500:	68 02 00 00 35       	pushq  $0x35000002
ffff80000010e505:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010e506:	ff                   	(bad)  
ffff80000010e507:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010e50d:	41 0e                	rex.B (bad) 
ffff80000010e50f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e515:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e518:	18 00                	sbb    %al,(%rax)
ffff80000010e51a:	00 00                	add    %al,(%rax)
ffff80000010e51c:	84 02                	test   %al,(%rdx)
ffff80000010e51e:	00 00                	add    %al,(%rax)
ffff80000010e520:	9f                   	lahf   
ffff80000010e521:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010e522:	ff                   	(bad)  
ffff80000010e523:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010e529:	41 0e                	rex.B (bad) 
ffff80000010e52b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e531:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e534:	18 00                	sbb    %al,(%rax)
ffff80000010e536:	00 00                	add    %al,(%rax)
ffff80000010e538:	a0 02 00 00 09 70 ff 	movabs 0x86ffff7009000002,%al
ffff80000010e53f:	ff 86 
ffff80000010e541:	00 00                	add    %al,(%rax)
ffff80000010e543:	00 00                	add    %al,(%rax)
ffff80000010e545:	41 0e                	rex.B (bad) 
ffff80000010e547:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e54d:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e550:	18 00                	sbb    %al,(%rax)
ffff80000010e552:	00 00                	add    %al,(%rax)
ffff80000010e554:	bc 02 00 00 73       	mov    $0x73000002,%esp
ffff80000010e559:	70 ff                	jo     ffff80000010e55a <_erodata+0x2c4>
ffff80000010e55b:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010e561:	41 0e                	rex.B (bad) 
ffff80000010e563:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e569:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e56c:	18 00                	sbb    %al,(%rax)
ffff80000010e56e:	00 00                	add    %al,(%rax)
ffff80000010e570:	d8 02                	fadds  (%rdx)
ffff80000010e572:	00 00                	add    %al,(%rax)
ffff80000010e574:	dd 70 ff             	fnsave -0x1(%rax)
ffff80000010e577:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010e57d:	41 0e                	rex.B (bad) 
ffff80000010e57f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e585:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e588:	18 00                	sbb    %al,(%rax)
ffff80000010e58a:	00 00                	add    %al,(%rax)
ffff80000010e58c:	f4                   	hlt    
ffff80000010e58d:	02 00                	add    (%rax),%al
ffff80000010e58f:	00 47 71             	add    %al,0x71(%rdi)
ffff80000010e592:	ff                   	(bad)  
ffff80000010e593:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010e599:	41 0e                	rex.B (bad) 
ffff80000010e59b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e5a1:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e5a4:	18 00                	sbb    %al,(%rax)
ffff80000010e5a6:	00 00                	add    %al,(%rax)
ffff80000010e5a8:	10 03                	adc    %al,(%rbx)
ffff80000010e5aa:	00 00                	add    %al,(%rax)
ffff80000010e5ac:	b1 71                	mov    $0x71,%cl
ffff80000010e5ae:	ff                   	(bad)  
ffff80000010e5af:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010e5b5:	41 0e                	rex.B (bad) 
ffff80000010e5b7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e5bd:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e5c0:	1c 00                	sbb    $0x0,%al
ffff80000010e5c2:	00 00                	add    %al,(%rax)
ffff80000010e5c4:	2c 03                	sub    $0x3,%al
ffff80000010e5c6:	00 00                	add    %al,(%rax)
ffff80000010e5c8:	1b 72 ff             	sbb    -0x1(%rdx),%esi
ffff80000010e5cb:	ff e2                	jmpq   *%rdx
ffff80000010e5cd:	01 00                	add    %eax,(%rax)
ffff80000010e5cf:	00 00                	add    %al,(%rax)
ffff80000010e5d1:	41 0e                	rex.B (bad) 
ffff80000010e5d3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e5d9:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010e5dc:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
ffff80000010e5e0:	1c 00                	sbb    $0x0,%al
ffff80000010e5e2:	00 00                	add    %al,(%rax)
ffff80000010e5e4:	4c 03 00             	add    (%rax),%r8
ffff80000010e5e7:	00 dd                	add    %bl,%ch
ffff80000010e5e9:	73 ff                	jae    ffff80000010e5ea <_erodata+0x354>
ffff80000010e5eb:	ff e2                	jmpq   *%rdx
ffff80000010e5ed:	01 00                	add    %eax,(%rax)
ffff80000010e5ef:	00 00                	add    %al,(%rax)
ffff80000010e5f1:	41 0e                	rex.B (bad) 
ffff80000010e5f3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e5f9:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010e5fc:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
ffff80000010e600:	1c 00                	sbb    $0x0,%al
ffff80000010e602:	00 00                	add    %al,(%rax)
ffff80000010e604:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010e605:	03 00                	add    (%rax),%eax
ffff80000010e607:	00 9f 75 ff ff e2    	add    %bl,-0x1d00008b(%rdi)
ffff80000010e60d:	01 00                	add    %eax,(%rax)
ffff80000010e60f:	00 00                	add    %al,(%rax)
ffff80000010e611:	41 0e                	rex.B (bad) 
ffff80000010e613:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e619:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010e61c:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
ffff80000010e620:	1c 00                	sbb    $0x0,%al
ffff80000010e622:	00 00                	add    %al,(%rax)
ffff80000010e624:	8c 03                	mov    %es,(%rbx)
ffff80000010e626:	00 00                	add    %al,(%rax)
ffff80000010e628:	61                   	(bad)  
ffff80000010e629:	77 ff                	ja     ffff80000010e62a <_erodata+0x394>
ffff80000010e62b:	ff e2                	jmpq   *%rdx
ffff80000010e62d:	01 00                	add    %eax,(%rax)
ffff80000010e62f:	00 00                	add    %al,(%rax)
ffff80000010e631:	41 0e                	rex.B (bad) 
ffff80000010e633:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e639:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010e63c:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
ffff80000010e640:	1c 00                	sbb    $0x0,%al
ffff80000010e642:	00 00                	add    %al,(%rax)
ffff80000010e644:	ac                   	lods   %ds:(%rsi),%al
ffff80000010e645:	03 00                	add    (%rax),%eax
ffff80000010e647:	00 23                	add    %ah,(%rbx)
ffff80000010e649:	79 ff                	jns    ffff80000010e64a <_erodata+0x3b4>
ffff80000010e64b:	ff 56 02             	callq  *0x2(%rsi)
ffff80000010e64e:	00 00                	add    %al,(%rax)
ffff80000010e650:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e653:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e659:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010e65c:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
ffff80000010e660:	18 00                	sbb    %al,(%rax)
ffff80000010e662:	00 00                	add    %al,(%rax)
ffff80000010e664:	cc                   	int3   
ffff80000010e665:	03 00                	add    (%rax),%eax
ffff80000010e667:	00 59 7b             	add    %bl,0x7b(%rcx)
ffff80000010e66a:	ff                   	(bad)  
ffff80000010e66b:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010e671:	41 0e                	rex.B (bad) 
ffff80000010e673:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e679:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e67c:	18 00                	sbb    %al,(%rax)
ffff80000010e67e:	00 00                	add    %al,(%rax)
ffff80000010e680:	e8 03 00 00 c3       	callq  ffff7fffc310e688 <OLDSS+0xffff7fffc310e5d0>
ffff80000010e685:	7b ff                	jnp    ffff80000010e686 <_erodata+0x3f0>
ffff80000010e687:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010e68d:	41 0e                	rex.B (bad) 
ffff80000010e68f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e695:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e698:	18 00                	sbb    %al,(%rax)
ffff80000010e69a:	00 00                	add    %al,(%rax)
ffff80000010e69c:	04 04                	add    $0x4,%al
ffff80000010e69e:	00 00                	add    %al,(%rax)
ffff80000010e6a0:	2d 7c ff ff 86       	sub    $0x86ffff7c,%eax
ffff80000010e6a5:	00 00                	add    %al,(%rax)
ffff80000010e6a7:	00 00                	add    %al,(%rax)
ffff80000010e6a9:	41 0e                	rex.B (bad) 
ffff80000010e6ab:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e6b1:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e6b4:	18 00                	sbb    %al,(%rax)
ffff80000010e6b6:	00 00                	add    %al,(%rax)
ffff80000010e6b8:	20 04 00             	and    %al,(%rax,%rax,1)
ffff80000010e6bb:	00 97 7c ff ff 86    	add    %dl,-0x79000084(%rdi)
ffff80000010e6c1:	00 00                	add    %al,(%rax)
ffff80000010e6c3:	00 00                	add    %al,(%rax)
ffff80000010e6c5:	41 0e                	rex.B (bad) 
ffff80000010e6c7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e6cd:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e6d0:	18 00                	sbb    %al,(%rax)
ffff80000010e6d2:	00 00                	add    %al,(%rax)
ffff80000010e6d4:	3c 04                	cmp    $0x4,%al
ffff80000010e6d6:	00 00                	add    %al,(%rax)
ffff80000010e6d8:	01 7d ff             	add    %edi,-0x1(%rbp)
ffff80000010e6db:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010e6e1:	41 0e                	rex.B (bad) 
ffff80000010e6e3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e6e9:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e6ec:	20 00                	and    %al,(%rax)
ffff80000010e6ee:	00 00                	add    %al,(%rax)
ffff80000010e6f0:	58                   	pop    %rax
ffff80000010e6f1:	04 00                	add    $0x0,%al
ffff80000010e6f3:	00 6b 7d             	add    %ch,0x7d(%rbx)
ffff80000010e6f6:	ff                   	(bad)  
ffff80000010e6f7:	ff 09                	decl   (%rcx)
ffff80000010e6f9:	04 00                	add    $0x0,%al
ffff80000010e6fb:	00 00                	add    %al,(%rax)
ffff80000010e6fd:	41 0e                	rex.B (bad) 
ffff80000010e6ff:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e705:	43 8f 03             	rex.XB popq (%r11)
ffff80000010e708:	83 04 03 01          	addl   $0x1,(%rbx,%rax,1)
ffff80000010e70c:	04 0c                	add    $0xc,%al
ffff80000010e70e:	07                   	(bad)  
ffff80000010e70f:	08 1c 00             	or     %bl,(%rax,%rax,1)
ffff80000010e712:	00 00                	add    %al,(%rax)
ffff80000010e714:	7c 04                	jl     ffff80000010e71a <_erodata+0x484>
ffff80000010e716:	00 00                	add    %al,(%rax)
ffff80000010e718:	50                   	push   %rax
ffff80000010e719:	81 ff ff 82 00 00    	cmp    $0x82ff,%edi
ffff80000010e71f:	00 00                	add    %al,(%rax)
ffff80000010e721:	41 0e                	rex.B (bad) 
ffff80000010e723:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e729:	02 7d 0c             	add    0xc(%rbp),%bh
ffff80000010e72c:	07                   	(bad)  
ffff80000010e72d:	08 00                	or     %al,(%rax)
ffff80000010e72f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010e732:	00 00                	add    %al,(%rax)
ffff80000010e734:	9c                   	pushfq 
ffff80000010e735:	04 00                	add    $0x0,%al
ffff80000010e737:	00 b2 81 ff ff 6d    	add    %dh,0x6dffff81(%rdx)
ffff80000010e73d:	00 00                	add    %al,(%rax)
ffff80000010e73f:	00 00                	add    %al,(%rax)
ffff80000010e741:	41 0e                	rex.B (bad) 
ffff80000010e743:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e749:	02 68 0c             	add    0xc(%rax),%ch
ffff80000010e74c:	07                   	(bad)  
ffff80000010e74d:	08 00                	or     %al,(%rax)
ffff80000010e74f:	00 20                	add    %ah,(%rax)
ffff80000010e751:	00 00                	add    %al,(%rax)
ffff80000010e753:	00 bc 04 00 00 ff 81 	add    %bh,-0x7e010000(%rsp,%rax,1)
ffff80000010e75a:	ff                   	(bad)  
ffff80000010e75b:	ff 70 00             	pushq  0x0(%rax)
ffff80000010e75e:	00 00                	add    %al,(%rax)
ffff80000010e760:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e763:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e769:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e76c:	02 65 0c             	add    0xc(%rbp),%ah
ffff80000010e76f:	07                   	(bad)  
ffff80000010e770:	08 00                	or     %al,(%rax)
ffff80000010e772:	00 00                	add    %al,(%rax)
ffff80000010e774:	20 00                	and    %al,(%rax)
ffff80000010e776:	00 00                	add    %al,(%rax)
ffff80000010e778:	e0 04                	loopne ffff80000010e77e <_erodata+0x4e8>
ffff80000010e77a:	00 00                	add    %al,(%rax)
ffff80000010e77c:	4b 82                	rex.WXB (bad) 
ffff80000010e77e:	ff                   	(bad)  
ffff80000010e77f:	ff                   	(bad)  
ffff80000010e780:	7d 00                	jge    ffff80000010e782 <_erodata+0x4ec>
ffff80000010e782:	00 00                	add    %al,(%rax)
ffff80000010e784:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e787:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e78d:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e790:	02 72 0c             	add    0xc(%rdx),%dh
ffff80000010e793:	07                   	(bad)  
ffff80000010e794:	08 00                	or     %al,(%rax)
ffff80000010e796:	00 00                	add    %al,(%rax)
ffff80000010e798:	20 00                	and    %al,(%rax)
ffff80000010e79a:	00 00                	add    %al,(%rax)
ffff80000010e79c:	04 05                	add    $0x5,%al
ffff80000010e79e:	00 00                	add    %al,(%rax)
ffff80000010e7a0:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
ffff80000010e7a1:	82                   	(bad)  
ffff80000010e7a2:	ff                   	(bad)  
ffff80000010e7a3:	ff d0                	callq  *%rax
ffff80000010e7a5:	0d 00 00 00 41       	or     $0x41000000,%eax
ffff80000010e7aa:	0e                   	(bad)  
ffff80000010e7ab:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e7b1:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010e7b4:	83 04 03 c4          	addl   $0xffffffc4,(%rbx,%rax,1)
ffff80000010e7b8:	0d 0c 07 08 20       	or     $0x2008070c,%eax
ffff80000010e7bd:	00 00                	add    %al,(%rax)
ffff80000010e7bf:	00 28                	add    %ch,(%rax)
ffff80000010e7c1:	05 00 00 50 90       	add    $0x90500000,%eax
ffff80000010e7c6:	ff                   	(bad)  
ffff80000010e7c7:	ff 92 03 00 00 00    	callq  *0x3(%rdx)
ffff80000010e7cd:	41 0e                	rex.B (bad) 
ffff80000010e7cf:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e7d5:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010e7d8:	83 04 03 86          	addl   $0xffffff86,(%rbx,%rax,1)
ffff80000010e7dc:	03 0c 07             	add    (%rdi,%rax,1),%ecx
ffff80000010e7df:	08 24 00             	or     %ah,(%rax,%rax,1)
ffff80000010e7e2:	00 00                	add    %al,(%rax)
ffff80000010e7e4:	4c 05 00 00 be 93    	rex.WR add $0xffffffff93be0000,%rax
ffff80000010e7ea:	ff                   	(bad)  
ffff80000010e7eb:	ff 76 01             	pushq  0x1(%rsi)
ffff80000010e7ee:	00 00                	add    %al,(%rax)
ffff80000010e7f0:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e7f3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e7f9:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e7fc:	03 6b 01             	add    0x1(%rbx),%ebp
ffff80000010e7ff:	0c 07                	or     $0x7,%al
ffff80000010e801:	08 00                	or     %al,(%rax)
ffff80000010e803:	00 00                	add    %al,(%rax)
ffff80000010e805:	00 00                	add    %al,(%rax)
ffff80000010e807:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010e80a:	00 00                	add    %al,(%rax)
ffff80000010e80c:	74 05                	je     ffff80000010e813 <_erodata+0x57d>
ffff80000010e80e:	00 00                	add    %al,(%rax)
ffff80000010e810:	0c 95                	or     $0x95,%al
ffff80000010e812:	ff                   	(bad)  
ffff80000010e813:	ff 57 00             	callq  *0x0(%rdi)
ffff80000010e816:	00 00                	add    %al,(%rax)
ffff80000010e818:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e81b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e821:	02 52 0c             	add    0xc(%rdx),%dl
ffff80000010e824:	07                   	(bad)  
ffff80000010e825:	08 00                	or     %al,(%rax)
ffff80000010e827:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010e82a:	00 00                	add    %al,(%rax)
ffff80000010e82c:	94                   	xchg   %eax,%esp
ffff80000010e82d:	05 00 00 43 95       	add    $0x95430000,%eax
ffff80000010e832:	ff                   	(bad)  
ffff80000010e833:	ff 6a 00             	ljmp   *0x0(%rdx)
ffff80000010e836:	00 00                	add    %al,(%rax)
ffff80000010e838:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e83b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e841:	02 65 0c             	add    0xc(%rbp),%ah
ffff80000010e844:	07                   	(bad)  
ffff80000010e845:	08 00                	or     %al,(%rax)
ffff80000010e847:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010e84a:	00 00                	add    %al,(%rax)
ffff80000010e84c:	b4 05                	mov    $0x5,%ah
ffff80000010e84e:	00 00                	add    %al,(%rax)
ffff80000010e850:	8d 95 ff ff 25 00    	lea    0x25ffff(%rbp),%edx
ffff80000010e856:	00 00                	add    %al,(%rax)
ffff80000010e858:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e85b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e861:	60                   	(bad)  
ffff80000010e862:	0c 07                	or     $0x7,%al
ffff80000010e864:	08 00                	or     %al,(%rax)
ffff80000010e866:	00 00                	add    %al,(%rax)
ffff80000010e868:	1c 00                	sbb    $0x0,%al
ffff80000010e86a:	00 00                	add    %al,(%rax)
ffff80000010e86c:	d4                   	(bad)  
ffff80000010e86d:	05 00 00 92 95       	add    $0x95920000,%eax
ffff80000010e872:	ff                   	(bad)  
ffff80000010e873:	ff 25 00 00 00 00    	jmpq   *0x0(%rip)        # ffff80000010e879 <_erodata+0x5e3>
ffff80000010e879:	41 0e                	rex.B (bad) 
ffff80000010e87b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e881:	60                   	(bad)  
ffff80000010e882:	0c 07                	or     $0x7,%al
ffff80000010e884:	08 00                	or     %al,(%rax)
ffff80000010e886:	00 00                	add    %al,(%rax)
ffff80000010e888:	1c 00                	sbb    $0x0,%al
ffff80000010e88a:	00 00                	add    %al,(%rax)
ffff80000010e88c:	f4                   	hlt    
ffff80000010e88d:	05 00 00 97 95       	add    $0x95970000,%eax
ffff80000010e892:	ff                   	(bad)  
ffff80000010e893:	ff 32                	pushq  (%rdx)
ffff80000010e895:	00 00                	add    %al,(%rax)
ffff80000010e897:	00 00                	add    %al,(%rax)
ffff80000010e899:	41 0e                	rex.B (bad) 
ffff80000010e89b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e8a1:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000010e8a2:	0c 07                	or     $0x7,%al
ffff80000010e8a4:	08 00                	or     %al,(%rax)
ffff80000010e8a6:	00 00                	add    %al,(%rax)
ffff80000010e8a8:	1c 00                	sbb    $0x0,%al
ffff80000010e8aa:	00 00                	add    %al,(%rax)
ffff80000010e8ac:	14 06                	adc    $0x6,%al
ffff80000010e8ae:	00 00                	add    %al,(%rax)
ffff80000010e8b0:	a9 95 ff ff 35       	test   $0x35ffff95,%eax
ffff80000010e8b5:	00 00                	add    %al,(%rax)
ffff80000010e8b7:	00 00                	add    %al,(%rax)
ffff80000010e8b9:	41 0e                	rex.B (bad) 
ffff80000010e8bb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e8c1:	70 0c                	jo     ffff80000010e8cf <_erodata+0x639>
ffff80000010e8c3:	07                   	(bad)  
ffff80000010e8c4:	08 00                	or     %al,(%rax)
ffff80000010e8c6:	00 00                	add    %al,(%rax)
ffff80000010e8c8:	1c 00                	sbb    $0x0,%al
ffff80000010e8ca:	00 00                	add    %al,(%rax)
ffff80000010e8cc:	34 06                	xor    $0x6,%al
ffff80000010e8ce:	00 00                	add    %al,(%rax)
ffff80000010e8d0:	be 95 ff ff 36       	mov    $0x36ffff95,%esi
ffff80000010e8d5:	00 00                	add    %al,(%rax)
ffff80000010e8d7:	00 00                	add    %al,(%rax)
ffff80000010e8d9:	41 0e                	rex.B (bad) 
ffff80000010e8db:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e8e1:	71 0c                	jno    ffff80000010e8ef <_erodata+0x659>
ffff80000010e8e3:	07                   	(bad)  
ffff80000010e8e4:	08 00                	or     %al,(%rax)
ffff80000010e8e6:	00 00                	add    %al,(%rax)
ffff80000010e8e8:	1c 00                	sbb    $0x0,%al
ffff80000010e8ea:	00 00                	add    %al,(%rax)
ffff80000010e8ec:	54                   	push   %rsp
ffff80000010e8ed:	06                   	(bad)  
ffff80000010e8ee:	00 00                	add    %al,(%rax)
ffff80000010e8f0:	d4                   	(bad)  
ffff80000010e8f1:	95                   	xchg   %eax,%ebp
ffff80000010e8f2:	ff                   	(bad)  
ffff80000010e8f3:	ff 59 00             	lcall  *0x0(%rcx)
ffff80000010e8f6:	00 00                	add    %al,(%rax)
ffff80000010e8f8:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e8fb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e901:	02 54 0c 07          	add    0x7(%rsp,%rcx,1),%dl
ffff80000010e905:	08 00                	or     %al,(%rax)
ffff80000010e907:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010e90a:	00 00                	add    %al,(%rax)
ffff80000010e90c:	74 06                	je     ffff80000010e914 <_erodata+0x67e>
ffff80000010e90e:	00 00                	add    %al,(%rax)
ffff80000010e910:	0d 96 ff ff 57       	or     $0x57ffff96,%eax
ffff80000010e915:	00 00                	add    %al,(%rax)
ffff80000010e917:	00 00                	add    %al,(%rax)
ffff80000010e919:	41 0e                	rex.B (bad) 
ffff80000010e91b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e921:	02 52 0c             	add    0xc(%rdx),%dl
ffff80000010e924:	07                   	(bad)  
ffff80000010e925:	08 00                	or     %al,(%rax)
ffff80000010e927:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010e92a:	00 00                	add    %al,(%rax)
ffff80000010e92c:	94                   	xchg   %eax,%esp
ffff80000010e92d:	06                   	(bad)  
ffff80000010e92e:	00 00                	add    %al,(%rax)
ffff80000010e930:	44 96                	rex.R xchg %eax,%esi
ffff80000010e932:	ff                   	(bad)  
ffff80000010e933:	ff 44 00 00          	incl   0x0(%rax,%rax,1)
ffff80000010e937:	00 00                	add    %al,(%rax)
ffff80000010e939:	41 0e                	rex.B (bad) 
ffff80000010e93b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e941:	7f 0c                	jg     ffff80000010e94f <_erodata+0x6b9>
ffff80000010e943:	07                   	(bad)  
ffff80000010e944:	08 00                	or     %al,(%rax)
ffff80000010e946:	00 00                	add    %al,(%rax)
ffff80000010e948:	1c 00                	sbb    $0x0,%al
ffff80000010e94a:	00 00                	add    %al,(%rax)
ffff80000010e94c:	b4 06                	mov    $0x6,%ah
ffff80000010e94e:	00 00                	add    %al,(%rax)
ffff80000010e950:	68 96 ff ff 45       	pushq  $0x45ffff96
ffff80000010e955:	00 00                	add    %al,(%rax)
ffff80000010e957:	00 00                	add    %al,(%rax)
ffff80000010e959:	41 0e                	rex.B (bad) 
ffff80000010e95b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e961:	02 40 0c             	add    0xc(%rax),%al
ffff80000010e964:	07                   	(bad)  
ffff80000010e965:	08 00                	or     %al,(%rax)
ffff80000010e967:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010e96a:	00 00                	add    %al,(%rax)
ffff80000010e96c:	d4                   	(bad)  
ffff80000010e96d:	06                   	(bad)  
ffff80000010e96e:	00 00                	add    %al,(%rax)
ffff80000010e970:	8d 96 ff ff 3a 00    	lea    0x3affff(%rsi),%edx
ffff80000010e976:	00 00                	add    %al,(%rax)
ffff80000010e978:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e97b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e981:	75 0c                	jne    ffff80000010e98f <_erodata+0x6f9>
ffff80000010e983:	07                   	(bad)  
ffff80000010e984:	08 00                	or     %al,(%rax)
ffff80000010e986:	00 00                	add    %al,(%rax)
ffff80000010e988:	1c 00                	sbb    $0x0,%al
ffff80000010e98a:	00 00                	add    %al,(%rax)
ffff80000010e98c:	f4                   	hlt    
ffff80000010e98d:	06                   	(bad)  
ffff80000010e98e:	00 00                	add    %al,(%rax)
ffff80000010e990:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
ffff80000010e991:	96                   	xchg   %eax,%esi
ffff80000010e992:	ff                   	(bad)  
ffff80000010e993:	ff                   	(bad)  
ffff80000010e994:	3a 00                	cmp    (%rax),%al
ffff80000010e996:	00 00                	add    %al,(%rax)
ffff80000010e998:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e99b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e9a1:	75 0c                	jne    ffff80000010e9af <_erodata+0x719>
ffff80000010e9a3:	07                   	(bad)  
ffff80000010e9a4:	08 00                	or     %al,(%rax)
ffff80000010e9a6:	00 00                	add    %al,(%rax)
ffff80000010e9a8:	20 00                	and    %al,(%rax)
ffff80000010e9aa:	00 00                	add    %al,(%rax)
ffff80000010e9ac:	14 07                	adc    $0x7,%al
ffff80000010e9ae:	00 00                	add    %al,(%rax)
ffff80000010e9b0:	b1 9d                	mov    $0x9d,%cl
ffff80000010e9b2:	ff                   	(bad)  
ffff80000010e9b3:	ff                   	(bad)  
ffff80000010e9b4:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010e9b9:	41 0e                	rex.B (bad) 
ffff80000010e9bb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e9c1:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010e9c4:	83 04 03 b2          	addl   $0xffffffb2,(%rbx,%rax,1)
ffff80000010e9c8:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff80000010e9cb:	08 20                	or     %ah,(%rax)
ffff80000010e9cd:	00 00                	add    %al,(%rax)
ffff80000010e9cf:	00 38                	add    %bh,(%rax)
ffff80000010e9d1:	07                   	(bad)  
ffff80000010e9d2:	00 00                	add    %al,(%rax)
ffff80000010e9d4:	4b 9f                	rex.WXB lahf 
ffff80000010e9d6:	ff                   	(bad)  
ffff80000010e9d7:	ff a2 00 00 00 00    	jmpq   *0x0(%rdx)
ffff80000010e9dd:	41 0e                	rex.B (bad) 
ffff80000010e9df:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e9e5:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010e9e8:	83 04 02 96          	addl   $0xffffff96,(%rdx,%rax,1)
ffff80000010e9ec:	0c 07                	or     $0x7,%al
ffff80000010e9ee:	08 00                	or     %al,(%rax)
ffff80000010e9f0:	20 00                	and    %al,(%rax)
ffff80000010e9f2:	00 00                	add    %al,(%rax)
ffff80000010e9f4:	5c                   	pop    %rsp
ffff80000010e9f5:	07                   	(bad)  
ffff80000010e9f6:	00 00                	add    %al,(%rax)
ffff80000010e9f8:	c9                   	leaveq 
ffff80000010e9f9:	9f                   	lahf   
ffff80000010e9fa:	ff                   	(bad)  
ffff80000010e9fb:	ff 57 00             	callq  *0x0(%rdi)
ffff80000010e9fe:	00 00                	add    %al,(%rax)
ffff80000010ea00:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010ea03:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010ea09:	41 83 03 02          	addl   $0x2,(%r11)
ffff80000010ea0d:	51                   	push   %rcx
ffff80000010ea0e:	0c 07                	or     $0x7,%al
ffff80000010ea10:	08 00                	or     %al,(%rax)
ffff80000010ea12:	00 00                	add    %al,(%rax)
ffff80000010ea14:	1c 00                	sbb    $0x0,%al
ffff80000010ea16:	00 00                	add    %al,(%rax)
ffff80000010ea18:	80 07 00             	addb   $0x0,(%rdi)
ffff80000010ea1b:	00 fc                	add    %bh,%ah
ffff80000010ea1d:	9f                   	lahf   
ffff80000010ea1e:	ff                   	(bad)  
ffff80000010ea1f:	ff 34 00             	pushq  (%rax,%rax,1)
ffff80000010ea22:	00 00                	add    %al,(%rax)
ffff80000010ea24:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010ea27:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010ea2d:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010ea2e:	0c 07                	or     $0x7,%al
ffff80000010ea30:	08 00                	or     %al,(%rax)
ffff80000010ea32:	00 00                	add    %al,(%rax)
ffff80000010ea34:	20 00                	and    %al,(%rax)
ffff80000010ea36:	00 00                	add    %al,(%rax)
ffff80000010ea38:	a0 07 00 00 10 a0 ff 	movabs 0x6fffffa010000007,%al
ffff80000010ea3f:	ff 6f 
ffff80000010ea41:	00 00                	add    %al,(%rax)
ffff80000010ea43:	00 00                	add    %al,(%rax)
ffff80000010ea45:	41 0e                	rex.B (bad) 
ffff80000010ea47:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010ea4d:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010ea50:	02 64 0c 07          	add    0x7(%rsp,%rcx,1),%ah
ffff80000010ea54:	08 00                	or     %al,(%rax)
ffff80000010ea56:	00 00                	add    %al,(%rax)
ffff80000010ea58:	20 00                	and    %al,(%rax)
ffff80000010ea5a:	00 00                	add    %al,(%rax)
ffff80000010ea5c:	c4                   	(bad)  
ffff80000010ea5d:	07                   	(bad)  
ffff80000010ea5e:	00 00                	add    %al,(%rax)
ffff80000010ea60:	5b                   	pop    %rbx
ffff80000010ea61:	a0 ff ff 5c 00 00 00 	movabs 0x41000000005cffff,%al
ffff80000010ea68:	00 41 
ffff80000010ea6a:	0e                   	(bad)  
ffff80000010ea6b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010ea71:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010ea74:	02 51 0c             	add    0xc(%rcx),%dl
ffff80000010ea77:	07                   	(bad)  
ffff80000010ea78:	08 00                	or     %al,(%rax)
ffff80000010ea7a:	00 00                	add    %al,(%rax)
ffff80000010ea7c:	1c 00                	sbb    $0x0,%al
ffff80000010ea7e:	00 00                	add    %al,(%rax)
ffff80000010ea80:	e8 07 00 00 93       	callq  ffff7fff9310ea8c <OLDSS+0xffff7fff9310e9d4>
ffff80000010ea85:	a0 ff ff aa 00 00 00 	movabs 0x4100000000aaffff,%al
ffff80000010ea8c:	00 41 
ffff80000010ea8e:	0e                   	(bad)  
ffff80000010ea8f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010ea95:	02 a5 0c 07 08 00    	add    0x8070c(%rbp),%ah
ffff80000010ea9b:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010ea9e:	00 00                	add    %al,(%rax)
ffff80000010eaa0:	08 08                	or     %cl,(%rax)
ffff80000010eaa2:	00 00                	add    %al,(%rax)
ffff80000010eaa4:	1d a1 ff ff 53       	sbb    $0x53ffffa1,%eax
ffff80000010eaa9:	00 00                	add    %al,(%rax)
ffff80000010eaab:	00 00                	add    %al,(%rax)
ffff80000010eaad:	41 0e                	rex.B (bad) 
ffff80000010eaaf:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010eab5:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010eab8:	07                   	(bad)  
ffff80000010eab9:	08 00                	or     %al,(%rax)
ffff80000010eabb:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010eabe:	00 00                	add    %al,(%rax)
ffff80000010eac0:	28 08                	sub    %cl,(%rax)
ffff80000010eac2:	00 00                	add    %al,(%rax)
ffff80000010eac4:	50                   	push   %rax
ffff80000010eac5:	a1 ff ff 53 00 00 00 	movabs 0x410000000053ffff,%eax
ffff80000010eacc:	00 41 
ffff80000010eace:	0e                   	(bad)  
ffff80000010eacf:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010ead5:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010ead8:	07                   	(bad)  
ffff80000010ead9:	08 00                	or     %al,(%rax)
ffff80000010eadb:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010eade:	00 00                	add    %al,(%rax)
ffff80000010eae0:	48 08 00             	rex.W or %al,(%rax)
ffff80000010eae3:	00 83 a1 ff ff 53    	add    %al,0x53ffffa1(%rbx)
ffff80000010eae9:	00 00                	add    %al,(%rax)
ffff80000010eaeb:	00 00                	add    %al,(%rax)
ffff80000010eaed:	41 0e                	rex.B (bad) 
ffff80000010eaef:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010eaf5:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010eaf8:	07                   	(bad)  
ffff80000010eaf9:	08 00                	or     %al,(%rax)
ffff80000010eafb:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010eafe:	00 00                	add    %al,(%rax)
ffff80000010eb00:	68 08 00 00 b6       	pushq  $0xffffffffb6000008
ffff80000010eb05:	a1 ff ff 53 00 00 00 	movabs 0x410000000053ffff,%eax
ffff80000010eb0c:	00 41 
ffff80000010eb0e:	0e                   	(bad)  
ffff80000010eb0f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010eb15:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010eb18:	07                   	(bad)  
ffff80000010eb19:	08 00                	or     %al,(%rax)
ffff80000010eb1b:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010eb1e:	00 00                	add    %al,(%rax)
ffff80000010eb20:	88 08                	mov    %cl,(%rax)
ffff80000010eb22:	00 00                	add    %al,(%rax)
ffff80000010eb24:	e9 a1 ff ff 15       	jmpq   ffff80001610eaca <_end+0x15fe5672>
ffff80000010eb29:	01 00                	add    %eax,(%rax)
ffff80000010eb2b:	00 00                	add    %al,(%rax)
ffff80000010eb2d:	41 0e                	rex.B (bad) 
ffff80000010eb2f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010eb35:	03 10                	add    (%rax),%edx
ffff80000010eb37:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff80000010eb3a:	08 00                	or     %al,(%rax)
ffff80000010eb3c:	18 00                	sbb    %al,(%rax)
ffff80000010eb3e:	00 00                	add    %al,(%rax)
ffff80000010eb40:	a8 08                	test   $0x8,%al
ffff80000010eb42:	00 00                	add    %al,(%rax)
ffff80000010eb44:	de a2 ff ff 59 00    	fisubs 0x59ffff(%rdx)
ffff80000010eb4a:	00 00                	add    %al,(%rax)
ffff80000010eb4c:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010eb4f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010eb55:	00 00                	add    %al,(%rax)
ffff80000010eb57:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010eb5a:	00 00                	add    %al,(%rax)
ffff80000010eb5c:	c4                   	(bad)  
ffff80000010eb5d:	08 00                	or     %al,(%rax)
ffff80000010eb5f:	00 1b                	add    %bl,(%rbx)
ffff80000010eb61:	a3 ff ff 47 00 00 00 	movabs %eax,0x410000000047ffff
ffff80000010eb68:	00 41 
ffff80000010eb6a:	0e                   	(bad)  
ffff80000010eb6b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010eb71:	02 42 0c             	add    0xc(%rdx),%al
ffff80000010eb74:	07                   	(bad)  
ffff80000010eb75:	08 00                	or     %al,(%rax)
ffff80000010eb77:	00 20                	add    %ah,(%rax)
ffff80000010eb79:	00 00                	add    %al,(%rax)
ffff80000010eb7b:	00 e4                	add    %ah,%ah
ffff80000010eb7d:	08 00                	or     %al,(%rax)
ffff80000010eb7f:	00 42 a3             	add    %al,-0x5d(%rdx)
ffff80000010eb82:	ff                   	(bad)  
ffff80000010eb83:	ff c9                	dec    %ecx
ffff80000010eb85:	00 00                	add    %al,(%rax)
ffff80000010eb87:	00 00                	add    %al,(%rax)
ffff80000010eb89:	41 0e                	rex.B (bad) 
ffff80000010eb8b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010eb91:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010eb94:	83 04 02 bd          	addl   $0xffffffbd,(%rdx,%rax,1)
ffff80000010eb98:	0c 07                	or     $0x7,%al
ffff80000010eb9a:	08 00                	or     %al,(%rax)
ffff80000010eb9c:	1c 00                	sbb    $0x0,%al
ffff80000010eb9e:	00 00                	add    %al,(%rax)
ffff80000010eba0:	08 09                	or     %cl,(%rcx)
ffff80000010eba2:	00 00                	add    %al,(%rax)
ffff80000010eba4:	e7 a3                	out    %eax,$0xa3
ffff80000010eba6:	ff                   	(bad)  
ffff80000010eba7:	ff 4b 00             	decl   0x0(%rbx)
ffff80000010ebaa:	00 00                	add    %al,(%rax)
ffff80000010ebac:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010ebaf:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010ebb5:	02 46 0c             	add    0xc(%rsi),%al
ffff80000010ebb8:	07                   	(bad)  
ffff80000010ebb9:	08 00                	or     %al,(%rax)
ffff80000010ebbb:	00 24 00             	add    %ah,(%rax,%rax,1)
ffff80000010ebbe:	00 00                	add    %al,(%rax)
ffff80000010ebc0:	28 09                	sub    %cl,(%rcx)
ffff80000010ebc2:	00 00                	add    %al,(%rax)
ffff80000010ebc4:	12 a4 ff ff 3b 01 00 	adc    0x13bff(%rdi,%rdi,8),%ah
ffff80000010ebcb:	00 00                	add    %al,(%rax)
ffff80000010ebcd:	41 0e                	rex.B (bad) 
ffff80000010ebcf:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010ebd5:	49 8f 03             	rex.WB popq (%r11)
ffff80000010ebd8:	8c 04 83             	mov    %es,(%rbx,%rax,4)
ffff80000010ebdb:	05 03 2d 01 0c       	add    $0xc012d03,%eax
ffff80000010ebe0:	07                   	(bad)  
ffff80000010ebe1:	08 00                	or     %al,(%rax)
ffff80000010ebe3:	00 24 00             	add    %ah,(%rax,%rax,1)
ffff80000010ebe6:	00 00                	add    %al,(%rax)
ffff80000010ebe8:	50                   	push   %rax
ffff80000010ebe9:	09 00                	or     %eax,(%rax)
ffff80000010ebeb:	00 25 a5 ff ff 5f    	add    %ah,0x5fffffa5(%rip)        # ffff80006010eb96 <_end+0x5ffe573e>
ffff80000010ebf1:	01 00                	add    %eax,(%rax)
ffff80000010ebf3:	00 00                	add    %al,(%rax)
ffff80000010ebf5:	41 0e                	rex.B (bad) 
ffff80000010ebf7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010ebfd:	49 8d 03             	lea    (%r11),%rax
ffff80000010ec00:	8c 04 83             	mov    %es,(%rbx,%rax,4)
ffff80000010ec03:	05 03 51 01 0c       	add    $0xc015103,%eax
ffff80000010ec08:	07                   	(bad)  
ffff80000010ec09:	08 00                	or     %al,(%rax)
ffff80000010ec0b:	00 28                	add    %ch,(%rax)
ffff80000010ec0d:	00 00                	add    %al,(%rax)
ffff80000010ec0f:	00 78 09             	add    %bh,0x9(%rax)
ffff80000010ec12:	00 00                	add    %al,(%rax)
ffff80000010ec14:	5c                   	pop    %rsp
ffff80000010ec15:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
ffff80000010ec16:	ff                   	(bad)  
ffff80000010ec17:	ff 0b                	decl   (%rbx)
ffff80000010ec19:	04 00                	add    $0x0,%al
ffff80000010ec1b:	00 00                	add    %al,(%rax)
ffff80000010ec1d:	41 0e                	rex.B (bad) 
ffff80000010ec1f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010ec25:	4d 8f 03             	rex.WRB popq (%r11)
ffff80000010ec28:	8e 04 8d 05 8c 06 83 	mov    -0x7cf973fb(,%rcx,4),%es
ffff80000010ec2f:	07                   	(bad)  
ffff80000010ec30:	03 f9                	add    %ecx,%edi
ffff80000010ec32:	03 0c 07             	add    (%rdi,%rax,1),%ecx
ffff80000010ec35:	08 00                	or     %al,(%rax)
ffff80000010ec37:	00 20                	add    %ah,(%rax)
ffff80000010ec39:	00 00                	add    %al,(%rax)
ffff80000010ec3b:	00 a4 09 00 00 3b aa 	add    %ah,-0x55c50000(%rcx,%rcx,1)
ffff80000010ec42:	ff                   	(bad)  
ffff80000010ec43:	ff e7                	jmpq   *%rdi
ffff80000010ec45:	00 00                	add    %al,(%rax)
ffff80000010ec47:	00 00                	add    %al,(%rax)
ffff80000010ec49:	41 0e                	rex.B (bad) 
ffff80000010ec4b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010ec51:	4a 8f 03             	rex.WX popq (%rbx)
ffff80000010ec54:	83 04 02 d8          	addl   $0xffffffd8,(%rdx,%rax,1)
ffff80000010ec58:	0c 07                	or     $0x7,%al
ffff80000010ec5a:	08 00                	or     %al,(%rax)
ffff80000010ec5c:	20 00                	and    %al,(%rax)
ffff80000010ec5e:	00 00                	add    %al,(%rax)
ffff80000010ec60:	c8 09 00 00          	enterq $0x9,$0x0
ffff80000010ec64:	fe                   	(bad)  
ffff80000010ec65:	aa                   	stos   %al,%es:(%rdi)
ffff80000010ec66:	ff                   	(bad)  
ffff80000010ec67:	ff 73 02             	pushq  0x2(%rbx)
ffff80000010ec6a:	00 00                	add    %al,(%rax)
ffff80000010ec6c:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010ec6f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010ec75:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010ec78:	83 04 03 67          	addl   $0x67,(%rbx,%rax,1)
ffff80000010ec7c:	02 0c 07             	add    (%rdi,%rax,1),%cl
ffff80000010ec7f:	08 1c 00             	or     %bl,(%rax,%rax,1)
ffff80000010ec82:	00 00                	add    %al,(%rax)
ffff80000010ec84:	ec                   	in     (%dx),%al
ffff80000010ec85:	09 00                	or     %eax,(%rax)
ffff80000010ec87:	00 4d ad             	add    %cl,-0x53(%rbp)
ffff80000010ec8a:	ff                   	(bad)  
ffff80000010ec8b:	ff 54 00 00          	callq  *0x0(%rax,%rax,1)
ffff80000010ec8f:	00 00                	add    %al,(%rax)
ffff80000010ec91:	41 0e                	rex.B (bad) 
ffff80000010ec93:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010ec99:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010ec9c:	00 00                	add    %al,(%rax)
ffff80000010ec9e:	00 00                	add    %al,(%rax)
ffff80000010eca0:	20 00                	and    %al,(%rax)
ffff80000010eca2:	00 00                	add    %al,(%rax)
ffff80000010eca4:	0c 0a                	or     $0xa,%al
ffff80000010eca6:	00 00                	add    %al,(%rax)
ffff80000010eca8:	81 ad ff ff 57 00 00 	subl   $0x41000000,0x57ffff(%rbp)
ffff80000010ecaf:	00 00 41 
ffff80000010ecb2:	0e                   	(bad)  
ffff80000010ecb3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010ecb9:	41 83 03 02          	addl   $0x2,(%r11)
ffff80000010ecbd:	51                   	push   %rcx
ffff80000010ecbe:	0c 07                	or     $0x7,%al
ffff80000010ecc0:	08 00                	or     %al,(%rax)
ffff80000010ecc2:	00 00                	add    %al,(%rax)
ffff80000010ecc4:	20 00                	and    %al,(%rax)
ffff80000010ecc6:	00 00                	add    %al,(%rax)
ffff80000010ecc8:	30 0a                	xor    %cl,(%rdx)
ffff80000010ecca:	00 00                	add    %al,(%rax)
ffff80000010eccc:	b4 ad                	mov    $0xad,%ah
ffff80000010ecce:	ff                   	(bad)  
ffff80000010eccf:	ff                   	(bad)  
ffff80000010ecd0:	ec                   	in     (%dx),%al
ffff80000010ecd1:	01 00                	add    %eax,(%rax)
ffff80000010ecd3:	00 00                	add    %al,(%rax)
ffff80000010ecd5:	41 0e                	rex.B (bad) 
ffff80000010ecd7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010ecdd:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010ece0:	83 04 03 e0          	addl   $0xffffffe0,(%rbx,%rax,1)
ffff80000010ece4:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff80000010ece7:	08                   	.byte 0x8

Disassembly of section .data.init_task:

ffff800000110000 <init_task_union>:
	...
ffff800000110010:	04 00                	add    $0x0,%al
ffff800000110012:	00 00                	add    %al,(%rax)
ffff800000110014:	00 00                	add    %al,(%rax)
ffff800000110016:	00 00                	add    %al,(%rax)
ffff800000110018:	01 00                	add    %eax,(%rax)
ffff80000011001a:	00 00                	add    %al,(%rax)
ffff80000011001c:	00 00                	add    %al,(%rax)
ffff80000011001e:	00 00                	add    %al,(%rax)
ffff800000110020:	20 00                	and    %al,(%rax)
ffff800000110022:	12 00                	adc    (%rax),%al
ffff800000110024:	00 80 ff ff 40 c9    	add    %al,-0x36bf0001(%rax)
ffff80000011002a:	10 00                	adc    %al,(%rax)
ffff80000011002c:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000110032:	00 00                	add    %al,(%rax)
ffff800000110034:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011003a:	00 00                	add    %al,(%rax)
ffff80000011003c:	00 00                	add    %al,(%rax)
ffff80000011003e:	00 00                	add    %al,(%rax)
ffff800000110040:	01 00                	add    %eax,(%rax)
	...
ffff80000011800e:	00 00                	add    %al,(%rax)
ffff800000118010:	04 00                	add    $0x0,%al
ffff800000118012:	00 00                	add    %al,(%rax)
ffff800000118014:	00 00                	add    %al,(%rax)
ffff800000118016:	00 00                	add    %al,(%rax)
ffff800000118018:	01 00                	add    %eax,(%rax)
ffff80000011801a:	00 00                	add    %al,(%rax)
ffff80000011801c:	00 00                	add    %al,(%rax)
ffff80000011801e:	00 00                	add    %al,(%rax)
ffff800000118020:	20 00                	and    %al,(%rax)
ffff800000118022:	12 00                	adc    (%rax),%al
ffff800000118024:	00 80 ff ff 40 c9    	add    %al,-0x36bf0001(%rax)
ffff80000011802a:	10 00                	adc    %al,(%rax)
ffff80000011802c:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000118032:	00 00                	add    %al,(%rax)
ffff800000118034:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011803a:	00 00                	add    %al,(%rax)
ffff80000011803c:	00 00                	add    %al,(%rax)
ffff80000011803e:	00 00                	add    %al,(%rax)
ffff800000118040:	01 00                	add    %eax,(%rax)
	...

Disassembly of section .bss:

ffff800000120000 <ZONE_DMA_INDEX>:
ffff800000120000:	00 00                	add    %al,(%rax)
	...

ffff800000120004 <ZONE_NORMAL_INDEX>:
ffff800000120004:	00 00                	add    %al,(%rax)
	...

ffff800000120008 <ZONE_UNMAPPED_INDEX>:
	...

ffff800000120010 <Global_CR3>:
	...

ffff800000120020 <init_mm>:
	...

ffff800000120080 <buf>:
	...

ffff800000121110 <_ebss>:
	...

ffff800000121120 <pos>:
	...

ffff800000121160 <__>:
	...

ffff800000129160 <mman_struct>:
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
