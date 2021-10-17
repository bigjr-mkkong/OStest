
system:     file format elf64-x86-64


Disassembly of section .text:

ffff800000100000 <_start>:
ffff800000100000:	0f 01 15 91 98 00 00 	lgdt   0x9891(%rip)        # ffff800000109898 <GDT_END>
ffff800000100007:	0f 01 1d 94 a8 00 00 	lidt   0xa894(%rip)        # ffff80000010a8a2 <IDT_END>
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
ffff800000100074:	48 8d 3d 27 98 00 00 	lea    0x9827(%rip),%rdi        # ffff8000001098a2 <LABEL_IDT>
ffff80000010007b:	48 c7 c1 00 01 00 00 	mov    $0x100,%rcx

ffff800000100082 <.setting>:
ffff800000100082:	48 89 07             	mov    %rax,(%rdi)
ffff800000100085:	48 89 57 08          	mov    %rdx,0x8(%rdi)
ffff800000100089:	48 83 c7 10          	add    $0x10,%rdi
ffff80000010008d:	48 ff c9             	dec    %rcx
ffff800000100090:	75 f0                	jne    ffff800000100082 <.setting>

ffff800000100092 <setup_TSS64>:
ffff800000100092:	48 8d 15 13 a8 00 00 	lea    0xa813(%rip),%rdx        # ffff80000010a8ac <LABEL_TSS64>
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
ffff8000001000cc:	48 8d 3d 2d 97 00 00 	lea    0x972d(%rip),%rdi        # ffff800000109800 <LABEL_GDT64>
ffff8000001000d3:	48 89 47 50          	mov    %rax,0x50(%rdi)
ffff8000001000d7:	48 c1 ea 20          	shr    $0x20,%rdx
ffff8000001000db:	48 89 57 58          	mov    %rdx,0x58(%rdi)
ffff8000001000df:	48 8b 05 05 00 00 00 	mov    0x5(%rip),%rax        # ffff8000001000eb <go_to_kernel>
ffff8000001000e6:	6a 08                	pushq  $0x8
ffff8000001000e8:	50                   	push   %rax
ffff8000001000e9:	48 cb                	lretq  

ffff8000001000eb <go_to_kernel>:
ffff8000001000eb:	81 46 10 00 00 80 ff 	addl   $0xff800000,0x10(%rsi)
ffff8000001000f2:	ff                   	(bad)  

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
ffff800000100132:	e8 3c 4d 00 00       	callq  ffff800000104e73 <printk>
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
ffff800000103027:	00 87 00 00 e0 00    	add    %al,0xe00000(%rdi)
ffff80000010302d:	00 00                	add    %al,(%rax)
ffff80000010302f:	00 87 00 20 e0 00    	add    %al,0xe02000(%rdi)
ffff800000103035:	00 00                	add    %al,(%rax)
ffff800000103037:	00 87 00 40 e0 00    	add    %al,0xe04000(%rdi)
ffff80000010303d:	00 00                	add    %al,(%rax)
ffff80000010303f:	00 87 00 60 e0 00    	add    %al,0xe06000(%rdi)
ffff800000103045:	00 00                	add    %al,(%rax)
ffff800000103047:	00 87 00 80 e0 00    	add    %al,0xe08000(%rdi)
ffff80000010304d:	00 00                	add    %al,(%rax)
ffff80000010304f:	00 87 00 a0 e0 00    	add    %al,0xe0a000(%rdi)
ffff800000103055:	00 00                	add    %al,(%rax)
ffff800000103057:	00 87 00 c0 e0 00    	add    %al,0xe0c000(%rdi)
ffff80000010305d:	00 00                	add    %al,(%rax)
ffff80000010305f:	00 87 00 e0 e0 00    	add    %al,0xe0e000(%rdi)
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
ffff80000010405f:	e8 f9 4b 00 00       	callq  ffff800000108c5d <system_call_function>

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
ffff8000001040df:	48 8d 05 27 11 00 00 	lea    0x1127(%rip),%rax        # ffff80000010520d <do_divide_error>
ffff8000001040e6:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001040ea:	eb a6                	jmp    ffff800000104092 <error_code>

ffff8000001040ec <debug>:
ffff8000001040ec:	6a 00                	pushq  $0x0
ffff8000001040ee:	50                   	push   %rax
ffff8000001040ef:	48 8d 05 9a 11 00 00 	lea    0x119a(%rip),%rax        # ffff800000105290 <do_debug>
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
ffff800000104138:	e8 d9 11 00 00       	callq  ffff800000105316 <do_nmi>
ffff80000010413d:	e9 be fe ff ff       	jmpq   ffff800000104000 <RESTORE_ALL>

ffff800000104142 <breakpoint>:
ffff800000104142:	6a 00                	pushq  $0x0
ffff800000104144:	50                   	push   %rax
ffff800000104145:	48 8d 05 50 12 00 00 	lea    0x1250(%rip),%rax        # ffff80000010539c <do_breakpoint>
ffff80000010414c:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104150:	e9 3d ff ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104155 <overflow>:
ffff800000104155:	6a 00                	pushq  $0x0
ffff800000104157:	50                   	push   %rax
ffff800000104158:	48 8d 05 c3 12 00 00 	lea    0x12c3(%rip),%rax        # ffff800000105422 <do_overflow>
ffff80000010415f:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104163:	e9 2a ff ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104168 <bounds>:
ffff800000104168:	6a 00                	pushq  $0x0
ffff80000010416a:	50                   	push   %rax
ffff80000010416b:	48 8d 05 36 13 00 00 	lea    0x1336(%rip),%rax        # ffff8000001054a8 <do_bounds>
ffff800000104172:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104176:	e9 17 ff ff ff       	jmpq   ffff800000104092 <error_code>

ffff80000010417b <undefined_opcode>:
ffff80000010417b:	6a 00                	pushq  $0x0
ffff80000010417d:	50                   	push   %rax
ffff80000010417e:	48 8d 05 a9 13 00 00 	lea    0x13a9(%rip),%rax        # ffff80000010552e <do_undefined_opcode>
ffff800000104185:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104189:	e9 04 ff ff ff       	jmpq   ffff800000104092 <error_code>

ffff80000010418e <dev_not_available>:
ffff80000010418e:	6a 00                	pushq  $0x0
ffff800000104190:	50                   	push   %rax
ffff800000104191:	48 8d 05 1c 14 00 00 	lea    0x141c(%rip),%rax        # ffff8000001055b4 <do_dev_not_available>
ffff800000104198:	48 87 04 24          	xchg   %rax,(%rsp)
ffff80000010419c:	e9 f1 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041a1 <double_fault>:
ffff8000001041a1:	50                   	push   %rax
ffff8000001041a2:	48 8d 05 91 14 00 00 	lea    0x1491(%rip),%rax        # ffff80000010563a <do_double_fault>
ffff8000001041a9:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041ad:	e9 e0 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041b2 <coprocessor_segment_overrun>:
ffff8000001041b2:	6a 00                	pushq  $0x0
ffff8000001041b4:	50                   	push   %rax
ffff8000001041b5:	48 8d 05 04 15 00 00 	lea    0x1504(%rip),%rax        # ffff8000001056c0 <do_coprocessor_segment_overrun>
ffff8000001041bc:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041c0:	e9 cd fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041c5 <invalid_TSS>:
ffff8000001041c5:	50                   	push   %rax
ffff8000001041c6:	48 8d 05 79 15 00 00 	lea    0x1579(%rip),%rax        # ffff800000105746 <do_invalid_TSS>
ffff8000001041cd:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041d1:	e9 bc fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041d6 <segment_not_present>:
ffff8000001041d6:	50                   	push   %rax
ffff8000001041d7:	48 8d 05 4a 17 00 00 	lea    0x174a(%rip),%rax        # ffff800000105928 <do_segment_not_present>
ffff8000001041de:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041e2:	e9 ab fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041e7 <stack_segment_fault>:
ffff8000001041e7:	50                   	push   %rax
ffff8000001041e8:	48 8d 05 1b 19 00 00 	lea    0x191b(%rip),%rax        # ffff800000105b0a <do_stack_segment_fault>
ffff8000001041ef:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041f3:	e9 9a fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041f8 <general_protection>:
ffff8000001041f8:	50                   	push   %rax
ffff8000001041f9:	48 8d 05 ec 1a 00 00 	lea    0x1aec(%rip),%rax        # ffff800000105cec <do_general_protection>
ffff800000104200:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104204:	e9 89 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104209 <page_fault>:
ffff800000104209:	50                   	push   %rax
ffff80000010420a:	48 8d 05 bd 1c 00 00 	lea    0x1cbd(%rip),%rax        # ffff800000105ece <do_page_fault>
ffff800000104211:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104215:	e9 78 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff80000010421a <x87_FPU_error>:
ffff80000010421a:	6a 00                	pushq  $0x0
ffff80000010421c:	50                   	push   %rax
ffff80000010421d:	48 8d 05 00 1f 00 00 	lea    0x1f00(%rip),%rax        # ffff800000106124 <do_x87_FPU_error>
ffff800000104224:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104228:	e9 65 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff80000010422d <alignment_check>:
ffff80000010422d:	50                   	push   %rax
ffff80000010422e:	48 8d 05 75 1f 00 00 	lea    0x1f75(%rip),%rax        # ffff8000001061aa <do_alignment_check>
ffff800000104235:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104239:	e9 54 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff80000010423e <machine_check>:
ffff80000010423e:	6a 00                	pushq  $0x0
ffff800000104240:	50                   	push   %rax
ffff800000104241:	48 8d 05 e8 1f 00 00 	lea    0x1fe8(%rip),%rax        # ffff800000106230 <do_machine_check>
ffff800000104248:	48 87 04 24          	xchg   %rax,(%rsp)
ffff80000010424c:	e9 41 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104251 <SIMD_exception>:
ffff800000104251:	6a 00                	pushq  $0x0
ffff800000104253:	50                   	push   %rax
ffff800000104254:	48 8d 05 5b 20 00 00 	lea    0x205b(%rip),%rax        # ffff8000001062b6 <do_SIMD_exception>
ffff80000010425b:	48 87 04 24          	xchg   %rax,(%rsp)
ffff80000010425f:	e9 2e fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104264 <virtualization_exception>:
ffff800000104264:	6a 00                	pushq  $0x0
ffff800000104266:	50                   	push   %rax
ffff800000104267:	48 8d 05 ce 20 00 00 	lea    0x20ce(%rip),%rax        # ffff80000010633c <do_virtualization_exception>
ffff80000010426e:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104272:	e9 1b fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104277 <set_idt_desc>:
ffff800000104277:	55                   	push   %rbp
ffff800000104278:	48 89 e5             	mov    %rsp,%rbp
ffff80000010427b:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010427b <set_idt_desc+0x4>
ffff800000104282:	49 bb ad 77 00 00 00 	movabs $0x77ad,%r11
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
ffff800000104330:	49 bb ff 76 00 00 00 	movabs $0x76ff,%r11
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
ffff800000104361:	49 b8 4f 88 ff ff ff 	movabs $0xffffffffffff884f,%r8
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
ffff800000104383:	49 bb ac 76 00 00 00 	movabs $0x76ac,%r11
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
ffff8000001043b4:	49 b8 4f 88 ff ff ff 	movabs $0xffffffffffff884f,%r8
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
ffff8000001043d6:	49 bb 59 76 00 00 00 	movabs $0x7659,%r11
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
ffff800000104407:	49 b8 4f 88 ff ff ff 	movabs $0xffffffffffff884f,%r8
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
ffff800000104429:	49 bb 06 76 00 00 00 	movabs $0x7606,%r11
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
ffff80000010445a:	49 b8 4f 88 ff ff ff 	movabs $0xffffffffffff884f,%r8
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
ffff800000104478:	49 bb b7 75 00 00 00 	movabs $0x75b7,%r11
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

ffff800000104582 <get_current>:
ffff800000104582:	55                   	push   %rbp
ffff800000104583:	48 89 e5             	mov    %rsp,%rbp
ffff800000104586:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000104586 <get_current+0x4>
ffff80000010458d:	49 bb a2 74 00 00 00 	movabs $0x74a2,%r11
ffff800000104594:	00 00 00 
ffff800000104597:	4c 01 d8             	add    %r11,%rax
ffff80000010459a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
ffff8000001045a1:	00 
ffff8000001045a2:	48 c7 c0 00 80 ff ff 	mov    $0xffffffffffff8000,%rax
ffff8000001045a9:	48 21 e0             	and    %rsp,%rax
ffff8000001045ac:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff8000001045b0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001045b4:	5d                   	pop    %rbp
ffff8000001045b5:	c3                   	retq   

ffff8000001045b6 <no_system_call>:
ffff8000001045b6:	55                   	push   %rbp
ffff8000001045b7:	48 89 e5             	mov    %rsp,%rbp
ffff8000001045ba:	41 57                	push   %r15
ffff8000001045bc:	48 83 ec 18          	sub    $0x18,%rsp
ffff8000001045c0:	4c 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%r8        # ffff8000001045c0 <no_system_call+0xa>
ffff8000001045c7:	49 bb 68 74 00 00 00 	movabs $0x7468,%r11
ffff8000001045ce:	00 00 00 
ffff8000001045d1:	4d 01 d8             	add    %r11,%r8
ffff8000001045d4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff8000001045d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001045dc:	48 8b 80 80 00 00 00 	mov    0x80(%rax),%rax
ffff8000001045e3:	48 89 c1             	mov    %rax,%rcx
ffff8000001045e6:	48 b8 58 10 00 00 00 	movabs $0x1058,%rax
ffff8000001045ed:	00 00 00 
ffff8000001045f0:	49 8d 14 00          	lea    (%r8,%rax,1),%rdx
ffff8000001045f4:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001045f9:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001045fe:	4d 89 c7             	mov    %r8,%r15
ffff800000104601:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000104606:	49 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r9
ffff80000010460d:	ff ff ff 
ffff800000104610:	4d 01 c1             	add    %r8,%r9
ffff800000104613:	41 ff d1             	callq  *%r9
ffff800000104616:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffff80000010461d:	48 83 c4 18          	add    $0x18,%rsp
ffff800000104621:	41 5f                	pop    %r15
ffff800000104623:	5d                   	pop    %rbp
ffff800000104624:	c3                   	retq   

ffff800000104625 <sys_printf>:
ffff800000104625:	55                   	push   %rbp
ffff800000104626:	48 89 e5             	mov    %rsp,%rbp
ffff800000104629:	41 57                	push   %r15
ffff80000010462b:	48 83 ec 18          	sub    $0x18,%rsp
ffff80000010462f:	48 8d 0d f9 ff ff ff 	lea    -0x7(%rip),%rcx        # ffff80000010462f <sys_printf+0xa>
ffff800000104636:	49 bb f9 73 00 00 00 	movabs $0x73f9,%r11
ffff80000010463d:	00 00 00 
ffff800000104640:	4c 01 d9             	add    %r11,%rcx
ffff800000104643:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000104647:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010464b:	48 8b 40 60          	mov    0x60(%rax),%rax
ffff80000010464f:	48 89 c2             	mov    %rax,%rdx
ffff800000104652:	be ff ff ff 00       	mov    $0xffffff,%esi
ffff800000104657:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010465c:	49 89 cf             	mov    %rcx,%r15
ffff80000010465f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000104664:	49 b8 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r8
ffff80000010466b:	ff ff ff 
ffff80000010466e:	49 01 c8             	add    %rcx,%r8
ffff800000104671:	41 ff d0             	callq  *%r8
ffff800000104674:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000104679:	48 83 c4 18          	add    $0x18,%rsp
ffff80000010467d:	41 5f                	pop    %r15
ffff80000010467f:	5d                   	pop    %rbp
ffff800000104680:	c3                   	retq   

ffff800000104681 <Start_Kernel>:
ffff800000104681:	55                   	push   %rbp
ffff800000104682:	48 89 e5             	mov    %rsp,%rbp
ffff800000104685:	41 57                	push   %r15
ffff800000104687:	53                   	push   %rbx
ffff800000104688:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000104688 <Start_Kernel+0x7>
ffff80000010468f:	49 bb a0 73 00 00 00 	movabs $0x73a0,%r11
ffff800000104696:	00 00 00 
ffff800000104699:	4c 01 db             	add    %r11,%rbx
ffff80000010469c:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff8000001046a3:	00 00 00 
ffff8000001046a6:	c7 04 03 a0 05 00 00 	movl   $0x5a0,(%rbx,%rax,1)
ffff8000001046ad:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff8000001046b4:	00 00 00 
ffff8000001046b7:	c7 44 03 04 84 03 00 	movl   $0x384,0x4(%rbx,%rax,1)
ffff8000001046be:	00 
ffff8000001046bf:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff8000001046c6:	00 00 00 
ffff8000001046c9:	c7 44 03 0c 00 00 00 	movl   $0x0,0xc(%rbx,%rax,1)
ffff8000001046d0:	00 
ffff8000001046d1:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff8000001046d8:	00 00 00 
ffff8000001046db:	8b 54 03 0c          	mov    0xc(%rbx,%rax,1),%edx
ffff8000001046df:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff8000001046e6:	00 00 00 
ffff8000001046e9:	89 54 03 08          	mov    %edx,0x8(%rbx,%rax,1)
ffff8000001046ed:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff8000001046f4:	00 00 00 
ffff8000001046f7:	c7 44 03 10 08 00 00 	movl   $0x8,0x10(%rbx,%rax,1)
ffff8000001046fe:	00 
ffff8000001046ff:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff800000104706:	00 00 00 
ffff800000104709:	c7 44 03 14 10 00 00 	movl   $0x10,0x14(%rbx,%rax,1)
ffff800000104710:	00 
ffff800000104711:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff800000104718:	00 00 00 
ffff80000010471b:	48 b9 00 00 a0 00 00 	movabs $0xffff800000a00000,%rcx
ffff800000104722:	80 ff ff 
ffff800000104725:	48 89 4c 03 18       	mov    %rcx,0x18(%rbx,%rax,1)
ffff80000010472a:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff800000104731:	00 00 00 
ffff800000104734:	8b 14 03             	mov    (%rbx,%rax,1),%edx
ffff800000104737:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff80000010473e:	00 00 00 
ffff800000104741:	8b 44 03 04          	mov    0x4(%rbx,%rax,1),%eax
ffff800000104745:	0f af c2             	imul   %edx,%eax
ffff800000104748:	c1 e0 02             	shl    $0x2,%eax
ffff80000010474b:	05 ff 0f 00 00       	add    $0xfff,%eax
ffff800000104750:	25 00 f0 ff ff       	and    $0xfffff000,%eax
ffff800000104755:	89 c2                	mov    %eax,%edx
ffff800000104757:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff80000010475e:	00 00 00 
ffff800000104761:	89 54 03 20          	mov    %edx,0x20(%rbx,%rax,1)
ffff800000104765:	b8 50 00 00 00       	mov    $0x50,%eax
ffff80000010476a:	0f 00 d8             	ltr    %ax
ffff80000010476d:	68 00 7c 00 00       	pushq  $0x7c00
ffff800000104772:	68 00 7c 00 00       	pushq  $0x7c00
ffff800000104777:	68 00 7c 00 00       	pushq  $0x7c00
ffff80000010477c:	68 00 7c 00 00       	pushq  $0x7c00
ffff800000104781:	41 b9 00 7c 00 00    	mov    $0x7c00,%r9d
ffff800000104787:	41 b8 00 7c 00 00    	mov    $0x7c00,%r8d
ffff80000010478d:	b9 00 7c 00 00       	mov    $0x7c00,%ecx
ffff800000104792:	ba 00 7c 00 00       	mov    $0x7c00,%edx
ffff800000104797:	be 00 7c 00 00       	mov    $0x7c00,%esi
ffff80000010479c:	bf 00 7c 00 00       	mov    $0x7c00,%edi
ffff8000001047a1:	48 b8 45 8a ff ff ff 	movabs $0xffffffffffff8a45,%rax
ffff8000001047a8:	ff ff ff 
ffff8000001047ab:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001047af:	ff d0                	callq  *%rax
ffff8000001047b1:	48 83 c4 20          	add    $0x20,%rsp
ffff8000001047b5:	49 89 df             	mov    %rbx,%r15
ffff8000001047b8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001047bd:	48 ba 9a a9 ff ff ff 	movabs $0xffffffffffffa99a,%rdx
ffff8000001047c4:	ff ff ff 
ffff8000001047c7:	48 01 da             	add    %rbx,%rdx
ffff8000001047ca:	ff d2                	callq  *%rdx
ffff8000001047cc:	48 b8 70 ff ff ff ff 	movabs $0xffffffffffffff70,%rax
ffff8000001047d3:	ff ff ff 
ffff8000001047d6:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001047da:	48 89 c2             	mov    %rax,%rdx
ffff8000001047dd:	48 b8 38 d7 01 00 00 	movabs $0x1d738,%rax
ffff8000001047e4:	00 00 00 
ffff8000001047e7:	48 89 94 03 d0 02 00 	mov    %rdx,0x2d0(%rbx,%rax,1)
ffff8000001047ee:	00 
ffff8000001047ef:	48 b8 08 ff ff ff ff 	movabs $0xffffffffffffff08,%rax
ffff8000001047f6:	ff ff ff 
ffff8000001047f9:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001047fd:	48 89 c2             	mov    %rax,%rdx
ffff800000104800:	48 b8 38 d7 01 00 00 	movabs $0x1d738,%rax
ffff800000104807:	00 00 00 
ffff80000010480a:	48 89 94 03 d8 02 00 	mov    %rdx,0x2d8(%rbx,%rax,1)
ffff800000104811:	00 
ffff800000104812:	48 b8 b0 ff ff ff ff 	movabs $0xffffffffffffffb0,%rax
ffff800000104819:	ff ff ff 
ffff80000010481c:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000104820:	48 89 c2             	mov    %rax,%rdx
ffff800000104823:	48 b8 38 d7 01 00 00 	movabs $0x1d738,%rax
ffff80000010482a:	00 00 00 
ffff80000010482d:	48 89 94 03 e0 02 00 	mov    %rdx,0x2e0(%rbx,%rax,1)
ffff800000104834:	00 
ffff800000104835:	48 b8 c0 ff ff ff ff 	movabs $0xffffffffffffffc0,%rax
ffff80000010483c:	ff ff ff 
ffff80000010483f:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000104843:	48 89 c2             	mov    %rax,%rdx
ffff800000104846:	48 b8 38 d7 01 00 00 	movabs $0x1d738,%rax
ffff80000010484d:	00 00 00 
ffff800000104850:	48 89 94 03 e8 02 00 	mov    %rdx,0x2e8(%rbx,%rax,1)
ffff800000104857:	00 
ffff800000104858:	49 89 df             	mov    %rbx,%r15
ffff80000010485b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000104860:	48 ba 90 af ff ff ff 	movabs $0xffffffffffffaf90,%rdx
ffff800000104867:	ff ff ff 
ffff80000010486a:	48 01 da             	add    %rbx,%rdx
ffff80000010486d:	ff d2                	callq  *%rdx
ffff80000010486f:	49 89 df             	mov    %rbx,%r15
ffff800000104872:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000104877:	48 ba 72 cb ff ff ff 	movabs $0xffffffffffffcb72,%rdx
ffff80000010487e:	ff ff ff 
ffff800000104881:	48 01 da             	add    %rbx,%rdx
ffff800000104884:	ff d2                	callq  *%rdx
ffff800000104886:	49 89 df             	mov    %rbx,%r15
ffff800000104889:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010488e:	48 ba 2a d6 ff ff ff 	movabs $0xffffffffffffd62a,%rdx
ffff800000104895:	ff ff ff 
ffff800000104898:	48 01 da             	add    %rbx,%rdx
ffff80000010489b:	ff d2                	callq  *%rdx
ffff80000010489d:	eb fe                	jmp    ffff80000010489d <Start_Kernel+0x21c>

ffff80000010489f <putchar>:
ffff80000010489f:	55                   	push   %rbp
ffff8000001048a0:	48 89 e5             	mov    %rsp,%rbp
ffff8000001048a3:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff8000001048a3 <putchar+0x4>
ffff8000001048aa:	49 bb 85 71 00 00 00 	movabs $0x7185,%r11
ffff8000001048b1:	00 00 00 
ffff8000001048b4:	4c 01 d8             	add    %r11,%rax
ffff8000001048b7:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001048bb:	89 75 d4             	mov    %esi,-0x2c(%rbp)
ffff8000001048be:	89 55 d0             	mov    %edx,-0x30(%rbp)
ffff8000001048c1:	89 4d cc             	mov    %ecx,-0x34(%rbp)
ffff8000001048c4:	44 89 45 c8          	mov    %r8d,-0x38(%rbp)
ffff8000001048c8:	44 89 4d c4          	mov    %r9d,-0x3c(%rbp)
ffff8000001048cc:	8b 55 10             	mov    0x10(%rbp),%edx
ffff8000001048cf:	88 55 c0             	mov    %dl,-0x40(%rbp)
ffff8000001048d2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff8000001048d9:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff8000001048e0:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
ffff8000001048e7:	00 
ffff8000001048e8:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001048ef:	00 
ffff8000001048f0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
ffff8000001048f7:	0f b6 55 c0          	movzbl -0x40(%rbp),%edx
ffff8000001048fb:	48 63 d2             	movslq %edx,%rdx
ffff8000001048fe:	48 89 d1             	mov    %rdx,%rcx
ffff800000104901:	48 c1 e1 04          	shl    $0x4,%rcx
ffff800000104905:	48 ba f8 ee ff ff ff 	movabs $0xffffffffffffeef8,%rdx
ffff80000010490c:	ff ff ff 
ffff80000010490f:	48 8d 04 10          	lea    (%rax,%rdx,1),%rax
ffff800000104913:	48 01 c8             	add    %rcx,%rax
ffff800000104916:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff80000010491a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff800000104921:	eb 7a                	jmp    ffff80000010499d <putchar+0xfe>
ffff800000104923:	8b 55 cc             	mov    -0x34(%rbp),%edx
ffff800000104926:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000104929:	01 d0                	add    %edx,%eax
ffff80000010492b:	0f af 45 d4          	imul   -0x2c(%rbp),%eax
ffff80000010492f:	48 63 d0             	movslq %eax,%rdx
ffff800000104932:	8b 45 d0             	mov    -0x30(%rbp),%eax
ffff800000104935:	48 98                	cltq   
ffff800000104937:	48 01 d0             	add    %rdx,%rax
ffff80000010493a:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
ffff800000104941:	00 
ffff800000104942:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000104946:	48 01 d0             	add    %rdx,%rax
ffff800000104949:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff80000010494d:	c7 45 e4 00 01 00 00 	movl   $0x100,-0x1c(%rbp)
ffff800000104954:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff80000010495b:	eb 31                	jmp    ffff80000010498e <putchar+0xef>
ffff80000010495d:	d1 7d e4             	sarl   -0x1c(%rbp)
ffff800000104960:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104964:	0f b6 00             	movzbl (%rax),%eax
ffff800000104967:	0f b6 c0             	movzbl %al,%eax
ffff80000010496a:	23 45 e4             	and    -0x1c(%rbp),%eax
ffff80000010496d:	85 c0                	test   %eax,%eax
ffff80000010496f:	74 0b                	je     ffff80000010497c <putchar+0xdd>
ffff800000104971:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000104975:	8b 55 c8             	mov    -0x38(%rbp),%edx
ffff800000104978:	89 10                	mov    %edx,(%rax)
ffff80000010497a:	eb 09                	jmp    ffff800000104985 <putchar+0xe6>
ffff80000010497c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000104980:	8b 55 c4             	mov    -0x3c(%rbp),%edx
ffff800000104983:	89 10                	mov    %edx,(%rax)
ffff800000104985:	48 83 45 f0 04       	addq   $0x4,-0x10(%rbp)
ffff80000010498a:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
ffff80000010498e:	83 7d f8 07          	cmpl   $0x7,-0x8(%rbp)
ffff800000104992:	7e c9                	jle    ffff80000010495d <putchar+0xbe>
ffff800000104994:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
ffff800000104999:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff80000010499d:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
ffff8000001049a1:	7e 80                	jle    ffff800000104923 <putchar+0x84>
ffff8000001049a3:	90                   	nop
ffff8000001049a4:	5d                   	pop    %rbp
ffff8000001049a5:	c3                   	retq   

ffff8000001049a6 <dec2hex>:
ffff8000001049a6:	55                   	push   %rbp
ffff8000001049a7:	48 89 e5             	mov    %rsp,%rbp
ffff8000001049aa:	48 81 ec 78 01 00 00 	sub    $0x178,%rsp
ffff8000001049b1:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff8000001049b1 <dec2hex+0xb>
ffff8000001049b8:	49 bb 77 70 00 00 00 	movabs $0x7077,%r11
ffff8000001049bf:	00 00 00 
ffff8000001049c2:	4c 01 d8             	add    %r11,%rax
ffff8000001049c5:	48 89 bd 18 fe ff ff 	mov    %rdi,-0x1e8(%rbp)
ffff8000001049cc:	89 b5 14 fe ff ff    	mov    %esi,-0x1ec(%rbp)
ffff8000001049d2:	c6 45 b0 30          	movb   $0x30,-0x50(%rbp)
ffff8000001049d6:	c6 45 b1 31          	movb   $0x31,-0x4f(%rbp)
ffff8000001049da:	c6 45 b2 32          	movb   $0x32,-0x4e(%rbp)
ffff8000001049de:	c6 45 b3 33          	movb   $0x33,-0x4d(%rbp)
ffff8000001049e2:	c6 45 b4 34          	movb   $0x34,-0x4c(%rbp)
ffff8000001049e6:	c6 45 b5 35          	movb   $0x35,-0x4b(%rbp)
ffff8000001049ea:	c6 45 b6 36          	movb   $0x36,-0x4a(%rbp)
ffff8000001049ee:	c6 45 b7 37          	movb   $0x37,-0x49(%rbp)
ffff8000001049f2:	c6 45 b8 38          	movb   $0x38,-0x48(%rbp)
ffff8000001049f6:	c6 45 b9 39          	movb   $0x39,-0x47(%rbp)
ffff8000001049fa:	c6 45 ba 41          	movb   $0x41,-0x46(%rbp)
ffff8000001049fe:	c6 45 bb 42          	movb   $0x42,-0x45(%rbp)
ffff800000104a02:	c6 45 bc 43          	movb   $0x43,-0x44(%rbp)
ffff800000104a06:	c6 45 bd 44          	movb   $0x44,-0x43(%rbp)
ffff800000104a0a:	c6 45 be 45          	movb   $0x45,-0x42(%rbp)
ffff800000104a0e:	c6 45 bf 46          	movb   $0x46,-0x41(%rbp)
ffff800000104a12:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff800000104a19:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff800000104a20:	eb 40                	jmp    ffff800000104a62 <dec2hex+0xbc>
ffff800000104a22:	8b 85 14 fe ff ff    	mov    -0x1ec(%rbp),%eax
ffff800000104a28:	99                   	cltd   
ffff800000104a29:	c1 ea 1c             	shr    $0x1c,%edx
ffff800000104a2c:	01 d0                	add    %edx,%eax
ffff800000104a2e:	83 e0 0f             	and    $0xf,%eax
ffff800000104a31:	29 d0                	sub    %edx,%eax
ffff800000104a33:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff800000104a36:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000104a39:	8d 50 01             	lea    0x1(%rax),%edx
ffff800000104a3c:	89 55 fc             	mov    %edx,-0x4(%rbp)
ffff800000104a3f:	48 98                	cltq   
ffff800000104a41:	8b 55 f4             	mov    -0xc(%rbp),%edx
ffff800000104a44:	89 94 85 20 fe ff ff 	mov    %edx,-0x1e0(%rbp,%rax,4)
ffff800000104a4b:	8b 85 14 fe ff ff    	mov    -0x1ec(%rbp),%eax
ffff800000104a51:	8d 50 0f             	lea    0xf(%rax),%edx
ffff800000104a54:	85 c0                	test   %eax,%eax
ffff800000104a56:	0f 48 c2             	cmovs  %edx,%eax
ffff800000104a59:	c1 f8 04             	sar    $0x4,%eax
ffff800000104a5c:	89 85 14 fe ff ff    	mov    %eax,-0x1ec(%rbp)
ffff800000104a62:	83 bd 14 fe ff ff 00 	cmpl   $0x0,-0x1ec(%rbp)
ffff800000104a69:	7f b7                	jg     ffff800000104a22 <dec2hex+0x7c>
ffff800000104a6b:	83 6d fc 01          	subl   $0x1,-0x4(%rbp)
ffff800000104a6f:	eb 2c                	jmp    ffff800000104a9d <dec2hex+0xf7>
ffff800000104a71:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000104a74:	48 98                	cltq   
ffff800000104a76:	8b 8c 85 20 fe ff ff 	mov    -0x1e0(%rbp,%rax,4),%ecx
ffff800000104a7d:	48 8b 85 18 fe ff ff 	mov    -0x1e8(%rbp),%rax
ffff800000104a84:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104a88:	48 89 95 18 fe ff ff 	mov    %rdx,-0x1e8(%rbp)
ffff800000104a8f:	48 63 d1             	movslq %ecx,%rdx
ffff800000104a92:	0f b6 54 15 b0       	movzbl -0x50(%rbp,%rdx,1),%edx
ffff800000104a97:	88 10                	mov    %dl,(%rax)
ffff800000104a99:	83 6d fc 01          	subl   $0x1,-0x4(%rbp)
ffff800000104a9d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
ffff800000104aa1:	79 ce                	jns    ffff800000104a71 <dec2hex+0xcb>
ffff800000104aa3:	48 8b 85 18 fe ff ff 	mov    -0x1e8(%rbp),%rax
ffff800000104aaa:	c9                   	leaveq 
ffff800000104aab:	c3                   	retq   

ffff800000104aac <vsprintf>:
ffff800000104aac:	55                   	push   %rbp
ffff800000104aad:	48 89 e5             	mov    %rsp,%rbp
ffff800000104ab0:	53                   	push   %rbx
ffff800000104ab1:	48 83 ec 40          	sub    $0x40,%rsp
ffff800000104ab5:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000104ab5 <vsprintf+0x9>
ffff800000104abc:	49 bb 73 6f 00 00 00 	movabs $0x6f73,%r11
ffff800000104ac3:	00 00 00 
ffff800000104ac6:	4c 01 db             	add    %r11,%rbx
ffff800000104ac9:	48 89 7d c0          	mov    %rdi,-0x40(%rbp)
ffff800000104acd:	48 89 75 b8          	mov    %rsi,-0x48(%rbp)
ffff800000104ad1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
ffff800000104ad8:	48 b8 58 46 01 00 00 	movabs $0x14658,%rax
ffff800000104adf:	00 00 00 
ffff800000104ae2:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000104ae6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000104aea:	e9 56 03 00 00       	jmpq   ffff800000104e45 <vsprintf+0x399>
ffff800000104aef:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104af3:	0f b6 00             	movzbl (%rax),%eax
ffff800000104af6:	3c 25                	cmp    $0x25,%al
ffff800000104af8:	74 17                	je     ffff800000104b11 <vsprintf+0x65>
ffff800000104afa:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104afe:	0f b6 10             	movzbl (%rax),%edx
ffff800000104b01:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104b05:	88 10                	mov    %dl,(%rax)
ffff800000104b07:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
ffff800000104b0c:	e9 2f 03 00 00       	jmpq   ffff800000104e40 <vsprintf+0x394>
ffff800000104b11:	48 83 45 c0 01       	addq   $0x1,-0x40(%rbp)
ffff800000104b16:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104b1a:	0f b6 00             	movzbl (%rax),%eax
ffff800000104b1d:	3c 64                	cmp    $0x64,%al
ffff800000104b1f:	0f 85 45 01 00 00    	jne    ffff800000104c6a <vsprintf+0x1be>
ffff800000104b25:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104b29:	8b 00                	mov    (%rax),%eax
ffff800000104b2b:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104b2e:	77 24                	ja     ffff800000104b54 <vsprintf+0xa8>
ffff800000104b30:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104b34:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104b38:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104b3c:	8b 00                	mov    (%rax),%eax
ffff800000104b3e:	89 c0                	mov    %eax,%eax
ffff800000104b40:	48 01 d0             	add    %rdx,%rax
ffff800000104b43:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104b47:	8b 12                	mov    (%rdx),%edx
ffff800000104b49:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104b4c:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104b50:	89 0a                	mov    %ecx,(%rdx)
ffff800000104b52:	eb 14                	jmp    ffff800000104b68 <vsprintf+0xbc>
ffff800000104b54:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104b58:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104b5c:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104b60:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104b64:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104b68:	8b 00                	mov    (%rax),%eax
ffff800000104b6a:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff800000104b6d:	8b 4d f4             	mov    -0xc(%rbp),%ecx
ffff800000104b70:	ba 67 66 66 66       	mov    $0x66666667,%edx
ffff800000104b75:	89 c8                	mov    %ecx,%eax
ffff800000104b77:	f7 ea                	imul   %edx
ffff800000104b79:	c1 fa 02             	sar    $0x2,%edx
ffff800000104b7c:	89 c8                	mov    %ecx,%eax
ffff800000104b7e:	c1 f8 1f             	sar    $0x1f,%eax
ffff800000104b81:	29 c2                	sub    %eax,%edx
ffff800000104b83:	89 d0                	mov    %edx,%eax
ffff800000104b85:	c1 e0 02             	shl    $0x2,%eax
ffff800000104b88:	01 d0                	add    %edx,%eax
ffff800000104b8a:	01 c0                	add    %eax,%eax
ffff800000104b8c:	29 c1                	sub    %eax,%ecx
ffff800000104b8e:	89 ca                	mov    %ecx,%edx
ffff800000104b90:	89 d0                	mov    %edx,%eax
ffff800000104b92:	8d 48 30             	lea    0x30(%rax),%ecx
ffff800000104b95:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104b99:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104b9d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104ba1:	89 ca                	mov    %ecx,%edx
ffff800000104ba3:	88 10                	mov    %dl,(%rax)
ffff800000104ba5:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
ffff800000104ba9:	8b 4d f4             	mov    -0xc(%rbp),%ecx
ffff800000104bac:	ba 67 66 66 66       	mov    $0x66666667,%edx
ffff800000104bb1:	89 c8                	mov    %ecx,%eax
ffff800000104bb3:	f7 ea                	imul   %edx
ffff800000104bb5:	c1 fa 02             	sar    $0x2,%edx
ffff800000104bb8:	89 c8                	mov    %ecx,%eax
ffff800000104bba:	c1 f8 1f             	sar    $0x1f,%eax
ffff800000104bbd:	29 c2                	sub    %eax,%edx
ffff800000104bbf:	89 d0                	mov    %edx,%eax
ffff800000104bc1:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff800000104bc4:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
ffff800000104bc8:	75 a3                	jne    ffff800000104b6d <vsprintf+0xc1>
ffff800000104bca:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104bce:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff800000104bd2:	eb 6c                	jmp    ffff800000104c40 <vsprintf+0x194>
ffff800000104bd4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000104bd8:	0f b6 00             	movzbl (%rax),%eax
ffff800000104bdb:	88 45 cf             	mov    %al,-0x31(%rbp)
ffff800000104bde:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000104be2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000104be6:	48 29 c2             	sub    %rax,%rdx
ffff800000104be9:	48 89 d0             	mov    %rdx,%rax
ffff800000104bec:	48 89 c2             	mov    %rax,%rdx
ffff800000104bef:	8b 45 f0             	mov    -0x10(%rbp),%eax
ffff800000104bf2:	48 98                	cltq   
ffff800000104bf4:	48 29 c2             	sub    %rax,%rdx
ffff800000104bf7:	48 89 d0             	mov    %rdx,%rax
ffff800000104bfa:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff800000104bfe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104c02:	48 01 d0             	add    %rdx,%rax
ffff800000104c05:	0f b6 10             	movzbl (%rax),%edx
ffff800000104c08:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000104c0c:	88 10                	mov    %dl,(%rax)
ffff800000104c0e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000104c12:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000104c16:	48 29 c2             	sub    %rax,%rdx
ffff800000104c19:	48 89 d0             	mov    %rdx,%rax
ffff800000104c1c:	48 89 c2             	mov    %rax,%rdx
ffff800000104c1f:	8b 45 f0             	mov    -0x10(%rbp),%eax
ffff800000104c22:	48 98                	cltq   
ffff800000104c24:	48 29 c2             	sub    %rax,%rdx
ffff800000104c27:	48 89 d0             	mov    %rdx,%rax
ffff800000104c2a:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff800000104c2e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104c32:	48 01 c2             	add    %rax,%rdx
ffff800000104c35:	0f b6 45 cf          	movzbl -0x31(%rbp),%eax
ffff800000104c39:	88 02                	mov    %al,(%rdx)
ffff800000104c3b:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
ffff800000104c40:	8b 45 f0             	mov    -0x10(%rbp),%eax
ffff800000104c43:	89 c2                	mov    %eax,%edx
ffff800000104c45:	c1 ea 1f             	shr    $0x1f,%edx
ffff800000104c48:	01 d0                	add    %edx,%eax
ffff800000104c4a:	d1 f8                	sar    %eax
ffff800000104c4c:	48 98                	cltq   
ffff800000104c4e:	48 f7 d8             	neg    %rax
ffff800000104c51:	48 89 c2             	mov    %rax,%rdx
ffff800000104c54:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104c58:	48 01 d0             	add    %rdx,%rax
ffff800000104c5b:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
ffff800000104c5f:	0f 83 6f ff ff ff    	jae    ffff800000104bd4 <vsprintf+0x128>
ffff800000104c65:	e9 d6 01 00 00       	jmpq   ffff800000104e40 <vsprintf+0x394>
ffff800000104c6a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104c6e:	0f b6 00             	movzbl (%rax),%eax
ffff800000104c71:	3c 63                	cmp    $0x63,%al
ffff800000104c73:	75 5a                	jne    ffff800000104ccf <vsprintf+0x223>
ffff800000104c75:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104c79:	8b 00                	mov    (%rax),%eax
ffff800000104c7b:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104c7e:	77 24                	ja     ffff800000104ca4 <vsprintf+0x1f8>
ffff800000104c80:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104c84:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104c88:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104c8c:	8b 00                	mov    (%rax),%eax
ffff800000104c8e:	89 c0                	mov    %eax,%eax
ffff800000104c90:	48 01 d0             	add    %rdx,%rax
ffff800000104c93:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104c97:	8b 12                	mov    (%rdx),%edx
ffff800000104c99:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104c9c:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104ca0:	89 0a                	mov    %ecx,(%rdx)
ffff800000104ca2:	eb 14                	jmp    ffff800000104cb8 <vsprintf+0x20c>
ffff800000104ca4:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104ca8:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104cac:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104cb0:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104cb4:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104cb8:	8b 08                	mov    (%rax),%ecx
ffff800000104cba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104cbe:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104cc2:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104cc6:	89 ca                	mov    %ecx,%edx
ffff800000104cc8:	88 10                	mov    %dl,(%rax)
ffff800000104cca:	e9 71 01 00 00       	jmpq   ffff800000104e40 <vsprintf+0x394>
ffff800000104ccf:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104cd3:	0f b6 00             	movzbl (%rax),%eax
ffff800000104cd6:	3c 73                	cmp    $0x73,%al
ffff800000104cd8:	0f 85 8f 00 00 00    	jne    ffff800000104d6d <vsprintf+0x2c1>
ffff800000104cde:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104ce2:	8b 00                	mov    (%rax),%eax
ffff800000104ce4:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104ce7:	77 24                	ja     ffff800000104d0d <vsprintf+0x261>
ffff800000104ce9:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104ced:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104cf1:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104cf5:	8b 00                	mov    (%rax),%eax
ffff800000104cf7:	89 c0                	mov    %eax,%eax
ffff800000104cf9:	48 01 d0             	add    %rdx,%rax
ffff800000104cfc:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104d00:	8b 12                	mov    (%rdx),%edx
ffff800000104d02:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104d05:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104d09:	89 0a                	mov    %ecx,(%rdx)
ffff800000104d0b:	eb 14                	jmp    ffff800000104d21 <vsprintf+0x275>
ffff800000104d0d:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104d11:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104d15:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104d19:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104d1d:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104d21:	48 8b 00             	mov    (%rax),%rax
ffff800000104d24:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff800000104d28:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000104d2c:	0f b6 00             	movzbl (%rax),%eax
ffff800000104d2f:	84 c0                	test   %al,%al
ffff800000104d31:	0f 84 08 01 00 00    	je     ffff800000104e3f <vsprintf+0x393>
ffff800000104d37:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000104d3b:	0f b6 10             	movzbl (%rax),%edx
ffff800000104d3e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104d42:	88 10                	mov    %dl,(%rax)
ffff800000104d44:	eb 17                	jmp    ffff800000104d5d <vsprintf+0x2b1>
ffff800000104d46:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000104d4a:	0f b6 10             	movzbl (%rax),%edx
ffff800000104d4d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104d51:	88 10                	mov    %dl,(%rax)
ffff800000104d53:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
ffff800000104d58:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
ffff800000104d5d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000104d61:	0f b6 00             	movzbl (%rax),%eax
ffff800000104d64:	84 c0                	test   %al,%al
ffff800000104d66:	75 de                	jne    ffff800000104d46 <vsprintf+0x29a>
ffff800000104d68:	e9 d3 00 00 00       	jmpq   ffff800000104e40 <vsprintf+0x394>
ffff800000104d6d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104d71:	0f b6 00             	movzbl (%rax),%eax
ffff800000104d74:	3c 78                	cmp    $0x78,%al
ffff800000104d76:	0f 85 c4 00 00 00    	jne    ffff800000104e40 <vsprintf+0x394>
ffff800000104d7c:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104d80:	8b 00                	mov    (%rax),%eax
ffff800000104d82:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104d85:	77 24                	ja     ffff800000104dab <vsprintf+0x2ff>
ffff800000104d87:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104d8b:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104d8f:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104d93:	8b 00                	mov    (%rax),%eax
ffff800000104d95:	89 c0                	mov    %eax,%eax
ffff800000104d97:	48 01 d0             	add    %rdx,%rax
ffff800000104d9a:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104d9e:	8b 12                	mov    (%rdx),%edx
ffff800000104da0:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104da3:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104da7:	89 0a                	mov    %ecx,(%rdx)
ffff800000104da9:	eb 14                	jmp    ffff800000104dbf <vsprintf+0x313>
ffff800000104dab:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104daf:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104db3:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104db7:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104dbb:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104dbf:	48 8b 00             	mov    (%rax),%rax
ffff800000104dc2:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff800000104dc6:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
ffff800000104dcb:	75 2f                	jne    ffff800000104dfc <vsprintf+0x350>
ffff800000104dcd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104dd1:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104dd5:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104dd9:	c6 00 30             	movb   $0x30,(%rax)
ffff800000104ddc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104de0:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104de4:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104de8:	c6 00 78             	movb   $0x78,(%rax)
ffff800000104deb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104def:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104df3:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104df7:	c6 00 30             	movb   $0x30,(%rax)
ffff800000104dfa:	eb 44                	jmp    ffff800000104e40 <vsprintf+0x394>
ffff800000104dfc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104e00:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104e04:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104e08:	c6 00 30             	movb   $0x30,(%rax)
ffff800000104e0b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104e0f:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104e13:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104e17:	c6 00 78             	movb   $0x78,(%rax)
ffff800000104e1a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000104e1e:	89 c2                	mov    %eax,%edx
ffff800000104e20:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104e24:	89 d6                	mov    %edx,%esi
ffff800000104e26:	48 89 c7             	mov    %rax,%rdi
ffff800000104e29:	48 b8 7e 8f ff ff ff 	movabs $0xffffffffffff8f7e,%rax
ffff800000104e30:	ff ff ff 
ffff800000104e33:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000104e37:	ff d0                	callq  *%rax
ffff800000104e39:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000104e3d:	eb 01                	jmp    ffff800000104e40 <vsprintf+0x394>
ffff800000104e3f:	90                   	nop
ffff800000104e40:	48 83 45 c0 01       	addq   $0x1,-0x40(%rbp)
ffff800000104e45:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104e49:	0f b6 00             	movzbl (%rax),%eax
ffff800000104e4c:	84 c0                	test   %al,%al
ffff800000104e4e:	0f 85 9b fc ff ff    	jne    ffff800000104aef <vsprintf+0x43>
ffff800000104e54:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000104e58:	48 b8 58 46 01 00 00 	movabs $0x14658,%rax
ffff800000104e5f:	00 00 00 
ffff800000104e62:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000104e66:	48 29 c2             	sub    %rax,%rdx
ffff800000104e69:	48 89 d0             	mov    %rdx,%rax
ffff800000104e6c:	48 83 c4 40          	add    $0x40,%rsp
ffff800000104e70:	5b                   	pop    %rbx
ffff800000104e71:	5d                   	pop    %rbp
ffff800000104e72:	c3                   	retq   

ffff800000104e73 <printk>:
ffff800000104e73:	55                   	push   %rbp
ffff800000104e74:	48 89 e5             	mov    %rsp,%rbp
ffff800000104e77:	53                   	push   %rbx
ffff800000104e78:	48 81 ec e8 00 00 00 	sub    $0xe8,%rsp
ffff800000104e7f:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000104e7f <printk+0xc>
ffff800000104e86:	49 bb a9 6b 00 00 00 	movabs $0x6ba9,%r11
ffff800000104e8d:	00 00 00 
ffff800000104e90:	4c 01 db             	add    %r11,%rbx
ffff800000104e93:	89 bd 1c ff ff ff    	mov    %edi,-0xe4(%rbp)
ffff800000104e99:	89 b5 18 ff ff ff    	mov    %esi,-0xe8(%rbp)
ffff800000104e9f:	48 89 95 10 ff ff ff 	mov    %rdx,-0xf0(%rbp)
ffff800000104ea6:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
ffff800000104ead:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
ffff800000104eb4:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
ffff800000104ebb:	84 c0                	test   %al,%al
ffff800000104ebd:	74 23                	je     ffff800000104ee2 <printk+0x6f>
ffff800000104ebf:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
ffff800000104ec6:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
ffff800000104eca:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
ffff800000104ece:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
ffff800000104ed2:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
ffff800000104ed6:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
ffff800000104eda:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
ffff800000104ede:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
ffff800000104ee2:	c7 85 20 ff ff ff 18 	movl   $0x18,-0xe0(%rbp)
ffff800000104ee9:	00 00 00 
ffff800000104eec:	c7 85 24 ff ff ff 30 	movl   $0x30,-0xdc(%rbp)
ffff800000104ef3:	00 00 00 
ffff800000104ef6:	48 8d 45 10          	lea    0x10(%rbp),%rax
ffff800000104efa:	48 89 85 28 ff ff ff 	mov    %rax,-0xd8(%rbp)
ffff800000104f01:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
ffff800000104f08:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
ffff800000104f0f:	48 8d 95 20 ff ff ff 	lea    -0xe0(%rbp),%rdx
ffff800000104f16:	48 8b 85 10 ff ff ff 	mov    -0xf0(%rbp),%rax
ffff800000104f1d:	48 89 d6             	mov    %rdx,%rsi
ffff800000104f20:	48 89 c7             	mov    %rax,%rdi
ffff800000104f23:	48 b8 84 90 ff ff ff 	movabs $0xffffffffffff9084,%rax
ffff800000104f2a:	ff ff ff 
ffff800000104f2d:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000104f31:	ff d0                	callq  *%rax
ffff800000104f33:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%rbp)
ffff800000104f39:	c7 85 3c ff ff ff 00 	movl   $0x0,-0xc4(%rbp)
ffff800000104f40:	00 00 00 
ffff800000104f43:	e9 ac 02 00 00       	jmpq   ffff8000001051f4 <printk+0x381>
ffff800000104f48:	8b 85 3c ff ff ff    	mov    -0xc4(%rbp),%eax
ffff800000104f4e:	48 63 d0             	movslq %eax,%rdx
ffff800000104f51:	48 b8 58 46 01 00 00 	movabs $0x14658,%rax
ffff800000104f58:	00 00 00 
ffff800000104f5b:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000104f5f:	48 01 d0             	add    %rdx,%rax
ffff800000104f62:	0f b6 00             	movzbl (%rax),%eax
ffff800000104f65:	3c 0a                	cmp    $0xa,%al
ffff800000104f67:	75 36                	jne    ffff800000104f9f <printk+0x12c>
ffff800000104f69:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff800000104f70:	00 00 00 
ffff800000104f73:	8b 44 03 0c          	mov    0xc(%rbx,%rax,1),%eax
ffff800000104f77:	8d 50 01             	lea    0x1(%rax),%edx
ffff800000104f7a:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff800000104f81:	00 00 00 
ffff800000104f84:	89 54 03 0c          	mov    %edx,0xc(%rbx,%rax,1)
ffff800000104f88:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff800000104f8f:	00 00 00 
ffff800000104f92:	c7 44 03 08 00 00 00 	movl   $0x0,0x8(%rbx,%rax,1)
ffff800000104f99:	00 
ffff800000104f9a:	e9 4e 02 00 00       	jmpq   ffff8000001051ed <printk+0x37a>
ffff800000104f9f:	8b 85 3c ff ff ff    	mov    -0xc4(%rbp),%eax
ffff800000104fa5:	48 63 d0             	movslq %eax,%rdx
ffff800000104fa8:	48 b8 58 46 01 00 00 	movabs $0x14658,%rax
ffff800000104faf:	00 00 00 
ffff800000104fb2:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000104fb6:	48 01 d0             	add    %rdx,%rax
ffff800000104fb9:	0f b6 00             	movzbl (%rax),%eax
ffff800000104fbc:	3c 08                	cmp    $0x8,%al
ffff800000104fbe:	0f 85 68 01 00 00    	jne    ffff80000010512c <printk+0x2b9>
ffff800000104fc4:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff800000104fcb:	00 00 00 
ffff800000104fce:	8b 44 03 08          	mov    0x8(%rbx,%rax,1),%eax
ffff800000104fd2:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff800000104fd5:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff800000104fdc:	00 00 00 
ffff800000104fdf:	89 54 03 08          	mov    %edx,0x8(%rbx,%rax,1)
ffff800000104fe3:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff800000104fea:	00 00 00 
ffff800000104fed:	8b 44 03 08          	mov    0x8(%rbx,%rax,1),%eax
ffff800000104ff1:	85 c0                	test   %eax,%eax
ffff800000104ff3:	0f 89 b2 00 00 00    	jns    ffff8000001050ab <printk+0x238>
ffff800000104ff9:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff800000105000:	00 00 00 
ffff800000105003:	8b 04 03             	mov    (%rbx,%rax,1),%eax
ffff800000105006:	48 ba f8 56 01 00 00 	movabs $0x156f8,%rdx
ffff80000010500d:	00 00 00 
ffff800000105010:	8b 7c 13 10          	mov    0x10(%rbx,%rdx,1),%edi
ffff800000105014:	99                   	cltd   
ffff800000105015:	f7 ff                	idiv   %edi
ffff800000105017:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff80000010501a:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff800000105021:	00 00 00 
ffff800000105024:	8b 44 03 10          	mov    0x10(%rbx,%rax,1),%eax
ffff800000105028:	0f af d0             	imul   %eax,%edx
ffff80000010502b:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff800000105032:	00 00 00 
ffff800000105035:	89 54 03 08          	mov    %edx,0x8(%rbx,%rax,1)
ffff800000105039:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff800000105040:	00 00 00 
ffff800000105043:	8b 44 03 0c          	mov    0xc(%rbx,%rax,1),%eax
ffff800000105047:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff80000010504a:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff800000105051:	00 00 00 
ffff800000105054:	89 54 03 0c          	mov    %edx,0xc(%rbx,%rax,1)
ffff800000105058:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff80000010505f:	00 00 00 
ffff800000105062:	8b 44 03 0c          	mov    0xc(%rbx,%rax,1),%eax
ffff800000105066:	85 c0                	test   %eax,%eax
ffff800000105068:	79 41                	jns    ffff8000001050ab <printk+0x238>
ffff80000010506a:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff800000105071:	00 00 00 
ffff800000105074:	8b 44 03 04          	mov    0x4(%rbx,%rax,1),%eax
ffff800000105078:	48 ba f8 56 01 00 00 	movabs $0x156f8,%rdx
ffff80000010507f:	00 00 00 
ffff800000105082:	8b 74 13 14          	mov    0x14(%rbx,%rdx,1),%esi
ffff800000105086:	99                   	cltd   
ffff800000105087:	f7 fe                	idiv   %esi
ffff800000105089:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff80000010508c:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff800000105093:	00 00 00 
ffff800000105096:	8b 44 03 14          	mov    0x14(%rbx,%rax,1),%eax
ffff80000010509a:	0f af d0             	imul   %eax,%edx
ffff80000010509d:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff8000001050a4:	00 00 00 
ffff8000001050a7:	89 54 03 0c          	mov    %edx,0xc(%rbx,%rax,1)
ffff8000001050ab:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff8000001050b2:	00 00 00 
ffff8000001050b5:	8b 54 03 0c          	mov    0xc(%rbx,%rax,1),%edx
ffff8000001050b9:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff8000001050c0:	00 00 00 
ffff8000001050c3:	8b 44 03 14          	mov    0x14(%rbx,%rax,1),%eax
ffff8000001050c7:	89 d1                	mov    %edx,%ecx
ffff8000001050c9:	0f af c8             	imul   %eax,%ecx
ffff8000001050cc:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff8000001050d3:	00 00 00 
ffff8000001050d6:	8b 54 03 08          	mov    0x8(%rbx,%rax,1),%edx
ffff8000001050da:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff8000001050e1:	00 00 00 
ffff8000001050e4:	8b 44 03 10          	mov    0x10(%rbx,%rax,1),%eax
ffff8000001050e8:	0f af d0             	imul   %eax,%edx
ffff8000001050eb:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff8000001050f2:	00 00 00 
ffff8000001050f5:	8b 34 03             	mov    (%rbx,%rax,1),%esi
ffff8000001050f8:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff8000001050ff:	00 00 00 
ffff800000105102:	48 8b 44 03 18       	mov    0x18(%rbx,%rax,1),%rax
ffff800000105107:	6a 20                	pushq  $0x20
ffff800000105109:	41 b9 ff ff ff 00    	mov    $0xffffff,%r9d
ffff80000010510f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
ffff800000105115:	48 89 c7             	mov    %rax,%rdi
ffff800000105118:	48 b8 77 8e ff ff ff 	movabs $0xffffffffffff8e77,%rax
ffff80000010511f:	ff ff ff 
ffff800000105122:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000105126:	ff d0                	callq  *%rax
ffff800000105128:	48 83 c4 08          	add    $0x8,%rsp
ffff80000010512c:	8b 85 3c ff ff ff    	mov    -0xc4(%rbp),%eax
ffff800000105132:	48 63 d0             	movslq %eax,%rdx
ffff800000105135:	48 b8 58 46 01 00 00 	movabs $0x14658,%rax
ffff80000010513c:	00 00 00 
ffff80000010513f:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000105143:	48 01 d0             	add    %rdx,%rax
ffff800000105146:	0f b6 00             	movzbl (%rax),%eax
ffff800000105149:	0f b6 f8             	movzbl %al,%edi
ffff80000010514c:	44 8b 8d 18 ff ff ff 	mov    -0xe8(%rbp),%r9d
ffff800000105153:	44 8b 85 1c ff ff ff 	mov    -0xe4(%rbp),%r8d
ffff80000010515a:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff800000105161:	00 00 00 
ffff800000105164:	8b 54 03 0c          	mov    0xc(%rbx,%rax,1),%edx
ffff800000105168:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff80000010516f:	00 00 00 
ffff800000105172:	8b 44 03 14          	mov    0x14(%rbx,%rax,1),%eax
ffff800000105176:	89 d1                	mov    %edx,%ecx
ffff800000105178:	0f af c8             	imul   %eax,%ecx
ffff80000010517b:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff800000105182:	00 00 00 
ffff800000105185:	8b 54 03 08          	mov    0x8(%rbx,%rax,1),%edx
ffff800000105189:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff800000105190:	00 00 00 
ffff800000105193:	8b 44 03 10          	mov    0x10(%rbx,%rax,1),%eax
ffff800000105197:	0f af d0             	imul   %eax,%edx
ffff80000010519a:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff8000001051a1:	00 00 00 
ffff8000001051a4:	8b 34 03             	mov    (%rbx,%rax,1),%esi
ffff8000001051a7:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff8000001051ae:	00 00 00 
ffff8000001051b1:	48 8b 44 03 18       	mov    0x18(%rbx,%rax,1),%rax
ffff8000001051b6:	57                   	push   %rdi
ffff8000001051b7:	48 89 c7             	mov    %rax,%rdi
ffff8000001051ba:	48 b8 77 8e ff ff ff 	movabs $0xffffffffffff8e77,%rax
ffff8000001051c1:	ff ff ff 
ffff8000001051c4:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001051c8:	ff d0                	callq  *%rax
ffff8000001051ca:	48 83 c4 08          	add    $0x8,%rsp
ffff8000001051ce:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff8000001051d5:	00 00 00 
ffff8000001051d8:	8b 44 03 08          	mov    0x8(%rbx,%rax,1),%eax
ffff8000001051dc:	8d 50 01             	lea    0x1(%rax),%edx
ffff8000001051df:	48 b8 f8 56 01 00 00 	movabs $0x156f8,%rax
ffff8000001051e6:	00 00 00 
ffff8000001051e9:	89 54 03 08          	mov    %edx,0x8(%rbx,%rax,1)
ffff8000001051ed:	83 85 3c ff ff ff 01 	addl   $0x1,-0xc4(%rbp)
ffff8000001051f4:	8b 85 3c ff ff ff    	mov    -0xc4(%rbp),%eax
ffff8000001051fa:	3b 85 38 ff ff ff    	cmp    -0xc8(%rbp),%eax
ffff800000105200:	0f 8c 42 fd ff ff    	jl     ffff800000104f48 <printk+0xd5>
ffff800000105206:	90                   	nop
ffff800000105207:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
ffff80000010520b:	c9                   	leaveq 
ffff80000010520c:	c3                   	retq   

ffff80000010520d <do_divide_error>:
ffff80000010520d:	55                   	push   %rbp
ffff80000010520e:	48 89 e5             	mov    %rsp,%rbp
ffff800000105211:	41 57                	push   %r15
ffff800000105213:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000105217:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff800000105217 <do_divide_error+0xa>
ffff80000010521e:	49 bb 11 68 00 00 00 	movabs $0x6811,%r11
ffff800000105225:	00 00 00 
ffff800000105228:	4d 01 da             	add    %r11,%r10
ffff80000010522b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff80000010522f:	89 75 d4             	mov    %esi,-0x2c(%rbp)
ffff800000105232:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105239:	00 
ffff80000010523a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010523e:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105244:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105248:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010524c:	48 8b 08             	mov    (%rax),%rcx
ffff80000010524f:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105253:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff800000105256:	49 89 c9             	mov    %rcx,%r9
ffff800000105259:	49 89 d0             	mov    %rdx,%r8
ffff80000010525c:	89 c1                	mov    %eax,%ecx
ffff80000010525e:	48 b8 80 10 00 00 00 	movabs $0x1080,%rax
ffff800000105265:	00 00 00 
ffff800000105268:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff80000010526c:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105271:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105276:	4d 89 d7             	mov    %r10,%r15
ffff800000105279:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010527e:	49 bb 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r11
ffff800000105285:	ff ff ff 
ffff800000105288:	4d 01 d3             	add    %r10,%r11
ffff80000010528b:	41 ff d3             	callq  *%r11
ffff80000010528e:	eb fe                	jmp    ffff80000010528e <do_divide_error+0x81>

ffff800000105290 <do_debug>:
ffff800000105290:	55                   	push   %rbp
ffff800000105291:	48 89 e5             	mov    %rsp,%rbp
ffff800000105294:	41 57                	push   %r15
ffff800000105296:	48 83 ec 28          	sub    $0x28,%rsp
ffff80000010529a:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff80000010529a <do_debug+0xa>
ffff8000001052a1:	49 bb 8e 67 00 00 00 	movabs $0x678e,%r11
ffff8000001052a8:	00 00 00 
ffff8000001052ab:	4d 01 da             	add    %r11,%r10
ffff8000001052ae:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001052b2:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001052b6:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001052bd:	00 
ffff8000001052be:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001052c2:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001052c8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001052cc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001052d0:	48 8b 08             	mov    (%rax),%rcx
ffff8000001052d3:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001052d7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001052db:	49 89 c9             	mov    %rcx,%r9
ffff8000001052de:	49 89 d0             	mov    %rdx,%r8
ffff8000001052e1:	48 89 c1             	mov    %rax,%rcx
ffff8000001052e4:	48 b8 b0 10 00 00 00 	movabs $0x10b0,%rax
ffff8000001052eb:	00 00 00 
ffff8000001052ee:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff8000001052f2:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001052f7:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001052fc:	4d 89 d7             	mov    %r10,%r15
ffff8000001052ff:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105304:	49 bb 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r11
ffff80000010530b:	ff ff ff 
ffff80000010530e:	4d 01 d3             	add    %r10,%r11
ffff800000105311:	41 ff d3             	callq  *%r11
ffff800000105314:	eb fe                	jmp    ffff800000105314 <do_debug+0x84>

ffff800000105316 <do_nmi>:
ffff800000105316:	55                   	push   %rbp
ffff800000105317:	48 89 e5             	mov    %rsp,%rbp
ffff80000010531a:	41 57                	push   %r15
ffff80000010531c:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000105320:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff800000105320 <do_nmi+0xa>
ffff800000105327:	49 bb 08 67 00 00 00 	movabs $0x6708,%r11
ffff80000010532e:	00 00 00 
ffff800000105331:	4d 01 da             	add    %r11,%r10
ffff800000105334:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105338:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff80000010533c:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105343:	00 
ffff800000105344:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105348:	48 05 98 00 00 00    	add    $0x98,%rax
ffff80000010534e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105352:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105356:	48 8b 08             	mov    (%rax),%rcx
ffff800000105359:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff80000010535d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105361:	49 89 c9             	mov    %rcx,%r9
ffff800000105364:	49 89 d0             	mov    %rdx,%r8
ffff800000105367:	48 89 c1             	mov    %rax,%rcx
ffff80000010536a:	48 b8 d8 10 00 00 00 	movabs $0x10d8,%rax
ffff800000105371:	00 00 00 
ffff800000105374:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000105378:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010537d:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105382:	4d 89 d7             	mov    %r10,%r15
ffff800000105385:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010538a:	49 bb 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r11
ffff800000105391:	ff ff ff 
ffff800000105394:	4d 01 d3             	add    %r10,%r11
ffff800000105397:	41 ff d3             	callq  *%r11
ffff80000010539a:	eb fe                	jmp    ffff80000010539a <do_nmi+0x84>

ffff80000010539c <do_breakpoint>:
ffff80000010539c:	55                   	push   %rbp
ffff80000010539d:	48 89 e5             	mov    %rsp,%rbp
ffff8000001053a0:	41 57                	push   %r15
ffff8000001053a2:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001053a6:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001053a6 <do_breakpoint+0xa>
ffff8000001053ad:	49 bb 82 66 00 00 00 	movabs $0x6682,%r11
ffff8000001053b4:	00 00 00 
ffff8000001053b7:	4d 01 da             	add    %r11,%r10
ffff8000001053ba:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001053be:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001053c2:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001053c9:	00 
ffff8000001053ca:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001053ce:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001053d4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001053d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001053dc:	48 8b 08             	mov    (%rax),%rcx
ffff8000001053df:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001053e3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001053e7:	49 89 c9             	mov    %rcx,%r9
ffff8000001053ea:	49 89 d0             	mov    %rdx,%r8
ffff8000001053ed:	48 89 c1             	mov    %rax,%rcx
ffff8000001053f0:	48 b8 08 11 00 00 00 	movabs $0x1108,%rax
ffff8000001053f7:	00 00 00 
ffff8000001053fa:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff8000001053fe:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105403:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105408:	4d 89 d7             	mov    %r10,%r15
ffff80000010540b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105410:	49 bb 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r11
ffff800000105417:	ff ff ff 
ffff80000010541a:	4d 01 d3             	add    %r10,%r11
ffff80000010541d:	41 ff d3             	callq  *%r11
ffff800000105420:	eb fe                	jmp    ffff800000105420 <do_breakpoint+0x84>

ffff800000105422 <do_overflow>:
ffff800000105422:	55                   	push   %rbp
ffff800000105423:	48 89 e5             	mov    %rsp,%rbp
ffff800000105426:	41 57                	push   %r15
ffff800000105428:	48 83 ec 28          	sub    $0x28,%rsp
ffff80000010542c:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff80000010542c <do_overflow+0xa>
ffff800000105433:	49 bb fc 65 00 00 00 	movabs $0x65fc,%r11
ffff80000010543a:	00 00 00 
ffff80000010543d:	4d 01 da             	add    %r11,%r10
ffff800000105440:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105444:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105448:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff80000010544f:	00 
ffff800000105450:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105454:	48 05 98 00 00 00    	add    $0x98,%rax
ffff80000010545a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff80000010545e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105462:	48 8b 08             	mov    (%rax),%rcx
ffff800000105465:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105469:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010546d:	49 89 c9             	mov    %rcx,%r9
ffff800000105470:	49 89 d0             	mov    %rdx,%r8
ffff800000105473:	48 89 c1             	mov    %rax,%rcx
ffff800000105476:	48 b8 38 11 00 00 00 	movabs $0x1138,%rax
ffff80000010547d:	00 00 00 
ffff800000105480:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000105484:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105489:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010548e:	4d 89 d7             	mov    %r10,%r15
ffff800000105491:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105496:	49 bb 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r11
ffff80000010549d:	ff ff ff 
ffff8000001054a0:	4d 01 d3             	add    %r10,%r11
ffff8000001054a3:	41 ff d3             	callq  *%r11
ffff8000001054a6:	eb fe                	jmp    ffff8000001054a6 <do_overflow+0x84>

ffff8000001054a8 <do_bounds>:
ffff8000001054a8:	55                   	push   %rbp
ffff8000001054a9:	48 89 e5             	mov    %rsp,%rbp
ffff8000001054ac:	41 57                	push   %r15
ffff8000001054ae:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001054b2:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001054b2 <do_bounds+0xa>
ffff8000001054b9:	49 bb 76 65 00 00 00 	movabs $0x6576,%r11
ffff8000001054c0:	00 00 00 
ffff8000001054c3:	4d 01 da             	add    %r11,%r10
ffff8000001054c6:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001054ca:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001054ce:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001054d5:	00 
ffff8000001054d6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001054da:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001054e0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001054e4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001054e8:	48 8b 08             	mov    (%rax),%rcx
ffff8000001054eb:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001054ef:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001054f3:	49 89 c9             	mov    %rcx,%r9
ffff8000001054f6:	49 89 d0             	mov    %rdx,%r8
ffff8000001054f9:	48 89 c1             	mov    %rax,%rcx
ffff8000001054fc:	48 b8 68 11 00 00 00 	movabs $0x1168,%rax
ffff800000105503:	00 00 00 
ffff800000105506:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff80000010550a:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010550f:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105514:	4d 89 d7             	mov    %r10,%r15
ffff800000105517:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010551c:	49 bb 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r11
ffff800000105523:	ff ff ff 
ffff800000105526:	4d 01 d3             	add    %r10,%r11
ffff800000105529:	41 ff d3             	callq  *%r11
ffff80000010552c:	eb fe                	jmp    ffff80000010552c <do_bounds+0x84>

ffff80000010552e <do_undefined_opcode>:
ffff80000010552e:	55                   	push   %rbp
ffff80000010552f:	48 89 e5             	mov    %rsp,%rbp
ffff800000105532:	41 57                	push   %r15
ffff800000105534:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000105538:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff800000105538 <do_undefined_opcode+0xa>
ffff80000010553f:	49 bb f0 64 00 00 00 	movabs $0x64f0,%r11
ffff800000105546:	00 00 00 
ffff800000105549:	4d 01 da             	add    %r11,%r10
ffff80000010554c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105550:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105554:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff80000010555b:	00 
ffff80000010555c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105560:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105566:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff80000010556a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010556e:	48 8b 08             	mov    (%rax),%rcx
ffff800000105571:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105575:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105579:	49 89 c9             	mov    %rcx,%r9
ffff80000010557c:	49 89 d0             	mov    %rdx,%r8
ffff80000010557f:	48 89 c1             	mov    %rax,%rcx
ffff800000105582:	48 b8 a0 11 00 00 00 	movabs $0x11a0,%rax
ffff800000105589:	00 00 00 
ffff80000010558c:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000105590:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105595:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010559a:	4d 89 d7             	mov    %r10,%r15
ffff80000010559d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001055a2:	49 bb 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r11
ffff8000001055a9:	ff ff ff 
ffff8000001055ac:	4d 01 d3             	add    %r10,%r11
ffff8000001055af:	41 ff d3             	callq  *%r11
ffff8000001055b2:	eb fe                	jmp    ffff8000001055b2 <do_undefined_opcode+0x84>

ffff8000001055b4 <do_dev_not_available>:
ffff8000001055b4:	55                   	push   %rbp
ffff8000001055b5:	48 89 e5             	mov    %rsp,%rbp
ffff8000001055b8:	41 57                	push   %r15
ffff8000001055ba:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001055be:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001055be <do_dev_not_available+0xa>
ffff8000001055c5:	49 bb 6a 64 00 00 00 	movabs $0x646a,%r11
ffff8000001055cc:	00 00 00 
ffff8000001055cf:	4d 01 da             	add    %r11,%r10
ffff8000001055d2:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001055d6:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001055da:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001055e1:	00 
ffff8000001055e2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001055e6:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001055ec:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001055f0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001055f4:	48 8b 08             	mov    (%rax),%rcx
ffff8000001055f7:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001055fb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001055ff:	49 89 c9             	mov    %rcx,%r9
ffff800000105602:	49 89 d0             	mov    %rdx,%r8
ffff800000105605:	48 89 c1             	mov    %rax,%rcx
ffff800000105608:	48 b8 e8 11 00 00 00 	movabs $0x11e8,%rax
ffff80000010560f:	00 00 00 
ffff800000105612:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000105616:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010561b:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105620:	4d 89 d7             	mov    %r10,%r15
ffff800000105623:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105628:	49 bb 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r11
ffff80000010562f:	ff ff ff 
ffff800000105632:	4d 01 d3             	add    %r10,%r11
ffff800000105635:	41 ff d3             	callq  *%r11
ffff800000105638:	eb fe                	jmp    ffff800000105638 <do_dev_not_available+0x84>

ffff80000010563a <do_double_fault>:
ffff80000010563a:	55                   	push   %rbp
ffff80000010563b:	48 89 e5             	mov    %rsp,%rbp
ffff80000010563e:	41 57                	push   %r15
ffff800000105640:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000105644:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff800000105644 <do_double_fault+0xa>
ffff80000010564b:	49 bb e4 63 00 00 00 	movabs $0x63e4,%r11
ffff800000105652:	00 00 00 
ffff800000105655:	4d 01 da             	add    %r11,%r10
ffff800000105658:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff80000010565c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105660:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105667:	00 
ffff800000105668:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010566c:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105672:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105676:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010567a:	48 8b 08             	mov    (%rax),%rcx
ffff80000010567d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105681:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105685:	49 89 c9             	mov    %rcx,%r9
ffff800000105688:	49 89 d0             	mov    %rdx,%r8
ffff80000010568b:	48 89 c1             	mov    %rax,%rcx
ffff80000010568e:	48 b8 38 12 00 00 00 	movabs $0x1238,%rax
ffff800000105695:	00 00 00 
ffff800000105698:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff80000010569c:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001056a1:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001056a6:	4d 89 d7             	mov    %r10,%r15
ffff8000001056a9:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001056ae:	49 bb 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r11
ffff8000001056b5:	ff ff ff 
ffff8000001056b8:	4d 01 d3             	add    %r10,%r11
ffff8000001056bb:	41 ff d3             	callq  *%r11
ffff8000001056be:	eb fe                	jmp    ffff8000001056be <do_double_fault+0x84>

ffff8000001056c0 <do_coprocessor_segment_overrun>:
ffff8000001056c0:	55                   	push   %rbp
ffff8000001056c1:	48 89 e5             	mov    %rsp,%rbp
ffff8000001056c4:	41 57                	push   %r15
ffff8000001056c6:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001056ca:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001056ca <do_coprocessor_segment_overrun+0xa>
ffff8000001056d1:	49 bb 5e 63 00 00 00 	movabs $0x635e,%r11
ffff8000001056d8:	00 00 00 
ffff8000001056db:	4d 01 da             	add    %r11,%r10
ffff8000001056de:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001056e2:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001056e6:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001056ed:	00 
ffff8000001056ee:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001056f2:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001056f8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001056fc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105700:	48 8b 08             	mov    (%rax),%rcx
ffff800000105703:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105707:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010570b:	49 89 c9             	mov    %rcx,%r9
ffff80000010570e:	49 89 d0             	mov    %rdx,%r8
ffff800000105711:	48 89 c1             	mov    %rax,%rcx
ffff800000105714:	48 b8 68 12 00 00 00 	movabs $0x1268,%rax
ffff80000010571b:	00 00 00 
ffff80000010571e:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000105722:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105727:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010572c:	4d 89 d7             	mov    %r10,%r15
ffff80000010572f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105734:	49 bb 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r11
ffff80000010573b:	ff ff ff 
ffff80000010573e:	4d 01 d3             	add    %r10,%r11
ffff800000105741:	41 ff d3             	callq  *%r11
ffff800000105744:	eb fe                	jmp    ffff800000105744 <do_coprocessor_segment_overrun+0x84>

ffff800000105746 <do_invalid_TSS>:
ffff800000105746:	55                   	push   %rbp
ffff800000105747:	48 89 e5             	mov    %rsp,%rbp
ffff80000010574a:	41 57                	push   %r15
ffff80000010574c:	53                   	push   %rbx
ffff80000010574d:	48 83 ec 20          	sub    $0x20,%rsp
ffff800000105751:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000105751 <do_invalid_TSS+0xb>
ffff800000105758:	49 bb d7 62 00 00 00 	movabs $0x62d7,%r11
ffff80000010575f:	00 00 00 
ffff800000105762:	4c 01 db             	add    %r11,%rbx
ffff800000105765:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105769:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff80000010576d:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105774:	00 
ffff800000105775:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105779:	48 05 98 00 00 00    	add    $0x98,%rax
ffff80000010577f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105783:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105787:	48 8b 08             	mov    (%rax),%rcx
ffff80000010578a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff80000010578e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105792:	49 89 c9             	mov    %rcx,%r9
ffff800000105795:	49 89 d0             	mov    %rdx,%r8
ffff800000105798:	48 89 c1             	mov    %rax,%rcx
ffff80000010579b:	48 b8 b8 12 00 00 00 	movabs $0x12b8,%rax
ffff8000001057a2:	00 00 00 
ffff8000001057a5:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001057a9:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001057ae:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001057b3:	49 89 df             	mov    %rbx,%r15
ffff8000001057b6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001057bb:	49 ba 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r10
ffff8000001057c2:	ff ff ff 
ffff8000001057c5:	49 01 da             	add    %rbx,%r10
ffff8000001057c8:	41 ff d2             	callq  *%r10
ffff8000001057cb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001057cf:	83 e0 01             	and    $0x1,%eax
ffff8000001057d2:	48 85 c0             	test   %rax,%rax
ffff8000001057d5:	74 2f                	je     ffff800000105806 <do_invalid_TSS+0xc0>
ffff8000001057d7:	48 b8 e8 12 00 00 00 	movabs $0x12e8,%rax
ffff8000001057de:	00 00 00 
ffff8000001057e1:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001057e5:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001057ea:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001057ef:	49 89 df             	mov    %rbx,%r15
ffff8000001057f2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001057f7:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff8000001057fe:	ff ff ff 
ffff800000105801:	48 01 d9             	add    %rbx,%rcx
ffff800000105804:	ff d1                	callq  *%rcx
ffff800000105806:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010580a:	83 e0 02             	and    $0x2,%eax
ffff80000010580d:	48 85 c0             	test   %rax,%rax
ffff800000105810:	74 31                	je     ffff800000105843 <do_invalid_TSS+0xfd>
ffff800000105812:	48 b8 68 13 00 00 00 	movabs $0x1368,%rax
ffff800000105819:	00 00 00 
ffff80000010581c:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105820:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105825:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010582a:	49 89 df             	mov    %rbx,%r15
ffff80000010582d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105832:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff800000105839:	ff ff ff 
ffff80000010583c:	48 01 d9             	add    %rbx,%rcx
ffff80000010583f:	ff d1                	callq  *%rcx
ffff800000105841:	eb 2f                	jmp    ffff800000105872 <do_invalid_TSS+0x12c>
ffff800000105843:	48 b8 98 13 00 00 00 	movabs $0x1398,%rax
ffff80000010584a:	00 00 00 
ffff80000010584d:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105851:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105856:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010585b:	49 89 df             	mov    %rbx,%r15
ffff80000010585e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105863:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff80000010586a:	ff ff ff 
ffff80000010586d:	48 01 d9             	add    %rbx,%rcx
ffff800000105870:	ff d1                	callq  *%rcx
ffff800000105872:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105876:	83 e0 02             	and    $0x2,%eax
ffff800000105879:	48 85 c0             	test   %rax,%rax
ffff80000010587c:	75 6c                	jne    ffff8000001058ea <do_invalid_TSS+0x1a4>
ffff80000010587e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105882:	83 e0 04             	and    $0x4,%eax
ffff800000105885:	48 85 c0             	test   %rax,%rax
ffff800000105888:	74 31                	je     ffff8000001058bb <do_invalid_TSS+0x175>
ffff80000010588a:	48 b8 d0 13 00 00 00 	movabs $0x13d0,%rax
ffff800000105891:	00 00 00 
ffff800000105894:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105898:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010589d:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001058a2:	49 89 df             	mov    %rbx,%r15
ffff8000001058a5:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001058aa:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff8000001058b1:	ff ff ff 
ffff8000001058b4:	48 01 d9             	add    %rbx,%rcx
ffff8000001058b7:	ff d1                	callq  *%rcx
ffff8000001058b9:	eb 2f                	jmp    ffff8000001058ea <do_invalid_TSS+0x1a4>
ffff8000001058bb:	48 b8 08 14 00 00 00 	movabs $0x1408,%rax
ffff8000001058c2:	00 00 00 
ffff8000001058c5:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001058c9:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001058ce:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001058d3:	49 89 df             	mov    %rbx,%r15
ffff8000001058d6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001058db:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff8000001058e2:	ff ff ff 
ffff8000001058e5:	48 01 d9             	add    %rbx,%rcx
ffff8000001058e8:	ff d1                	callq  *%rcx
ffff8000001058ea:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001058ee:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff8000001058f3:	48 89 c1             	mov    %rax,%rcx
ffff8000001058f6:	48 b8 34 14 00 00 00 	movabs $0x1434,%rax
ffff8000001058fd:	00 00 00 
ffff800000105900:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105904:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105909:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010590e:	49 89 df             	mov    %rbx,%r15
ffff800000105911:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105916:	49 b8 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r8
ffff80000010591d:	ff ff ff 
ffff800000105920:	49 01 d8             	add    %rbx,%r8
ffff800000105923:	41 ff d0             	callq  *%r8
ffff800000105926:	eb fe                	jmp    ffff800000105926 <do_invalid_TSS+0x1e0>

ffff800000105928 <do_segment_not_present>:
ffff800000105928:	55                   	push   %rbp
ffff800000105929:	48 89 e5             	mov    %rsp,%rbp
ffff80000010592c:	41 57                	push   %r15
ffff80000010592e:	53                   	push   %rbx
ffff80000010592f:	48 83 ec 20          	sub    $0x20,%rsp
ffff800000105933:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000105933 <do_segment_not_present+0xb>
ffff80000010593a:	49 bb f5 60 00 00 00 	movabs $0x60f5,%r11
ffff800000105941:	00 00 00 
ffff800000105944:	4c 01 db             	add    %r11,%rbx
ffff800000105947:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff80000010594b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff80000010594f:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105956:	00 
ffff800000105957:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010595b:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105961:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105965:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105969:	48 8b 08             	mov    (%rax),%rcx
ffff80000010596c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105970:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105974:	49 89 c9             	mov    %rcx,%r9
ffff800000105977:	49 89 d0             	mov    %rdx,%r8
ffff80000010597a:	48 89 c1             	mov    %rax,%rcx
ffff80000010597d:	48 b8 50 14 00 00 00 	movabs $0x1450,%rax
ffff800000105984:	00 00 00 
ffff800000105987:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010598b:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105990:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105995:	49 89 df             	mov    %rbx,%r15
ffff800000105998:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010599d:	49 ba 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r10
ffff8000001059a4:	ff ff ff 
ffff8000001059a7:	49 01 da             	add    %rbx,%r10
ffff8000001059aa:	41 ff d2             	callq  *%r10
ffff8000001059ad:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001059b1:	83 e0 01             	and    $0x1,%eax
ffff8000001059b4:	48 85 c0             	test   %rax,%rax
ffff8000001059b7:	74 2f                	je     ffff8000001059e8 <do_segment_not_present+0xc0>
ffff8000001059b9:	48 b8 e8 12 00 00 00 	movabs $0x12e8,%rax
ffff8000001059c0:	00 00 00 
ffff8000001059c3:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001059c7:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001059cc:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001059d1:	49 89 df             	mov    %rbx,%r15
ffff8000001059d4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001059d9:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff8000001059e0:	ff ff ff 
ffff8000001059e3:	48 01 d9             	add    %rbx,%rcx
ffff8000001059e6:	ff d1                	callq  *%rcx
ffff8000001059e8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001059ec:	83 e0 02             	and    $0x2,%eax
ffff8000001059ef:	48 85 c0             	test   %rax,%rax
ffff8000001059f2:	74 31                	je     ffff800000105a25 <do_segment_not_present+0xfd>
ffff8000001059f4:	48 b8 68 13 00 00 00 	movabs $0x1368,%rax
ffff8000001059fb:	00 00 00 
ffff8000001059fe:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105a02:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105a07:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105a0c:	49 89 df             	mov    %rbx,%r15
ffff800000105a0f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105a14:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff800000105a1b:	ff ff ff 
ffff800000105a1e:	48 01 d9             	add    %rbx,%rcx
ffff800000105a21:	ff d1                	callq  *%rcx
ffff800000105a23:	eb 2f                	jmp    ffff800000105a54 <do_segment_not_present+0x12c>
ffff800000105a25:	48 b8 98 13 00 00 00 	movabs $0x1398,%rax
ffff800000105a2c:	00 00 00 
ffff800000105a2f:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105a33:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105a38:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105a3d:	49 89 df             	mov    %rbx,%r15
ffff800000105a40:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105a45:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff800000105a4c:	ff ff ff 
ffff800000105a4f:	48 01 d9             	add    %rbx,%rcx
ffff800000105a52:	ff d1                	callq  *%rcx
ffff800000105a54:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105a58:	83 e0 02             	and    $0x2,%eax
ffff800000105a5b:	48 85 c0             	test   %rax,%rax
ffff800000105a5e:	75 6c                	jne    ffff800000105acc <do_segment_not_present+0x1a4>
ffff800000105a60:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105a64:	83 e0 04             	and    $0x4,%eax
ffff800000105a67:	48 85 c0             	test   %rax,%rax
ffff800000105a6a:	74 31                	je     ffff800000105a9d <do_segment_not_present+0x175>
ffff800000105a6c:	48 b8 d0 13 00 00 00 	movabs $0x13d0,%rax
ffff800000105a73:	00 00 00 
ffff800000105a76:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105a7a:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105a7f:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105a84:	49 89 df             	mov    %rbx,%r15
ffff800000105a87:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105a8c:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff800000105a93:	ff ff ff 
ffff800000105a96:	48 01 d9             	add    %rbx,%rcx
ffff800000105a99:	ff d1                	callq  *%rcx
ffff800000105a9b:	eb 2f                	jmp    ffff800000105acc <do_segment_not_present+0x1a4>
ffff800000105a9d:	48 b8 08 14 00 00 00 	movabs $0x1408,%rax
ffff800000105aa4:	00 00 00 
ffff800000105aa7:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105aab:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105ab0:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105ab5:	49 89 df             	mov    %rbx,%r15
ffff800000105ab8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105abd:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff800000105ac4:	ff ff ff 
ffff800000105ac7:	48 01 d9             	add    %rbx,%rcx
ffff800000105aca:	ff d1                	callq  *%rcx
ffff800000105acc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105ad0:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff800000105ad5:	48 89 c1             	mov    %rax,%rcx
ffff800000105ad8:	48 b8 34 14 00 00 00 	movabs $0x1434,%rax
ffff800000105adf:	00 00 00 
ffff800000105ae2:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105ae6:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105aeb:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105af0:	49 89 df             	mov    %rbx,%r15
ffff800000105af3:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105af8:	49 b8 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r8
ffff800000105aff:	ff ff ff 
ffff800000105b02:	49 01 d8             	add    %rbx,%r8
ffff800000105b05:	41 ff d0             	callq  *%r8
ffff800000105b08:	eb fe                	jmp    ffff800000105b08 <do_segment_not_present+0x1e0>

ffff800000105b0a <do_stack_segment_fault>:
ffff800000105b0a:	55                   	push   %rbp
ffff800000105b0b:	48 89 e5             	mov    %rsp,%rbp
ffff800000105b0e:	41 57                	push   %r15
ffff800000105b10:	53                   	push   %rbx
ffff800000105b11:	48 83 ec 20          	sub    $0x20,%rsp
ffff800000105b15:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000105b15 <do_stack_segment_fault+0xb>
ffff800000105b1c:	49 bb 13 5f 00 00 00 	movabs $0x5f13,%r11
ffff800000105b23:	00 00 00 
ffff800000105b26:	4c 01 db             	add    %r11,%rbx
ffff800000105b29:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105b2d:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105b31:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105b38:	00 
ffff800000105b39:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105b3d:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105b43:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105b47:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105b4b:	48 8b 08             	mov    (%rax),%rcx
ffff800000105b4e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105b52:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105b56:	49 89 c9             	mov    %rcx,%r9
ffff800000105b59:	49 89 d0             	mov    %rdx,%r8
ffff800000105b5c:	48 89 c1             	mov    %rax,%rcx
ffff800000105b5f:	48 b8 88 14 00 00 00 	movabs $0x1488,%rax
ffff800000105b66:	00 00 00 
ffff800000105b69:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105b6d:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105b72:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105b77:	49 89 df             	mov    %rbx,%r15
ffff800000105b7a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105b7f:	49 ba 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r10
ffff800000105b86:	ff ff ff 
ffff800000105b89:	49 01 da             	add    %rbx,%r10
ffff800000105b8c:	41 ff d2             	callq  *%r10
ffff800000105b8f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105b93:	83 e0 01             	and    $0x1,%eax
ffff800000105b96:	48 85 c0             	test   %rax,%rax
ffff800000105b99:	74 2f                	je     ffff800000105bca <do_stack_segment_fault+0xc0>
ffff800000105b9b:	48 b8 e8 12 00 00 00 	movabs $0x12e8,%rax
ffff800000105ba2:	00 00 00 
ffff800000105ba5:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105ba9:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105bae:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105bb3:	49 89 df             	mov    %rbx,%r15
ffff800000105bb6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105bbb:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff800000105bc2:	ff ff ff 
ffff800000105bc5:	48 01 d9             	add    %rbx,%rcx
ffff800000105bc8:	ff d1                	callq  *%rcx
ffff800000105bca:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105bce:	83 e0 02             	and    $0x2,%eax
ffff800000105bd1:	48 85 c0             	test   %rax,%rax
ffff800000105bd4:	74 31                	je     ffff800000105c07 <do_stack_segment_fault+0xfd>
ffff800000105bd6:	48 b8 68 13 00 00 00 	movabs $0x1368,%rax
ffff800000105bdd:	00 00 00 
ffff800000105be0:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105be4:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105be9:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105bee:	49 89 df             	mov    %rbx,%r15
ffff800000105bf1:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105bf6:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff800000105bfd:	ff ff ff 
ffff800000105c00:	48 01 d9             	add    %rbx,%rcx
ffff800000105c03:	ff d1                	callq  *%rcx
ffff800000105c05:	eb 2f                	jmp    ffff800000105c36 <do_stack_segment_fault+0x12c>
ffff800000105c07:	48 b8 98 13 00 00 00 	movabs $0x1398,%rax
ffff800000105c0e:	00 00 00 
ffff800000105c11:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105c15:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105c1a:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105c1f:	49 89 df             	mov    %rbx,%r15
ffff800000105c22:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105c27:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff800000105c2e:	ff ff ff 
ffff800000105c31:	48 01 d9             	add    %rbx,%rcx
ffff800000105c34:	ff d1                	callq  *%rcx
ffff800000105c36:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105c3a:	83 e0 02             	and    $0x2,%eax
ffff800000105c3d:	48 85 c0             	test   %rax,%rax
ffff800000105c40:	75 6c                	jne    ffff800000105cae <do_stack_segment_fault+0x1a4>
ffff800000105c42:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105c46:	83 e0 04             	and    $0x4,%eax
ffff800000105c49:	48 85 c0             	test   %rax,%rax
ffff800000105c4c:	74 31                	je     ffff800000105c7f <do_stack_segment_fault+0x175>
ffff800000105c4e:	48 b8 d0 13 00 00 00 	movabs $0x13d0,%rax
ffff800000105c55:	00 00 00 
ffff800000105c58:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105c5c:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105c61:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105c66:	49 89 df             	mov    %rbx,%r15
ffff800000105c69:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105c6e:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff800000105c75:	ff ff ff 
ffff800000105c78:	48 01 d9             	add    %rbx,%rcx
ffff800000105c7b:	ff d1                	callq  *%rcx
ffff800000105c7d:	eb 2f                	jmp    ffff800000105cae <do_stack_segment_fault+0x1a4>
ffff800000105c7f:	48 b8 08 14 00 00 00 	movabs $0x1408,%rax
ffff800000105c86:	00 00 00 
ffff800000105c89:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105c8d:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105c92:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105c97:	49 89 df             	mov    %rbx,%r15
ffff800000105c9a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105c9f:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff800000105ca6:	ff ff ff 
ffff800000105ca9:	48 01 d9             	add    %rbx,%rcx
ffff800000105cac:	ff d1                	callq  *%rcx
ffff800000105cae:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105cb2:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff800000105cb7:	48 89 c1             	mov    %rax,%rcx
ffff800000105cba:	48 b8 34 14 00 00 00 	movabs $0x1434,%rax
ffff800000105cc1:	00 00 00 
ffff800000105cc4:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105cc8:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105ccd:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105cd2:	49 89 df             	mov    %rbx,%r15
ffff800000105cd5:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105cda:	49 b8 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r8
ffff800000105ce1:	ff ff ff 
ffff800000105ce4:	49 01 d8             	add    %rbx,%r8
ffff800000105ce7:	41 ff d0             	callq  *%r8
ffff800000105cea:	eb fe                	jmp    ffff800000105cea <do_stack_segment_fault+0x1e0>

ffff800000105cec <do_general_protection>:
ffff800000105cec:	55                   	push   %rbp
ffff800000105ced:	48 89 e5             	mov    %rsp,%rbp
ffff800000105cf0:	41 57                	push   %r15
ffff800000105cf2:	53                   	push   %rbx
ffff800000105cf3:	48 83 ec 20          	sub    $0x20,%rsp
ffff800000105cf7:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000105cf7 <do_general_protection+0xb>
ffff800000105cfe:	49 bb 31 5d 00 00 00 	movabs $0x5d31,%r11
ffff800000105d05:	00 00 00 
ffff800000105d08:	4c 01 db             	add    %r11,%rbx
ffff800000105d0b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105d0f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105d13:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105d1a:	00 
ffff800000105d1b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105d1f:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105d25:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105d29:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105d2d:	48 8b 08             	mov    (%rax),%rcx
ffff800000105d30:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105d34:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105d38:	49 89 c9             	mov    %rcx,%r9
ffff800000105d3b:	49 89 d0             	mov    %rdx,%r8
ffff800000105d3e:	48 89 c1             	mov    %rax,%rcx
ffff800000105d41:	48 b8 c0 14 00 00 00 	movabs $0x14c0,%rax
ffff800000105d48:	00 00 00 
ffff800000105d4b:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105d4f:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105d54:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105d59:	49 89 df             	mov    %rbx,%r15
ffff800000105d5c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105d61:	49 ba 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r10
ffff800000105d68:	ff ff ff 
ffff800000105d6b:	49 01 da             	add    %rbx,%r10
ffff800000105d6e:	41 ff d2             	callq  *%r10
ffff800000105d71:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105d75:	83 e0 01             	and    $0x1,%eax
ffff800000105d78:	48 85 c0             	test   %rax,%rax
ffff800000105d7b:	74 2f                	je     ffff800000105dac <do_general_protection+0xc0>
ffff800000105d7d:	48 b8 e8 12 00 00 00 	movabs $0x12e8,%rax
ffff800000105d84:	00 00 00 
ffff800000105d87:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105d8b:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105d90:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105d95:	49 89 df             	mov    %rbx,%r15
ffff800000105d98:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105d9d:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff800000105da4:	ff ff ff 
ffff800000105da7:	48 01 d9             	add    %rbx,%rcx
ffff800000105daa:	ff d1                	callq  *%rcx
ffff800000105dac:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105db0:	83 e0 02             	and    $0x2,%eax
ffff800000105db3:	48 85 c0             	test   %rax,%rax
ffff800000105db6:	74 31                	je     ffff800000105de9 <do_general_protection+0xfd>
ffff800000105db8:	48 b8 68 13 00 00 00 	movabs $0x1368,%rax
ffff800000105dbf:	00 00 00 
ffff800000105dc2:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105dc6:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105dcb:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105dd0:	49 89 df             	mov    %rbx,%r15
ffff800000105dd3:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105dd8:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff800000105ddf:	ff ff ff 
ffff800000105de2:	48 01 d9             	add    %rbx,%rcx
ffff800000105de5:	ff d1                	callq  *%rcx
ffff800000105de7:	eb 2f                	jmp    ffff800000105e18 <do_general_protection+0x12c>
ffff800000105de9:	48 b8 98 13 00 00 00 	movabs $0x1398,%rax
ffff800000105df0:	00 00 00 
ffff800000105df3:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105df7:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105dfc:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105e01:	49 89 df             	mov    %rbx,%r15
ffff800000105e04:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105e09:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff800000105e10:	ff ff ff 
ffff800000105e13:	48 01 d9             	add    %rbx,%rcx
ffff800000105e16:	ff d1                	callq  *%rcx
ffff800000105e18:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105e1c:	83 e0 02             	and    $0x2,%eax
ffff800000105e1f:	48 85 c0             	test   %rax,%rax
ffff800000105e22:	75 6c                	jne    ffff800000105e90 <do_general_protection+0x1a4>
ffff800000105e24:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105e28:	83 e0 04             	and    $0x4,%eax
ffff800000105e2b:	48 85 c0             	test   %rax,%rax
ffff800000105e2e:	74 31                	je     ffff800000105e61 <do_general_protection+0x175>
ffff800000105e30:	48 b8 d0 13 00 00 00 	movabs $0x13d0,%rax
ffff800000105e37:	00 00 00 
ffff800000105e3a:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105e3e:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105e43:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105e48:	49 89 df             	mov    %rbx,%r15
ffff800000105e4b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105e50:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff800000105e57:	ff ff ff 
ffff800000105e5a:	48 01 d9             	add    %rbx,%rcx
ffff800000105e5d:	ff d1                	callq  *%rcx
ffff800000105e5f:	eb 2f                	jmp    ffff800000105e90 <do_general_protection+0x1a4>
ffff800000105e61:	48 b8 08 14 00 00 00 	movabs $0x1408,%rax
ffff800000105e68:	00 00 00 
ffff800000105e6b:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105e6f:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105e74:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105e79:	49 89 df             	mov    %rbx,%r15
ffff800000105e7c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105e81:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff800000105e88:	ff ff ff 
ffff800000105e8b:	48 01 d9             	add    %rbx,%rcx
ffff800000105e8e:	ff d1                	callq  *%rcx
ffff800000105e90:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105e94:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff800000105e99:	48 89 c1             	mov    %rax,%rcx
ffff800000105e9c:	48 b8 34 14 00 00 00 	movabs $0x1434,%rax
ffff800000105ea3:	00 00 00 
ffff800000105ea6:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105eaa:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105eaf:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105eb4:	49 89 df             	mov    %rbx,%r15
ffff800000105eb7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105ebc:	49 b8 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r8
ffff800000105ec3:	ff ff ff 
ffff800000105ec6:	49 01 d8             	add    %rbx,%r8
ffff800000105ec9:	41 ff d0             	callq  *%r8
ffff800000105ecc:	eb fe                	jmp    ffff800000105ecc <do_general_protection+0x1e0>

ffff800000105ece <do_page_fault>:
ffff800000105ece:	55                   	push   %rbp
ffff800000105ecf:	48 89 e5             	mov    %rsp,%rbp
ffff800000105ed2:	41 57                	push   %r15
ffff800000105ed4:	53                   	push   %rbx
ffff800000105ed5:	48 83 ec 20          	sub    $0x20,%rsp
ffff800000105ed9:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000105ed9 <do_page_fault+0xb>
ffff800000105ee0:	49 bb 4f 5b 00 00 00 	movabs $0x5b4f,%r11
ffff800000105ee7:	00 00 00 
ffff800000105eea:	4c 01 db             	add    %r11,%rbx
ffff800000105eed:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105ef1:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105ef5:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105efc:	00 
ffff800000105efd:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
ffff800000105f04:	00 
ffff800000105f05:	0f 20 d0             	mov    %cr2,%rax
ffff800000105f08:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff800000105f0c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105f10:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105f16:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105f1a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105f1e:	48 8b 08             	mov    (%rax),%rcx
ffff800000105f21:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105f25:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105f29:	49 89 c9             	mov    %rcx,%r9
ffff800000105f2c:	49 89 d0             	mov    %rdx,%r8
ffff800000105f2f:	48 89 c1             	mov    %rax,%rcx
ffff800000105f32:	48 b8 f8 14 00 00 00 	movabs $0x14f8,%rax
ffff800000105f39:	00 00 00 
ffff800000105f3c:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105f40:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105f45:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105f4a:	49 89 df             	mov    %rbx,%r15
ffff800000105f4d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105f52:	49 ba 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r10
ffff800000105f59:	ff ff ff 
ffff800000105f5c:	49 01 da             	add    %rbx,%r10
ffff800000105f5f:	41 ff d2             	callq  *%r10
ffff800000105f62:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105f66:	83 e0 01             	and    $0x1,%eax
ffff800000105f69:	48 85 c0             	test   %rax,%rax
ffff800000105f6c:	75 2f                	jne    ffff800000105f9d <do_page_fault+0xcf>
ffff800000105f6e:	48 b8 24 15 00 00 00 	movabs $0x1524,%rax
ffff800000105f75:	00 00 00 
ffff800000105f78:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105f7c:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105f81:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105f86:	49 89 df             	mov    %rbx,%r15
ffff800000105f89:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105f8e:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff800000105f95:	ff ff ff 
ffff800000105f98:	48 01 d9             	add    %rbx,%rcx
ffff800000105f9b:	ff d1                	callq  *%rcx
ffff800000105f9d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105fa1:	83 e0 02             	and    $0x2,%eax
ffff800000105fa4:	48 85 c0             	test   %rax,%rax
ffff800000105fa7:	74 31                	je     ffff800000105fda <do_page_fault+0x10c>
ffff800000105fa9:	48 b8 37 15 00 00 00 	movabs $0x1537,%rax
ffff800000105fb0:	00 00 00 
ffff800000105fb3:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105fb7:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105fbc:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105fc1:	49 89 df             	mov    %rbx,%r15
ffff800000105fc4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105fc9:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff800000105fd0:	ff ff ff 
ffff800000105fd3:	48 01 d9             	add    %rbx,%rcx
ffff800000105fd6:	ff d1                	callq  *%rcx
ffff800000105fd8:	eb 2f                	jmp    ffff800000106009 <do_page_fault+0x13b>
ffff800000105fda:	48 b8 4b 15 00 00 00 	movabs $0x154b,%rax
ffff800000105fe1:	00 00 00 
ffff800000105fe4:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105fe8:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105fed:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105ff2:	49 89 df             	mov    %rbx,%r15
ffff800000105ff5:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105ffa:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff800000106001:	ff ff ff 
ffff800000106004:	48 01 d9             	add    %rbx,%rcx
ffff800000106007:	ff d1                	callq  *%rcx
ffff800000106009:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010600d:	83 e0 04             	and    $0x4,%eax
ffff800000106010:	48 85 c0             	test   %rax,%rax
ffff800000106013:	74 31                	je     ffff800000106046 <do_page_fault+0x178>
ffff800000106015:	48 b8 5e 15 00 00 00 	movabs $0x155e,%rax
ffff80000010601c:	00 00 00 
ffff80000010601f:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106023:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106028:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010602d:	49 89 df             	mov    %rbx,%r15
ffff800000106030:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106035:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff80000010603c:	ff ff ff 
ffff80000010603f:	48 01 d9             	add    %rbx,%rcx
ffff800000106042:	ff d1                	callq  *%rcx
ffff800000106044:	eb 2f                	jmp    ffff800000106075 <do_page_fault+0x1a7>
ffff800000106046:	48 b8 70 15 00 00 00 	movabs $0x1570,%rax
ffff80000010604d:	00 00 00 
ffff800000106050:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106054:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106059:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010605e:	49 89 df             	mov    %rbx,%r15
ffff800000106061:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106066:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff80000010606d:	ff ff ff 
ffff800000106070:	48 01 d9             	add    %rbx,%rcx
ffff800000106073:	ff d1                	callq  *%rcx
ffff800000106075:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000106079:	83 e0 08             	and    $0x8,%eax
ffff80000010607c:	48 85 c0             	test   %rax,%rax
ffff80000010607f:	74 2f                	je     ffff8000001060b0 <do_page_fault+0x1e2>
ffff800000106081:	48 b8 8c 15 00 00 00 	movabs $0x158c,%rax
ffff800000106088:	00 00 00 
ffff80000010608b:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010608f:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106094:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106099:	49 89 df             	mov    %rbx,%r15
ffff80000010609c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001060a1:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff8000001060a8:	ff ff ff 
ffff8000001060ab:	48 01 d9             	add    %rbx,%rcx
ffff8000001060ae:	ff d1                	callq  *%rcx
ffff8000001060b0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001060b4:	83 e0 10             	and    $0x10,%eax
ffff8000001060b7:	48 85 c0             	test   %rax,%rax
ffff8000001060ba:	74 2f                	je     ffff8000001060eb <do_page_fault+0x21d>
ffff8000001060bc:	48 b8 a8 15 00 00 00 	movabs $0x15a8,%rax
ffff8000001060c3:	00 00 00 
ffff8000001060c6:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001060ca:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001060cf:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001060d4:	49 89 df             	mov    %rbx,%r15
ffff8000001060d7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001060dc:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff8000001060e3:	ff ff ff 
ffff8000001060e6:	48 01 d9             	add    %rbx,%rcx
ffff8000001060e9:	ff d1                	callq  *%rcx
ffff8000001060eb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001060ef:	48 89 c1             	mov    %rax,%rcx
ffff8000001060f2:	48 b8 c8 15 00 00 00 	movabs $0x15c8,%rax
ffff8000001060f9:	00 00 00 
ffff8000001060fc:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106100:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106105:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010610a:	49 89 df             	mov    %rbx,%r15
ffff80000010610d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106112:	49 b8 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r8
ffff800000106119:	ff ff ff 
ffff80000010611c:	49 01 d8             	add    %rbx,%r8
ffff80000010611f:	41 ff d0             	callq  *%r8
ffff800000106122:	eb fe                	jmp    ffff800000106122 <do_page_fault+0x254>

ffff800000106124 <do_x87_FPU_error>:
ffff800000106124:	55                   	push   %rbp
ffff800000106125:	48 89 e5             	mov    %rsp,%rbp
ffff800000106128:	41 57                	push   %r15
ffff80000010612a:	48 83 ec 28          	sub    $0x28,%rsp
ffff80000010612e:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff80000010612e <do_x87_FPU_error+0xa>
ffff800000106135:	49 bb fa 58 00 00 00 	movabs $0x58fa,%r11
ffff80000010613c:	00 00 00 
ffff80000010613f:	4d 01 da             	add    %r11,%r10
ffff800000106142:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000106146:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff80000010614a:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000106151:	00 
ffff800000106152:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000106156:	48 05 98 00 00 00    	add    $0x98,%rax
ffff80000010615c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000106160:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106164:	48 8b 08             	mov    (%rax),%rcx
ffff800000106167:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff80000010616b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010616f:	49 89 c9             	mov    %rcx,%r9
ffff800000106172:	49 89 d0             	mov    %rdx,%r8
ffff800000106175:	48 89 c1             	mov    %rax,%rcx
ffff800000106178:	48 b8 d0 15 00 00 00 	movabs $0x15d0,%rax
ffff80000010617f:	00 00 00 
ffff800000106182:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000106186:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010618b:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106190:	4d 89 d7             	mov    %r10,%r15
ffff800000106193:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106198:	49 bb 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r11
ffff80000010619f:	ff ff ff 
ffff8000001061a2:	4d 01 d3             	add    %r10,%r11
ffff8000001061a5:	41 ff d3             	callq  *%r11
ffff8000001061a8:	eb fe                	jmp    ffff8000001061a8 <do_x87_FPU_error+0x84>

ffff8000001061aa <do_alignment_check>:
ffff8000001061aa:	55                   	push   %rbp
ffff8000001061ab:	48 89 e5             	mov    %rsp,%rbp
ffff8000001061ae:	41 57                	push   %r15
ffff8000001061b0:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001061b4:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001061b4 <do_alignment_check+0xa>
ffff8000001061bb:	49 bb 74 58 00 00 00 	movabs $0x5874,%r11
ffff8000001061c2:	00 00 00 
ffff8000001061c5:	4d 01 da             	add    %r11,%r10
ffff8000001061c8:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001061cc:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001061d0:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001061d7:	00 
ffff8000001061d8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001061dc:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001061e2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001061e6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001061ea:	48 8b 08             	mov    (%rax),%rcx
ffff8000001061ed:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001061f1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001061f5:	49 89 c9             	mov    %rcx,%r9
ffff8000001061f8:	49 89 d0             	mov    %rdx,%r8
ffff8000001061fb:	48 89 c1             	mov    %rax,%rcx
ffff8000001061fe:	48 b8 20 16 00 00 00 	movabs $0x1620,%rax
ffff800000106205:	00 00 00 
ffff800000106208:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff80000010620c:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106211:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106216:	4d 89 d7             	mov    %r10,%r15
ffff800000106219:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010621e:	49 bb 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r11
ffff800000106225:	ff ff ff 
ffff800000106228:	4d 01 d3             	add    %r10,%r11
ffff80000010622b:	41 ff d3             	callq  *%r11
ffff80000010622e:	eb fe                	jmp    ffff80000010622e <do_alignment_check+0x84>

ffff800000106230 <do_machine_check>:
ffff800000106230:	55                   	push   %rbp
ffff800000106231:	48 89 e5             	mov    %rsp,%rbp
ffff800000106234:	41 57                	push   %r15
ffff800000106236:	48 83 ec 28          	sub    $0x28,%rsp
ffff80000010623a:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff80000010623a <do_machine_check+0xa>
ffff800000106241:	49 bb ee 57 00 00 00 	movabs $0x57ee,%r11
ffff800000106248:	00 00 00 
ffff80000010624b:	4d 01 da             	add    %r11,%r10
ffff80000010624e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000106252:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000106256:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff80000010625d:	00 
ffff80000010625e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000106262:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000106268:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff80000010626c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106270:	48 8b 08             	mov    (%rax),%rcx
ffff800000106273:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000106277:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010627b:	49 89 c9             	mov    %rcx,%r9
ffff80000010627e:	49 89 d0             	mov    %rdx,%r8
ffff800000106281:	48 89 c1             	mov    %rax,%rcx
ffff800000106284:	48 b8 58 16 00 00 00 	movabs $0x1658,%rax
ffff80000010628b:	00 00 00 
ffff80000010628e:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000106292:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106297:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010629c:	4d 89 d7             	mov    %r10,%r15
ffff80000010629f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001062a4:	49 bb 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r11
ffff8000001062ab:	ff ff ff 
ffff8000001062ae:	4d 01 d3             	add    %r10,%r11
ffff8000001062b1:	41 ff d3             	callq  *%r11
ffff8000001062b4:	eb fe                	jmp    ffff8000001062b4 <do_machine_check+0x84>

ffff8000001062b6 <do_SIMD_exception>:
ffff8000001062b6:	55                   	push   %rbp
ffff8000001062b7:	48 89 e5             	mov    %rsp,%rbp
ffff8000001062ba:	41 57                	push   %r15
ffff8000001062bc:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001062c0:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001062c0 <do_SIMD_exception+0xa>
ffff8000001062c7:	49 bb 68 57 00 00 00 	movabs $0x5768,%r11
ffff8000001062ce:	00 00 00 
ffff8000001062d1:	4d 01 da             	add    %r11,%r10
ffff8000001062d4:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001062d8:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001062dc:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001062e3:	00 
ffff8000001062e4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001062e8:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001062ee:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001062f2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001062f6:	48 8b 08             	mov    (%rax),%rcx
ffff8000001062f9:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001062fd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000106301:	49 89 c9             	mov    %rcx,%r9
ffff800000106304:	49 89 d0             	mov    %rdx,%r8
ffff800000106307:	48 89 c1             	mov    %rax,%rcx
ffff80000010630a:	48 b8 88 16 00 00 00 	movabs $0x1688,%rax
ffff800000106311:	00 00 00 
ffff800000106314:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000106318:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010631d:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106322:	4d 89 d7             	mov    %r10,%r15
ffff800000106325:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010632a:	49 bb 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r11
ffff800000106331:	ff ff ff 
ffff800000106334:	4d 01 d3             	add    %r10,%r11
ffff800000106337:	41 ff d3             	callq  *%r11
ffff80000010633a:	eb fe                	jmp    ffff80000010633a <do_SIMD_exception+0x84>

ffff80000010633c <do_virtualization_exception>:
ffff80000010633c:	55                   	push   %rbp
ffff80000010633d:	48 89 e5             	mov    %rsp,%rbp
ffff800000106340:	41 57                	push   %r15
ffff800000106342:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000106346:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff800000106346 <do_virtualization_exception+0xa>
ffff80000010634d:	49 bb e2 56 00 00 00 	movabs $0x56e2,%r11
ffff800000106354:	00 00 00 
ffff800000106357:	4d 01 da             	add    %r11,%r10
ffff80000010635a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff80000010635e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000106362:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000106369:	00 
ffff80000010636a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010636e:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000106374:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000106378:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010637c:	48 8b 08             	mov    (%rax),%rcx
ffff80000010637f:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000106383:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000106387:	49 89 c9             	mov    %rcx,%r9
ffff80000010638a:	49 89 d0             	mov    %rdx,%r8
ffff80000010638d:	48 89 c1             	mov    %rax,%rcx
ffff800000106390:	48 b8 d0 16 00 00 00 	movabs $0x16d0,%rax
ffff800000106397:	00 00 00 
ffff80000010639a:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff80000010639e:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001063a3:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001063a8:	4d 89 d7             	mov    %r10,%r15
ffff8000001063ab:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001063b0:	49 bb 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r11
ffff8000001063b7:	ff ff ff 
ffff8000001063ba:	4d 01 d3             	add    %r10,%r11
ffff8000001063bd:	41 ff d3             	callq  *%r11
ffff8000001063c0:	eb fe                	jmp    ffff8000001063c0 <do_virtualization_exception+0x84>

ffff8000001063c2 <set_sys_int>:
ffff8000001063c2:	55                   	push   %rbp
ffff8000001063c3:	48 89 e5             	mov    %rsp,%rbp
ffff8000001063c6:	41 57                	push   %r15
ffff8000001063c8:	53                   	push   %rbx
ffff8000001063c9:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff8000001063c9 <set_sys_int+0x7>
ffff8000001063d0:	49 bb 5f 56 00 00 00 	movabs $0x565f,%r11
ffff8000001063d7:	00 00 00 
ffff8000001063da:	4c 01 db             	add    %r11,%rbx
ffff8000001063dd:	48 b8 00 ff ff ff ff 	movabs $0xffffffffffffff00,%rax
ffff8000001063e4:	ff ff ff 
ffff8000001063e7:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001063eb:	48 89 c2             	mov    %rax,%rdx
ffff8000001063ee:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001063f3:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001063f8:	49 89 df             	mov    %rbx,%r15
ffff8000001063fb:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106400:	48 b9 4c 89 ff ff ff 	movabs $0xffffffffffff894c,%rcx
ffff800000106407:	ff ff ff 
ffff80000010640a:	48 01 d9             	add    %rbx,%rcx
ffff80000010640d:	ff d1                	callq  *%rcx
ffff80000010640f:	48 b8 30 ff ff ff ff 	movabs $0xffffffffffffff30,%rax
ffff800000106416:	ff ff ff 
ffff800000106419:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010641d:	48 89 c2             	mov    %rax,%rdx
ffff800000106420:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106425:	bf 01 00 00 00       	mov    $0x1,%edi
ffff80000010642a:	49 89 df             	mov    %rbx,%r15
ffff80000010642d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106432:	48 b9 4c 89 ff ff ff 	movabs $0xffffffffffff894c,%rcx
ffff800000106439:	ff ff ff 
ffff80000010643c:	48 01 d9             	add    %rbx,%rcx
ffff80000010643f:	ff d1                	callq  *%rcx
ffff800000106441:	48 b8 e8 ff ff ff ff 	movabs $0xffffffffffffffe8,%rax
ffff800000106448:	ff ff ff 
ffff80000010644b:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010644f:	48 89 c2             	mov    %rax,%rdx
ffff800000106452:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106457:	bf 02 00 00 00       	mov    $0x2,%edi
ffff80000010645c:	49 89 df             	mov    %rbx,%r15
ffff80000010645f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106464:	48 b9 f9 88 ff ff ff 	movabs $0xffffffffffff88f9,%rcx
ffff80000010646b:	ff ff ff 
ffff80000010646e:	48 01 d9             	add    %rbx,%rcx
ffff800000106471:	ff d1                	callq  *%rcx
ffff800000106473:	48 b8 60 ff ff ff ff 	movabs $0xffffffffffffff60,%rax
ffff80000010647a:	ff ff ff 
ffff80000010647d:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106481:	48 89 c2             	mov    %rax,%rdx
ffff800000106484:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106489:	bf 03 00 00 00       	mov    $0x3,%edi
ffff80000010648e:	49 89 df             	mov    %rbx,%r15
ffff800000106491:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106496:	48 b9 9f 89 ff ff ff 	movabs $0xffffffffffff899f,%rcx
ffff80000010649d:	ff ff ff 
ffff8000001064a0:	48 01 d9             	add    %rbx,%rcx
ffff8000001064a3:	ff d1                	callq  *%rcx
ffff8000001064a5:	48 b8 28 ff ff ff ff 	movabs $0xffffffffffffff28,%rax
ffff8000001064ac:	ff ff ff 
ffff8000001064af:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001064b3:	48 89 c2             	mov    %rax,%rdx
ffff8000001064b6:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001064bb:	bf 04 00 00 00       	mov    $0x4,%edi
ffff8000001064c0:	49 89 df             	mov    %rbx,%r15
ffff8000001064c3:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001064c8:	48 b9 9f 89 ff ff ff 	movabs $0xffffffffffff899f,%rcx
ffff8000001064cf:	ff ff ff 
ffff8000001064d2:	48 01 d9             	add    %rbx,%rcx
ffff8000001064d5:	ff d1                	callq  *%rcx
ffff8000001064d7:	48 b8 38 ff ff ff ff 	movabs $0xffffffffffffff38,%rax
ffff8000001064de:	ff ff ff 
ffff8000001064e1:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001064e5:	48 89 c2             	mov    %rax,%rdx
ffff8000001064e8:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001064ed:	bf 05 00 00 00       	mov    $0x5,%edi
ffff8000001064f2:	49 89 df             	mov    %rbx,%r15
ffff8000001064f5:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001064fa:	48 b9 9f 89 ff ff ff 	movabs $0xffffffffffff899f,%rcx
ffff800000106501:	ff ff ff 
ffff800000106504:	48 01 d9             	add    %rbx,%rcx
ffff800000106507:	ff d1                	callq  *%rcx
ffff800000106509:	48 b8 68 ff ff ff ff 	movabs $0xffffffffffffff68,%rax
ffff800000106510:	ff ff ff 
ffff800000106513:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106517:	48 89 c2             	mov    %rax,%rdx
ffff80000010651a:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010651f:	bf 06 00 00 00       	mov    $0x6,%edi
ffff800000106524:	49 89 df             	mov    %rbx,%r15
ffff800000106527:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010652c:	48 b9 4c 89 ff ff ff 	movabs $0xffffffffffff894c,%rcx
ffff800000106533:	ff ff ff 
ffff800000106536:	48 01 d9             	add    %rbx,%rcx
ffff800000106539:	ff d1                	callq  *%rcx
ffff80000010653b:	48 b8 f0 ff ff ff ff 	movabs $0xfffffffffffffff0,%rax
ffff800000106542:	ff ff ff 
ffff800000106545:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106549:	48 89 c2             	mov    %rax,%rdx
ffff80000010654c:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106551:	bf 07 00 00 00       	mov    $0x7,%edi
ffff800000106556:	49 89 df             	mov    %rbx,%r15
ffff800000106559:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010655e:	48 b9 4c 89 ff ff ff 	movabs $0xffffffffffff894c,%rcx
ffff800000106565:	ff ff ff 
ffff800000106568:	48 01 d9             	add    %rbx,%rcx
ffff80000010656b:	ff d1                	callq  *%rcx
ffff80000010656d:	48 b8 88 ff ff ff ff 	movabs $0xffffffffffffff88,%rax
ffff800000106574:	ff ff ff 
ffff800000106577:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010657b:	48 89 c2             	mov    %rax,%rdx
ffff80000010657e:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106583:	bf 08 00 00 00       	mov    $0x8,%edi
ffff800000106588:	49 89 df             	mov    %rbx,%r15
ffff80000010658b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106590:	48 b9 4c 89 ff ff ff 	movabs $0xffffffffffff894c,%rcx
ffff800000106597:	ff ff ff 
ffff80000010659a:	48 01 d9             	add    %rbx,%rcx
ffff80000010659d:	ff d1                	callq  *%rcx
ffff80000010659f:	48 b8 a8 ff ff ff ff 	movabs $0xffffffffffffffa8,%rax
ffff8000001065a6:	ff ff ff 
ffff8000001065a9:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001065ad:	48 89 c2             	mov    %rax,%rdx
ffff8000001065b0:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001065b5:	bf 09 00 00 00       	mov    $0x9,%edi
ffff8000001065ba:	49 89 df             	mov    %rbx,%r15
ffff8000001065bd:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001065c2:	48 b9 4c 89 ff ff ff 	movabs $0xffffffffffff894c,%rcx
ffff8000001065c9:	ff ff ff 
ffff8000001065cc:	48 01 d9             	add    %rbx,%rcx
ffff8000001065cf:	ff d1                	callq  *%rcx
ffff8000001065d1:	48 b8 40 ff ff ff ff 	movabs $0xffffffffffffff40,%rax
ffff8000001065d8:	ff ff ff 
ffff8000001065db:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001065df:	48 89 c2             	mov    %rax,%rdx
ffff8000001065e2:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001065e7:	bf 0a 00 00 00       	mov    $0xa,%edi
ffff8000001065ec:	49 89 df             	mov    %rbx,%r15
ffff8000001065ef:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001065f4:	48 b9 4c 89 ff ff ff 	movabs $0xffffffffffff894c,%rcx
ffff8000001065fb:	ff ff ff 
ffff8000001065fe:	48 01 d9             	add    %rbx,%rcx
ffff800000106601:	ff d1                	callq  *%rcx
ffff800000106603:	48 b8 48 ff ff ff ff 	movabs $0xffffffffffffff48,%rax
ffff80000010660a:	ff ff ff 
ffff80000010660d:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106611:	48 89 c2             	mov    %rax,%rdx
ffff800000106614:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106619:	bf 0b 00 00 00       	mov    $0xb,%edi
ffff80000010661e:	49 89 df             	mov    %rbx,%r15
ffff800000106621:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106626:	48 b9 4c 89 ff ff ff 	movabs $0xffffffffffff894c,%rcx
ffff80000010662d:	ff ff ff 
ffff800000106630:	48 01 d9             	add    %rbx,%rcx
ffff800000106633:	ff d1                	callq  *%rcx
ffff800000106635:	48 b8 50 ff ff ff ff 	movabs $0xffffffffffffff50,%rax
ffff80000010663c:	ff ff ff 
ffff80000010663f:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106643:	48 89 c2             	mov    %rax,%rdx
ffff800000106646:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010664b:	bf 0c 00 00 00       	mov    $0xc,%edi
ffff800000106650:	49 89 df             	mov    %rbx,%r15
ffff800000106653:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106658:	48 b9 4c 89 ff ff ff 	movabs $0xffffffffffff894c,%rcx
ffff80000010665f:	ff ff ff 
ffff800000106662:	48 01 d9             	add    %rbx,%rcx
ffff800000106665:	ff d1                	callq  *%rcx
ffff800000106667:	48 b8 18 ff ff ff ff 	movabs $0xffffffffffffff18,%rax
ffff80000010666e:	ff ff ff 
ffff800000106671:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106675:	48 89 c2             	mov    %rax,%rdx
ffff800000106678:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010667d:	bf 0d 00 00 00       	mov    $0xd,%edi
ffff800000106682:	49 89 df             	mov    %rbx,%r15
ffff800000106685:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010668a:	48 b9 4c 89 ff ff ff 	movabs $0xffffffffffff894c,%rcx
ffff800000106691:	ff ff ff 
ffff800000106694:	48 01 d9             	add    %rbx,%rcx
ffff800000106697:	ff d1                	callq  *%rcx
ffff800000106699:	48 b8 b8 ff ff ff ff 	movabs $0xffffffffffffffb8,%rax
ffff8000001066a0:	ff ff ff 
ffff8000001066a3:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001066a7:	48 89 c2             	mov    %rax,%rdx
ffff8000001066aa:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001066af:	bf 0e 00 00 00       	mov    $0xe,%edi
ffff8000001066b4:	49 89 df             	mov    %rbx,%r15
ffff8000001066b7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001066bc:	48 b9 4c 89 ff ff ff 	movabs $0xffffffffffff894c,%rcx
ffff8000001066c3:	ff ff ff 
ffff8000001066c6:	48 01 d9             	add    %rbx,%rcx
ffff8000001066c9:	ff d1                	callq  *%rcx
ffff8000001066cb:	48 b8 80 ff ff ff ff 	movabs $0xffffffffffffff80,%rax
ffff8000001066d2:	ff ff ff 
ffff8000001066d5:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001066d9:	48 89 c2             	mov    %rax,%rdx
ffff8000001066dc:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001066e1:	bf 10 00 00 00       	mov    $0x10,%edi
ffff8000001066e6:	49 89 df             	mov    %rbx,%r15
ffff8000001066e9:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001066ee:	48 b9 4c 89 ff ff ff 	movabs $0xffffffffffff894c,%rcx
ffff8000001066f5:	ff ff ff 
ffff8000001066f8:	48 01 d9             	add    %rbx,%rcx
ffff8000001066fb:	ff d1                	callq  *%rcx
ffff8000001066fd:	48 b8 78 ff ff ff ff 	movabs $0xffffffffffffff78,%rax
ffff800000106704:	ff ff ff 
ffff800000106707:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010670b:	48 89 c2             	mov    %rax,%rdx
ffff80000010670e:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106713:	bf 11 00 00 00       	mov    $0x11,%edi
ffff800000106718:	49 89 df             	mov    %rbx,%r15
ffff80000010671b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106720:	48 b9 4c 89 ff ff ff 	movabs $0xffffffffffff894c,%rcx
ffff800000106727:	ff ff ff 
ffff80000010672a:	48 01 d9             	add    %rbx,%rcx
ffff80000010672d:	ff d1                	callq  *%rcx
ffff80000010672f:	48 b8 c8 ff ff ff ff 	movabs $0xffffffffffffffc8,%rax
ffff800000106736:	ff ff ff 
ffff800000106739:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010673d:	48 89 c2             	mov    %rax,%rdx
ffff800000106740:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106745:	bf 12 00 00 00       	mov    $0x12,%edi
ffff80000010674a:	49 89 df             	mov    %rbx,%r15
ffff80000010674d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106752:	48 b9 4c 89 ff ff ff 	movabs $0xffffffffffff894c,%rcx
ffff800000106759:	ff ff ff 
ffff80000010675c:	48 01 d9             	add    %rbx,%rcx
ffff80000010675f:	ff d1                	callq  *%rcx
ffff800000106761:	48 b8 d8 ff ff ff ff 	movabs $0xffffffffffffffd8,%rax
ffff800000106768:	ff ff ff 
ffff80000010676b:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010676f:	48 89 c2             	mov    %rax,%rdx
ffff800000106772:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106777:	bf 13 00 00 00       	mov    $0x13,%edi
ffff80000010677c:	49 89 df             	mov    %rbx,%r15
ffff80000010677f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106784:	48 b9 4c 89 ff ff ff 	movabs $0xffffffffffff894c,%rcx
ffff80000010678b:	ff ff ff 
ffff80000010678e:	48 01 d9             	add    %rbx,%rcx
ffff800000106791:	ff d1                	callq  *%rcx
ffff800000106793:	48 b8 98 ff ff ff ff 	movabs $0xffffffffffffff98,%rax
ffff80000010679a:	ff ff ff 
ffff80000010679d:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001067a1:	48 89 c2             	mov    %rax,%rdx
ffff8000001067a4:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001067a9:	bf 14 00 00 00       	mov    $0x14,%edi
ffff8000001067ae:	49 89 df             	mov    %rbx,%r15
ffff8000001067b1:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001067b6:	48 b9 4c 89 ff ff ff 	movabs $0xffffffffffff894c,%rcx
ffff8000001067bd:	ff ff ff 
ffff8000001067c0:	48 01 d9             	add    %rbx,%rcx
ffff8000001067c3:	ff d1                	callq  *%rcx
ffff8000001067c5:	90                   	nop
ffff8000001067c6:	5b                   	pop    %rbx
ffff8000001067c7:	41 5f                	pop    %r15
ffff8000001067c9:	5d                   	pop    %rbp
ffff8000001067ca:	c3                   	retq   

ffff8000001067cb <page_init>:
ffff8000001067cb:	55                   	push   %rbp
ffff8000001067cc:	48 89 e5             	mov    %rsp,%rbp
ffff8000001067cf:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff8000001067cf <page_init+0x4>
ffff8000001067d6:	49 bb 59 52 00 00 00 	movabs $0x5259,%r11
ffff8000001067dd:	00 00 00 
ffff8000001067e0:	4c 01 d8             	add    %r11,%rax
ffff8000001067e3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff8000001067e7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff8000001067eb:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff8000001067ef:	48 8b 52 10          	mov    0x10(%rdx),%rdx
ffff8000001067f3:	48 85 d2             	test   %rdx,%rdx
ffff8000001067f6:	0f 85 d6 00 00 00    	jne    ffff8000001068d2 <page_init+0x107>
ffff8000001067fc:	48 ba d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rdx
ffff800000106803:	ff ff ff 
ffff800000106806:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff80000010680a:	48 8b 8a 88 02 00 00 	mov    0x288(%rdx),%rcx
ffff800000106811:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000106815:	48 8b 52 08          	mov    0x8(%rdx),%rdx
ffff800000106819:	48 c1 ea 1b          	shr    $0x1b,%rdx
ffff80000010681d:	48 c1 e2 03          	shl    $0x3,%rdx
ffff800000106821:	48 01 ca             	add    %rcx,%rdx
ffff800000106824:	48 8b 32             	mov    (%rdx),%rsi
ffff800000106827:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff80000010682b:	48 8b 52 08          	mov    0x8(%rdx),%rdx
ffff80000010682f:	48 c1 ea 15          	shr    $0x15,%rdx
ffff800000106833:	83 e2 3f             	and    $0x3f,%edx
ffff800000106836:	bf 01 00 00 00       	mov    $0x1,%edi
ffff80000010683b:	89 d1                	mov    %edx,%ecx
ffff80000010683d:	48 d3 e7             	shl    %cl,%rdi
ffff800000106840:	48 89 f9             	mov    %rdi,%rcx
ffff800000106843:	48 ba d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rdx
ffff80000010684a:	ff ff ff 
ffff80000010684d:	48 8b 04 10          	mov    (%rax,%rdx,1),%rax
ffff800000106851:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000106858:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010685c:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106860:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000106864:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106868:	48 01 d0             	add    %rdx,%rax
ffff80000010686b:	48 09 ce             	or     %rcx,%rsi
ffff80000010686e:	48 89 f2             	mov    %rsi,%rdx
ffff800000106871:	48 89 10             	mov    %rdx,(%rax)
ffff800000106874:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106878:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff80000010687c:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000106880:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106884:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000106888:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff80000010688c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106890:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff800000106894:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106898:	48 8b 00             	mov    (%rax),%rax
ffff80000010689b:	48 8b 50 38          	mov    0x38(%rax),%rdx
ffff80000010689f:	48 83 c2 01          	add    $0x1,%rdx
ffff8000001068a3:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff8000001068a7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001068ab:	48 8b 00             	mov    (%rax),%rax
ffff8000001068ae:	48 8b 50 40          	mov    0x40(%rax),%rdx
ffff8000001068b2:	48 83 ea 01          	sub    $0x1,%rdx
ffff8000001068b6:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff8000001068ba:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001068be:	48 8b 00             	mov    (%rax),%rax
ffff8000001068c1:	48 8b 50 48          	mov    0x48(%rax),%rdx
ffff8000001068c5:	48 83 c2 01          	add    $0x1,%rdx
ffff8000001068c9:	48 89 50 48          	mov    %rdx,0x48(%rax)
ffff8000001068cd:	e9 df 00 00 00       	jmpq   ffff8000001069b1 <page_init+0x1e6>
ffff8000001068d2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff8000001068d6:	48 8b 52 10          	mov    0x10(%rdx),%rdx
ffff8000001068da:	83 e2 04             	and    $0x4,%edx
ffff8000001068dd:	48 85 d2             	test   %rdx,%rdx
ffff8000001068e0:	75 2e                	jne    ffff800000106910 <page_init+0x145>
ffff8000001068e2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff8000001068e6:	48 8b 52 10          	mov    0x10(%rdx),%rdx
ffff8000001068ea:	81 e2 00 01 00 00    	and    $0x100,%edx
ffff8000001068f0:	48 85 d2             	test   %rdx,%rdx
ffff8000001068f3:	75 1b                	jne    ffff800000106910 <page_init+0x145>
ffff8000001068f5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff8000001068f9:	83 e2 04             	and    $0x4,%edx
ffff8000001068fc:	48 85 d2             	test   %rdx,%rdx
ffff8000001068ff:	75 0f                	jne    ffff800000106910 <page_init+0x145>
ffff800000106901:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000106905:	81 e2 00 01 00 00    	and    $0x100,%edx
ffff80000010690b:	48 85 d2             	test   %rdx,%rdx
ffff80000010690e:	74 29                	je     ffff800000106939 <page_init+0x16e>
ffff800000106910:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106914:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000106918:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff80000010691c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106920:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff800000106924:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106928:	48 8b 00             	mov    (%rax),%rax
ffff80000010692b:	48 8b 50 48          	mov    0x48(%rax),%rdx
ffff80000010692f:	48 83 c2 01          	add    $0x1,%rdx
ffff800000106933:	48 89 50 48          	mov    %rdx,0x48(%rax)
ffff800000106937:	eb 78                	jmp    ffff8000001069b1 <page_init+0x1e6>
ffff800000106939:	48 ba d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rdx
ffff800000106940:	ff ff ff 
ffff800000106943:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000106947:	48 8b 8a 88 02 00 00 	mov    0x288(%rdx),%rcx
ffff80000010694e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000106952:	48 8b 52 08          	mov    0x8(%rdx),%rdx
ffff800000106956:	48 c1 ea 1b          	shr    $0x1b,%rdx
ffff80000010695a:	48 c1 e2 03          	shl    $0x3,%rdx
ffff80000010695e:	48 01 ca             	add    %rcx,%rdx
ffff800000106961:	48 8b 32             	mov    (%rdx),%rsi
ffff800000106964:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000106968:	48 8b 52 08          	mov    0x8(%rdx),%rdx
ffff80000010696c:	48 c1 ea 15          	shr    $0x15,%rdx
ffff800000106970:	83 e2 3f             	and    $0x3f,%edx
ffff800000106973:	bf 01 00 00 00       	mov    $0x1,%edi
ffff800000106978:	89 d1                	mov    %edx,%ecx
ffff80000010697a:	48 d3 e7             	shl    %cl,%rdi
ffff80000010697d:	48 89 f9             	mov    %rdi,%rcx
ffff800000106980:	48 ba d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rdx
ffff800000106987:	ff ff ff 
ffff80000010698a:	48 8b 04 10          	mov    (%rax,%rdx,1),%rax
ffff80000010698e:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000106995:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106999:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff80000010699d:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff8000001069a1:	48 c1 e0 03          	shl    $0x3,%rax
ffff8000001069a5:	48 01 d0             	add    %rdx,%rax
ffff8000001069a8:	48 09 ce             	or     %rcx,%rsi
ffff8000001069ab:	48 89 f2             	mov    %rsi,%rdx
ffff8000001069ae:	48 89 10             	mov    %rdx,(%rax)
ffff8000001069b1:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001069b6:	5d                   	pop    %rbp
ffff8000001069b7:	c3                   	retq   

ffff8000001069b8 <init_mem>:
ffff8000001069b8:	55                   	push   %rbp
ffff8000001069b9:	48 89 e5             	mov    %rsp,%rbp
ffff8000001069bc:	41 57                	push   %r15
ffff8000001069be:	53                   	push   %rbx
ffff8000001069bf:	48 83 ec 70          	sub    $0x70,%rsp
ffff8000001069c3:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff8000001069c3 <init_mem+0xb>
ffff8000001069ca:	49 bb 65 50 00 00 00 	movabs $0x5065,%r11
ffff8000001069d1:	00 00 00 
ffff8000001069d4:	4c 01 db             	add    %r11,%rbx
ffff8000001069d7:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001069de:	00 
ffff8000001069df:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
ffff8000001069e6:	00 
ffff8000001069e7:	48 b8 10 17 00 00 00 	movabs $0x1710,%rax
ffff8000001069ee:	00 00 00 
ffff8000001069f1:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001069f5:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001069fa:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff8000001069ff:	49 89 df             	mov    %rbx,%r15
ffff800000106a02:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106a07:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff800000106a0e:	ff ff ff 
ffff800000106a11:	48 01 d9             	add    %rbx,%rcx
ffff800000106a14:	ff d1                	callq  *%rcx
ffff800000106a16:	48 b8 00 7e 00 00 00 	movabs $0xffff800000007e00,%rax
ffff800000106a1d:	80 ff ff 
ffff800000106a20:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff800000106a24:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
ffff800000106a2b:	e9 a0 01 00 00       	jmpq   ffff800000106bd0 <init_mem+0x218>
ffff800000106a30:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106a34:	8b 48 10             	mov    0x10(%rax),%ecx
ffff800000106a37:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106a3b:	48 8b 50 08          	mov    0x8(%rax),%rdx
ffff800000106a3f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106a43:	48 8b 00             	mov    (%rax),%rax
ffff800000106a46:	41 89 c9             	mov    %ecx,%r9d
ffff800000106a49:	49 89 d0             	mov    %rdx,%r8
ffff800000106a4c:	48 89 c1             	mov    %rax,%rcx
ffff800000106a4f:	48 b8 35 17 00 00 00 	movabs $0x1735,%rax
ffff800000106a56:	00 00 00 
ffff800000106a59:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106a5d:	be 00 ff 00 00       	mov    $0xff00,%esi
ffff800000106a62:	bf ff 00 00 00       	mov    $0xff,%edi
ffff800000106a67:	49 89 df             	mov    %rbx,%r15
ffff800000106a6a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106a6f:	49 ba 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r10
ffff800000106a76:	ff ff ff 
ffff800000106a79:	49 01 da             	add    %rbx,%r10
ffff800000106a7c:	41 ff d2             	callq  *%r10
ffff800000106a7f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106a83:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000106a86:	83 f8 01             	cmp    $0x1,%eax
ffff800000106a89:	75 0c                	jne    ffff800000106a97 <init_mem+0xdf>
ffff800000106a8b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106a8f:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106a93:	48 01 45 e8          	add    %rax,-0x18(%rbp)
ffff800000106a97:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106a9e:	ff ff ff 
ffff800000106aa1:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000106aa5:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000106aa8:	48 63 d0             	movslq %eax,%rdx
ffff800000106aab:	48 89 d0             	mov    %rdx,%rax
ffff800000106aae:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106ab2:	48 01 d0             	add    %rdx,%rax
ffff800000106ab5:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106ab9:	48 01 c8             	add    %rcx,%rax
ffff800000106abc:	48 8b 10             	mov    (%rax),%rdx
ffff800000106abf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106ac3:	48 8b 00             	mov    (%rax),%rax
ffff800000106ac6:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
ffff800000106aca:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106ad1:	ff ff ff 
ffff800000106ad4:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000106ad8:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000106adb:	48 63 d0             	movslq %eax,%rdx
ffff800000106ade:	48 89 d0             	mov    %rdx,%rax
ffff800000106ae1:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106ae5:	48 01 d0             	add    %rdx,%rax
ffff800000106ae8:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106aec:	48 01 f0             	add    %rsi,%rax
ffff800000106aef:	48 89 08             	mov    %rcx,(%rax)
ffff800000106af2:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106af9:	ff ff ff 
ffff800000106afc:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000106b00:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000106b03:	48 63 d0             	movslq %eax,%rdx
ffff800000106b06:	48 89 d0             	mov    %rdx,%rax
ffff800000106b09:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106b0d:	48 01 d0             	add    %rdx,%rax
ffff800000106b10:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106b14:	48 01 c8             	add    %rcx,%rax
ffff800000106b17:	48 83 c0 08          	add    $0x8,%rax
ffff800000106b1b:	48 8b 10             	mov    (%rax),%rdx
ffff800000106b1e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106b22:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106b26:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
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
ffff800000106b4f:	48 83 c0 08          	add    $0x8,%rax
ffff800000106b53:	48 89 08             	mov    %rcx,(%rax)
ffff800000106b56:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106b5a:	8b 48 10             	mov    0x10(%rax),%ecx
ffff800000106b5d:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106b64:	ff ff ff 
ffff800000106b67:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000106b6b:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000106b6e:	48 63 d0             	movslq %eax,%rdx
ffff800000106b71:	48 89 d0             	mov    %rdx,%rax
ffff800000106b74:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106b78:	48 01 d0             	add    %rdx,%rax
ffff800000106b7b:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106b7f:	48 01 f0             	add    %rsi,%rax
ffff800000106b82:	48 83 c0 10          	add    $0x10,%rax
ffff800000106b86:	89 08                	mov    %ecx,(%rax)
ffff800000106b88:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000106b8b:	48 63 d0             	movslq %eax,%rdx
ffff800000106b8e:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106b95:	ff ff ff 
ffff800000106b98:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106b9c:	48 89 90 80 02 00 00 	mov    %rdx,0x280(%rax)
ffff800000106ba3:	48 83 45 e0 14       	addq   $0x14,-0x20(%rbp)
ffff800000106ba8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106bac:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000106baf:	83 f8 04             	cmp    $0x4,%eax
ffff800000106bb2:	77 26                	ja     ffff800000106bda <init_mem+0x222>
ffff800000106bb4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106bb8:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106bbc:	48 85 c0             	test   %rax,%rax
ffff800000106bbf:	74 19                	je     ffff800000106bda <init_mem+0x222>
ffff800000106bc1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106bc5:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000106bc8:	85 c0                	test   %eax,%eax
ffff800000106bca:	74 0e                	je     ffff800000106bda <init_mem+0x222>
ffff800000106bcc:	83 45 dc 01          	addl   $0x1,-0x24(%rbp)
ffff800000106bd0:	83 7d dc 1f          	cmpl   $0x1f,-0x24(%rbp)
ffff800000106bd4:	0f 8e 56 fe ff ff    	jle    ffff800000106a30 <init_mem+0x78>
ffff800000106bda:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106bde:	48 89 c1             	mov    %rax,%rcx
ffff800000106be1:	48 b8 53 17 00 00 00 	movabs $0x1753,%rax
ffff800000106be8:	00 00 00 
ffff800000106beb:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106bef:	be ff 00 80 00       	mov    $0x8000ff,%esi
ffff800000106bf4:	bf 00 ff ff 00       	mov    $0xffff00,%edi
ffff800000106bf9:	49 89 df             	mov    %rbx,%r15
ffff800000106bfc:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106c01:	49 b8 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r8
ffff800000106c08:	ff ff ff 
ffff800000106c0b:	49 01 d8             	add    %rbx,%r8
ffff800000106c0e:	41 ff d0             	callq  *%r8
ffff800000106c11:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000106c18:	00 
ffff800000106c19:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
ffff800000106c20:	e9 f1 00 00 00       	jmpq   ffff800000106d16 <init_mem+0x35e>
ffff800000106c25:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106c2c:	ff ff ff 
ffff800000106c2f:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000106c33:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000106c36:	48 63 d0             	movslq %eax,%rdx
ffff800000106c39:	48 89 d0             	mov    %rdx,%rax
ffff800000106c3c:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106c40:	48 01 d0             	add    %rdx,%rax
ffff800000106c43:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106c47:	48 01 c8             	add    %rcx,%rax
ffff800000106c4a:	48 83 c0 10          	add    $0x10,%rax
ffff800000106c4e:	8b 00                	mov    (%rax),%eax
ffff800000106c50:	83 f8 01             	cmp    $0x1,%eax
ffff800000106c53:	0f 85 b5 00 00 00    	jne    ffff800000106d0e <init_mem+0x356>
ffff800000106c59:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106c60:	ff ff ff 
ffff800000106c63:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000106c67:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000106c6a:	48 63 d0             	movslq %eax,%rdx
ffff800000106c6d:	48 89 d0             	mov    %rdx,%rax
ffff800000106c70:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106c74:	48 01 d0             	add    %rdx,%rax
ffff800000106c77:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106c7b:	48 01 c8             	add    %rcx,%rax
ffff800000106c7e:	48 8b 00             	mov    (%rax),%rax
ffff800000106c81:	48 05 ff ff 1f 00    	add    $0x1fffff,%rax
ffff800000106c87:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff800000106c8d:	48 89 45 90          	mov    %rax,-0x70(%rbp)
ffff800000106c91:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106c98:	ff ff ff 
ffff800000106c9b:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000106c9f:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000106ca2:	48 63 d0             	movslq %eax,%rdx
ffff800000106ca5:	48 89 d0             	mov    %rdx,%rax
ffff800000106ca8:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106cac:	48 01 d0             	add    %rdx,%rax
ffff800000106caf:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106cb3:	48 01 c8             	add    %rcx,%rax
ffff800000106cb6:	48 8b 08             	mov    (%rax),%rcx
ffff800000106cb9:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106cc0:	ff ff ff 
ffff800000106cc3:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000106cc7:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000106cca:	48 63 d0             	movslq %eax,%rdx
ffff800000106ccd:	48 89 d0             	mov    %rdx,%rax
ffff800000106cd0:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106cd4:	48 01 d0             	add    %rdx,%rax
ffff800000106cd7:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106cdb:	48 01 f0             	add    %rsi,%rax
ffff800000106cde:	48 83 c0 08          	add    $0x8,%rax
ffff800000106ce2:	48 8b 00             	mov    (%rax),%rax
ffff800000106ce5:	48 01 c8             	add    %rcx,%rax
ffff800000106ce8:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff800000106cee:	48 89 45 88          	mov    %rax,-0x78(%rbp)
ffff800000106cf2:	48 8b 45 90          	mov    -0x70(%rbp),%rax
ffff800000106cf6:	48 3b 45 88          	cmp    -0x78(%rbp),%rax
ffff800000106cfa:	73 15                	jae    ffff800000106d11 <init_mem+0x359>
ffff800000106cfc:	48 8b 45 88          	mov    -0x78(%rbp),%rax
ffff800000106d00:	48 2b 45 90          	sub    -0x70(%rbp),%rax
ffff800000106d04:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106d08:	48 01 45 e8          	add    %rax,-0x18(%rbp)
ffff800000106d0c:	eb 04                	jmp    ffff800000106d12 <init_mem+0x35a>
ffff800000106d0e:	90                   	nop
ffff800000106d0f:	eb 01                	jmp    ffff800000106d12 <init_mem+0x35a>
ffff800000106d11:	90                   	nop
ffff800000106d12:	83 45 d8 01          	addl   $0x1,-0x28(%rbp)
ffff800000106d16:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000106d19:	48 63 d0             	movslq %eax,%rdx
ffff800000106d1c:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106d23:	ff ff ff 
ffff800000106d26:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106d2a:	48 8b 80 80 02 00 00 	mov    0x280(%rax),%rax
ffff800000106d31:	48 39 c2             	cmp    %rax,%rdx
ffff800000106d34:	0f 82 eb fe ff ff    	jb     ffff800000106c25 <init_mem+0x26d>
ffff800000106d3a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106d3e:	48 89 c1             	mov    %rax,%rcx
ffff800000106d41:	48 b8 69 17 00 00 00 	movabs $0x1769,%rax
ffff800000106d48:	00 00 00 
ffff800000106d4b:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106d4f:	be ff ff 00 00       	mov    $0xffff,%esi
ffff800000106d54:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106d59:	49 89 df             	mov    %rbx,%r15
ffff800000106d5c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106d61:	49 b8 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r8
ffff800000106d68:	ff ff ff 
ffff800000106d6b:	49 01 d8             	add    %rbx,%r8
ffff800000106d6e:	41 ff d0             	callq  *%r8
ffff800000106d71:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106d78:	ff ff ff 
ffff800000106d7b:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106d7f:	48 8b 90 80 02 00 00 	mov    0x280(%rax),%rdx
ffff800000106d86:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106d8d:	ff ff ff 
ffff800000106d90:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000106d94:	48 89 d0             	mov    %rdx,%rax
ffff800000106d97:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106d9b:	48 01 d0             	add    %rdx,%rax
ffff800000106d9e:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106da2:	48 01 c8             	add    %rcx,%rax
ffff800000106da5:	48 8b 08             	mov    (%rax),%rcx
ffff800000106da8:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106daf:	ff ff ff 
ffff800000106db2:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106db6:	48 8b 90 80 02 00 00 	mov    0x280(%rax),%rdx
ffff800000106dbd:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106dc4:	ff ff ff 
ffff800000106dc7:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000106dcb:	48 89 d0             	mov    %rdx,%rax
ffff800000106dce:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106dd2:	48 01 d0             	add    %rdx,%rax
ffff800000106dd5:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106dd9:	48 01 f0             	add    %rsi,%rax
ffff800000106ddc:	48 83 c0 08          	add    $0x8,%rax
ffff800000106de0:	48 8b 00             	mov    (%rax),%rax
ffff800000106de3:	48 01 c8             	add    %rcx,%rax
ffff800000106de6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000106dea:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106df1:	ff ff ff 
ffff800000106df4:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106df8:	48 8b 80 e8 02 00 00 	mov    0x2e8(%rax),%rax
ffff800000106dff:	48 05 ff 0f 00 00    	add    $0xfff,%rax
ffff800000106e05:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffff800000106e0b:	48 89 c2             	mov    %rax,%rdx
ffff800000106e0e:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106e15:	ff ff ff 
ffff800000106e18:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106e1c:	48 89 90 88 02 00 00 	mov    %rdx,0x288(%rax)
ffff800000106e23:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106e27:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106e2b:	48 89 c2             	mov    %rax,%rdx
ffff800000106e2e:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106e35:	ff ff ff 
ffff800000106e38:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106e3c:	48 89 90 90 02 00 00 	mov    %rdx,0x290(%rax)
ffff800000106e43:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106e47:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106e4b:	48 83 c0 3f          	add    $0x3f,%rax
ffff800000106e4f:	48 c1 e8 03          	shr    $0x3,%rax
ffff800000106e53:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff800000106e57:	48 89 c2             	mov    %rax,%rdx
ffff800000106e5a:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106e61:	ff ff ff 
ffff800000106e64:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106e68:	48 89 90 98 02 00 00 	mov    %rdx,0x298(%rax)
ffff800000106e6f:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106e76:	ff ff ff 
ffff800000106e79:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106e7d:	48 8b 80 98 02 00 00 	mov    0x298(%rax),%rax
ffff800000106e84:	48 89 c2             	mov    %rax,%rdx
ffff800000106e87:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106e8e:	ff ff ff 
ffff800000106e91:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106e95:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff800000106e9c:	be ff 00 00 00       	mov    $0xff,%esi
ffff800000106ea1:	48 89 c7             	mov    %rax,%rdi
ffff800000106ea4:	49 89 df             	mov    %rbx,%r15
ffff800000106ea7:	48 b8 2d c1 ff ff ff 	movabs $0xffffffffffffc12d,%rax
ffff800000106eae:	ff ff ff 
ffff800000106eb1:	48 01 d8             	add    %rbx,%rax
ffff800000106eb4:	ff d0                	callq  *%rax
ffff800000106eb6:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106ebd:	ff ff ff 
ffff800000106ec0:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106ec4:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000106ecb:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106ed2:	ff ff ff 
ffff800000106ed5:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106ed9:	48 8b 80 98 02 00 00 	mov    0x298(%rax),%rax
ffff800000106ee0:	48 05 00 10 00 00    	add    $0x1000,%rax
ffff800000106ee6:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106eea:	48 83 e8 08          	sub    $0x8,%rax
ffff800000106eee:	48 01 d0             	add    %rdx,%rax
ffff800000106ef1:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffff800000106ef7:	48 89 c2             	mov    %rax,%rdx
ffff800000106efa:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106f01:	ff ff ff 
ffff800000106f04:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106f08:	48 89 90 a0 02 00 00 	mov    %rdx,0x2a0(%rax)
ffff800000106f0f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106f13:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106f17:	48 89 c2             	mov    %rax,%rdx
ffff800000106f1a:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106f21:	ff ff ff 
ffff800000106f24:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106f28:	48 89 90 a8 02 00 00 	mov    %rdx,0x2a8(%rax)
ffff800000106f2f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106f33:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106f37:	48 89 c2             	mov    %rax,%rdx
ffff800000106f3a:	48 89 d0             	mov    %rdx,%rax
ffff800000106f3d:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f41:	48 01 d0             	add    %rdx,%rax
ffff800000106f44:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106f48:	48 83 c0 07          	add    $0x7,%rax
ffff800000106f4c:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff800000106f50:	48 89 c2             	mov    %rax,%rdx
ffff800000106f53:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106f5a:	ff ff ff 
ffff800000106f5d:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106f61:	48 89 90 b0 02 00 00 	mov    %rdx,0x2b0(%rax)
ffff800000106f68:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106f6f:	ff ff ff 
ffff800000106f72:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106f76:	48 8b 80 b0 02 00 00 	mov    0x2b0(%rax),%rax
ffff800000106f7d:	48 89 c2             	mov    %rax,%rdx
ffff800000106f80:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106f87:	ff ff ff 
ffff800000106f8a:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106f8e:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000106f95:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106f9a:	48 89 c7             	mov    %rax,%rdi
ffff800000106f9d:	49 89 df             	mov    %rbx,%r15
ffff800000106fa0:	48 b8 2d c1 ff ff ff 	movabs $0xffffffffffffc12d,%rax
ffff800000106fa7:	ff ff ff 
ffff800000106faa:	48 01 d8             	add    %rbx,%rax
ffff800000106fad:	ff d0                	callq  *%rax
ffff800000106faf:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106fb6:	ff ff ff 
ffff800000106fb9:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106fbd:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000106fc4:	48 89 c2             	mov    %rax,%rdx
ffff800000106fc7:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106fce:	ff ff ff 
ffff800000106fd1:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106fd5:	48 8b 80 b0 02 00 00 	mov    0x2b0(%rax),%rax
ffff800000106fdc:	48 01 d0             	add    %rdx,%rax
ffff800000106fdf:	48 05 ff 0f 00 00    	add    $0xfff,%rax
ffff800000106fe5:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffff800000106feb:	48 89 c2             	mov    %rax,%rdx
ffff800000106fee:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106ff5:	ff ff ff 
ffff800000106ff8:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106ffc:	48 89 90 b8 02 00 00 	mov    %rdx,0x2b8(%rax)
ffff800000107003:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010700a:	ff ff ff 
ffff80000010700d:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107011:	48 c7 80 c8 02 00 00 	movq   $0x0,0x2c8(%rax)
ffff800000107018:	00 00 00 00 
ffff80000010701c:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107023:	ff ff ff 
ffff800000107026:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010702a:	48 c7 80 c0 02 00 00 	movq   $0x190,0x2c0(%rax)
ffff800000107031:	90 01 00 00 
ffff800000107035:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010703c:	ff ff ff 
ffff80000010703f:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107043:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
ffff80000010704a:	48 89 c2             	mov    %rax,%rdx
ffff80000010704d:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107054:	ff ff ff 
ffff800000107057:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010705b:	48 8b 80 b8 02 00 00 	mov    0x2b8(%rax),%rax
ffff800000107062:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107067:	48 89 c7             	mov    %rax,%rdi
ffff80000010706a:	49 89 df             	mov    %rbx,%r15
ffff80000010706d:	48 b8 2d c1 ff ff ff 	movabs $0xffffffffffffc12d,%rax
ffff800000107074:	ff ff ff 
ffff800000107077:	48 01 d8             	add    %rbx,%rax
ffff80000010707a:	ff d0                	callq  *%rax
ffff80000010707c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
ffff800000107083:	e9 11 03 00 00       	jmpq   ffff800000107399 <init_mem+0x9e1>
ffff800000107088:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010708f:	ff ff ff 
ffff800000107092:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000107096:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff800000107099:	48 63 d0             	movslq %eax,%rdx
ffff80000010709c:	48 89 d0             	mov    %rdx,%rax
ffff80000010709f:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001070a3:	48 01 d0             	add    %rdx,%rax
ffff8000001070a6:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001070aa:	48 01 c8             	add    %rcx,%rax
ffff8000001070ad:	48 83 c0 10          	add    $0x10,%rax
ffff8000001070b1:	8b 00                	mov    (%rax),%eax
ffff8000001070b3:	83 f8 01             	cmp    $0x1,%eax
ffff8000001070b6:	0f 85 d5 02 00 00    	jne    ffff800000107391 <init_mem+0x9d9>
ffff8000001070bc:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001070c3:	ff ff ff 
ffff8000001070c6:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff8000001070ca:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff8000001070cd:	48 63 d0             	movslq %eax,%rdx
ffff8000001070d0:	48 89 d0             	mov    %rdx,%rax
ffff8000001070d3:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001070d7:	48 01 d0             	add    %rdx,%rax
ffff8000001070da:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001070de:	48 01 c8             	add    %rcx,%rax
ffff8000001070e1:	48 8b 00             	mov    (%rax),%rax
ffff8000001070e4:	48 05 ff ff 1f 00    	add    $0x1fffff,%rax
ffff8000001070ea:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff8000001070f0:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
ffff8000001070f4:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001070fb:	ff ff ff 
ffff8000001070fe:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000107102:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff800000107105:	48 63 d0             	movslq %eax,%rdx
ffff800000107108:	48 89 d0             	mov    %rdx,%rax
ffff80000010710b:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010710f:	48 01 d0             	add    %rdx,%rax
ffff800000107112:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107116:	48 01 c8             	add    %rcx,%rax
ffff800000107119:	48 8b 08             	mov    (%rax),%rcx
ffff80000010711c:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107123:	ff ff ff 
ffff800000107126:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff80000010712a:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff80000010712d:	48 63 d0             	movslq %eax,%rdx
ffff800000107130:	48 89 d0             	mov    %rdx,%rax
ffff800000107133:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107137:	48 01 d0             	add    %rdx,%rax
ffff80000010713a:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010713e:	48 01 f0             	add    %rsi,%rax
ffff800000107141:	48 83 c0 08          	add    $0x8,%rax
ffff800000107145:	48 8b 00             	mov    (%rax),%rax
ffff800000107148:	48 01 c8             	add    %rcx,%rax
ffff80000010714b:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff800000107151:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
ffff800000107155:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff800000107159:	48 3b 45 a8          	cmp    -0x58(%rbp),%rax
ffff80000010715d:	0f 86 31 02 00 00    	jbe    ffff800000107394 <init_mem+0x9dc>
ffff800000107163:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010716a:	ff ff ff 
ffff80000010716d:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107171:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff800000107178:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010717f:	ff ff ff 
ffff800000107182:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107186:	48 8b 90 c8 02 00 00 	mov    0x2c8(%rax),%rdx
ffff80000010718d:	48 89 d0             	mov    %rdx,%rax
ffff800000107190:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107194:	48 01 d0             	add    %rdx,%rax
ffff800000107197:	48 c1 e0 04          	shl    $0x4,%rax
ffff80000010719b:	48 01 c8             	add    %rcx,%rax
ffff80000010719e:	48 89 45 98          	mov    %rax,-0x68(%rbp)
ffff8000001071a2:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001071a9:	ff ff ff 
ffff8000001071ac:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001071b0:	48 8b 80 c8 02 00 00 	mov    0x2c8(%rax),%rax
ffff8000001071b7:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001071bb:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001071c2:	ff ff ff 
ffff8000001071c5:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001071c9:	48 89 90 c8 02 00 00 	mov    %rdx,0x2c8(%rax)
ffff8000001071d0:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff8000001071d4:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff8000001071d8:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff8000001071dc:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff8000001071e0:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
ffff8000001071e4:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff8000001071e8:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff8000001071ec:	48 2b 45 a8          	sub    -0x58(%rbp),%rax
ffff8000001071f0:	48 89 c2             	mov    %rax,%rdx
ffff8000001071f3:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff8000001071f7:	48 89 50 20          	mov    %rdx,0x20(%rax)
ffff8000001071fb:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff8000001071ff:	48 c7 40 38 00 00 00 	movq   $0x0,0x38(%rax)
ffff800000107206:	00 
ffff800000107207:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff80000010720b:	48 2b 45 a8          	sub    -0x58(%rbp),%rax
ffff80000010720f:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107213:	48 89 c2             	mov    %rax,%rdx
ffff800000107216:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff80000010721a:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff80000010721e:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107222:	48 c7 40 48 00 00 00 	movq   $0x0,0x48(%rax)
ffff800000107229:	00 
ffff80000010722a:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff80000010722e:	48 c7 40 28 00 00 00 	movq   $0x0,0x28(%rax)
ffff800000107235:	00 
ffff800000107236:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff80000010723a:	48 ba d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rdx
ffff800000107241:	ff ff ff 
ffff800000107244:	48 8b 14 13          	mov    (%rbx,%rdx,1),%rdx
ffff800000107248:	48 89 50 30          	mov    %rdx,0x30(%rax)
ffff80000010724c:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff800000107250:	48 2b 45 a8          	sub    -0x58(%rbp),%rax
ffff800000107254:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107258:	48 89 c2             	mov    %rax,%rdx
ffff80000010725b:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff80000010725f:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107263:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010726a:	ff ff ff 
ffff80000010726d:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107271:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff800000107278:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff80000010727c:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107280:	48 89 c2             	mov    %rax,%rdx
ffff800000107283:	48 89 d0             	mov    %rdx,%rax
ffff800000107286:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010728a:	48 01 d0             	add    %rdx,%rax
ffff80000010728d:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107291:	48 8d 14 01          	lea    (%rcx,%rax,1),%rdx
ffff800000107295:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107299:	48 89 10             	mov    %rdx,(%rax)
ffff80000010729c:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff8000001072a0:	48 8b 00             	mov    (%rax),%rax
ffff8000001072a3:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff8000001072a7:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%rbp)
ffff8000001072ae:	e9 c5 00 00 00       	jmpq   ffff800000107378 <init_mem+0x9c0>
ffff8000001072b3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001072b7:	48 8b 55 98          	mov    -0x68(%rbp),%rdx
ffff8000001072bb:	48 89 10             	mov    %rdx,(%rax)
ffff8000001072be:	8b 45 c4             	mov    -0x3c(%rbp),%eax
ffff8000001072c1:	48 98                	cltq   
ffff8000001072c3:	48 c1 e0 15          	shl    $0x15,%rax
ffff8000001072c7:	48 89 c2             	mov    %rax,%rdx
ffff8000001072ca:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff8000001072ce:	48 01 c2             	add    %rax,%rdx
ffff8000001072d1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001072d5:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff8000001072d9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001072dd:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff8000001072e4:	00 
ffff8000001072e5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001072e9:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
ffff8000001072f0:	00 
ffff8000001072f1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001072f5:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
ffff8000001072fc:	00 
ffff8000001072fd:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107304:	ff ff ff 
ffff800000107307:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010730b:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000107312:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107316:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff80000010731a:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff80000010731e:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107322:	48 01 d0             	add    %rdx,%rax
ffff800000107325:	48 8b 10             	mov    (%rax),%rdx
ffff800000107328:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010732c:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107330:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107334:	83 e0 3f             	and    $0x3f,%eax
ffff800000107337:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010733c:	89 c1                	mov    %eax,%ecx
ffff80000010733e:	48 d3 e6             	shl    %cl,%rsi
ffff800000107341:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107348:	ff ff ff 
ffff80000010734b:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010734f:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
ffff800000107356:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010735a:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff80000010735e:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000107362:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107366:	48 01 c8             	add    %rcx,%rax
ffff800000107369:	48 31 f2             	xor    %rsi,%rdx
ffff80000010736c:	48 89 10             	mov    %rdx,(%rax)
ffff80000010736f:	83 45 c4 01          	addl   $0x1,-0x3c(%rbp)
ffff800000107373:	48 83 45 c8 28       	addq   $0x28,-0x38(%rbp)
ffff800000107378:	8b 45 c4             	mov    -0x3c(%rbp),%eax
ffff80000010737b:	48 63 d0             	movslq %eax,%rdx
ffff80000010737e:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107382:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107386:	48 39 c2             	cmp    %rax,%rdx
ffff800000107389:	0f 82 24 ff ff ff    	jb     ffff8000001072b3 <init_mem+0x8fb>
ffff80000010738f:	eb 04                	jmp    ffff800000107395 <init_mem+0x9dd>
ffff800000107391:	90                   	nop
ffff800000107392:	eb 01                	jmp    ffff800000107395 <init_mem+0x9dd>
ffff800000107394:	90                   	nop
ffff800000107395:	83 45 d4 01          	addl   $0x1,-0x2c(%rbp)
ffff800000107399:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff80000010739c:	48 63 d0             	movslq %eax,%rdx
ffff80000010739f:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001073a6:	ff ff ff 
ffff8000001073a9:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001073ad:	48 8b 80 80 02 00 00 	mov    0x280(%rax),%rax
ffff8000001073b4:	48 39 c2             	cmp    %rax,%rdx
ffff8000001073b7:	0f 82 cb fc ff ff    	jb     ffff800000107088 <init_mem+0x6d0>
ffff8000001073bd:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001073c4:	ff ff ff 
ffff8000001073c7:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001073cb:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff8000001073d2:	48 ba d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rdx
ffff8000001073d9:	ff ff ff 
ffff8000001073dc:	48 8b 14 13          	mov    (%rbx,%rdx,1),%rdx
ffff8000001073e0:	48 8b 92 b8 02 00 00 	mov    0x2b8(%rdx),%rdx
ffff8000001073e7:	48 89 10             	mov    %rdx,(%rax)
ffff8000001073ea:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001073f1:	ff ff ff 
ffff8000001073f4:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001073f8:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff8000001073ff:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
ffff800000107406:	00 
ffff800000107407:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010740e:	ff ff ff 
ffff800000107411:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107415:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff80000010741c:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff800000107423:	00 
ffff800000107424:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010742b:	ff ff ff 
ffff80000010742e:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107432:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000107439:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
ffff800000107440:	00 
ffff800000107441:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107448:	ff ff ff 
ffff80000010744b:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010744f:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000107456:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
ffff80000010745d:	00 
ffff80000010745e:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107465:	ff ff ff 
ffff800000107468:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010746c:	48 8b 90 c8 02 00 00 	mov    0x2c8(%rax),%rdx
ffff800000107473:	48 89 d0             	mov    %rdx,%rax
ffff800000107476:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010747a:	48 01 d0             	add    %rdx,%rax
ffff80000010747d:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000107481:	48 83 c0 07          	add    $0x7,%rax
ffff800000107485:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff800000107489:	48 89 c2             	mov    %rax,%rdx
ffff80000010748c:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107493:	ff ff ff 
ffff800000107496:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010749a:	48 89 90 c0 02 00 00 	mov    %rdx,0x2c0(%rax)
ffff8000001074a1:	48 b8 d8 45 01 00 00 	movabs $0x145d8,%rax
ffff8000001074a8:	00 00 00 
ffff8000001074ab:	c7 04 03 00 00 00 00 	movl   $0x0,(%rbx,%rax,1)
ffff8000001074b2:	48 b8 dc 45 01 00 00 	movabs $0x145dc,%rax
ffff8000001074b9:	00 00 00 
ffff8000001074bc:	c7 04 03 00 00 00 00 	movl   $0x0,(%rbx,%rax,1)
ffff8000001074c3:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%rbp)
ffff8000001074ca:	e9 c8 00 00 00       	jmpq   ffff800000107597 <init_mem+0xbdf>
ffff8000001074cf:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001074d6:	ff ff ff 
ffff8000001074d9:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001074dd:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff8000001074e4:	8b 45 c0             	mov    -0x40(%rbp),%eax
ffff8000001074e7:	48 63 d0             	movslq %eax,%rdx
ffff8000001074ea:	48 89 d0             	mov    %rdx,%rax
ffff8000001074ed:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001074f1:	48 01 d0             	add    %rdx,%rax
ffff8000001074f4:	48 c1 e0 04          	shl    $0x4,%rax
ffff8000001074f8:	48 01 c8             	add    %rcx,%rax
ffff8000001074fb:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff8000001074ff:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107503:	48 8b 70 08          	mov    0x8(%rax),%rsi
ffff800000107507:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff80000010750b:	48 8b 08             	mov    (%rax),%rcx
ffff80000010750e:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107512:	48 8b 50 20          	mov    0x20(%rax),%rdx
ffff800000107516:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff80000010751a:	4c 8b 40 18          	mov    0x18(%rax),%r8
ffff80000010751e:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107522:	48 8b 78 10          	mov    0x10(%rax),%rdi
ffff800000107526:	8b 45 c0             	mov    -0x40(%rbp),%eax
ffff800000107529:	48 83 ec 08          	sub    $0x8,%rsp
ffff80000010752d:	56                   	push   %rsi
ffff80000010752e:	51                   	push   %rcx
ffff80000010752f:	52                   	push   %rdx
ffff800000107530:	4d 89 c1             	mov    %r8,%r9
ffff800000107533:	49 89 f8             	mov    %rdi,%r8
ffff800000107536:	89 c1                	mov    %eax,%ecx
ffff800000107538:	48 b8 88 17 00 00 00 	movabs $0x1788,%rax
ffff80000010753f:	00 00 00 
ffff800000107542:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000107546:	be 00 80 ff 00       	mov    $0xff8000,%esi
ffff80000010754b:	bf 00 ff 00 00       	mov    $0xff00,%edi
ffff800000107550:	49 89 df             	mov    %rbx,%r15
ffff800000107553:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107558:	49 ba 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r10
ffff80000010755f:	ff ff ff 
ffff800000107562:	49 01 da             	add    %rbx,%r10
ffff800000107565:	41 ff d2             	callq  *%r10
ffff800000107568:	48 83 c4 20          	add    $0x20,%rsp
ffff80000010756c:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107570:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000107574:	48 b8 00 00 00 00 01 	movabs $0x100000000,%rax
ffff80000010757b:	00 00 00 
ffff80000010757e:	48 39 c2             	cmp    %rax,%rdx
ffff800000107581:	75 10                	jne    ffff800000107593 <init_mem+0xbdb>
ffff800000107583:	48 b8 e0 45 01 00 00 	movabs $0x145e0,%rax
ffff80000010758a:	00 00 00 
ffff80000010758d:	8b 55 c0             	mov    -0x40(%rbp),%edx
ffff800000107590:	89 14 03             	mov    %edx,(%rbx,%rax,1)
ffff800000107593:	83 45 c0 01          	addl   $0x1,-0x40(%rbp)
ffff800000107597:	8b 45 c0             	mov    -0x40(%rbp),%eax
ffff80000010759a:	48 63 d0             	movslq %eax,%rdx
ffff80000010759d:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001075a4:	ff ff ff 
ffff8000001075a7:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001075ab:	48 8b 80 c8 02 00 00 	mov    0x2c8(%rax),%rax
ffff8000001075b2:	48 39 c2             	cmp    %rax,%rdx
ffff8000001075b5:	0f 82 14 ff ff ff    	jb     ffff8000001074cf <init_mem+0xb17>
ffff8000001075bb:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001075c2:	ff ff ff 
ffff8000001075c5:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001075c9:	48 8b 80 b8 02 00 00 	mov    0x2b8(%rax),%rax
ffff8000001075d0:	48 89 c2             	mov    %rax,%rdx
ffff8000001075d3:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001075da:	ff ff ff 
ffff8000001075dd:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001075e1:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
ffff8000001075e8:	48 01 d0             	add    %rdx,%rax
ffff8000001075eb:	48 05 00 01 00 00    	add    $0x100,%rax
ffff8000001075f1:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff8000001075f5:	48 89 c2             	mov    %rax,%rdx
ffff8000001075f8:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001075ff:	ff ff ff 
ffff800000107602:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107606:	48 89 90 f0 02 00 00 	mov    %rdx,0x2f0(%rax)
ffff80000010760d:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107614:	ff ff ff 
ffff800000107617:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010761b:	48 8b 90 f0 02 00 00 	mov    0x2f0(%rax),%rdx
ffff800000107622:	48 b8 00 00 00 00 00 	movabs $0x800000000000,%rax
ffff800000107629:	80 00 00 
ffff80000010762c:	48 01 d0             	add    %rdx,%rax
ffff80000010762f:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107633:	89 45 c0             	mov    %eax,-0x40(%rbp)
ffff800000107636:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%rbp)
ffff80000010763d:	eb 48                	jmp    ffff800000107687 <init_mem+0xccf>
ffff80000010763f:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107646:	ff ff ff 
ffff800000107649:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010764d:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff800000107654:	8b 45 bc             	mov    -0x44(%rbp),%eax
ffff800000107657:	48 63 d0             	movslq %eax,%rdx
ffff80000010765a:	48 89 d0             	mov    %rdx,%rax
ffff80000010765d:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107661:	48 01 d0             	add    %rdx,%rax
ffff800000107664:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107668:	48 01 c8             	add    %rcx,%rax
ffff80000010766b:	be 93 00 00 00       	mov    $0x93,%esi
ffff800000107670:	48 89 c7             	mov    %rax,%rdi
ffff800000107673:	48 b8 a3 ad ff ff ff 	movabs $0xffffffffffffada3,%rax
ffff80000010767a:	ff ff ff 
ffff80000010767d:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000107681:	ff d0                	callq  *%rax
ffff800000107683:	83 45 bc 01          	addl   $0x1,-0x44(%rbp)
ffff800000107687:	8b 45 bc             	mov    -0x44(%rbp),%eax
ffff80000010768a:	3b 45 c0             	cmp    -0x40(%rbp),%eax
ffff80000010768d:	7c b0                	jl     ffff80000010763f <init_mem+0xc87>
ffff80000010768f:	49 89 df             	mov    %rbx,%r15
ffff800000107692:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107697:	48 ba ee c1 ff ff ff 	movabs $0xffffffffffffc1ee,%rdx
ffff80000010769e:	ff ff ff 
ffff8000001076a1:	48 01 da             	add    %rbx,%rdx
ffff8000001076a4:	ff d2                	callq  *%rdx
ffff8000001076a6:	48 89 c2             	mov    %rax,%rdx
ffff8000001076a9:	48 b8 e8 45 01 00 00 	movabs $0x145e8,%rax
ffff8000001076b0:	00 00 00 
ffff8000001076b3:	48 89 14 03          	mov    %rdx,(%rbx,%rax,1)
ffff8000001076b7:	48 b8 e8 45 01 00 00 	movabs $0x145e8,%rax
ffff8000001076be:	00 00 00 
ffff8000001076c1:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001076c5:	48 89 c1             	mov    %rax,%rcx
ffff8000001076c8:	48 b8 e4 17 00 00 00 	movabs $0x17e4,%rax
ffff8000001076cf:	00 00 00 
ffff8000001076d2:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001076d6:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001076db:	bf ff ff 00 00       	mov    $0xffff,%edi
ffff8000001076e0:	49 89 df             	mov    %rbx,%r15
ffff8000001076e3:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001076e8:	49 b8 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r8
ffff8000001076ef:	ff ff ff 
ffff8000001076f2:	49 01 d8             	add    %rbx,%r8
ffff8000001076f5:	41 ff d0             	callq  *%r8
ffff8000001076f8:	48 b8 e8 45 01 00 00 	movabs $0x145e8,%rax
ffff8000001076ff:	00 00 00 
ffff800000107702:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107706:	48 89 c2             	mov    %rax,%rdx
ffff800000107709:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff800000107710:	80 ff ff 
ffff800000107713:	48 01 d0             	add    %rdx,%rax
ffff800000107716:	48 8b 00             	mov    (%rax),%rax
ffff800000107719:	b0 00                	mov    $0x0,%al
ffff80000010771b:	48 89 c1             	mov    %rax,%rcx
ffff80000010771e:	48 b8 f3 17 00 00 00 	movabs $0x17f3,%rax
ffff800000107725:	00 00 00 
ffff800000107728:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010772c:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107731:	bf ff ff 00 00       	mov    $0xffff,%edi
ffff800000107736:	49 89 df             	mov    %rbx,%r15
ffff800000107739:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010773e:	49 b8 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r8
ffff800000107745:	ff ff ff 
ffff800000107748:	49 01 d8             	add    %rbx,%r8
ffff80000010774b:	41 ff d0             	callq  *%r8
ffff80000010774e:	48 b8 e8 45 01 00 00 	movabs $0x145e8,%rax
ffff800000107755:	00 00 00 
ffff800000107758:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010775c:	48 89 c2             	mov    %rax,%rdx
ffff80000010775f:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff800000107766:	80 ff ff 
ffff800000107769:	48 01 d0             	add    %rdx,%rax
ffff80000010776c:	48 8b 00             	mov    (%rax),%rax
ffff80000010776f:	b0 00                	mov    $0x0,%al
ffff800000107771:	48 89 c2             	mov    %rax,%rdx
ffff800000107774:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff80000010777b:	80 ff ff 
ffff80000010777e:	48 01 d0             	add    %rdx,%rax
ffff800000107781:	48 8b 00             	mov    (%rax),%rax
ffff800000107784:	b0 00                	mov    $0x0,%al
ffff800000107786:	48 89 c1             	mov    %rax,%rcx
ffff800000107789:	48 b8 03 18 00 00 00 	movabs $0x1803,%rax
ffff800000107790:	00 00 00 
ffff800000107793:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000107797:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010779c:	bf ff 00 80 00       	mov    $0x8000ff,%edi
ffff8000001077a1:	49 89 df             	mov    %rbx,%r15
ffff8000001077a4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001077a9:	49 b8 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r8
ffff8000001077b0:	ff ff ff 
ffff8000001077b3:	49 01 d8             	add    %rbx,%r8
ffff8000001077b6:	41 ff d0             	callq  *%r8
ffff8000001077b9:	90                   	nop
ffff8000001077ba:	48 8d 65 f0          	lea    -0x10(%rbp),%rsp
ffff8000001077be:	5b                   	pop    %rbx
ffff8000001077bf:	41 5f                	pop    %r15
ffff8000001077c1:	5d                   	pop    %rbp
ffff8000001077c2:	c3                   	retq   

ffff8000001077c3 <alloc_pages>:
ffff8000001077c3:	55                   	push   %rbp
ffff8000001077c4:	48 89 e5             	mov    %rsp,%rbp
ffff8000001077c7:	41 57                	push   %r15
ffff8000001077c9:	53                   	push   %rbx
ffff8000001077ca:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
ffff8000001077ce:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff8000001077ce <alloc_pages+0xb>
ffff8000001077d5:	49 bb 5a 42 00 00 00 	movabs $0x425a,%r11
ffff8000001077dc:	00 00 00 
ffff8000001077df:	4c 01 db             	add    %r11,%rbx
ffff8000001077e2:	89 bd 7c ff ff ff    	mov    %edi,-0x84(%rbp)
ffff8000001077e8:	89 b5 78 ff ff ff    	mov    %esi,-0x88(%rbp)
ffff8000001077ee:	48 89 95 70 ff ff ff 	mov    %rdx,-0x90(%rbp)
ffff8000001077f5:	48 c7 45 c0 00 00 00 	movq   $0x0,-0x40(%rbp)
ffff8000001077fc:	00 
ffff8000001077fd:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
ffff800000107804:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
ffff80000010780b:	8b 85 7c ff ff ff    	mov    -0x84(%rbp),%eax
ffff800000107811:	83 f8 02             	cmp    $0x2,%eax
ffff800000107814:	74 26                	je     ffff80000010783c <alloc_pages+0x79>
ffff800000107816:	83 f8 04             	cmp    $0x4,%eax
ffff800000107819:	74 43                	je     ffff80000010785e <alloc_pages+0x9b>
ffff80000010781b:	83 f8 01             	cmp    $0x1,%eax
ffff80000010781e:	75 6b                	jne    ffff80000010788b <alloc_pages+0xc8>
ffff800000107820:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
ffff800000107827:	48 b8 d8 45 01 00 00 	movabs $0x145d8,%rax
ffff80000010782e:	00 00 00 
ffff800000107831:	8b 04 03             	mov    (%rbx,%rax,1),%eax
ffff800000107834:	89 45 e4             	mov    %eax,-0x1c(%rbp)
ffff800000107837:	e9 88 00 00 00       	jmpq   ffff8000001078c4 <alloc_pages+0x101>
ffff80000010783c:	48 b8 d8 45 01 00 00 	movabs $0x145d8,%rax
ffff800000107843:	00 00 00 
ffff800000107846:	8b 04 03             	mov    (%rbx,%rax,1),%eax
ffff800000107849:	89 45 e8             	mov    %eax,-0x18(%rbp)
ffff80000010784c:	48 b8 dc 45 01 00 00 	movabs $0x145dc,%rax
ffff800000107853:	00 00 00 
ffff800000107856:	8b 04 03             	mov    (%rbx,%rax,1),%eax
ffff800000107859:	89 45 e4             	mov    %eax,-0x1c(%rbp)
ffff80000010785c:	eb 66                	jmp    ffff8000001078c4 <alloc_pages+0x101>
ffff80000010785e:	48 b8 e0 45 01 00 00 	movabs $0x145e0,%rax
ffff800000107865:	00 00 00 
ffff800000107868:	8b 04 03             	mov    (%rbx,%rax,1),%eax
ffff80000010786b:	89 45 e8             	mov    %eax,-0x18(%rbp)
ffff80000010786e:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107875:	ff ff ff 
ffff800000107878:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010787c:	48 8b 80 c8 02 00 00 	mov    0x2c8(%rax),%rax
ffff800000107883:	83 e8 01             	sub    $0x1,%eax
ffff800000107886:	89 45 e4             	mov    %eax,-0x1c(%rbp)
ffff800000107889:	eb 39                	jmp    ffff8000001078c4 <alloc_pages+0x101>
ffff80000010788b:	48 b8 18 18 00 00 00 	movabs $0x1818,%rax
ffff800000107892:	00 00 00 
ffff800000107895:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000107899:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010789e:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001078a3:	49 89 df             	mov    %rbx,%r15
ffff8000001078a6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001078ab:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff8000001078b2:	ff ff ff 
ffff8000001078b5:	48 01 d9             	add    %rbx,%rcx
ffff8000001078b8:	ff d1                	callq  *%rcx
ffff8000001078ba:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001078bf:	e9 88 02 00 00       	jmpq   ffff800000107b4c <alloc_pages+0x389>
ffff8000001078c4:	8b 45 e8             	mov    -0x18(%rbp),%eax
ffff8000001078c7:	89 45 ec             	mov    %eax,-0x14(%rbp)
ffff8000001078ca:	e9 6c 02 00 00       	jmpq   ffff800000107b3b <alloc_pages+0x378>
ffff8000001078cf:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001078d6:	ff ff ff 
ffff8000001078d9:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001078dd:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff8000001078e4:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff8000001078e7:	48 63 d0             	movslq %eax,%rdx
ffff8000001078ea:	48 89 d0             	mov    %rdx,%rax
ffff8000001078ed:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001078f1:	48 01 d0             	add    %rdx,%rax
ffff8000001078f4:	48 c1 e0 04          	shl    $0x4,%rax
ffff8000001078f8:	48 01 c8             	add    %rcx,%rax
ffff8000001078fb:	48 8b 50 40          	mov    0x40(%rax),%rdx
ffff8000001078ff:	8b 85 78 ff ff ff    	mov    -0x88(%rbp),%eax
ffff800000107905:	48 98                	cltq   
ffff800000107907:	48 39 c2             	cmp    %rax,%rdx
ffff80000010790a:	0f 82 26 02 00 00    	jb     ffff800000107b36 <alloc_pages+0x373>
ffff800000107910:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107917:	ff ff ff 
ffff80000010791a:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010791e:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff800000107925:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000107928:	48 63 d0             	movslq %eax,%rdx
ffff80000010792b:	48 89 d0             	mov    %rdx,%rax
ffff80000010792e:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107932:	48 01 d0             	add    %rdx,%rax
ffff800000107935:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000107939:	48 01 c8             	add    %rcx,%rax
ffff80000010793c:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
ffff800000107940:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000107944:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000107948:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010794c:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff800000107950:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000107954:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000107958:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010795c:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
ffff800000107960:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000107964:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff800000107968:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010796c:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
ffff800000107970:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107974:	83 e0 3f             	and    $0x3f,%eax
ffff800000107977:	ba 40 00 00 00       	mov    $0x40,%edx
ffff80000010797c:	48 29 c2             	sub    %rax,%rdx
ffff80000010797f:	48 89 d0             	mov    %rdx,%rax
ffff800000107982:	48 89 45 98          	mov    %rax,-0x68(%rbp)
ffff800000107986:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff80000010798a:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff80000010798e:	e9 93 01 00 00       	jmpq   ffff800000107b26 <alloc_pages+0x363>
ffff800000107993:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010799a:	ff ff ff 
ffff80000010799d:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001079a1:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff8000001079a8:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001079ac:	48 c1 ea 06          	shr    $0x6,%rdx
ffff8000001079b0:	48 c1 e2 03          	shl    $0x3,%rdx
ffff8000001079b4:	48 01 d0             	add    %rdx,%rax
ffff8000001079b7:	48 89 45 90          	mov    %rax,-0x70(%rbp)
ffff8000001079bb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001079bf:	83 e0 3f             	and    $0x3f,%eax
ffff8000001079c2:	48 89 45 88          	mov    %rax,-0x78(%rbp)
ffff8000001079c6:	48 8b 45 88          	mov    -0x78(%rbp),%rax
ffff8000001079ca:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff8000001079ce:	e9 25 01 00 00       	jmpq   ffff800000107af8 <alloc_pages+0x335>
ffff8000001079d3:	48 8b 45 90          	mov    -0x70(%rbp),%rax
ffff8000001079d7:	48 8b 00             	mov    (%rax),%rax
ffff8000001079da:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
ffff8000001079de:	89 d1                	mov    %edx,%ecx
ffff8000001079e0:	48 d3 e8             	shr    %cl,%rax
ffff8000001079e3:	48 89 c6             	mov    %rax,%rsi
ffff8000001079e6:	48 8b 45 90          	mov    -0x70(%rbp),%rax
ffff8000001079ea:	48 83 c0 08          	add    $0x8,%rax
ffff8000001079ee:	48 8b 10             	mov    (%rax),%rdx
ffff8000001079f1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001079f5:	b9 40 00 00 00       	mov    $0x40,%ecx
ffff8000001079fa:	29 c1                	sub    %eax,%ecx
ffff8000001079fc:	89 c8                	mov    %ecx,%eax
ffff8000001079fe:	89 c1                	mov    %eax,%ecx
ffff800000107a00:	48 d3 e2             	shl    %cl,%rdx
ffff800000107a03:	48 89 d0             	mov    %rdx,%rax
ffff800000107a06:	48 09 c6             	or     %rax,%rsi
ffff800000107a09:	48 89 f2             	mov    %rsi,%rdx
ffff800000107a0c:	83 bd 78 ff ff ff 40 	cmpl   $0x40,-0x88(%rbp)
ffff800000107a13:	74 19                	je     ffff800000107a2e <alloc_pages+0x26b>
ffff800000107a15:	8b 85 78 ff ff ff    	mov    -0x88(%rbp),%eax
ffff800000107a1b:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000107a20:	89 c1                	mov    %eax,%ecx
ffff800000107a22:	48 d3 e6             	shl    %cl,%rsi
ffff800000107a25:	48 89 f0             	mov    %rsi,%rax
ffff800000107a28:	48 83 e8 01          	sub    $0x1,%rax
ffff800000107a2c:	eb 07                	jmp    ffff800000107a35 <alloc_pages+0x272>
ffff800000107a2e:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffff800000107a35:	48 21 d0             	and    %rdx,%rax
ffff800000107a38:	48 85 c0             	test   %rax,%rax
ffff800000107a3b:	0f 85 b2 00 00 00    	jne    ffff800000107af3 <alloc_pages+0x330>
ffff800000107a41:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000107a45:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000107a49:	48 01 d0             	add    %rdx,%rax
ffff800000107a4c:	48 83 e8 01          	sub    $0x1,%rax
ffff800000107a50:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
ffff800000107a54:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
ffff800000107a5b:	00 
ffff800000107a5c:	eb 5b                	jmp    ffff800000107ab9 <alloc_pages+0x2f6>
ffff800000107a5e:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107a65:	ff ff ff 
ffff800000107a68:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107a6c:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff800000107a73:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
ffff800000107a77:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107a7b:	48 01 c2             	add    %rax,%rdx
ffff800000107a7e:	48 89 d0             	mov    %rdx,%rax
ffff800000107a81:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107a85:	48 01 d0             	add    %rdx,%rax
ffff800000107a88:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107a8c:	48 01 c8             	add    %rcx,%rax
ffff800000107a8f:	48 89 45 80          	mov    %rax,-0x80(%rbp)
ffff800000107a93:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
ffff800000107a9a:	48 8b 45 80          	mov    -0x80(%rbp),%rax
ffff800000107a9e:	48 89 d6             	mov    %rdx,%rsi
ffff800000107aa1:	48 89 c7             	mov    %rax,%rdi
ffff800000107aa4:	48 b8 a3 ad ff ff ff 	movabs $0xffffffffffffada3,%rax
ffff800000107aab:	ff ff ff 
ffff800000107aae:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000107ab2:	ff d0                	callq  *%rax
ffff800000107ab4:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
ffff800000107ab9:	8b 85 78 ff ff ff    	mov    -0x88(%rbp),%eax
ffff800000107abf:	48 98                	cltq   
ffff800000107ac1:	48 39 45 c8          	cmp    %rax,-0x38(%rbp)
ffff800000107ac5:	72 97                	jb     ffff800000107a5e <alloc_pages+0x29b>
ffff800000107ac7:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107ace:	ff ff ff 
ffff800000107ad1:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107ad5:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff800000107adc:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
ffff800000107ae0:	48 89 d0             	mov    %rdx,%rax
ffff800000107ae3:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107ae7:	48 01 d0             	add    %rdx,%rax
ffff800000107aea:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107aee:	48 01 c8             	add    %rcx,%rax
ffff800000107af1:	eb 59                	jmp    ffff800000107b4c <alloc_pages+0x389>
ffff800000107af3:	48 83 45 d0 01       	addq   $0x1,-0x30(%rbp)
ffff800000107af8:	b8 40 00 00 00       	mov    $0x40,%eax
ffff800000107afd:	48 2b 45 88          	sub    -0x78(%rbp),%rax
ffff800000107b01:	48 39 45 d0          	cmp    %rax,-0x30(%rbp)
ffff800000107b05:	0f 82 c8 fe ff ff    	jb     ffff8000001079d3 <alloc_pages+0x210>
ffff800000107b0b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107b0f:	83 e0 3f             	and    $0x3f,%eax
ffff800000107b12:	48 85 c0             	test   %rax,%rax
ffff800000107b15:	74 06                	je     ffff800000107b1d <alloc_pages+0x35a>
ffff800000107b17:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107b1b:	eb 05                	jmp    ffff800000107b22 <alloc_pages+0x35f>
ffff800000107b1d:	b8 40 00 00 00       	mov    $0x40,%eax
ffff800000107b22:	48 01 45 d8          	add    %rax,-0x28(%rbp)
ffff800000107b26:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107b2a:	48 3b 45 a8          	cmp    -0x58(%rbp),%rax
ffff800000107b2e:	0f 86 5f fe ff ff    	jbe    ffff800000107993 <alloc_pages+0x1d0>
ffff800000107b34:	eb 01                	jmp    ffff800000107b37 <alloc_pages+0x374>
ffff800000107b36:	90                   	nop
ffff800000107b37:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
ffff800000107b3b:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000107b3e:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
ffff800000107b41:	0f 8e 88 fd ff ff    	jle    ffff8000001078cf <alloc_pages+0x10c>
ffff800000107b47:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107b4c:	48 83 ec 80          	sub    $0xffffffffffffff80,%rsp
ffff800000107b50:	5b                   	pop    %rbx
ffff800000107b51:	41 5f                	pop    %r15
ffff800000107b53:	5d                   	pop    %rbp
ffff800000107b54:	c3                   	retq   

ffff800000107b55 <memset>:
ffff800000107b55:	55                   	push   %rbp
ffff800000107b56:	48 89 e5             	mov    %rsp,%rbp
ffff800000107b59:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107b59 <memset+0x4>
ffff800000107b60:	49 bb cf 3e 00 00 00 	movabs $0x3ecf,%r11
ffff800000107b67:	00 00 00 
ffff800000107b6a:	4c 01 d8             	add    %r11,%rax
ffff800000107b6d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000107b71:	89 f0                	mov    %esi,%eax
ffff800000107b73:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
ffff800000107b77:	88 45 e4             	mov    %al,-0x1c(%rbp)
ffff800000107b7a:	0f b6 45 e4          	movzbl -0x1c(%rbp),%eax
ffff800000107b7e:	88 45 f7             	mov    %al,-0x9(%rbp)
ffff800000107b81:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107b85:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000107b89:	eb 14                	jmp    ffff800000107b9f <memset+0x4a>
ffff800000107b8b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107b8f:	0f b6 55 f7          	movzbl -0x9(%rbp),%edx
ffff800000107b93:	88 10                	mov    %dl,(%rax)
ffff800000107b95:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
ffff800000107b9a:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
ffff800000107b9f:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
ffff800000107ba4:	7f e5                	jg     ffff800000107b8b <memset+0x36>
ffff800000107ba6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107baa:	5d                   	pop    %rbp
ffff800000107bab:	c3                   	retq   

ffff800000107bac <memcpy>:
ffff800000107bac:	55                   	push   %rbp
ffff800000107bad:	48 89 e5             	mov    %rsp,%rbp
ffff800000107bb0:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107bb0 <memcpy+0x4>
ffff800000107bb7:	49 bb 78 3e 00 00 00 	movabs $0x3e78,%r11
ffff800000107bbe:	00 00 00 
ffff800000107bc1:	4c 01 d8             	add    %r11,%rax
ffff800000107bc4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000107bc8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
ffff800000107bcc:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
ffff800000107bd0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107bd4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000107bd8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107bdc:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff800000107be0:	eb 1d                	jmp    ffff800000107bff <memcpy+0x53>
ffff800000107be2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000107be6:	48 8d 42 01          	lea    0x1(%rdx),%rax
ffff800000107bea:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff800000107bee:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107bf2:	48 8d 48 01          	lea    0x1(%rax),%rcx
ffff800000107bf6:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
ffff800000107bfa:	0f b6 12             	movzbl (%rdx),%edx
ffff800000107bfd:	88 10                	mov    %dl,(%rax)
ffff800000107bff:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107c03:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff800000107c07:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
ffff800000107c0b:	48 85 c0             	test   %rax,%rax
ffff800000107c0e:	75 d2                	jne    ffff800000107be2 <memcpy+0x36>
ffff800000107c10:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107c14:	5d                   	pop    %rbp
ffff800000107c15:	c3                   	retq   

ffff800000107c16 <Get_gdt>:
ffff800000107c16:	55                   	push   %rbp
ffff800000107c17:	48 89 e5             	mov    %rsp,%rbp
ffff800000107c1a:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107c1a <Get_gdt+0x4>
ffff800000107c21:	49 bb 0e 3e 00 00 00 	movabs $0x3e0e,%r11
ffff800000107c28:	00 00 00 
ffff800000107c2b:	4c 01 d8             	add    %r11,%rax
ffff800000107c2e:	0f 20 d8             	mov    %cr3,%rax
ffff800000107c31:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000107c35:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107c39:	5d                   	pop    %rbp
ffff800000107c3a:	c3                   	retq   

ffff800000107c3b <flush_tlb>:
ffff800000107c3b:	55                   	push   %rbp
ffff800000107c3c:	48 89 e5             	mov    %rsp,%rbp
ffff800000107c3f:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107c3f <flush_tlb+0x4>
ffff800000107c46:	49 bb e9 3d 00 00 00 	movabs $0x3de9,%r11
ffff800000107c4d:	00 00 00 
ffff800000107c50:	4c 01 d8             	add    %r11,%rax
ffff800000107c53:	0f 20 d8             	mov    %cr3,%rax
ffff800000107c56:	0f 22 d8             	mov    %rax,%cr3
ffff800000107c59:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000107c5d:	90                   	nop
ffff800000107c5e:	5d                   	pop    %rbp
ffff800000107c5f:	c3                   	retq   

ffff800000107c60 <io_out8>:
ffff800000107c60:	55                   	push   %rbp
ffff800000107c61:	48 89 e5             	mov    %rsp,%rbp
ffff800000107c64:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107c64 <io_out8+0x4>
ffff800000107c6b:	49 bb c4 3d 00 00 00 	movabs $0x3dc4,%r11
ffff800000107c72:	00 00 00 
ffff800000107c75:	4c 01 d8             	add    %r11,%rax
ffff800000107c78:	89 fa                	mov    %edi,%edx
ffff800000107c7a:	89 f0                	mov    %esi,%eax
ffff800000107c7c:	66 89 55 fc          	mov    %dx,-0x4(%rbp)
ffff800000107c80:	88 45 f8             	mov    %al,-0x8(%rbp)
ffff800000107c83:	0f b6 45 f8          	movzbl -0x8(%rbp),%eax
ffff800000107c87:	0f b7 55 fc          	movzwl -0x4(%rbp),%edx
ffff800000107c8b:	ee                   	out    %al,(%dx)
ffff800000107c8c:	0f ae f0             	mfence 
ffff800000107c8f:	90                   	nop
ffff800000107c90:	5d                   	pop    %rbp
ffff800000107c91:	c3                   	retq   

ffff800000107c92 <io_in8>:
ffff800000107c92:	55                   	push   %rbp
ffff800000107c93:	48 89 e5             	mov    %rsp,%rbp
ffff800000107c96:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107c96 <io_in8+0x4>
ffff800000107c9d:	49 bb 92 3d 00 00 00 	movabs $0x3d92,%r11
ffff800000107ca4:	00 00 00 
ffff800000107ca7:	4c 01 d8             	add    %r11,%rax
ffff800000107caa:	89 f8                	mov    %edi,%eax
ffff800000107cac:	66 89 45 ec          	mov    %ax,-0x14(%rbp)
ffff800000107cb0:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
ffff800000107cb4:	0f b7 45 ec          	movzwl -0x14(%rbp),%eax
ffff800000107cb8:	89 c2                	mov    %eax,%edx
ffff800000107cba:	ec                   	in     (%dx),%al
ffff800000107cbb:	0f ae f0             	mfence 
ffff800000107cbe:	88 45 ff             	mov    %al,-0x1(%rbp)
ffff800000107cc1:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
ffff800000107cc5:	5d                   	pop    %rbp
ffff800000107cc6:	c3                   	retq   

ffff800000107cc7 <list_init>:
ffff800000107cc7:	55                   	push   %rbp
ffff800000107cc8:	48 89 e5             	mov    %rsp,%rbp
ffff800000107ccb:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107ccb <list_init+0x4>
ffff800000107cd2:	49 bb 5d 3d 00 00 00 	movabs $0x3d5d,%r11
ffff800000107cd9:	00 00 00 
ffff800000107cdc:	4c 01 d8             	add    %r11,%rax
ffff800000107cdf:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000107ce3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107ce7:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000107ceb:	48 89 10             	mov    %rdx,(%rax)
ffff800000107cee:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107cf2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000107cf6:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107cfa:	90                   	nop
ffff800000107cfb:	5d                   	pop    %rbp
ffff800000107cfc:	c3                   	retq   

ffff800000107cfd <list_add_to_behind>:
ffff800000107cfd:	55                   	push   %rbp
ffff800000107cfe:	48 89 e5             	mov    %rsp,%rbp
ffff800000107d01:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107d01 <list_add_to_behind+0x4>
ffff800000107d08:	49 bb 27 3d 00 00 00 	movabs $0x3d27,%r11
ffff800000107d0f:	00 00 00 
ffff800000107d12:	4c 01 d8             	add    %r11,%rax
ffff800000107d15:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000107d19:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000107d1d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107d21:	48 8b 50 08          	mov    0x8(%rax),%rdx
ffff800000107d25:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107d29:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107d2d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107d31:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000107d35:	48 89 10             	mov    %rdx,(%rax)
ffff800000107d38:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107d3c:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107d40:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000107d44:	48 89 10             	mov    %rdx,(%rax)
ffff800000107d47:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107d4b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000107d4f:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107d53:	90                   	nop
ffff800000107d54:	5d                   	pop    %rbp
ffff800000107d55:	c3                   	retq   

ffff800000107d56 <list_add_to_before>:
ffff800000107d56:	55                   	push   %rbp
ffff800000107d57:	48 89 e5             	mov    %rsp,%rbp
ffff800000107d5a:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107d5a <list_add_to_before+0x4>
ffff800000107d61:	49 bb ce 3c 00 00 00 	movabs $0x3cce,%r11
ffff800000107d68:	00 00 00 
ffff800000107d6b:	4c 01 d8             	add    %r11,%rax
ffff800000107d6e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000107d72:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000107d76:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107d7a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000107d7e:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107d82:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107d86:	48 8b 00             	mov    (%rax),%rax
ffff800000107d89:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000107d8d:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107d91:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107d95:	48 8b 10             	mov    (%rax),%rdx
ffff800000107d98:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107d9c:	48 89 10             	mov    %rdx,(%rax)
ffff800000107d9f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107da3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000107da7:	48 89 10             	mov    %rdx,(%rax)
ffff800000107daa:	90                   	nop
ffff800000107dab:	5d                   	pop    %rbp
ffff800000107dac:	c3                   	retq   

ffff800000107dad <list_del>:
ffff800000107dad:	55                   	push   %rbp
ffff800000107dae:	48 89 e5             	mov    %rsp,%rbp
ffff800000107db1:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107db1 <list_del+0x4>
ffff800000107db8:	49 bb 77 3c 00 00 00 	movabs $0x3c77,%r11
ffff800000107dbf:	00 00 00 
ffff800000107dc2:	4c 01 d8             	add    %r11,%rax
ffff800000107dc5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000107dc9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107dcd:	48 8b 00             	mov    (%rax),%rax
ffff800000107dd0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000107dd4:	48 8b 52 08          	mov    0x8(%rdx),%rdx
ffff800000107dd8:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107ddc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107de0:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107de4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000107de8:	48 8b 12             	mov    (%rdx),%rdx
ffff800000107deb:	48 89 10             	mov    %rdx,(%rax)
ffff800000107dee:	90                   	nop
ffff800000107def:	5d                   	pop    %rbp
ffff800000107df0:	c3                   	retq   

ffff800000107df1 <list_is_empty>:
ffff800000107df1:	55                   	push   %rbp
ffff800000107df2:	48 89 e5             	mov    %rsp,%rbp
ffff800000107df5:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107df5 <list_is_empty+0x4>
ffff800000107dfc:	49 bb 33 3c 00 00 00 	movabs $0x3c33,%r11
ffff800000107e03:	00 00 00 
ffff800000107e06:	4c 01 d8             	add    %r11,%rax
ffff800000107e09:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000107e0d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107e11:	48 8b 00             	mov    (%rax),%rax
ffff800000107e14:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
ffff800000107e18:	75 15                	jne    ffff800000107e2f <list_is_empty+0x3e>
ffff800000107e1a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107e1e:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107e22:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
ffff800000107e26:	75 07                	jne    ffff800000107e2f <list_is_empty+0x3e>
ffff800000107e28:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000107e2d:	eb 05                	jmp    ffff800000107e34 <list_is_empty+0x43>
ffff800000107e2f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107e34:	5d                   	pop    %rbp
ffff800000107e35:	c3                   	retq   

ffff800000107e36 <list_next>:
ffff800000107e36:	55                   	push   %rbp
ffff800000107e37:	48 89 e5             	mov    %rsp,%rbp
ffff800000107e3a:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107e3a <list_next+0x4>
ffff800000107e41:	49 bb ee 3b 00 00 00 	movabs $0x3bee,%r11
ffff800000107e48:	00 00 00 
ffff800000107e4b:	4c 01 d8             	add    %r11,%rax
ffff800000107e4e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000107e52:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107e56:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107e5a:	48 85 c0             	test   %rax,%rax
ffff800000107e5d:	74 0a                	je     ffff800000107e69 <list_next+0x33>
ffff800000107e5f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107e63:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107e67:	eb 05                	jmp    ffff800000107e6e <list_next+0x38>
ffff800000107e69:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107e6e:	5d                   	pop    %rbp
ffff800000107e6f:	c3                   	retq   

ffff800000107e70 <wrmsr>:
ffff800000107e70:	55                   	push   %rbp
ffff800000107e71:	48 89 e5             	mov    %rsp,%rbp
ffff800000107e74:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107e74 <wrmsr+0x4>
ffff800000107e7b:	49 bb b4 3b 00 00 00 	movabs $0x3bb4,%r11
ffff800000107e82:	00 00 00 
ffff800000107e85:	4c 01 d8             	add    %r11,%rax
ffff800000107e88:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000107e8c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000107e90:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107e94:	48 c1 e8 20          	shr    $0x20,%rax
ffff800000107e98:	48 89 c2             	mov    %rax,%rdx
ffff800000107e9b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107e9f:	89 c0                	mov    %eax,%eax
ffff800000107ea1:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
ffff800000107ea5:	0f 30                	wrmsr  
ffff800000107ea7:	90                   	nop
ffff800000107ea8:	5d                   	pop    %rbp
ffff800000107ea9:	c3                   	retq   

ffff800000107eaa <IRQ0x20_interrupt>:
ffff800000107eaa:	6a 00                	pushq  $0x0
ffff800000107eac:	fc                   	cld    
ffff800000107ead:	50                   	push   %rax
ffff800000107eae:	50                   	push   %rax
ffff800000107eaf:	48 8c c0             	mov    %es,%rax
ffff800000107eb2:	50                   	push   %rax
ffff800000107eb3:	48 8c d8             	mov    %ds,%rax
ffff800000107eb6:	50                   	push   %rax
ffff800000107eb7:	48 31 c0             	xor    %rax,%rax
ffff800000107eba:	55                   	push   %rbp
ffff800000107ebb:	57                   	push   %rdi
ffff800000107ebc:	56                   	push   %rsi
ffff800000107ebd:	52                   	push   %rdx
ffff800000107ebe:	51                   	push   %rcx
ffff800000107ebf:	53                   	push   %rbx
ffff800000107ec0:	41 50                	push   %r8
ffff800000107ec2:	41 51                	push   %r9
ffff800000107ec4:	41 52                	push   %r10
ffff800000107ec6:	41 53                	push   %r11
ffff800000107ec8:	41 54                	push   %r12
ffff800000107eca:	41 55                	push   %r13
ffff800000107ecc:	41 56                	push   %r14
ffff800000107ece:	41 57                	push   %r15
ffff800000107ed0:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000107ed7:	48 8e da             	mov    %rdx,%ds
ffff800000107eda:	48 8e c2             	mov    %rdx,%es
ffff800000107edd:	48 89 e7             	mov    %rsp,%rdi
ffff800000107ee0:	48 8d 05 3e c1 ff ff 	lea    -0x3ec2(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000107ee7:	50                   	push   %rax
ffff800000107ee8:	48 c7 c6 20 00 00 00 	mov    $0x20,%rsi
ffff800000107eef:	e9 64 08 00 00       	jmpq   ffff800000108758 <do_IRQ>

ffff800000107ef4 <IRQ0x21_interrupt>:
ffff800000107ef4:	6a 00                	pushq  $0x0
ffff800000107ef6:	fc                   	cld    
ffff800000107ef7:	50                   	push   %rax
ffff800000107ef8:	50                   	push   %rax
ffff800000107ef9:	48 8c c0             	mov    %es,%rax
ffff800000107efc:	50                   	push   %rax
ffff800000107efd:	48 8c d8             	mov    %ds,%rax
ffff800000107f00:	50                   	push   %rax
ffff800000107f01:	48 31 c0             	xor    %rax,%rax
ffff800000107f04:	55                   	push   %rbp
ffff800000107f05:	57                   	push   %rdi
ffff800000107f06:	56                   	push   %rsi
ffff800000107f07:	52                   	push   %rdx
ffff800000107f08:	51                   	push   %rcx
ffff800000107f09:	53                   	push   %rbx
ffff800000107f0a:	41 50                	push   %r8
ffff800000107f0c:	41 51                	push   %r9
ffff800000107f0e:	41 52                	push   %r10
ffff800000107f10:	41 53                	push   %r11
ffff800000107f12:	41 54                	push   %r12
ffff800000107f14:	41 55                	push   %r13
ffff800000107f16:	41 56                	push   %r14
ffff800000107f18:	41 57                	push   %r15
ffff800000107f1a:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000107f21:	48 8e da             	mov    %rdx,%ds
ffff800000107f24:	48 8e c2             	mov    %rdx,%es
ffff800000107f27:	48 89 e7             	mov    %rsp,%rdi
ffff800000107f2a:	48 8d 05 f4 c0 ff ff 	lea    -0x3f0c(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000107f31:	50                   	push   %rax
ffff800000107f32:	48 c7 c6 21 00 00 00 	mov    $0x21,%rsi
ffff800000107f39:	e9 1a 08 00 00       	jmpq   ffff800000108758 <do_IRQ>

ffff800000107f3e <IRQ0x22_interrupt>:
ffff800000107f3e:	6a 00                	pushq  $0x0
ffff800000107f40:	fc                   	cld    
ffff800000107f41:	50                   	push   %rax
ffff800000107f42:	50                   	push   %rax
ffff800000107f43:	48 8c c0             	mov    %es,%rax
ffff800000107f46:	50                   	push   %rax
ffff800000107f47:	48 8c d8             	mov    %ds,%rax
ffff800000107f4a:	50                   	push   %rax
ffff800000107f4b:	48 31 c0             	xor    %rax,%rax
ffff800000107f4e:	55                   	push   %rbp
ffff800000107f4f:	57                   	push   %rdi
ffff800000107f50:	56                   	push   %rsi
ffff800000107f51:	52                   	push   %rdx
ffff800000107f52:	51                   	push   %rcx
ffff800000107f53:	53                   	push   %rbx
ffff800000107f54:	41 50                	push   %r8
ffff800000107f56:	41 51                	push   %r9
ffff800000107f58:	41 52                	push   %r10
ffff800000107f5a:	41 53                	push   %r11
ffff800000107f5c:	41 54                	push   %r12
ffff800000107f5e:	41 55                	push   %r13
ffff800000107f60:	41 56                	push   %r14
ffff800000107f62:	41 57                	push   %r15
ffff800000107f64:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000107f6b:	48 8e da             	mov    %rdx,%ds
ffff800000107f6e:	48 8e c2             	mov    %rdx,%es
ffff800000107f71:	48 89 e7             	mov    %rsp,%rdi
ffff800000107f74:	48 8d 05 aa c0 ff ff 	lea    -0x3f56(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000107f7b:	50                   	push   %rax
ffff800000107f7c:	48 c7 c6 22 00 00 00 	mov    $0x22,%rsi
ffff800000107f83:	e9 d0 07 00 00       	jmpq   ffff800000108758 <do_IRQ>

ffff800000107f88 <IRQ0x23_interrupt>:
ffff800000107f88:	6a 00                	pushq  $0x0
ffff800000107f8a:	fc                   	cld    
ffff800000107f8b:	50                   	push   %rax
ffff800000107f8c:	50                   	push   %rax
ffff800000107f8d:	48 8c c0             	mov    %es,%rax
ffff800000107f90:	50                   	push   %rax
ffff800000107f91:	48 8c d8             	mov    %ds,%rax
ffff800000107f94:	50                   	push   %rax
ffff800000107f95:	48 31 c0             	xor    %rax,%rax
ffff800000107f98:	55                   	push   %rbp
ffff800000107f99:	57                   	push   %rdi
ffff800000107f9a:	56                   	push   %rsi
ffff800000107f9b:	52                   	push   %rdx
ffff800000107f9c:	51                   	push   %rcx
ffff800000107f9d:	53                   	push   %rbx
ffff800000107f9e:	41 50                	push   %r8
ffff800000107fa0:	41 51                	push   %r9
ffff800000107fa2:	41 52                	push   %r10
ffff800000107fa4:	41 53                	push   %r11
ffff800000107fa6:	41 54                	push   %r12
ffff800000107fa8:	41 55                	push   %r13
ffff800000107faa:	41 56                	push   %r14
ffff800000107fac:	41 57                	push   %r15
ffff800000107fae:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000107fb5:	48 8e da             	mov    %rdx,%ds
ffff800000107fb8:	48 8e c2             	mov    %rdx,%es
ffff800000107fbb:	48 89 e7             	mov    %rsp,%rdi
ffff800000107fbe:	48 8d 05 60 c0 ff ff 	lea    -0x3fa0(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000107fc5:	50                   	push   %rax
ffff800000107fc6:	48 c7 c6 23 00 00 00 	mov    $0x23,%rsi
ffff800000107fcd:	e9 86 07 00 00       	jmpq   ffff800000108758 <do_IRQ>

ffff800000107fd2 <IRQ0x24_interrupt>:
ffff800000107fd2:	6a 00                	pushq  $0x0
ffff800000107fd4:	fc                   	cld    
ffff800000107fd5:	50                   	push   %rax
ffff800000107fd6:	50                   	push   %rax
ffff800000107fd7:	48 8c c0             	mov    %es,%rax
ffff800000107fda:	50                   	push   %rax
ffff800000107fdb:	48 8c d8             	mov    %ds,%rax
ffff800000107fde:	50                   	push   %rax
ffff800000107fdf:	48 31 c0             	xor    %rax,%rax
ffff800000107fe2:	55                   	push   %rbp
ffff800000107fe3:	57                   	push   %rdi
ffff800000107fe4:	56                   	push   %rsi
ffff800000107fe5:	52                   	push   %rdx
ffff800000107fe6:	51                   	push   %rcx
ffff800000107fe7:	53                   	push   %rbx
ffff800000107fe8:	41 50                	push   %r8
ffff800000107fea:	41 51                	push   %r9
ffff800000107fec:	41 52                	push   %r10
ffff800000107fee:	41 53                	push   %r11
ffff800000107ff0:	41 54                	push   %r12
ffff800000107ff2:	41 55                	push   %r13
ffff800000107ff4:	41 56                	push   %r14
ffff800000107ff6:	41 57                	push   %r15
ffff800000107ff8:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000107fff:	48 8e da             	mov    %rdx,%ds
ffff800000108002:	48 8e c2             	mov    %rdx,%es
ffff800000108005:	48 89 e7             	mov    %rsp,%rdi
ffff800000108008:	48 8d 05 16 c0 ff ff 	lea    -0x3fea(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010800f:	50                   	push   %rax
ffff800000108010:	48 c7 c6 24 00 00 00 	mov    $0x24,%rsi
ffff800000108017:	e9 3c 07 00 00       	jmpq   ffff800000108758 <do_IRQ>

ffff80000010801c <IRQ0x25_interrupt>:
ffff80000010801c:	6a 00                	pushq  $0x0
ffff80000010801e:	fc                   	cld    
ffff80000010801f:	50                   	push   %rax
ffff800000108020:	50                   	push   %rax
ffff800000108021:	48 8c c0             	mov    %es,%rax
ffff800000108024:	50                   	push   %rax
ffff800000108025:	48 8c d8             	mov    %ds,%rax
ffff800000108028:	50                   	push   %rax
ffff800000108029:	48 31 c0             	xor    %rax,%rax
ffff80000010802c:	55                   	push   %rbp
ffff80000010802d:	57                   	push   %rdi
ffff80000010802e:	56                   	push   %rsi
ffff80000010802f:	52                   	push   %rdx
ffff800000108030:	51                   	push   %rcx
ffff800000108031:	53                   	push   %rbx
ffff800000108032:	41 50                	push   %r8
ffff800000108034:	41 51                	push   %r9
ffff800000108036:	41 52                	push   %r10
ffff800000108038:	41 53                	push   %r11
ffff80000010803a:	41 54                	push   %r12
ffff80000010803c:	41 55                	push   %r13
ffff80000010803e:	41 56                	push   %r14
ffff800000108040:	41 57                	push   %r15
ffff800000108042:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108049:	48 8e da             	mov    %rdx,%ds
ffff80000010804c:	48 8e c2             	mov    %rdx,%es
ffff80000010804f:	48 89 e7             	mov    %rsp,%rdi
ffff800000108052:	48 8d 05 cc bf ff ff 	lea    -0x4034(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108059:	50                   	push   %rax
ffff80000010805a:	48 c7 c6 25 00 00 00 	mov    $0x25,%rsi
ffff800000108061:	e9 f2 06 00 00       	jmpq   ffff800000108758 <do_IRQ>

ffff800000108066 <IRQ0x26_interrupt>:
ffff800000108066:	6a 00                	pushq  $0x0
ffff800000108068:	fc                   	cld    
ffff800000108069:	50                   	push   %rax
ffff80000010806a:	50                   	push   %rax
ffff80000010806b:	48 8c c0             	mov    %es,%rax
ffff80000010806e:	50                   	push   %rax
ffff80000010806f:	48 8c d8             	mov    %ds,%rax
ffff800000108072:	50                   	push   %rax
ffff800000108073:	48 31 c0             	xor    %rax,%rax
ffff800000108076:	55                   	push   %rbp
ffff800000108077:	57                   	push   %rdi
ffff800000108078:	56                   	push   %rsi
ffff800000108079:	52                   	push   %rdx
ffff80000010807a:	51                   	push   %rcx
ffff80000010807b:	53                   	push   %rbx
ffff80000010807c:	41 50                	push   %r8
ffff80000010807e:	41 51                	push   %r9
ffff800000108080:	41 52                	push   %r10
ffff800000108082:	41 53                	push   %r11
ffff800000108084:	41 54                	push   %r12
ffff800000108086:	41 55                	push   %r13
ffff800000108088:	41 56                	push   %r14
ffff80000010808a:	41 57                	push   %r15
ffff80000010808c:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108093:	48 8e da             	mov    %rdx,%ds
ffff800000108096:	48 8e c2             	mov    %rdx,%es
ffff800000108099:	48 89 e7             	mov    %rsp,%rdi
ffff80000010809c:	48 8d 05 82 bf ff ff 	lea    -0x407e(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001080a3:	50                   	push   %rax
ffff8000001080a4:	48 c7 c6 26 00 00 00 	mov    $0x26,%rsi
ffff8000001080ab:	e9 a8 06 00 00       	jmpq   ffff800000108758 <do_IRQ>

ffff8000001080b0 <IRQ0x27_interrupt>:
ffff8000001080b0:	6a 00                	pushq  $0x0
ffff8000001080b2:	fc                   	cld    
ffff8000001080b3:	50                   	push   %rax
ffff8000001080b4:	50                   	push   %rax
ffff8000001080b5:	48 8c c0             	mov    %es,%rax
ffff8000001080b8:	50                   	push   %rax
ffff8000001080b9:	48 8c d8             	mov    %ds,%rax
ffff8000001080bc:	50                   	push   %rax
ffff8000001080bd:	48 31 c0             	xor    %rax,%rax
ffff8000001080c0:	55                   	push   %rbp
ffff8000001080c1:	57                   	push   %rdi
ffff8000001080c2:	56                   	push   %rsi
ffff8000001080c3:	52                   	push   %rdx
ffff8000001080c4:	51                   	push   %rcx
ffff8000001080c5:	53                   	push   %rbx
ffff8000001080c6:	41 50                	push   %r8
ffff8000001080c8:	41 51                	push   %r9
ffff8000001080ca:	41 52                	push   %r10
ffff8000001080cc:	41 53                	push   %r11
ffff8000001080ce:	41 54                	push   %r12
ffff8000001080d0:	41 55                	push   %r13
ffff8000001080d2:	41 56                	push   %r14
ffff8000001080d4:	41 57                	push   %r15
ffff8000001080d6:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001080dd:	48 8e da             	mov    %rdx,%ds
ffff8000001080e0:	48 8e c2             	mov    %rdx,%es
ffff8000001080e3:	48 89 e7             	mov    %rsp,%rdi
ffff8000001080e6:	48 8d 05 38 bf ff ff 	lea    -0x40c8(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001080ed:	50                   	push   %rax
ffff8000001080ee:	48 c7 c6 27 00 00 00 	mov    $0x27,%rsi
ffff8000001080f5:	e9 5e 06 00 00       	jmpq   ffff800000108758 <do_IRQ>

ffff8000001080fa <IRQ0x28_interrupt>:
ffff8000001080fa:	6a 00                	pushq  $0x0
ffff8000001080fc:	fc                   	cld    
ffff8000001080fd:	50                   	push   %rax
ffff8000001080fe:	50                   	push   %rax
ffff8000001080ff:	48 8c c0             	mov    %es,%rax
ffff800000108102:	50                   	push   %rax
ffff800000108103:	48 8c d8             	mov    %ds,%rax
ffff800000108106:	50                   	push   %rax
ffff800000108107:	48 31 c0             	xor    %rax,%rax
ffff80000010810a:	55                   	push   %rbp
ffff80000010810b:	57                   	push   %rdi
ffff80000010810c:	56                   	push   %rsi
ffff80000010810d:	52                   	push   %rdx
ffff80000010810e:	51                   	push   %rcx
ffff80000010810f:	53                   	push   %rbx
ffff800000108110:	41 50                	push   %r8
ffff800000108112:	41 51                	push   %r9
ffff800000108114:	41 52                	push   %r10
ffff800000108116:	41 53                	push   %r11
ffff800000108118:	41 54                	push   %r12
ffff80000010811a:	41 55                	push   %r13
ffff80000010811c:	41 56                	push   %r14
ffff80000010811e:	41 57                	push   %r15
ffff800000108120:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108127:	48 8e da             	mov    %rdx,%ds
ffff80000010812a:	48 8e c2             	mov    %rdx,%es
ffff80000010812d:	48 89 e7             	mov    %rsp,%rdi
ffff800000108130:	48 8d 05 ee be ff ff 	lea    -0x4112(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108137:	50                   	push   %rax
ffff800000108138:	48 c7 c6 28 00 00 00 	mov    $0x28,%rsi
ffff80000010813f:	e9 14 06 00 00       	jmpq   ffff800000108758 <do_IRQ>

ffff800000108144 <IRQ0x29_interrupt>:
ffff800000108144:	6a 00                	pushq  $0x0
ffff800000108146:	fc                   	cld    
ffff800000108147:	50                   	push   %rax
ffff800000108148:	50                   	push   %rax
ffff800000108149:	48 8c c0             	mov    %es,%rax
ffff80000010814c:	50                   	push   %rax
ffff80000010814d:	48 8c d8             	mov    %ds,%rax
ffff800000108150:	50                   	push   %rax
ffff800000108151:	48 31 c0             	xor    %rax,%rax
ffff800000108154:	55                   	push   %rbp
ffff800000108155:	57                   	push   %rdi
ffff800000108156:	56                   	push   %rsi
ffff800000108157:	52                   	push   %rdx
ffff800000108158:	51                   	push   %rcx
ffff800000108159:	53                   	push   %rbx
ffff80000010815a:	41 50                	push   %r8
ffff80000010815c:	41 51                	push   %r9
ffff80000010815e:	41 52                	push   %r10
ffff800000108160:	41 53                	push   %r11
ffff800000108162:	41 54                	push   %r12
ffff800000108164:	41 55                	push   %r13
ffff800000108166:	41 56                	push   %r14
ffff800000108168:	41 57                	push   %r15
ffff80000010816a:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108171:	48 8e da             	mov    %rdx,%ds
ffff800000108174:	48 8e c2             	mov    %rdx,%es
ffff800000108177:	48 89 e7             	mov    %rsp,%rdi
ffff80000010817a:	48 8d 05 a4 be ff ff 	lea    -0x415c(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108181:	50                   	push   %rax
ffff800000108182:	48 c7 c6 29 00 00 00 	mov    $0x29,%rsi
ffff800000108189:	e9 ca 05 00 00       	jmpq   ffff800000108758 <do_IRQ>

ffff80000010818e <IRQ0x2a_interrupt>:
ffff80000010818e:	6a 00                	pushq  $0x0
ffff800000108190:	fc                   	cld    
ffff800000108191:	50                   	push   %rax
ffff800000108192:	50                   	push   %rax
ffff800000108193:	48 8c c0             	mov    %es,%rax
ffff800000108196:	50                   	push   %rax
ffff800000108197:	48 8c d8             	mov    %ds,%rax
ffff80000010819a:	50                   	push   %rax
ffff80000010819b:	48 31 c0             	xor    %rax,%rax
ffff80000010819e:	55                   	push   %rbp
ffff80000010819f:	57                   	push   %rdi
ffff8000001081a0:	56                   	push   %rsi
ffff8000001081a1:	52                   	push   %rdx
ffff8000001081a2:	51                   	push   %rcx
ffff8000001081a3:	53                   	push   %rbx
ffff8000001081a4:	41 50                	push   %r8
ffff8000001081a6:	41 51                	push   %r9
ffff8000001081a8:	41 52                	push   %r10
ffff8000001081aa:	41 53                	push   %r11
ffff8000001081ac:	41 54                	push   %r12
ffff8000001081ae:	41 55                	push   %r13
ffff8000001081b0:	41 56                	push   %r14
ffff8000001081b2:	41 57                	push   %r15
ffff8000001081b4:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001081bb:	48 8e da             	mov    %rdx,%ds
ffff8000001081be:	48 8e c2             	mov    %rdx,%es
ffff8000001081c1:	48 89 e7             	mov    %rsp,%rdi
ffff8000001081c4:	48 8d 05 5a be ff ff 	lea    -0x41a6(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001081cb:	50                   	push   %rax
ffff8000001081cc:	48 c7 c6 2a 00 00 00 	mov    $0x2a,%rsi
ffff8000001081d3:	e9 80 05 00 00       	jmpq   ffff800000108758 <do_IRQ>

ffff8000001081d8 <IRQ0x2b_interrupt>:
ffff8000001081d8:	6a 00                	pushq  $0x0
ffff8000001081da:	fc                   	cld    
ffff8000001081db:	50                   	push   %rax
ffff8000001081dc:	50                   	push   %rax
ffff8000001081dd:	48 8c c0             	mov    %es,%rax
ffff8000001081e0:	50                   	push   %rax
ffff8000001081e1:	48 8c d8             	mov    %ds,%rax
ffff8000001081e4:	50                   	push   %rax
ffff8000001081e5:	48 31 c0             	xor    %rax,%rax
ffff8000001081e8:	55                   	push   %rbp
ffff8000001081e9:	57                   	push   %rdi
ffff8000001081ea:	56                   	push   %rsi
ffff8000001081eb:	52                   	push   %rdx
ffff8000001081ec:	51                   	push   %rcx
ffff8000001081ed:	53                   	push   %rbx
ffff8000001081ee:	41 50                	push   %r8
ffff8000001081f0:	41 51                	push   %r9
ffff8000001081f2:	41 52                	push   %r10
ffff8000001081f4:	41 53                	push   %r11
ffff8000001081f6:	41 54                	push   %r12
ffff8000001081f8:	41 55                	push   %r13
ffff8000001081fa:	41 56                	push   %r14
ffff8000001081fc:	41 57                	push   %r15
ffff8000001081fe:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108205:	48 8e da             	mov    %rdx,%ds
ffff800000108208:	48 8e c2             	mov    %rdx,%es
ffff80000010820b:	48 89 e7             	mov    %rsp,%rdi
ffff80000010820e:	48 8d 05 10 be ff ff 	lea    -0x41f0(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108215:	50                   	push   %rax
ffff800000108216:	48 c7 c6 2b 00 00 00 	mov    $0x2b,%rsi
ffff80000010821d:	e9 36 05 00 00       	jmpq   ffff800000108758 <do_IRQ>

ffff800000108222 <IRQ0x2c_interrupt>:
ffff800000108222:	6a 00                	pushq  $0x0
ffff800000108224:	fc                   	cld    
ffff800000108225:	50                   	push   %rax
ffff800000108226:	50                   	push   %rax
ffff800000108227:	48 8c c0             	mov    %es,%rax
ffff80000010822a:	50                   	push   %rax
ffff80000010822b:	48 8c d8             	mov    %ds,%rax
ffff80000010822e:	50                   	push   %rax
ffff80000010822f:	48 31 c0             	xor    %rax,%rax
ffff800000108232:	55                   	push   %rbp
ffff800000108233:	57                   	push   %rdi
ffff800000108234:	56                   	push   %rsi
ffff800000108235:	52                   	push   %rdx
ffff800000108236:	51                   	push   %rcx
ffff800000108237:	53                   	push   %rbx
ffff800000108238:	41 50                	push   %r8
ffff80000010823a:	41 51                	push   %r9
ffff80000010823c:	41 52                	push   %r10
ffff80000010823e:	41 53                	push   %r11
ffff800000108240:	41 54                	push   %r12
ffff800000108242:	41 55                	push   %r13
ffff800000108244:	41 56                	push   %r14
ffff800000108246:	41 57                	push   %r15
ffff800000108248:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010824f:	48 8e da             	mov    %rdx,%ds
ffff800000108252:	48 8e c2             	mov    %rdx,%es
ffff800000108255:	48 89 e7             	mov    %rsp,%rdi
ffff800000108258:	48 8d 05 c6 bd ff ff 	lea    -0x423a(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010825f:	50                   	push   %rax
ffff800000108260:	48 c7 c6 2c 00 00 00 	mov    $0x2c,%rsi
ffff800000108267:	e9 ec 04 00 00       	jmpq   ffff800000108758 <do_IRQ>

ffff80000010826c <IRQ0x2d_interrupt>:
ffff80000010826c:	6a 00                	pushq  $0x0
ffff80000010826e:	fc                   	cld    
ffff80000010826f:	50                   	push   %rax
ffff800000108270:	50                   	push   %rax
ffff800000108271:	48 8c c0             	mov    %es,%rax
ffff800000108274:	50                   	push   %rax
ffff800000108275:	48 8c d8             	mov    %ds,%rax
ffff800000108278:	50                   	push   %rax
ffff800000108279:	48 31 c0             	xor    %rax,%rax
ffff80000010827c:	55                   	push   %rbp
ffff80000010827d:	57                   	push   %rdi
ffff80000010827e:	56                   	push   %rsi
ffff80000010827f:	52                   	push   %rdx
ffff800000108280:	51                   	push   %rcx
ffff800000108281:	53                   	push   %rbx
ffff800000108282:	41 50                	push   %r8
ffff800000108284:	41 51                	push   %r9
ffff800000108286:	41 52                	push   %r10
ffff800000108288:	41 53                	push   %r11
ffff80000010828a:	41 54                	push   %r12
ffff80000010828c:	41 55                	push   %r13
ffff80000010828e:	41 56                	push   %r14
ffff800000108290:	41 57                	push   %r15
ffff800000108292:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108299:	48 8e da             	mov    %rdx,%ds
ffff80000010829c:	48 8e c2             	mov    %rdx,%es
ffff80000010829f:	48 89 e7             	mov    %rsp,%rdi
ffff8000001082a2:	48 8d 05 7c bd ff ff 	lea    -0x4284(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001082a9:	50                   	push   %rax
ffff8000001082aa:	48 c7 c6 2d 00 00 00 	mov    $0x2d,%rsi
ffff8000001082b1:	e9 a2 04 00 00       	jmpq   ffff800000108758 <do_IRQ>

ffff8000001082b6 <IRQ0x2e_interrupt>:
ffff8000001082b6:	6a 00                	pushq  $0x0
ffff8000001082b8:	fc                   	cld    
ffff8000001082b9:	50                   	push   %rax
ffff8000001082ba:	50                   	push   %rax
ffff8000001082bb:	48 8c c0             	mov    %es,%rax
ffff8000001082be:	50                   	push   %rax
ffff8000001082bf:	48 8c d8             	mov    %ds,%rax
ffff8000001082c2:	50                   	push   %rax
ffff8000001082c3:	48 31 c0             	xor    %rax,%rax
ffff8000001082c6:	55                   	push   %rbp
ffff8000001082c7:	57                   	push   %rdi
ffff8000001082c8:	56                   	push   %rsi
ffff8000001082c9:	52                   	push   %rdx
ffff8000001082ca:	51                   	push   %rcx
ffff8000001082cb:	53                   	push   %rbx
ffff8000001082cc:	41 50                	push   %r8
ffff8000001082ce:	41 51                	push   %r9
ffff8000001082d0:	41 52                	push   %r10
ffff8000001082d2:	41 53                	push   %r11
ffff8000001082d4:	41 54                	push   %r12
ffff8000001082d6:	41 55                	push   %r13
ffff8000001082d8:	41 56                	push   %r14
ffff8000001082da:	41 57                	push   %r15
ffff8000001082dc:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001082e3:	48 8e da             	mov    %rdx,%ds
ffff8000001082e6:	48 8e c2             	mov    %rdx,%es
ffff8000001082e9:	48 89 e7             	mov    %rsp,%rdi
ffff8000001082ec:	48 8d 05 32 bd ff ff 	lea    -0x42ce(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001082f3:	50                   	push   %rax
ffff8000001082f4:	48 c7 c6 2e 00 00 00 	mov    $0x2e,%rsi
ffff8000001082fb:	e9 58 04 00 00       	jmpq   ffff800000108758 <do_IRQ>

ffff800000108300 <IRQ0x2f_interrupt>:
ffff800000108300:	6a 00                	pushq  $0x0
ffff800000108302:	fc                   	cld    
ffff800000108303:	50                   	push   %rax
ffff800000108304:	50                   	push   %rax
ffff800000108305:	48 8c c0             	mov    %es,%rax
ffff800000108308:	50                   	push   %rax
ffff800000108309:	48 8c d8             	mov    %ds,%rax
ffff80000010830c:	50                   	push   %rax
ffff80000010830d:	48 31 c0             	xor    %rax,%rax
ffff800000108310:	55                   	push   %rbp
ffff800000108311:	57                   	push   %rdi
ffff800000108312:	56                   	push   %rsi
ffff800000108313:	52                   	push   %rdx
ffff800000108314:	51                   	push   %rcx
ffff800000108315:	53                   	push   %rbx
ffff800000108316:	41 50                	push   %r8
ffff800000108318:	41 51                	push   %r9
ffff80000010831a:	41 52                	push   %r10
ffff80000010831c:	41 53                	push   %r11
ffff80000010831e:	41 54                	push   %r12
ffff800000108320:	41 55                	push   %r13
ffff800000108322:	41 56                	push   %r14
ffff800000108324:	41 57                	push   %r15
ffff800000108326:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010832d:	48 8e da             	mov    %rdx,%ds
ffff800000108330:	48 8e c2             	mov    %rdx,%es
ffff800000108333:	48 89 e7             	mov    %rsp,%rdi
ffff800000108336:	48 8d 05 e8 bc ff ff 	lea    -0x4318(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010833d:	50                   	push   %rax
ffff80000010833e:	48 c7 c6 2f 00 00 00 	mov    $0x2f,%rsi
ffff800000108345:	e9 0e 04 00 00       	jmpq   ffff800000108758 <do_IRQ>

ffff80000010834a <IRQ0x30_interrupt>:
ffff80000010834a:	6a 00                	pushq  $0x0
ffff80000010834c:	fc                   	cld    
ffff80000010834d:	50                   	push   %rax
ffff80000010834e:	50                   	push   %rax
ffff80000010834f:	48 8c c0             	mov    %es,%rax
ffff800000108352:	50                   	push   %rax
ffff800000108353:	48 8c d8             	mov    %ds,%rax
ffff800000108356:	50                   	push   %rax
ffff800000108357:	48 31 c0             	xor    %rax,%rax
ffff80000010835a:	55                   	push   %rbp
ffff80000010835b:	57                   	push   %rdi
ffff80000010835c:	56                   	push   %rsi
ffff80000010835d:	52                   	push   %rdx
ffff80000010835e:	51                   	push   %rcx
ffff80000010835f:	53                   	push   %rbx
ffff800000108360:	41 50                	push   %r8
ffff800000108362:	41 51                	push   %r9
ffff800000108364:	41 52                	push   %r10
ffff800000108366:	41 53                	push   %r11
ffff800000108368:	41 54                	push   %r12
ffff80000010836a:	41 55                	push   %r13
ffff80000010836c:	41 56                	push   %r14
ffff80000010836e:	41 57                	push   %r15
ffff800000108370:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108377:	48 8e da             	mov    %rdx,%ds
ffff80000010837a:	48 8e c2             	mov    %rdx,%es
ffff80000010837d:	48 89 e7             	mov    %rsp,%rdi
ffff800000108380:	48 8d 05 9e bc ff ff 	lea    -0x4362(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108387:	50                   	push   %rax
ffff800000108388:	48 c7 c6 30 00 00 00 	mov    $0x30,%rsi
ffff80000010838f:	e9 c4 03 00 00       	jmpq   ffff800000108758 <do_IRQ>

ffff800000108394 <IRQ0x31_interrupt>:
ffff800000108394:	6a 00                	pushq  $0x0
ffff800000108396:	fc                   	cld    
ffff800000108397:	50                   	push   %rax
ffff800000108398:	50                   	push   %rax
ffff800000108399:	48 8c c0             	mov    %es,%rax
ffff80000010839c:	50                   	push   %rax
ffff80000010839d:	48 8c d8             	mov    %ds,%rax
ffff8000001083a0:	50                   	push   %rax
ffff8000001083a1:	48 31 c0             	xor    %rax,%rax
ffff8000001083a4:	55                   	push   %rbp
ffff8000001083a5:	57                   	push   %rdi
ffff8000001083a6:	56                   	push   %rsi
ffff8000001083a7:	52                   	push   %rdx
ffff8000001083a8:	51                   	push   %rcx
ffff8000001083a9:	53                   	push   %rbx
ffff8000001083aa:	41 50                	push   %r8
ffff8000001083ac:	41 51                	push   %r9
ffff8000001083ae:	41 52                	push   %r10
ffff8000001083b0:	41 53                	push   %r11
ffff8000001083b2:	41 54                	push   %r12
ffff8000001083b4:	41 55                	push   %r13
ffff8000001083b6:	41 56                	push   %r14
ffff8000001083b8:	41 57                	push   %r15
ffff8000001083ba:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001083c1:	48 8e da             	mov    %rdx,%ds
ffff8000001083c4:	48 8e c2             	mov    %rdx,%es
ffff8000001083c7:	48 89 e7             	mov    %rsp,%rdi
ffff8000001083ca:	48 8d 05 54 bc ff ff 	lea    -0x43ac(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001083d1:	50                   	push   %rax
ffff8000001083d2:	48 c7 c6 31 00 00 00 	mov    $0x31,%rsi
ffff8000001083d9:	e9 7a 03 00 00       	jmpq   ffff800000108758 <do_IRQ>

ffff8000001083de <IRQ0x32_interrupt>:
ffff8000001083de:	6a 00                	pushq  $0x0
ffff8000001083e0:	fc                   	cld    
ffff8000001083e1:	50                   	push   %rax
ffff8000001083e2:	50                   	push   %rax
ffff8000001083e3:	48 8c c0             	mov    %es,%rax
ffff8000001083e6:	50                   	push   %rax
ffff8000001083e7:	48 8c d8             	mov    %ds,%rax
ffff8000001083ea:	50                   	push   %rax
ffff8000001083eb:	48 31 c0             	xor    %rax,%rax
ffff8000001083ee:	55                   	push   %rbp
ffff8000001083ef:	57                   	push   %rdi
ffff8000001083f0:	56                   	push   %rsi
ffff8000001083f1:	52                   	push   %rdx
ffff8000001083f2:	51                   	push   %rcx
ffff8000001083f3:	53                   	push   %rbx
ffff8000001083f4:	41 50                	push   %r8
ffff8000001083f6:	41 51                	push   %r9
ffff8000001083f8:	41 52                	push   %r10
ffff8000001083fa:	41 53                	push   %r11
ffff8000001083fc:	41 54                	push   %r12
ffff8000001083fe:	41 55                	push   %r13
ffff800000108400:	41 56                	push   %r14
ffff800000108402:	41 57                	push   %r15
ffff800000108404:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010840b:	48 8e da             	mov    %rdx,%ds
ffff80000010840e:	48 8e c2             	mov    %rdx,%es
ffff800000108411:	48 89 e7             	mov    %rsp,%rdi
ffff800000108414:	48 8d 05 0a bc ff ff 	lea    -0x43f6(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010841b:	50                   	push   %rax
ffff80000010841c:	48 c7 c6 32 00 00 00 	mov    $0x32,%rsi
ffff800000108423:	e9 30 03 00 00       	jmpq   ffff800000108758 <do_IRQ>

ffff800000108428 <IRQ0x33_interrupt>:
ffff800000108428:	6a 00                	pushq  $0x0
ffff80000010842a:	fc                   	cld    
ffff80000010842b:	50                   	push   %rax
ffff80000010842c:	50                   	push   %rax
ffff80000010842d:	48 8c c0             	mov    %es,%rax
ffff800000108430:	50                   	push   %rax
ffff800000108431:	48 8c d8             	mov    %ds,%rax
ffff800000108434:	50                   	push   %rax
ffff800000108435:	48 31 c0             	xor    %rax,%rax
ffff800000108438:	55                   	push   %rbp
ffff800000108439:	57                   	push   %rdi
ffff80000010843a:	56                   	push   %rsi
ffff80000010843b:	52                   	push   %rdx
ffff80000010843c:	51                   	push   %rcx
ffff80000010843d:	53                   	push   %rbx
ffff80000010843e:	41 50                	push   %r8
ffff800000108440:	41 51                	push   %r9
ffff800000108442:	41 52                	push   %r10
ffff800000108444:	41 53                	push   %r11
ffff800000108446:	41 54                	push   %r12
ffff800000108448:	41 55                	push   %r13
ffff80000010844a:	41 56                	push   %r14
ffff80000010844c:	41 57                	push   %r15
ffff80000010844e:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108455:	48 8e da             	mov    %rdx,%ds
ffff800000108458:	48 8e c2             	mov    %rdx,%es
ffff80000010845b:	48 89 e7             	mov    %rsp,%rdi
ffff80000010845e:	48 8d 05 c0 bb ff ff 	lea    -0x4440(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108465:	50                   	push   %rax
ffff800000108466:	48 c7 c6 33 00 00 00 	mov    $0x33,%rsi
ffff80000010846d:	e9 e6 02 00 00       	jmpq   ffff800000108758 <do_IRQ>

ffff800000108472 <IRQ0x34_interrupt>:
ffff800000108472:	6a 00                	pushq  $0x0
ffff800000108474:	fc                   	cld    
ffff800000108475:	50                   	push   %rax
ffff800000108476:	50                   	push   %rax
ffff800000108477:	48 8c c0             	mov    %es,%rax
ffff80000010847a:	50                   	push   %rax
ffff80000010847b:	48 8c d8             	mov    %ds,%rax
ffff80000010847e:	50                   	push   %rax
ffff80000010847f:	48 31 c0             	xor    %rax,%rax
ffff800000108482:	55                   	push   %rbp
ffff800000108483:	57                   	push   %rdi
ffff800000108484:	56                   	push   %rsi
ffff800000108485:	52                   	push   %rdx
ffff800000108486:	51                   	push   %rcx
ffff800000108487:	53                   	push   %rbx
ffff800000108488:	41 50                	push   %r8
ffff80000010848a:	41 51                	push   %r9
ffff80000010848c:	41 52                	push   %r10
ffff80000010848e:	41 53                	push   %r11
ffff800000108490:	41 54                	push   %r12
ffff800000108492:	41 55                	push   %r13
ffff800000108494:	41 56                	push   %r14
ffff800000108496:	41 57                	push   %r15
ffff800000108498:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010849f:	48 8e da             	mov    %rdx,%ds
ffff8000001084a2:	48 8e c2             	mov    %rdx,%es
ffff8000001084a5:	48 89 e7             	mov    %rsp,%rdi
ffff8000001084a8:	48 8d 05 76 bb ff ff 	lea    -0x448a(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001084af:	50                   	push   %rax
ffff8000001084b0:	48 c7 c6 34 00 00 00 	mov    $0x34,%rsi
ffff8000001084b7:	e9 9c 02 00 00       	jmpq   ffff800000108758 <do_IRQ>

ffff8000001084bc <IRQ0x35_interrupt>:
ffff8000001084bc:	6a 00                	pushq  $0x0
ffff8000001084be:	fc                   	cld    
ffff8000001084bf:	50                   	push   %rax
ffff8000001084c0:	50                   	push   %rax
ffff8000001084c1:	48 8c c0             	mov    %es,%rax
ffff8000001084c4:	50                   	push   %rax
ffff8000001084c5:	48 8c d8             	mov    %ds,%rax
ffff8000001084c8:	50                   	push   %rax
ffff8000001084c9:	48 31 c0             	xor    %rax,%rax
ffff8000001084cc:	55                   	push   %rbp
ffff8000001084cd:	57                   	push   %rdi
ffff8000001084ce:	56                   	push   %rsi
ffff8000001084cf:	52                   	push   %rdx
ffff8000001084d0:	51                   	push   %rcx
ffff8000001084d1:	53                   	push   %rbx
ffff8000001084d2:	41 50                	push   %r8
ffff8000001084d4:	41 51                	push   %r9
ffff8000001084d6:	41 52                	push   %r10
ffff8000001084d8:	41 53                	push   %r11
ffff8000001084da:	41 54                	push   %r12
ffff8000001084dc:	41 55                	push   %r13
ffff8000001084de:	41 56                	push   %r14
ffff8000001084e0:	41 57                	push   %r15
ffff8000001084e2:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001084e9:	48 8e da             	mov    %rdx,%ds
ffff8000001084ec:	48 8e c2             	mov    %rdx,%es
ffff8000001084ef:	48 89 e7             	mov    %rsp,%rdi
ffff8000001084f2:	48 8d 05 2c bb ff ff 	lea    -0x44d4(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001084f9:	50                   	push   %rax
ffff8000001084fa:	48 c7 c6 35 00 00 00 	mov    $0x35,%rsi
ffff800000108501:	e9 52 02 00 00       	jmpq   ffff800000108758 <do_IRQ>

ffff800000108506 <IRQ0x36_interrupt>:
ffff800000108506:	6a 00                	pushq  $0x0
ffff800000108508:	fc                   	cld    
ffff800000108509:	50                   	push   %rax
ffff80000010850a:	50                   	push   %rax
ffff80000010850b:	48 8c c0             	mov    %es,%rax
ffff80000010850e:	50                   	push   %rax
ffff80000010850f:	48 8c d8             	mov    %ds,%rax
ffff800000108512:	50                   	push   %rax
ffff800000108513:	48 31 c0             	xor    %rax,%rax
ffff800000108516:	55                   	push   %rbp
ffff800000108517:	57                   	push   %rdi
ffff800000108518:	56                   	push   %rsi
ffff800000108519:	52                   	push   %rdx
ffff80000010851a:	51                   	push   %rcx
ffff80000010851b:	53                   	push   %rbx
ffff80000010851c:	41 50                	push   %r8
ffff80000010851e:	41 51                	push   %r9
ffff800000108520:	41 52                	push   %r10
ffff800000108522:	41 53                	push   %r11
ffff800000108524:	41 54                	push   %r12
ffff800000108526:	41 55                	push   %r13
ffff800000108528:	41 56                	push   %r14
ffff80000010852a:	41 57                	push   %r15
ffff80000010852c:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108533:	48 8e da             	mov    %rdx,%ds
ffff800000108536:	48 8e c2             	mov    %rdx,%es
ffff800000108539:	48 89 e7             	mov    %rsp,%rdi
ffff80000010853c:	48 8d 05 e2 ba ff ff 	lea    -0x451e(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108543:	50                   	push   %rax
ffff800000108544:	48 c7 c6 36 00 00 00 	mov    $0x36,%rsi
ffff80000010854b:	e9 08 02 00 00       	jmpq   ffff800000108758 <do_IRQ>

ffff800000108550 <IRQ0x37_interrupt>:
ffff800000108550:	6a 00                	pushq  $0x0
ffff800000108552:	fc                   	cld    
ffff800000108553:	50                   	push   %rax
ffff800000108554:	50                   	push   %rax
ffff800000108555:	48 8c c0             	mov    %es,%rax
ffff800000108558:	50                   	push   %rax
ffff800000108559:	48 8c d8             	mov    %ds,%rax
ffff80000010855c:	50                   	push   %rax
ffff80000010855d:	48 31 c0             	xor    %rax,%rax
ffff800000108560:	55                   	push   %rbp
ffff800000108561:	57                   	push   %rdi
ffff800000108562:	56                   	push   %rsi
ffff800000108563:	52                   	push   %rdx
ffff800000108564:	51                   	push   %rcx
ffff800000108565:	53                   	push   %rbx
ffff800000108566:	41 50                	push   %r8
ffff800000108568:	41 51                	push   %r9
ffff80000010856a:	41 52                	push   %r10
ffff80000010856c:	41 53                	push   %r11
ffff80000010856e:	41 54                	push   %r12
ffff800000108570:	41 55                	push   %r13
ffff800000108572:	41 56                	push   %r14
ffff800000108574:	41 57                	push   %r15
ffff800000108576:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010857d:	48 8e da             	mov    %rdx,%ds
ffff800000108580:	48 8e c2             	mov    %rdx,%es
ffff800000108583:	48 89 e7             	mov    %rsp,%rdi
ffff800000108586:	48 8d 05 98 ba ff ff 	lea    -0x4568(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010858d:	50                   	push   %rax
ffff80000010858e:	48 c7 c6 37 00 00 00 	mov    $0x37,%rsi
ffff800000108595:	e9 be 01 00 00       	jmpq   ffff800000108758 <do_IRQ>

ffff80000010859a <init_interrupt>:
ffff80000010859a:	55                   	push   %rbp
ffff80000010859b:	48 89 e5             	mov    %rsp,%rbp
ffff80000010859e:	41 57                	push   %r15
ffff8000001085a0:	53                   	push   %rbx
ffff8000001085a1:	48 83 ec 10          	sub    $0x10,%rsp
ffff8000001085a5:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff8000001085a5 <init_interrupt+0xb>
ffff8000001085ac:	49 bb 83 34 00 00 00 	movabs $0x3483,%r11
ffff8000001085b3:	00 00 00 
ffff8000001085b6:	4c 01 db             	add    %r11,%rbx
ffff8000001085b9:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%rbp)
ffff8000001085c0:	eb 3e                	jmp    ffff800000108600 <init_interrupt+0x66>
ffff8000001085c2:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff8000001085c5:	83 e8 20             	sub    $0x20,%eax
ffff8000001085c8:	48 ba 98 0f 00 00 00 	movabs $0xf98,%rdx
ffff8000001085cf:	00 00 00 
ffff8000001085d2:	48 98                	cltq   
ffff8000001085d4:	48 01 da             	add    %rbx,%rdx
ffff8000001085d7:	48 8b 14 c2          	mov    (%rdx,%rax,8),%rdx
ffff8000001085db:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff8000001085de:	be 02 00 00 00       	mov    $0x2,%esi
ffff8000001085e3:	89 c7                	mov    %eax,%edi
ffff8000001085e5:	49 89 df             	mov    %rbx,%r15
ffff8000001085e8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001085ed:	48 b9 f9 88 ff ff ff 	movabs $0xffffffffffff88f9,%rcx
ffff8000001085f4:	ff ff ff 
ffff8000001085f7:	48 01 d9             	add    %rbx,%rcx
ffff8000001085fa:	ff d1                	callq  *%rcx
ffff8000001085fc:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
ffff800000108600:	83 7d ec 37          	cmpl   $0x37,-0x14(%rbp)
ffff800000108604:	7e bc                	jle    ffff8000001085c2 <init_interrupt+0x28>
ffff800000108606:	48 b8 3d 18 00 00 00 	movabs $0x183d,%rax
ffff80000010860d:	00 00 00 
ffff800000108610:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000108614:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108619:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010861e:	49 89 df             	mov    %rbx,%r15
ffff800000108621:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108626:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff80000010862d:	ff ff ff 
ffff800000108630:	48 01 d9             	add    %rbx,%rcx
ffff800000108633:	ff d1                	callq  *%rcx
ffff800000108635:	be 11 00 00 00       	mov    $0x11,%esi
ffff80000010863a:	bf 20 00 00 00       	mov    $0x20,%edi
ffff80000010863f:	49 89 df             	mov    %rbx,%r15
ffff800000108642:	48 b8 38 c2 ff ff ff 	movabs $0xffffffffffffc238,%rax
ffff800000108649:	ff ff ff 
ffff80000010864c:	48 01 d8             	add    %rbx,%rax
ffff80000010864f:	ff d0                	callq  *%rax
ffff800000108651:	be 20 00 00 00       	mov    $0x20,%esi
ffff800000108656:	bf 21 00 00 00       	mov    $0x21,%edi
ffff80000010865b:	49 89 df             	mov    %rbx,%r15
ffff80000010865e:	48 b8 38 c2 ff ff ff 	movabs $0xffffffffffffc238,%rax
ffff800000108665:	ff ff ff 
ffff800000108668:	48 01 d8             	add    %rbx,%rax
ffff80000010866b:	ff d0                	callq  *%rax
ffff80000010866d:	be 04 00 00 00       	mov    $0x4,%esi
ffff800000108672:	bf 21 00 00 00       	mov    $0x21,%edi
ffff800000108677:	49 89 df             	mov    %rbx,%r15
ffff80000010867a:	48 b8 38 c2 ff ff ff 	movabs $0xffffffffffffc238,%rax
ffff800000108681:	ff ff ff 
ffff800000108684:	48 01 d8             	add    %rbx,%rax
ffff800000108687:	ff d0                	callq  *%rax
ffff800000108689:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010868e:	bf 21 00 00 00       	mov    $0x21,%edi
ffff800000108693:	49 89 df             	mov    %rbx,%r15
ffff800000108696:	48 b8 38 c2 ff ff ff 	movabs $0xffffffffffffc238,%rax
ffff80000010869d:	ff ff ff 
ffff8000001086a0:	48 01 d8             	add    %rbx,%rax
ffff8000001086a3:	ff d0                	callq  *%rax
ffff8000001086a5:	be 11 00 00 00       	mov    $0x11,%esi
ffff8000001086aa:	bf a0 00 00 00       	mov    $0xa0,%edi
ffff8000001086af:	49 89 df             	mov    %rbx,%r15
ffff8000001086b2:	48 b8 38 c2 ff ff ff 	movabs $0xffffffffffffc238,%rax
ffff8000001086b9:	ff ff ff 
ffff8000001086bc:	48 01 d8             	add    %rbx,%rax
ffff8000001086bf:	ff d0                	callq  *%rax
ffff8000001086c1:	be 28 00 00 00       	mov    $0x28,%esi
ffff8000001086c6:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff8000001086cb:	49 89 df             	mov    %rbx,%r15
ffff8000001086ce:	48 b8 38 c2 ff ff ff 	movabs $0xffffffffffffc238,%rax
ffff8000001086d5:	ff ff ff 
ffff8000001086d8:	48 01 d8             	add    %rbx,%rax
ffff8000001086db:	ff d0                	callq  *%rax
ffff8000001086dd:	be 02 00 00 00       	mov    $0x2,%esi
ffff8000001086e2:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff8000001086e7:	49 89 df             	mov    %rbx,%r15
ffff8000001086ea:	48 b8 38 c2 ff ff ff 	movabs $0xffffffffffffc238,%rax
ffff8000001086f1:	ff ff ff 
ffff8000001086f4:	48 01 d8             	add    %rbx,%rax
ffff8000001086f7:	ff d0                	callq  *%rax
ffff8000001086f9:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001086fe:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff800000108703:	49 89 df             	mov    %rbx,%r15
ffff800000108706:	48 b8 38 c2 ff ff ff 	movabs $0xffffffffffffc238,%rax
ffff80000010870d:	ff ff ff 
ffff800000108710:	48 01 d8             	add    %rbx,%rax
ffff800000108713:	ff d0                	callq  *%rax
ffff800000108715:	be fd 00 00 00       	mov    $0xfd,%esi
ffff80000010871a:	bf 21 00 00 00       	mov    $0x21,%edi
ffff80000010871f:	49 89 df             	mov    %rbx,%r15
ffff800000108722:	48 b8 38 c2 ff ff ff 	movabs $0xffffffffffffc238,%rax
ffff800000108729:	ff ff ff 
ffff80000010872c:	48 01 d8             	add    %rbx,%rax
ffff80000010872f:	ff d0                	callq  *%rax
ffff800000108731:	be ff 00 00 00       	mov    $0xff,%esi
ffff800000108736:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff80000010873b:	49 89 df             	mov    %rbx,%r15
ffff80000010873e:	48 b8 38 c2 ff ff ff 	movabs $0xffffffffffffc238,%rax
ffff800000108745:	ff ff ff 
ffff800000108748:	48 01 d8             	add    %rbx,%rax
ffff80000010874b:	ff d0                	callq  *%rax
ffff80000010874d:	fb                   	sti    
ffff80000010874e:	90                   	nop
ffff80000010874f:	48 83 c4 10          	add    $0x10,%rsp
ffff800000108753:	5b                   	pop    %rbx
ffff800000108754:	41 5f                	pop    %r15
ffff800000108756:	5d                   	pop    %rbp
ffff800000108757:	c3                   	retq   

ffff800000108758 <do_IRQ>:
ffff800000108758:	55                   	push   %rbp
ffff800000108759:	48 89 e5             	mov    %rsp,%rbp
ffff80000010875c:	41 57                	push   %r15
ffff80000010875e:	53                   	push   %rbx
ffff80000010875f:	48 83 ec 20          	sub    $0x20,%rsp
ffff800000108763:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000108763 <do_IRQ+0xb>
ffff80000010876a:	49 bb c5 32 00 00 00 	movabs $0x32c5,%r11
ffff800000108771:	00 00 00 
ffff800000108774:	4c 01 db             	add    %r11,%rbx
ffff800000108777:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff80000010877b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff80000010877f:	bf 60 00 00 00       	mov    $0x60,%edi
ffff800000108784:	49 89 df             	mov    %rbx,%r15
ffff800000108787:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010878c:	48 ba 6a c2 ff ff ff 	movabs $0xffffffffffffc26a,%rdx
ffff800000108793:	ff ff ff 
ffff800000108796:	48 01 da             	add    %rbx,%rdx
ffff800000108799:	ff d2                	callq  *%rdx
ffff80000010879b:	88 45 ef             	mov    %al,-0x11(%rbp)
ffff80000010879e:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
ffff8000001087a2:	89 c1                	mov    %eax,%ecx
ffff8000001087a4:	48 b8 4a 18 00 00 00 	movabs $0x184a,%rax
ffff8000001087ab:	00 00 00 
ffff8000001087ae:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001087b2:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001087b7:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001087bc:	49 89 df             	mov    %rbx,%r15
ffff8000001087bf:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001087c4:	49 b8 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r8
ffff8000001087cb:	ff ff ff 
ffff8000001087ce:	49 01 d8             	add    %rbx,%r8
ffff8000001087d1:	41 ff d0             	callq  *%r8
ffff8000001087d4:	be 20 00 00 00       	mov    $0x20,%esi
ffff8000001087d9:	bf 20 00 00 00       	mov    $0x20,%edi
ffff8000001087de:	49 89 df             	mov    %rbx,%r15
ffff8000001087e1:	48 b8 38 c2 ff ff ff 	movabs $0xffffffffffffc238,%rax
ffff8000001087e8:	ff ff ff 
ffff8000001087eb:	48 01 d8             	add    %rbx,%rax
ffff8000001087ee:	ff d0                	callq  *%rax
ffff8000001087f0:	90                   	nop
ffff8000001087f1:	48 83 c4 20          	add    $0x20,%rsp
ffff8000001087f5:	5b                   	pop    %rbx
ffff8000001087f6:	41 5f                	pop    %r15
ffff8000001087f8:	5d                   	pop    %rbp
ffff8000001087f9:	c3                   	retq   
ffff8000001087fa:	55                   	push   %rbp
ffff8000001087fb:	48 89 e5             	mov    %rsp,%rbp
ffff8000001087fe:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff8000001087fe <do_IRQ+0xa6>
ffff800000108805:	49 bb 2a 32 00 00 00 	movabs $0x322a,%r11
ffff80000010880c:	00 00 00 
ffff80000010880f:	4c 01 d8             	add    %r11,%rax
ffff800000108812:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
ffff800000108819:	00 
ffff80000010881a:	48 c7 c0 00 80 ff ff 	mov    $0xffffffffffff8000,%rax
ffff800000108821:	48 21 e0             	and    %rsp,%rax
ffff800000108824:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108828:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010882c:	5d                   	pop    %rbp
ffff80000010882d:	c3                   	retq   
ffff80000010882e:	55                   	push   %rbp
ffff80000010882f:	48 89 e5             	mov    %rsp,%rbp
ffff800000108832:	41 57                	push   %r15
ffff800000108834:	48 83 ec 18          	sub    $0x18,%rsp
ffff800000108838:	4c 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%r8        # ffff800000108838 <do_IRQ+0xe0>
ffff80000010883f:	49 bb f0 31 00 00 00 	movabs $0x31f0,%r11
ffff800000108846:	00 00 00 
ffff800000108849:	4d 01 d8             	add    %r11,%r8
ffff80000010884c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000108850:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108854:	48 8b 80 80 00 00 00 	mov    0x80(%rax),%rax
ffff80000010885b:	48 89 c1             	mov    %rax,%rcx
ffff80000010885e:	48 b8 58 18 00 00 00 	movabs $0x1858,%rax
ffff800000108865:	00 00 00 
ffff800000108868:	49 8d 14 00          	lea    (%r8,%rax,1),%rdx
ffff80000010886c:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108871:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108876:	4d 89 c7             	mov    %r8,%r15
ffff800000108879:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010887e:	49 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r9
ffff800000108885:	ff ff ff 
ffff800000108888:	4d 01 c1             	add    %r8,%r9
ffff80000010888b:	41 ff d1             	callq  *%r9
ffff80000010888e:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffff800000108895:	48 83 c4 18          	add    $0x18,%rsp
ffff800000108899:	41 5f                	pop    %r15
ffff80000010889b:	5d                   	pop    %rbp
ffff80000010889c:	c3                   	retq   
ffff80000010889d:	55                   	push   %rbp
ffff80000010889e:	48 89 e5             	mov    %rsp,%rbp
ffff8000001088a1:	41 57                	push   %r15
ffff8000001088a3:	48 83 ec 18          	sub    $0x18,%rsp
ffff8000001088a7:	48 8d 0d f9 ff ff ff 	lea    -0x7(%rip),%rcx        # ffff8000001088a7 <do_IRQ+0x14f>
ffff8000001088ae:	49 bb 81 31 00 00 00 	movabs $0x3181,%r11
ffff8000001088b5:	00 00 00 
ffff8000001088b8:	4c 01 d9             	add    %r11,%rcx
ffff8000001088bb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff8000001088bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001088c3:	48 8b 40 60          	mov    0x60(%rax),%rax
ffff8000001088c7:	48 89 c2             	mov    %rax,%rdx
ffff8000001088ca:	be ff ff ff 00       	mov    $0xffffff,%esi
ffff8000001088cf:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001088d4:	49 89 cf             	mov    %rcx,%r15
ffff8000001088d7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001088dc:	49 b8 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r8
ffff8000001088e3:	ff ff ff 
ffff8000001088e6:	49 01 c8             	add    %rcx,%r8
ffff8000001088e9:	41 ff d0             	callq  *%r8
ffff8000001088ec:	b8 01 00 00 00       	mov    $0x1,%eax
ffff8000001088f1:	48 83 c4 18          	add    $0x18,%rsp
ffff8000001088f5:	41 5f                	pop    %r15
ffff8000001088f7:	5d                   	pop    %rbp
ffff8000001088f8:	c3                   	retq   
ffff8000001088f9:	55                   	push   %rbp
ffff8000001088fa:	48 89 e5             	mov    %rsp,%rbp
ffff8000001088fd:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff8000001088fd <do_IRQ+0x1a5>
ffff800000108904:	49 bb 2b 31 00 00 00 	movabs $0x312b,%r11
ffff80000010890b:	00 00 00 
ffff80000010890e:	4c 01 d8             	add    %r11,%rax
ffff800000108911:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
ffff800000108915:	89 f9                	mov    %edi,%ecx
ffff800000108917:	88 4d ec             	mov    %cl,-0x14(%rbp)
ffff80000010891a:	89 f1                	mov    %esi,%ecx
ffff80000010891c:	88 4d e8             	mov    %cl,-0x18(%rbp)
ffff80000010891f:	88 55 e4             	mov    %dl,-0x1c(%rbp)
ffff800000108922:	0f b6 55 ec          	movzbl -0x14(%rbp),%edx
ffff800000108926:	48 63 d2             	movslq %edx,%rdx
ffff800000108929:	48 89 d1             	mov    %rdx,%rcx
ffff80000010892c:	48 c1 e1 04          	shl    $0x4,%rcx
ffff800000108930:	48 ba 10 ff ff ff ff 	movabs $0xffffffffffffff10,%rdx
ffff800000108937:	ff ff ff 
ffff80000010893a:	48 8b 04 10          	mov    (%rax,%rdx,1),%rax
ffff80000010893e:	48 01 c8             	add    %rcx,%rax
ffff800000108941:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108945:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108949:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff80000010894d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108951:	89 c2                	mov    %eax,%edx
ffff800000108953:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108957:	66 89 10             	mov    %dx,(%rax)
ffff80000010895a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010895e:	66 c7 40 02 08 00    	movw   $0x8,0x2(%rax)
ffff800000108964:	0f b6 45 e4          	movzbl -0x1c(%rbp),%eax
ffff800000108968:	c1 e0 08             	shl    $0x8,%eax
ffff80000010896b:	89 c2                	mov    %eax,%edx
ffff80000010896d:	0f b6 45 e8          	movzbl -0x18(%rbp),%eax
ffff800000108971:	09 d0                	or     %edx,%eax
ffff800000108973:	89 c2                	mov    %eax,%edx
ffff800000108975:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108979:	66 89 50 04          	mov    %dx,0x4(%rax)
ffff80000010897d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108981:	48 c1 e8 10          	shr    $0x10,%rax
ffff800000108985:	89 c2                	mov    %eax,%edx
ffff800000108987:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010898b:	66 89 50 06          	mov    %dx,0x6(%rax)
ffff80000010898f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108993:	48 c1 e8 20          	shr    $0x20,%rax
ffff800000108997:	89 c2                	mov    %eax,%edx
ffff800000108999:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010899d:	89 50 08             	mov    %edx,0x8(%rax)
ffff8000001089a0:	90                   	nop
ffff8000001089a1:	5d                   	pop    %rbp
ffff8000001089a2:	c3                   	retq   
ffff8000001089a3:	55                   	push   %rbp
ffff8000001089a4:	48 89 e5             	mov    %rsp,%rbp
ffff8000001089a7:	48 83 ec 10          	sub    $0x10,%rsp
ffff8000001089ab:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff8000001089ab <do_IRQ+0x253>
ffff8000001089b2:	49 bb 7d 30 00 00 00 	movabs $0x307d,%r11
ffff8000001089b9:	00 00 00 
ffff8000001089bc:	4c 01 d8             	add    %r11,%rax
ffff8000001089bf:	89 f1                	mov    %esi,%ecx
ffff8000001089c1:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff8000001089c5:	89 fa                	mov    %edi,%edx
ffff8000001089c7:	88 55 fc             	mov    %dl,-0x4(%rbp)
ffff8000001089ca:	89 ca                	mov    %ecx,%edx
ffff8000001089cc:	88 55 f8             	mov    %dl,-0x8(%rbp)
ffff8000001089cf:	0f b6 75 f8          	movzbl -0x8(%rbp),%esi
ffff8000001089d3:	0f b6 7d fc          	movzbl -0x4(%rbp),%edi
ffff8000001089d7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff8000001089db:	48 89 d1             	mov    %rdx,%rcx
ffff8000001089de:	ba 8e 00 00 00       	mov    $0x8e,%edx
ffff8000001089e3:	49 b8 4f 88 ff ff ff 	movabs $0xffffffffffff884f,%r8
ffff8000001089ea:	ff ff ff 
ffff8000001089ed:	4a 8d 04 00          	lea    (%rax,%r8,1),%rax
ffff8000001089f1:	ff d0                	callq  *%rax
ffff8000001089f3:	90                   	nop
ffff8000001089f4:	c9                   	leaveq 
ffff8000001089f5:	c3                   	retq   
ffff8000001089f6:	55                   	push   %rbp
ffff8000001089f7:	48 89 e5             	mov    %rsp,%rbp
ffff8000001089fa:	48 83 ec 10          	sub    $0x10,%rsp
ffff8000001089fe:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff8000001089fe <do_IRQ+0x2a6>
ffff800000108a05:	49 bb 2a 30 00 00 00 	movabs $0x302a,%r11
ffff800000108a0c:	00 00 00 
ffff800000108a0f:	4c 01 d8             	add    %r11,%rax
ffff800000108a12:	89 f1                	mov    %esi,%ecx
ffff800000108a14:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff800000108a18:	89 fa                	mov    %edi,%edx
ffff800000108a1a:	88 55 fc             	mov    %dl,-0x4(%rbp)
ffff800000108a1d:	89 ca                	mov    %ecx,%edx
ffff800000108a1f:	88 55 f8             	mov    %dl,-0x8(%rbp)
ffff800000108a22:	0f b6 75 f8          	movzbl -0x8(%rbp),%esi
ffff800000108a26:	0f b6 7d fc          	movzbl -0x4(%rbp),%edi
ffff800000108a2a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000108a2e:	48 89 d1             	mov    %rdx,%rcx
ffff800000108a31:	ba 8f 00 00 00       	mov    $0x8f,%edx
ffff800000108a36:	49 b8 4f 88 ff ff ff 	movabs $0xffffffffffff884f,%r8
ffff800000108a3d:	ff ff ff 
ffff800000108a40:	4a 8d 04 00          	lea    (%rax,%r8,1),%rax
ffff800000108a44:	ff d0                	callq  *%rax
ffff800000108a46:	90                   	nop
ffff800000108a47:	c9                   	leaveq 
ffff800000108a48:	c3                   	retq   
ffff800000108a49:	55                   	push   %rbp
ffff800000108a4a:	48 89 e5             	mov    %rsp,%rbp
ffff800000108a4d:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108a51:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108a51 <do_IRQ+0x2f9>
ffff800000108a58:	49 bb d7 2f 00 00 00 	movabs $0x2fd7,%r11
ffff800000108a5f:	00 00 00 
ffff800000108a62:	4c 01 d8             	add    %r11,%rax
ffff800000108a65:	89 f1                	mov    %esi,%ecx
ffff800000108a67:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff800000108a6b:	89 fa                	mov    %edi,%edx
ffff800000108a6d:	88 55 fc             	mov    %dl,-0x4(%rbp)
ffff800000108a70:	89 ca                	mov    %ecx,%edx
ffff800000108a72:	88 55 f8             	mov    %dl,-0x8(%rbp)
ffff800000108a75:	0f b6 75 f8          	movzbl -0x8(%rbp),%esi
ffff800000108a79:	0f b6 7d fc          	movzbl -0x4(%rbp),%edi
ffff800000108a7d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000108a81:	48 89 d1             	mov    %rdx,%rcx
ffff800000108a84:	ba ef 00 00 00       	mov    $0xef,%edx
ffff800000108a89:	49 b8 4f 88 ff ff ff 	movabs $0xffffffffffff884f,%r8
ffff800000108a90:	ff ff ff 
ffff800000108a93:	4a 8d 04 00          	lea    (%rax,%r8,1),%rax
ffff800000108a97:	ff d0                	callq  *%rax
ffff800000108a99:	90                   	nop
ffff800000108a9a:	c9                   	leaveq 
ffff800000108a9b:	c3                   	retq   
ffff800000108a9c:	55                   	push   %rbp
ffff800000108a9d:	48 89 e5             	mov    %rsp,%rbp
ffff800000108aa0:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108aa4:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108aa4 <do_IRQ+0x34c>
ffff800000108aab:	49 bb 84 2f 00 00 00 	movabs $0x2f84,%r11
ffff800000108ab2:	00 00 00 
ffff800000108ab5:	4c 01 d8             	add    %r11,%rax
ffff800000108ab8:	89 f1                	mov    %esi,%ecx
ffff800000108aba:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff800000108abe:	89 fa                	mov    %edi,%edx
ffff800000108ac0:	88 55 fc             	mov    %dl,-0x4(%rbp)
ffff800000108ac3:	89 ca                	mov    %ecx,%edx
ffff800000108ac5:	88 55 f8             	mov    %dl,-0x8(%rbp)
ffff800000108ac8:	0f b6 75 f8          	movzbl -0x8(%rbp),%esi
ffff800000108acc:	0f b6 7d fc          	movzbl -0x4(%rbp),%edi
ffff800000108ad0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000108ad4:	48 89 d1             	mov    %rdx,%rcx
ffff800000108ad7:	ba ee 00 00 00       	mov    $0xee,%edx
ffff800000108adc:	49 b8 4f 88 ff ff ff 	movabs $0xffffffffffff884f,%r8
ffff800000108ae3:	ff ff ff 
ffff800000108ae6:	4a 8d 04 00          	lea    (%rax,%r8,1),%rax
ffff800000108aea:	ff d0                	callq  *%rax
ffff800000108aec:	90                   	nop
ffff800000108aed:	c9                   	leaveq 
ffff800000108aee:	c3                   	retq   
ffff800000108aef:	55                   	push   %rbp
ffff800000108af0:	48 89 e5             	mov    %rsp,%rbp
ffff800000108af3:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108af3 <do_IRQ+0x39b>
ffff800000108afa:	49 bb 35 2f 00 00 00 	movabs $0x2f35,%r11
ffff800000108b01:	00 00 00 
ffff800000108b04:	4c 01 d8             	add    %r11,%rax
ffff800000108b07:	89 7d fc             	mov    %edi,-0x4(%rbp)
ffff800000108b0a:	89 75 f8             	mov    %esi,-0x8(%rbp)
ffff800000108b0d:	89 55 f4             	mov    %edx,-0xc(%rbp)
ffff800000108b10:	89 4d f0             	mov    %ecx,-0x10(%rbp)
ffff800000108b13:	44 89 45 ec          	mov    %r8d,-0x14(%rbp)
ffff800000108b17:	44 89 4d e8          	mov    %r9d,-0x18(%rbp)
ffff800000108b1b:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108b22:	ff ff ff 
ffff800000108b25:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108b29:	48 8d 52 04          	lea    0x4(%rdx),%rdx
ffff800000108b2d:	8b 4d fc             	mov    -0x4(%rbp),%ecx
ffff800000108b30:	89 0a                	mov    %ecx,(%rdx)
ffff800000108b32:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108b39:	ff ff ff 
ffff800000108b3c:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108b40:	48 8d 52 0c          	lea    0xc(%rdx),%rdx
ffff800000108b44:	8b 4d f8             	mov    -0x8(%rbp),%ecx
ffff800000108b47:	89 0a                	mov    %ecx,(%rdx)
ffff800000108b49:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108b50:	ff ff ff 
ffff800000108b53:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108b57:	48 8d 52 14          	lea    0x14(%rdx),%rdx
ffff800000108b5b:	8b 4d f4             	mov    -0xc(%rbp),%ecx
ffff800000108b5e:	89 0a                	mov    %ecx,(%rdx)
ffff800000108b60:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108b67:	ff ff ff 
ffff800000108b6a:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108b6e:	48 8d 52 24          	lea    0x24(%rdx),%rdx
ffff800000108b72:	8b 4d f0             	mov    -0x10(%rbp),%ecx
ffff800000108b75:	89 0a                	mov    %ecx,(%rdx)
ffff800000108b77:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108b7e:	ff ff ff 
ffff800000108b81:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108b85:	48 8d 52 2c          	lea    0x2c(%rdx),%rdx
ffff800000108b89:	8b 4d ec             	mov    -0x14(%rbp),%ecx
ffff800000108b8c:	89 0a                	mov    %ecx,(%rdx)
ffff800000108b8e:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108b95:	ff ff ff 
ffff800000108b98:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108b9c:	48 8d 52 34          	lea    0x34(%rdx),%rdx
ffff800000108ba0:	8b 4d e8             	mov    -0x18(%rbp),%ecx
ffff800000108ba3:	89 0a                	mov    %ecx,(%rdx)
ffff800000108ba5:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108bac:	ff ff ff 
ffff800000108baf:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108bb3:	48 8d 52 3c          	lea    0x3c(%rdx),%rdx
ffff800000108bb7:	8b 4d 10             	mov    0x10(%rbp),%ecx
ffff800000108bba:	89 0a                	mov    %ecx,(%rdx)
ffff800000108bbc:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108bc3:	ff ff ff 
ffff800000108bc6:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108bca:	48 8d 52 44          	lea    0x44(%rdx),%rdx
ffff800000108bce:	8b 4d 18             	mov    0x18(%rbp),%ecx
ffff800000108bd1:	89 0a                	mov    %ecx,(%rdx)
ffff800000108bd3:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108bda:	ff ff ff 
ffff800000108bdd:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108be1:	48 8d 52 4c          	lea    0x4c(%rdx),%rdx
ffff800000108be5:	8b 4d 20             	mov    0x20(%rbp),%ecx
ffff800000108be8:	89 0a                	mov    %ecx,(%rdx)
ffff800000108bea:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108bf1:	ff ff ff 
ffff800000108bf4:	48 8b 04 10          	mov    (%rax,%rdx,1),%rax
ffff800000108bf8:	48 8d 40 54          	lea    0x54(%rax),%rax
ffff800000108bfc:	8b 55 28             	mov    0x28(%rbp),%edx
ffff800000108bff:	89 10                	mov    %edx,(%rax)
ffff800000108c01:	90                   	nop
ffff800000108c02:	5d                   	pop    %rbp
ffff800000108c03:	c3                   	retq   

ffff800000108c04 <user_level_function>:
ffff800000108c04:	55                   	push   %rbp
ffff800000108c05:	48 89 e5             	mov    %rsp,%rbp
ffff800000108c08:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108c08 <user_level_function+0x4>
ffff800000108c0f:	49 bb 20 2e 00 00 00 	movabs $0x2e20,%r11
ffff800000108c16:	00 00 00 
ffff800000108c19:	4c 01 d8             	add    %r11,%rax
ffff800000108c1c:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
ffff800000108c23:	00 
ffff800000108c24:	48 b8 48 65 6c 6c 6f 	movabs $0x6f57206f6c6c6548,%rax
ffff800000108c2b:	20 57 6f 
ffff800000108c2e:	48 89 45 ea          	mov    %rax,-0x16(%rbp)
ffff800000108c32:	c7 45 f2 72 6c 64 21 	movl   $0x21646c72,-0xe(%rbp)
ffff800000108c39:	66 c7 45 f6 0a 00    	movw   $0xa,-0xa(%rbp)
ffff800000108c3f:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000108c44:	48 8d 55 ea          	lea    -0x16(%rbp),%rdx
ffff800000108c48:	48 89 d7             	mov    %rdx,%rdi
ffff800000108c4b:	48 8d 15 05 00 00 00 	lea    0x5(%rip),%rdx        # ffff800000108c57 <sysexit_return_address>
ffff800000108c52:	48 89 e1             	mov    %rsp,%rcx
ffff800000108c55:	0f 34                	sysenter 

ffff800000108c57 <sysexit_return_address>:
ffff800000108c57:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108c5b:	eb fe                	jmp    ffff800000108c5b <sysexit_return_address+0x4>

ffff800000108c5d <system_call_function>:
ffff800000108c5d:	55                   	push   %rbp
ffff800000108c5e:	48 89 e5             	mov    %rsp,%rbp
ffff800000108c61:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108c65:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108c65 <system_call_function+0x8>
ffff800000108c6c:	49 bb c3 2d 00 00 00 	movabs $0x2dc3,%r11
ffff800000108c73:	00 00 00 
ffff800000108c76:	4c 01 d8             	add    %r11,%rax
ffff800000108c79:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108c7d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000108c81:	48 8b 92 80 00 00 00 	mov    0x80(%rdx),%rdx
ffff800000108c88:	48 b9 d8 03 00 00 00 	movabs $0x3d8,%rcx
ffff800000108c8f:	00 00 00 
ffff800000108c92:	48 01 c8             	add    %rcx,%rax
ffff800000108c95:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
ffff800000108c99:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000108c9d:	48 89 d7             	mov    %rdx,%rdi
ffff800000108ca0:	ff d0                	callq  *%rax
ffff800000108ca2:	c9                   	leaveq 
ffff800000108ca3:	c3                   	retq   

ffff800000108ca4 <do_execve>:
ffff800000108ca4:	55                   	push   %rbp
ffff800000108ca5:	48 89 e5             	mov    %rsp,%rbp
ffff800000108ca8:	41 57                	push   %r15
ffff800000108caa:	53                   	push   %rbx
ffff800000108cab:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108caf:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000108caf <do_execve+0xb>
ffff800000108cb6:	49 bb 79 2d 00 00 00 	movabs $0x2d79,%r11
ffff800000108cbd:	00 00 00 
ffff800000108cc0:	4c 01 db             	add    %r11,%rbx
ffff800000108cc3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000108cc7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108ccb:	48 c7 40 50 00 00 80 	movq   $0x800000,0x50(%rax)
ffff800000108cd2:	00 
ffff800000108cd3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108cd7:	48 c7 40 48 00 00 a0 	movq   $0xa00000,0x48(%rax)
ffff800000108cde:	00 
ffff800000108cdf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108ce3:	48 c7 80 80 00 00 00 	movq   $0x0,0x80(%rax)
ffff800000108cea:	00 00 00 00 
ffff800000108cee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108cf2:	48 c7 40 70 00 00 00 	movq   $0x0,0x70(%rax)
ffff800000108cf9:	00 
ffff800000108cfa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108cfe:	48 c7 40 78 00 00 00 	movq   $0x0,0x78(%rax)
ffff800000108d05:	00 
ffff800000108d06:	48 b8 79 18 00 00 00 	movabs $0x1879,%rax
ffff800000108d0d:	00 00 00 
ffff800000108d10:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000108d14:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108d19:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108d1e:	49 89 df             	mov    %rbx,%r15
ffff800000108d21:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108d26:	48 b9 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%rcx
ffff800000108d2d:	ff ff ff 
ffff800000108d30:	48 01 d9             	add    %rbx,%rcx
ffff800000108d33:	ff d1                	callq  *%rcx
ffff800000108d35:	ba 00 04 00 00       	mov    $0x400,%edx
ffff800000108d3a:	be 00 00 80 00       	mov    $0x800000,%esi
ffff800000108d3f:	48 b8 dc d1 ff ff ff 	movabs $0xffffffffffffd1dc,%rax
ffff800000108d46:	ff ff ff 
ffff800000108d49:	48 8d 3c 03          	lea    (%rbx,%rax,1),%rdi
ffff800000108d4d:	49 89 df             	mov    %rbx,%r15
ffff800000108d50:	48 b8 84 c1 ff ff ff 	movabs $0xffffffffffffc184,%rax
ffff800000108d57:	ff ff ff 
ffff800000108d5a:	48 01 d8             	add    %rbx,%rax
ffff800000108d5d:	ff d0                	callq  *%rax
ffff800000108d5f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108d64:	48 83 c4 10          	add    $0x10,%rsp
ffff800000108d68:	5b                   	pop    %rbx
ffff800000108d69:	41 5f                	pop    %r15
ffff800000108d6b:	5d                   	pop    %rbp
ffff800000108d6c:	c3                   	retq   

ffff800000108d6d <kernel_thread_func>:
ffff800000108d6d:	55                   	push   %rbp
ffff800000108d6e:	48 89 e5             	mov    %rsp,%rbp
ffff800000108d71:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108d71 <kernel_thread_func+0x4>
ffff800000108d78:	49 bb b7 2c 00 00 00 	movabs $0x2cb7,%r11
ffff800000108d7f:	00 00 00 
ffff800000108d82:	4c 01 d8             	add    %r11,%rax
ffff800000108d85:	41 5f                	pop    %r15
ffff800000108d87:	41 5e                	pop    %r14
ffff800000108d89:	41 5d                	pop    %r13
ffff800000108d8b:	41 5c                	pop    %r12
ffff800000108d8d:	41 5b                	pop    %r11
ffff800000108d8f:	41 5a                	pop    %r10
ffff800000108d91:	41 59                	pop    %r9
ffff800000108d93:	41 58                	pop    %r8
ffff800000108d95:	5b                   	pop    %rbx
ffff800000108d96:	59                   	pop    %rcx
ffff800000108d97:	5a                   	pop    %rdx
ffff800000108d98:	5e                   	pop    %rsi
ffff800000108d99:	5f                   	pop    %rdi
ffff800000108d9a:	5d                   	pop    %rbp
ffff800000108d9b:	58                   	pop    %rax
ffff800000108d9c:	48 8e d8             	mov    %rax,%ds
ffff800000108d9f:	58                   	pop    %rax
ffff800000108da0:	48 8e c0             	mov    %rax,%es
ffff800000108da3:	58                   	pop    %rax
ffff800000108da4:	48 83 c4 38          	add    $0x38,%rsp
ffff800000108da8:	48 89 cf             	mov    %rcx,%rdi
ffff800000108dab:	ff d1                	callq  *%rcx
ffff800000108dad:	48 89 c7             	mov    %rax,%rdi
ffff800000108db0:	e8 ea 09 00 00       	callq  ffff80000010979f <do_exit>
ffff800000108db5:	90                   	nop
ffff800000108db6:	5d                   	pop    %rbp
ffff800000108db7:	c3                   	retq   

ffff800000108db8 <init>:
ffff800000108db8:	55                   	push   %rbp
ffff800000108db9:	48 89 e5             	mov    %rsp,%rbp
ffff800000108dbc:	41 57                	push   %r15
ffff800000108dbe:	41 54                	push   %r12
ffff800000108dc0:	53                   	push   %rbx
ffff800000108dc1:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000108dc5:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000108dc5 <init+0xd>
ffff800000108dcc:	49 bb 63 2c 00 00 00 	movabs $0x2c63,%r11
ffff800000108dd3:	00 00 00 
ffff800000108dd6:	4c 01 db             	add    %r11,%rbx
ffff800000108dd9:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
ffff800000108ddd:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000108de1:	48 89 c1             	mov    %rax,%rcx
ffff800000108de4:	48 b8 94 18 00 00 00 	movabs $0x1894,%rax
ffff800000108deb:	00 00 00 
ffff800000108dee:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000108df2:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108df7:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108dfc:	49 89 df             	mov    %rbx,%r15
ffff800000108dff:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e04:	49 b8 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r8
ffff800000108e0b:	ff ff ff 
ffff800000108e0e:	49 01 d8             	add    %rbx,%r8
ffff800000108e11:	41 ff d0             	callq  *%r8
ffff800000108e14:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e19:	48 ba 5a 8b ff ff ff 	movabs $0xffffffffffff8b5a,%rdx
ffff800000108e20:	ff ff ff 
ffff800000108e23:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff800000108e27:	ff d2                	callq  *%rdx
ffff800000108e29:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000108e2d:	48 ba f8 fe ff ff ff 	movabs $0xfffffffffffffef8,%rdx
ffff800000108e34:	ff ff ff 
ffff800000108e37:	48 8b 14 13          	mov    (%rbx,%rdx,1),%rdx
ffff800000108e3b:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000108e3f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e44:	48 ba 5a 8b ff ff ff 	movabs $0xffffffffffff8b5a,%rdx
ffff800000108e4b:	ff ff ff 
ffff800000108e4e:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff800000108e52:	ff d2                	callq  *%rdx
ffff800000108e54:	49 89 c4             	mov    %rax,%r12
ffff800000108e57:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e5c:	48 ba 5a 8b ff ff ff 	movabs $0xffffffffffff8b5a,%rdx
ffff800000108e63:	ff ff ff 
ffff800000108e66:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff800000108e6a:	ff d2                	callq  *%rdx
ffff800000108e6c:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000108e70:	49 8d 94 24 40 7f 00 	lea    0x7f40(%r12),%rdx
ffff800000108e77:	00 
ffff800000108e78:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000108e7c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e81:	48 ba 5a 8b ff ff ff 	movabs $0xffffffffffff8b5a,%rdx
ffff800000108e88:	ff ff ff 
ffff800000108e8b:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff800000108e8f:	ff d2                	callq  *%rdx
ffff800000108e91:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000108e95:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000108e99:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff800000108e9d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108ea2:	48 ba 5a 8b ff ff ff 	movabs $0xffffffffffff8b5a,%rdx
ffff800000108ea9:	ff ff ff 
ffff800000108eac:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff800000108eb0:	ff d2                	callq  *%rdx
ffff800000108eb2:	4c 8b 60 28          	mov    0x28(%rax),%r12
ffff800000108eb6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108ebb:	48 ba 5a 8b ff ff ff 	movabs $0xffffffffffff8b5a,%rdx
ffff800000108ec2:	ff ff ff 
ffff800000108ec5:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff800000108ec9:	ff d2                	callq  *%rdx
ffff800000108ecb:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff800000108ecf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108ed3:	48 89 c7             	mov    %rax,%rdi
ffff800000108ed6:	49 8b 64 24 10       	mov    0x10(%r12),%rsp
ffff800000108edb:	ff 72 08             	pushq  0x8(%rdx)
ffff800000108ede:	e9 c1 fd ff ff       	jmpq   ffff800000108ca4 <do_execve>
ffff800000108ee3:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000108ee8:	48 83 c4 28          	add    $0x28,%rsp
ffff800000108eec:	5b                   	pop    %rbx
ffff800000108eed:	41 5c                	pop    %r12
ffff800000108eef:	41 5f                	pop    %r15
ffff800000108ef1:	5d                   	pop    %rbp
ffff800000108ef2:	c3                   	retq   

ffff800000108ef3 <__switch_to>:
ffff800000108ef3:	55                   	push   %rbp
ffff800000108ef4:	48 89 e5             	mov    %rsp,%rbp
ffff800000108ef7:	41 55                	push   %r13
ffff800000108ef9:	41 54                	push   %r12
ffff800000108efb:	53                   	push   %rbx
ffff800000108efc:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108f00:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108f00 <__switch_to+0xd>
ffff800000108f07:	49 bb 28 2b 00 00 00 	movabs $0x2b28,%r11
ffff800000108f0e:	00 00 00 
ffff800000108f11:	4c 01 d8             	add    %r11,%rax
ffff800000108f14:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
ffff800000108f18:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
ffff800000108f1c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000108f20:	48 8b 52 28          	mov    0x28(%rdx),%rdx
ffff800000108f24:	48 8b 0a             	mov    (%rdx),%rcx
ffff800000108f27:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff800000108f2e:	00 00 00 
ffff800000108f31:	48 89 4c 10 04       	mov    %rcx,0x4(%rax,%rdx,1)
ffff800000108f36:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff800000108f3d:	00 00 00 
ffff800000108f40:	48 8b 54 10 54       	mov    0x54(%rax,%rdx,1),%rdx
ffff800000108f45:	89 d3                	mov    %edx,%ebx
ffff800000108f47:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff800000108f4e:	00 00 00 
ffff800000108f51:	48 8b 54 10 4c       	mov    0x4c(%rax,%rdx,1),%rdx
ffff800000108f56:	41 89 d3             	mov    %edx,%r11d
ffff800000108f59:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff800000108f60:	00 00 00 
ffff800000108f63:	48 8b 54 10 44       	mov    0x44(%rax,%rdx,1),%rdx
ffff800000108f68:	41 89 d1             	mov    %edx,%r9d
ffff800000108f6b:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff800000108f72:	00 00 00 
ffff800000108f75:	48 8b 54 10 3c       	mov    0x3c(%rax,%rdx,1),%rdx
ffff800000108f7a:	41 89 d0             	mov    %edx,%r8d
ffff800000108f7d:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff800000108f84:	00 00 00 
ffff800000108f87:	48 8b 54 10 34       	mov    0x34(%rax,%rdx,1),%rdx
ffff800000108f8c:	41 89 d5             	mov    %edx,%r13d
ffff800000108f8f:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff800000108f96:	00 00 00 
ffff800000108f99:	48 8b 54 10 2c       	mov    0x2c(%rax,%rdx,1),%rdx
ffff800000108f9e:	41 89 d4             	mov    %edx,%r12d
ffff800000108fa1:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff800000108fa8:	00 00 00 
ffff800000108fab:	48 8b 54 10 24       	mov    0x24(%rax,%rdx,1),%rdx
ffff800000108fb0:	89 d1                	mov    %edx,%ecx
ffff800000108fb2:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff800000108fb9:	00 00 00 
ffff800000108fbc:	48 8b 54 10 14       	mov    0x14(%rax,%rdx,1),%rdx
ffff800000108fc1:	41 89 d2             	mov    %edx,%r10d
ffff800000108fc4:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff800000108fcb:	00 00 00 
ffff800000108fce:	48 8b 54 10 0c       	mov    0xc(%rax,%rdx,1),%rdx
ffff800000108fd3:	89 d6                	mov    %edx,%esi
ffff800000108fd5:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff800000108fdc:	00 00 00 
ffff800000108fdf:	48 8b 54 10 04       	mov    0x4(%rax,%rdx,1),%rdx
ffff800000108fe4:	89 d7                	mov    %edx,%edi
ffff800000108fe6:	53                   	push   %rbx
ffff800000108fe7:	41 53                	push   %r11
ffff800000108fe9:	41 51                	push   %r9
ffff800000108feb:	41 50                	push   %r8
ffff800000108fed:	45 89 e9             	mov    %r13d,%r9d
ffff800000108ff0:	45 89 e0             	mov    %r12d,%r8d
ffff800000108ff3:	44 89 d2             	mov    %r10d,%edx
ffff800000108ff6:	49 ba 45 8a ff ff ff 	movabs $0xffffffffffff8a45,%r10
ffff800000108ffd:	ff ff ff 
ffff800000109000:	4a 8d 04 10          	lea    (%rax,%r10,1),%rax
ffff800000109004:	ff d0                	callq  *%rax
ffff800000109006:	48 83 c4 20          	add    $0x20,%rsp
ffff80000010900a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010900e:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff800000109012:	48 8c e0             	mov    %fs,%rax
ffff800000109015:	48 89 42 18          	mov    %rax,0x18(%rdx)
ffff800000109019:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010901d:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff800000109021:	48 8c e8             	mov    %gs,%rax
ffff800000109024:	48 89 42 20          	mov    %rax,0x20(%rdx)
ffff800000109028:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010902c:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109030:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109034:	48 8e e0             	mov    %rax,%fs
ffff800000109037:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010903b:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff80000010903f:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff800000109043:	48 8e e8             	mov    %rax,%gs
ffff800000109046:	90                   	nop
ffff800000109047:	48 8d 65 e8          	lea    -0x18(%rbp),%rsp
ffff80000010904b:	5b                   	pop    %rbx
ffff80000010904c:	41 5c                	pop    %r12
ffff80000010904e:	41 5d                	pop    %r13
ffff800000109050:	5d                   	pop    %rbp
ffff800000109051:	c3                   	retq   

ffff800000109052 <task_init>:
ffff800000109052:	55                   	push   %rbp
ffff800000109053:	48 89 e5             	mov    %rsp,%rbp
ffff800000109056:	41 57                	push   %r15
ffff800000109058:	41 56                	push   %r14
ffff80000010905a:	41 55                	push   %r13
ffff80000010905c:	41 54                	push   %r12
ffff80000010905e:	53                   	push   %rbx
ffff80000010905f:	48 83 ec 18          	sub    $0x18,%rsp
ffff800000109063:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000109063 <task_init+0x11>
ffff80000010906a:	49 bb c5 29 00 00 00 	movabs $0x29c5,%r11
ffff800000109071:	00 00 00 
ffff800000109074:	4c 01 db             	add    %r11,%rbx
ffff800000109077:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
ffff80000010907e:	00 
ffff80000010907f:	48 b8 e8 45 01 00 00 	movabs $0x145e8,%rax
ffff800000109086:	00 00 00 
ffff800000109089:	48 8b 14 03          	mov    (%rbx,%rax,1),%rdx
ffff80000010908d:	48 b8 f8 45 01 00 00 	movabs $0x145f8,%rax
ffff800000109094:	00 00 00 
ffff800000109097:	48 89 14 03          	mov    %rdx,(%rbx,%rax,1)
ffff80000010909b:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001090a2:	ff ff ff 
ffff8000001090a5:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001090a9:	48 8b 90 d0 02 00 00 	mov    0x2d0(%rax),%rdx
ffff8000001090b0:	48 b8 f8 45 01 00 00 	movabs $0x145f8,%rax
ffff8000001090b7:	00 00 00 
ffff8000001090ba:	48 89 54 03 08       	mov    %rdx,0x8(%rbx,%rax,1)
ffff8000001090bf:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001090c6:	ff ff ff 
ffff8000001090c9:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001090cd:	48 8b 90 d8 02 00 00 	mov    0x2d8(%rax),%rdx
ffff8000001090d4:	48 b8 f8 45 01 00 00 	movabs $0x145f8,%rax
ffff8000001090db:	00 00 00 
ffff8000001090de:	48 89 54 03 10       	mov    %rdx,0x10(%rbx,%rax,1)
ffff8000001090e3:	48 b8 a0 ff ff ff ff 	movabs $0xffffffffffffffa0,%rax
ffff8000001090ea:	ff ff ff 
ffff8000001090ed:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001090f1:	48 89 c2             	mov    %rax,%rdx
ffff8000001090f4:	48 b8 f8 45 01 00 00 	movabs $0x145f8,%rax
ffff8000001090fb:	00 00 00 
ffff8000001090fe:	48 89 54 03 18       	mov    %rdx,0x18(%rbx,%rax,1)
ffff800000109103:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010910a:	ff ff ff 
ffff80000010910d:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000109111:	48 8b 90 e0 02 00 00 	mov    0x2e0(%rax),%rdx
ffff800000109118:	48 b8 f8 45 01 00 00 	movabs $0x145f8,%rax
ffff80000010911f:	00 00 00 
ffff800000109122:	48 89 54 03 20       	mov    %rdx,0x20(%rbx,%rax,1)
ffff800000109127:	48 b8 58 ff ff ff ff 	movabs $0xffffffffffffff58,%rax
ffff80000010912e:	ff ff ff 
ffff800000109131:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000109135:	48 89 c2             	mov    %rax,%rdx
ffff800000109138:	48 b8 f8 45 01 00 00 	movabs $0x145f8,%rax
ffff80000010913f:	00 00 00 
ffff800000109142:	48 89 54 03 28       	mov    %rdx,0x28(%rbx,%rax,1)
ffff800000109147:	48 b8 f8 ff ff ff ff 	movabs $0xfffffffffffffff8,%rax
ffff80000010914e:	ff ff ff 
ffff800000109151:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000109155:	48 89 c2             	mov    %rax,%rdx
ffff800000109158:	48 b8 f8 45 01 00 00 	movabs $0x145f8,%rax
ffff80000010915f:	00 00 00 
ffff800000109162:	48 89 54 03 30       	mov    %rdx,0x30(%rbx,%rax,1)
ffff800000109167:	48 b8 f8 45 01 00 00 	movabs $0x145f8,%rax
ffff80000010916e:	00 00 00 
ffff800000109171:	48 c7 44 03 38 00 00 	movq   $0x0,0x38(%rbx,%rax,1)
ffff800000109178:	00 00 
ffff80000010917a:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000109181:	ff ff ff 
ffff800000109184:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000109188:	48 8b 90 e8 02 00 00 	mov    0x2e8(%rax),%rdx
ffff80000010918f:	48 b8 f8 45 01 00 00 	movabs $0x145f8,%rax
ffff800000109196:	00 00 00 
ffff800000109199:	48 89 54 03 40       	mov    %rdx,0x40(%rbx,%rax,1)
ffff80000010919e:	48 b8 90 ff ff ff ff 	movabs $0xffffffffffffff90,%rax
ffff8000001091a5:	ff ff ff 
ffff8000001091a8:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001091ac:	48 8b 10             	mov    (%rax),%rdx
ffff8000001091af:	48 b8 f8 45 01 00 00 	movabs $0x145f8,%rax
ffff8000001091b6:	00 00 00 
ffff8000001091b9:	48 89 54 03 48       	mov    %rdx,0x48(%rbx,%rax,1)
ffff8000001091be:	be 08 00 00 00       	mov    $0x8,%esi
ffff8000001091c3:	bf 74 01 00 00       	mov    $0x174,%edi
ffff8000001091c8:	49 89 df             	mov    %rbx,%r15
ffff8000001091cb:	48 b8 48 c4 ff ff ff 	movabs $0xffffffffffffc448,%rax
ffff8000001091d2:	ff ff ff 
ffff8000001091d5:	48 01 d8             	add    %rbx,%rax
ffff8000001091d8:	ff d0                	callq  *%rax
ffff8000001091da:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001091df:	48 ba 5a 8b ff ff ff 	movabs $0xffffffffffff8b5a,%rdx
ffff8000001091e6:	ff ff ff 
ffff8000001091e9:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff8000001091ed:	ff d2                	callq  *%rdx
ffff8000001091ef:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff8000001091f3:	48 8b 00             	mov    (%rax),%rax
ffff8000001091f6:	48 89 c6             	mov    %rax,%rsi
ffff8000001091f9:	bf 75 01 00 00       	mov    $0x175,%edi
ffff8000001091fe:	49 89 df             	mov    %rbx,%r15
ffff800000109201:	48 b8 48 c4 ff ff ff 	movabs $0xffffffffffffc448,%rax
ffff800000109208:	ff ff ff 
ffff80000010920b:	48 01 d8             	add    %rbx,%rax
ffff80000010920e:	ff d0                	callq  *%rax
ffff800000109210:	48 b8 e0 ff ff ff ff 	movabs $0xffffffffffffffe0,%rax
ffff800000109217:	ff ff ff 
ffff80000010921a:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010921e:	48 89 c6             	mov    %rax,%rsi
ffff800000109221:	bf 76 01 00 00       	mov    $0x176,%edi
ffff800000109226:	49 89 df             	mov    %rbx,%r15
ffff800000109229:	48 b8 48 c4 ff ff ff 	movabs $0xffffffffffffc448,%rax
ffff800000109230:	ff ff ff 
ffff800000109233:	48 01 d8             	add    %rbx,%rax
ffff800000109236:	ff d0                	callq  *%rax
ffff800000109238:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff80000010923f:	00 00 00 
ffff800000109242:	48 8b 44 03 54       	mov    0x54(%rbx,%rax,1),%rax
ffff800000109247:	41 89 c2             	mov    %eax,%r10d
ffff80000010924a:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff800000109251:	00 00 00 
ffff800000109254:	48 8b 44 03 4c       	mov    0x4c(%rbx,%rax,1),%rax
ffff800000109259:	41 89 c1             	mov    %eax,%r9d
ffff80000010925c:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff800000109263:	00 00 00 
ffff800000109266:	48 8b 44 03 44       	mov    0x44(%rbx,%rax,1),%rax
ffff80000010926b:	41 89 c0             	mov    %eax,%r8d
ffff80000010926e:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff800000109275:	00 00 00 
ffff800000109278:	48 8b 44 03 3c       	mov    0x3c(%rbx,%rax,1),%rax
ffff80000010927d:	89 c7                	mov    %eax,%edi
ffff80000010927f:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff800000109286:	00 00 00 
ffff800000109289:	48 8b 44 03 34       	mov    0x34(%rbx,%rax,1),%rax
ffff80000010928e:	41 89 c4             	mov    %eax,%r12d
ffff800000109291:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff800000109298:	00 00 00 
ffff80000010929b:	48 8b 44 03 2c       	mov    0x2c(%rbx,%rax,1),%rax
ffff8000001092a0:	41 89 c3             	mov    %eax,%r11d
ffff8000001092a3:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff8000001092aa:	00 00 00 
ffff8000001092ad:	48 8b 44 03 24       	mov    0x24(%rbx,%rax,1),%rax
ffff8000001092b2:	89 c1                	mov    %eax,%ecx
ffff8000001092b4:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff8000001092bb:	00 00 00 
ffff8000001092be:	48 8b 44 03 14       	mov    0x14(%rbx,%rax,1),%rax
ffff8000001092c3:	89 c2                	mov    %eax,%edx
ffff8000001092c5:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff8000001092cc:	00 00 00 
ffff8000001092cf:	48 8b 44 03 0c       	mov    0xc(%rbx,%rax,1),%rax
ffff8000001092d4:	89 c6                	mov    %eax,%esi
ffff8000001092d6:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff8000001092dd:	00 00 00 
ffff8000001092e0:	48 8b 44 03 04       	mov    0x4(%rbx,%rax,1),%rax
ffff8000001092e5:	41 52                	push   %r10
ffff8000001092e7:	41 51                	push   %r9
ffff8000001092e9:	41 50                	push   %r8
ffff8000001092eb:	57                   	push   %rdi
ffff8000001092ec:	45 89 e1             	mov    %r12d,%r9d
ffff8000001092ef:	45 89 d8             	mov    %r11d,%r8d
ffff8000001092f2:	89 c7                	mov    %eax,%edi
ffff8000001092f4:	48 b8 45 8a ff ff ff 	movabs $0xffffffffffff8a45,%rax
ffff8000001092fb:	ff ff ff 
ffff8000001092fe:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109302:	ff d0                	callq  *%rax
ffff800000109304:	48 83 c4 20          	add    $0x20,%rsp
ffff800000109308:	48 b8 18 00 00 00 00 	movabs $0x18,%rax
ffff80000010930f:	00 00 00 
ffff800000109312:	48 8b 14 03          	mov    (%rbx,%rax,1),%rdx
ffff800000109316:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff80000010931d:	00 00 00 
ffff800000109320:	48 89 54 03 04       	mov    %rdx,0x4(%rbx,%rax,1)
ffff800000109325:	48 b8 d8 45 00 00 00 	movabs $0x45d8,%rax
ffff80000010932c:	00 00 00 
ffff80000010932f:	48 8d 3c 03          	lea    (%rbx,%rax,1),%rdi
ffff800000109333:	49 89 df             	mov    %rbx,%r15
ffff800000109336:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010933b:	48 ba 9f c2 ff ff ff 	movabs $0xffffffffffffc29f,%rdx
ffff800000109342:	ff ff ff 
ffff800000109345:	48 01 da             	add    %rbx,%rdx
ffff800000109348:	ff d2                	callq  *%rdx
ffff80000010934a:	ba 07 00 00 00       	mov    $0x7,%edx
ffff80000010934f:	be 0a 00 00 00       	mov    $0xa,%esi
ffff800000109354:	48 b8 90 d3 ff ff ff 	movabs $0xffffffffffffd390,%rax
ffff80000010935b:	ff ff ff 
ffff80000010935e:	48 8d 3c 03          	lea    (%rbx,%rax,1),%rdi
ffff800000109362:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109367:	48 b9 35 da ff ff ff 	movabs $0xffffffffffffda35,%rcx
ffff80000010936e:	ff ff ff 
ffff800000109371:	48 8d 0c 0b          	lea    (%rbx,%rcx,1),%rcx
ffff800000109375:	ff d1                	callq  *%rcx
ffff800000109377:	48 b8 d8 45 00 00 00 	movabs $0x45d8,%rax
ffff80000010937e:	00 00 00 
ffff800000109381:	48 c7 44 03 10 01 00 	movq   $0x1,0x10(%rbx,%rax,1)
ffff800000109388:	00 00 
ffff80000010938a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010938f:	48 ba 5a 8b ff ff ff 	movabs $0xffffffffffff8b5a,%rdx
ffff800000109396:	ff ff ff 
ffff800000109399:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff80000010939d:	ff d2                	callq  *%rdx
ffff80000010939f:	48 89 c7             	mov    %rax,%rdi
ffff8000001093a2:	49 89 df             	mov    %rbx,%r15
ffff8000001093a5:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001093aa:	48 ba 0e c4 ff ff ff 	movabs $0xffffffffffffc40e,%rdx
ffff8000001093b1:	ff ff ff 
ffff8000001093b4:	48 01 da             	add    %rbx,%rdx
ffff8000001093b7:	ff d2                	callq  *%rdx
ffff8000001093b9:	48 98                	cltq   
ffff8000001093bb:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
ffff8000001093bf:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff8000001093c3:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff8000001093c7:	90                   	nop
ffff8000001093c8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001093cd:	48 ba 5a 8b ff ff ff 	movabs $0xffffffffffff8b5a,%rdx
ffff8000001093d4:	ff ff ff 
ffff8000001093d7:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff8000001093db:	ff d2                	callq  *%rdx
ffff8000001093dd:	4c 8b 60 28          	mov    0x28(%rax),%r12
ffff8000001093e1:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001093e6:	48 ba 5a 8b ff ff ff 	movabs $0xffffffffffff8b5a,%rdx
ffff8000001093ed:	ff ff ff 
ffff8000001093f0:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff8000001093f4:	ff d2                	callq  *%rdx
ffff8000001093f6:	4c 8b 78 28          	mov    0x28(%rax),%r15
ffff8000001093fa:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001093fe:	4c 8b 68 28          	mov    0x28(%rax),%r13
ffff800000109402:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109406:	4c 8b 70 28          	mov    0x28(%rax),%r14
ffff80000010940a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010940f:	48 ba 5a 8b ff ff ff 	movabs $0xffffffffffff8b5a,%rdx
ffff800000109416:	ff ff ff 
ffff800000109419:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff80000010941d:	ff d2                	callq  *%rdx
ffff80000010941f:	48 89 c2             	mov    %rax,%rdx
ffff800000109422:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109426:	48 89 d7             	mov    %rdx,%rdi
ffff800000109429:	48 89 c6             	mov    %rax,%rsi
ffff80000010942c:	55                   	push   %rbp
ffff80000010942d:	50                   	push   %rax
ffff80000010942e:	49 89 64 24 10       	mov    %rsp,0x10(%r12)
ffff800000109433:	49 8b 65 10          	mov    0x10(%r13),%rsp
ffff800000109437:	48 8d 05 0d 00 00 00 	lea    0xd(%rip),%rax        # ffff80000010944b <task_init+0x3f9>
ffff80000010943e:	49 89 47 08          	mov    %rax,0x8(%r15)
ffff800000109442:	41 ff 76 08          	pushq  0x8(%r14)
ffff800000109446:	e9 a8 fa ff ff       	jmpq   ffff800000108ef3 <__switch_to>
ffff80000010944b:	58                   	pop    %rax
ffff80000010944c:	5d                   	pop    %rbp
ffff80000010944d:	90                   	nop
ffff80000010944e:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
ffff800000109452:	5b                   	pop    %rbx
ffff800000109453:	41 5c                	pop    %r12
ffff800000109455:	41 5d                	pop    %r13
ffff800000109457:	41 5e                	pop    %r14
ffff800000109459:	41 5f                	pop    %r15
ffff80000010945b:	5d                   	pop    %rbp
ffff80000010945c:	c3                   	retq   

ffff80000010945d <kernel_thread>:
ffff80000010945d:	55                   	push   %rbp
ffff80000010945e:	48 89 e5             	mov    %rsp,%rbp
ffff800000109461:	41 57                	push   %r15
ffff800000109463:	53                   	push   %rbx
ffff800000109464:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
ffff80000010946b:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff80000010946b <kernel_thread+0xe>
ffff800000109472:	49 bb bd 25 00 00 00 	movabs $0x25bd,%r11
ffff800000109479:	00 00 00 
ffff80000010947c:	4c 01 db             	add    %r11,%rbx
ffff80000010947f:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
ffff800000109486:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
ffff80000010948d:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
ffff800000109494:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
ffff80000010949b:	ba c0 00 00 00       	mov    $0xc0,%edx
ffff8000001094a0:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001094a5:	48 89 c7             	mov    %rax,%rdi
ffff8000001094a8:	49 89 df             	mov    %rbx,%r15
ffff8000001094ab:	48 b8 2d c1 ff ff ff 	movabs $0xffffffffffffc12d,%rax
ffff8000001094b2:	ff ff ff 
ffff8000001094b5:	48 01 d8             	add    %rbx,%rax
ffff8000001094b8:	ff d0                	callq  *%rax
ffff8000001094ba:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
ffff8000001094c1:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
ffff8000001094c8:	48 8b 85 20 ff ff ff 	mov    -0xe0(%rbp),%rax
ffff8000001094cf:	48 89 45 80          	mov    %rax,-0x80(%rbp)
ffff8000001094d3:	48 c7 45 a0 10 00 00 	movq   $0x10,-0x60(%rbp)
ffff8000001094da:	00 
ffff8000001094db:	48 c7 45 a8 10 00 00 	movq   $0x10,-0x58(%rbp)
ffff8000001094e2:	00 
ffff8000001094e3:	48 c7 45 d0 08 00 00 	movq   $0x8,-0x30(%rbp)
ffff8000001094ea:	00 
ffff8000001094eb:	48 c7 45 e8 10 00 00 	movq   $0x10,-0x18(%rbp)
ffff8000001094f2:	00 
ffff8000001094f3:	48 c7 45 d8 00 02 00 	movq   $0x200,-0x28(%rbp)
ffff8000001094fa:	00 
ffff8000001094fb:	48 b8 45 d3 ff ff ff 	movabs $0xffffffffffffd345,%rax
ffff800000109502:	ff ff ff 
ffff800000109505:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109509:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff80000010950d:	48 8b b5 18 ff ff ff 	mov    -0xe8(%rbp),%rsi
ffff800000109514:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
ffff80000010951b:	b9 00 00 00 00       	mov    $0x0,%ecx
ffff800000109520:	ba 00 00 00 00       	mov    $0x0,%edx
ffff800000109525:	48 89 c7             	mov    %rax,%rdi
ffff800000109528:	48 b8 1c db ff ff ff 	movabs $0xffffffffffffdb1c,%rax
ffff80000010952f:	ff ff ff 
ffff800000109532:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109536:	ff d0                	callq  *%rax
ffff800000109538:	48 81 c4 e0 00 00 00 	add    $0xe0,%rsp
ffff80000010953f:	5b                   	pop    %rbx
ffff800000109540:	41 5f                	pop    %r15
ffff800000109542:	5d                   	pop    %rbp
ffff800000109543:	c3                   	retq   

ffff800000109544 <do_fork>:
ffff800000109544:	55                   	push   %rbp
ffff800000109545:	48 89 e5             	mov    %rsp,%rbp
ffff800000109548:	41 57                	push   %r15
ffff80000010954a:	53                   	push   %rbx
ffff80000010954b:	48 83 ec 40          	sub    $0x40,%rsp
ffff80000010954f:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff80000010954f <do_fork+0xb>
ffff800000109556:	49 bb d9 24 00 00 00 	movabs $0x24d9,%r11
ffff80000010955d:	00 00 00 
ffff800000109560:	4c 01 db             	add    %r11,%rbx
ffff800000109563:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
ffff800000109567:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
ffff80000010956b:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
ffff80000010956f:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
ffff800000109573:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff80000010957a:	00 
ffff80000010957b:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
ffff800000109582:	00 
ffff800000109583:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
ffff80000010958a:	00 
ffff80000010958b:	ba 91 00 00 00       	mov    $0x91,%edx
ffff800000109590:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000109595:	bf 02 00 00 00       	mov    $0x2,%edi
ffff80000010959a:	49 89 df             	mov    %rbx,%r15
ffff80000010959d:	48 b8 9b bd ff ff ff 	movabs $0xffffffffffffbd9b,%rax
ffff8000001095a4:	ff ff ff 
ffff8000001095a7:	48 01 d8             	add    %rbx,%rax
ffff8000001095aa:	ff d0                	callq  *%rax
ffff8000001095ac:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff8000001095b0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001095b4:	48 8b 50 08          	mov    0x8(%rax),%rdx
ffff8000001095b8:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff8000001095bf:	80 ff ff 
ffff8000001095c2:	48 01 d0             	add    %rdx,%rax
ffff8000001095c5:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001095c9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001095cd:	ba 08 00 00 00       	mov    $0x8,%edx
ffff8000001095d2:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001095d7:	48 89 c7             	mov    %rax,%rdi
ffff8000001095da:	49 89 df             	mov    %rbx,%r15
ffff8000001095dd:	48 b8 2d c1 ff ff ff 	movabs $0xffffffffffffc12d,%rax
ffff8000001095e4:	ff ff ff 
ffff8000001095e7:	48 01 d8             	add    %rbx,%rax
ffff8000001095ea:	ff d0                	callq  *%rax
ffff8000001095ec:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001095f1:	48 ba 5a 8b ff ff ff 	movabs $0xffffffffffff8b5a,%rdx
ffff8000001095f8:	ff ff ff 
ffff8000001095fb:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff8000001095ff:	ff d2                	callq  *%rdx
ffff800000109601:	48 89 c2             	mov    %rax,%rdx
ffff800000109604:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109608:	48 8b 32             	mov    (%rdx),%rsi
ffff80000010960b:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
ffff80000010960f:	48 89 30             	mov    %rsi,(%rax)
ffff800000109612:	48 89 78 08          	mov    %rdi,0x8(%rax)
ffff800000109616:	48 8b 72 10          	mov    0x10(%rdx),%rsi
ffff80000010961a:	48 8b 7a 18          	mov    0x18(%rdx),%rdi
ffff80000010961e:	48 89 70 10          	mov    %rsi,0x10(%rax)
ffff800000109622:	48 89 78 18          	mov    %rdi,0x18(%rax)
ffff800000109626:	48 8b 72 20          	mov    0x20(%rdx),%rsi
ffff80000010962a:	48 8b 7a 28          	mov    0x28(%rdx),%rdi
ffff80000010962e:	48 89 70 20          	mov    %rsi,0x20(%rax)
ffff800000109632:	48 89 78 28          	mov    %rdi,0x28(%rax)
ffff800000109636:	48 8b 72 30          	mov    0x30(%rdx),%rsi
ffff80000010963a:	48 8b 7a 38          	mov    0x38(%rdx),%rdi
ffff80000010963e:	48 89 70 30          	mov    %rsi,0x30(%rax)
ffff800000109642:	48 89 78 38          	mov    %rdi,0x38(%rax)
ffff800000109646:	48 8b 72 40          	mov    0x40(%rdx),%rsi
ffff80000010964a:	48 8b 7a 48          	mov    0x48(%rdx),%rdi
ffff80000010964e:	48 89 70 40          	mov    %rsi,0x40(%rax)
ffff800000109652:	48 89 78 48          	mov    %rdi,0x48(%rax)
ffff800000109656:	48 8b 52 50          	mov    0x50(%rdx),%rdx
ffff80000010965a:	48 89 50 50          	mov    %rdx,0x50(%rax)
ffff80000010965e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109662:	48 89 c7             	mov    %rax,%rdi
ffff800000109665:	49 89 df             	mov    %rbx,%r15
ffff800000109668:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010966d:	48 ba 9f c2 ff ff ff 	movabs $0xffffffffffffc29f,%rdx
ffff800000109674:	ff ff ff 
ffff800000109677:	48 01 da             	add    %rbx,%rdx
ffff80000010967a:	ff d2                	callq  *%rdx
ffff80000010967c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109680:	48 89 c6             	mov    %rax,%rsi
ffff800000109683:	48 b8 d8 45 00 00 00 	movabs $0x45d8,%rax
ffff80000010968a:	00 00 00 
ffff80000010968d:	48 8d 3c 03          	lea    (%rbx,%rax,1),%rdi
ffff800000109691:	49 89 df             	mov    %rbx,%r15
ffff800000109694:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109699:	48 ba 2e c3 ff ff ff 	movabs $0xffffffffffffc32e,%rdx
ffff8000001096a0:	ff ff ff 
ffff8000001096a3:	48 01 da             	add    %rbx,%rdx
ffff8000001096a6:	ff d2                	callq  *%rdx
ffff8000001096a8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001096ac:	48 8b 40 38          	mov    0x38(%rax),%rax
ffff8000001096b0:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001096b4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001096b8:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff8000001096bc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001096c0:	48 c7 40 10 04 00 00 	movq   $0x4,0x10(%rax)
ffff8000001096c7:	00 
ffff8000001096c8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001096cc:	48 83 c0 58          	add    $0x58,%rax
ffff8000001096d0:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff8000001096d4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001096d8:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
ffff8000001096dc:	48 89 50 28          	mov    %rdx,0x28(%rax)
ffff8000001096e0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001096e4:	48 05 40 7f 00 00    	add    $0x7f40,%rax
ffff8000001096ea:	48 89 c1             	mov    %rax,%rcx
ffff8000001096ed:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001096f1:	ba c0 00 00 00       	mov    $0xc0,%edx
ffff8000001096f6:	48 89 ce             	mov    %rcx,%rsi
ffff8000001096f9:	48 89 c7             	mov    %rax,%rdi
ffff8000001096fc:	49 89 df             	mov    %rbx,%r15
ffff8000001096ff:	48 b8 84 c1 ff ff ff 	movabs $0xffffffffffffc184,%rax
ffff800000109706:	ff ff ff 
ffff800000109709:	48 01 d8             	add    %rbx,%rax
ffff80000010970c:	ff d0                	callq  *%rax
ffff80000010970e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109712:	48 8d 90 00 80 00 00 	lea    0x8000(%rax),%rdx
ffff800000109719:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010971d:	48 89 10             	mov    %rdx,(%rax)
ffff800000109720:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109724:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
ffff80000010972b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010972f:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000109733:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109737:	48 8d 90 40 7f 00 00 	lea    0x7f40(%rax),%rdx
ffff80000010973e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109742:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000109746:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010974a:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff80000010974e:	83 e0 01             	and    $0x1,%eax
ffff800000109751:	48 85 c0             	test   %rax,%rax
ffff800000109754:	75 2f                	jne    ffff800000109785 <do_fork+0x241>
ffff800000109756:	48 b8 f8 fe ff ff ff 	movabs $0xfffffffffffffef8,%rax
ffff80000010975d:	ff ff ff 
ffff800000109760:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000109764:	48 89 c2             	mov    %rax,%rdx
ffff800000109767:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010976b:	48 89 90 98 00 00 00 	mov    %rdx,0x98(%rax)
ffff800000109772:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109776:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
ffff80000010977d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109781:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000109785:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109789:	48 c7 40 10 01 00 00 	movq   $0x1,0x10(%rax)
ffff800000109790:	00 
ffff800000109791:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109796:	48 83 c4 40          	add    $0x40,%rsp
ffff80000010979a:	5b                   	pop    %rbx
ffff80000010979b:	41 5f                	pop    %r15
ffff80000010979d:	5d                   	pop    %rbp
ffff80000010979e:	c3                   	retq   

ffff80000010979f <do_exit>:
ffff80000010979f:	55                   	push   %rbp
ffff8000001097a0:	48 89 e5             	mov    %rsp,%rbp
ffff8000001097a3:	41 57                	push   %r15
ffff8000001097a5:	48 83 ec 18          	sub    $0x18,%rsp
ffff8000001097a9:	48 8d 0d f9 ff ff ff 	lea    -0x7(%rip),%rcx        # ffff8000001097a9 <do_exit+0xa>
ffff8000001097b0:	49 bb 7f 22 00 00 00 	movabs $0x227f,%r11
ffff8000001097b7:	00 00 00 
ffff8000001097ba:	4c 01 d9             	add    %r11,%rcx
ffff8000001097bd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff8000001097c1:	48 b8 b1 18 00 00 00 	movabs $0x18b1,%rax
ffff8000001097c8:	00 00 00 
ffff8000001097cb:	48 8d 14 01          	lea    (%rcx,%rax,1),%rdx
ffff8000001097cf:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001097d4:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001097d9:	49 89 cf             	mov    %rcx,%r15
ffff8000001097dc:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001097e1:	49 b8 4b 94 ff ff ff 	movabs $0xffffffffffff944b,%r8
ffff8000001097e8:	ff ff ff 
ffff8000001097eb:	49 01 c8             	add    %rcx,%r8
ffff8000001097ee:	41 ff d0             	callq  *%r8
ffff8000001097f1:	eb fe                	jmp    ffff8000001097f1 <do_exit+0x52>

Disassembly of section .data:

ffff800000109800 <LABEL_GDT64>:
	...

ffff800000109808 <LABEL_DESC_KERNEL_CODE64>:
ffff800000109808:	00 00                	add    %al,(%rax)
ffff80000010980a:	00 00                	add    %al,(%rax)
ffff80000010980c:	00 98 20 00      	add    %bl,0x20(%rax)

ffff800000109810 <LABEL_DESC_KERNEL_DATA64>:
ffff800000109810:	00 00                	add    %al,(%rax)
ffff800000109812:	00 00                	add    %al,(%rax)
ffff800000109814:	00 92 00 00      	add    %dl,0x0(%rdx)

ffff800000109818 <LABEL_DESC_USER_CODE32>:
	...

ffff800000109820 <LABEL_DESC_USER_DATA32>:
	...

ffff800000109828 <LABEL_DESC_USER_CODE64>:
ffff800000109828:	00 00                	add    %al,(%rax)
ffff80000010982a:	00 00                	add    %al,(%rax)
ffff80000010982c:	00 f8                	add    %bh,%al
ffff80000010982e:	20 00                	and    %al,(%rax)

ffff800000109830 <LABEL_DESC_USER_DATA64>:
ffff800000109830:	00 00                	add    %al,(%rax)
ffff800000109832:	00 00                	add    %al,(%rax)
ffff800000109834:	00 f2                	add    %dh,%dl
	...

ffff800000109838 <LABEL_DESC_KERNEL_CODE32>:
ffff800000109838:	ff                   	(bad)  
ffff800000109839:	ff 00                	incl   (%rax)
ffff80000010983b:	00 00                	add    %al,(%rax)
ffff80000010983d:	9a                   	(bad)  
ffff80000010983e:	cf                   	iret   
	...

ffff800000109840 <LABEL_DESC_KERNEL_DATA32>:
ffff800000109840:	ff                   	(bad)  
ffff800000109841:	ff 00                	incl   (%rax)
ffff800000109843:	00 00                	add    %al,(%rax)
ffff800000109845:	92                   	xchg   %eax,%edx
ffff800000109846:	cf                   	iret   
	...

ffff800000109898 <GDT_END>:
ffff800000109898:	97                   	xchg   %eax,%edi
ffff800000109899:	00 00                	add    %al,(%rax)
ffff80000010989b:	98                   	cwtl   
ffff80000010989c:	10 00                	adc    %al,(%rax)
ffff80000010989e:	00 80 ff ff      	add    %al,0xffff(%rax)

ffff8000001098a2 <LABEL_IDT>:
	...

ffff80000010a8a2 <IDT_END>:
ffff80000010a8a2:	ff 0f                	decl   (%rdi)
ffff80000010a8a4:	a2 98 10 00 00 80 ff 	movabs %al,0xffff8000001098
ffff80000010a8ab:	ff  

ffff80000010a8ac <LABEL_TSS64>:
	...

ffff80000010a914 <TSS64_END>:
ffff80000010a914:	67 00 ac a8 10 00 00 	add    %ch,-0x7ffffff0(%eax,%ebp,4)
ffff80000010a91b:	80 
ffff80000010a91c:	ff                   	(bad)  
ffff80000010a91d:	ff 00                	incl   (%rax)
	...

ffff80000010a920 <font_ascii>:
	...
ffff80000010ab30:	00 10                	add    %dl,(%rax)
ffff80000010ab32:	10 10                	adc    %dl,(%rax)
ffff80000010ab34:	10 10                	adc    %dl,(%rax)
ffff80000010ab36:	10 10                	adc    %dl,(%rax)
ffff80000010ab38:	10 10                	adc    %dl,(%rax)
ffff80000010ab3a:	00 00                	add    %al,(%rax)
ffff80000010ab3c:	10 10                	adc    %dl,(%rax)
ffff80000010ab3e:	00 00                	add    %al,(%rax)
ffff80000010ab40:	28 28                	sub    %ch,(%rax)
ffff80000010ab42:	28 00                	sub    %al,(%rax)
	...
ffff80000010ab50:	00 44 44 44          	add    %al,0x44(%rsp,%rax,2)
ffff80000010ab54:	fe 44 44 44          	incb   0x44(%rsp,%rax,2)
ffff80000010ab58:	44                   	rex.R
ffff80000010ab59:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010ab5e:	00 00                	add    %al,(%rax)
ffff80000010ab60:	10 3a                	adc    %bh,(%rdx)
ffff80000010ab62:	56                   	push   %rsi
ffff80000010ab63:	92                   	xchg   %eax,%edx
ffff80000010ab64:	92                   	xchg   %eax,%edx
ffff80000010ab65:	90                   	nop
ffff80000010ab66:	50                   	push   %rax
ffff80000010ab67:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010ab6a:	92                   	xchg   %eax,%edx
ffff80000010ab6b:	92                   	xchg   %eax,%edx
ffff80000010ab6c:	d4                   	(bad)  
ffff80000010ab6d:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010ab72:	94                   	xchg   %eax,%esp
ffff80000010ab73:	94                   	xchg   %eax,%esp
ffff80000010ab74:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010ab79:	2c 52                	sub    $0x52,%al
ffff80000010ab7b:	52                   	push   %rdx
ffff80000010ab7c:	92                   	xchg   %eax,%edx
ffff80000010ab7d:	8c 00                	mov    %es,(%rax)
ffff80000010ab7f:	00 00                	add    %al,(%rax)
ffff80000010ab81:	70 88                	jo     ffff80000010ab0b <font_ascii+0x1eb>
ffff80000010ab83:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010ab89:	92                   	xchg   %eax,%edx
ffff80000010ab8a:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010ab91:	08 10                	or     %dl,(%rax)
	...
ffff80000010ab9f:	00 02                	add    %al,(%rdx)
ffff80000010aba1:	04 08                	add    $0x8,%al
ffff80000010aba3:	08 10                	or     %dl,(%rax)
ffff80000010aba5:	10 10                	adc    %dl,(%rax)
ffff80000010aba7:	10 10                	adc    %dl,(%rax)
ffff80000010aba9:	10 10                	adc    %dl,(%rax)
ffff80000010abab:	08 08                	or     %cl,(%rax)
ffff80000010abad:	04 02                	add    $0x2,%al
ffff80000010abaf:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010abb5:	10 10                	adc    %dl,(%rax)
ffff80000010abb7:	10 10                	adc    %dl,(%rax)
ffff80000010abb9:	10 10                	adc    %dl,(%rax)
ffff80000010abbb:	20 20                	and    %ah,(%rax)
ffff80000010abbd:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010abc1:	00 00                	add    %al,(%rax)
ffff80000010abc3:	00 00                	add    %al,(%rax)
ffff80000010abc5:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010abcb:	10 00                	adc    %al,(%rax)
	...
ffff80000010abd5:	10 10                	adc    %dl,(%rax)
ffff80000010abd7:	10 fe                	adc    %bh,%dh
ffff80000010abd9:	10 10                	adc    %dl,(%rax)
ffff80000010abdb:	10 00                	adc    %al,(%rax)
	...
ffff80000010abe9:	00 00                	add    %al,(%rax)
ffff80000010abeb:	18 18                	sbb    %bl,(%rax)
ffff80000010abed:	08 08                	or     %cl,(%rax)
ffff80000010abef:	10 00                	adc    %al,(%rax)
ffff80000010abf1:	00 00                	add    %al,(%rax)
ffff80000010abf3:	00 00                	add    %al,(%rax)
ffff80000010abf5:	00 00                	add    %al,(%rax)
ffff80000010abf7:	00 fe                	add    %bh,%dh
	...
ffff80000010ac09:	00 00                	add    %al,(%rax)
ffff80000010ac0b:	00 18                	add    %bl,(%rax)
ffff80000010ac0d:	18 00                	sbb    %al,(%rax)
ffff80000010ac0f:	00 02                	add    %al,(%rdx)
ffff80000010ac11:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010ac14:	08 08                	or     %cl,(%rax)
ffff80000010ac16:	08 10                	or     %dl,(%rax)
ffff80000010ac18:	10 20                	adc    %ah,(%rax)
ffff80000010ac1a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010ac1d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010ac24:	42 
ffff80000010ac25:	42                   	rex.X
ffff80000010ac26:	42                   	rex.X
ffff80000010ac27:	42                   	rex.X
ffff80000010ac28:	42                   	rex.X
ffff80000010ac29:	42                   	rex.X
ffff80000010ac2a:	42 24 24             	rex.X and $0x24,%al
ffff80000010ac2d:	18 00                	sbb    %al,(%rax)
ffff80000010ac2f:	00 00                	add    %al,(%rax)
ffff80000010ac31:	08 18                	or     %bl,(%rax)
ffff80000010ac33:	28 08                	sub    %cl,(%rax)
ffff80000010ac35:	08 08                	or     %cl,(%rax)
ffff80000010ac37:	08 08                	or     %cl,(%rax)
ffff80000010ac39:	08 08                	or     %cl,(%rax)
ffff80000010ac3b:	08 08                	or     %cl,(%rax)
ffff80000010ac3d:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010ac40:	00 18                	add    %bl,(%rax)
ffff80000010ac42:	24 42                	and    $0x42,%al
ffff80000010ac44:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010ac48:	10 20                	adc    %ah,(%rax)
ffff80000010ac4a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010ac4d:	7e 00                	jle    ffff80000010ac4f <font_ascii+0x32f>
ffff80000010ac4f:	00 00                	add    %al,(%rax)
ffff80000010ac51:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010ac54:	02 02                	add    (%rdx),%al
ffff80000010ac56:	04 18                	add    $0x18,%al
ffff80000010ac58:	04 02                	add    $0x2,%al
ffff80000010ac5a:	02 42 24             	add    0x24(%rdx),%al
ffff80000010ac5d:	18 00                	sbb    %al,(%rax)
ffff80000010ac5f:	00 00                	add    %al,(%rax)
ffff80000010ac61:	0c 0c                	or     $0xc,%al
ffff80000010ac63:	0c 14                	or     $0x14,%al
ffff80000010ac65:	14 14                	adc    $0x14,%al
ffff80000010ac67:	24 24                	and    $0x24,%al
ffff80000010ac69:	44 7e 04             	rex.R jle ffff80000010ac70 <font_ascii+0x350>
ffff80000010ac6c:	04 1e                	add    $0x1e,%al
ffff80000010ac6e:	00 00                	add    %al,(%rax)
ffff80000010ac70:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010ac74:	40 58                	rex pop %rax
ffff80000010ac76:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010ac79:	02 02                	add    (%rdx),%al
ffff80000010ac7b:	42 24 18             	rex.X and $0x18,%al
ffff80000010ac7e:	00 00                	add    %al,(%rax)
ffff80000010ac80:	00 18                	add    %bl,(%rax)
ffff80000010ac82:	24 42                	and    $0x42,%al
ffff80000010ac84:	40 58                	rex pop %rax
ffff80000010ac86:	64 42                	fs rex.X
ffff80000010ac88:	42                   	rex.X
ffff80000010ac89:	42                   	rex.X
ffff80000010ac8a:	42                   	rex.X
ffff80000010ac8b:	42 24 18             	rex.X and $0x18,%al
ffff80000010ac8e:	00 00                	add    %al,(%rax)
ffff80000010ac90:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010ac93:	42 04 04             	rex.X add $0x4,%al
ffff80000010ac96:	08 08                	or     %cl,(%rax)
ffff80000010ac98:	08 10                	or     %dl,(%rax)
ffff80000010ac9a:	10 10                	adc    %dl,(%rax)
ffff80000010ac9c:	10 38                	adc    %bh,(%rax)
ffff80000010ac9e:	00 00                	add    %al,(%rax)
ffff80000010aca0:	00 18                	add    %bl,(%rax)
ffff80000010aca2:	24 42                	and    $0x42,%al
ffff80000010aca4:	42                   	rex.X
ffff80000010aca5:	42 24 18             	rex.X and $0x18,%al
ffff80000010aca8:	24 42                	and    $0x42,%al
ffff80000010acaa:	42                   	rex.X
ffff80000010acab:	42 24 18             	rex.X and $0x18,%al
ffff80000010acae:	00 00                	add    %al,(%rax)
ffff80000010acb0:	00 18                	add    %bl,(%rax)
ffff80000010acb2:	24 42                	and    $0x42,%al
ffff80000010acb4:	42                   	rex.X
ffff80000010acb5:	42                   	rex.X
ffff80000010acb6:	42                   	rex.X
ffff80000010acb7:	42                   	rex.X
ffff80000010acb8:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010acbb:	42 24 18             	rex.X and $0x18,%al
ffff80000010acbe:	00 00                	add    %al,(%rax)
ffff80000010acc0:	00 00                	add    %al,(%rax)
ffff80000010acc2:	00 00                	add    %al,(%rax)
ffff80000010acc4:	00 18                	add    %bl,(%rax)
ffff80000010acc6:	18 00                	sbb    %al,(%rax)
ffff80000010acc8:	00 00                	add    %al,(%rax)
ffff80000010acca:	00 00                	add    %al,(%rax)
ffff80000010accc:	18 18                	sbb    %bl,(%rax)
ffff80000010acce:	00 00                	add    %al,(%rax)
ffff80000010acd0:	00 00                	add    %al,(%rax)
ffff80000010acd2:	00 00                	add    %al,(%rax)
ffff80000010acd4:	00 18                	add    %bl,(%rax)
ffff80000010acd6:	18 00                	sbb    %al,(%rax)
ffff80000010acd8:	00 00                	add    %al,(%rax)
ffff80000010acda:	00 18                	add    %bl,(%rax)
ffff80000010acdc:	18 08                	sbb    %cl,(%rax)
ffff80000010acde:	08 10                	or     %dl,(%rax)
ffff80000010ace0:	00 02                	add    %al,(%rdx)
ffff80000010ace2:	04 08                	add    $0x8,%al
ffff80000010ace4:	10 20                	adc    %ah,(%rax)
ffff80000010ace6:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010aced:	04 
ffff80000010acee:	02 00                	add    (%rax),%al
ffff80000010acf0:	00 00                	add    %al,(%rax)
ffff80000010acf2:	00 00                	add    %al,(%rax)
ffff80000010acf4:	00 00                	add    %al,(%rax)
ffff80000010acf6:	fe 00                	incb   (%rax)
ffff80000010acf8:	00 fe                	add    %bh,%dh
ffff80000010acfa:	00 00                	add    %al,(%rax)
ffff80000010acfc:	00 00                	add    %al,(%rax)
ffff80000010acfe:	00 00                	add    %al,(%rax)
ffff80000010ad00:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010ad06:	04 02                	add    $0x2,%al
ffff80000010ad08:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010ad0b:	10 20                	adc    %ah,(%rax)
ffff80000010ad0d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010ad11:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010ad15:	82                   	(bad)  
ffff80000010ad16:	04 08                	add    $0x8,%al
ffff80000010ad18:	10 10                	adc    %dl,(%rax)
ffff80000010ad1a:	00 00                	add    %al,(%rax)
ffff80000010ad1c:	18 18                	sbb    %bl,(%rax)
ffff80000010ad1e:	00 00                	add    %al,(%rax)
ffff80000010ad20:	00 38                	add    %bh,(%rax)
ffff80000010ad22:	44 82                	rex.R (bad) 
ffff80000010ad24:	9a                   	(bad)  
ffff80000010ad25:	aa                   	stos   %al,%es:(%rdi)
ffff80000010ad26:	aa                   	stos   %al,%es:(%rdi)
ffff80000010ad27:	aa                   	stos   %al,%es:(%rdi)
ffff80000010ad28:	aa                   	stos   %al,%es:(%rdi)
ffff80000010ad29:	aa                   	stos   %al,%es:(%rdi)
ffff80000010ad2a:	9c                   	pushfq 
ffff80000010ad2b:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010ad2f:	00 00                	add    %al,(%rax)
ffff80000010ad31:	18 18                	sbb    %bl,(%rax)
ffff80000010ad33:	18 18                	sbb    %bl,(%rax)
ffff80000010ad35:	24 24                	and    $0x24,%al
ffff80000010ad37:	24 24                	and    $0x24,%al
ffff80000010ad39:	7e 42                	jle    ffff80000010ad7d <font_ascii+0x45d>
ffff80000010ad3b:	42                   	rex.X
ffff80000010ad3c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010ad3f:	00 00                	add    %al,(%rax)
ffff80000010ad41:	f0 48                	lock rex.W
ffff80000010ad43:	44                   	rex.R
ffff80000010ad44:	44                   	rex.R
ffff80000010ad45:	44                   	rex.R
ffff80000010ad46:	48 78 44             	rex.W js ffff80000010ad8d <font_ascii+0x46d>
ffff80000010ad49:	42                   	rex.X
ffff80000010ad4a:	42                   	rex.X
ffff80000010ad4b:	42                   	rex.X
ffff80000010ad4c:	44 f8                	rex.R clc 
ffff80000010ad4e:	00 00                	add    %al,(%rax)
ffff80000010ad50:	00 3a                	add    %bh,(%rdx)
ffff80000010ad52:	46                   	rex.RX
ffff80000010ad53:	42 82                	rex.X (bad) 
ffff80000010ad55:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010ad5c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010ad5f:	00 00                	add    %al,(%rax)
ffff80000010ad61:	f8                   	clc    
ffff80000010ad62:	44                   	rex.R
ffff80000010ad63:	44                   	rex.R
ffff80000010ad64:	42                   	rex.X
ffff80000010ad65:	42                   	rex.X
ffff80000010ad66:	42                   	rex.X
ffff80000010ad67:	42                   	rex.X
ffff80000010ad68:	42                   	rex.X
ffff80000010ad69:	42                   	rex.X
ffff80000010ad6a:	42                   	rex.X
ffff80000010ad6b:	44                   	rex.R
ffff80000010ad6c:	44 f8                	rex.R clc 
ffff80000010ad6e:	00 00                	add    %al,(%rax)
ffff80000010ad70:	00 fe                	add    %bh,%dh
ffff80000010ad72:	42                   	rex.X
ffff80000010ad73:	42                   	rex.X
ffff80000010ad74:	40                   	rex
ffff80000010ad75:	40                   	rex
ffff80000010ad76:	44 7c 44             	rex.R jl ffff80000010adbd <font_ascii+0x49d>
ffff80000010ad79:	40                   	rex
ffff80000010ad7a:	40                   	rex
ffff80000010ad7b:	42                   	rex.X
ffff80000010ad7c:	42 fe 00             	rex.X incb (%rax)
ffff80000010ad7f:	00 00                	add    %al,(%rax)
ffff80000010ad81:	fe 42 42             	incb   0x42(%rdx)
ffff80000010ad84:	40                   	rex
ffff80000010ad85:	40                   	rex
ffff80000010ad86:	44 7c 44             	rex.R jl ffff80000010adcd <font_ascii+0x4ad>
ffff80000010ad89:	44                   	rex.R
ffff80000010ad8a:	40                   	rex
ffff80000010ad8b:	40                   	rex
ffff80000010ad8c:	40                   	rex
ffff80000010ad8d:	f0 00 00             	lock add %al,(%rax)
ffff80000010ad90:	00 3a                	add    %bh,(%rdx)
ffff80000010ad92:	46                   	rex.RX
ffff80000010ad93:	42 82                	rex.X (bad) 
ffff80000010ad95:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010ad9c:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010ad9f:	00 00                	add    %al,(%rax)
ffff80000010ada1:	e7 42                	out    %eax,$0x42
ffff80000010ada3:	42                   	rex.X
ffff80000010ada4:	42                   	rex.X
ffff80000010ada5:	42                   	rex.X
ffff80000010ada6:	42 7e 42             	rex.X jle ffff80000010adeb <font_ascii+0x4cb>
ffff80000010ada9:	42                   	rex.X
ffff80000010adaa:	42                   	rex.X
ffff80000010adab:	42                   	rex.X
ffff80000010adac:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010adaf:	00 00                	add    %al,(%rax)
ffff80000010adb1:	7c 10                	jl     ffff80000010adc3 <font_ascii+0x4a3>
ffff80000010adb3:	10 10                	adc    %dl,(%rax)
ffff80000010adb5:	10 10                	adc    %dl,(%rax)
ffff80000010adb7:	10 10                	adc    %dl,(%rax)
ffff80000010adb9:	10 10                	adc    %dl,(%rax)
ffff80000010adbb:	10 10                	adc    %dl,(%rax)
ffff80000010adbd:	7c 00                	jl     ffff80000010adbf <font_ascii+0x49f>
ffff80000010adbf:	00 00                	add    %al,(%rax)
ffff80000010adc1:	1f                   	(bad)  
ffff80000010adc2:	04 04                	add    $0x4,%al
ffff80000010adc4:	04 04                	add    $0x4,%al
ffff80000010adc6:	04 04                	add    $0x4,%al
ffff80000010adc8:	04 04                	add    $0x4,%al
ffff80000010adca:	04 04                	add    $0x4,%al
ffff80000010adcc:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010adcf:	00 00                	add    %al,(%rax)
ffff80000010add1:	e7 42                	out    %eax,$0x42
ffff80000010add3:	44                   	rex.R
ffff80000010add4:	48 50                	rex.W push %rax
ffff80000010add6:	50                   	push   %rax
ffff80000010add7:	60                   	(bad)  
ffff80000010add8:	50                   	push   %rax
ffff80000010add9:	50                   	push   %rax
ffff80000010adda:	48                   	rex.W
ffff80000010addb:	44                   	rex.R
ffff80000010addc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010addf:	00 00                	add    %al,(%rax)
ffff80000010ade1:	f0 40                	lock rex
ffff80000010ade3:	40                   	rex
ffff80000010ade4:	40                   	rex
ffff80000010ade5:	40                   	rex
ffff80000010ade6:	40                   	rex
ffff80000010ade7:	40                   	rex
ffff80000010ade8:	40                   	rex
ffff80000010ade9:	40                   	rex
ffff80000010adea:	40                   	rex
ffff80000010adeb:	42                   	rex.X
ffff80000010adec:	42 fe 00             	rex.X incb (%rax)
ffff80000010adef:	00 00                	add    %al,(%rax)
ffff80000010adf1:	c3                   	retq   
ffff80000010adf2:	42                   	rex.X
ffff80000010adf3:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010adf7:	5a                   	pop    %rdx
ffff80000010adf8:	5a                   	pop    %rdx
ffff80000010adf9:	42                   	rex.X
ffff80000010adfa:	42                   	rex.X
ffff80000010adfb:	42                   	rex.X
ffff80000010adfc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010adff:	00 00                	add    %al,(%rax)
ffff80000010ae01:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010ae08:	4a                   	rex.WX
ffff80000010ae09:	4a                   	rex.WX
ffff80000010ae0a:	4a                   	rex.WX
ffff80000010ae0b:	46                   	rex.RX
ffff80000010ae0c:	46 e2 00             	rex.RX loop ffff80000010ae0f <font_ascii+0x4ef>
ffff80000010ae0f:	00 00                	add    %al,(%rax)
ffff80000010ae11:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010ae15:	82                   	(bad)  
ffff80000010ae16:	82                   	(bad)  
ffff80000010ae17:	82                   	(bad)  
ffff80000010ae18:	82                   	(bad)  
ffff80000010ae19:	82                   	(bad)  
ffff80000010ae1a:	82                   	(bad)  
ffff80000010ae1b:	82                   	(bad)  
ffff80000010ae1c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010ae1f:	00 00                	add    %al,(%rax)
ffff80000010ae21:	f8                   	clc    
ffff80000010ae22:	44                   	rex.R
ffff80000010ae23:	42                   	rex.X
ffff80000010ae24:	42                   	rex.X
ffff80000010ae25:	42                   	rex.X
ffff80000010ae26:	44 78 40             	rex.R js ffff80000010ae69 <font_ascii+0x549>
ffff80000010ae29:	40                   	rex
ffff80000010ae2a:	40                   	rex
ffff80000010ae2b:	40                   	rex
ffff80000010ae2c:	40                   	rex
ffff80000010ae2d:	f0 00 00             	lock add %al,(%rax)
ffff80000010ae30:	00 38                	add    %bh,(%rax)
ffff80000010ae32:	44 82                	rex.R (bad) 
ffff80000010ae34:	82                   	(bad)  
ffff80000010ae35:	82                   	(bad)  
ffff80000010ae36:	82                   	(bad)  
ffff80000010ae37:	82                   	(bad)  
ffff80000010ae38:	82                   	(bad)  
ffff80000010ae39:	82                   	(bad)  
ffff80000010ae3a:	92                   	xchg   %eax,%edx
ffff80000010ae3b:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010ae3f:	00 00                	add    %al,(%rax)
ffff80000010ae41:	fc                   	cld    
ffff80000010ae42:	42                   	rex.X
ffff80000010ae43:	42                   	rex.X
ffff80000010ae44:	42                   	rex.X
ffff80000010ae45:	42 7c 44             	rex.X jl ffff80000010ae8c <font_ascii+0x56c>
ffff80000010ae48:	42                   	rex.X
ffff80000010ae49:	42                   	rex.X
ffff80000010ae4a:	42                   	rex.X
ffff80000010ae4b:	42                   	rex.X
ffff80000010ae4c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010ae4f:	00 00                	add    %al,(%rax)
ffff80000010ae51:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010ae54:	82                   	(bad)  
ffff80000010ae55:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010ae59:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010ae5f:	00 00                	add    %al,(%rax)
ffff80000010ae61:	fe                   	(bad)  
ffff80000010ae62:	92                   	xchg   %eax,%edx
ffff80000010ae63:	92                   	xchg   %eax,%edx
ffff80000010ae64:	10 10                	adc    %dl,(%rax)
ffff80000010ae66:	10 10                	adc    %dl,(%rax)
ffff80000010ae68:	10 10                	adc    %dl,(%rax)
ffff80000010ae6a:	10 10                	adc    %dl,(%rax)
ffff80000010ae6c:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010ae70:	00 e7                	add    %ah,%bh
ffff80000010ae72:	42                   	rex.X
ffff80000010ae73:	42                   	rex.X
ffff80000010ae74:	42                   	rex.X
ffff80000010ae75:	42                   	rex.X
ffff80000010ae76:	42                   	rex.X
ffff80000010ae77:	42                   	rex.X
ffff80000010ae78:	42                   	rex.X
ffff80000010ae79:	42                   	rex.X
ffff80000010ae7a:	42                   	rex.X
ffff80000010ae7b:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010ae7e:	00 00                	add    %al,(%rax)
ffff80000010ae80:	00 e7                	add    %ah,%bh
ffff80000010ae82:	42                   	rex.X
ffff80000010ae83:	42                   	rex.X
ffff80000010ae84:	42                   	rex.X
ffff80000010ae85:	42 24 24             	rex.X and $0x24,%al
ffff80000010ae88:	24 24                	and    $0x24,%al
ffff80000010ae8a:	18 18                	sbb    %bl,(%rax)
ffff80000010ae8c:	18 18                	sbb    %bl,(%rax)
ffff80000010ae8e:	00 00                	add    %al,(%rax)
ffff80000010ae90:	00 e7                	add    %ah,%bh
ffff80000010ae92:	42                   	rex.X
ffff80000010ae93:	42                   	rex.X
ffff80000010ae94:	42 5a                	rex.X pop %rdx
ffff80000010ae96:	5a                   	pop    %rdx
ffff80000010ae97:	5a                   	pop    %rdx
ffff80000010ae98:	5a                   	pop    %rdx
ffff80000010ae99:	24 24                	and    $0x24,%al
ffff80000010ae9b:	24 24                	and    $0x24,%al
ffff80000010ae9d:	24 00                	and    $0x0,%al
ffff80000010ae9f:	00 00                	add    %al,(%rax)
ffff80000010aea1:	e7 42                	out    %eax,$0x42
ffff80000010aea3:	42 24 24             	rex.X and $0x24,%al
ffff80000010aea6:	24 18                	and    $0x18,%al
ffff80000010aea8:	24 24                	and    $0x24,%al
ffff80000010aeaa:	24 42                	and    $0x42,%al
ffff80000010aeac:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010aeaf:	00 00                	add    %al,(%rax)
ffff80000010aeb1:	ee                   	out    %al,(%dx)
ffff80000010aeb2:	44                   	rex.R
ffff80000010aeb3:	44                   	rex.R
ffff80000010aeb4:	44 28 28             	sub    %r13b,(%rax)
ffff80000010aeb7:	28 10                	sub    %dl,(%rax)
ffff80000010aeb9:	10 10                	adc    %dl,(%rax)
ffff80000010aebb:	10 10                	adc    %dl,(%rax)
ffff80000010aebd:	7c 00                	jl     ffff80000010aebf <font_ascii+0x59f>
ffff80000010aebf:	00 00                	add    %al,(%rax)
ffff80000010aec1:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010aec8:	20 20                	and    %ah,(%rax)
ffff80000010aeca:	40                   	rex
ffff80000010aecb:	42 82                	rex.X (bad) 
ffff80000010aecd:	fe 00                	incb   (%rax)
ffff80000010aecf:	00 00                	add    %al,(%rax)
ffff80000010aed1:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010aed4:	20 20                	and    %ah,(%rax)
ffff80000010aed6:	20 20                	and    %ah,(%rax)
ffff80000010aed8:	20 20                	and    %ah,(%rax)
ffff80000010aeda:	20 20                	and    %ah,(%rax)
ffff80000010aedc:	20 20                	and    %ah,(%rax)
ffff80000010aede:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010aee5:	20 20                	and    %ah,(%rax)
ffff80000010aee7:	10 10                	adc    %dl,(%rax)
ffff80000010aee9:	08 08                	or     %cl,(%rax)
ffff80000010aeeb:	04 04                	add    $0x4,%al
ffff80000010aeed:	04 02                	add    $0x2,%al
ffff80000010aeef:	02 00                	add    (%rax),%al
ffff80000010aef1:	7c 04                	jl     ffff80000010aef7 <font_ascii+0x5d7>
ffff80000010aef3:	04 04                	add    $0x4,%al
ffff80000010aef5:	04 04                	add    $0x4,%al
ffff80000010aef7:	04 04                	add    $0x4,%al
ffff80000010aef9:	04 04                	add    $0x4,%al
ffff80000010aefb:	04 04                	add    $0x4,%al
ffff80000010aefd:	04 7c                	add    $0x7c,%al
ffff80000010aeff:	00 00                	add    %al,(%rax)
ffff80000010af01:	10 28                	adc    %ch,(%rax)
ffff80000010af03:	44 82                	rex.R (bad) 
	...
ffff80000010af1d:	00 fe                	add    %bh,%dh
ffff80000010af1f:	00 10                	add    %dl,(%rax)
ffff80000010af21:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010af34:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010af37:	04 3c                	add    $0x3c,%al
ffff80000010af39:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010af40:	c0 
ffff80000010af41:	40                   	rex
ffff80000010af42:	40                   	rex
ffff80000010af43:	40                   	rex
ffff80000010af44:	40 58                	rex pop %rax
ffff80000010af46:	64 42                	fs rex.X
ffff80000010af48:	42                   	rex.X
ffff80000010af49:	42                   	rex.X
ffff80000010af4a:	42                   	rex.X
ffff80000010af4b:	42                   	rex.X
ffff80000010af4c:	64 58                	fs pop %rax
ffff80000010af4e:	00 00                	add    %al,(%rax)
ffff80000010af50:	00 00                	add    %al,(%rax)
ffff80000010af52:	00 00                	add    %al,(%rax)
ffff80000010af54:	00 30                	add    %dh,(%rax)
ffff80000010af56:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010af5d:	38 
ffff80000010af5e:	00 00                	add    %al,(%rax)
ffff80000010af60:	0c 04                	or     $0x4,%al
ffff80000010af62:	04 04                	add    $0x4,%al
ffff80000010af64:	04 34                	add    $0x34,%al
ffff80000010af66:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010af6d:	36 
ffff80000010af6e:	00 00                	add    %al,(%rax)
ffff80000010af70:	00 00                	add    %al,(%rax)
ffff80000010af72:	00 00                	add    %al,(%rax)
ffff80000010af74:	00 38                	add    %bh,(%rax)
ffff80000010af76:	44 82                	rex.R (bad) 
ffff80000010af78:	82                   	(bad)  
ffff80000010af79:	fc                   	cld    
ffff80000010af7a:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010af81:	10 10                	adc    %dl,(%rax)
ffff80000010af83:	10 10                	adc    %dl,(%rax)
ffff80000010af85:	7c 10                	jl     ffff80000010af97 <font_ascii+0x677>
ffff80000010af87:	10 10                	adc    %dl,(%rax)
ffff80000010af89:	10 10                	adc    %dl,(%rax)
ffff80000010af8b:	10 10                	adc    %dl,(%rax)
ffff80000010af8d:	7c 00                	jl     ffff80000010af8f <font_ascii+0x66f>
ffff80000010af8f:	00 00                	add    %al,(%rax)
ffff80000010af91:	00 00                	add    %al,(%rax)
ffff80000010af93:	00 00                	add    %al,(%rax)
ffff80000010af95:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010af9c:	34 04 
ffff80000010af9e:	04 38                	add    $0x38,%al
ffff80000010afa0:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010afa4:	40 58                	rex pop %rax
ffff80000010afa6:	64 42                	fs rex.X
ffff80000010afa8:	42                   	rex.X
ffff80000010afa9:	42                   	rex.X
ffff80000010afaa:	42                   	rex.X
ffff80000010afab:	42                   	rex.X
ffff80000010afac:	42 e3 00             	rex.X jrcxz ffff80000010afaf <font_ascii+0x68f>
ffff80000010afaf:	00 00                	add    %al,(%rax)
ffff80000010afb1:	10 10                	adc    %dl,(%rax)
ffff80000010afb3:	00 00                	add    %al,(%rax)
ffff80000010afb5:	30 10                	xor    %dl,(%rax)
ffff80000010afb7:	10 10                	adc    %dl,(%rax)
ffff80000010afb9:	10 10                	adc    %dl,(%rax)
ffff80000010afbb:	10 10                	adc    %dl,(%rax)
ffff80000010afbd:	38 00                	cmp    %al,(%rax)
ffff80000010afbf:	00 00                	add    %al,(%rax)
ffff80000010afc1:	04 04                	add    $0x4,%al
ffff80000010afc3:	00 00                	add    %al,(%rax)
ffff80000010afc5:	0c 04                	or     $0x4,%al
ffff80000010afc7:	04 04                	add    $0x4,%al
ffff80000010afc9:	04 04                	add    $0x4,%al
ffff80000010afcb:	04 04                	add    $0x4,%al
ffff80000010afcd:	08 08                	or     %cl,(%rax)
ffff80000010afcf:	30 c0                	xor    %al,%al
ffff80000010afd1:	40                   	rex
ffff80000010afd2:	40                   	rex
ffff80000010afd3:	40                   	rex
ffff80000010afd4:	40                   	rex
ffff80000010afd5:	4e                   	rex.WRX
ffff80000010afd6:	44                   	rex.R
ffff80000010afd7:	48 50                	rex.W push %rax
ffff80000010afd9:	60                   	(bad)  
ffff80000010afda:	50                   	push   %rax
ffff80000010afdb:	48                   	rex.W
ffff80000010afdc:	44 e6 00             	rex.R out %al,$0x0
ffff80000010afdf:	00 30                	add    %dh,(%rax)
ffff80000010afe1:	10 10                	adc    %dl,(%rax)
ffff80000010afe3:	10 10                	adc    %dl,(%rax)
ffff80000010afe5:	10 10                	adc    %dl,(%rax)
ffff80000010afe7:	10 10                	adc    %dl,(%rax)
ffff80000010afe9:	10 10                	adc    %dl,(%rax)
ffff80000010afeb:	10 10                	adc    %dl,(%rax)
ffff80000010afed:	38 00                	cmp    %al,(%rax)
ffff80000010afef:	00 00                	add    %al,(%rax)
ffff80000010aff1:	00 00                	add    %al,(%rax)
ffff80000010aff3:	00 00                	add    %al,(%rax)
ffff80000010aff5:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010aff9:	49                   	rex.WB
ffff80000010affa:	49                   	rex.WB
ffff80000010affb:	49                   	rex.WB
ffff80000010affc:	49 db 00             	rex.WB fildl (%r8)
ffff80000010afff:	00 00                	add    %al,(%rax)
ffff80000010b001:	00 00                	add    %al,(%rax)
ffff80000010b003:	00 00                	add    %al,(%rax)
ffff80000010b005:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010b009:	42                   	rex.X
ffff80000010b00a:	42                   	rex.X
ffff80000010b00b:	42                   	rex.X
ffff80000010b00c:	42 e3 00             	rex.X jrcxz ffff80000010b00f <font_ascii+0x6ef>
ffff80000010b00f:	00 00                	add    %al,(%rax)
ffff80000010b011:	00 00                	add    %al,(%rax)
ffff80000010b013:	00 00                	add    %al,(%rax)
ffff80000010b015:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010b019:	82                   	(bad)  
ffff80000010b01a:	82                   	(bad)  
ffff80000010b01b:	82                   	(bad)  
ffff80000010b01c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010b01f:	00 00                	add    %al,(%rax)
ffff80000010b021:	00 00                	add    %al,(%rax)
ffff80000010b023:	00 d8                	add    %bl,%al
ffff80000010b025:	64 42                	fs rex.X
ffff80000010b027:	42                   	rex.X
ffff80000010b028:	42                   	rex.X
ffff80000010b029:	42                   	rex.X
ffff80000010b02a:	42                   	rex.X
ffff80000010b02b:	64 58                	fs pop %rax
ffff80000010b02d:	40                   	rex
ffff80000010b02e:	40 e0 00             	rex loopne ffff80000010b031 <font_ascii+0x711>
ffff80000010b031:	00 00                	add    %al,(%rax)
ffff80000010b033:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010b036:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010b03d:	04 04                	add    $0x4,%al
ffff80000010b03f:	0e                   	(bad)  
ffff80000010b040:	00 00                	add    %al,(%rax)
ffff80000010b042:	00 00                	add    %al,(%rax)
ffff80000010b044:	00 dc                	add    %bl,%ah
ffff80000010b046:	62 42                	(bad)  
ffff80000010b048:	40                   	rex
ffff80000010b049:	40                   	rex
ffff80000010b04a:	40                   	rex
ffff80000010b04b:	40                   	rex
ffff80000010b04c:	40 e0 00             	rex loopne ffff80000010b04f <font_ascii+0x72f>
ffff80000010b04f:	00 00                	add    %al,(%rax)
ffff80000010b051:	00 00                	add    %al,(%rax)
ffff80000010b053:	00 00                	add    %al,(%rax)
ffff80000010b055:	7a 86                	jp     ffff80000010afdd <font_ascii+0x6bd>
ffff80000010b057:	82                   	(bad)  
ffff80000010b058:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010b05b:	82                   	(bad)  
ffff80000010b05c:	c2 bc 00             	retq   $0xbc
ffff80000010b05f:	00 00                	add    %al,(%rax)
ffff80000010b061:	00 10                	add    %dl,(%rax)
ffff80000010b063:	10 10                	adc    %dl,(%rax)
ffff80000010b065:	7c 10                	jl     ffff80000010b077 <font_ascii+0x757>
ffff80000010b067:	10 10                	adc    %dl,(%rax)
ffff80000010b069:	10 10                	adc    %dl,(%rax)
ffff80000010b06b:	10 10                	adc    %dl,(%rax)
ffff80000010b06d:	0e                   	(bad)  
ffff80000010b06e:	00 00                	add    %al,(%rax)
ffff80000010b070:	00 00                	add    %al,(%rax)
ffff80000010b072:	00 00                	add    %al,(%rax)
ffff80000010b074:	00 c6                	add    %al,%dh
ffff80000010b076:	42                   	rex.X
ffff80000010b077:	42                   	rex.X
ffff80000010b078:	42                   	rex.X
ffff80000010b079:	42                   	rex.X
ffff80000010b07a:	42                   	rex.X
ffff80000010b07b:	42                   	rex.X
ffff80000010b07c:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010b07f:	00 00                	add    %al,(%rax)
ffff80000010b081:	00 00                	add    %al,(%rax)
ffff80000010b083:	00 00                	add    %al,(%rax)
ffff80000010b085:	e7 42                	out    %eax,$0x42
ffff80000010b087:	42                   	rex.X
ffff80000010b088:	42 24 24             	rex.X and $0x24,%al
ffff80000010b08b:	24 18                	and    $0x18,%al
ffff80000010b08d:	18 00                	sbb    %al,(%rax)
ffff80000010b08f:	00 00                	add    %al,(%rax)
ffff80000010b091:	00 00                	add    %al,(%rax)
ffff80000010b093:	00 00                	add    %al,(%rax)
ffff80000010b095:	e7 42                	out    %eax,$0x42
ffff80000010b097:	42 5a                	rex.X pop %rdx
ffff80000010b099:	5a                   	pop    %rdx
ffff80000010b09a:	5a                   	pop    %rdx
ffff80000010b09b:	24 24                	and    $0x24,%al
ffff80000010b09d:	24 00                	and    $0x0,%al
ffff80000010b09f:	00 00                	add    %al,(%rax)
ffff80000010b0a1:	00 00                	add    %al,(%rax)
ffff80000010b0a3:	00 00                	add    %al,(%rax)
ffff80000010b0a5:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010b0aa:	28 28                	sub    %ch,(%rax)
ffff80000010b0ac:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010b0b0:	00 00                	add    %al,(%rax)
ffff80000010b0b2:	00 00                	add    %al,(%rax)
ffff80000010b0b4:	00 e7                	add    %ah,%bh
ffff80000010b0b6:	42                   	rex.X
ffff80000010b0b7:	42 24 24             	rex.X and $0x24,%al
ffff80000010b0ba:	24 18                	and    $0x18,%al
ffff80000010b0bc:	18 10                	sbb    %dl,(%rax)
ffff80000010b0be:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010b0c1:	00 00                	add    %al,(%rax)
ffff80000010b0c3:	00 00                	add    %al,(%rax)
ffff80000010b0c5:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010b0cb:	42 82                	rex.X (bad) 
ffff80000010b0cd:	fe 00                	incb   (%rax)
ffff80000010b0cf:	00 00                	add    %al,(%rax)
ffff80000010b0d1:	06                   	(bad)  
ffff80000010b0d2:	08 10                	or     %dl,(%rax)
ffff80000010b0d4:	10 10                	adc    %dl,(%rax)
ffff80000010b0d6:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010b0d9:	10 10                	adc    %dl,(%rax)
ffff80000010b0db:	10 08                	adc    %cl,(%rax)
ffff80000010b0dd:	06                   	(bad)  
ffff80000010b0de:	00 00                	add    %al,(%rax)
ffff80000010b0e0:	10 10                	adc    %dl,(%rax)
ffff80000010b0e2:	10 10                	adc    %dl,(%rax)
ffff80000010b0e4:	10 10                	adc    %dl,(%rax)
ffff80000010b0e6:	10 10                	adc    %dl,(%rax)
ffff80000010b0e8:	10 10                	adc    %dl,(%rax)
ffff80000010b0ea:	10 10                	adc    %dl,(%rax)
ffff80000010b0ec:	10 10                	adc    %dl,(%rax)
ffff80000010b0ee:	10 10                	adc    %dl,(%rax)
ffff80000010b0f0:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010b0f3:	08 08                	or     %cl,(%rax)
ffff80000010b0f5:	08 08                	or     %cl,(%rax)
ffff80000010b0f7:	06                   	(bad)  
ffff80000010b0f8:	08 08                	or     %cl,(%rax)
ffff80000010b0fa:	08 08                	or     %cl,(%rax)
ffff80000010b0fc:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010b0ff:	00 00                	add    %al,(%rax)
ffff80000010b101:	72 8c                	jb     ffff80000010b08f <font_ascii+0x76f>
	...

Disassembly of section .got:

ffff80000010b920 <.got>:
ffff80000010b920:	64 40 10 00          	adc    %al,%fs:(%rax)
ffff80000010b924:	00 80 ff ff dc 40    	add    %al,0x40dcffff(%rax)
ffff80000010b92a:	10 00                	adc    %al,(%rax)
ffff80000010b92c:	00 80 ff ff f3 97    	add    %al,-0x680c0001(%rax)
ffff80000010b932:	10 00                	adc    %al,(%rax)
ffff80000010b934:	00 80 ff ff a2 98    	add    %al,-0x675d0001(%rax)
ffff80000010b93a:	10 00                	adc    %al,(%rax)
ffff80000010b93c:	00 80 ff ff f8 41    	add    %al,0x41f8ffff(%rax)
ffff80000010b942:	10 00                	adc    %al,(%rax)
ffff80000010b944:	00 80 ff ff ac a8    	add    %al,-0x57530001(%rax)
ffff80000010b94a:	10 00                	adc    %al,(%rax)
ffff80000010b94c:	00 80 ff ff 55 41    	add    %al,0x4155ffff(%rax)
ffff80000010b952:	10 00                	adc    %al,(%rax)
ffff80000010b954:	00 80 ff ff ec 40    	add    %al,0x40ecffff(%rax)
ffff80000010b95a:	10 00                	adc    %al,(%rax)
ffff80000010b95c:	00 80 ff ff 68 41    	add    %al,0x4168ffff(%rax)
ffff80000010b962:	10 00                	adc    %al,(%rax)
ffff80000010b964:	00 80 ff ff c5 41    	add    %al,0x41c5ffff(%rax)
ffff80000010b96a:	10 00                	adc    %al,(%rax)
ffff80000010b96c:	00 80 ff ff d6 41    	add    %al,0x41d6ffff(%rax)
ffff80000010b972:	10 00                	adc    %al,(%rax)
ffff80000010b974:	00 80 ff ff e7 41    	add    %al,0x41e7ffff(%rax)
ffff80000010b97a:	10 00                	adc    %al,(%rax)
ffff80000010b97c:	00 80 ff ff 80 ca    	add    %al,-0x357f0001(%rax)
ffff80000010b982:	10 00                	adc    %al,(%rax)
ffff80000010b984:	00 80 ff ff 42 41    	add    %al,0x4142ffff(%rax)
ffff80000010b98a:	10 00                	adc    %al,(%rax)
ffff80000010b98c:	00 80 ff ff 7b 41    	add    %al,0x417bffff(%rax)
ffff80000010b992:	10 00                	adc    %al,(%rax)
ffff80000010b994:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010b99a:	10 00                	adc    %al,(%rax)
ffff80000010b99c:	00 80 ff ff 2d 42    	add    %al,0x422dffff(%rax)
ffff80000010b9a2:	10 00                	adc    %al,(%rax)
ffff80000010b9a4:	00 80 ff ff 1a 42    	add    %al,0x421affff(%rax)
ffff80000010b9aa:	10 00                	adc    %al,(%rax)
ffff80000010b9ac:	00 80 ff ff a1 41    	add    %al,0x41a1ffff(%rax)
ffff80000010b9b2:	10 00                	adc    %al,(%rax)
ffff80000010b9b4:	00 80 ff ff 7f 01    	add    %al,0x17fffff(%rax)
ffff80000010b9ba:	10 00                	adc    %al,(%rax)
ffff80000010b9bc:	00 80 ff ff 64 42    	add    %al,0x4264ffff(%rax)
ffff80000010b9c2:	10 00                	adc    %al,(%rax)
ffff80000010b9c4:	00 80 ff ff 00 98    	add    %al,-0x67ff0001(%rax)
ffff80000010b9ca:	10 00                	adc    %al,(%rax)
ffff80000010b9cc:	00 80 ff ff b2 41    	add    %al,0x41b2ffff(%rax)
ffff80000010b9d2:	10 00                	adc    %al,(%rax)
ffff80000010b9d4:	00 80 ff ff 20 b9    	add    %al,-0x46df0001(%rax)
ffff80000010b9da:	10 00                	adc    %al,(%rax)
ffff80000010b9dc:	00 80 ff ff 09 42    	add    %al,0x4209ffff(%rax)
ffff80000010b9e2:	10 00                	adc    %al,(%rax)
ffff80000010b9e4:	00 80 ff ff 58 94    	add    %al,-0x6ba70001(%rax)
ffff80000010b9ea:	12 00                	adc    (%rax),%al
ffff80000010b9ec:	00 80 ff ff 3e 42    	add    %al,0x423effff(%rax)
ffff80000010b9f2:	10 00                	adc    %al,(%rax)
ffff80000010b9f4:	00 80 ff ff 60 91    	add    %al,-0x6e9f0001(%rax)
ffff80000010b9fa:	12 00                	adc    (%rax),%al
ffff80000010b9fc:	00 80 ff ff 51 42    	add    %al,0x4251ffff(%rax)
ffff80000010ba02:	10 00                	adc    %al,(%rax)
ffff80000010ba04:	00 80 ff ff 27 40    	add    %al,0x4027ffff(%rax)
ffff80000010ba0a:	10 00                	adc    %al,(%rax)
ffff80000010ba0c:	00 80 ff ff fc 40    	add    %al,0x40fcffff(%rax)
ffff80000010ba12:	10 00                	adc    %al,(%rax)
ffff80000010ba14:	00 80 ff ff 8e 41    	add    %al,0x418effff(%rax)
ffff80000010ba1a:	10 00                	adc    %al,(%rax)
ffff80000010ba1c:	00 80 ff ff f1 d2    	add    %al,-0x2d0e0001(%rax)
ffff80000010ba22:	10 00                	adc    %al,(%rax)
ffff80000010ba24:	00                   	.byte 0x0
ffff80000010ba25:	80 ff ff             	cmp    $0xff,%bh

Disassembly of section .got.plt:

ffff80000010ba28 <_GLOBAL_OFFSET_TABLE_>:
	...

Disassembly of section .data.rel.local:

ffff80000010ba40 <init_thread>:
ffff80000010ba40:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010ba46:	ff                   	(bad)  
ffff80000010ba47:	ff 00                	incl   (%rax)
	...
ffff80000010ba51:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010ba54:	00 80 ff ff 10 00    	add    %al,0x10ffff(%rax)
ffff80000010ba5a:	00 00                	add    %al,(%rax)
ffff80000010ba5c:	00 00                	add    %al,(%rax)
ffff80000010ba5e:	00 00                	add    %al,(%rax)
ffff80000010ba60:	10 00                	adc    %al,(%rax)
	...

ffff80000010ba80 <init_task>:
ffff80000010ba80:	00 00                	add    %al,(%rax)
ffff80000010ba82:	11 00                	adc    %eax,(%rax)
ffff80000010ba84:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...

ffff80000010bac0 <init_tss>:
ffff80000010bac0:	00 00                	add    %al,(%rax)
ffff80000010bac2:	00 00                	add    %al,(%rax)
ffff80000010bac4:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010baca:	ff                   	(bad)  
ffff80000010bacb:	ff 00                	incl   (%rax)
ffff80000010bacd:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010bad0:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010bad6:	11 00                	adc    %eax,(%rax)
ffff80000010bad8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bade:	00 00                	add    %al,(%rax)
ffff80000010bae0:	00 00                	add    %al,(%rax)
ffff80000010bae2:	00 00                	add    %al,(%rax)
ffff80000010bae4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bae8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010baee:	00 00                	add    %al,(%rax)
ffff80000010baf0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010baf6:	00 00                	add    %al,(%rax)
ffff80000010baf8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bafe:	00 00                	add    %al,(%rax)
ffff80000010bb00:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bb06:	00 00                	add    %al,(%rax)
ffff80000010bb08:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bb0e:	00 00                	add    %al,(%rax)
ffff80000010bb10:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bb16:	00 00                	add    %al,(%rax)
ffff80000010bb18:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bb2a:	00 00                	add    %al,(%rax)
ffff80000010bb2c:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010bb32:	ff                   	(bad)  
ffff80000010bb33:	ff 00                	incl   (%rax)
ffff80000010bb35:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010bb38:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010bb3e:	11 00                	adc    %eax,(%rax)
ffff80000010bb40:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bb46:	00 00                	add    %al,(%rax)
ffff80000010bb48:	00 00                	add    %al,(%rax)
ffff80000010bb4a:	00 00                	add    %al,(%rax)
ffff80000010bb4c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bb50:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bb56:	00 00                	add    %al,(%rax)
ffff80000010bb58:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bb5e:	00 00                	add    %al,(%rax)
ffff80000010bb60:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bb66:	00 00                	add    %al,(%rax)
ffff80000010bb68:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bb6e:	00 00                	add    %al,(%rax)
ffff80000010bb70:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bb76:	00 00                	add    %al,(%rax)
ffff80000010bb78:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bb7e:	00 00                	add    %al,(%rax)
ffff80000010bb80:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bb92:	00 00                	add    %al,(%rax)
ffff80000010bb94:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010bb9a:	ff                   	(bad)  
ffff80000010bb9b:	ff 00                	incl   (%rax)
ffff80000010bb9d:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010bba0:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010bba6:	11 00                	adc    %eax,(%rax)
ffff80000010bba8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bbae:	00 00                	add    %al,(%rax)
ffff80000010bbb0:	00 00                	add    %al,(%rax)
ffff80000010bbb2:	00 00                	add    %al,(%rax)
ffff80000010bbb4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bbb8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bbbe:	00 00                	add    %al,(%rax)
ffff80000010bbc0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bbc6:	00 00                	add    %al,(%rax)
ffff80000010bbc8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bbce:	00 00                	add    %al,(%rax)
ffff80000010bbd0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bbd6:	00 00                	add    %al,(%rax)
ffff80000010bbd8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bbde:	00 00                	add    %al,(%rax)
ffff80000010bbe0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bbe6:	00 00                	add    %al,(%rax)
ffff80000010bbe8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bbfa:	00 00                	add    %al,(%rax)
ffff80000010bbfc:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010bc02:	ff                   	(bad)  
ffff80000010bc03:	ff 00                	incl   (%rax)
ffff80000010bc05:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010bc08:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010bc0e:	11 00                	adc    %eax,(%rax)
ffff80000010bc10:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bc16:	00 00                	add    %al,(%rax)
ffff80000010bc18:	00 00                	add    %al,(%rax)
ffff80000010bc1a:	00 00                	add    %al,(%rax)
ffff80000010bc1c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bc20:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bc26:	00 00                	add    %al,(%rax)
ffff80000010bc28:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bc2e:	00 00                	add    %al,(%rax)
ffff80000010bc30:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bc36:	00 00                	add    %al,(%rax)
ffff80000010bc38:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bc3e:	00 00                	add    %al,(%rax)
ffff80000010bc40:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bc46:	00 00                	add    %al,(%rax)
ffff80000010bc48:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bc4e:	00 00                	add    %al,(%rax)
ffff80000010bc50:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bc62:	00 00                	add    %al,(%rax)
ffff80000010bc64:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010bc6a:	ff                   	(bad)  
ffff80000010bc6b:	ff 00                	incl   (%rax)
ffff80000010bc6d:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010bc70:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010bc76:	11 00                	adc    %eax,(%rax)
ffff80000010bc78:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bc7e:	00 00                	add    %al,(%rax)
ffff80000010bc80:	00 00                	add    %al,(%rax)
ffff80000010bc82:	00 00                	add    %al,(%rax)
ffff80000010bc84:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bc88:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bc8e:	00 00                	add    %al,(%rax)
ffff80000010bc90:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bc96:	00 00                	add    %al,(%rax)
ffff80000010bc98:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bc9e:	00 00                	add    %al,(%rax)
ffff80000010bca0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bca6:	00 00                	add    %al,(%rax)
ffff80000010bca8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bcae:	00 00                	add    %al,(%rax)
ffff80000010bcb0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bcb6:	00 00                	add    %al,(%rax)
ffff80000010bcb8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bcca:	00 00                	add    %al,(%rax)
ffff80000010bccc:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010bcd2:	ff                   	(bad)  
ffff80000010bcd3:	ff 00                	incl   (%rax)
ffff80000010bcd5:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010bcd8:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010bcde:	11 00                	adc    %eax,(%rax)
ffff80000010bce0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bce6:	00 00                	add    %al,(%rax)
ffff80000010bce8:	00 00                	add    %al,(%rax)
ffff80000010bcea:	00 00                	add    %al,(%rax)
ffff80000010bcec:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bcf0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bcf6:	00 00                	add    %al,(%rax)
ffff80000010bcf8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bcfe:	00 00                	add    %al,(%rax)
ffff80000010bd00:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bd06:	00 00                	add    %al,(%rax)
ffff80000010bd08:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bd0e:	00 00                	add    %al,(%rax)
ffff80000010bd10:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bd16:	00 00                	add    %al,(%rax)
ffff80000010bd18:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bd1e:	00 00                	add    %al,(%rax)
ffff80000010bd20:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bd32:	00 00                	add    %al,(%rax)
ffff80000010bd34:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010bd3a:	ff                   	(bad)  
ffff80000010bd3b:	ff 00                	incl   (%rax)
ffff80000010bd3d:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010bd40:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010bd46:	11 00                	adc    %eax,(%rax)
ffff80000010bd48:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bd4e:	00 00                	add    %al,(%rax)
ffff80000010bd50:	00 00                	add    %al,(%rax)
ffff80000010bd52:	00 00                	add    %al,(%rax)
ffff80000010bd54:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bd58:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bd5e:	00 00                	add    %al,(%rax)
ffff80000010bd60:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bd66:	00 00                	add    %al,(%rax)
ffff80000010bd68:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bd6e:	00 00                	add    %al,(%rax)
ffff80000010bd70:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bd76:	00 00                	add    %al,(%rax)
ffff80000010bd78:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bd7e:	00 00                	add    %al,(%rax)
ffff80000010bd80:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bd86:	00 00                	add    %al,(%rax)
ffff80000010bd88:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bd9a:	00 00                	add    %al,(%rax)
ffff80000010bd9c:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010bda2:	ff                   	(bad)  
ffff80000010bda3:	ff 00                	incl   (%rax)
ffff80000010bda5:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010bda8:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010bdae:	11 00                	adc    %eax,(%rax)
ffff80000010bdb0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bdb6:	00 00                	add    %al,(%rax)
ffff80000010bdb8:	00 00                	add    %al,(%rax)
ffff80000010bdba:	00 00                	add    %al,(%rax)
ffff80000010bdbc:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bdc0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bdc6:	00 00                	add    %al,(%rax)
ffff80000010bdc8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bdce:	00 00                	add    %al,(%rax)
ffff80000010bdd0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bdd6:	00 00                	add    %al,(%rax)
ffff80000010bdd8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bdde:	00 00                	add    %al,(%rax)
ffff80000010bde0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bde6:	00 00                	add    %al,(%rax)
ffff80000010bde8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bdee:	00 00                	add    %al,(%rax)
ffff80000010bdf0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...

ffff80000010be00 <system_call_table>:
ffff80000010be00:	b6 45                	mov    $0x45,%dh
ffff80000010be02:	10 00                	adc    %al,(%rax)
ffff80000010be04:	00 80 ff ff 25 46    	add    %al,0x4625ffff(%rax)
ffff80000010be0a:	10 00                	adc    %al,(%rax)
ffff80000010be0c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010be12:	10 00                	adc    %al,(%rax)
ffff80000010be14:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010be1a:	10 00                	adc    %al,(%rax)
ffff80000010be1c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010be22:	10 00                	adc    %al,(%rax)
ffff80000010be24:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010be2a:	10 00                	adc    %al,(%rax)
ffff80000010be2c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010be32:	10 00                	adc    %al,(%rax)
ffff80000010be34:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010be3a:	10 00                	adc    %al,(%rax)
ffff80000010be3c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010be42:	10 00                	adc    %al,(%rax)
ffff80000010be44:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010be4a:	10 00                	adc    %al,(%rax)
ffff80000010be4c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010be52:	10 00                	adc    %al,(%rax)
ffff80000010be54:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010be5a:	10 00                	adc    %al,(%rax)
ffff80000010be5c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010be62:	10 00                	adc    %al,(%rax)
ffff80000010be64:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010be6a:	10 00                	adc    %al,(%rax)
ffff80000010be6c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010be72:	10 00                	adc    %al,(%rax)
ffff80000010be74:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010be7a:	10 00                	adc    %al,(%rax)
ffff80000010be7c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010be82:	10 00                	adc    %al,(%rax)
ffff80000010be84:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010be8a:	10 00                	adc    %al,(%rax)
ffff80000010be8c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010be92:	10 00                	adc    %al,(%rax)
ffff80000010be94:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010be9a:	10 00                	adc    %al,(%rax)
ffff80000010be9c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bea2:	10 00                	adc    %al,(%rax)
ffff80000010bea4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010beaa:	10 00                	adc    %al,(%rax)
ffff80000010beac:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010beb2:	10 00                	adc    %al,(%rax)
ffff80000010beb4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010beba:	10 00                	adc    %al,(%rax)
ffff80000010bebc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bec2:	10 00                	adc    %al,(%rax)
ffff80000010bec4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010beca:	10 00                	adc    %al,(%rax)
ffff80000010becc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bed2:	10 00                	adc    %al,(%rax)
ffff80000010bed4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010beda:	10 00                	adc    %al,(%rax)
ffff80000010bedc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bee2:	10 00                	adc    %al,(%rax)
ffff80000010bee4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010beea:	10 00                	adc    %al,(%rax)
ffff80000010beec:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bef2:	10 00                	adc    %al,(%rax)
ffff80000010bef4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010befa:	10 00                	adc    %al,(%rax)
ffff80000010befc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bf02:	10 00                	adc    %al,(%rax)
ffff80000010bf04:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bf0a:	10 00                	adc    %al,(%rax)
ffff80000010bf0c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bf12:	10 00                	adc    %al,(%rax)
ffff80000010bf14:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bf1a:	10 00                	adc    %al,(%rax)
ffff80000010bf1c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bf22:	10 00                	adc    %al,(%rax)
ffff80000010bf24:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bf2a:	10 00                	adc    %al,(%rax)
ffff80000010bf2c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bf32:	10 00                	adc    %al,(%rax)
ffff80000010bf34:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bf3a:	10 00                	adc    %al,(%rax)
ffff80000010bf3c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bf42:	10 00                	adc    %al,(%rax)
ffff80000010bf44:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bf4a:	10 00                	adc    %al,(%rax)
ffff80000010bf4c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bf52:	10 00                	adc    %al,(%rax)
ffff80000010bf54:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bf5a:	10 00                	adc    %al,(%rax)
ffff80000010bf5c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bf62:	10 00                	adc    %al,(%rax)
ffff80000010bf64:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bf6a:	10 00                	adc    %al,(%rax)
ffff80000010bf6c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bf72:	10 00                	adc    %al,(%rax)
ffff80000010bf74:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bf7a:	10 00                	adc    %al,(%rax)
ffff80000010bf7c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bf82:	10 00                	adc    %al,(%rax)
ffff80000010bf84:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bf8a:	10 00                	adc    %al,(%rax)
ffff80000010bf8c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bf92:	10 00                	adc    %al,(%rax)
ffff80000010bf94:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bf9a:	10 00                	adc    %al,(%rax)
ffff80000010bf9c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bfa2:	10 00                	adc    %al,(%rax)
ffff80000010bfa4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bfaa:	10 00                	adc    %al,(%rax)
ffff80000010bfac:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bfb2:	10 00                	adc    %al,(%rax)
ffff80000010bfb4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bfba:	10 00                	adc    %al,(%rax)
ffff80000010bfbc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bfc2:	10 00                	adc    %al,(%rax)
ffff80000010bfc4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bfca:	10 00                	adc    %al,(%rax)
ffff80000010bfcc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bfd2:	10 00                	adc    %al,(%rax)
ffff80000010bfd4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bfda:	10 00                	adc    %al,(%rax)
ffff80000010bfdc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bfe2:	10 00                	adc    %al,(%rax)
ffff80000010bfe4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bfea:	10 00                	adc    %al,(%rax)
ffff80000010bfec:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bff2:	10 00                	adc    %al,(%rax)
ffff80000010bff4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010bffa:	10 00                	adc    %al,(%rax)
ffff80000010bffc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c002:	10 00                	adc    %al,(%rax)
ffff80000010c004:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c00a:	10 00                	adc    %al,(%rax)
ffff80000010c00c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c012:	10 00                	adc    %al,(%rax)
ffff80000010c014:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c01a:	10 00                	adc    %al,(%rax)
ffff80000010c01c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c022:	10 00                	adc    %al,(%rax)
ffff80000010c024:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c02a:	10 00                	adc    %al,(%rax)
ffff80000010c02c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c032:	10 00                	adc    %al,(%rax)
ffff80000010c034:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c03a:	10 00                	adc    %al,(%rax)
ffff80000010c03c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c042:	10 00                	adc    %al,(%rax)
ffff80000010c044:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c04a:	10 00                	adc    %al,(%rax)
ffff80000010c04c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c052:	10 00                	adc    %al,(%rax)
ffff80000010c054:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c05a:	10 00                	adc    %al,(%rax)
ffff80000010c05c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c062:	10 00                	adc    %al,(%rax)
ffff80000010c064:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c06a:	10 00                	adc    %al,(%rax)
ffff80000010c06c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c072:	10 00                	adc    %al,(%rax)
ffff80000010c074:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c07a:	10 00                	adc    %al,(%rax)
ffff80000010c07c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c082:	10 00                	adc    %al,(%rax)
ffff80000010c084:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c08a:	10 00                	adc    %al,(%rax)
ffff80000010c08c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c092:	10 00                	adc    %al,(%rax)
ffff80000010c094:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c09a:	10 00                	adc    %al,(%rax)
ffff80000010c09c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c0a2:	10 00                	adc    %al,(%rax)
ffff80000010c0a4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c0aa:	10 00                	adc    %al,(%rax)
ffff80000010c0ac:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c0b2:	10 00                	adc    %al,(%rax)
ffff80000010c0b4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c0ba:	10 00                	adc    %al,(%rax)
ffff80000010c0bc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c0c2:	10 00                	adc    %al,(%rax)
ffff80000010c0c4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c0ca:	10 00                	adc    %al,(%rax)
ffff80000010c0cc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c0d2:	10 00                	adc    %al,(%rax)
ffff80000010c0d4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c0da:	10 00                	adc    %al,(%rax)
ffff80000010c0dc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c0e2:	10 00                	adc    %al,(%rax)
ffff80000010c0e4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c0ea:	10 00                	adc    %al,(%rax)
ffff80000010c0ec:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c0f2:	10 00                	adc    %al,(%rax)
ffff80000010c0f4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c0fa:	10 00                	adc    %al,(%rax)
ffff80000010c0fc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c102:	10 00                	adc    %al,(%rax)
ffff80000010c104:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c10a:	10 00                	adc    %al,(%rax)
ffff80000010c10c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c112:	10 00                	adc    %al,(%rax)
ffff80000010c114:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c11a:	10 00                	adc    %al,(%rax)
ffff80000010c11c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c122:	10 00                	adc    %al,(%rax)
ffff80000010c124:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c12a:	10 00                	adc    %al,(%rax)
ffff80000010c12c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c132:	10 00                	adc    %al,(%rax)
ffff80000010c134:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c13a:	10 00                	adc    %al,(%rax)
ffff80000010c13c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c142:	10 00                	adc    %al,(%rax)
ffff80000010c144:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c14a:	10 00                	adc    %al,(%rax)
ffff80000010c14c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c152:	10 00                	adc    %al,(%rax)
ffff80000010c154:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c15a:	10 00                	adc    %al,(%rax)
ffff80000010c15c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c162:	10 00                	adc    %al,(%rax)
ffff80000010c164:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c16a:	10 00                	adc    %al,(%rax)
ffff80000010c16c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c172:	10 00                	adc    %al,(%rax)
ffff80000010c174:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c17a:	10 00                	adc    %al,(%rax)
ffff80000010c17c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c182:	10 00                	adc    %al,(%rax)
ffff80000010c184:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c18a:	10 00                	adc    %al,(%rax)
ffff80000010c18c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c192:	10 00                	adc    %al,(%rax)
ffff80000010c194:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c19a:	10 00                	adc    %al,(%rax)
ffff80000010c19c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c1a2:	10 00                	adc    %al,(%rax)
ffff80000010c1a4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c1aa:	10 00                	adc    %al,(%rax)
ffff80000010c1ac:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c1b2:	10 00                	adc    %al,(%rax)
ffff80000010c1b4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c1ba:	10 00                	adc    %al,(%rax)
ffff80000010c1bc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c1c2:	10 00                	adc    %al,(%rax)
ffff80000010c1c4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c1ca:	10 00                	adc    %al,(%rax)
ffff80000010c1cc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c1d2:	10 00                	adc    %al,(%rax)
ffff80000010c1d4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c1da:	10 00                	adc    %al,(%rax)
ffff80000010c1dc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c1e2:	10 00                	adc    %al,(%rax)
ffff80000010c1e4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c1ea:	10 00                	adc    %al,(%rax)
ffff80000010c1ec:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c1f2:	10 00                	adc    %al,(%rax)
ffff80000010c1f4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c1fa:	10 00                	adc    %al,(%rax)
ffff80000010c1fc:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010c202:	11 00                	adc    %eax,(%rax)
ffff80000010c204:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c20a:	00 00                	add    %al,(%rax)
ffff80000010c20c:	00 00                	add    %al,(%rax)
ffff80000010c20e:	00 00                	add    %al,(%rax)
ffff80000010c210:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010c216:	ff                   	(bad)  
ffff80000010c217:	ff 10                	callq  *(%rax)
ffff80000010c219:	00 00                	add    %al,(%rax)
ffff80000010c21b:	00 00                	add    %al,(%rax)
ffff80000010c21d:	00 00                	add    %al,(%rax)
ffff80000010c21f:	00 10                	add    %dl,(%rax)
	...
ffff80000010c241:	00 11                	add    %dl,(%rcx)
ffff80000010c243:	00 00                	add    %al,(%rax)
ffff80000010c245:	80 ff ff             	cmp    $0xff,%bh
	...
ffff80000010c284:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010c28a:	ff                   	(bad)  
ffff80000010c28b:	ff 00                	incl   (%rax)
ffff80000010c28d:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010c290:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010c296:	11 00                	adc    %eax,(%rax)
ffff80000010c298:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c29e:	00 00                	add    %al,(%rax)
ffff80000010c2a0:	00 00                	add    %al,(%rax)
ffff80000010c2a2:	00 00                	add    %al,(%rax)
ffff80000010c2a4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010c2a8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c2ae:	00 00                	add    %al,(%rax)
ffff80000010c2b0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c2b6:	00 00                	add    %al,(%rax)
ffff80000010c2b8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c2be:	00 00                	add    %al,(%rax)
ffff80000010c2c0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c2c6:	00 00                	add    %al,(%rax)
ffff80000010c2c8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c2ce:	00 00                	add    %al,(%rax)
ffff80000010c2d0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c2d6:	00 00                	add    %al,(%rax)
ffff80000010c2d8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c2ea:	00 00                	add    %al,(%rax)
ffff80000010c2ec:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010c2f2:	ff                   	(bad)  
ffff80000010c2f3:	ff 00                	incl   (%rax)
ffff80000010c2f5:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010c2f8:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010c2fe:	11 00                	adc    %eax,(%rax)
ffff80000010c300:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c306:	00 00                	add    %al,(%rax)
ffff80000010c308:	00 00                	add    %al,(%rax)
ffff80000010c30a:	00 00                	add    %al,(%rax)
ffff80000010c30c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010c310:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c316:	00 00                	add    %al,(%rax)
ffff80000010c318:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c31e:	00 00                	add    %al,(%rax)
ffff80000010c320:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c326:	00 00                	add    %al,(%rax)
ffff80000010c328:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c32e:	00 00                	add    %al,(%rax)
ffff80000010c330:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c336:	00 00                	add    %al,(%rax)
ffff80000010c338:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c33e:	00 00                	add    %al,(%rax)
ffff80000010c340:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c352:	00 00                	add    %al,(%rax)
ffff80000010c354:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010c35a:	ff                   	(bad)  
ffff80000010c35b:	ff 00                	incl   (%rax)
ffff80000010c35d:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010c360:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010c366:	11 00                	adc    %eax,(%rax)
ffff80000010c368:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c36e:	00 00                	add    %al,(%rax)
ffff80000010c370:	00 00                	add    %al,(%rax)
ffff80000010c372:	00 00                	add    %al,(%rax)
ffff80000010c374:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010c378:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c37e:	00 00                	add    %al,(%rax)
ffff80000010c380:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c386:	00 00                	add    %al,(%rax)
ffff80000010c388:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c38e:	00 00                	add    %al,(%rax)
ffff80000010c390:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c396:	00 00                	add    %al,(%rax)
ffff80000010c398:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c39e:	00 00                	add    %al,(%rax)
ffff80000010c3a0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c3a6:	00 00                	add    %al,(%rax)
ffff80000010c3a8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c3ba:	00 00                	add    %al,(%rax)
ffff80000010c3bc:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010c3c2:	ff                   	(bad)  
ffff80000010c3c3:	ff 00                	incl   (%rax)
ffff80000010c3c5:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010c3c8:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010c3ce:	11 00                	adc    %eax,(%rax)
ffff80000010c3d0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c3d6:	00 00                	add    %al,(%rax)
ffff80000010c3d8:	00 00                	add    %al,(%rax)
ffff80000010c3da:	00 00                	add    %al,(%rax)
ffff80000010c3dc:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010c3e0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c3e6:	00 00                	add    %al,(%rax)
ffff80000010c3e8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c3ee:	00 00                	add    %al,(%rax)
ffff80000010c3f0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c3f6:	00 00                	add    %al,(%rax)
ffff80000010c3f8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c3fe:	00 00                	add    %al,(%rax)
ffff80000010c400:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c406:	00 00                	add    %al,(%rax)
ffff80000010c408:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c40e:	00 00                	add    %al,(%rax)
ffff80000010c410:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c422:	00 00                	add    %al,(%rax)
ffff80000010c424:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010c42a:	ff                   	(bad)  
ffff80000010c42b:	ff 00                	incl   (%rax)
ffff80000010c42d:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010c430:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010c436:	11 00                	adc    %eax,(%rax)
ffff80000010c438:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c43e:	00 00                	add    %al,(%rax)
ffff80000010c440:	00 00                	add    %al,(%rax)
ffff80000010c442:	00 00                	add    %al,(%rax)
ffff80000010c444:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010c448:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c44e:	00 00                	add    %al,(%rax)
ffff80000010c450:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c456:	00 00                	add    %al,(%rax)
ffff80000010c458:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c45e:	00 00                	add    %al,(%rax)
ffff80000010c460:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c466:	00 00                	add    %al,(%rax)
ffff80000010c468:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c46e:	00 00                	add    %al,(%rax)
ffff80000010c470:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c476:	00 00                	add    %al,(%rax)
ffff80000010c478:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c48a:	00 00                	add    %al,(%rax)
ffff80000010c48c:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010c492:	ff                   	(bad)  
ffff80000010c493:	ff 00                	incl   (%rax)
ffff80000010c495:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010c498:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010c49e:	11 00                	adc    %eax,(%rax)
ffff80000010c4a0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c4a6:	00 00                	add    %al,(%rax)
ffff80000010c4a8:	00 00                	add    %al,(%rax)
ffff80000010c4aa:	00 00                	add    %al,(%rax)
ffff80000010c4ac:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010c4b0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c4b6:	00 00                	add    %al,(%rax)
ffff80000010c4b8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c4be:	00 00                	add    %al,(%rax)
ffff80000010c4c0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c4c6:	00 00                	add    %al,(%rax)
ffff80000010c4c8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c4ce:	00 00                	add    %al,(%rax)
ffff80000010c4d0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c4d6:	00 00                	add    %al,(%rax)
ffff80000010c4d8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c4de:	00 00                	add    %al,(%rax)
ffff80000010c4e0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c4f2:	00 00                	add    %al,(%rax)
ffff80000010c4f4:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010c4fa:	ff                   	(bad)  
ffff80000010c4fb:	ff 00                	incl   (%rax)
ffff80000010c4fd:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010c500:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010c506:	11 00                	adc    %eax,(%rax)
ffff80000010c508:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c50e:	00 00                	add    %al,(%rax)
ffff80000010c510:	00 00                	add    %al,(%rax)
ffff80000010c512:	00 00                	add    %al,(%rax)
ffff80000010c514:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010c518:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c51e:	00 00                	add    %al,(%rax)
ffff80000010c520:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c526:	00 00                	add    %al,(%rax)
ffff80000010c528:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c52e:	00 00                	add    %al,(%rax)
ffff80000010c530:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c536:	00 00                	add    %al,(%rax)
ffff80000010c538:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c53e:	00 00                	add    %al,(%rax)
ffff80000010c540:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c546:	00 00                	add    %al,(%rax)
ffff80000010c548:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c55a:	00 00                	add    %al,(%rax)
ffff80000010c55c:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010c562:	ff                   	(bad)  
ffff80000010c563:	ff 00                	incl   (%rax)
ffff80000010c565:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010c568:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010c56e:	11 00                	adc    %eax,(%rax)
ffff80000010c570:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c576:	00 00                	add    %al,(%rax)
ffff80000010c578:	00 00                	add    %al,(%rax)
ffff80000010c57a:	00 00                	add    %al,(%rax)
ffff80000010c57c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010c580:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c586:	00 00                	add    %al,(%rax)
ffff80000010c588:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c58e:	00 00                	add    %al,(%rax)
ffff80000010c590:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c596:	00 00                	add    %al,(%rax)
ffff80000010c598:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c59e:	00 00                	add    %al,(%rax)
ffff80000010c5a0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c5a6:	00 00                	add    %al,(%rax)
ffff80000010c5a8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c5ae:	00 00                	add    %al,(%rax)
ffff80000010c5b0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c5be:	00 00                	add    %al,(%rax)
ffff80000010c5c0:	b6 45                	mov    $0x45,%dh
ffff80000010c5c2:	10 00                	adc    %al,(%rax)
ffff80000010c5c4:	00 80 ff ff 25 46    	add    %al,0x4625ffff(%rax)
ffff80000010c5ca:	10 00                	adc    %al,(%rax)
ffff80000010c5cc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c5d2:	10 00                	adc    %al,(%rax)
ffff80000010c5d4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c5da:	10 00                	adc    %al,(%rax)
ffff80000010c5dc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c5e2:	10 00                	adc    %al,(%rax)
ffff80000010c5e4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c5ea:	10 00                	adc    %al,(%rax)
ffff80000010c5ec:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c5f2:	10 00                	adc    %al,(%rax)
ffff80000010c5f4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c5fa:	10 00                	adc    %al,(%rax)
ffff80000010c5fc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c602:	10 00                	adc    %al,(%rax)
ffff80000010c604:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c60a:	10 00                	adc    %al,(%rax)
ffff80000010c60c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c612:	10 00                	adc    %al,(%rax)
ffff80000010c614:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c61a:	10 00                	adc    %al,(%rax)
ffff80000010c61c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c622:	10 00                	adc    %al,(%rax)
ffff80000010c624:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c62a:	10 00                	adc    %al,(%rax)
ffff80000010c62c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c632:	10 00                	adc    %al,(%rax)
ffff80000010c634:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c63a:	10 00                	adc    %al,(%rax)
ffff80000010c63c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c642:	10 00                	adc    %al,(%rax)
ffff80000010c644:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c64a:	10 00                	adc    %al,(%rax)
ffff80000010c64c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c652:	10 00                	adc    %al,(%rax)
ffff80000010c654:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c65a:	10 00                	adc    %al,(%rax)
ffff80000010c65c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c662:	10 00                	adc    %al,(%rax)
ffff80000010c664:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c66a:	10 00                	adc    %al,(%rax)
ffff80000010c66c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c672:	10 00                	adc    %al,(%rax)
ffff80000010c674:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c67a:	10 00                	adc    %al,(%rax)
ffff80000010c67c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c682:	10 00                	adc    %al,(%rax)
ffff80000010c684:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c68a:	10 00                	adc    %al,(%rax)
ffff80000010c68c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c692:	10 00                	adc    %al,(%rax)
ffff80000010c694:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c69a:	10 00                	adc    %al,(%rax)
ffff80000010c69c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c6a2:	10 00                	adc    %al,(%rax)
ffff80000010c6a4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c6aa:	10 00                	adc    %al,(%rax)
ffff80000010c6ac:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c6b2:	10 00                	adc    %al,(%rax)
ffff80000010c6b4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c6ba:	10 00                	adc    %al,(%rax)
ffff80000010c6bc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c6c2:	10 00                	adc    %al,(%rax)
ffff80000010c6c4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c6ca:	10 00                	adc    %al,(%rax)
ffff80000010c6cc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c6d2:	10 00                	adc    %al,(%rax)
ffff80000010c6d4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c6da:	10 00                	adc    %al,(%rax)
ffff80000010c6dc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c6e2:	10 00                	adc    %al,(%rax)
ffff80000010c6e4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c6ea:	10 00                	adc    %al,(%rax)
ffff80000010c6ec:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c6f2:	10 00                	adc    %al,(%rax)
ffff80000010c6f4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c6fa:	10 00                	adc    %al,(%rax)
ffff80000010c6fc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c702:	10 00                	adc    %al,(%rax)
ffff80000010c704:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c70a:	10 00                	adc    %al,(%rax)
ffff80000010c70c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c712:	10 00                	adc    %al,(%rax)
ffff80000010c714:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c71a:	10 00                	adc    %al,(%rax)
ffff80000010c71c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c722:	10 00                	adc    %al,(%rax)
ffff80000010c724:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c72a:	10 00                	adc    %al,(%rax)
ffff80000010c72c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c732:	10 00                	adc    %al,(%rax)
ffff80000010c734:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c73a:	10 00                	adc    %al,(%rax)
ffff80000010c73c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c742:	10 00                	adc    %al,(%rax)
ffff80000010c744:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c74a:	10 00                	adc    %al,(%rax)
ffff80000010c74c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c752:	10 00                	adc    %al,(%rax)
ffff80000010c754:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c75a:	10 00                	adc    %al,(%rax)
ffff80000010c75c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c762:	10 00                	adc    %al,(%rax)
ffff80000010c764:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c76a:	10 00                	adc    %al,(%rax)
ffff80000010c76c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c772:	10 00                	adc    %al,(%rax)
ffff80000010c774:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c77a:	10 00                	adc    %al,(%rax)
ffff80000010c77c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c782:	10 00                	adc    %al,(%rax)
ffff80000010c784:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c78a:	10 00                	adc    %al,(%rax)
ffff80000010c78c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c792:	10 00                	adc    %al,(%rax)
ffff80000010c794:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c79a:	10 00                	adc    %al,(%rax)
ffff80000010c79c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c7a2:	10 00                	adc    %al,(%rax)
ffff80000010c7a4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c7aa:	10 00                	adc    %al,(%rax)
ffff80000010c7ac:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c7b2:	10 00                	adc    %al,(%rax)
ffff80000010c7b4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c7ba:	10 00                	adc    %al,(%rax)
ffff80000010c7bc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c7c2:	10 00                	adc    %al,(%rax)
ffff80000010c7c4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c7ca:	10 00                	adc    %al,(%rax)
ffff80000010c7cc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c7d2:	10 00                	adc    %al,(%rax)
ffff80000010c7d4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c7da:	10 00                	adc    %al,(%rax)
ffff80000010c7dc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c7e2:	10 00                	adc    %al,(%rax)
ffff80000010c7e4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c7ea:	10 00                	adc    %al,(%rax)
ffff80000010c7ec:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c7f2:	10 00                	adc    %al,(%rax)
ffff80000010c7f4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c7fa:	10 00                	adc    %al,(%rax)
ffff80000010c7fc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c802:	10 00                	adc    %al,(%rax)
ffff80000010c804:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c80a:	10 00                	adc    %al,(%rax)
ffff80000010c80c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c812:	10 00                	adc    %al,(%rax)
ffff80000010c814:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c81a:	10 00                	adc    %al,(%rax)
ffff80000010c81c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c822:	10 00                	adc    %al,(%rax)
ffff80000010c824:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c82a:	10 00                	adc    %al,(%rax)
ffff80000010c82c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c832:	10 00                	adc    %al,(%rax)
ffff80000010c834:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c83a:	10 00                	adc    %al,(%rax)
ffff80000010c83c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c842:	10 00                	adc    %al,(%rax)
ffff80000010c844:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c84a:	10 00                	adc    %al,(%rax)
ffff80000010c84c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c852:	10 00                	adc    %al,(%rax)
ffff80000010c854:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c85a:	10 00                	adc    %al,(%rax)
ffff80000010c85c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c862:	10 00                	adc    %al,(%rax)
ffff80000010c864:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c86a:	10 00                	adc    %al,(%rax)
ffff80000010c86c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c872:	10 00                	adc    %al,(%rax)
ffff80000010c874:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c87a:	10 00                	adc    %al,(%rax)
ffff80000010c87c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c882:	10 00                	adc    %al,(%rax)
ffff80000010c884:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c88a:	10 00                	adc    %al,(%rax)
ffff80000010c88c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c892:	10 00                	adc    %al,(%rax)
ffff80000010c894:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c89a:	10 00                	adc    %al,(%rax)
ffff80000010c89c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c8a2:	10 00                	adc    %al,(%rax)
ffff80000010c8a4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c8aa:	10 00                	adc    %al,(%rax)
ffff80000010c8ac:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c8b2:	10 00                	adc    %al,(%rax)
ffff80000010c8b4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c8ba:	10 00                	adc    %al,(%rax)
ffff80000010c8bc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c8c2:	10 00                	adc    %al,(%rax)
ffff80000010c8c4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c8ca:	10 00                	adc    %al,(%rax)
ffff80000010c8cc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c8d2:	10 00                	adc    %al,(%rax)
ffff80000010c8d4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c8da:	10 00                	adc    %al,(%rax)
ffff80000010c8dc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c8e2:	10 00                	adc    %al,(%rax)
ffff80000010c8e4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c8ea:	10 00                	adc    %al,(%rax)
ffff80000010c8ec:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c8f2:	10 00                	adc    %al,(%rax)
ffff80000010c8f4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c8fa:	10 00                	adc    %al,(%rax)
ffff80000010c8fc:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c902:	10 00                	adc    %al,(%rax)
ffff80000010c904:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c90a:	10 00                	adc    %al,(%rax)
ffff80000010c90c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c912:	10 00                	adc    %al,(%rax)
ffff80000010c914:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c91a:	10 00                	adc    %al,(%rax)
ffff80000010c91c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c922:	10 00                	adc    %al,(%rax)
ffff80000010c924:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c92a:	10 00                	adc    %al,(%rax)
ffff80000010c92c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c932:	10 00                	adc    %al,(%rax)
ffff80000010c934:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c93a:	10 00                	adc    %al,(%rax)
ffff80000010c93c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c942:	10 00                	adc    %al,(%rax)
ffff80000010c944:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c94a:	10 00                	adc    %al,(%rax)
ffff80000010c94c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c952:	10 00                	adc    %al,(%rax)
ffff80000010c954:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c95a:	10 00                	adc    %al,(%rax)
ffff80000010c95c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c962:	10 00                	adc    %al,(%rax)
ffff80000010c964:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c96a:	10 00                	adc    %al,(%rax)
ffff80000010c96c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c972:	10 00                	adc    %al,(%rax)
ffff80000010c974:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c97a:	10 00                	adc    %al,(%rax)
ffff80000010c97c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c982:	10 00                	adc    %al,(%rax)
ffff80000010c984:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c98a:	10 00                	adc    %al,(%rax)
ffff80000010c98c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c992:	10 00                	adc    %al,(%rax)
ffff80000010c994:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c99a:	10 00                	adc    %al,(%rax)
ffff80000010c99c:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c9a2:	10 00                	adc    %al,(%rax)
ffff80000010c9a4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c9aa:	10 00                	adc    %al,(%rax)
ffff80000010c9ac:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c9b2:	10 00                	adc    %al,(%rax)
ffff80000010c9b4:	00 80 ff ff b6 45    	add    %al,0x45b6ffff(%rax)
ffff80000010c9ba:	10 00                	adc    %al,(%rax)
ffff80000010c9bc:	00                   	.byte 0x0
ffff80000010c9bd:	80 ff ff             	cmp    $0xff,%bh

Disassembly of section .data.rel:

ffff80000010c9c0 <interrupt>:
ffff80000010c9c0:	aa                   	stos   %al,%es:(%rdi)
ffff80000010c9c1:	7e 10                	jle    ffff80000010c9d3 <interrupt+0x13>
ffff80000010c9c3:	00 00                	add    %al,(%rax)
ffff80000010c9c5:	80 ff ff             	cmp    $0xff,%bh
ffff80000010c9c8:	f4                   	hlt    
ffff80000010c9c9:	7e 10                	jle    ffff80000010c9db <interrupt+0x1b>
ffff80000010c9cb:	00 00                	add    %al,(%rax)
ffff80000010c9cd:	80 ff ff             	cmp    $0xff,%bh
ffff80000010c9d0:	3e 7f 10             	jg,pt  ffff80000010c9e3 <interrupt+0x23>
ffff80000010c9d3:	00 00                	add    %al,(%rax)
ffff80000010c9d5:	80 ff ff             	cmp    $0xff,%bh
ffff80000010c9d8:	88 7f 10             	mov    %bh,0x10(%rdi)
ffff80000010c9db:	00 00                	add    %al,(%rax)
ffff80000010c9dd:	80 ff ff             	cmp    $0xff,%bh
ffff80000010c9e0:	d2 7f 10             	sarb   %cl,0x10(%rdi)
ffff80000010c9e3:	00 00                	add    %al,(%rax)
ffff80000010c9e5:	80 ff ff             	cmp    $0xff,%bh
ffff80000010c9e8:	1c 80                	sbb    $0x80,%al
ffff80000010c9ea:	10 00                	adc    %al,(%rax)
ffff80000010c9ec:	00 80 ff ff 66 80    	add    %al,-0x7f990001(%rax)
ffff80000010c9f2:	10 00                	adc    %al,(%rax)
ffff80000010c9f4:	00 80 ff ff b0 80    	add    %al,-0x7f4f0001(%rax)
ffff80000010c9fa:	10 00                	adc    %al,(%rax)
ffff80000010c9fc:	00 80 ff ff fa 80    	add    %al,-0x7f050001(%rax)
ffff80000010ca02:	10 00                	adc    %al,(%rax)
ffff80000010ca04:	00 80 ff ff 44 81    	add    %al,-0x7ebb0001(%rax)
ffff80000010ca0a:	10 00                	adc    %al,(%rax)
ffff80000010ca0c:	00 80 ff ff 8e 81    	add    %al,-0x7e710001(%rax)
ffff80000010ca12:	10 00                	adc    %al,(%rax)
ffff80000010ca14:	00 80 ff ff d8 81    	add    %al,-0x7e270001(%rax)
ffff80000010ca1a:	10 00                	adc    %al,(%rax)
ffff80000010ca1c:	00 80 ff ff 22 82    	add    %al,-0x7ddd0001(%rax)
ffff80000010ca22:	10 00                	adc    %al,(%rax)
ffff80000010ca24:	00 80 ff ff 6c 82    	add    %al,-0x7d930001(%rax)
ffff80000010ca2a:	10 00                	adc    %al,(%rax)
ffff80000010ca2c:	00 80 ff ff b6 82    	add    %al,-0x7d490001(%rax)
ffff80000010ca32:	10 00                	adc    %al,(%rax)
ffff80000010ca34:	00 80 ff ff 00 83    	add    %al,-0x7cff0001(%rax)
ffff80000010ca3a:	10 00                	adc    %al,(%rax)
ffff80000010ca3c:	00 80 ff ff 4a 83    	add    %al,-0x7cb50001(%rax)
ffff80000010ca42:	10 00                	adc    %al,(%rax)
ffff80000010ca44:	00 80 ff ff 94 83    	add    %al,-0x7c6b0001(%rax)
ffff80000010ca4a:	10 00                	adc    %al,(%rax)
ffff80000010ca4c:	00 80 ff ff de 83    	add    %al,-0x7c210001(%rax)
ffff80000010ca52:	10 00                	adc    %al,(%rax)
ffff80000010ca54:	00 80 ff ff 28 84    	add    %al,-0x7bd70001(%rax)
ffff80000010ca5a:	10 00                	adc    %al,(%rax)
ffff80000010ca5c:	00 80 ff ff 72 84    	add    %al,-0x7b8d0001(%rax)
ffff80000010ca62:	10 00                	adc    %al,(%rax)
ffff80000010ca64:	00 80 ff ff bc 84    	add    %al,-0x7b430001(%rax)
ffff80000010ca6a:	10 00                	adc    %al,(%rax)
ffff80000010ca6c:	00 80 ff ff 06 85    	add    %al,-0x7af90001(%rax)
ffff80000010ca72:	10 00                	adc    %al,(%rax)
ffff80000010ca74:	00 80 ff ff 50 85    	add    %al,-0x7aaf0001(%rax)
ffff80000010ca7a:	10 00                	adc    %al,(%rax)
ffff80000010ca7c:	00                   	.byte 0x0
ffff80000010ca7d:	80 ff ff             	cmp    $0xff,%bh

Disassembly of section .rodata:

ffff80000010ca80 <_rodata>:
ffff80000010ca80:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010ca81:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010ca82:	5f                   	pop    %rdi
ffff80000010ca83:	73 79                	jae    ffff80000010cafe <.LC1+0x26>
ffff80000010ca85:	73 74                	jae    ffff80000010cafb <.LC1+0x23>
ffff80000010ca87:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff80000010ca89:	5f                   	pop    %rdi
ffff80000010ca8a:	63 61 6c             	movslq 0x6c(%rcx),%esp
ffff80000010ca8d:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010ca8e:	20 69 73             	and    %ch,0x73(%rcx)
ffff80000010ca91:	20 63 61             	and    %ah,0x61(%rbx)
ffff80000010ca94:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010ca95:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010ca96:	69 6e 67 2c 4e 52 3a 	imul   $0x3a524e2c,0x67(%rsi),%ebp
ffff80000010ca9d:	25 78 0a 00 00       	and    $0xa78,%eax
ffff80000010caa2:	00 00                	add    %al,(%rax)
ffff80000010caa4:	00 00                	add    %al,(%rax)
	...

ffff80000010caa8 <.LC0>:
ffff80000010caa8:	44 69 76 69 64 65 20 	imul   $0x45206564,0x69(%rsi),%r14d
ffff80000010caaf:	45 
ffff80000010cab0:	72 72                	jb     ffff80000010cb24 <.LC2+0x24>
ffff80000010cab2:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cab3:	72 28                	jb     ffff80000010cadd <.LC1+0x5>
ffff80000010cab5:	23 44 45 29          	and    0x29(%rbp,%rax,2),%eax
ffff80000010cab9:	0a 45 72             	or     0x72(%rbp),%al
ffff80000010cabc:	72 6f                	jb     ffff80000010cb2d <.LC2+0x2d>
ffff80000010cabe:	72 43                	jb     ffff80000010cb03 <.LC2+0x3>
ffff80000010cac0:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cac1:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010cac5:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010caca:	50                   	push   %rax
ffff80000010cacb:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962eb49 <_end+0x495056f1>
ffff80000010cad1:	50                   	push   %rax
ffff80000010cad2:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010d550 <_erodata+0x25f>

ffff80000010cad8 <.LC1>:
ffff80000010cad8:	44                   	rex.R
ffff80000010cad9:	65 62                	gs (bad) 
ffff80000010cadb:	75 67                	jne    ffff80000010cb44 <.LC3+0x14>
ffff80000010cadd:	28 23                	sub    %ah,(%rbx)
ffff80000010cadf:	44                   	rex.R
ffff80000010cae0:	42 29 0a             	rex.X sub %ecx,(%rdx)
ffff80000010cae3:	45 72 72             	rex.RB jb ffff80000010cb58 <.LC3+0x28>
ffff80000010cae6:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cae7:	72 43                	jb     ffff80000010cb2c <.LC2+0x2c>
ffff80000010cae9:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010caea:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010caee:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010caf3:	50                   	push   %rax
ffff80000010caf4:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962eb72 <_end+0x4950571a>
ffff80000010cafa:	50                   	push   %rax
ffff80000010cafb:	3a 25 78 0a 00     	cmp    0x4e000a78(%rip),%ah        # ffff80004e10d579 <_end+0x4dfe4121>

ffff80000010cb00 <.LC2>:
ffff80000010cb00:	4e                   	rex.WRX
ffff80000010cb01:	4d                   	rex.WRB
ffff80000010cb02:	49 20 49 6e          	rex.WB and %cl,0x6e(%r9)
ffff80000010cb06:	74 65                	je     ffff80000010cb6d <.LC4+0xd>
ffff80000010cb08:	72 72                	jb     ffff80000010cb7c <.LC4+0x1c>
ffff80000010cb0a:	75 70                	jne    ffff80000010cb7c <.LC4+0x1c>
ffff80000010cb0c:	74 28                	je     ffff80000010cb36 <.LC3+0x6>
ffff80000010cb0e:	2d 29 0a 45 72       	sub    $0x72450a29,%eax
ffff80000010cb13:	72 6f                	jb     ffff80000010cb84 <.LC4+0x24>
ffff80000010cb15:	72 43                	jb     ffff80000010cb5a <.LC3+0x2a>
ffff80000010cb17:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cb18:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010cb1c:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010cb21:	50                   	push   %rax
ffff80000010cb22:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962eba0 <_end+0x49505748>
ffff80000010cb28:	50                   	push   %rax
ffff80000010cb29:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010d5a7 <_erodata+0x2b6>
	...

ffff80000010cb30 <.LC3>:
ffff80000010cb30:	42 72 65             	rex.X jb ffff80000010cb98 <.LC5+0x8>
ffff80000010cb33:	61                   	(bad)  
ffff80000010cb34:	6b 50 6f 69          	imul   $0x69,0x6f(%rax),%edx
ffff80000010cb38:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010cb39:	74 28                	je     ffff80000010cb63 <.LC4+0x3>
ffff80000010cb3b:	23 42 50             	and    0x50(%rdx),%eax
ffff80000010cb3e:	29 0a                	sub    %ecx,(%rdx)
ffff80000010cb40:	45 72 72             	rex.RB jb ffff80000010cbb5 <.LC5+0x25>
ffff80000010cb43:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cb44:	72 43                	jb     ffff80000010cb89 <.LC4+0x29>
ffff80000010cb46:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cb47:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010cb4b:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010cb50:	50                   	push   %rax
ffff80000010cb51:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962ebcf <_end+0x49505777>
ffff80000010cb57:	50                   	push   %rax
ffff80000010cb58:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010d5d6 <_erodata+0x2e5>
	...

ffff80000010cb60 <.LC4>:
ffff80000010cb60:	4f 76 65             	rex.WRXB jbe ffff80000010cbc8 <.LC6>
ffff80000010cb63:	72 46                	jb     ffff80000010cbab <.LC5+0x1b>
ffff80000010cb65:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010cb66:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cb67:	77 28                	ja     ffff80000010cb91 <.LC5+0x1>
ffff80000010cb69:	23 4f 46             	and    0x46(%rdi),%ecx
ffff80000010cb6c:	29 0a                	sub    %ecx,(%rdx)
ffff80000010cb6e:	45 72 72             	rex.RB jb ffff80000010cbe3 <.LC6+0x1b>
ffff80000010cb71:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cb72:	72 43                	jb     ffff80000010cbb7 <.LC5+0x27>
ffff80000010cb74:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cb75:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010cb79:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010cb7e:	50                   	push   %rax
ffff80000010cb7f:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962ebfd <_end+0x495057a5>
ffff80000010cb85:	50                   	push   %rax
ffff80000010cb86:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010d604 <_erodata+0x313>
ffff80000010cb8c:	00 00                	add    %al,(%rax)
	...

ffff80000010cb90 <.LC5>:
ffff80000010cb90:	42                   	rex.X
ffff80000010cb91:	4f 55                	rex.WRXB push %r13
ffff80000010cb93:	4e                   	rex.WRX
ffff80000010cb94:	44 20 52 61          	and    %r10b,0x61(%rdx)
ffff80000010cb98:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010cb99:	67 65 20 45 78       	and    %al,%gs:0x78(%ebp)
ffff80000010cb9e:	63 65 65             	movslq 0x65(%rbp),%esp
ffff80000010cba1:	64 65 64 28 23       	fs gs sub %ah,%fs:(%rbx)
ffff80000010cba6:	42 52                	rex.X push %rdx
ffff80000010cba8:	29 0a                	sub    %ecx,(%rdx)
ffff80000010cbaa:	45 72 72             	rex.RB jb ffff80000010cc1f <.LC7+0xf>
ffff80000010cbad:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cbae:	72 43                	jb     ffff80000010cbf3 <.LC6+0x2b>
ffff80000010cbb0:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cbb1:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010cbb5:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010cbba:	50                   	push   %rax
ffff80000010cbbb:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962ec39 <_end+0x495057e1>
ffff80000010cbc1:	50                   	push   %rax
ffff80000010cbc2:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010d640 <_erodata+0x34f>

ffff80000010cbc8 <.LC6>:
ffff80000010cbc8:	49 6e                	rex.WB outsb %ds:(%rsi),(%dx)
ffff80000010cbca:	76 61                	jbe    ffff80000010cc2d <.LC7+0x1d>
ffff80000010cbcc:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010cbcd:	69 64 20 4f 70 63 6f 	imul   $0x646f6370,0x4f(%rax,%riz,1),%esp
ffff80000010cbd4:	64 
ffff80000010cbd5:	65 20 28             	and    %ch,%gs:(%rax)
ffff80000010cbd8:	55                   	push   %rbp
ffff80000010cbd9:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010cbda:	64 65 66 69 6e 65 64 	fs imul $0x2064,%gs:0x65(%rsi),%bp
ffff80000010cbe1:	20 
ffff80000010cbe2:	4f 70 63             	rex.WRXB jo ffff80000010cc48 <.LC7+0x38>
ffff80000010cbe5:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cbe6:	64 65 29 28          	fs sub %ebp,%gs:(%rax)
ffff80000010cbea:	23 55 44             	and    0x44(%rbp),%edx
ffff80000010cbed:	29 0a                	sub    %ecx,(%rdx)
ffff80000010cbef:	09 09                	or     %ecx,(%rcx)
ffff80000010cbf1:	45 72 72             	rex.RB jb ffff80000010cc66 <.LC8+0x6>
ffff80000010cbf4:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cbf5:	72 43                	jb     ffff80000010cc3a <.LC7+0x2a>
ffff80000010cbf7:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cbf8:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010cbfc:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010cc01:	50                   	push   %rax
ffff80000010cc02:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962ec80 <_end+0x49505828>
ffff80000010cc08:	50                   	push   %rax
ffff80000010cc09:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010d687 <_erodata+0x396>
	...

ffff80000010cc10 <.LC7>:
ffff80000010cc10:	20 44 65 76          	and    %al,0x76(%rbp,%riz,2)
ffff80000010cc14:	69 63 65 20 4e 6f 74 	imul   $0x746f4e20,0x65(%rbx),%esp
ffff80000010cc1b:	20 41 76             	and    %al,0x76(%rcx)
ffff80000010cc1e:	61                   	(bad)  
ffff80000010cc1f:	69 6c 61 62 6c 65 20 	imul   $0x2820656c,0x62(%rcx,%riz,2),%ebp
ffff80000010cc26:	28 
ffff80000010cc27:	4e 6f                	rex.WRX outsl %ds:(%rsi),(%dx)
ffff80000010cc29:	20 4d 61             	and    %cl,0x61(%rbp)
ffff80000010cc2c:	74 68                	je     ffff80000010cc96 <.LC9+0x6>
ffff80000010cc2e:	20 43 6f             	and    %al,0x6f(%rbx)
ffff80000010cc31:	70 72                	jo     ffff80000010cca5 <.LC9+0x15>
ffff80000010cc33:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cc34:	63 65 73             	movslq 0x73(%rbp),%esp
ffff80000010cc37:	73 6f                	jae    ffff80000010cca8 <.LC9+0x18>
ffff80000010cc39:	72 29                	jb     ffff80000010cc64 <.LC8+0x4>
ffff80000010cc3b:	28 23                	sub    %ah,(%rbx)
ffff80000010cc3d:	4e                   	rex.WRX
ffff80000010cc3e:	4d 29 0a             	sub    %r9,(%r10)
ffff80000010cc41:	09 09                	or     %ecx,(%rcx)
ffff80000010cc43:	45 72 72             	rex.RB jb ffff80000010ccb8 <.LC9+0x28>
ffff80000010cc46:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cc47:	72 43                	jb     ffff80000010cc8c <.LC8+0x2c>
ffff80000010cc49:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cc4a:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010cc4e:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010cc53:	50                   	push   %rax
ffff80000010cc54:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962ecd2 <_end+0x4950587a>
ffff80000010cc5a:	50                   	push   %rax
ffff80000010cc5b:	3a 25 78 0a 00     	cmp    0x44000a78(%rip),%ah        # ffff80004410d6d9 <_end+0x43fe4281>

ffff80000010cc60 <.LC8>:
ffff80000010cc60:	44 6f                	rex.R outsl %ds:(%rsi),(%dx)
ffff80000010cc62:	75 62                	jne    ffff80000010ccc6 <.LC9+0x36>
ffff80000010cc64:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010cc65:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff80000010cc69:	75 6c                	jne    ffff80000010ccd7 <.LC9+0x47>
ffff80000010cc6b:	74 28                	je     ffff80000010cc95 <.LC9+0x5>
ffff80000010cc6d:	23 44 46 29          	and    0x29(%rsi,%rax,2),%eax
ffff80000010cc71:	0a 45 72             	or     0x72(%rbp),%al
ffff80000010cc74:	72 6f                	jb     ffff80000010cce5 <.LC10+0x5>
ffff80000010cc76:	72 43                	jb     ffff80000010ccbb <.LC9+0x2b>
ffff80000010cc78:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cc79:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010cc7d:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010cc82:	50                   	push   %rax
ffff80000010cc83:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962ed01 <_end+0x495058a9>
ffff80000010cc89:	50                   	push   %rax
ffff80000010cc8a:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010d708 <_erodata+0x417>

ffff80000010cc90 <.LC9>:
ffff80000010cc90:	43 6f                	rex.XB outsl %ds:(%rsi),(%dx)
ffff80000010cc92:	70 72                	jo     ffff80000010cd06 <.LC10+0x26>
ffff80000010cc94:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cc95:	63 65 73             	movslq 0x73(%rbp),%esp
ffff80000010cc98:	73 6f                	jae    ffff80000010cd09 <.LC10+0x29>
ffff80000010cc9a:	72 20                	jb     ffff80000010ccbc <.LC9+0x2c>
ffff80000010cc9c:	53                   	push   %rbx
ffff80000010cc9d:	65 67 6d             	gs insl (%dx),%es:(%edi)
ffff80000010cca0:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010cca2:	74 20                	je     ffff80000010ccc4 <.LC9+0x34>
ffff80000010cca4:	4f 76 65             	rex.WRXB jbe ffff80000010cd0c <.LC10+0x2c>
ffff80000010cca7:	72 72                	jb     ffff80000010cd1b <.LC11+0xb>
ffff80000010cca9:	75 6e                	jne    ffff80000010cd19 <.LC11+0x9>
ffff80000010ccab:	20 28                	and    %ch,(%rax)
ffff80000010ccad:	72 65                	jb     ffff80000010cd14 <.LC11+0x4>
ffff80000010ccaf:	73 65                	jae    ffff80000010cd16 <.LC11+0x6>
ffff80000010ccb1:	72 76                	jb     ffff80000010cd29 <.LC11+0x19>
ffff80000010ccb3:	65 64 29 28          	gs sub %ebp,%fs:(%rax)
ffff80000010ccb7:	20 29                	and    %ch,(%rcx)
ffff80000010ccb9:	09 09                	or     %ecx,(%rcx)
ffff80000010ccbb:	0a 45 72             	or     0x72(%rbp),%al
ffff80000010ccbe:	72 6f                	jb     ffff80000010cd2f <.LC11+0x1f>
ffff80000010ccc0:	72 43                	jb     ffff80000010cd05 <.LC10+0x25>
ffff80000010ccc2:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010ccc3:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010ccc7:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010cccc:	50                   	push   %rax
ffff80000010cccd:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962ed4b <_end+0x495058f3>
ffff80000010ccd3:	50                   	push   %rax
ffff80000010ccd4:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010d752 <_erodata+0x461>
ffff80000010ccda:	00 00                	add    %al,(%rax)
ffff80000010ccdc:	00 00                	add    %al,(%rax)
	...

ffff80000010cce0 <.LC10>:
ffff80000010cce0:	49 6e                	rex.WB outsb %ds:(%rsi),(%dx)
ffff80000010cce2:	76 61                	jbe    ffff80000010cd45 <.LC11+0x35>
ffff80000010cce4:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010cce5:	69 64 20 54 53 53 28 	imul   $0x23285353,0x54(%rax,%riz,1),%esp
ffff80000010ccec:	23 
ffff80000010cced:	54                   	push   %rsp
ffff80000010ccee:	53                   	push   %rbx
ffff80000010ccef:	29 0a                	sub    %ecx,(%rdx)
ffff80000010ccf1:	45 72 72             	rex.RB jb ffff80000010cd66 <.LC11+0x56>
ffff80000010ccf4:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010ccf5:	72 43                	jb     ffff80000010cd3a <.LC11+0x2a>
ffff80000010ccf7:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010ccf8:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010ccfc:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010cd01:	50                   	push   %rax
ffff80000010cd02:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962ed80 <_end+0x49505928>
ffff80000010cd08:	50                   	push   %rax
ffff80000010cd09:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010d787 <_erodata+0x496>
	...

ffff80000010cd10 <.LC11>:
ffff80000010cd10:	54                   	push   %rsp
ffff80000010cd11:	68 65 20 65 78       	pushq  $0x78652065
ffff80000010cd16:	63 65 70             	movslq 0x70(%rbp),%esp
ffff80000010cd19:	74 69                	je     ffff80000010cd84 <.LC11+0x74>
ffff80000010cd1b:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cd1c:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010cd1d:	20 6f 63             	and    %ch,0x63(%rdi)
ffff80000010cd20:	63 75 72             	movslq 0x72(%rbp),%esi
ffff80000010cd23:	72 65                	jb     ffff80000010cd8a <.LC11+0x7a>
ffff80000010cd25:	64 20 64 75 72       	and    %ah,%fs:0x72(%rbp,%rsi,2)
ffff80000010cd2a:	69 6e 67 20 64 65 6c 	imul   $0x6c656420,0x67(%rsi),%ebp
ffff80000010cd31:	69 76 65 72 79 20 6f 	imul   $0x6f207972,0x65(%rsi),%esi
ffff80000010cd38:	66 20 61 6e          	data16 and %ah,0x6e(%rcx)
ffff80000010cd3c:	20 65 76             	and    %ah,0x76(%rbp)
ffff80000010cd3f:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010cd41:	74 20                	je     ffff80000010cd63 <.LC11+0x53>
ffff80000010cd43:	09 09                	or     %ecx,(%rcx)
ffff80000010cd45:	65 78 74             	gs js  ffff80000010cdbc <.LC12+0x2c>
ffff80000010cd48:	65 72 6e             	gs jb  ffff80000010cdb9 <.LC12+0x29>
ffff80000010cd4b:	61                   	(bad)  
ffff80000010cd4c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010cd4d:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000010cd51:	74 68                	je     ffff80000010cdbb <.LC12+0x2b>
ffff80000010cd53:	65 20 70 72          	and    %dh,%gs:0x72(%rax)
ffff80000010cd57:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cd58:	67 72 61             	addr32 jb ffff80000010cdbc <.LC12+0x2c>
ffff80000010cd5b:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000010cd5c:	2c 73                	sub    $0x73,%al
ffff80000010cd5e:	75 63                	jne    ffff80000010cdc3 <.LC13+0x3>
ffff80000010cd60:	68 20 61 73 20       	pushq  $0x20736120
ffff80000010cd65:	61                   	(bad)  
ffff80000010cd66:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010cd67:	20 69 6e             	and    %ch,0x6e(%rcx)
ffff80000010cd6a:	74 65                	je     ffff80000010cdd1 <.LC13+0x11>
ffff80000010cd6c:	72 72                	jb     ffff80000010cde0 <.LC13+0x20>
ffff80000010cd6e:	75 70                	jne    ffff80000010cde0 <.LC13+0x20>
ffff80000010cd70:	74 20                	je     ffff80000010cd92 <.LC12+0x2>
ffff80000010cd72:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cd73:	72 20                	jb     ffff80000010cd95 <.LC12+0x5>
ffff80000010cd75:	61                   	(bad)  
ffff80000010cd76:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010cd77:	20 65 61             	and    %ah,0x61(%rbp)
ffff80000010cd7a:	72 6c                	jb     ffff80000010cde8 <.LC13+0x28>
ffff80000010cd7c:	69 65 72 20 65 78 63 	imul   $0x63786520,0x72(%rbp),%esp
ffff80000010cd83:	65 70 74             	gs jo  ffff80000010cdfa <.LC14+0x2>
ffff80000010cd86:	69 6f 6e 2e 0a 00 00 	imul   $0xa2e,0x6e(%rdi),%ebp
ffff80000010cd8d:	00 00                	add    %al,(%rax)
	...

ffff80000010cd90 <.LC12>:
ffff80000010cd90:	52                   	push   %rdx
ffff80000010cd91:	65 66 65 72 73       	gs data16 gs jb ffff80000010ce09 <.LC14+0x11>
ffff80000010cd96:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000010cd9a:	61                   	(bad)  
ffff80000010cd9b:	20 67 61             	and    %ah,0x61(%rdi)
ffff80000010cd9e:	74 65                	je     ffff80000010ce05 <.LC14+0xd>
ffff80000010cda0:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff80000010cda4:	63 72 69             	movslq 0x69(%rdx),%esi
ffff80000010cda7:	70 74                	jo     ffff80000010ce1d <.LC14+0x25>
ffff80000010cda9:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cdaa:	72 20                	jb     ffff80000010cdcc <.LC13+0xc>
ffff80000010cdac:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff80000010cdb3:	49                   	rex.WB
ffff80000010cdb4:	44 54                	rex.R push %rsp
ffff80000010cdb6:	3b 0a                	cmp    (%rdx),%ecx
	...

ffff80000010cdc0 <.LC13>:
ffff80000010cdc0:	52                   	push   %rdx
ffff80000010cdc1:	65 66 65 72 73       	gs data16 gs jb ffff80000010ce39 <.LC15+0x9>
ffff80000010cdc6:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000010cdca:	61                   	(bad)  
ffff80000010cdcb:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff80000010cdcf:	63 72 69             	movslq 0x69(%rdx),%esi
ffff80000010cdd2:	70 74                	jo     ffff80000010ce48 <.LC15+0x18>
ffff80000010cdd4:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cdd5:	72 20                	jb     ffff80000010cdf7 <.LC13+0x37>
ffff80000010cdd7:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff80000010cdde:	47                   	rex.RXB
ffff80000010cddf:	44 54                	rex.R push %rsp
ffff80000010cde1:	20 6f 72             	and    %ch,0x72(%rdi)
ffff80000010cde4:	20 74 68 65          	and    %dh,0x65(%rax,%rbp,2)
ffff80000010cde8:	20 63 75             	and    %ah,0x75(%rbx)
ffff80000010cdeb:	72 72                	jb     ffff80000010ce5f <.LC16+0x3>
ffff80000010cded:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010cdef:	74 20                	je     ffff80000010ce11 <.LC14+0x19>
ffff80000010cdf1:	4c                   	rex.WR
ffff80000010cdf2:	44 54                	rex.R push %rsp
ffff80000010cdf4:	3b 0a                	cmp    (%rdx),%ecx
	...

ffff80000010cdf8 <.LC14>:
ffff80000010cdf8:	52                   	push   %rdx
ffff80000010cdf9:	65 66 65 72 73       	gs data16 gs jb ffff80000010ce71 <.LC16+0x15>
ffff80000010cdfe:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000010ce02:	61                   	(bad)  
ffff80000010ce03:	20 73 65             	and    %dh,0x65(%rbx)
ffff80000010ce06:	67 6d                	insl   (%dx),%es:(%edi)
ffff80000010ce08:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010ce0a:	74 20                	je     ffff80000010ce2c <.LC14+0x34>
ffff80000010ce0c:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010ce0d:	72 20                	jb     ffff80000010ce2f <.LC14+0x37>
ffff80000010ce0f:	67 61                	addr32 (bad) 
ffff80000010ce11:	74 65                	je     ffff80000010ce78 <.LC17>
ffff80000010ce13:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff80000010ce17:	63 72 69             	movslq 0x69(%rdx),%esi
ffff80000010ce1a:	70 74                	jo     ffff80000010ce90 <.LC17+0x18>
ffff80000010ce1c:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010ce1d:	72 20                	jb     ffff80000010ce3f <.LC15+0xf>
ffff80000010ce1f:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff80000010ce26:	4c                   	rex.WR
ffff80000010ce27:	44 54                	rex.R push %rsp
ffff80000010ce29:	3b 0a                	cmp    (%rdx),%ecx
ffff80000010ce2b:	00 00                	add    %al,(%rax)
ffff80000010ce2d:	00 00                	add    %al,(%rax)
	...

ffff80000010ce30 <.LC15>:
ffff80000010ce30:	52                   	push   %rdx
ffff80000010ce31:	65 66 65 72 73       	gs data16 gs jb ffff80000010cea9 <.LC17+0x31>
ffff80000010ce36:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000010ce3a:	61                   	(bad)  
ffff80000010ce3b:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff80000010ce3f:	63 72 69             	movslq 0x69(%rdx),%esi
ffff80000010ce42:	70 74                	jo     ffff80000010ceb8 <.LC18+0x8>
ffff80000010ce44:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010ce45:	72 20                	jb     ffff80000010ce67 <.LC16+0xb>
ffff80000010ce47:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff80000010ce4e:	63 75 72             	movslq 0x72(%rbp),%esi
ffff80000010ce51:	72 65                	jb     ffff80000010ceb8 <.LC18+0x8>
ffff80000010ce53:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010ce54:	74 20                	je     ffff80000010ce76 <.LC16+0x1a>
ffff80000010ce56:	47                   	rex.RXB
ffff80000010ce57:	44 54                	rex.R push %rsp
ffff80000010ce59:	3b 0a                	cmp    (%rdx),%ecx
	...

ffff80000010ce5c <.LC16>:
ffff80000010ce5c:	53                   	push   %rbx
ffff80000010ce5d:	65 67 6d             	gs insl (%dx),%es:(%edi)
ffff80000010ce60:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010ce62:	74 20                	je     ffff80000010ce84 <.LC17+0xc>
ffff80000010ce64:	53                   	push   %rbx
ffff80000010ce65:	65 6c                	gs insb (%dx),%es:(%rdi)
ffff80000010ce67:	65 63 74 6f 72       	movslq %gs:0x72(%rdi,%rbp,2),%esi
ffff80000010ce6c:	20 49 6e             	and    %cl,0x6e(%rcx)
ffff80000010ce6f:	64 65 78 3a          	fs gs js ffff80000010cead <.LC17+0x35>
ffff80000010ce73:	25 78 0a 00 00       	and    $0xa78,%eax

ffff80000010ce78 <.LC17>:
ffff80000010ce78:	20 53 65             	and    %dl,0x65(%rbx)
ffff80000010ce7b:	67 6d                	insl   (%dx),%es:(%edi)
ffff80000010ce7d:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010ce7f:	74 20                	je     ffff80000010cea1 <.LC17+0x29>
ffff80000010ce81:	4e 6f                	rex.WRX outsl %ds:(%rsi),(%dx)
ffff80000010ce83:	74 20                	je     ffff80000010cea5 <.LC17+0x2d>
ffff80000010ce85:	50                   	push   %rax
ffff80000010ce86:	72 65                	jb     ffff80000010ceed <.LC19+0x5>
ffff80000010ce88:	73 65                	jae    ffff80000010ceef <.LC19+0x7>
ffff80000010ce8a:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010ce8b:	74 28                	je     ffff80000010ceb5 <.LC18+0x5>
ffff80000010ce8d:	23 4e 50             	and    0x50(%rsi),%ecx
ffff80000010ce90:	29 0a                	sub    %ecx,(%rdx)
ffff80000010ce92:	45 72 72             	rex.RB jb ffff80000010cf07 <.LC19+0x1f>
ffff80000010ce95:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010ce96:	72 43                	jb     ffff80000010cedb <.LC18+0x2b>
ffff80000010ce98:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010ce99:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010ce9d:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010cea2:	50                   	push   %rax
ffff80000010cea3:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962ef21 <_end+0x49505ac9>
ffff80000010cea9:	50                   	push   %rax
ffff80000010ceaa:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010d928 <_erodata+0x637>

ffff80000010ceb0 <.LC18>:
ffff80000010ceb0:	53                   	push   %rbx
ffff80000010ceb1:	74 61                	je     ffff80000010cf14 <.LC19+0x2c>
ffff80000010ceb3:	63 6b 2d             	movslq 0x2d(%rbx),%ebp
ffff80000010ceb6:	53                   	push   %rbx
ffff80000010ceb7:	65 67 6d             	gs insl (%dx),%es:(%edi)
ffff80000010ceba:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010cebc:	74 20                	je     ffff80000010cede <.LC18+0x2e>
ffff80000010cebe:	46 61                	rex.RX (bad) 
ffff80000010cec0:	75 6c                	jne    ffff80000010cf2e <.LC20+0xe>
ffff80000010cec2:	74 28                	je     ffff80000010ceec <.LC19+0x4>
ffff80000010cec4:	23 53 53             	and    0x53(%rbx),%edx
ffff80000010cec7:	29 0a                	sub    %ecx,(%rdx)
ffff80000010cec9:	45 72 72             	rex.RB jb ffff80000010cf3e <.LC20+0x1e>
ffff80000010cecc:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cecd:	72 43                	jb     ffff80000010cf12 <.LC19+0x2a>
ffff80000010cecf:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010ced0:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010ced4:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010ced9:	50                   	push   %rax
ffff80000010ceda:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962ef58 <_end+0x49505b00>
ffff80000010cee0:	50                   	push   %rax
ffff80000010cee1:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010d95f <_erodata+0x66e>
	...

ffff80000010cee8 <.LC19>:
ffff80000010cee8:	47                   	rex.RXB
ffff80000010cee9:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010ceeb:	65 72 61             	gs jb  ffff80000010cf4f <.LC21+0x3>
ffff80000010ceee:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010ceef:	20 50 72             	and    %dl,0x72(%rax)
ffff80000010cef2:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cef3:	74 65                	je     ffff80000010cf5a <.LC21+0xe>
ffff80000010cef5:	63 74 69 6f          	movslq 0x6f(%rcx,%rbp,2),%esi
ffff80000010cef9:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010cefa:	28 23                	sub    %ah,(%rbx)
ffff80000010cefc:	47 50                	rex.RXB push %r8
ffff80000010cefe:	29 0a                	sub    %ecx,(%rdx)
ffff80000010cf00:	45 72 72             	rex.RB jb ffff80000010cf75 <.LC23+0x2>
ffff80000010cf03:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cf04:	72 43                	jb     ffff80000010cf49 <.LC20+0x29>
ffff80000010cf06:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cf07:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010cf0b:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010cf10:	50                   	push   %rax
ffff80000010cf11:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962ef8f <_end+0x49505b37>
ffff80000010cf17:	50                   	push   %rax
ffff80000010cf18:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010d996 <_erodata+0x6a5>
	...

ffff80000010cf20 <.LC20>:
ffff80000010cf20:	50                   	push   %rax
ffff80000010cf21:	61                   	(bad)  
ffff80000010cf22:	67 65 20 46 61       	and    %al,%gs:0x61(%esi)
ffff80000010cf27:	75 6c                	jne    ffff80000010cf95 <.LC24+0xf>
ffff80000010cf29:	74 28                	je     ffff80000010cf53 <.LC21+0x7>
ffff80000010cf2b:	23 50 46             	and    0x46(%rax),%edx
ffff80000010cf2e:	29 0a                	sub    %ecx,(%rdx)
ffff80000010cf30:	45 72 72             	rex.RB jb ffff80000010cfa5 <.LC25+0xd>
ffff80000010cf33:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cf34:	72 43                	jb     ffff80000010cf79 <.LC23+0x6>
ffff80000010cf36:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cf37:	64 65 3a 25 64 20 52 	fs cmp %gs:0x53522064(%rip),%ah        # ffff80005362efa3 <_end+0x53505b4b>
ffff80000010cf3e:	53 
ffff80000010cf3f:	50                   	push   %rax
ffff80000010cf40:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962efbe <_end+0x49505b66>
ffff80000010cf46:	50                   	push   %rax
ffff80000010cf47:	3a 25 78 0a 00     	cmp    0x50000a78(%rip),%ah        # ffff80005010d9c5 <_end+0x4ffe456d>

ffff80000010cf4c <.LC21>:
ffff80000010cf4c:	50                   	push   %rax
ffff80000010cf4d:	61                   	(bad)  
ffff80000010cf4e:	67 65 20 4e 6f       	and    %cl,%gs:0x6f(%esi)
ffff80000010cf53:	74 2d                	je     ffff80000010cf82 <.LC23+0xf>
ffff80000010cf55:	50                   	push   %rax
ffff80000010cf56:	72 65                	jb     ffff80000010cfbd <.LC26+0x9>
ffff80000010cf58:	73 65                	jae    ffff80000010cfbf <.LC26+0xb>
ffff80000010cf5a:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010cf5b:	74 2c                	je     ffff80000010cf89 <.LC24+0x3>
ffff80000010cf5d:	0a 00                	or     (%rax),%al

ffff80000010cf5f <.LC22>:
ffff80000010cf5f:	57                   	push   %rdi
ffff80000010cf60:	72 69                	jb     ffff80000010cfcb <.LC26+0x17>
ffff80000010cf62:	74 65                	je     ffff80000010cfc9 <.LC26+0x15>
ffff80000010cf64:	20 43 61             	and    %al,0x61(%rbx)
ffff80000010cf67:	75 73                	jne    ffff80000010cfdc <.LC27+0xc>
ffff80000010cf69:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff80000010cf6d:	75 6c                	jne    ffff80000010cfdb <.LC27+0xb>
ffff80000010cf6f:	74 2c                	je     ffff80000010cf9d <.LC25+0x5>
ffff80000010cf71:	0a 00                	or     (%rax),%al

ffff80000010cf73 <.LC23>:
ffff80000010cf73:	52                   	push   %rdx
ffff80000010cf74:	65 61                	gs (bad) 
ffff80000010cf76:	64 20 43 61          	and    %al,%fs:0x61(%rbx)
ffff80000010cf7a:	75 73                	jne    ffff80000010cfef <.LC27+0x1f>
ffff80000010cf7c:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff80000010cf80:	75 6c                	jne    ffff80000010cfee <.LC27+0x1e>
ffff80000010cf82:	74 2c                	je     ffff80000010cfb0 <.LC25+0x18>
ffff80000010cf84:	0a 00                	or     (%rax),%al

ffff80000010cf86 <.LC24>:
ffff80000010cf86:	46 61                	rex.RX (bad) 
ffff80000010cf88:	75 6c                	jne    ffff80000010cff6 <.LC28+0x6>
ffff80000010cf8a:	74 20                	je     ffff80000010cfac <.LC25+0x14>
ffff80000010cf8c:	69 6e 20 75 73 65 72 	imul   $0x72657375,0x20(%rsi),%ebp
ffff80000010cf93:	28 33                	sub    %dh,(%rbx)
ffff80000010cf95:	29 0a                	sub    %ecx,(%rdx)
	...

ffff80000010cf98 <.LC25>:
ffff80000010cf98:	46 61                	rex.RX (bad) 
ffff80000010cf9a:	75 6c                	jne    ffff80000010d008 <.LC29+0x10>
ffff80000010cf9c:	74 20                	je     ffff80000010cfbe <.LC26+0xa>
ffff80000010cf9e:	69 6e 20 73 75 70 65 	imul   $0x65707573,0x20(%rsi),%ebp
ffff80000010cfa5:	72 76                	jb     ffff80000010d01d <.LC29+0x25>
ffff80000010cfa7:	69 73 6f 72 28 30 2c 	imul   $0x2c302872,0x6f(%rbx),%esi
ffff80000010cfae:	31 2c 32             	xor    %ebp,(%rdx,%rsi,1)
ffff80000010cfb1:	29 0a                	sub    %ecx,(%rdx)
	...

ffff80000010cfb4 <.LC26>:
ffff80000010cfb4:	2c 52                	sub    $0x52,%al
ffff80000010cfb6:	65 73 65             	gs jae ffff80000010d01e <.LC29+0x26>
ffff80000010cfb9:	72 76                	jb     ffff80000010d031 <.LC29+0x39>
ffff80000010cfbb:	65 64 20 42 69       	gs and %al,%fs:0x69(%rdx)
ffff80000010cfc0:	74 20                	je     ffff80000010cfe2 <.LC27+0x12>
ffff80000010cfc2:	43 61                	rex.XB (bad) 
ffff80000010cfc4:	75 73                	jne    ffff80000010d039 <.LC29+0x41>
ffff80000010cfc6:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff80000010cfca:	75 6c                	jne    ffff80000010d038 <.LC29+0x40>
ffff80000010cfcc:	74 0a                	je     ffff80000010cfd8 <.LC27+0x8>
	...

ffff80000010cfd0 <.LC27>:
ffff80000010cfd0:	2c 49                	sub    $0x49,%al
ffff80000010cfd2:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010cfd3:	73 74                	jae    ffff80000010d049 <.LC30+0x1>
ffff80000010cfd5:	72 75                	jb     ffff80000010d04c <.LC30+0x4>
ffff80000010cfd7:	63 74 69 6f          	movslq 0x6f(%rcx,%rbp,2),%esi
ffff80000010cfdb:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010cfdc:	20 66 65             	and    %ah,0x65(%rsi)
ffff80000010cfdf:	74 63                	je     ffff80000010d044 <.LC29+0x4c>
ffff80000010cfe1:	68 20 43 61 75       	pushq  $0x75614320
ffff80000010cfe6:	73 65                	jae    ffff80000010d04d <.LC30+0x5>
ffff80000010cfe8:	20 46 61             	and    %al,0x61(%rsi)
ffff80000010cfeb:	75 6c                	jne    ffff80000010d059 <.LC30+0x11>
ffff80000010cfed:	74 0a                	je     ffff80000010cff9 <.LC29+0x1>
	...

ffff80000010cff0 <.LC28>:
ffff80000010cff0:	43 52                	rex.XB push %r10
ffff80000010cff2:	32 3a                	xor    (%rdx),%bh
ffff80000010cff4:	25 78 0a 00        	and    $0x78000a78,%eax

ffff80000010cff8 <.LC29>:
ffff80000010cff8:	78 38                	js     ffff80000010d032 <.LC29+0x3a>
ffff80000010cffa:	37                   	(bad)  
ffff80000010cffb:	20 46 50             	and    %al,0x50(%rsi)
ffff80000010cffe:	55                   	push   %rbp
ffff80000010cfff:	20 46 6c             	and    %al,0x6c(%rsi)
ffff80000010d002:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d003:	61                   	(bad)  
ffff80000010d004:	74 69                	je     ffff80000010d06f <.LC30+0x27>
ffff80000010d006:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d007:	67 2d 50 6f 69 6e    	addr32 sub $0x6e696f50,%eax
ffff80000010d00d:	74 20                	je     ffff80000010d02f <.LC29+0x37>
ffff80000010d00f:	45 72 72             	rex.RB jb ffff80000010d084 <.LC31+0x4>
ffff80000010d012:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d013:	72 20                	jb     ffff80000010d035 <.LC29+0x3d>
ffff80000010d015:	28 4d 61             	sub    %cl,0x61(%rbp)
ffff80000010d018:	74 68                	je     ffff80000010d082 <.LC31+0x2>
ffff80000010d01a:	20 46 61             	and    %al,0x61(%rsi)
ffff80000010d01d:	75 6c                	jne    ffff80000010d08b <.LC31+0xb>
ffff80000010d01f:	74 29                	je     ffff80000010d04a <.LC30+0x2>
ffff80000010d021:	28 23                	sub    %ah,(%rbx)
ffff80000010d023:	4d                   	rex.WRB
ffff80000010d024:	46 29 20             	rex.RX sub %r12d,(%rax)
ffff80000010d027:	09 09                	or     %ecx,(%rcx)
ffff80000010d029:	0a 45 72             	or     0x72(%rbp),%al
ffff80000010d02c:	72 6f                	jb     ffff80000010d09d <.LC31+0x1d>
ffff80000010d02e:	72 43                	jb     ffff80000010d073 <.LC30+0x2b>
ffff80000010d030:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d031:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010d035:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010d03a:	50                   	push   %rax
ffff80000010d03b:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962f0b9 <_end+0x49505c61>
ffff80000010d041:	50                   	push   %rax
ffff80000010d042:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010dac0 <_erodata+0x7cf>

ffff80000010d048 <.LC30>:
ffff80000010d048:	41 6c                	rex.B insb (%dx),%es:(%rdi)
ffff80000010d04a:	69 67 6e 6d 65 6e 74 	imul   $0x746e656d,0x6e(%rdi),%esp
ffff80000010d051:	20 43 68             	and    %al,0x68(%rbx)
ffff80000010d054:	65 63 6b 28          	movslq %gs:0x28(%rbx),%ebp
ffff80000010d058:	23 41 43             	and    0x43(%rcx),%eax
ffff80000010d05b:	29 0a                	sub    %ecx,(%rdx)
ffff80000010d05d:	45 72 72             	rex.RB jb ffff80000010d0d2 <.LC32+0x22>
ffff80000010d060:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d061:	72 43                	jb     ffff80000010d0a6 <.LC31+0x26>
ffff80000010d063:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d064:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010d068:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010d06d:	50                   	push   %rax
ffff80000010d06e:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962f0ec <_end+0x49505c94>
ffff80000010d074:	50                   	push   %rax
ffff80000010d075:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010daf3 <_erodata+0x802>
ffff80000010d07b:	00 00                	add    %al,(%rax)
ffff80000010d07d:	00 00                	add    %al,(%rax)
	...

ffff80000010d080 <.LC31>:
ffff80000010d080:	4d 61                	rex.WRB (bad) 
ffff80000010d082:	63 68 69             	movslq 0x69(%rax),%ebp
ffff80000010d085:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d086:	65 20 43 68          	and    %al,%gs:0x68(%rbx)
ffff80000010d08a:	65 63 6b 28          	movslq %gs:0x28(%rbx),%ebp
ffff80000010d08e:	23 4d 43             	and    0x43(%rbp),%ecx
ffff80000010d091:	29 0a                	sub    %ecx,(%rdx)
ffff80000010d093:	45 72 72             	rex.RB jb ffff80000010d108 <.LC33+0x10>
ffff80000010d096:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d097:	72 43                	jb     ffff80000010d0dc <.LC32+0x2c>
ffff80000010d099:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d09a:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010d09e:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010d0a3:	50                   	push   %rax
ffff80000010d0a4:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962f122 <_end+0x49505cca>
ffff80000010d0aa:	50                   	push   %rax
ffff80000010d0ab:	3a 25 78 0a 00     	cmp    0x53000a78(%rip),%ah        # ffff80005310db29 <_end+0x52fe46d1>

ffff80000010d0b0 <.LC32>:
ffff80000010d0b0:	53                   	push   %rbx
ffff80000010d0b1:	49                   	rex.WB
ffff80000010d0b2:	4d                   	rex.WRB
ffff80000010d0b3:	44 20 46 6c          	and    %r8b,0x6c(%rsi)
ffff80000010d0b7:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d0b8:	61                   	(bad)  
ffff80000010d0b9:	74 69                	je     ffff80000010d124 <.LC33+0x2c>
ffff80000010d0bb:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d0bc:	67 2d 50 6f 69 6e    	addr32 sub $0x6e696f50,%eax
ffff80000010d0c2:	74 20                	je     ffff80000010d0e4 <.LC32+0x34>
ffff80000010d0c4:	45 78 63             	rex.RB js ffff80000010d12a <.LC33+0x32>
ffff80000010d0c7:	65 70 74             	gs jo  ffff80000010d13e <.LC0+0x6>
ffff80000010d0ca:	69 6f 6e 28 23 58 4d 	imul   $0x4d582328,0x6e(%rdi),%ebp
ffff80000010d0d1:	29 09                	sub    %ecx,(%rcx)
ffff80000010d0d3:	09 0a                	or     %ecx,(%rdx)
ffff80000010d0d5:	45 72 72             	rex.RB jb ffff80000010d14a <.LC0+0x12>
ffff80000010d0d8:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d0d9:	72 43                	jb     ffff80000010d11e <.LC33+0x26>
ffff80000010d0db:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d0dc:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010d0e0:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010d0e5:	50                   	push   %rax
ffff80000010d0e6:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962f164 <_end+0x49505d0c>
ffff80000010d0ec:	50                   	push   %rax
ffff80000010d0ed:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010db6b <_erodata+0x87a>
ffff80000010d0f3:	00 00                	add    %al,(%rax)
ffff80000010d0f5:	00 00                	add    %al,(%rax)
	...

ffff80000010d0f8 <.LC33>:
ffff80000010d0f8:	20 56 69             	and    %dl,0x69(%rsi)
ffff80000010d0fb:	72 74                	jb     ffff80000010d171 <.LC1+0x14>
ffff80000010d0fd:	75 61                	jne    ffff80000010d160 <.LC1+0x3>
ffff80000010d0ff:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d100:	69 7a 61 74 69 6f 6e 	imul   $0x6e6f6974,0x61(%rdx),%edi
ffff80000010d107:	20 45 78             	and    %al,0x78(%rbp)
ffff80000010d10a:	63 65 70             	movslq 0x70(%rbp),%esp
ffff80000010d10d:	74 69                	je     ffff80000010d178 <.LC1+0x1b>
ffff80000010d10f:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d110:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d111:	28 23                	sub    %ah,(%rbx)
ffff80000010d113:	56                   	push   %rsi
ffff80000010d114:	45 29 0a             	sub    %r9d,(%r10)
ffff80000010d117:	45 72 72             	rex.RB jb ffff80000010d18c <.LC2+0x11>
ffff80000010d11a:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d11b:	72 43                	jb     ffff80000010d160 <.LC1+0x3>
ffff80000010d11d:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d11e:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010d122:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010d127:	50                   	push   %rax
ffff80000010d128:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962f1a6 <_end+0x49505d4e>
ffff80000010d12e:	50                   	push   %rax
ffff80000010d12f:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010dbad <_erodata+0x8bc>
ffff80000010d135:	00 00                	add    %al,(%rax)
	...

ffff80000010d138 <.LC0>:
ffff80000010d138:	44 69 73 70 6c 61 79 	imul   $0x2079616c,0x70(%rbx),%r14d
ffff80000010d13f:	20 
ffff80000010d140:	50                   	push   %rax
ffff80000010d141:	68 79 73 69 63       	pushq  $0x63697379
ffff80000010d146:	73 20                	jae    ffff80000010d168 <.LC1+0xb>
ffff80000010d148:	4d                   	rex.WRB
ffff80000010d149:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff80000010d14b:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d14c:	72 79                	jb     ffff80000010d1c7 <.LC4+0x17>
ffff80000010d14e:	20 44 69 73          	and    %al,0x73(%rcx,%rbp,2)
ffff80000010d152:	74 72                	je     ffff80000010d1c6 <.LC4+0x16>
ffff80000010d154:	69 62 75 74 69 6f 6e 	imul   $0x6e6f6974,0x75(%rdx),%esp
ffff80000010d15b:	0a 00                	or     (%rax),%al

ffff80000010d15d <.LC1>:
ffff80000010d15d:	41                   	rex.B
ffff80000010d15e:	64 64 72 65          	fs fs jb ffff80000010d1c7 <.LC4+0x17>
ffff80000010d162:	73 73                	jae    ffff80000010d1d7 <.LC4+0x27>
ffff80000010d164:	3a 25 78 20 4c 65    	cmp    0x654c2078(%rip),%ah        # ffff8000655cf1e2 <_end+0x654a5d8a>
ffff80000010d16a:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d16b:	67 74 68             	addr32 je ffff80000010d1d6 <.LC4+0x26>
ffff80000010d16e:	3a 25 78 20 54 79    	cmp    0x79542078(%rip),%ah        # ffff80007964f1ec <_end+0x79525d94>
ffff80000010d174:	70 65                	jo     ffff80000010d1db <.LC4+0x2b>
ffff80000010d176:	3a 25 78 0a 00     	cmp    0x55000a78(%rip),%ah        # ffff80005510dbf4 <_end+0x54fe479c>

ffff80000010d17b <.LC2>:
ffff80000010d17b:	55                   	push   %rbp
ffff80000010d17c:	73 65                	jae    ffff80000010d1e3 <.LC4+0x33>
ffff80000010d17e:	61                   	(bad)  
ffff80000010d17f:	62                   	(bad)  
ffff80000010d180:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d181:	65 20 54 6f 74       	and    %dl,%gs:0x74(%rdi,%rbp,2)
ffff80000010d186:	61                   	(bad)  
ffff80000010d187:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d188:	20 52 41             	and    %dl,0x41(%rdx)
ffff80000010d18b:	4d 3a 25 78 0a 00  	rex.WRB cmp 0x55000a78(%rip),%r12b        # ffff80005510dc0a <_end+0x54fe47b2>

ffff80000010d191 <.LC3>:
ffff80000010d191:	55                   	push   %rbp
ffff80000010d192:	73 65                	jae    ffff80000010d1f9 <.LC4+0x49>
ffff80000010d194:	61                   	(bad)  
ffff80000010d195:	62                   	(bad)  
ffff80000010d196:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d197:	65 20 54 6f 74       	and    %dl,%gs:0x74(%rdi,%rbp,2)
ffff80000010d19c:	61                   	(bad)  
ffff80000010d19d:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d19e:	20 50 61             	and    %dl,0x61(%rax)
ffff80000010d1a1:	67 65 20 4e 75       	and    %cl,%gs:0x75(%esi)
ffff80000010d1a6:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000010d1a7:	62                   	(bad)  
ffff80000010d1a8:	65 72 3a             	gs jb  ffff80000010d1e5 <.LC4+0x35>
ffff80000010d1ab:	25 64 0a 00 00       	and    $0xa64,%eax

ffff80000010d1b0 <.LC4>:
ffff80000010d1b0:	5a                   	pop    %rdx
ffff80000010d1b1:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d1b2:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d1b3:	65 20 20             	and    %ah,%gs:(%rax)
ffff80000010d1b6:	25 64 0a 7a 6f       	and    $0x6f7a0a64,%eax
ffff80000010d1bb:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d1bc:	65 5f                	gs pop %rdi
ffff80000010d1be:	73 74                	jae    ffff80000010d234 <.LC7+0x9>
ffff80000010d1c0:	61                   	(bad)  
ffff80000010d1c1:	72 74                	jb     ffff80000010d237 <.LC7+0xc>
ffff80000010d1c3:	5f                   	pop    %rdi
ffff80000010d1c4:	61                   	(bad)  
ffff80000010d1c5:	64 64 72 3a          	fs fs jb ffff80000010d203 <.LC4+0x53>
ffff80000010d1c9:	25 78 20 7a 6f       	and    $0x6f7a2078,%eax
ffff80000010d1ce:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d1cf:	65 5f                	gs pop %rdi
ffff80000010d1d1:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010d1d3:	64 5f                	fs pop %rdi
ffff80000010d1d5:	61                   	(bad)  
ffff80000010d1d6:	64 64 72 3a          	fs fs jb ffff80000010d214 <.LC5+0x8>
ffff80000010d1da:	25 78 20 7a 6f       	and    $0x6f7a2078,%eax
ffff80000010d1df:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d1e0:	65 5f                	gs pop %rdi
ffff80000010d1e2:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d1e3:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010d1e5:	67 74 68             	addr32 je ffff80000010d250 <.LC8+0x10>
ffff80000010d1e8:	3a 25 78 0a 70 61    	cmp    0x61700a78(%rip),%ah        # ffff80006180dc66 <_end+0x616e480e>
ffff80000010d1ee:	67 65 73 5f          	addr32 gs jae ffff80000010d251 <.LC8+0x11>
ffff80000010d1f2:	67 72 6f             	addr32 jb ffff80000010d264 <.LC8+0x24>
ffff80000010d1f5:	75 70                	jne    ffff80000010d267 <.LC0+0x2>
ffff80000010d1f7:	3a 25 78 20 70 61    	cmp    0x61702078(%rip),%ah        # ffff80006180f275 <_end+0x616e5e1d>
ffff80000010d1fd:	67 65 73 5f          	addr32 gs jae ffff80000010d260 <.LC8+0x20>
ffff80000010d201:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d202:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010d204:	67 74 68             	addr32 je ffff80000010d26f <.LC0+0xa>
ffff80000010d207:	3a 25 78 0a 00     	cmp    0x47000a78(%rip),%ah        # ffff80004710dc85 <_end+0x46fe482d>

ffff80000010d20c <.LC5>:
ffff80000010d20c:	47 6c                	rex.RXB insb (%dx),%es:(%rdi)
ffff80000010d20e:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d20f:	62 61 6c 5f 43       	(bad)  {%k7}
ffff80000010d214:	52                   	push   %rdx
ffff80000010d215:	33 3a                	xor    (%rdx),%edi
ffff80000010d217:	25 78 0a 00        	and    $0x2a000a78,%eax

ffff80000010d21b <.LC6>:
ffff80000010d21b:	2a 47 6c             	sub    0x6c(%rdi),%al
ffff80000010d21e:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d21f:	62 61 6c 5f 43       	(bad)  {%k7}
ffff80000010d224:	52                   	push   %rdx
ffff80000010d225:	33 3a                	xor    (%rdx),%edi
ffff80000010d227:	25 78 0a 00        	and    $0x2a000a78,%eax

ffff80000010d22b <.LC7>:
ffff80000010d22b:	2a 2a                	sub    (%rdx),%ch
ffff80000010d22d:	47 6c                	rex.RXB insb (%dx),%es:(%rdi)
ffff80000010d22f:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d230:	62 61 6c 5f 43       	(bad)  {%k7}
ffff80000010d235:	52                   	push   %rdx
ffff80000010d236:	33 3a                	xor    (%rdx),%edi
ffff80000010d238:	25 78 0a 00 00       	and    $0xa78,%eax
ffff80000010d23d:	00 00                	add    %al,(%rax)
	...

ffff80000010d240 <.LC8>:
ffff80000010d240:	61                   	(bad)  
ffff80000010d241:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d242:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d243:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d244:	63 5f 70             	movslq 0x70(%rdi),%ebx
ffff80000010d247:	61                   	(bad)  
ffff80000010d248:	67 65 73 20          	addr32 gs jae ffff80000010d26c <.LC0+0x7>
ffff80000010d24c:	65 72 72             	gs jb  ffff80000010d2c1 <.LC2+0x5>
ffff80000010d24f:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d250:	72 20                	jb     ffff80000010d272 <.LC1>
ffff80000010d252:	7a 6f                	jp     ffff80000010d2c3 <.LC2+0x7>
ffff80000010d254:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d255:	65 5f                	gs pop %rdi
ffff80000010d257:	73 65                	jae    ffff80000010d2be <.LC2+0x2>
ffff80000010d259:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d25a:	65 63 74 20 69       	movslq %gs:0x69(%rax,%riz,1),%esi
ffff80000010d25f:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d260:	64 65 78 0a          	fs gs js ffff80000010d26e <.LC0+0x9>
	...

ffff80000010d265 <.LC0>:
ffff80000010d265:	38 32                	cmp    %dh,(%rdx)
ffff80000010d267:	35 39 41 20 69       	xor    $0x69204139,%eax
ffff80000010d26c:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d26d:	69 74 20 0a 00   	imul   $0x79656b00,0xa(%rax,%riz,1),%esi
ffff80000010d274:	 

ffff80000010d272 <.LC1>:
ffff80000010d272:	6b 65 79 20          	imul   $0x20,0x79(%rbp),%esp
ffff80000010d276:	63 6f 64             	movslq 0x64(%rdi),%ebp
ffff80000010d279:	65 3a 25 78 00 00 00 	cmp    %gs:0x78(%rip),%ah        # ffff80000010d2f8 <_erodata+0x7>

ffff80000010d280 <.LC0>:
ffff80000010d280:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d281:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d282:	5f                   	pop    %rdi
ffff80000010d283:	73 79                	jae    ffff80000010d2fe <_erodata+0xd>
ffff80000010d285:	73 74                	jae    ffff80000010d2fb <_erodata+0xa>
ffff80000010d287:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff80000010d289:	5f                   	pop    %rdi
ffff80000010d28a:	63 61 6c             	movslq 0x6c(%rcx),%esp
ffff80000010d28d:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d28e:	20 69 73             	and    %ch,0x73(%rcx)
ffff80000010d291:	20 63 61             	and    %ah,0x61(%rbx)
ffff80000010d294:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d295:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d296:	69 6e 67 2c 4e 52 3a 	imul   $0x3a524e2c,0x67(%rsi),%ebp
ffff80000010d29d:	25 78 0a 00        	and    $0x64000a78,%eax

ffff80000010d2a1 <.LC1>:
ffff80000010d2a1:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff80000010d2a3:	5f                   	pop    %rdi
ffff80000010d2a4:	65 78 65             	gs js  ffff80000010d30c <_erodata+0x1b>
ffff80000010d2a7:	63 76 65             	movslq 0x65(%rsi),%esi
ffff80000010d2aa:	20 74 61 73          	and    %dh,0x73(%rcx,%riz,2)
ffff80000010d2ae:	6b 20 69             	imul   $0x69,(%rax),%esp
ffff80000010d2b1:	73 20                	jae    ffff80000010d2d3 <.LC2+0x17>
ffff80000010d2b3:	72 75                	jb     ffff80000010d32a <_erodata+0x39>
ffff80000010d2b5:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d2b6:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d2b7:	69 6e 67 0a 00   	imul   $0x6e69000a,0x67(%rsi),%ebp

ffff80000010d2bc <.LC2>:
ffff80000010d2bc:	69 6e 69 74 20 74 61 	imul   $0x61742074,0x69(%rsi),%ebp
ffff80000010d2c3:	73 6b                	jae    ffff80000010d330 <_erodata+0x3f>
ffff80000010d2c5:	20 69 73             	and    %ch,0x73(%rcx)
ffff80000010d2c8:	20 72 75             	and    %dh,0x75(%rdx)
ffff80000010d2cb:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d2cc:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d2cd:	69 6e 67 2c 61 72 67 	imul   $0x6772612c,0x67(%rsi),%ebp
ffff80000010d2d4:	3a 25 64 0a 00     	cmp    0x65000a64(%rip),%ah        # ffff80006510dd3e <_end+0x64fe48e6>

ffff80000010d2d9 <.LC3>:
ffff80000010d2d9:	65 78 69             	gs js  ffff80000010d345 <_erodata+0x54>
ffff80000010d2dc:	74 28                	je     ffff80000010d306 <_erodata+0x15>
ffff80000010d2de:	29 20                	sub    %esp,(%rax)
ffff80000010d2e0:	74 61                	je     ffff80000010d343 <_erodata+0x52>
ffff80000010d2e2:	73 6b                	jae    ffff80000010d34f <_erodata+0x5e>
ffff80000010d2e4:	20 69 73             	and    %ch,0x73(%rcx)
ffff80000010d2e7:	20 72 75             	and    %dh,0x75(%rdx)
ffff80000010d2ea:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d2eb:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d2ec:	69                   	.byte 0x69
ffff80000010d2ed:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d2ee:	67 0a 00             	or     (%eax),%al

Disassembly of section .eh_frame:

ffff80000010d2f8 <.eh_frame>:
ffff80000010d2f8:	14 00                	adc    $0x0,%al
ffff80000010d2fa:	00 00                	add    %al,(%rax)
ffff80000010d2fc:	00 00                	add    %al,(%rax)
ffff80000010d2fe:	00 00                	add    %al,(%rax)
ffff80000010d300:	01 7a 52             	add    %edi,0x52(%rdx)
ffff80000010d303:	00 01                	add    %al,(%rcx)
ffff80000010d305:	78 10                	js     ffff80000010d317 <_erodata+0x26>
ffff80000010d307:	01 1b                	add    %ebx,(%rbx)
ffff80000010d309:	0c 07                	or     $0x7,%al
ffff80000010d30b:	08 90 01 00 00 1c    	or     %dl,0x1c000001(%rax)
ffff80000010d311:	00 00                	add    %al,(%rax)
ffff80000010d313:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010d316:	00 00                	add    %al,(%rax)
ffff80000010d318:	5f                   	pop    %rdi
ffff80000010d319:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d31a:	ff                   	(bad)  
ffff80000010d31b:	ff aa 00 00 00 00    	ljmp   *0x0(%rdx)
ffff80000010d321:	41 0e                	rex.B (bad) 
ffff80000010d323:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d329:	02 a5 0c 07 08 00    	add    0x8070c(%rbp),%ah
ffff80000010d32f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010d332:	00 00                	add    %al,(%rax)
ffff80000010d334:	3c 00                	cmp    $0x0,%al
ffff80000010d336:	00 00                	add    %al,(%rax)
ffff80000010d338:	e9 6f ff ff 53       	jmpq   ffff80005410d2ac <_end+0x53fe3e54>
ffff80000010d33d:	00 00                	add    %al,(%rax)
ffff80000010d33f:	00 00                	add    %al,(%rax)
ffff80000010d341:	41 0e                	rex.B (bad) 
ffff80000010d343:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d349:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010d34c:	07                   	(bad)  
ffff80000010d34d:	08 00                	or     %al,(%rax)
ffff80000010d34f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010d352:	00 00                	add    %al,(%rax)
ffff80000010d354:	5c                   	pop    %rsp
ffff80000010d355:	00 00                	add    %al,(%rax)
ffff80000010d357:	00 1c 70             	add    %bl,(%rax,%rsi,2)
ffff80000010d35a:	ff                   	(bad)  
ffff80000010d35b:	ff 53 00             	callq  *0x0(%rbx)
ffff80000010d35e:	00 00                	add    %al,(%rax)
ffff80000010d360:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010d363:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d369:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010d36c:	07                   	(bad)  
ffff80000010d36d:	08 00                	or     %al,(%rax)
ffff80000010d36f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010d372:	00 00                	add    %al,(%rax)
ffff80000010d374:	7c 00                	jl     ffff80000010d376 <_erodata+0x85>
ffff80000010d376:	00 00                	add    %al,(%rax)
ffff80000010d378:	4f 70 ff             	rex.WRXB jo ffff80000010d37a <_erodata+0x89>
ffff80000010d37b:	ff 53 00             	callq  *0x0(%rbx)
ffff80000010d37e:	00 00                	add    %al,(%rax)
ffff80000010d380:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010d383:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d389:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010d38c:	07                   	(bad)  
ffff80000010d38d:	08 00                	or     %al,(%rax)
ffff80000010d38f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010d392:	00 00                	add    %al,(%rax)
ffff80000010d394:	9c                   	pushfq 
ffff80000010d395:	00 00                	add    %al,(%rax)
ffff80000010d397:	00 82 70 ff ff 53    	add    %al,0x53ffff70(%rdx)
ffff80000010d39d:	00 00                	add    %al,(%rax)
ffff80000010d39f:	00 00                	add    %al,(%rax)
ffff80000010d3a1:	41 0e                	rex.B (bad) 
ffff80000010d3a3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d3a9:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010d3ac:	07                   	(bad)  
ffff80000010d3ad:	08 00                	or     %al,(%rax)
ffff80000010d3af:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010d3b2:	00 00                	add    %al,(%rax)
ffff80000010d3b4:	bc 00 00 00 b5       	mov    $0xb5000000,%esp
ffff80000010d3b9:	70 ff                	jo     ffff80000010d3ba <_erodata+0xc9>
ffff80000010d3bb:	ff 15 01 00 00 00    	callq  *0x1(%rip)        # ffff80000010d3c2 <_erodata+0xd1>
ffff80000010d3c1:	41 0e                	rex.B (bad) 
ffff80000010d3c3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d3c9:	03 10                	add    (%rax),%edx
ffff80000010d3cb:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff80000010d3ce:	08 00                	or     %al,(%rax)
ffff80000010d3d0:	1c 00                	sbb    $0x0,%al
ffff80000010d3d2:	00 00                	add    %al,(%rax)
ffff80000010d3d4:	dc 00                	faddl  (%rax)
ffff80000010d3d6:	00 00                	add    %al,(%rax)
ffff80000010d3d8:	aa                   	stos   %al,%es:(%rdi)
ffff80000010d3d9:	71 ff                	jno    ffff80000010d3da <_erodata+0xe9>
ffff80000010d3db:	ff 34 00             	pushq  (%rax,%rax,1)
ffff80000010d3de:	00 00                	add    %al,(%rax)
ffff80000010d3e0:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010d3e3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d3e9:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d3ea:	0c 07                	or     $0x7,%al
ffff80000010d3ec:	08 00                	or     %al,(%rax)
ffff80000010d3ee:	00 00                	add    %al,(%rax)
ffff80000010d3f0:	20 00                	and    %al,(%rax)
ffff80000010d3f2:	00 00                	add    %al,(%rax)
ffff80000010d3f4:	fc                   	cld    
ffff80000010d3f5:	00 00                	add    %al,(%rax)
ffff80000010d3f7:	00 be 71 ff ff 6f    	add    %bh,0x6fffff71(%rsi)
ffff80000010d3fd:	00 00                	add    %al,(%rax)
ffff80000010d3ff:	00 00                	add    %al,(%rax)
ffff80000010d401:	41 0e                	rex.B (bad) 
ffff80000010d403:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d409:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010d40c:	02 64 0c 07          	add    0x7(%rsp,%rcx,1),%ah
ffff80000010d410:	08 00                	or     %al,(%rax)
ffff80000010d412:	00 00                	add    %al,(%rax)
ffff80000010d414:	20 00                	and    %al,(%rax)
ffff80000010d416:	00 00                	add    %al,(%rax)
ffff80000010d418:	20 01                	and    %al,(%rcx)
ffff80000010d41a:	00 00                	add    %al,(%rax)
ffff80000010d41c:	09 72 ff             	or     %esi,-0x1(%rdx)
ffff80000010d41f:	ff 5c 00 00          	lcall  *0x0(%rax,%rax,1)
ffff80000010d423:	00 00                	add    %al,(%rax)
ffff80000010d425:	41 0e                	rex.B (bad) 
ffff80000010d427:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d42d:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010d430:	02 51 0c             	add    0xc(%rcx),%dl
ffff80000010d433:	07                   	(bad)  
ffff80000010d434:	08 00                	or     %al,(%rax)
ffff80000010d436:	00 00                	add    %al,(%rax)
ffff80000010d438:	1c 00                	sbb    $0x0,%al
ffff80000010d43a:	00 00                	add    %al,(%rax)
ffff80000010d43c:	44 01 00             	add    %r8d,(%rax)
ffff80000010d43f:	00 41 72             	add    %al,0x72(%rcx)
ffff80000010d442:	ff                   	(bad)  
ffff80000010d443:	ff 1e                	lcall  *(%rsi)
ffff80000010d445:	02 00                	add    (%rax),%al
ffff80000010d447:	00 00                	add    %al,(%rax)
ffff80000010d449:	41 0e                	rex.B (bad) 
ffff80000010d44b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d451:	43 8f 03             	rex.XB popq (%r11)
ffff80000010d454:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
ffff80000010d458:	1c 00                	sbb    $0x0,%al
ffff80000010d45a:	00 00                	add    %al,(%rax)
ffff80000010d45c:	64 01 00             	add    %eax,%fs:(%rax)
ffff80000010d45f:	00 3f                	add    %bh,(%rdi)
ffff80000010d461:	74 ff                	je     ffff80000010d462 <_erodata+0x171>
ffff80000010d463:	ff 07                	incl   (%rdi)
ffff80000010d465:	01 00                	add    %eax,(%rax)
ffff80000010d467:	00 00                	add    %al,(%rax)
ffff80000010d469:	41 0e                	rex.B (bad) 
ffff80000010d46b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d471:	03 02                	add    (%rdx),%eax
ffff80000010d473:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff80000010d476:	08 00                	or     %al,(%rax)
ffff80000010d478:	1c 00                	sbb    $0x0,%al
ffff80000010d47a:	00 00                	add    %al,(%rax)
ffff80000010d47c:	84 01                	test   %al,(%rcx)
ffff80000010d47e:	00 00                	add    %al,(%rax)
ffff80000010d480:	26 75 ff             	es jne ffff80000010d482 <_erodata+0x191>
ffff80000010d483:	ff 06                	incl   (%rsi)
ffff80000010d485:	01 00                	add    %eax,(%rax)
ffff80000010d487:	00 00                	add    %al,(%rax)
ffff80000010d489:	41 0e                	rex.B (bad) 
ffff80000010d48b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d491:	03 01                	add    (%rcx),%eax
ffff80000010d493:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff80000010d496:	08 00                	or     %al,(%rax)
ffff80000010d498:	20 00                	and    %al,(%rax)
ffff80000010d49a:	00 00                	add    %al,(%rax)
ffff80000010d49c:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
ffff80000010d49d:	01 00                	add    %eax,(%rax)
ffff80000010d49f:	00 0c 76             	add    %cl,(%rsi,%rsi,2)
ffff80000010d4a2:	ff                   	(bad)  
ffff80000010d4a3:	ff c7                	inc    %edi
ffff80000010d4a5:	03 00                	add    (%rax),%eax
ffff80000010d4a7:	00 00                	add    %al,(%rax)
ffff80000010d4a9:	41 0e                	rex.B (bad) 
ffff80000010d4ab:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d4b1:	45 83 03 03          	rex.RB addl $0x3,(%r11)
ffff80000010d4b5:	bd 03 0c 07 08       	mov    $0x8070c03,%ebp
ffff80000010d4ba:	00 00                	add    %al,(%rax)
ffff80000010d4bc:	20 00                	and    %al,(%rax)
ffff80000010d4be:	00 00                	add    %al,(%rax)
ffff80000010d4c0:	c8 01 00 00          	enterq $0x1,$0x0
ffff80000010d4c4:	af                   	scas   %es:(%rdi),%eax
ffff80000010d4c5:	79 ff                	jns    ffff80000010d4c6 <_erodata+0x1d5>
ffff80000010d4c7:	ff 9a 03 00 00 00    	lcall  *0x3(%rdx)
ffff80000010d4cd:	41 0e                	rex.B (bad) 
ffff80000010d4cf:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d4d5:	48 83 03 03          	addq   $0x3,(%rbx)
ffff80000010d4d9:	8d 03                	lea    (%rbx),%eax
ffff80000010d4db:	0c 07                	or     $0x7,%al
ffff80000010d4dd:	08 00                	or     %al,(%rax)
ffff80000010d4df:	00 18                	add    %bl,(%rax)
ffff80000010d4e1:	00 00                	add    %al,(%rax)
ffff80000010d4e3:	00 ec                	add    %ch,%ah
ffff80000010d4e5:	01 00                	add    %eax,(%rax)
ffff80000010d4e7:	00 25 7d ff ff 83    	add    %ah,-0x7c000083(%rip)        # ffff7fff8410d46a <OLDSS+0xffff7fff8410d3b2>
ffff80000010d4ed:	00 00                	add    %al,(%rax)
ffff80000010d4ef:	00 00                	add    %al,(%rax)
ffff80000010d4f1:	41 0e                	rex.B (bad) 
ffff80000010d4f3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d4f9:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010d4fc:	18 00                	sbb    %al,(%rax)
ffff80000010d4fe:	00 00                	add    %al,(%rax)
ffff80000010d500:	08 02                	or     %al,(%rdx)
ffff80000010d502:	00 00                	add    %al,(%rax)
ffff80000010d504:	8c 7d ff             	mov    %?,-0x1(%rbp)
ffff80000010d507:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010d50d:	41 0e                	rex.B (bad) 
ffff80000010d50f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d515:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010d518:	18 00                	sbb    %al,(%rax)
ffff80000010d51a:	00 00                	add    %al,(%rax)
ffff80000010d51c:	24 02                	and    $0x2,%al
ffff80000010d51e:	00 00                	add    %al,(%rax)
ffff80000010d520:	f6 7d ff             	idivb  -0x1(%rbp)
ffff80000010d523:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010d529:	41 0e                	rex.B (bad) 
ffff80000010d52b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d531:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010d534:	18 00                	sbb    %al,(%rax)
ffff80000010d536:	00 00                	add    %al,(%rax)
ffff80000010d538:	40 02 00             	add    (%rax),%al
ffff80000010d53b:	00 60 7e             	add    %ah,0x7e(%rax)
ffff80000010d53e:	ff                   	(bad)  
ffff80000010d53f:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010d545:	41 0e                	rex.B (bad) 
ffff80000010d547:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d54d:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010d550:	18 00                	sbb    %al,(%rax)
ffff80000010d552:	00 00                	add    %al,(%rax)
ffff80000010d554:	5c                   	pop    %rsp
ffff80000010d555:	02 00                	add    (%rax),%al
ffff80000010d557:	00 ca                	add    %cl,%dl
ffff80000010d559:	7e ff                	jle    ffff80000010d55a <_erodata+0x269>
ffff80000010d55b:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010d561:	41 0e                	rex.B (bad) 
ffff80000010d563:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d569:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010d56c:	18 00                	sbb    %al,(%rax)
ffff80000010d56e:	00 00                	add    %al,(%rax)
ffff80000010d570:	78 02                	js     ffff80000010d574 <_erodata+0x283>
ffff80000010d572:	00 00                	add    %al,(%rax)
ffff80000010d574:	34 7f                	xor    $0x7f,%al
ffff80000010d576:	ff                   	(bad)  
ffff80000010d577:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010d57d:	41 0e                	rex.B (bad) 
ffff80000010d57f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d585:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010d588:	18 00                	sbb    %al,(%rax)
ffff80000010d58a:	00 00                	add    %al,(%rax)
ffff80000010d58c:	94                   	xchg   %eax,%esp
ffff80000010d58d:	02 00                	add    (%rax),%al
ffff80000010d58f:	00 9e 7f ff ff 86    	add    %bl,-0x79000081(%rsi)
ffff80000010d595:	00 00                	add    %al,(%rax)
ffff80000010d597:	00 00                	add    %al,(%rax)
ffff80000010d599:	41 0e                	rex.B (bad) 
ffff80000010d59b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d5a1:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010d5a4:	18 00                	sbb    %al,(%rax)
ffff80000010d5a6:	00 00                	add    %al,(%rax)
ffff80000010d5a8:	b0 02                	mov    $0x2,%al
ffff80000010d5aa:	00 00                	add    %al,(%rax)
ffff80000010d5ac:	08 80 ff ff 86 00    	or     %al,0x86ffff(%rax)
ffff80000010d5b2:	00 00                	add    %al,(%rax)
ffff80000010d5b4:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010d5b7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d5bd:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010d5c0:	18 00                	sbb    %al,(%rax)
ffff80000010d5c2:	00 00                	add    %al,(%rax)
ffff80000010d5c4:	cc                   	int3   
ffff80000010d5c5:	02 00                	add    (%rax),%al
ffff80000010d5c7:	00 72 80             	add    %dh,-0x80(%rdx)
ffff80000010d5ca:	ff                   	(bad)  
ffff80000010d5cb:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010d5d1:	41 0e                	rex.B (bad) 
ffff80000010d5d3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d5d9:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010d5dc:	18 00                	sbb    %al,(%rax)
ffff80000010d5de:	00 00                	add    %al,(%rax)
ffff80000010d5e0:	e8 02 00 00 dc       	callq  ffff7fffdc10d5e7 <OLDSS+0xffff7fffdc10d52f>
ffff80000010d5e5:	80 ff ff             	cmp    $0xff,%bh
ffff80000010d5e8:	86 00                	xchg   %al,(%rax)
ffff80000010d5ea:	00 00                	add    %al,(%rax)
ffff80000010d5ec:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010d5ef:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d5f5:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010d5f8:	1c 00                	sbb    $0x0,%al
ffff80000010d5fa:	00 00                	add    %al,(%rax)
ffff80000010d5fc:	04 03                	add    $0x3,%al
ffff80000010d5fe:	00 00                	add    %al,(%rax)
ffff80000010d600:	46 81 ff ff e2 01 00 	rex.RX cmp $0x1e2ff,%edi
ffff80000010d607:	00 00                	add    %al,(%rax)
ffff80000010d609:	41 0e                	rex.B (bad) 
ffff80000010d60b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d611:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010d614:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
ffff80000010d618:	1c 00                	sbb    $0x0,%al
ffff80000010d61a:	00 00                	add    %al,(%rax)
ffff80000010d61c:	24 03                	and    $0x3,%al
ffff80000010d61e:	00 00                	add    %al,(%rax)
ffff80000010d620:	08 83 ff ff e2 01    	or     %al,0x1e2ffff(%rbx)
ffff80000010d626:	00 00                	add    %al,(%rax)
ffff80000010d628:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010d62b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d631:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010d634:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
ffff80000010d638:	1c 00                	sbb    $0x0,%al
ffff80000010d63a:	00 00                	add    %al,(%rax)
ffff80000010d63c:	44 03 00             	add    (%rax),%r8d
ffff80000010d63f:	00 ca                	add    %cl,%dl
ffff80000010d641:	84 ff                	test   %bh,%bh
ffff80000010d643:	ff e2                	jmpq   *%rdx
ffff80000010d645:	01 00                	add    %eax,(%rax)
ffff80000010d647:	00 00                	add    %al,(%rax)
ffff80000010d649:	41 0e                	rex.B (bad) 
ffff80000010d64b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d651:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010d654:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
ffff80000010d658:	1c 00                	sbb    $0x0,%al
ffff80000010d65a:	00 00                	add    %al,(%rax)
ffff80000010d65c:	64 03 00             	add    %fs:(%rax),%eax
ffff80000010d65f:	00 8c 86 ff ff e2 01 	add    %cl,0x1e2ffff(%rsi,%rax,4)
ffff80000010d666:	00 00                	add    %al,(%rax)
ffff80000010d668:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010d66b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d671:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010d674:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
ffff80000010d678:	1c 00                	sbb    $0x0,%al
ffff80000010d67a:	00 00                	add    %al,(%rax)
ffff80000010d67c:	84 03                	test   %al,(%rbx)
ffff80000010d67e:	00 00                	add    %al,(%rax)
ffff80000010d680:	4e 88 ff             	rex.WRX mov %r15b,%dil
ffff80000010d683:	ff 56 02             	callq  *0x2(%rsi)
ffff80000010d686:	00 00                	add    %al,(%rax)
ffff80000010d688:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010d68b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d691:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010d694:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
ffff80000010d698:	18 00                	sbb    %al,(%rax)
ffff80000010d69a:	00 00                	add    %al,(%rax)
ffff80000010d69c:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
ffff80000010d69d:	03 00                	add    (%rax),%eax
ffff80000010d69f:	00 84 8a ff ff 86 00 	add    %al,0x86ffff(%rdx,%rcx,4)
ffff80000010d6a6:	00 00                	add    %al,(%rax)
ffff80000010d6a8:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010d6ab:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d6b1:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010d6b4:	18 00                	sbb    %al,(%rax)
ffff80000010d6b6:	00 00                	add    %al,(%rax)
ffff80000010d6b8:	c0 03 00             	rolb   $0x0,(%rbx)
ffff80000010d6bb:	00 ee                	add    %ch,%dh
ffff80000010d6bd:	8a ff                	mov    %bh,%bh
ffff80000010d6bf:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010d6c5:	41 0e                	rex.B (bad) 
ffff80000010d6c7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d6cd:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010d6d0:	18 00                	sbb    %al,(%rax)
ffff80000010d6d2:	00 00                	add    %al,(%rax)
ffff80000010d6d4:	dc 03                	faddl  (%rbx)
ffff80000010d6d6:	00 00                	add    %al,(%rax)
ffff80000010d6d8:	58                   	pop    %rax
ffff80000010d6d9:	8b ff                	mov    %edi,%edi
ffff80000010d6db:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010d6e1:	41 0e                	rex.B (bad) 
ffff80000010d6e3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d6e9:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010d6ec:	18 00                	sbb    %al,(%rax)
ffff80000010d6ee:	00 00                	add    %al,(%rax)
ffff80000010d6f0:	f8                   	clc    
ffff80000010d6f1:	03 00                	add    (%rax),%eax
ffff80000010d6f3:	00 c2                	add    %al,%dl
ffff80000010d6f5:	8b ff                	mov    %edi,%edi
ffff80000010d6f7:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010d6fd:	41 0e                	rex.B (bad) 
ffff80000010d6ff:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d705:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010d708:	18 00                	sbb    %al,(%rax)
ffff80000010d70a:	00 00                	add    %al,(%rax)
ffff80000010d70c:	14 04                	adc    $0x4,%al
ffff80000010d70e:	00 00                	add    %al,(%rax)
ffff80000010d710:	2c 8c                	sub    $0x8c,%al
ffff80000010d712:	ff                   	(bad)  
ffff80000010d713:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010d719:	41 0e                	rex.B (bad) 
ffff80000010d71b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d721:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010d724:	20 00                	and    %al,(%rax)
ffff80000010d726:	00 00                	add    %al,(%rax)
ffff80000010d728:	30 04 00             	xor    %al,(%rax,%rax,1)
ffff80000010d72b:	00 96 8c ff ff 09    	add    %dl,0x9ffff8c(%rsi)
ffff80000010d731:	04 00                	add    $0x0,%al
ffff80000010d733:	00 00                	add    %al,(%rax)
ffff80000010d735:	41 0e                	rex.B (bad) 
ffff80000010d737:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d73d:	43 8f 03             	rex.XB popq (%r11)
ffff80000010d740:	83 04 03 01          	addl   $0x1,(%rbx,%rax,1)
ffff80000010d744:	04 0c                	add    $0xc,%al
ffff80000010d746:	07                   	(bad)  
ffff80000010d747:	08 1c 00             	or     %bl,(%rax,%rax,1)
ffff80000010d74a:	00 00                	add    %al,(%rax)
ffff80000010d74c:	54                   	push   %rsp
ffff80000010d74d:	04 00                	add    $0x0,%al
ffff80000010d74f:	00 7b 90             	add    %bh,-0x70(%rbx)
ffff80000010d752:	ff                   	(bad)  
ffff80000010d753:	ff                   	(bad)  
ffff80000010d754:	ed                   	in     (%dx),%eax
ffff80000010d755:	01 00                	add    %eax,(%rax)
ffff80000010d757:	00 00                	add    %al,(%rax)
ffff80000010d759:	41 0e                	rex.B (bad) 
ffff80000010d75b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d761:	03 e8                	add    %eax,%ebp
ffff80000010d763:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff80000010d766:	08 00                	or     %al,(%rax)
ffff80000010d768:	20 00                	and    %al,(%rax)
ffff80000010d76a:	00 00                	add    %al,(%rax)
ffff80000010d76c:	74 04                	je     ffff80000010d772 <_erodata+0x481>
ffff80000010d76e:	00 00                	add    %al,(%rax)
ffff80000010d770:	48 92                	xchg   %rax,%rdx
ffff80000010d772:	ff                   	(bad)  
ffff80000010d773:	ff 0b                	decl   (%rbx)
ffff80000010d775:	0e                   	(bad)  
ffff80000010d776:	00 00                	add    %al,(%rax)
ffff80000010d778:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010d77b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d781:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010d784:	83 04 03 ff          	addl   $0xffffffff,(%rbx,%rax,1)
ffff80000010d788:	0d 0c 07 08 20       	or     $0x2008070c,%eax
ffff80000010d78d:	00 00                	add    %al,(%rax)
ffff80000010d78f:	00 98 04 00 00 2f    	add    %bl,0x2f000004(%rax)
ffff80000010d795:	a0 ff ff 92 03 00 00 	movabs 0x410000000392ffff,%al
ffff80000010d79c:	00 41 
ffff80000010d79e:	0e                   	(bad)  
ffff80000010d79f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d7a5:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010d7a8:	83 04 03 86          	addl   $0xffffff86,(%rbx,%rax,1)
ffff80000010d7ac:	03 0c 07             	add    (%rdi,%rax,1),%ecx
ffff80000010d7af:	08 1c 00             	or     %bl,(%rax,%rax,1)
ffff80000010d7b2:	00 00                	add    %al,(%rax)
ffff80000010d7b4:	bc 04 00 00 9d       	mov    $0x9d000004,%esp
ffff80000010d7b9:	a3 ff ff 57 00 00 00 	movabs %eax,0x410000000057ffff
ffff80000010d7c0:	00 41 
ffff80000010d7c2:	0e                   	(bad)  
ffff80000010d7c3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d7c9:	02 52 0c             	add    0xc(%rdx),%dl
ffff80000010d7cc:	07                   	(bad)  
ffff80000010d7cd:	08 00                	or     %al,(%rax)
ffff80000010d7cf:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010d7d2:	00 00                	add    %al,(%rax)
ffff80000010d7d4:	dc 04 00             	faddl  (%rax,%rax,1)
ffff80000010d7d7:	00 d4                	add    %dl,%ah
ffff80000010d7d9:	a3 ff ff 6a 00 00 00 	movabs %eax,0x41000000006affff
ffff80000010d7e0:	00 41 
ffff80000010d7e2:	0e                   	(bad)  
ffff80000010d7e3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d7e9:	02 65 0c             	add    0xc(%rbp),%ah
ffff80000010d7ec:	07                   	(bad)  
ffff80000010d7ed:	08 00                	or     %al,(%rax)
ffff80000010d7ef:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010d7f2:	00 00                	add    %al,(%rax)
ffff80000010d7f4:	fc                   	cld    
ffff80000010d7f5:	04 00                	add    $0x0,%al
ffff80000010d7f7:	00 1e                	add    %bl,(%rsi)
ffff80000010d7f9:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
ffff80000010d7fa:	ff                   	(bad)  
ffff80000010d7fb:	ff 25 00 00 00 00    	jmpq   *0x0(%rip)        # ffff80000010d801 <_erodata+0x510>
ffff80000010d801:	41 0e                	rex.B (bad) 
ffff80000010d803:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d809:	60                   	(bad)  
ffff80000010d80a:	0c 07                	or     $0x7,%al
ffff80000010d80c:	08 00                	or     %al,(%rax)
ffff80000010d80e:	00 00                	add    %al,(%rax)
ffff80000010d810:	1c 00                	sbb    $0x0,%al
ffff80000010d812:	00 00                	add    %al,(%rax)
ffff80000010d814:	1c 05                	sbb    $0x5,%al
ffff80000010d816:	00 00                	add    %al,(%rax)
ffff80000010d818:	23 a4 ff ff 25 00 00 	and    0x25ff(%rdi,%rdi,8),%esp
ffff80000010d81f:	00 00                	add    %al,(%rax)
ffff80000010d821:	41 0e                	rex.B (bad) 
ffff80000010d823:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d829:	60                   	(bad)  
ffff80000010d82a:	0c 07                	or     $0x7,%al
ffff80000010d82c:	08 00                	or     %al,(%rax)
ffff80000010d82e:	00 00                	add    %al,(%rax)
ffff80000010d830:	1c 00                	sbb    $0x0,%al
ffff80000010d832:	00 00                	add    %al,(%rax)
ffff80000010d834:	3c 05                	cmp    $0x5,%al
ffff80000010d836:	00 00                	add    %al,(%rax)
ffff80000010d838:	28 a4 ff ff 32 00 00 	sub    %ah,0x32ff(%rdi,%rdi,8)
ffff80000010d83f:	00 00                	add    %al,(%rax)
ffff80000010d841:	41 0e                	rex.B (bad) 
ffff80000010d843:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d849:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000010d84a:	0c 07                	or     $0x7,%al
ffff80000010d84c:	08 00                	or     %al,(%rax)
ffff80000010d84e:	00 00                	add    %al,(%rax)
ffff80000010d850:	1c 00                	sbb    $0x0,%al
ffff80000010d852:	00 00                	add    %al,(%rax)
ffff80000010d854:	5c                   	pop    %rsp
ffff80000010d855:	05 00 00 3a a4       	add    $0xa43a0000,%eax
ffff80000010d85a:	ff                   	(bad)  
ffff80000010d85b:	ff 35 00 00 00 00    	pushq  0x0(%rip)        # ffff80000010d861 <_erodata+0x570>
ffff80000010d861:	41 0e                	rex.B (bad) 
ffff80000010d863:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d869:	70 0c                	jo     ffff80000010d877 <_erodata+0x586>
ffff80000010d86b:	07                   	(bad)  
ffff80000010d86c:	08 00                	or     %al,(%rax)
ffff80000010d86e:	00 00                	add    %al,(%rax)
ffff80000010d870:	1c 00                	sbb    $0x0,%al
ffff80000010d872:	00 00                	add    %al,(%rax)
ffff80000010d874:	7c 05                	jl     ffff80000010d87b <_erodata+0x58a>
ffff80000010d876:	00 00                	add    %al,(%rax)
ffff80000010d878:	4f a4                	rex.WRXB movsb %ds:(%rsi),%es:(%rdi)
ffff80000010d87a:	ff                   	(bad)  
ffff80000010d87b:	ff 36                	pushq  (%rsi)
ffff80000010d87d:	00 00                	add    %al,(%rax)
ffff80000010d87f:	00 00                	add    %al,(%rax)
ffff80000010d881:	41 0e                	rex.B (bad) 
ffff80000010d883:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d889:	71 0c                	jno    ffff80000010d897 <_erodata+0x5a6>
ffff80000010d88b:	07                   	(bad)  
ffff80000010d88c:	08 00                	or     %al,(%rax)
ffff80000010d88e:	00 00                	add    %al,(%rax)
ffff80000010d890:	1c 00                	sbb    $0x0,%al
ffff80000010d892:	00 00                	add    %al,(%rax)
ffff80000010d894:	9c                   	pushfq 
ffff80000010d895:	05 00 00 65 a4       	add    $0xa4650000,%eax
ffff80000010d89a:	ff                   	(bad)  
ffff80000010d89b:	ff 59 00             	lcall  *0x0(%rcx)
ffff80000010d89e:	00 00                	add    %al,(%rax)
ffff80000010d8a0:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010d8a3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d8a9:	02 54 0c 07          	add    0x7(%rsp,%rcx,1),%dl
ffff80000010d8ad:	08 00                	or     %al,(%rax)
ffff80000010d8af:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010d8b2:	00 00                	add    %al,(%rax)
ffff80000010d8b4:	bc 05 00 00 9e       	mov    $0x9e000005,%esp
ffff80000010d8b9:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
ffff80000010d8ba:	ff                   	(bad)  
ffff80000010d8bb:	ff 57 00             	callq  *0x0(%rdi)
ffff80000010d8be:	00 00                	add    %al,(%rax)
ffff80000010d8c0:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010d8c3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d8c9:	02 52 0c             	add    0xc(%rdx),%dl
ffff80000010d8cc:	07                   	(bad)  
ffff80000010d8cd:	08 00                	or     %al,(%rax)
ffff80000010d8cf:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010d8d2:	00 00                	add    %al,(%rax)
ffff80000010d8d4:	dc 05 00 00 d5 a4    	faddl  -0x5b2b0000(%rip)        # ffff7fffa4e5d8da <OLDSS+0xffff7fffa4e5d822>
ffff80000010d8da:	ff                   	(bad)  
ffff80000010d8db:	ff 44 00 00          	incl   0x0(%rax,%rax,1)
ffff80000010d8df:	00 00                	add    %al,(%rax)
ffff80000010d8e1:	41 0e                	rex.B (bad) 
ffff80000010d8e3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d8e9:	7f 0c                	jg     ffff80000010d8f7 <_erodata+0x606>
ffff80000010d8eb:	07                   	(bad)  
ffff80000010d8ec:	08 00                	or     %al,(%rax)
ffff80000010d8ee:	00 00                	add    %al,(%rax)
ffff80000010d8f0:	1c 00                	sbb    $0x0,%al
ffff80000010d8f2:	00 00                	add    %al,(%rax)
ffff80000010d8f4:	fc                   	cld    
ffff80000010d8f5:	05 00 00 f9 a4       	add    $0xa4f90000,%eax
ffff80000010d8fa:	ff                   	(bad)  
ffff80000010d8fb:	ff 45 00             	incl   0x0(%rbp)
ffff80000010d8fe:	00 00                	add    %al,(%rax)
ffff80000010d900:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010d903:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d909:	02 40 0c             	add    0xc(%rax),%al
ffff80000010d90c:	07                   	(bad)  
ffff80000010d90d:	08 00                	or     %al,(%rax)
ffff80000010d90f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010d912:	00 00                	add    %al,(%rax)
ffff80000010d914:	1c 06                	sbb    $0x6,%al
ffff80000010d916:	00 00                	add    %al,(%rax)
ffff80000010d918:	1e                   	(bad)  
ffff80000010d919:	a5                   	movsl  %ds:(%rsi),%es:(%rdi)
ffff80000010d91a:	ff                   	(bad)  
ffff80000010d91b:	ff                   	(bad)  
ffff80000010d91c:	3a 00                	cmp    (%rax),%al
ffff80000010d91e:	00 00                	add    %al,(%rax)
ffff80000010d920:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010d923:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d929:	75 0c                	jne    ffff80000010d937 <_erodata+0x646>
ffff80000010d92b:	07                   	(bad)  
ffff80000010d92c:	08 00                	or     %al,(%rax)
ffff80000010d92e:	00 00                	add    %al,(%rax)
ffff80000010d930:	1c 00                	sbb    $0x0,%al
ffff80000010d932:	00 00                	add    %al,(%rax)
ffff80000010d934:	3c 06                	cmp    $0x6,%al
ffff80000010d936:	00 00                	add    %al,(%rax)
ffff80000010d938:	38 a5 ff ff 3a 00    	cmp    %ah,0x3affff(%rbp)
ffff80000010d93e:	00 00                	add    %al,(%rax)
ffff80000010d940:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010d943:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d949:	75 0c                	jne    ffff80000010d957 <_erodata+0x666>
ffff80000010d94b:	07                   	(bad)  
ffff80000010d94c:	08 00                	or     %al,(%rax)
ffff80000010d94e:	00 00                	add    %al,(%rax)
ffff80000010d950:	20 00                	and    %al,(%rax)
ffff80000010d952:	00 00                	add    %al,(%rax)
ffff80000010d954:	5c                   	pop    %rsp
ffff80000010d955:	06                   	(bad)  
ffff80000010d956:	00 00                	add    %al,(%rax)
ffff80000010d958:	42 ac                	rex.X lods %ds:(%rsi),%al
ffff80000010d95a:	ff                   	(bad)  
ffff80000010d95b:	ff                   	(bad)  
ffff80000010d95c:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010d961:	41 0e                	rex.B (bad) 
ffff80000010d963:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d969:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010d96c:	83 04 03 b2          	addl   $0xffffffb2,(%rbx,%rax,1)
ffff80000010d970:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff80000010d973:	08 20                	or     %ah,(%rax)
ffff80000010d975:	00 00                	add    %al,(%rax)
ffff80000010d977:	00 80 06 00 00 dc    	add    %al,-0x23fffffa(%rax)
ffff80000010d97d:	ad                   	lods   %ds:(%rsi),%eax
ffff80000010d97e:	ff                   	(bad)  
ffff80000010d97f:	ff a2 00 00 00 00    	jmpq   *0x0(%rdx)
ffff80000010d985:	41 0e                	rex.B (bad) 
ffff80000010d987:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d98d:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010d990:	83 04 02 96          	addl   $0xffffff96,(%rdx,%rax,1)
ffff80000010d994:	0c 07                	or     $0x7,%al
ffff80000010d996:	08 00                	or     %al,(%rax)
ffff80000010d998:	1c 00                	sbb    $0x0,%al
ffff80000010d99a:	00 00                	add    %al,(%rax)
ffff80000010d99c:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
ffff80000010d99d:	06                   	(bad)  
ffff80000010d99e:	00 00                	add    %al,(%rax)
ffff80000010d9a0:	5a                   	pop    %rdx
ffff80000010d9a1:	ae                   	scas   %es:(%rdi),%al
ffff80000010d9a2:	ff                   	(bad)  
ffff80000010d9a3:	ff 34 00             	pushq  (%rax,%rax,1)
ffff80000010d9a6:	00 00                	add    %al,(%rax)
ffff80000010d9a8:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010d9ab:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d9b1:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d9b2:	0c 07                	or     $0x7,%al
ffff80000010d9b4:	08 00                	or     %al,(%rax)
ffff80000010d9b6:	00 00                	add    %al,(%rax)
ffff80000010d9b8:	20 00                	and    %al,(%rax)
ffff80000010d9ba:	00 00                	add    %al,(%rax)
ffff80000010d9bc:	c4                   	(bad)  
ffff80000010d9bd:	06                   	(bad)  
ffff80000010d9be:	00 00                	add    %al,(%rax)
ffff80000010d9c0:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d9c1:	ae                   	scas   %es:(%rdi),%al
ffff80000010d9c2:	ff                   	(bad)  
ffff80000010d9c3:	ff 6f 00             	ljmp   *0x0(%rdi)
ffff80000010d9c6:	00 00                	add    %al,(%rax)
ffff80000010d9c8:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010d9cb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d9d1:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010d9d4:	02 64 0c 07          	add    0x7(%rsp,%rcx,1),%ah
ffff80000010d9d8:	08 00                	or     %al,(%rax)
ffff80000010d9da:	00 00                	add    %al,(%rax)
ffff80000010d9dc:	20 00                	and    %al,(%rax)
ffff80000010d9de:	00 00                	add    %al,(%rax)
ffff80000010d9e0:	e8 06 00 00 b9       	callq  ffff7fffb910d9eb <OLDSS+0xffff7fffb910d933>
ffff80000010d9e5:	ae                   	scas   %es:(%rdi),%al
ffff80000010d9e6:	ff                   	(bad)  
ffff80000010d9e7:	ff 5c 00 00          	lcall  *0x0(%rax,%rax,1)
ffff80000010d9eb:	00 00                	add    %al,(%rax)
ffff80000010d9ed:	41 0e                	rex.B (bad) 
ffff80000010d9ef:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d9f5:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010d9f8:	02 51 0c             	add    0xc(%rcx),%dl
ffff80000010d9fb:	07                   	(bad)  
ffff80000010d9fc:	08 00                	or     %al,(%rax)
ffff80000010d9fe:	00 00                	add    %al,(%rax)
ffff80000010da00:	1c 00                	sbb    $0x0,%al
ffff80000010da02:	00 00                	add    %al,(%rax)
ffff80000010da04:	0c 07                	or     $0x7,%al
ffff80000010da06:	00 00                	add    %al,(%rax)
ffff80000010da08:	f1                   	icebp  
ffff80000010da09:	ae                   	scas   %es:(%rdi),%al
ffff80000010da0a:	ff                   	(bad)  
ffff80000010da0b:	ff aa 00 00 00 00    	ljmp   *0x0(%rdx)
ffff80000010da11:	41 0e                	rex.B (bad) 
ffff80000010da13:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010da19:	02 a5 0c 07 08 00    	add    0x8070c(%rbp),%ah
ffff80000010da1f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010da22:	00 00                	add    %al,(%rax)
ffff80000010da24:	2c 07                	sub    $0x7,%al
ffff80000010da26:	00 00                	add    %al,(%rax)
ffff80000010da28:	7b af                	jnp    ffff80000010d9d9 <_erodata+0x6e8>
ffff80000010da2a:	ff                   	(bad)  
ffff80000010da2b:	ff 53 00             	callq  *0x0(%rbx)
ffff80000010da2e:	00 00                	add    %al,(%rax)
ffff80000010da30:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010da33:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010da39:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010da3c:	07                   	(bad)  
ffff80000010da3d:	08 00                	or     %al,(%rax)
ffff80000010da3f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010da42:	00 00                	add    %al,(%rax)
ffff80000010da44:	4c 07                	rex.WR (bad) 
ffff80000010da46:	00 00                	add    %al,(%rax)
ffff80000010da48:	ae                   	scas   %es:(%rdi),%al
ffff80000010da49:	af                   	scas   %es:(%rdi),%eax
ffff80000010da4a:	ff                   	(bad)  
ffff80000010da4b:	ff 53 00             	callq  *0x0(%rbx)
ffff80000010da4e:	00 00                	add    %al,(%rax)
ffff80000010da50:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010da53:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010da59:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010da5c:	07                   	(bad)  
ffff80000010da5d:	08 00                	or     %al,(%rax)
ffff80000010da5f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010da62:	00 00                	add    %al,(%rax)
ffff80000010da64:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010da65:	07                   	(bad)  
ffff80000010da66:	00 00                	add    %al,(%rax)
ffff80000010da68:	e1 af                	loope  ffff80000010da19 <_erodata+0x728>
ffff80000010da6a:	ff                   	(bad)  
ffff80000010da6b:	ff 53 00             	callq  *0x0(%rbx)
ffff80000010da6e:	00 00                	add    %al,(%rax)
ffff80000010da70:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010da73:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010da79:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010da7c:	07                   	(bad)  
ffff80000010da7d:	08 00                	or     %al,(%rax)
ffff80000010da7f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010da82:	00 00                	add    %al,(%rax)
ffff80000010da84:	8c 07                	mov    %es,(%rdi)
ffff80000010da86:	00 00                	add    %al,(%rax)
ffff80000010da88:	14 b0                	adc    $0xb0,%al
ffff80000010da8a:	ff                   	(bad)  
ffff80000010da8b:	ff 53 00             	callq  *0x0(%rbx)
ffff80000010da8e:	00 00                	add    %al,(%rax)
ffff80000010da90:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010da93:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010da99:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010da9c:	07                   	(bad)  
ffff80000010da9d:	08 00                	or     %al,(%rax)
ffff80000010da9f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010daa2:	00 00                	add    %al,(%rax)
ffff80000010daa4:	ac                   	lods   %ds:(%rsi),%al
ffff80000010daa5:	07                   	(bad)  
ffff80000010daa6:	00 00                	add    %al,(%rax)
ffff80000010daa8:	47 b0 ff             	rex.RXB mov $0xff,%r8b
ffff80000010daab:	ff 15 01 00 00 00    	callq  *0x1(%rip)        # ffff80000010dab2 <_erodata+0x7c1>
ffff80000010dab1:	41 0e                	rex.B (bad) 
ffff80000010dab3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dab9:	03 10                	add    (%rax),%edx
ffff80000010dabb:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff80000010dabe:	08 00                	or     %al,(%rax)
ffff80000010dac0:	18 00                	sbb    %al,(%rax)
ffff80000010dac2:	00 00                	add    %al,(%rax)
ffff80000010dac4:	cc                   	int3   
ffff80000010dac5:	07                   	(bad)  
ffff80000010dac6:	00 00                	add    %al,(%rax)
ffff80000010dac8:	3c b1                	cmp    $0xb1,%al
ffff80000010daca:	ff                   	(bad)  
ffff80000010dacb:	ff 59 00             	lcall  *0x0(%rcx)
ffff80000010dace:	00 00                	add    %al,(%rax)
ffff80000010dad0:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010dad3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dad9:	00 00                	add    %al,(%rax)
ffff80000010dadb:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010dade:	00 00                	add    %al,(%rax)
ffff80000010dae0:	e8 07 00 00 79       	callq  ffff80007910daec <_end+0x78fe4694>
ffff80000010dae5:	b1 ff                	mov    $0xff,%cl
ffff80000010dae7:	ff 47 00             	incl   0x0(%rdi)
ffff80000010daea:	00 00                	add    %al,(%rax)
ffff80000010daec:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010daef:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010daf5:	02 42 0c             	add    0xc(%rdx),%al
ffff80000010daf8:	07                   	(bad)  
ffff80000010daf9:	08 00                	or     %al,(%rax)
ffff80000010dafb:	00 20                	add    %ah,(%rax)
ffff80000010dafd:	00 00                	add    %al,(%rax)
ffff80000010daff:	00 08                	add    %cl,(%rax)
ffff80000010db01:	08 00                	or     %al,(%rax)
ffff80000010db03:	00 a0 b1 ff ff c9    	add    %ah,-0x3600004f(%rax)
ffff80000010db09:	00 00                	add    %al,(%rax)
ffff80000010db0b:	00 00                	add    %al,(%rax)
ffff80000010db0d:	41 0e                	rex.B (bad) 
ffff80000010db0f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010db15:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010db18:	83 04 02 bd          	addl   $0xffffffbd,(%rdx,%rax,1)
ffff80000010db1c:	0c 07                	or     $0x7,%al
ffff80000010db1e:	08 00                	or     %al,(%rax)
ffff80000010db20:	1c 00                	sbb    $0x0,%al
ffff80000010db22:	00 00                	add    %al,(%rax)
ffff80000010db24:	2c 08                	sub    $0x8,%al
ffff80000010db26:	00 00                	add    %al,(%rax)
ffff80000010db28:	45 b2 ff             	rex.RB mov $0xff,%r10b
ffff80000010db2b:	ff 4b 00             	decl   0x0(%rbx)
ffff80000010db2e:	00 00                	add    %al,(%rax)
ffff80000010db30:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010db33:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010db39:	02 46 0c             	add    0xc(%rsi),%al
ffff80000010db3c:	07                   	(bad)  
ffff80000010db3d:	08 00                	or     %al,(%rax)
ffff80000010db3f:	00 24 00             	add    %ah,(%rax,%rax,1)
ffff80000010db42:	00 00                	add    %al,(%rax)
ffff80000010db44:	4c 08 00             	rex.WR or %r8b,(%rax)
ffff80000010db47:	00 70 b2             	add    %dh,-0x4e(%rax)
ffff80000010db4a:	ff                   	(bad)  
ffff80000010db4b:	ff                   	(bad)  
ffff80000010db4c:	3b 01                	cmp    (%rcx),%eax
ffff80000010db4e:	00 00                	add    %al,(%rax)
ffff80000010db50:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010db53:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010db59:	49 8f 03             	rex.WB popq (%r11)
ffff80000010db5c:	8c 04 83             	mov    %es,(%rbx,%rax,4)
ffff80000010db5f:	05 03 2d 01 0c       	add    $0xc012d03,%eax
ffff80000010db64:	07                   	(bad)  
ffff80000010db65:	08 00                	or     %al,(%rax)
ffff80000010db67:	00 24 00             	add    %ah,(%rax,%rax,1)
ffff80000010db6a:	00 00                	add    %al,(%rax)
ffff80000010db6c:	74 08                	je     ffff80000010db76 <_erodata+0x885>
ffff80000010db6e:	00 00                	add    %al,(%rax)
ffff80000010db70:	83 b3 ff ff 5f 01 00 	xorl   $0x0,0x15fffff(%rbx)
ffff80000010db77:	00 00                	add    %al,(%rax)
ffff80000010db79:	41 0e                	rex.B (bad) 
ffff80000010db7b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010db81:	49 8d 03             	lea    (%r11),%rax
ffff80000010db84:	8c 04 83             	mov    %es,(%rbx,%rax,4)
ffff80000010db87:	05 03 51 01 0c       	add    $0xc015103,%eax
ffff80000010db8c:	07                   	(bad)  
ffff80000010db8d:	08 00                	or     %al,(%rax)
ffff80000010db8f:	00 28                	add    %ch,(%rax)
ffff80000010db91:	00 00                	add    %al,(%rax)
ffff80000010db93:	00 9c 08 00 00 ba b4 	add    %bl,-0x4b460000(%rax,%rcx,1)
ffff80000010db9a:	ff                   	(bad)  
ffff80000010db9b:	ff 0b                	decl   (%rbx)
ffff80000010db9d:	04 00                	add    $0x0,%al
ffff80000010db9f:	00 00                	add    %al,(%rax)
ffff80000010dba1:	41 0e                	rex.B (bad) 
ffff80000010dba3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dba9:	4d 8f 03             	rex.WRB popq (%r11)
ffff80000010dbac:	8e 04 8d 05 8c 06 83 	mov    -0x7cf973fb(,%rcx,4),%es
ffff80000010dbb3:	07                   	(bad)  
ffff80000010dbb4:	03 f9                	add    %ecx,%edi
ffff80000010dbb6:	03 0c 07             	add    (%rdi,%rax,1),%ecx
ffff80000010dbb9:	08 00                	or     %al,(%rax)
ffff80000010dbbb:	00 20                	add    %ah,(%rax)
ffff80000010dbbd:	00 00                	add    %al,(%rax)
ffff80000010dbbf:	00 c8                	add    %cl,%al
ffff80000010dbc1:	08 00                	or     %al,(%rax)
ffff80000010dbc3:	00 99 b8 ff ff e7    	add    %bl,-0x18000048(%rcx)
ffff80000010dbc9:	00 00                	add    %al,(%rax)
ffff80000010dbcb:	00 00                	add    %al,(%rax)
ffff80000010dbcd:	41 0e                	rex.B (bad) 
ffff80000010dbcf:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dbd5:	4a 8f 03             	rex.WX popq (%rbx)
ffff80000010dbd8:	83 04 02 d8          	addl   $0xffffffd8,(%rdx,%rax,1)
ffff80000010dbdc:	0c 07                	or     $0x7,%al
ffff80000010dbde:	08 00                	or     %al,(%rax)
ffff80000010dbe0:	20 00                	and    %al,(%rax)
ffff80000010dbe2:	00 00                	add    %al,(%rax)
ffff80000010dbe4:	ec                   	in     (%dx),%al
ffff80000010dbe5:	08 00                	or     %al,(%rax)
ffff80000010dbe7:	00 5c b9 ff          	add    %bl,-0x1(%rcx,%rdi,4)
ffff80000010dbeb:	ff 5b 02             	lcall  *0x2(%rbx)
ffff80000010dbee:	00 00                	add    %al,(%rax)
ffff80000010dbf0:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010dbf3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dbf9:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010dbfc:	83 04 03 4f          	addl   $0x4f,(%rbx,%rax,1)
ffff80000010dc00:	02 0c 07             	add    (%rdi,%rax,1),%cl
ffff80000010dc03:	08 18                	or     %bl,(%rax)
ffff80000010dc05:	00 00                	add    %al,(%rax)
ffff80000010dc07:	00 10                	add    %dl,(%rax)
ffff80000010dc09:	09 00                	or     %eax,(%rax)
ffff80000010dc0b:	00 93 bb ff ff 54    	add    %dl,0x54ffffbb(%rbx)
ffff80000010dc11:	00 00                	add    %al,(%rax)
ffff80000010dc13:	00 00                	add    %al,(%rax)
ffff80000010dc15:	41 0e                	rex.B (bad) 
ffff80000010dc17:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dc1d:	46 8f 03             	rex.RX popq (%rbx)

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
ffff800000110024:	00 80 ff ff 40 ba    	add    %al,-0x45bf0001(%rax)
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
ffff800000118024:	00 80 ff ff 40 ba    	add    %al,-0x45bf0001(%rax)
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
