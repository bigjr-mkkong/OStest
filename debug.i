
system:     file format elf64-x86-64


Disassembly of section .text:

ffff800000100000 <_start>:
ffff800000100000:	0f 01 15 d1 9c 00 00 	lgdt   0x9cd1(%rip)        # ffff800000109cd8 <GDT_END>
ffff800000100007:	0f 01 1d d4 ac 00 00 	lidt   0xacd4(%rip)        # ffff80000010ace2 <IDT_END>
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
ffff800000100074:	48 8d 3d 67 9c 00 00 	lea    0x9c67(%rip),%rdi        # ffff800000109ce2 <LABEL_IDT>
ffff80000010007b:	48 c7 c1 00 01 00 00 	mov    $0x100,%rcx

ffff800000100082 <.setting>:
ffff800000100082:	48 89 07             	mov    %rax,(%rdi)
ffff800000100085:	48 89 57 08          	mov    %rdx,0x8(%rdi)
ffff800000100089:	48 83 c7 10          	add    $0x10,%rdi
ffff80000010008d:	48 ff c9             	dec    %rcx
ffff800000100090:	75 f0                	jne    ffff800000100082 <.setting>

ffff800000100092 <setup_TSS64>:
ffff800000100092:	48 8d 15 53 ac 00 00 	lea    0xac53(%rip),%rdx        # ffff80000010acec <LABEL_TSS64>
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
ffff8000001000cc:	48 8d 3d 6d 9b 00 00 	lea    0x9b6d(%rip),%rdi        # ffff800000109c40 <LABEL_GDT64>
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
ffff800000100132:	e8 aa 4d 00 00       	callq  ffff800000104ee1 <printk>
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
ffff80000010405f:	e8 e8 4d 00 00       	callq  ffff800000108e4c <system_call_function>

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
ffff8000001040df:	48 8d 05 95 11 00 00 	lea    0x1195(%rip),%rax        # ffff80000010527b <do_divide_error>
ffff8000001040e6:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001040ea:	eb a6                	jmp    ffff800000104092 <error_code>

ffff8000001040ec <debug>:
ffff8000001040ec:	6a 00                	pushq  $0x0
ffff8000001040ee:	50                   	push   %rax
ffff8000001040ef:	48 8d 05 08 12 00 00 	lea    0x1208(%rip),%rax        # ffff8000001052fe <do_debug>
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
ffff800000104138:	e8 47 12 00 00       	callq  ffff800000105384 <do_nmi>
ffff80000010413d:	e9 be fe ff ff       	jmpq   ffff800000104000 <RESTORE_ALL>

ffff800000104142 <breakpoint>:
ffff800000104142:	6a 00                	pushq  $0x0
ffff800000104144:	50                   	push   %rax
ffff800000104145:	48 8d 05 be 12 00 00 	lea    0x12be(%rip),%rax        # ffff80000010540a <do_breakpoint>
ffff80000010414c:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104150:	e9 3d ff ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104155 <overflow>:
ffff800000104155:	6a 00                	pushq  $0x0
ffff800000104157:	50                   	push   %rax
ffff800000104158:	48 8d 05 31 13 00 00 	lea    0x1331(%rip),%rax        # ffff800000105490 <do_overflow>
ffff80000010415f:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104163:	e9 2a ff ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104168 <bounds>:
ffff800000104168:	6a 00                	pushq  $0x0
ffff80000010416a:	50                   	push   %rax
ffff80000010416b:	48 8d 05 a4 13 00 00 	lea    0x13a4(%rip),%rax        # ffff800000105516 <do_bounds>
ffff800000104172:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104176:	e9 17 ff ff ff       	jmpq   ffff800000104092 <error_code>

ffff80000010417b <undefined_opcode>:
ffff80000010417b:	6a 00                	pushq  $0x0
ffff80000010417d:	50                   	push   %rax
ffff80000010417e:	48 8d 05 17 14 00 00 	lea    0x1417(%rip),%rax        # ffff80000010559c <do_undefined_opcode>
ffff800000104185:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104189:	e9 04 ff ff ff       	jmpq   ffff800000104092 <error_code>

ffff80000010418e <dev_not_available>:
ffff80000010418e:	6a 00                	pushq  $0x0
ffff800000104190:	50                   	push   %rax
ffff800000104191:	48 8d 05 8a 14 00 00 	lea    0x148a(%rip),%rax        # ffff800000105622 <do_dev_not_available>
ffff800000104198:	48 87 04 24          	xchg   %rax,(%rsp)
ffff80000010419c:	e9 f1 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041a1 <double_fault>:
ffff8000001041a1:	50                   	push   %rax
ffff8000001041a2:	48 8d 05 ff 14 00 00 	lea    0x14ff(%rip),%rax        # ffff8000001056a8 <do_double_fault>
ffff8000001041a9:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041ad:	e9 e0 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041b2 <coprocessor_segment_overrun>:
ffff8000001041b2:	6a 00                	pushq  $0x0
ffff8000001041b4:	50                   	push   %rax
ffff8000001041b5:	48 8d 05 72 15 00 00 	lea    0x1572(%rip),%rax        # ffff80000010572e <do_coprocessor_segment_overrun>
ffff8000001041bc:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041c0:	e9 cd fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041c5 <invalid_TSS>:
ffff8000001041c5:	50                   	push   %rax
ffff8000001041c6:	48 8d 05 e7 15 00 00 	lea    0x15e7(%rip),%rax        # ffff8000001057b4 <do_invalid_TSS>
ffff8000001041cd:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041d1:	e9 bc fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041d6 <segment_not_present>:
ffff8000001041d6:	50                   	push   %rax
ffff8000001041d7:	48 8d 05 b8 17 00 00 	lea    0x17b8(%rip),%rax        # ffff800000105996 <do_segment_not_present>
ffff8000001041de:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041e2:	e9 ab fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041e7 <stack_segment_fault>:
ffff8000001041e7:	50                   	push   %rax
ffff8000001041e8:	48 8d 05 89 19 00 00 	lea    0x1989(%rip),%rax        # ffff800000105b78 <do_stack_segment_fault>
ffff8000001041ef:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041f3:	e9 9a fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041f8 <general_protection>:
ffff8000001041f8:	50                   	push   %rax
ffff8000001041f9:	48 8d 05 5a 1b 00 00 	lea    0x1b5a(%rip),%rax        # ffff800000105d5a <do_general_protection>
ffff800000104200:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104204:	e9 89 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104209 <page_fault>:
ffff800000104209:	50                   	push   %rax
ffff80000010420a:	48 8d 05 2b 1d 00 00 	lea    0x1d2b(%rip),%rax        # ffff800000105f3c <do_page_fault>
ffff800000104211:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104215:	e9 78 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff80000010421a <x87_FPU_error>:
ffff80000010421a:	6a 00                	pushq  $0x0
ffff80000010421c:	50                   	push   %rax
ffff80000010421d:	48 8d 05 6e 1f 00 00 	lea    0x1f6e(%rip),%rax        # ffff800000106192 <do_x87_FPU_error>
ffff800000104224:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104228:	e9 65 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff80000010422d <alignment_check>:
ffff80000010422d:	50                   	push   %rax
ffff80000010422e:	48 8d 05 e3 1f 00 00 	lea    0x1fe3(%rip),%rax        # ffff800000106218 <do_alignment_check>
ffff800000104235:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104239:	e9 54 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff80000010423e <machine_check>:
ffff80000010423e:	6a 00                	pushq  $0x0
ffff800000104240:	50                   	push   %rax
ffff800000104241:	48 8d 05 56 20 00 00 	lea    0x2056(%rip),%rax        # ffff80000010629e <do_machine_check>
ffff800000104248:	48 87 04 24          	xchg   %rax,(%rsp)
ffff80000010424c:	e9 41 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104251 <SIMD_exception>:
ffff800000104251:	6a 00                	pushq  $0x0
ffff800000104253:	50                   	push   %rax
ffff800000104254:	48 8d 05 c9 20 00 00 	lea    0x20c9(%rip),%rax        # ffff800000106324 <do_SIMD_exception>
ffff80000010425b:	48 87 04 24          	xchg   %rax,(%rsp)
ffff80000010425f:	e9 2e fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104264 <virtualization_exception>:
ffff800000104264:	6a 00                	pushq  $0x0
ffff800000104266:	50                   	push   %rax
ffff800000104267:	48 8d 05 3c 21 00 00 	lea    0x213c(%rip),%rax        # ffff8000001063aa <do_virtualization_exception>
ffff80000010426e:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104272:	e9 1b fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104277 <set_idt_desc>:
ffff800000104277:	55                   	push   %rbp
ffff800000104278:	48 89 e5             	mov    %rsp,%rbp
ffff80000010427b:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010427b <set_idt_desc+0x4>
ffff800000104282:	49 bb ed 7b 00 00 00 	movabs $0x7bed,%r11
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
ffff800000104330:	49 bb 3f 7b 00 00 00 	movabs $0x7b3f,%r11
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
ffff800000104361:	49 b8 0f 84 ff ff ff 	movabs $0xffffffffffff840f,%r8
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
ffff800000104383:	49 bb ec 7a 00 00 00 	movabs $0x7aec,%r11
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
ffff8000001043b4:	49 b8 0f 84 ff ff ff 	movabs $0xffffffffffff840f,%r8
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
ffff8000001043d6:	49 bb 99 7a 00 00 00 	movabs $0x7a99,%r11
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
ffff800000104407:	49 b8 0f 84 ff ff ff 	movabs $0xffffffffffff840f,%r8
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
ffff800000104429:	49 bb 46 7a 00 00 00 	movabs $0x7a46,%r11
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
ffff80000010445a:	49 b8 0f 84 ff ff ff 	movabs $0xffffffffffff840f,%r8
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
ffff800000104478:	49 bb f7 79 00 00 00 	movabs $0x79f7,%r11
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
ffff80000010458e:	49 bb e1 78 00 00 00 	movabs $0x78e1,%r11
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
ffff8000001045e4:	49 bb 8b 78 00 00 00 	movabs $0x788b,%r11
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
ffff80000010461e:	49 bb 51 78 00 00 00 	movabs $0x7851,%r11
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
ffff80000010465d:	49 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r9
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
ffff80000010468d:	49 bb e2 77 00 00 00 	movabs $0x77e2,%r11
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
ffff8000001046bb:	49 b8 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r8
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
ffff8000001046e6:	49 bb 89 77 00 00 00 	movabs $0x7789,%r11
ffff8000001046ed:	00 00 00 
ffff8000001046f0:	4c 01 db             	add    %r11,%rbx
ffff8000001046f3:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff8000001046fa:	00 00 00 
ffff8000001046fd:	c7 04 03 a0 05 00 00 	movl   $0x5a0,(%rbx,%rax,1)
ffff800000104704:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff80000010470b:	00 00 00 
ffff80000010470e:	c7 44 03 04 84 03 00 	movl   $0x384,0x4(%rbx,%rax,1)
ffff800000104715:	00 
ffff800000104716:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff80000010471d:	00 00 00 
ffff800000104720:	c7 44 03 0c 00 00 00 	movl   $0x0,0xc(%rbx,%rax,1)
ffff800000104727:	00 
ffff800000104728:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff80000010472f:	00 00 00 
ffff800000104732:	8b 54 03 0c          	mov    0xc(%rbx,%rax,1),%edx
ffff800000104736:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff80000010473d:	00 00 00 
ffff800000104740:	89 54 03 08          	mov    %edx,0x8(%rbx,%rax,1)
ffff800000104744:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff80000010474b:	00 00 00 
ffff80000010474e:	c7 44 03 10 08 00 00 	movl   $0x8,0x10(%rbx,%rax,1)
ffff800000104755:	00 
ffff800000104756:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff80000010475d:	00 00 00 
ffff800000104760:	c7 44 03 14 10 00 00 	movl   $0x10,0x14(%rbx,%rax,1)
ffff800000104767:	00 
ffff800000104768:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff80000010476f:	00 00 00 
ffff800000104772:	48 b9 00 00 a0 00 00 	movabs $0xffff800000a00000,%rcx
ffff800000104779:	80 ff ff 
ffff80000010477c:	48 89 4c 03 18       	mov    %rcx,0x18(%rbx,%rax,1)
ffff800000104781:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff800000104788:	00 00 00 
ffff80000010478b:	8b 14 03             	mov    (%rbx,%rax,1),%edx
ffff80000010478e:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff800000104795:	00 00 00 
ffff800000104798:	8b 44 03 04          	mov    0x4(%rbx,%rax,1),%eax
ffff80000010479c:	0f af c2             	imul   %edx,%eax
ffff80000010479f:	c1 e0 02             	shl    $0x2,%eax
ffff8000001047a2:	05 ff 0f 00 00       	add    $0xfff,%eax
ffff8000001047a7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
ffff8000001047ac:	89 c2                	mov    %eax,%edx
ffff8000001047ae:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff8000001047b5:	00 00 00 
ffff8000001047b8:	89 54 03 20          	mov    %edx,0x20(%rbx,%rax,1)
ffff8000001047bc:	b8 50 00 00 00       	mov    $0x50,%eax
ffff8000001047c1:	0f 00 d8             	ltr    %ax
ffff8000001047c4:	68 00 7c 00 00       	pushq  $0x7c00
ffff8000001047c9:	68 00 7c 00 00       	pushq  $0x7c00
ffff8000001047ce:	68 00 7c 00 00       	pushq  $0x7c00
ffff8000001047d3:	68 00 7c 00 00       	pushq  $0x7c00
ffff8000001047d8:	41 b9 00 7c 00 00    	mov    $0x7c00,%r9d
ffff8000001047de:	41 b8 00 7c 00 00    	mov    $0x7c00,%r8d
ffff8000001047e4:	b9 00 7c 00 00       	mov    $0x7c00,%ecx
ffff8000001047e9:	ba 00 7c 00 00       	mov    $0x7c00,%edx
ffff8000001047ee:	be 00 7c 00 00       	mov    $0x7c00,%esi
ffff8000001047f3:	bf 00 7c 00 00       	mov    $0x7c00,%edi
ffff8000001047f8:	48 b8 05 86 ff ff ff 	movabs $0xffffffffffff8605,%rax
ffff8000001047ff:	ff ff ff 
ffff800000104802:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000104806:	ff d0                	callq  *%rax
ffff800000104808:	48 83 c4 20          	add    $0x20,%rsp
ffff80000010480c:	49 89 df             	mov    %rbx,%r15
ffff80000010480f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000104814:	48 ba c8 a5 ff ff ff 	movabs $0xffffffffffffa5c8,%rdx
ffff80000010481b:	ff ff ff 
ffff80000010481e:	48 01 da             	add    %rbx,%rdx
ffff800000104821:	ff d2                	callq  *%rdx
ffff800000104823:	49 89 df             	mov    %rbx,%r15
ffff800000104826:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010482b:	48 ba e9 db ff ff ff 	movabs $0xffffffffffffdbe9,%rdx
ffff800000104832:	ff ff ff 
ffff800000104835:	48 01 da             	add    %rbx,%rdx
ffff800000104838:	ff d2                	callq  *%rdx
ffff80000010483a:	48 b8 70 ff ff ff ff 	movabs $0xffffffffffffff70,%rax
ffff800000104841:	ff ff ff 
ffff800000104844:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000104848:	48 89 c2             	mov    %rax,%rdx
ffff80000010484b:	48 b8 f8 d2 01 00 00 	movabs $0x1d2f8,%rax
ffff800000104852:	00 00 00 
ffff800000104855:	48 89 94 03 d0 02 00 	mov    %rdx,0x2d0(%rbx,%rax,1)
ffff80000010485c:	00 
ffff80000010485d:	48 b8 08 ff ff ff ff 	movabs $0xffffffffffffff08,%rax
ffff800000104864:	ff ff ff 
ffff800000104867:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010486b:	48 89 c2             	mov    %rax,%rdx
ffff80000010486e:	48 b8 f8 d2 01 00 00 	movabs $0x1d2f8,%rax
ffff800000104875:	00 00 00 
ffff800000104878:	48 89 94 03 d8 02 00 	mov    %rdx,0x2d8(%rbx,%rax,1)
ffff80000010487f:	00 
ffff800000104880:	48 b8 b0 ff ff ff ff 	movabs $0xffffffffffffffb0,%rax
ffff800000104887:	ff ff ff 
ffff80000010488a:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010488e:	48 89 c2             	mov    %rax,%rdx
ffff800000104891:	48 b8 f8 d2 01 00 00 	movabs $0x1d2f8,%rax
ffff800000104898:	00 00 00 
ffff80000010489b:	48 89 94 03 e0 02 00 	mov    %rdx,0x2e0(%rbx,%rax,1)
ffff8000001048a2:	00 
ffff8000001048a3:	48 b8 c0 ff ff ff ff 	movabs $0xffffffffffffffc0,%rax
ffff8000001048aa:	ff ff ff 
ffff8000001048ad:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001048b1:	48 89 c2             	mov    %rax,%rdx
ffff8000001048b4:	48 b8 f8 d2 01 00 00 	movabs $0x1d2f8,%rax
ffff8000001048bb:	00 00 00 
ffff8000001048be:	48 89 94 03 e8 02 00 	mov    %rdx,0x2e8(%rbx,%rax,1)
ffff8000001048c5:	00 
ffff8000001048c6:	49 89 df             	mov    %rbx,%r15
ffff8000001048c9:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001048ce:	48 ba ad ab ff ff ff 	movabs $0xffffffffffffabad,%rdx
ffff8000001048d5:	ff ff ff 
ffff8000001048d8:	48 01 da             	add    %rbx,%rdx
ffff8000001048db:	ff d2                	callq  *%rdx
ffff8000001048dd:	49 89 df             	mov    %rbx,%r15
ffff8000001048e0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001048e5:	48 ba ca c8 ff ff ff 	movabs $0xffffffffffffc8ca,%rdx
ffff8000001048ec:	ff ff ff 
ffff8000001048ef:	48 01 da             	add    %rbx,%rdx
ffff8000001048f2:	ff d2                	callq  *%rdx
ffff8000001048f4:	49 89 df             	mov    %rbx,%r15
ffff8000001048f7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001048fc:	48 ba d9 d3 ff ff ff 	movabs $0xffffffffffffd3d9,%rdx
ffff800000104903:	ff ff ff 
ffff800000104906:	48 01 da             	add    %rbx,%rdx
ffff800000104909:	ff d2                	callq  *%rdx
ffff80000010490b:	eb fe                	jmp    ffff80000010490b <Start_Kernel+0x233>

ffff80000010490d <putchar>:
ffff80000010490d:	55                   	push   %rbp
ffff80000010490e:	48 89 e5             	mov    %rsp,%rbp
ffff800000104911:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000104911 <putchar+0x4>
ffff800000104918:	49 bb 57 75 00 00 00 	movabs $0x7557,%r11
ffff80000010491f:	00 00 00 
ffff800000104922:	4c 01 d8             	add    %r11,%rax
ffff800000104925:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000104929:	89 75 d4             	mov    %esi,-0x2c(%rbp)
ffff80000010492c:	89 55 d0             	mov    %edx,-0x30(%rbp)
ffff80000010492f:	89 4d cc             	mov    %ecx,-0x34(%rbp)
ffff800000104932:	44 89 45 c8          	mov    %r8d,-0x38(%rbp)
ffff800000104936:	44 89 4d c4          	mov    %r9d,-0x3c(%rbp)
ffff80000010493a:	8b 55 10             	mov    0x10(%rbp),%edx
ffff80000010493d:	88 55 c0             	mov    %dl,-0x40(%rbp)
ffff800000104940:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff800000104947:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff80000010494e:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
ffff800000104955:	00 
ffff800000104956:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff80000010495d:	00 
ffff80000010495e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
ffff800000104965:	0f b6 55 c0          	movzbl -0x40(%rbp),%edx
ffff800000104969:	48 63 d2             	movslq %edx,%rdx
ffff80000010496c:	48 89 d1             	mov    %rdx,%rcx
ffff80000010496f:	48 c1 e1 04          	shl    $0x4,%rcx
ffff800000104973:	48 ba f8 ee ff ff ff 	movabs $0xffffffffffffeef8,%rdx
ffff80000010497a:	ff ff ff 
ffff80000010497d:	48 8d 04 10          	lea    (%rax,%rdx,1),%rax
ffff800000104981:	48 01 c8             	add    %rcx,%rax
ffff800000104984:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000104988:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff80000010498f:	eb 7a                	jmp    ffff800000104a0b <putchar+0xfe>
ffff800000104991:	8b 55 cc             	mov    -0x34(%rbp),%edx
ffff800000104994:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000104997:	01 d0                	add    %edx,%eax
ffff800000104999:	0f af 45 d4          	imul   -0x2c(%rbp),%eax
ffff80000010499d:	48 63 d0             	movslq %eax,%rdx
ffff8000001049a0:	8b 45 d0             	mov    -0x30(%rbp),%eax
ffff8000001049a3:	48 98                	cltq   
ffff8000001049a5:	48 01 d0             	add    %rdx,%rax
ffff8000001049a8:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
ffff8000001049af:	00 
ffff8000001049b0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001049b4:	48 01 d0             	add    %rdx,%rax
ffff8000001049b7:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff8000001049bb:	c7 45 e4 00 01 00 00 	movl   $0x100,-0x1c(%rbp)
ffff8000001049c2:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff8000001049c9:	eb 31                	jmp    ffff8000001049fc <putchar+0xef>
ffff8000001049cb:	d1 7d e4             	sarl   -0x1c(%rbp)
ffff8000001049ce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001049d2:	0f b6 00             	movzbl (%rax),%eax
ffff8000001049d5:	0f b6 c0             	movzbl %al,%eax
ffff8000001049d8:	23 45 e4             	and    -0x1c(%rbp),%eax
ffff8000001049db:	85 c0                	test   %eax,%eax
ffff8000001049dd:	74 0b                	je     ffff8000001049ea <putchar+0xdd>
ffff8000001049df:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001049e3:	8b 55 c8             	mov    -0x38(%rbp),%edx
ffff8000001049e6:	89 10                	mov    %edx,(%rax)
ffff8000001049e8:	eb 09                	jmp    ffff8000001049f3 <putchar+0xe6>
ffff8000001049ea:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001049ee:	8b 55 c4             	mov    -0x3c(%rbp),%edx
ffff8000001049f1:	89 10                	mov    %edx,(%rax)
ffff8000001049f3:	48 83 45 f0 04       	addq   $0x4,-0x10(%rbp)
ffff8000001049f8:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
ffff8000001049fc:	83 7d f8 07          	cmpl   $0x7,-0x8(%rbp)
ffff800000104a00:	7e c9                	jle    ffff8000001049cb <putchar+0xbe>
ffff800000104a02:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
ffff800000104a07:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff800000104a0b:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
ffff800000104a0f:	7e 80                	jle    ffff800000104991 <putchar+0x84>
ffff800000104a11:	90                   	nop
ffff800000104a12:	5d                   	pop    %rbp
ffff800000104a13:	c3                   	retq   

ffff800000104a14 <dec2hex>:
ffff800000104a14:	55                   	push   %rbp
ffff800000104a15:	48 89 e5             	mov    %rsp,%rbp
ffff800000104a18:	48 81 ec 78 01 00 00 	sub    $0x178,%rsp
ffff800000104a1f:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000104a1f <dec2hex+0xb>
ffff800000104a26:	49 bb 49 74 00 00 00 	movabs $0x7449,%r11
ffff800000104a2d:	00 00 00 
ffff800000104a30:	4c 01 d8             	add    %r11,%rax
ffff800000104a33:	48 89 bd 18 fe ff ff 	mov    %rdi,-0x1e8(%rbp)
ffff800000104a3a:	89 b5 14 fe ff ff    	mov    %esi,-0x1ec(%rbp)
ffff800000104a40:	c6 45 b0 30          	movb   $0x30,-0x50(%rbp)
ffff800000104a44:	c6 45 b1 31          	movb   $0x31,-0x4f(%rbp)
ffff800000104a48:	c6 45 b2 32          	movb   $0x32,-0x4e(%rbp)
ffff800000104a4c:	c6 45 b3 33          	movb   $0x33,-0x4d(%rbp)
ffff800000104a50:	c6 45 b4 34          	movb   $0x34,-0x4c(%rbp)
ffff800000104a54:	c6 45 b5 35          	movb   $0x35,-0x4b(%rbp)
ffff800000104a58:	c6 45 b6 36          	movb   $0x36,-0x4a(%rbp)
ffff800000104a5c:	c6 45 b7 37          	movb   $0x37,-0x49(%rbp)
ffff800000104a60:	c6 45 b8 38          	movb   $0x38,-0x48(%rbp)
ffff800000104a64:	c6 45 b9 39          	movb   $0x39,-0x47(%rbp)
ffff800000104a68:	c6 45 ba 41          	movb   $0x41,-0x46(%rbp)
ffff800000104a6c:	c6 45 bb 42          	movb   $0x42,-0x45(%rbp)
ffff800000104a70:	c6 45 bc 43          	movb   $0x43,-0x44(%rbp)
ffff800000104a74:	c6 45 bd 44          	movb   $0x44,-0x43(%rbp)
ffff800000104a78:	c6 45 be 45          	movb   $0x45,-0x42(%rbp)
ffff800000104a7c:	c6 45 bf 46          	movb   $0x46,-0x41(%rbp)
ffff800000104a80:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff800000104a87:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff800000104a8e:	eb 40                	jmp    ffff800000104ad0 <dec2hex+0xbc>
ffff800000104a90:	8b 85 14 fe ff ff    	mov    -0x1ec(%rbp),%eax
ffff800000104a96:	99                   	cltd   
ffff800000104a97:	c1 ea 1c             	shr    $0x1c,%edx
ffff800000104a9a:	01 d0                	add    %edx,%eax
ffff800000104a9c:	83 e0 0f             	and    $0xf,%eax
ffff800000104a9f:	29 d0                	sub    %edx,%eax
ffff800000104aa1:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff800000104aa4:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000104aa7:	8d 50 01             	lea    0x1(%rax),%edx
ffff800000104aaa:	89 55 fc             	mov    %edx,-0x4(%rbp)
ffff800000104aad:	48 98                	cltq   
ffff800000104aaf:	8b 55 f4             	mov    -0xc(%rbp),%edx
ffff800000104ab2:	89 94 85 20 fe ff ff 	mov    %edx,-0x1e0(%rbp,%rax,4)
ffff800000104ab9:	8b 85 14 fe ff ff    	mov    -0x1ec(%rbp),%eax
ffff800000104abf:	8d 50 0f             	lea    0xf(%rax),%edx
ffff800000104ac2:	85 c0                	test   %eax,%eax
ffff800000104ac4:	0f 48 c2             	cmovs  %edx,%eax
ffff800000104ac7:	c1 f8 04             	sar    $0x4,%eax
ffff800000104aca:	89 85 14 fe ff ff    	mov    %eax,-0x1ec(%rbp)
ffff800000104ad0:	83 bd 14 fe ff ff 00 	cmpl   $0x0,-0x1ec(%rbp)
ffff800000104ad7:	7f b7                	jg     ffff800000104a90 <dec2hex+0x7c>
ffff800000104ad9:	83 6d fc 01          	subl   $0x1,-0x4(%rbp)
ffff800000104add:	eb 2c                	jmp    ffff800000104b0b <dec2hex+0xf7>
ffff800000104adf:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000104ae2:	48 98                	cltq   
ffff800000104ae4:	8b 8c 85 20 fe ff ff 	mov    -0x1e0(%rbp,%rax,4),%ecx
ffff800000104aeb:	48 8b 85 18 fe ff ff 	mov    -0x1e8(%rbp),%rax
ffff800000104af2:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104af6:	48 89 95 18 fe ff ff 	mov    %rdx,-0x1e8(%rbp)
ffff800000104afd:	48 63 d1             	movslq %ecx,%rdx
ffff800000104b00:	0f b6 54 15 b0       	movzbl -0x50(%rbp,%rdx,1),%edx
ffff800000104b05:	88 10                	mov    %dl,(%rax)
ffff800000104b07:	83 6d fc 01          	subl   $0x1,-0x4(%rbp)
ffff800000104b0b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
ffff800000104b0f:	79 ce                	jns    ffff800000104adf <dec2hex+0xcb>
ffff800000104b11:	48 8b 85 18 fe ff ff 	mov    -0x1e8(%rbp),%rax
ffff800000104b18:	c9                   	leaveq 
ffff800000104b19:	c3                   	retq   

ffff800000104b1a <vsprintf>:
ffff800000104b1a:	55                   	push   %rbp
ffff800000104b1b:	48 89 e5             	mov    %rsp,%rbp
ffff800000104b1e:	53                   	push   %rbx
ffff800000104b1f:	48 83 ec 40          	sub    $0x40,%rsp
ffff800000104b23:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000104b23 <vsprintf+0x9>
ffff800000104b2a:	49 bb 45 73 00 00 00 	movabs $0x7345,%r11
ffff800000104b31:	00 00 00 
ffff800000104b34:	4c 01 db             	add    %r11,%rbx
ffff800000104b37:	48 89 7d c0          	mov    %rdi,-0x40(%rbp)
ffff800000104b3b:	48 89 75 b8          	mov    %rsi,-0x48(%rbp)
ffff800000104b3f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
ffff800000104b46:	48 b8 18 42 01 00 00 	movabs $0x14218,%rax
ffff800000104b4d:	00 00 00 
ffff800000104b50:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000104b54:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000104b58:	e9 56 03 00 00       	jmpq   ffff800000104eb3 <vsprintf+0x399>
ffff800000104b5d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104b61:	0f b6 00             	movzbl (%rax),%eax
ffff800000104b64:	3c 25                	cmp    $0x25,%al
ffff800000104b66:	74 17                	je     ffff800000104b7f <vsprintf+0x65>
ffff800000104b68:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104b6c:	0f b6 10             	movzbl (%rax),%edx
ffff800000104b6f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104b73:	88 10                	mov    %dl,(%rax)
ffff800000104b75:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
ffff800000104b7a:	e9 2f 03 00 00       	jmpq   ffff800000104eae <vsprintf+0x394>
ffff800000104b7f:	48 83 45 c0 01       	addq   $0x1,-0x40(%rbp)
ffff800000104b84:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104b88:	0f b6 00             	movzbl (%rax),%eax
ffff800000104b8b:	3c 64                	cmp    $0x64,%al
ffff800000104b8d:	0f 85 45 01 00 00    	jne    ffff800000104cd8 <vsprintf+0x1be>
ffff800000104b93:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104b97:	8b 00                	mov    (%rax),%eax
ffff800000104b99:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104b9c:	77 24                	ja     ffff800000104bc2 <vsprintf+0xa8>
ffff800000104b9e:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104ba2:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104ba6:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104baa:	8b 00                	mov    (%rax),%eax
ffff800000104bac:	89 c0                	mov    %eax,%eax
ffff800000104bae:	48 01 d0             	add    %rdx,%rax
ffff800000104bb1:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104bb5:	8b 12                	mov    (%rdx),%edx
ffff800000104bb7:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104bba:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104bbe:	89 0a                	mov    %ecx,(%rdx)
ffff800000104bc0:	eb 14                	jmp    ffff800000104bd6 <vsprintf+0xbc>
ffff800000104bc2:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104bc6:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104bca:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104bce:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104bd2:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104bd6:	8b 00                	mov    (%rax),%eax
ffff800000104bd8:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff800000104bdb:	8b 4d f4             	mov    -0xc(%rbp),%ecx
ffff800000104bde:	ba 67 66 66 66       	mov    $0x66666667,%edx
ffff800000104be3:	89 c8                	mov    %ecx,%eax
ffff800000104be5:	f7 ea                	imul   %edx
ffff800000104be7:	c1 fa 02             	sar    $0x2,%edx
ffff800000104bea:	89 c8                	mov    %ecx,%eax
ffff800000104bec:	c1 f8 1f             	sar    $0x1f,%eax
ffff800000104bef:	29 c2                	sub    %eax,%edx
ffff800000104bf1:	89 d0                	mov    %edx,%eax
ffff800000104bf3:	c1 e0 02             	shl    $0x2,%eax
ffff800000104bf6:	01 d0                	add    %edx,%eax
ffff800000104bf8:	01 c0                	add    %eax,%eax
ffff800000104bfa:	29 c1                	sub    %eax,%ecx
ffff800000104bfc:	89 ca                	mov    %ecx,%edx
ffff800000104bfe:	89 d0                	mov    %edx,%eax
ffff800000104c00:	8d 48 30             	lea    0x30(%rax),%ecx
ffff800000104c03:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104c07:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104c0b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104c0f:	89 ca                	mov    %ecx,%edx
ffff800000104c11:	88 10                	mov    %dl,(%rax)
ffff800000104c13:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
ffff800000104c17:	8b 4d f4             	mov    -0xc(%rbp),%ecx
ffff800000104c1a:	ba 67 66 66 66       	mov    $0x66666667,%edx
ffff800000104c1f:	89 c8                	mov    %ecx,%eax
ffff800000104c21:	f7 ea                	imul   %edx
ffff800000104c23:	c1 fa 02             	sar    $0x2,%edx
ffff800000104c26:	89 c8                	mov    %ecx,%eax
ffff800000104c28:	c1 f8 1f             	sar    $0x1f,%eax
ffff800000104c2b:	29 c2                	sub    %eax,%edx
ffff800000104c2d:	89 d0                	mov    %edx,%eax
ffff800000104c2f:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff800000104c32:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
ffff800000104c36:	75 a3                	jne    ffff800000104bdb <vsprintf+0xc1>
ffff800000104c38:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104c3c:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff800000104c40:	eb 6c                	jmp    ffff800000104cae <vsprintf+0x194>
ffff800000104c42:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000104c46:	0f b6 00             	movzbl (%rax),%eax
ffff800000104c49:	88 45 cf             	mov    %al,-0x31(%rbp)
ffff800000104c4c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000104c50:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000104c54:	48 29 c2             	sub    %rax,%rdx
ffff800000104c57:	48 89 d0             	mov    %rdx,%rax
ffff800000104c5a:	48 89 c2             	mov    %rax,%rdx
ffff800000104c5d:	8b 45 f0             	mov    -0x10(%rbp),%eax
ffff800000104c60:	48 98                	cltq   
ffff800000104c62:	48 29 c2             	sub    %rax,%rdx
ffff800000104c65:	48 89 d0             	mov    %rdx,%rax
ffff800000104c68:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff800000104c6c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104c70:	48 01 d0             	add    %rdx,%rax
ffff800000104c73:	0f b6 10             	movzbl (%rax),%edx
ffff800000104c76:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000104c7a:	88 10                	mov    %dl,(%rax)
ffff800000104c7c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000104c80:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000104c84:	48 29 c2             	sub    %rax,%rdx
ffff800000104c87:	48 89 d0             	mov    %rdx,%rax
ffff800000104c8a:	48 89 c2             	mov    %rax,%rdx
ffff800000104c8d:	8b 45 f0             	mov    -0x10(%rbp),%eax
ffff800000104c90:	48 98                	cltq   
ffff800000104c92:	48 29 c2             	sub    %rax,%rdx
ffff800000104c95:	48 89 d0             	mov    %rdx,%rax
ffff800000104c98:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff800000104c9c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104ca0:	48 01 c2             	add    %rax,%rdx
ffff800000104ca3:	0f b6 45 cf          	movzbl -0x31(%rbp),%eax
ffff800000104ca7:	88 02                	mov    %al,(%rdx)
ffff800000104ca9:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
ffff800000104cae:	8b 45 f0             	mov    -0x10(%rbp),%eax
ffff800000104cb1:	89 c2                	mov    %eax,%edx
ffff800000104cb3:	c1 ea 1f             	shr    $0x1f,%edx
ffff800000104cb6:	01 d0                	add    %edx,%eax
ffff800000104cb8:	d1 f8                	sar    %eax
ffff800000104cba:	48 98                	cltq   
ffff800000104cbc:	48 f7 d8             	neg    %rax
ffff800000104cbf:	48 89 c2             	mov    %rax,%rdx
ffff800000104cc2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104cc6:	48 01 d0             	add    %rdx,%rax
ffff800000104cc9:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
ffff800000104ccd:	0f 83 6f ff ff ff    	jae    ffff800000104c42 <vsprintf+0x128>
ffff800000104cd3:	e9 d6 01 00 00       	jmpq   ffff800000104eae <vsprintf+0x394>
ffff800000104cd8:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104cdc:	0f b6 00             	movzbl (%rax),%eax
ffff800000104cdf:	3c 63                	cmp    $0x63,%al
ffff800000104ce1:	75 5a                	jne    ffff800000104d3d <vsprintf+0x223>
ffff800000104ce3:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104ce7:	8b 00                	mov    (%rax),%eax
ffff800000104ce9:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104cec:	77 24                	ja     ffff800000104d12 <vsprintf+0x1f8>
ffff800000104cee:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104cf2:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104cf6:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104cfa:	8b 00                	mov    (%rax),%eax
ffff800000104cfc:	89 c0                	mov    %eax,%eax
ffff800000104cfe:	48 01 d0             	add    %rdx,%rax
ffff800000104d01:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104d05:	8b 12                	mov    (%rdx),%edx
ffff800000104d07:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104d0a:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104d0e:	89 0a                	mov    %ecx,(%rdx)
ffff800000104d10:	eb 14                	jmp    ffff800000104d26 <vsprintf+0x20c>
ffff800000104d12:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104d16:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104d1a:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104d1e:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104d22:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104d26:	8b 08                	mov    (%rax),%ecx
ffff800000104d28:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104d2c:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104d30:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104d34:	89 ca                	mov    %ecx,%edx
ffff800000104d36:	88 10                	mov    %dl,(%rax)
ffff800000104d38:	e9 71 01 00 00       	jmpq   ffff800000104eae <vsprintf+0x394>
ffff800000104d3d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104d41:	0f b6 00             	movzbl (%rax),%eax
ffff800000104d44:	3c 73                	cmp    $0x73,%al
ffff800000104d46:	0f 85 8f 00 00 00    	jne    ffff800000104ddb <vsprintf+0x2c1>
ffff800000104d4c:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104d50:	8b 00                	mov    (%rax),%eax
ffff800000104d52:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104d55:	77 24                	ja     ffff800000104d7b <vsprintf+0x261>
ffff800000104d57:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104d5b:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104d5f:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104d63:	8b 00                	mov    (%rax),%eax
ffff800000104d65:	89 c0                	mov    %eax,%eax
ffff800000104d67:	48 01 d0             	add    %rdx,%rax
ffff800000104d6a:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104d6e:	8b 12                	mov    (%rdx),%edx
ffff800000104d70:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104d73:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104d77:	89 0a                	mov    %ecx,(%rdx)
ffff800000104d79:	eb 14                	jmp    ffff800000104d8f <vsprintf+0x275>
ffff800000104d7b:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104d7f:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104d83:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104d87:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104d8b:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104d8f:	48 8b 00             	mov    (%rax),%rax
ffff800000104d92:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff800000104d96:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000104d9a:	0f b6 00             	movzbl (%rax),%eax
ffff800000104d9d:	84 c0                	test   %al,%al
ffff800000104d9f:	0f 84 08 01 00 00    	je     ffff800000104ead <vsprintf+0x393>
ffff800000104da5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000104da9:	0f b6 10             	movzbl (%rax),%edx
ffff800000104dac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104db0:	88 10                	mov    %dl,(%rax)
ffff800000104db2:	eb 17                	jmp    ffff800000104dcb <vsprintf+0x2b1>
ffff800000104db4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000104db8:	0f b6 10             	movzbl (%rax),%edx
ffff800000104dbb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104dbf:	88 10                	mov    %dl,(%rax)
ffff800000104dc1:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
ffff800000104dc6:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
ffff800000104dcb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000104dcf:	0f b6 00             	movzbl (%rax),%eax
ffff800000104dd2:	84 c0                	test   %al,%al
ffff800000104dd4:	75 de                	jne    ffff800000104db4 <vsprintf+0x29a>
ffff800000104dd6:	e9 d3 00 00 00       	jmpq   ffff800000104eae <vsprintf+0x394>
ffff800000104ddb:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104ddf:	0f b6 00             	movzbl (%rax),%eax
ffff800000104de2:	3c 78                	cmp    $0x78,%al
ffff800000104de4:	0f 85 c4 00 00 00    	jne    ffff800000104eae <vsprintf+0x394>
ffff800000104dea:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104dee:	8b 00                	mov    (%rax),%eax
ffff800000104df0:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104df3:	77 24                	ja     ffff800000104e19 <vsprintf+0x2ff>
ffff800000104df5:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104df9:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104dfd:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104e01:	8b 00                	mov    (%rax),%eax
ffff800000104e03:	89 c0                	mov    %eax,%eax
ffff800000104e05:	48 01 d0             	add    %rdx,%rax
ffff800000104e08:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104e0c:	8b 12                	mov    (%rdx),%edx
ffff800000104e0e:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104e11:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104e15:	89 0a                	mov    %ecx,(%rdx)
ffff800000104e17:	eb 14                	jmp    ffff800000104e2d <vsprintf+0x313>
ffff800000104e19:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104e1d:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104e21:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104e25:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104e29:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104e2d:	48 8b 00             	mov    (%rax),%rax
ffff800000104e30:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff800000104e34:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
ffff800000104e39:	75 2f                	jne    ffff800000104e6a <vsprintf+0x350>
ffff800000104e3b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104e3f:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104e43:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104e47:	c6 00 30             	movb   $0x30,(%rax)
ffff800000104e4a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104e4e:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104e52:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104e56:	c6 00 78             	movb   $0x78,(%rax)
ffff800000104e59:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104e5d:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104e61:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104e65:	c6 00 30             	movb   $0x30,(%rax)
ffff800000104e68:	eb 44                	jmp    ffff800000104eae <vsprintf+0x394>
ffff800000104e6a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104e6e:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104e72:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104e76:	c6 00 30             	movb   $0x30,(%rax)
ffff800000104e79:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104e7d:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104e81:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104e85:	c6 00 78             	movb   $0x78,(%rax)
ffff800000104e88:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000104e8c:	89 c2                	mov    %eax,%edx
ffff800000104e8e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104e92:	89 d6                	mov    %edx,%esi
ffff800000104e94:	48 89 c7             	mov    %rax,%rdi
ffff800000104e97:	48 b8 ac 8b ff ff ff 	movabs $0xffffffffffff8bac,%rax
ffff800000104e9e:	ff ff ff 
ffff800000104ea1:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000104ea5:	ff d0                	callq  *%rax
ffff800000104ea7:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000104eab:	eb 01                	jmp    ffff800000104eae <vsprintf+0x394>
ffff800000104ead:	90                   	nop
ffff800000104eae:	48 83 45 c0 01       	addq   $0x1,-0x40(%rbp)
ffff800000104eb3:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104eb7:	0f b6 00             	movzbl (%rax),%eax
ffff800000104eba:	84 c0                	test   %al,%al
ffff800000104ebc:	0f 85 9b fc ff ff    	jne    ffff800000104b5d <vsprintf+0x43>
ffff800000104ec2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000104ec6:	48 b8 18 42 01 00 00 	movabs $0x14218,%rax
ffff800000104ecd:	00 00 00 
ffff800000104ed0:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000104ed4:	48 29 c2             	sub    %rax,%rdx
ffff800000104ed7:	48 89 d0             	mov    %rdx,%rax
ffff800000104eda:	48 83 c4 40          	add    $0x40,%rsp
ffff800000104ede:	5b                   	pop    %rbx
ffff800000104edf:	5d                   	pop    %rbp
ffff800000104ee0:	c3                   	retq   

ffff800000104ee1 <printk>:
ffff800000104ee1:	55                   	push   %rbp
ffff800000104ee2:	48 89 e5             	mov    %rsp,%rbp
ffff800000104ee5:	53                   	push   %rbx
ffff800000104ee6:	48 81 ec e8 00 00 00 	sub    $0xe8,%rsp
ffff800000104eed:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000104eed <printk+0xc>
ffff800000104ef4:	49 bb 7b 6f 00 00 00 	movabs $0x6f7b,%r11
ffff800000104efb:	00 00 00 
ffff800000104efe:	4c 01 db             	add    %r11,%rbx
ffff800000104f01:	89 bd 1c ff ff ff    	mov    %edi,-0xe4(%rbp)
ffff800000104f07:	89 b5 18 ff ff ff    	mov    %esi,-0xe8(%rbp)
ffff800000104f0d:	48 89 95 10 ff ff ff 	mov    %rdx,-0xf0(%rbp)
ffff800000104f14:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
ffff800000104f1b:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
ffff800000104f22:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
ffff800000104f29:	84 c0                	test   %al,%al
ffff800000104f2b:	74 23                	je     ffff800000104f50 <printk+0x6f>
ffff800000104f2d:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
ffff800000104f34:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
ffff800000104f38:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
ffff800000104f3c:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
ffff800000104f40:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
ffff800000104f44:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
ffff800000104f48:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
ffff800000104f4c:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
ffff800000104f50:	c7 85 20 ff ff ff 18 	movl   $0x18,-0xe0(%rbp)
ffff800000104f57:	00 00 00 
ffff800000104f5a:	c7 85 24 ff ff ff 30 	movl   $0x30,-0xdc(%rbp)
ffff800000104f61:	00 00 00 
ffff800000104f64:	48 8d 45 10          	lea    0x10(%rbp),%rax
ffff800000104f68:	48 89 85 28 ff ff ff 	mov    %rax,-0xd8(%rbp)
ffff800000104f6f:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
ffff800000104f76:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
ffff800000104f7d:	48 8d 95 20 ff ff ff 	lea    -0xe0(%rbp),%rdx
ffff800000104f84:	48 8b 85 10 ff ff ff 	mov    -0xf0(%rbp),%rax
ffff800000104f8b:	48 89 d6             	mov    %rdx,%rsi
ffff800000104f8e:	48 89 c7             	mov    %rax,%rdi
ffff800000104f91:	48 b8 b2 8c ff ff ff 	movabs $0xffffffffffff8cb2,%rax
ffff800000104f98:	ff ff ff 
ffff800000104f9b:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000104f9f:	ff d0                	callq  *%rax
ffff800000104fa1:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%rbp)
ffff800000104fa7:	c7 85 3c ff ff ff 00 	movl   $0x0,-0xc4(%rbp)
ffff800000104fae:	00 00 00 
ffff800000104fb1:	e9 ac 02 00 00       	jmpq   ffff800000105262 <printk+0x381>
ffff800000104fb6:	8b 85 3c ff ff ff    	mov    -0xc4(%rbp),%eax
ffff800000104fbc:	48 63 d0             	movslq %eax,%rdx
ffff800000104fbf:	48 b8 18 42 01 00 00 	movabs $0x14218,%rax
ffff800000104fc6:	00 00 00 
ffff800000104fc9:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000104fcd:	48 01 d0             	add    %rdx,%rax
ffff800000104fd0:	0f b6 00             	movzbl (%rax),%eax
ffff800000104fd3:	3c 0a                	cmp    $0xa,%al
ffff800000104fd5:	75 36                	jne    ffff80000010500d <printk+0x12c>
ffff800000104fd7:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff800000104fde:	00 00 00 
ffff800000104fe1:	8b 44 03 0c          	mov    0xc(%rbx,%rax,1),%eax
ffff800000104fe5:	8d 50 01             	lea    0x1(%rax),%edx
ffff800000104fe8:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff800000104fef:	00 00 00 
ffff800000104ff2:	89 54 03 0c          	mov    %edx,0xc(%rbx,%rax,1)
ffff800000104ff6:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff800000104ffd:	00 00 00 
ffff800000105000:	c7 44 03 08 00 00 00 	movl   $0x0,0x8(%rbx,%rax,1)
ffff800000105007:	00 
ffff800000105008:	e9 4e 02 00 00       	jmpq   ffff80000010525b <printk+0x37a>
ffff80000010500d:	8b 85 3c ff ff ff    	mov    -0xc4(%rbp),%eax
ffff800000105013:	48 63 d0             	movslq %eax,%rdx
ffff800000105016:	48 b8 18 42 01 00 00 	movabs $0x14218,%rax
ffff80000010501d:	00 00 00 
ffff800000105020:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000105024:	48 01 d0             	add    %rdx,%rax
ffff800000105027:	0f b6 00             	movzbl (%rax),%eax
ffff80000010502a:	3c 08                	cmp    $0x8,%al
ffff80000010502c:	0f 85 68 01 00 00    	jne    ffff80000010519a <printk+0x2b9>
ffff800000105032:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff800000105039:	00 00 00 
ffff80000010503c:	8b 44 03 08          	mov    0x8(%rbx,%rax,1),%eax
ffff800000105040:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff800000105043:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff80000010504a:	00 00 00 
ffff80000010504d:	89 54 03 08          	mov    %edx,0x8(%rbx,%rax,1)
ffff800000105051:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff800000105058:	00 00 00 
ffff80000010505b:	8b 44 03 08          	mov    0x8(%rbx,%rax,1),%eax
ffff80000010505f:	85 c0                	test   %eax,%eax
ffff800000105061:	0f 89 b2 00 00 00    	jns    ffff800000105119 <printk+0x238>
ffff800000105067:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff80000010506e:	00 00 00 
ffff800000105071:	8b 04 03             	mov    (%rbx,%rax,1),%eax
ffff800000105074:	48 ba b8 52 01 00 00 	movabs $0x152b8,%rdx
ffff80000010507b:	00 00 00 
ffff80000010507e:	8b 7c 13 10          	mov    0x10(%rbx,%rdx,1),%edi
ffff800000105082:	99                   	cltd   
ffff800000105083:	f7 ff                	idiv   %edi
ffff800000105085:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff800000105088:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff80000010508f:	00 00 00 
ffff800000105092:	8b 44 03 10          	mov    0x10(%rbx,%rax,1),%eax
ffff800000105096:	0f af d0             	imul   %eax,%edx
ffff800000105099:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff8000001050a0:	00 00 00 
ffff8000001050a3:	89 54 03 08          	mov    %edx,0x8(%rbx,%rax,1)
ffff8000001050a7:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff8000001050ae:	00 00 00 
ffff8000001050b1:	8b 44 03 0c          	mov    0xc(%rbx,%rax,1),%eax
ffff8000001050b5:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff8000001050b8:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff8000001050bf:	00 00 00 
ffff8000001050c2:	89 54 03 0c          	mov    %edx,0xc(%rbx,%rax,1)
ffff8000001050c6:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff8000001050cd:	00 00 00 
ffff8000001050d0:	8b 44 03 0c          	mov    0xc(%rbx,%rax,1),%eax
ffff8000001050d4:	85 c0                	test   %eax,%eax
ffff8000001050d6:	79 41                	jns    ffff800000105119 <printk+0x238>
ffff8000001050d8:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff8000001050df:	00 00 00 
ffff8000001050e2:	8b 44 03 04          	mov    0x4(%rbx,%rax,1),%eax
ffff8000001050e6:	48 ba b8 52 01 00 00 	movabs $0x152b8,%rdx
ffff8000001050ed:	00 00 00 
ffff8000001050f0:	8b 74 13 14          	mov    0x14(%rbx,%rdx,1),%esi
ffff8000001050f4:	99                   	cltd   
ffff8000001050f5:	f7 fe                	idiv   %esi
ffff8000001050f7:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff8000001050fa:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff800000105101:	00 00 00 
ffff800000105104:	8b 44 03 14          	mov    0x14(%rbx,%rax,1),%eax
ffff800000105108:	0f af d0             	imul   %eax,%edx
ffff80000010510b:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff800000105112:	00 00 00 
ffff800000105115:	89 54 03 0c          	mov    %edx,0xc(%rbx,%rax,1)
ffff800000105119:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff800000105120:	00 00 00 
ffff800000105123:	8b 54 03 0c          	mov    0xc(%rbx,%rax,1),%edx
ffff800000105127:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff80000010512e:	00 00 00 
ffff800000105131:	8b 44 03 14          	mov    0x14(%rbx,%rax,1),%eax
ffff800000105135:	89 d1                	mov    %edx,%ecx
ffff800000105137:	0f af c8             	imul   %eax,%ecx
ffff80000010513a:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff800000105141:	00 00 00 
ffff800000105144:	8b 54 03 08          	mov    0x8(%rbx,%rax,1),%edx
ffff800000105148:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff80000010514f:	00 00 00 
ffff800000105152:	8b 44 03 10          	mov    0x10(%rbx,%rax,1),%eax
ffff800000105156:	0f af d0             	imul   %eax,%edx
ffff800000105159:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff800000105160:	00 00 00 
ffff800000105163:	8b 34 03             	mov    (%rbx,%rax,1),%esi
ffff800000105166:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff80000010516d:	00 00 00 
ffff800000105170:	48 8b 44 03 18       	mov    0x18(%rbx,%rax,1),%rax
ffff800000105175:	6a 20                	pushq  $0x20
ffff800000105177:	41 b9 ff ff ff 00    	mov    $0xffffff,%r9d
ffff80000010517d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
ffff800000105183:	48 89 c7             	mov    %rax,%rdi
ffff800000105186:	48 b8 a5 8a ff ff ff 	movabs $0xffffffffffff8aa5,%rax
ffff80000010518d:	ff ff ff 
ffff800000105190:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000105194:	ff d0                	callq  *%rax
ffff800000105196:	48 83 c4 08          	add    $0x8,%rsp
ffff80000010519a:	8b 85 3c ff ff ff    	mov    -0xc4(%rbp),%eax
ffff8000001051a0:	48 63 d0             	movslq %eax,%rdx
ffff8000001051a3:	48 b8 18 42 01 00 00 	movabs $0x14218,%rax
ffff8000001051aa:	00 00 00 
ffff8000001051ad:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001051b1:	48 01 d0             	add    %rdx,%rax
ffff8000001051b4:	0f b6 00             	movzbl (%rax),%eax
ffff8000001051b7:	0f b6 f8             	movzbl %al,%edi
ffff8000001051ba:	44 8b 8d 18 ff ff ff 	mov    -0xe8(%rbp),%r9d
ffff8000001051c1:	44 8b 85 1c ff ff ff 	mov    -0xe4(%rbp),%r8d
ffff8000001051c8:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff8000001051cf:	00 00 00 
ffff8000001051d2:	8b 54 03 0c          	mov    0xc(%rbx,%rax,1),%edx
ffff8000001051d6:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff8000001051dd:	00 00 00 
ffff8000001051e0:	8b 44 03 14          	mov    0x14(%rbx,%rax,1),%eax
ffff8000001051e4:	89 d1                	mov    %edx,%ecx
ffff8000001051e6:	0f af c8             	imul   %eax,%ecx
ffff8000001051e9:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff8000001051f0:	00 00 00 
ffff8000001051f3:	8b 54 03 08          	mov    0x8(%rbx,%rax,1),%edx
ffff8000001051f7:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff8000001051fe:	00 00 00 
ffff800000105201:	8b 44 03 10          	mov    0x10(%rbx,%rax,1),%eax
ffff800000105205:	0f af d0             	imul   %eax,%edx
ffff800000105208:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff80000010520f:	00 00 00 
ffff800000105212:	8b 34 03             	mov    (%rbx,%rax,1),%esi
ffff800000105215:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff80000010521c:	00 00 00 
ffff80000010521f:	48 8b 44 03 18       	mov    0x18(%rbx,%rax,1),%rax
ffff800000105224:	57                   	push   %rdi
ffff800000105225:	48 89 c7             	mov    %rax,%rdi
ffff800000105228:	48 b8 a5 8a ff ff ff 	movabs $0xffffffffffff8aa5,%rax
ffff80000010522f:	ff ff ff 
ffff800000105232:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000105236:	ff d0                	callq  *%rax
ffff800000105238:	48 83 c4 08          	add    $0x8,%rsp
ffff80000010523c:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff800000105243:	00 00 00 
ffff800000105246:	8b 44 03 08          	mov    0x8(%rbx,%rax,1),%eax
ffff80000010524a:	8d 50 01             	lea    0x1(%rax),%edx
ffff80000010524d:	48 b8 b8 52 01 00 00 	movabs $0x152b8,%rax
ffff800000105254:	00 00 00 
ffff800000105257:	89 54 03 08          	mov    %edx,0x8(%rbx,%rax,1)
ffff80000010525b:	83 85 3c ff ff ff 01 	addl   $0x1,-0xc4(%rbp)
ffff800000105262:	8b 85 3c ff ff ff    	mov    -0xc4(%rbp),%eax
ffff800000105268:	3b 85 38 ff ff ff    	cmp    -0xc8(%rbp),%eax
ffff80000010526e:	0f 8c 42 fd ff ff    	jl     ffff800000104fb6 <printk+0xd5>
ffff800000105274:	90                   	nop
ffff800000105275:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
ffff800000105279:	c9                   	leaveq 
ffff80000010527a:	c3                   	retq   

ffff80000010527b <do_divide_error>:
ffff80000010527b:	55                   	push   %rbp
ffff80000010527c:	48 89 e5             	mov    %rsp,%rbp
ffff80000010527f:	41 57                	push   %r15
ffff800000105281:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000105285:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff800000105285 <do_divide_error+0xa>
ffff80000010528c:	49 bb e3 6b 00 00 00 	movabs $0x6be3,%r11
ffff800000105293:	00 00 00 
ffff800000105296:	4d 01 da             	add    %r11,%r10
ffff800000105299:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff80000010529d:	89 75 d4             	mov    %esi,-0x2c(%rbp)
ffff8000001052a0:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001052a7:	00 
ffff8000001052a8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001052ac:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001052b2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001052b6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001052ba:	48 8b 08             	mov    (%rax),%rcx
ffff8000001052bd:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001052c1:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff8000001052c4:	49 89 c9             	mov    %rcx,%r9
ffff8000001052c7:	49 89 d0             	mov    %rdx,%r8
ffff8000001052ca:	89 c1                	mov    %eax,%ecx
ffff8000001052cc:	48 b8 80 10 00 00 00 	movabs $0x1080,%rax
ffff8000001052d3:	00 00 00 
ffff8000001052d6:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff8000001052da:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001052df:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001052e4:	4d 89 d7             	mov    %r10,%r15
ffff8000001052e7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001052ec:	49 bb 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r11
ffff8000001052f3:	ff ff ff 
ffff8000001052f6:	4d 01 d3             	add    %r10,%r11
ffff8000001052f9:	41 ff d3             	callq  *%r11
ffff8000001052fc:	eb fe                	jmp    ffff8000001052fc <do_divide_error+0x81>

ffff8000001052fe <do_debug>:
ffff8000001052fe:	55                   	push   %rbp
ffff8000001052ff:	48 89 e5             	mov    %rsp,%rbp
ffff800000105302:	41 57                	push   %r15
ffff800000105304:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000105308:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff800000105308 <do_debug+0xa>
ffff80000010530f:	49 bb 60 6b 00 00 00 	movabs $0x6b60,%r11
ffff800000105316:	00 00 00 
ffff800000105319:	4d 01 da             	add    %r11,%r10
ffff80000010531c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105320:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105324:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff80000010532b:	00 
ffff80000010532c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105330:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105336:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff80000010533a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010533e:	48 8b 08             	mov    (%rax),%rcx
ffff800000105341:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105345:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105349:	49 89 c9             	mov    %rcx,%r9
ffff80000010534c:	49 89 d0             	mov    %rdx,%r8
ffff80000010534f:	48 89 c1             	mov    %rax,%rcx
ffff800000105352:	48 b8 b0 10 00 00 00 	movabs $0x10b0,%rax
ffff800000105359:	00 00 00 
ffff80000010535c:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000105360:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105365:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010536a:	4d 89 d7             	mov    %r10,%r15
ffff80000010536d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105372:	49 bb 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r11
ffff800000105379:	ff ff ff 
ffff80000010537c:	4d 01 d3             	add    %r10,%r11
ffff80000010537f:	41 ff d3             	callq  *%r11
ffff800000105382:	eb fe                	jmp    ffff800000105382 <do_debug+0x84>

ffff800000105384 <do_nmi>:
ffff800000105384:	55                   	push   %rbp
ffff800000105385:	48 89 e5             	mov    %rsp,%rbp
ffff800000105388:	41 57                	push   %r15
ffff80000010538a:	48 83 ec 28          	sub    $0x28,%rsp
ffff80000010538e:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff80000010538e <do_nmi+0xa>
ffff800000105395:	49 bb da 6a 00 00 00 	movabs $0x6ada,%r11
ffff80000010539c:	00 00 00 
ffff80000010539f:	4d 01 da             	add    %r11,%r10
ffff8000001053a2:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001053a6:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001053aa:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001053b1:	00 
ffff8000001053b2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001053b6:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001053bc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001053c0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001053c4:	48 8b 08             	mov    (%rax),%rcx
ffff8000001053c7:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001053cb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001053cf:	49 89 c9             	mov    %rcx,%r9
ffff8000001053d2:	49 89 d0             	mov    %rdx,%r8
ffff8000001053d5:	48 89 c1             	mov    %rax,%rcx
ffff8000001053d8:	48 b8 d8 10 00 00 00 	movabs $0x10d8,%rax
ffff8000001053df:	00 00 00 
ffff8000001053e2:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff8000001053e6:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001053eb:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001053f0:	4d 89 d7             	mov    %r10,%r15
ffff8000001053f3:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001053f8:	49 bb 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r11
ffff8000001053ff:	ff ff ff 
ffff800000105402:	4d 01 d3             	add    %r10,%r11
ffff800000105405:	41 ff d3             	callq  *%r11
ffff800000105408:	eb fe                	jmp    ffff800000105408 <do_nmi+0x84>

ffff80000010540a <do_breakpoint>:
ffff80000010540a:	55                   	push   %rbp
ffff80000010540b:	48 89 e5             	mov    %rsp,%rbp
ffff80000010540e:	41 57                	push   %r15
ffff800000105410:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000105414:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff800000105414 <do_breakpoint+0xa>
ffff80000010541b:	49 bb 54 6a 00 00 00 	movabs $0x6a54,%r11
ffff800000105422:	00 00 00 
ffff800000105425:	4d 01 da             	add    %r11,%r10
ffff800000105428:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff80000010542c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105430:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105437:	00 
ffff800000105438:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010543c:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105442:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105446:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010544a:	48 8b 08             	mov    (%rax),%rcx
ffff80000010544d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105451:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105455:	49 89 c9             	mov    %rcx,%r9
ffff800000105458:	49 89 d0             	mov    %rdx,%r8
ffff80000010545b:	48 89 c1             	mov    %rax,%rcx
ffff80000010545e:	48 b8 08 11 00 00 00 	movabs $0x1108,%rax
ffff800000105465:	00 00 00 
ffff800000105468:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff80000010546c:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105471:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105476:	4d 89 d7             	mov    %r10,%r15
ffff800000105479:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010547e:	49 bb 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r11
ffff800000105485:	ff ff ff 
ffff800000105488:	4d 01 d3             	add    %r10,%r11
ffff80000010548b:	41 ff d3             	callq  *%r11
ffff80000010548e:	eb fe                	jmp    ffff80000010548e <do_breakpoint+0x84>

ffff800000105490 <do_overflow>:
ffff800000105490:	55                   	push   %rbp
ffff800000105491:	48 89 e5             	mov    %rsp,%rbp
ffff800000105494:	41 57                	push   %r15
ffff800000105496:	48 83 ec 28          	sub    $0x28,%rsp
ffff80000010549a:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff80000010549a <do_overflow+0xa>
ffff8000001054a1:	49 bb ce 69 00 00 00 	movabs $0x69ce,%r11
ffff8000001054a8:	00 00 00 
ffff8000001054ab:	4d 01 da             	add    %r11,%r10
ffff8000001054ae:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001054b2:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001054b6:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001054bd:	00 
ffff8000001054be:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001054c2:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001054c8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001054cc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001054d0:	48 8b 08             	mov    (%rax),%rcx
ffff8000001054d3:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001054d7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001054db:	49 89 c9             	mov    %rcx,%r9
ffff8000001054de:	49 89 d0             	mov    %rdx,%r8
ffff8000001054e1:	48 89 c1             	mov    %rax,%rcx
ffff8000001054e4:	48 b8 38 11 00 00 00 	movabs $0x1138,%rax
ffff8000001054eb:	00 00 00 
ffff8000001054ee:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff8000001054f2:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001054f7:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001054fc:	4d 89 d7             	mov    %r10,%r15
ffff8000001054ff:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105504:	49 bb 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r11
ffff80000010550b:	ff ff ff 
ffff80000010550e:	4d 01 d3             	add    %r10,%r11
ffff800000105511:	41 ff d3             	callq  *%r11
ffff800000105514:	eb fe                	jmp    ffff800000105514 <do_overflow+0x84>

ffff800000105516 <do_bounds>:
ffff800000105516:	55                   	push   %rbp
ffff800000105517:	48 89 e5             	mov    %rsp,%rbp
ffff80000010551a:	41 57                	push   %r15
ffff80000010551c:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000105520:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff800000105520 <do_bounds+0xa>
ffff800000105527:	49 bb 48 69 00 00 00 	movabs $0x6948,%r11
ffff80000010552e:	00 00 00 
ffff800000105531:	4d 01 da             	add    %r11,%r10
ffff800000105534:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105538:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff80000010553c:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105543:	00 
ffff800000105544:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105548:	48 05 98 00 00 00    	add    $0x98,%rax
ffff80000010554e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105552:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105556:	48 8b 08             	mov    (%rax),%rcx
ffff800000105559:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff80000010555d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105561:	49 89 c9             	mov    %rcx,%r9
ffff800000105564:	49 89 d0             	mov    %rdx,%r8
ffff800000105567:	48 89 c1             	mov    %rax,%rcx
ffff80000010556a:	48 b8 68 11 00 00 00 	movabs $0x1168,%rax
ffff800000105571:	00 00 00 
ffff800000105574:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000105578:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010557d:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105582:	4d 89 d7             	mov    %r10,%r15
ffff800000105585:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010558a:	49 bb 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r11
ffff800000105591:	ff ff ff 
ffff800000105594:	4d 01 d3             	add    %r10,%r11
ffff800000105597:	41 ff d3             	callq  *%r11
ffff80000010559a:	eb fe                	jmp    ffff80000010559a <do_bounds+0x84>

ffff80000010559c <do_undefined_opcode>:
ffff80000010559c:	55                   	push   %rbp
ffff80000010559d:	48 89 e5             	mov    %rsp,%rbp
ffff8000001055a0:	41 57                	push   %r15
ffff8000001055a2:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001055a6:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001055a6 <do_undefined_opcode+0xa>
ffff8000001055ad:	49 bb c2 68 00 00 00 	movabs $0x68c2,%r11
ffff8000001055b4:	00 00 00 
ffff8000001055b7:	4d 01 da             	add    %r11,%r10
ffff8000001055ba:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001055be:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001055c2:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001055c9:	00 
ffff8000001055ca:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001055ce:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001055d4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001055d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001055dc:	48 8b 08             	mov    (%rax),%rcx
ffff8000001055df:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001055e3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001055e7:	49 89 c9             	mov    %rcx,%r9
ffff8000001055ea:	49 89 d0             	mov    %rdx,%r8
ffff8000001055ed:	48 89 c1             	mov    %rax,%rcx
ffff8000001055f0:	48 b8 a0 11 00 00 00 	movabs $0x11a0,%rax
ffff8000001055f7:	00 00 00 
ffff8000001055fa:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff8000001055fe:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105603:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105608:	4d 89 d7             	mov    %r10,%r15
ffff80000010560b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105610:	49 bb 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r11
ffff800000105617:	ff ff ff 
ffff80000010561a:	4d 01 d3             	add    %r10,%r11
ffff80000010561d:	41 ff d3             	callq  *%r11
ffff800000105620:	eb fe                	jmp    ffff800000105620 <do_undefined_opcode+0x84>

ffff800000105622 <do_dev_not_available>:
ffff800000105622:	55                   	push   %rbp
ffff800000105623:	48 89 e5             	mov    %rsp,%rbp
ffff800000105626:	41 57                	push   %r15
ffff800000105628:	48 83 ec 28          	sub    $0x28,%rsp
ffff80000010562c:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff80000010562c <do_dev_not_available+0xa>
ffff800000105633:	49 bb 3c 68 00 00 00 	movabs $0x683c,%r11
ffff80000010563a:	00 00 00 
ffff80000010563d:	4d 01 da             	add    %r11,%r10
ffff800000105640:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105644:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105648:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff80000010564f:	00 
ffff800000105650:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105654:	48 05 98 00 00 00    	add    $0x98,%rax
ffff80000010565a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff80000010565e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105662:	48 8b 08             	mov    (%rax),%rcx
ffff800000105665:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105669:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010566d:	49 89 c9             	mov    %rcx,%r9
ffff800000105670:	49 89 d0             	mov    %rdx,%r8
ffff800000105673:	48 89 c1             	mov    %rax,%rcx
ffff800000105676:	48 b8 e8 11 00 00 00 	movabs $0x11e8,%rax
ffff80000010567d:	00 00 00 
ffff800000105680:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000105684:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105689:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010568e:	4d 89 d7             	mov    %r10,%r15
ffff800000105691:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105696:	49 bb 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r11
ffff80000010569d:	ff ff ff 
ffff8000001056a0:	4d 01 d3             	add    %r10,%r11
ffff8000001056a3:	41 ff d3             	callq  *%r11
ffff8000001056a6:	eb fe                	jmp    ffff8000001056a6 <do_dev_not_available+0x84>

ffff8000001056a8 <do_double_fault>:
ffff8000001056a8:	55                   	push   %rbp
ffff8000001056a9:	48 89 e5             	mov    %rsp,%rbp
ffff8000001056ac:	41 57                	push   %r15
ffff8000001056ae:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001056b2:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001056b2 <do_double_fault+0xa>
ffff8000001056b9:	49 bb b6 67 00 00 00 	movabs $0x67b6,%r11
ffff8000001056c0:	00 00 00 
ffff8000001056c3:	4d 01 da             	add    %r11,%r10
ffff8000001056c6:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001056ca:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001056ce:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001056d5:	00 
ffff8000001056d6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001056da:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001056e0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001056e4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001056e8:	48 8b 08             	mov    (%rax),%rcx
ffff8000001056eb:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001056ef:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001056f3:	49 89 c9             	mov    %rcx,%r9
ffff8000001056f6:	49 89 d0             	mov    %rdx,%r8
ffff8000001056f9:	48 89 c1             	mov    %rax,%rcx
ffff8000001056fc:	48 b8 38 12 00 00 00 	movabs $0x1238,%rax
ffff800000105703:	00 00 00 
ffff800000105706:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff80000010570a:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010570f:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105714:	4d 89 d7             	mov    %r10,%r15
ffff800000105717:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010571c:	49 bb 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r11
ffff800000105723:	ff ff ff 
ffff800000105726:	4d 01 d3             	add    %r10,%r11
ffff800000105729:	41 ff d3             	callq  *%r11
ffff80000010572c:	eb fe                	jmp    ffff80000010572c <do_double_fault+0x84>

ffff80000010572e <do_coprocessor_segment_overrun>:
ffff80000010572e:	55                   	push   %rbp
ffff80000010572f:	48 89 e5             	mov    %rsp,%rbp
ffff800000105732:	41 57                	push   %r15
ffff800000105734:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000105738:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff800000105738 <do_coprocessor_segment_overrun+0xa>
ffff80000010573f:	49 bb 30 67 00 00 00 	movabs $0x6730,%r11
ffff800000105746:	00 00 00 
ffff800000105749:	4d 01 da             	add    %r11,%r10
ffff80000010574c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105750:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105754:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff80000010575b:	00 
ffff80000010575c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105760:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105766:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff80000010576a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010576e:	48 8b 08             	mov    (%rax),%rcx
ffff800000105771:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105775:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105779:	49 89 c9             	mov    %rcx,%r9
ffff80000010577c:	49 89 d0             	mov    %rdx,%r8
ffff80000010577f:	48 89 c1             	mov    %rax,%rcx
ffff800000105782:	48 b8 68 12 00 00 00 	movabs $0x1268,%rax
ffff800000105789:	00 00 00 
ffff80000010578c:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000105790:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105795:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010579a:	4d 89 d7             	mov    %r10,%r15
ffff80000010579d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001057a2:	49 bb 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r11
ffff8000001057a9:	ff ff ff 
ffff8000001057ac:	4d 01 d3             	add    %r10,%r11
ffff8000001057af:	41 ff d3             	callq  *%r11
ffff8000001057b2:	eb fe                	jmp    ffff8000001057b2 <do_coprocessor_segment_overrun+0x84>

ffff8000001057b4 <do_invalid_TSS>:
ffff8000001057b4:	55                   	push   %rbp
ffff8000001057b5:	48 89 e5             	mov    %rsp,%rbp
ffff8000001057b8:	41 57                	push   %r15
ffff8000001057ba:	53                   	push   %rbx
ffff8000001057bb:	48 83 ec 20          	sub    $0x20,%rsp
ffff8000001057bf:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff8000001057bf <do_invalid_TSS+0xb>
ffff8000001057c6:	49 bb a9 66 00 00 00 	movabs $0x66a9,%r11
ffff8000001057cd:	00 00 00 
ffff8000001057d0:	4c 01 db             	add    %r11,%rbx
ffff8000001057d3:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001057d7:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001057db:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001057e2:	00 
ffff8000001057e3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001057e7:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001057ed:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001057f1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001057f5:	48 8b 08             	mov    (%rax),%rcx
ffff8000001057f8:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001057fc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105800:	49 89 c9             	mov    %rcx,%r9
ffff800000105803:	49 89 d0             	mov    %rdx,%r8
ffff800000105806:	48 89 c1             	mov    %rax,%rcx
ffff800000105809:	48 b8 b8 12 00 00 00 	movabs $0x12b8,%rax
ffff800000105810:	00 00 00 
ffff800000105813:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105817:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010581c:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105821:	49 89 df             	mov    %rbx,%r15
ffff800000105824:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105829:	49 ba 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r10
ffff800000105830:	ff ff ff 
ffff800000105833:	49 01 da             	add    %rbx,%r10
ffff800000105836:	41 ff d2             	callq  *%r10
ffff800000105839:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010583d:	83 e0 01             	and    $0x1,%eax
ffff800000105840:	48 85 c0             	test   %rax,%rax
ffff800000105843:	74 2f                	je     ffff800000105874 <do_invalid_TSS+0xc0>
ffff800000105845:	48 b8 e8 12 00 00 00 	movabs $0x12e8,%rax
ffff80000010584c:	00 00 00 
ffff80000010584f:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105853:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105858:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010585d:	49 89 df             	mov    %rbx,%r15
ffff800000105860:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105865:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff80000010586c:	ff ff ff 
ffff80000010586f:	48 01 d9             	add    %rbx,%rcx
ffff800000105872:	ff d1                	callq  *%rcx
ffff800000105874:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105878:	83 e0 02             	and    $0x2,%eax
ffff80000010587b:	48 85 c0             	test   %rax,%rax
ffff80000010587e:	74 31                	je     ffff8000001058b1 <do_invalid_TSS+0xfd>
ffff800000105880:	48 b8 68 13 00 00 00 	movabs $0x1368,%rax
ffff800000105887:	00 00 00 
ffff80000010588a:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010588e:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105893:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105898:	49 89 df             	mov    %rbx,%r15
ffff80000010589b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001058a0:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff8000001058a7:	ff ff ff 
ffff8000001058aa:	48 01 d9             	add    %rbx,%rcx
ffff8000001058ad:	ff d1                	callq  *%rcx
ffff8000001058af:	eb 2f                	jmp    ffff8000001058e0 <do_invalid_TSS+0x12c>
ffff8000001058b1:	48 b8 98 13 00 00 00 	movabs $0x1398,%rax
ffff8000001058b8:	00 00 00 
ffff8000001058bb:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001058bf:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001058c4:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001058c9:	49 89 df             	mov    %rbx,%r15
ffff8000001058cc:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001058d1:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff8000001058d8:	ff ff ff 
ffff8000001058db:	48 01 d9             	add    %rbx,%rcx
ffff8000001058de:	ff d1                	callq  *%rcx
ffff8000001058e0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001058e4:	83 e0 02             	and    $0x2,%eax
ffff8000001058e7:	48 85 c0             	test   %rax,%rax
ffff8000001058ea:	75 6c                	jne    ffff800000105958 <do_invalid_TSS+0x1a4>
ffff8000001058ec:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001058f0:	83 e0 04             	and    $0x4,%eax
ffff8000001058f3:	48 85 c0             	test   %rax,%rax
ffff8000001058f6:	74 31                	je     ffff800000105929 <do_invalid_TSS+0x175>
ffff8000001058f8:	48 b8 d0 13 00 00 00 	movabs $0x13d0,%rax
ffff8000001058ff:	00 00 00 
ffff800000105902:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105906:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010590b:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105910:	49 89 df             	mov    %rbx,%r15
ffff800000105913:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105918:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff80000010591f:	ff ff ff 
ffff800000105922:	48 01 d9             	add    %rbx,%rcx
ffff800000105925:	ff d1                	callq  *%rcx
ffff800000105927:	eb 2f                	jmp    ffff800000105958 <do_invalid_TSS+0x1a4>
ffff800000105929:	48 b8 08 14 00 00 00 	movabs $0x1408,%rax
ffff800000105930:	00 00 00 
ffff800000105933:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105937:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010593c:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105941:	49 89 df             	mov    %rbx,%r15
ffff800000105944:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105949:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff800000105950:	ff ff ff 
ffff800000105953:	48 01 d9             	add    %rbx,%rcx
ffff800000105956:	ff d1                	callq  *%rcx
ffff800000105958:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010595c:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff800000105961:	48 89 c1             	mov    %rax,%rcx
ffff800000105964:	48 b8 34 14 00 00 00 	movabs $0x1434,%rax
ffff80000010596b:	00 00 00 
ffff80000010596e:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105972:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105977:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010597c:	49 89 df             	mov    %rbx,%r15
ffff80000010597f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105984:	49 b8 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r8
ffff80000010598b:	ff ff ff 
ffff80000010598e:	49 01 d8             	add    %rbx,%r8
ffff800000105991:	41 ff d0             	callq  *%r8
ffff800000105994:	eb fe                	jmp    ffff800000105994 <do_invalid_TSS+0x1e0>

ffff800000105996 <do_segment_not_present>:
ffff800000105996:	55                   	push   %rbp
ffff800000105997:	48 89 e5             	mov    %rsp,%rbp
ffff80000010599a:	41 57                	push   %r15
ffff80000010599c:	53                   	push   %rbx
ffff80000010599d:	48 83 ec 20          	sub    $0x20,%rsp
ffff8000001059a1:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff8000001059a1 <do_segment_not_present+0xb>
ffff8000001059a8:	49 bb c7 64 00 00 00 	movabs $0x64c7,%r11
ffff8000001059af:	00 00 00 
ffff8000001059b2:	4c 01 db             	add    %r11,%rbx
ffff8000001059b5:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001059b9:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001059bd:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001059c4:	00 
ffff8000001059c5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001059c9:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001059cf:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001059d3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001059d7:	48 8b 08             	mov    (%rax),%rcx
ffff8000001059da:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001059de:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001059e2:	49 89 c9             	mov    %rcx,%r9
ffff8000001059e5:	49 89 d0             	mov    %rdx,%r8
ffff8000001059e8:	48 89 c1             	mov    %rax,%rcx
ffff8000001059eb:	48 b8 50 14 00 00 00 	movabs $0x1450,%rax
ffff8000001059f2:	00 00 00 
ffff8000001059f5:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001059f9:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001059fe:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105a03:	49 89 df             	mov    %rbx,%r15
ffff800000105a06:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105a0b:	49 ba 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r10
ffff800000105a12:	ff ff ff 
ffff800000105a15:	49 01 da             	add    %rbx,%r10
ffff800000105a18:	41 ff d2             	callq  *%r10
ffff800000105a1b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105a1f:	83 e0 01             	and    $0x1,%eax
ffff800000105a22:	48 85 c0             	test   %rax,%rax
ffff800000105a25:	74 2f                	je     ffff800000105a56 <do_segment_not_present+0xc0>
ffff800000105a27:	48 b8 e8 12 00 00 00 	movabs $0x12e8,%rax
ffff800000105a2e:	00 00 00 
ffff800000105a31:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105a35:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105a3a:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105a3f:	49 89 df             	mov    %rbx,%r15
ffff800000105a42:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105a47:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff800000105a4e:	ff ff ff 
ffff800000105a51:	48 01 d9             	add    %rbx,%rcx
ffff800000105a54:	ff d1                	callq  *%rcx
ffff800000105a56:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105a5a:	83 e0 02             	and    $0x2,%eax
ffff800000105a5d:	48 85 c0             	test   %rax,%rax
ffff800000105a60:	74 31                	je     ffff800000105a93 <do_segment_not_present+0xfd>
ffff800000105a62:	48 b8 68 13 00 00 00 	movabs $0x1368,%rax
ffff800000105a69:	00 00 00 
ffff800000105a6c:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105a70:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105a75:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105a7a:	49 89 df             	mov    %rbx,%r15
ffff800000105a7d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105a82:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff800000105a89:	ff ff ff 
ffff800000105a8c:	48 01 d9             	add    %rbx,%rcx
ffff800000105a8f:	ff d1                	callq  *%rcx
ffff800000105a91:	eb 2f                	jmp    ffff800000105ac2 <do_segment_not_present+0x12c>
ffff800000105a93:	48 b8 98 13 00 00 00 	movabs $0x1398,%rax
ffff800000105a9a:	00 00 00 
ffff800000105a9d:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105aa1:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105aa6:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105aab:	49 89 df             	mov    %rbx,%r15
ffff800000105aae:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105ab3:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff800000105aba:	ff ff ff 
ffff800000105abd:	48 01 d9             	add    %rbx,%rcx
ffff800000105ac0:	ff d1                	callq  *%rcx
ffff800000105ac2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105ac6:	83 e0 02             	and    $0x2,%eax
ffff800000105ac9:	48 85 c0             	test   %rax,%rax
ffff800000105acc:	75 6c                	jne    ffff800000105b3a <do_segment_not_present+0x1a4>
ffff800000105ace:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105ad2:	83 e0 04             	and    $0x4,%eax
ffff800000105ad5:	48 85 c0             	test   %rax,%rax
ffff800000105ad8:	74 31                	je     ffff800000105b0b <do_segment_not_present+0x175>
ffff800000105ada:	48 b8 d0 13 00 00 00 	movabs $0x13d0,%rax
ffff800000105ae1:	00 00 00 
ffff800000105ae4:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105ae8:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105aed:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105af2:	49 89 df             	mov    %rbx,%r15
ffff800000105af5:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105afa:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff800000105b01:	ff ff ff 
ffff800000105b04:	48 01 d9             	add    %rbx,%rcx
ffff800000105b07:	ff d1                	callq  *%rcx
ffff800000105b09:	eb 2f                	jmp    ffff800000105b3a <do_segment_not_present+0x1a4>
ffff800000105b0b:	48 b8 08 14 00 00 00 	movabs $0x1408,%rax
ffff800000105b12:	00 00 00 
ffff800000105b15:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105b19:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105b1e:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105b23:	49 89 df             	mov    %rbx,%r15
ffff800000105b26:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105b2b:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff800000105b32:	ff ff ff 
ffff800000105b35:	48 01 d9             	add    %rbx,%rcx
ffff800000105b38:	ff d1                	callq  *%rcx
ffff800000105b3a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105b3e:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff800000105b43:	48 89 c1             	mov    %rax,%rcx
ffff800000105b46:	48 b8 34 14 00 00 00 	movabs $0x1434,%rax
ffff800000105b4d:	00 00 00 
ffff800000105b50:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105b54:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105b59:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105b5e:	49 89 df             	mov    %rbx,%r15
ffff800000105b61:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105b66:	49 b8 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r8
ffff800000105b6d:	ff ff ff 
ffff800000105b70:	49 01 d8             	add    %rbx,%r8
ffff800000105b73:	41 ff d0             	callq  *%r8
ffff800000105b76:	eb fe                	jmp    ffff800000105b76 <do_segment_not_present+0x1e0>

ffff800000105b78 <do_stack_segment_fault>:
ffff800000105b78:	55                   	push   %rbp
ffff800000105b79:	48 89 e5             	mov    %rsp,%rbp
ffff800000105b7c:	41 57                	push   %r15
ffff800000105b7e:	53                   	push   %rbx
ffff800000105b7f:	48 83 ec 20          	sub    $0x20,%rsp
ffff800000105b83:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000105b83 <do_stack_segment_fault+0xb>
ffff800000105b8a:	49 bb e5 62 00 00 00 	movabs $0x62e5,%r11
ffff800000105b91:	00 00 00 
ffff800000105b94:	4c 01 db             	add    %r11,%rbx
ffff800000105b97:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105b9b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105b9f:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105ba6:	00 
ffff800000105ba7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105bab:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105bb1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105bb5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105bb9:	48 8b 08             	mov    (%rax),%rcx
ffff800000105bbc:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105bc0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105bc4:	49 89 c9             	mov    %rcx,%r9
ffff800000105bc7:	49 89 d0             	mov    %rdx,%r8
ffff800000105bca:	48 89 c1             	mov    %rax,%rcx
ffff800000105bcd:	48 b8 88 14 00 00 00 	movabs $0x1488,%rax
ffff800000105bd4:	00 00 00 
ffff800000105bd7:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105bdb:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105be0:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105be5:	49 89 df             	mov    %rbx,%r15
ffff800000105be8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105bed:	49 ba 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r10
ffff800000105bf4:	ff ff ff 
ffff800000105bf7:	49 01 da             	add    %rbx,%r10
ffff800000105bfa:	41 ff d2             	callq  *%r10
ffff800000105bfd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105c01:	83 e0 01             	and    $0x1,%eax
ffff800000105c04:	48 85 c0             	test   %rax,%rax
ffff800000105c07:	74 2f                	je     ffff800000105c38 <do_stack_segment_fault+0xc0>
ffff800000105c09:	48 b8 e8 12 00 00 00 	movabs $0x12e8,%rax
ffff800000105c10:	00 00 00 
ffff800000105c13:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105c17:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105c1c:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105c21:	49 89 df             	mov    %rbx,%r15
ffff800000105c24:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105c29:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff800000105c30:	ff ff ff 
ffff800000105c33:	48 01 d9             	add    %rbx,%rcx
ffff800000105c36:	ff d1                	callq  *%rcx
ffff800000105c38:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105c3c:	83 e0 02             	and    $0x2,%eax
ffff800000105c3f:	48 85 c0             	test   %rax,%rax
ffff800000105c42:	74 31                	je     ffff800000105c75 <do_stack_segment_fault+0xfd>
ffff800000105c44:	48 b8 68 13 00 00 00 	movabs $0x1368,%rax
ffff800000105c4b:	00 00 00 
ffff800000105c4e:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105c52:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105c57:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105c5c:	49 89 df             	mov    %rbx,%r15
ffff800000105c5f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105c64:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff800000105c6b:	ff ff ff 
ffff800000105c6e:	48 01 d9             	add    %rbx,%rcx
ffff800000105c71:	ff d1                	callq  *%rcx
ffff800000105c73:	eb 2f                	jmp    ffff800000105ca4 <do_stack_segment_fault+0x12c>
ffff800000105c75:	48 b8 98 13 00 00 00 	movabs $0x1398,%rax
ffff800000105c7c:	00 00 00 
ffff800000105c7f:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105c83:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105c88:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105c8d:	49 89 df             	mov    %rbx,%r15
ffff800000105c90:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105c95:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff800000105c9c:	ff ff ff 
ffff800000105c9f:	48 01 d9             	add    %rbx,%rcx
ffff800000105ca2:	ff d1                	callq  *%rcx
ffff800000105ca4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105ca8:	83 e0 02             	and    $0x2,%eax
ffff800000105cab:	48 85 c0             	test   %rax,%rax
ffff800000105cae:	75 6c                	jne    ffff800000105d1c <do_stack_segment_fault+0x1a4>
ffff800000105cb0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105cb4:	83 e0 04             	and    $0x4,%eax
ffff800000105cb7:	48 85 c0             	test   %rax,%rax
ffff800000105cba:	74 31                	je     ffff800000105ced <do_stack_segment_fault+0x175>
ffff800000105cbc:	48 b8 d0 13 00 00 00 	movabs $0x13d0,%rax
ffff800000105cc3:	00 00 00 
ffff800000105cc6:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105cca:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105ccf:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105cd4:	49 89 df             	mov    %rbx,%r15
ffff800000105cd7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105cdc:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff800000105ce3:	ff ff ff 
ffff800000105ce6:	48 01 d9             	add    %rbx,%rcx
ffff800000105ce9:	ff d1                	callq  *%rcx
ffff800000105ceb:	eb 2f                	jmp    ffff800000105d1c <do_stack_segment_fault+0x1a4>
ffff800000105ced:	48 b8 08 14 00 00 00 	movabs $0x1408,%rax
ffff800000105cf4:	00 00 00 
ffff800000105cf7:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105cfb:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105d00:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105d05:	49 89 df             	mov    %rbx,%r15
ffff800000105d08:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105d0d:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff800000105d14:	ff ff ff 
ffff800000105d17:	48 01 d9             	add    %rbx,%rcx
ffff800000105d1a:	ff d1                	callq  *%rcx
ffff800000105d1c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105d20:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff800000105d25:	48 89 c1             	mov    %rax,%rcx
ffff800000105d28:	48 b8 34 14 00 00 00 	movabs $0x1434,%rax
ffff800000105d2f:	00 00 00 
ffff800000105d32:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105d36:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105d3b:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105d40:	49 89 df             	mov    %rbx,%r15
ffff800000105d43:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105d48:	49 b8 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r8
ffff800000105d4f:	ff ff ff 
ffff800000105d52:	49 01 d8             	add    %rbx,%r8
ffff800000105d55:	41 ff d0             	callq  *%r8
ffff800000105d58:	eb fe                	jmp    ffff800000105d58 <do_stack_segment_fault+0x1e0>

ffff800000105d5a <do_general_protection>:
ffff800000105d5a:	55                   	push   %rbp
ffff800000105d5b:	48 89 e5             	mov    %rsp,%rbp
ffff800000105d5e:	41 57                	push   %r15
ffff800000105d60:	53                   	push   %rbx
ffff800000105d61:	48 83 ec 20          	sub    $0x20,%rsp
ffff800000105d65:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000105d65 <do_general_protection+0xb>
ffff800000105d6c:	49 bb 03 61 00 00 00 	movabs $0x6103,%r11
ffff800000105d73:	00 00 00 
ffff800000105d76:	4c 01 db             	add    %r11,%rbx
ffff800000105d79:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105d7d:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105d81:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105d88:	00 
ffff800000105d89:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105d8d:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105d93:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105d97:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105d9b:	48 8b 08             	mov    (%rax),%rcx
ffff800000105d9e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105da2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105da6:	49 89 c9             	mov    %rcx,%r9
ffff800000105da9:	49 89 d0             	mov    %rdx,%r8
ffff800000105dac:	48 89 c1             	mov    %rax,%rcx
ffff800000105daf:	48 b8 c0 14 00 00 00 	movabs $0x14c0,%rax
ffff800000105db6:	00 00 00 
ffff800000105db9:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105dbd:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105dc2:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105dc7:	49 89 df             	mov    %rbx,%r15
ffff800000105dca:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105dcf:	49 ba 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r10
ffff800000105dd6:	ff ff ff 
ffff800000105dd9:	49 01 da             	add    %rbx,%r10
ffff800000105ddc:	41 ff d2             	callq  *%r10
ffff800000105ddf:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105de3:	83 e0 01             	and    $0x1,%eax
ffff800000105de6:	48 85 c0             	test   %rax,%rax
ffff800000105de9:	74 2f                	je     ffff800000105e1a <do_general_protection+0xc0>
ffff800000105deb:	48 b8 e8 12 00 00 00 	movabs $0x12e8,%rax
ffff800000105df2:	00 00 00 
ffff800000105df5:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105df9:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105dfe:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105e03:	49 89 df             	mov    %rbx,%r15
ffff800000105e06:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105e0b:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff800000105e12:	ff ff ff 
ffff800000105e15:	48 01 d9             	add    %rbx,%rcx
ffff800000105e18:	ff d1                	callq  *%rcx
ffff800000105e1a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105e1e:	83 e0 02             	and    $0x2,%eax
ffff800000105e21:	48 85 c0             	test   %rax,%rax
ffff800000105e24:	74 31                	je     ffff800000105e57 <do_general_protection+0xfd>
ffff800000105e26:	48 b8 68 13 00 00 00 	movabs $0x1368,%rax
ffff800000105e2d:	00 00 00 
ffff800000105e30:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105e34:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105e39:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105e3e:	49 89 df             	mov    %rbx,%r15
ffff800000105e41:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105e46:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff800000105e4d:	ff ff ff 
ffff800000105e50:	48 01 d9             	add    %rbx,%rcx
ffff800000105e53:	ff d1                	callq  *%rcx
ffff800000105e55:	eb 2f                	jmp    ffff800000105e86 <do_general_protection+0x12c>
ffff800000105e57:	48 b8 98 13 00 00 00 	movabs $0x1398,%rax
ffff800000105e5e:	00 00 00 
ffff800000105e61:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105e65:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105e6a:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105e6f:	49 89 df             	mov    %rbx,%r15
ffff800000105e72:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105e77:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff800000105e7e:	ff ff ff 
ffff800000105e81:	48 01 d9             	add    %rbx,%rcx
ffff800000105e84:	ff d1                	callq  *%rcx
ffff800000105e86:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105e8a:	83 e0 02             	and    $0x2,%eax
ffff800000105e8d:	48 85 c0             	test   %rax,%rax
ffff800000105e90:	75 6c                	jne    ffff800000105efe <do_general_protection+0x1a4>
ffff800000105e92:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105e96:	83 e0 04             	and    $0x4,%eax
ffff800000105e99:	48 85 c0             	test   %rax,%rax
ffff800000105e9c:	74 31                	je     ffff800000105ecf <do_general_protection+0x175>
ffff800000105e9e:	48 b8 d0 13 00 00 00 	movabs $0x13d0,%rax
ffff800000105ea5:	00 00 00 
ffff800000105ea8:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105eac:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105eb1:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105eb6:	49 89 df             	mov    %rbx,%r15
ffff800000105eb9:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105ebe:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff800000105ec5:	ff ff ff 
ffff800000105ec8:	48 01 d9             	add    %rbx,%rcx
ffff800000105ecb:	ff d1                	callq  *%rcx
ffff800000105ecd:	eb 2f                	jmp    ffff800000105efe <do_general_protection+0x1a4>
ffff800000105ecf:	48 b8 08 14 00 00 00 	movabs $0x1408,%rax
ffff800000105ed6:	00 00 00 
ffff800000105ed9:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105edd:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105ee2:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105ee7:	49 89 df             	mov    %rbx,%r15
ffff800000105eea:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105eef:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff800000105ef6:	ff ff ff 
ffff800000105ef9:	48 01 d9             	add    %rbx,%rcx
ffff800000105efc:	ff d1                	callq  *%rcx
ffff800000105efe:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105f02:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff800000105f07:	48 89 c1             	mov    %rax,%rcx
ffff800000105f0a:	48 b8 34 14 00 00 00 	movabs $0x1434,%rax
ffff800000105f11:	00 00 00 
ffff800000105f14:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105f18:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105f1d:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105f22:	49 89 df             	mov    %rbx,%r15
ffff800000105f25:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105f2a:	49 b8 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r8
ffff800000105f31:	ff ff ff 
ffff800000105f34:	49 01 d8             	add    %rbx,%r8
ffff800000105f37:	41 ff d0             	callq  *%r8
ffff800000105f3a:	eb fe                	jmp    ffff800000105f3a <do_general_protection+0x1e0>

ffff800000105f3c <do_page_fault>:
ffff800000105f3c:	55                   	push   %rbp
ffff800000105f3d:	48 89 e5             	mov    %rsp,%rbp
ffff800000105f40:	41 57                	push   %r15
ffff800000105f42:	53                   	push   %rbx
ffff800000105f43:	48 83 ec 20          	sub    $0x20,%rsp
ffff800000105f47:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000105f47 <do_page_fault+0xb>
ffff800000105f4e:	49 bb 21 5f 00 00 00 	movabs $0x5f21,%r11
ffff800000105f55:	00 00 00 
ffff800000105f58:	4c 01 db             	add    %r11,%rbx
ffff800000105f5b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105f5f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105f63:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105f6a:	00 
ffff800000105f6b:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
ffff800000105f72:	00 
ffff800000105f73:	0f 20 d0             	mov    %cr2,%rax
ffff800000105f76:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff800000105f7a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105f7e:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105f84:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105f88:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105f8c:	48 8b 08             	mov    (%rax),%rcx
ffff800000105f8f:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105f93:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105f97:	49 89 c9             	mov    %rcx,%r9
ffff800000105f9a:	49 89 d0             	mov    %rdx,%r8
ffff800000105f9d:	48 89 c1             	mov    %rax,%rcx
ffff800000105fa0:	48 b8 f8 14 00 00 00 	movabs $0x14f8,%rax
ffff800000105fa7:	00 00 00 
ffff800000105faa:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105fae:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105fb3:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105fb8:	49 89 df             	mov    %rbx,%r15
ffff800000105fbb:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105fc0:	49 ba 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r10
ffff800000105fc7:	ff ff ff 
ffff800000105fca:	49 01 da             	add    %rbx,%r10
ffff800000105fcd:	41 ff d2             	callq  *%r10
ffff800000105fd0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105fd4:	83 e0 01             	and    $0x1,%eax
ffff800000105fd7:	48 85 c0             	test   %rax,%rax
ffff800000105fda:	75 2f                	jne    ffff80000010600b <do_page_fault+0xcf>
ffff800000105fdc:	48 b8 24 15 00 00 00 	movabs $0x1524,%rax
ffff800000105fe3:	00 00 00 
ffff800000105fe6:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105fea:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105fef:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105ff4:	49 89 df             	mov    %rbx,%r15
ffff800000105ff7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105ffc:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff800000106003:	ff ff ff 
ffff800000106006:	48 01 d9             	add    %rbx,%rcx
ffff800000106009:	ff d1                	callq  *%rcx
ffff80000010600b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010600f:	83 e0 02             	and    $0x2,%eax
ffff800000106012:	48 85 c0             	test   %rax,%rax
ffff800000106015:	74 31                	je     ffff800000106048 <do_page_fault+0x10c>
ffff800000106017:	48 b8 37 15 00 00 00 	movabs $0x1537,%rax
ffff80000010601e:	00 00 00 
ffff800000106021:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106025:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010602a:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010602f:	49 89 df             	mov    %rbx,%r15
ffff800000106032:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106037:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff80000010603e:	ff ff ff 
ffff800000106041:	48 01 d9             	add    %rbx,%rcx
ffff800000106044:	ff d1                	callq  *%rcx
ffff800000106046:	eb 2f                	jmp    ffff800000106077 <do_page_fault+0x13b>
ffff800000106048:	48 b8 4b 15 00 00 00 	movabs $0x154b,%rax
ffff80000010604f:	00 00 00 
ffff800000106052:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106056:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010605b:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106060:	49 89 df             	mov    %rbx,%r15
ffff800000106063:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106068:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff80000010606f:	ff ff ff 
ffff800000106072:	48 01 d9             	add    %rbx,%rcx
ffff800000106075:	ff d1                	callq  *%rcx
ffff800000106077:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010607b:	83 e0 04             	and    $0x4,%eax
ffff80000010607e:	48 85 c0             	test   %rax,%rax
ffff800000106081:	74 31                	je     ffff8000001060b4 <do_page_fault+0x178>
ffff800000106083:	48 b8 5e 15 00 00 00 	movabs $0x155e,%rax
ffff80000010608a:	00 00 00 
ffff80000010608d:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106091:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106096:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010609b:	49 89 df             	mov    %rbx,%r15
ffff80000010609e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001060a3:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff8000001060aa:	ff ff ff 
ffff8000001060ad:	48 01 d9             	add    %rbx,%rcx
ffff8000001060b0:	ff d1                	callq  *%rcx
ffff8000001060b2:	eb 2f                	jmp    ffff8000001060e3 <do_page_fault+0x1a7>
ffff8000001060b4:	48 b8 70 15 00 00 00 	movabs $0x1570,%rax
ffff8000001060bb:	00 00 00 
ffff8000001060be:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001060c2:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001060c7:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001060cc:	49 89 df             	mov    %rbx,%r15
ffff8000001060cf:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001060d4:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff8000001060db:	ff ff ff 
ffff8000001060de:	48 01 d9             	add    %rbx,%rcx
ffff8000001060e1:	ff d1                	callq  *%rcx
ffff8000001060e3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001060e7:	83 e0 08             	and    $0x8,%eax
ffff8000001060ea:	48 85 c0             	test   %rax,%rax
ffff8000001060ed:	74 2f                	je     ffff80000010611e <do_page_fault+0x1e2>
ffff8000001060ef:	48 b8 8c 15 00 00 00 	movabs $0x158c,%rax
ffff8000001060f6:	00 00 00 
ffff8000001060f9:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001060fd:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106102:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106107:	49 89 df             	mov    %rbx,%r15
ffff80000010610a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010610f:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff800000106116:	ff ff ff 
ffff800000106119:	48 01 d9             	add    %rbx,%rcx
ffff80000010611c:	ff d1                	callq  *%rcx
ffff80000010611e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000106122:	83 e0 10             	and    $0x10,%eax
ffff800000106125:	48 85 c0             	test   %rax,%rax
ffff800000106128:	74 2f                	je     ffff800000106159 <do_page_fault+0x21d>
ffff80000010612a:	48 b8 a8 15 00 00 00 	movabs $0x15a8,%rax
ffff800000106131:	00 00 00 
ffff800000106134:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106138:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010613d:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106142:	49 89 df             	mov    %rbx,%r15
ffff800000106145:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010614a:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff800000106151:	ff ff ff 
ffff800000106154:	48 01 d9             	add    %rbx,%rcx
ffff800000106157:	ff d1                	callq  *%rcx
ffff800000106159:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010615d:	48 89 c1             	mov    %rax,%rcx
ffff800000106160:	48 b8 c8 15 00 00 00 	movabs $0x15c8,%rax
ffff800000106167:	00 00 00 
ffff80000010616a:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010616e:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106173:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106178:	49 89 df             	mov    %rbx,%r15
ffff80000010617b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106180:	49 b8 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r8
ffff800000106187:	ff ff ff 
ffff80000010618a:	49 01 d8             	add    %rbx,%r8
ffff80000010618d:	41 ff d0             	callq  *%r8
ffff800000106190:	eb fe                	jmp    ffff800000106190 <do_page_fault+0x254>

ffff800000106192 <do_x87_FPU_error>:
ffff800000106192:	55                   	push   %rbp
ffff800000106193:	48 89 e5             	mov    %rsp,%rbp
ffff800000106196:	41 57                	push   %r15
ffff800000106198:	48 83 ec 28          	sub    $0x28,%rsp
ffff80000010619c:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff80000010619c <do_x87_FPU_error+0xa>
ffff8000001061a3:	49 bb cc 5c 00 00 00 	movabs $0x5ccc,%r11
ffff8000001061aa:	00 00 00 
ffff8000001061ad:	4d 01 da             	add    %r11,%r10
ffff8000001061b0:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001061b4:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001061b8:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001061bf:	00 
ffff8000001061c0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001061c4:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001061ca:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001061ce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001061d2:	48 8b 08             	mov    (%rax),%rcx
ffff8000001061d5:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001061d9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001061dd:	49 89 c9             	mov    %rcx,%r9
ffff8000001061e0:	49 89 d0             	mov    %rdx,%r8
ffff8000001061e3:	48 89 c1             	mov    %rax,%rcx
ffff8000001061e6:	48 b8 d0 15 00 00 00 	movabs $0x15d0,%rax
ffff8000001061ed:	00 00 00 
ffff8000001061f0:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff8000001061f4:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001061f9:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001061fe:	4d 89 d7             	mov    %r10,%r15
ffff800000106201:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106206:	49 bb 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r11
ffff80000010620d:	ff ff ff 
ffff800000106210:	4d 01 d3             	add    %r10,%r11
ffff800000106213:	41 ff d3             	callq  *%r11
ffff800000106216:	eb fe                	jmp    ffff800000106216 <do_x87_FPU_error+0x84>

ffff800000106218 <do_alignment_check>:
ffff800000106218:	55                   	push   %rbp
ffff800000106219:	48 89 e5             	mov    %rsp,%rbp
ffff80000010621c:	41 57                	push   %r15
ffff80000010621e:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000106222:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff800000106222 <do_alignment_check+0xa>
ffff800000106229:	49 bb 46 5c 00 00 00 	movabs $0x5c46,%r11
ffff800000106230:	00 00 00 
ffff800000106233:	4d 01 da             	add    %r11,%r10
ffff800000106236:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff80000010623a:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff80000010623e:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000106245:	00 
ffff800000106246:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010624a:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000106250:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000106254:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106258:	48 8b 08             	mov    (%rax),%rcx
ffff80000010625b:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff80000010625f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000106263:	49 89 c9             	mov    %rcx,%r9
ffff800000106266:	49 89 d0             	mov    %rdx,%r8
ffff800000106269:	48 89 c1             	mov    %rax,%rcx
ffff80000010626c:	48 b8 20 16 00 00 00 	movabs $0x1620,%rax
ffff800000106273:	00 00 00 
ffff800000106276:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff80000010627a:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010627f:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106284:	4d 89 d7             	mov    %r10,%r15
ffff800000106287:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010628c:	49 bb 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r11
ffff800000106293:	ff ff ff 
ffff800000106296:	4d 01 d3             	add    %r10,%r11
ffff800000106299:	41 ff d3             	callq  *%r11
ffff80000010629c:	eb fe                	jmp    ffff80000010629c <do_alignment_check+0x84>

ffff80000010629e <do_machine_check>:
ffff80000010629e:	55                   	push   %rbp
ffff80000010629f:	48 89 e5             	mov    %rsp,%rbp
ffff8000001062a2:	41 57                	push   %r15
ffff8000001062a4:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001062a8:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001062a8 <do_machine_check+0xa>
ffff8000001062af:	49 bb c0 5b 00 00 00 	movabs $0x5bc0,%r11
ffff8000001062b6:	00 00 00 
ffff8000001062b9:	4d 01 da             	add    %r11,%r10
ffff8000001062bc:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001062c0:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001062c4:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001062cb:	00 
ffff8000001062cc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001062d0:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001062d6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001062da:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001062de:	48 8b 08             	mov    (%rax),%rcx
ffff8000001062e1:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001062e5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001062e9:	49 89 c9             	mov    %rcx,%r9
ffff8000001062ec:	49 89 d0             	mov    %rdx,%r8
ffff8000001062ef:	48 89 c1             	mov    %rax,%rcx
ffff8000001062f2:	48 b8 58 16 00 00 00 	movabs $0x1658,%rax
ffff8000001062f9:	00 00 00 
ffff8000001062fc:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000106300:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106305:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010630a:	4d 89 d7             	mov    %r10,%r15
ffff80000010630d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106312:	49 bb 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r11
ffff800000106319:	ff ff ff 
ffff80000010631c:	4d 01 d3             	add    %r10,%r11
ffff80000010631f:	41 ff d3             	callq  *%r11
ffff800000106322:	eb fe                	jmp    ffff800000106322 <do_machine_check+0x84>

ffff800000106324 <do_SIMD_exception>:
ffff800000106324:	55                   	push   %rbp
ffff800000106325:	48 89 e5             	mov    %rsp,%rbp
ffff800000106328:	41 57                	push   %r15
ffff80000010632a:	48 83 ec 28          	sub    $0x28,%rsp
ffff80000010632e:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff80000010632e <do_SIMD_exception+0xa>
ffff800000106335:	49 bb 3a 5b 00 00 00 	movabs $0x5b3a,%r11
ffff80000010633c:	00 00 00 
ffff80000010633f:	4d 01 da             	add    %r11,%r10
ffff800000106342:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000106346:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff80000010634a:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000106351:	00 
ffff800000106352:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000106356:	48 05 98 00 00 00    	add    $0x98,%rax
ffff80000010635c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000106360:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106364:	48 8b 08             	mov    (%rax),%rcx
ffff800000106367:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff80000010636b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010636f:	49 89 c9             	mov    %rcx,%r9
ffff800000106372:	49 89 d0             	mov    %rdx,%r8
ffff800000106375:	48 89 c1             	mov    %rax,%rcx
ffff800000106378:	48 b8 88 16 00 00 00 	movabs $0x1688,%rax
ffff80000010637f:	00 00 00 
ffff800000106382:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000106386:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010638b:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106390:	4d 89 d7             	mov    %r10,%r15
ffff800000106393:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106398:	49 bb 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r11
ffff80000010639f:	ff ff ff 
ffff8000001063a2:	4d 01 d3             	add    %r10,%r11
ffff8000001063a5:	41 ff d3             	callq  *%r11
ffff8000001063a8:	eb fe                	jmp    ffff8000001063a8 <do_SIMD_exception+0x84>

ffff8000001063aa <do_virtualization_exception>:
ffff8000001063aa:	55                   	push   %rbp
ffff8000001063ab:	48 89 e5             	mov    %rsp,%rbp
ffff8000001063ae:	41 57                	push   %r15
ffff8000001063b0:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001063b4:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001063b4 <do_virtualization_exception+0xa>
ffff8000001063bb:	49 bb b4 5a 00 00 00 	movabs $0x5ab4,%r11
ffff8000001063c2:	00 00 00 
ffff8000001063c5:	4d 01 da             	add    %r11,%r10
ffff8000001063c8:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001063cc:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001063d0:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001063d7:	00 
ffff8000001063d8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001063dc:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001063e2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001063e6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001063ea:	48 8b 08             	mov    (%rax),%rcx
ffff8000001063ed:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001063f1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001063f5:	49 89 c9             	mov    %rcx,%r9
ffff8000001063f8:	49 89 d0             	mov    %rdx,%r8
ffff8000001063fb:	48 89 c1             	mov    %rax,%rcx
ffff8000001063fe:	48 b8 d0 16 00 00 00 	movabs $0x16d0,%rax
ffff800000106405:	00 00 00 
ffff800000106408:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff80000010640c:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106411:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106416:	4d 89 d7             	mov    %r10,%r15
ffff800000106419:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010641e:	49 bb 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r11
ffff800000106425:	ff ff ff 
ffff800000106428:	4d 01 d3             	add    %r10,%r11
ffff80000010642b:	41 ff d3             	callq  *%r11
ffff80000010642e:	eb fe                	jmp    ffff80000010642e <do_virtualization_exception+0x84>

ffff800000106430 <set_sys_int>:
ffff800000106430:	55                   	push   %rbp
ffff800000106431:	48 89 e5             	mov    %rsp,%rbp
ffff800000106434:	41 57                	push   %r15
ffff800000106436:	53                   	push   %rbx
ffff800000106437:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000106437 <set_sys_int+0x7>
ffff80000010643e:	49 bb 31 5a 00 00 00 	movabs $0x5a31,%r11
ffff800000106445:	00 00 00 
ffff800000106448:	4c 01 db             	add    %r11,%rbx
ffff80000010644b:	48 b8 00 ff ff ff ff 	movabs $0xffffffffffffff00,%rax
ffff800000106452:	ff ff ff 
ffff800000106455:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106459:	48 89 c2             	mov    %rax,%rdx
ffff80000010645c:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106461:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106466:	49 89 df             	mov    %rbx,%r15
ffff800000106469:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010646e:	48 b9 0c 85 ff ff ff 	movabs $0xffffffffffff850c,%rcx
ffff800000106475:	ff ff ff 
ffff800000106478:	48 01 d9             	add    %rbx,%rcx
ffff80000010647b:	ff d1                	callq  *%rcx
ffff80000010647d:	48 b8 30 ff ff ff ff 	movabs $0xffffffffffffff30,%rax
ffff800000106484:	ff ff ff 
ffff800000106487:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010648b:	48 89 c2             	mov    %rax,%rdx
ffff80000010648e:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106493:	bf 01 00 00 00       	mov    $0x1,%edi
ffff800000106498:	49 89 df             	mov    %rbx,%r15
ffff80000010649b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001064a0:	48 b9 0c 85 ff ff ff 	movabs $0xffffffffffff850c,%rcx
ffff8000001064a7:	ff ff ff 
ffff8000001064aa:	48 01 d9             	add    %rbx,%rcx
ffff8000001064ad:	ff d1                	callq  *%rcx
ffff8000001064af:	48 b8 e8 ff ff ff ff 	movabs $0xffffffffffffffe8,%rax
ffff8000001064b6:	ff ff ff 
ffff8000001064b9:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001064bd:	48 89 c2             	mov    %rax,%rdx
ffff8000001064c0:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001064c5:	bf 02 00 00 00       	mov    $0x2,%edi
ffff8000001064ca:	49 89 df             	mov    %rbx,%r15
ffff8000001064cd:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001064d2:	48 b9 b9 84 ff ff ff 	movabs $0xffffffffffff84b9,%rcx
ffff8000001064d9:	ff ff ff 
ffff8000001064dc:	48 01 d9             	add    %rbx,%rcx
ffff8000001064df:	ff d1                	callq  *%rcx
ffff8000001064e1:	48 b8 60 ff ff ff ff 	movabs $0xffffffffffffff60,%rax
ffff8000001064e8:	ff ff ff 
ffff8000001064eb:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001064ef:	48 89 c2             	mov    %rax,%rdx
ffff8000001064f2:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001064f7:	bf 03 00 00 00       	mov    $0x3,%edi
ffff8000001064fc:	49 89 df             	mov    %rbx,%r15
ffff8000001064ff:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106504:	48 b9 5f 85 ff ff ff 	movabs $0xffffffffffff855f,%rcx
ffff80000010650b:	ff ff ff 
ffff80000010650e:	48 01 d9             	add    %rbx,%rcx
ffff800000106511:	ff d1                	callq  *%rcx
ffff800000106513:	48 b8 28 ff ff ff ff 	movabs $0xffffffffffffff28,%rax
ffff80000010651a:	ff ff ff 
ffff80000010651d:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106521:	48 89 c2             	mov    %rax,%rdx
ffff800000106524:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106529:	bf 04 00 00 00       	mov    $0x4,%edi
ffff80000010652e:	49 89 df             	mov    %rbx,%r15
ffff800000106531:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106536:	48 b9 5f 85 ff ff ff 	movabs $0xffffffffffff855f,%rcx
ffff80000010653d:	ff ff ff 
ffff800000106540:	48 01 d9             	add    %rbx,%rcx
ffff800000106543:	ff d1                	callq  *%rcx
ffff800000106545:	48 b8 38 ff ff ff ff 	movabs $0xffffffffffffff38,%rax
ffff80000010654c:	ff ff ff 
ffff80000010654f:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106553:	48 89 c2             	mov    %rax,%rdx
ffff800000106556:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010655b:	bf 05 00 00 00       	mov    $0x5,%edi
ffff800000106560:	49 89 df             	mov    %rbx,%r15
ffff800000106563:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106568:	48 b9 5f 85 ff ff ff 	movabs $0xffffffffffff855f,%rcx
ffff80000010656f:	ff ff ff 
ffff800000106572:	48 01 d9             	add    %rbx,%rcx
ffff800000106575:	ff d1                	callq  *%rcx
ffff800000106577:	48 b8 68 ff ff ff ff 	movabs $0xffffffffffffff68,%rax
ffff80000010657e:	ff ff ff 
ffff800000106581:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106585:	48 89 c2             	mov    %rax,%rdx
ffff800000106588:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010658d:	bf 06 00 00 00       	mov    $0x6,%edi
ffff800000106592:	49 89 df             	mov    %rbx,%r15
ffff800000106595:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010659a:	48 b9 0c 85 ff ff ff 	movabs $0xffffffffffff850c,%rcx
ffff8000001065a1:	ff ff ff 
ffff8000001065a4:	48 01 d9             	add    %rbx,%rcx
ffff8000001065a7:	ff d1                	callq  *%rcx
ffff8000001065a9:	48 b8 f0 ff ff ff ff 	movabs $0xfffffffffffffff0,%rax
ffff8000001065b0:	ff ff ff 
ffff8000001065b3:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001065b7:	48 89 c2             	mov    %rax,%rdx
ffff8000001065ba:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001065bf:	bf 07 00 00 00       	mov    $0x7,%edi
ffff8000001065c4:	49 89 df             	mov    %rbx,%r15
ffff8000001065c7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001065cc:	48 b9 0c 85 ff ff ff 	movabs $0xffffffffffff850c,%rcx
ffff8000001065d3:	ff ff ff 
ffff8000001065d6:	48 01 d9             	add    %rbx,%rcx
ffff8000001065d9:	ff d1                	callq  *%rcx
ffff8000001065db:	48 b8 88 ff ff ff ff 	movabs $0xffffffffffffff88,%rax
ffff8000001065e2:	ff ff ff 
ffff8000001065e5:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001065e9:	48 89 c2             	mov    %rax,%rdx
ffff8000001065ec:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001065f1:	bf 08 00 00 00       	mov    $0x8,%edi
ffff8000001065f6:	49 89 df             	mov    %rbx,%r15
ffff8000001065f9:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001065fe:	48 b9 0c 85 ff ff ff 	movabs $0xffffffffffff850c,%rcx
ffff800000106605:	ff ff ff 
ffff800000106608:	48 01 d9             	add    %rbx,%rcx
ffff80000010660b:	ff d1                	callq  *%rcx
ffff80000010660d:	48 b8 a8 ff ff ff ff 	movabs $0xffffffffffffffa8,%rax
ffff800000106614:	ff ff ff 
ffff800000106617:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010661b:	48 89 c2             	mov    %rax,%rdx
ffff80000010661e:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106623:	bf 09 00 00 00       	mov    $0x9,%edi
ffff800000106628:	49 89 df             	mov    %rbx,%r15
ffff80000010662b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106630:	48 b9 0c 85 ff ff ff 	movabs $0xffffffffffff850c,%rcx
ffff800000106637:	ff ff ff 
ffff80000010663a:	48 01 d9             	add    %rbx,%rcx
ffff80000010663d:	ff d1                	callq  *%rcx
ffff80000010663f:	48 b8 40 ff ff ff ff 	movabs $0xffffffffffffff40,%rax
ffff800000106646:	ff ff ff 
ffff800000106649:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010664d:	48 89 c2             	mov    %rax,%rdx
ffff800000106650:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106655:	bf 0a 00 00 00       	mov    $0xa,%edi
ffff80000010665a:	49 89 df             	mov    %rbx,%r15
ffff80000010665d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106662:	48 b9 0c 85 ff ff ff 	movabs $0xffffffffffff850c,%rcx
ffff800000106669:	ff ff ff 
ffff80000010666c:	48 01 d9             	add    %rbx,%rcx
ffff80000010666f:	ff d1                	callq  *%rcx
ffff800000106671:	48 b8 48 ff ff ff ff 	movabs $0xffffffffffffff48,%rax
ffff800000106678:	ff ff ff 
ffff80000010667b:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010667f:	48 89 c2             	mov    %rax,%rdx
ffff800000106682:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106687:	bf 0b 00 00 00       	mov    $0xb,%edi
ffff80000010668c:	49 89 df             	mov    %rbx,%r15
ffff80000010668f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106694:	48 b9 0c 85 ff ff ff 	movabs $0xffffffffffff850c,%rcx
ffff80000010669b:	ff ff ff 
ffff80000010669e:	48 01 d9             	add    %rbx,%rcx
ffff8000001066a1:	ff d1                	callq  *%rcx
ffff8000001066a3:	48 b8 50 ff ff ff ff 	movabs $0xffffffffffffff50,%rax
ffff8000001066aa:	ff ff ff 
ffff8000001066ad:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001066b1:	48 89 c2             	mov    %rax,%rdx
ffff8000001066b4:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001066b9:	bf 0c 00 00 00       	mov    $0xc,%edi
ffff8000001066be:	49 89 df             	mov    %rbx,%r15
ffff8000001066c1:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001066c6:	48 b9 0c 85 ff ff ff 	movabs $0xffffffffffff850c,%rcx
ffff8000001066cd:	ff ff ff 
ffff8000001066d0:	48 01 d9             	add    %rbx,%rcx
ffff8000001066d3:	ff d1                	callq  *%rcx
ffff8000001066d5:	48 b8 18 ff ff ff ff 	movabs $0xffffffffffffff18,%rax
ffff8000001066dc:	ff ff ff 
ffff8000001066df:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001066e3:	48 89 c2             	mov    %rax,%rdx
ffff8000001066e6:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001066eb:	bf 0d 00 00 00       	mov    $0xd,%edi
ffff8000001066f0:	49 89 df             	mov    %rbx,%r15
ffff8000001066f3:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001066f8:	48 b9 0c 85 ff ff ff 	movabs $0xffffffffffff850c,%rcx
ffff8000001066ff:	ff ff ff 
ffff800000106702:	48 01 d9             	add    %rbx,%rcx
ffff800000106705:	ff d1                	callq  *%rcx
ffff800000106707:	48 b8 b8 ff ff ff ff 	movabs $0xffffffffffffffb8,%rax
ffff80000010670e:	ff ff ff 
ffff800000106711:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106715:	48 89 c2             	mov    %rax,%rdx
ffff800000106718:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010671d:	bf 0e 00 00 00       	mov    $0xe,%edi
ffff800000106722:	49 89 df             	mov    %rbx,%r15
ffff800000106725:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010672a:	48 b9 0c 85 ff ff ff 	movabs $0xffffffffffff850c,%rcx
ffff800000106731:	ff ff ff 
ffff800000106734:	48 01 d9             	add    %rbx,%rcx
ffff800000106737:	ff d1                	callq  *%rcx
ffff800000106739:	48 b8 80 ff ff ff ff 	movabs $0xffffffffffffff80,%rax
ffff800000106740:	ff ff ff 
ffff800000106743:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106747:	48 89 c2             	mov    %rax,%rdx
ffff80000010674a:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010674f:	bf 10 00 00 00       	mov    $0x10,%edi
ffff800000106754:	49 89 df             	mov    %rbx,%r15
ffff800000106757:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010675c:	48 b9 0c 85 ff ff ff 	movabs $0xffffffffffff850c,%rcx
ffff800000106763:	ff ff ff 
ffff800000106766:	48 01 d9             	add    %rbx,%rcx
ffff800000106769:	ff d1                	callq  *%rcx
ffff80000010676b:	48 b8 78 ff ff ff ff 	movabs $0xffffffffffffff78,%rax
ffff800000106772:	ff ff ff 
ffff800000106775:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106779:	48 89 c2             	mov    %rax,%rdx
ffff80000010677c:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106781:	bf 11 00 00 00       	mov    $0x11,%edi
ffff800000106786:	49 89 df             	mov    %rbx,%r15
ffff800000106789:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010678e:	48 b9 0c 85 ff ff ff 	movabs $0xffffffffffff850c,%rcx
ffff800000106795:	ff ff ff 
ffff800000106798:	48 01 d9             	add    %rbx,%rcx
ffff80000010679b:	ff d1                	callq  *%rcx
ffff80000010679d:	48 b8 c8 ff ff ff ff 	movabs $0xffffffffffffffc8,%rax
ffff8000001067a4:	ff ff ff 
ffff8000001067a7:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001067ab:	48 89 c2             	mov    %rax,%rdx
ffff8000001067ae:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001067b3:	bf 12 00 00 00       	mov    $0x12,%edi
ffff8000001067b8:	49 89 df             	mov    %rbx,%r15
ffff8000001067bb:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001067c0:	48 b9 0c 85 ff ff ff 	movabs $0xffffffffffff850c,%rcx
ffff8000001067c7:	ff ff ff 
ffff8000001067ca:	48 01 d9             	add    %rbx,%rcx
ffff8000001067cd:	ff d1                	callq  *%rcx
ffff8000001067cf:	48 b8 d8 ff ff ff ff 	movabs $0xffffffffffffffd8,%rax
ffff8000001067d6:	ff ff ff 
ffff8000001067d9:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001067dd:	48 89 c2             	mov    %rax,%rdx
ffff8000001067e0:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001067e5:	bf 13 00 00 00       	mov    $0x13,%edi
ffff8000001067ea:	49 89 df             	mov    %rbx,%r15
ffff8000001067ed:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001067f2:	48 b9 0c 85 ff ff ff 	movabs $0xffffffffffff850c,%rcx
ffff8000001067f9:	ff ff ff 
ffff8000001067fc:	48 01 d9             	add    %rbx,%rcx
ffff8000001067ff:	ff d1                	callq  *%rcx
ffff800000106801:	48 b8 98 ff ff ff ff 	movabs $0xffffffffffffff98,%rax
ffff800000106808:	ff ff ff 
ffff80000010680b:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010680f:	48 89 c2             	mov    %rax,%rdx
ffff800000106812:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106817:	bf 14 00 00 00       	mov    $0x14,%edi
ffff80000010681c:	49 89 df             	mov    %rbx,%r15
ffff80000010681f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106824:	48 b9 0c 85 ff ff ff 	movabs $0xffffffffffff850c,%rcx
ffff80000010682b:	ff ff ff 
ffff80000010682e:	48 01 d9             	add    %rbx,%rcx
ffff800000106831:	ff d1                	callq  *%rcx
ffff800000106833:	90                   	nop
ffff800000106834:	5b                   	pop    %rbx
ffff800000106835:	41 5f                	pop    %r15
ffff800000106837:	5d                   	pop    %rbp
ffff800000106838:	c3                   	retq   

ffff800000106839 <page_init>:
ffff800000106839:	55                   	push   %rbp
ffff80000010683a:	48 89 e5             	mov    %rsp,%rbp
ffff80000010683d:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010683d <page_init+0x4>
ffff800000106844:	49 bb 2b 56 00 00 00 	movabs $0x562b,%r11
ffff80000010684b:	00 00 00 
ffff80000010684e:	4c 01 d8             	add    %r11,%rax
ffff800000106851:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000106855:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000106859:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010685d:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106861:	48 0b 45 f0          	or     -0x10(%rbp),%rax
ffff800000106865:	48 89 c2             	mov    %rax,%rdx
ffff800000106868:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010686c:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000106870:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106874:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000106878:	48 85 c0             	test   %rax,%rax
ffff80000010687b:	74 10                	je     ffff80000010688d <page_init+0x54>
ffff80000010687d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106881:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106885:	83 e0 10             	and    $0x10,%eax
ffff800000106888:	48 85 c0             	test   %rax,%rax
ffff80000010688b:	74 27                	je     ffff8000001068b4 <page_init+0x7b>
ffff80000010688d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106891:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000106895:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000106899:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010689d:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff8000001068a1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001068a5:	48 8b 00             	mov    (%rax),%rax
ffff8000001068a8:	48 8b 50 48          	mov    0x48(%rax),%rdx
ffff8000001068ac:	48 83 c2 01          	add    $0x1,%rdx
ffff8000001068b0:	48 89 50 48          	mov    %rdx,0x48(%rax)
ffff8000001068b4:	b8 01 00 00 00       	mov    $0x1,%eax
ffff8000001068b9:	5d                   	pop    %rbp
ffff8000001068ba:	c3                   	retq   

ffff8000001068bb <page_clean>:
ffff8000001068bb:	55                   	push   %rbp
ffff8000001068bc:	48 89 e5             	mov    %rsp,%rbp
ffff8000001068bf:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff8000001068bf <page_clean+0x4>
ffff8000001068c6:	49 bb a9 55 00 00 00 	movabs $0x55a9,%r11
ffff8000001068cd:	00 00 00 
ffff8000001068d0:	4c 01 d8             	add    %r11,%rax
ffff8000001068d3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff8000001068d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001068db:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001068df:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff8000001068e3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001068e7:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff8000001068eb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001068ef:	48 8b 00             	mov    (%rax),%rax
ffff8000001068f2:	48 8b 50 48          	mov    0x48(%rax),%rdx
ffff8000001068f6:	48 83 ea 01          	sub    $0x1,%rdx
ffff8000001068fa:	48 89 50 48          	mov    %rdx,0x48(%rax)
ffff8000001068fe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106902:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000106906:	48 85 c0             	test   %rax,%rax
ffff800000106909:	75 16                	jne    ffff800000106921 <page_clean+0x66>
ffff80000010690b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010690f:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106913:	83 e0 01             	and    $0x1,%eax
ffff800000106916:	48 89 c2             	mov    %rax,%rdx
ffff800000106919:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010691d:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000106921:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000106926:	5d                   	pop    %rbp
ffff800000106927:	c3                   	retq   

ffff800000106928 <get_page_attribute>:
ffff800000106928:	55                   	push   %rbp
ffff800000106929:	48 89 e5             	mov    %rsp,%rbp
ffff80000010692c:	41 57                	push   %r15
ffff80000010692e:	48 83 ec 18          	sub    $0x18,%rsp
ffff800000106932:	48 8d 0d f9 ff ff ff 	lea    -0x7(%rip),%rcx        # ffff800000106932 <get_page_attribute+0xa>
ffff800000106939:	49 bb 36 55 00 00 00 	movabs $0x5536,%r11
ffff800000106940:	00 00 00 
ffff800000106943:	4c 01 d9             	add    %r11,%rcx
ffff800000106946:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff80000010694a:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
ffff80000010694f:	75 37                	jne    ffff800000106988 <get_page_attribute+0x60>
ffff800000106951:	48 b8 10 17 00 00 00 	movabs $0x1710,%rax
ffff800000106958:	00 00 00 
ffff80000010695b:	48 8d 14 01          	lea    (%rcx,%rax,1),%rdx
ffff80000010695f:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106964:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106969:	49 89 cf             	mov    %rcx,%r15
ffff80000010696c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106971:	49 b8 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r8
ffff800000106978:	ff ff ff 
ffff80000010697b:	49 01 c8             	add    %rcx,%r8
ffff80000010697e:	41 ff d0             	callq  *%r8
ffff800000106981:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106986:	eb 08                	jmp    ffff800000106990 <get_page_attribute+0x68>
ffff800000106988:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010698c:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106990:	48 83 c4 18          	add    $0x18,%rsp
ffff800000106994:	41 5f                	pop    %r15
ffff800000106996:	5d                   	pop    %rbp
ffff800000106997:	c3                   	retq   

ffff800000106998 <set_page_attribute>:
ffff800000106998:	55                   	push   %rbp
ffff800000106999:	48 89 e5             	mov    %rsp,%rbp
ffff80000010699c:	41 57                	push   %r15
ffff80000010699e:	48 83 ec 18          	sub    $0x18,%rsp
ffff8000001069a2:	48 8d 0d f9 ff ff ff 	lea    -0x7(%rip),%rcx        # ffff8000001069a2 <set_page_attribute+0xa>
ffff8000001069a9:	49 bb c6 54 00 00 00 	movabs $0x54c6,%r11
ffff8000001069b0:	00 00 00 
ffff8000001069b3:	4c 01 d9             	add    %r11,%rcx
ffff8000001069b6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff8000001069ba:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
ffff8000001069be:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
ffff8000001069c3:	75 37                	jne    ffff8000001069fc <set_page_attribute+0x64>
ffff8000001069c5:	48 b8 30 17 00 00 00 	movabs $0x1730,%rax
ffff8000001069cc:	00 00 00 
ffff8000001069cf:	48 8d 14 01          	lea    (%rcx,%rax,1),%rdx
ffff8000001069d3:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001069d8:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001069dd:	49 89 cf             	mov    %rcx,%r15
ffff8000001069e0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001069e5:	49 b8 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r8
ffff8000001069ec:	ff ff ff 
ffff8000001069ef:	49 01 c8             	add    %rcx,%r8
ffff8000001069f2:	41 ff d0             	callq  *%r8
ffff8000001069f5:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001069fa:	eb 11                	jmp    ffff800000106a0d <set_page_attribute+0x75>
ffff8000001069fc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106a00:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
ffff800000106a04:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000106a08:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000106a0d:	48 83 c4 18          	add    $0x18,%rsp
ffff800000106a11:	41 5f                	pop    %r15
ffff800000106a13:	5d                   	pop    %rbp
ffff800000106a14:	c3                   	retq   

ffff800000106a15 <init_mem>:
ffff800000106a15:	55                   	push   %rbp
ffff800000106a16:	48 89 e5             	mov    %rsp,%rbp
ffff800000106a19:	41 57                	push   %r15
ffff800000106a1b:	53                   	push   %rbx
ffff800000106a1c:	48 83 ec 70          	sub    $0x70,%rsp
ffff800000106a20:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000106a20 <init_mem+0xb>
ffff800000106a27:	49 bb 48 54 00 00 00 	movabs $0x5448,%r11
ffff800000106a2e:	00 00 00 
ffff800000106a31:	4c 01 db             	add    %r11,%rbx
ffff800000106a34:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000106a3b:	00 
ffff800000106a3c:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
ffff800000106a43:	00 
ffff800000106a44:	48 b8 50 17 00 00 00 	movabs $0x1750,%rax
ffff800000106a4b:	00 00 00 
ffff800000106a4e:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106a52:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106a57:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000106a5c:	49 89 df             	mov    %rbx,%r15
ffff800000106a5f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106a64:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff800000106a6b:	ff ff ff 
ffff800000106a6e:	48 01 d9             	add    %rbx,%rcx
ffff800000106a71:	ff d1                	callq  *%rcx
ffff800000106a73:	48 b8 00 7e 00 00 00 	movabs $0xffff800000007e00,%rax
ffff800000106a7a:	80 ff ff 
ffff800000106a7d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff800000106a81:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
ffff800000106a88:	e9 44 01 00 00       	jmpq   ffff800000106bd1 <init_mem+0x1bc>
ffff800000106a8d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106a91:	8b 48 10             	mov    0x10(%rax),%ecx
ffff800000106a94:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106a98:	48 8b 50 08          	mov    0x8(%rax),%rdx
ffff800000106a9c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106aa0:	48 8b 00             	mov    (%rax),%rax
ffff800000106aa3:	41 89 c9             	mov    %ecx,%r9d
ffff800000106aa6:	49 89 d0             	mov    %rdx,%r8
ffff800000106aa9:	48 89 c1             	mov    %rax,%rcx
ffff800000106aac:	48 b8 75 17 00 00 00 	movabs $0x1775,%rax
ffff800000106ab3:	00 00 00 
ffff800000106ab6:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106aba:	be 00 ff 00 00       	mov    $0xff00,%esi
ffff800000106abf:	bf ff 00 00 00       	mov    $0xff,%edi
ffff800000106ac4:	49 89 df             	mov    %rbx,%r15
ffff800000106ac7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106acc:	49 ba 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r10
ffff800000106ad3:	ff ff ff 
ffff800000106ad6:	49 01 da             	add    %rbx,%r10
ffff800000106ad9:	41 ff d2             	callq  *%r10
ffff800000106adc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106ae0:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000106ae3:	83 f8 01             	cmp    $0x1,%eax
ffff800000106ae6:	75 0c                	jne    ffff800000106af4 <init_mem+0xdf>
ffff800000106ae8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106aec:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106af0:	48 01 45 e8          	add    %rax,-0x18(%rbp)
ffff800000106af4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106af8:	48 8b 08             	mov    (%rax),%rcx
ffff800000106afb:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106b02:	ff ff ff 
ffff800000106b05:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000106b09:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000106b0c:	48 63 d0             	movslq %eax,%rdx
ffff800000106b0f:	48 89 d0             	mov    %rdx,%rax
ffff800000106b12:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106b16:	48 01 d0             	add    %rdx,%rax
ffff800000106b19:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106b1d:	48 01 f0             	add    %rsi,%rax
ffff800000106b20:	48 89 08             	mov    %rcx,(%rax)
ffff800000106b23:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106b27:	48 8b 48 08          	mov    0x8(%rax),%rcx
ffff800000106b2b:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106b32:	ff ff ff 
ffff800000106b35:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000106b39:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000106b3c:	48 63 d0             	movslq %eax,%rdx
ffff800000106b3f:	48 89 d0             	mov    %rdx,%rax
ffff800000106b42:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106b46:	48 01 d0             	add    %rdx,%rax
ffff800000106b49:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106b4d:	48 01 f0             	add    %rsi,%rax
ffff800000106b50:	48 83 c0 08          	add    $0x8,%rax
ffff800000106b54:	48 89 08             	mov    %rcx,(%rax)
ffff800000106b57:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106b5b:	8b 48 10             	mov    0x10(%rax),%ecx
ffff800000106b5e:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106b65:	ff ff ff 
ffff800000106b68:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000106b6c:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000106b6f:	48 63 d0             	movslq %eax,%rdx
ffff800000106b72:	48 89 d0             	mov    %rdx,%rax
ffff800000106b75:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106b79:	48 01 d0             	add    %rdx,%rax
ffff800000106b7c:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106b80:	48 01 f0             	add    %rsi,%rax
ffff800000106b83:	48 83 c0 10          	add    $0x10,%rax
ffff800000106b87:	89 08                	mov    %ecx,(%rax)
ffff800000106b89:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000106b8c:	48 63 d0             	movslq %eax,%rdx
ffff800000106b8f:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106b96:	ff ff ff 
ffff800000106b99:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106b9d:	48 89 90 80 02 00 00 	mov    %rdx,0x280(%rax)
ffff800000106ba4:	48 83 45 e0 14       	addq   $0x14,-0x20(%rbp)
ffff800000106ba9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106bad:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000106bb0:	83 f8 04             	cmp    $0x4,%eax
ffff800000106bb3:	77 26                	ja     ffff800000106bdb <init_mem+0x1c6>
ffff800000106bb5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106bb9:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106bbd:	48 85 c0             	test   %rax,%rax
ffff800000106bc0:	74 19                	je     ffff800000106bdb <init_mem+0x1c6>
ffff800000106bc2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106bc6:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000106bc9:	85 c0                	test   %eax,%eax
ffff800000106bcb:	74 0e                	je     ffff800000106bdb <init_mem+0x1c6>
ffff800000106bcd:	83 45 dc 01          	addl   $0x1,-0x24(%rbp)
ffff800000106bd1:	83 7d dc 1f          	cmpl   $0x1f,-0x24(%rbp)
ffff800000106bd5:	0f 8e b2 fe ff ff    	jle    ffff800000106a8d <init_mem+0x78>
ffff800000106bdb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106bdf:	48 89 c1             	mov    %rax,%rcx
ffff800000106be2:	48 b8 93 17 00 00 00 	movabs $0x1793,%rax
ffff800000106be9:	00 00 00 
ffff800000106bec:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106bf0:	be ff 00 80 00       	mov    $0x8000ff,%esi
ffff800000106bf5:	bf 00 ff ff 00       	mov    $0xffff00,%edi
ffff800000106bfa:	49 89 df             	mov    %rbx,%r15
ffff800000106bfd:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106c02:	49 b8 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r8
ffff800000106c09:	ff ff ff 
ffff800000106c0c:	49 01 d8             	add    %rbx,%r8
ffff800000106c0f:	41 ff d0             	callq  *%r8
ffff800000106c12:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000106c19:	00 
ffff800000106c1a:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
ffff800000106c21:	e9 f1 00 00 00       	jmpq   ffff800000106d17 <init_mem+0x302>
ffff800000106c26:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106c2d:	ff ff ff 
ffff800000106c30:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000106c34:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000106c37:	48 63 d0             	movslq %eax,%rdx
ffff800000106c3a:	48 89 d0             	mov    %rdx,%rax
ffff800000106c3d:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106c41:	48 01 d0             	add    %rdx,%rax
ffff800000106c44:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106c48:	48 01 c8             	add    %rcx,%rax
ffff800000106c4b:	48 83 c0 10          	add    $0x10,%rax
ffff800000106c4f:	8b 00                	mov    (%rax),%eax
ffff800000106c51:	83 f8 01             	cmp    $0x1,%eax
ffff800000106c54:	0f 85 b5 00 00 00    	jne    ffff800000106d0f <init_mem+0x2fa>
ffff800000106c5a:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106c61:	ff ff ff 
ffff800000106c64:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000106c68:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000106c6b:	48 63 d0             	movslq %eax,%rdx
ffff800000106c6e:	48 89 d0             	mov    %rdx,%rax
ffff800000106c71:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106c75:	48 01 d0             	add    %rdx,%rax
ffff800000106c78:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106c7c:	48 01 c8             	add    %rcx,%rax
ffff800000106c7f:	48 8b 00             	mov    (%rax),%rax
ffff800000106c82:	48 05 ff ff 1f 00    	add    $0x1fffff,%rax
ffff800000106c88:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff800000106c8e:	48 89 45 90          	mov    %rax,-0x70(%rbp)
ffff800000106c92:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106c99:	ff ff ff 
ffff800000106c9c:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000106ca0:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000106ca3:	48 63 d0             	movslq %eax,%rdx
ffff800000106ca6:	48 89 d0             	mov    %rdx,%rax
ffff800000106ca9:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106cad:	48 01 d0             	add    %rdx,%rax
ffff800000106cb0:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106cb4:	48 01 c8             	add    %rcx,%rax
ffff800000106cb7:	48 8b 08             	mov    (%rax),%rcx
ffff800000106cba:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106cc1:	ff ff ff 
ffff800000106cc4:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000106cc8:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000106ccb:	48 63 d0             	movslq %eax,%rdx
ffff800000106cce:	48 89 d0             	mov    %rdx,%rax
ffff800000106cd1:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106cd5:	48 01 d0             	add    %rdx,%rax
ffff800000106cd8:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106cdc:	48 01 f0             	add    %rsi,%rax
ffff800000106cdf:	48 83 c0 08          	add    $0x8,%rax
ffff800000106ce3:	48 8b 00             	mov    (%rax),%rax
ffff800000106ce6:	48 01 c8             	add    %rcx,%rax
ffff800000106ce9:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff800000106cef:	48 89 45 88          	mov    %rax,-0x78(%rbp)
ffff800000106cf3:	48 8b 45 90          	mov    -0x70(%rbp),%rax
ffff800000106cf7:	48 3b 45 88          	cmp    -0x78(%rbp),%rax
ffff800000106cfb:	73 15                	jae    ffff800000106d12 <init_mem+0x2fd>
ffff800000106cfd:	48 8b 45 88          	mov    -0x78(%rbp),%rax
ffff800000106d01:	48 2b 45 90          	sub    -0x70(%rbp),%rax
ffff800000106d05:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106d09:	48 01 45 e8          	add    %rax,-0x18(%rbp)
ffff800000106d0d:	eb 04                	jmp    ffff800000106d13 <init_mem+0x2fe>
ffff800000106d0f:	90                   	nop
ffff800000106d10:	eb 01                	jmp    ffff800000106d13 <init_mem+0x2fe>
ffff800000106d12:	90                   	nop
ffff800000106d13:	83 45 d8 01          	addl   $0x1,-0x28(%rbp)
ffff800000106d17:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000106d1a:	48 63 d0             	movslq %eax,%rdx
ffff800000106d1d:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106d24:	ff ff ff 
ffff800000106d27:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106d2b:	48 8b 80 80 02 00 00 	mov    0x280(%rax),%rax
ffff800000106d32:	48 39 c2             	cmp    %rax,%rdx
ffff800000106d35:	0f 82 eb fe ff ff    	jb     ffff800000106c26 <init_mem+0x211>
ffff800000106d3b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106d3f:	48 89 c1             	mov    %rax,%rcx
ffff800000106d42:	48 b8 a9 17 00 00 00 	movabs $0x17a9,%rax
ffff800000106d49:	00 00 00 
ffff800000106d4c:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106d50:	be ff ff 00 00       	mov    $0xffff,%esi
ffff800000106d55:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106d5a:	49 89 df             	mov    %rbx,%r15
ffff800000106d5d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106d62:	49 b8 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r8
ffff800000106d69:	ff ff ff 
ffff800000106d6c:	49 01 d8             	add    %rbx,%r8
ffff800000106d6f:	41 ff d0             	callq  *%r8
ffff800000106d72:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106d79:	ff ff ff 
ffff800000106d7c:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106d80:	48 8b 90 80 02 00 00 	mov    0x280(%rax),%rdx
ffff800000106d87:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106d8e:	ff ff ff 
ffff800000106d91:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000106d95:	48 89 d0             	mov    %rdx,%rax
ffff800000106d98:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106d9c:	48 01 d0             	add    %rdx,%rax
ffff800000106d9f:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106da3:	48 01 c8             	add    %rcx,%rax
ffff800000106da6:	48 8b 08             	mov    (%rax),%rcx
ffff800000106da9:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106db0:	ff ff ff 
ffff800000106db3:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106db7:	48 8b 90 80 02 00 00 	mov    0x280(%rax),%rdx
ffff800000106dbe:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106dc5:	ff ff ff 
ffff800000106dc8:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000106dcc:	48 89 d0             	mov    %rdx,%rax
ffff800000106dcf:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106dd3:	48 01 d0             	add    %rdx,%rax
ffff800000106dd6:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106dda:	48 01 f0             	add    %rsi,%rax
ffff800000106ddd:	48 83 c0 08          	add    $0x8,%rax
ffff800000106de1:	48 8b 00             	mov    (%rax),%rax
ffff800000106de4:	48 01 c8             	add    %rcx,%rax
ffff800000106de7:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000106deb:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106df2:	ff ff ff 
ffff800000106df5:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106df9:	48 8b 80 e8 02 00 00 	mov    0x2e8(%rax),%rax
ffff800000106e00:	48 05 ff 0f 00 00    	add    $0xfff,%rax
ffff800000106e06:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffff800000106e0c:	48 89 c2             	mov    %rax,%rdx
ffff800000106e0f:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106e16:	ff ff ff 
ffff800000106e19:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106e1d:	48 89 90 88 02 00 00 	mov    %rdx,0x288(%rax)
ffff800000106e24:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106e28:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106e2c:	48 89 c2             	mov    %rax,%rdx
ffff800000106e2f:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106e36:	ff ff ff 
ffff800000106e39:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106e3d:	48 89 90 90 02 00 00 	mov    %rdx,0x290(%rax)
ffff800000106e44:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106e48:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106e4c:	48 83 c0 3f          	add    $0x3f,%rax
ffff800000106e50:	48 c1 e8 03          	shr    $0x3,%rax
ffff800000106e54:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff800000106e58:	48 89 c2             	mov    %rax,%rdx
ffff800000106e5b:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106e62:	ff ff ff 
ffff800000106e65:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106e69:	48 89 90 98 02 00 00 	mov    %rdx,0x298(%rax)
ffff800000106e70:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106e77:	ff ff ff 
ffff800000106e7a:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106e7e:	48 8b 80 98 02 00 00 	mov    0x298(%rax),%rax
ffff800000106e85:	48 89 c2             	mov    %rax,%rdx
ffff800000106e88:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106e8f:	ff ff ff 
ffff800000106e92:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106e96:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff800000106e9d:	be ff 00 00 00       	mov    $0xff,%esi
ffff800000106ea2:	48 89 c7             	mov    %rax,%rdi
ffff800000106ea5:	49 89 df             	mov    %rbx,%r15
ffff800000106ea8:	48 b8 85 be ff ff ff 	movabs $0xffffffffffffbe85,%rax
ffff800000106eaf:	ff ff ff 
ffff800000106eb2:	48 01 d8             	add    %rbx,%rax
ffff800000106eb5:	ff d0                	callq  *%rax
ffff800000106eb7:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106ebe:	ff ff ff 
ffff800000106ec1:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106ec5:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000106ecc:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106ed3:	ff ff ff 
ffff800000106ed6:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106eda:	48 8b 80 98 02 00 00 	mov    0x298(%rax),%rax
ffff800000106ee1:	48 05 00 10 00 00    	add    $0x1000,%rax
ffff800000106ee7:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106eeb:	48 83 e8 08          	sub    $0x8,%rax
ffff800000106eef:	48 01 d0             	add    %rdx,%rax
ffff800000106ef2:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffff800000106ef8:	48 89 c2             	mov    %rax,%rdx
ffff800000106efb:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106f02:	ff ff ff 
ffff800000106f05:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106f09:	48 89 90 a0 02 00 00 	mov    %rdx,0x2a0(%rax)
ffff800000106f10:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106f14:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106f18:	48 89 c2             	mov    %rax,%rdx
ffff800000106f1b:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106f22:	ff ff ff 
ffff800000106f25:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106f29:	48 89 90 a8 02 00 00 	mov    %rdx,0x2a8(%rax)
ffff800000106f30:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106f34:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106f38:	48 89 c2             	mov    %rax,%rdx
ffff800000106f3b:	48 89 d0             	mov    %rdx,%rax
ffff800000106f3e:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f42:	48 01 d0             	add    %rdx,%rax
ffff800000106f45:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106f49:	48 83 c0 07          	add    $0x7,%rax
ffff800000106f4d:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff800000106f51:	48 89 c2             	mov    %rax,%rdx
ffff800000106f54:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106f5b:	ff ff ff 
ffff800000106f5e:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106f62:	48 89 90 b0 02 00 00 	mov    %rdx,0x2b0(%rax)
ffff800000106f69:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106f70:	ff ff ff 
ffff800000106f73:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106f77:	48 8b 80 b0 02 00 00 	mov    0x2b0(%rax),%rax
ffff800000106f7e:	48 89 c2             	mov    %rax,%rdx
ffff800000106f81:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106f88:	ff ff ff 
ffff800000106f8b:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106f8f:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000106f96:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106f9b:	48 89 c7             	mov    %rax,%rdi
ffff800000106f9e:	49 89 df             	mov    %rbx,%r15
ffff800000106fa1:	48 b8 85 be ff ff ff 	movabs $0xffffffffffffbe85,%rax
ffff800000106fa8:	ff ff ff 
ffff800000106fab:	48 01 d8             	add    %rbx,%rax
ffff800000106fae:	ff d0                	callq  *%rax
ffff800000106fb0:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106fb7:	ff ff ff 
ffff800000106fba:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106fbe:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000106fc5:	48 89 c2             	mov    %rax,%rdx
ffff800000106fc8:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106fcf:	ff ff ff 
ffff800000106fd2:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106fd6:	48 8b 80 b0 02 00 00 	mov    0x2b0(%rax),%rax
ffff800000106fdd:	48 01 d0             	add    %rdx,%rax
ffff800000106fe0:	48 05 ff 0f 00 00    	add    $0xfff,%rax
ffff800000106fe6:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffff800000106fec:	48 89 c2             	mov    %rax,%rdx
ffff800000106fef:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106ff6:	ff ff ff 
ffff800000106ff9:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106ffd:	48 89 90 b8 02 00 00 	mov    %rdx,0x2b8(%rax)
ffff800000107004:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010700b:	ff ff ff 
ffff80000010700e:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107012:	48 c7 80 c8 02 00 00 	movq   $0x0,0x2c8(%rax)
ffff800000107019:	00 00 00 00 
ffff80000010701d:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107024:	ff ff ff 
ffff800000107027:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010702b:	48 c7 80 c0 02 00 00 	movq   $0x190,0x2c0(%rax)
ffff800000107032:	90 01 00 00 
ffff800000107036:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010703d:	ff ff ff 
ffff800000107040:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107044:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
ffff80000010704b:	48 89 c2             	mov    %rax,%rdx
ffff80000010704e:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107055:	ff ff ff 
ffff800000107058:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010705c:	48 8b 80 b8 02 00 00 	mov    0x2b8(%rax),%rax
ffff800000107063:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107068:	48 89 c7             	mov    %rax,%rdi
ffff80000010706b:	49 89 df             	mov    %rbx,%r15
ffff80000010706e:	48 b8 85 be ff ff ff 	movabs $0xffffffffffffbe85,%rax
ffff800000107075:	ff ff ff 
ffff800000107078:	48 01 d8             	add    %rbx,%rax
ffff80000010707b:	ff d0                	callq  *%rax
ffff80000010707d:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
ffff800000107084:	e9 11 03 00 00       	jmpq   ffff80000010739a <init_mem+0x985>
ffff800000107089:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107090:	ff ff ff 
ffff800000107093:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000107097:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff80000010709a:	48 63 d0             	movslq %eax,%rdx
ffff80000010709d:	48 89 d0             	mov    %rdx,%rax
ffff8000001070a0:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001070a4:	48 01 d0             	add    %rdx,%rax
ffff8000001070a7:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001070ab:	48 01 c8             	add    %rcx,%rax
ffff8000001070ae:	48 83 c0 10          	add    $0x10,%rax
ffff8000001070b2:	8b 00                	mov    (%rax),%eax
ffff8000001070b4:	83 f8 01             	cmp    $0x1,%eax
ffff8000001070b7:	0f 85 d5 02 00 00    	jne    ffff800000107392 <init_mem+0x97d>
ffff8000001070bd:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001070c4:	ff ff ff 
ffff8000001070c7:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff8000001070cb:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff8000001070ce:	48 63 d0             	movslq %eax,%rdx
ffff8000001070d1:	48 89 d0             	mov    %rdx,%rax
ffff8000001070d4:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001070d8:	48 01 d0             	add    %rdx,%rax
ffff8000001070db:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001070df:	48 01 c8             	add    %rcx,%rax
ffff8000001070e2:	48 8b 00             	mov    (%rax),%rax
ffff8000001070e5:	48 05 ff ff 1f 00    	add    $0x1fffff,%rax
ffff8000001070eb:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff8000001070f1:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
ffff8000001070f5:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001070fc:	ff ff ff 
ffff8000001070ff:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000107103:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff800000107106:	48 63 d0             	movslq %eax,%rdx
ffff800000107109:	48 89 d0             	mov    %rdx,%rax
ffff80000010710c:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107110:	48 01 d0             	add    %rdx,%rax
ffff800000107113:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107117:	48 01 c8             	add    %rcx,%rax
ffff80000010711a:	48 8b 08             	mov    (%rax),%rcx
ffff80000010711d:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107124:	ff ff ff 
ffff800000107127:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff80000010712b:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff80000010712e:	48 63 d0             	movslq %eax,%rdx
ffff800000107131:	48 89 d0             	mov    %rdx,%rax
ffff800000107134:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107138:	48 01 d0             	add    %rdx,%rax
ffff80000010713b:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010713f:	48 01 f0             	add    %rsi,%rax
ffff800000107142:	48 83 c0 08          	add    $0x8,%rax
ffff800000107146:	48 8b 00             	mov    (%rax),%rax
ffff800000107149:	48 01 c8             	add    %rcx,%rax
ffff80000010714c:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff800000107152:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
ffff800000107156:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff80000010715a:	48 3b 45 a8          	cmp    -0x58(%rbp),%rax
ffff80000010715e:	0f 86 31 02 00 00    	jbe    ffff800000107395 <init_mem+0x980>
ffff800000107164:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010716b:	ff ff ff 
ffff80000010716e:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107172:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff800000107179:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107180:	ff ff ff 
ffff800000107183:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107187:	48 8b 90 c8 02 00 00 	mov    0x2c8(%rax),%rdx
ffff80000010718e:	48 89 d0             	mov    %rdx,%rax
ffff800000107191:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107195:	48 01 d0             	add    %rdx,%rax
ffff800000107198:	48 c1 e0 04          	shl    $0x4,%rax
ffff80000010719c:	48 01 c8             	add    %rcx,%rax
ffff80000010719f:	48 89 45 98          	mov    %rax,-0x68(%rbp)
ffff8000001071a3:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001071aa:	ff ff ff 
ffff8000001071ad:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001071b1:	48 8b 80 c8 02 00 00 	mov    0x2c8(%rax),%rax
ffff8000001071b8:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001071bc:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001071c3:	ff ff ff 
ffff8000001071c6:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001071ca:	48 89 90 c8 02 00 00 	mov    %rdx,0x2c8(%rax)
ffff8000001071d1:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff8000001071d5:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff8000001071d9:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff8000001071dd:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff8000001071e1:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
ffff8000001071e5:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff8000001071e9:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff8000001071ed:	48 2b 45 a8          	sub    -0x58(%rbp),%rax
ffff8000001071f1:	48 89 c2             	mov    %rax,%rdx
ffff8000001071f4:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff8000001071f8:	48 89 50 20          	mov    %rdx,0x20(%rax)
ffff8000001071fc:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107200:	48 c7 40 38 00 00 00 	movq   $0x0,0x38(%rax)
ffff800000107207:	00 
ffff800000107208:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff80000010720c:	48 2b 45 a8          	sub    -0x58(%rbp),%rax
ffff800000107210:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107214:	48 89 c2             	mov    %rax,%rdx
ffff800000107217:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff80000010721b:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff80000010721f:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107223:	48 c7 40 48 00 00 00 	movq   $0x0,0x48(%rax)
ffff80000010722a:	00 
ffff80000010722b:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff80000010722f:	48 c7 40 28 00 00 00 	movq   $0x0,0x28(%rax)
ffff800000107236:	00 
ffff800000107237:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff80000010723b:	48 ba d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rdx
ffff800000107242:	ff ff ff 
ffff800000107245:	48 8b 14 13          	mov    (%rbx,%rdx,1),%rdx
ffff800000107249:	48 89 50 30          	mov    %rdx,0x30(%rax)
ffff80000010724d:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff800000107251:	48 2b 45 a8          	sub    -0x58(%rbp),%rax
ffff800000107255:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107259:	48 89 c2             	mov    %rax,%rdx
ffff80000010725c:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107260:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107264:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010726b:	ff ff ff 
ffff80000010726e:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107272:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff800000107279:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff80000010727d:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107281:	48 89 c2             	mov    %rax,%rdx
ffff800000107284:	48 89 d0             	mov    %rdx,%rax
ffff800000107287:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010728b:	48 01 d0             	add    %rdx,%rax
ffff80000010728e:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107292:	48 8d 14 01          	lea    (%rcx,%rax,1),%rdx
ffff800000107296:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff80000010729a:	48 89 10             	mov    %rdx,(%rax)
ffff80000010729d:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff8000001072a1:	48 8b 00             	mov    (%rax),%rax
ffff8000001072a4:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff8000001072a8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%rbp)
ffff8000001072af:	e9 c5 00 00 00       	jmpq   ffff800000107379 <init_mem+0x964>
ffff8000001072b4:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001072b8:	48 8b 55 98          	mov    -0x68(%rbp),%rdx
ffff8000001072bc:	48 89 10             	mov    %rdx,(%rax)
ffff8000001072bf:	8b 45 c4             	mov    -0x3c(%rbp),%eax
ffff8000001072c2:	48 98                	cltq   
ffff8000001072c4:	48 c1 e0 15          	shl    $0x15,%rax
ffff8000001072c8:	48 89 c2             	mov    %rax,%rdx
ffff8000001072cb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff8000001072cf:	48 01 c2             	add    %rax,%rdx
ffff8000001072d2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001072d6:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff8000001072da:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001072de:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff8000001072e5:	00 
ffff8000001072e6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001072ea:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
ffff8000001072f1:	00 
ffff8000001072f2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001072f6:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
ffff8000001072fd:	00 
ffff8000001072fe:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107305:	ff ff ff 
ffff800000107308:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010730c:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000107313:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107317:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff80000010731b:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff80000010731f:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107323:	48 01 d0             	add    %rdx,%rax
ffff800000107326:	48 8b 10             	mov    (%rax),%rdx
ffff800000107329:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010732d:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107331:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107335:	83 e0 3f             	and    $0x3f,%eax
ffff800000107338:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010733d:	89 c1                	mov    %eax,%ecx
ffff80000010733f:	48 d3 e6             	shl    %cl,%rsi
ffff800000107342:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107349:	ff ff ff 
ffff80000010734c:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107350:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
ffff800000107357:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010735b:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff80000010735f:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000107363:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107367:	48 01 c8             	add    %rcx,%rax
ffff80000010736a:	48 31 f2             	xor    %rsi,%rdx
ffff80000010736d:	48 89 10             	mov    %rdx,(%rax)
ffff800000107370:	83 45 c4 01          	addl   $0x1,-0x3c(%rbp)
ffff800000107374:	48 83 45 c8 28       	addq   $0x28,-0x38(%rbp)
ffff800000107379:	8b 45 c4             	mov    -0x3c(%rbp),%eax
ffff80000010737c:	48 63 d0             	movslq %eax,%rdx
ffff80000010737f:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107383:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107387:	48 39 c2             	cmp    %rax,%rdx
ffff80000010738a:	0f 82 24 ff ff ff    	jb     ffff8000001072b4 <init_mem+0x89f>
ffff800000107390:	eb 04                	jmp    ffff800000107396 <init_mem+0x981>
ffff800000107392:	90                   	nop
ffff800000107393:	eb 01                	jmp    ffff800000107396 <init_mem+0x981>
ffff800000107395:	90                   	nop
ffff800000107396:	83 45 d4 01          	addl   $0x1,-0x2c(%rbp)
ffff80000010739a:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff80000010739d:	48 63 d0             	movslq %eax,%rdx
ffff8000001073a0:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001073a7:	ff ff ff 
ffff8000001073aa:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001073ae:	48 8b 80 80 02 00 00 	mov    0x280(%rax),%rax
ffff8000001073b5:	48 39 c2             	cmp    %rax,%rdx
ffff8000001073b8:	0f 82 cb fc ff ff    	jb     ffff800000107089 <init_mem+0x674>
ffff8000001073be:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001073c5:	ff ff ff 
ffff8000001073c8:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001073cc:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff8000001073d3:	48 ba d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rdx
ffff8000001073da:	ff ff ff 
ffff8000001073dd:	48 8b 14 13          	mov    (%rbx,%rdx,1),%rdx
ffff8000001073e1:	48 8b 92 b8 02 00 00 	mov    0x2b8(%rdx),%rdx
ffff8000001073e8:	48 89 10             	mov    %rdx,(%rax)
ffff8000001073eb:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001073f2:	ff ff ff 
ffff8000001073f5:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001073f9:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000107400:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
ffff800000107407:	00 
ffff800000107408:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010740f:	ff ff ff 
ffff800000107412:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107416:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff80000010741d:	be 83 00 00 00       	mov    $0x83,%esi
ffff800000107422:	48 89 c7             	mov    %rax,%rdi
ffff800000107425:	48 b8 30 ab ff ff ff 	movabs $0xffffffffffffab30,%rax
ffff80000010742c:	ff ff ff 
ffff80000010742f:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000107433:	ff d0                	callq  *%rax
ffff800000107435:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010743c:	ff ff ff 
ffff80000010743f:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107443:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff80000010744a:	48 c7 40 18 01 00 00 	movq   $0x1,0x18(%rax)
ffff800000107451:	00 
ffff800000107452:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107459:	ff ff ff 
ffff80000010745c:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107460:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000107467:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
ffff80000010746e:	00 
ffff80000010746f:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107476:	ff ff ff 
ffff800000107479:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010747d:	48 8b 90 c8 02 00 00 	mov    0x2c8(%rax),%rdx
ffff800000107484:	48 89 d0             	mov    %rdx,%rax
ffff800000107487:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010748b:	48 01 d0             	add    %rdx,%rax
ffff80000010748e:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000107492:	48 83 c0 07          	add    $0x7,%rax
ffff800000107496:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff80000010749a:	48 89 c2             	mov    %rax,%rdx
ffff80000010749d:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001074a4:	ff ff ff 
ffff8000001074a7:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001074ab:	48 89 90 c0 02 00 00 	mov    %rdx,0x2c0(%rax)
ffff8000001074b2:	48 b8 98 41 01 00 00 	movabs $0x14198,%rax
ffff8000001074b9:	00 00 00 
ffff8000001074bc:	c7 04 03 00 00 00 00 	movl   $0x0,(%rbx,%rax,1)
ffff8000001074c3:	48 b8 9c 41 01 00 00 	movabs $0x1419c,%rax
ffff8000001074ca:	00 00 00 
ffff8000001074cd:	c7 04 03 00 00 00 00 	movl   $0x0,(%rbx,%rax,1)
ffff8000001074d4:	48 b8 a0 41 01 00 00 	movabs $0x141a0,%rax
ffff8000001074db:	00 00 00 
ffff8000001074de:	c7 04 03 00 00 00 00 	movl   $0x0,(%rbx,%rax,1)
ffff8000001074e5:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%rbp)
ffff8000001074ec:	e9 c8 00 00 00       	jmpq   ffff8000001075b9 <init_mem+0xba4>
ffff8000001074f1:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001074f8:	ff ff ff 
ffff8000001074fb:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001074ff:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff800000107506:	8b 45 c0             	mov    -0x40(%rbp),%eax
ffff800000107509:	48 63 d0             	movslq %eax,%rdx
ffff80000010750c:	48 89 d0             	mov    %rdx,%rax
ffff80000010750f:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107513:	48 01 d0             	add    %rdx,%rax
ffff800000107516:	48 c1 e0 04          	shl    $0x4,%rax
ffff80000010751a:	48 01 c8             	add    %rcx,%rax
ffff80000010751d:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff800000107521:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107525:	48 8b 70 08          	mov    0x8(%rax),%rsi
ffff800000107529:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff80000010752d:	48 8b 08             	mov    (%rax),%rcx
ffff800000107530:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107534:	48 8b 50 20          	mov    0x20(%rax),%rdx
ffff800000107538:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff80000010753c:	4c 8b 40 18          	mov    0x18(%rax),%r8
ffff800000107540:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107544:	48 8b 78 10          	mov    0x10(%rax),%rdi
ffff800000107548:	8b 45 c0             	mov    -0x40(%rbp),%eax
ffff80000010754b:	48 83 ec 08          	sub    $0x8,%rsp
ffff80000010754f:	56                   	push   %rsi
ffff800000107550:	51                   	push   %rcx
ffff800000107551:	52                   	push   %rdx
ffff800000107552:	4d 89 c1             	mov    %r8,%r9
ffff800000107555:	49 89 f8             	mov    %rdi,%r8
ffff800000107558:	89 c1                	mov    %eax,%ecx
ffff80000010755a:	48 b8 c8 17 00 00 00 	movabs $0x17c8,%rax
ffff800000107561:	00 00 00 
ffff800000107564:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000107568:	be 00 80 ff 00       	mov    $0xff8000,%esi
ffff80000010756d:	bf 00 ff 00 00       	mov    $0xff00,%edi
ffff800000107572:	49 89 df             	mov    %rbx,%r15
ffff800000107575:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010757a:	49 ba 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r10
ffff800000107581:	ff ff ff 
ffff800000107584:	49 01 da             	add    %rbx,%r10
ffff800000107587:	41 ff d2             	callq  *%r10
ffff80000010758a:	48 83 c4 20          	add    $0x20,%rsp
ffff80000010758e:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107592:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000107596:	48 b8 00 00 00 00 01 	movabs $0x100000000,%rax
ffff80000010759d:	00 00 00 
ffff8000001075a0:	48 39 c2             	cmp    %rax,%rdx
ffff8000001075a3:	75 10                	jne    ffff8000001075b5 <init_mem+0xba0>
ffff8000001075a5:	48 b8 a0 41 01 00 00 	movabs $0x141a0,%rax
ffff8000001075ac:	00 00 00 
ffff8000001075af:	8b 55 c0             	mov    -0x40(%rbp),%edx
ffff8000001075b2:	89 14 03             	mov    %edx,(%rbx,%rax,1)
ffff8000001075b5:	83 45 c0 01          	addl   $0x1,-0x40(%rbp)
ffff8000001075b9:	8b 45 c0             	mov    -0x40(%rbp),%eax
ffff8000001075bc:	48 63 d0             	movslq %eax,%rdx
ffff8000001075bf:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001075c6:	ff ff ff 
ffff8000001075c9:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001075cd:	48 8b 80 c8 02 00 00 	mov    0x2c8(%rax),%rax
ffff8000001075d4:	48 39 c2             	cmp    %rax,%rdx
ffff8000001075d7:	0f 82 14 ff ff ff    	jb     ffff8000001074f1 <init_mem+0xadc>
ffff8000001075dd:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001075e4:	ff ff ff 
ffff8000001075e7:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001075eb:	48 8b 80 b8 02 00 00 	mov    0x2b8(%rax),%rax
ffff8000001075f2:	48 89 c2             	mov    %rax,%rdx
ffff8000001075f5:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001075fc:	ff ff ff 
ffff8000001075ff:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107603:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
ffff80000010760a:	48 01 d0             	add    %rdx,%rax
ffff80000010760d:	48 05 00 01 00 00    	add    $0x100,%rax
ffff800000107613:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff800000107617:	48 89 c2             	mov    %rax,%rdx
ffff80000010761a:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107621:	ff ff ff 
ffff800000107624:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107628:	48 89 90 f0 02 00 00 	mov    %rdx,0x2f0(%rax)
ffff80000010762f:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107636:	ff ff ff 
ffff800000107639:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010763d:	48 8b 90 f0 02 00 00 	mov    0x2f0(%rax),%rdx
ffff800000107644:	48 b8 00 00 00 00 00 	movabs $0x800000000000,%rax
ffff80000010764b:	80 00 00 
ffff80000010764e:	48 01 d0             	add    %rdx,%rax
ffff800000107651:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107655:	89 45 c0             	mov    %eax,-0x40(%rbp)
ffff800000107658:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%rbp)
ffff80000010765f:	eb 48                	jmp    ffff8000001076a9 <init_mem+0xc94>
ffff800000107661:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107668:	ff ff ff 
ffff80000010766b:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010766f:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff800000107676:	8b 45 bc             	mov    -0x44(%rbp),%eax
ffff800000107679:	48 63 d0             	movslq %eax,%rdx
ffff80000010767c:	48 89 d0             	mov    %rdx,%rax
ffff80000010767f:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107683:	48 01 d0             	add    %rdx,%rax
ffff800000107686:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010768a:	48 01 c8             	add    %rcx,%rax
ffff80000010768d:	be 93 00 00 00       	mov    $0x93,%esi
ffff800000107692:	48 89 c7             	mov    %rax,%rdi
ffff800000107695:	48 b8 d1 a9 ff ff ff 	movabs $0xffffffffffffa9d1,%rax
ffff80000010769c:	ff ff ff 
ffff80000010769f:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001076a3:	ff d0                	callq  *%rax
ffff8000001076a5:	83 45 bc 01          	addl   $0x1,-0x44(%rbp)
ffff8000001076a9:	8b 45 bc             	mov    -0x44(%rbp),%eax
ffff8000001076ac:	3b 45 c0             	cmp    -0x40(%rbp),%eax
ffff8000001076af:	7c b0                	jl     ffff800000107661 <init_mem+0xc4c>
ffff8000001076b1:	49 89 df             	mov    %rbx,%r15
ffff8000001076b4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001076b9:	48 ba 46 bf ff ff ff 	movabs $0xffffffffffffbf46,%rdx
ffff8000001076c0:	ff ff ff 
ffff8000001076c3:	48 01 da             	add    %rbx,%rdx
ffff8000001076c6:	ff d2                	callq  *%rdx
ffff8000001076c8:	48 89 c2             	mov    %rax,%rdx
ffff8000001076cb:	48 b8 a8 41 01 00 00 	movabs $0x141a8,%rax
ffff8000001076d2:	00 00 00 
ffff8000001076d5:	48 89 14 03          	mov    %rdx,(%rbx,%rax,1)
ffff8000001076d9:	48 b8 a8 41 01 00 00 	movabs $0x141a8,%rax
ffff8000001076e0:	00 00 00 
ffff8000001076e3:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001076e7:	48 89 c1             	mov    %rax,%rcx
ffff8000001076ea:	48 b8 24 18 00 00 00 	movabs $0x1824,%rax
ffff8000001076f1:	00 00 00 
ffff8000001076f4:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001076f8:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001076fd:	bf ff ff 00 00       	mov    $0xffff,%edi
ffff800000107702:	49 89 df             	mov    %rbx,%r15
ffff800000107705:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010770a:	49 b8 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r8
ffff800000107711:	ff ff ff 
ffff800000107714:	49 01 d8             	add    %rbx,%r8
ffff800000107717:	41 ff d0             	callq  *%r8
ffff80000010771a:	48 b8 a8 41 01 00 00 	movabs $0x141a8,%rax
ffff800000107721:	00 00 00 
ffff800000107724:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107728:	48 89 c2             	mov    %rax,%rdx
ffff80000010772b:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff800000107732:	80 ff ff 
ffff800000107735:	48 01 d0             	add    %rdx,%rax
ffff800000107738:	48 8b 00             	mov    (%rax),%rax
ffff80000010773b:	b0 00                	mov    $0x0,%al
ffff80000010773d:	48 89 c1             	mov    %rax,%rcx
ffff800000107740:	48 b8 33 18 00 00 00 	movabs $0x1833,%rax
ffff800000107747:	00 00 00 
ffff80000010774a:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010774e:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107753:	bf ff ff 00 00       	mov    $0xffff,%edi
ffff800000107758:	49 89 df             	mov    %rbx,%r15
ffff80000010775b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107760:	49 b8 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r8
ffff800000107767:	ff ff ff 
ffff80000010776a:	49 01 d8             	add    %rbx,%r8
ffff80000010776d:	41 ff d0             	callq  *%r8
ffff800000107770:	48 b8 a8 41 01 00 00 	movabs $0x141a8,%rax
ffff800000107777:	00 00 00 
ffff80000010777a:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010777e:	48 89 c2             	mov    %rax,%rdx
ffff800000107781:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff800000107788:	80 ff ff 
ffff80000010778b:	48 01 d0             	add    %rdx,%rax
ffff80000010778e:	48 8b 00             	mov    (%rax),%rax
ffff800000107791:	b0 00                	mov    $0x0,%al
ffff800000107793:	48 89 c2             	mov    %rax,%rdx
ffff800000107796:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff80000010779d:	80 ff ff 
ffff8000001077a0:	48 01 d0             	add    %rdx,%rax
ffff8000001077a3:	48 8b 00             	mov    (%rax),%rax
ffff8000001077a6:	b0 00                	mov    $0x0,%al
ffff8000001077a8:	48 89 c1             	mov    %rax,%rcx
ffff8000001077ab:	48 b8 43 18 00 00 00 	movabs $0x1843,%rax
ffff8000001077b2:	00 00 00 
ffff8000001077b5:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001077b9:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001077be:	bf ff 00 80 00       	mov    $0x8000ff,%edi
ffff8000001077c3:	49 89 df             	mov    %rbx,%r15
ffff8000001077c6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001077cb:	49 b8 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r8
ffff8000001077d2:	ff ff ff 
ffff8000001077d5:	49 01 d8             	add    %rbx,%r8
ffff8000001077d8:	41 ff d0             	callq  *%r8
ffff8000001077db:	90                   	nop
ffff8000001077dc:	48 8d 65 f0          	lea    -0x10(%rbp),%rsp
ffff8000001077e0:	5b                   	pop    %rbx
ffff8000001077e1:	41 5f                	pop    %r15
ffff8000001077e3:	5d                   	pop    %rbp
ffff8000001077e4:	c3                   	retq   

ffff8000001077e5 <alloc_pages>:
ffff8000001077e5:	55                   	push   %rbp
ffff8000001077e6:	48 89 e5             	mov    %rsp,%rbp
ffff8000001077e9:	41 57                	push   %r15
ffff8000001077eb:	53                   	push   %rbx
ffff8000001077ec:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
ffff8000001077f0:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff8000001077f0 <alloc_pages+0xb>
ffff8000001077f7:	49 bb 78 46 00 00 00 	movabs $0x4678,%r11
ffff8000001077fe:	00 00 00 
ffff800000107801:	4c 01 db             	add    %r11,%rbx
ffff800000107804:	89 bd 7c ff ff ff    	mov    %edi,-0x84(%rbp)
ffff80000010780a:	89 b5 78 ff ff ff    	mov    %esi,-0x88(%rbp)
ffff800000107810:	48 89 95 70 ff ff ff 	mov    %rdx,-0x90(%rbp)
ffff800000107817:	48 c7 45 c0 00 00 00 	movq   $0x0,-0x40(%rbp)
ffff80000010781e:	00 
ffff80000010781f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
ffff800000107826:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
ffff80000010782d:	8b 85 7c ff ff ff    	mov    -0x84(%rbp),%eax
ffff800000107833:	83 f8 02             	cmp    $0x2,%eax
ffff800000107836:	74 26                	je     ffff80000010785e <alloc_pages+0x79>
ffff800000107838:	83 f8 04             	cmp    $0x4,%eax
ffff80000010783b:	74 43                	je     ffff800000107880 <alloc_pages+0x9b>
ffff80000010783d:	83 f8 01             	cmp    $0x1,%eax
ffff800000107840:	75 6b                	jne    ffff8000001078ad <alloc_pages+0xc8>
ffff800000107842:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
ffff800000107849:	48 b8 98 41 01 00 00 	movabs $0x14198,%rax
ffff800000107850:	00 00 00 
ffff800000107853:	8b 04 03             	mov    (%rbx,%rax,1),%eax
ffff800000107856:	89 45 e4             	mov    %eax,-0x1c(%rbp)
ffff800000107859:	e9 88 00 00 00       	jmpq   ffff8000001078e6 <alloc_pages+0x101>
ffff80000010785e:	48 b8 98 41 01 00 00 	movabs $0x14198,%rax
ffff800000107865:	00 00 00 
ffff800000107868:	8b 04 03             	mov    (%rbx,%rax,1),%eax
ffff80000010786b:	89 45 e8             	mov    %eax,-0x18(%rbp)
ffff80000010786e:	48 b8 9c 41 01 00 00 	movabs $0x1419c,%rax
ffff800000107875:	00 00 00 
ffff800000107878:	8b 04 03             	mov    (%rbx,%rax,1),%eax
ffff80000010787b:	89 45 e4             	mov    %eax,-0x1c(%rbp)
ffff80000010787e:	eb 66                	jmp    ffff8000001078e6 <alloc_pages+0x101>
ffff800000107880:	48 b8 a0 41 01 00 00 	movabs $0x141a0,%rax
ffff800000107887:	00 00 00 
ffff80000010788a:	8b 04 03             	mov    (%rbx,%rax,1),%eax
ffff80000010788d:	89 45 e8             	mov    %eax,-0x18(%rbp)
ffff800000107890:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107897:	ff ff ff 
ffff80000010789a:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010789e:	48 8b 80 c8 02 00 00 	mov    0x2c8(%rax),%rax
ffff8000001078a5:	83 e8 01             	sub    $0x1,%eax
ffff8000001078a8:	89 45 e4             	mov    %eax,-0x1c(%rbp)
ffff8000001078ab:	eb 39                	jmp    ffff8000001078e6 <alloc_pages+0x101>
ffff8000001078ad:	48 b8 58 18 00 00 00 	movabs $0x1858,%rax
ffff8000001078b4:	00 00 00 
ffff8000001078b7:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001078bb:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001078c0:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001078c5:	49 89 df             	mov    %rbx,%r15
ffff8000001078c8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001078cd:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff8000001078d4:	ff ff ff 
ffff8000001078d7:	48 01 d9             	add    %rbx,%rcx
ffff8000001078da:	ff d1                	callq  *%rcx
ffff8000001078dc:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001078e1:	e9 88 02 00 00       	jmpq   ffff800000107b6e <alloc_pages+0x389>
ffff8000001078e6:	8b 45 e8             	mov    -0x18(%rbp),%eax
ffff8000001078e9:	89 45 ec             	mov    %eax,-0x14(%rbp)
ffff8000001078ec:	e9 6c 02 00 00       	jmpq   ffff800000107b5d <alloc_pages+0x378>
ffff8000001078f1:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001078f8:	ff ff ff 
ffff8000001078fb:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001078ff:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff800000107906:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000107909:	48 63 d0             	movslq %eax,%rdx
ffff80000010790c:	48 89 d0             	mov    %rdx,%rax
ffff80000010790f:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107913:	48 01 d0             	add    %rdx,%rax
ffff800000107916:	48 c1 e0 04          	shl    $0x4,%rax
ffff80000010791a:	48 01 c8             	add    %rcx,%rax
ffff80000010791d:	48 8b 50 40          	mov    0x40(%rax),%rdx
ffff800000107921:	8b 85 78 ff ff ff    	mov    -0x88(%rbp),%eax
ffff800000107927:	48 98                	cltq   
ffff800000107929:	48 39 c2             	cmp    %rax,%rdx
ffff80000010792c:	0f 82 26 02 00 00    	jb     ffff800000107b58 <alloc_pages+0x373>
ffff800000107932:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107939:	ff ff ff 
ffff80000010793c:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107940:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff800000107947:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff80000010794a:	48 63 d0             	movslq %eax,%rdx
ffff80000010794d:	48 89 d0             	mov    %rdx,%rax
ffff800000107950:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107954:	48 01 d0             	add    %rdx,%rax
ffff800000107957:	48 c1 e0 04          	shl    $0x4,%rax
ffff80000010795b:	48 01 c8             	add    %rcx,%rax
ffff80000010795e:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
ffff800000107962:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000107966:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff80000010796a:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010796e:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff800000107972:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000107976:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff80000010797a:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010797e:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
ffff800000107982:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000107986:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff80000010798a:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010798e:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
ffff800000107992:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107996:	83 e0 3f             	and    $0x3f,%eax
ffff800000107999:	ba 40 00 00 00       	mov    $0x40,%edx
ffff80000010799e:	48 29 c2             	sub    %rax,%rdx
ffff8000001079a1:	48 89 d0             	mov    %rdx,%rax
ffff8000001079a4:	48 89 45 98          	mov    %rax,-0x68(%rbp)
ffff8000001079a8:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff8000001079ac:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff8000001079b0:	e9 93 01 00 00       	jmpq   ffff800000107b48 <alloc_pages+0x363>
ffff8000001079b5:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001079bc:	ff ff ff 
ffff8000001079bf:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001079c3:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff8000001079ca:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001079ce:	48 c1 ea 06          	shr    $0x6,%rdx
ffff8000001079d2:	48 c1 e2 03          	shl    $0x3,%rdx
ffff8000001079d6:	48 01 d0             	add    %rdx,%rax
ffff8000001079d9:	48 89 45 90          	mov    %rax,-0x70(%rbp)
ffff8000001079dd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001079e1:	83 e0 3f             	and    $0x3f,%eax
ffff8000001079e4:	48 89 45 88          	mov    %rax,-0x78(%rbp)
ffff8000001079e8:	48 8b 45 88          	mov    -0x78(%rbp),%rax
ffff8000001079ec:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff8000001079f0:	e9 25 01 00 00       	jmpq   ffff800000107b1a <alloc_pages+0x335>
ffff8000001079f5:	48 8b 45 90          	mov    -0x70(%rbp),%rax
ffff8000001079f9:	48 8b 00             	mov    (%rax),%rax
ffff8000001079fc:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
ffff800000107a00:	89 d1                	mov    %edx,%ecx
ffff800000107a02:	48 d3 e8             	shr    %cl,%rax
ffff800000107a05:	48 89 c6             	mov    %rax,%rsi
ffff800000107a08:	48 8b 45 90          	mov    -0x70(%rbp),%rax
ffff800000107a0c:	48 83 c0 08          	add    $0x8,%rax
ffff800000107a10:	48 8b 10             	mov    (%rax),%rdx
ffff800000107a13:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000107a17:	b9 40 00 00 00       	mov    $0x40,%ecx
ffff800000107a1c:	29 c1                	sub    %eax,%ecx
ffff800000107a1e:	89 c8                	mov    %ecx,%eax
ffff800000107a20:	89 c1                	mov    %eax,%ecx
ffff800000107a22:	48 d3 e2             	shl    %cl,%rdx
ffff800000107a25:	48 89 d0             	mov    %rdx,%rax
ffff800000107a28:	48 09 c6             	or     %rax,%rsi
ffff800000107a2b:	48 89 f2             	mov    %rsi,%rdx
ffff800000107a2e:	83 bd 78 ff ff ff 40 	cmpl   $0x40,-0x88(%rbp)
ffff800000107a35:	74 19                	je     ffff800000107a50 <alloc_pages+0x26b>
ffff800000107a37:	8b 85 78 ff ff ff    	mov    -0x88(%rbp),%eax
ffff800000107a3d:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000107a42:	89 c1                	mov    %eax,%ecx
ffff800000107a44:	48 d3 e6             	shl    %cl,%rsi
ffff800000107a47:	48 89 f0             	mov    %rsi,%rax
ffff800000107a4a:	48 83 e8 01          	sub    $0x1,%rax
ffff800000107a4e:	eb 07                	jmp    ffff800000107a57 <alloc_pages+0x272>
ffff800000107a50:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffff800000107a57:	48 21 d0             	and    %rdx,%rax
ffff800000107a5a:	48 85 c0             	test   %rax,%rax
ffff800000107a5d:	0f 85 b2 00 00 00    	jne    ffff800000107b15 <alloc_pages+0x330>
ffff800000107a63:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000107a67:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000107a6b:	48 01 d0             	add    %rdx,%rax
ffff800000107a6e:	48 83 e8 01          	sub    $0x1,%rax
ffff800000107a72:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
ffff800000107a76:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
ffff800000107a7d:	00 
ffff800000107a7e:	eb 5b                	jmp    ffff800000107adb <alloc_pages+0x2f6>
ffff800000107a80:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107a87:	ff ff ff 
ffff800000107a8a:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107a8e:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff800000107a95:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
ffff800000107a99:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107a9d:	48 01 c2             	add    %rax,%rdx
ffff800000107aa0:	48 89 d0             	mov    %rdx,%rax
ffff800000107aa3:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107aa7:	48 01 d0             	add    %rdx,%rax
ffff800000107aaa:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107aae:	48 01 c8             	add    %rcx,%rax
ffff800000107ab1:	48 89 45 80          	mov    %rax,-0x80(%rbp)
ffff800000107ab5:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
ffff800000107abc:	48 8b 45 80          	mov    -0x80(%rbp),%rax
ffff800000107ac0:	48 89 d6             	mov    %rdx,%rsi
ffff800000107ac3:	48 89 c7             	mov    %rax,%rdi
ffff800000107ac6:	48 b8 d1 a9 ff ff ff 	movabs $0xffffffffffffa9d1,%rax
ffff800000107acd:	ff ff ff 
ffff800000107ad0:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000107ad4:	ff d0                	callq  *%rax
ffff800000107ad6:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
ffff800000107adb:	8b 85 78 ff ff ff    	mov    -0x88(%rbp),%eax
ffff800000107ae1:	48 98                	cltq   
ffff800000107ae3:	48 39 45 c8          	cmp    %rax,-0x38(%rbp)
ffff800000107ae7:	72 97                	jb     ffff800000107a80 <alloc_pages+0x29b>
ffff800000107ae9:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107af0:	ff ff ff 
ffff800000107af3:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107af7:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff800000107afe:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
ffff800000107b02:	48 89 d0             	mov    %rdx,%rax
ffff800000107b05:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107b09:	48 01 d0             	add    %rdx,%rax
ffff800000107b0c:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107b10:	48 01 c8             	add    %rcx,%rax
ffff800000107b13:	eb 59                	jmp    ffff800000107b6e <alloc_pages+0x389>
ffff800000107b15:	48 83 45 d0 01       	addq   $0x1,-0x30(%rbp)
ffff800000107b1a:	b8 40 00 00 00       	mov    $0x40,%eax
ffff800000107b1f:	48 2b 45 88          	sub    -0x78(%rbp),%rax
ffff800000107b23:	48 39 45 d0          	cmp    %rax,-0x30(%rbp)
ffff800000107b27:	0f 82 c8 fe ff ff    	jb     ffff8000001079f5 <alloc_pages+0x210>
ffff800000107b2d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107b31:	83 e0 3f             	and    $0x3f,%eax
ffff800000107b34:	48 85 c0             	test   %rax,%rax
ffff800000107b37:	74 06                	je     ffff800000107b3f <alloc_pages+0x35a>
ffff800000107b39:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107b3d:	eb 05                	jmp    ffff800000107b44 <alloc_pages+0x35f>
ffff800000107b3f:	b8 40 00 00 00       	mov    $0x40,%eax
ffff800000107b44:	48 01 45 d8          	add    %rax,-0x28(%rbp)
ffff800000107b48:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107b4c:	48 3b 45 a8          	cmp    -0x58(%rbp),%rax
ffff800000107b50:	0f 86 5f fe ff ff    	jbe    ffff8000001079b5 <alloc_pages+0x1d0>
ffff800000107b56:	eb 01                	jmp    ffff800000107b59 <alloc_pages+0x374>
ffff800000107b58:	90                   	nop
ffff800000107b59:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
ffff800000107b5d:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000107b60:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
ffff800000107b63:	0f 8e 88 fd ff ff    	jle    ffff8000001078f1 <alloc_pages+0x10c>
ffff800000107b69:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107b6e:	48 83 ec 80          	sub    $0xffffffffffffff80,%rsp
ffff800000107b72:	5b                   	pop    %rbx
ffff800000107b73:	41 5f                	pop    %r15
ffff800000107b75:	5d                   	pop    %rbp
ffff800000107b76:	c3                   	retq   

ffff800000107b77 <free_pages>:
ffff800000107b77:	55                   	push   %rbp
ffff800000107b78:	48 89 e5             	mov    %rsp,%rbp
ffff800000107b7b:	41 57                	push   %r15
ffff800000107b7d:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000107b81:	4c 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%r8        # ffff800000107b81 <free_pages+0xa>
ffff800000107b88:	49 bb e7 42 00 00 00 	movabs $0x42e7,%r11
ffff800000107b8f:	00 00 00 
ffff800000107b92:	4d 01 d8             	add    %r11,%r8
ffff800000107b95:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000107b99:	89 75 d4             	mov    %esi,-0x2c(%rbp)
ffff800000107b9c:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
ffff800000107ba1:	75 34                	jne    ffff800000107bd7 <free_pages+0x60>
ffff800000107ba3:	48 b8 80 18 00 00 00 	movabs $0x1880,%rax
ffff800000107baa:	00 00 00 
ffff800000107bad:	49 8d 14 00          	lea    (%r8,%rax,1),%rdx
ffff800000107bb1:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107bb6:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000107bbb:	4d 89 c7             	mov    %r8,%r15
ffff800000107bbe:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107bc3:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff800000107bca:	ff ff ff 
ffff800000107bcd:	4c 01 c1             	add    %r8,%rcx
ffff800000107bd0:	ff d1                	callq  *%rcx
ffff800000107bd2:	e9 0e 01 00 00       	jmpq   ffff800000107ce5 <free_pages+0x16e>
ffff800000107bd7:	83 7d d4 3f          	cmpl   $0x3f,-0x2c(%rbp)
ffff800000107bdb:	7f 06                	jg     ffff800000107be3 <free_pages+0x6c>
ffff800000107bdd:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
ffff800000107be1:	7f 34                	jg     ffff800000107c17 <free_pages+0xa0>
ffff800000107be3:	48 b8 a8 18 00 00 00 	movabs $0x18a8,%rax
ffff800000107bea:	00 00 00 
ffff800000107bed:	49 8d 14 00          	lea    (%r8,%rax,1),%rdx
ffff800000107bf1:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107bf6:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000107bfb:	4d 89 c7             	mov    %r8,%r15
ffff800000107bfe:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107c03:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff800000107c0a:	ff ff ff 
ffff800000107c0d:	4c 01 c1             	add    %r8,%rcx
ffff800000107c10:	ff d1                	callq  *%rcx
ffff800000107c12:	e9 ce 00 00 00       	jmpq   ffff800000107ce5 <free_pages+0x16e>
ffff800000107c17:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
ffff800000107c1e:	e9 b6 00 00 00       	jmpq   ffff800000107cd9 <free_pages+0x162>
ffff800000107c23:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107c2a:	ff ff ff 
ffff800000107c2d:	49 8b 04 00          	mov    (%r8,%rax,1),%rax
ffff800000107c31:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000107c38:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107c3c:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107c40:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000107c44:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107c48:	48 01 d0             	add    %rdx,%rax
ffff800000107c4b:	48 8b 10             	mov    (%rax),%rdx
ffff800000107c4e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107c52:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107c56:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107c5a:	83 e0 3f             	and    $0x3f,%eax
ffff800000107c5d:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000107c62:	89 c1                	mov    %eax,%ecx
ffff800000107c64:	48 d3 e6             	shl    %cl,%rsi
ffff800000107c67:	48 89 f0             	mov    %rsi,%rax
ffff800000107c6a:	48 f7 d0             	not    %rax
ffff800000107c6d:	48 89 c6             	mov    %rax,%rsi
ffff800000107c70:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107c77:	ff ff ff 
ffff800000107c7a:	49 8b 04 00          	mov    (%r8,%rax,1),%rax
ffff800000107c7e:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
ffff800000107c85:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107c89:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107c8d:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000107c91:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107c95:	48 01 c8             	add    %rcx,%rax
ffff800000107c98:	48 21 f2             	and    %rsi,%rdx
ffff800000107c9b:	48 89 10             	mov    %rdx,(%rax)
ffff800000107c9e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107ca2:	48 8b 00             	mov    (%rax),%rax
ffff800000107ca5:	48 8b 50 38          	mov    0x38(%rax),%rdx
ffff800000107ca9:	48 83 ea 01          	sub    $0x1,%rdx
ffff800000107cad:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff800000107cb1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107cb5:	48 8b 00             	mov    (%rax),%rax
ffff800000107cb8:	48 8b 50 40          	mov    0x40(%rax),%rdx
ffff800000107cbc:	48 83 c2 01          	add    $0x1,%rdx
ffff800000107cc0:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff800000107cc4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107cc8:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff800000107ccf:	00 
ffff800000107cd0:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
ffff800000107cd4:	48 83 45 d8 28       	addq   $0x28,-0x28(%rbp)
ffff800000107cd9:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000107cdc:	3b 45 d4             	cmp    -0x2c(%rbp),%eax
ffff800000107cdf:	0f 8c 3e ff ff ff    	jl     ffff800000107c23 <free_pages+0xac>
ffff800000107ce5:	48 83 c4 28          	add    $0x28,%rsp
ffff800000107ce9:	41 5f                	pop    %r15
ffff800000107ceb:	5d                   	pop    %rbp
ffff800000107cec:	c3                   	retq   

ffff800000107ced <memset>:
ffff800000107ced:	55                   	push   %rbp
ffff800000107cee:	48 89 e5             	mov    %rsp,%rbp
ffff800000107cf1:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107cf1 <memset+0x4>
ffff800000107cf8:	49 bb 77 41 00 00 00 	movabs $0x4177,%r11
ffff800000107cff:	00 00 00 
ffff800000107d02:	4c 01 d8             	add    %r11,%rax
ffff800000107d05:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000107d09:	89 f0                	mov    %esi,%eax
ffff800000107d0b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
ffff800000107d0f:	88 45 e4             	mov    %al,-0x1c(%rbp)
ffff800000107d12:	0f b6 45 e4          	movzbl -0x1c(%rbp),%eax
ffff800000107d16:	88 45 f7             	mov    %al,-0x9(%rbp)
ffff800000107d19:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107d1d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000107d21:	eb 14                	jmp    ffff800000107d37 <memset+0x4a>
ffff800000107d23:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107d27:	0f b6 55 f7          	movzbl -0x9(%rbp),%edx
ffff800000107d2b:	88 10                	mov    %dl,(%rax)
ffff800000107d2d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
ffff800000107d32:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
ffff800000107d37:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
ffff800000107d3c:	7f e5                	jg     ffff800000107d23 <memset+0x36>
ffff800000107d3e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107d42:	5d                   	pop    %rbp
ffff800000107d43:	c3                   	retq   

ffff800000107d44 <memcpy>:
ffff800000107d44:	55                   	push   %rbp
ffff800000107d45:	48 89 e5             	mov    %rsp,%rbp
ffff800000107d48:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107d48 <memcpy+0x4>
ffff800000107d4f:	49 bb 20 41 00 00 00 	movabs $0x4120,%r11
ffff800000107d56:	00 00 00 
ffff800000107d59:	4c 01 d8             	add    %r11,%rax
ffff800000107d5c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000107d60:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
ffff800000107d64:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
ffff800000107d68:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107d6c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000107d70:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107d74:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff800000107d78:	eb 1d                	jmp    ffff800000107d97 <memcpy+0x53>
ffff800000107d7a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000107d7e:	48 8d 42 01          	lea    0x1(%rdx),%rax
ffff800000107d82:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff800000107d86:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107d8a:	48 8d 48 01          	lea    0x1(%rax),%rcx
ffff800000107d8e:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
ffff800000107d92:	0f b6 12             	movzbl (%rdx),%edx
ffff800000107d95:	88 10                	mov    %dl,(%rax)
ffff800000107d97:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107d9b:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff800000107d9f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
ffff800000107da3:	48 85 c0             	test   %rax,%rax
ffff800000107da6:	75 d2                	jne    ffff800000107d7a <memcpy+0x36>
ffff800000107da8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107dac:	5d                   	pop    %rbp
ffff800000107dad:	c3                   	retq   

ffff800000107dae <Get_gdt>:
ffff800000107dae:	55                   	push   %rbp
ffff800000107daf:	48 89 e5             	mov    %rsp,%rbp
ffff800000107db2:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107db2 <Get_gdt+0x4>
ffff800000107db9:	49 bb b6 40 00 00 00 	movabs $0x40b6,%r11
ffff800000107dc0:	00 00 00 
ffff800000107dc3:	4c 01 d8             	add    %r11,%rax
ffff800000107dc6:	0f 20 d8             	mov    %cr3,%rax
ffff800000107dc9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000107dcd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107dd1:	5d                   	pop    %rbp
ffff800000107dd2:	c3                   	retq   

ffff800000107dd3 <flush_tlb>:
ffff800000107dd3:	55                   	push   %rbp
ffff800000107dd4:	48 89 e5             	mov    %rsp,%rbp
ffff800000107dd7:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107dd7 <flush_tlb+0x4>
ffff800000107dde:	49 bb 91 40 00 00 00 	movabs $0x4091,%r11
ffff800000107de5:	00 00 00 
ffff800000107de8:	4c 01 d8             	add    %r11,%rax
ffff800000107deb:	0f 20 d8             	mov    %cr3,%rax
ffff800000107dee:	0f 22 d8             	mov    %rax,%cr3
ffff800000107df1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000107df5:	90                   	nop
ffff800000107df6:	5d                   	pop    %rbp
ffff800000107df7:	c3                   	retq   

ffff800000107df8 <io_out8>:
ffff800000107df8:	55                   	push   %rbp
ffff800000107df9:	48 89 e5             	mov    %rsp,%rbp
ffff800000107dfc:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107dfc <io_out8+0x4>
ffff800000107e03:	49 bb 6c 40 00 00 00 	movabs $0x406c,%r11
ffff800000107e0a:	00 00 00 
ffff800000107e0d:	4c 01 d8             	add    %r11,%rax
ffff800000107e10:	89 fa                	mov    %edi,%edx
ffff800000107e12:	89 f0                	mov    %esi,%eax
ffff800000107e14:	66 89 55 fc          	mov    %dx,-0x4(%rbp)
ffff800000107e18:	88 45 f8             	mov    %al,-0x8(%rbp)
ffff800000107e1b:	0f b6 45 f8          	movzbl -0x8(%rbp),%eax
ffff800000107e1f:	0f b7 55 fc          	movzwl -0x4(%rbp),%edx
ffff800000107e23:	ee                   	out    %al,(%dx)
ffff800000107e24:	0f ae f0             	mfence 
ffff800000107e27:	90                   	nop
ffff800000107e28:	5d                   	pop    %rbp
ffff800000107e29:	c3                   	retq   

ffff800000107e2a <io_in8>:
ffff800000107e2a:	55                   	push   %rbp
ffff800000107e2b:	48 89 e5             	mov    %rsp,%rbp
ffff800000107e2e:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107e2e <io_in8+0x4>
ffff800000107e35:	49 bb 3a 40 00 00 00 	movabs $0x403a,%r11
ffff800000107e3c:	00 00 00 
ffff800000107e3f:	4c 01 d8             	add    %r11,%rax
ffff800000107e42:	89 f8                	mov    %edi,%eax
ffff800000107e44:	66 89 45 ec          	mov    %ax,-0x14(%rbp)
ffff800000107e48:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
ffff800000107e4c:	0f b7 45 ec          	movzwl -0x14(%rbp),%eax
ffff800000107e50:	89 c2                	mov    %eax,%edx
ffff800000107e52:	ec                   	in     (%dx),%al
ffff800000107e53:	0f ae f0             	mfence 
ffff800000107e56:	88 45 ff             	mov    %al,-0x1(%rbp)
ffff800000107e59:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
ffff800000107e5d:	5d                   	pop    %rbp
ffff800000107e5e:	c3                   	retq   

ffff800000107e5f <list_init>:
ffff800000107e5f:	55                   	push   %rbp
ffff800000107e60:	48 89 e5             	mov    %rsp,%rbp
ffff800000107e63:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107e63 <list_init+0x4>
ffff800000107e6a:	49 bb 05 40 00 00 00 	movabs $0x4005,%r11
ffff800000107e71:	00 00 00 
ffff800000107e74:	4c 01 d8             	add    %r11,%rax
ffff800000107e77:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000107e7b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107e7f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000107e83:	48 89 10             	mov    %rdx,(%rax)
ffff800000107e86:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107e8a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000107e8e:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107e92:	90                   	nop
ffff800000107e93:	5d                   	pop    %rbp
ffff800000107e94:	c3                   	retq   

ffff800000107e95 <list_add_to_behind>:
ffff800000107e95:	55                   	push   %rbp
ffff800000107e96:	48 89 e5             	mov    %rsp,%rbp
ffff800000107e99:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107e99 <list_add_to_behind+0x4>
ffff800000107ea0:	49 bb cf 3f 00 00 00 	movabs $0x3fcf,%r11
ffff800000107ea7:	00 00 00 
ffff800000107eaa:	4c 01 d8             	add    %r11,%rax
ffff800000107ead:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000107eb1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000107eb5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107eb9:	48 8b 50 08          	mov    0x8(%rax),%rdx
ffff800000107ebd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107ec1:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107ec5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107ec9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000107ecd:	48 89 10             	mov    %rdx,(%rax)
ffff800000107ed0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107ed4:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107ed8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000107edc:	48 89 10             	mov    %rdx,(%rax)
ffff800000107edf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107ee3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000107ee7:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107eeb:	90                   	nop
ffff800000107eec:	5d                   	pop    %rbp
ffff800000107eed:	c3                   	retq   

ffff800000107eee <list_add_to_before>:
ffff800000107eee:	55                   	push   %rbp
ffff800000107eef:	48 89 e5             	mov    %rsp,%rbp
ffff800000107ef2:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107ef2 <list_add_to_before+0x4>
ffff800000107ef9:	49 bb 76 3f 00 00 00 	movabs $0x3f76,%r11
ffff800000107f00:	00 00 00 
ffff800000107f03:	4c 01 d8             	add    %r11,%rax
ffff800000107f06:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000107f0a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000107f0e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107f12:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000107f16:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107f1a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107f1e:	48 8b 00             	mov    (%rax),%rax
ffff800000107f21:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000107f25:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107f29:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107f2d:	48 8b 10             	mov    (%rax),%rdx
ffff800000107f30:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107f34:	48 89 10             	mov    %rdx,(%rax)
ffff800000107f37:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107f3b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000107f3f:	48 89 10             	mov    %rdx,(%rax)
ffff800000107f42:	90                   	nop
ffff800000107f43:	5d                   	pop    %rbp
ffff800000107f44:	c3                   	retq   

ffff800000107f45 <list_del>:
ffff800000107f45:	55                   	push   %rbp
ffff800000107f46:	48 89 e5             	mov    %rsp,%rbp
ffff800000107f49:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107f49 <list_del+0x4>
ffff800000107f50:	49 bb 1f 3f 00 00 00 	movabs $0x3f1f,%r11
ffff800000107f57:	00 00 00 
ffff800000107f5a:	4c 01 d8             	add    %r11,%rax
ffff800000107f5d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000107f61:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107f65:	48 8b 00             	mov    (%rax),%rax
ffff800000107f68:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000107f6c:	48 8b 52 08          	mov    0x8(%rdx),%rdx
ffff800000107f70:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107f74:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107f78:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107f7c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000107f80:	48 8b 12             	mov    (%rdx),%rdx
ffff800000107f83:	48 89 10             	mov    %rdx,(%rax)
ffff800000107f86:	90                   	nop
ffff800000107f87:	5d                   	pop    %rbp
ffff800000107f88:	c3                   	retq   

ffff800000107f89 <list_is_empty>:
ffff800000107f89:	55                   	push   %rbp
ffff800000107f8a:	48 89 e5             	mov    %rsp,%rbp
ffff800000107f8d:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107f8d <list_is_empty+0x4>
ffff800000107f94:	49 bb db 3e 00 00 00 	movabs $0x3edb,%r11
ffff800000107f9b:	00 00 00 
ffff800000107f9e:	4c 01 d8             	add    %r11,%rax
ffff800000107fa1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000107fa5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107fa9:	48 8b 00             	mov    (%rax),%rax
ffff800000107fac:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
ffff800000107fb0:	75 15                	jne    ffff800000107fc7 <list_is_empty+0x3e>
ffff800000107fb2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107fb6:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107fba:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
ffff800000107fbe:	75 07                	jne    ffff800000107fc7 <list_is_empty+0x3e>
ffff800000107fc0:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000107fc5:	eb 05                	jmp    ffff800000107fcc <list_is_empty+0x43>
ffff800000107fc7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107fcc:	5d                   	pop    %rbp
ffff800000107fcd:	c3                   	retq   

ffff800000107fce <list_next>:
ffff800000107fce:	55                   	push   %rbp
ffff800000107fcf:	48 89 e5             	mov    %rsp,%rbp
ffff800000107fd2:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107fd2 <list_next+0x4>
ffff800000107fd9:	49 bb 96 3e 00 00 00 	movabs $0x3e96,%r11
ffff800000107fe0:	00 00 00 
ffff800000107fe3:	4c 01 d8             	add    %r11,%rax
ffff800000107fe6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000107fea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107fee:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107ff2:	48 85 c0             	test   %rax,%rax
ffff800000107ff5:	74 0a                	je     ffff800000108001 <list_next+0x33>
ffff800000107ff7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107ffb:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107fff:	eb 05                	jmp    ffff800000108006 <list_next+0x38>
ffff800000108001:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108006:	5d                   	pop    %rbp
ffff800000108007:	c3                   	retq   

ffff800000108008 <wrmsr>:
ffff800000108008:	55                   	push   %rbp
ffff800000108009:	48 89 e5             	mov    %rsp,%rbp
ffff80000010800c:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff80000010800c <wrmsr+0x4>
ffff800000108013:	49 bb 5c 3e 00 00 00 	movabs $0x3e5c,%r11
ffff80000010801a:	00 00 00 
ffff80000010801d:	4c 01 d8             	add    %r11,%rax
ffff800000108020:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108024:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000108028:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010802c:	48 c1 e8 20          	shr    $0x20,%rax
ffff800000108030:	48 89 c2             	mov    %rax,%rdx
ffff800000108033:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108037:	89 c0                	mov    %eax,%eax
ffff800000108039:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
ffff80000010803d:	0f 30                	wrmsr  
ffff80000010803f:	90                   	nop
ffff800000108040:	5d                   	pop    %rbp
ffff800000108041:	c3                   	retq   

ffff800000108042 <IRQ0x20_interrupt>:
ffff800000108042:	6a 00                	pushq  $0x0
ffff800000108044:	fc                   	cld    
ffff800000108045:	50                   	push   %rax
ffff800000108046:	50                   	push   %rax
ffff800000108047:	48 8c c0             	mov    %es,%rax
ffff80000010804a:	50                   	push   %rax
ffff80000010804b:	48 8c d8             	mov    %ds,%rax
ffff80000010804e:	50                   	push   %rax
ffff80000010804f:	48 31 c0             	xor    %rax,%rax
ffff800000108052:	55                   	push   %rbp
ffff800000108053:	57                   	push   %rdi
ffff800000108054:	56                   	push   %rsi
ffff800000108055:	52                   	push   %rdx
ffff800000108056:	51                   	push   %rcx
ffff800000108057:	53                   	push   %rbx
ffff800000108058:	41 50                	push   %r8
ffff80000010805a:	41 51                	push   %r9
ffff80000010805c:	41 52                	push   %r10
ffff80000010805e:	41 53                	push   %r11
ffff800000108060:	41 54                	push   %r12
ffff800000108062:	41 55                	push   %r13
ffff800000108064:	41 56                	push   %r14
ffff800000108066:	41 57                	push   %r15
ffff800000108068:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010806f:	48 8e da             	mov    %rdx,%ds
ffff800000108072:	48 8e c2             	mov    %rdx,%es
ffff800000108075:	48 89 e7             	mov    %rsp,%rdi
ffff800000108078:	48 8d 05 a6 bf ff ff 	lea    -0x405a(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010807f:	50                   	push   %rax
ffff800000108080:	48 c7 c6 20 00 00 00 	mov    $0x20,%rsi
ffff800000108087:	e9 64 08 00 00       	jmpq   ffff8000001088f0 <do_IRQ>

ffff80000010808c <IRQ0x21_interrupt>:
ffff80000010808c:	6a 00                	pushq  $0x0
ffff80000010808e:	fc                   	cld    
ffff80000010808f:	50                   	push   %rax
ffff800000108090:	50                   	push   %rax
ffff800000108091:	48 8c c0             	mov    %es,%rax
ffff800000108094:	50                   	push   %rax
ffff800000108095:	48 8c d8             	mov    %ds,%rax
ffff800000108098:	50                   	push   %rax
ffff800000108099:	48 31 c0             	xor    %rax,%rax
ffff80000010809c:	55                   	push   %rbp
ffff80000010809d:	57                   	push   %rdi
ffff80000010809e:	56                   	push   %rsi
ffff80000010809f:	52                   	push   %rdx
ffff8000001080a0:	51                   	push   %rcx
ffff8000001080a1:	53                   	push   %rbx
ffff8000001080a2:	41 50                	push   %r8
ffff8000001080a4:	41 51                	push   %r9
ffff8000001080a6:	41 52                	push   %r10
ffff8000001080a8:	41 53                	push   %r11
ffff8000001080aa:	41 54                	push   %r12
ffff8000001080ac:	41 55                	push   %r13
ffff8000001080ae:	41 56                	push   %r14
ffff8000001080b0:	41 57                	push   %r15
ffff8000001080b2:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001080b9:	48 8e da             	mov    %rdx,%ds
ffff8000001080bc:	48 8e c2             	mov    %rdx,%es
ffff8000001080bf:	48 89 e7             	mov    %rsp,%rdi
ffff8000001080c2:	48 8d 05 5c bf ff ff 	lea    -0x40a4(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001080c9:	50                   	push   %rax
ffff8000001080ca:	48 c7 c6 21 00 00 00 	mov    $0x21,%rsi
ffff8000001080d1:	e9 1a 08 00 00       	jmpq   ffff8000001088f0 <do_IRQ>

ffff8000001080d6 <IRQ0x22_interrupt>:
ffff8000001080d6:	6a 00                	pushq  $0x0
ffff8000001080d8:	fc                   	cld    
ffff8000001080d9:	50                   	push   %rax
ffff8000001080da:	50                   	push   %rax
ffff8000001080db:	48 8c c0             	mov    %es,%rax
ffff8000001080de:	50                   	push   %rax
ffff8000001080df:	48 8c d8             	mov    %ds,%rax
ffff8000001080e2:	50                   	push   %rax
ffff8000001080e3:	48 31 c0             	xor    %rax,%rax
ffff8000001080e6:	55                   	push   %rbp
ffff8000001080e7:	57                   	push   %rdi
ffff8000001080e8:	56                   	push   %rsi
ffff8000001080e9:	52                   	push   %rdx
ffff8000001080ea:	51                   	push   %rcx
ffff8000001080eb:	53                   	push   %rbx
ffff8000001080ec:	41 50                	push   %r8
ffff8000001080ee:	41 51                	push   %r9
ffff8000001080f0:	41 52                	push   %r10
ffff8000001080f2:	41 53                	push   %r11
ffff8000001080f4:	41 54                	push   %r12
ffff8000001080f6:	41 55                	push   %r13
ffff8000001080f8:	41 56                	push   %r14
ffff8000001080fa:	41 57                	push   %r15
ffff8000001080fc:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108103:	48 8e da             	mov    %rdx,%ds
ffff800000108106:	48 8e c2             	mov    %rdx,%es
ffff800000108109:	48 89 e7             	mov    %rsp,%rdi
ffff80000010810c:	48 8d 05 12 bf ff ff 	lea    -0x40ee(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108113:	50                   	push   %rax
ffff800000108114:	48 c7 c6 22 00 00 00 	mov    $0x22,%rsi
ffff80000010811b:	e9 d0 07 00 00       	jmpq   ffff8000001088f0 <do_IRQ>

ffff800000108120 <IRQ0x23_interrupt>:
ffff800000108120:	6a 00                	pushq  $0x0
ffff800000108122:	fc                   	cld    
ffff800000108123:	50                   	push   %rax
ffff800000108124:	50                   	push   %rax
ffff800000108125:	48 8c c0             	mov    %es,%rax
ffff800000108128:	50                   	push   %rax
ffff800000108129:	48 8c d8             	mov    %ds,%rax
ffff80000010812c:	50                   	push   %rax
ffff80000010812d:	48 31 c0             	xor    %rax,%rax
ffff800000108130:	55                   	push   %rbp
ffff800000108131:	57                   	push   %rdi
ffff800000108132:	56                   	push   %rsi
ffff800000108133:	52                   	push   %rdx
ffff800000108134:	51                   	push   %rcx
ffff800000108135:	53                   	push   %rbx
ffff800000108136:	41 50                	push   %r8
ffff800000108138:	41 51                	push   %r9
ffff80000010813a:	41 52                	push   %r10
ffff80000010813c:	41 53                	push   %r11
ffff80000010813e:	41 54                	push   %r12
ffff800000108140:	41 55                	push   %r13
ffff800000108142:	41 56                	push   %r14
ffff800000108144:	41 57                	push   %r15
ffff800000108146:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010814d:	48 8e da             	mov    %rdx,%ds
ffff800000108150:	48 8e c2             	mov    %rdx,%es
ffff800000108153:	48 89 e7             	mov    %rsp,%rdi
ffff800000108156:	48 8d 05 c8 be ff ff 	lea    -0x4138(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010815d:	50                   	push   %rax
ffff80000010815e:	48 c7 c6 23 00 00 00 	mov    $0x23,%rsi
ffff800000108165:	e9 86 07 00 00       	jmpq   ffff8000001088f0 <do_IRQ>

ffff80000010816a <IRQ0x24_interrupt>:
ffff80000010816a:	6a 00                	pushq  $0x0
ffff80000010816c:	fc                   	cld    
ffff80000010816d:	50                   	push   %rax
ffff80000010816e:	50                   	push   %rax
ffff80000010816f:	48 8c c0             	mov    %es,%rax
ffff800000108172:	50                   	push   %rax
ffff800000108173:	48 8c d8             	mov    %ds,%rax
ffff800000108176:	50                   	push   %rax
ffff800000108177:	48 31 c0             	xor    %rax,%rax
ffff80000010817a:	55                   	push   %rbp
ffff80000010817b:	57                   	push   %rdi
ffff80000010817c:	56                   	push   %rsi
ffff80000010817d:	52                   	push   %rdx
ffff80000010817e:	51                   	push   %rcx
ffff80000010817f:	53                   	push   %rbx
ffff800000108180:	41 50                	push   %r8
ffff800000108182:	41 51                	push   %r9
ffff800000108184:	41 52                	push   %r10
ffff800000108186:	41 53                	push   %r11
ffff800000108188:	41 54                	push   %r12
ffff80000010818a:	41 55                	push   %r13
ffff80000010818c:	41 56                	push   %r14
ffff80000010818e:	41 57                	push   %r15
ffff800000108190:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108197:	48 8e da             	mov    %rdx,%ds
ffff80000010819a:	48 8e c2             	mov    %rdx,%es
ffff80000010819d:	48 89 e7             	mov    %rsp,%rdi
ffff8000001081a0:	48 8d 05 7e be ff ff 	lea    -0x4182(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001081a7:	50                   	push   %rax
ffff8000001081a8:	48 c7 c6 24 00 00 00 	mov    $0x24,%rsi
ffff8000001081af:	e9 3c 07 00 00       	jmpq   ffff8000001088f0 <do_IRQ>

ffff8000001081b4 <IRQ0x25_interrupt>:
ffff8000001081b4:	6a 00                	pushq  $0x0
ffff8000001081b6:	fc                   	cld    
ffff8000001081b7:	50                   	push   %rax
ffff8000001081b8:	50                   	push   %rax
ffff8000001081b9:	48 8c c0             	mov    %es,%rax
ffff8000001081bc:	50                   	push   %rax
ffff8000001081bd:	48 8c d8             	mov    %ds,%rax
ffff8000001081c0:	50                   	push   %rax
ffff8000001081c1:	48 31 c0             	xor    %rax,%rax
ffff8000001081c4:	55                   	push   %rbp
ffff8000001081c5:	57                   	push   %rdi
ffff8000001081c6:	56                   	push   %rsi
ffff8000001081c7:	52                   	push   %rdx
ffff8000001081c8:	51                   	push   %rcx
ffff8000001081c9:	53                   	push   %rbx
ffff8000001081ca:	41 50                	push   %r8
ffff8000001081cc:	41 51                	push   %r9
ffff8000001081ce:	41 52                	push   %r10
ffff8000001081d0:	41 53                	push   %r11
ffff8000001081d2:	41 54                	push   %r12
ffff8000001081d4:	41 55                	push   %r13
ffff8000001081d6:	41 56                	push   %r14
ffff8000001081d8:	41 57                	push   %r15
ffff8000001081da:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001081e1:	48 8e da             	mov    %rdx,%ds
ffff8000001081e4:	48 8e c2             	mov    %rdx,%es
ffff8000001081e7:	48 89 e7             	mov    %rsp,%rdi
ffff8000001081ea:	48 8d 05 34 be ff ff 	lea    -0x41cc(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001081f1:	50                   	push   %rax
ffff8000001081f2:	48 c7 c6 25 00 00 00 	mov    $0x25,%rsi
ffff8000001081f9:	e9 f2 06 00 00       	jmpq   ffff8000001088f0 <do_IRQ>

ffff8000001081fe <IRQ0x26_interrupt>:
ffff8000001081fe:	6a 00                	pushq  $0x0
ffff800000108200:	fc                   	cld    
ffff800000108201:	50                   	push   %rax
ffff800000108202:	50                   	push   %rax
ffff800000108203:	48 8c c0             	mov    %es,%rax
ffff800000108206:	50                   	push   %rax
ffff800000108207:	48 8c d8             	mov    %ds,%rax
ffff80000010820a:	50                   	push   %rax
ffff80000010820b:	48 31 c0             	xor    %rax,%rax
ffff80000010820e:	55                   	push   %rbp
ffff80000010820f:	57                   	push   %rdi
ffff800000108210:	56                   	push   %rsi
ffff800000108211:	52                   	push   %rdx
ffff800000108212:	51                   	push   %rcx
ffff800000108213:	53                   	push   %rbx
ffff800000108214:	41 50                	push   %r8
ffff800000108216:	41 51                	push   %r9
ffff800000108218:	41 52                	push   %r10
ffff80000010821a:	41 53                	push   %r11
ffff80000010821c:	41 54                	push   %r12
ffff80000010821e:	41 55                	push   %r13
ffff800000108220:	41 56                	push   %r14
ffff800000108222:	41 57                	push   %r15
ffff800000108224:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010822b:	48 8e da             	mov    %rdx,%ds
ffff80000010822e:	48 8e c2             	mov    %rdx,%es
ffff800000108231:	48 89 e7             	mov    %rsp,%rdi
ffff800000108234:	48 8d 05 ea bd ff ff 	lea    -0x4216(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010823b:	50                   	push   %rax
ffff80000010823c:	48 c7 c6 26 00 00 00 	mov    $0x26,%rsi
ffff800000108243:	e9 a8 06 00 00       	jmpq   ffff8000001088f0 <do_IRQ>

ffff800000108248 <IRQ0x27_interrupt>:
ffff800000108248:	6a 00                	pushq  $0x0
ffff80000010824a:	fc                   	cld    
ffff80000010824b:	50                   	push   %rax
ffff80000010824c:	50                   	push   %rax
ffff80000010824d:	48 8c c0             	mov    %es,%rax
ffff800000108250:	50                   	push   %rax
ffff800000108251:	48 8c d8             	mov    %ds,%rax
ffff800000108254:	50                   	push   %rax
ffff800000108255:	48 31 c0             	xor    %rax,%rax
ffff800000108258:	55                   	push   %rbp
ffff800000108259:	57                   	push   %rdi
ffff80000010825a:	56                   	push   %rsi
ffff80000010825b:	52                   	push   %rdx
ffff80000010825c:	51                   	push   %rcx
ffff80000010825d:	53                   	push   %rbx
ffff80000010825e:	41 50                	push   %r8
ffff800000108260:	41 51                	push   %r9
ffff800000108262:	41 52                	push   %r10
ffff800000108264:	41 53                	push   %r11
ffff800000108266:	41 54                	push   %r12
ffff800000108268:	41 55                	push   %r13
ffff80000010826a:	41 56                	push   %r14
ffff80000010826c:	41 57                	push   %r15
ffff80000010826e:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108275:	48 8e da             	mov    %rdx,%ds
ffff800000108278:	48 8e c2             	mov    %rdx,%es
ffff80000010827b:	48 89 e7             	mov    %rsp,%rdi
ffff80000010827e:	48 8d 05 a0 bd ff ff 	lea    -0x4260(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108285:	50                   	push   %rax
ffff800000108286:	48 c7 c6 27 00 00 00 	mov    $0x27,%rsi
ffff80000010828d:	e9 5e 06 00 00       	jmpq   ffff8000001088f0 <do_IRQ>

ffff800000108292 <IRQ0x28_interrupt>:
ffff800000108292:	6a 00                	pushq  $0x0
ffff800000108294:	fc                   	cld    
ffff800000108295:	50                   	push   %rax
ffff800000108296:	50                   	push   %rax
ffff800000108297:	48 8c c0             	mov    %es,%rax
ffff80000010829a:	50                   	push   %rax
ffff80000010829b:	48 8c d8             	mov    %ds,%rax
ffff80000010829e:	50                   	push   %rax
ffff80000010829f:	48 31 c0             	xor    %rax,%rax
ffff8000001082a2:	55                   	push   %rbp
ffff8000001082a3:	57                   	push   %rdi
ffff8000001082a4:	56                   	push   %rsi
ffff8000001082a5:	52                   	push   %rdx
ffff8000001082a6:	51                   	push   %rcx
ffff8000001082a7:	53                   	push   %rbx
ffff8000001082a8:	41 50                	push   %r8
ffff8000001082aa:	41 51                	push   %r9
ffff8000001082ac:	41 52                	push   %r10
ffff8000001082ae:	41 53                	push   %r11
ffff8000001082b0:	41 54                	push   %r12
ffff8000001082b2:	41 55                	push   %r13
ffff8000001082b4:	41 56                	push   %r14
ffff8000001082b6:	41 57                	push   %r15
ffff8000001082b8:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001082bf:	48 8e da             	mov    %rdx,%ds
ffff8000001082c2:	48 8e c2             	mov    %rdx,%es
ffff8000001082c5:	48 89 e7             	mov    %rsp,%rdi
ffff8000001082c8:	48 8d 05 56 bd ff ff 	lea    -0x42aa(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001082cf:	50                   	push   %rax
ffff8000001082d0:	48 c7 c6 28 00 00 00 	mov    $0x28,%rsi
ffff8000001082d7:	e9 14 06 00 00       	jmpq   ffff8000001088f0 <do_IRQ>

ffff8000001082dc <IRQ0x29_interrupt>:
ffff8000001082dc:	6a 00                	pushq  $0x0
ffff8000001082de:	fc                   	cld    
ffff8000001082df:	50                   	push   %rax
ffff8000001082e0:	50                   	push   %rax
ffff8000001082e1:	48 8c c0             	mov    %es,%rax
ffff8000001082e4:	50                   	push   %rax
ffff8000001082e5:	48 8c d8             	mov    %ds,%rax
ffff8000001082e8:	50                   	push   %rax
ffff8000001082e9:	48 31 c0             	xor    %rax,%rax
ffff8000001082ec:	55                   	push   %rbp
ffff8000001082ed:	57                   	push   %rdi
ffff8000001082ee:	56                   	push   %rsi
ffff8000001082ef:	52                   	push   %rdx
ffff8000001082f0:	51                   	push   %rcx
ffff8000001082f1:	53                   	push   %rbx
ffff8000001082f2:	41 50                	push   %r8
ffff8000001082f4:	41 51                	push   %r9
ffff8000001082f6:	41 52                	push   %r10
ffff8000001082f8:	41 53                	push   %r11
ffff8000001082fa:	41 54                	push   %r12
ffff8000001082fc:	41 55                	push   %r13
ffff8000001082fe:	41 56                	push   %r14
ffff800000108300:	41 57                	push   %r15
ffff800000108302:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108309:	48 8e da             	mov    %rdx,%ds
ffff80000010830c:	48 8e c2             	mov    %rdx,%es
ffff80000010830f:	48 89 e7             	mov    %rsp,%rdi
ffff800000108312:	48 8d 05 0c bd ff ff 	lea    -0x42f4(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108319:	50                   	push   %rax
ffff80000010831a:	48 c7 c6 29 00 00 00 	mov    $0x29,%rsi
ffff800000108321:	e9 ca 05 00 00       	jmpq   ffff8000001088f0 <do_IRQ>

ffff800000108326 <IRQ0x2a_interrupt>:
ffff800000108326:	6a 00                	pushq  $0x0
ffff800000108328:	fc                   	cld    
ffff800000108329:	50                   	push   %rax
ffff80000010832a:	50                   	push   %rax
ffff80000010832b:	48 8c c0             	mov    %es,%rax
ffff80000010832e:	50                   	push   %rax
ffff80000010832f:	48 8c d8             	mov    %ds,%rax
ffff800000108332:	50                   	push   %rax
ffff800000108333:	48 31 c0             	xor    %rax,%rax
ffff800000108336:	55                   	push   %rbp
ffff800000108337:	57                   	push   %rdi
ffff800000108338:	56                   	push   %rsi
ffff800000108339:	52                   	push   %rdx
ffff80000010833a:	51                   	push   %rcx
ffff80000010833b:	53                   	push   %rbx
ffff80000010833c:	41 50                	push   %r8
ffff80000010833e:	41 51                	push   %r9
ffff800000108340:	41 52                	push   %r10
ffff800000108342:	41 53                	push   %r11
ffff800000108344:	41 54                	push   %r12
ffff800000108346:	41 55                	push   %r13
ffff800000108348:	41 56                	push   %r14
ffff80000010834a:	41 57                	push   %r15
ffff80000010834c:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108353:	48 8e da             	mov    %rdx,%ds
ffff800000108356:	48 8e c2             	mov    %rdx,%es
ffff800000108359:	48 89 e7             	mov    %rsp,%rdi
ffff80000010835c:	48 8d 05 c2 bc ff ff 	lea    -0x433e(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108363:	50                   	push   %rax
ffff800000108364:	48 c7 c6 2a 00 00 00 	mov    $0x2a,%rsi
ffff80000010836b:	e9 80 05 00 00       	jmpq   ffff8000001088f0 <do_IRQ>

ffff800000108370 <IRQ0x2b_interrupt>:
ffff800000108370:	6a 00                	pushq  $0x0
ffff800000108372:	fc                   	cld    
ffff800000108373:	50                   	push   %rax
ffff800000108374:	50                   	push   %rax
ffff800000108375:	48 8c c0             	mov    %es,%rax
ffff800000108378:	50                   	push   %rax
ffff800000108379:	48 8c d8             	mov    %ds,%rax
ffff80000010837c:	50                   	push   %rax
ffff80000010837d:	48 31 c0             	xor    %rax,%rax
ffff800000108380:	55                   	push   %rbp
ffff800000108381:	57                   	push   %rdi
ffff800000108382:	56                   	push   %rsi
ffff800000108383:	52                   	push   %rdx
ffff800000108384:	51                   	push   %rcx
ffff800000108385:	53                   	push   %rbx
ffff800000108386:	41 50                	push   %r8
ffff800000108388:	41 51                	push   %r9
ffff80000010838a:	41 52                	push   %r10
ffff80000010838c:	41 53                	push   %r11
ffff80000010838e:	41 54                	push   %r12
ffff800000108390:	41 55                	push   %r13
ffff800000108392:	41 56                	push   %r14
ffff800000108394:	41 57                	push   %r15
ffff800000108396:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010839d:	48 8e da             	mov    %rdx,%ds
ffff8000001083a0:	48 8e c2             	mov    %rdx,%es
ffff8000001083a3:	48 89 e7             	mov    %rsp,%rdi
ffff8000001083a6:	48 8d 05 78 bc ff ff 	lea    -0x4388(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001083ad:	50                   	push   %rax
ffff8000001083ae:	48 c7 c6 2b 00 00 00 	mov    $0x2b,%rsi
ffff8000001083b5:	e9 36 05 00 00       	jmpq   ffff8000001088f0 <do_IRQ>

ffff8000001083ba <IRQ0x2c_interrupt>:
ffff8000001083ba:	6a 00                	pushq  $0x0
ffff8000001083bc:	fc                   	cld    
ffff8000001083bd:	50                   	push   %rax
ffff8000001083be:	50                   	push   %rax
ffff8000001083bf:	48 8c c0             	mov    %es,%rax
ffff8000001083c2:	50                   	push   %rax
ffff8000001083c3:	48 8c d8             	mov    %ds,%rax
ffff8000001083c6:	50                   	push   %rax
ffff8000001083c7:	48 31 c0             	xor    %rax,%rax
ffff8000001083ca:	55                   	push   %rbp
ffff8000001083cb:	57                   	push   %rdi
ffff8000001083cc:	56                   	push   %rsi
ffff8000001083cd:	52                   	push   %rdx
ffff8000001083ce:	51                   	push   %rcx
ffff8000001083cf:	53                   	push   %rbx
ffff8000001083d0:	41 50                	push   %r8
ffff8000001083d2:	41 51                	push   %r9
ffff8000001083d4:	41 52                	push   %r10
ffff8000001083d6:	41 53                	push   %r11
ffff8000001083d8:	41 54                	push   %r12
ffff8000001083da:	41 55                	push   %r13
ffff8000001083dc:	41 56                	push   %r14
ffff8000001083de:	41 57                	push   %r15
ffff8000001083e0:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001083e7:	48 8e da             	mov    %rdx,%ds
ffff8000001083ea:	48 8e c2             	mov    %rdx,%es
ffff8000001083ed:	48 89 e7             	mov    %rsp,%rdi
ffff8000001083f0:	48 8d 05 2e bc ff ff 	lea    -0x43d2(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001083f7:	50                   	push   %rax
ffff8000001083f8:	48 c7 c6 2c 00 00 00 	mov    $0x2c,%rsi
ffff8000001083ff:	e9 ec 04 00 00       	jmpq   ffff8000001088f0 <do_IRQ>

ffff800000108404 <IRQ0x2d_interrupt>:
ffff800000108404:	6a 00                	pushq  $0x0
ffff800000108406:	fc                   	cld    
ffff800000108407:	50                   	push   %rax
ffff800000108408:	50                   	push   %rax
ffff800000108409:	48 8c c0             	mov    %es,%rax
ffff80000010840c:	50                   	push   %rax
ffff80000010840d:	48 8c d8             	mov    %ds,%rax
ffff800000108410:	50                   	push   %rax
ffff800000108411:	48 31 c0             	xor    %rax,%rax
ffff800000108414:	55                   	push   %rbp
ffff800000108415:	57                   	push   %rdi
ffff800000108416:	56                   	push   %rsi
ffff800000108417:	52                   	push   %rdx
ffff800000108418:	51                   	push   %rcx
ffff800000108419:	53                   	push   %rbx
ffff80000010841a:	41 50                	push   %r8
ffff80000010841c:	41 51                	push   %r9
ffff80000010841e:	41 52                	push   %r10
ffff800000108420:	41 53                	push   %r11
ffff800000108422:	41 54                	push   %r12
ffff800000108424:	41 55                	push   %r13
ffff800000108426:	41 56                	push   %r14
ffff800000108428:	41 57                	push   %r15
ffff80000010842a:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108431:	48 8e da             	mov    %rdx,%ds
ffff800000108434:	48 8e c2             	mov    %rdx,%es
ffff800000108437:	48 89 e7             	mov    %rsp,%rdi
ffff80000010843a:	48 8d 05 e4 bb ff ff 	lea    -0x441c(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108441:	50                   	push   %rax
ffff800000108442:	48 c7 c6 2d 00 00 00 	mov    $0x2d,%rsi
ffff800000108449:	e9 a2 04 00 00       	jmpq   ffff8000001088f0 <do_IRQ>

ffff80000010844e <IRQ0x2e_interrupt>:
ffff80000010844e:	6a 00                	pushq  $0x0
ffff800000108450:	fc                   	cld    
ffff800000108451:	50                   	push   %rax
ffff800000108452:	50                   	push   %rax
ffff800000108453:	48 8c c0             	mov    %es,%rax
ffff800000108456:	50                   	push   %rax
ffff800000108457:	48 8c d8             	mov    %ds,%rax
ffff80000010845a:	50                   	push   %rax
ffff80000010845b:	48 31 c0             	xor    %rax,%rax
ffff80000010845e:	55                   	push   %rbp
ffff80000010845f:	57                   	push   %rdi
ffff800000108460:	56                   	push   %rsi
ffff800000108461:	52                   	push   %rdx
ffff800000108462:	51                   	push   %rcx
ffff800000108463:	53                   	push   %rbx
ffff800000108464:	41 50                	push   %r8
ffff800000108466:	41 51                	push   %r9
ffff800000108468:	41 52                	push   %r10
ffff80000010846a:	41 53                	push   %r11
ffff80000010846c:	41 54                	push   %r12
ffff80000010846e:	41 55                	push   %r13
ffff800000108470:	41 56                	push   %r14
ffff800000108472:	41 57                	push   %r15
ffff800000108474:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010847b:	48 8e da             	mov    %rdx,%ds
ffff80000010847e:	48 8e c2             	mov    %rdx,%es
ffff800000108481:	48 89 e7             	mov    %rsp,%rdi
ffff800000108484:	48 8d 05 9a bb ff ff 	lea    -0x4466(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010848b:	50                   	push   %rax
ffff80000010848c:	48 c7 c6 2e 00 00 00 	mov    $0x2e,%rsi
ffff800000108493:	e9 58 04 00 00       	jmpq   ffff8000001088f0 <do_IRQ>

ffff800000108498 <IRQ0x2f_interrupt>:
ffff800000108498:	6a 00                	pushq  $0x0
ffff80000010849a:	fc                   	cld    
ffff80000010849b:	50                   	push   %rax
ffff80000010849c:	50                   	push   %rax
ffff80000010849d:	48 8c c0             	mov    %es,%rax
ffff8000001084a0:	50                   	push   %rax
ffff8000001084a1:	48 8c d8             	mov    %ds,%rax
ffff8000001084a4:	50                   	push   %rax
ffff8000001084a5:	48 31 c0             	xor    %rax,%rax
ffff8000001084a8:	55                   	push   %rbp
ffff8000001084a9:	57                   	push   %rdi
ffff8000001084aa:	56                   	push   %rsi
ffff8000001084ab:	52                   	push   %rdx
ffff8000001084ac:	51                   	push   %rcx
ffff8000001084ad:	53                   	push   %rbx
ffff8000001084ae:	41 50                	push   %r8
ffff8000001084b0:	41 51                	push   %r9
ffff8000001084b2:	41 52                	push   %r10
ffff8000001084b4:	41 53                	push   %r11
ffff8000001084b6:	41 54                	push   %r12
ffff8000001084b8:	41 55                	push   %r13
ffff8000001084ba:	41 56                	push   %r14
ffff8000001084bc:	41 57                	push   %r15
ffff8000001084be:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001084c5:	48 8e da             	mov    %rdx,%ds
ffff8000001084c8:	48 8e c2             	mov    %rdx,%es
ffff8000001084cb:	48 89 e7             	mov    %rsp,%rdi
ffff8000001084ce:	48 8d 05 50 bb ff ff 	lea    -0x44b0(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001084d5:	50                   	push   %rax
ffff8000001084d6:	48 c7 c6 2f 00 00 00 	mov    $0x2f,%rsi
ffff8000001084dd:	e9 0e 04 00 00       	jmpq   ffff8000001088f0 <do_IRQ>

ffff8000001084e2 <IRQ0x30_interrupt>:
ffff8000001084e2:	6a 00                	pushq  $0x0
ffff8000001084e4:	fc                   	cld    
ffff8000001084e5:	50                   	push   %rax
ffff8000001084e6:	50                   	push   %rax
ffff8000001084e7:	48 8c c0             	mov    %es,%rax
ffff8000001084ea:	50                   	push   %rax
ffff8000001084eb:	48 8c d8             	mov    %ds,%rax
ffff8000001084ee:	50                   	push   %rax
ffff8000001084ef:	48 31 c0             	xor    %rax,%rax
ffff8000001084f2:	55                   	push   %rbp
ffff8000001084f3:	57                   	push   %rdi
ffff8000001084f4:	56                   	push   %rsi
ffff8000001084f5:	52                   	push   %rdx
ffff8000001084f6:	51                   	push   %rcx
ffff8000001084f7:	53                   	push   %rbx
ffff8000001084f8:	41 50                	push   %r8
ffff8000001084fa:	41 51                	push   %r9
ffff8000001084fc:	41 52                	push   %r10
ffff8000001084fe:	41 53                	push   %r11
ffff800000108500:	41 54                	push   %r12
ffff800000108502:	41 55                	push   %r13
ffff800000108504:	41 56                	push   %r14
ffff800000108506:	41 57                	push   %r15
ffff800000108508:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010850f:	48 8e da             	mov    %rdx,%ds
ffff800000108512:	48 8e c2             	mov    %rdx,%es
ffff800000108515:	48 89 e7             	mov    %rsp,%rdi
ffff800000108518:	48 8d 05 06 bb ff ff 	lea    -0x44fa(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010851f:	50                   	push   %rax
ffff800000108520:	48 c7 c6 30 00 00 00 	mov    $0x30,%rsi
ffff800000108527:	e9 c4 03 00 00       	jmpq   ffff8000001088f0 <do_IRQ>

ffff80000010852c <IRQ0x31_interrupt>:
ffff80000010852c:	6a 00                	pushq  $0x0
ffff80000010852e:	fc                   	cld    
ffff80000010852f:	50                   	push   %rax
ffff800000108530:	50                   	push   %rax
ffff800000108531:	48 8c c0             	mov    %es,%rax
ffff800000108534:	50                   	push   %rax
ffff800000108535:	48 8c d8             	mov    %ds,%rax
ffff800000108538:	50                   	push   %rax
ffff800000108539:	48 31 c0             	xor    %rax,%rax
ffff80000010853c:	55                   	push   %rbp
ffff80000010853d:	57                   	push   %rdi
ffff80000010853e:	56                   	push   %rsi
ffff80000010853f:	52                   	push   %rdx
ffff800000108540:	51                   	push   %rcx
ffff800000108541:	53                   	push   %rbx
ffff800000108542:	41 50                	push   %r8
ffff800000108544:	41 51                	push   %r9
ffff800000108546:	41 52                	push   %r10
ffff800000108548:	41 53                	push   %r11
ffff80000010854a:	41 54                	push   %r12
ffff80000010854c:	41 55                	push   %r13
ffff80000010854e:	41 56                	push   %r14
ffff800000108550:	41 57                	push   %r15
ffff800000108552:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108559:	48 8e da             	mov    %rdx,%ds
ffff80000010855c:	48 8e c2             	mov    %rdx,%es
ffff80000010855f:	48 89 e7             	mov    %rsp,%rdi
ffff800000108562:	48 8d 05 bc ba ff ff 	lea    -0x4544(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108569:	50                   	push   %rax
ffff80000010856a:	48 c7 c6 31 00 00 00 	mov    $0x31,%rsi
ffff800000108571:	e9 7a 03 00 00       	jmpq   ffff8000001088f0 <do_IRQ>

ffff800000108576 <IRQ0x32_interrupt>:
ffff800000108576:	6a 00                	pushq  $0x0
ffff800000108578:	fc                   	cld    
ffff800000108579:	50                   	push   %rax
ffff80000010857a:	50                   	push   %rax
ffff80000010857b:	48 8c c0             	mov    %es,%rax
ffff80000010857e:	50                   	push   %rax
ffff80000010857f:	48 8c d8             	mov    %ds,%rax
ffff800000108582:	50                   	push   %rax
ffff800000108583:	48 31 c0             	xor    %rax,%rax
ffff800000108586:	55                   	push   %rbp
ffff800000108587:	57                   	push   %rdi
ffff800000108588:	56                   	push   %rsi
ffff800000108589:	52                   	push   %rdx
ffff80000010858a:	51                   	push   %rcx
ffff80000010858b:	53                   	push   %rbx
ffff80000010858c:	41 50                	push   %r8
ffff80000010858e:	41 51                	push   %r9
ffff800000108590:	41 52                	push   %r10
ffff800000108592:	41 53                	push   %r11
ffff800000108594:	41 54                	push   %r12
ffff800000108596:	41 55                	push   %r13
ffff800000108598:	41 56                	push   %r14
ffff80000010859a:	41 57                	push   %r15
ffff80000010859c:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001085a3:	48 8e da             	mov    %rdx,%ds
ffff8000001085a6:	48 8e c2             	mov    %rdx,%es
ffff8000001085a9:	48 89 e7             	mov    %rsp,%rdi
ffff8000001085ac:	48 8d 05 72 ba ff ff 	lea    -0x458e(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001085b3:	50                   	push   %rax
ffff8000001085b4:	48 c7 c6 32 00 00 00 	mov    $0x32,%rsi
ffff8000001085bb:	e9 30 03 00 00       	jmpq   ffff8000001088f0 <do_IRQ>

ffff8000001085c0 <IRQ0x33_interrupt>:
ffff8000001085c0:	6a 00                	pushq  $0x0
ffff8000001085c2:	fc                   	cld    
ffff8000001085c3:	50                   	push   %rax
ffff8000001085c4:	50                   	push   %rax
ffff8000001085c5:	48 8c c0             	mov    %es,%rax
ffff8000001085c8:	50                   	push   %rax
ffff8000001085c9:	48 8c d8             	mov    %ds,%rax
ffff8000001085cc:	50                   	push   %rax
ffff8000001085cd:	48 31 c0             	xor    %rax,%rax
ffff8000001085d0:	55                   	push   %rbp
ffff8000001085d1:	57                   	push   %rdi
ffff8000001085d2:	56                   	push   %rsi
ffff8000001085d3:	52                   	push   %rdx
ffff8000001085d4:	51                   	push   %rcx
ffff8000001085d5:	53                   	push   %rbx
ffff8000001085d6:	41 50                	push   %r8
ffff8000001085d8:	41 51                	push   %r9
ffff8000001085da:	41 52                	push   %r10
ffff8000001085dc:	41 53                	push   %r11
ffff8000001085de:	41 54                	push   %r12
ffff8000001085e0:	41 55                	push   %r13
ffff8000001085e2:	41 56                	push   %r14
ffff8000001085e4:	41 57                	push   %r15
ffff8000001085e6:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001085ed:	48 8e da             	mov    %rdx,%ds
ffff8000001085f0:	48 8e c2             	mov    %rdx,%es
ffff8000001085f3:	48 89 e7             	mov    %rsp,%rdi
ffff8000001085f6:	48 8d 05 28 ba ff ff 	lea    -0x45d8(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001085fd:	50                   	push   %rax
ffff8000001085fe:	48 c7 c6 33 00 00 00 	mov    $0x33,%rsi
ffff800000108605:	e9 e6 02 00 00       	jmpq   ffff8000001088f0 <do_IRQ>

ffff80000010860a <IRQ0x34_interrupt>:
ffff80000010860a:	6a 00                	pushq  $0x0
ffff80000010860c:	fc                   	cld    
ffff80000010860d:	50                   	push   %rax
ffff80000010860e:	50                   	push   %rax
ffff80000010860f:	48 8c c0             	mov    %es,%rax
ffff800000108612:	50                   	push   %rax
ffff800000108613:	48 8c d8             	mov    %ds,%rax
ffff800000108616:	50                   	push   %rax
ffff800000108617:	48 31 c0             	xor    %rax,%rax
ffff80000010861a:	55                   	push   %rbp
ffff80000010861b:	57                   	push   %rdi
ffff80000010861c:	56                   	push   %rsi
ffff80000010861d:	52                   	push   %rdx
ffff80000010861e:	51                   	push   %rcx
ffff80000010861f:	53                   	push   %rbx
ffff800000108620:	41 50                	push   %r8
ffff800000108622:	41 51                	push   %r9
ffff800000108624:	41 52                	push   %r10
ffff800000108626:	41 53                	push   %r11
ffff800000108628:	41 54                	push   %r12
ffff80000010862a:	41 55                	push   %r13
ffff80000010862c:	41 56                	push   %r14
ffff80000010862e:	41 57                	push   %r15
ffff800000108630:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108637:	48 8e da             	mov    %rdx,%ds
ffff80000010863a:	48 8e c2             	mov    %rdx,%es
ffff80000010863d:	48 89 e7             	mov    %rsp,%rdi
ffff800000108640:	48 8d 05 de b9 ff ff 	lea    -0x4622(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108647:	50                   	push   %rax
ffff800000108648:	48 c7 c6 34 00 00 00 	mov    $0x34,%rsi
ffff80000010864f:	e9 9c 02 00 00       	jmpq   ffff8000001088f0 <do_IRQ>

ffff800000108654 <IRQ0x35_interrupt>:
ffff800000108654:	6a 00                	pushq  $0x0
ffff800000108656:	fc                   	cld    
ffff800000108657:	50                   	push   %rax
ffff800000108658:	50                   	push   %rax
ffff800000108659:	48 8c c0             	mov    %es,%rax
ffff80000010865c:	50                   	push   %rax
ffff80000010865d:	48 8c d8             	mov    %ds,%rax
ffff800000108660:	50                   	push   %rax
ffff800000108661:	48 31 c0             	xor    %rax,%rax
ffff800000108664:	55                   	push   %rbp
ffff800000108665:	57                   	push   %rdi
ffff800000108666:	56                   	push   %rsi
ffff800000108667:	52                   	push   %rdx
ffff800000108668:	51                   	push   %rcx
ffff800000108669:	53                   	push   %rbx
ffff80000010866a:	41 50                	push   %r8
ffff80000010866c:	41 51                	push   %r9
ffff80000010866e:	41 52                	push   %r10
ffff800000108670:	41 53                	push   %r11
ffff800000108672:	41 54                	push   %r12
ffff800000108674:	41 55                	push   %r13
ffff800000108676:	41 56                	push   %r14
ffff800000108678:	41 57                	push   %r15
ffff80000010867a:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108681:	48 8e da             	mov    %rdx,%ds
ffff800000108684:	48 8e c2             	mov    %rdx,%es
ffff800000108687:	48 89 e7             	mov    %rsp,%rdi
ffff80000010868a:	48 8d 05 94 b9 ff ff 	lea    -0x466c(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108691:	50                   	push   %rax
ffff800000108692:	48 c7 c6 35 00 00 00 	mov    $0x35,%rsi
ffff800000108699:	e9 52 02 00 00       	jmpq   ffff8000001088f0 <do_IRQ>

ffff80000010869e <IRQ0x36_interrupt>:
ffff80000010869e:	6a 00                	pushq  $0x0
ffff8000001086a0:	fc                   	cld    
ffff8000001086a1:	50                   	push   %rax
ffff8000001086a2:	50                   	push   %rax
ffff8000001086a3:	48 8c c0             	mov    %es,%rax
ffff8000001086a6:	50                   	push   %rax
ffff8000001086a7:	48 8c d8             	mov    %ds,%rax
ffff8000001086aa:	50                   	push   %rax
ffff8000001086ab:	48 31 c0             	xor    %rax,%rax
ffff8000001086ae:	55                   	push   %rbp
ffff8000001086af:	57                   	push   %rdi
ffff8000001086b0:	56                   	push   %rsi
ffff8000001086b1:	52                   	push   %rdx
ffff8000001086b2:	51                   	push   %rcx
ffff8000001086b3:	53                   	push   %rbx
ffff8000001086b4:	41 50                	push   %r8
ffff8000001086b6:	41 51                	push   %r9
ffff8000001086b8:	41 52                	push   %r10
ffff8000001086ba:	41 53                	push   %r11
ffff8000001086bc:	41 54                	push   %r12
ffff8000001086be:	41 55                	push   %r13
ffff8000001086c0:	41 56                	push   %r14
ffff8000001086c2:	41 57                	push   %r15
ffff8000001086c4:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001086cb:	48 8e da             	mov    %rdx,%ds
ffff8000001086ce:	48 8e c2             	mov    %rdx,%es
ffff8000001086d1:	48 89 e7             	mov    %rsp,%rdi
ffff8000001086d4:	48 8d 05 4a b9 ff ff 	lea    -0x46b6(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001086db:	50                   	push   %rax
ffff8000001086dc:	48 c7 c6 36 00 00 00 	mov    $0x36,%rsi
ffff8000001086e3:	e9 08 02 00 00       	jmpq   ffff8000001088f0 <do_IRQ>

ffff8000001086e8 <IRQ0x37_interrupt>:
ffff8000001086e8:	6a 00                	pushq  $0x0
ffff8000001086ea:	fc                   	cld    
ffff8000001086eb:	50                   	push   %rax
ffff8000001086ec:	50                   	push   %rax
ffff8000001086ed:	48 8c c0             	mov    %es,%rax
ffff8000001086f0:	50                   	push   %rax
ffff8000001086f1:	48 8c d8             	mov    %ds,%rax
ffff8000001086f4:	50                   	push   %rax
ffff8000001086f5:	48 31 c0             	xor    %rax,%rax
ffff8000001086f8:	55                   	push   %rbp
ffff8000001086f9:	57                   	push   %rdi
ffff8000001086fa:	56                   	push   %rsi
ffff8000001086fb:	52                   	push   %rdx
ffff8000001086fc:	51                   	push   %rcx
ffff8000001086fd:	53                   	push   %rbx
ffff8000001086fe:	41 50                	push   %r8
ffff800000108700:	41 51                	push   %r9
ffff800000108702:	41 52                	push   %r10
ffff800000108704:	41 53                	push   %r11
ffff800000108706:	41 54                	push   %r12
ffff800000108708:	41 55                	push   %r13
ffff80000010870a:	41 56                	push   %r14
ffff80000010870c:	41 57                	push   %r15
ffff80000010870e:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108715:	48 8e da             	mov    %rdx,%ds
ffff800000108718:	48 8e c2             	mov    %rdx,%es
ffff80000010871b:	48 89 e7             	mov    %rsp,%rdi
ffff80000010871e:	48 8d 05 00 b9 ff ff 	lea    -0x4700(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108725:	50                   	push   %rax
ffff800000108726:	48 c7 c6 37 00 00 00 	mov    $0x37,%rsi
ffff80000010872d:	e9 be 01 00 00       	jmpq   ffff8000001088f0 <do_IRQ>

ffff800000108732 <init_interrupt>:
ffff800000108732:	55                   	push   %rbp
ffff800000108733:	48 89 e5             	mov    %rsp,%rbp
ffff800000108736:	41 57                	push   %r15
ffff800000108738:	53                   	push   %rbx
ffff800000108739:	48 83 ec 10          	sub    $0x10,%rsp
ffff80000010873d:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff80000010873d <init_interrupt+0xb>
ffff800000108744:	49 bb 2b 37 00 00 00 	movabs $0x372b,%r11
ffff80000010874b:	00 00 00 
ffff80000010874e:	4c 01 db             	add    %r11,%rbx
ffff800000108751:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%rbp)
ffff800000108758:	eb 3e                	jmp    ffff800000108798 <init_interrupt+0x66>
ffff80000010875a:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff80000010875d:	83 e8 20             	sub    $0x20,%eax
ffff800000108760:	48 ba 98 0f 00 00 00 	movabs $0xf98,%rdx
ffff800000108767:	00 00 00 
ffff80000010876a:	48 98                	cltq   
ffff80000010876c:	48 01 da             	add    %rbx,%rdx
ffff80000010876f:	48 8b 14 c2          	mov    (%rdx,%rax,8),%rdx
ffff800000108773:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000108776:	be 02 00 00 00       	mov    $0x2,%esi
ffff80000010877b:	89 c7                	mov    %eax,%edi
ffff80000010877d:	49 89 df             	mov    %rbx,%r15
ffff800000108780:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108785:	48 b9 b9 84 ff ff ff 	movabs $0xffffffffffff84b9,%rcx
ffff80000010878c:	ff ff ff 
ffff80000010878f:	48 01 d9             	add    %rbx,%rcx
ffff800000108792:	ff d1                	callq  *%rcx
ffff800000108794:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
ffff800000108798:	83 7d ec 37          	cmpl   $0x37,-0x14(%rbp)
ffff80000010879c:	7e bc                	jle    ffff80000010875a <init_interrupt+0x28>
ffff80000010879e:	48 b8 cf 18 00 00 00 	movabs $0x18cf,%rax
ffff8000001087a5:	00 00 00 
ffff8000001087a8:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001087ac:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001087b1:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001087b6:	49 89 df             	mov    %rbx,%r15
ffff8000001087b9:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001087be:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff8000001087c5:	ff ff ff 
ffff8000001087c8:	48 01 d9             	add    %rbx,%rcx
ffff8000001087cb:	ff d1                	callq  *%rcx
ffff8000001087cd:	be 11 00 00 00       	mov    $0x11,%esi
ffff8000001087d2:	bf 20 00 00 00       	mov    $0x20,%edi
ffff8000001087d7:	49 89 df             	mov    %rbx,%r15
ffff8000001087da:	48 b8 90 bf ff ff ff 	movabs $0xffffffffffffbf90,%rax
ffff8000001087e1:	ff ff ff 
ffff8000001087e4:	48 01 d8             	add    %rbx,%rax
ffff8000001087e7:	ff d0                	callq  *%rax
ffff8000001087e9:	be 20 00 00 00       	mov    $0x20,%esi
ffff8000001087ee:	bf 21 00 00 00       	mov    $0x21,%edi
ffff8000001087f3:	49 89 df             	mov    %rbx,%r15
ffff8000001087f6:	48 b8 90 bf ff ff ff 	movabs $0xffffffffffffbf90,%rax
ffff8000001087fd:	ff ff ff 
ffff800000108800:	48 01 d8             	add    %rbx,%rax
ffff800000108803:	ff d0                	callq  *%rax
ffff800000108805:	be 04 00 00 00       	mov    $0x4,%esi
ffff80000010880a:	bf 21 00 00 00       	mov    $0x21,%edi
ffff80000010880f:	49 89 df             	mov    %rbx,%r15
ffff800000108812:	48 b8 90 bf ff ff ff 	movabs $0xffffffffffffbf90,%rax
ffff800000108819:	ff ff ff 
ffff80000010881c:	48 01 d8             	add    %rbx,%rax
ffff80000010881f:	ff d0                	callq  *%rax
ffff800000108821:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000108826:	bf 21 00 00 00       	mov    $0x21,%edi
ffff80000010882b:	49 89 df             	mov    %rbx,%r15
ffff80000010882e:	48 b8 90 bf ff ff ff 	movabs $0xffffffffffffbf90,%rax
ffff800000108835:	ff ff ff 
ffff800000108838:	48 01 d8             	add    %rbx,%rax
ffff80000010883b:	ff d0                	callq  *%rax
ffff80000010883d:	be 11 00 00 00       	mov    $0x11,%esi
ffff800000108842:	bf a0 00 00 00       	mov    $0xa0,%edi
ffff800000108847:	49 89 df             	mov    %rbx,%r15
ffff80000010884a:	48 b8 90 bf ff ff ff 	movabs $0xffffffffffffbf90,%rax
ffff800000108851:	ff ff ff 
ffff800000108854:	48 01 d8             	add    %rbx,%rax
ffff800000108857:	ff d0                	callq  *%rax
ffff800000108859:	be 28 00 00 00       	mov    $0x28,%esi
ffff80000010885e:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff800000108863:	49 89 df             	mov    %rbx,%r15
ffff800000108866:	48 b8 90 bf ff ff ff 	movabs $0xffffffffffffbf90,%rax
ffff80000010886d:	ff ff ff 
ffff800000108870:	48 01 d8             	add    %rbx,%rax
ffff800000108873:	ff d0                	callq  *%rax
ffff800000108875:	be 02 00 00 00       	mov    $0x2,%esi
ffff80000010887a:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff80000010887f:	49 89 df             	mov    %rbx,%r15
ffff800000108882:	48 b8 90 bf ff ff ff 	movabs $0xffffffffffffbf90,%rax
ffff800000108889:	ff ff ff 
ffff80000010888c:	48 01 d8             	add    %rbx,%rax
ffff80000010888f:	ff d0                	callq  *%rax
ffff800000108891:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000108896:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff80000010889b:	49 89 df             	mov    %rbx,%r15
ffff80000010889e:	48 b8 90 bf ff ff ff 	movabs $0xffffffffffffbf90,%rax
ffff8000001088a5:	ff ff ff 
ffff8000001088a8:	48 01 d8             	add    %rbx,%rax
ffff8000001088ab:	ff d0                	callq  *%rax
ffff8000001088ad:	be fd 00 00 00       	mov    $0xfd,%esi
ffff8000001088b2:	bf 21 00 00 00       	mov    $0x21,%edi
ffff8000001088b7:	49 89 df             	mov    %rbx,%r15
ffff8000001088ba:	48 b8 90 bf ff ff ff 	movabs $0xffffffffffffbf90,%rax
ffff8000001088c1:	ff ff ff 
ffff8000001088c4:	48 01 d8             	add    %rbx,%rax
ffff8000001088c7:	ff d0                	callq  *%rax
ffff8000001088c9:	be ff 00 00 00       	mov    $0xff,%esi
ffff8000001088ce:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff8000001088d3:	49 89 df             	mov    %rbx,%r15
ffff8000001088d6:	48 b8 90 bf ff ff ff 	movabs $0xffffffffffffbf90,%rax
ffff8000001088dd:	ff ff ff 
ffff8000001088e0:	48 01 d8             	add    %rbx,%rax
ffff8000001088e3:	ff d0                	callq  *%rax
ffff8000001088e5:	fb                   	sti    
ffff8000001088e6:	90                   	nop
ffff8000001088e7:	48 83 c4 10          	add    $0x10,%rsp
ffff8000001088eb:	5b                   	pop    %rbx
ffff8000001088ec:	41 5f                	pop    %r15
ffff8000001088ee:	5d                   	pop    %rbp
ffff8000001088ef:	c3                   	retq   

ffff8000001088f0 <do_IRQ>:
ffff8000001088f0:	55                   	push   %rbp
ffff8000001088f1:	48 89 e5             	mov    %rsp,%rbp
ffff8000001088f4:	41 57                	push   %r15
ffff8000001088f6:	53                   	push   %rbx
ffff8000001088f7:	48 83 ec 20          	sub    $0x20,%rsp
ffff8000001088fb:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff8000001088fb <do_IRQ+0xb>
ffff800000108902:	49 bb 6d 35 00 00 00 	movabs $0x356d,%r11
ffff800000108909:	00 00 00 
ffff80000010890c:	4c 01 db             	add    %r11,%rbx
ffff80000010890f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000108913:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000108917:	bf 60 00 00 00       	mov    $0x60,%edi
ffff80000010891c:	49 89 df             	mov    %rbx,%r15
ffff80000010891f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108924:	48 ba c2 bf ff ff ff 	movabs $0xffffffffffffbfc2,%rdx
ffff80000010892b:	ff ff ff 
ffff80000010892e:	48 01 da             	add    %rbx,%rdx
ffff800000108931:	ff d2                	callq  *%rdx
ffff800000108933:	88 45 ef             	mov    %al,-0x11(%rbp)
ffff800000108936:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
ffff80000010893a:	89 c1                	mov    %eax,%ecx
ffff80000010893c:	48 b8 dc 18 00 00 00 	movabs $0x18dc,%rax
ffff800000108943:	00 00 00 
ffff800000108946:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010894a:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010894f:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108954:	49 89 df             	mov    %rbx,%r15
ffff800000108957:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010895c:	49 b8 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r8
ffff800000108963:	ff ff ff 
ffff800000108966:	49 01 d8             	add    %rbx,%r8
ffff800000108969:	41 ff d0             	callq  *%r8
ffff80000010896c:	be 20 00 00 00       	mov    $0x20,%esi
ffff800000108971:	bf 20 00 00 00       	mov    $0x20,%edi
ffff800000108976:	49 89 df             	mov    %rbx,%r15
ffff800000108979:	48 b8 90 bf ff ff ff 	movabs $0xffffffffffffbf90,%rax
ffff800000108980:	ff ff ff 
ffff800000108983:	48 01 d8             	add    %rbx,%rax
ffff800000108986:	ff d0                	callq  *%rax
ffff800000108988:	90                   	nop
ffff800000108989:	48 83 c4 20          	add    $0x20,%rsp
ffff80000010898d:	5b                   	pop    %rbx
ffff80000010898e:	41 5f                	pop    %r15
ffff800000108990:	5d                   	pop    %rbp
ffff800000108991:	c3                   	retq   
ffff800000108992:	55                   	push   %rbp
ffff800000108993:	48 89 e5             	mov    %rsp,%rbp
ffff800000108996:	53                   	push   %rbx
ffff800000108997:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108997 <do_IRQ+0xa7>
ffff80000010899e:	49 bb d1 34 00 00 00 	movabs $0x34d1,%r11
ffff8000001089a5:	00 00 00 
ffff8000001089a8:	4c 01 d8             	add    %r11,%rax
ffff8000001089ab:	89 7d f4             	mov    %edi,-0xc(%rbp)
ffff8000001089ae:	89 75 f0             	mov    %esi,-0x10(%rbp)
ffff8000001089b1:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff8000001089b5:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
ffff8000001089b9:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
ffff8000001089bd:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
ffff8000001089c1:	8b 45 f4             	mov    -0xc(%rbp),%eax
ffff8000001089c4:	8b 55 f0             	mov    -0x10(%rbp),%edx
ffff8000001089c7:	89 d1                	mov    %edx,%ecx
ffff8000001089c9:	0f a2                	cpuid  
ffff8000001089cb:	89 de                	mov    %ebx,%esi
ffff8000001089cd:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
ffff8000001089d1:	89 07                	mov    %eax,(%rdi)
ffff8000001089d3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001089d7:	89 30                	mov    %esi,(%rax)
ffff8000001089d9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001089dd:	89 08                	mov    %ecx,(%rax)
ffff8000001089df:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001089e3:	89 10                	mov    %edx,(%rax)
ffff8000001089e5:	90                   	nop
ffff8000001089e6:	5b                   	pop    %rbx
ffff8000001089e7:	5d                   	pop    %rbp
ffff8000001089e8:	c3                   	retq   
ffff8000001089e9:	55                   	push   %rbp
ffff8000001089ea:	48 89 e5             	mov    %rsp,%rbp
ffff8000001089ed:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff8000001089ed <do_IRQ+0xfd>
ffff8000001089f4:	49 bb 7b 34 00 00 00 	movabs $0x347b,%r11
ffff8000001089fb:	00 00 00 
ffff8000001089fe:	4c 01 d8             	add    %r11,%rax
ffff800000108a01:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
ffff800000108a08:	00 
ffff800000108a09:	48 c7 c0 00 80 ff ff 	mov    $0xffffffffffff8000,%rax
ffff800000108a10:	48 21 e0             	and    %rsp,%rax
ffff800000108a13:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108a17:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108a1b:	5d                   	pop    %rbp
ffff800000108a1c:	c3                   	retq   
ffff800000108a1d:	55                   	push   %rbp
ffff800000108a1e:	48 89 e5             	mov    %rsp,%rbp
ffff800000108a21:	41 57                	push   %r15
ffff800000108a23:	48 83 ec 18          	sub    $0x18,%rsp
ffff800000108a27:	4c 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%r8        # ffff800000108a27 <do_IRQ+0x137>
ffff800000108a2e:	49 bb 41 34 00 00 00 	movabs $0x3441,%r11
ffff800000108a35:	00 00 00 
ffff800000108a38:	4d 01 d8             	add    %r11,%r8
ffff800000108a3b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000108a3f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108a43:	48 8b 80 80 00 00 00 	mov    0x80(%rax),%rax
ffff800000108a4a:	48 89 c1             	mov    %rax,%rcx
ffff800000108a4d:	48 b8 e8 18 00 00 00 	movabs $0x18e8,%rax
ffff800000108a54:	00 00 00 
ffff800000108a57:	49 8d 14 00          	lea    (%r8,%rax,1),%rdx
ffff800000108a5b:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108a60:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108a65:	4d 89 c7             	mov    %r8,%r15
ffff800000108a68:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108a6d:	49 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r9
ffff800000108a74:	ff ff ff 
ffff800000108a77:	4d 01 c1             	add    %r8,%r9
ffff800000108a7a:	41 ff d1             	callq  *%r9
ffff800000108a7d:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffff800000108a84:	48 83 c4 18          	add    $0x18,%rsp
ffff800000108a88:	41 5f                	pop    %r15
ffff800000108a8a:	5d                   	pop    %rbp
ffff800000108a8b:	c3                   	retq   
ffff800000108a8c:	55                   	push   %rbp
ffff800000108a8d:	48 89 e5             	mov    %rsp,%rbp
ffff800000108a90:	41 57                	push   %r15
ffff800000108a92:	48 83 ec 18          	sub    $0x18,%rsp
ffff800000108a96:	48 8d 0d f9 ff ff ff 	lea    -0x7(%rip),%rcx        # ffff800000108a96 <do_IRQ+0x1a6>
ffff800000108a9d:	49 bb d2 33 00 00 00 	movabs $0x33d2,%r11
ffff800000108aa4:	00 00 00 
ffff800000108aa7:	4c 01 d9             	add    %r11,%rcx
ffff800000108aaa:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000108aae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108ab2:	48 8b 40 60          	mov    0x60(%rax),%rax
ffff800000108ab6:	48 89 c2             	mov    %rax,%rdx
ffff800000108ab9:	be ff ff ff 00       	mov    $0xffffff,%esi
ffff800000108abe:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000108ac3:	49 89 cf             	mov    %rcx,%r15
ffff800000108ac6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108acb:	49 b8 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r8
ffff800000108ad2:	ff ff ff 
ffff800000108ad5:	49 01 c8             	add    %rcx,%r8
ffff800000108ad8:	41 ff d0             	callq  *%r8
ffff800000108adb:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000108ae0:	48 83 c4 18          	add    $0x18,%rsp
ffff800000108ae4:	41 5f                	pop    %r15
ffff800000108ae6:	5d                   	pop    %rbp
ffff800000108ae7:	c3                   	retq   
ffff800000108ae8:	55                   	push   %rbp
ffff800000108ae9:	48 89 e5             	mov    %rsp,%rbp
ffff800000108aec:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108aec <do_IRQ+0x1fc>
ffff800000108af3:	49 bb 7c 33 00 00 00 	movabs $0x337c,%r11
ffff800000108afa:	00 00 00 
ffff800000108afd:	4c 01 d8             	add    %r11,%rax
ffff800000108b00:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
ffff800000108b04:	89 f9                	mov    %edi,%ecx
ffff800000108b06:	88 4d ec             	mov    %cl,-0x14(%rbp)
ffff800000108b09:	89 f1                	mov    %esi,%ecx
ffff800000108b0b:	88 4d e8             	mov    %cl,-0x18(%rbp)
ffff800000108b0e:	88 55 e4             	mov    %dl,-0x1c(%rbp)
ffff800000108b11:	0f b6 55 ec          	movzbl -0x14(%rbp),%edx
ffff800000108b15:	48 63 d2             	movslq %edx,%rdx
ffff800000108b18:	48 89 d1             	mov    %rdx,%rcx
ffff800000108b1b:	48 c1 e1 04          	shl    $0x4,%rcx
ffff800000108b1f:	48 ba 10 ff ff ff ff 	movabs $0xffffffffffffff10,%rdx
ffff800000108b26:	ff ff ff 
ffff800000108b29:	48 8b 04 10          	mov    (%rax,%rdx,1),%rax
ffff800000108b2d:	48 01 c8             	add    %rcx,%rax
ffff800000108b30:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108b34:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108b38:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff800000108b3c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108b40:	89 c2                	mov    %eax,%edx
ffff800000108b42:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108b46:	66 89 10             	mov    %dx,(%rax)
ffff800000108b49:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108b4d:	66 c7 40 02 08 00    	movw   $0x8,0x2(%rax)
ffff800000108b53:	0f b6 45 e4          	movzbl -0x1c(%rbp),%eax
ffff800000108b57:	c1 e0 08             	shl    $0x8,%eax
ffff800000108b5a:	89 c2                	mov    %eax,%edx
ffff800000108b5c:	0f b6 45 e8          	movzbl -0x18(%rbp),%eax
ffff800000108b60:	09 d0                	or     %edx,%eax
ffff800000108b62:	89 c2                	mov    %eax,%edx
ffff800000108b64:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108b68:	66 89 50 04          	mov    %dx,0x4(%rax)
ffff800000108b6c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108b70:	48 c1 e8 10          	shr    $0x10,%rax
ffff800000108b74:	89 c2                	mov    %eax,%edx
ffff800000108b76:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108b7a:	66 89 50 06          	mov    %dx,0x6(%rax)
ffff800000108b7e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108b82:	48 c1 e8 20          	shr    $0x20,%rax
ffff800000108b86:	89 c2                	mov    %eax,%edx
ffff800000108b88:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108b8c:	89 50 08             	mov    %edx,0x8(%rax)
ffff800000108b8f:	90                   	nop
ffff800000108b90:	5d                   	pop    %rbp
ffff800000108b91:	c3                   	retq   
ffff800000108b92:	55                   	push   %rbp
ffff800000108b93:	48 89 e5             	mov    %rsp,%rbp
ffff800000108b96:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108b9a:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108b9a <do_IRQ+0x2aa>
ffff800000108ba1:	49 bb ce 32 00 00 00 	movabs $0x32ce,%r11
ffff800000108ba8:	00 00 00 
ffff800000108bab:	4c 01 d8             	add    %r11,%rax
ffff800000108bae:	89 f1                	mov    %esi,%ecx
ffff800000108bb0:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff800000108bb4:	89 fa                	mov    %edi,%edx
ffff800000108bb6:	88 55 fc             	mov    %dl,-0x4(%rbp)
ffff800000108bb9:	89 ca                	mov    %ecx,%edx
ffff800000108bbb:	88 55 f8             	mov    %dl,-0x8(%rbp)
ffff800000108bbe:	0f b6 75 f8          	movzbl -0x8(%rbp),%esi
ffff800000108bc2:	0f b6 7d fc          	movzbl -0x4(%rbp),%edi
ffff800000108bc6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000108bca:	48 89 d1             	mov    %rdx,%rcx
ffff800000108bcd:	ba 8e 00 00 00       	mov    $0x8e,%edx
ffff800000108bd2:	49 b8 0f 84 ff ff ff 	movabs $0xffffffffffff840f,%r8
ffff800000108bd9:	ff ff ff 
ffff800000108bdc:	4a 8d 04 00          	lea    (%rax,%r8,1),%rax
ffff800000108be0:	ff d0                	callq  *%rax
ffff800000108be2:	90                   	nop
ffff800000108be3:	c9                   	leaveq 
ffff800000108be4:	c3                   	retq   
ffff800000108be5:	55                   	push   %rbp
ffff800000108be6:	48 89 e5             	mov    %rsp,%rbp
ffff800000108be9:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108bed:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108bed <do_IRQ+0x2fd>
ffff800000108bf4:	49 bb 7b 32 00 00 00 	movabs $0x327b,%r11
ffff800000108bfb:	00 00 00 
ffff800000108bfe:	4c 01 d8             	add    %r11,%rax
ffff800000108c01:	89 f1                	mov    %esi,%ecx
ffff800000108c03:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff800000108c07:	89 fa                	mov    %edi,%edx
ffff800000108c09:	88 55 fc             	mov    %dl,-0x4(%rbp)
ffff800000108c0c:	89 ca                	mov    %ecx,%edx
ffff800000108c0e:	88 55 f8             	mov    %dl,-0x8(%rbp)
ffff800000108c11:	0f b6 75 f8          	movzbl -0x8(%rbp),%esi
ffff800000108c15:	0f b6 7d fc          	movzbl -0x4(%rbp),%edi
ffff800000108c19:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000108c1d:	48 89 d1             	mov    %rdx,%rcx
ffff800000108c20:	ba 8f 00 00 00       	mov    $0x8f,%edx
ffff800000108c25:	49 b8 0f 84 ff ff ff 	movabs $0xffffffffffff840f,%r8
ffff800000108c2c:	ff ff ff 
ffff800000108c2f:	4a 8d 04 00          	lea    (%rax,%r8,1),%rax
ffff800000108c33:	ff d0                	callq  *%rax
ffff800000108c35:	90                   	nop
ffff800000108c36:	c9                   	leaveq 
ffff800000108c37:	c3                   	retq   
ffff800000108c38:	55                   	push   %rbp
ffff800000108c39:	48 89 e5             	mov    %rsp,%rbp
ffff800000108c3c:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108c40:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108c40 <do_IRQ+0x350>
ffff800000108c47:	49 bb 28 32 00 00 00 	movabs $0x3228,%r11
ffff800000108c4e:	00 00 00 
ffff800000108c51:	4c 01 d8             	add    %r11,%rax
ffff800000108c54:	89 f1                	mov    %esi,%ecx
ffff800000108c56:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff800000108c5a:	89 fa                	mov    %edi,%edx
ffff800000108c5c:	88 55 fc             	mov    %dl,-0x4(%rbp)
ffff800000108c5f:	89 ca                	mov    %ecx,%edx
ffff800000108c61:	88 55 f8             	mov    %dl,-0x8(%rbp)
ffff800000108c64:	0f b6 75 f8          	movzbl -0x8(%rbp),%esi
ffff800000108c68:	0f b6 7d fc          	movzbl -0x4(%rbp),%edi
ffff800000108c6c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000108c70:	48 89 d1             	mov    %rdx,%rcx
ffff800000108c73:	ba ef 00 00 00       	mov    $0xef,%edx
ffff800000108c78:	49 b8 0f 84 ff ff ff 	movabs $0xffffffffffff840f,%r8
ffff800000108c7f:	ff ff ff 
ffff800000108c82:	4a 8d 04 00          	lea    (%rax,%r8,1),%rax
ffff800000108c86:	ff d0                	callq  *%rax
ffff800000108c88:	90                   	nop
ffff800000108c89:	c9                   	leaveq 
ffff800000108c8a:	c3                   	retq   
ffff800000108c8b:	55                   	push   %rbp
ffff800000108c8c:	48 89 e5             	mov    %rsp,%rbp
ffff800000108c8f:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108c93:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108c93 <do_IRQ+0x3a3>
ffff800000108c9a:	49 bb d5 31 00 00 00 	movabs $0x31d5,%r11
ffff800000108ca1:	00 00 00 
ffff800000108ca4:	4c 01 d8             	add    %r11,%rax
ffff800000108ca7:	89 f1                	mov    %esi,%ecx
ffff800000108ca9:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff800000108cad:	89 fa                	mov    %edi,%edx
ffff800000108caf:	88 55 fc             	mov    %dl,-0x4(%rbp)
ffff800000108cb2:	89 ca                	mov    %ecx,%edx
ffff800000108cb4:	88 55 f8             	mov    %dl,-0x8(%rbp)
ffff800000108cb7:	0f b6 75 f8          	movzbl -0x8(%rbp),%esi
ffff800000108cbb:	0f b6 7d fc          	movzbl -0x4(%rbp),%edi
ffff800000108cbf:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000108cc3:	48 89 d1             	mov    %rdx,%rcx
ffff800000108cc6:	ba ee 00 00 00       	mov    $0xee,%edx
ffff800000108ccb:	49 b8 0f 84 ff ff ff 	movabs $0xffffffffffff840f,%r8
ffff800000108cd2:	ff ff ff 
ffff800000108cd5:	4a 8d 04 00          	lea    (%rax,%r8,1),%rax
ffff800000108cd9:	ff d0                	callq  *%rax
ffff800000108cdb:	90                   	nop
ffff800000108cdc:	c9                   	leaveq 
ffff800000108cdd:	c3                   	retq   
ffff800000108cde:	55                   	push   %rbp
ffff800000108cdf:	48 89 e5             	mov    %rsp,%rbp
ffff800000108ce2:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108ce2 <do_IRQ+0x3f2>
ffff800000108ce9:	49 bb 86 31 00 00 00 	movabs $0x3186,%r11
ffff800000108cf0:	00 00 00 
ffff800000108cf3:	4c 01 d8             	add    %r11,%rax
ffff800000108cf6:	89 7d fc             	mov    %edi,-0x4(%rbp)
ffff800000108cf9:	89 75 f8             	mov    %esi,-0x8(%rbp)
ffff800000108cfc:	89 55 f4             	mov    %edx,-0xc(%rbp)
ffff800000108cff:	89 4d f0             	mov    %ecx,-0x10(%rbp)
ffff800000108d02:	44 89 45 ec          	mov    %r8d,-0x14(%rbp)
ffff800000108d06:	44 89 4d e8          	mov    %r9d,-0x18(%rbp)
ffff800000108d0a:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108d11:	ff ff ff 
ffff800000108d14:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108d18:	48 8d 52 04          	lea    0x4(%rdx),%rdx
ffff800000108d1c:	8b 4d fc             	mov    -0x4(%rbp),%ecx
ffff800000108d1f:	89 0a                	mov    %ecx,(%rdx)
ffff800000108d21:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108d28:	ff ff ff 
ffff800000108d2b:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108d2f:	48 8d 52 0c          	lea    0xc(%rdx),%rdx
ffff800000108d33:	8b 4d f8             	mov    -0x8(%rbp),%ecx
ffff800000108d36:	89 0a                	mov    %ecx,(%rdx)
ffff800000108d38:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108d3f:	ff ff ff 
ffff800000108d42:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108d46:	48 8d 52 14          	lea    0x14(%rdx),%rdx
ffff800000108d4a:	8b 4d f4             	mov    -0xc(%rbp),%ecx
ffff800000108d4d:	89 0a                	mov    %ecx,(%rdx)
ffff800000108d4f:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108d56:	ff ff ff 
ffff800000108d59:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108d5d:	48 8d 52 24          	lea    0x24(%rdx),%rdx
ffff800000108d61:	8b 4d f0             	mov    -0x10(%rbp),%ecx
ffff800000108d64:	89 0a                	mov    %ecx,(%rdx)
ffff800000108d66:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108d6d:	ff ff ff 
ffff800000108d70:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108d74:	48 8d 52 2c          	lea    0x2c(%rdx),%rdx
ffff800000108d78:	8b 4d ec             	mov    -0x14(%rbp),%ecx
ffff800000108d7b:	89 0a                	mov    %ecx,(%rdx)
ffff800000108d7d:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108d84:	ff ff ff 
ffff800000108d87:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108d8b:	48 8d 52 34          	lea    0x34(%rdx),%rdx
ffff800000108d8f:	8b 4d e8             	mov    -0x18(%rbp),%ecx
ffff800000108d92:	89 0a                	mov    %ecx,(%rdx)
ffff800000108d94:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108d9b:	ff ff ff 
ffff800000108d9e:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108da2:	48 8d 52 3c          	lea    0x3c(%rdx),%rdx
ffff800000108da6:	8b 4d 10             	mov    0x10(%rbp),%ecx
ffff800000108da9:	89 0a                	mov    %ecx,(%rdx)
ffff800000108dab:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108db2:	ff ff ff 
ffff800000108db5:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108db9:	48 8d 52 44          	lea    0x44(%rdx),%rdx
ffff800000108dbd:	8b 4d 18             	mov    0x18(%rbp),%ecx
ffff800000108dc0:	89 0a                	mov    %ecx,(%rdx)
ffff800000108dc2:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108dc9:	ff ff ff 
ffff800000108dcc:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108dd0:	48 8d 52 4c          	lea    0x4c(%rdx),%rdx
ffff800000108dd4:	8b 4d 20             	mov    0x20(%rbp),%ecx
ffff800000108dd7:	89 0a                	mov    %ecx,(%rdx)
ffff800000108dd9:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108de0:	ff ff ff 
ffff800000108de3:	48 8b 04 10          	mov    (%rax,%rdx,1),%rax
ffff800000108de7:	48 8d 40 54          	lea    0x54(%rax),%rax
ffff800000108deb:	8b 55 28             	mov    0x28(%rbp),%edx
ffff800000108dee:	89 10                	mov    %edx,(%rax)
ffff800000108df0:	90                   	nop
ffff800000108df1:	5d                   	pop    %rbp
ffff800000108df2:	c3                   	retq   

ffff800000108df3 <user_level_function>:
ffff800000108df3:	55                   	push   %rbp
ffff800000108df4:	48 89 e5             	mov    %rsp,%rbp
ffff800000108df7:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108df7 <user_level_function+0x4>
ffff800000108dfe:	49 bb 71 30 00 00 00 	movabs $0x3071,%r11
ffff800000108e05:	00 00 00 
ffff800000108e08:	4c 01 d8             	add    %r11,%rax
ffff800000108e0b:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
ffff800000108e12:	00 
ffff800000108e13:	48 b8 48 65 6c 6c 6f 	movabs $0x6f57206f6c6c6548,%rax
ffff800000108e1a:	20 57 6f 
ffff800000108e1d:	48 89 45 ea          	mov    %rax,-0x16(%rbp)
ffff800000108e21:	c7 45 f2 72 6c 64 21 	movl   $0x21646c72,-0xe(%rbp)
ffff800000108e28:	66 c7 45 f6 0a 00    	movw   $0xa,-0xa(%rbp)
ffff800000108e2e:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000108e33:	48 8d 55 ea          	lea    -0x16(%rbp),%rdx
ffff800000108e37:	48 89 d7             	mov    %rdx,%rdi
ffff800000108e3a:	48 8d 15 05 00 00 00 	lea    0x5(%rip),%rdx        # ffff800000108e46 <sysexit_return_address>
ffff800000108e41:	48 89 e1             	mov    %rsp,%rcx
ffff800000108e44:	0f 34                	sysenter 

ffff800000108e46 <sysexit_return_address>:
ffff800000108e46:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108e4a:	eb fe                	jmp    ffff800000108e4a <sysexit_return_address+0x4>

ffff800000108e4c <system_call_function>:
ffff800000108e4c:	55                   	push   %rbp
ffff800000108e4d:	48 89 e5             	mov    %rsp,%rbp
ffff800000108e50:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108e54:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108e54 <system_call_function+0x8>
ffff800000108e5b:	49 bb 14 30 00 00 00 	movabs $0x3014,%r11
ffff800000108e62:	00 00 00 
ffff800000108e65:	4c 01 d8             	add    %r11,%rax
ffff800000108e68:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108e6c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000108e70:	48 8b 92 80 00 00 00 	mov    0x80(%rdx),%rdx
ffff800000108e77:	48 b9 d8 03 00 00 00 	movabs $0x3d8,%rcx
ffff800000108e7e:	00 00 00 
ffff800000108e81:	48 01 c8             	add    %rcx,%rax
ffff800000108e84:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
ffff800000108e88:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000108e8c:	48 89 d7             	mov    %rdx,%rdi
ffff800000108e8f:	ff d0                	callq  *%rax
ffff800000108e91:	c9                   	leaveq 
ffff800000108e92:	c3                   	retq   

ffff800000108e93 <do_execve>:
ffff800000108e93:	55                   	push   %rbp
ffff800000108e94:	48 89 e5             	mov    %rsp,%rbp
ffff800000108e97:	41 57                	push   %r15
ffff800000108e99:	53                   	push   %rbx
ffff800000108e9a:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108e9e:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000108e9e <do_execve+0xb>
ffff800000108ea5:	49 bb ca 2f 00 00 00 	movabs $0x2fca,%r11
ffff800000108eac:	00 00 00 
ffff800000108eaf:	4c 01 db             	add    %r11,%rbx
ffff800000108eb2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000108eb6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108eba:	48 c7 40 50 00 00 80 	movq   $0x800000,0x50(%rax)
ffff800000108ec1:	00 
ffff800000108ec2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108ec6:	48 c7 40 48 00 00 a0 	movq   $0xa00000,0x48(%rax)
ffff800000108ecd:	00 
ffff800000108ece:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108ed2:	48 c7 80 80 00 00 00 	movq   $0x0,0x80(%rax)
ffff800000108ed9:	00 00 00 00 
ffff800000108edd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108ee1:	48 c7 40 70 00 00 00 	movq   $0x0,0x70(%rax)
ffff800000108ee8:	00 
ffff800000108ee9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108eed:	48 c7 40 78 00 00 00 	movq   $0x0,0x78(%rax)
ffff800000108ef4:	00 
ffff800000108ef5:	48 b8 09 19 00 00 00 	movabs $0x1909,%rax
ffff800000108efc:	00 00 00 
ffff800000108eff:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000108f03:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108f08:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108f0d:	49 89 df             	mov    %rbx,%r15
ffff800000108f10:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108f15:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff800000108f1c:	ff ff ff 
ffff800000108f1f:	48 01 d9             	add    %rbx,%rcx
ffff800000108f22:	ff d1                	callq  *%rcx
ffff800000108f24:	ba 00 04 00 00       	mov    $0x400,%edx
ffff800000108f29:	be 00 00 80 00       	mov    $0x800000,%esi
ffff800000108f2e:	48 b8 8b cf ff ff ff 	movabs $0xffffffffffffcf8b,%rax
ffff800000108f35:	ff ff ff 
ffff800000108f38:	48 8d 3c 03          	lea    (%rbx,%rax,1),%rdi
ffff800000108f3c:	49 89 df             	mov    %rbx,%r15
ffff800000108f3f:	48 b8 dc be ff ff ff 	movabs $0xffffffffffffbedc,%rax
ffff800000108f46:	ff ff ff 
ffff800000108f49:	48 01 d8             	add    %rbx,%rax
ffff800000108f4c:	ff d0                	callq  *%rax
ffff800000108f4e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108f53:	48 83 c4 10          	add    $0x10,%rsp
ffff800000108f57:	5b                   	pop    %rbx
ffff800000108f58:	41 5f                	pop    %r15
ffff800000108f5a:	5d                   	pop    %rbp
ffff800000108f5b:	c3                   	retq   

ffff800000108f5c <kernel_thread_func>:
ffff800000108f5c:	55                   	push   %rbp
ffff800000108f5d:	48 89 e5             	mov    %rsp,%rbp
ffff800000108f60:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108f60 <kernel_thread_func+0x4>
ffff800000108f67:	49 bb 08 2f 00 00 00 	movabs $0x2f08,%r11
ffff800000108f6e:	00 00 00 
ffff800000108f71:	4c 01 d8             	add    %r11,%rax
ffff800000108f74:	41 5f                	pop    %r15
ffff800000108f76:	41 5e                	pop    %r14
ffff800000108f78:	41 5d                	pop    %r13
ffff800000108f7a:	41 5c                	pop    %r12
ffff800000108f7c:	41 5b                	pop    %r11
ffff800000108f7e:	41 5a                	pop    %r10
ffff800000108f80:	41 59                	pop    %r9
ffff800000108f82:	41 58                	pop    %r8
ffff800000108f84:	5b                   	pop    %rbx
ffff800000108f85:	59                   	pop    %rcx
ffff800000108f86:	5a                   	pop    %rdx
ffff800000108f87:	5e                   	pop    %rsi
ffff800000108f88:	5f                   	pop    %rdi
ffff800000108f89:	5d                   	pop    %rbp
ffff800000108f8a:	58                   	pop    %rax
ffff800000108f8b:	48 8e d8             	mov    %rax,%ds
ffff800000108f8e:	58                   	pop    %rax
ffff800000108f8f:	48 8e c0             	mov    %rax,%es
ffff800000108f92:	58                   	pop    %rax
ffff800000108f93:	48 83 c4 38          	add    $0x38,%rsp
ffff800000108f97:	48 89 cf             	mov    %rcx,%rdi
ffff800000108f9a:	ff d1                	callq  *%rcx
ffff800000108f9c:	48 89 c7             	mov    %rax,%rdi
ffff800000108f9f:	e8 02 0a 00 00       	callq  ffff8000001099a6 <do_exit>
ffff800000108fa4:	90                   	nop
ffff800000108fa5:	5d                   	pop    %rbp
ffff800000108fa6:	c3                   	retq   

ffff800000108fa7 <init>:
ffff800000108fa7:	55                   	push   %rbp
ffff800000108fa8:	48 89 e5             	mov    %rsp,%rbp
ffff800000108fab:	41 57                	push   %r15
ffff800000108fad:	41 54                	push   %r12
ffff800000108faf:	53                   	push   %rbx
ffff800000108fb0:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000108fb4:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000108fb4 <init+0xd>
ffff800000108fbb:	49 bb b4 2e 00 00 00 	movabs $0x2eb4,%r11
ffff800000108fc2:	00 00 00 
ffff800000108fc5:	4c 01 db             	add    %r11,%rbx
ffff800000108fc8:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
ffff800000108fcc:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000108fd0:	48 89 c1             	mov    %rax,%rcx
ffff800000108fd3:	48 b8 24 19 00 00 00 	movabs $0x1924,%rax
ffff800000108fda:	00 00 00 
ffff800000108fdd:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000108fe1:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108fe6:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108feb:	49 89 df             	mov    %rbx,%r15
ffff800000108fee:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108ff3:	49 b8 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r8
ffff800000108ffa:	ff ff ff 
ffff800000108ffd:	49 01 d8             	add    %rbx,%r8
ffff800000109000:	41 ff d0             	callq  *%r8
ffff800000109003:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109008:	48 ba 71 87 ff ff ff 	movabs $0xffffffffffff8771,%rdx
ffff80000010900f:	ff ff ff 
ffff800000109012:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff800000109016:	ff d2                	callq  *%rdx
ffff800000109018:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff80000010901c:	48 ba f8 fe ff ff ff 	movabs $0xfffffffffffffef8,%rdx
ffff800000109023:	ff ff ff 
ffff800000109026:	48 8b 14 13          	mov    (%rbx,%rdx,1),%rdx
ffff80000010902a:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff80000010902e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109033:	48 ba 71 87 ff ff ff 	movabs $0xffffffffffff8771,%rdx
ffff80000010903a:	ff ff ff 
ffff80000010903d:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff800000109041:	ff d2                	callq  *%rdx
ffff800000109043:	49 89 c4             	mov    %rax,%r12
ffff800000109046:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010904b:	48 ba 71 87 ff ff ff 	movabs $0xffffffffffff8771,%rdx
ffff800000109052:	ff ff ff 
ffff800000109055:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff800000109059:	ff d2                	callq  *%rdx
ffff80000010905b:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff80000010905f:	49 8d 94 24 40 7f 00 	lea    0x7f40(%r12),%rdx
ffff800000109066:	00 
ffff800000109067:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff80000010906b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109070:	48 ba 71 87 ff ff ff 	movabs $0xffffffffffff8771,%rdx
ffff800000109077:	ff ff ff 
ffff80000010907a:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff80000010907e:	ff d2                	callq  *%rdx
ffff800000109080:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109084:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000109088:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff80000010908c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109091:	48 ba 71 87 ff ff ff 	movabs $0xffffffffffff8771,%rdx
ffff800000109098:	ff ff ff 
ffff80000010909b:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff80000010909f:	ff d2                	callq  *%rdx
ffff8000001090a1:	4c 8b 60 28          	mov    0x28(%rax),%r12
ffff8000001090a5:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001090aa:	48 ba 71 87 ff ff ff 	movabs $0xffffffffffff8771,%rdx
ffff8000001090b1:	ff ff ff 
ffff8000001090b4:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff8000001090b8:	ff d2                	callq  *%rdx
ffff8000001090ba:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff8000001090be:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001090c2:	48 89 c7             	mov    %rax,%rdi
ffff8000001090c5:	49 8b 64 24 10       	mov    0x10(%r12),%rsp
ffff8000001090ca:	ff 72 08             	pushq  0x8(%rdx)
ffff8000001090cd:	e9 c1 fd ff ff       	jmpq   ffff800000108e93 <do_execve>
ffff8000001090d2:	b8 01 00 00 00       	mov    $0x1,%eax
ffff8000001090d7:	48 83 c4 28          	add    $0x28,%rsp
ffff8000001090db:	5b                   	pop    %rbx
ffff8000001090dc:	41 5c                	pop    %r12
ffff8000001090de:	41 5f                	pop    %r15
ffff8000001090e0:	5d                   	pop    %rbp
ffff8000001090e1:	c3                   	retq   

ffff8000001090e2 <__switch_to>:
ffff8000001090e2:	55                   	push   %rbp
ffff8000001090e3:	48 89 e5             	mov    %rsp,%rbp
ffff8000001090e6:	41 55                	push   %r13
ffff8000001090e8:	41 54                	push   %r12
ffff8000001090ea:	53                   	push   %rbx
ffff8000001090eb:	48 83 ec 10          	sub    $0x10,%rsp
ffff8000001090ef:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff8000001090ef <__switch_to+0xd>
ffff8000001090f6:	49 bb 79 2d 00 00 00 	movabs $0x2d79,%r11
ffff8000001090fd:	00 00 00 
ffff800000109100:	4c 01 d8             	add    %r11,%rax
ffff800000109103:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
ffff800000109107:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
ffff80000010910b:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff80000010910f:	48 8b 52 28          	mov    0x28(%rdx),%rdx
ffff800000109113:	48 8b 0a             	mov    (%rdx),%rcx
ffff800000109116:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff80000010911d:	00 00 00 
ffff800000109120:	48 89 4c 10 04       	mov    %rcx,0x4(%rax,%rdx,1)
ffff800000109125:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff80000010912c:	00 00 00 
ffff80000010912f:	48 8b 54 10 54       	mov    0x54(%rax,%rdx,1),%rdx
ffff800000109134:	89 d3                	mov    %edx,%ebx
ffff800000109136:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff80000010913d:	00 00 00 
ffff800000109140:	48 8b 54 10 4c       	mov    0x4c(%rax,%rdx,1),%rdx
ffff800000109145:	41 89 d3             	mov    %edx,%r11d
ffff800000109148:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff80000010914f:	00 00 00 
ffff800000109152:	48 8b 54 10 44       	mov    0x44(%rax,%rdx,1),%rdx
ffff800000109157:	41 89 d1             	mov    %edx,%r9d
ffff80000010915a:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff800000109161:	00 00 00 
ffff800000109164:	48 8b 54 10 3c       	mov    0x3c(%rax,%rdx,1),%rdx
ffff800000109169:	41 89 d0             	mov    %edx,%r8d
ffff80000010916c:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff800000109173:	00 00 00 
ffff800000109176:	48 8b 54 10 34       	mov    0x34(%rax,%rdx,1),%rdx
ffff80000010917b:	41 89 d5             	mov    %edx,%r13d
ffff80000010917e:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff800000109185:	00 00 00 
ffff800000109188:	48 8b 54 10 2c       	mov    0x2c(%rax,%rdx,1),%rdx
ffff80000010918d:	41 89 d4             	mov    %edx,%r12d
ffff800000109190:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff800000109197:	00 00 00 
ffff80000010919a:	48 8b 54 10 24       	mov    0x24(%rax,%rdx,1),%rdx
ffff80000010919f:	89 d1                	mov    %edx,%ecx
ffff8000001091a1:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff8000001091a8:	00 00 00 
ffff8000001091ab:	48 8b 54 10 14       	mov    0x14(%rax,%rdx,1),%rdx
ffff8000001091b0:	41 89 d2             	mov    %edx,%r10d
ffff8000001091b3:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff8000001091ba:	00 00 00 
ffff8000001091bd:	48 8b 54 10 0c       	mov    0xc(%rax,%rdx,1),%rdx
ffff8000001091c2:	89 d6                	mov    %edx,%esi
ffff8000001091c4:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff8000001091cb:	00 00 00 
ffff8000001091ce:	48 8b 54 10 04       	mov    0x4(%rax,%rdx,1),%rdx
ffff8000001091d3:	89 d7                	mov    %edx,%edi
ffff8000001091d5:	53                   	push   %rbx
ffff8000001091d6:	41 53                	push   %r11
ffff8000001091d8:	41 51                	push   %r9
ffff8000001091da:	41 50                	push   %r8
ffff8000001091dc:	45 89 e9             	mov    %r13d,%r9d
ffff8000001091df:	45 89 e0             	mov    %r12d,%r8d
ffff8000001091e2:	44 89 d2             	mov    %r10d,%edx
ffff8000001091e5:	49 ba 05 86 ff ff ff 	movabs $0xffffffffffff8605,%r10
ffff8000001091ec:	ff ff ff 
ffff8000001091ef:	4a 8d 04 10          	lea    (%rax,%r10,1),%rax
ffff8000001091f3:	ff d0                	callq  *%rax
ffff8000001091f5:	48 83 c4 20          	add    $0x20,%rsp
ffff8000001091f9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001091fd:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff800000109201:	48 8c e0             	mov    %fs,%rax
ffff800000109204:	48 89 42 18          	mov    %rax,0x18(%rdx)
ffff800000109208:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010920c:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff800000109210:	48 8c e8             	mov    %gs,%rax
ffff800000109213:	48 89 42 20          	mov    %rax,0x20(%rdx)
ffff800000109217:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010921b:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff80000010921f:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109223:	48 8e e0             	mov    %rax,%fs
ffff800000109226:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010922a:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff80000010922e:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff800000109232:	48 8e e8             	mov    %rax,%gs
ffff800000109235:	90                   	nop
ffff800000109236:	48 8d 65 e8          	lea    -0x18(%rbp),%rsp
ffff80000010923a:	5b                   	pop    %rbx
ffff80000010923b:	41 5c                	pop    %r12
ffff80000010923d:	41 5d                	pop    %r13
ffff80000010923f:	5d                   	pop    %rbp
ffff800000109240:	c3                   	retq   

ffff800000109241 <task_init>:
ffff800000109241:	55                   	push   %rbp
ffff800000109242:	48 89 e5             	mov    %rsp,%rbp
ffff800000109245:	41 57                	push   %r15
ffff800000109247:	41 56                	push   %r14
ffff800000109249:	41 55                	push   %r13
ffff80000010924b:	41 54                	push   %r12
ffff80000010924d:	53                   	push   %rbx
ffff80000010924e:	48 83 ec 18          	sub    $0x18,%rsp
ffff800000109252:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000109252 <task_init+0x11>
ffff800000109259:	49 bb 16 2c 00 00 00 	movabs $0x2c16,%r11
ffff800000109260:	00 00 00 
ffff800000109263:	4c 01 db             	add    %r11,%rbx
ffff800000109266:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
ffff80000010926d:	00 
ffff80000010926e:	48 b8 a8 41 01 00 00 	movabs $0x141a8,%rax
ffff800000109275:	00 00 00 
ffff800000109278:	48 8b 14 03          	mov    (%rbx,%rax,1),%rdx
ffff80000010927c:	48 b8 b8 41 01 00 00 	movabs $0x141b8,%rax
ffff800000109283:	00 00 00 
ffff800000109286:	48 89 14 03          	mov    %rdx,(%rbx,%rax,1)
ffff80000010928a:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000109291:	ff ff ff 
ffff800000109294:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000109298:	48 8b 90 d0 02 00 00 	mov    0x2d0(%rax),%rdx
ffff80000010929f:	48 b8 b8 41 01 00 00 	movabs $0x141b8,%rax
ffff8000001092a6:	00 00 00 
ffff8000001092a9:	48 89 54 03 08       	mov    %rdx,0x8(%rbx,%rax,1)
ffff8000001092ae:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001092b5:	ff ff ff 
ffff8000001092b8:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001092bc:	48 8b 90 d8 02 00 00 	mov    0x2d8(%rax),%rdx
ffff8000001092c3:	48 b8 b8 41 01 00 00 	movabs $0x141b8,%rax
ffff8000001092ca:	00 00 00 
ffff8000001092cd:	48 89 54 03 10       	mov    %rdx,0x10(%rbx,%rax,1)
ffff8000001092d2:	48 b8 a0 ff ff ff ff 	movabs $0xffffffffffffffa0,%rax
ffff8000001092d9:	ff ff ff 
ffff8000001092dc:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001092e0:	48 89 c2             	mov    %rax,%rdx
ffff8000001092e3:	48 b8 b8 41 01 00 00 	movabs $0x141b8,%rax
ffff8000001092ea:	00 00 00 
ffff8000001092ed:	48 89 54 03 18       	mov    %rdx,0x18(%rbx,%rax,1)
ffff8000001092f2:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001092f9:	ff ff ff 
ffff8000001092fc:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000109300:	48 8b 90 e0 02 00 00 	mov    0x2e0(%rax),%rdx
ffff800000109307:	48 b8 b8 41 01 00 00 	movabs $0x141b8,%rax
ffff80000010930e:	00 00 00 
ffff800000109311:	48 89 54 03 20       	mov    %rdx,0x20(%rbx,%rax,1)
ffff800000109316:	48 b8 58 ff ff ff ff 	movabs $0xffffffffffffff58,%rax
ffff80000010931d:	ff ff ff 
ffff800000109320:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000109324:	48 89 c2             	mov    %rax,%rdx
ffff800000109327:	48 b8 b8 41 01 00 00 	movabs $0x141b8,%rax
ffff80000010932e:	00 00 00 
ffff800000109331:	48 89 54 03 28       	mov    %rdx,0x28(%rbx,%rax,1)
ffff800000109336:	48 b8 f8 ff ff ff ff 	movabs $0xfffffffffffffff8,%rax
ffff80000010933d:	ff ff ff 
ffff800000109340:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000109344:	48 89 c2             	mov    %rax,%rdx
ffff800000109347:	48 b8 b8 41 01 00 00 	movabs $0x141b8,%rax
ffff80000010934e:	00 00 00 
ffff800000109351:	48 89 54 03 30       	mov    %rdx,0x30(%rbx,%rax,1)
ffff800000109356:	48 b8 b8 41 01 00 00 	movabs $0x141b8,%rax
ffff80000010935d:	00 00 00 
ffff800000109360:	48 c7 44 03 38 00 00 	movq   $0x0,0x38(%rbx,%rax,1)
ffff800000109367:	00 00 
ffff800000109369:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000109370:	ff ff ff 
ffff800000109373:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000109377:	48 8b 90 e8 02 00 00 	mov    0x2e8(%rax),%rdx
ffff80000010937e:	48 b8 b8 41 01 00 00 	movabs $0x141b8,%rax
ffff800000109385:	00 00 00 
ffff800000109388:	48 89 54 03 40       	mov    %rdx,0x40(%rbx,%rax,1)
ffff80000010938d:	48 b8 90 ff ff ff ff 	movabs $0xffffffffffffff90,%rax
ffff800000109394:	ff ff ff 
ffff800000109397:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010939b:	48 8b 10             	mov    (%rax),%rdx
ffff80000010939e:	48 b8 b8 41 01 00 00 	movabs $0x141b8,%rax
ffff8000001093a5:	00 00 00 
ffff8000001093a8:	48 89 54 03 48       	mov    %rdx,0x48(%rbx,%rax,1)
ffff8000001093ad:	be 08 00 00 00       	mov    $0x8,%esi
ffff8000001093b2:	bf 74 01 00 00       	mov    $0x174,%edi
ffff8000001093b7:	49 89 df             	mov    %rbx,%r15
ffff8000001093ba:	48 b8 a0 c1 ff ff ff 	movabs $0xffffffffffffc1a0,%rax
ffff8000001093c1:	ff ff ff 
ffff8000001093c4:	48 01 d8             	add    %rbx,%rax
ffff8000001093c7:	ff d0                	callq  *%rax
ffff8000001093c9:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001093ce:	48 ba 71 87 ff ff ff 	movabs $0xffffffffffff8771,%rdx
ffff8000001093d5:	ff ff ff 
ffff8000001093d8:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff8000001093dc:	ff d2                	callq  *%rdx
ffff8000001093de:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff8000001093e2:	48 8b 00             	mov    (%rax),%rax
ffff8000001093e5:	48 89 c6             	mov    %rax,%rsi
ffff8000001093e8:	bf 75 01 00 00       	mov    $0x175,%edi
ffff8000001093ed:	49 89 df             	mov    %rbx,%r15
ffff8000001093f0:	48 b8 a0 c1 ff ff ff 	movabs $0xffffffffffffc1a0,%rax
ffff8000001093f7:	ff ff ff 
ffff8000001093fa:	48 01 d8             	add    %rbx,%rax
ffff8000001093fd:	ff d0                	callq  *%rax
ffff8000001093ff:	48 b8 e0 ff ff ff ff 	movabs $0xffffffffffffffe0,%rax
ffff800000109406:	ff ff ff 
ffff800000109409:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010940d:	48 89 c6             	mov    %rax,%rsi
ffff800000109410:	bf 76 01 00 00       	mov    $0x176,%edi
ffff800000109415:	49 89 df             	mov    %rbx,%r15
ffff800000109418:	48 b8 a0 c1 ff ff ff 	movabs $0xffffffffffffc1a0,%rax
ffff80000010941f:	ff ff ff 
ffff800000109422:	48 01 d8             	add    %rbx,%rax
ffff800000109425:	ff d0                	callq  *%rax
ffff800000109427:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff80000010942e:	00 00 00 
ffff800000109431:	48 8b 44 03 54       	mov    0x54(%rbx,%rax,1),%rax
ffff800000109436:	41 89 c2             	mov    %eax,%r10d
ffff800000109439:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff800000109440:	00 00 00 
ffff800000109443:	48 8b 44 03 4c       	mov    0x4c(%rbx,%rax,1),%rax
ffff800000109448:	41 89 c1             	mov    %eax,%r9d
ffff80000010944b:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff800000109452:	00 00 00 
ffff800000109455:	48 8b 44 03 44       	mov    0x44(%rbx,%rax,1),%rax
ffff80000010945a:	41 89 c0             	mov    %eax,%r8d
ffff80000010945d:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff800000109464:	00 00 00 
ffff800000109467:	48 8b 44 03 3c       	mov    0x3c(%rbx,%rax,1),%rax
ffff80000010946c:	89 c7                	mov    %eax,%edi
ffff80000010946e:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff800000109475:	00 00 00 
ffff800000109478:	48 8b 44 03 34       	mov    0x34(%rbx,%rax,1),%rax
ffff80000010947d:	41 89 c4             	mov    %eax,%r12d
ffff800000109480:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff800000109487:	00 00 00 
ffff80000010948a:	48 8b 44 03 2c       	mov    0x2c(%rbx,%rax,1),%rax
ffff80000010948f:	41 89 c3             	mov    %eax,%r11d
ffff800000109492:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff800000109499:	00 00 00 
ffff80000010949c:	48 8b 44 03 24       	mov    0x24(%rbx,%rax,1),%rax
ffff8000001094a1:	89 c1                	mov    %eax,%ecx
ffff8000001094a3:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff8000001094aa:	00 00 00 
ffff8000001094ad:	48 8b 44 03 14       	mov    0x14(%rbx,%rax,1),%rax
ffff8000001094b2:	89 c2                	mov    %eax,%edx
ffff8000001094b4:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff8000001094bb:	00 00 00 
ffff8000001094be:	48 8b 44 03 0c       	mov    0xc(%rbx,%rax,1),%rax
ffff8000001094c3:	89 c6                	mov    %eax,%esi
ffff8000001094c5:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff8000001094cc:	00 00 00 
ffff8000001094cf:	48 8b 44 03 04       	mov    0x4(%rbx,%rax,1),%rax
ffff8000001094d4:	41 52                	push   %r10
ffff8000001094d6:	41 51                	push   %r9
ffff8000001094d8:	41 50                	push   %r8
ffff8000001094da:	57                   	push   %rdi
ffff8000001094db:	45 89 e1             	mov    %r12d,%r9d
ffff8000001094de:	45 89 d8             	mov    %r11d,%r8d
ffff8000001094e1:	89 c7                	mov    %eax,%edi
ffff8000001094e3:	48 b8 05 86 ff ff ff 	movabs $0xffffffffffff8605,%rax
ffff8000001094ea:	ff ff ff 
ffff8000001094ed:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001094f1:	ff d0                	callq  *%rax
ffff8000001094f3:	48 83 c4 20          	add    $0x20,%rsp
ffff8000001094f7:	48 b8 18 00 00 00 00 	movabs $0x18,%rax
ffff8000001094fe:	00 00 00 
ffff800000109501:	48 8b 14 03          	mov    (%rbx,%rax,1),%rdx
ffff800000109505:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff80000010950c:	00 00 00 
ffff80000010950f:	48 89 54 03 04       	mov    %rdx,0x4(%rbx,%rax,1)
ffff800000109514:	48 b8 98 41 00 00 00 	movabs $0x4198,%rax
ffff80000010951b:	00 00 00 
ffff80000010951e:	48 8d 3c 03          	lea    (%rbx,%rax,1),%rdi
ffff800000109522:	49 89 df             	mov    %rbx,%r15
ffff800000109525:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010952a:	48 ba f7 bf ff ff ff 	movabs $0xffffffffffffbff7,%rdx
ffff800000109531:	ff ff ff 
ffff800000109534:	48 01 da             	add    %rbx,%rdx
ffff800000109537:	ff d2                	callq  *%rdx
ffff800000109539:	ba 07 00 00 00       	mov    $0x7,%edx
ffff80000010953e:	be 0a 00 00 00       	mov    $0xa,%esi
ffff800000109543:	48 b8 3f d1 ff ff ff 	movabs $0xffffffffffffd13f,%rax
ffff80000010954a:	ff ff ff 
ffff80000010954d:	48 8d 3c 03          	lea    (%rbx,%rax,1),%rdi
ffff800000109551:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109556:	48 b9 e4 d7 ff ff ff 	movabs $0xffffffffffffd7e4,%rcx
ffff80000010955d:	ff ff ff 
ffff800000109560:	48 8d 0c 0b          	lea    (%rbx,%rcx,1),%rcx
ffff800000109564:	ff d1                	callq  *%rcx
ffff800000109566:	48 b8 98 41 00 00 00 	movabs $0x4198,%rax
ffff80000010956d:	00 00 00 
ffff800000109570:	48 c7 44 03 10 01 00 	movq   $0x1,0x10(%rbx,%rax,1)
ffff800000109577:	00 00 
ffff800000109579:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010957e:	48 ba 71 87 ff ff ff 	movabs $0xffffffffffff8771,%rdx
ffff800000109585:	ff ff ff 
ffff800000109588:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff80000010958c:	ff d2                	callq  *%rdx
ffff80000010958e:	48 89 c7             	mov    %rax,%rdi
ffff800000109591:	49 89 df             	mov    %rbx,%r15
ffff800000109594:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109599:	48 ba 66 c1 ff ff ff 	movabs $0xffffffffffffc166,%rdx
ffff8000001095a0:	ff ff ff 
ffff8000001095a3:	48 01 da             	add    %rbx,%rdx
ffff8000001095a6:	ff d2                	callq  *%rdx
ffff8000001095a8:	48 98                	cltq   
ffff8000001095aa:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
ffff8000001095ae:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff8000001095b2:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff8000001095b6:	90                   	nop
ffff8000001095b7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001095bc:	48 ba 71 87 ff ff ff 	movabs $0xffffffffffff8771,%rdx
ffff8000001095c3:	ff ff ff 
ffff8000001095c6:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff8000001095ca:	ff d2                	callq  *%rdx
ffff8000001095cc:	4c 8b 60 28          	mov    0x28(%rax),%r12
ffff8000001095d0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001095d5:	48 ba 71 87 ff ff ff 	movabs $0xffffffffffff8771,%rdx
ffff8000001095dc:	ff ff ff 
ffff8000001095df:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff8000001095e3:	ff d2                	callq  *%rdx
ffff8000001095e5:	4c 8b 78 28          	mov    0x28(%rax),%r15
ffff8000001095e9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001095ed:	4c 8b 68 28          	mov    0x28(%rax),%r13
ffff8000001095f1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001095f5:	4c 8b 70 28          	mov    0x28(%rax),%r14
ffff8000001095f9:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001095fe:	48 ba 71 87 ff ff ff 	movabs $0xffffffffffff8771,%rdx
ffff800000109605:	ff ff ff 
ffff800000109608:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff80000010960c:	ff d2                	callq  *%rdx
ffff80000010960e:	48 89 c2             	mov    %rax,%rdx
ffff800000109611:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109615:	48 89 d7             	mov    %rdx,%rdi
ffff800000109618:	48 89 c6             	mov    %rax,%rsi
ffff80000010961b:	55                   	push   %rbp
ffff80000010961c:	50                   	push   %rax
ffff80000010961d:	49 89 64 24 10       	mov    %rsp,0x10(%r12)
ffff800000109622:	49 8b 65 10          	mov    0x10(%r13),%rsp
ffff800000109626:	48 8d 05 0d 00 00 00 	lea    0xd(%rip),%rax        # ffff80000010963a <task_init+0x3f9>
ffff80000010962d:	49 89 47 08          	mov    %rax,0x8(%r15)
ffff800000109631:	41 ff 76 08          	pushq  0x8(%r14)
ffff800000109635:	e9 a8 fa ff ff       	jmpq   ffff8000001090e2 <__switch_to>
ffff80000010963a:	58                   	pop    %rax
ffff80000010963b:	5d                   	pop    %rbp
ffff80000010963c:	90                   	nop
ffff80000010963d:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
ffff800000109641:	5b                   	pop    %rbx
ffff800000109642:	41 5c                	pop    %r12
ffff800000109644:	41 5d                	pop    %r13
ffff800000109646:	41 5e                	pop    %r14
ffff800000109648:	41 5f                	pop    %r15
ffff80000010964a:	5d                   	pop    %rbp
ffff80000010964b:	c3                   	retq   

ffff80000010964c <kernel_thread>:
ffff80000010964c:	55                   	push   %rbp
ffff80000010964d:	48 89 e5             	mov    %rsp,%rbp
ffff800000109650:	41 57                	push   %r15
ffff800000109652:	53                   	push   %rbx
ffff800000109653:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
ffff80000010965a:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff80000010965a <kernel_thread+0xe>
ffff800000109661:	49 bb 0e 28 00 00 00 	movabs $0x280e,%r11
ffff800000109668:	00 00 00 
ffff80000010966b:	4c 01 db             	add    %r11,%rbx
ffff80000010966e:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
ffff800000109675:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
ffff80000010967c:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
ffff800000109683:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
ffff80000010968a:	ba c0 00 00 00       	mov    $0xc0,%edx
ffff80000010968f:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109694:	48 89 c7             	mov    %rax,%rdi
ffff800000109697:	49 89 df             	mov    %rbx,%r15
ffff80000010969a:	48 b8 85 be ff ff ff 	movabs $0xffffffffffffbe85,%rax
ffff8000001096a1:	ff ff ff 
ffff8000001096a4:	48 01 d8             	add    %rbx,%rax
ffff8000001096a7:	ff d0                	callq  *%rax
ffff8000001096a9:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
ffff8000001096b0:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
ffff8000001096b7:	48 8b 85 20 ff ff ff 	mov    -0xe0(%rbp),%rax
ffff8000001096be:	48 89 45 80          	mov    %rax,-0x80(%rbp)
ffff8000001096c2:	48 c7 45 a0 10 00 00 	movq   $0x10,-0x60(%rbp)
ffff8000001096c9:	00 
ffff8000001096ca:	48 c7 45 a8 10 00 00 	movq   $0x10,-0x58(%rbp)
ffff8000001096d1:	00 
ffff8000001096d2:	48 c7 45 d0 08 00 00 	movq   $0x8,-0x30(%rbp)
ffff8000001096d9:	00 
ffff8000001096da:	48 c7 45 e8 10 00 00 	movq   $0x10,-0x18(%rbp)
ffff8000001096e1:	00 
ffff8000001096e2:	48 c7 45 d8 00 02 00 	movq   $0x200,-0x28(%rbp)
ffff8000001096e9:	00 
ffff8000001096ea:	48 b8 f4 d0 ff ff ff 	movabs $0xffffffffffffd0f4,%rax
ffff8000001096f1:	ff ff ff 
ffff8000001096f4:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001096f8:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff8000001096fc:	48 8b b5 18 ff ff ff 	mov    -0xe8(%rbp),%rsi
ffff800000109703:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
ffff80000010970a:	b9 00 00 00 00       	mov    $0x0,%ecx
ffff80000010970f:	ba 00 00 00 00       	mov    $0x0,%edx
ffff800000109714:	48 89 c7             	mov    %rax,%rdi
ffff800000109717:	48 b8 cb d8 ff ff ff 	movabs $0xffffffffffffd8cb,%rax
ffff80000010971e:	ff ff ff 
ffff800000109721:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109725:	ff d0                	callq  *%rax
ffff800000109727:	48 81 c4 e0 00 00 00 	add    $0xe0,%rsp
ffff80000010972e:	5b                   	pop    %rbx
ffff80000010972f:	41 5f                	pop    %r15
ffff800000109731:	5d                   	pop    %rbp
ffff800000109732:	c3                   	retq   

ffff800000109733 <do_fork>:
ffff800000109733:	55                   	push   %rbp
ffff800000109734:	48 89 e5             	mov    %rsp,%rbp
ffff800000109737:	41 57                	push   %r15
ffff800000109739:	53                   	push   %rbx
ffff80000010973a:	48 83 ec 40          	sub    $0x40,%rsp
ffff80000010973e:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff80000010973e <do_fork+0xb>
ffff800000109745:	49 bb 2a 27 00 00 00 	movabs $0x272a,%r11
ffff80000010974c:	00 00 00 
ffff80000010974f:	4c 01 db             	add    %r11,%rbx
ffff800000109752:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
ffff800000109756:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
ffff80000010975a:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
ffff80000010975e:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
ffff800000109762:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000109769:	00 
ffff80000010976a:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
ffff800000109771:	00 
ffff800000109772:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
ffff800000109779:	00 
ffff80000010977a:	ba 91 00 00 00       	mov    $0x91,%edx
ffff80000010977f:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000109784:	bf 02 00 00 00       	mov    $0x2,%edi
ffff800000109789:	49 89 df             	mov    %rbx,%r15
ffff80000010978c:	48 b8 7d b9 ff ff ff 	movabs $0xffffffffffffb97d,%rax
ffff800000109793:	ff ff ff 
ffff800000109796:	48 01 d8             	add    %rbx,%rax
ffff800000109799:	ff d0                	callq  *%rax
ffff80000010979b:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff80000010979f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001097a3:	48 8b 50 08          	mov    0x8(%rax),%rdx
ffff8000001097a7:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff8000001097ae:	80 ff ff 
ffff8000001097b1:	48 01 d0             	add    %rdx,%rax
ffff8000001097b4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001097b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001097bc:	ba 08 00 00 00       	mov    $0x8,%edx
ffff8000001097c1:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001097c6:	48 89 c7             	mov    %rax,%rdi
ffff8000001097c9:	49 89 df             	mov    %rbx,%r15
ffff8000001097cc:	48 b8 85 be ff ff ff 	movabs $0xffffffffffffbe85,%rax
ffff8000001097d3:	ff ff ff 
ffff8000001097d6:	48 01 d8             	add    %rbx,%rax
ffff8000001097d9:	ff d0                	callq  *%rax
ffff8000001097db:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001097e0:	48 ba 71 87 ff ff ff 	movabs $0xffffffffffff8771,%rdx
ffff8000001097e7:	ff ff ff 
ffff8000001097ea:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff8000001097ee:	ff d2                	callq  *%rdx
ffff8000001097f0:	48 89 c2             	mov    %rax,%rdx
ffff8000001097f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001097f7:	48 8b 32             	mov    (%rdx),%rsi
ffff8000001097fa:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
ffff8000001097fe:	48 89 30             	mov    %rsi,(%rax)
ffff800000109801:	48 89 78 08          	mov    %rdi,0x8(%rax)
ffff800000109805:	48 8b 72 10          	mov    0x10(%rdx),%rsi
ffff800000109809:	48 8b 7a 18          	mov    0x18(%rdx),%rdi
ffff80000010980d:	48 89 70 10          	mov    %rsi,0x10(%rax)
ffff800000109811:	48 89 78 18          	mov    %rdi,0x18(%rax)
ffff800000109815:	48 8b 72 20          	mov    0x20(%rdx),%rsi
ffff800000109819:	48 8b 7a 28          	mov    0x28(%rdx),%rdi
ffff80000010981d:	48 89 70 20          	mov    %rsi,0x20(%rax)
ffff800000109821:	48 89 78 28          	mov    %rdi,0x28(%rax)
ffff800000109825:	48 8b 72 30          	mov    0x30(%rdx),%rsi
ffff800000109829:	48 8b 7a 38          	mov    0x38(%rdx),%rdi
ffff80000010982d:	48 89 70 30          	mov    %rsi,0x30(%rax)
ffff800000109831:	48 89 78 38          	mov    %rdi,0x38(%rax)
ffff800000109835:	48 8b 72 40          	mov    0x40(%rdx),%rsi
ffff800000109839:	48 8b 7a 48          	mov    0x48(%rdx),%rdi
ffff80000010983d:	48 89 70 40          	mov    %rsi,0x40(%rax)
ffff800000109841:	48 89 78 48          	mov    %rdi,0x48(%rax)
ffff800000109845:	48 8b 52 50          	mov    0x50(%rdx),%rdx
ffff800000109849:	48 89 50 50          	mov    %rdx,0x50(%rax)
ffff80000010984d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109851:	48 89 c7             	mov    %rax,%rdi
ffff800000109854:	49 89 df             	mov    %rbx,%r15
ffff800000109857:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010985c:	48 ba f7 bf ff ff ff 	movabs $0xffffffffffffbff7,%rdx
ffff800000109863:	ff ff ff 
ffff800000109866:	48 01 da             	add    %rbx,%rdx
ffff800000109869:	ff d2                	callq  *%rdx
ffff80000010986b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010986f:	48 89 c6             	mov    %rax,%rsi
ffff800000109872:	48 b8 98 41 00 00 00 	movabs $0x4198,%rax
ffff800000109879:	00 00 00 
ffff80000010987c:	48 8d 3c 03          	lea    (%rbx,%rax,1),%rdi
ffff800000109880:	49 89 df             	mov    %rbx,%r15
ffff800000109883:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109888:	48 ba 86 c0 ff ff ff 	movabs $0xffffffffffffc086,%rdx
ffff80000010988f:	ff ff ff 
ffff800000109892:	48 01 da             	add    %rbx,%rdx
ffff800000109895:	ff d2                	callq  *%rdx
ffff800000109897:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010989b:	48 8b 40 38          	mov    0x38(%rax),%rax
ffff80000010989f:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001098a3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001098a7:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff8000001098ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001098af:	48 c7 40 10 04 00 00 	movq   $0x4,0x10(%rax)
ffff8000001098b6:	00 
ffff8000001098b7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001098bb:	48 83 c0 58          	add    $0x58,%rax
ffff8000001098bf:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff8000001098c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001098c7:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
ffff8000001098cb:	48 89 50 28          	mov    %rdx,0x28(%rax)
ffff8000001098cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001098d3:	48 05 40 7f 00 00    	add    $0x7f40,%rax
ffff8000001098d9:	48 89 c1             	mov    %rax,%rcx
ffff8000001098dc:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001098e0:	ba c0 00 00 00       	mov    $0xc0,%edx
ffff8000001098e5:	48 89 ce             	mov    %rcx,%rsi
ffff8000001098e8:	48 89 c7             	mov    %rax,%rdi
ffff8000001098eb:	49 89 df             	mov    %rbx,%r15
ffff8000001098ee:	48 b8 dc be ff ff ff 	movabs $0xffffffffffffbedc,%rax
ffff8000001098f5:	ff ff ff 
ffff8000001098f8:	48 01 d8             	add    %rbx,%rax
ffff8000001098fb:	ff d0                	callq  *%rax
ffff8000001098fd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109901:	48 8d 90 00 80 00 00 	lea    0x8000(%rax),%rdx
ffff800000109908:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010990c:	48 89 10             	mov    %rdx,(%rax)
ffff80000010990f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109913:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
ffff80000010991a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010991e:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000109922:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109926:	48 8d 90 40 7f 00 00 	lea    0x7f40(%rax),%rdx
ffff80000010992d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109931:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000109935:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109939:	48 c7 40 18 10 00 00 	movq   $0x10,0x18(%rax)
ffff800000109940:	00 
ffff800000109941:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109945:	48 c7 40 20 10 00 00 	movq   $0x10,0x20(%rax)
ffff80000010994c:	00 
ffff80000010994d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109951:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109955:	83 e0 01             	and    $0x1,%eax
ffff800000109958:	48 85 c0             	test   %rax,%rax
ffff80000010995b:	75 2f                	jne    ffff80000010998c <do_fork+0x259>
ffff80000010995d:	48 b8 f8 fe ff ff ff 	movabs $0xfffffffffffffef8,%rax
ffff800000109964:	ff ff ff 
ffff800000109967:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010996b:	48 89 c2             	mov    %rax,%rdx
ffff80000010996e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109972:	48 89 90 98 00 00 00 	mov    %rdx,0x98(%rax)
ffff800000109979:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010997d:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
ffff800000109984:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109988:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff80000010998c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109990:	48 c7 40 10 01 00 00 	movq   $0x1,0x10(%rax)
ffff800000109997:	00 
ffff800000109998:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010999d:	48 83 c4 40          	add    $0x40,%rsp
ffff8000001099a1:	5b                   	pop    %rbx
ffff8000001099a2:	41 5f                	pop    %r15
ffff8000001099a4:	5d                   	pop    %rbp
ffff8000001099a5:	c3                   	retq   

ffff8000001099a6 <do_exit>:
ffff8000001099a6:	55                   	push   %rbp
ffff8000001099a7:	48 89 e5             	mov    %rsp,%rbp
ffff8000001099aa:	41 57                	push   %r15
ffff8000001099ac:	48 83 ec 18          	sub    $0x18,%rsp
ffff8000001099b0:	48 8d 0d f9 ff ff ff 	lea    -0x7(%rip),%rcx        # ffff8000001099b0 <do_exit+0xa>
ffff8000001099b7:	49 bb b8 24 00 00 00 	movabs $0x24b8,%r11
ffff8000001099be:	00 00 00 
ffff8000001099c1:	4c 01 d9             	add    %r11,%rcx
ffff8000001099c4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff8000001099c8:	48 b8 41 19 00 00 00 	movabs $0x1941,%rax
ffff8000001099cf:	00 00 00 
ffff8000001099d2:	48 8d 14 01          	lea    (%rcx,%rax,1),%rdx
ffff8000001099d6:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001099db:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001099e0:	49 89 cf             	mov    %rcx,%r15
ffff8000001099e3:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001099e8:	49 b8 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r8
ffff8000001099ef:	ff ff ff 
ffff8000001099f2:	49 01 c8             	add    %rcx,%r8
ffff8000001099f5:	41 ff d0             	callq  *%r8
ffff8000001099f8:	eb fe                	jmp    ffff8000001099f8 <do_exit+0x52>
ffff8000001099fa:	55                   	push   %rbp
ffff8000001099fb:	48 89 e5             	mov    %rsp,%rbp
ffff8000001099fe:	53                   	push   %rbx
ffff8000001099ff:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff8000001099ff <do_exit+0x59>
ffff800000109a06:	49 bb 69 24 00 00 00 	movabs $0x2469,%r11
ffff800000109a0d:	00 00 00 
ffff800000109a10:	4c 01 d8             	add    %r11,%rax
ffff800000109a13:	89 7d f4             	mov    %edi,-0xc(%rbp)
ffff800000109a16:	89 75 f0             	mov    %esi,-0x10(%rbp)
ffff800000109a19:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000109a1d:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
ffff800000109a21:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
ffff800000109a25:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
ffff800000109a29:	8b 45 f4             	mov    -0xc(%rbp),%eax
ffff800000109a2c:	8b 55 f0             	mov    -0x10(%rbp),%edx
ffff800000109a2f:	89 d1                	mov    %edx,%ecx
ffff800000109a31:	0f a2                	cpuid  
ffff800000109a33:	89 de                	mov    %ebx,%esi
ffff800000109a35:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
ffff800000109a39:	89 07                	mov    %eax,(%rdi)
ffff800000109a3b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109a3f:	89 30                	mov    %esi,(%rax)
ffff800000109a41:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000109a45:	89 08                	mov    %ecx,(%rax)
ffff800000109a47:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000109a4b:	89 10                	mov    %edx,(%rax)
ffff800000109a4d:	90                   	nop
ffff800000109a4e:	5b                   	pop    %rbx
ffff800000109a4f:	5d                   	pop    %rbp
ffff800000109a50:	c3                   	retq   

ffff800000109a51 <init_cpu>:
ffff800000109a51:	55                   	push   %rbp
ffff800000109a52:	48 89 e5             	mov    %rsp,%rbp
ffff800000109a55:	41 57                	push   %r15
ffff800000109a57:	53                   	push   %rbx
ffff800000109a58:	48 83 ec 40          	sub    $0x40,%rsp
ffff800000109a5c:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000109a5c <init_cpu+0xb>
ffff800000109a63:	49 bb 0c 24 00 00 00 	movabs $0x240c,%r11
ffff800000109a6a:	00 00 00 
ffff800000109a6d:	4c 01 db             	add    %r11,%rbx
ffff800000109a70:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%rbp)
ffff800000109a77:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
ffff800000109a7e:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
ffff800000109a85:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
ffff800000109a8c:	48 c7 45 b0 00 00 00 	movq   $0x0,-0x50(%rbp)
ffff800000109a93:	00 
ffff800000109a94:	48 c7 45 b8 00 00 00 	movq   $0x0,-0x48(%rbp)
ffff800000109a9b:	00 
ffff800000109a9c:	c6 45 c0 00          	movb   $0x0,-0x40(%rbp)
ffff800000109aa0:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff800000109aa4:	48 8d 70 0c          	lea    0xc(%rax),%rsi
ffff800000109aa8:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff800000109aac:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000109ab0:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff800000109ab4:	48 8d 50 04          	lea    0x4(%rax),%rdx
ffff800000109ab8:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff800000109abc:	49 89 f1             	mov    %rsi,%r9
ffff800000109abf:	49 89 c8             	mov    %rcx,%r8
ffff800000109ac2:	48 89 d1             	mov    %rdx,%rcx
ffff800000109ac5:	48 89 c2             	mov    %rax,%rdx
ffff800000109ac8:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109acd:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000109ad2:	48 b8 1a 87 ff ff ff 	movabs $0xffffffffffff871a,%rax
ffff800000109ad9:	ff ff ff 
ffff800000109adc:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109ae0:	ff d0                	callq  *%rax
ffff800000109ae2:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109ae6:	8b 55 d4             	mov    -0x2c(%rbp),%edx
ffff800000109ae9:	89 10                	mov    %edx,(%rax)
ffff800000109aeb:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109aef:	48 8d 50 04          	lea    0x4(%rax),%rdx
ffff800000109af3:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000109af6:	89 02                	mov    %eax,(%rdx)
ffff800000109af8:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109afc:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff800000109b00:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000109b03:	89 02                	mov    %eax,(%rdx)
ffff800000109b05:	c6 45 bc 0a          	movb   $0xa,-0x44(%rbp)
ffff800000109b09:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109b0d:	48 89 c1             	mov    %rax,%rcx
ffff800000109b10:	48 b8 59 19 00 00 00 	movabs $0x1959,%rax
ffff800000109b17:	00 00 00 
ffff800000109b1a:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000109b1e:	be ff 00 00 00       	mov    $0xff,%esi
ffff800000109b23:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000109b28:	49 89 df             	mov    %rbx,%r15
ffff800000109b2b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109b30:	49 b8 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r8
ffff800000109b37:	ff ff ff 
ffff800000109b3a:	49 01 d8             	add    %rbx,%r8
ffff800000109b3d:	41 ff d0             	callq  *%r8
ffff800000109b40:	c7 45 ec 02 00 00 80 	movl   $0x80000002,-0x14(%rbp)
ffff800000109b47:	e9 ab 00 00 00       	jmpq   ffff800000109bf7 <init_cpu+0x1a6>
ffff800000109b4c:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff800000109b50:	48 8d 78 0c          	lea    0xc(%rax),%rdi
ffff800000109b54:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff800000109b58:	48 8d 70 08          	lea    0x8(%rax),%rsi
ffff800000109b5c:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff800000109b60:	48 8d 48 04          	lea    0x4(%rax),%rcx
ffff800000109b64:	48 8d 55 d0          	lea    -0x30(%rbp),%rdx
ffff800000109b68:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000109b6b:	49 89 f9             	mov    %rdi,%r9
ffff800000109b6e:	49 89 f0             	mov    %rsi,%r8
ffff800000109b71:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109b76:	89 c7                	mov    %eax,%edi
ffff800000109b78:	48 b8 1a 87 ff ff ff 	movabs $0xffffffffffff871a,%rax
ffff800000109b7f:	ff ff ff 
ffff800000109b82:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109b86:	ff d0                	callq  *%rax
ffff800000109b88:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109b8c:	8b 55 d0             	mov    -0x30(%rbp),%edx
ffff800000109b8f:	89 10                	mov    %edx,(%rax)
ffff800000109b91:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109b95:	48 8d 50 04          	lea    0x4(%rax),%rdx
ffff800000109b99:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff800000109b9c:	89 02                	mov    %eax,(%rdx)
ffff800000109b9e:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109ba2:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff800000109ba6:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000109ba9:	89 02                	mov    %eax,(%rdx)
ffff800000109bab:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109baf:	48 8d 50 0c          	lea    0xc(%rax),%rdx
ffff800000109bb3:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000109bb6:	89 02                	mov    %eax,(%rdx)
ffff800000109bb8:	c6 45 c0 00          	movb   $0x0,-0x40(%rbp)
ffff800000109bbc:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109bc0:	48 89 c1             	mov    %rax,%rcx
ffff800000109bc3:	48 b8 69 19 00 00 00 	movabs $0x1969,%rax
ffff800000109bca:	00 00 00 
ffff800000109bcd:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000109bd1:	be ff 00 00 00       	mov    $0xff,%esi
ffff800000109bd6:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000109bdb:	49 89 df             	mov    %rbx,%r15
ffff800000109bde:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109be3:	49 b8 79 90 ff ff ff 	movabs $0xffffffffffff9079,%r8
ffff800000109bea:	ff ff ff 
ffff800000109bed:	49 01 d8             	add    %rbx,%r8
ffff800000109bf0:	41 ff d0             	callq  *%r8
ffff800000109bf3:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
ffff800000109bf7:	81 7d ec 04 00 00 80 	cmpl   $0x80000004,-0x14(%rbp)
ffff800000109bfe:	0f 86 48 ff ff ff    	jbe    ffff800000109b4c <init_cpu+0xfb>
ffff800000109c04:	48 b8 6c 19 00 00 00 	movabs $0x196c,%rax
ffff800000109c0b:	00 00 00 
ffff800000109c0e:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000109c12:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109c17:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000109c1c:	49 89 df             	mov    %rbx,%r15
ffff800000109c1f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109c24:	48 b9 79 90 ff ff ff 	movabs $0xffffffffffff9079,%rcx
ffff800000109c2b:	ff ff ff 
ffff800000109c2e:	48 01 d9             	add    %rbx,%rcx
ffff800000109c31:	ff d1                	callq  *%rcx
ffff800000109c33:	90                   	nop
ffff800000109c34:	48 83 c4 40          	add    $0x40,%rsp
ffff800000109c38:	5b                   	pop    %rbx
ffff800000109c39:	41 5f                	pop    %r15
ffff800000109c3b:	5d                   	pop    %rbp
ffff800000109c3c:	c3                   	retq   

Disassembly of section .data:

ffff800000109c40 <LABEL_GDT64>:
	...

ffff800000109c48 <LABEL_DESC_KERNEL_CODE64>:
ffff800000109c48:	00 00                	add    %al,(%rax)
ffff800000109c4a:	00 00                	add    %al,(%rax)
ffff800000109c4c:	00 98 20 00      	add    %bl,0x20(%rax)

ffff800000109c50 <LABEL_DESC_KERNEL_DATA64>:
ffff800000109c50:	00 00                	add    %al,(%rax)
ffff800000109c52:	00 00                	add    %al,(%rax)
ffff800000109c54:	00 92 00 00      	add    %dl,0x0(%rdx)

ffff800000109c58 <LABEL_DESC_USER_CODE32>:
	...

ffff800000109c60 <LABEL_DESC_USER_DATA32>:
	...

ffff800000109c68 <LABEL_DESC_USER_CODE64>:
ffff800000109c68:	00 00                	add    %al,(%rax)
ffff800000109c6a:	00 00                	add    %al,(%rax)
ffff800000109c6c:	00 f8                	add    %bh,%al
ffff800000109c6e:	20 00                	and    %al,(%rax)

ffff800000109c70 <LABEL_DESC_USER_DATA64>:
ffff800000109c70:	00 00                	add    %al,(%rax)
ffff800000109c72:	00 00                	add    %al,(%rax)
ffff800000109c74:	00 f2                	add    %dh,%dl
	...

ffff800000109c78 <LABEL_DESC_KERNEL_CODE32>:
ffff800000109c78:	ff                   	(bad)  
ffff800000109c79:	ff 00                	incl   (%rax)
ffff800000109c7b:	00 00                	add    %al,(%rax)
ffff800000109c7d:	9a                   	(bad)  
ffff800000109c7e:	cf                   	iret   
	...

ffff800000109c80 <LABEL_DESC_KERNEL_DATA32>:
ffff800000109c80:	ff                   	(bad)  
ffff800000109c81:	ff 00                	incl   (%rax)
ffff800000109c83:	00 00                	add    %al,(%rax)
ffff800000109c85:	92                   	xchg   %eax,%edx
ffff800000109c86:	cf                   	iret   
	...

ffff800000109cd8 <GDT_END>:
ffff800000109cd8:	97                   	xchg   %eax,%edi
ffff800000109cd9:	00 40 9c             	add    %al,-0x64(%rax)
ffff800000109cdc:	10 00                	adc    %al,(%rax)
ffff800000109cde:	00 80 ff ff      	add    %al,0xffff(%rax)

ffff800000109ce2 <LABEL_IDT>:
	...

ffff80000010ace2 <IDT_END>:
ffff80000010ace2:	ff 0f                	decl   (%rdi)
ffff80000010ace4:	e2 9c                	loop   ffff80000010ac82 <LABEL_IDT+0xfa0>
ffff80000010ace6:	10 00                	adc    %al,(%rax)
ffff80000010ace8:	00 80 ff ff      	add    %al,0xffff(%rax)

ffff80000010acec <LABEL_TSS64>:
	...

ffff80000010ad54 <TSS64_END>:
ffff80000010ad54:	67 00 ec             	addr32 add %ch,%ah
ffff80000010ad57:	ac                   	lods   %ds:(%rsi),%al
ffff80000010ad58:	10 00                	adc    %al,(%rax)
ffff80000010ad5a:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)

ffff80000010ad60 <font_ascii>:
	...
ffff80000010af70:	00 10                	add    %dl,(%rax)
ffff80000010af72:	10 10                	adc    %dl,(%rax)
ffff80000010af74:	10 10                	adc    %dl,(%rax)
ffff80000010af76:	10 10                	adc    %dl,(%rax)
ffff80000010af78:	10 10                	adc    %dl,(%rax)
ffff80000010af7a:	00 00                	add    %al,(%rax)
ffff80000010af7c:	10 10                	adc    %dl,(%rax)
ffff80000010af7e:	00 00                	add    %al,(%rax)
ffff80000010af80:	28 28                	sub    %ch,(%rax)
ffff80000010af82:	28 00                	sub    %al,(%rax)
	...
ffff80000010af90:	00 44 44 44          	add    %al,0x44(%rsp,%rax,2)
ffff80000010af94:	fe 44 44 44          	incb   0x44(%rsp,%rax,2)
ffff80000010af98:	44                   	rex.R
ffff80000010af99:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010af9e:	00 00                	add    %al,(%rax)
ffff80000010afa0:	10 3a                	adc    %bh,(%rdx)
ffff80000010afa2:	56                   	push   %rsi
ffff80000010afa3:	92                   	xchg   %eax,%edx
ffff80000010afa4:	92                   	xchg   %eax,%edx
ffff80000010afa5:	90                   	nop
ffff80000010afa6:	50                   	push   %rax
ffff80000010afa7:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010afaa:	92                   	xchg   %eax,%edx
ffff80000010afab:	92                   	xchg   %eax,%edx
ffff80000010afac:	d4                   	(bad)  
ffff80000010afad:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010afb2:	94                   	xchg   %eax,%esp
ffff80000010afb3:	94                   	xchg   %eax,%esp
ffff80000010afb4:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010afb9:	2c 52                	sub    $0x52,%al
ffff80000010afbb:	52                   	push   %rdx
ffff80000010afbc:	92                   	xchg   %eax,%edx
ffff80000010afbd:	8c 00                	mov    %es,(%rax)
ffff80000010afbf:	00 00                	add    %al,(%rax)
ffff80000010afc1:	70 88                	jo     ffff80000010af4b <font_ascii+0x1eb>
ffff80000010afc3:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010afc9:	92                   	xchg   %eax,%edx
ffff80000010afca:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010afd1:	08 10                	or     %dl,(%rax)
	...
ffff80000010afdf:	00 02                	add    %al,(%rdx)
ffff80000010afe1:	04 08                	add    $0x8,%al
ffff80000010afe3:	08 10                	or     %dl,(%rax)
ffff80000010afe5:	10 10                	adc    %dl,(%rax)
ffff80000010afe7:	10 10                	adc    %dl,(%rax)
ffff80000010afe9:	10 10                	adc    %dl,(%rax)
ffff80000010afeb:	08 08                	or     %cl,(%rax)
ffff80000010afed:	04 02                	add    $0x2,%al
ffff80000010afef:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010aff5:	10 10                	adc    %dl,(%rax)
ffff80000010aff7:	10 10                	adc    %dl,(%rax)
ffff80000010aff9:	10 10                	adc    %dl,(%rax)
ffff80000010affb:	20 20                	and    %ah,(%rax)
ffff80000010affd:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010b001:	00 00                	add    %al,(%rax)
ffff80000010b003:	00 00                	add    %al,(%rax)
ffff80000010b005:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010b00b:	10 00                	adc    %al,(%rax)
	...
ffff80000010b015:	10 10                	adc    %dl,(%rax)
ffff80000010b017:	10 fe                	adc    %bh,%dh
ffff80000010b019:	10 10                	adc    %dl,(%rax)
ffff80000010b01b:	10 00                	adc    %al,(%rax)
	...
ffff80000010b029:	00 00                	add    %al,(%rax)
ffff80000010b02b:	18 18                	sbb    %bl,(%rax)
ffff80000010b02d:	08 08                	or     %cl,(%rax)
ffff80000010b02f:	10 00                	adc    %al,(%rax)
ffff80000010b031:	00 00                	add    %al,(%rax)
ffff80000010b033:	00 00                	add    %al,(%rax)
ffff80000010b035:	00 00                	add    %al,(%rax)
ffff80000010b037:	00 fe                	add    %bh,%dh
	...
ffff80000010b049:	00 00                	add    %al,(%rax)
ffff80000010b04b:	00 18                	add    %bl,(%rax)
ffff80000010b04d:	18 00                	sbb    %al,(%rax)
ffff80000010b04f:	00 02                	add    %al,(%rdx)
ffff80000010b051:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010b054:	08 08                	or     %cl,(%rax)
ffff80000010b056:	08 10                	or     %dl,(%rax)
ffff80000010b058:	10 20                	adc    %ah,(%rax)
ffff80000010b05a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010b05d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010b064:	42 
ffff80000010b065:	42                   	rex.X
ffff80000010b066:	42                   	rex.X
ffff80000010b067:	42                   	rex.X
ffff80000010b068:	42                   	rex.X
ffff80000010b069:	42                   	rex.X
ffff80000010b06a:	42 24 24             	rex.X and $0x24,%al
ffff80000010b06d:	18 00                	sbb    %al,(%rax)
ffff80000010b06f:	00 00                	add    %al,(%rax)
ffff80000010b071:	08 18                	or     %bl,(%rax)
ffff80000010b073:	28 08                	sub    %cl,(%rax)
ffff80000010b075:	08 08                	or     %cl,(%rax)
ffff80000010b077:	08 08                	or     %cl,(%rax)
ffff80000010b079:	08 08                	or     %cl,(%rax)
ffff80000010b07b:	08 08                	or     %cl,(%rax)
ffff80000010b07d:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010b080:	00 18                	add    %bl,(%rax)
ffff80000010b082:	24 42                	and    $0x42,%al
ffff80000010b084:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010b088:	10 20                	adc    %ah,(%rax)
ffff80000010b08a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010b08d:	7e 00                	jle    ffff80000010b08f <font_ascii+0x32f>
ffff80000010b08f:	00 00                	add    %al,(%rax)
ffff80000010b091:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010b094:	02 02                	add    (%rdx),%al
ffff80000010b096:	04 18                	add    $0x18,%al
ffff80000010b098:	04 02                	add    $0x2,%al
ffff80000010b09a:	02 42 24             	add    0x24(%rdx),%al
ffff80000010b09d:	18 00                	sbb    %al,(%rax)
ffff80000010b09f:	00 00                	add    %al,(%rax)
ffff80000010b0a1:	0c 0c                	or     $0xc,%al
ffff80000010b0a3:	0c 14                	or     $0x14,%al
ffff80000010b0a5:	14 14                	adc    $0x14,%al
ffff80000010b0a7:	24 24                	and    $0x24,%al
ffff80000010b0a9:	44 7e 04             	rex.R jle ffff80000010b0b0 <font_ascii+0x350>
ffff80000010b0ac:	04 1e                	add    $0x1e,%al
ffff80000010b0ae:	00 00                	add    %al,(%rax)
ffff80000010b0b0:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010b0b4:	40 58                	rex pop %rax
ffff80000010b0b6:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010b0b9:	02 02                	add    (%rdx),%al
ffff80000010b0bb:	42 24 18             	rex.X and $0x18,%al
ffff80000010b0be:	00 00                	add    %al,(%rax)
ffff80000010b0c0:	00 18                	add    %bl,(%rax)
ffff80000010b0c2:	24 42                	and    $0x42,%al
ffff80000010b0c4:	40 58                	rex pop %rax
ffff80000010b0c6:	64 42                	fs rex.X
ffff80000010b0c8:	42                   	rex.X
ffff80000010b0c9:	42                   	rex.X
ffff80000010b0ca:	42                   	rex.X
ffff80000010b0cb:	42 24 18             	rex.X and $0x18,%al
ffff80000010b0ce:	00 00                	add    %al,(%rax)
ffff80000010b0d0:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010b0d3:	42 04 04             	rex.X add $0x4,%al
ffff80000010b0d6:	08 08                	or     %cl,(%rax)
ffff80000010b0d8:	08 10                	or     %dl,(%rax)
ffff80000010b0da:	10 10                	adc    %dl,(%rax)
ffff80000010b0dc:	10 38                	adc    %bh,(%rax)
ffff80000010b0de:	00 00                	add    %al,(%rax)
ffff80000010b0e0:	00 18                	add    %bl,(%rax)
ffff80000010b0e2:	24 42                	and    $0x42,%al
ffff80000010b0e4:	42                   	rex.X
ffff80000010b0e5:	42 24 18             	rex.X and $0x18,%al
ffff80000010b0e8:	24 42                	and    $0x42,%al
ffff80000010b0ea:	42                   	rex.X
ffff80000010b0eb:	42 24 18             	rex.X and $0x18,%al
ffff80000010b0ee:	00 00                	add    %al,(%rax)
ffff80000010b0f0:	00 18                	add    %bl,(%rax)
ffff80000010b0f2:	24 42                	and    $0x42,%al
ffff80000010b0f4:	42                   	rex.X
ffff80000010b0f5:	42                   	rex.X
ffff80000010b0f6:	42                   	rex.X
ffff80000010b0f7:	42                   	rex.X
ffff80000010b0f8:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010b0fb:	42 24 18             	rex.X and $0x18,%al
ffff80000010b0fe:	00 00                	add    %al,(%rax)
ffff80000010b100:	00 00                	add    %al,(%rax)
ffff80000010b102:	00 00                	add    %al,(%rax)
ffff80000010b104:	00 18                	add    %bl,(%rax)
ffff80000010b106:	18 00                	sbb    %al,(%rax)
ffff80000010b108:	00 00                	add    %al,(%rax)
ffff80000010b10a:	00 00                	add    %al,(%rax)
ffff80000010b10c:	18 18                	sbb    %bl,(%rax)
ffff80000010b10e:	00 00                	add    %al,(%rax)
ffff80000010b110:	00 00                	add    %al,(%rax)
ffff80000010b112:	00 00                	add    %al,(%rax)
ffff80000010b114:	00 18                	add    %bl,(%rax)
ffff80000010b116:	18 00                	sbb    %al,(%rax)
ffff80000010b118:	00 00                	add    %al,(%rax)
ffff80000010b11a:	00 18                	add    %bl,(%rax)
ffff80000010b11c:	18 08                	sbb    %cl,(%rax)
ffff80000010b11e:	08 10                	or     %dl,(%rax)
ffff80000010b120:	00 02                	add    %al,(%rdx)
ffff80000010b122:	04 08                	add    $0x8,%al
ffff80000010b124:	10 20                	adc    %ah,(%rax)
ffff80000010b126:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010b12d:	04 
ffff80000010b12e:	02 00                	add    (%rax),%al
ffff80000010b130:	00 00                	add    %al,(%rax)
ffff80000010b132:	00 00                	add    %al,(%rax)
ffff80000010b134:	00 00                	add    %al,(%rax)
ffff80000010b136:	fe 00                	incb   (%rax)
ffff80000010b138:	00 fe                	add    %bh,%dh
ffff80000010b13a:	00 00                	add    %al,(%rax)
ffff80000010b13c:	00 00                	add    %al,(%rax)
ffff80000010b13e:	00 00                	add    %al,(%rax)
ffff80000010b140:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010b146:	04 02                	add    $0x2,%al
ffff80000010b148:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010b14b:	10 20                	adc    %ah,(%rax)
ffff80000010b14d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010b151:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010b155:	82                   	(bad)  
ffff80000010b156:	04 08                	add    $0x8,%al
ffff80000010b158:	10 10                	adc    %dl,(%rax)
ffff80000010b15a:	00 00                	add    %al,(%rax)
ffff80000010b15c:	18 18                	sbb    %bl,(%rax)
ffff80000010b15e:	00 00                	add    %al,(%rax)
ffff80000010b160:	00 38                	add    %bh,(%rax)
ffff80000010b162:	44 82                	rex.R (bad) 
ffff80000010b164:	9a                   	(bad)  
ffff80000010b165:	aa                   	stos   %al,%es:(%rdi)
ffff80000010b166:	aa                   	stos   %al,%es:(%rdi)
ffff80000010b167:	aa                   	stos   %al,%es:(%rdi)
ffff80000010b168:	aa                   	stos   %al,%es:(%rdi)
ffff80000010b169:	aa                   	stos   %al,%es:(%rdi)
ffff80000010b16a:	9c                   	pushfq 
ffff80000010b16b:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010b16f:	00 00                	add    %al,(%rax)
ffff80000010b171:	18 18                	sbb    %bl,(%rax)
ffff80000010b173:	18 18                	sbb    %bl,(%rax)
ffff80000010b175:	24 24                	and    $0x24,%al
ffff80000010b177:	24 24                	and    $0x24,%al
ffff80000010b179:	7e 42                	jle    ffff80000010b1bd <font_ascii+0x45d>
ffff80000010b17b:	42                   	rex.X
ffff80000010b17c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010b17f:	00 00                	add    %al,(%rax)
ffff80000010b181:	f0 48                	lock rex.W
ffff80000010b183:	44                   	rex.R
ffff80000010b184:	44                   	rex.R
ffff80000010b185:	44                   	rex.R
ffff80000010b186:	48 78 44             	rex.W js ffff80000010b1cd <font_ascii+0x46d>
ffff80000010b189:	42                   	rex.X
ffff80000010b18a:	42                   	rex.X
ffff80000010b18b:	42                   	rex.X
ffff80000010b18c:	44 f8                	rex.R clc 
ffff80000010b18e:	00 00                	add    %al,(%rax)
ffff80000010b190:	00 3a                	add    %bh,(%rdx)
ffff80000010b192:	46                   	rex.RX
ffff80000010b193:	42 82                	rex.X (bad) 
ffff80000010b195:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010b19c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010b19f:	00 00                	add    %al,(%rax)
ffff80000010b1a1:	f8                   	clc    
ffff80000010b1a2:	44                   	rex.R
ffff80000010b1a3:	44                   	rex.R
ffff80000010b1a4:	42                   	rex.X
ffff80000010b1a5:	42                   	rex.X
ffff80000010b1a6:	42                   	rex.X
ffff80000010b1a7:	42                   	rex.X
ffff80000010b1a8:	42                   	rex.X
ffff80000010b1a9:	42                   	rex.X
ffff80000010b1aa:	42                   	rex.X
ffff80000010b1ab:	44                   	rex.R
ffff80000010b1ac:	44 f8                	rex.R clc 
ffff80000010b1ae:	00 00                	add    %al,(%rax)
ffff80000010b1b0:	00 fe                	add    %bh,%dh
ffff80000010b1b2:	42                   	rex.X
ffff80000010b1b3:	42                   	rex.X
ffff80000010b1b4:	40                   	rex
ffff80000010b1b5:	40                   	rex
ffff80000010b1b6:	44 7c 44             	rex.R jl ffff80000010b1fd <font_ascii+0x49d>
ffff80000010b1b9:	40                   	rex
ffff80000010b1ba:	40                   	rex
ffff80000010b1bb:	42                   	rex.X
ffff80000010b1bc:	42 fe 00             	rex.X incb (%rax)
ffff80000010b1bf:	00 00                	add    %al,(%rax)
ffff80000010b1c1:	fe 42 42             	incb   0x42(%rdx)
ffff80000010b1c4:	40                   	rex
ffff80000010b1c5:	40                   	rex
ffff80000010b1c6:	44 7c 44             	rex.R jl ffff80000010b20d <font_ascii+0x4ad>
ffff80000010b1c9:	44                   	rex.R
ffff80000010b1ca:	40                   	rex
ffff80000010b1cb:	40                   	rex
ffff80000010b1cc:	40                   	rex
ffff80000010b1cd:	f0 00 00             	lock add %al,(%rax)
ffff80000010b1d0:	00 3a                	add    %bh,(%rdx)
ffff80000010b1d2:	46                   	rex.RX
ffff80000010b1d3:	42 82                	rex.X (bad) 
ffff80000010b1d5:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010b1dc:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010b1df:	00 00                	add    %al,(%rax)
ffff80000010b1e1:	e7 42                	out    %eax,$0x42
ffff80000010b1e3:	42                   	rex.X
ffff80000010b1e4:	42                   	rex.X
ffff80000010b1e5:	42                   	rex.X
ffff80000010b1e6:	42 7e 42             	rex.X jle ffff80000010b22b <font_ascii+0x4cb>
ffff80000010b1e9:	42                   	rex.X
ffff80000010b1ea:	42                   	rex.X
ffff80000010b1eb:	42                   	rex.X
ffff80000010b1ec:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010b1ef:	00 00                	add    %al,(%rax)
ffff80000010b1f1:	7c 10                	jl     ffff80000010b203 <font_ascii+0x4a3>
ffff80000010b1f3:	10 10                	adc    %dl,(%rax)
ffff80000010b1f5:	10 10                	adc    %dl,(%rax)
ffff80000010b1f7:	10 10                	adc    %dl,(%rax)
ffff80000010b1f9:	10 10                	adc    %dl,(%rax)
ffff80000010b1fb:	10 10                	adc    %dl,(%rax)
ffff80000010b1fd:	7c 00                	jl     ffff80000010b1ff <font_ascii+0x49f>
ffff80000010b1ff:	00 00                	add    %al,(%rax)
ffff80000010b201:	1f                   	(bad)  
ffff80000010b202:	04 04                	add    $0x4,%al
ffff80000010b204:	04 04                	add    $0x4,%al
ffff80000010b206:	04 04                	add    $0x4,%al
ffff80000010b208:	04 04                	add    $0x4,%al
ffff80000010b20a:	04 04                	add    $0x4,%al
ffff80000010b20c:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010b20f:	00 00                	add    %al,(%rax)
ffff80000010b211:	e7 42                	out    %eax,$0x42
ffff80000010b213:	44                   	rex.R
ffff80000010b214:	48 50                	rex.W push %rax
ffff80000010b216:	50                   	push   %rax
ffff80000010b217:	60                   	(bad)  
ffff80000010b218:	50                   	push   %rax
ffff80000010b219:	50                   	push   %rax
ffff80000010b21a:	48                   	rex.W
ffff80000010b21b:	44                   	rex.R
ffff80000010b21c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010b21f:	00 00                	add    %al,(%rax)
ffff80000010b221:	f0 40                	lock rex
ffff80000010b223:	40                   	rex
ffff80000010b224:	40                   	rex
ffff80000010b225:	40                   	rex
ffff80000010b226:	40                   	rex
ffff80000010b227:	40                   	rex
ffff80000010b228:	40                   	rex
ffff80000010b229:	40                   	rex
ffff80000010b22a:	40                   	rex
ffff80000010b22b:	42                   	rex.X
ffff80000010b22c:	42 fe 00             	rex.X incb (%rax)
ffff80000010b22f:	00 00                	add    %al,(%rax)
ffff80000010b231:	c3                   	retq   
ffff80000010b232:	42                   	rex.X
ffff80000010b233:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010b237:	5a                   	pop    %rdx
ffff80000010b238:	5a                   	pop    %rdx
ffff80000010b239:	42                   	rex.X
ffff80000010b23a:	42                   	rex.X
ffff80000010b23b:	42                   	rex.X
ffff80000010b23c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010b23f:	00 00                	add    %al,(%rax)
ffff80000010b241:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010b248:	4a                   	rex.WX
ffff80000010b249:	4a                   	rex.WX
ffff80000010b24a:	4a                   	rex.WX
ffff80000010b24b:	46                   	rex.RX
ffff80000010b24c:	46 e2 00             	rex.RX loop ffff80000010b24f <font_ascii+0x4ef>
ffff80000010b24f:	00 00                	add    %al,(%rax)
ffff80000010b251:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010b255:	82                   	(bad)  
ffff80000010b256:	82                   	(bad)  
ffff80000010b257:	82                   	(bad)  
ffff80000010b258:	82                   	(bad)  
ffff80000010b259:	82                   	(bad)  
ffff80000010b25a:	82                   	(bad)  
ffff80000010b25b:	82                   	(bad)  
ffff80000010b25c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010b25f:	00 00                	add    %al,(%rax)
ffff80000010b261:	f8                   	clc    
ffff80000010b262:	44                   	rex.R
ffff80000010b263:	42                   	rex.X
ffff80000010b264:	42                   	rex.X
ffff80000010b265:	42                   	rex.X
ffff80000010b266:	44 78 40             	rex.R js ffff80000010b2a9 <font_ascii+0x549>
ffff80000010b269:	40                   	rex
ffff80000010b26a:	40                   	rex
ffff80000010b26b:	40                   	rex
ffff80000010b26c:	40                   	rex
ffff80000010b26d:	f0 00 00             	lock add %al,(%rax)
ffff80000010b270:	00 38                	add    %bh,(%rax)
ffff80000010b272:	44 82                	rex.R (bad) 
ffff80000010b274:	82                   	(bad)  
ffff80000010b275:	82                   	(bad)  
ffff80000010b276:	82                   	(bad)  
ffff80000010b277:	82                   	(bad)  
ffff80000010b278:	82                   	(bad)  
ffff80000010b279:	82                   	(bad)  
ffff80000010b27a:	92                   	xchg   %eax,%edx
ffff80000010b27b:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010b27f:	00 00                	add    %al,(%rax)
ffff80000010b281:	fc                   	cld    
ffff80000010b282:	42                   	rex.X
ffff80000010b283:	42                   	rex.X
ffff80000010b284:	42                   	rex.X
ffff80000010b285:	42 7c 44             	rex.X jl ffff80000010b2cc <font_ascii+0x56c>
ffff80000010b288:	42                   	rex.X
ffff80000010b289:	42                   	rex.X
ffff80000010b28a:	42                   	rex.X
ffff80000010b28b:	42                   	rex.X
ffff80000010b28c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010b28f:	00 00                	add    %al,(%rax)
ffff80000010b291:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010b294:	82                   	(bad)  
ffff80000010b295:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010b299:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010b29f:	00 00                	add    %al,(%rax)
ffff80000010b2a1:	fe                   	(bad)  
ffff80000010b2a2:	92                   	xchg   %eax,%edx
ffff80000010b2a3:	92                   	xchg   %eax,%edx
ffff80000010b2a4:	10 10                	adc    %dl,(%rax)
ffff80000010b2a6:	10 10                	adc    %dl,(%rax)
ffff80000010b2a8:	10 10                	adc    %dl,(%rax)
ffff80000010b2aa:	10 10                	adc    %dl,(%rax)
ffff80000010b2ac:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010b2b0:	00 e7                	add    %ah,%bh
ffff80000010b2b2:	42                   	rex.X
ffff80000010b2b3:	42                   	rex.X
ffff80000010b2b4:	42                   	rex.X
ffff80000010b2b5:	42                   	rex.X
ffff80000010b2b6:	42                   	rex.X
ffff80000010b2b7:	42                   	rex.X
ffff80000010b2b8:	42                   	rex.X
ffff80000010b2b9:	42                   	rex.X
ffff80000010b2ba:	42                   	rex.X
ffff80000010b2bb:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010b2be:	00 00                	add    %al,(%rax)
ffff80000010b2c0:	00 e7                	add    %ah,%bh
ffff80000010b2c2:	42                   	rex.X
ffff80000010b2c3:	42                   	rex.X
ffff80000010b2c4:	42                   	rex.X
ffff80000010b2c5:	42 24 24             	rex.X and $0x24,%al
ffff80000010b2c8:	24 24                	and    $0x24,%al
ffff80000010b2ca:	18 18                	sbb    %bl,(%rax)
ffff80000010b2cc:	18 18                	sbb    %bl,(%rax)
ffff80000010b2ce:	00 00                	add    %al,(%rax)
ffff80000010b2d0:	00 e7                	add    %ah,%bh
ffff80000010b2d2:	42                   	rex.X
ffff80000010b2d3:	42                   	rex.X
ffff80000010b2d4:	42 5a                	rex.X pop %rdx
ffff80000010b2d6:	5a                   	pop    %rdx
ffff80000010b2d7:	5a                   	pop    %rdx
ffff80000010b2d8:	5a                   	pop    %rdx
ffff80000010b2d9:	24 24                	and    $0x24,%al
ffff80000010b2db:	24 24                	and    $0x24,%al
ffff80000010b2dd:	24 00                	and    $0x0,%al
ffff80000010b2df:	00 00                	add    %al,(%rax)
ffff80000010b2e1:	e7 42                	out    %eax,$0x42
ffff80000010b2e3:	42 24 24             	rex.X and $0x24,%al
ffff80000010b2e6:	24 18                	and    $0x18,%al
ffff80000010b2e8:	24 24                	and    $0x24,%al
ffff80000010b2ea:	24 42                	and    $0x42,%al
ffff80000010b2ec:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010b2ef:	00 00                	add    %al,(%rax)
ffff80000010b2f1:	ee                   	out    %al,(%dx)
ffff80000010b2f2:	44                   	rex.R
ffff80000010b2f3:	44                   	rex.R
ffff80000010b2f4:	44 28 28             	sub    %r13b,(%rax)
ffff80000010b2f7:	28 10                	sub    %dl,(%rax)
ffff80000010b2f9:	10 10                	adc    %dl,(%rax)
ffff80000010b2fb:	10 10                	adc    %dl,(%rax)
ffff80000010b2fd:	7c 00                	jl     ffff80000010b2ff <font_ascii+0x59f>
ffff80000010b2ff:	00 00                	add    %al,(%rax)
ffff80000010b301:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010b308:	20 20                	and    %ah,(%rax)
ffff80000010b30a:	40                   	rex
ffff80000010b30b:	42 82                	rex.X (bad) 
ffff80000010b30d:	fe 00                	incb   (%rax)
ffff80000010b30f:	00 00                	add    %al,(%rax)
ffff80000010b311:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010b314:	20 20                	and    %ah,(%rax)
ffff80000010b316:	20 20                	and    %ah,(%rax)
ffff80000010b318:	20 20                	and    %ah,(%rax)
ffff80000010b31a:	20 20                	and    %ah,(%rax)
ffff80000010b31c:	20 20                	and    %ah,(%rax)
ffff80000010b31e:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010b325:	20 20                	and    %ah,(%rax)
ffff80000010b327:	10 10                	adc    %dl,(%rax)
ffff80000010b329:	08 08                	or     %cl,(%rax)
ffff80000010b32b:	04 04                	add    $0x4,%al
ffff80000010b32d:	04 02                	add    $0x2,%al
ffff80000010b32f:	02 00                	add    (%rax),%al
ffff80000010b331:	7c 04                	jl     ffff80000010b337 <font_ascii+0x5d7>
ffff80000010b333:	04 04                	add    $0x4,%al
ffff80000010b335:	04 04                	add    $0x4,%al
ffff80000010b337:	04 04                	add    $0x4,%al
ffff80000010b339:	04 04                	add    $0x4,%al
ffff80000010b33b:	04 04                	add    $0x4,%al
ffff80000010b33d:	04 7c                	add    $0x7c,%al
ffff80000010b33f:	00 00                	add    %al,(%rax)
ffff80000010b341:	10 28                	adc    %ch,(%rax)
ffff80000010b343:	44 82                	rex.R (bad) 
	...
ffff80000010b35d:	00 fe                	add    %bh,%dh
ffff80000010b35f:	00 10                	add    %dl,(%rax)
ffff80000010b361:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010b374:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010b377:	04 3c                	add    $0x3c,%al
ffff80000010b379:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010b380:	c0 
ffff80000010b381:	40                   	rex
ffff80000010b382:	40                   	rex
ffff80000010b383:	40                   	rex
ffff80000010b384:	40 58                	rex pop %rax
ffff80000010b386:	64 42                	fs rex.X
ffff80000010b388:	42                   	rex.X
ffff80000010b389:	42                   	rex.X
ffff80000010b38a:	42                   	rex.X
ffff80000010b38b:	42                   	rex.X
ffff80000010b38c:	64 58                	fs pop %rax
ffff80000010b38e:	00 00                	add    %al,(%rax)
ffff80000010b390:	00 00                	add    %al,(%rax)
ffff80000010b392:	00 00                	add    %al,(%rax)
ffff80000010b394:	00 30                	add    %dh,(%rax)
ffff80000010b396:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010b39d:	38 
ffff80000010b39e:	00 00                	add    %al,(%rax)
ffff80000010b3a0:	0c 04                	or     $0x4,%al
ffff80000010b3a2:	04 04                	add    $0x4,%al
ffff80000010b3a4:	04 34                	add    $0x34,%al
ffff80000010b3a6:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010b3ad:	36 
ffff80000010b3ae:	00 00                	add    %al,(%rax)
ffff80000010b3b0:	00 00                	add    %al,(%rax)
ffff80000010b3b2:	00 00                	add    %al,(%rax)
ffff80000010b3b4:	00 38                	add    %bh,(%rax)
ffff80000010b3b6:	44 82                	rex.R (bad) 
ffff80000010b3b8:	82                   	(bad)  
ffff80000010b3b9:	fc                   	cld    
ffff80000010b3ba:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010b3c1:	10 10                	adc    %dl,(%rax)
ffff80000010b3c3:	10 10                	adc    %dl,(%rax)
ffff80000010b3c5:	7c 10                	jl     ffff80000010b3d7 <font_ascii+0x677>
ffff80000010b3c7:	10 10                	adc    %dl,(%rax)
ffff80000010b3c9:	10 10                	adc    %dl,(%rax)
ffff80000010b3cb:	10 10                	adc    %dl,(%rax)
ffff80000010b3cd:	7c 00                	jl     ffff80000010b3cf <font_ascii+0x66f>
ffff80000010b3cf:	00 00                	add    %al,(%rax)
ffff80000010b3d1:	00 00                	add    %al,(%rax)
ffff80000010b3d3:	00 00                	add    %al,(%rax)
ffff80000010b3d5:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010b3dc:	34 04 
ffff80000010b3de:	04 38                	add    $0x38,%al
ffff80000010b3e0:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010b3e4:	40 58                	rex pop %rax
ffff80000010b3e6:	64 42                	fs rex.X
ffff80000010b3e8:	42                   	rex.X
ffff80000010b3e9:	42                   	rex.X
ffff80000010b3ea:	42                   	rex.X
ffff80000010b3eb:	42                   	rex.X
ffff80000010b3ec:	42 e3 00             	rex.X jrcxz ffff80000010b3ef <font_ascii+0x68f>
ffff80000010b3ef:	00 00                	add    %al,(%rax)
ffff80000010b3f1:	10 10                	adc    %dl,(%rax)
ffff80000010b3f3:	00 00                	add    %al,(%rax)
ffff80000010b3f5:	30 10                	xor    %dl,(%rax)
ffff80000010b3f7:	10 10                	adc    %dl,(%rax)
ffff80000010b3f9:	10 10                	adc    %dl,(%rax)
ffff80000010b3fb:	10 10                	adc    %dl,(%rax)
ffff80000010b3fd:	38 00                	cmp    %al,(%rax)
ffff80000010b3ff:	00 00                	add    %al,(%rax)
ffff80000010b401:	04 04                	add    $0x4,%al
ffff80000010b403:	00 00                	add    %al,(%rax)
ffff80000010b405:	0c 04                	or     $0x4,%al
ffff80000010b407:	04 04                	add    $0x4,%al
ffff80000010b409:	04 04                	add    $0x4,%al
ffff80000010b40b:	04 04                	add    $0x4,%al
ffff80000010b40d:	08 08                	or     %cl,(%rax)
ffff80000010b40f:	30 c0                	xor    %al,%al
ffff80000010b411:	40                   	rex
ffff80000010b412:	40                   	rex
ffff80000010b413:	40                   	rex
ffff80000010b414:	40                   	rex
ffff80000010b415:	4e                   	rex.WRX
ffff80000010b416:	44                   	rex.R
ffff80000010b417:	48 50                	rex.W push %rax
ffff80000010b419:	60                   	(bad)  
ffff80000010b41a:	50                   	push   %rax
ffff80000010b41b:	48                   	rex.W
ffff80000010b41c:	44 e6 00             	rex.R out %al,$0x0
ffff80000010b41f:	00 30                	add    %dh,(%rax)
ffff80000010b421:	10 10                	adc    %dl,(%rax)
ffff80000010b423:	10 10                	adc    %dl,(%rax)
ffff80000010b425:	10 10                	adc    %dl,(%rax)
ffff80000010b427:	10 10                	adc    %dl,(%rax)
ffff80000010b429:	10 10                	adc    %dl,(%rax)
ffff80000010b42b:	10 10                	adc    %dl,(%rax)
ffff80000010b42d:	38 00                	cmp    %al,(%rax)
ffff80000010b42f:	00 00                	add    %al,(%rax)
ffff80000010b431:	00 00                	add    %al,(%rax)
ffff80000010b433:	00 00                	add    %al,(%rax)
ffff80000010b435:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010b439:	49                   	rex.WB
ffff80000010b43a:	49                   	rex.WB
ffff80000010b43b:	49                   	rex.WB
ffff80000010b43c:	49 db 00             	rex.WB fildl (%r8)
ffff80000010b43f:	00 00                	add    %al,(%rax)
ffff80000010b441:	00 00                	add    %al,(%rax)
ffff80000010b443:	00 00                	add    %al,(%rax)
ffff80000010b445:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010b449:	42                   	rex.X
ffff80000010b44a:	42                   	rex.X
ffff80000010b44b:	42                   	rex.X
ffff80000010b44c:	42 e3 00             	rex.X jrcxz ffff80000010b44f <font_ascii+0x6ef>
ffff80000010b44f:	00 00                	add    %al,(%rax)
ffff80000010b451:	00 00                	add    %al,(%rax)
ffff80000010b453:	00 00                	add    %al,(%rax)
ffff80000010b455:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010b459:	82                   	(bad)  
ffff80000010b45a:	82                   	(bad)  
ffff80000010b45b:	82                   	(bad)  
ffff80000010b45c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010b45f:	00 00                	add    %al,(%rax)
ffff80000010b461:	00 00                	add    %al,(%rax)
ffff80000010b463:	00 d8                	add    %bl,%al
ffff80000010b465:	64 42                	fs rex.X
ffff80000010b467:	42                   	rex.X
ffff80000010b468:	42                   	rex.X
ffff80000010b469:	42                   	rex.X
ffff80000010b46a:	42                   	rex.X
ffff80000010b46b:	64 58                	fs pop %rax
ffff80000010b46d:	40                   	rex
ffff80000010b46e:	40 e0 00             	rex loopne ffff80000010b471 <font_ascii+0x711>
ffff80000010b471:	00 00                	add    %al,(%rax)
ffff80000010b473:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010b476:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010b47d:	04 04                	add    $0x4,%al
ffff80000010b47f:	0e                   	(bad)  
ffff80000010b480:	00 00                	add    %al,(%rax)
ffff80000010b482:	00 00                	add    %al,(%rax)
ffff80000010b484:	00 dc                	add    %bl,%ah
ffff80000010b486:	62 42                	(bad)  
ffff80000010b488:	40                   	rex
ffff80000010b489:	40                   	rex
ffff80000010b48a:	40                   	rex
ffff80000010b48b:	40                   	rex
ffff80000010b48c:	40 e0 00             	rex loopne ffff80000010b48f <font_ascii+0x72f>
ffff80000010b48f:	00 00                	add    %al,(%rax)
ffff80000010b491:	00 00                	add    %al,(%rax)
ffff80000010b493:	00 00                	add    %al,(%rax)
ffff80000010b495:	7a 86                	jp     ffff80000010b41d <font_ascii+0x6bd>
ffff80000010b497:	82                   	(bad)  
ffff80000010b498:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010b49b:	82                   	(bad)  
ffff80000010b49c:	c2 bc 00             	retq   $0xbc
ffff80000010b49f:	00 00                	add    %al,(%rax)
ffff80000010b4a1:	00 10                	add    %dl,(%rax)
ffff80000010b4a3:	10 10                	adc    %dl,(%rax)
ffff80000010b4a5:	7c 10                	jl     ffff80000010b4b7 <font_ascii+0x757>
ffff80000010b4a7:	10 10                	adc    %dl,(%rax)
ffff80000010b4a9:	10 10                	adc    %dl,(%rax)
ffff80000010b4ab:	10 10                	adc    %dl,(%rax)
ffff80000010b4ad:	0e                   	(bad)  
ffff80000010b4ae:	00 00                	add    %al,(%rax)
ffff80000010b4b0:	00 00                	add    %al,(%rax)
ffff80000010b4b2:	00 00                	add    %al,(%rax)
ffff80000010b4b4:	00 c6                	add    %al,%dh
ffff80000010b4b6:	42                   	rex.X
ffff80000010b4b7:	42                   	rex.X
ffff80000010b4b8:	42                   	rex.X
ffff80000010b4b9:	42                   	rex.X
ffff80000010b4ba:	42                   	rex.X
ffff80000010b4bb:	42                   	rex.X
ffff80000010b4bc:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010b4bf:	00 00                	add    %al,(%rax)
ffff80000010b4c1:	00 00                	add    %al,(%rax)
ffff80000010b4c3:	00 00                	add    %al,(%rax)
ffff80000010b4c5:	e7 42                	out    %eax,$0x42
ffff80000010b4c7:	42                   	rex.X
ffff80000010b4c8:	42 24 24             	rex.X and $0x24,%al
ffff80000010b4cb:	24 18                	and    $0x18,%al
ffff80000010b4cd:	18 00                	sbb    %al,(%rax)
ffff80000010b4cf:	00 00                	add    %al,(%rax)
ffff80000010b4d1:	00 00                	add    %al,(%rax)
ffff80000010b4d3:	00 00                	add    %al,(%rax)
ffff80000010b4d5:	e7 42                	out    %eax,$0x42
ffff80000010b4d7:	42 5a                	rex.X pop %rdx
ffff80000010b4d9:	5a                   	pop    %rdx
ffff80000010b4da:	5a                   	pop    %rdx
ffff80000010b4db:	24 24                	and    $0x24,%al
ffff80000010b4dd:	24 00                	and    $0x0,%al
ffff80000010b4df:	00 00                	add    %al,(%rax)
ffff80000010b4e1:	00 00                	add    %al,(%rax)
ffff80000010b4e3:	00 00                	add    %al,(%rax)
ffff80000010b4e5:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010b4ea:	28 28                	sub    %ch,(%rax)
ffff80000010b4ec:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010b4f0:	00 00                	add    %al,(%rax)
ffff80000010b4f2:	00 00                	add    %al,(%rax)
ffff80000010b4f4:	00 e7                	add    %ah,%bh
ffff80000010b4f6:	42                   	rex.X
ffff80000010b4f7:	42 24 24             	rex.X and $0x24,%al
ffff80000010b4fa:	24 18                	and    $0x18,%al
ffff80000010b4fc:	18 10                	sbb    %dl,(%rax)
ffff80000010b4fe:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010b501:	00 00                	add    %al,(%rax)
ffff80000010b503:	00 00                	add    %al,(%rax)
ffff80000010b505:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010b50b:	42 82                	rex.X (bad) 
ffff80000010b50d:	fe 00                	incb   (%rax)
ffff80000010b50f:	00 00                	add    %al,(%rax)
ffff80000010b511:	06                   	(bad)  
ffff80000010b512:	08 10                	or     %dl,(%rax)
ffff80000010b514:	10 10                	adc    %dl,(%rax)
ffff80000010b516:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010b519:	10 10                	adc    %dl,(%rax)
ffff80000010b51b:	10 08                	adc    %cl,(%rax)
ffff80000010b51d:	06                   	(bad)  
ffff80000010b51e:	00 00                	add    %al,(%rax)
ffff80000010b520:	10 10                	adc    %dl,(%rax)
ffff80000010b522:	10 10                	adc    %dl,(%rax)
ffff80000010b524:	10 10                	adc    %dl,(%rax)
ffff80000010b526:	10 10                	adc    %dl,(%rax)
ffff80000010b528:	10 10                	adc    %dl,(%rax)
ffff80000010b52a:	10 10                	adc    %dl,(%rax)
ffff80000010b52c:	10 10                	adc    %dl,(%rax)
ffff80000010b52e:	10 10                	adc    %dl,(%rax)
ffff80000010b530:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010b533:	08 08                	or     %cl,(%rax)
ffff80000010b535:	08 08                	or     %cl,(%rax)
ffff80000010b537:	06                   	(bad)  
ffff80000010b538:	08 08                	or     %cl,(%rax)
ffff80000010b53a:	08 08                	or     %cl,(%rax)
ffff80000010b53c:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010b53f:	00 00                	add    %al,(%rax)
ffff80000010b541:	72 8c                	jb     ffff80000010b4cf <font_ascii+0x76f>
	...

Disassembly of section .got:

ffff80000010bd60 <.got>:
ffff80000010bd60:	64 40 10 00          	adc    %al,%fs:(%rax)
ffff80000010bd64:	00 80 ff ff dc 40    	add    %al,0x40dcffff(%rax)
ffff80000010bd6a:	10 00                	adc    %al,(%rax)
ffff80000010bd6c:	00 80 ff ff 3d 9c    	add    %al,-0x63c20001(%rax)
ffff80000010bd72:	10 00                	adc    %al,(%rax)
ffff80000010bd74:	00 80 ff ff e2 9c    	add    %al,-0x631d0001(%rax)
ffff80000010bd7a:	10 00                	adc    %al,(%rax)
ffff80000010bd7c:	00 80 ff ff f8 41    	add    %al,0x41f8ffff(%rax)
ffff80000010bd82:	10 00                	adc    %al,(%rax)
ffff80000010bd84:	00 80 ff ff ec ac    	add    %al,-0x53130001(%rax)
ffff80000010bd8a:	10 00                	adc    %al,(%rax)
ffff80000010bd8c:	00 80 ff ff 55 41    	add    %al,0x4155ffff(%rax)
ffff80000010bd92:	10 00                	adc    %al,(%rax)
ffff80000010bd94:	00 80 ff ff ec 40    	add    %al,0x40ecffff(%rax)
ffff80000010bd9a:	10 00                	adc    %al,(%rax)
ffff80000010bd9c:	00 80 ff ff 68 41    	add    %al,0x4168ffff(%rax)
ffff80000010bda2:	10 00                	adc    %al,(%rax)
ffff80000010bda4:	00 80 ff ff c5 41    	add    %al,0x41c5ffff(%rax)
ffff80000010bdaa:	10 00                	adc    %al,(%rax)
ffff80000010bdac:	00 80 ff ff d6 41    	add    %al,0x41d6ffff(%rax)
ffff80000010bdb2:	10 00                	adc    %al,(%rax)
ffff80000010bdb4:	00 80 ff ff e7 41    	add    %al,0x41e7ffff(%rax)
ffff80000010bdba:	10 00                	adc    %al,(%rax)
ffff80000010bdbc:	00 80 ff ff c0 ce    	add    %al,-0x313f0001(%rax)
ffff80000010bdc2:	10 00                	adc    %al,(%rax)
ffff80000010bdc4:	00 80 ff ff 42 41    	add    %al,0x4142ffff(%rax)
ffff80000010bdca:	10 00                	adc    %al,(%rax)
ffff80000010bdcc:	00 80 ff ff 7b 41    	add    %al,0x417bffff(%rax)
ffff80000010bdd2:	10 00                	adc    %al,(%rax)
ffff80000010bdd4:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bdda:	10 00                	adc    %al,(%rax)
ffff80000010bddc:	00 80 ff ff 2d 42    	add    %al,0x422dffff(%rax)
ffff80000010bde2:	10 00                	adc    %al,(%rax)
ffff80000010bde4:	00 80 ff ff 1a 42    	add    %al,0x421affff(%rax)
ffff80000010bdea:	10 00                	adc    %al,(%rax)
ffff80000010bdec:	00 80 ff ff a1 41    	add    %al,0x41a1ffff(%rax)
ffff80000010bdf2:	10 00                	adc    %al,(%rax)
ffff80000010bdf4:	00 80 ff ff 7f 01    	add    %al,0x17fffff(%rax)
ffff80000010bdfa:	10 00                	adc    %al,(%rax)
ffff80000010bdfc:	00 80 ff ff 64 42    	add    %al,0x4264ffff(%rax)
ffff80000010be02:	10 00                	adc    %al,(%rax)
ffff80000010be04:	00 80 ff ff 40 9c    	add    %al,-0x63bf0001(%rax)
ffff80000010be0a:	10 00                	adc    %al,(%rax)
ffff80000010be0c:	00 80 ff ff b2 41    	add    %al,0x41b2ffff(%rax)
ffff80000010be12:	10 00                	adc    %al,(%rax)
ffff80000010be14:	00 80 ff ff 60 bd    	add    %al,-0x429f0001(%rax)
ffff80000010be1a:	10 00                	adc    %al,(%rax)
ffff80000010be1c:	00 80 ff ff 09 42    	add    %al,0x4209ffff(%rax)
ffff80000010be22:	10 00                	adc    %al,(%rax)
ffff80000010be24:	00 80 ff ff 58 94    	add    %al,-0x6ba70001(%rax)
ffff80000010be2a:	12 00                	adc    (%rax),%al
ffff80000010be2c:	00 80 ff ff 3e 42    	add    %al,0x423effff(%rax)
ffff80000010be32:	10 00                	adc    %al,(%rax)
ffff80000010be34:	00 80 ff ff 60 91    	add    %al,-0x6e9f0001(%rax)
ffff80000010be3a:	12 00                	adc    (%rax),%al
ffff80000010be3c:	00 80 ff ff 51 42    	add    %al,0x4251ffff(%rax)
ffff80000010be42:	10 00                	adc    %al,(%rax)
ffff80000010be44:	00 80 ff ff 27 40    	add    %al,0x4027ffff(%rax)
ffff80000010be4a:	10 00                	adc    %al,(%rax)
ffff80000010be4c:	00 80 ff ff fc 40    	add    %al,0x40fcffff(%rax)
ffff80000010be52:	10 00                	adc    %al,(%rax)
ffff80000010be54:	00 80 ff ff 8e 41    	add    %al,0x418effff(%rax)
ffff80000010be5a:	10 00                	adc    %al,(%rax)
ffff80000010be5c:	00 80 ff ff d6 d7    	add    %al,-0x28290001(%rax)
ffff80000010be62:	10 00                	adc    %al,(%rax)
ffff80000010be64:	00                   	.byte 0x0
ffff80000010be65:	80 ff ff             	cmp    $0xff,%bh

Disassembly of section .got.plt:

ffff80000010be68 <_GLOBAL_OFFSET_TABLE_>:
	...

Disassembly of section .data.rel.local:

ffff80000010be80 <init_thread>:
ffff80000010be80:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010be86:	ff                   	(bad)  
ffff80000010be87:	ff 00                	incl   (%rax)
	...
ffff80000010be91:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010be94:	00 80 ff ff 10 00    	add    %al,0x10ffff(%rax)
ffff80000010be9a:	00 00                	add    %al,(%rax)
ffff80000010be9c:	00 00                	add    %al,(%rax)
ffff80000010be9e:	00 00                	add    %al,(%rax)
ffff80000010bea0:	10 00                	adc    %al,(%rax)
	...

ffff80000010bec0 <init_task>:
ffff80000010bec0:	00 00                	add    %al,(%rax)
ffff80000010bec2:	11 00                	adc    %eax,(%rax)
ffff80000010bec4:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...

ffff80000010bf00 <init_tss>:
ffff80000010bf00:	00 00                	add    %al,(%rax)
ffff80000010bf02:	00 00                	add    %al,(%rax)
ffff80000010bf04:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010bf0a:	ff                   	(bad)  
ffff80000010bf0b:	ff 00                	incl   (%rax)
ffff80000010bf0d:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010bf10:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010bf16:	11 00                	adc    %eax,(%rax)
ffff80000010bf18:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bf1e:	00 00                	add    %al,(%rax)
ffff80000010bf20:	00 00                	add    %al,(%rax)
ffff80000010bf22:	00 00                	add    %al,(%rax)
ffff80000010bf24:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bf28:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bf2e:	00 00                	add    %al,(%rax)
ffff80000010bf30:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bf36:	00 00                	add    %al,(%rax)
ffff80000010bf38:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bf3e:	00 00                	add    %al,(%rax)
ffff80000010bf40:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bf46:	00 00                	add    %al,(%rax)
ffff80000010bf48:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bf4e:	00 00                	add    %al,(%rax)
ffff80000010bf50:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bf56:	00 00                	add    %al,(%rax)
ffff80000010bf58:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bf6a:	00 00                	add    %al,(%rax)
ffff80000010bf6c:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010bf72:	ff                   	(bad)  
ffff80000010bf73:	ff 00                	incl   (%rax)
ffff80000010bf75:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010bf78:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010bf7e:	11 00                	adc    %eax,(%rax)
ffff80000010bf80:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bf86:	00 00                	add    %al,(%rax)
ffff80000010bf88:	00 00                	add    %al,(%rax)
ffff80000010bf8a:	00 00                	add    %al,(%rax)
ffff80000010bf8c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bf90:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bf96:	00 00                	add    %al,(%rax)
ffff80000010bf98:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bf9e:	00 00                	add    %al,(%rax)
ffff80000010bfa0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bfa6:	00 00                	add    %al,(%rax)
ffff80000010bfa8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bfae:	00 00                	add    %al,(%rax)
ffff80000010bfb0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bfb6:	00 00                	add    %al,(%rax)
ffff80000010bfb8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bfbe:	00 00                	add    %al,(%rax)
ffff80000010bfc0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bfd2:	00 00                	add    %al,(%rax)
ffff80000010bfd4:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010bfda:	ff                   	(bad)  
ffff80000010bfdb:	ff 00                	incl   (%rax)
ffff80000010bfdd:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010bfe0:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010bfe6:	11 00                	adc    %eax,(%rax)
ffff80000010bfe8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bfee:	00 00                	add    %al,(%rax)
ffff80000010bff0:	00 00                	add    %al,(%rax)
ffff80000010bff2:	00 00                	add    %al,(%rax)
ffff80000010bff4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bff8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bffe:	00 00                	add    %al,(%rax)
ffff80000010c000:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c006:	00 00                	add    %al,(%rax)
ffff80000010c008:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c00e:	00 00                	add    %al,(%rax)
ffff80000010c010:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c016:	00 00                	add    %al,(%rax)
ffff80000010c018:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c01e:	00 00                	add    %al,(%rax)
ffff80000010c020:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c026:	00 00                	add    %al,(%rax)
ffff80000010c028:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c03a:	00 00                	add    %al,(%rax)
ffff80000010c03c:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010c042:	ff                   	(bad)  
ffff80000010c043:	ff 00                	incl   (%rax)
ffff80000010c045:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010c048:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010c04e:	11 00                	adc    %eax,(%rax)
ffff80000010c050:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c056:	00 00                	add    %al,(%rax)
ffff80000010c058:	00 00                	add    %al,(%rax)
ffff80000010c05a:	00 00                	add    %al,(%rax)
ffff80000010c05c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010c060:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c066:	00 00                	add    %al,(%rax)
ffff80000010c068:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c06e:	00 00                	add    %al,(%rax)
ffff80000010c070:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c076:	00 00                	add    %al,(%rax)
ffff80000010c078:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c07e:	00 00                	add    %al,(%rax)
ffff80000010c080:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c086:	00 00                	add    %al,(%rax)
ffff80000010c088:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c08e:	00 00                	add    %al,(%rax)
ffff80000010c090:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c0a2:	00 00                	add    %al,(%rax)
ffff80000010c0a4:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010c0aa:	ff                   	(bad)  
ffff80000010c0ab:	ff 00                	incl   (%rax)
ffff80000010c0ad:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010c0b0:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010c0b6:	11 00                	adc    %eax,(%rax)
ffff80000010c0b8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c0be:	00 00                	add    %al,(%rax)
ffff80000010c0c0:	00 00                	add    %al,(%rax)
ffff80000010c0c2:	00 00                	add    %al,(%rax)
ffff80000010c0c4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010c0c8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c0ce:	00 00                	add    %al,(%rax)
ffff80000010c0d0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c0d6:	00 00                	add    %al,(%rax)
ffff80000010c0d8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c0de:	00 00                	add    %al,(%rax)
ffff80000010c0e0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c0e6:	00 00                	add    %al,(%rax)
ffff80000010c0e8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c0ee:	00 00                	add    %al,(%rax)
ffff80000010c0f0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c0f6:	00 00                	add    %al,(%rax)
ffff80000010c0f8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c10a:	00 00                	add    %al,(%rax)
ffff80000010c10c:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010c112:	ff                   	(bad)  
ffff80000010c113:	ff 00                	incl   (%rax)
ffff80000010c115:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010c118:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010c11e:	11 00                	adc    %eax,(%rax)
ffff80000010c120:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c126:	00 00                	add    %al,(%rax)
ffff80000010c128:	00 00                	add    %al,(%rax)
ffff80000010c12a:	00 00                	add    %al,(%rax)
ffff80000010c12c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010c130:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c136:	00 00                	add    %al,(%rax)
ffff80000010c138:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c13e:	00 00                	add    %al,(%rax)
ffff80000010c140:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c146:	00 00                	add    %al,(%rax)
ffff80000010c148:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c14e:	00 00                	add    %al,(%rax)
ffff80000010c150:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c156:	00 00                	add    %al,(%rax)
ffff80000010c158:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c15e:	00 00                	add    %al,(%rax)
ffff80000010c160:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c172:	00 00                	add    %al,(%rax)
ffff80000010c174:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010c17a:	ff                   	(bad)  
ffff80000010c17b:	ff 00                	incl   (%rax)
ffff80000010c17d:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010c180:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010c186:	11 00                	adc    %eax,(%rax)
ffff80000010c188:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c18e:	00 00                	add    %al,(%rax)
ffff80000010c190:	00 00                	add    %al,(%rax)
ffff80000010c192:	00 00                	add    %al,(%rax)
ffff80000010c194:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010c198:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c19e:	00 00                	add    %al,(%rax)
ffff80000010c1a0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c1a6:	00 00                	add    %al,(%rax)
ffff80000010c1a8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c1ae:	00 00                	add    %al,(%rax)
ffff80000010c1b0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c1b6:	00 00                	add    %al,(%rax)
ffff80000010c1b8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c1be:	00 00                	add    %al,(%rax)
ffff80000010c1c0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c1c6:	00 00                	add    %al,(%rax)
ffff80000010c1c8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c1da:	00 00                	add    %al,(%rax)
ffff80000010c1dc:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010c1e2:	ff                   	(bad)  
ffff80000010c1e3:	ff 00                	incl   (%rax)
ffff80000010c1e5:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010c1e8:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010c1ee:	11 00                	adc    %eax,(%rax)
ffff80000010c1f0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c1f6:	00 00                	add    %al,(%rax)
ffff80000010c1f8:	00 00                	add    %al,(%rax)
ffff80000010c1fa:	00 00                	add    %al,(%rax)
ffff80000010c1fc:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010c200:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c206:	00 00                	add    %al,(%rax)
ffff80000010c208:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c20e:	00 00                	add    %al,(%rax)
ffff80000010c210:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c216:	00 00                	add    %al,(%rax)
ffff80000010c218:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c21e:	00 00                	add    %al,(%rax)
ffff80000010c220:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c226:	00 00                	add    %al,(%rax)
ffff80000010c228:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c22e:	00 00                	add    %al,(%rax)
ffff80000010c230:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...

ffff80000010c240 <system_call_table>:
ffff80000010c240:	0d 46 10 00 00       	or     $0x1046,%eax
ffff80000010c245:	80 ff ff             	cmp    $0xff,%bh
ffff80000010c248:	7c 46                	jl     ffff80000010c290 <system_call_table+0x50>
ffff80000010c24a:	10 00                	adc    %al,(%rax)
ffff80000010c24c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c252:	10 00                	adc    %al,(%rax)
ffff80000010c254:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c25a:	10 00                	adc    %al,(%rax)
ffff80000010c25c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c262:	10 00                	adc    %al,(%rax)
ffff80000010c264:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c26a:	10 00                	adc    %al,(%rax)
ffff80000010c26c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c272:	10 00                	adc    %al,(%rax)
ffff80000010c274:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c27a:	10 00                	adc    %al,(%rax)
ffff80000010c27c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c282:	10 00                	adc    %al,(%rax)
ffff80000010c284:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c28a:	10 00                	adc    %al,(%rax)
ffff80000010c28c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c292:	10 00                	adc    %al,(%rax)
ffff80000010c294:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c29a:	10 00                	adc    %al,(%rax)
ffff80000010c29c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c2a2:	10 00                	adc    %al,(%rax)
ffff80000010c2a4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c2aa:	10 00                	adc    %al,(%rax)
ffff80000010c2ac:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c2b2:	10 00                	adc    %al,(%rax)
ffff80000010c2b4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c2ba:	10 00                	adc    %al,(%rax)
ffff80000010c2bc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c2c2:	10 00                	adc    %al,(%rax)
ffff80000010c2c4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c2ca:	10 00                	adc    %al,(%rax)
ffff80000010c2cc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c2d2:	10 00                	adc    %al,(%rax)
ffff80000010c2d4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c2da:	10 00                	adc    %al,(%rax)
ffff80000010c2dc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c2e2:	10 00                	adc    %al,(%rax)
ffff80000010c2e4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c2ea:	10 00                	adc    %al,(%rax)
ffff80000010c2ec:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c2f2:	10 00                	adc    %al,(%rax)
ffff80000010c2f4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c2fa:	10 00                	adc    %al,(%rax)
ffff80000010c2fc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c302:	10 00                	adc    %al,(%rax)
ffff80000010c304:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c30a:	10 00                	adc    %al,(%rax)
ffff80000010c30c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c312:	10 00                	adc    %al,(%rax)
ffff80000010c314:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c31a:	10 00                	adc    %al,(%rax)
ffff80000010c31c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c322:	10 00                	adc    %al,(%rax)
ffff80000010c324:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c32a:	10 00                	adc    %al,(%rax)
ffff80000010c32c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c332:	10 00                	adc    %al,(%rax)
ffff80000010c334:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c33a:	10 00                	adc    %al,(%rax)
ffff80000010c33c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c342:	10 00                	adc    %al,(%rax)
ffff80000010c344:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c34a:	10 00                	adc    %al,(%rax)
ffff80000010c34c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c352:	10 00                	adc    %al,(%rax)
ffff80000010c354:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c35a:	10 00                	adc    %al,(%rax)
ffff80000010c35c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c362:	10 00                	adc    %al,(%rax)
ffff80000010c364:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c36a:	10 00                	adc    %al,(%rax)
ffff80000010c36c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c372:	10 00                	adc    %al,(%rax)
ffff80000010c374:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c37a:	10 00                	adc    %al,(%rax)
ffff80000010c37c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c382:	10 00                	adc    %al,(%rax)
ffff80000010c384:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c38a:	10 00                	adc    %al,(%rax)
ffff80000010c38c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c392:	10 00                	adc    %al,(%rax)
ffff80000010c394:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c39a:	10 00                	adc    %al,(%rax)
ffff80000010c39c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c3a2:	10 00                	adc    %al,(%rax)
ffff80000010c3a4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c3aa:	10 00                	adc    %al,(%rax)
ffff80000010c3ac:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c3b2:	10 00                	adc    %al,(%rax)
ffff80000010c3b4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c3ba:	10 00                	adc    %al,(%rax)
ffff80000010c3bc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c3c2:	10 00                	adc    %al,(%rax)
ffff80000010c3c4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c3ca:	10 00                	adc    %al,(%rax)
ffff80000010c3cc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c3d2:	10 00                	adc    %al,(%rax)
ffff80000010c3d4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c3da:	10 00                	adc    %al,(%rax)
ffff80000010c3dc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c3e2:	10 00                	adc    %al,(%rax)
ffff80000010c3e4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c3ea:	10 00                	adc    %al,(%rax)
ffff80000010c3ec:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c3f2:	10 00                	adc    %al,(%rax)
ffff80000010c3f4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c3fa:	10 00                	adc    %al,(%rax)
ffff80000010c3fc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c402:	10 00                	adc    %al,(%rax)
ffff80000010c404:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c40a:	10 00                	adc    %al,(%rax)
ffff80000010c40c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c412:	10 00                	adc    %al,(%rax)
ffff80000010c414:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c41a:	10 00                	adc    %al,(%rax)
ffff80000010c41c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c422:	10 00                	adc    %al,(%rax)
ffff80000010c424:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c42a:	10 00                	adc    %al,(%rax)
ffff80000010c42c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c432:	10 00                	adc    %al,(%rax)
ffff80000010c434:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c43a:	10 00                	adc    %al,(%rax)
ffff80000010c43c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c442:	10 00                	adc    %al,(%rax)
ffff80000010c444:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c44a:	10 00                	adc    %al,(%rax)
ffff80000010c44c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c452:	10 00                	adc    %al,(%rax)
ffff80000010c454:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c45a:	10 00                	adc    %al,(%rax)
ffff80000010c45c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c462:	10 00                	adc    %al,(%rax)
ffff80000010c464:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c46a:	10 00                	adc    %al,(%rax)
ffff80000010c46c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c472:	10 00                	adc    %al,(%rax)
ffff80000010c474:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c47a:	10 00                	adc    %al,(%rax)
ffff80000010c47c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c482:	10 00                	adc    %al,(%rax)
ffff80000010c484:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c48a:	10 00                	adc    %al,(%rax)
ffff80000010c48c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c492:	10 00                	adc    %al,(%rax)
ffff80000010c494:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c49a:	10 00                	adc    %al,(%rax)
ffff80000010c49c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c4a2:	10 00                	adc    %al,(%rax)
ffff80000010c4a4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c4aa:	10 00                	adc    %al,(%rax)
ffff80000010c4ac:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c4b2:	10 00                	adc    %al,(%rax)
ffff80000010c4b4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c4ba:	10 00                	adc    %al,(%rax)
ffff80000010c4bc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c4c2:	10 00                	adc    %al,(%rax)
ffff80000010c4c4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c4ca:	10 00                	adc    %al,(%rax)
ffff80000010c4cc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c4d2:	10 00                	adc    %al,(%rax)
ffff80000010c4d4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c4da:	10 00                	adc    %al,(%rax)
ffff80000010c4dc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c4e2:	10 00                	adc    %al,(%rax)
ffff80000010c4e4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c4ea:	10 00                	adc    %al,(%rax)
ffff80000010c4ec:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c4f2:	10 00                	adc    %al,(%rax)
ffff80000010c4f4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c4fa:	10 00                	adc    %al,(%rax)
ffff80000010c4fc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c502:	10 00                	adc    %al,(%rax)
ffff80000010c504:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c50a:	10 00                	adc    %al,(%rax)
ffff80000010c50c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c512:	10 00                	adc    %al,(%rax)
ffff80000010c514:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c51a:	10 00                	adc    %al,(%rax)
ffff80000010c51c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c522:	10 00                	adc    %al,(%rax)
ffff80000010c524:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c52a:	10 00                	adc    %al,(%rax)
ffff80000010c52c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c532:	10 00                	adc    %al,(%rax)
ffff80000010c534:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c53a:	10 00                	adc    %al,(%rax)
ffff80000010c53c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c542:	10 00                	adc    %al,(%rax)
ffff80000010c544:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c54a:	10 00                	adc    %al,(%rax)
ffff80000010c54c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c552:	10 00                	adc    %al,(%rax)
ffff80000010c554:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c55a:	10 00                	adc    %al,(%rax)
ffff80000010c55c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c562:	10 00                	adc    %al,(%rax)
ffff80000010c564:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c56a:	10 00                	adc    %al,(%rax)
ffff80000010c56c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c572:	10 00                	adc    %al,(%rax)
ffff80000010c574:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c57a:	10 00                	adc    %al,(%rax)
ffff80000010c57c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c582:	10 00                	adc    %al,(%rax)
ffff80000010c584:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c58a:	10 00                	adc    %al,(%rax)
ffff80000010c58c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c592:	10 00                	adc    %al,(%rax)
ffff80000010c594:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c59a:	10 00                	adc    %al,(%rax)
ffff80000010c59c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c5a2:	10 00                	adc    %al,(%rax)
ffff80000010c5a4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c5aa:	10 00                	adc    %al,(%rax)
ffff80000010c5ac:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c5b2:	10 00                	adc    %al,(%rax)
ffff80000010c5b4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c5ba:	10 00                	adc    %al,(%rax)
ffff80000010c5bc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c5c2:	10 00                	adc    %al,(%rax)
ffff80000010c5c4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c5ca:	10 00                	adc    %al,(%rax)
ffff80000010c5cc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c5d2:	10 00                	adc    %al,(%rax)
ffff80000010c5d4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c5da:	10 00                	adc    %al,(%rax)
ffff80000010c5dc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c5e2:	10 00                	adc    %al,(%rax)
ffff80000010c5e4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c5ea:	10 00                	adc    %al,(%rax)
ffff80000010c5ec:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c5f2:	10 00                	adc    %al,(%rax)
ffff80000010c5f4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c5fa:	10 00                	adc    %al,(%rax)
ffff80000010c5fc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c602:	10 00                	adc    %al,(%rax)
ffff80000010c604:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c60a:	10 00                	adc    %al,(%rax)
ffff80000010c60c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c612:	10 00                	adc    %al,(%rax)
ffff80000010c614:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c61a:	10 00                	adc    %al,(%rax)
ffff80000010c61c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c622:	10 00                	adc    %al,(%rax)
ffff80000010c624:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c62a:	10 00                	adc    %al,(%rax)
ffff80000010c62c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c632:	10 00                	adc    %al,(%rax)
ffff80000010c634:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010c63a:	10 00                	adc    %al,(%rax)
ffff80000010c63c:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010c642:	11 00                	adc    %eax,(%rax)
ffff80000010c644:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c64a:	00 00                	add    %al,(%rax)
ffff80000010c64c:	00 00                	add    %al,(%rax)
ffff80000010c64e:	00 00                	add    %al,(%rax)
ffff80000010c650:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010c656:	ff                   	(bad)  
ffff80000010c657:	ff 10                	callq  *(%rax)
ffff80000010c659:	00 00                	add    %al,(%rax)
ffff80000010c65b:	00 00                	add    %al,(%rax)
ffff80000010c65d:	00 00                	add    %al,(%rax)
ffff80000010c65f:	00 10                	add    %dl,(%rax)
	...
ffff80000010c681:	00 11                	add    %dl,(%rcx)
ffff80000010c683:	00 00                	add    %al,(%rax)
ffff80000010c685:	80 ff ff             	cmp    $0xff,%bh
	...
ffff80000010c6c4:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010c6ca:	ff                   	(bad)  
ffff80000010c6cb:	ff 00                	incl   (%rax)
ffff80000010c6cd:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010c6d0:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010c6d6:	11 00                	adc    %eax,(%rax)
ffff80000010c6d8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c6de:	00 00                	add    %al,(%rax)
ffff80000010c6e0:	00 00                	add    %al,(%rax)
ffff80000010c6e2:	00 00                	add    %al,(%rax)
ffff80000010c6e4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010c6e8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c6ee:	00 00                	add    %al,(%rax)
ffff80000010c6f0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c6f6:	00 00                	add    %al,(%rax)
ffff80000010c6f8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c6fe:	00 00                	add    %al,(%rax)
ffff80000010c700:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c706:	00 00                	add    %al,(%rax)
ffff80000010c708:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c70e:	00 00                	add    %al,(%rax)
ffff80000010c710:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c716:	00 00                	add    %al,(%rax)
ffff80000010c718:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c72a:	00 00                	add    %al,(%rax)
ffff80000010c72c:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010c732:	ff                   	(bad)  
ffff80000010c733:	ff 00                	incl   (%rax)
ffff80000010c735:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010c738:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010c73e:	11 00                	adc    %eax,(%rax)
ffff80000010c740:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c746:	00 00                	add    %al,(%rax)
ffff80000010c748:	00 00                	add    %al,(%rax)
ffff80000010c74a:	00 00                	add    %al,(%rax)
ffff80000010c74c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010c750:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c756:	00 00                	add    %al,(%rax)
ffff80000010c758:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c75e:	00 00                	add    %al,(%rax)
ffff80000010c760:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c766:	00 00                	add    %al,(%rax)
ffff80000010c768:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c76e:	00 00                	add    %al,(%rax)
ffff80000010c770:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c776:	00 00                	add    %al,(%rax)
ffff80000010c778:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c77e:	00 00                	add    %al,(%rax)
ffff80000010c780:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c792:	00 00                	add    %al,(%rax)
ffff80000010c794:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010c79a:	ff                   	(bad)  
ffff80000010c79b:	ff 00                	incl   (%rax)
ffff80000010c79d:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010c7a0:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010c7a6:	11 00                	adc    %eax,(%rax)
ffff80000010c7a8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c7ae:	00 00                	add    %al,(%rax)
ffff80000010c7b0:	00 00                	add    %al,(%rax)
ffff80000010c7b2:	00 00                	add    %al,(%rax)
ffff80000010c7b4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010c7b8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c7be:	00 00                	add    %al,(%rax)
ffff80000010c7c0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c7c6:	00 00                	add    %al,(%rax)
ffff80000010c7c8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c7ce:	00 00                	add    %al,(%rax)
ffff80000010c7d0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c7d6:	00 00                	add    %al,(%rax)
ffff80000010c7d8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c7de:	00 00                	add    %al,(%rax)
ffff80000010c7e0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c7e6:	00 00                	add    %al,(%rax)
ffff80000010c7e8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c7fa:	00 00                	add    %al,(%rax)
ffff80000010c7fc:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010c802:	ff                   	(bad)  
ffff80000010c803:	ff 00                	incl   (%rax)
ffff80000010c805:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010c808:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010c80e:	11 00                	adc    %eax,(%rax)
ffff80000010c810:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c816:	00 00                	add    %al,(%rax)
ffff80000010c818:	00 00                	add    %al,(%rax)
ffff80000010c81a:	00 00                	add    %al,(%rax)
ffff80000010c81c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010c820:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c826:	00 00                	add    %al,(%rax)
ffff80000010c828:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c82e:	00 00                	add    %al,(%rax)
ffff80000010c830:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c836:	00 00                	add    %al,(%rax)
ffff80000010c838:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c83e:	00 00                	add    %al,(%rax)
ffff80000010c840:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c846:	00 00                	add    %al,(%rax)
ffff80000010c848:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c84e:	00 00                	add    %al,(%rax)
ffff80000010c850:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c862:	00 00                	add    %al,(%rax)
ffff80000010c864:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010c86a:	ff                   	(bad)  
ffff80000010c86b:	ff 00                	incl   (%rax)
ffff80000010c86d:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010c870:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010c876:	11 00                	adc    %eax,(%rax)
ffff80000010c878:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c87e:	00 00                	add    %al,(%rax)
ffff80000010c880:	00 00                	add    %al,(%rax)
ffff80000010c882:	00 00                	add    %al,(%rax)
ffff80000010c884:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010c888:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c88e:	00 00                	add    %al,(%rax)
ffff80000010c890:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c896:	00 00                	add    %al,(%rax)
ffff80000010c898:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c89e:	00 00                	add    %al,(%rax)
ffff80000010c8a0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c8a6:	00 00                	add    %al,(%rax)
ffff80000010c8a8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c8ae:	00 00                	add    %al,(%rax)
ffff80000010c8b0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c8b6:	00 00                	add    %al,(%rax)
ffff80000010c8b8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c8ca:	00 00                	add    %al,(%rax)
ffff80000010c8cc:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010c8d2:	ff                   	(bad)  
ffff80000010c8d3:	ff 00                	incl   (%rax)
ffff80000010c8d5:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010c8d8:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010c8de:	11 00                	adc    %eax,(%rax)
ffff80000010c8e0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c8e6:	00 00                	add    %al,(%rax)
ffff80000010c8e8:	00 00                	add    %al,(%rax)
ffff80000010c8ea:	00 00                	add    %al,(%rax)
ffff80000010c8ec:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010c8f0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c8f6:	00 00                	add    %al,(%rax)
ffff80000010c8f8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c8fe:	00 00                	add    %al,(%rax)
ffff80000010c900:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c906:	00 00                	add    %al,(%rax)
ffff80000010c908:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c90e:	00 00                	add    %al,(%rax)
ffff80000010c910:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c916:	00 00                	add    %al,(%rax)
ffff80000010c918:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c91e:	00 00                	add    %al,(%rax)
ffff80000010c920:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c932:	00 00                	add    %al,(%rax)
ffff80000010c934:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010c93a:	ff                   	(bad)  
ffff80000010c93b:	ff 00                	incl   (%rax)
ffff80000010c93d:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010c940:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010c946:	11 00                	adc    %eax,(%rax)
ffff80000010c948:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c94e:	00 00                	add    %al,(%rax)
ffff80000010c950:	00 00                	add    %al,(%rax)
ffff80000010c952:	00 00                	add    %al,(%rax)
ffff80000010c954:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010c958:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c95e:	00 00                	add    %al,(%rax)
ffff80000010c960:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c966:	00 00                	add    %al,(%rax)
ffff80000010c968:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c96e:	00 00                	add    %al,(%rax)
ffff80000010c970:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c976:	00 00                	add    %al,(%rax)
ffff80000010c978:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c97e:	00 00                	add    %al,(%rax)
ffff80000010c980:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c986:	00 00                	add    %al,(%rax)
ffff80000010c988:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c99a:	00 00                	add    %al,(%rax)
ffff80000010c99c:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010c9a2:	ff                   	(bad)  
ffff80000010c9a3:	ff 00                	incl   (%rax)
ffff80000010c9a5:	80 11 00             	adcb   $0x0,(%rcx)
ffff80000010c9a8:	00 80 ff ff 00 80    	add    %al,-0x7fff0001(%rax)
ffff80000010c9ae:	11 00                	adc    %eax,(%rax)
ffff80000010c9b0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c9b6:	00 00                	add    %al,(%rax)
ffff80000010c9b8:	00 00                	add    %al,(%rax)
ffff80000010c9ba:	00 00                	add    %al,(%rax)
ffff80000010c9bc:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010c9c0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c9c6:	00 00                	add    %al,(%rax)
ffff80000010c9c8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c9ce:	00 00                	add    %al,(%rax)
ffff80000010c9d0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c9d6:	00 00                	add    %al,(%rax)
ffff80000010c9d8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c9de:	00 00                	add    %al,(%rax)
ffff80000010c9e0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c9e6:	00 00                	add    %al,(%rax)
ffff80000010c9e8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c9ee:	00 00                	add    %al,(%rax)
ffff80000010c9f0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c9fe:	00 00                	add    %al,(%rax)
ffff80000010ca00:	0d 46 10 00 00       	or     $0x1046,%eax
ffff80000010ca05:	80 ff ff             	cmp    $0xff,%bh
ffff80000010ca08:	7c 46                	jl     ffff80000010ca50 <system_call_table+0x810>
ffff80000010ca0a:	10 00                	adc    %al,(%rax)
ffff80000010ca0c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ca12:	10 00                	adc    %al,(%rax)
ffff80000010ca14:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ca1a:	10 00                	adc    %al,(%rax)
ffff80000010ca1c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ca22:	10 00                	adc    %al,(%rax)
ffff80000010ca24:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ca2a:	10 00                	adc    %al,(%rax)
ffff80000010ca2c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ca32:	10 00                	adc    %al,(%rax)
ffff80000010ca34:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ca3a:	10 00                	adc    %al,(%rax)
ffff80000010ca3c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ca42:	10 00                	adc    %al,(%rax)
ffff80000010ca44:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ca4a:	10 00                	adc    %al,(%rax)
ffff80000010ca4c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ca52:	10 00                	adc    %al,(%rax)
ffff80000010ca54:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ca5a:	10 00                	adc    %al,(%rax)
ffff80000010ca5c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ca62:	10 00                	adc    %al,(%rax)
ffff80000010ca64:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ca6a:	10 00                	adc    %al,(%rax)
ffff80000010ca6c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ca72:	10 00                	adc    %al,(%rax)
ffff80000010ca74:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ca7a:	10 00                	adc    %al,(%rax)
ffff80000010ca7c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ca82:	10 00                	adc    %al,(%rax)
ffff80000010ca84:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ca8a:	10 00                	adc    %al,(%rax)
ffff80000010ca8c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ca92:	10 00                	adc    %al,(%rax)
ffff80000010ca94:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ca9a:	10 00                	adc    %al,(%rax)
ffff80000010ca9c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010caa2:	10 00                	adc    %al,(%rax)
ffff80000010caa4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010caaa:	10 00                	adc    %al,(%rax)
ffff80000010caac:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cab2:	10 00                	adc    %al,(%rax)
ffff80000010cab4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010caba:	10 00                	adc    %al,(%rax)
ffff80000010cabc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cac2:	10 00                	adc    %al,(%rax)
ffff80000010cac4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010caca:	10 00                	adc    %al,(%rax)
ffff80000010cacc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cad2:	10 00                	adc    %al,(%rax)
ffff80000010cad4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cada:	10 00                	adc    %al,(%rax)
ffff80000010cadc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cae2:	10 00                	adc    %al,(%rax)
ffff80000010cae4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010caea:	10 00                	adc    %al,(%rax)
ffff80000010caec:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010caf2:	10 00                	adc    %al,(%rax)
ffff80000010caf4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cafa:	10 00                	adc    %al,(%rax)
ffff80000010cafc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cb02:	10 00                	adc    %al,(%rax)
ffff80000010cb04:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cb0a:	10 00                	adc    %al,(%rax)
ffff80000010cb0c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cb12:	10 00                	adc    %al,(%rax)
ffff80000010cb14:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cb1a:	10 00                	adc    %al,(%rax)
ffff80000010cb1c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cb22:	10 00                	adc    %al,(%rax)
ffff80000010cb24:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cb2a:	10 00                	adc    %al,(%rax)
ffff80000010cb2c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cb32:	10 00                	adc    %al,(%rax)
ffff80000010cb34:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cb3a:	10 00                	adc    %al,(%rax)
ffff80000010cb3c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cb42:	10 00                	adc    %al,(%rax)
ffff80000010cb44:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cb4a:	10 00                	adc    %al,(%rax)
ffff80000010cb4c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cb52:	10 00                	adc    %al,(%rax)
ffff80000010cb54:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cb5a:	10 00                	adc    %al,(%rax)
ffff80000010cb5c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cb62:	10 00                	adc    %al,(%rax)
ffff80000010cb64:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cb6a:	10 00                	adc    %al,(%rax)
ffff80000010cb6c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cb72:	10 00                	adc    %al,(%rax)
ffff80000010cb74:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cb7a:	10 00                	adc    %al,(%rax)
ffff80000010cb7c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cb82:	10 00                	adc    %al,(%rax)
ffff80000010cb84:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cb8a:	10 00                	adc    %al,(%rax)
ffff80000010cb8c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cb92:	10 00                	adc    %al,(%rax)
ffff80000010cb94:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cb9a:	10 00                	adc    %al,(%rax)
ffff80000010cb9c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cba2:	10 00                	adc    %al,(%rax)
ffff80000010cba4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cbaa:	10 00                	adc    %al,(%rax)
ffff80000010cbac:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cbb2:	10 00                	adc    %al,(%rax)
ffff80000010cbb4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cbba:	10 00                	adc    %al,(%rax)
ffff80000010cbbc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cbc2:	10 00                	adc    %al,(%rax)
ffff80000010cbc4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cbca:	10 00                	adc    %al,(%rax)
ffff80000010cbcc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cbd2:	10 00                	adc    %al,(%rax)
ffff80000010cbd4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cbda:	10 00                	adc    %al,(%rax)
ffff80000010cbdc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cbe2:	10 00                	adc    %al,(%rax)
ffff80000010cbe4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cbea:	10 00                	adc    %al,(%rax)
ffff80000010cbec:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cbf2:	10 00                	adc    %al,(%rax)
ffff80000010cbf4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cbfa:	10 00                	adc    %al,(%rax)
ffff80000010cbfc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cc02:	10 00                	adc    %al,(%rax)
ffff80000010cc04:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cc0a:	10 00                	adc    %al,(%rax)
ffff80000010cc0c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cc12:	10 00                	adc    %al,(%rax)
ffff80000010cc14:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cc1a:	10 00                	adc    %al,(%rax)
ffff80000010cc1c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cc22:	10 00                	adc    %al,(%rax)
ffff80000010cc24:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cc2a:	10 00                	adc    %al,(%rax)
ffff80000010cc2c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cc32:	10 00                	adc    %al,(%rax)
ffff80000010cc34:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cc3a:	10 00                	adc    %al,(%rax)
ffff80000010cc3c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cc42:	10 00                	adc    %al,(%rax)
ffff80000010cc44:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cc4a:	10 00                	adc    %al,(%rax)
ffff80000010cc4c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cc52:	10 00                	adc    %al,(%rax)
ffff80000010cc54:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cc5a:	10 00                	adc    %al,(%rax)
ffff80000010cc5c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cc62:	10 00                	adc    %al,(%rax)
ffff80000010cc64:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cc6a:	10 00                	adc    %al,(%rax)
ffff80000010cc6c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cc72:	10 00                	adc    %al,(%rax)
ffff80000010cc74:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cc7a:	10 00                	adc    %al,(%rax)
ffff80000010cc7c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cc82:	10 00                	adc    %al,(%rax)
ffff80000010cc84:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cc8a:	10 00                	adc    %al,(%rax)
ffff80000010cc8c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cc92:	10 00                	adc    %al,(%rax)
ffff80000010cc94:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cc9a:	10 00                	adc    %al,(%rax)
ffff80000010cc9c:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cca2:	10 00                	adc    %al,(%rax)
ffff80000010cca4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ccaa:	10 00                	adc    %al,(%rax)
ffff80000010ccac:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ccb2:	10 00                	adc    %al,(%rax)
ffff80000010ccb4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ccba:	10 00                	adc    %al,(%rax)
ffff80000010ccbc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ccc2:	10 00                	adc    %al,(%rax)
ffff80000010ccc4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ccca:	10 00                	adc    %al,(%rax)
ffff80000010cccc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ccd2:	10 00                	adc    %al,(%rax)
ffff80000010ccd4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ccda:	10 00                	adc    %al,(%rax)
ffff80000010ccdc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cce2:	10 00                	adc    %al,(%rax)
ffff80000010cce4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ccea:	10 00                	adc    %al,(%rax)
ffff80000010ccec:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ccf2:	10 00                	adc    %al,(%rax)
ffff80000010ccf4:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010ccfa:	10 00                	adc    %al,(%rax)
ffff80000010ccfc:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
ffff80000010cd02:	10 00                	adc    %al,(%rax)
ffff80000010cd04:	00 80 ff ff 0d 46    	add    %al,0x460dffff(%rax)
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
ffff80000010cdfc:	00                   	.byte 0x0
ffff80000010cdfd:	80 ff ff             	cmp    $0xff,%bh

Disassembly of section .data.rel:

ffff80000010ce00 <interrupt>:
ffff80000010ce00:	42 80 10 00          	rex.X adcb $0x0,(%rax)
ffff80000010ce04:	00 80 ff ff 8c 80    	add    %al,-0x7f730001(%rax)
ffff80000010ce0a:	10 00                	adc    %al,(%rax)
ffff80000010ce0c:	00 80 ff ff d6 80    	add    %al,-0x7f290001(%rax)
ffff80000010ce12:	10 00                	adc    %al,(%rax)
ffff80000010ce14:	00 80 ff ff 20 81    	add    %al,-0x7edf0001(%rax)
ffff80000010ce1a:	10 00                	adc    %al,(%rax)
ffff80000010ce1c:	00 80 ff ff 6a 81    	add    %al,-0x7e950001(%rax)
ffff80000010ce22:	10 00                	adc    %al,(%rax)
ffff80000010ce24:	00 80 ff ff b4 81    	add    %al,-0x7e4b0001(%rax)
ffff80000010ce2a:	10 00                	adc    %al,(%rax)
ffff80000010ce2c:	00 80 ff ff fe 81    	add    %al,-0x7e010001(%rax)
ffff80000010ce32:	10 00                	adc    %al,(%rax)
ffff80000010ce34:	00 80 ff ff 48 82    	add    %al,-0x7db70001(%rax)
ffff80000010ce3a:	10 00                	adc    %al,(%rax)
ffff80000010ce3c:	00 80 ff ff 92 82    	add    %al,-0x7d6d0001(%rax)
ffff80000010ce42:	10 00                	adc    %al,(%rax)
ffff80000010ce44:	00 80 ff ff dc 82    	add    %al,-0x7d230001(%rax)
ffff80000010ce4a:	10 00                	adc    %al,(%rax)
ffff80000010ce4c:	00 80 ff ff 26 83    	add    %al,-0x7cd90001(%rax)
ffff80000010ce52:	10 00                	adc    %al,(%rax)
ffff80000010ce54:	00 80 ff ff 70 83    	add    %al,-0x7c8f0001(%rax)
ffff80000010ce5a:	10 00                	adc    %al,(%rax)
ffff80000010ce5c:	00 80 ff ff ba 83    	add    %al,-0x7c450001(%rax)
ffff80000010ce62:	10 00                	adc    %al,(%rax)
ffff80000010ce64:	00 80 ff ff 04 84    	add    %al,-0x7bfb0001(%rax)
ffff80000010ce6a:	10 00                	adc    %al,(%rax)
ffff80000010ce6c:	00 80 ff ff 4e 84    	add    %al,-0x7bb10001(%rax)
ffff80000010ce72:	10 00                	adc    %al,(%rax)
ffff80000010ce74:	00 80 ff ff 98 84    	add    %al,-0x7b670001(%rax)
ffff80000010ce7a:	10 00                	adc    %al,(%rax)
ffff80000010ce7c:	00 80 ff ff e2 84    	add    %al,-0x7b1d0001(%rax)
ffff80000010ce82:	10 00                	adc    %al,(%rax)
ffff80000010ce84:	00 80 ff ff 2c 85    	add    %al,-0x7ad30001(%rax)
ffff80000010ce8a:	10 00                	adc    %al,(%rax)
ffff80000010ce8c:	00 80 ff ff 76 85    	add    %al,-0x7a890001(%rax)
ffff80000010ce92:	10 00                	adc    %al,(%rax)
ffff80000010ce94:	00 80 ff ff c0 85    	add    %al,-0x7a3f0001(%rax)
ffff80000010ce9a:	10 00                	adc    %al,(%rax)
ffff80000010ce9c:	00 80 ff ff 0a 86    	add    %al,-0x79f50001(%rax)
ffff80000010cea2:	10 00                	adc    %al,(%rax)
ffff80000010cea4:	00 80 ff ff 54 86    	add    %al,-0x79ab0001(%rax)
ffff80000010ceaa:	10 00                	adc    %al,(%rax)
ffff80000010ceac:	00 80 ff ff 9e 86    	add    %al,-0x79610001(%rax)
ffff80000010ceb2:	10 00                	adc    %al,(%rax)
ffff80000010ceb4:	00 80 ff ff e8 86    	add    %al,-0x79170001(%rax)
ffff80000010ceba:	10 00                	adc    %al,(%rax)
ffff80000010cebc:	00                   	.byte 0x0
ffff80000010cebd:	80 ff ff             	cmp    $0xff,%bh

Disassembly of section .rodata:

ffff80000010cec0 <_rodata>:
ffff80000010cec0:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010cec1:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cec2:	5f                   	pop    %rdi
ffff80000010cec3:	73 79                	jae    ffff80000010cf3e <.LC1+0x26>
ffff80000010cec5:	73 74                	jae    ffff80000010cf3b <.LC1+0x23>
ffff80000010cec7:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff80000010cec9:	5f                   	pop    %rdi
ffff80000010ceca:	63 61 6c             	movslq 0x6c(%rcx),%esp
ffff80000010cecd:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010cece:	20 69 73             	and    %ch,0x73(%rcx)
ffff80000010ced1:	20 63 61             	and    %ah,0x61(%rbx)
ffff80000010ced4:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010ced5:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010ced6:	69 6e 67 2c 4e 52 3a 	imul   $0x3a524e2c,0x67(%rsi),%ebp
ffff80000010cedd:	25 78 0a 00 00       	and    $0xa78,%eax
ffff80000010cee2:	00 00                	add    %al,(%rax)
ffff80000010cee4:	00 00                	add    %al,(%rax)
	...

ffff80000010cee8 <.LC0>:
ffff80000010cee8:	44 69 76 69 64 65 20 	imul   $0x45206564,0x69(%rsi),%r14d
ffff80000010ceef:	45 
ffff80000010cef0:	72 72                	jb     ffff80000010cf64 <.LC2+0x24>
ffff80000010cef2:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cef3:	72 28                	jb     ffff80000010cf1d <.LC1+0x5>
ffff80000010cef5:	23 44 45 29          	and    0x29(%rbp,%rax,2),%eax
ffff80000010cef9:	0a 45 72             	or     0x72(%rbp),%al
ffff80000010cefc:	72 6f                	jb     ffff80000010cf6d <.LC2+0x2d>
ffff80000010cefe:	72 43                	jb     ffff80000010cf43 <.LC2+0x3>
ffff80000010cf00:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cf01:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010cf05:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010cf0a:	50                   	push   %rax
ffff80000010cf0b:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962ef89 <_end+0x49505b31>
ffff80000010cf11:	50                   	push   %rax
ffff80000010cf12:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010d990 <_erodata+0x1ba>

ffff80000010cf18 <.LC1>:
ffff80000010cf18:	44                   	rex.R
ffff80000010cf19:	65 62                	gs (bad) 
ffff80000010cf1b:	75 67                	jne    ffff80000010cf84 <.LC3+0x14>
ffff80000010cf1d:	28 23                	sub    %ah,(%rbx)
ffff80000010cf1f:	44                   	rex.R
ffff80000010cf20:	42 29 0a             	rex.X sub %ecx,(%rdx)
ffff80000010cf23:	45 72 72             	rex.RB jb ffff80000010cf98 <.LC3+0x28>
ffff80000010cf26:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cf27:	72 43                	jb     ffff80000010cf6c <.LC2+0x2c>
ffff80000010cf29:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cf2a:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010cf2e:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010cf33:	50                   	push   %rax
ffff80000010cf34:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962efb2 <_end+0x49505b5a>
ffff80000010cf3a:	50                   	push   %rax
ffff80000010cf3b:	3a 25 78 0a 00     	cmp    0x4e000a78(%rip),%ah        # ffff80004e10d9b9 <_end+0x4dfe4561>

ffff80000010cf40 <.LC2>:
ffff80000010cf40:	4e                   	rex.WRX
ffff80000010cf41:	4d                   	rex.WRB
ffff80000010cf42:	49 20 49 6e          	rex.WB and %cl,0x6e(%r9)
ffff80000010cf46:	74 65                	je     ffff80000010cfad <.LC4+0xd>
ffff80000010cf48:	72 72                	jb     ffff80000010cfbc <.LC4+0x1c>
ffff80000010cf4a:	75 70                	jne    ffff80000010cfbc <.LC4+0x1c>
ffff80000010cf4c:	74 28                	je     ffff80000010cf76 <.LC3+0x6>
ffff80000010cf4e:	2d 29 0a 45 72       	sub    $0x72450a29,%eax
ffff80000010cf53:	72 6f                	jb     ffff80000010cfc4 <.LC4+0x24>
ffff80000010cf55:	72 43                	jb     ffff80000010cf9a <.LC3+0x2a>
ffff80000010cf57:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cf58:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010cf5c:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010cf61:	50                   	push   %rax
ffff80000010cf62:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962efe0 <_end+0x49505b88>
ffff80000010cf68:	50                   	push   %rax
ffff80000010cf69:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010d9e7 <_erodata+0x211>
	...

ffff80000010cf70 <.LC3>:
ffff80000010cf70:	42 72 65             	rex.X jb ffff80000010cfd8 <.LC5+0x8>
ffff80000010cf73:	61                   	(bad)  
ffff80000010cf74:	6b 50 6f 69          	imul   $0x69,0x6f(%rax),%edx
ffff80000010cf78:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010cf79:	74 28                	je     ffff80000010cfa3 <.LC4+0x3>
ffff80000010cf7b:	23 42 50             	and    0x50(%rdx),%eax
ffff80000010cf7e:	29 0a                	sub    %ecx,(%rdx)
ffff80000010cf80:	45 72 72             	rex.RB jb ffff80000010cff5 <.LC5+0x25>
ffff80000010cf83:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cf84:	72 43                	jb     ffff80000010cfc9 <.LC4+0x29>
ffff80000010cf86:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cf87:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010cf8b:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010cf90:	50                   	push   %rax
ffff80000010cf91:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962f00f <_end+0x49505bb7>
ffff80000010cf97:	50                   	push   %rax
ffff80000010cf98:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010da16 <_erodata+0x240>
	...

ffff80000010cfa0 <.LC4>:
ffff80000010cfa0:	4f 76 65             	rex.WRXB jbe ffff80000010d008 <.LC6>
ffff80000010cfa3:	72 46                	jb     ffff80000010cfeb <.LC5+0x1b>
ffff80000010cfa5:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010cfa6:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cfa7:	77 28                	ja     ffff80000010cfd1 <.LC5+0x1>
ffff80000010cfa9:	23 4f 46             	and    0x46(%rdi),%ecx
ffff80000010cfac:	29 0a                	sub    %ecx,(%rdx)
ffff80000010cfae:	45 72 72             	rex.RB jb ffff80000010d023 <.LC6+0x1b>
ffff80000010cfb1:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cfb2:	72 43                	jb     ffff80000010cff7 <.LC5+0x27>
ffff80000010cfb4:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cfb5:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010cfb9:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010cfbe:	50                   	push   %rax
ffff80000010cfbf:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962f03d <_end+0x49505be5>
ffff80000010cfc5:	50                   	push   %rax
ffff80000010cfc6:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010da44 <_erodata+0x26e>
ffff80000010cfcc:	00 00                	add    %al,(%rax)
	...

ffff80000010cfd0 <.LC5>:
ffff80000010cfd0:	42                   	rex.X
ffff80000010cfd1:	4f 55                	rex.WRXB push %r13
ffff80000010cfd3:	4e                   	rex.WRX
ffff80000010cfd4:	44 20 52 61          	and    %r10b,0x61(%rdx)
ffff80000010cfd8:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010cfd9:	67 65 20 45 78       	and    %al,%gs:0x78(%ebp)
ffff80000010cfde:	63 65 65             	movslq 0x65(%rbp),%esp
ffff80000010cfe1:	64 65 64 28 23       	fs gs sub %ah,%fs:(%rbx)
ffff80000010cfe6:	42 52                	rex.X push %rdx
ffff80000010cfe8:	29 0a                	sub    %ecx,(%rdx)
ffff80000010cfea:	45 72 72             	rex.RB jb ffff80000010d05f <.LC7+0xf>
ffff80000010cfed:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cfee:	72 43                	jb     ffff80000010d033 <.LC6+0x2b>
ffff80000010cff0:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010cff1:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010cff5:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010cffa:	50                   	push   %rax
ffff80000010cffb:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962f079 <_end+0x49505c21>
ffff80000010d001:	50                   	push   %rax
ffff80000010d002:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010da80 <_erodata+0x2aa>

ffff80000010d008 <.LC6>:
ffff80000010d008:	49 6e                	rex.WB outsb %ds:(%rsi),(%dx)
ffff80000010d00a:	76 61                	jbe    ffff80000010d06d <.LC7+0x1d>
ffff80000010d00c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d00d:	69 64 20 4f 70 63 6f 	imul   $0x646f6370,0x4f(%rax,%riz,1),%esp
ffff80000010d014:	64 
ffff80000010d015:	65 20 28             	and    %ch,%gs:(%rax)
ffff80000010d018:	55                   	push   %rbp
ffff80000010d019:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d01a:	64 65 66 69 6e 65 64 	fs imul $0x2064,%gs:0x65(%rsi),%bp
ffff80000010d021:	20 
ffff80000010d022:	4f 70 63             	rex.WRXB jo ffff80000010d088 <.LC7+0x38>
ffff80000010d025:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d026:	64 65 29 28          	fs sub %ebp,%gs:(%rax)
ffff80000010d02a:	23 55 44             	and    0x44(%rbp),%edx
ffff80000010d02d:	29 0a                	sub    %ecx,(%rdx)
ffff80000010d02f:	09 09                	or     %ecx,(%rcx)
ffff80000010d031:	45 72 72             	rex.RB jb ffff80000010d0a6 <.LC8+0x6>
ffff80000010d034:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d035:	72 43                	jb     ffff80000010d07a <.LC7+0x2a>
ffff80000010d037:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d038:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010d03c:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010d041:	50                   	push   %rax
ffff80000010d042:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962f0c0 <_end+0x49505c68>
ffff80000010d048:	50                   	push   %rax
ffff80000010d049:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010dac7 <_erodata+0x2f1>
	...

ffff80000010d050 <.LC7>:
ffff80000010d050:	20 44 65 76          	and    %al,0x76(%rbp,%riz,2)
ffff80000010d054:	69 63 65 20 4e 6f 74 	imul   $0x746f4e20,0x65(%rbx),%esp
ffff80000010d05b:	20 41 76             	and    %al,0x76(%rcx)
ffff80000010d05e:	61                   	(bad)  
ffff80000010d05f:	69 6c 61 62 6c 65 20 	imul   $0x2820656c,0x62(%rcx,%riz,2),%ebp
ffff80000010d066:	28 
ffff80000010d067:	4e 6f                	rex.WRX outsl %ds:(%rsi),(%dx)
ffff80000010d069:	20 4d 61             	and    %cl,0x61(%rbp)
ffff80000010d06c:	74 68                	je     ffff80000010d0d6 <.LC9+0x6>
ffff80000010d06e:	20 43 6f             	and    %al,0x6f(%rbx)
ffff80000010d071:	70 72                	jo     ffff80000010d0e5 <.LC9+0x15>
ffff80000010d073:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d074:	63 65 73             	movslq 0x73(%rbp),%esp
ffff80000010d077:	73 6f                	jae    ffff80000010d0e8 <.LC9+0x18>
ffff80000010d079:	72 29                	jb     ffff80000010d0a4 <.LC8+0x4>
ffff80000010d07b:	28 23                	sub    %ah,(%rbx)
ffff80000010d07d:	4e                   	rex.WRX
ffff80000010d07e:	4d 29 0a             	sub    %r9,(%r10)
ffff80000010d081:	09 09                	or     %ecx,(%rcx)
ffff80000010d083:	45 72 72             	rex.RB jb ffff80000010d0f8 <.LC9+0x28>
ffff80000010d086:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d087:	72 43                	jb     ffff80000010d0cc <.LC8+0x2c>
ffff80000010d089:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d08a:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010d08e:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010d093:	50                   	push   %rax
ffff80000010d094:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962f112 <_end+0x49505cba>
ffff80000010d09a:	50                   	push   %rax
ffff80000010d09b:	3a 25 78 0a 00     	cmp    0x44000a78(%rip),%ah        # ffff80004410db19 <_end+0x43fe46c1>

ffff80000010d0a0 <.LC8>:
ffff80000010d0a0:	44 6f                	rex.R outsl %ds:(%rsi),(%dx)
ffff80000010d0a2:	75 62                	jne    ffff80000010d106 <.LC9+0x36>
ffff80000010d0a4:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d0a5:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff80000010d0a9:	75 6c                	jne    ffff80000010d117 <.LC9+0x47>
ffff80000010d0ab:	74 28                	je     ffff80000010d0d5 <.LC9+0x5>
ffff80000010d0ad:	23 44 46 29          	and    0x29(%rsi,%rax,2),%eax
ffff80000010d0b1:	0a 45 72             	or     0x72(%rbp),%al
ffff80000010d0b4:	72 6f                	jb     ffff80000010d125 <.LC10+0x5>
ffff80000010d0b6:	72 43                	jb     ffff80000010d0fb <.LC9+0x2b>
ffff80000010d0b8:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d0b9:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010d0bd:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010d0c2:	50                   	push   %rax
ffff80000010d0c3:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962f141 <_end+0x49505ce9>
ffff80000010d0c9:	50                   	push   %rax
ffff80000010d0ca:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010db48 <_erodata+0x372>

ffff80000010d0d0 <.LC9>:
ffff80000010d0d0:	43 6f                	rex.XB outsl %ds:(%rsi),(%dx)
ffff80000010d0d2:	70 72                	jo     ffff80000010d146 <.LC10+0x26>
ffff80000010d0d4:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d0d5:	63 65 73             	movslq 0x73(%rbp),%esp
ffff80000010d0d8:	73 6f                	jae    ffff80000010d149 <.LC10+0x29>
ffff80000010d0da:	72 20                	jb     ffff80000010d0fc <.LC9+0x2c>
ffff80000010d0dc:	53                   	push   %rbx
ffff80000010d0dd:	65 67 6d             	gs insl (%dx),%es:(%edi)
ffff80000010d0e0:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010d0e2:	74 20                	je     ffff80000010d104 <.LC9+0x34>
ffff80000010d0e4:	4f 76 65             	rex.WRXB jbe ffff80000010d14c <.LC10+0x2c>
ffff80000010d0e7:	72 72                	jb     ffff80000010d15b <.LC11+0xb>
ffff80000010d0e9:	75 6e                	jne    ffff80000010d159 <.LC11+0x9>
ffff80000010d0eb:	20 28                	and    %ch,(%rax)
ffff80000010d0ed:	72 65                	jb     ffff80000010d154 <.LC11+0x4>
ffff80000010d0ef:	73 65                	jae    ffff80000010d156 <.LC11+0x6>
ffff80000010d0f1:	72 76                	jb     ffff80000010d169 <.LC11+0x19>
ffff80000010d0f3:	65 64 29 28          	gs sub %ebp,%fs:(%rax)
ffff80000010d0f7:	20 29                	and    %ch,(%rcx)
ffff80000010d0f9:	09 09                	or     %ecx,(%rcx)
ffff80000010d0fb:	0a 45 72             	or     0x72(%rbp),%al
ffff80000010d0fe:	72 6f                	jb     ffff80000010d16f <.LC11+0x1f>
ffff80000010d100:	72 43                	jb     ffff80000010d145 <.LC10+0x25>
ffff80000010d102:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d103:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010d107:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010d10c:	50                   	push   %rax
ffff80000010d10d:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962f18b <_end+0x49505d33>
ffff80000010d113:	50                   	push   %rax
ffff80000010d114:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010db92 <_erodata+0x3bc>
ffff80000010d11a:	00 00                	add    %al,(%rax)
ffff80000010d11c:	00 00                	add    %al,(%rax)
	...

ffff80000010d120 <.LC10>:
ffff80000010d120:	49 6e                	rex.WB outsb %ds:(%rsi),(%dx)
ffff80000010d122:	76 61                	jbe    ffff80000010d185 <.LC11+0x35>
ffff80000010d124:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d125:	69 64 20 54 53 53 28 	imul   $0x23285353,0x54(%rax,%riz,1),%esp
ffff80000010d12c:	23 
ffff80000010d12d:	54                   	push   %rsp
ffff80000010d12e:	53                   	push   %rbx
ffff80000010d12f:	29 0a                	sub    %ecx,(%rdx)
ffff80000010d131:	45 72 72             	rex.RB jb ffff80000010d1a6 <.LC11+0x56>
ffff80000010d134:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d135:	72 43                	jb     ffff80000010d17a <.LC11+0x2a>
ffff80000010d137:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d138:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010d13c:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010d141:	50                   	push   %rax
ffff80000010d142:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962f1c0 <_end+0x49505d68>
ffff80000010d148:	50                   	push   %rax
ffff80000010d149:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010dbc7 <_erodata+0x3f1>
	...

ffff80000010d150 <.LC11>:
ffff80000010d150:	54                   	push   %rsp
ffff80000010d151:	68 65 20 65 78       	pushq  $0x78652065
ffff80000010d156:	63 65 70             	movslq 0x70(%rbp),%esp
ffff80000010d159:	74 69                	je     ffff80000010d1c4 <.LC11+0x74>
ffff80000010d15b:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d15c:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d15d:	20 6f 63             	and    %ch,0x63(%rdi)
ffff80000010d160:	63 75 72             	movslq 0x72(%rbp),%esi
ffff80000010d163:	72 65                	jb     ffff80000010d1ca <.LC11+0x7a>
ffff80000010d165:	64 20 64 75 72       	and    %ah,%fs:0x72(%rbp,%rsi,2)
ffff80000010d16a:	69 6e 67 20 64 65 6c 	imul   $0x6c656420,0x67(%rsi),%ebp
ffff80000010d171:	69 76 65 72 79 20 6f 	imul   $0x6f207972,0x65(%rsi),%esi
ffff80000010d178:	66 20 61 6e          	data16 and %ah,0x6e(%rcx)
ffff80000010d17c:	20 65 76             	and    %ah,0x76(%rbp)
ffff80000010d17f:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010d181:	74 20                	je     ffff80000010d1a3 <.LC11+0x53>
ffff80000010d183:	09 09                	or     %ecx,(%rcx)
ffff80000010d185:	65 78 74             	gs js  ffff80000010d1fc <.LC12+0x2c>
ffff80000010d188:	65 72 6e             	gs jb  ffff80000010d1f9 <.LC12+0x29>
ffff80000010d18b:	61                   	(bad)  
ffff80000010d18c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d18d:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000010d191:	74 68                	je     ffff80000010d1fb <.LC12+0x2b>
ffff80000010d193:	65 20 70 72          	and    %dh,%gs:0x72(%rax)
ffff80000010d197:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d198:	67 72 61             	addr32 jb ffff80000010d1fc <.LC12+0x2c>
ffff80000010d19b:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000010d19c:	2c 73                	sub    $0x73,%al
ffff80000010d19e:	75 63                	jne    ffff80000010d203 <.LC13+0x3>
ffff80000010d1a0:	68 20 61 73 20       	pushq  $0x20736120
ffff80000010d1a5:	61                   	(bad)  
ffff80000010d1a6:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d1a7:	20 69 6e             	and    %ch,0x6e(%rcx)
ffff80000010d1aa:	74 65                	je     ffff80000010d211 <.LC13+0x11>
ffff80000010d1ac:	72 72                	jb     ffff80000010d220 <.LC13+0x20>
ffff80000010d1ae:	75 70                	jne    ffff80000010d220 <.LC13+0x20>
ffff80000010d1b0:	74 20                	je     ffff80000010d1d2 <.LC12+0x2>
ffff80000010d1b2:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d1b3:	72 20                	jb     ffff80000010d1d5 <.LC12+0x5>
ffff80000010d1b5:	61                   	(bad)  
ffff80000010d1b6:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d1b7:	20 65 61             	and    %ah,0x61(%rbp)
ffff80000010d1ba:	72 6c                	jb     ffff80000010d228 <.LC13+0x28>
ffff80000010d1bc:	69 65 72 20 65 78 63 	imul   $0x63786520,0x72(%rbp),%esp
ffff80000010d1c3:	65 70 74             	gs jo  ffff80000010d23a <.LC14+0x2>
ffff80000010d1c6:	69 6f 6e 2e 0a 00 00 	imul   $0xa2e,0x6e(%rdi),%ebp
ffff80000010d1cd:	00 00                	add    %al,(%rax)
	...

ffff80000010d1d0 <.LC12>:
ffff80000010d1d0:	52                   	push   %rdx
ffff80000010d1d1:	65 66 65 72 73       	gs data16 gs jb ffff80000010d249 <.LC14+0x11>
ffff80000010d1d6:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000010d1da:	61                   	(bad)  
ffff80000010d1db:	20 67 61             	and    %ah,0x61(%rdi)
ffff80000010d1de:	74 65                	je     ffff80000010d245 <.LC14+0xd>
ffff80000010d1e0:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff80000010d1e4:	63 72 69             	movslq 0x69(%rdx),%esi
ffff80000010d1e7:	70 74                	jo     ffff80000010d25d <.LC14+0x25>
ffff80000010d1e9:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d1ea:	72 20                	jb     ffff80000010d20c <.LC13+0xc>
ffff80000010d1ec:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff80000010d1f3:	49                   	rex.WB
ffff80000010d1f4:	44 54                	rex.R push %rsp
ffff80000010d1f6:	3b 0a                	cmp    (%rdx),%ecx
	...

ffff80000010d200 <.LC13>:
ffff80000010d200:	52                   	push   %rdx
ffff80000010d201:	65 66 65 72 73       	gs data16 gs jb ffff80000010d279 <.LC15+0x9>
ffff80000010d206:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000010d20a:	61                   	(bad)  
ffff80000010d20b:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff80000010d20f:	63 72 69             	movslq 0x69(%rdx),%esi
ffff80000010d212:	70 74                	jo     ffff80000010d288 <.LC15+0x18>
ffff80000010d214:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d215:	72 20                	jb     ffff80000010d237 <.LC13+0x37>
ffff80000010d217:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff80000010d21e:	47                   	rex.RXB
ffff80000010d21f:	44 54                	rex.R push %rsp
ffff80000010d221:	20 6f 72             	and    %ch,0x72(%rdi)
ffff80000010d224:	20 74 68 65          	and    %dh,0x65(%rax,%rbp,2)
ffff80000010d228:	20 63 75             	and    %ah,0x75(%rbx)
ffff80000010d22b:	72 72                	jb     ffff80000010d29f <.LC16+0x3>
ffff80000010d22d:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010d22f:	74 20                	je     ffff80000010d251 <.LC14+0x19>
ffff80000010d231:	4c                   	rex.WR
ffff80000010d232:	44 54                	rex.R push %rsp
ffff80000010d234:	3b 0a                	cmp    (%rdx),%ecx
	...

ffff80000010d238 <.LC14>:
ffff80000010d238:	52                   	push   %rdx
ffff80000010d239:	65 66 65 72 73       	gs data16 gs jb ffff80000010d2b1 <.LC16+0x15>
ffff80000010d23e:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000010d242:	61                   	(bad)  
ffff80000010d243:	20 73 65             	and    %dh,0x65(%rbx)
ffff80000010d246:	67 6d                	insl   (%dx),%es:(%edi)
ffff80000010d248:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010d24a:	74 20                	je     ffff80000010d26c <.LC14+0x34>
ffff80000010d24c:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d24d:	72 20                	jb     ffff80000010d26f <.LC14+0x37>
ffff80000010d24f:	67 61                	addr32 (bad) 
ffff80000010d251:	74 65                	je     ffff80000010d2b8 <.LC17>
ffff80000010d253:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff80000010d257:	63 72 69             	movslq 0x69(%rdx),%esi
ffff80000010d25a:	70 74                	jo     ffff80000010d2d0 <.LC17+0x18>
ffff80000010d25c:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d25d:	72 20                	jb     ffff80000010d27f <.LC15+0xf>
ffff80000010d25f:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff80000010d266:	4c                   	rex.WR
ffff80000010d267:	44 54                	rex.R push %rsp
ffff80000010d269:	3b 0a                	cmp    (%rdx),%ecx
ffff80000010d26b:	00 00                	add    %al,(%rax)
ffff80000010d26d:	00 00                	add    %al,(%rax)
	...

ffff80000010d270 <.LC15>:
ffff80000010d270:	52                   	push   %rdx
ffff80000010d271:	65 66 65 72 73       	gs data16 gs jb ffff80000010d2e9 <.LC17+0x31>
ffff80000010d276:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000010d27a:	61                   	(bad)  
ffff80000010d27b:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff80000010d27f:	63 72 69             	movslq 0x69(%rdx),%esi
ffff80000010d282:	70 74                	jo     ffff80000010d2f8 <.LC18+0x8>
ffff80000010d284:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d285:	72 20                	jb     ffff80000010d2a7 <.LC16+0xb>
ffff80000010d287:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff80000010d28e:	63 75 72             	movslq 0x72(%rbp),%esi
ffff80000010d291:	72 65                	jb     ffff80000010d2f8 <.LC18+0x8>
ffff80000010d293:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d294:	74 20                	je     ffff80000010d2b6 <.LC16+0x1a>
ffff80000010d296:	47                   	rex.RXB
ffff80000010d297:	44 54                	rex.R push %rsp
ffff80000010d299:	3b 0a                	cmp    (%rdx),%ecx
	...

ffff80000010d29c <.LC16>:
ffff80000010d29c:	53                   	push   %rbx
ffff80000010d29d:	65 67 6d             	gs insl (%dx),%es:(%edi)
ffff80000010d2a0:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010d2a2:	74 20                	je     ffff80000010d2c4 <.LC17+0xc>
ffff80000010d2a4:	53                   	push   %rbx
ffff80000010d2a5:	65 6c                	gs insb (%dx),%es:(%rdi)
ffff80000010d2a7:	65 63 74 6f 72       	movslq %gs:0x72(%rdi,%rbp,2),%esi
ffff80000010d2ac:	20 49 6e             	and    %cl,0x6e(%rcx)
ffff80000010d2af:	64 65 78 3a          	fs gs js ffff80000010d2ed <.LC17+0x35>
ffff80000010d2b3:	25 78 0a 00 00       	and    $0xa78,%eax

ffff80000010d2b8 <.LC17>:
ffff80000010d2b8:	20 53 65             	and    %dl,0x65(%rbx)
ffff80000010d2bb:	67 6d                	insl   (%dx),%es:(%edi)
ffff80000010d2bd:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010d2bf:	74 20                	je     ffff80000010d2e1 <.LC17+0x29>
ffff80000010d2c1:	4e 6f                	rex.WRX outsl %ds:(%rsi),(%dx)
ffff80000010d2c3:	74 20                	je     ffff80000010d2e5 <.LC17+0x2d>
ffff80000010d2c5:	50                   	push   %rax
ffff80000010d2c6:	72 65                	jb     ffff80000010d32d <.LC19+0x5>
ffff80000010d2c8:	73 65                	jae    ffff80000010d32f <.LC19+0x7>
ffff80000010d2ca:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d2cb:	74 28                	je     ffff80000010d2f5 <.LC18+0x5>
ffff80000010d2cd:	23 4e 50             	and    0x50(%rsi),%ecx
ffff80000010d2d0:	29 0a                	sub    %ecx,(%rdx)
ffff80000010d2d2:	45 72 72             	rex.RB jb ffff80000010d347 <.LC19+0x1f>
ffff80000010d2d5:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d2d6:	72 43                	jb     ffff80000010d31b <.LC18+0x2b>
ffff80000010d2d8:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d2d9:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010d2dd:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010d2e2:	50                   	push   %rax
ffff80000010d2e3:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962f361 <_end+0x49505f09>
ffff80000010d2e9:	50                   	push   %rax
ffff80000010d2ea:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010dd68 <_erodata+0x592>

ffff80000010d2f0 <.LC18>:
ffff80000010d2f0:	53                   	push   %rbx
ffff80000010d2f1:	74 61                	je     ffff80000010d354 <.LC19+0x2c>
ffff80000010d2f3:	63 6b 2d             	movslq 0x2d(%rbx),%ebp
ffff80000010d2f6:	53                   	push   %rbx
ffff80000010d2f7:	65 67 6d             	gs insl (%dx),%es:(%edi)
ffff80000010d2fa:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010d2fc:	74 20                	je     ffff80000010d31e <.LC18+0x2e>
ffff80000010d2fe:	46 61                	rex.RX (bad) 
ffff80000010d300:	75 6c                	jne    ffff80000010d36e <.LC20+0xe>
ffff80000010d302:	74 28                	je     ffff80000010d32c <.LC19+0x4>
ffff80000010d304:	23 53 53             	and    0x53(%rbx),%edx
ffff80000010d307:	29 0a                	sub    %ecx,(%rdx)
ffff80000010d309:	45 72 72             	rex.RB jb ffff80000010d37e <.LC20+0x1e>
ffff80000010d30c:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d30d:	72 43                	jb     ffff80000010d352 <.LC19+0x2a>
ffff80000010d30f:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d310:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010d314:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010d319:	50                   	push   %rax
ffff80000010d31a:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962f398 <_end+0x49505f40>
ffff80000010d320:	50                   	push   %rax
ffff80000010d321:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010dd9f <_erodata+0x5c9>
	...

ffff80000010d328 <.LC19>:
ffff80000010d328:	47                   	rex.RXB
ffff80000010d329:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010d32b:	65 72 61             	gs jb  ffff80000010d38f <.LC21+0x3>
ffff80000010d32e:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d32f:	20 50 72             	and    %dl,0x72(%rax)
ffff80000010d332:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d333:	74 65                	je     ffff80000010d39a <.LC21+0xe>
ffff80000010d335:	63 74 69 6f          	movslq 0x6f(%rcx,%rbp,2),%esi
ffff80000010d339:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d33a:	28 23                	sub    %ah,(%rbx)
ffff80000010d33c:	47 50                	rex.RXB push %r8
ffff80000010d33e:	29 0a                	sub    %ecx,(%rdx)
ffff80000010d340:	45 72 72             	rex.RB jb ffff80000010d3b5 <.LC23+0x2>
ffff80000010d343:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d344:	72 43                	jb     ffff80000010d389 <.LC20+0x29>
ffff80000010d346:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d347:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010d34b:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010d350:	50                   	push   %rax
ffff80000010d351:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962f3cf <_end+0x49505f77>
ffff80000010d357:	50                   	push   %rax
ffff80000010d358:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010ddd6 <_erodata+0x600>
	...

ffff80000010d360 <.LC20>:
ffff80000010d360:	50                   	push   %rax
ffff80000010d361:	61                   	(bad)  
ffff80000010d362:	67 65 20 46 61       	and    %al,%gs:0x61(%esi)
ffff80000010d367:	75 6c                	jne    ffff80000010d3d5 <.LC24+0xf>
ffff80000010d369:	74 28                	je     ffff80000010d393 <.LC21+0x7>
ffff80000010d36b:	23 50 46             	and    0x46(%rax),%edx
ffff80000010d36e:	29 0a                	sub    %ecx,(%rdx)
ffff80000010d370:	45 72 72             	rex.RB jb ffff80000010d3e5 <.LC25+0xd>
ffff80000010d373:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d374:	72 43                	jb     ffff80000010d3b9 <.LC23+0x6>
ffff80000010d376:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d377:	64 65 3a 25 64 20 52 	fs cmp %gs:0x53522064(%rip),%ah        # ffff80005362f3e3 <_end+0x53505f8b>
ffff80000010d37e:	53 
ffff80000010d37f:	50                   	push   %rax
ffff80000010d380:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962f3fe <_end+0x49505fa6>
ffff80000010d386:	50                   	push   %rax
ffff80000010d387:	3a 25 78 0a 00     	cmp    0x50000a78(%rip),%ah        # ffff80005010de05 <_end+0x4ffe49ad>

ffff80000010d38c <.LC21>:
ffff80000010d38c:	50                   	push   %rax
ffff80000010d38d:	61                   	(bad)  
ffff80000010d38e:	67 65 20 4e 6f       	and    %cl,%gs:0x6f(%esi)
ffff80000010d393:	74 2d                	je     ffff80000010d3c2 <.LC23+0xf>
ffff80000010d395:	50                   	push   %rax
ffff80000010d396:	72 65                	jb     ffff80000010d3fd <.LC26+0x9>
ffff80000010d398:	73 65                	jae    ffff80000010d3ff <.LC26+0xb>
ffff80000010d39a:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d39b:	74 2c                	je     ffff80000010d3c9 <.LC24+0x3>
ffff80000010d39d:	0a 00                	or     (%rax),%al

ffff80000010d39f <.LC22>:
ffff80000010d39f:	57                   	push   %rdi
ffff80000010d3a0:	72 69                	jb     ffff80000010d40b <.LC26+0x17>
ffff80000010d3a2:	74 65                	je     ffff80000010d409 <.LC26+0x15>
ffff80000010d3a4:	20 43 61             	and    %al,0x61(%rbx)
ffff80000010d3a7:	75 73                	jne    ffff80000010d41c <.LC27+0xc>
ffff80000010d3a9:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff80000010d3ad:	75 6c                	jne    ffff80000010d41b <.LC27+0xb>
ffff80000010d3af:	74 2c                	je     ffff80000010d3dd <.LC25+0x5>
ffff80000010d3b1:	0a 00                	or     (%rax),%al

ffff80000010d3b3 <.LC23>:
ffff80000010d3b3:	52                   	push   %rdx
ffff80000010d3b4:	65 61                	gs (bad) 
ffff80000010d3b6:	64 20 43 61          	and    %al,%fs:0x61(%rbx)
ffff80000010d3ba:	75 73                	jne    ffff80000010d42f <.LC27+0x1f>
ffff80000010d3bc:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff80000010d3c0:	75 6c                	jne    ffff80000010d42e <.LC27+0x1e>
ffff80000010d3c2:	74 2c                	je     ffff80000010d3f0 <.LC25+0x18>
ffff80000010d3c4:	0a 00                	or     (%rax),%al

ffff80000010d3c6 <.LC24>:
ffff80000010d3c6:	46 61                	rex.RX (bad) 
ffff80000010d3c8:	75 6c                	jne    ffff80000010d436 <.LC28+0x6>
ffff80000010d3ca:	74 20                	je     ffff80000010d3ec <.LC25+0x14>
ffff80000010d3cc:	69 6e 20 75 73 65 72 	imul   $0x72657375,0x20(%rsi),%ebp
ffff80000010d3d3:	28 33                	sub    %dh,(%rbx)
ffff80000010d3d5:	29 0a                	sub    %ecx,(%rdx)
	...

ffff80000010d3d8 <.LC25>:
ffff80000010d3d8:	46 61                	rex.RX (bad) 
ffff80000010d3da:	75 6c                	jne    ffff80000010d448 <.LC29+0x10>
ffff80000010d3dc:	74 20                	je     ffff80000010d3fe <.LC26+0xa>
ffff80000010d3de:	69 6e 20 73 75 70 65 	imul   $0x65707573,0x20(%rsi),%ebp
ffff80000010d3e5:	72 76                	jb     ffff80000010d45d <.LC29+0x25>
ffff80000010d3e7:	69 73 6f 72 28 30 2c 	imul   $0x2c302872,0x6f(%rbx),%esi
ffff80000010d3ee:	31 2c 32             	xor    %ebp,(%rdx,%rsi,1)
ffff80000010d3f1:	29 0a                	sub    %ecx,(%rdx)
	...

ffff80000010d3f4 <.LC26>:
ffff80000010d3f4:	2c 52                	sub    $0x52,%al
ffff80000010d3f6:	65 73 65             	gs jae ffff80000010d45e <.LC29+0x26>
ffff80000010d3f9:	72 76                	jb     ffff80000010d471 <.LC29+0x39>
ffff80000010d3fb:	65 64 20 42 69       	gs and %al,%fs:0x69(%rdx)
ffff80000010d400:	74 20                	je     ffff80000010d422 <.LC27+0x12>
ffff80000010d402:	43 61                	rex.XB (bad) 
ffff80000010d404:	75 73                	jne    ffff80000010d479 <.LC29+0x41>
ffff80000010d406:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff80000010d40a:	75 6c                	jne    ffff80000010d478 <.LC29+0x40>
ffff80000010d40c:	74 0a                	je     ffff80000010d418 <.LC27+0x8>
	...

ffff80000010d410 <.LC27>:
ffff80000010d410:	2c 49                	sub    $0x49,%al
ffff80000010d412:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d413:	73 74                	jae    ffff80000010d489 <.LC30+0x1>
ffff80000010d415:	72 75                	jb     ffff80000010d48c <.LC30+0x4>
ffff80000010d417:	63 74 69 6f          	movslq 0x6f(%rcx,%rbp,2),%esi
ffff80000010d41b:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d41c:	20 66 65             	and    %ah,0x65(%rsi)
ffff80000010d41f:	74 63                	je     ffff80000010d484 <.LC29+0x4c>
ffff80000010d421:	68 20 43 61 75       	pushq  $0x75614320
ffff80000010d426:	73 65                	jae    ffff80000010d48d <.LC30+0x5>
ffff80000010d428:	20 46 61             	and    %al,0x61(%rsi)
ffff80000010d42b:	75 6c                	jne    ffff80000010d499 <.LC30+0x11>
ffff80000010d42d:	74 0a                	je     ffff80000010d439 <.LC29+0x1>
	...

ffff80000010d430 <.LC28>:
ffff80000010d430:	43 52                	rex.XB push %r10
ffff80000010d432:	32 3a                	xor    (%rdx),%bh
ffff80000010d434:	25 78 0a 00        	and    $0x78000a78,%eax

ffff80000010d438 <.LC29>:
ffff80000010d438:	78 38                	js     ffff80000010d472 <.LC29+0x3a>
ffff80000010d43a:	37                   	(bad)  
ffff80000010d43b:	20 46 50             	and    %al,0x50(%rsi)
ffff80000010d43e:	55                   	push   %rbp
ffff80000010d43f:	20 46 6c             	and    %al,0x6c(%rsi)
ffff80000010d442:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d443:	61                   	(bad)  
ffff80000010d444:	74 69                	je     ffff80000010d4af <.LC30+0x27>
ffff80000010d446:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d447:	67 2d 50 6f 69 6e    	addr32 sub $0x6e696f50,%eax
ffff80000010d44d:	74 20                	je     ffff80000010d46f <.LC29+0x37>
ffff80000010d44f:	45 72 72             	rex.RB jb ffff80000010d4c4 <.LC31+0x4>
ffff80000010d452:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d453:	72 20                	jb     ffff80000010d475 <.LC29+0x3d>
ffff80000010d455:	28 4d 61             	sub    %cl,0x61(%rbp)
ffff80000010d458:	74 68                	je     ffff80000010d4c2 <.LC31+0x2>
ffff80000010d45a:	20 46 61             	and    %al,0x61(%rsi)
ffff80000010d45d:	75 6c                	jne    ffff80000010d4cb <.LC31+0xb>
ffff80000010d45f:	74 29                	je     ffff80000010d48a <.LC30+0x2>
ffff80000010d461:	28 23                	sub    %ah,(%rbx)
ffff80000010d463:	4d                   	rex.WRB
ffff80000010d464:	46 29 20             	rex.RX sub %r12d,(%rax)
ffff80000010d467:	09 09                	or     %ecx,(%rcx)
ffff80000010d469:	0a 45 72             	or     0x72(%rbp),%al
ffff80000010d46c:	72 6f                	jb     ffff80000010d4dd <.LC31+0x1d>
ffff80000010d46e:	72 43                	jb     ffff80000010d4b3 <.LC30+0x2b>
ffff80000010d470:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d471:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010d475:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010d47a:	50                   	push   %rax
ffff80000010d47b:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962f4f9 <_end+0x495060a1>
ffff80000010d481:	50                   	push   %rax
ffff80000010d482:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010df00 <_erodata+0x72a>

ffff80000010d488 <.LC30>:
ffff80000010d488:	41 6c                	rex.B insb (%dx),%es:(%rdi)
ffff80000010d48a:	69 67 6e 6d 65 6e 74 	imul   $0x746e656d,0x6e(%rdi),%esp
ffff80000010d491:	20 43 68             	and    %al,0x68(%rbx)
ffff80000010d494:	65 63 6b 28          	movslq %gs:0x28(%rbx),%ebp
ffff80000010d498:	23 41 43             	and    0x43(%rcx),%eax
ffff80000010d49b:	29 0a                	sub    %ecx,(%rdx)
ffff80000010d49d:	45 72 72             	rex.RB jb ffff80000010d512 <.LC32+0x22>
ffff80000010d4a0:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d4a1:	72 43                	jb     ffff80000010d4e6 <.LC31+0x26>
ffff80000010d4a3:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d4a4:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010d4a8:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010d4ad:	50                   	push   %rax
ffff80000010d4ae:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962f52c <_end+0x495060d4>
ffff80000010d4b4:	50                   	push   %rax
ffff80000010d4b5:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010df33 <_erodata+0x75d>
ffff80000010d4bb:	00 00                	add    %al,(%rax)
ffff80000010d4bd:	00 00                	add    %al,(%rax)
	...

ffff80000010d4c0 <.LC31>:
ffff80000010d4c0:	4d 61                	rex.WRB (bad) 
ffff80000010d4c2:	63 68 69             	movslq 0x69(%rax),%ebp
ffff80000010d4c5:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d4c6:	65 20 43 68          	and    %al,%gs:0x68(%rbx)
ffff80000010d4ca:	65 63 6b 28          	movslq %gs:0x28(%rbx),%ebp
ffff80000010d4ce:	23 4d 43             	and    0x43(%rbp),%ecx
ffff80000010d4d1:	29 0a                	sub    %ecx,(%rdx)
ffff80000010d4d3:	45 72 72             	rex.RB jb ffff80000010d548 <.LC33+0x10>
ffff80000010d4d6:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d4d7:	72 43                	jb     ffff80000010d51c <.LC32+0x2c>
ffff80000010d4d9:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d4da:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010d4de:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010d4e3:	50                   	push   %rax
ffff80000010d4e4:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962f562 <_end+0x4950610a>
ffff80000010d4ea:	50                   	push   %rax
ffff80000010d4eb:	3a 25 78 0a 00     	cmp    0x53000a78(%rip),%ah        # ffff80005310df69 <_end+0x52fe4b11>

ffff80000010d4f0 <.LC32>:
ffff80000010d4f0:	53                   	push   %rbx
ffff80000010d4f1:	49                   	rex.WB
ffff80000010d4f2:	4d                   	rex.WRB
ffff80000010d4f3:	44 20 46 6c          	and    %r8b,0x6c(%rsi)
ffff80000010d4f7:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d4f8:	61                   	(bad)  
ffff80000010d4f9:	74 69                	je     ffff80000010d564 <.LC33+0x2c>
ffff80000010d4fb:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d4fc:	67 2d 50 6f 69 6e    	addr32 sub $0x6e696f50,%eax
ffff80000010d502:	74 20                	je     ffff80000010d524 <.LC32+0x34>
ffff80000010d504:	45 78 63             	rex.RB js ffff80000010d56a <.LC33+0x32>
ffff80000010d507:	65 70 74             	gs jo  ffff80000010d57e <.LC0+0x6>
ffff80000010d50a:	69 6f 6e 28 23 58 4d 	imul   $0x4d582328,0x6e(%rdi),%ebp
ffff80000010d511:	29 09                	sub    %ecx,(%rcx)
ffff80000010d513:	09 0a                	or     %ecx,(%rdx)
ffff80000010d515:	45 72 72             	rex.RB jb ffff80000010d58a <.LC0+0x12>
ffff80000010d518:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d519:	72 43                	jb     ffff80000010d55e <.LC33+0x26>
ffff80000010d51b:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d51c:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010d520:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010d525:	50                   	push   %rax
ffff80000010d526:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962f5a4 <_end+0x4950614c>
ffff80000010d52c:	50                   	push   %rax
ffff80000010d52d:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010dfab <_erodata+0x7d5>
ffff80000010d533:	00 00                	add    %al,(%rax)
ffff80000010d535:	00 00                	add    %al,(%rax)
	...

ffff80000010d538 <.LC33>:
ffff80000010d538:	20 56 69             	and    %dl,0x69(%rsi)
ffff80000010d53b:	72 74                	jb     ffff80000010d5b1 <.LC1+0x19>
ffff80000010d53d:	75 61                	jne    ffff80000010d5a0 <.LC1+0x8>
ffff80000010d53f:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d540:	69 7a 61 74 69 6f 6e 	imul   $0x6e6f6974,0x61(%rdx),%edi
ffff80000010d547:	20 45 78             	and    %al,0x78(%rbp)
ffff80000010d54a:	63 65 70             	movslq 0x70(%rbp),%esp
ffff80000010d54d:	74 69                	je     ffff80000010d5b8 <.LC2>
ffff80000010d54f:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d550:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d551:	28 23                	sub    %ah,(%rbx)
ffff80000010d553:	56                   	push   %rsi
ffff80000010d554:	45 29 0a             	sub    %r9d,(%r10)
ffff80000010d557:	45 72 72             	rex.RB jb ffff80000010d5cc <.LC2+0x14>
ffff80000010d55a:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d55b:	72 43                	jb     ffff80000010d5a0 <.LC1+0x8>
ffff80000010d55d:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d55e:	64 65 3a 20          	fs cmp %gs:(%rax),%ah
ffff80000010d562:	25 64 20 52 53       	and    $0x53522064,%eax
ffff80000010d567:	50                   	push   %rax
ffff80000010d568:	3a 25 78 20 52 49    	cmp    0x49522078(%rip),%ah        # ffff80004962f5e6 <_end+0x4950618e>
ffff80000010d56e:	50                   	push   %rax
ffff80000010d56f:	3a 25 78 0a 00 00    	cmp    0xa78(%rip),%ah        # ffff80000010dfed <_erodata+0x817>
ffff80000010d575:	00 00                	add    %al,(%rax)
	...

ffff80000010d578 <.LC0>:
ffff80000010d578:	67 65 74 5f          	addr32 gs je ffff80000010d5db <.LC2+0x23>
ffff80000010d57c:	70 61                	jo     ffff80000010d5df <.LC3+0x2>
ffff80000010d57e:	67 65 5f             	addr32 gs pop %rdi
ffff80000010d581:	61                   	(bad)  
ffff80000010d582:	74 74                	je     ffff80000010d5f8 <.LC3+0x1b>
ffff80000010d584:	72 69                	jb     ffff80000010d5ef <.LC3+0x12>
ffff80000010d586:	62                   	(bad)  
ffff80000010d587:	75 74                	jne    ffff80000010d5fd <.LC4+0x2>
ffff80000010d589:	65 28 29             	sub    %ch,%gs:(%rcx)
ffff80000010d58c:	3a 20                	cmp    (%rax),%ah
ffff80000010d58e:	70 3d                	jo     ffff80000010d5cd <.LC2+0x15>
ffff80000010d590:	3d 4e 55 4c 4c       	cmp    $0x4c4c554e,%eax
ffff80000010d595:	0a 00                	or     (%rax),%al
	...

ffff80000010d598 <.LC1>:
ffff80000010d598:	73 65                	jae    ffff80000010d5ff <.LC4+0x4>
ffff80000010d59a:	74 5f                	je     ffff80000010d5fb <.LC4>
ffff80000010d59c:	70 61                	jo     ffff80000010d5ff <.LC4+0x4>
ffff80000010d59e:	67 65 5f             	addr32 gs pop %rdi
ffff80000010d5a1:	61                   	(bad)  
ffff80000010d5a2:	74 74                	je     ffff80000010d618 <.LC5+0x7>
ffff80000010d5a4:	72 69                	jb     ffff80000010d60f <.LC4+0x14>
ffff80000010d5a6:	62                   	(bad)  
ffff80000010d5a7:	75 74                	jne    ffff80000010d61d <.LC5+0xc>
ffff80000010d5a9:	65 28 29             	sub    %ch,%gs:(%rcx)
ffff80000010d5ac:	3a 20                	cmp    (%rax),%ah
ffff80000010d5ae:	70 3d                	jo     ffff80000010d5ed <.LC3+0x10>
ffff80000010d5b0:	3d 4e 55 4c 4c       	cmp    $0x4c4c554e,%eax
ffff80000010d5b5:	0a 00                	or     (%rax),%al
	...

ffff80000010d5b8 <.LC2>:
ffff80000010d5b8:	44 69 73 70 6c 61 79 	imul   $0x2079616c,0x70(%rbx),%r14d
ffff80000010d5bf:	20 
ffff80000010d5c0:	50                   	push   %rax
ffff80000010d5c1:	68 79 73 69 63       	pushq  $0x63697379
ffff80000010d5c6:	73 20                	jae    ffff80000010d5e8 <.LC3+0xb>
ffff80000010d5c8:	4d                   	rex.WRB
ffff80000010d5c9:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff80000010d5cb:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d5cc:	72 79                	jb     ffff80000010d647 <.LC6+0x17>
ffff80000010d5ce:	20 44 69 73          	and    %al,0x73(%rcx,%rbp,2)
ffff80000010d5d2:	74 72                	je     ffff80000010d646 <.LC6+0x16>
ffff80000010d5d4:	69 62 75 74 69 6f 6e 	imul   $0x6e6f6974,0x75(%rdx),%esp
ffff80000010d5db:	0a 00                	or     (%rax),%al

ffff80000010d5dd <.LC3>:
ffff80000010d5dd:	41                   	rex.B
ffff80000010d5de:	64 64 72 65          	fs fs jb ffff80000010d647 <.LC6+0x17>
ffff80000010d5e2:	73 73                	jae    ffff80000010d657 <.LC6+0x27>
ffff80000010d5e4:	3a 25 78 20 4c 65    	cmp    0x654c2078(%rip),%ah        # ffff8000655cf662 <_end+0x654a620a>
ffff80000010d5ea:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d5eb:	67 74 68             	addr32 je ffff80000010d656 <.LC6+0x26>
ffff80000010d5ee:	3a 25 78 20 54 79    	cmp    0x79542078(%rip),%ah        # ffff80007964f66c <_end+0x79526214>
ffff80000010d5f4:	70 65                	jo     ffff80000010d65b <.LC6+0x2b>
ffff80000010d5f6:	3a 25 78 0a 00     	cmp    0x55000a78(%rip),%ah        # ffff80005510e074 <_end+0x54fe4c1c>

ffff80000010d5fb <.LC4>:
ffff80000010d5fb:	55                   	push   %rbp
ffff80000010d5fc:	73 65                	jae    ffff80000010d663 <.LC6+0x33>
ffff80000010d5fe:	61                   	(bad)  
ffff80000010d5ff:	62                   	(bad)  
ffff80000010d600:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d601:	65 20 54 6f 74       	and    %dl,%gs:0x74(%rdi,%rbp,2)
ffff80000010d606:	61                   	(bad)  
ffff80000010d607:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d608:	20 52 41             	and    %dl,0x41(%rdx)
ffff80000010d60b:	4d 3a 25 78 0a 00  	rex.WRB cmp 0x55000a78(%rip),%r12b        # ffff80005510e08a <_end+0x54fe4c32>

ffff80000010d611 <.LC5>:
ffff80000010d611:	55                   	push   %rbp
ffff80000010d612:	73 65                	jae    ffff80000010d679 <.LC6+0x49>
ffff80000010d614:	61                   	(bad)  
ffff80000010d615:	62                   	(bad)  
ffff80000010d616:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d617:	65 20 54 6f 74       	and    %dl,%gs:0x74(%rdi,%rbp,2)
ffff80000010d61c:	61                   	(bad)  
ffff80000010d61d:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d61e:	20 50 61             	and    %dl,0x61(%rax)
ffff80000010d621:	67 65 20 4e 75       	and    %cl,%gs:0x75(%esi)
ffff80000010d626:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000010d627:	62                   	(bad)  
ffff80000010d628:	65 72 3a             	gs jb  ffff80000010d665 <.LC6+0x35>
ffff80000010d62b:	25 64 0a 00 00       	and    $0xa64,%eax

ffff80000010d630 <.LC6>:
ffff80000010d630:	5a                   	pop    %rdx
ffff80000010d631:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d632:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d633:	65 20 20             	and    %ah,%gs:(%rax)
ffff80000010d636:	25 64 0a 7a 6f       	and    $0x6f7a0a64,%eax
ffff80000010d63b:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d63c:	65 5f                	gs pop %rdi
ffff80000010d63e:	73 74                	jae    ffff80000010d6b4 <.LC9+0x9>
ffff80000010d640:	61                   	(bad)  
ffff80000010d641:	72 74                	jb     ffff80000010d6b7 <.LC9+0xc>
ffff80000010d643:	5f                   	pop    %rdi
ffff80000010d644:	61                   	(bad)  
ffff80000010d645:	64 64 72 3a          	fs fs jb ffff80000010d683 <.LC6+0x53>
ffff80000010d649:	25 78 20 7a 6f       	and    $0x6f7a2078,%eax
ffff80000010d64e:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d64f:	65 5f                	gs pop %rdi
ffff80000010d651:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010d653:	64 5f                	fs pop %rdi
ffff80000010d655:	61                   	(bad)  
ffff80000010d656:	64 64 72 3a          	fs fs jb ffff80000010d694 <.LC7+0x8>
ffff80000010d65a:	25 78 20 7a 6f       	and    $0x6f7a2078,%eax
ffff80000010d65f:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d660:	65 5f                	gs pop %rdi
ffff80000010d662:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d663:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010d665:	67 74 68             	addr32 je ffff80000010d6d0 <.LC10+0x10>
ffff80000010d668:	3a 25 78 0a 70 61    	cmp    0x61700a78(%rip),%ah        # ffff80006180e0e6 <_end+0x616e4c8e>
ffff80000010d66e:	67 65 73 5f          	addr32 gs jae ffff80000010d6d1 <.LC10+0x11>
ffff80000010d672:	67 72 6f             	addr32 jb ffff80000010d6e4 <.LC10+0x24>
ffff80000010d675:	75 70                	jne    ffff80000010d6e7 <.LC10+0x27>
ffff80000010d677:	3a 25 78 20 70 61    	cmp    0x61702078(%rip),%ah        # ffff80006180f6f5 <_end+0x616e629d>
ffff80000010d67d:	67 65 73 5f          	addr32 gs jae ffff80000010d6e0 <.LC10+0x20>
ffff80000010d681:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d682:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000010d684:	67 74 68             	addr32 je ffff80000010d6ef <.LC11+0x7>
ffff80000010d687:	3a 25 78 0a 00     	cmp    0x47000a78(%rip),%ah        # ffff80004710e105 <_end+0x46fe4cad>

ffff80000010d68c <.LC7>:
ffff80000010d68c:	47 6c                	rex.RXB insb (%dx),%es:(%rdi)
ffff80000010d68e:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d68f:	62 61 6c 5f 43       	(bad)  {%k7}
ffff80000010d694:	52                   	push   %rdx
ffff80000010d695:	33 3a                	xor    (%rdx),%edi
ffff80000010d697:	25 78 0a 00        	and    $0x2a000a78,%eax

ffff80000010d69b <.LC8>:
ffff80000010d69b:	2a 47 6c             	sub    0x6c(%rdi),%al
ffff80000010d69e:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d69f:	62 61 6c 5f 43       	(bad)  {%k7}
ffff80000010d6a4:	52                   	push   %rdx
ffff80000010d6a5:	33 3a                	xor    (%rdx),%edi
ffff80000010d6a7:	25 78 0a 00        	and    $0x2a000a78,%eax

ffff80000010d6ab <.LC9>:
ffff80000010d6ab:	2a 2a                	sub    (%rdx),%ch
ffff80000010d6ad:	47 6c                	rex.RXB insb (%dx),%es:(%rdi)
ffff80000010d6af:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d6b0:	62 61 6c 5f 43       	(bad)  {%k7}
ffff80000010d6b5:	52                   	push   %rdx
ffff80000010d6b6:	33 3a                	xor    (%rdx),%edi
ffff80000010d6b8:	25 78 0a 00 00       	and    $0xa78,%eax
ffff80000010d6bd:	00 00                	add    %al,(%rax)
	...

ffff80000010d6c0 <.LC10>:
ffff80000010d6c0:	61                   	(bad)  
ffff80000010d6c1:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d6c2:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d6c3:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d6c4:	63 5f 70             	movslq 0x70(%rdi),%ebx
ffff80000010d6c7:	61                   	(bad)  
ffff80000010d6c8:	67 65 73 20          	addr32 gs jae ffff80000010d6ec <.LC11+0x4>
ffff80000010d6cc:	65 72 72             	gs jb  ffff80000010d741 <.LC0+0xa>
ffff80000010d6cf:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d6d0:	72 20                	jb     ffff80000010d6f2 <.LC11+0xa>
ffff80000010d6d2:	7a 6f                	jp     ffff80000010d743 <.LC0+0xc>
ffff80000010d6d4:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d6d5:	65 5f                	gs pop %rdi
ffff80000010d6d7:	73 65                	jae    ffff80000010d73e <.LC0+0x7>
ffff80000010d6d9:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d6da:	65 63 74 20 69       	movslq %gs:0x69(%rax,%riz,1),%esi
ffff80000010d6df:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d6e0:	64 65 78 0a          	fs gs js ffff80000010d6ee <.LC11+0x6>
ffff80000010d6e4:	00 00                	add    %al,(%rax)
	...

ffff80000010d6e8 <.LC11>:
ffff80000010d6e8:	66 72 65             	data16 jb ffff80000010d750 <.LC0>
ffff80000010d6eb:	65 5f                	gs pop %rdi
ffff80000010d6ed:	70 61                	jo     ffff80000010d750 <.LC0>
ffff80000010d6ef:	67 65 73 28          	addr32 gs jae ffff80000010d71b <.LC12+0xb>
ffff80000010d6f3:	29 20                	sub    %esp,(%rax)
ffff80000010d6f5:	45 52                	rex.RB push %r10
ffff80000010d6f7:	52                   	push   %rdx
ffff80000010d6f8:	4f 52                	rex.WRXB push %r10
ffff80000010d6fa:	3a 20                	cmp    (%rax),%ah
ffff80000010d6fc:	70 61                	jo     ffff80000010d75f <.LC0+0xf>
ffff80000010d6fe:	67 65 20 69 73       	and    %ch,%gs:0x73(%ecx)
ffff80000010d703:	20 69 6e             	and    %ch,0x6e(%rcx)
ffff80000010d706:	76 61                	jbe    ffff80000010d769 <.LC0+0x19>
ffff80000010d708:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d709:	69 64 0a 00 00 00 00 	imul   $0x66000000,0x0(%rdx,%rcx,1),%esp
ffff80000010d710:	 

ffff80000010d710 <.LC12>:
ffff80000010d710:	66 72 65             	data16 jb ffff80000010d778 <.LC1+0x7>
ffff80000010d713:	65 5f                	gs pop %rdi
ffff80000010d715:	70 61                	jo     ffff80000010d778 <.LC1+0x7>
ffff80000010d717:	67 65 73 28          	addr32 gs jae ffff80000010d743 <.LC0+0xc>
ffff80000010d71b:	29 20                	sub    %esp,(%rax)
ffff80000010d71d:	45 52                	rex.RB push %r10
ffff80000010d71f:	52                   	push   %rdx
ffff80000010d720:	4f 52                	rex.WRXB push %r10
ffff80000010d722:	3a 20                	cmp    (%rax),%ah
ffff80000010d724:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d725:	75 6d                	jne    ffff80000010d794 <.LC2+0x8>
ffff80000010d727:	62                   	(bad)  
ffff80000010d728:	65 72 20             	gs jb  ffff80000010d74b <.LC1+0x7>
ffff80000010d72b:	69 73 20 69 6e 76 61 	imul   $0x61766e69,0x20(%rbx),%esi
ffff80000010d732:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d733:	69 64 0a 00    	imul   $0x39353238,0x0(%rdx,%rcx,1),%esp
ffff80000010d73a:	 

ffff80000010d737 <.LC0>:
ffff80000010d737:	38 32                	cmp    %dh,(%rdx)
ffff80000010d739:	35 39 41 20 69       	xor    $0x69204139,%eax
ffff80000010d73e:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d73f:	69 74 20 0a 00   	imul   $0x79656b00,0xa(%rax,%riz,1),%esi
ffff80000010d746:	 

ffff80000010d744 <.LC1>:
ffff80000010d744:	6b 65 79 20          	imul   $0x20,0x79(%rbp),%esp
ffff80000010d748:	63 6f 64             	movslq 0x64(%rdi),%ebp
ffff80000010d74b:	65 3a 25 78 00   	cmp    %gs:0x6f6e0078(%rip),%ah        # ffff80006f7ed7ca <_end+0x6f6c4372>

ffff80000010d750 <.LC0>:
ffff80000010d750:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d751:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d752:	5f                   	pop    %rdi
ffff80000010d753:	73 79                	jae    ffff80000010d7ce <.LC0+0xd>
ffff80000010d755:	73 74                	jae    ffff80000010d7cb <.LC0+0xa>
ffff80000010d757:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff80000010d759:	5f                   	pop    %rdi
ffff80000010d75a:	63 61 6c             	movslq 0x6c(%rcx),%esp
ffff80000010d75d:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d75e:	20 69 73             	and    %ch,0x73(%rcx)
ffff80000010d761:	20 63 61             	and    %ah,0x61(%rbx)
ffff80000010d764:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d765:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d766:	69 6e 67 2c 4e 52 3a 	imul   $0x3a524e2c,0x67(%rsi),%ebp
ffff80000010d76d:	25 78 0a 00        	and    $0x64000a78,%eax

ffff80000010d771 <.LC1>:
ffff80000010d771:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff80000010d773:	5f                   	pop    %rdi
ffff80000010d774:	65 78 65             	gs js  ffff80000010d7dc <_erodata+0x6>
ffff80000010d777:	63 76 65             	movslq 0x65(%rsi),%esi
ffff80000010d77a:	20 74 61 73          	and    %dh,0x73(%rcx,%riz,2)
ffff80000010d77e:	6b 20 69             	imul   $0x69,(%rax),%esp
ffff80000010d781:	73 20                	jae    ffff80000010d7a3 <.LC2+0x17>
ffff80000010d783:	72 75                	jb     ffff80000010d7fa <_erodata+0x24>
ffff80000010d785:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d786:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d787:	69 6e 67 0a 00   	imul   $0x6e69000a,0x67(%rsi),%ebp

ffff80000010d78c <.LC2>:
ffff80000010d78c:	69 6e 69 74 20 74 61 	imul   $0x61742074,0x69(%rsi),%ebp
ffff80000010d793:	73 6b                	jae    ffff80000010d800 <_erodata+0x2a>
ffff80000010d795:	20 69 73             	and    %ch,0x73(%rcx)
ffff80000010d798:	20 72 75             	and    %dh,0x75(%rdx)
ffff80000010d79b:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d79c:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d79d:	69 6e 67 2c 61 72 67 	imul   $0x6772612c,0x67(%rsi),%ebp
ffff80000010d7a4:	3a 25 64 0a 00     	cmp    0x65000a64(%rip),%ah        # ffff80006510e20e <_end+0x64fe4db6>

ffff80000010d7a9 <.LC3>:
ffff80000010d7a9:	65 78 69             	gs js  ffff80000010d815 <_erodata+0x3f>
ffff80000010d7ac:	74 28                	je     ffff80000010d7d6 <_erodata>
ffff80000010d7ae:	29 20                	sub    %esp,(%rax)
ffff80000010d7b0:	74 61                	je     ffff80000010d813 <_erodata+0x3d>
ffff80000010d7b2:	73 6b                	jae    ffff80000010d81f <_erodata+0x49>
ffff80000010d7b4:	20 69 73             	and    %ch,0x73(%rcx)
ffff80000010d7b7:	20 72 75             	and    %dh,0x75(%rdx)
ffff80000010d7ba:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d7bb:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010d7bc:	69 6e 67 0a 00   	imul   $0x6146000a,0x67(%rsi),%ebp

ffff80000010d7c1 <.LC0>:
ffff80000010d7c1:	46 61                	rex.RX (bad) 
ffff80000010d7c3:	63 74 6f 72          	movslq 0x72(%rdi,%rbp,2),%esi
ffff80000010d7c7:	79 4e                	jns    ffff80000010d817 <_erodata+0x41>
ffff80000010d7c9:	61                   	(bad)  
ffff80000010d7ca:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000010d7cb:	65 3a 20             	cmp    %gs:(%rax),%ah
ffff80000010d7ce:	25 73 00         	and    $0x73250073,%eax

ffff80000010d7d1 <.LC1>:
ffff80000010d7d1:	25 73 00         	and    $0xa0073,%eax

ffff80000010d7d4 <.LC2>:
ffff80000010d7d4:	0a 00                	or     (%rax),%al

Disassembly of section .eh_frame:

ffff80000010d7d8 <.eh_frame>:
ffff80000010d7d8:	14 00                	adc    $0x0,%al
ffff80000010d7da:	00 00                	add    %al,(%rax)
ffff80000010d7dc:	00 00                	add    %al,(%rax)
ffff80000010d7de:	00 00                	add    %al,(%rax)
ffff80000010d7e0:	01 7a 52             	add    %edi,0x52(%rdx)
ffff80000010d7e3:	00 01                	add    %al,(%rcx)
ffff80000010d7e5:	78 10                	js     ffff80000010d7f7 <_erodata+0x21>
ffff80000010d7e7:	01 1b                	add    %ebx,(%rbx)
ffff80000010d7e9:	0c 07                	or     $0x7,%al
ffff80000010d7eb:	08 90 01 00 00 1c    	or     %dl,0x1c000001(%rax)
ffff80000010d7f1:	00 00                	add    %al,(%rax)
ffff80000010d7f3:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010d7f6:	00 00                	add    %al,(%rax)
ffff80000010d7f8:	7f 6a                	jg     ffff80000010d864 <_erodata+0x8e>
ffff80000010d7fa:	ff                   	(bad)  
ffff80000010d7fb:	ff aa 00 00 00 00    	ljmp   *0x0(%rdx)
ffff80000010d801:	41 0e                	rex.B (bad) 
ffff80000010d803:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d809:	02 a5 0c 07 08 00    	add    0x8070c(%rbp),%ah
ffff80000010d80f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010d812:	00 00                	add    %al,(%rax)
ffff80000010d814:	3c 00                	cmp    $0x0,%al
ffff80000010d816:	00 00                	add    %al,(%rax)
ffff80000010d818:	09 6b ff             	or     %ebp,-0x1(%rbx)
ffff80000010d81b:	ff 53 00             	callq  *0x0(%rbx)
ffff80000010d81e:	00 00                	add    %al,(%rax)
ffff80000010d820:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010d823:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d829:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010d82c:	07                   	(bad)  
ffff80000010d82d:	08 00                	or     %al,(%rax)
ffff80000010d82f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010d832:	00 00                	add    %al,(%rax)
ffff80000010d834:	5c                   	pop    %rsp
ffff80000010d835:	00 00                	add    %al,(%rax)
ffff80000010d837:	00 3c 6b             	add    %bh,(%rbx,%rbp,2)
ffff80000010d83a:	ff                   	(bad)  
ffff80000010d83b:	ff 53 00             	callq  *0x0(%rbx)
ffff80000010d83e:	00 00                	add    %al,(%rax)
ffff80000010d840:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010d843:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d849:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010d84c:	07                   	(bad)  
ffff80000010d84d:	08 00                	or     %al,(%rax)
ffff80000010d84f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010d852:	00 00                	add    %al,(%rax)
ffff80000010d854:	7c 00                	jl     ffff80000010d856 <_erodata+0x80>
ffff80000010d856:	00 00                	add    %al,(%rax)
ffff80000010d858:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d859:	6b ff ff             	imul   $0xffffffff,%edi,%edi
ffff80000010d85c:	53                   	push   %rbx
ffff80000010d85d:	00 00                	add    %al,(%rax)
ffff80000010d85f:	00 00                	add    %al,(%rax)
ffff80000010d861:	41 0e                	rex.B (bad) 
ffff80000010d863:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d869:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010d86c:	07                   	(bad)  
ffff80000010d86d:	08 00                	or     %al,(%rax)
ffff80000010d86f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010d872:	00 00                	add    %al,(%rax)
ffff80000010d874:	9c                   	pushfq 
ffff80000010d875:	00 00                	add    %al,(%rax)
ffff80000010d877:	00 a2 6b ff ff 53    	add    %ah,0x53ffff6b(%rdx)
ffff80000010d87d:	00 00                	add    %al,(%rax)
ffff80000010d87f:	00 00                	add    %al,(%rax)
ffff80000010d881:	41 0e                	rex.B (bad) 
ffff80000010d883:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d889:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010d88c:	07                   	(bad)  
ffff80000010d88d:	08 00                	or     %al,(%rax)
ffff80000010d88f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010d892:	00 00                	add    %al,(%rax)
ffff80000010d894:	bc 00 00 00 d5       	mov    $0xd5000000,%esp
ffff80000010d899:	6b ff ff             	imul   $0xffffffff,%edi,%edi
ffff80000010d89c:	15 01 00 00 00       	adc    $0x1,%eax
ffff80000010d8a1:	41 0e                	rex.B (bad) 
ffff80000010d8a3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d8a9:	03 10                	add    (%rax),%edx
ffff80000010d8ab:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff80000010d8ae:	08 00                	or     %al,(%rax)
ffff80000010d8b0:	20 00                	and    %al,(%rax)
ffff80000010d8b2:	00 00                	add    %al,(%rax)
ffff80000010d8b4:	dc 00                	faddl  (%rax)
ffff80000010d8b6:	00 00                	add    %al,(%rax)
ffff80000010d8b8:	ca 6c ff             	lret   $0xff6c
ffff80000010d8bb:	ff 57 00             	callq  *0x0(%rdi)
ffff80000010d8be:	00 00                	add    %al,(%rax)
ffff80000010d8c0:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010d8c3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d8c9:	41 83 03 02          	addl   $0x2,(%r11)
ffff80000010d8cd:	51                   	push   %rcx
ffff80000010d8ce:	0c 07                	or     $0x7,%al
ffff80000010d8d0:	08 00                	or     %al,(%rax)
ffff80000010d8d2:	00 00                	add    %al,(%rax)
ffff80000010d8d4:	1c 00                	sbb    $0x0,%al
ffff80000010d8d6:	00 00                	add    %al,(%rax)
ffff80000010d8d8:	00 01                	add    %al,(%rcx)
ffff80000010d8da:	00 00                	add    %al,(%rax)
ffff80000010d8dc:	fd                   	std    
ffff80000010d8dd:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010d8de:	ff                   	(bad)  
ffff80000010d8df:	ff 34 00             	pushq  (%rax,%rax,1)
ffff80000010d8e2:	00 00                	add    %al,(%rax)
ffff80000010d8e4:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010d8e7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d8ed:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d8ee:	0c 07                	or     $0x7,%al
ffff80000010d8f0:	08 00                	or     %al,(%rax)
ffff80000010d8f2:	00 00                	add    %al,(%rax)
ffff80000010d8f4:	20 00                	and    %al,(%rax)
ffff80000010d8f6:	00 00                	add    %al,(%rax)
ffff80000010d8f8:	20 01                	and    %al,(%rcx)
ffff80000010d8fa:	00 00                	add    %al,(%rax)
ffff80000010d8fc:	11 6d ff             	adc    %ebp,-0x1(%rbp)
ffff80000010d8ff:	ff 6f 00             	ljmp   *0x0(%rdi)
ffff80000010d902:	00 00                	add    %al,(%rax)
ffff80000010d904:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010d907:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d90d:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010d910:	02 64 0c 07          	add    0x7(%rsp,%rcx,1),%ah
ffff80000010d914:	08 00                	or     %al,(%rax)
ffff80000010d916:	00 00                	add    %al,(%rax)
ffff80000010d918:	20 00                	and    %al,(%rax)
ffff80000010d91a:	00 00                	add    %al,(%rax)
ffff80000010d91c:	44 01 00             	add    %r8d,(%rax)
ffff80000010d91f:	00 5c 6d ff          	add    %bl,-0x1(%rbp,%rbp,2)
ffff80000010d923:	ff 5c 00 00          	lcall  *0x0(%rax,%rax,1)
ffff80000010d927:	00 00                	add    %al,(%rax)
ffff80000010d929:	41 0e                	rex.B (bad) 
ffff80000010d92b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d931:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010d934:	02 51 0c             	add    0xc(%rcx),%dl
ffff80000010d937:	07                   	(bad)  
ffff80000010d938:	08 00                	or     %al,(%rax)
ffff80000010d93a:	00 00                	add    %al,(%rax)
ffff80000010d93c:	20 00                	and    %al,(%rax)
ffff80000010d93e:	00 00                	add    %al,(%rax)
ffff80000010d940:	68 01 00 00 94       	pushq  $0xffffffff94000001
ffff80000010d945:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000010d946:	ff                   	(bad)  
ffff80000010d947:	ff 35 02 00 00 00    	pushq  0x2(%rip)        # ffff80000010d94f <_erodata+0x179>
ffff80000010d94d:	41 0e                	rex.B (bad) 
ffff80000010d94f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d955:	43 8f 03             	rex.XB popq (%r11)
ffff80000010d958:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
ffff80000010d95c:	00 00                	add    %al,(%rax)
ffff80000010d95e:	00 00                	add    %al,(%rax)
ffff80000010d960:	1c 00                	sbb    $0x0,%al
ffff80000010d962:	00 00                	add    %al,(%rax)
ffff80000010d964:	8c 01                	mov    %es,(%rcx)
ffff80000010d966:	00 00                	add    %al,(%rax)
ffff80000010d968:	a5                   	movsl  %ds:(%rsi),%es:(%rdi)
ffff80000010d969:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010d96a:	ff                   	(bad)  
ffff80000010d96b:	ff 07                	incl   (%rdi)
ffff80000010d96d:	01 00                	add    %eax,(%rax)
ffff80000010d96f:	00 00                	add    %al,(%rax)
ffff80000010d971:	41 0e                	rex.B (bad) 
ffff80000010d973:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d979:	03 02                	add    (%rdx),%eax
ffff80000010d97b:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff80000010d97e:	08 00                	or     %al,(%rax)
ffff80000010d980:	1c 00                	sbb    $0x0,%al
ffff80000010d982:	00 00                	add    %al,(%rax)
ffff80000010d984:	ac                   	lods   %ds:(%rsi),%al
ffff80000010d985:	01 00                	add    %eax,(%rax)
ffff80000010d987:	00 8c 70 ff ff 06 01 	add    %cl,0x106ffff(%rax,%rsi,2)
ffff80000010d98e:	00 00                	add    %al,(%rax)
ffff80000010d990:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010d993:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d999:	03 01                	add    (%rcx),%eax
ffff80000010d99b:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff80000010d99e:	08 00                	or     %al,(%rax)
ffff80000010d9a0:	20 00                	and    %al,(%rax)
ffff80000010d9a2:	00 00                	add    %al,(%rax)
ffff80000010d9a4:	cc                   	int3   
ffff80000010d9a5:	01 00                	add    %eax,(%rax)
ffff80000010d9a7:	00 72 71             	add    %dh,0x71(%rdx)
ffff80000010d9aa:	ff                   	(bad)  
ffff80000010d9ab:	ff c7                	inc    %edi
ffff80000010d9ad:	03 00                	add    (%rax),%eax
ffff80000010d9af:	00 00                	add    %al,(%rax)
ffff80000010d9b1:	41 0e                	rex.B (bad) 
ffff80000010d9b3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d9b9:	45 83 03 03          	rex.RB addl $0x3,(%r11)
ffff80000010d9bd:	bd 03 0c 07 08       	mov    $0x8070c03,%ebp
ffff80000010d9c2:	00 00                	add    %al,(%rax)
ffff80000010d9c4:	20 00                	and    %al,(%rax)
ffff80000010d9c6:	00 00                	add    %al,(%rax)
ffff80000010d9c8:	f0 01 00             	lock add %eax,(%rax)
ffff80000010d9cb:	00 15 75 ff ff 9a    	add    %dl,-0x6500008b(%rip)        # ffff7fff9b10d946 <OLDSS+0xffff7fff9b10d88e>
ffff80000010d9d1:	03 00                	add    (%rax),%eax
ffff80000010d9d3:	00 00                	add    %al,(%rax)
ffff80000010d9d5:	41 0e                	rex.B (bad) 
ffff80000010d9d7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010d9dd:	48 83 03 03          	addq   $0x3,(%rbx)
ffff80000010d9e1:	8d 03                	lea    (%rbx),%eax
ffff80000010d9e3:	0c 07                	or     $0x7,%al
ffff80000010d9e5:	08 00                	or     %al,(%rax)
ffff80000010d9e7:	00 18                	add    %bl,(%rax)
ffff80000010d9e9:	00 00                	add    %al,(%rax)
ffff80000010d9eb:	00 14 02             	add    %dl,(%rdx,%rax,1)
ffff80000010d9ee:	00 00                	add    %al,(%rax)
ffff80000010d9f0:	8b 78 ff             	mov    -0x1(%rax),%edi
ffff80000010d9f3:	ff 83 00 00 00 00    	incl   0x0(%rbx)
ffff80000010d9f9:	41 0e                	rex.B (bad) 
ffff80000010d9fb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010da01:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010da04:	18 00                	sbb    %al,(%rax)
ffff80000010da06:	00 00                	add    %al,(%rax)
ffff80000010da08:	30 02                	xor    %al,(%rdx)
ffff80000010da0a:	00 00                	add    %al,(%rax)
ffff80000010da0c:	f2 78 ff             	bnd js ffff80000010da0e <_erodata+0x238>
ffff80000010da0f:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010da15:	41 0e                	rex.B (bad) 
ffff80000010da17:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010da1d:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010da20:	18 00                	sbb    %al,(%rax)
ffff80000010da22:	00 00                	add    %al,(%rax)
ffff80000010da24:	4c 02 00             	rex.WR add (%rax),%r8b
ffff80000010da27:	00 5c 79 ff          	add    %bl,-0x1(%rcx,%rdi,2)
ffff80000010da2b:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010da31:	41 0e                	rex.B (bad) 
ffff80000010da33:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010da39:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010da3c:	18 00                	sbb    %al,(%rax)
ffff80000010da3e:	00 00                	add    %al,(%rax)
ffff80000010da40:	68 02 00 00 c6       	pushq  $0xffffffffc6000002
ffff80000010da45:	79 ff                	jns    ffff80000010da46 <_erodata+0x270>
ffff80000010da47:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010da4d:	41 0e                	rex.B (bad) 
ffff80000010da4f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010da55:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010da58:	18 00                	sbb    %al,(%rax)
ffff80000010da5a:	00 00                	add    %al,(%rax)
ffff80000010da5c:	84 02                	test   %al,(%rdx)
ffff80000010da5e:	00 00                	add    %al,(%rax)
ffff80000010da60:	30 7a ff             	xor    %bh,-0x1(%rdx)
ffff80000010da63:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010da69:	41 0e                	rex.B (bad) 
ffff80000010da6b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010da71:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010da74:	18 00                	sbb    %al,(%rax)
ffff80000010da76:	00 00                	add    %al,(%rax)
ffff80000010da78:	a0 02 00 00 9a 7a ff 	movabs 0x86ffff7a9a000002,%al
ffff80000010da7f:	ff 86 
ffff80000010da81:	00 00                	add    %al,(%rax)
ffff80000010da83:	00 00                	add    %al,(%rax)
ffff80000010da85:	41 0e                	rex.B (bad) 
ffff80000010da87:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010da8d:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010da90:	18 00                	sbb    %al,(%rax)
ffff80000010da92:	00 00                	add    %al,(%rax)
ffff80000010da94:	bc 02 00 00 04       	mov    $0x4000002,%esp
ffff80000010da99:	7b ff                	jnp    ffff80000010da9a <_erodata+0x2c4>
ffff80000010da9b:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010daa1:	41 0e                	rex.B (bad) 
ffff80000010daa3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010daa9:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010daac:	18 00                	sbb    %al,(%rax)
ffff80000010daae:	00 00                	add    %al,(%rax)
ffff80000010dab0:	d8 02                	fadds  (%rdx)
ffff80000010dab2:	00 00                	add    %al,(%rax)
ffff80000010dab4:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010dab5:	7b ff                	jnp    ffff80000010dab6 <_erodata+0x2e0>
ffff80000010dab7:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010dabd:	41 0e                	rex.B (bad) 
ffff80000010dabf:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dac5:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010dac8:	18 00                	sbb    %al,(%rax)
ffff80000010daca:	00 00                	add    %al,(%rax)
ffff80000010dacc:	f4                   	hlt    
ffff80000010dacd:	02 00                	add    (%rax),%al
ffff80000010dacf:	00 d8                	add    %bl,%al
ffff80000010dad1:	7b ff                	jnp    ffff80000010dad2 <_erodata+0x2fc>
ffff80000010dad3:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010dad9:	41 0e                	rex.B (bad) 
ffff80000010dadb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dae1:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010dae4:	18 00                	sbb    %al,(%rax)
ffff80000010dae6:	00 00                	add    %al,(%rax)
ffff80000010dae8:	10 03                	adc    %al,(%rbx)
ffff80000010daea:	00 00                	add    %al,(%rax)
ffff80000010daec:	42 7c ff             	rex.X jl ffff80000010daee <_erodata+0x318>
ffff80000010daef:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010daf5:	41 0e                	rex.B (bad) 
ffff80000010daf7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dafd:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010db00:	1c 00                	sbb    $0x0,%al
ffff80000010db02:	00 00                	add    %al,(%rax)
ffff80000010db04:	2c 03                	sub    $0x3,%al
ffff80000010db06:	00 00                	add    %al,(%rax)
ffff80000010db08:	ac                   	lods   %ds:(%rsi),%al
ffff80000010db09:	7c ff                	jl     ffff80000010db0a <_erodata+0x334>
ffff80000010db0b:	ff e2                	jmpq   *%rdx
ffff80000010db0d:	01 00                	add    %eax,(%rax)
ffff80000010db0f:	00 00                	add    %al,(%rax)
ffff80000010db11:	41 0e                	rex.B (bad) 
ffff80000010db13:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010db19:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010db1c:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
ffff80000010db20:	1c 00                	sbb    $0x0,%al
ffff80000010db22:	00 00                	add    %al,(%rax)
ffff80000010db24:	4c 03 00             	add    (%rax),%r8
ffff80000010db27:	00 6e 7e             	add    %ch,0x7e(%rsi)
ffff80000010db2a:	ff                   	(bad)  
ffff80000010db2b:	ff e2                	jmpq   *%rdx
ffff80000010db2d:	01 00                	add    %eax,(%rax)
ffff80000010db2f:	00 00                	add    %al,(%rax)
ffff80000010db31:	41 0e                	rex.B (bad) 
ffff80000010db33:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010db39:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010db3c:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
ffff80000010db40:	1c 00                	sbb    $0x0,%al
ffff80000010db42:	00 00                	add    %al,(%rax)
ffff80000010db44:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000010db45:	03 00                	add    (%rax),%eax
ffff80000010db47:	00 30                	add    %dh,(%rax)
ffff80000010db49:	80 ff ff             	cmp    $0xff,%bh
ffff80000010db4c:	e2 01                	loop   ffff80000010db4f <_erodata+0x379>
ffff80000010db4e:	00 00                	add    %al,(%rax)
ffff80000010db50:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010db53:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010db59:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010db5c:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
ffff80000010db60:	1c 00                	sbb    $0x0,%al
ffff80000010db62:	00 00                	add    %al,(%rax)
ffff80000010db64:	8c 03                	mov    %es,(%rbx)
ffff80000010db66:	00 00                	add    %al,(%rax)
ffff80000010db68:	f2 81 ff ff e2 01 00 	repnz cmp $0x1e2ff,%edi
ffff80000010db6f:	00 00                	add    %al,(%rax)
ffff80000010db71:	41 0e                	rex.B (bad) 
ffff80000010db73:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010db79:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010db7c:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
ffff80000010db80:	1c 00                	sbb    $0x0,%al
ffff80000010db82:	00 00                	add    %al,(%rax)
ffff80000010db84:	ac                   	lods   %ds:(%rsi),%al
ffff80000010db85:	03 00                	add    (%rax),%eax
ffff80000010db87:	00 b4 83 ff ff 56 02 	add    %dh,0x256ffff(%rbx,%rax,4)
ffff80000010db8e:	00 00                	add    %al,(%rax)
ffff80000010db90:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010db93:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010db99:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010db9c:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
ffff80000010dba0:	18 00                	sbb    %al,(%rax)
ffff80000010dba2:	00 00                	add    %al,(%rax)
ffff80000010dba4:	cc                   	int3   
ffff80000010dba5:	03 00                	add    (%rax),%eax
ffff80000010dba7:	00 ea                	add    %ch,%dl
ffff80000010dba9:	85 ff                	test   %edi,%edi
ffff80000010dbab:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010dbb1:	41 0e                	rex.B (bad) 
ffff80000010dbb3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dbb9:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010dbbc:	18 00                	sbb    %al,(%rax)
ffff80000010dbbe:	00 00                	add    %al,(%rax)
ffff80000010dbc0:	e8 03 00 00 54       	callq  ffff80005410dbc8 <_end+0x53fe4770>
ffff80000010dbc5:	86 ff                	xchg   %bh,%bh
ffff80000010dbc7:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010dbcd:	41 0e                	rex.B (bad) 
ffff80000010dbcf:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dbd5:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010dbd8:	18 00                	sbb    %al,(%rax)
ffff80000010dbda:	00 00                	add    %al,(%rax)
ffff80000010dbdc:	04 04                	add    $0x4,%al
ffff80000010dbde:	00 00                	add    %al,(%rax)
ffff80000010dbe0:	be 86 ff ff 86       	mov    $0x86ffff86,%esi
ffff80000010dbe5:	00 00                	add    %al,(%rax)
ffff80000010dbe7:	00 00                	add    %al,(%rax)
ffff80000010dbe9:	41 0e                	rex.B (bad) 
ffff80000010dbeb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dbf1:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010dbf4:	18 00                	sbb    %al,(%rax)
ffff80000010dbf6:	00 00                	add    %al,(%rax)
ffff80000010dbf8:	20 04 00             	and    %al,(%rax,%rax,1)
ffff80000010dbfb:	00 28                	add    %ch,(%rax)
ffff80000010dbfd:	87 ff                	xchg   %edi,%edi
ffff80000010dbff:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010dc05:	41 0e                	rex.B (bad) 
ffff80000010dc07:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dc0d:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010dc10:	18 00                	sbb    %al,(%rax)
ffff80000010dc12:	00 00                	add    %al,(%rax)
ffff80000010dc14:	3c 04                	cmp    $0x4,%al
ffff80000010dc16:	00 00                	add    %al,(%rax)
ffff80000010dc18:	92                   	xchg   %eax,%edx
ffff80000010dc19:	87 ff                	xchg   %edi,%edi
ffff80000010dc1b:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010dc21:	41 0e                	rex.B (bad) 
ffff80000010dc23:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dc29:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010dc2c:	20 00                	and    %al,(%rax)
ffff80000010dc2e:	00 00                	add    %al,(%rax)
ffff80000010dc30:	58                   	pop    %rax
ffff80000010dc31:	04 00                	add    $0x0,%al
ffff80000010dc33:	00 fc                	add    %bh,%ah
ffff80000010dc35:	87 ff                	xchg   %edi,%edi
ffff80000010dc37:	ff 09                	decl   (%rcx)
ffff80000010dc39:	04 00                	add    $0x0,%al
ffff80000010dc3b:	00 00                	add    %al,(%rax)
ffff80000010dc3d:	41 0e                	rex.B (bad) 
ffff80000010dc3f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dc45:	43 8f 03             	rex.XB popq (%r11)
ffff80000010dc48:	83 04 03 01          	addl   $0x1,(%rbx,%rax,1)
ffff80000010dc4c:	04 0c                	add    $0xc,%al
ffff80000010dc4e:	07                   	(bad)  
ffff80000010dc4f:	08 1c 00             	or     %bl,(%rax,%rax,1)
ffff80000010dc52:	00 00                	add    %al,(%rax)
ffff80000010dc54:	7c 04                	jl     ffff80000010dc5a <_erodata+0x484>
ffff80000010dc56:	00 00                	add    %al,(%rax)
ffff80000010dc58:	e1 8b                	loope  ffff80000010dbe5 <_erodata+0x40f>
ffff80000010dc5a:	ff                   	(bad)  
ffff80000010dc5b:	ff 82 00 00 00 00    	incl   0x0(%rdx)
ffff80000010dc61:	41 0e                	rex.B (bad) 
ffff80000010dc63:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dc69:	02 7d 0c             	add    0xc(%rbp),%bh
ffff80000010dc6c:	07                   	(bad)  
ffff80000010dc6d:	08 00                	or     %al,(%rax)
ffff80000010dc6f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010dc72:	00 00                	add    %al,(%rax)
ffff80000010dc74:	9c                   	pushfq 
ffff80000010dc75:	04 00                	add    $0x0,%al
ffff80000010dc77:	00 43 8c             	add    %al,-0x74(%rbx)
ffff80000010dc7a:	ff                   	(bad)  
ffff80000010dc7b:	ff 6d 00             	ljmp   *0x0(%rbp)
ffff80000010dc7e:	00 00                	add    %al,(%rax)
ffff80000010dc80:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010dc83:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dc89:	02 68 0c             	add    0xc(%rax),%ch
ffff80000010dc8c:	07                   	(bad)  
ffff80000010dc8d:	08 00                	or     %al,(%rax)
ffff80000010dc8f:	00 20                	add    %ah,(%rax)
ffff80000010dc91:	00 00                	add    %al,(%rax)
ffff80000010dc93:	00 bc 04 00 00 90 8c 	add    %bh,-0x73700000(%rsp,%rax,1)
ffff80000010dc9a:	ff                   	(bad)  
ffff80000010dc9b:	ff 70 00             	pushq  0x0(%rax)
ffff80000010dc9e:	00 00                	add    %al,(%rax)
ffff80000010dca0:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010dca3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dca9:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010dcac:	02 65 0c             	add    0xc(%rbp),%ah
ffff80000010dcaf:	07                   	(bad)  
ffff80000010dcb0:	08 00                	or     %al,(%rax)
ffff80000010dcb2:	00 00                	add    %al,(%rax)
ffff80000010dcb4:	20 00                	and    %al,(%rax)
ffff80000010dcb6:	00 00                	add    %al,(%rax)
ffff80000010dcb8:	e0 04                	loopne ffff80000010dcbe <_erodata+0x4e8>
ffff80000010dcba:	00 00                	add    %al,(%rax)
ffff80000010dcbc:	dc 8c ff ff 7d 00 00 	fmull  0x7dff(%rdi,%rdi,8)
ffff80000010dcc3:	00 00                	add    %al,(%rax)
ffff80000010dcc5:	41 0e                	rex.B (bad) 
ffff80000010dcc7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dccd:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010dcd0:	02 72 0c             	add    0xc(%rdx),%dh
ffff80000010dcd3:	07                   	(bad)  
ffff80000010dcd4:	08 00                	or     %al,(%rax)
ffff80000010dcd6:	00 00                	add    %al,(%rax)
ffff80000010dcd8:	20 00                	and    %al,(%rax)
ffff80000010dcda:	00 00                	add    %al,(%rax)
ffff80000010dcdc:	04 05                	add    $0x5,%al
ffff80000010dcde:	00 00                	add    %al,(%rax)
ffff80000010dce0:	35 8d ff ff d0       	xor    $0xd0ffff8d,%eax
ffff80000010dce5:	0d 00 00 00 41       	or     $0x41000000,%eax
ffff80000010dcea:	0e                   	(bad)  
ffff80000010dceb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dcf1:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010dcf4:	83 04 03 c4          	addl   $0xffffffc4,(%rbx,%rax,1)
ffff80000010dcf8:	0d 0c 07 08 20       	or     $0x2008070c,%eax
ffff80000010dcfd:	00 00                	add    %al,(%rax)
ffff80000010dcff:	00 28                	add    %ch,(%rax)
ffff80000010dd01:	05 00 00 e1 9a       	add    $0x9ae10000,%eax
ffff80000010dd06:	ff                   	(bad)  
ffff80000010dd07:	ff 92 03 00 00 00    	callq  *0x3(%rdx)
ffff80000010dd0d:	41 0e                	rex.B (bad) 
ffff80000010dd0f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dd15:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010dd18:	83 04 03 86          	addl   $0xffffff86,(%rbx,%rax,1)
ffff80000010dd1c:	03 0c 07             	add    (%rdi,%rax,1),%ecx
ffff80000010dd1f:	08 24 00             	or     %ah,(%rax,%rax,1)
ffff80000010dd22:	00 00                	add    %al,(%rax)
ffff80000010dd24:	4c 05 00 00 4f 9e    	rex.WR add $0xffffffff9e4f0000,%rax
ffff80000010dd2a:	ff                   	(bad)  
ffff80000010dd2b:	ff 76 01             	pushq  0x1(%rsi)
ffff80000010dd2e:	00 00                	add    %al,(%rax)
ffff80000010dd30:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010dd33:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dd39:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010dd3c:	03 6b 01             	add    0x1(%rbx),%ebp
ffff80000010dd3f:	0c 07                	or     $0x7,%al
ffff80000010dd41:	08 00                	or     %al,(%rax)
ffff80000010dd43:	00 00                	add    %al,(%rax)
ffff80000010dd45:	00 00                	add    %al,(%rax)
ffff80000010dd47:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010dd4a:	00 00                	add    %al,(%rax)
ffff80000010dd4c:	74 05                	je     ffff80000010dd53 <_erodata+0x57d>
ffff80000010dd4e:	00 00                	add    %al,(%rax)
ffff80000010dd50:	9d                   	popfq  
ffff80000010dd51:	9f                   	lahf   
ffff80000010dd52:	ff                   	(bad)  
ffff80000010dd53:	ff 57 00             	callq  *0x0(%rdi)
ffff80000010dd56:	00 00                	add    %al,(%rax)
ffff80000010dd58:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010dd5b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dd61:	02 52 0c             	add    0xc(%rdx),%dl
ffff80000010dd64:	07                   	(bad)  
ffff80000010dd65:	08 00                	or     %al,(%rax)
ffff80000010dd67:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010dd6a:	00 00                	add    %al,(%rax)
ffff80000010dd6c:	94                   	xchg   %eax,%esp
ffff80000010dd6d:	05 00 00 d4 9f       	add    $0x9fd40000,%eax
ffff80000010dd72:	ff                   	(bad)  
ffff80000010dd73:	ff 6a 00             	ljmp   *0x0(%rdx)
ffff80000010dd76:	00 00                	add    %al,(%rax)
ffff80000010dd78:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010dd7b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dd81:	02 65 0c             	add    0xc(%rbp),%ah
ffff80000010dd84:	07                   	(bad)  
ffff80000010dd85:	08 00                	or     %al,(%rax)
ffff80000010dd87:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010dd8a:	00 00                	add    %al,(%rax)
ffff80000010dd8c:	b4 05                	mov    $0x5,%ah
ffff80000010dd8e:	00 00                	add    %al,(%rax)
ffff80000010dd90:	1e                   	(bad)  
ffff80000010dd91:	a0 ff ff 25 00 00 00 	movabs 0x410000000025ffff,%al
ffff80000010dd98:	00 41 
ffff80000010dd9a:	0e                   	(bad)  
ffff80000010dd9b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dda1:	60                   	(bad)  
ffff80000010dda2:	0c 07                	or     $0x7,%al
ffff80000010dda4:	08 00                	or     %al,(%rax)
ffff80000010dda6:	00 00                	add    %al,(%rax)
ffff80000010dda8:	1c 00                	sbb    $0x0,%al
ffff80000010ddaa:	00 00                	add    %al,(%rax)
ffff80000010ddac:	d4                   	(bad)  
ffff80000010ddad:	05 00 00 23 a0       	add    $0xa0230000,%eax
ffff80000010ddb2:	ff                   	(bad)  
ffff80000010ddb3:	ff 25 00 00 00 00    	jmpq   *0x0(%rip)        # ffff80000010ddb9 <_erodata+0x5e3>
ffff80000010ddb9:	41 0e                	rex.B (bad) 
ffff80000010ddbb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010ddc1:	60                   	(bad)  
ffff80000010ddc2:	0c 07                	or     $0x7,%al
ffff80000010ddc4:	08 00                	or     %al,(%rax)
ffff80000010ddc6:	00 00                	add    %al,(%rax)
ffff80000010ddc8:	1c 00                	sbb    $0x0,%al
ffff80000010ddca:	00 00                	add    %al,(%rax)
ffff80000010ddcc:	f4                   	hlt    
ffff80000010ddcd:	05 00 00 28 a0       	add    $0xa0280000,%eax
ffff80000010ddd2:	ff                   	(bad)  
ffff80000010ddd3:	ff 32                	pushq  (%rdx)
ffff80000010ddd5:	00 00                	add    %al,(%rax)
ffff80000010ddd7:	00 00                	add    %al,(%rax)
ffff80000010ddd9:	41 0e                	rex.B (bad) 
ffff80000010dddb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dde1:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000010dde2:	0c 07                	or     $0x7,%al
ffff80000010dde4:	08 00                	or     %al,(%rax)
ffff80000010dde6:	00 00                	add    %al,(%rax)
ffff80000010dde8:	1c 00                	sbb    $0x0,%al
ffff80000010ddea:	00 00                	add    %al,(%rax)
ffff80000010ddec:	14 06                	adc    $0x6,%al
ffff80000010ddee:	00 00                	add    %al,(%rax)
ffff80000010ddf0:	3a a0 ff ff 35 00    	cmp    0x35ffff(%rax),%ah
ffff80000010ddf6:	00 00                	add    %al,(%rax)
ffff80000010ddf8:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010ddfb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010de01:	70 0c                	jo     ffff80000010de0f <_erodata+0x639>
ffff80000010de03:	07                   	(bad)  
ffff80000010de04:	08 00                	or     %al,(%rax)
ffff80000010de06:	00 00                	add    %al,(%rax)
ffff80000010de08:	1c 00                	sbb    $0x0,%al
ffff80000010de0a:	00 00                	add    %al,(%rax)
ffff80000010de0c:	34 06                	xor    $0x6,%al
ffff80000010de0e:	00 00                	add    %al,(%rax)
ffff80000010de10:	4f a0 ff ff 36 00 00 	rex.WRXB movabs 0x410000000036ffff,%al
ffff80000010de17:	00 00 41 
ffff80000010de1a:	0e                   	(bad)  
ffff80000010de1b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010de21:	71 0c                	jno    ffff80000010de2f <_erodata+0x659>
ffff80000010de23:	07                   	(bad)  
ffff80000010de24:	08 00                	or     %al,(%rax)
ffff80000010de26:	00 00                	add    %al,(%rax)
ffff80000010de28:	1c 00                	sbb    $0x0,%al
ffff80000010de2a:	00 00                	add    %al,(%rax)
ffff80000010de2c:	54                   	push   %rsp
ffff80000010de2d:	06                   	(bad)  
ffff80000010de2e:	00 00                	add    %al,(%rax)
ffff80000010de30:	65 a0 ff ff 59 00 00 	movabs %gs:0x410000000059ffff,%al
ffff80000010de37:	00 00 41 
ffff80000010de3a:	0e                   	(bad)  
ffff80000010de3b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010de41:	02 54 0c 07          	add    0x7(%rsp,%rcx,1),%dl
ffff80000010de45:	08 00                	or     %al,(%rax)
ffff80000010de47:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010de4a:	00 00                	add    %al,(%rax)
ffff80000010de4c:	74 06                	je     ffff80000010de54 <_erodata+0x67e>
ffff80000010de4e:	00 00                	add    %al,(%rax)
ffff80000010de50:	9e                   	sahf   
ffff80000010de51:	a0 ff ff 57 00 00 00 	movabs 0x410000000057ffff,%al
ffff80000010de58:	00 41 
ffff80000010de5a:	0e                   	(bad)  
ffff80000010de5b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010de61:	02 52 0c             	add    0xc(%rdx),%dl
ffff80000010de64:	07                   	(bad)  
ffff80000010de65:	08 00                	or     %al,(%rax)
ffff80000010de67:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010de6a:	00 00                	add    %al,(%rax)
ffff80000010de6c:	94                   	xchg   %eax,%esp
ffff80000010de6d:	06                   	(bad)  
ffff80000010de6e:	00 00                	add    %al,(%rax)
ffff80000010de70:	d5                   	(bad)  
ffff80000010de71:	a0 ff ff 44 00 00 00 	movabs 0x410000000044ffff,%al
ffff80000010de78:	00 41 
ffff80000010de7a:	0e                   	(bad)  
ffff80000010de7b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010de81:	7f 0c                	jg     ffff80000010de8f <_erodata+0x6b9>
ffff80000010de83:	07                   	(bad)  
ffff80000010de84:	08 00                	or     %al,(%rax)
ffff80000010de86:	00 00                	add    %al,(%rax)
ffff80000010de88:	1c 00                	sbb    $0x0,%al
ffff80000010de8a:	00 00                	add    %al,(%rax)
ffff80000010de8c:	b4 06                	mov    $0x6,%ah
ffff80000010de8e:	00 00                	add    %al,(%rax)
ffff80000010de90:	f9                   	stc    
ffff80000010de91:	a0 ff ff 45 00 00 00 	movabs 0x410000000045ffff,%al
ffff80000010de98:	00 41 
ffff80000010de9a:	0e                   	(bad)  
ffff80000010de9b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dea1:	02 40 0c             	add    0xc(%rax),%al
ffff80000010dea4:	07                   	(bad)  
ffff80000010dea5:	08 00                	or     %al,(%rax)
ffff80000010dea7:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010deaa:	00 00                	add    %al,(%rax)
ffff80000010deac:	d4                   	(bad)  
ffff80000010dead:	06                   	(bad)  
ffff80000010deae:	00 00                	add    %al,(%rax)
ffff80000010deb0:	1e                   	(bad)  
ffff80000010deb1:	a1 ff ff 3a 00 00 00 	movabs 0x41000000003affff,%eax
ffff80000010deb8:	00 41 
ffff80000010deba:	0e                   	(bad)  
ffff80000010debb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dec1:	75 0c                	jne    ffff80000010decf <_erodata+0x6f9>
ffff80000010dec3:	07                   	(bad)  
ffff80000010dec4:	08 00                	or     %al,(%rax)
ffff80000010dec6:	00 00                	add    %al,(%rax)
ffff80000010dec8:	1c 00                	sbb    $0x0,%al
ffff80000010deca:	00 00                	add    %al,(%rax)
ffff80000010decc:	f4                   	hlt    
ffff80000010decd:	06                   	(bad)  
ffff80000010dece:	00 00                	add    %al,(%rax)
ffff80000010ded0:	38 a1 ff ff 3a 00    	cmp    %ah,0x3affff(%rcx)
ffff80000010ded6:	00 00                	add    %al,(%rax)
ffff80000010ded8:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010dedb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dee1:	75 0c                	jne    ffff80000010deef <_erodata+0x719>
ffff80000010dee3:	07                   	(bad)  
ffff80000010dee4:	08 00                	or     %al,(%rax)
ffff80000010dee6:	00 00                	add    %al,(%rax)
ffff80000010dee8:	20 00                	and    %al,(%rax)
ffff80000010deea:	00 00                	add    %al,(%rax)
ffff80000010deec:	14 07                	adc    $0x7,%al
ffff80000010deee:	00 00                	add    %al,(%rax)
ffff80000010def0:	42 a8 ff             	rex.X test $0xff,%al
ffff80000010def3:	ff                   	(bad)  
ffff80000010def4:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010def9:	41 0e                	rex.B (bad) 
ffff80000010defb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010df01:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010df04:	83 04 03 b2          	addl   $0xffffffb2,(%rbx,%rax,1)
ffff80000010df08:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff80000010df0b:	08 20                	or     %ah,(%rax)
ffff80000010df0d:	00 00                	add    %al,(%rax)
ffff80000010df0f:	00 38                	add    %bh,(%rax)
ffff80000010df11:	07                   	(bad)  
ffff80000010df12:	00 00                	add    %al,(%rax)
ffff80000010df14:	dc a9 ff ff a2 00    	fsubrl 0xa2ffff(%rcx)
ffff80000010df1a:	00 00                	add    %al,(%rax)
ffff80000010df1c:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010df1f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010df25:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010df28:	83 04 02 96          	addl   $0xffffff96,(%rdx,%rax,1)
ffff80000010df2c:	0c 07                	or     $0x7,%al
ffff80000010df2e:	08 00                	or     %al,(%rax)
ffff80000010df30:	20 00                	and    %al,(%rax)
ffff80000010df32:	00 00                	add    %al,(%rax)
ffff80000010df34:	5c                   	pop    %rsp
ffff80000010df35:	07                   	(bad)  
ffff80000010df36:	00 00                	add    %al,(%rax)
ffff80000010df38:	5a                   	pop    %rdx
ffff80000010df39:	aa                   	stos   %al,%es:(%rdi)
ffff80000010df3a:	ff                   	(bad)  
ffff80000010df3b:	ff 57 00             	callq  *0x0(%rdi)
ffff80000010df3e:	00 00                	add    %al,(%rax)
ffff80000010df40:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010df43:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010df49:	41 83 03 02          	addl   $0x2,(%r11)
ffff80000010df4d:	51                   	push   %rcx
ffff80000010df4e:	0c 07                	or     $0x7,%al
ffff80000010df50:	08 00                	or     %al,(%rax)
ffff80000010df52:	00 00                	add    %al,(%rax)
ffff80000010df54:	1c 00                	sbb    $0x0,%al
ffff80000010df56:	00 00                	add    %al,(%rax)
ffff80000010df58:	80 07 00             	addb   $0x0,(%rdi)
ffff80000010df5b:	00 8d aa ff ff 34    	add    %cl,0x34ffffaa(%rbp)
ffff80000010df61:	00 00                	add    %al,(%rax)
ffff80000010df63:	00 00                	add    %al,(%rax)
ffff80000010df65:	41 0e                	rex.B (bad) 
ffff80000010df67:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010df6d:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010df6e:	0c 07                	or     $0x7,%al
ffff80000010df70:	08 00                	or     %al,(%rax)
ffff80000010df72:	00 00                	add    %al,(%rax)
ffff80000010df74:	20 00                	and    %al,(%rax)
ffff80000010df76:	00 00                	add    %al,(%rax)
ffff80000010df78:	a0 07 00 00 a1 aa ff 	movabs 0x6fffffaaa1000007,%al
ffff80000010df7f:	ff 6f 
ffff80000010df81:	00 00                	add    %al,(%rax)
ffff80000010df83:	00 00                	add    %al,(%rax)
ffff80000010df85:	41 0e                	rex.B (bad) 
ffff80000010df87:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010df8d:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010df90:	02 64 0c 07          	add    0x7(%rsp,%rcx,1),%ah
ffff80000010df94:	08 00                	or     %al,(%rax)
ffff80000010df96:	00 00                	add    %al,(%rax)
ffff80000010df98:	20 00                	and    %al,(%rax)
ffff80000010df9a:	00 00                	add    %al,(%rax)
ffff80000010df9c:	c4                   	(bad)  
ffff80000010df9d:	07                   	(bad)  
ffff80000010df9e:	00 00                	add    %al,(%rax)
ffff80000010dfa0:	ec                   	in     (%dx),%al
ffff80000010dfa1:	aa                   	stos   %al,%es:(%rdi)
ffff80000010dfa2:	ff                   	(bad)  
ffff80000010dfa3:	ff 5c 00 00          	lcall  *0x0(%rax,%rax,1)
ffff80000010dfa7:	00 00                	add    %al,(%rax)
ffff80000010dfa9:	41 0e                	rex.B (bad) 
ffff80000010dfab:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dfb1:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010dfb4:	02 51 0c             	add    0xc(%rcx),%dl
ffff80000010dfb7:	07                   	(bad)  
ffff80000010dfb8:	08 00                	or     %al,(%rax)
ffff80000010dfba:	00 00                	add    %al,(%rax)
ffff80000010dfbc:	1c 00                	sbb    $0x0,%al
ffff80000010dfbe:	00 00                	add    %al,(%rax)
ffff80000010dfc0:	e8 07 00 00 24       	callq  ffff80002410dfcc <_end+0x23fe4b74>
ffff80000010dfc5:	ab                   	stos   %eax,%es:(%rdi)
ffff80000010dfc6:	ff                   	(bad)  
ffff80000010dfc7:	ff aa 00 00 00 00    	ljmp   *0x0(%rdx)
ffff80000010dfcd:	41 0e                	rex.B (bad) 
ffff80000010dfcf:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dfd5:	02 a5 0c 07 08 00    	add    0x8070c(%rbp),%ah
ffff80000010dfdb:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010dfde:	00 00                	add    %al,(%rax)
ffff80000010dfe0:	08 08                	or     %cl,(%rax)
ffff80000010dfe2:	00 00                	add    %al,(%rax)
ffff80000010dfe4:	ae                   	scas   %es:(%rdi),%al
ffff80000010dfe5:	ab                   	stos   %eax,%es:(%rdi)
ffff80000010dfe6:	ff                   	(bad)  
ffff80000010dfe7:	ff 53 00             	callq  *0x0(%rbx)
ffff80000010dfea:	00 00                	add    %al,(%rax)
ffff80000010dfec:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010dfef:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010dff5:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010dff8:	07                   	(bad)  
ffff80000010dff9:	08 00                	or     %al,(%rax)
ffff80000010dffb:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010dffe:	00 00                	add    %al,(%rax)
ffff80000010e000:	28 08                	sub    %cl,(%rax)
ffff80000010e002:	00 00                	add    %al,(%rax)
ffff80000010e004:	e1 ab                	loope  ffff80000010dfb1 <_erodata+0x7db>
ffff80000010e006:	ff                   	(bad)  
ffff80000010e007:	ff 53 00             	callq  *0x0(%rbx)
ffff80000010e00a:	00 00                	add    %al,(%rax)
ffff80000010e00c:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e00f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e015:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010e018:	07                   	(bad)  
ffff80000010e019:	08 00                	or     %al,(%rax)
ffff80000010e01b:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010e01e:	00 00                	add    %al,(%rax)
ffff80000010e020:	48 08 00             	rex.W or %al,(%rax)
ffff80000010e023:	00 14 ac             	add    %dl,(%rsp,%rbp,4)
ffff80000010e026:	ff                   	(bad)  
ffff80000010e027:	ff 53 00             	callq  *0x0(%rbx)
ffff80000010e02a:	00 00                	add    %al,(%rax)
ffff80000010e02c:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e02f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e035:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010e038:	07                   	(bad)  
ffff80000010e039:	08 00                	or     %al,(%rax)
ffff80000010e03b:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010e03e:	00 00                	add    %al,(%rax)
ffff80000010e040:	68 08 00 00 47       	pushq  $0x47000008
ffff80000010e045:	ac                   	lods   %ds:(%rsi),%al
ffff80000010e046:	ff                   	(bad)  
ffff80000010e047:	ff 53 00             	callq  *0x0(%rbx)
ffff80000010e04a:	00 00                	add    %al,(%rax)
ffff80000010e04c:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e04f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e055:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010e058:	07                   	(bad)  
ffff80000010e059:	08 00                	or     %al,(%rax)
ffff80000010e05b:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010e05e:	00 00                	add    %al,(%rax)
ffff80000010e060:	88 08                	mov    %cl,(%rax)
ffff80000010e062:	00 00                	add    %al,(%rax)
ffff80000010e064:	7a ac                	jp     ffff80000010e012 <_erodata+0x83c>
ffff80000010e066:	ff                   	(bad)  
ffff80000010e067:	ff 15 01 00 00 00    	callq  *0x1(%rip)        # ffff80000010e06e <_erodata+0x898>
ffff80000010e06d:	41 0e                	rex.B (bad) 
ffff80000010e06f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e075:	03 10                	add    (%rax),%edx
ffff80000010e077:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff80000010e07a:	08 00                	or     %al,(%rax)
ffff80000010e07c:	18 00                	sbb    %al,(%rax)
ffff80000010e07e:	00 00                	add    %al,(%rax)
ffff80000010e080:	a8 08                	test   $0x8,%al
ffff80000010e082:	00 00                	add    %al,(%rax)
ffff80000010e084:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010e085:	ad                   	lods   %ds:(%rsi),%eax
ffff80000010e086:	ff                   	(bad)  
ffff80000010e087:	ff 59 00             	lcall  *0x0(%rcx)
ffff80000010e08a:	00 00                	add    %al,(%rax)
ffff80000010e08c:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e08f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e095:	00 00                	add    %al,(%rax)
ffff80000010e097:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010e09a:	00 00                	add    %al,(%rax)
ffff80000010e09c:	c4                   	(bad)  
ffff80000010e09d:	08 00                	or     %al,(%rax)
ffff80000010e09f:	00 ac ad ff ff 47 00 	add    %ch,0x47ffff(%rbp,%rbp,4)
ffff80000010e0a6:	00 00                	add    %al,(%rax)
ffff80000010e0a8:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e0ab:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e0b1:	02 42 0c             	add    0xc(%rdx),%al
ffff80000010e0b4:	07                   	(bad)  
ffff80000010e0b5:	08 00                	or     %al,(%rax)
ffff80000010e0b7:	00 20                	add    %ah,(%rax)
ffff80000010e0b9:	00 00                	add    %al,(%rax)
ffff80000010e0bb:	00 e4                	add    %ah,%ah
ffff80000010e0bd:	08 00                	or     %al,(%rax)
ffff80000010e0bf:	00 d3                	add    %dl,%bl
ffff80000010e0c1:	ad                   	lods   %ds:(%rsi),%eax
ffff80000010e0c2:	ff                   	(bad)  
ffff80000010e0c3:	ff c9                	dec    %ecx
ffff80000010e0c5:	00 00                	add    %al,(%rax)
ffff80000010e0c7:	00 00                	add    %al,(%rax)
ffff80000010e0c9:	41 0e                	rex.B (bad) 
ffff80000010e0cb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e0d1:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010e0d4:	83 04 02 bd          	addl   $0xffffffbd,(%rdx,%rax,1)
ffff80000010e0d8:	0c 07                	or     $0x7,%al
ffff80000010e0da:	08 00                	or     %al,(%rax)
ffff80000010e0dc:	1c 00                	sbb    $0x0,%al
ffff80000010e0de:	00 00                	add    %al,(%rax)
ffff80000010e0e0:	08 09                	or     %cl,(%rcx)
ffff80000010e0e2:	00 00                	add    %al,(%rax)
ffff80000010e0e4:	78 ae                	js     ffff80000010e094 <_erodata+0x8be>
ffff80000010e0e6:	ff                   	(bad)  
ffff80000010e0e7:	ff 4b 00             	decl   0x0(%rbx)
ffff80000010e0ea:	00 00                	add    %al,(%rax)
ffff80000010e0ec:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e0ef:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e0f5:	02 46 0c             	add    0xc(%rsi),%al
ffff80000010e0f8:	07                   	(bad)  
ffff80000010e0f9:	08 00                	or     %al,(%rax)
ffff80000010e0fb:	00 24 00             	add    %ah,(%rax,%rax,1)
ffff80000010e0fe:	00 00                	add    %al,(%rax)
ffff80000010e100:	28 09                	sub    %cl,(%rcx)
ffff80000010e102:	00 00                	add    %al,(%rax)
ffff80000010e104:	a3 ae ff ff 3b 01 00 	movabs %eax,0x13bffffae
ffff80000010e10b:	00 00 
ffff80000010e10d:	41 0e                	rex.B (bad) 
ffff80000010e10f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e115:	49 8f 03             	rex.WB popq (%r11)
ffff80000010e118:	8c 04 83             	mov    %es,(%rbx,%rax,4)
ffff80000010e11b:	05 03 2d 01 0c       	add    $0xc012d03,%eax
ffff80000010e120:	07                   	(bad)  
ffff80000010e121:	08 00                	or     %al,(%rax)
ffff80000010e123:	00 24 00             	add    %ah,(%rax,%rax,1)
ffff80000010e126:	00 00                	add    %al,(%rax)
ffff80000010e128:	50                   	push   %rax
ffff80000010e129:	09 00                	or     %eax,(%rax)
ffff80000010e12b:	00 b6 af ff ff 5f    	add    %dh,0x5fffffaf(%rsi)
ffff80000010e131:	01 00                	add    %eax,(%rax)
ffff80000010e133:	00 00                	add    %al,(%rax)
ffff80000010e135:	41 0e                	rex.B (bad) 
ffff80000010e137:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e13d:	49 8d 03             	lea    (%r11),%rax
ffff80000010e140:	8c 04 83             	mov    %es,(%rbx,%rax,4)
ffff80000010e143:	05 03 51 01 0c       	add    $0xc015103,%eax
ffff80000010e148:	07                   	(bad)  
ffff80000010e149:	08 00                	or     %al,(%rax)
ffff80000010e14b:	00 28                	add    %ch,(%rax)
ffff80000010e14d:	00 00                	add    %al,(%rax)
ffff80000010e14f:	00 78 09             	add    %bh,0x9(%rax)
ffff80000010e152:	00 00                	add    %al,(%rax)
ffff80000010e154:	ed                   	in     (%dx),%eax
ffff80000010e155:	b0 ff                	mov    $0xff,%al
ffff80000010e157:	ff 0b                	decl   (%rbx)
ffff80000010e159:	04 00                	add    $0x0,%al
ffff80000010e15b:	00 00                	add    %al,(%rax)
ffff80000010e15d:	41 0e                	rex.B (bad) 
ffff80000010e15f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e165:	4d 8f 03             	rex.WRB popq (%r11)
ffff80000010e168:	8e 04 8d 05 8c 06 83 	mov    -0x7cf973fb(,%rcx,4),%es
ffff80000010e16f:	07                   	(bad)  
ffff80000010e170:	03 f9                	add    %ecx,%edi
ffff80000010e172:	03 0c 07             	add    (%rdi,%rax,1),%ecx
ffff80000010e175:	08 00                	or     %al,(%rax)
ffff80000010e177:	00 20                	add    %ah,(%rax)
ffff80000010e179:	00 00                	add    %al,(%rax)
ffff80000010e17b:	00 a4 09 00 00 cc b4 	add    %ah,-0x4b340000(%rcx,%rcx,1)
ffff80000010e182:	ff                   	(bad)  
ffff80000010e183:	ff e7                	jmpq   *%rdi
ffff80000010e185:	00 00                	add    %al,(%rax)
ffff80000010e187:	00 00                	add    %al,(%rax)
ffff80000010e189:	41 0e                	rex.B (bad) 
ffff80000010e18b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e191:	4a 8f 03             	rex.WX popq (%rbx)
ffff80000010e194:	83 04 02 d8          	addl   $0xffffffd8,(%rdx,%rax,1)
ffff80000010e198:	0c 07                	or     $0x7,%al
ffff80000010e19a:	08 00                	or     %al,(%rax)
ffff80000010e19c:	20 00                	and    %al,(%rax)
ffff80000010e19e:	00 00                	add    %al,(%rax)
ffff80000010e1a0:	c8 09 00 00          	enterq $0x9,$0x0
ffff80000010e1a4:	8f                   	(bad)  
ffff80000010e1a5:	b5 ff                	mov    $0xff,%ch
ffff80000010e1a7:	ff 73 02             	pushq  0x2(%rbx)
ffff80000010e1aa:	00 00                	add    %al,(%rax)
ffff80000010e1ac:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e1af:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e1b5:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010e1b8:	83 04 03 67          	addl   $0x67,(%rbx,%rax,1)
ffff80000010e1bc:	02 0c 07             	add    (%rdi,%rax,1),%cl
ffff80000010e1bf:	08 1c 00             	or     %bl,(%rax,%rax,1)
ffff80000010e1c2:	00 00                	add    %al,(%rax)
ffff80000010e1c4:	ec                   	in     (%dx),%al
ffff80000010e1c5:	09 00                	or     %eax,(%rax)
ffff80000010e1c7:	00 de                	add    %bl,%dh
ffff80000010e1c9:	b7 ff                	mov    $0xff,%bh
ffff80000010e1cb:	ff 54 00 00          	callq  *0x0(%rax,%rax,1)
ffff80000010e1cf:	00 00                	add    %al,(%rax)
ffff80000010e1d1:	41 0e                	rex.B (bad) 
ffff80000010e1d3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e1d9:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e1dc:	00 00                	add    %al,(%rax)
ffff80000010e1de:	00 00                	add    %al,(%rax)
ffff80000010e1e0:	20 00                	and    %al,(%rax)
ffff80000010e1e2:	00 00                	add    %al,(%rax)
ffff80000010e1e4:	0c 0a                	or     $0xa,%al
ffff80000010e1e6:	00 00                	add    %al,(%rax)
ffff80000010e1e8:	12 b8 ff ff 57 00    	adc    0x57ffff(%rax),%bh
ffff80000010e1ee:	00 00                	add    %al,(%rax)
ffff80000010e1f0:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e1f3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e1f9:	41 83 03 02          	addl   $0x2,(%r11)
ffff80000010e1fd:	51                   	push   %rcx
ffff80000010e1fe:	0c 07                	or     $0x7,%al
ffff80000010e200:	08 00                	or     %al,(%rax)
ffff80000010e202:	00 00                	add    %al,(%rax)
ffff80000010e204:	20 00                	and    %al,(%rax)
ffff80000010e206:	00 00                	add    %al,(%rax)
ffff80000010e208:	30 0a                	xor    %cl,(%rdx)
ffff80000010e20a:	00 00                	add    %al,(%rax)
ffff80000010e20c:	45 b8 ff ff ec 01    	rex.RB mov $0x1ecffff,%r8d
ffff80000010e212:	00 00                	add    %al,(%rax)
ffff80000010e214:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e217:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e21d:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010e220:	83 04 03 e0          	addl   $0xffffffe0,(%rbx,%rax,1)
ffff80000010e224:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff80000010e227:	08                   	.byte 0x8

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
ffff800000110024:	00 80 ff ff 80 be    	add    %al,-0x417f0001(%rax)
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
ffff800000118024:	00 80 ff ff 80 be    	add    %al,-0x417f0001(%rax)
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
