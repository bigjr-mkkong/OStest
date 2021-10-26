
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
ffff800000100132:	e8 df 4d 00 00       	callq  ffff800000104f16 <printk>
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
ffff80000010405f:	e8 1d 4e 00 00       	callq  ffff800000108e81 <system_call_function>

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
ffff8000001040df:	48 8d 05 ca 11 00 00 	lea    0x11ca(%rip),%rax        # ffff8000001052b0 <do_divide_error>
ffff8000001040e6:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001040ea:	eb a6                	jmp    ffff800000104092 <error_code>

ffff8000001040ec <debug>:
ffff8000001040ec:	6a 00                	pushq  $0x0
ffff8000001040ee:	50                   	push   %rax
ffff8000001040ef:	48 8d 05 3d 12 00 00 	lea    0x123d(%rip),%rax        # ffff800000105333 <do_debug>
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
ffff800000104138:	e8 7c 12 00 00       	callq  ffff8000001053b9 <do_nmi>
ffff80000010413d:	e9 be fe ff ff       	jmpq   ffff800000104000 <RESTORE_ALL>

ffff800000104142 <breakpoint>:
ffff800000104142:	6a 00                	pushq  $0x0
ffff800000104144:	50                   	push   %rax
ffff800000104145:	48 8d 05 f3 12 00 00 	lea    0x12f3(%rip),%rax        # ffff80000010543f <do_breakpoint>
ffff80000010414c:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104150:	e9 3d ff ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104155 <overflow>:
ffff800000104155:	6a 00                	pushq  $0x0
ffff800000104157:	50                   	push   %rax
ffff800000104158:	48 8d 05 66 13 00 00 	lea    0x1366(%rip),%rax        # ffff8000001054c5 <do_overflow>
ffff80000010415f:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104163:	e9 2a ff ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104168 <bounds>:
ffff800000104168:	6a 00                	pushq  $0x0
ffff80000010416a:	50                   	push   %rax
ffff80000010416b:	48 8d 05 d9 13 00 00 	lea    0x13d9(%rip),%rax        # ffff80000010554b <do_bounds>
ffff800000104172:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104176:	e9 17 ff ff ff       	jmpq   ffff800000104092 <error_code>

ffff80000010417b <undefined_opcode>:
ffff80000010417b:	6a 00                	pushq  $0x0
ffff80000010417d:	50                   	push   %rax
ffff80000010417e:	48 8d 05 4c 14 00 00 	lea    0x144c(%rip),%rax        # ffff8000001055d1 <do_undefined_opcode>
ffff800000104185:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104189:	e9 04 ff ff ff       	jmpq   ffff800000104092 <error_code>

ffff80000010418e <dev_not_available>:
ffff80000010418e:	6a 00                	pushq  $0x0
ffff800000104190:	50                   	push   %rax
ffff800000104191:	48 8d 05 bf 14 00 00 	lea    0x14bf(%rip),%rax        # ffff800000105657 <do_dev_not_available>
ffff800000104198:	48 87 04 24          	xchg   %rax,(%rsp)
ffff80000010419c:	e9 f1 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041a1 <double_fault>:
ffff8000001041a1:	50                   	push   %rax
ffff8000001041a2:	48 8d 05 34 15 00 00 	lea    0x1534(%rip),%rax        # ffff8000001056dd <do_double_fault>
ffff8000001041a9:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041ad:	e9 e0 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041b2 <coprocessor_segment_overrun>:
ffff8000001041b2:	6a 00                	pushq  $0x0
ffff8000001041b4:	50                   	push   %rax
ffff8000001041b5:	48 8d 05 a7 15 00 00 	lea    0x15a7(%rip),%rax        # ffff800000105763 <do_coprocessor_segment_overrun>
ffff8000001041bc:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041c0:	e9 cd fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041c5 <invalid_TSS>:
ffff8000001041c5:	50                   	push   %rax
ffff8000001041c6:	48 8d 05 1c 16 00 00 	lea    0x161c(%rip),%rax        # ffff8000001057e9 <do_invalid_TSS>
ffff8000001041cd:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041d1:	e9 bc fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041d6 <segment_not_present>:
ffff8000001041d6:	50                   	push   %rax
ffff8000001041d7:	48 8d 05 ed 17 00 00 	lea    0x17ed(%rip),%rax        # ffff8000001059cb <do_segment_not_present>
ffff8000001041de:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041e2:	e9 ab fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041e7 <stack_segment_fault>:
ffff8000001041e7:	50                   	push   %rax
ffff8000001041e8:	48 8d 05 be 19 00 00 	lea    0x19be(%rip),%rax        # ffff800000105bad <do_stack_segment_fault>
ffff8000001041ef:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041f3:	e9 9a fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff8000001041f8 <general_protection>:
ffff8000001041f8:	50                   	push   %rax
ffff8000001041f9:	48 8d 05 8f 1b 00 00 	lea    0x1b8f(%rip),%rax        # ffff800000105d8f <do_general_protection>
ffff800000104200:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104204:	e9 89 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104209 <page_fault>:
ffff800000104209:	50                   	push   %rax
ffff80000010420a:	48 8d 05 60 1d 00 00 	lea    0x1d60(%rip),%rax        # ffff800000105f71 <do_page_fault>
ffff800000104211:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104215:	e9 78 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff80000010421a <x87_FPU_error>:
ffff80000010421a:	6a 00                	pushq  $0x0
ffff80000010421c:	50                   	push   %rax
ffff80000010421d:	48 8d 05 a3 1f 00 00 	lea    0x1fa3(%rip),%rax        # ffff8000001061c7 <do_x87_FPU_error>
ffff800000104224:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104228:	e9 65 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff80000010422d <alignment_check>:
ffff80000010422d:	50                   	push   %rax
ffff80000010422e:	48 8d 05 18 20 00 00 	lea    0x2018(%rip),%rax        # ffff80000010624d <do_alignment_check>
ffff800000104235:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104239:	e9 54 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff80000010423e <machine_check>:
ffff80000010423e:	6a 00                	pushq  $0x0
ffff800000104240:	50                   	push   %rax
ffff800000104241:	48 8d 05 8b 20 00 00 	lea    0x208b(%rip),%rax        # ffff8000001062d3 <do_machine_check>
ffff800000104248:	48 87 04 24          	xchg   %rax,(%rsp)
ffff80000010424c:	e9 41 fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104251 <SIMD_exception>:
ffff800000104251:	6a 00                	pushq  $0x0
ffff800000104253:	50                   	push   %rax
ffff800000104254:	48 8d 05 fe 20 00 00 	lea    0x20fe(%rip),%rax        # ffff800000106359 <do_SIMD_exception>
ffff80000010425b:	48 87 04 24          	xchg   %rax,(%rsp)
ffff80000010425f:	e9 2e fe ff ff       	jmpq   ffff800000104092 <error_code>

ffff800000104264 <virtualization_exception>:
ffff800000104264:	6a 00                	pushq  $0x0
ffff800000104266:	50                   	push   %rax
ffff800000104267:	48 8d 05 71 21 00 00 	lea    0x2171(%rip),%rax        # ffff8000001063df <do_virtualization_exception>
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
ffff80000010465d:	49 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r9
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
ffff8000001046bb:	49 b8 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r8
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
ffff800000104772:	48 b9 00 00 a0 00 00 	movabs $0xffff800000a00000,%rcx
ffff800000104779:	80 ff ff 
ffff80000010477c:	48 89 4c 03 18       	mov    %rcx,0x18(%rbx,%rax,1)
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
ffff8000001047f8:	48 b8 45 7b ff ff ff 	movabs $0xffffffffffff7b45,%rax
ffff8000001047ff:	ff ff ff 
ffff800000104802:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000104806:	ff d0                	callq  *%rax
ffff800000104808:	48 83 c4 20          	add    $0x20,%rsp
ffff80000010480c:	49 89 df             	mov    %rbx,%r15
ffff80000010480f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000104814:	48 ba 3d 9b ff ff ff 	movabs $0xffffffffffff9b3d,%rdx
ffff80000010481b:	ff ff ff 
ffff80000010481e:	48 01 da             	add    %rbx,%rdx
ffff800000104821:	ff d2                	callq  *%rdx
ffff800000104823:	49 89 df             	mov    %rbx,%r15
ffff800000104826:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010482b:	48 ba 5e d1 ff ff ff 	movabs $0xffffffffffffd15e,%rdx
ffff800000104832:	ff ff ff 
ffff800000104835:	48 01 da             	add    %rbx,%rdx
ffff800000104838:	ff d2                	callq  *%rdx
ffff80000010483a:	48 b8 70 ff ff ff ff 	movabs $0xffffffffffffff70,%rax
ffff800000104841:	ff ff ff 
ffff800000104844:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000104848:	48 89 c2             	mov    %rax,%rdx
ffff80000010484b:	48 b8 38 c8 01 00 00 	movabs $0x1c838,%rax
ffff800000104852:	00 00 00 
ffff800000104855:	48 89 94 03 d0 02 00 	mov    %rdx,0x2d0(%rbx,%rax,1)
ffff80000010485c:	00 
ffff80000010485d:	48 b8 08 ff ff ff ff 	movabs $0xffffffffffffff08,%rax
ffff800000104864:	ff ff ff 
ffff800000104867:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010486b:	48 89 c2             	mov    %rax,%rdx
ffff80000010486e:	48 b8 38 c8 01 00 00 	movabs $0x1c838,%rax
ffff800000104875:	00 00 00 
ffff800000104878:	48 89 94 03 d8 02 00 	mov    %rdx,0x2d8(%rbx,%rax,1)
ffff80000010487f:	00 
ffff800000104880:	48 b8 b0 ff ff ff ff 	movabs $0xffffffffffffffb0,%rax
ffff800000104887:	ff ff ff 
ffff80000010488a:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010488e:	48 89 c2             	mov    %rax,%rdx
ffff800000104891:	48 b8 38 c8 01 00 00 	movabs $0x1c838,%rax
ffff800000104898:	00 00 00 
ffff80000010489b:	48 89 94 03 e0 02 00 	mov    %rdx,0x2e0(%rbx,%rax,1)
ffff8000001048a2:	00 
ffff8000001048a3:	48 b8 c0 ff ff ff ff 	movabs $0xffffffffffffffc0,%rax
ffff8000001048aa:	ff ff ff 
ffff8000001048ad:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001048b1:	48 89 c2             	mov    %rax,%rdx
ffff8000001048b4:	48 b8 38 c8 01 00 00 	movabs $0x1c838,%rax
ffff8000001048bb:	00 00 00 
ffff8000001048be:	48 89 94 03 e8 02 00 	mov    %rdx,0x2e8(%rbx,%rax,1)
ffff8000001048c5:	00 
ffff8000001048c6:	49 89 df             	mov    %rbx,%r15
ffff8000001048c9:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001048ce:	48 ba 22 a1 ff ff ff 	movabs $0xffffffffffffa122,%rdx
ffff8000001048d5:	ff ff ff 
ffff8000001048d8:	48 01 da             	add    %rbx,%rdx
ffff8000001048db:	ff d2                	callq  *%rdx
ffff8000001048dd:	49 89 df             	mov    %rbx,%r15
ffff8000001048e0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001048e5:	48 ba 3f be ff ff ff 	movabs $0xffffffffffffbe3f,%rdx
ffff8000001048ec:	ff ff ff 
ffff8000001048ef:	48 01 da             	add    %rbx,%rdx
ffff8000001048f2:	ff d2                	callq  *%rdx
ffff8000001048f4:	b9 08 00 00 00       	mov    $0x8,%ecx
ffff8000001048f9:	48 b8 79 10 00 00 00 	movabs $0x1079,%rax
ffff800000104900:	00 00 00 
ffff800000104903:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000104907:	be ff 00 00 00       	mov    $0xff,%esi
ffff80000010490c:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000104911:	49 89 df             	mov    %rbx,%r15
ffff800000104914:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000104919:	49 b8 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r8
ffff800000104920:	ff ff ff 
ffff800000104923:	49 01 d8             	add    %rbx,%r8
ffff800000104926:	41 ff d0             	callq  *%r8
ffff800000104929:	49 89 df             	mov    %rbx,%r15
ffff80000010492c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000104931:	48 ba 4e c9 ff ff ff 	movabs $0xffffffffffffc94e,%rdx
ffff800000104938:	ff ff ff 
ffff80000010493b:	48 01 da             	add    %rbx,%rdx
ffff80000010493e:	ff d2                	callq  *%rdx
ffff800000104940:	eb fe                	jmp    ffff800000104940 <Start_Kernel+0x268>

ffff800000104942 <putchar>:
ffff800000104942:	55                   	push   %rbp
ffff800000104943:	48 89 e5             	mov    %rsp,%rbp
ffff800000104946:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000104946 <putchar+0x4>
ffff80000010494d:	49 bb e2 7f 00 00 00 	movabs $0x7fe2,%r11
ffff800000104954:	00 00 00 
ffff800000104957:	4c 01 d8             	add    %r11,%rax
ffff80000010495a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff80000010495e:	89 75 d4             	mov    %esi,-0x2c(%rbp)
ffff800000104961:	89 55 d0             	mov    %edx,-0x30(%rbp)
ffff800000104964:	89 4d cc             	mov    %ecx,-0x34(%rbp)
ffff800000104967:	44 89 45 c8          	mov    %r8d,-0x38(%rbp)
ffff80000010496b:	44 89 4d c4          	mov    %r9d,-0x3c(%rbp)
ffff80000010496f:	8b 55 10             	mov    0x10(%rbp),%edx
ffff800000104972:	88 55 c0             	mov    %dl,-0x40(%rbp)
ffff800000104975:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff80000010497c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff800000104983:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
ffff80000010498a:	00 
ffff80000010498b:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000104992:	00 
ffff800000104993:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
ffff80000010499a:	0f b6 55 c0          	movzbl -0x40(%rbp),%edx
ffff80000010499e:	48 63 d2             	movslq %edx,%rdx
ffff8000001049a1:	48 89 d1             	mov    %rdx,%rcx
ffff8000001049a4:	48 c1 e1 04          	shl    $0x4,%rcx
ffff8000001049a8:	48 ba f8 e7 ff ff ff 	movabs $0xffffffffffffe7f8,%rdx
ffff8000001049af:	ff ff ff 
ffff8000001049b2:	48 8d 04 10          	lea    (%rax,%rdx,1),%rax
ffff8000001049b6:	48 01 c8             	add    %rcx,%rax
ffff8000001049b9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001049bd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff8000001049c4:	eb 7a                	jmp    ffff800000104a40 <putchar+0xfe>
ffff8000001049c6:	8b 55 cc             	mov    -0x34(%rbp),%edx
ffff8000001049c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff8000001049cc:	01 d0                	add    %edx,%eax
ffff8000001049ce:	0f af 45 d4          	imul   -0x2c(%rbp),%eax
ffff8000001049d2:	48 63 d0             	movslq %eax,%rdx
ffff8000001049d5:	8b 45 d0             	mov    -0x30(%rbp),%eax
ffff8000001049d8:	48 98                	cltq   
ffff8000001049da:	48 01 d0             	add    %rdx,%rax
ffff8000001049dd:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
ffff8000001049e4:	00 
ffff8000001049e5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001049e9:	48 01 d0             	add    %rdx,%rax
ffff8000001049ec:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff8000001049f0:	c7 45 e4 00 01 00 00 	movl   $0x100,-0x1c(%rbp)
ffff8000001049f7:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff8000001049fe:	eb 31                	jmp    ffff800000104a31 <putchar+0xef>
ffff800000104a00:	d1 7d e4             	sarl   -0x1c(%rbp)
ffff800000104a03:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104a07:	0f b6 00             	movzbl (%rax),%eax
ffff800000104a0a:	0f b6 c0             	movzbl %al,%eax
ffff800000104a0d:	23 45 e4             	and    -0x1c(%rbp),%eax
ffff800000104a10:	85 c0                	test   %eax,%eax
ffff800000104a12:	74 0b                	je     ffff800000104a1f <putchar+0xdd>
ffff800000104a14:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000104a18:	8b 55 c8             	mov    -0x38(%rbp),%edx
ffff800000104a1b:	89 10                	mov    %edx,(%rax)
ffff800000104a1d:	eb 09                	jmp    ffff800000104a28 <putchar+0xe6>
ffff800000104a1f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000104a23:	8b 55 c4             	mov    -0x3c(%rbp),%edx
ffff800000104a26:	89 10                	mov    %edx,(%rax)
ffff800000104a28:	48 83 45 f0 04       	addq   $0x4,-0x10(%rbp)
ffff800000104a2d:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
ffff800000104a31:	83 7d f8 07          	cmpl   $0x7,-0x8(%rbp)
ffff800000104a35:	7e c9                	jle    ffff800000104a00 <putchar+0xbe>
ffff800000104a37:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
ffff800000104a3c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff800000104a40:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
ffff800000104a44:	7e 80                	jle    ffff8000001049c6 <putchar+0x84>
ffff800000104a46:	90                   	nop
ffff800000104a47:	5d                   	pop    %rbp
ffff800000104a48:	c3                   	retq   

ffff800000104a49 <dec2hex>:
ffff800000104a49:	55                   	push   %rbp
ffff800000104a4a:	48 89 e5             	mov    %rsp,%rbp
ffff800000104a4d:	48 81 ec 78 01 00 00 	sub    $0x178,%rsp
ffff800000104a54:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000104a54 <dec2hex+0xb>
ffff800000104a5b:	49 bb d4 7e 00 00 00 	movabs $0x7ed4,%r11
ffff800000104a62:	00 00 00 
ffff800000104a65:	4c 01 d8             	add    %r11,%rax
ffff800000104a68:	48 89 bd 18 fe ff ff 	mov    %rdi,-0x1e8(%rbp)
ffff800000104a6f:	89 b5 14 fe ff ff    	mov    %esi,-0x1ec(%rbp)
ffff800000104a75:	c6 45 b0 30          	movb   $0x30,-0x50(%rbp)
ffff800000104a79:	c6 45 b1 31          	movb   $0x31,-0x4f(%rbp)
ffff800000104a7d:	c6 45 b2 32          	movb   $0x32,-0x4e(%rbp)
ffff800000104a81:	c6 45 b3 33          	movb   $0x33,-0x4d(%rbp)
ffff800000104a85:	c6 45 b4 34          	movb   $0x34,-0x4c(%rbp)
ffff800000104a89:	c6 45 b5 35          	movb   $0x35,-0x4b(%rbp)
ffff800000104a8d:	c6 45 b6 36          	movb   $0x36,-0x4a(%rbp)
ffff800000104a91:	c6 45 b7 37          	movb   $0x37,-0x49(%rbp)
ffff800000104a95:	c6 45 b8 38          	movb   $0x38,-0x48(%rbp)
ffff800000104a99:	c6 45 b9 39          	movb   $0x39,-0x47(%rbp)
ffff800000104a9d:	c6 45 ba 41          	movb   $0x41,-0x46(%rbp)
ffff800000104aa1:	c6 45 bb 42          	movb   $0x42,-0x45(%rbp)
ffff800000104aa5:	c6 45 bc 43          	movb   $0x43,-0x44(%rbp)
ffff800000104aa9:	c6 45 bd 44          	movb   $0x44,-0x43(%rbp)
ffff800000104aad:	c6 45 be 45          	movb   $0x45,-0x42(%rbp)
ffff800000104ab1:	c6 45 bf 46          	movb   $0x46,-0x41(%rbp)
ffff800000104ab5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff800000104abc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff800000104ac3:	eb 40                	jmp    ffff800000104b05 <dec2hex+0xbc>
ffff800000104ac5:	8b 85 14 fe ff ff    	mov    -0x1ec(%rbp),%eax
ffff800000104acb:	99                   	cltd   
ffff800000104acc:	c1 ea 1c             	shr    $0x1c,%edx
ffff800000104acf:	01 d0                	add    %edx,%eax
ffff800000104ad1:	83 e0 0f             	and    $0xf,%eax
ffff800000104ad4:	29 d0                	sub    %edx,%eax
ffff800000104ad6:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff800000104ad9:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000104adc:	8d 50 01             	lea    0x1(%rax),%edx
ffff800000104adf:	89 55 fc             	mov    %edx,-0x4(%rbp)
ffff800000104ae2:	48 98                	cltq   
ffff800000104ae4:	8b 55 f4             	mov    -0xc(%rbp),%edx
ffff800000104ae7:	89 94 85 20 fe ff ff 	mov    %edx,-0x1e0(%rbp,%rax,4)
ffff800000104aee:	8b 85 14 fe ff ff    	mov    -0x1ec(%rbp),%eax
ffff800000104af4:	8d 50 0f             	lea    0xf(%rax),%edx
ffff800000104af7:	85 c0                	test   %eax,%eax
ffff800000104af9:	0f 48 c2             	cmovs  %edx,%eax
ffff800000104afc:	c1 f8 04             	sar    $0x4,%eax
ffff800000104aff:	89 85 14 fe ff ff    	mov    %eax,-0x1ec(%rbp)
ffff800000104b05:	83 bd 14 fe ff ff 00 	cmpl   $0x0,-0x1ec(%rbp)
ffff800000104b0c:	7f b7                	jg     ffff800000104ac5 <dec2hex+0x7c>
ffff800000104b0e:	83 6d fc 01          	subl   $0x1,-0x4(%rbp)
ffff800000104b12:	eb 2c                	jmp    ffff800000104b40 <dec2hex+0xf7>
ffff800000104b14:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000104b17:	48 98                	cltq   
ffff800000104b19:	8b 8c 85 20 fe ff ff 	mov    -0x1e0(%rbp,%rax,4),%ecx
ffff800000104b20:	48 8b 85 18 fe ff ff 	mov    -0x1e8(%rbp),%rax
ffff800000104b27:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104b2b:	48 89 95 18 fe ff ff 	mov    %rdx,-0x1e8(%rbp)
ffff800000104b32:	48 63 d1             	movslq %ecx,%rdx
ffff800000104b35:	0f b6 54 15 b0       	movzbl -0x50(%rbp,%rdx,1),%edx
ffff800000104b3a:	88 10                	mov    %dl,(%rax)
ffff800000104b3c:	83 6d fc 01          	subl   $0x1,-0x4(%rbp)
ffff800000104b40:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
ffff800000104b44:	79 ce                	jns    ffff800000104b14 <dec2hex+0xcb>
ffff800000104b46:	48 8b 85 18 fe ff ff 	mov    -0x1e8(%rbp),%rax
ffff800000104b4d:	c9                   	leaveq 
ffff800000104b4e:	c3                   	retq   

ffff800000104b4f <vsprintf>:
ffff800000104b4f:	55                   	push   %rbp
ffff800000104b50:	48 89 e5             	mov    %rsp,%rbp
ffff800000104b53:	53                   	push   %rbx
ffff800000104b54:	48 83 ec 40          	sub    $0x40,%rsp
ffff800000104b58:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000104b58 <vsprintf+0x9>
ffff800000104b5f:	49 bb d0 7d 00 00 00 	movabs $0x7dd0,%r11
ffff800000104b66:	00 00 00 
ffff800000104b69:	4c 01 db             	add    %r11,%rbx
ffff800000104b6c:	48 89 7d c0          	mov    %rdi,-0x40(%rbp)
ffff800000104b70:	48 89 75 b8          	mov    %rsi,-0x48(%rbp)
ffff800000104b74:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
ffff800000104b7b:	48 b8 58 37 01 00 00 	movabs $0x13758,%rax
ffff800000104b82:	00 00 00 
ffff800000104b85:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000104b89:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000104b8d:	e9 56 03 00 00       	jmpq   ffff800000104ee8 <vsprintf+0x399>
ffff800000104b92:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104b96:	0f b6 00             	movzbl (%rax),%eax
ffff800000104b99:	3c 25                	cmp    $0x25,%al
ffff800000104b9b:	74 17                	je     ffff800000104bb4 <vsprintf+0x65>
ffff800000104b9d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104ba1:	0f b6 10             	movzbl (%rax),%edx
ffff800000104ba4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104ba8:	88 10                	mov    %dl,(%rax)
ffff800000104baa:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
ffff800000104baf:	e9 2f 03 00 00       	jmpq   ffff800000104ee3 <vsprintf+0x394>
ffff800000104bb4:	48 83 45 c0 01       	addq   $0x1,-0x40(%rbp)
ffff800000104bb9:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104bbd:	0f b6 00             	movzbl (%rax),%eax
ffff800000104bc0:	3c 64                	cmp    $0x64,%al
ffff800000104bc2:	0f 85 45 01 00 00    	jne    ffff800000104d0d <vsprintf+0x1be>
ffff800000104bc8:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104bcc:	8b 00                	mov    (%rax),%eax
ffff800000104bce:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104bd1:	77 24                	ja     ffff800000104bf7 <vsprintf+0xa8>
ffff800000104bd3:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104bd7:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104bdb:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104bdf:	8b 00                	mov    (%rax),%eax
ffff800000104be1:	89 c0                	mov    %eax,%eax
ffff800000104be3:	48 01 d0             	add    %rdx,%rax
ffff800000104be6:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104bea:	8b 12                	mov    (%rdx),%edx
ffff800000104bec:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104bef:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104bf3:	89 0a                	mov    %ecx,(%rdx)
ffff800000104bf5:	eb 14                	jmp    ffff800000104c0b <vsprintf+0xbc>
ffff800000104bf7:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104bfb:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104bff:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104c03:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104c07:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104c0b:	8b 00                	mov    (%rax),%eax
ffff800000104c0d:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff800000104c10:	8b 4d f4             	mov    -0xc(%rbp),%ecx
ffff800000104c13:	ba 67 66 66 66       	mov    $0x66666667,%edx
ffff800000104c18:	89 c8                	mov    %ecx,%eax
ffff800000104c1a:	f7 ea                	imul   %edx
ffff800000104c1c:	c1 fa 02             	sar    $0x2,%edx
ffff800000104c1f:	89 c8                	mov    %ecx,%eax
ffff800000104c21:	c1 f8 1f             	sar    $0x1f,%eax
ffff800000104c24:	29 c2                	sub    %eax,%edx
ffff800000104c26:	89 d0                	mov    %edx,%eax
ffff800000104c28:	c1 e0 02             	shl    $0x2,%eax
ffff800000104c2b:	01 d0                	add    %edx,%eax
ffff800000104c2d:	01 c0                	add    %eax,%eax
ffff800000104c2f:	29 c1                	sub    %eax,%ecx
ffff800000104c31:	89 ca                	mov    %ecx,%edx
ffff800000104c33:	89 d0                	mov    %edx,%eax
ffff800000104c35:	8d 48 30             	lea    0x30(%rax),%ecx
ffff800000104c38:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104c3c:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104c40:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104c44:	89 ca                	mov    %ecx,%edx
ffff800000104c46:	88 10                	mov    %dl,(%rax)
ffff800000104c48:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
ffff800000104c4c:	8b 4d f4             	mov    -0xc(%rbp),%ecx
ffff800000104c4f:	ba 67 66 66 66       	mov    $0x66666667,%edx
ffff800000104c54:	89 c8                	mov    %ecx,%eax
ffff800000104c56:	f7 ea                	imul   %edx
ffff800000104c58:	c1 fa 02             	sar    $0x2,%edx
ffff800000104c5b:	89 c8                	mov    %ecx,%eax
ffff800000104c5d:	c1 f8 1f             	sar    $0x1f,%eax
ffff800000104c60:	29 c2                	sub    %eax,%edx
ffff800000104c62:	89 d0                	mov    %edx,%eax
ffff800000104c64:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff800000104c67:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
ffff800000104c6b:	75 a3                	jne    ffff800000104c10 <vsprintf+0xc1>
ffff800000104c6d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104c71:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff800000104c75:	eb 6c                	jmp    ffff800000104ce3 <vsprintf+0x194>
ffff800000104c77:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000104c7b:	0f b6 00             	movzbl (%rax),%eax
ffff800000104c7e:	88 45 cf             	mov    %al,-0x31(%rbp)
ffff800000104c81:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000104c85:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000104c89:	48 29 c2             	sub    %rax,%rdx
ffff800000104c8c:	48 89 d0             	mov    %rdx,%rax
ffff800000104c8f:	48 89 c2             	mov    %rax,%rdx
ffff800000104c92:	8b 45 f0             	mov    -0x10(%rbp),%eax
ffff800000104c95:	48 98                	cltq   
ffff800000104c97:	48 29 c2             	sub    %rax,%rdx
ffff800000104c9a:	48 89 d0             	mov    %rdx,%rax
ffff800000104c9d:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff800000104ca1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104ca5:	48 01 d0             	add    %rdx,%rax
ffff800000104ca8:	0f b6 10             	movzbl (%rax),%edx
ffff800000104cab:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000104caf:	88 10                	mov    %dl,(%rax)
ffff800000104cb1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000104cb5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000104cb9:	48 29 c2             	sub    %rax,%rdx
ffff800000104cbc:	48 89 d0             	mov    %rdx,%rax
ffff800000104cbf:	48 89 c2             	mov    %rax,%rdx
ffff800000104cc2:	8b 45 f0             	mov    -0x10(%rbp),%eax
ffff800000104cc5:	48 98                	cltq   
ffff800000104cc7:	48 29 c2             	sub    %rax,%rdx
ffff800000104cca:	48 89 d0             	mov    %rdx,%rax
ffff800000104ccd:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff800000104cd1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104cd5:	48 01 c2             	add    %rax,%rdx
ffff800000104cd8:	0f b6 45 cf          	movzbl -0x31(%rbp),%eax
ffff800000104cdc:	88 02                	mov    %al,(%rdx)
ffff800000104cde:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
ffff800000104ce3:	8b 45 f0             	mov    -0x10(%rbp),%eax
ffff800000104ce6:	89 c2                	mov    %eax,%edx
ffff800000104ce8:	c1 ea 1f             	shr    $0x1f,%edx
ffff800000104ceb:	01 d0                	add    %edx,%eax
ffff800000104ced:	d1 f8                	sar    %eax
ffff800000104cef:	48 98                	cltq   
ffff800000104cf1:	48 f7 d8             	neg    %rax
ffff800000104cf4:	48 89 c2             	mov    %rax,%rdx
ffff800000104cf7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104cfb:	48 01 d0             	add    %rdx,%rax
ffff800000104cfe:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
ffff800000104d02:	0f 83 6f ff ff ff    	jae    ffff800000104c77 <vsprintf+0x128>
ffff800000104d08:	e9 d6 01 00 00       	jmpq   ffff800000104ee3 <vsprintf+0x394>
ffff800000104d0d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104d11:	0f b6 00             	movzbl (%rax),%eax
ffff800000104d14:	3c 63                	cmp    $0x63,%al
ffff800000104d16:	75 5a                	jne    ffff800000104d72 <vsprintf+0x223>
ffff800000104d18:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104d1c:	8b 00                	mov    (%rax),%eax
ffff800000104d1e:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104d21:	77 24                	ja     ffff800000104d47 <vsprintf+0x1f8>
ffff800000104d23:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104d27:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104d2b:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104d2f:	8b 00                	mov    (%rax),%eax
ffff800000104d31:	89 c0                	mov    %eax,%eax
ffff800000104d33:	48 01 d0             	add    %rdx,%rax
ffff800000104d36:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104d3a:	8b 12                	mov    (%rdx),%edx
ffff800000104d3c:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104d3f:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104d43:	89 0a                	mov    %ecx,(%rdx)
ffff800000104d45:	eb 14                	jmp    ffff800000104d5b <vsprintf+0x20c>
ffff800000104d47:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104d4b:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104d4f:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104d53:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104d57:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104d5b:	8b 08                	mov    (%rax),%ecx
ffff800000104d5d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104d61:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104d65:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104d69:	89 ca                	mov    %ecx,%edx
ffff800000104d6b:	88 10                	mov    %dl,(%rax)
ffff800000104d6d:	e9 71 01 00 00       	jmpq   ffff800000104ee3 <vsprintf+0x394>
ffff800000104d72:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104d76:	0f b6 00             	movzbl (%rax),%eax
ffff800000104d79:	3c 73                	cmp    $0x73,%al
ffff800000104d7b:	0f 85 8f 00 00 00    	jne    ffff800000104e10 <vsprintf+0x2c1>
ffff800000104d81:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104d85:	8b 00                	mov    (%rax),%eax
ffff800000104d87:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104d8a:	77 24                	ja     ffff800000104db0 <vsprintf+0x261>
ffff800000104d8c:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104d90:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104d94:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104d98:	8b 00                	mov    (%rax),%eax
ffff800000104d9a:	89 c0                	mov    %eax,%eax
ffff800000104d9c:	48 01 d0             	add    %rdx,%rax
ffff800000104d9f:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104da3:	8b 12                	mov    (%rdx),%edx
ffff800000104da5:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104da8:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104dac:	89 0a                	mov    %ecx,(%rdx)
ffff800000104dae:	eb 14                	jmp    ffff800000104dc4 <vsprintf+0x275>
ffff800000104db0:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104db4:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104db8:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104dbc:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104dc0:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104dc4:	48 8b 00             	mov    (%rax),%rax
ffff800000104dc7:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff800000104dcb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000104dcf:	0f b6 00             	movzbl (%rax),%eax
ffff800000104dd2:	84 c0                	test   %al,%al
ffff800000104dd4:	0f 84 08 01 00 00    	je     ffff800000104ee2 <vsprintf+0x393>
ffff800000104dda:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000104dde:	0f b6 10             	movzbl (%rax),%edx
ffff800000104de1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104de5:	88 10                	mov    %dl,(%rax)
ffff800000104de7:	eb 17                	jmp    ffff800000104e00 <vsprintf+0x2b1>
ffff800000104de9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000104ded:	0f b6 10             	movzbl (%rax),%edx
ffff800000104df0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104df4:	88 10                	mov    %dl,(%rax)
ffff800000104df6:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
ffff800000104dfb:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
ffff800000104e00:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000104e04:	0f b6 00             	movzbl (%rax),%eax
ffff800000104e07:	84 c0                	test   %al,%al
ffff800000104e09:	75 de                	jne    ffff800000104de9 <vsprintf+0x29a>
ffff800000104e0b:	e9 d3 00 00 00       	jmpq   ffff800000104ee3 <vsprintf+0x394>
ffff800000104e10:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104e14:	0f b6 00             	movzbl (%rax),%eax
ffff800000104e17:	3c 78                	cmp    $0x78,%al
ffff800000104e19:	0f 85 c4 00 00 00    	jne    ffff800000104ee3 <vsprintf+0x394>
ffff800000104e1f:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104e23:	8b 00                	mov    (%rax),%eax
ffff800000104e25:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104e28:	77 24                	ja     ffff800000104e4e <vsprintf+0x2ff>
ffff800000104e2a:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104e2e:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104e32:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104e36:	8b 00                	mov    (%rax),%eax
ffff800000104e38:	89 c0                	mov    %eax,%eax
ffff800000104e3a:	48 01 d0             	add    %rdx,%rax
ffff800000104e3d:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104e41:	8b 12                	mov    (%rdx),%edx
ffff800000104e43:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104e46:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104e4a:	89 0a                	mov    %ecx,(%rdx)
ffff800000104e4c:	eb 14                	jmp    ffff800000104e62 <vsprintf+0x313>
ffff800000104e4e:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104e52:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104e56:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104e5a:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff800000104e5e:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104e62:	48 8b 00             	mov    (%rax),%rax
ffff800000104e65:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff800000104e69:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
ffff800000104e6e:	75 2f                	jne    ffff800000104e9f <vsprintf+0x350>
ffff800000104e70:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104e74:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104e78:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104e7c:	c6 00 30             	movb   $0x30,(%rax)
ffff800000104e7f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104e83:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104e87:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104e8b:	c6 00 78             	movb   $0x78,(%rax)
ffff800000104e8e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104e92:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104e96:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104e9a:	c6 00 30             	movb   $0x30,(%rax)
ffff800000104e9d:	eb 44                	jmp    ffff800000104ee3 <vsprintf+0x394>
ffff800000104e9f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104ea3:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104ea7:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104eab:	c6 00 30             	movb   $0x30,(%rax)
ffff800000104eae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104eb2:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104eb6:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104eba:	c6 00 78             	movb   $0x78,(%rax)
ffff800000104ebd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000104ec1:	89 c2                	mov    %eax,%edx
ffff800000104ec3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104ec7:	89 d6                	mov    %edx,%esi
ffff800000104ec9:	48 89 c7             	mov    %rax,%rdi
ffff800000104ecc:	48 b8 21 81 ff ff ff 	movabs $0xffffffffffff8121,%rax
ffff800000104ed3:	ff ff ff 
ffff800000104ed6:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000104eda:	ff d0                	callq  *%rax
ffff800000104edc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000104ee0:	eb 01                	jmp    ffff800000104ee3 <vsprintf+0x394>
ffff800000104ee2:	90                   	nop
ffff800000104ee3:	48 83 45 c0 01       	addq   $0x1,-0x40(%rbp)
ffff800000104ee8:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000104eec:	0f b6 00             	movzbl (%rax),%eax
ffff800000104eef:	84 c0                	test   %al,%al
ffff800000104ef1:	0f 85 9b fc ff ff    	jne    ffff800000104b92 <vsprintf+0x43>
ffff800000104ef7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000104efb:	48 b8 58 37 01 00 00 	movabs $0x13758,%rax
ffff800000104f02:	00 00 00 
ffff800000104f05:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000104f09:	48 29 c2             	sub    %rax,%rdx
ffff800000104f0c:	48 89 d0             	mov    %rdx,%rax
ffff800000104f0f:	48 83 c4 40          	add    $0x40,%rsp
ffff800000104f13:	5b                   	pop    %rbx
ffff800000104f14:	5d                   	pop    %rbp
ffff800000104f15:	c3                   	retq   

ffff800000104f16 <printk>:
ffff800000104f16:	55                   	push   %rbp
ffff800000104f17:	48 89 e5             	mov    %rsp,%rbp
ffff800000104f1a:	53                   	push   %rbx
ffff800000104f1b:	48 81 ec e8 00 00 00 	sub    $0xe8,%rsp
ffff800000104f22:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000104f22 <printk+0xc>
ffff800000104f29:	49 bb 06 7a 00 00 00 	movabs $0x7a06,%r11
ffff800000104f30:	00 00 00 
ffff800000104f33:	4c 01 db             	add    %r11,%rbx
ffff800000104f36:	89 bd 1c ff ff ff    	mov    %edi,-0xe4(%rbp)
ffff800000104f3c:	89 b5 18 ff ff ff    	mov    %esi,-0xe8(%rbp)
ffff800000104f42:	48 89 95 10 ff ff ff 	mov    %rdx,-0xf0(%rbp)
ffff800000104f49:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
ffff800000104f50:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
ffff800000104f57:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
ffff800000104f5e:	84 c0                	test   %al,%al
ffff800000104f60:	74 23                	je     ffff800000104f85 <printk+0x6f>
ffff800000104f62:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
ffff800000104f69:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
ffff800000104f6d:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
ffff800000104f71:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
ffff800000104f75:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
ffff800000104f79:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
ffff800000104f7d:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
ffff800000104f81:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
ffff800000104f85:	c7 85 20 ff ff ff 18 	movl   $0x18,-0xe0(%rbp)
ffff800000104f8c:	00 00 00 
ffff800000104f8f:	c7 85 24 ff ff ff 30 	movl   $0x30,-0xdc(%rbp)
ffff800000104f96:	00 00 00 
ffff800000104f99:	48 8d 45 10          	lea    0x10(%rbp),%rax
ffff800000104f9d:	48 89 85 28 ff ff ff 	mov    %rax,-0xd8(%rbp)
ffff800000104fa4:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
ffff800000104fab:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
ffff800000104fb2:	48 8d 95 20 ff ff ff 	lea    -0xe0(%rbp),%rdx
ffff800000104fb9:	48 8b 85 10 ff ff ff 	mov    -0xf0(%rbp),%rax
ffff800000104fc0:	48 89 d6             	mov    %rdx,%rsi
ffff800000104fc3:	48 89 c7             	mov    %rax,%rdi
ffff800000104fc6:	48 b8 27 82 ff ff ff 	movabs $0xffffffffffff8227,%rax
ffff800000104fcd:	ff ff ff 
ffff800000104fd0:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000104fd4:	ff d0                	callq  *%rax
ffff800000104fd6:	89 85 38 ff ff ff    	mov    %eax,-0xc8(%rbp)
ffff800000104fdc:	c7 85 3c ff ff ff 00 	movl   $0x0,-0xc4(%rbp)
ffff800000104fe3:	00 00 00 
ffff800000104fe6:	e9 ac 02 00 00       	jmpq   ffff800000105297 <printk+0x381>
ffff800000104feb:	8b 85 3c ff ff ff    	mov    -0xc4(%rbp),%eax
ffff800000104ff1:	48 63 d0             	movslq %eax,%rdx
ffff800000104ff4:	48 b8 58 37 01 00 00 	movabs $0x13758,%rax
ffff800000104ffb:	00 00 00 
ffff800000104ffe:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000105002:	48 01 d0             	add    %rdx,%rax
ffff800000105005:	0f b6 00             	movzbl (%rax),%eax
ffff800000105008:	3c 0a                	cmp    $0xa,%al
ffff80000010500a:	75 36                	jne    ffff800000105042 <printk+0x12c>
ffff80000010500c:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105013:	00 00 00 
ffff800000105016:	8b 44 03 0c          	mov    0xc(%rbx,%rax,1),%eax
ffff80000010501a:	8d 50 01             	lea    0x1(%rax),%edx
ffff80000010501d:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105024:	00 00 00 
ffff800000105027:	89 54 03 0c          	mov    %edx,0xc(%rbx,%rax,1)
ffff80000010502b:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105032:	00 00 00 
ffff800000105035:	c7 44 03 08 00 00 00 	movl   $0x0,0x8(%rbx,%rax,1)
ffff80000010503c:	00 
ffff80000010503d:	e9 4e 02 00 00       	jmpq   ffff800000105290 <printk+0x37a>
ffff800000105042:	8b 85 3c ff ff ff    	mov    -0xc4(%rbp),%eax
ffff800000105048:	48 63 d0             	movslq %eax,%rdx
ffff80000010504b:	48 b8 58 37 01 00 00 	movabs $0x13758,%rax
ffff800000105052:	00 00 00 
ffff800000105055:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000105059:	48 01 d0             	add    %rdx,%rax
ffff80000010505c:	0f b6 00             	movzbl (%rax),%eax
ffff80000010505f:	3c 08                	cmp    $0x8,%al
ffff800000105061:	0f 85 68 01 00 00    	jne    ffff8000001051cf <printk+0x2b9>
ffff800000105067:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff80000010506e:	00 00 00 
ffff800000105071:	8b 44 03 08          	mov    0x8(%rbx,%rax,1),%eax
ffff800000105075:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff800000105078:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff80000010507f:	00 00 00 
ffff800000105082:	89 54 03 08          	mov    %edx,0x8(%rbx,%rax,1)
ffff800000105086:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff80000010508d:	00 00 00 
ffff800000105090:	8b 44 03 08          	mov    0x8(%rbx,%rax,1),%eax
ffff800000105094:	85 c0                	test   %eax,%eax
ffff800000105096:	0f 89 b2 00 00 00    	jns    ffff80000010514e <printk+0x238>
ffff80000010509c:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff8000001050a3:	00 00 00 
ffff8000001050a6:	8b 04 03             	mov    (%rbx,%rax,1),%eax
ffff8000001050a9:	48 ba f8 47 01 00 00 	movabs $0x147f8,%rdx
ffff8000001050b0:	00 00 00 
ffff8000001050b3:	8b 7c 13 10          	mov    0x10(%rbx,%rdx,1),%edi
ffff8000001050b7:	99                   	cltd   
ffff8000001050b8:	f7 ff                	idiv   %edi
ffff8000001050ba:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff8000001050bd:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff8000001050c4:	00 00 00 
ffff8000001050c7:	8b 44 03 10          	mov    0x10(%rbx,%rax,1),%eax
ffff8000001050cb:	0f af d0             	imul   %eax,%edx
ffff8000001050ce:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff8000001050d5:	00 00 00 
ffff8000001050d8:	89 54 03 08          	mov    %edx,0x8(%rbx,%rax,1)
ffff8000001050dc:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff8000001050e3:	00 00 00 
ffff8000001050e6:	8b 44 03 0c          	mov    0xc(%rbx,%rax,1),%eax
ffff8000001050ea:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff8000001050ed:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff8000001050f4:	00 00 00 
ffff8000001050f7:	89 54 03 0c          	mov    %edx,0xc(%rbx,%rax,1)
ffff8000001050fb:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105102:	00 00 00 
ffff800000105105:	8b 44 03 0c          	mov    0xc(%rbx,%rax,1),%eax
ffff800000105109:	85 c0                	test   %eax,%eax
ffff80000010510b:	79 41                	jns    ffff80000010514e <printk+0x238>
ffff80000010510d:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105114:	00 00 00 
ffff800000105117:	8b 44 03 04          	mov    0x4(%rbx,%rax,1),%eax
ffff80000010511b:	48 ba f8 47 01 00 00 	movabs $0x147f8,%rdx
ffff800000105122:	00 00 00 
ffff800000105125:	8b 74 13 14          	mov    0x14(%rbx,%rdx,1),%esi
ffff800000105129:	99                   	cltd   
ffff80000010512a:	f7 fe                	idiv   %esi
ffff80000010512c:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff80000010512f:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105136:	00 00 00 
ffff800000105139:	8b 44 03 14          	mov    0x14(%rbx,%rax,1),%eax
ffff80000010513d:	0f af d0             	imul   %eax,%edx
ffff800000105140:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105147:	00 00 00 
ffff80000010514a:	89 54 03 0c          	mov    %edx,0xc(%rbx,%rax,1)
ffff80000010514e:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105155:	00 00 00 
ffff800000105158:	8b 54 03 0c          	mov    0xc(%rbx,%rax,1),%edx
ffff80000010515c:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105163:	00 00 00 
ffff800000105166:	8b 44 03 14          	mov    0x14(%rbx,%rax,1),%eax
ffff80000010516a:	89 d1                	mov    %edx,%ecx
ffff80000010516c:	0f af c8             	imul   %eax,%ecx
ffff80000010516f:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105176:	00 00 00 
ffff800000105179:	8b 54 03 08          	mov    0x8(%rbx,%rax,1),%edx
ffff80000010517d:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105184:	00 00 00 
ffff800000105187:	8b 44 03 10          	mov    0x10(%rbx,%rax,1),%eax
ffff80000010518b:	0f af d0             	imul   %eax,%edx
ffff80000010518e:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105195:	00 00 00 
ffff800000105198:	8b 34 03             	mov    (%rbx,%rax,1),%esi
ffff80000010519b:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff8000001051a2:	00 00 00 
ffff8000001051a5:	48 8b 44 03 18       	mov    0x18(%rbx,%rax,1),%rax
ffff8000001051aa:	6a 20                	pushq  $0x20
ffff8000001051ac:	41 b9 ff ff ff 00    	mov    $0xffffff,%r9d
ffff8000001051b2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
ffff8000001051b8:	48 89 c7             	mov    %rax,%rdi
ffff8000001051bb:	48 b8 1a 80 ff ff ff 	movabs $0xffffffffffff801a,%rax
ffff8000001051c2:	ff ff ff 
ffff8000001051c5:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001051c9:	ff d0                	callq  *%rax
ffff8000001051cb:	48 83 c4 08          	add    $0x8,%rsp
ffff8000001051cf:	8b 85 3c ff ff ff    	mov    -0xc4(%rbp),%eax
ffff8000001051d5:	48 63 d0             	movslq %eax,%rdx
ffff8000001051d8:	48 b8 58 37 01 00 00 	movabs $0x13758,%rax
ffff8000001051df:	00 00 00 
ffff8000001051e2:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001051e6:	48 01 d0             	add    %rdx,%rax
ffff8000001051e9:	0f b6 00             	movzbl (%rax),%eax
ffff8000001051ec:	0f b6 f8             	movzbl %al,%edi
ffff8000001051ef:	44 8b 8d 18 ff ff ff 	mov    -0xe8(%rbp),%r9d
ffff8000001051f6:	44 8b 85 1c ff ff ff 	mov    -0xe4(%rbp),%r8d
ffff8000001051fd:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105204:	00 00 00 
ffff800000105207:	8b 54 03 0c          	mov    0xc(%rbx,%rax,1),%edx
ffff80000010520b:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105212:	00 00 00 
ffff800000105215:	8b 44 03 14          	mov    0x14(%rbx,%rax,1),%eax
ffff800000105219:	89 d1                	mov    %edx,%ecx
ffff80000010521b:	0f af c8             	imul   %eax,%ecx
ffff80000010521e:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105225:	00 00 00 
ffff800000105228:	8b 54 03 08          	mov    0x8(%rbx,%rax,1),%edx
ffff80000010522c:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105233:	00 00 00 
ffff800000105236:	8b 44 03 10          	mov    0x10(%rbx,%rax,1),%eax
ffff80000010523a:	0f af d0             	imul   %eax,%edx
ffff80000010523d:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105244:	00 00 00 
ffff800000105247:	8b 34 03             	mov    (%rbx,%rax,1),%esi
ffff80000010524a:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105251:	00 00 00 
ffff800000105254:	48 8b 44 03 18       	mov    0x18(%rbx,%rax,1),%rax
ffff800000105259:	57                   	push   %rdi
ffff80000010525a:	48 89 c7             	mov    %rax,%rdi
ffff80000010525d:	48 b8 1a 80 ff ff ff 	movabs $0xffffffffffff801a,%rax
ffff800000105264:	ff ff ff 
ffff800000105267:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff80000010526b:	ff d0                	callq  *%rax
ffff80000010526d:	48 83 c4 08          	add    $0x8,%rsp
ffff800000105271:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105278:	00 00 00 
ffff80000010527b:	8b 44 03 08          	mov    0x8(%rbx,%rax,1),%eax
ffff80000010527f:	8d 50 01             	lea    0x1(%rax),%edx
ffff800000105282:	48 b8 f8 47 01 00 00 	movabs $0x147f8,%rax
ffff800000105289:	00 00 00 
ffff80000010528c:	89 54 03 08          	mov    %edx,0x8(%rbx,%rax,1)
ffff800000105290:	83 85 3c ff ff ff 01 	addl   $0x1,-0xc4(%rbp)
ffff800000105297:	8b 85 3c ff ff ff    	mov    -0xc4(%rbp),%eax
ffff80000010529d:	3b 85 38 ff ff ff    	cmp    -0xc8(%rbp),%eax
ffff8000001052a3:	0f 8c 42 fd ff ff    	jl     ffff800000104feb <printk+0xd5>
ffff8000001052a9:	90                   	nop
ffff8000001052aa:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
ffff8000001052ae:	c9                   	leaveq 
ffff8000001052af:	c3                   	retq   

ffff8000001052b0 <do_divide_error>:
ffff8000001052b0:	55                   	push   %rbp
ffff8000001052b1:	48 89 e5             	mov    %rsp,%rbp
ffff8000001052b4:	41 57                	push   %r15
ffff8000001052b6:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001052ba:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001052ba <do_divide_error+0xa>
ffff8000001052c1:	49 bb 6e 76 00 00 00 	movabs $0x766e,%r11
ffff8000001052c8:	00 00 00 
ffff8000001052cb:	4d 01 da             	add    %r11,%r10
ffff8000001052ce:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001052d2:	89 75 d4             	mov    %esi,-0x2c(%rbp)
ffff8000001052d5:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001052dc:	00 
ffff8000001052dd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001052e1:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001052e7:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001052eb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001052ef:	48 8b 08             	mov    (%rax),%rcx
ffff8000001052f2:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001052f6:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff8000001052f9:	49 89 c9             	mov    %rcx,%r9
ffff8000001052fc:	49 89 d0             	mov    %rdx,%r8
ffff8000001052ff:	89 c1                	mov    %eax,%ecx
ffff800000105301:	48 b8 80 10 00 00 00 	movabs $0x1080,%rax
ffff800000105308:	00 00 00 
ffff80000010530b:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff80000010530f:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105314:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105319:	4d 89 d7             	mov    %r10,%r15
ffff80000010531c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105321:	49 bb ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r11
ffff800000105328:	ff ff ff 
ffff80000010532b:	4d 01 d3             	add    %r10,%r11
ffff80000010532e:	41 ff d3             	callq  *%r11
ffff800000105331:	eb fe                	jmp    ffff800000105331 <do_divide_error+0x81>

ffff800000105333 <do_debug>:
ffff800000105333:	55                   	push   %rbp
ffff800000105334:	48 89 e5             	mov    %rsp,%rbp
ffff800000105337:	41 57                	push   %r15
ffff800000105339:	48 83 ec 28          	sub    $0x28,%rsp
ffff80000010533d:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff80000010533d <do_debug+0xa>
ffff800000105344:	49 bb eb 75 00 00 00 	movabs $0x75eb,%r11
ffff80000010534b:	00 00 00 
ffff80000010534e:	4d 01 da             	add    %r11,%r10
ffff800000105351:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105355:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105359:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105360:	00 
ffff800000105361:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105365:	48 05 98 00 00 00    	add    $0x98,%rax
ffff80000010536b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff80000010536f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105373:	48 8b 08             	mov    (%rax),%rcx
ffff800000105376:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff80000010537a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010537e:	49 89 c9             	mov    %rcx,%r9
ffff800000105381:	49 89 d0             	mov    %rdx,%r8
ffff800000105384:	48 89 c1             	mov    %rax,%rcx
ffff800000105387:	48 b8 b0 10 00 00 00 	movabs $0x10b0,%rax
ffff80000010538e:	00 00 00 
ffff800000105391:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000105395:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010539a:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010539f:	4d 89 d7             	mov    %r10,%r15
ffff8000001053a2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001053a7:	49 bb ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r11
ffff8000001053ae:	ff ff ff 
ffff8000001053b1:	4d 01 d3             	add    %r10,%r11
ffff8000001053b4:	41 ff d3             	callq  *%r11
ffff8000001053b7:	eb fe                	jmp    ffff8000001053b7 <do_debug+0x84>

ffff8000001053b9 <do_nmi>:
ffff8000001053b9:	55                   	push   %rbp
ffff8000001053ba:	48 89 e5             	mov    %rsp,%rbp
ffff8000001053bd:	41 57                	push   %r15
ffff8000001053bf:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001053c3:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001053c3 <do_nmi+0xa>
ffff8000001053ca:	49 bb 65 75 00 00 00 	movabs $0x7565,%r11
ffff8000001053d1:	00 00 00 
ffff8000001053d4:	4d 01 da             	add    %r11,%r10
ffff8000001053d7:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001053db:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001053df:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001053e6:	00 
ffff8000001053e7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001053eb:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001053f1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001053f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001053f9:	48 8b 08             	mov    (%rax),%rcx
ffff8000001053fc:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105400:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105404:	49 89 c9             	mov    %rcx,%r9
ffff800000105407:	49 89 d0             	mov    %rdx,%r8
ffff80000010540a:	48 89 c1             	mov    %rax,%rcx
ffff80000010540d:	48 b8 d8 10 00 00 00 	movabs $0x10d8,%rax
ffff800000105414:	00 00 00 
ffff800000105417:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff80000010541b:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105420:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105425:	4d 89 d7             	mov    %r10,%r15
ffff800000105428:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010542d:	49 bb ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r11
ffff800000105434:	ff ff ff 
ffff800000105437:	4d 01 d3             	add    %r10,%r11
ffff80000010543a:	41 ff d3             	callq  *%r11
ffff80000010543d:	eb fe                	jmp    ffff80000010543d <do_nmi+0x84>

ffff80000010543f <do_breakpoint>:
ffff80000010543f:	55                   	push   %rbp
ffff800000105440:	48 89 e5             	mov    %rsp,%rbp
ffff800000105443:	41 57                	push   %r15
ffff800000105445:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000105449:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff800000105449 <do_breakpoint+0xa>
ffff800000105450:	49 bb df 74 00 00 00 	movabs $0x74df,%r11
ffff800000105457:	00 00 00 
ffff80000010545a:	4d 01 da             	add    %r11,%r10
ffff80000010545d:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105461:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105465:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff80000010546c:	00 
ffff80000010546d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105471:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105477:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff80000010547b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010547f:	48 8b 08             	mov    (%rax),%rcx
ffff800000105482:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105486:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010548a:	49 89 c9             	mov    %rcx,%r9
ffff80000010548d:	49 89 d0             	mov    %rdx,%r8
ffff800000105490:	48 89 c1             	mov    %rax,%rcx
ffff800000105493:	48 b8 08 11 00 00 00 	movabs $0x1108,%rax
ffff80000010549a:	00 00 00 
ffff80000010549d:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff8000001054a1:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001054a6:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001054ab:	4d 89 d7             	mov    %r10,%r15
ffff8000001054ae:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001054b3:	49 bb ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r11
ffff8000001054ba:	ff ff ff 
ffff8000001054bd:	4d 01 d3             	add    %r10,%r11
ffff8000001054c0:	41 ff d3             	callq  *%r11
ffff8000001054c3:	eb fe                	jmp    ffff8000001054c3 <do_breakpoint+0x84>

ffff8000001054c5 <do_overflow>:
ffff8000001054c5:	55                   	push   %rbp
ffff8000001054c6:	48 89 e5             	mov    %rsp,%rbp
ffff8000001054c9:	41 57                	push   %r15
ffff8000001054cb:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001054cf:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001054cf <do_overflow+0xa>
ffff8000001054d6:	49 bb 59 74 00 00 00 	movabs $0x7459,%r11
ffff8000001054dd:	00 00 00 
ffff8000001054e0:	4d 01 da             	add    %r11,%r10
ffff8000001054e3:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001054e7:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001054eb:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001054f2:	00 
ffff8000001054f3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001054f7:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001054fd:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105501:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105505:	48 8b 08             	mov    (%rax),%rcx
ffff800000105508:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff80000010550c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105510:	49 89 c9             	mov    %rcx,%r9
ffff800000105513:	49 89 d0             	mov    %rdx,%r8
ffff800000105516:	48 89 c1             	mov    %rax,%rcx
ffff800000105519:	48 b8 38 11 00 00 00 	movabs $0x1138,%rax
ffff800000105520:	00 00 00 
ffff800000105523:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000105527:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010552c:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105531:	4d 89 d7             	mov    %r10,%r15
ffff800000105534:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105539:	49 bb ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r11
ffff800000105540:	ff ff ff 
ffff800000105543:	4d 01 d3             	add    %r10,%r11
ffff800000105546:	41 ff d3             	callq  *%r11
ffff800000105549:	eb fe                	jmp    ffff800000105549 <do_overflow+0x84>

ffff80000010554b <do_bounds>:
ffff80000010554b:	55                   	push   %rbp
ffff80000010554c:	48 89 e5             	mov    %rsp,%rbp
ffff80000010554f:	41 57                	push   %r15
ffff800000105551:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000105555:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff800000105555 <do_bounds+0xa>
ffff80000010555c:	49 bb d3 73 00 00 00 	movabs $0x73d3,%r11
ffff800000105563:	00 00 00 
ffff800000105566:	4d 01 da             	add    %r11,%r10
ffff800000105569:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff80000010556d:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105571:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105578:	00 
ffff800000105579:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010557d:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105583:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105587:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010558b:	48 8b 08             	mov    (%rax),%rcx
ffff80000010558e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105592:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105596:	49 89 c9             	mov    %rcx,%r9
ffff800000105599:	49 89 d0             	mov    %rdx,%r8
ffff80000010559c:	48 89 c1             	mov    %rax,%rcx
ffff80000010559f:	48 b8 68 11 00 00 00 	movabs $0x1168,%rax
ffff8000001055a6:	00 00 00 
ffff8000001055a9:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff8000001055ad:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001055b2:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001055b7:	4d 89 d7             	mov    %r10,%r15
ffff8000001055ba:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001055bf:	49 bb ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r11
ffff8000001055c6:	ff ff ff 
ffff8000001055c9:	4d 01 d3             	add    %r10,%r11
ffff8000001055cc:	41 ff d3             	callq  *%r11
ffff8000001055cf:	eb fe                	jmp    ffff8000001055cf <do_bounds+0x84>

ffff8000001055d1 <do_undefined_opcode>:
ffff8000001055d1:	55                   	push   %rbp
ffff8000001055d2:	48 89 e5             	mov    %rsp,%rbp
ffff8000001055d5:	41 57                	push   %r15
ffff8000001055d7:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001055db:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001055db <do_undefined_opcode+0xa>
ffff8000001055e2:	49 bb 4d 73 00 00 00 	movabs $0x734d,%r11
ffff8000001055e9:	00 00 00 
ffff8000001055ec:	4d 01 da             	add    %r11,%r10
ffff8000001055ef:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001055f3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001055f7:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001055fe:	00 
ffff8000001055ff:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105603:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105609:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff80000010560d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105611:	48 8b 08             	mov    (%rax),%rcx
ffff800000105614:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105618:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010561c:	49 89 c9             	mov    %rcx,%r9
ffff80000010561f:	49 89 d0             	mov    %rdx,%r8
ffff800000105622:	48 89 c1             	mov    %rax,%rcx
ffff800000105625:	48 b8 a0 11 00 00 00 	movabs $0x11a0,%rax
ffff80000010562c:	00 00 00 
ffff80000010562f:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000105633:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105638:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010563d:	4d 89 d7             	mov    %r10,%r15
ffff800000105640:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105645:	49 bb ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r11
ffff80000010564c:	ff ff ff 
ffff80000010564f:	4d 01 d3             	add    %r10,%r11
ffff800000105652:	41 ff d3             	callq  *%r11
ffff800000105655:	eb fe                	jmp    ffff800000105655 <do_undefined_opcode+0x84>

ffff800000105657 <do_dev_not_available>:
ffff800000105657:	55                   	push   %rbp
ffff800000105658:	48 89 e5             	mov    %rsp,%rbp
ffff80000010565b:	41 57                	push   %r15
ffff80000010565d:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000105661:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff800000105661 <do_dev_not_available+0xa>
ffff800000105668:	49 bb c7 72 00 00 00 	movabs $0x72c7,%r11
ffff80000010566f:	00 00 00 
ffff800000105672:	4d 01 da             	add    %r11,%r10
ffff800000105675:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105679:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff80000010567d:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105684:	00 
ffff800000105685:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105689:	48 05 98 00 00 00    	add    $0x98,%rax
ffff80000010568f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105693:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105697:	48 8b 08             	mov    (%rax),%rcx
ffff80000010569a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff80000010569e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001056a2:	49 89 c9             	mov    %rcx,%r9
ffff8000001056a5:	49 89 d0             	mov    %rdx,%r8
ffff8000001056a8:	48 89 c1             	mov    %rax,%rcx
ffff8000001056ab:	48 b8 e8 11 00 00 00 	movabs $0x11e8,%rax
ffff8000001056b2:	00 00 00 
ffff8000001056b5:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff8000001056b9:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001056be:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001056c3:	4d 89 d7             	mov    %r10,%r15
ffff8000001056c6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001056cb:	49 bb ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r11
ffff8000001056d2:	ff ff ff 
ffff8000001056d5:	4d 01 d3             	add    %r10,%r11
ffff8000001056d8:	41 ff d3             	callq  *%r11
ffff8000001056db:	eb fe                	jmp    ffff8000001056db <do_dev_not_available+0x84>

ffff8000001056dd <do_double_fault>:
ffff8000001056dd:	55                   	push   %rbp
ffff8000001056de:	48 89 e5             	mov    %rsp,%rbp
ffff8000001056e1:	41 57                	push   %r15
ffff8000001056e3:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001056e7:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001056e7 <do_double_fault+0xa>
ffff8000001056ee:	49 bb 41 72 00 00 00 	movabs $0x7241,%r11
ffff8000001056f5:	00 00 00 
ffff8000001056f8:	4d 01 da             	add    %r11,%r10
ffff8000001056fb:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001056ff:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105703:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff80000010570a:	00 
ffff80000010570b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010570f:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105715:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105719:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010571d:	48 8b 08             	mov    (%rax),%rcx
ffff800000105720:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105724:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105728:	49 89 c9             	mov    %rcx,%r9
ffff80000010572b:	49 89 d0             	mov    %rdx,%r8
ffff80000010572e:	48 89 c1             	mov    %rax,%rcx
ffff800000105731:	48 b8 38 12 00 00 00 	movabs $0x1238,%rax
ffff800000105738:	00 00 00 
ffff80000010573b:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff80000010573f:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105744:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105749:	4d 89 d7             	mov    %r10,%r15
ffff80000010574c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105751:	49 bb ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r11
ffff800000105758:	ff ff ff 
ffff80000010575b:	4d 01 d3             	add    %r10,%r11
ffff80000010575e:	41 ff d3             	callq  *%r11
ffff800000105761:	eb fe                	jmp    ffff800000105761 <do_double_fault+0x84>

ffff800000105763 <do_coprocessor_segment_overrun>:
ffff800000105763:	55                   	push   %rbp
ffff800000105764:	48 89 e5             	mov    %rsp,%rbp
ffff800000105767:	41 57                	push   %r15
ffff800000105769:	48 83 ec 28          	sub    $0x28,%rsp
ffff80000010576d:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff80000010576d <do_coprocessor_segment_overrun+0xa>
ffff800000105774:	49 bb bb 71 00 00 00 	movabs $0x71bb,%r11
ffff80000010577b:	00 00 00 
ffff80000010577e:	4d 01 da             	add    %r11,%r10
ffff800000105781:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105785:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105789:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105790:	00 
ffff800000105791:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105795:	48 05 98 00 00 00    	add    $0x98,%rax
ffff80000010579b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff80000010579f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001057a3:	48 8b 08             	mov    (%rax),%rcx
ffff8000001057a6:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001057aa:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001057ae:	49 89 c9             	mov    %rcx,%r9
ffff8000001057b1:	49 89 d0             	mov    %rdx,%r8
ffff8000001057b4:	48 89 c1             	mov    %rax,%rcx
ffff8000001057b7:	48 b8 68 12 00 00 00 	movabs $0x1268,%rax
ffff8000001057be:	00 00 00 
ffff8000001057c1:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff8000001057c5:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001057ca:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001057cf:	4d 89 d7             	mov    %r10,%r15
ffff8000001057d2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001057d7:	49 bb ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r11
ffff8000001057de:	ff ff ff 
ffff8000001057e1:	4d 01 d3             	add    %r10,%r11
ffff8000001057e4:	41 ff d3             	callq  *%r11
ffff8000001057e7:	eb fe                	jmp    ffff8000001057e7 <do_coprocessor_segment_overrun+0x84>

ffff8000001057e9 <do_invalid_TSS>:
ffff8000001057e9:	55                   	push   %rbp
ffff8000001057ea:	48 89 e5             	mov    %rsp,%rbp
ffff8000001057ed:	41 57                	push   %r15
ffff8000001057ef:	53                   	push   %rbx
ffff8000001057f0:	48 83 ec 20          	sub    $0x20,%rsp
ffff8000001057f4:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff8000001057f4 <do_invalid_TSS+0xb>
ffff8000001057fb:	49 bb 34 71 00 00 00 	movabs $0x7134,%r11
ffff800000105802:	00 00 00 
ffff800000105805:	4c 01 db             	add    %r11,%rbx
ffff800000105808:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff80000010580c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105810:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105817:	00 
ffff800000105818:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010581c:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105822:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105826:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010582a:	48 8b 08             	mov    (%rax),%rcx
ffff80000010582d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105831:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105835:	49 89 c9             	mov    %rcx,%r9
ffff800000105838:	49 89 d0             	mov    %rdx,%r8
ffff80000010583b:	48 89 c1             	mov    %rax,%rcx
ffff80000010583e:	48 b8 b8 12 00 00 00 	movabs $0x12b8,%rax
ffff800000105845:	00 00 00 
ffff800000105848:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010584c:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105851:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105856:	49 89 df             	mov    %rbx,%r15
ffff800000105859:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010585e:	49 ba ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r10
ffff800000105865:	ff ff ff 
ffff800000105868:	49 01 da             	add    %rbx,%r10
ffff80000010586b:	41 ff d2             	callq  *%r10
ffff80000010586e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105872:	83 e0 01             	and    $0x1,%eax
ffff800000105875:	48 85 c0             	test   %rax,%rax
ffff800000105878:	74 2f                	je     ffff8000001058a9 <do_invalid_TSS+0xc0>
ffff80000010587a:	48 b8 e8 12 00 00 00 	movabs $0x12e8,%rax
ffff800000105881:	00 00 00 
ffff800000105884:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105888:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010588d:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105892:	49 89 df             	mov    %rbx,%r15
ffff800000105895:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010589a:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff8000001058a1:	ff ff ff 
ffff8000001058a4:	48 01 d9             	add    %rbx,%rcx
ffff8000001058a7:	ff d1                	callq  *%rcx
ffff8000001058a9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001058ad:	83 e0 02             	and    $0x2,%eax
ffff8000001058b0:	48 85 c0             	test   %rax,%rax
ffff8000001058b3:	74 31                	je     ffff8000001058e6 <do_invalid_TSS+0xfd>
ffff8000001058b5:	48 b8 68 13 00 00 00 	movabs $0x1368,%rax
ffff8000001058bc:	00 00 00 
ffff8000001058bf:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001058c3:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001058c8:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001058cd:	49 89 df             	mov    %rbx,%r15
ffff8000001058d0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001058d5:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff8000001058dc:	ff ff ff 
ffff8000001058df:	48 01 d9             	add    %rbx,%rcx
ffff8000001058e2:	ff d1                	callq  *%rcx
ffff8000001058e4:	eb 2f                	jmp    ffff800000105915 <do_invalid_TSS+0x12c>
ffff8000001058e6:	48 b8 98 13 00 00 00 	movabs $0x1398,%rax
ffff8000001058ed:	00 00 00 
ffff8000001058f0:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001058f4:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001058f9:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001058fe:	49 89 df             	mov    %rbx,%r15
ffff800000105901:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105906:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff80000010590d:	ff ff ff 
ffff800000105910:	48 01 d9             	add    %rbx,%rcx
ffff800000105913:	ff d1                	callq  *%rcx
ffff800000105915:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105919:	83 e0 02             	and    $0x2,%eax
ffff80000010591c:	48 85 c0             	test   %rax,%rax
ffff80000010591f:	75 6c                	jne    ffff80000010598d <do_invalid_TSS+0x1a4>
ffff800000105921:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105925:	83 e0 04             	and    $0x4,%eax
ffff800000105928:	48 85 c0             	test   %rax,%rax
ffff80000010592b:	74 31                	je     ffff80000010595e <do_invalid_TSS+0x175>
ffff80000010592d:	48 b8 d0 13 00 00 00 	movabs $0x13d0,%rax
ffff800000105934:	00 00 00 
ffff800000105937:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010593b:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105940:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105945:	49 89 df             	mov    %rbx,%r15
ffff800000105948:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010594d:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000105954:	ff ff ff 
ffff800000105957:	48 01 d9             	add    %rbx,%rcx
ffff80000010595a:	ff d1                	callq  *%rcx
ffff80000010595c:	eb 2f                	jmp    ffff80000010598d <do_invalid_TSS+0x1a4>
ffff80000010595e:	48 b8 08 14 00 00 00 	movabs $0x1408,%rax
ffff800000105965:	00 00 00 
ffff800000105968:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010596c:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105971:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105976:	49 89 df             	mov    %rbx,%r15
ffff800000105979:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010597e:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000105985:	ff ff ff 
ffff800000105988:	48 01 d9             	add    %rbx,%rcx
ffff80000010598b:	ff d1                	callq  *%rcx
ffff80000010598d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105991:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff800000105996:	48 89 c1             	mov    %rax,%rcx
ffff800000105999:	48 b8 34 14 00 00 00 	movabs $0x1434,%rax
ffff8000001059a0:	00 00 00 
ffff8000001059a3:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001059a7:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001059ac:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001059b1:	49 89 df             	mov    %rbx,%r15
ffff8000001059b4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001059b9:	49 b8 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r8
ffff8000001059c0:	ff ff ff 
ffff8000001059c3:	49 01 d8             	add    %rbx,%r8
ffff8000001059c6:	41 ff d0             	callq  *%r8
ffff8000001059c9:	eb fe                	jmp    ffff8000001059c9 <do_invalid_TSS+0x1e0>

ffff8000001059cb <do_segment_not_present>:
ffff8000001059cb:	55                   	push   %rbp
ffff8000001059cc:	48 89 e5             	mov    %rsp,%rbp
ffff8000001059cf:	41 57                	push   %r15
ffff8000001059d1:	53                   	push   %rbx
ffff8000001059d2:	48 83 ec 20          	sub    $0x20,%rsp
ffff8000001059d6:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff8000001059d6 <do_segment_not_present+0xb>
ffff8000001059dd:	49 bb 52 6f 00 00 00 	movabs $0x6f52,%r11
ffff8000001059e4:	00 00 00 
ffff8000001059e7:	4c 01 db             	add    %r11,%rbx
ffff8000001059ea:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001059ee:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001059f2:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001059f9:	00 
ffff8000001059fa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001059fe:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105a04:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105a08:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105a0c:	48 8b 08             	mov    (%rax),%rcx
ffff800000105a0f:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105a13:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105a17:	49 89 c9             	mov    %rcx,%r9
ffff800000105a1a:	49 89 d0             	mov    %rdx,%r8
ffff800000105a1d:	48 89 c1             	mov    %rax,%rcx
ffff800000105a20:	48 b8 50 14 00 00 00 	movabs $0x1450,%rax
ffff800000105a27:	00 00 00 
ffff800000105a2a:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105a2e:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105a33:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105a38:	49 89 df             	mov    %rbx,%r15
ffff800000105a3b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105a40:	49 ba ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r10
ffff800000105a47:	ff ff ff 
ffff800000105a4a:	49 01 da             	add    %rbx,%r10
ffff800000105a4d:	41 ff d2             	callq  *%r10
ffff800000105a50:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105a54:	83 e0 01             	and    $0x1,%eax
ffff800000105a57:	48 85 c0             	test   %rax,%rax
ffff800000105a5a:	74 2f                	je     ffff800000105a8b <do_segment_not_present+0xc0>
ffff800000105a5c:	48 b8 e8 12 00 00 00 	movabs $0x12e8,%rax
ffff800000105a63:	00 00 00 
ffff800000105a66:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105a6a:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105a6f:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105a74:	49 89 df             	mov    %rbx,%r15
ffff800000105a77:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105a7c:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000105a83:	ff ff ff 
ffff800000105a86:	48 01 d9             	add    %rbx,%rcx
ffff800000105a89:	ff d1                	callq  *%rcx
ffff800000105a8b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105a8f:	83 e0 02             	and    $0x2,%eax
ffff800000105a92:	48 85 c0             	test   %rax,%rax
ffff800000105a95:	74 31                	je     ffff800000105ac8 <do_segment_not_present+0xfd>
ffff800000105a97:	48 b8 68 13 00 00 00 	movabs $0x1368,%rax
ffff800000105a9e:	00 00 00 
ffff800000105aa1:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105aa5:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105aaa:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105aaf:	49 89 df             	mov    %rbx,%r15
ffff800000105ab2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105ab7:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000105abe:	ff ff ff 
ffff800000105ac1:	48 01 d9             	add    %rbx,%rcx
ffff800000105ac4:	ff d1                	callq  *%rcx
ffff800000105ac6:	eb 2f                	jmp    ffff800000105af7 <do_segment_not_present+0x12c>
ffff800000105ac8:	48 b8 98 13 00 00 00 	movabs $0x1398,%rax
ffff800000105acf:	00 00 00 
ffff800000105ad2:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105ad6:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105adb:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105ae0:	49 89 df             	mov    %rbx,%r15
ffff800000105ae3:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105ae8:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000105aef:	ff ff ff 
ffff800000105af2:	48 01 d9             	add    %rbx,%rcx
ffff800000105af5:	ff d1                	callq  *%rcx
ffff800000105af7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105afb:	83 e0 02             	and    $0x2,%eax
ffff800000105afe:	48 85 c0             	test   %rax,%rax
ffff800000105b01:	75 6c                	jne    ffff800000105b6f <do_segment_not_present+0x1a4>
ffff800000105b03:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105b07:	83 e0 04             	and    $0x4,%eax
ffff800000105b0a:	48 85 c0             	test   %rax,%rax
ffff800000105b0d:	74 31                	je     ffff800000105b40 <do_segment_not_present+0x175>
ffff800000105b0f:	48 b8 d0 13 00 00 00 	movabs $0x13d0,%rax
ffff800000105b16:	00 00 00 
ffff800000105b19:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105b1d:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105b22:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105b27:	49 89 df             	mov    %rbx,%r15
ffff800000105b2a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105b2f:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000105b36:	ff ff ff 
ffff800000105b39:	48 01 d9             	add    %rbx,%rcx
ffff800000105b3c:	ff d1                	callq  *%rcx
ffff800000105b3e:	eb 2f                	jmp    ffff800000105b6f <do_segment_not_present+0x1a4>
ffff800000105b40:	48 b8 08 14 00 00 00 	movabs $0x1408,%rax
ffff800000105b47:	00 00 00 
ffff800000105b4a:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105b4e:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105b53:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105b58:	49 89 df             	mov    %rbx,%r15
ffff800000105b5b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105b60:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000105b67:	ff ff ff 
ffff800000105b6a:	48 01 d9             	add    %rbx,%rcx
ffff800000105b6d:	ff d1                	callq  *%rcx
ffff800000105b6f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105b73:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff800000105b78:	48 89 c1             	mov    %rax,%rcx
ffff800000105b7b:	48 b8 34 14 00 00 00 	movabs $0x1434,%rax
ffff800000105b82:	00 00 00 
ffff800000105b85:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105b89:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105b8e:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105b93:	49 89 df             	mov    %rbx,%r15
ffff800000105b96:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105b9b:	49 b8 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r8
ffff800000105ba2:	ff ff ff 
ffff800000105ba5:	49 01 d8             	add    %rbx,%r8
ffff800000105ba8:	41 ff d0             	callq  *%r8
ffff800000105bab:	eb fe                	jmp    ffff800000105bab <do_segment_not_present+0x1e0>

ffff800000105bad <do_stack_segment_fault>:
ffff800000105bad:	55                   	push   %rbp
ffff800000105bae:	48 89 e5             	mov    %rsp,%rbp
ffff800000105bb1:	41 57                	push   %r15
ffff800000105bb3:	53                   	push   %rbx
ffff800000105bb4:	48 83 ec 20          	sub    $0x20,%rsp
ffff800000105bb8:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000105bb8 <do_stack_segment_fault+0xb>
ffff800000105bbf:	49 bb 70 6d 00 00 00 	movabs $0x6d70,%r11
ffff800000105bc6:	00 00 00 
ffff800000105bc9:	4c 01 db             	add    %r11,%rbx
ffff800000105bcc:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105bd0:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105bd4:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105bdb:	00 
ffff800000105bdc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105be0:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105be6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105bea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105bee:	48 8b 08             	mov    (%rax),%rcx
ffff800000105bf1:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105bf5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105bf9:	49 89 c9             	mov    %rcx,%r9
ffff800000105bfc:	49 89 d0             	mov    %rdx,%r8
ffff800000105bff:	48 89 c1             	mov    %rax,%rcx
ffff800000105c02:	48 b8 88 14 00 00 00 	movabs $0x1488,%rax
ffff800000105c09:	00 00 00 
ffff800000105c0c:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105c10:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105c15:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105c1a:	49 89 df             	mov    %rbx,%r15
ffff800000105c1d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105c22:	49 ba ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r10
ffff800000105c29:	ff ff ff 
ffff800000105c2c:	49 01 da             	add    %rbx,%r10
ffff800000105c2f:	41 ff d2             	callq  *%r10
ffff800000105c32:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105c36:	83 e0 01             	and    $0x1,%eax
ffff800000105c39:	48 85 c0             	test   %rax,%rax
ffff800000105c3c:	74 2f                	je     ffff800000105c6d <do_stack_segment_fault+0xc0>
ffff800000105c3e:	48 b8 e8 12 00 00 00 	movabs $0x12e8,%rax
ffff800000105c45:	00 00 00 
ffff800000105c48:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105c4c:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105c51:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105c56:	49 89 df             	mov    %rbx,%r15
ffff800000105c59:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105c5e:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000105c65:	ff ff ff 
ffff800000105c68:	48 01 d9             	add    %rbx,%rcx
ffff800000105c6b:	ff d1                	callq  *%rcx
ffff800000105c6d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105c71:	83 e0 02             	and    $0x2,%eax
ffff800000105c74:	48 85 c0             	test   %rax,%rax
ffff800000105c77:	74 31                	je     ffff800000105caa <do_stack_segment_fault+0xfd>
ffff800000105c79:	48 b8 68 13 00 00 00 	movabs $0x1368,%rax
ffff800000105c80:	00 00 00 
ffff800000105c83:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105c87:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105c8c:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105c91:	49 89 df             	mov    %rbx,%r15
ffff800000105c94:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105c99:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000105ca0:	ff ff ff 
ffff800000105ca3:	48 01 d9             	add    %rbx,%rcx
ffff800000105ca6:	ff d1                	callq  *%rcx
ffff800000105ca8:	eb 2f                	jmp    ffff800000105cd9 <do_stack_segment_fault+0x12c>
ffff800000105caa:	48 b8 98 13 00 00 00 	movabs $0x1398,%rax
ffff800000105cb1:	00 00 00 
ffff800000105cb4:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105cb8:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105cbd:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105cc2:	49 89 df             	mov    %rbx,%r15
ffff800000105cc5:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105cca:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000105cd1:	ff ff ff 
ffff800000105cd4:	48 01 d9             	add    %rbx,%rcx
ffff800000105cd7:	ff d1                	callq  *%rcx
ffff800000105cd9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105cdd:	83 e0 02             	and    $0x2,%eax
ffff800000105ce0:	48 85 c0             	test   %rax,%rax
ffff800000105ce3:	75 6c                	jne    ffff800000105d51 <do_stack_segment_fault+0x1a4>
ffff800000105ce5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105ce9:	83 e0 04             	and    $0x4,%eax
ffff800000105cec:	48 85 c0             	test   %rax,%rax
ffff800000105cef:	74 31                	je     ffff800000105d22 <do_stack_segment_fault+0x175>
ffff800000105cf1:	48 b8 d0 13 00 00 00 	movabs $0x13d0,%rax
ffff800000105cf8:	00 00 00 
ffff800000105cfb:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105cff:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105d04:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105d09:	49 89 df             	mov    %rbx,%r15
ffff800000105d0c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105d11:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000105d18:	ff ff ff 
ffff800000105d1b:	48 01 d9             	add    %rbx,%rcx
ffff800000105d1e:	ff d1                	callq  *%rcx
ffff800000105d20:	eb 2f                	jmp    ffff800000105d51 <do_stack_segment_fault+0x1a4>
ffff800000105d22:	48 b8 08 14 00 00 00 	movabs $0x1408,%rax
ffff800000105d29:	00 00 00 
ffff800000105d2c:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105d30:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105d35:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105d3a:	49 89 df             	mov    %rbx,%r15
ffff800000105d3d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105d42:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000105d49:	ff ff ff 
ffff800000105d4c:	48 01 d9             	add    %rbx,%rcx
ffff800000105d4f:	ff d1                	callq  *%rcx
ffff800000105d51:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105d55:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff800000105d5a:	48 89 c1             	mov    %rax,%rcx
ffff800000105d5d:	48 b8 34 14 00 00 00 	movabs $0x1434,%rax
ffff800000105d64:	00 00 00 
ffff800000105d67:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105d6b:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105d70:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105d75:	49 89 df             	mov    %rbx,%r15
ffff800000105d78:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105d7d:	49 b8 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r8
ffff800000105d84:	ff ff ff 
ffff800000105d87:	49 01 d8             	add    %rbx,%r8
ffff800000105d8a:	41 ff d0             	callq  *%r8
ffff800000105d8d:	eb fe                	jmp    ffff800000105d8d <do_stack_segment_fault+0x1e0>

ffff800000105d8f <do_general_protection>:
ffff800000105d8f:	55                   	push   %rbp
ffff800000105d90:	48 89 e5             	mov    %rsp,%rbp
ffff800000105d93:	41 57                	push   %r15
ffff800000105d95:	53                   	push   %rbx
ffff800000105d96:	48 83 ec 20          	sub    $0x20,%rsp
ffff800000105d9a:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000105d9a <do_general_protection+0xb>
ffff800000105da1:	49 bb 8e 6b 00 00 00 	movabs $0x6b8e,%r11
ffff800000105da8:	00 00 00 
ffff800000105dab:	4c 01 db             	add    %r11,%rbx
ffff800000105dae:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105db2:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105db6:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105dbd:	00 
ffff800000105dbe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105dc2:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105dc8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105dcc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105dd0:	48 8b 08             	mov    (%rax),%rcx
ffff800000105dd3:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105dd7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105ddb:	49 89 c9             	mov    %rcx,%r9
ffff800000105dde:	49 89 d0             	mov    %rdx,%r8
ffff800000105de1:	48 89 c1             	mov    %rax,%rcx
ffff800000105de4:	48 b8 c0 14 00 00 00 	movabs $0x14c0,%rax
ffff800000105deb:	00 00 00 
ffff800000105dee:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105df2:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105df7:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105dfc:	49 89 df             	mov    %rbx,%r15
ffff800000105dff:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105e04:	49 ba ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r10
ffff800000105e0b:	ff ff ff 
ffff800000105e0e:	49 01 da             	add    %rbx,%r10
ffff800000105e11:	41 ff d2             	callq  *%r10
ffff800000105e14:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105e18:	83 e0 01             	and    $0x1,%eax
ffff800000105e1b:	48 85 c0             	test   %rax,%rax
ffff800000105e1e:	74 2f                	je     ffff800000105e4f <do_general_protection+0xc0>
ffff800000105e20:	48 b8 e8 12 00 00 00 	movabs $0x12e8,%rax
ffff800000105e27:	00 00 00 
ffff800000105e2a:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105e2e:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105e33:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105e38:	49 89 df             	mov    %rbx,%r15
ffff800000105e3b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105e40:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000105e47:	ff ff ff 
ffff800000105e4a:	48 01 d9             	add    %rbx,%rcx
ffff800000105e4d:	ff d1                	callq  *%rcx
ffff800000105e4f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105e53:	83 e0 02             	and    $0x2,%eax
ffff800000105e56:	48 85 c0             	test   %rax,%rax
ffff800000105e59:	74 31                	je     ffff800000105e8c <do_general_protection+0xfd>
ffff800000105e5b:	48 b8 68 13 00 00 00 	movabs $0x1368,%rax
ffff800000105e62:	00 00 00 
ffff800000105e65:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105e69:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105e6e:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105e73:	49 89 df             	mov    %rbx,%r15
ffff800000105e76:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105e7b:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000105e82:	ff ff ff 
ffff800000105e85:	48 01 d9             	add    %rbx,%rcx
ffff800000105e88:	ff d1                	callq  *%rcx
ffff800000105e8a:	eb 2f                	jmp    ffff800000105ebb <do_general_protection+0x12c>
ffff800000105e8c:	48 b8 98 13 00 00 00 	movabs $0x1398,%rax
ffff800000105e93:	00 00 00 
ffff800000105e96:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105e9a:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105e9f:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105ea4:	49 89 df             	mov    %rbx,%r15
ffff800000105ea7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105eac:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000105eb3:	ff ff ff 
ffff800000105eb6:	48 01 d9             	add    %rbx,%rcx
ffff800000105eb9:	ff d1                	callq  *%rcx
ffff800000105ebb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105ebf:	83 e0 02             	and    $0x2,%eax
ffff800000105ec2:	48 85 c0             	test   %rax,%rax
ffff800000105ec5:	75 6c                	jne    ffff800000105f33 <do_general_protection+0x1a4>
ffff800000105ec7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105ecb:	83 e0 04             	and    $0x4,%eax
ffff800000105ece:	48 85 c0             	test   %rax,%rax
ffff800000105ed1:	74 31                	je     ffff800000105f04 <do_general_protection+0x175>
ffff800000105ed3:	48 b8 d0 13 00 00 00 	movabs $0x13d0,%rax
ffff800000105eda:	00 00 00 
ffff800000105edd:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105ee1:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105ee6:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105eeb:	49 89 df             	mov    %rbx,%r15
ffff800000105eee:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105ef3:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000105efa:	ff ff ff 
ffff800000105efd:	48 01 d9             	add    %rbx,%rcx
ffff800000105f00:	ff d1                	callq  *%rcx
ffff800000105f02:	eb 2f                	jmp    ffff800000105f33 <do_general_protection+0x1a4>
ffff800000105f04:	48 b8 08 14 00 00 00 	movabs $0x1408,%rax
ffff800000105f0b:	00 00 00 
ffff800000105f0e:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105f12:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105f17:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105f1c:	49 89 df             	mov    %rbx,%r15
ffff800000105f1f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105f24:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000105f2b:	ff ff ff 
ffff800000105f2e:	48 01 d9             	add    %rbx,%rcx
ffff800000105f31:	ff d1                	callq  *%rcx
ffff800000105f33:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105f37:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff800000105f3c:	48 89 c1             	mov    %rax,%rcx
ffff800000105f3f:	48 b8 34 14 00 00 00 	movabs $0x1434,%rax
ffff800000105f46:	00 00 00 
ffff800000105f49:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105f4d:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105f52:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105f57:	49 89 df             	mov    %rbx,%r15
ffff800000105f5a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105f5f:	49 b8 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r8
ffff800000105f66:	ff ff ff 
ffff800000105f69:	49 01 d8             	add    %rbx,%r8
ffff800000105f6c:	41 ff d0             	callq  *%r8
ffff800000105f6f:	eb fe                	jmp    ffff800000105f6f <do_general_protection+0x1e0>

ffff800000105f71 <do_page_fault>:
ffff800000105f71:	55                   	push   %rbp
ffff800000105f72:	48 89 e5             	mov    %rsp,%rbp
ffff800000105f75:	41 57                	push   %r15
ffff800000105f77:	53                   	push   %rbx
ffff800000105f78:	48 83 ec 20          	sub    $0x20,%rsp
ffff800000105f7c:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000105f7c <do_page_fault+0xb>
ffff800000105f83:	49 bb ac 69 00 00 00 	movabs $0x69ac,%r11
ffff800000105f8a:	00 00 00 
ffff800000105f8d:	4c 01 db             	add    %r11,%rbx
ffff800000105f90:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000105f94:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000105f98:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000105f9f:	00 
ffff800000105fa0:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
ffff800000105fa7:	00 
ffff800000105fa8:	0f 20 d0             	mov    %cr2,%rax
ffff800000105fab:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff800000105faf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105fb3:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000105fb9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000105fbd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105fc1:	48 8b 08             	mov    (%rax),%rcx
ffff800000105fc4:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000105fc8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105fcc:	49 89 c9             	mov    %rcx,%r9
ffff800000105fcf:	49 89 d0             	mov    %rdx,%r8
ffff800000105fd2:	48 89 c1             	mov    %rax,%rcx
ffff800000105fd5:	48 b8 f8 14 00 00 00 	movabs $0x14f8,%rax
ffff800000105fdc:	00 00 00 
ffff800000105fdf:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000105fe3:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000105fe8:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000105fed:	49 89 df             	mov    %rbx,%r15
ffff800000105ff0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105ff5:	49 ba ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r10
ffff800000105ffc:	ff ff ff 
ffff800000105fff:	49 01 da             	add    %rbx,%r10
ffff800000106002:	41 ff d2             	callq  *%r10
ffff800000106005:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000106009:	83 e0 01             	and    $0x1,%eax
ffff80000010600c:	48 85 c0             	test   %rax,%rax
ffff80000010600f:	75 2f                	jne    ffff800000106040 <do_page_fault+0xcf>
ffff800000106011:	48 b8 24 15 00 00 00 	movabs $0x1524,%rax
ffff800000106018:	00 00 00 
ffff80000010601b:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010601f:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106024:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106029:	49 89 df             	mov    %rbx,%r15
ffff80000010602c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106031:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000106038:	ff ff ff 
ffff80000010603b:	48 01 d9             	add    %rbx,%rcx
ffff80000010603e:	ff d1                	callq  *%rcx
ffff800000106040:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000106044:	83 e0 02             	and    $0x2,%eax
ffff800000106047:	48 85 c0             	test   %rax,%rax
ffff80000010604a:	74 31                	je     ffff80000010607d <do_page_fault+0x10c>
ffff80000010604c:	48 b8 37 15 00 00 00 	movabs $0x1537,%rax
ffff800000106053:	00 00 00 
ffff800000106056:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010605a:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010605f:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106064:	49 89 df             	mov    %rbx,%r15
ffff800000106067:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010606c:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000106073:	ff ff ff 
ffff800000106076:	48 01 d9             	add    %rbx,%rcx
ffff800000106079:	ff d1                	callq  *%rcx
ffff80000010607b:	eb 2f                	jmp    ffff8000001060ac <do_page_fault+0x13b>
ffff80000010607d:	48 b8 4b 15 00 00 00 	movabs $0x154b,%rax
ffff800000106084:	00 00 00 
ffff800000106087:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010608b:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106090:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106095:	49 89 df             	mov    %rbx,%r15
ffff800000106098:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010609d:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff8000001060a4:	ff ff ff 
ffff8000001060a7:	48 01 d9             	add    %rbx,%rcx
ffff8000001060aa:	ff d1                	callq  *%rcx
ffff8000001060ac:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001060b0:	83 e0 04             	and    $0x4,%eax
ffff8000001060b3:	48 85 c0             	test   %rax,%rax
ffff8000001060b6:	74 31                	je     ffff8000001060e9 <do_page_fault+0x178>
ffff8000001060b8:	48 b8 5e 15 00 00 00 	movabs $0x155e,%rax
ffff8000001060bf:	00 00 00 
ffff8000001060c2:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001060c6:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001060cb:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001060d0:	49 89 df             	mov    %rbx,%r15
ffff8000001060d3:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001060d8:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff8000001060df:	ff ff ff 
ffff8000001060e2:	48 01 d9             	add    %rbx,%rcx
ffff8000001060e5:	ff d1                	callq  *%rcx
ffff8000001060e7:	eb 2f                	jmp    ffff800000106118 <do_page_fault+0x1a7>
ffff8000001060e9:	48 b8 70 15 00 00 00 	movabs $0x1570,%rax
ffff8000001060f0:	00 00 00 
ffff8000001060f3:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001060f7:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001060fc:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106101:	49 89 df             	mov    %rbx,%r15
ffff800000106104:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106109:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000106110:	ff ff ff 
ffff800000106113:	48 01 d9             	add    %rbx,%rcx
ffff800000106116:	ff d1                	callq  *%rcx
ffff800000106118:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010611c:	83 e0 08             	and    $0x8,%eax
ffff80000010611f:	48 85 c0             	test   %rax,%rax
ffff800000106122:	74 2f                	je     ffff800000106153 <do_page_fault+0x1e2>
ffff800000106124:	48 b8 8c 15 00 00 00 	movabs $0x158c,%rax
ffff80000010612b:	00 00 00 
ffff80000010612e:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106132:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106137:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010613c:	49 89 df             	mov    %rbx,%r15
ffff80000010613f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106144:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff80000010614b:	ff ff ff 
ffff80000010614e:	48 01 d9             	add    %rbx,%rcx
ffff800000106151:	ff d1                	callq  *%rcx
ffff800000106153:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000106157:	83 e0 10             	and    $0x10,%eax
ffff80000010615a:	48 85 c0             	test   %rax,%rax
ffff80000010615d:	74 2f                	je     ffff80000010618e <do_page_fault+0x21d>
ffff80000010615f:	48 b8 a8 15 00 00 00 	movabs $0x15a8,%rax
ffff800000106166:	00 00 00 
ffff800000106169:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010616d:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106172:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106177:	49 89 df             	mov    %rbx,%r15
ffff80000010617a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010617f:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000106186:	ff ff ff 
ffff800000106189:	48 01 d9             	add    %rbx,%rcx
ffff80000010618c:	ff d1                	callq  *%rcx
ffff80000010618e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106192:	48 89 c1             	mov    %rax,%rcx
ffff800000106195:	48 b8 c8 15 00 00 00 	movabs $0x15c8,%rax
ffff80000010619c:	00 00 00 
ffff80000010619f:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001061a3:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001061a8:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001061ad:	49 89 df             	mov    %rbx,%r15
ffff8000001061b0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001061b5:	49 b8 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r8
ffff8000001061bc:	ff ff ff 
ffff8000001061bf:	49 01 d8             	add    %rbx,%r8
ffff8000001061c2:	41 ff d0             	callq  *%r8
ffff8000001061c5:	eb fe                	jmp    ffff8000001061c5 <do_page_fault+0x254>

ffff8000001061c7 <do_x87_FPU_error>:
ffff8000001061c7:	55                   	push   %rbp
ffff8000001061c8:	48 89 e5             	mov    %rsp,%rbp
ffff8000001061cb:	41 57                	push   %r15
ffff8000001061cd:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001061d1:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001061d1 <do_x87_FPU_error+0xa>
ffff8000001061d8:	49 bb 57 67 00 00 00 	movabs $0x6757,%r11
ffff8000001061df:	00 00 00 
ffff8000001061e2:	4d 01 da             	add    %r11,%r10
ffff8000001061e5:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001061e9:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001061ed:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001061f4:	00 
ffff8000001061f5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001061f9:	48 05 98 00 00 00    	add    $0x98,%rax
ffff8000001061ff:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000106203:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106207:	48 8b 08             	mov    (%rax),%rcx
ffff80000010620a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff80000010620e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000106212:	49 89 c9             	mov    %rcx,%r9
ffff800000106215:	49 89 d0             	mov    %rdx,%r8
ffff800000106218:	48 89 c1             	mov    %rax,%rcx
ffff80000010621b:	48 b8 d0 15 00 00 00 	movabs $0x15d0,%rax
ffff800000106222:	00 00 00 
ffff800000106225:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000106229:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010622e:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106233:	4d 89 d7             	mov    %r10,%r15
ffff800000106236:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010623b:	49 bb ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r11
ffff800000106242:	ff ff ff 
ffff800000106245:	4d 01 d3             	add    %r10,%r11
ffff800000106248:	41 ff d3             	callq  *%r11
ffff80000010624b:	eb fe                	jmp    ffff80000010624b <do_x87_FPU_error+0x84>

ffff80000010624d <do_alignment_check>:
ffff80000010624d:	55                   	push   %rbp
ffff80000010624e:	48 89 e5             	mov    %rsp,%rbp
ffff800000106251:	41 57                	push   %r15
ffff800000106253:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000106257:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff800000106257 <do_alignment_check+0xa>
ffff80000010625e:	49 bb d1 66 00 00 00 	movabs $0x66d1,%r11
ffff800000106265:	00 00 00 
ffff800000106268:	4d 01 da             	add    %r11,%r10
ffff80000010626b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff80000010626f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000106273:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff80000010627a:	00 
ffff80000010627b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010627f:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000106285:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000106289:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010628d:	48 8b 08             	mov    (%rax),%rcx
ffff800000106290:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000106294:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000106298:	49 89 c9             	mov    %rcx,%r9
ffff80000010629b:	49 89 d0             	mov    %rdx,%r8
ffff80000010629e:	48 89 c1             	mov    %rax,%rcx
ffff8000001062a1:	48 b8 20 16 00 00 00 	movabs $0x1620,%rax
ffff8000001062a8:	00 00 00 
ffff8000001062ab:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff8000001062af:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001062b4:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001062b9:	4d 89 d7             	mov    %r10,%r15
ffff8000001062bc:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001062c1:	49 bb ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r11
ffff8000001062c8:	ff ff ff 
ffff8000001062cb:	4d 01 d3             	add    %r10,%r11
ffff8000001062ce:	41 ff d3             	callq  *%r11
ffff8000001062d1:	eb fe                	jmp    ffff8000001062d1 <do_alignment_check+0x84>

ffff8000001062d3 <do_machine_check>:
ffff8000001062d3:	55                   	push   %rbp
ffff8000001062d4:	48 89 e5             	mov    %rsp,%rbp
ffff8000001062d7:	41 57                	push   %r15
ffff8000001062d9:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001062dd:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001062dd <do_machine_check+0xa>
ffff8000001062e4:	49 bb 4b 66 00 00 00 	movabs $0x664b,%r11
ffff8000001062eb:	00 00 00 
ffff8000001062ee:	4d 01 da             	add    %r11,%r10
ffff8000001062f1:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff8000001062f5:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff8000001062f9:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000106300:	00 
ffff800000106301:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000106305:	48 05 98 00 00 00    	add    $0x98,%rax
ffff80000010630b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff80000010630f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106313:	48 8b 08             	mov    (%rax),%rcx
ffff800000106316:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff80000010631a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010631e:	49 89 c9             	mov    %rcx,%r9
ffff800000106321:	49 89 d0             	mov    %rdx,%r8
ffff800000106324:	48 89 c1             	mov    %rax,%rcx
ffff800000106327:	48 b8 58 16 00 00 00 	movabs $0x1658,%rax
ffff80000010632e:	00 00 00 
ffff800000106331:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000106335:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff80000010633a:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010633f:	4d 89 d7             	mov    %r10,%r15
ffff800000106342:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106347:	49 bb ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r11
ffff80000010634e:	ff ff ff 
ffff800000106351:	4d 01 d3             	add    %r10,%r11
ffff800000106354:	41 ff d3             	callq  *%r11
ffff800000106357:	eb fe                	jmp    ffff800000106357 <do_machine_check+0x84>

ffff800000106359 <do_SIMD_exception>:
ffff800000106359:	55                   	push   %rbp
ffff80000010635a:	48 89 e5             	mov    %rsp,%rbp
ffff80000010635d:	41 57                	push   %r15
ffff80000010635f:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000106363:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff800000106363 <do_SIMD_exception+0xa>
ffff80000010636a:	49 bb c5 65 00 00 00 	movabs $0x65c5,%r11
ffff800000106371:	00 00 00 
ffff800000106374:	4d 01 da             	add    %r11,%r10
ffff800000106377:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff80000010637b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff80000010637f:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000106386:	00 
ffff800000106387:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010638b:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000106391:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000106395:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106399:	48 8b 08             	mov    (%rax),%rcx
ffff80000010639c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff8000001063a0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001063a4:	49 89 c9             	mov    %rcx,%r9
ffff8000001063a7:	49 89 d0             	mov    %rdx,%r8
ffff8000001063aa:	48 89 c1             	mov    %rax,%rcx
ffff8000001063ad:	48 b8 88 16 00 00 00 	movabs $0x1688,%rax
ffff8000001063b4:	00 00 00 
ffff8000001063b7:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff8000001063bb:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff8000001063c0:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001063c5:	4d 89 d7             	mov    %r10,%r15
ffff8000001063c8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001063cd:	49 bb ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r11
ffff8000001063d4:	ff ff ff 
ffff8000001063d7:	4d 01 d3             	add    %r10,%r11
ffff8000001063da:	41 ff d3             	callq  *%r11
ffff8000001063dd:	eb fe                	jmp    ffff8000001063dd <do_SIMD_exception+0x84>

ffff8000001063df <do_virtualization_exception>:
ffff8000001063df:	55                   	push   %rbp
ffff8000001063e0:	48 89 e5             	mov    %rsp,%rbp
ffff8000001063e3:	41 57                	push   %r15
ffff8000001063e5:	48 83 ec 28          	sub    $0x28,%rsp
ffff8000001063e9:	4c 8d 15 f9 ff ff ff 	lea    -0x7(%rip),%r10        # ffff8000001063e9 <do_virtualization_exception+0xa>
ffff8000001063f0:	49 bb 3f 65 00 00 00 	movabs $0x653f,%r11
ffff8000001063f7:	00 00 00 
ffff8000001063fa:	4d 01 da             	add    %r11,%r10
ffff8000001063fd:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000106401:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff800000106405:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff80000010640c:	00 
ffff80000010640d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000106411:	48 05 98 00 00 00    	add    $0x98,%rax
ffff800000106417:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff80000010641b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010641f:	48 8b 08             	mov    (%rax),%rcx
ffff800000106422:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000106426:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010642a:	49 89 c9             	mov    %rcx,%r9
ffff80000010642d:	49 89 d0             	mov    %rdx,%r8
ffff800000106430:	48 89 c1             	mov    %rax,%rcx
ffff800000106433:	48 b8 d0 16 00 00 00 	movabs $0x16d0,%rax
ffff80000010643a:	00 00 00 
ffff80000010643d:	49 8d 14 02          	lea    (%r10,%rax,1),%rdx
ffff800000106441:	be 00 00 ff 00       	mov    $0xff0000,%esi
ffff800000106446:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010644b:	4d 89 d7             	mov    %r10,%r15
ffff80000010644e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106453:	49 bb ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r11
ffff80000010645a:	ff ff ff 
ffff80000010645d:	4d 01 d3             	add    %r10,%r11
ffff800000106460:	41 ff d3             	callq  *%r11
ffff800000106463:	eb fe                	jmp    ffff800000106463 <do_virtualization_exception+0x84>

ffff800000106465 <set_sys_int>:
ffff800000106465:	55                   	push   %rbp
ffff800000106466:	48 89 e5             	mov    %rsp,%rbp
ffff800000106469:	41 57                	push   %r15
ffff80000010646b:	53                   	push   %rbx
ffff80000010646c:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff80000010646c <set_sys_int+0x7>
ffff800000106473:	49 bb bc 64 00 00 00 	movabs $0x64bc,%r11
ffff80000010647a:	00 00 00 
ffff80000010647d:	4c 01 db             	add    %r11,%rbx
ffff800000106480:	48 b8 00 ff ff ff ff 	movabs $0xffffffffffffff00,%rax
ffff800000106487:	ff ff ff 
ffff80000010648a:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010648e:	48 89 c2             	mov    %rax,%rdx
ffff800000106491:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106496:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010649b:	49 89 df             	mov    %rbx,%r15
ffff80000010649e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001064a3:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff8000001064aa:	ff ff ff 
ffff8000001064ad:	48 01 d9             	add    %rbx,%rcx
ffff8000001064b0:	ff d1                	callq  *%rcx
ffff8000001064b2:	48 b8 30 ff ff ff ff 	movabs $0xffffffffffffff30,%rax
ffff8000001064b9:	ff ff ff 
ffff8000001064bc:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001064c0:	48 89 c2             	mov    %rax,%rdx
ffff8000001064c3:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001064c8:	bf 01 00 00 00       	mov    $0x1,%edi
ffff8000001064cd:	49 89 df             	mov    %rbx,%r15
ffff8000001064d0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001064d5:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff8000001064dc:	ff ff ff 
ffff8000001064df:	48 01 d9             	add    %rbx,%rcx
ffff8000001064e2:	ff d1                	callq  *%rcx
ffff8000001064e4:	48 b8 e8 ff ff ff ff 	movabs $0xffffffffffffffe8,%rax
ffff8000001064eb:	ff ff ff 
ffff8000001064ee:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001064f2:	48 89 c2             	mov    %rax,%rdx
ffff8000001064f5:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001064fa:	bf 02 00 00 00       	mov    $0x2,%edi
ffff8000001064ff:	49 89 df             	mov    %rbx,%r15
ffff800000106502:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106507:	48 b9 f9 79 ff ff ff 	movabs $0xffffffffffff79f9,%rcx
ffff80000010650e:	ff ff ff 
ffff800000106511:	48 01 d9             	add    %rbx,%rcx
ffff800000106514:	ff d1                	callq  *%rcx
ffff800000106516:	48 b8 60 ff ff ff ff 	movabs $0xffffffffffffff60,%rax
ffff80000010651d:	ff ff ff 
ffff800000106520:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106524:	48 89 c2             	mov    %rax,%rdx
ffff800000106527:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010652c:	bf 03 00 00 00       	mov    $0x3,%edi
ffff800000106531:	49 89 df             	mov    %rbx,%r15
ffff800000106534:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106539:	48 b9 9f 7a ff ff ff 	movabs $0xffffffffffff7a9f,%rcx
ffff800000106540:	ff ff ff 
ffff800000106543:	48 01 d9             	add    %rbx,%rcx
ffff800000106546:	ff d1                	callq  *%rcx
ffff800000106548:	48 b8 28 ff ff ff ff 	movabs $0xffffffffffffff28,%rax
ffff80000010654f:	ff ff ff 
ffff800000106552:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106556:	48 89 c2             	mov    %rax,%rdx
ffff800000106559:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010655e:	bf 04 00 00 00       	mov    $0x4,%edi
ffff800000106563:	49 89 df             	mov    %rbx,%r15
ffff800000106566:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010656b:	48 b9 9f 7a ff ff ff 	movabs $0xffffffffffff7a9f,%rcx
ffff800000106572:	ff ff ff 
ffff800000106575:	48 01 d9             	add    %rbx,%rcx
ffff800000106578:	ff d1                	callq  *%rcx
ffff80000010657a:	48 b8 38 ff ff ff ff 	movabs $0xffffffffffffff38,%rax
ffff800000106581:	ff ff ff 
ffff800000106584:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106588:	48 89 c2             	mov    %rax,%rdx
ffff80000010658b:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106590:	bf 05 00 00 00       	mov    $0x5,%edi
ffff800000106595:	49 89 df             	mov    %rbx,%r15
ffff800000106598:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010659d:	48 b9 9f 7a ff ff ff 	movabs $0xffffffffffff7a9f,%rcx
ffff8000001065a4:	ff ff ff 
ffff8000001065a7:	48 01 d9             	add    %rbx,%rcx
ffff8000001065aa:	ff d1                	callq  *%rcx
ffff8000001065ac:	48 b8 68 ff ff ff ff 	movabs $0xffffffffffffff68,%rax
ffff8000001065b3:	ff ff ff 
ffff8000001065b6:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001065ba:	48 89 c2             	mov    %rax,%rdx
ffff8000001065bd:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001065c2:	bf 06 00 00 00       	mov    $0x6,%edi
ffff8000001065c7:	49 89 df             	mov    %rbx,%r15
ffff8000001065ca:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001065cf:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff8000001065d6:	ff ff ff 
ffff8000001065d9:	48 01 d9             	add    %rbx,%rcx
ffff8000001065dc:	ff d1                	callq  *%rcx
ffff8000001065de:	48 b8 f0 ff ff ff ff 	movabs $0xfffffffffffffff0,%rax
ffff8000001065e5:	ff ff ff 
ffff8000001065e8:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001065ec:	48 89 c2             	mov    %rax,%rdx
ffff8000001065ef:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001065f4:	bf 07 00 00 00       	mov    $0x7,%edi
ffff8000001065f9:	49 89 df             	mov    %rbx,%r15
ffff8000001065fc:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106601:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff800000106608:	ff ff ff 
ffff80000010660b:	48 01 d9             	add    %rbx,%rcx
ffff80000010660e:	ff d1                	callq  *%rcx
ffff800000106610:	48 b8 88 ff ff ff ff 	movabs $0xffffffffffffff88,%rax
ffff800000106617:	ff ff ff 
ffff80000010661a:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010661e:	48 89 c2             	mov    %rax,%rdx
ffff800000106621:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106626:	bf 08 00 00 00       	mov    $0x8,%edi
ffff80000010662b:	49 89 df             	mov    %rbx,%r15
ffff80000010662e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106633:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff80000010663a:	ff ff ff 
ffff80000010663d:	48 01 d9             	add    %rbx,%rcx
ffff800000106640:	ff d1                	callq  *%rcx
ffff800000106642:	48 b8 a8 ff ff ff ff 	movabs $0xffffffffffffffa8,%rax
ffff800000106649:	ff ff ff 
ffff80000010664c:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106650:	48 89 c2             	mov    %rax,%rdx
ffff800000106653:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106658:	bf 09 00 00 00       	mov    $0x9,%edi
ffff80000010665d:	49 89 df             	mov    %rbx,%r15
ffff800000106660:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106665:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff80000010666c:	ff ff ff 
ffff80000010666f:	48 01 d9             	add    %rbx,%rcx
ffff800000106672:	ff d1                	callq  *%rcx
ffff800000106674:	48 b8 40 ff ff ff ff 	movabs $0xffffffffffffff40,%rax
ffff80000010667b:	ff ff ff 
ffff80000010667e:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106682:	48 89 c2             	mov    %rax,%rdx
ffff800000106685:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010668a:	bf 0a 00 00 00       	mov    $0xa,%edi
ffff80000010668f:	49 89 df             	mov    %rbx,%r15
ffff800000106692:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106697:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff80000010669e:	ff ff ff 
ffff8000001066a1:	48 01 d9             	add    %rbx,%rcx
ffff8000001066a4:	ff d1                	callq  *%rcx
ffff8000001066a6:	48 b8 48 ff ff ff ff 	movabs $0xffffffffffffff48,%rax
ffff8000001066ad:	ff ff ff 
ffff8000001066b0:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001066b4:	48 89 c2             	mov    %rax,%rdx
ffff8000001066b7:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001066bc:	bf 0b 00 00 00       	mov    $0xb,%edi
ffff8000001066c1:	49 89 df             	mov    %rbx,%r15
ffff8000001066c4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001066c9:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff8000001066d0:	ff ff ff 
ffff8000001066d3:	48 01 d9             	add    %rbx,%rcx
ffff8000001066d6:	ff d1                	callq  *%rcx
ffff8000001066d8:	48 b8 50 ff ff ff ff 	movabs $0xffffffffffffff50,%rax
ffff8000001066df:	ff ff ff 
ffff8000001066e2:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001066e6:	48 89 c2             	mov    %rax,%rdx
ffff8000001066e9:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001066ee:	bf 0c 00 00 00       	mov    $0xc,%edi
ffff8000001066f3:	49 89 df             	mov    %rbx,%r15
ffff8000001066f6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001066fb:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff800000106702:	ff ff ff 
ffff800000106705:	48 01 d9             	add    %rbx,%rcx
ffff800000106708:	ff d1                	callq  *%rcx
ffff80000010670a:	48 b8 18 ff ff ff ff 	movabs $0xffffffffffffff18,%rax
ffff800000106711:	ff ff ff 
ffff800000106714:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106718:	48 89 c2             	mov    %rax,%rdx
ffff80000010671b:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106720:	bf 0d 00 00 00       	mov    $0xd,%edi
ffff800000106725:	49 89 df             	mov    %rbx,%r15
ffff800000106728:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010672d:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff800000106734:	ff ff ff 
ffff800000106737:	48 01 d9             	add    %rbx,%rcx
ffff80000010673a:	ff d1                	callq  *%rcx
ffff80000010673c:	48 b8 b8 ff ff ff ff 	movabs $0xffffffffffffffb8,%rax
ffff800000106743:	ff ff ff 
ffff800000106746:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010674a:	48 89 c2             	mov    %rax,%rdx
ffff80000010674d:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106752:	bf 0e 00 00 00       	mov    $0xe,%edi
ffff800000106757:	49 89 df             	mov    %rbx,%r15
ffff80000010675a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010675f:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff800000106766:	ff ff ff 
ffff800000106769:	48 01 d9             	add    %rbx,%rcx
ffff80000010676c:	ff d1                	callq  *%rcx
ffff80000010676e:	48 b8 80 ff ff ff ff 	movabs $0xffffffffffffff80,%rax
ffff800000106775:	ff ff ff 
ffff800000106778:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010677c:	48 89 c2             	mov    %rax,%rdx
ffff80000010677f:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106784:	bf 10 00 00 00       	mov    $0x10,%edi
ffff800000106789:	49 89 df             	mov    %rbx,%r15
ffff80000010678c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106791:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff800000106798:	ff ff ff 
ffff80000010679b:	48 01 d9             	add    %rbx,%rcx
ffff80000010679e:	ff d1                	callq  *%rcx
ffff8000001067a0:	48 b8 78 ff ff ff ff 	movabs $0xffffffffffffff78,%rax
ffff8000001067a7:	ff ff ff 
ffff8000001067aa:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001067ae:	48 89 c2             	mov    %rax,%rdx
ffff8000001067b1:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001067b6:	bf 11 00 00 00       	mov    $0x11,%edi
ffff8000001067bb:	49 89 df             	mov    %rbx,%r15
ffff8000001067be:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001067c3:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff8000001067ca:	ff ff ff 
ffff8000001067cd:	48 01 d9             	add    %rbx,%rcx
ffff8000001067d0:	ff d1                	callq  *%rcx
ffff8000001067d2:	48 b8 c8 ff ff ff ff 	movabs $0xffffffffffffffc8,%rax
ffff8000001067d9:	ff ff ff 
ffff8000001067dc:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001067e0:	48 89 c2             	mov    %rax,%rdx
ffff8000001067e3:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001067e8:	bf 12 00 00 00       	mov    $0x12,%edi
ffff8000001067ed:	49 89 df             	mov    %rbx,%r15
ffff8000001067f0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001067f5:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff8000001067fc:	ff ff ff 
ffff8000001067ff:	48 01 d9             	add    %rbx,%rcx
ffff800000106802:	ff d1                	callq  *%rcx
ffff800000106804:	48 b8 d8 ff ff ff ff 	movabs $0xffffffffffffffd8,%rax
ffff80000010680b:	ff ff ff 
ffff80000010680e:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106812:	48 89 c2             	mov    %rax,%rdx
ffff800000106815:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010681a:	bf 13 00 00 00       	mov    $0x13,%edi
ffff80000010681f:	49 89 df             	mov    %rbx,%r15
ffff800000106822:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106827:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff80000010682e:	ff ff ff 
ffff800000106831:	48 01 d9             	add    %rbx,%rcx
ffff800000106834:	ff d1                	callq  *%rcx
ffff800000106836:	48 b8 98 ff ff ff ff 	movabs $0xffffffffffffff98,%rax
ffff80000010683d:	ff ff ff 
ffff800000106840:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106844:	48 89 c2             	mov    %rax,%rdx
ffff800000106847:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010684c:	bf 14 00 00 00       	mov    $0x14,%edi
ffff800000106851:	49 89 df             	mov    %rbx,%r15
ffff800000106854:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106859:	48 b9 4c 7a ff ff ff 	movabs $0xffffffffffff7a4c,%rcx
ffff800000106860:	ff ff ff 
ffff800000106863:	48 01 d9             	add    %rbx,%rcx
ffff800000106866:	ff d1                	callq  *%rcx
ffff800000106868:	90                   	nop
ffff800000106869:	5b                   	pop    %rbx
ffff80000010686a:	41 5f                	pop    %r15
ffff80000010686c:	5d                   	pop    %rbp
ffff80000010686d:	c3                   	retq   

ffff80000010686e <page_init>:
ffff80000010686e:	55                   	push   %rbp
ffff80000010686f:	48 89 e5             	mov    %rsp,%rbp
ffff800000106872:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000106872 <page_init+0x4>
ffff800000106879:	49 bb b6 60 00 00 00 	movabs $0x60b6,%r11
ffff800000106880:	00 00 00 
ffff800000106883:	4c 01 d8             	add    %r11,%rax
ffff800000106886:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff80000010688a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff80000010688e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106892:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106896:	48 0b 45 f0          	or     -0x10(%rbp),%rax
ffff80000010689a:	48 89 c2             	mov    %rax,%rdx
ffff80000010689d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001068a1:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff8000001068a5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001068a9:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001068ad:	48 85 c0             	test   %rax,%rax
ffff8000001068b0:	74 10                	je     ffff8000001068c2 <page_init+0x54>
ffff8000001068b2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001068b6:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff8000001068ba:	83 e0 10             	and    $0x10,%eax
ffff8000001068bd:	48 85 c0             	test   %rax,%rax
ffff8000001068c0:	74 27                	je     ffff8000001068e9 <page_init+0x7b>
ffff8000001068c2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001068c6:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001068ca:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001068ce:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001068d2:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff8000001068d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001068da:	48 8b 00             	mov    (%rax),%rax
ffff8000001068dd:	48 8b 50 48          	mov    0x48(%rax),%rdx
ffff8000001068e1:	48 83 c2 01          	add    $0x1,%rdx
ffff8000001068e5:	48 89 50 48          	mov    %rdx,0x48(%rax)
ffff8000001068e9:	b8 01 00 00 00       	mov    $0x1,%eax
ffff8000001068ee:	5d                   	pop    %rbp
ffff8000001068ef:	c3                   	retq   

ffff8000001068f0 <page_clean>:
ffff8000001068f0:	55                   	push   %rbp
ffff8000001068f1:	48 89 e5             	mov    %rsp,%rbp
ffff8000001068f4:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff8000001068f4 <page_clean+0x4>
ffff8000001068fb:	49 bb 34 60 00 00 00 	movabs $0x6034,%r11
ffff800000106902:	00 00 00 
ffff800000106905:	4c 01 d8             	add    %r11,%rax
ffff800000106908:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff80000010690c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106910:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000106914:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff800000106918:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010691c:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff800000106920:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106924:	48 8b 00             	mov    (%rax),%rax
ffff800000106927:	48 8b 50 48          	mov    0x48(%rax),%rdx
ffff80000010692b:	48 83 ea 01          	sub    $0x1,%rdx
ffff80000010692f:	48 89 50 48          	mov    %rdx,0x48(%rax)
ffff800000106933:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106937:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff80000010693b:	48 85 c0             	test   %rax,%rax
ffff80000010693e:	75 16                	jne    ffff800000106956 <page_clean+0x66>
ffff800000106940:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106944:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106948:	83 e0 01             	and    $0x1,%eax
ffff80000010694b:	48 89 c2             	mov    %rax,%rdx
ffff80000010694e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106952:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000106956:	b8 01 00 00 00       	mov    $0x1,%eax
ffff80000010695b:	5d                   	pop    %rbp
ffff80000010695c:	c3                   	retq   

ffff80000010695d <get_page_attribute>:
ffff80000010695d:	55                   	push   %rbp
ffff80000010695e:	48 89 e5             	mov    %rsp,%rbp
ffff800000106961:	41 57                	push   %r15
ffff800000106963:	48 83 ec 18          	sub    $0x18,%rsp
ffff800000106967:	48 8d 0d f9 ff ff ff 	lea    -0x7(%rip),%rcx        # ffff800000106967 <get_page_attribute+0xa>
ffff80000010696e:	49 bb c1 5f 00 00 00 	movabs $0x5fc1,%r11
ffff800000106975:	00 00 00 
ffff800000106978:	4c 01 d9             	add    %r11,%rcx
ffff80000010697b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff80000010697f:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
ffff800000106984:	75 37                	jne    ffff8000001069bd <get_page_attribute+0x60>
ffff800000106986:	48 b8 10 17 00 00 00 	movabs $0x1710,%rax
ffff80000010698d:	00 00 00 
ffff800000106990:	48 8d 14 01          	lea    (%rcx,%rax,1),%rdx
ffff800000106994:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106999:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010699e:	49 89 cf             	mov    %rcx,%r15
ffff8000001069a1:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001069a6:	49 b8 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r8
ffff8000001069ad:	ff ff ff 
ffff8000001069b0:	49 01 c8             	add    %rcx,%r8
ffff8000001069b3:	41 ff d0             	callq  *%r8
ffff8000001069b6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001069bb:	eb 08                	jmp    ffff8000001069c5 <get_page_attribute+0x68>
ffff8000001069bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001069c1:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff8000001069c5:	48 83 c4 18          	add    $0x18,%rsp
ffff8000001069c9:	41 5f                	pop    %r15
ffff8000001069cb:	5d                   	pop    %rbp
ffff8000001069cc:	c3                   	retq   

ffff8000001069cd <set_page_attribute>:
ffff8000001069cd:	55                   	push   %rbp
ffff8000001069ce:	48 89 e5             	mov    %rsp,%rbp
ffff8000001069d1:	41 57                	push   %r15
ffff8000001069d3:	48 83 ec 18          	sub    $0x18,%rsp
ffff8000001069d7:	48 8d 0d f9 ff ff ff 	lea    -0x7(%rip),%rcx        # ffff8000001069d7 <set_page_attribute+0xa>
ffff8000001069de:	49 bb 51 5f 00 00 00 	movabs $0x5f51,%r11
ffff8000001069e5:	00 00 00 
ffff8000001069e8:	4c 01 d9             	add    %r11,%rcx
ffff8000001069eb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff8000001069ef:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
ffff8000001069f3:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
ffff8000001069f8:	75 37                	jne    ffff800000106a31 <set_page_attribute+0x64>
ffff8000001069fa:	48 b8 30 17 00 00 00 	movabs $0x1730,%rax
ffff800000106a01:	00 00 00 
ffff800000106a04:	48 8d 14 01          	lea    (%rcx,%rax,1),%rdx
ffff800000106a08:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106a0d:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106a12:	49 89 cf             	mov    %rcx,%r15
ffff800000106a15:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106a1a:	49 b8 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r8
ffff800000106a21:	ff ff ff 
ffff800000106a24:	49 01 c8             	add    %rcx,%r8
ffff800000106a27:	41 ff d0             	callq  *%r8
ffff800000106a2a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106a2f:	eb 11                	jmp    ffff800000106a42 <set_page_attribute+0x75>
ffff800000106a31:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106a35:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
ffff800000106a39:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000106a3d:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000106a42:	48 83 c4 18          	add    $0x18,%rsp
ffff800000106a46:	41 5f                	pop    %r15
ffff800000106a48:	5d                   	pop    %rbp
ffff800000106a49:	c3                   	retq   

ffff800000106a4a <init_mem>:
ffff800000106a4a:	55                   	push   %rbp
ffff800000106a4b:	48 89 e5             	mov    %rsp,%rbp
ffff800000106a4e:	41 57                	push   %r15
ffff800000106a50:	53                   	push   %rbx
ffff800000106a51:	48 83 ec 70          	sub    $0x70,%rsp
ffff800000106a55:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000106a55 <init_mem+0xb>
ffff800000106a5c:	49 bb d3 5e 00 00 00 	movabs $0x5ed3,%r11
ffff800000106a63:	00 00 00 
ffff800000106a66:	4c 01 db             	add    %r11,%rbx
ffff800000106a69:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000106a70:	00 
ffff800000106a71:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
ffff800000106a78:	00 
ffff800000106a79:	48 b8 50 17 00 00 00 	movabs $0x1750,%rax
ffff800000106a80:	00 00 00 
ffff800000106a83:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106a87:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106a8c:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000106a91:	49 89 df             	mov    %rbx,%r15
ffff800000106a94:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106a99:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000106aa0:	ff ff ff 
ffff800000106aa3:	48 01 d9             	add    %rbx,%rcx
ffff800000106aa6:	ff d1                	callq  *%rcx
ffff800000106aa8:	48 b8 00 7e 00 00 00 	movabs $0xffff800000007e00,%rax
ffff800000106aaf:	80 ff ff 
ffff800000106ab2:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff800000106ab6:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
ffff800000106abd:	e9 44 01 00 00       	jmpq   ffff800000106c06 <init_mem+0x1bc>
ffff800000106ac2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106ac6:	8b 48 10             	mov    0x10(%rax),%ecx
ffff800000106ac9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106acd:	48 8b 50 08          	mov    0x8(%rax),%rdx
ffff800000106ad1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106ad5:	48 8b 00             	mov    (%rax),%rax
ffff800000106ad8:	41 89 c9             	mov    %ecx,%r9d
ffff800000106adb:	49 89 d0             	mov    %rdx,%r8
ffff800000106ade:	48 89 c1             	mov    %rax,%rcx
ffff800000106ae1:	48 b8 75 17 00 00 00 	movabs $0x1775,%rax
ffff800000106ae8:	00 00 00 
ffff800000106aeb:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106aef:	be 00 ff 00 00       	mov    $0xff00,%esi
ffff800000106af4:	bf ff 00 00 00       	mov    $0xff,%edi
ffff800000106af9:	49 89 df             	mov    %rbx,%r15
ffff800000106afc:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106b01:	49 ba ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r10
ffff800000106b08:	ff ff ff 
ffff800000106b0b:	49 01 da             	add    %rbx,%r10
ffff800000106b0e:	41 ff d2             	callq  *%r10
ffff800000106b11:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106b15:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000106b18:	83 f8 01             	cmp    $0x1,%eax
ffff800000106b1b:	75 0c                	jne    ffff800000106b29 <init_mem+0xdf>
ffff800000106b1d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106b21:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106b25:	48 01 45 e8          	add    %rax,-0x18(%rbp)
ffff800000106b29:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106b2d:	48 8b 08             	mov    (%rax),%rcx
ffff800000106b30:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106b37:	ff ff ff 
ffff800000106b3a:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000106b3e:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000106b41:	48 63 d0             	movslq %eax,%rdx
ffff800000106b44:	48 89 d0             	mov    %rdx,%rax
ffff800000106b47:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106b4b:	48 01 d0             	add    %rdx,%rax
ffff800000106b4e:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106b52:	48 01 f0             	add    %rsi,%rax
ffff800000106b55:	48 89 08             	mov    %rcx,(%rax)
ffff800000106b58:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106b5c:	48 8b 48 08          	mov    0x8(%rax),%rcx
ffff800000106b60:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106b67:	ff ff ff 
ffff800000106b6a:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000106b6e:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000106b71:	48 63 d0             	movslq %eax,%rdx
ffff800000106b74:	48 89 d0             	mov    %rdx,%rax
ffff800000106b77:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106b7b:	48 01 d0             	add    %rdx,%rax
ffff800000106b7e:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106b82:	48 01 f0             	add    %rsi,%rax
ffff800000106b85:	48 83 c0 08          	add    $0x8,%rax
ffff800000106b89:	48 89 08             	mov    %rcx,(%rax)
ffff800000106b8c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106b90:	8b 48 10             	mov    0x10(%rax),%ecx
ffff800000106b93:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106b9a:	ff ff ff 
ffff800000106b9d:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000106ba1:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000106ba4:	48 63 d0             	movslq %eax,%rdx
ffff800000106ba7:	48 89 d0             	mov    %rdx,%rax
ffff800000106baa:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106bae:	48 01 d0             	add    %rdx,%rax
ffff800000106bb1:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106bb5:	48 01 f0             	add    %rsi,%rax
ffff800000106bb8:	48 83 c0 10          	add    $0x10,%rax
ffff800000106bbc:	89 08                	mov    %ecx,(%rax)
ffff800000106bbe:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000106bc1:	48 63 d0             	movslq %eax,%rdx
ffff800000106bc4:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106bcb:	ff ff ff 
ffff800000106bce:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106bd2:	48 89 90 80 02 00 00 	mov    %rdx,0x280(%rax)
ffff800000106bd9:	48 83 45 e0 14       	addq   $0x14,-0x20(%rbp)
ffff800000106bde:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106be2:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000106be5:	83 f8 04             	cmp    $0x4,%eax
ffff800000106be8:	77 26                	ja     ffff800000106c10 <init_mem+0x1c6>
ffff800000106bea:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106bee:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106bf2:	48 85 c0             	test   %rax,%rax
ffff800000106bf5:	74 19                	je     ffff800000106c10 <init_mem+0x1c6>
ffff800000106bf7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106bfb:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000106bfe:	85 c0                	test   %eax,%eax
ffff800000106c00:	74 0e                	je     ffff800000106c10 <init_mem+0x1c6>
ffff800000106c02:	83 45 dc 01          	addl   $0x1,-0x24(%rbp)
ffff800000106c06:	83 7d dc 1f          	cmpl   $0x1f,-0x24(%rbp)
ffff800000106c0a:	0f 8e b2 fe ff ff    	jle    ffff800000106ac2 <init_mem+0x78>
ffff800000106c10:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106c14:	48 89 c1             	mov    %rax,%rcx
ffff800000106c17:	48 b8 93 17 00 00 00 	movabs $0x1793,%rax
ffff800000106c1e:	00 00 00 
ffff800000106c21:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106c25:	be ff 00 80 00       	mov    $0x8000ff,%esi
ffff800000106c2a:	bf 00 ff ff 00       	mov    $0xffff00,%edi
ffff800000106c2f:	49 89 df             	mov    %rbx,%r15
ffff800000106c32:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106c37:	49 b8 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r8
ffff800000106c3e:	ff ff ff 
ffff800000106c41:	49 01 d8             	add    %rbx,%r8
ffff800000106c44:	41 ff d0             	callq  *%r8
ffff800000106c47:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000106c4e:	00 
ffff800000106c4f:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
ffff800000106c56:	e9 f1 00 00 00       	jmpq   ffff800000106d4c <init_mem+0x302>
ffff800000106c5b:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106c62:	ff ff ff 
ffff800000106c65:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000106c69:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000106c6c:	48 63 d0             	movslq %eax,%rdx
ffff800000106c6f:	48 89 d0             	mov    %rdx,%rax
ffff800000106c72:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106c76:	48 01 d0             	add    %rdx,%rax
ffff800000106c79:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106c7d:	48 01 c8             	add    %rcx,%rax
ffff800000106c80:	48 83 c0 10          	add    $0x10,%rax
ffff800000106c84:	8b 00                	mov    (%rax),%eax
ffff800000106c86:	83 f8 01             	cmp    $0x1,%eax
ffff800000106c89:	0f 85 b5 00 00 00    	jne    ffff800000106d44 <init_mem+0x2fa>
ffff800000106c8f:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106c96:	ff ff ff 
ffff800000106c99:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000106c9d:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000106ca0:	48 63 d0             	movslq %eax,%rdx
ffff800000106ca3:	48 89 d0             	mov    %rdx,%rax
ffff800000106ca6:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106caa:	48 01 d0             	add    %rdx,%rax
ffff800000106cad:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106cb1:	48 01 c8             	add    %rcx,%rax
ffff800000106cb4:	48 8b 00             	mov    (%rax),%rax
ffff800000106cb7:	48 05 ff ff 1f 00    	add    $0x1fffff,%rax
ffff800000106cbd:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff800000106cc3:	48 89 45 90          	mov    %rax,-0x70(%rbp)
ffff800000106cc7:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106cce:	ff ff ff 
ffff800000106cd1:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000106cd5:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000106cd8:	48 63 d0             	movslq %eax,%rdx
ffff800000106cdb:	48 89 d0             	mov    %rdx,%rax
ffff800000106cde:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106ce2:	48 01 d0             	add    %rdx,%rax
ffff800000106ce5:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106ce9:	48 01 c8             	add    %rcx,%rax
ffff800000106cec:	48 8b 08             	mov    (%rax),%rcx
ffff800000106cef:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106cf6:	ff ff ff 
ffff800000106cf9:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000106cfd:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000106d00:	48 63 d0             	movslq %eax,%rdx
ffff800000106d03:	48 89 d0             	mov    %rdx,%rax
ffff800000106d06:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106d0a:	48 01 d0             	add    %rdx,%rax
ffff800000106d0d:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106d11:	48 01 f0             	add    %rsi,%rax
ffff800000106d14:	48 83 c0 08          	add    $0x8,%rax
ffff800000106d18:	48 8b 00             	mov    (%rax),%rax
ffff800000106d1b:	48 01 c8             	add    %rcx,%rax
ffff800000106d1e:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff800000106d24:	48 89 45 88          	mov    %rax,-0x78(%rbp)
ffff800000106d28:	48 8b 45 90          	mov    -0x70(%rbp),%rax
ffff800000106d2c:	48 3b 45 88          	cmp    -0x78(%rbp),%rax
ffff800000106d30:	73 15                	jae    ffff800000106d47 <init_mem+0x2fd>
ffff800000106d32:	48 8b 45 88          	mov    -0x78(%rbp),%rax
ffff800000106d36:	48 2b 45 90          	sub    -0x70(%rbp),%rax
ffff800000106d3a:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106d3e:	48 01 45 e8          	add    %rax,-0x18(%rbp)
ffff800000106d42:	eb 04                	jmp    ffff800000106d48 <init_mem+0x2fe>
ffff800000106d44:	90                   	nop
ffff800000106d45:	eb 01                	jmp    ffff800000106d48 <init_mem+0x2fe>
ffff800000106d47:	90                   	nop
ffff800000106d48:	83 45 d8 01          	addl   $0x1,-0x28(%rbp)
ffff800000106d4c:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000106d4f:	48 63 d0             	movslq %eax,%rdx
ffff800000106d52:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106d59:	ff ff ff 
ffff800000106d5c:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106d60:	48 8b 80 80 02 00 00 	mov    0x280(%rax),%rax
ffff800000106d67:	48 39 c2             	cmp    %rax,%rdx
ffff800000106d6a:	0f 82 eb fe ff ff    	jb     ffff800000106c5b <init_mem+0x211>
ffff800000106d70:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106d74:	48 89 c1             	mov    %rax,%rcx
ffff800000106d77:	48 b8 a9 17 00 00 00 	movabs $0x17a9,%rax
ffff800000106d7e:	00 00 00 
ffff800000106d81:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000106d85:	be ff ff 00 00       	mov    $0xffff,%esi
ffff800000106d8a:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106d8f:	49 89 df             	mov    %rbx,%r15
ffff800000106d92:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106d97:	49 b8 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r8
ffff800000106d9e:	ff ff ff 
ffff800000106da1:	49 01 d8             	add    %rbx,%r8
ffff800000106da4:	41 ff d0             	callq  *%r8
ffff800000106da7:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106dae:	ff ff ff 
ffff800000106db1:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106db5:	48 8b 90 80 02 00 00 	mov    0x280(%rax),%rdx
ffff800000106dbc:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106dc3:	ff ff ff 
ffff800000106dc6:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000106dca:	48 89 d0             	mov    %rdx,%rax
ffff800000106dcd:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106dd1:	48 01 d0             	add    %rdx,%rax
ffff800000106dd4:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106dd8:	48 01 c8             	add    %rcx,%rax
ffff800000106ddb:	48 8b 08             	mov    (%rax),%rcx
ffff800000106dde:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106de5:	ff ff ff 
ffff800000106de8:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106dec:	48 8b 90 80 02 00 00 	mov    0x280(%rax),%rdx
ffff800000106df3:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106dfa:	ff ff ff 
ffff800000106dfd:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000106e01:	48 89 d0             	mov    %rdx,%rax
ffff800000106e04:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106e08:	48 01 d0             	add    %rdx,%rax
ffff800000106e0b:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106e0f:	48 01 f0             	add    %rsi,%rax
ffff800000106e12:	48 83 c0 08          	add    $0x8,%rax
ffff800000106e16:	48 8b 00             	mov    (%rax),%rax
ffff800000106e19:	48 01 c8             	add    %rcx,%rax
ffff800000106e1c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000106e20:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106e27:	ff ff ff 
ffff800000106e2a:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106e2e:	48 8b 80 e8 02 00 00 	mov    0x2e8(%rax),%rax
ffff800000106e35:	48 05 ff 0f 00 00    	add    $0xfff,%rax
ffff800000106e3b:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffff800000106e41:	48 89 c2             	mov    %rax,%rdx
ffff800000106e44:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106e4b:	ff ff ff 
ffff800000106e4e:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106e52:	48 89 90 88 02 00 00 	mov    %rdx,0x288(%rax)
ffff800000106e59:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106e5d:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106e61:	48 89 c2             	mov    %rax,%rdx
ffff800000106e64:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106e6b:	ff ff ff 
ffff800000106e6e:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106e72:	48 89 90 90 02 00 00 	mov    %rdx,0x290(%rax)
ffff800000106e79:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106e7d:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106e81:	48 83 c0 3f          	add    $0x3f,%rax
ffff800000106e85:	48 c1 e8 03          	shr    $0x3,%rax
ffff800000106e89:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff800000106e8d:	48 89 c2             	mov    %rax,%rdx
ffff800000106e90:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106e97:	ff ff ff 
ffff800000106e9a:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106e9e:	48 89 90 98 02 00 00 	mov    %rdx,0x298(%rax)
ffff800000106ea5:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106eac:	ff ff ff 
ffff800000106eaf:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106eb3:	48 8b 80 98 02 00 00 	mov    0x298(%rax),%rax
ffff800000106eba:	48 89 c2             	mov    %rax,%rdx
ffff800000106ebd:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106ec4:	ff ff ff 
ffff800000106ec7:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106ecb:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff800000106ed2:	be ff 00 00 00       	mov    $0xff,%esi
ffff800000106ed7:	48 89 c7             	mov    %rax,%rdi
ffff800000106eda:	49 89 df             	mov    %rbx,%r15
ffff800000106edd:	48 b8 fa b3 ff ff ff 	movabs $0xffffffffffffb3fa,%rax
ffff800000106ee4:	ff ff ff 
ffff800000106ee7:	48 01 d8             	add    %rbx,%rax
ffff800000106eea:	ff d0                	callq  *%rax
ffff800000106eec:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106ef3:	ff ff ff 
ffff800000106ef6:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106efa:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000106f01:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106f08:	ff ff ff 
ffff800000106f0b:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106f0f:	48 8b 80 98 02 00 00 	mov    0x298(%rax),%rax
ffff800000106f16:	48 05 00 10 00 00    	add    $0x1000,%rax
ffff800000106f1c:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106f20:	48 83 e8 08          	sub    $0x8,%rax
ffff800000106f24:	48 01 d0             	add    %rdx,%rax
ffff800000106f27:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffff800000106f2d:	48 89 c2             	mov    %rax,%rdx
ffff800000106f30:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106f37:	ff ff ff 
ffff800000106f3a:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106f3e:	48 89 90 a0 02 00 00 	mov    %rdx,0x2a0(%rax)
ffff800000106f45:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106f49:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106f4d:	48 89 c2             	mov    %rax,%rdx
ffff800000106f50:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106f57:	ff ff ff 
ffff800000106f5a:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106f5e:	48 89 90 a8 02 00 00 	mov    %rdx,0x2a8(%rax)
ffff800000106f65:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106f69:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106f6d:	48 89 c2             	mov    %rax,%rdx
ffff800000106f70:	48 89 d0             	mov    %rdx,%rax
ffff800000106f73:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f77:	48 01 d0             	add    %rdx,%rax
ffff800000106f7a:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106f7e:	48 83 c0 07          	add    $0x7,%rax
ffff800000106f82:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff800000106f86:	48 89 c2             	mov    %rax,%rdx
ffff800000106f89:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106f90:	ff ff ff 
ffff800000106f93:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106f97:	48 89 90 b0 02 00 00 	mov    %rdx,0x2b0(%rax)
ffff800000106f9e:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106fa5:	ff ff ff 
ffff800000106fa8:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106fac:	48 8b 80 b0 02 00 00 	mov    0x2b0(%rax),%rax
ffff800000106fb3:	48 89 c2             	mov    %rax,%rdx
ffff800000106fb6:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106fbd:	ff ff ff 
ffff800000106fc0:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106fc4:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000106fcb:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106fd0:	48 89 c7             	mov    %rax,%rdi
ffff800000106fd3:	49 89 df             	mov    %rbx,%r15
ffff800000106fd6:	48 b8 fa b3 ff ff ff 	movabs $0xffffffffffffb3fa,%rax
ffff800000106fdd:	ff ff ff 
ffff800000106fe0:	48 01 d8             	add    %rbx,%rax
ffff800000106fe3:	ff d0                	callq  *%rax
ffff800000106fe5:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000106fec:	ff ff ff 
ffff800000106fef:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000106ff3:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000106ffa:	48 89 c2             	mov    %rax,%rdx
ffff800000106ffd:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107004:	ff ff ff 
ffff800000107007:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010700b:	48 8b 80 b0 02 00 00 	mov    0x2b0(%rax),%rax
ffff800000107012:	48 01 d0             	add    %rdx,%rax
ffff800000107015:	48 05 ff 0f 00 00    	add    $0xfff,%rax
ffff80000010701b:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffff800000107021:	48 89 c2             	mov    %rax,%rdx
ffff800000107024:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010702b:	ff ff ff 
ffff80000010702e:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107032:	48 89 90 b8 02 00 00 	mov    %rdx,0x2b8(%rax)
ffff800000107039:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107040:	ff ff ff 
ffff800000107043:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107047:	48 c7 80 c8 02 00 00 	movq   $0x0,0x2c8(%rax)
ffff80000010704e:	00 00 00 00 
ffff800000107052:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107059:	ff ff ff 
ffff80000010705c:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107060:	48 c7 80 c0 02 00 00 	movq   $0x190,0x2c0(%rax)
ffff800000107067:	90 01 00 00 
ffff80000010706b:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107072:	ff ff ff 
ffff800000107075:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107079:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
ffff800000107080:	48 89 c2             	mov    %rax,%rdx
ffff800000107083:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010708a:	ff ff ff 
ffff80000010708d:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107091:	48 8b 80 b8 02 00 00 	mov    0x2b8(%rax),%rax
ffff800000107098:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010709d:	48 89 c7             	mov    %rax,%rdi
ffff8000001070a0:	49 89 df             	mov    %rbx,%r15
ffff8000001070a3:	48 b8 fa b3 ff ff ff 	movabs $0xffffffffffffb3fa,%rax
ffff8000001070aa:	ff ff ff 
ffff8000001070ad:	48 01 d8             	add    %rbx,%rax
ffff8000001070b0:	ff d0                	callq  *%rax
ffff8000001070b2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
ffff8000001070b9:	e9 11 03 00 00       	jmpq   ffff8000001073cf <init_mem+0x985>
ffff8000001070be:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001070c5:	ff ff ff 
ffff8000001070c8:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff8000001070cc:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff8000001070cf:	48 63 d0             	movslq %eax,%rdx
ffff8000001070d2:	48 89 d0             	mov    %rdx,%rax
ffff8000001070d5:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001070d9:	48 01 d0             	add    %rdx,%rax
ffff8000001070dc:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001070e0:	48 01 c8             	add    %rcx,%rax
ffff8000001070e3:	48 83 c0 10          	add    $0x10,%rax
ffff8000001070e7:	8b 00                	mov    (%rax),%eax
ffff8000001070e9:	83 f8 01             	cmp    $0x1,%eax
ffff8000001070ec:	0f 85 d5 02 00 00    	jne    ffff8000001073c7 <init_mem+0x97d>
ffff8000001070f2:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001070f9:	ff ff ff 
ffff8000001070fc:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000107100:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff800000107103:	48 63 d0             	movslq %eax,%rdx
ffff800000107106:	48 89 d0             	mov    %rdx,%rax
ffff800000107109:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010710d:	48 01 d0             	add    %rdx,%rax
ffff800000107110:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107114:	48 01 c8             	add    %rcx,%rax
ffff800000107117:	48 8b 00             	mov    (%rax),%rax
ffff80000010711a:	48 05 ff ff 1f 00    	add    $0x1fffff,%rax
ffff800000107120:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff800000107126:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
ffff80000010712a:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107131:	ff ff ff 
ffff800000107134:	48 8b 0c 03          	mov    (%rbx,%rax,1),%rcx
ffff800000107138:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff80000010713b:	48 63 d0             	movslq %eax,%rdx
ffff80000010713e:	48 89 d0             	mov    %rdx,%rax
ffff800000107141:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107145:	48 01 d0             	add    %rdx,%rax
ffff800000107148:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010714c:	48 01 c8             	add    %rcx,%rax
ffff80000010714f:	48 8b 08             	mov    (%rax),%rcx
ffff800000107152:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107159:	ff ff ff 
ffff80000010715c:	48 8b 34 03          	mov    (%rbx,%rax,1),%rsi
ffff800000107160:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff800000107163:	48 63 d0             	movslq %eax,%rdx
ffff800000107166:	48 89 d0             	mov    %rdx,%rax
ffff800000107169:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010716d:	48 01 d0             	add    %rdx,%rax
ffff800000107170:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107174:	48 01 f0             	add    %rsi,%rax
ffff800000107177:	48 83 c0 08          	add    $0x8,%rax
ffff80000010717b:	48 8b 00             	mov    (%rax),%rax
ffff80000010717e:	48 01 c8             	add    %rcx,%rax
ffff800000107181:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff800000107187:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
ffff80000010718b:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff80000010718f:	48 3b 45 a8          	cmp    -0x58(%rbp),%rax
ffff800000107193:	0f 86 31 02 00 00    	jbe    ffff8000001073ca <init_mem+0x980>
ffff800000107199:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001071a0:	ff ff ff 
ffff8000001071a3:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001071a7:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff8000001071ae:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001071b5:	ff ff ff 
ffff8000001071b8:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001071bc:	48 8b 90 c8 02 00 00 	mov    0x2c8(%rax),%rdx
ffff8000001071c3:	48 89 d0             	mov    %rdx,%rax
ffff8000001071c6:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001071ca:	48 01 d0             	add    %rdx,%rax
ffff8000001071cd:	48 c1 e0 04          	shl    $0x4,%rax
ffff8000001071d1:	48 01 c8             	add    %rcx,%rax
ffff8000001071d4:	48 89 45 98          	mov    %rax,-0x68(%rbp)
ffff8000001071d8:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001071df:	ff ff ff 
ffff8000001071e2:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001071e6:	48 8b 80 c8 02 00 00 	mov    0x2c8(%rax),%rax
ffff8000001071ed:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001071f1:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001071f8:	ff ff ff 
ffff8000001071fb:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001071ff:	48 89 90 c8 02 00 00 	mov    %rdx,0x2c8(%rax)
ffff800000107206:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff80000010720a:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff80000010720e:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000107212:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107216:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
ffff80000010721a:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff80000010721e:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff800000107222:	48 2b 45 a8          	sub    -0x58(%rbp),%rax
ffff800000107226:	48 89 c2             	mov    %rax,%rdx
ffff800000107229:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff80000010722d:	48 89 50 20          	mov    %rdx,0x20(%rax)
ffff800000107231:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107235:	48 c7 40 38 00 00 00 	movq   $0x0,0x38(%rax)
ffff80000010723c:	00 
ffff80000010723d:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff800000107241:	48 2b 45 a8          	sub    -0x58(%rbp),%rax
ffff800000107245:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107249:	48 89 c2             	mov    %rax,%rdx
ffff80000010724c:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107250:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff800000107254:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107258:	48 c7 40 48 00 00 00 	movq   $0x0,0x48(%rax)
ffff80000010725f:	00 
ffff800000107260:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107264:	48 c7 40 28 00 00 00 	movq   $0x0,0x28(%rax)
ffff80000010726b:	00 
ffff80000010726c:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107270:	48 ba d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rdx
ffff800000107277:	ff ff ff 
ffff80000010727a:	48 8b 14 13          	mov    (%rbx,%rdx,1),%rdx
ffff80000010727e:	48 89 50 30          	mov    %rdx,0x30(%rax)
ffff800000107282:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff800000107286:	48 2b 45 a8          	sub    -0x58(%rbp),%rax
ffff80000010728a:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010728e:	48 89 c2             	mov    %rax,%rdx
ffff800000107291:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107295:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107299:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001072a0:	ff ff ff 
ffff8000001072a3:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001072a7:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff8000001072ae:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff8000001072b2:	48 c1 e8 15          	shr    $0x15,%rax
ffff8000001072b6:	48 89 c2             	mov    %rax,%rdx
ffff8000001072b9:	48 89 d0             	mov    %rdx,%rax
ffff8000001072bc:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001072c0:	48 01 d0             	add    %rdx,%rax
ffff8000001072c3:	48 c1 e0 03          	shl    $0x3,%rax
ffff8000001072c7:	48 8d 14 01          	lea    (%rcx,%rax,1),%rdx
ffff8000001072cb:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff8000001072cf:	48 89 10             	mov    %rdx,(%rax)
ffff8000001072d2:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff8000001072d6:	48 8b 00             	mov    (%rax),%rax
ffff8000001072d9:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff8000001072dd:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%rbp)
ffff8000001072e4:	e9 c5 00 00 00       	jmpq   ffff8000001073ae <init_mem+0x964>
ffff8000001072e9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001072ed:	48 8b 55 98          	mov    -0x68(%rbp),%rdx
ffff8000001072f1:	48 89 10             	mov    %rdx,(%rax)
ffff8000001072f4:	8b 45 c4             	mov    -0x3c(%rbp),%eax
ffff8000001072f7:	48 98                	cltq   
ffff8000001072f9:	48 c1 e0 15          	shl    $0x15,%rax
ffff8000001072fd:	48 89 c2             	mov    %rax,%rdx
ffff800000107300:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000107304:	48 01 c2             	add    %rax,%rdx
ffff800000107307:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010730b:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff80000010730f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107313:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff80000010731a:	00 
ffff80000010731b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010731f:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
ffff800000107326:	00 
ffff800000107327:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010732b:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
ffff800000107332:	00 
ffff800000107333:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010733a:	ff ff ff 
ffff80000010733d:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107341:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000107348:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010734c:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107350:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000107354:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107358:	48 01 d0             	add    %rdx,%rax
ffff80000010735b:	48 8b 10             	mov    (%rax),%rdx
ffff80000010735e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107362:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107366:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010736a:	83 e0 3f             	and    $0x3f,%eax
ffff80000010736d:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000107372:	89 c1                	mov    %eax,%ecx
ffff800000107374:	48 d3 e6             	shl    %cl,%rsi
ffff800000107377:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010737e:	ff ff ff 
ffff800000107381:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107385:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
ffff80000010738c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107390:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107394:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000107398:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010739c:	48 01 c8             	add    %rcx,%rax
ffff80000010739f:	48 31 f2             	xor    %rsi,%rdx
ffff8000001073a2:	48 89 10             	mov    %rdx,(%rax)
ffff8000001073a5:	83 45 c4 01          	addl   $0x1,-0x3c(%rbp)
ffff8000001073a9:	48 83 45 c8 28       	addq   $0x28,-0x38(%rbp)
ffff8000001073ae:	8b 45 c4             	mov    -0x3c(%rbp),%eax
ffff8000001073b1:	48 63 d0             	movslq %eax,%rdx
ffff8000001073b4:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff8000001073b8:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff8000001073bc:	48 39 c2             	cmp    %rax,%rdx
ffff8000001073bf:	0f 82 24 ff ff ff    	jb     ffff8000001072e9 <init_mem+0x89f>
ffff8000001073c5:	eb 04                	jmp    ffff8000001073cb <init_mem+0x981>
ffff8000001073c7:	90                   	nop
ffff8000001073c8:	eb 01                	jmp    ffff8000001073cb <init_mem+0x981>
ffff8000001073ca:	90                   	nop
ffff8000001073cb:	83 45 d4 01          	addl   $0x1,-0x2c(%rbp)
ffff8000001073cf:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff8000001073d2:	48 63 d0             	movslq %eax,%rdx
ffff8000001073d5:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001073dc:	ff ff ff 
ffff8000001073df:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001073e3:	48 8b 80 80 02 00 00 	mov    0x280(%rax),%rax
ffff8000001073ea:	48 39 c2             	cmp    %rax,%rdx
ffff8000001073ed:	0f 82 cb fc ff ff    	jb     ffff8000001070be <init_mem+0x674>
ffff8000001073f3:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001073fa:	ff ff ff 
ffff8000001073fd:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107401:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000107408:	48 ba d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rdx
ffff80000010740f:	ff ff ff 
ffff800000107412:	48 8b 14 13          	mov    (%rbx,%rdx,1),%rdx
ffff800000107416:	48 8b 92 b8 02 00 00 	mov    0x2b8(%rdx),%rdx
ffff80000010741d:	48 89 10             	mov    %rdx,(%rax)
ffff800000107420:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107427:	ff ff ff 
ffff80000010742a:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010742e:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000107435:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
ffff80000010743c:	00 
ffff80000010743d:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107444:	ff ff ff 
ffff800000107447:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010744b:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000107452:	be 83 00 00 00       	mov    $0x83,%esi
ffff800000107457:	48 89 c7             	mov    %rax,%rdi
ffff80000010745a:	48 b8 a5 a0 ff ff ff 	movabs $0xffffffffffffa0a5,%rax
ffff800000107461:	ff ff ff 
ffff800000107464:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000107468:	ff d0                	callq  *%rax
ffff80000010746a:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107471:	ff ff ff 
ffff800000107474:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107478:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff80000010747f:	48 c7 40 18 01 00 00 	movq   $0x1,0x18(%rax)
ffff800000107486:	00 
ffff800000107487:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010748e:	ff ff ff 
ffff800000107491:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107495:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff80000010749c:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
ffff8000001074a3:	00 
ffff8000001074a4:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001074ab:	ff ff ff 
ffff8000001074ae:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001074b2:	48 8b 90 c8 02 00 00 	mov    0x2c8(%rax),%rdx
ffff8000001074b9:	48 89 d0             	mov    %rdx,%rax
ffff8000001074bc:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001074c0:	48 01 d0             	add    %rdx,%rax
ffff8000001074c3:	48 c1 e0 04          	shl    $0x4,%rax
ffff8000001074c7:	48 83 c0 07          	add    $0x7,%rax
ffff8000001074cb:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff8000001074cf:	48 89 c2             	mov    %rax,%rdx
ffff8000001074d2:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001074d9:	ff ff ff 
ffff8000001074dc:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001074e0:	48 89 90 c0 02 00 00 	mov    %rdx,0x2c0(%rax)
ffff8000001074e7:	48 b8 d8 36 01 00 00 	movabs $0x136d8,%rax
ffff8000001074ee:	00 00 00 
ffff8000001074f1:	c7 04 03 00 00 00 00 	movl   $0x0,(%rbx,%rax,1)
ffff8000001074f8:	48 b8 dc 36 01 00 00 	movabs $0x136dc,%rax
ffff8000001074ff:	00 00 00 
ffff800000107502:	c7 04 03 00 00 00 00 	movl   $0x0,(%rbx,%rax,1)
ffff800000107509:	48 b8 e0 36 01 00 00 	movabs $0x136e0,%rax
ffff800000107510:	00 00 00 
ffff800000107513:	c7 04 03 00 00 00 00 	movl   $0x0,(%rbx,%rax,1)
ffff80000010751a:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%rbp)
ffff800000107521:	e9 c8 00 00 00       	jmpq   ffff8000001075ee <init_mem+0xba4>
ffff800000107526:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010752d:	ff ff ff 
ffff800000107530:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107534:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff80000010753b:	8b 45 c0             	mov    -0x40(%rbp),%eax
ffff80000010753e:	48 63 d0             	movslq %eax,%rdx
ffff800000107541:	48 89 d0             	mov    %rdx,%rax
ffff800000107544:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107548:	48 01 d0             	add    %rdx,%rax
ffff80000010754b:	48 c1 e0 04          	shl    $0x4,%rax
ffff80000010754f:	48 01 c8             	add    %rcx,%rax
ffff800000107552:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff800000107556:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff80000010755a:	48 8b 70 08          	mov    0x8(%rax),%rsi
ffff80000010755e:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107562:	48 8b 08             	mov    (%rax),%rcx
ffff800000107565:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107569:	48 8b 50 20          	mov    0x20(%rax),%rdx
ffff80000010756d:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107571:	4c 8b 40 18          	mov    0x18(%rax),%r8
ffff800000107575:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107579:	48 8b 78 10          	mov    0x10(%rax),%rdi
ffff80000010757d:	8b 45 c0             	mov    -0x40(%rbp),%eax
ffff800000107580:	48 83 ec 08          	sub    $0x8,%rsp
ffff800000107584:	56                   	push   %rsi
ffff800000107585:	51                   	push   %rcx
ffff800000107586:	52                   	push   %rdx
ffff800000107587:	4d 89 c1             	mov    %r8,%r9
ffff80000010758a:	49 89 f8             	mov    %rdi,%r8
ffff80000010758d:	89 c1                	mov    %eax,%ecx
ffff80000010758f:	48 b8 c8 17 00 00 00 	movabs $0x17c8,%rax
ffff800000107596:	00 00 00 
ffff800000107599:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010759d:	be 00 80 ff 00       	mov    $0xff8000,%esi
ffff8000001075a2:	bf 00 ff 00 00       	mov    $0xff00,%edi
ffff8000001075a7:	49 89 df             	mov    %rbx,%r15
ffff8000001075aa:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001075af:	49 ba ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r10
ffff8000001075b6:	ff ff ff 
ffff8000001075b9:	49 01 da             	add    %rbx,%r10
ffff8000001075bc:	41 ff d2             	callq  *%r10
ffff8000001075bf:	48 83 c4 20          	add    $0x20,%rsp
ffff8000001075c3:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff8000001075c7:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff8000001075cb:	48 b8 00 00 00 00 01 	movabs $0x100000000,%rax
ffff8000001075d2:	00 00 00 
ffff8000001075d5:	48 39 c2             	cmp    %rax,%rdx
ffff8000001075d8:	75 10                	jne    ffff8000001075ea <init_mem+0xba0>
ffff8000001075da:	48 b8 e0 36 01 00 00 	movabs $0x136e0,%rax
ffff8000001075e1:	00 00 00 
ffff8000001075e4:	8b 55 c0             	mov    -0x40(%rbp),%edx
ffff8000001075e7:	89 14 03             	mov    %edx,(%rbx,%rax,1)
ffff8000001075ea:	83 45 c0 01          	addl   $0x1,-0x40(%rbp)
ffff8000001075ee:	8b 45 c0             	mov    -0x40(%rbp),%eax
ffff8000001075f1:	48 63 d0             	movslq %eax,%rdx
ffff8000001075f4:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001075fb:	ff ff ff 
ffff8000001075fe:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107602:	48 8b 80 c8 02 00 00 	mov    0x2c8(%rax),%rax
ffff800000107609:	48 39 c2             	cmp    %rax,%rdx
ffff80000010760c:	0f 82 14 ff ff ff    	jb     ffff800000107526 <init_mem+0xadc>
ffff800000107612:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107619:	ff ff ff 
ffff80000010761c:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107620:	48 8b 80 b8 02 00 00 	mov    0x2b8(%rax),%rax
ffff800000107627:	48 89 c2             	mov    %rax,%rdx
ffff80000010762a:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107631:	ff ff ff 
ffff800000107634:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107638:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
ffff80000010763f:	48 01 d0             	add    %rdx,%rax
ffff800000107642:	48 05 00 01 00 00    	add    $0x100,%rax
ffff800000107648:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff80000010764c:	48 89 c2             	mov    %rax,%rdx
ffff80000010764f:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107656:	ff ff ff 
ffff800000107659:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010765d:	48 89 90 f0 02 00 00 	mov    %rdx,0x2f0(%rax)
ffff800000107664:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010766b:	ff ff ff 
ffff80000010766e:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107672:	48 8b 90 f0 02 00 00 	mov    0x2f0(%rax),%rdx
ffff800000107679:	48 b8 00 00 00 00 00 	movabs $0x800000000000,%rax
ffff800000107680:	80 00 00 
ffff800000107683:	48 01 d0             	add    %rdx,%rax
ffff800000107686:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010768a:	89 45 c0             	mov    %eax,-0x40(%rbp)
ffff80000010768d:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%rbp)
ffff800000107694:	eb 48                	jmp    ffff8000001076de <init_mem+0xc94>
ffff800000107696:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010769d:	ff ff ff 
ffff8000001076a0:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001076a4:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff8000001076ab:	8b 45 bc             	mov    -0x44(%rbp),%eax
ffff8000001076ae:	48 63 d0             	movslq %eax,%rdx
ffff8000001076b1:	48 89 d0             	mov    %rdx,%rax
ffff8000001076b4:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001076b8:	48 01 d0             	add    %rdx,%rax
ffff8000001076bb:	48 c1 e0 03          	shl    $0x3,%rax
ffff8000001076bf:	48 01 c8             	add    %rcx,%rax
ffff8000001076c2:	be 93 00 00 00       	mov    $0x93,%esi
ffff8000001076c7:	48 89 c7             	mov    %rax,%rdi
ffff8000001076ca:	48 b8 46 9f ff ff ff 	movabs $0xffffffffffff9f46,%rax
ffff8000001076d1:	ff ff ff 
ffff8000001076d4:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff8000001076d8:	ff d0                	callq  *%rax
ffff8000001076da:	83 45 bc 01          	addl   $0x1,-0x44(%rbp)
ffff8000001076de:	8b 45 bc             	mov    -0x44(%rbp),%eax
ffff8000001076e1:	3b 45 c0             	cmp    -0x40(%rbp),%eax
ffff8000001076e4:	7c b0                	jl     ffff800000107696 <init_mem+0xc4c>
ffff8000001076e6:	49 89 df             	mov    %rbx,%r15
ffff8000001076e9:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001076ee:	48 ba bb b4 ff ff ff 	movabs $0xffffffffffffb4bb,%rdx
ffff8000001076f5:	ff ff ff 
ffff8000001076f8:	48 01 da             	add    %rbx,%rdx
ffff8000001076fb:	ff d2                	callq  *%rdx
ffff8000001076fd:	48 89 c2             	mov    %rax,%rdx
ffff800000107700:	48 b8 e8 36 01 00 00 	movabs $0x136e8,%rax
ffff800000107707:	00 00 00 
ffff80000010770a:	48 89 14 03          	mov    %rdx,(%rbx,%rax,1)
ffff80000010770e:	48 b8 e8 36 01 00 00 	movabs $0x136e8,%rax
ffff800000107715:	00 00 00 
ffff800000107718:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010771c:	48 89 c1             	mov    %rax,%rcx
ffff80000010771f:	48 b8 24 18 00 00 00 	movabs $0x1824,%rax
ffff800000107726:	00 00 00 
ffff800000107729:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010772d:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107732:	bf ff ff 00 00       	mov    $0xffff,%edi
ffff800000107737:	49 89 df             	mov    %rbx,%r15
ffff80000010773a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010773f:	49 b8 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r8
ffff800000107746:	ff ff ff 
ffff800000107749:	49 01 d8             	add    %rbx,%r8
ffff80000010774c:	41 ff d0             	callq  *%r8
ffff80000010774f:	48 b8 e8 36 01 00 00 	movabs $0x136e8,%rax
ffff800000107756:	00 00 00 
ffff800000107759:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff80000010775d:	48 89 c2             	mov    %rax,%rdx
ffff800000107760:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff800000107767:	80 ff ff 
ffff80000010776a:	48 01 d0             	add    %rdx,%rax
ffff80000010776d:	48 8b 00             	mov    (%rax),%rax
ffff800000107770:	b0 00                	mov    $0x0,%al
ffff800000107772:	48 89 c1             	mov    %rax,%rcx
ffff800000107775:	48 b8 33 18 00 00 00 	movabs $0x1833,%rax
ffff80000010777c:	00 00 00 
ffff80000010777f:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000107783:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107788:	bf ff ff 00 00       	mov    $0xffff,%edi
ffff80000010778d:	49 89 df             	mov    %rbx,%r15
ffff800000107790:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107795:	49 b8 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r8
ffff80000010779c:	ff ff ff 
ffff80000010779f:	49 01 d8             	add    %rbx,%r8
ffff8000001077a2:	41 ff d0             	callq  *%r8
ffff8000001077a5:	48 b8 e8 36 01 00 00 	movabs $0x136e8,%rax
ffff8000001077ac:	00 00 00 
ffff8000001077af:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001077b3:	48 89 c2             	mov    %rax,%rdx
ffff8000001077b6:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff8000001077bd:	80 ff ff 
ffff8000001077c0:	48 01 d0             	add    %rdx,%rax
ffff8000001077c3:	48 8b 00             	mov    (%rax),%rax
ffff8000001077c6:	b0 00                	mov    $0x0,%al
ffff8000001077c8:	48 89 c2             	mov    %rax,%rdx
ffff8000001077cb:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff8000001077d2:	80 ff ff 
ffff8000001077d5:	48 01 d0             	add    %rdx,%rax
ffff8000001077d8:	48 8b 00             	mov    (%rax),%rax
ffff8000001077db:	b0 00                	mov    $0x0,%al
ffff8000001077dd:	48 89 c1             	mov    %rax,%rcx
ffff8000001077e0:	48 b8 43 18 00 00 00 	movabs $0x1843,%rax
ffff8000001077e7:	00 00 00 
ffff8000001077ea:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001077ee:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001077f3:	bf ff 00 80 00       	mov    $0x8000ff,%edi
ffff8000001077f8:	49 89 df             	mov    %rbx,%r15
ffff8000001077fb:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107800:	49 b8 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r8
ffff800000107807:	ff ff ff 
ffff80000010780a:	49 01 d8             	add    %rbx,%r8
ffff80000010780d:	41 ff d0             	callq  *%r8
ffff800000107810:	90                   	nop
ffff800000107811:	48 8d 65 f0          	lea    -0x10(%rbp),%rsp
ffff800000107815:	5b                   	pop    %rbx
ffff800000107816:	41 5f                	pop    %r15
ffff800000107818:	5d                   	pop    %rbp
ffff800000107819:	c3                   	retq   

ffff80000010781a <alloc_pages>:
ffff80000010781a:	55                   	push   %rbp
ffff80000010781b:	48 89 e5             	mov    %rsp,%rbp
ffff80000010781e:	41 57                	push   %r15
ffff800000107820:	53                   	push   %rbx
ffff800000107821:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
ffff800000107825:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000107825 <alloc_pages+0xb>
ffff80000010782c:	49 bb 03 51 00 00 00 	movabs $0x5103,%r11
ffff800000107833:	00 00 00 
ffff800000107836:	4c 01 db             	add    %r11,%rbx
ffff800000107839:	89 bd 7c ff ff ff    	mov    %edi,-0x84(%rbp)
ffff80000010783f:	89 b5 78 ff ff ff    	mov    %esi,-0x88(%rbp)
ffff800000107845:	48 89 95 70 ff ff ff 	mov    %rdx,-0x90(%rbp)
ffff80000010784c:	48 c7 45 c0 00 00 00 	movq   $0x0,-0x40(%rbp)
ffff800000107853:	00 
ffff800000107854:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
ffff80000010785b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
ffff800000107862:	8b 85 7c ff ff ff    	mov    -0x84(%rbp),%eax
ffff800000107868:	83 f8 02             	cmp    $0x2,%eax
ffff80000010786b:	74 26                	je     ffff800000107893 <alloc_pages+0x79>
ffff80000010786d:	83 f8 04             	cmp    $0x4,%eax
ffff800000107870:	74 43                	je     ffff8000001078b5 <alloc_pages+0x9b>
ffff800000107872:	83 f8 01             	cmp    $0x1,%eax
ffff800000107875:	75 6b                	jne    ffff8000001078e2 <alloc_pages+0xc8>
ffff800000107877:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
ffff80000010787e:	48 b8 d8 36 01 00 00 	movabs $0x136d8,%rax
ffff800000107885:	00 00 00 
ffff800000107888:	8b 04 03             	mov    (%rbx,%rax,1),%eax
ffff80000010788b:	89 45 e4             	mov    %eax,-0x1c(%rbp)
ffff80000010788e:	e9 88 00 00 00       	jmpq   ffff80000010791b <alloc_pages+0x101>
ffff800000107893:	48 b8 d8 36 01 00 00 	movabs $0x136d8,%rax
ffff80000010789a:	00 00 00 
ffff80000010789d:	8b 04 03             	mov    (%rbx,%rax,1),%eax
ffff8000001078a0:	89 45 e8             	mov    %eax,-0x18(%rbp)
ffff8000001078a3:	48 b8 dc 36 01 00 00 	movabs $0x136dc,%rax
ffff8000001078aa:	00 00 00 
ffff8000001078ad:	8b 04 03             	mov    (%rbx,%rax,1),%eax
ffff8000001078b0:	89 45 e4             	mov    %eax,-0x1c(%rbp)
ffff8000001078b3:	eb 66                	jmp    ffff80000010791b <alloc_pages+0x101>
ffff8000001078b5:	48 b8 e0 36 01 00 00 	movabs $0x136e0,%rax
ffff8000001078bc:	00 00 00 
ffff8000001078bf:	8b 04 03             	mov    (%rbx,%rax,1),%eax
ffff8000001078c2:	89 45 e8             	mov    %eax,-0x18(%rbp)
ffff8000001078c5:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001078cc:	ff ff ff 
ffff8000001078cf:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001078d3:	48 8b 80 c8 02 00 00 	mov    0x2c8(%rax),%rax
ffff8000001078da:	83 e8 01             	sub    $0x1,%eax
ffff8000001078dd:	89 45 e4             	mov    %eax,-0x1c(%rbp)
ffff8000001078e0:	eb 39                	jmp    ffff80000010791b <alloc_pages+0x101>
ffff8000001078e2:	48 b8 58 18 00 00 00 	movabs $0x1858,%rax
ffff8000001078e9:	00 00 00 
ffff8000001078ec:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001078f0:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001078f5:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001078fa:	49 89 df             	mov    %rbx,%r15
ffff8000001078fd:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107902:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000107909:	ff ff ff 
ffff80000010790c:	48 01 d9             	add    %rbx,%rcx
ffff80000010790f:	ff d1                	callq  *%rcx
ffff800000107911:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107916:	e9 88 02 00 00       	jmpq   ffff800000107ba3 <alloc_pages+0x389>
ffff80000010791b:	8b 45 e8             	mov    -0x18(%rbp),%eax
ffff80000010791e:	89 45 ec             	mov    %eax,-0x14(%rbp)
ffff800000107921:	e9 6c 02 00 00       	jmpq   ffff800000107b92 <alloc_pages+0x378>
ffff800000107926:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010792d:	ff ff ff 
ffff800000107930:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107934:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff80000010793b:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff80000010793e:	48 63 d0             	movslq %eax,%rdx
ffff800000107941:	48 89 d0             	mov    %rdx,%rax
ffff800000107944:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107948:	48 01 d0             	add    %rdx,%rax
ffff80000010794b:	48 c1 e0 04          	shl    $0x4,%rax
ffff80000010794f:	48 01 c8             	add    %rcx,%rax
ffff800000107952:	48 8b 50 40          	mov    0x40(%rax),%rdx
ffff800000107956:	8b 85 78 ff ff ff    	mov    -0x88(%rbp),%eax
ffff80000010795c:	48 98                	cltq   
ffff80000010795e:	48 39 c2             	cmp    %rax,%rdx
ffff800000107961:	0f 82 26 02 00 00    	jb     ffff800000107b8d <alloc_pages+0x373>
ffff800000107967:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010796e:	ff ff ff 
ffff800000107971:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107975:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff80000010797c:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff80000010797f:	48 63 d0             	movslq %eax,%rdx
ffff800000107982:	48 89 d0             	mov    %rdx,%rax
ffff800000107985:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107989:	48 01 d0             	add    %rdx,%rax
ffff80000010798c:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000107990:	48 01 c8             	add    %rcx,%rax
ffff800000107993:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
ffff800000107997:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff80000010799b:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff80000010799f:	48 c1 e8 15          	shr    $0x15,%rax
ffff8000001079a3:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff8000001079a7:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff8000001079ab:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001079af:	48 c1 e8 15          	shr    $0x15,%rax
ffff8000001079b3:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
ffff8000001079b7:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff8000001079bb:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff8000001079bf:	48 c1 e8 15          	shr    $0x15,%rax
ffff8000001079c3:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
ffff8000001079c7:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff8000001079cb:	83 e0 3f             	and    $0x3f,%eax
ffff8000001079ce:	ba 40 00 00 00       	mov    $0x40,%edx
ffff8000001079d3:	48 29 c2             	sub    %rax,%rdx
ffff8000001079d6:	48 89 d0             	mov    %rdx,%rax
ffff8000001079d9:	48 89 45 98          	mov    %rax,-0x68(%rbp)
ffff8000001079dd:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff8000001079e1:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff8000001079e5:	e9 93 01 00 00       	jmpq   ffff800000107b7d <alloc_pages+0x363>
ffff8000001079ea:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001079f1:	ff ff ff 
ffff8000001079f4:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001079f8:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff8000001079ff:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000107a03:	48 c1 ea 06          	shr    $0x6,%rdx
ffff800000107a07:	48 c1 e2 03          	shl    $0x3,%rdx
ffff800000107a0b:	48 01 d0             	add    %rdx,%rax
ffff800000107a0e:	48 89 45 90          	mov    %rax,-0x70(%rbp)
ffff800000107a12:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107a16:	83 e0 3f             	and    $0x3f,%eax
ffff800000107a19:	48 89 45 88          	mov    %rax,-0x78(%rbp)
ffff800000107a1d:	48 8b 45 88          	mov    -0x78(%rbp),%rax
ffff800000107a21:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff800000107a25:	e9 25 01 00 00       	jmpq   ffff800000107b4f <alloc_pages+0x335>
ffff800000107a2a:	48 8b 45 90          	mov    -0x70(%rbp),%rax
ffff800000107a2e:	48 8b 00             	mov    (%rax),%rax
ffff800000107a31:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
ffff800000107a35:	89 d1                	mov    %edx,%ecx
ffff800000107a37:	48 d3 e8             	shr    %cl,%rax
ffff800000107a3a:	48 89 c6             	mov    %rax,%rsi
ffff800000107a3d:	48 8b 45 90          	mov    -0x70(%rbp),%rax
ffff800000107a41:	48 83 c0 08          	add    $0x8,%rax
ffff800000107a45:	48 8b 10             	mov    (%rax),%rdx
ffff800000107a48:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000107a4c:	b9 40 00 00 00       	mov    $0x40,%ecx
ffff800000107a51:	29 c1                	sub    %eax,%ecx
ffff800000107a53:	89 c8                	mov    %ecx,%eax
ffff800000107a55:	89 c1                	mov    %eax,%ecx
ffff800000107a57:	48 d3 e2             	shl    %cl,%rdx
ffff800000107a5a:	48 89 d0             	mov    %rdx,%rax
ffff800000107a5d:	48 09 c6             	or     %rax,%rsi
ffff800000107a60:	48 89 f2             	mov    %rsi,%rdx
ffff800000107a63:	83 bd 78 ff ff ff 40 	cmpl   $0x40,-0x88(%rbp)
ffff800000107a6a:	74 19                	je     ffff800000107a85 <alloc_pages+0x26b>
ffff800000107a6c:	8b 85 78 ff ff ff    	mov    -0x88(%rbp),%eax
ffff800000107a72:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000107a77:	89 c1                	mov    %eax,%ecx
ffff800000107a79:	48 d3 e6             	shl    %cl,%rsi
ffff800000107a7c:	48 89 f0             	mov    %rsi,%rax
ffff800000107a7f:	48 83 e8 01          	sub    $0x1,%rax
ffff800000107a83:	eb 07                	jmp    ffff800000107a8c <alloc_pages+0x272>
ffff800000107a85:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffff800000107a8c:	48 21 d0             	and    %rdx,%rax
ffff800000107a8f:	48 85 c0             	test   %rax,%rax
ffff800000107a92:	0f 85 b2 00 00 00    	jne    ffff800000107b4a <alloc_pages+0x330>
ffff800000107a98:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000107a9c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000107aa0:	48 01 d0             	add    %rdx,%rax
ffff800000107aa3:	48 83 e8 01          	sub    $0x1,%rax
ffff800000107aa7:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
ffff800000107aab:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
ffff800000107ab2:	00 
ffff800000107ab3:	eb 5b                	jmp    ffff800000107b10 <alloc_pages+0x2f6>
ffff800000107ab5:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107abc:	ff ff ff 
ffff800000107abf:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107ac3:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff800000107aca:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
ffff800000107ace:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107ad2:	48 01 c2             	add    %rax,%rdx
ffff800000107ad5:	48 89 d0             	mov    %rdx,%rax
ffff800000107ad8:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107adc:	48 01 d0             	add    %rdx,%rax
ffff800000107adf:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107ae3:	48 01 c8             	add    %rcx,%rax
ffff800000107ae6:	48 89 45 80          	mov    %rax,-0x80(%rbp)
ffff800000107aea:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
ffff800000107af1:	48 8b 45 80          	mov    -0x80(%rbp),%rax
ffff800000107af5:	48 89 d6             	mov    %rdx,%rsi
ffff800000107af8:	48 89 c7             	mov    %rax,%rdi
ffff800000107afb:	48 b8 46 9f ff ff ff 	movabs $0xffffffffffff9f46,%rax
ffff800000107b02:	ff ff ff 
ffff800000107b05:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000107b09:	ff d0                	callq  *%rax
ffff800000107b0b:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
ffff800000107b10:	8b 85 78 ff ff ff    	mov    -0x88(%rbp),%eax
ffff800000107b16:	48 98                	cltq   
ffff800000107b18:	48 39 45 c8          	cmp    %rax,-0x38(%rbp)
ffff800000107b1c:	72 97                	jb     ffff800000107ab5 <alloc_pages+0x29b>
ffff800000107b1e:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107b25:	ff ff ff 
ffff800000107b28:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000107b2c:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff800000107b33:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
ffff800000107b37:	48 89 d0             	mov    %rdx,%rax
ffff800000107b3a:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107b3e:	48 01 d0             	add    %rdx,%rax
ffff800000107b41:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107b45:	48 01 c8             	add    %rcx,%rax
ffff800000107b48:	eb 59                	jmp    ffff800000107ba3 <alloc_pages+0x389>
ffff800000107b4a:	48 83 45 d0 01       	addq   $0x1,-0x30(%rbp)
ffff800000107b4f:	b8 40 00 00 00       	mov    $0x40,%eax
ffff800000107b54:	48 2b 45 88          	sub    -0x78(%rbp),%rax
ffff800000107b58:	48 39 45 d0          	cmp    %rax,-0x30(%rbp)
ffff800000107b5c:	0f 82 c8 fe ff ff    	jb     ffff800000107a2a <alloc_pages+0x210>
ffff800000107b62:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107b66:	83 e0 3f             	and    $0x3f,%eax
ffff800000107b69:	48 85 c0             	test   %rax,%rax
ffff800000107b6c:	74 06                	je     ffff800000107b74 <alloc_pages+0x35a>
ffff800000107b6e:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107b72:	eb 05                	jmp    ffff800000107b79 <alloc_pages+0x35f>
ffff800000107b74:	b8 40 00 00 00       	mov    $0x40,%eax
ffff800000107b79:	48 01 45 d8          	add    %rax,-0x28(%rbp)
ffff800000107b7d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107b81:	48 3b 45 a8          	cmp    -0x58(%rbp),%rax
ffff800000107b85:	0f 86 5f fe ff ff    	jbe    ffff8000001079ea <alloc_pages+0x1d0>
ffff800000107b8b:	eb 01                	jmp    ffff800000107b8e <alloc_pages+0x374>
ffff800000107b8d:	90                   	nop
ffff800000107b8e:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
ffff800000107b92:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000107b95:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
ffff800000107b98:	0f 8e 88 fd ff ff    	jle    ffff800000107926 <alloc_pages+0x10c>
ffff800000107b9e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107ba3:	48 83 ec 80          	sub    $0xffffffffffffff80,%rsp
ffff800000107ba7:	5b                   	pop    %rbx
ffff800000107ba8:	41 5f                	pop    %r15
ffff800000107baa:	5d                   	pop    %rbp
ffff800000107bab:	c3                   	retq   

ffff800000107bac <free_pages>:
ffff800000107bac:	55                   	push   %rbp
ffff800000107bad:	48 89 e5             	mov    %rsp,%rbp
ffff800000107bb0:	41 57                	push   %r15
ffff800000107bb2:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000107bb6:	4c 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%r8        # ffff800000107bb6 <free_pages+0xa>
ffff800000107bbd:	49 bb 72 4d 00 00 00 	movabs $0x4d72,%r11
ffff800000107bc4:	00 00 00 
ffff800000107bc7:	4d 01 d8             	add    %r11,%r8
ffff800000107bca:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000107bce:	89 75 d4             	mov    %esi,-0x2c(%rbp)
ffff800000107bd1:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
ffff800000107bd6:	75 34                	jne    ffff800000107c0c <free_pages+0x60>
ffff800000107bd8:	48 b8 80 18 00 00 00 	movabs $0x1880,%rax
ffff800000107bdf:	00 00 00 
ffff800000107be2:	49 8d 14 00          	lea    (%r8,%rax,1),%rdx
ffff800000107be6:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107beb:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000107bf0:	4d 89 c7             	mov    %r8,%r15
ffff800000107bf3:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107bf8:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000107bff:	ff ff ff 
ffff800000107c02:	4c 01 c1             	add    %r8,%rcx
ffff800000107c05:	ff d1                	callq  *%rcx
ffff800000107c07:	e9 0e 01 00 00       	jmpq   ffff800000107d1a <free_pages+0x16e>
ffff800000107c0c:	83 7d d4 3f          	cmpl   $0x3f,-0x2c(%rbp)
ffff800000107c10:	7f 06                	jg     ffff800000107c18 <free_pages+0x6c>
ffff800000107c12:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
ffff800000107c16:	7f 34                	jg     ffff800000107c4c <free_pages+0xa0>
ffff800000107c18:	48 b8 a8 18 00 00 00 	movabs $0x18a8,%rax
ffff800000107c1f:	00 00 00 
ffff800000107c22:	49 8d 14 00          	lea    (%r8,%rax,1),%rdx
ffff800000107c26:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107c2b:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000107c30:	4d 89 c7             	mov    %r8,%r15
ffff800000107c33:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107c38:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000107c3f:	ff ff ff 
ffff800000107c42:	4c 01 c1             	add    %r8,%rcx
ffff800000107c45:	ff d1                	callq  *%rcx
ffff800000107c47:	e9 ce 00 00 00       	jmpq   ffff800000107d1a <free_pages+0x16e>
ffff800000107c4c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
ffff800000107c53:	e9 b6 00 00 00       	jmpq   ffff800000107d0e <free_pages+0x162>
ffff800000107c58:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107c5f:	ff ff ff 
ffff800000107c62:	49 8b 04 00          	mov    (%r8,%rax,1),%rax
ffff800000107c66:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000107c6d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107c71:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107c75:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000107c79:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107c7d:	48 01 d0             	add    %rdx,%rax
ffff800000107c80:	48 8b 10             	mov    (%rax),%rdx
ffff800000107c83:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107c87:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107c8b:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107c8f:	83 e0 3f             	and    $0x3f,%eax
ffff800000107c92:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000107c97:	89 c1                	mov    %eax,%ecx
ffff800000107c99:	48 d3 e6             	shl    %cl,%rsi
ffff800000107c9c:	48 89 f0             	mov    %rsi,%rax
ffff800000107c9f:	48 f7 d0             	not    %rax
ffff800000107ca2:	48 89 c6             	mov    %rax,%rsi
ffff800000107ca5:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff800000107cac:	ff ff ff 
ffff800000107caf:	49 8b 04 00          	mov    (%r8,%rax,1),%rax
ffff800000107cb3:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
ffff800000107cba:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107cbe:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107cc2:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000107cc6:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107cca:	48 01 c8             	add    %rcx,%rax
ffff800000107ccd:	48 21 f2             	and    %rsi,%rdx
ffff800000107cd0:	48 89 10             	mov    %rdx,(%rax)
ffff800000107cd3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107cd7:	48 8b 00             	mov    (%rax),%rax
ffff800000107cda:	48 8b 50 38          	mov    0x38(%rax),%rdx
ffff800000107cde:	48 83 ea 01          	sub    $0x1,%rdx
ffff800000107ce2:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff800000107ce6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107cea:	48 8b 00             	mov    (%rax),%rax
ffff800000107ced:	48 8b 50 40          	mov    0x40(%rax),%rdx
ffff800000107cf1:	48 83 c2 01          	add    $0x1,%rdx
ffff800000107cf5:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff800000107cf9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107cfd:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff800000107d04:	00 
ffff800000107d05:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
ffff800000107d09:	48 83 45 d8 28       	addq   $0x28,-0x28(%rbp)
ffff800000107d0e:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000107d11:	3b 45 d4             	cmp    -0x2c(%rbp),%eax
ffff800000107d14:	0f 8c 3e ff ff ff    	jl     ffff800000107c58 <free_pages+0xac>
ffff800000107d1a:	48 83 c4 28          	add    $0x28,%rsp
ffff800000107d1e:	41 5f                	pop    %r15
ffff800000107d20:	5d                   	pop    %rbp
ffff800000107d21:	c3                   	retq   

ffff800000107d22 <memset>:
ffff800000107d22:	55                   	push   %rbp
ffff800000107d23:	48 89 e5             	mov    %rsp,%rbp
ffff800000107d26:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107d26 <memset+0x4>
ffff800000107d2d:	49 bb 02 4c 00 00 00 	movabs $0x4c02,%r11
ffff800000107d34:	00 00 00 
ffff800000107d37:	4c 01 d8             	add    %r11,%rax
ffff800000107d3a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000107d3e:	89 f0                	mov    %esi,%eax
ffff800000107d40:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
ffff800000107d44:	88 45 e4             	mov    %al,-0x1c(%rbp)
ffff800000107d47:	0f b6 45 e4          	movzbl -0x1c(%rbp),%eax
ffff800000107d4b:	88 45 f7             	mov    %al,-0x9(%rbp)
ffff800000107d4e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107d52:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000107d56:	eb 14                	jmp    ffff800000107d6c <memset+0x4a>
ffff800000107d58:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107d5c:	0f b6 55 f7          	movzbl -0x9(%rbp),%edx
ffff800000107d60:	88 10                	mov    %dl,(%rax)
ffff800000107d62:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
ffff800000107d67:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
ffff800000107d6c:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
ffff800000107d71:	7f e5                	jg     ffff800000107d58 <memset+0x36>
ffff800000107d73:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107d77:	5d                   	pop    %rbp
ffff800000107d78:	c3                   	retq   

ffff800000107d79 <memcpy>:
ffff800000107d79:	55                   	push   %rbp
ffff800000107d7a:	48 89 e5             	mov    %rsp,%rbp
ffff800000107d7d:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107d7d <memcpy+0x4>
ffff800000107d84:	49 bb ab 4b 00 00 00 	movabs $0x4bab,%r11
ffff800000107d8b:	00 00 00 
ffff800000107d8e:	4c 01 d8             	add    %r11,%rax
ffff800000107d91:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000107d95:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
ffff800000107d99:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
ffff800000107d9d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107da1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000107da5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107da9:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff800000107dad:	eb 1d                	jmp    ffff800000107dcc <memcpy+0x53>
ffff800000107daf:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000107db3:	48 8d 42 01          	lea    0x1(%rdx),%rax
ffff800000107db7:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff800000107dbb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107dbf:	48 8d 48 01          	lea    0x1(%rax),%rcx
ffff800000107dc3:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
ffff800000107dc7:	0f b6 12             	movzbl (%rdx),%edx
ffff800000107dca:	88 10                	mov    %dl,(%rax)
ffff800000107dcc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107dd0:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff800000107dd4:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
ffff800000107dd8:	48 85 c0             	test   %rax,%rax
ffff800000107ddb:	75 d2                	jne    ffff800000107daf <memcpy+0x36>
ffff800000107ddd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107de1:	5d                   	pop    %rbp
ffff800000107de2:	c3                   	retq   

ffff800000107de3 <Get_gdt>:
ffff800000107de3:	55                   	push   %rbp
ffff800000107de4:	48 89 e5             	mov    %rsp,%rbp
ffff800000107de7:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107de7 <Get_gdt+0x4>
ffff800000107dee:	49 bb 41 4b 00 00 00 	movabs $0x4b41,%r11
ffff800000107df5:	00 00 00 
ffff800000107df8:	4c 01 d8             	add    %r11,%rax
ffff800000107dfb:	0f 20 d8             	mov    %cr3,%rax
ffff800000107dfe:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000107e02:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107e06:	5d                   	pop    %rbp
ffff800000107e07:	c3                   	retq   

ffff800000107e08 <flush_tlb>:
ffff800000107e08:	55                   	push   %rbp
ffff800000107e09:	48 89 e5             	mov    %rsp,%rbp
ffff800000107e0c:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107e0c <flush_tlb+0x4>
ffff800000107e13:	49 bb 1c 4b 00 00 00 	movabs $0x4b1c,%r11
ffff800000107e1a:	00 00 00 
ffff800000107e1d:	4c 01 d8             	add    %r11,%rax
ffff800000107e20:	0f 20 d8             	mov    %cr3,%rax
ffff800000107e23:	0f 22 d8             	mov    %rax,%cr3
ffff800000107e26:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000107e2a:	90                   	nop
ffff800000107e2b:	5d                   	pop    %rbp
ffff800000107e2c:	c3                   	retq   

ffff800000107e2d <io_out8>:
ffff800000107e2d:	55                   	push   %rbp
ffff800000107e2e:	48 89 e5             	mov    %rsp,%rbp
ffff800000107e31:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107e31 <io_out8+0x4>
ffff800000107e38:	49 bb f7 4a 00 00 00 	movabs $0x4af7,%r11
ffff800000107e3f:	00 00 00 
ffff800000107e42:	4c 01 d8             	add    %r11,%rax
ffff800000107e45:	89 fa                	mov    %edi,%edx
ffff800000107e47:	89 f0                	mov    %esi,%eax
ffff800000107e49:	66 89 55 fc          	mov    %dx,-0x4(%rbp)
ffff800000107e4d:	88 45 f8             	mov    %al,-0x8(%rbp)
ffff800000107e50:	0f b6 45 f8          	movzbl -0x8(%rbp),%eax
ffff800000107e54:	0f b7 55 fc          	movzwl -0x4(%rbp),%edx
ffff800000107e58:	ee                   	out    %al,(%dx)
ffff800000107e59:	0f ae f0             	mfence 
ffff800000107e5c:	90                   	nop
ffff800000107e5d:	5d                   	pop    %rbp
ffff800000107e5e:	c3                   	retq   

ffff800000107e5f <io_in8>:
ffff800000107e5f:	55                   	push   %rbp
ffff800000107e60:	48 89 e5             	mov    %rsp,%rbp
ffff800000107e63:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107e63 <io_in8+0x4>
ffff800000107e6a:	49 bb c5 4a 00 00 00 	movabs $0x4ac5,%r11
ffff800000107e71:	00 00 00 
ffff800000107e74:	4c 01 d8             	add    %r11,%rax
ffff800000107e77:	89 f8                	mov    %edi,%eax
ffff800000107e79:	66 89 45 ec          	mov    %ax,-0x14(%rbp)
ffff800000107e7d:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
ffff800000107e81:	0f b7 45 ec          	movzwl -0x14(%rbp),%eax
ffff800000107e85:	89 c2                	mov    %eax,%edx
ffff800000107e87:	ec                   	in     (%dx),%al
ffff800000107e88:	0f ae f0             	mfence 
ffff800000107e8b:	88 45 ff             	mov    %al,-0x1(%rbp)
ffff800000107e8e:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
ffff800000107e92:	5d                   	pop    %rbp
ffff800000107e93:	c3                   	retq   

ffff800000107e94 <list_init>:
ffff800000107e94:	55                   	push   %rbp
ffff800000107e95:	48 89 e5             	mov    %rsp,%rbp
ffff800000107e98:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107e98 <list_init+0x4>
ffff800000107e9f:	49 bb 90 4a 00 00 00 	movabs $0x4a90,%r11
ffff800000107ea6:	00 00 00 
ffff800000107ea9:	4c 01 d8             	add    %r11,%rax
ffff800000107eac:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000107eb0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107eb4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000107eb8:	48 89 10             	mov    %rdx,(%rax)
ffff800000107ebb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107ebf:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000107ec3:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107ec7:	90                   	nop
ffff800000107ec8:	5d                   	pop    %rbp
ffff800000107ec9:	c3                   	retq   

ffff800000107eca <list_add_to_behind>:
ffff800000107eca:	55                   	push   %rbp
ffff800000107ecb:	48 89 e5             	mov    %rsp,%rbp
ffff800000107ece:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107ece <list_add_to_behind+0x4>
ffff800000107ed5:	49 bb 5a 4a 00 00 00 	movabs $0x4a5a,%r11
ffff800000107edc:	00 00 00 
ffff800000107edf:	4c 01 d8             	add    %r11,%rax
ffff800000107ee2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000107ee6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000107eea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107eee:	48 8b 50 08          	mov    0x8(%rax),%rdx
ffff800000107ef2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107ef6:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107efa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107efe:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000107f02:	48 89 10             	mov    %rdx,(%rax)
ffff800000107f05:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107f09:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107f0d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000107f11:	48 89 10             	mov    %rdx,(%rax)
ffff800000107f14:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107f18:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000107f1c:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107f20:	90                   	nop
ffff800000107f21:	5d                   	pop    %rbp
ffff800000107f22:	c3                   	retq   

ffff800000107f23 <list_add_to_before>:
ffff800000107f23:	55                   	push   %rbp
ffff800000107f24:	48 89 e5             	mov    %rsp,%rbp
ffff800000107f27:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107f27 <list_add_to_before+0x4>
ffff800000107f2e:	49 bb 01 4a 00 00 00 	movabs $0x4a01,%r11
ffff800000107f35:	00 00 00 
ffff800000107f38:	4c 01 d8             	add    %r11,%rax
ffff800000107f3b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000107f3f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000107f43:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107f47:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000107f4b:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107f4f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107f53:	48 8b 00             	mov    (%rax),%rax
ffff800000107f56:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000107f5a:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107f5e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107f62:	48 8b 10             	mov    (%rax),%rdx
ffff800000107f65:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107f69:	48 89 10             	mov    %rdx,(%rax)
ffff800000107f6c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107f70:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000107f74:	48 89 10             	mov    %rdx,(%rax)
ffff800000107f77:	90                   	nop
ffff800000107f78:	5d                   	pop    %rbp
ffff800000107f79:	c3                   	retq   

ffff800000107f7a <list_del>:
ffff800000107f7a:	55                   	push   %rbp
ffff800000107f7b:	48 89 e5             	mov    %rsp,%rbp
ffff800000107f7e:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107f7e <list_del+0x4>
ffff800000107f85:	49 bb aa 49 00 00 00 	movabs $0x49aa,%r11
ffff800000107f8c:	00 00 00 
ffff800000107f8f:	4c 01 d8             	add    %r11,%rax
ffff800000107f92:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000107f96:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107f9a:	48 8b 00             	mov    (%rax),%rax
ffff800000107f9d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000107fa1:	48 8b 52 08          	mov    0x8(%rdx),%rdx
ffff800000107fa5:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107fa9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107fad:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107fb1:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000107fb5:	48 8b 12             	mov    (%rdx),%rdx
ffff800000107fb8:	48 89 10             	mov    %rdx,(%rax)
ffff800000107fbb:	90                   	nop
ffff800000107fbc:	5d                   	pop    %rbp
ffff800000107fbd:	c3                   	retq   

ffff800000107fbe <list_is_empty>:
ffff800000107fbe:	55                   	push   %rbp
ffff800000107fbf:	48 89 e5             	mov    %rsp,%rbp
ffff800000107fc2:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000107fc2 <list_is_empty+0x4>
ffff800000107fc9:	49 bb 66 49 00 00 00 	movabs $0x4966,%r11
ffff800000107fd0:	00 00 00 
ffff800000107fd3:	4c 01 d8             	add    %r11,%rax
ffff800000107fd6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000107fda:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107fde:	48 8b 00             	mov    (%rax),%rax
ffff800000107fe1:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
ffff800000107fe5:	75 15                	jne    ffff800000107ffc <list_is_empty+0x3e>
ffff800000107fe7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107feb:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107fef:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
ffff800000107ff3:	75 07                	jne    ffff800000107ffc <list_is_empty+0x3e>
ffff800000107ff5:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000107ffa:	eb 05                	jmp    ffff800000108001 <list_is_empty+0x43>
ffff800000107ffc:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108001:	5d                   	pop    %rbp
ffff800000108002:	c3                   	retq   

ffff800000108003 <list_next>:
ffff800000108003:	55                   	push   %rbp
ffff800000108004:	48 89 e5             	mov    %rsp,%rbp
ffff800000108007:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108007 <list_next+0x4>
ffff80000010800e:	49 bb 21 49 00 00 00 	movabs $0x4921,%r11
ffff800000108015:	00 00 00 
ffff800000108018:	4c 01 d8             	add    %r11,%rax
ffff80000010801b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff80000010801f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108023:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000108027:	48 85 c0             	test   %rax,%rax
ffff80000010802a:	74 0a                	je     ffff800000108036 <list_next+0x33>
ffff80000010802c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108030:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000108034:	eb 05                	jmp    ffff80000010803b <list_next+0x38>
ffff800000108036:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010803b:	5d                   	pop    %rbp
ffff80000010803c:	c3                   	retq   

ffff80000010803d <wrmsr>:
ffff80000010803d:	55                   	push   %rbp
ffff80000010803e:	48 89 e5             	mov    %rsp,%rbp
ffff800000108041:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108041 <wrmsr+0x4>
ffff800000108048:	49 bb e7 48 00 00 00 	movabs $0x48e7,%r11
ffff80000010804f:	00 00 00 
ffff800000108052:	4c 01 d8             	add    %r11,%rax
ffff800000108055:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108059:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff80000010805d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108061:	48 c1 e8 20          	shr    $0x20,%rax
ffff800000108065:	48 89 c2             	mov    %rax,%rdx
ffff800000108068:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010806c:	89 c0                	mov    %eax,%eax
ffff80000010806e:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
ffff800000108072:	0f 30                	wrmsr  
ffff800000108074:	90                   	nop
ffff800000108075:	5d                   	pop    %rbp
ffff800000108076:	c3                   	retq   

ffff800000108077 <IRQ0x20_interrupt>:
ffff800000108077:	6a 00                	pushq  $0x0
ffff800000108079:	fc                   	cld    
ffff80000010807a:	50                   	push   %rax
ffff80000010807b:	50                   	push   %rax
ffff80000010807c:	48 8c c0             	mov    %es,%rax
ffff80000010807f:	50                   	push   %rax
ffff800000108080:	48 8c d8             	mov    %ds,%rax
ffff800000108083:	50                   	push   %rax
ffff800000108084:	48 31 c0             	xor    %rax,%rax
ffff800000108087:	55                   	push   %rbp
ffff800000108088:	57                   	push   %rdi
ffff800000108089:	56                   	push   %rsi
ffff80000010808a:	52                   	push   %rdx
ffff80000010808b:	51                   	push   %rcx
ffff80000010808c:	53                   	push   %rbx
ffff80000010808d:	41 50                	push   %r8
ffff80000010808f:	41 51                	push   %r9
ffff800000108091:	41 52                	push   %r10
ffff800000108093:	41 53                	push   %r11
ffff800000108095:	41 54                	push   %r12
ffff800000108097:	41 55                	push   %r13
ffff800000108099:	41 56                	push   %r14
ffff80000010809b:	41 57                	push   %r15
ffff80000010809d:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001080a4:	48 8e da             	mov    %rdx,%ds
ffff8000001080a7:	48 8e c2             	mov    %rdx,%es
ffff8000001080aa:	48 89 e7             	mov    %rsp,%rdi
ffff8000001080ad:	48 8d 05 71 bf ff ff 	lea    -0x408f(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001080b4:	50                   	push   %rax
ffff8000001080b5:	48 c7 c6 20 00 00 00 	mov    $0x20,%rsi
ffff8000001080bc:	e9 64 08 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff8000001080c1 <IRQ0x21_interrupt>:
ffff8000001080c1:	6a 00                	pushq  $0x0
ffff8000001080c3:	fc                   	cld    
ffff8000001080c4:	50                   	push   %rax
ffff8000001080c5:	50                   	push   %rax
ffff8000001080c6:	48 8c c0             	mov    %es,%rax
ffff8000001080c9:	50                   	push   %rax
ffff8000001080ca:	48 8c d8             	mov    %ds,%rax
ffff8000001080cd:	50                   	push   %rax
ffff8000001080ce:	48 31 c0             	xor    %rax,%rax
ffff8000001080d1:	55                   	push   %rbp
ffff8000001080d2:	57                   	push   %rdi
ffff8000001080d3:	56                   	push   %rsi
ffff8000001080d4:	52                   	push   %rdx
ffff8000001080d5:	51                   	push   %rcx
ffff8000001080d6:	53                   	push   %rbx
ffff8000001080d7:	41 50                	push   %r8
ffff8000001080d9:	41 51                	push   %r9
ffff8000001080db:	41 52                	push   %r10
ffff8000001080dd:	41 53                	push   %r11
ffff8000001080df:	41 54                	push   %r12
ffff8000001080e1:	41 55                	push   %r13
ffff8000001080e3:	41 56                	push   %r14
ffff8000001080e5:	41 57                	push   %r15
ffff8000001080e7:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001080ee:	48 8e da             	mov    %rdx,%ds
ffff8000001080f1:	48 8e c2             	mov    %rdx,%es
ffff8000001080f4:	48 89 e7             	mov    %rsp,%rdi
ffff8000001080f7:	48 8d 05 27 bf ff ff 	lea    -0x40d9(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001080fe:	50                   	push   %rax
ffff8000001080ff:	48 c7 c6 21 00 00 00 	mov    $0x21,%rsi
ffff800000108106:	e9 1a 08 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff80000010810b <IRQ0x22_interrupt>:
ffff80000010810b:	6a 00                	pushq  $0x0
ffff80000010810d:	fc                   	cld    
ffff80000010810e:	50                   	push   %rax
ffff80000010810f:	50                   	push   %rax
ffff800000108110:	48 8c c0             	mov    %es,%rax
ffff800000108113:	50                   	push   %rax
ffff800000108114:	48 8c d8             	mov    %ds,%rax
ffff800000108117:	50                   	push   %rax
ffff800000108118:	48 31 c0             	xor    %rax,%rax
ffff80000010811b:	55                   	push   %rbp
ffff80000010811c:	57                   	push   %rdi
ffff80000010811d:	56                   	push   %rsi
ffff80000010811e:	52                   	push   %rdx
ffff80000010811f:	51                   	push   %rcx
ffff800000108120:	53                   	push   %rbx
ffff800000108121:	41 50                	push   %r8
ffff800000108123:	41 51                	push   %r9
ffff800000108125:	41 52                	push   %r10
ffff800000108127:	41 53                	push   %r11
ffff800000108129:	41 54                	push   %r12
ffff80000010812b:	41 55                	push   %r13
ffff80000010812d:	41 56                	push   %r14
ffff80000010812f:	41 57                	push   %r15
ffff800000108131:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108138:	48 8e da             	mov    %rdx,%ds
ffff80000010813b:	48 8e c2             	mov    %rdx,%es
ffff80000010813e:	48 89 e7             	mov    %rsp,%rdi
ffff800000108141:	48 8d 05 dd be ff ff 	lea    -0x4123(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108148:	50                   	push   %rax
ffff800000108149:	48 c7 c6 22 00 00 00 	mov    $0x22,%rsi
ffff800000108150:	e9 d0 07 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff800000108155 <IRQ0x23_interrupt>:
ffff800000108155:	6a 00                	pushq  $0x0
ffff800000108157:	fc                   	cld    
ffff800000108158:	50                   	push   %rax
ffff800000108159:	50                   	push   %rax
ffff80000010815a:	48 8c c0             	mov    %es,%rax
ffff80000010815d:	50                   	push   %rax
ffff80000010815e:	48 8c d8             	mov    %ds,%rax
ffff800000108161:	50                   	push   %rax
ffff800000108162:	48 31 c0             	xor    %rax,%rax
ffff800000108165:	55                   	push   %rbp
ffff800000108166:	57                   	push   %rdi
ffff800000108167:	56                   	push   %rsi
ffff800000108168:	52                   	push   %rdx
ffff800000108169:	51                   	push   %rcx
ffff80000010816a:	53                   	push   %rbx
ffff80000010816b:	41 50                	push   %r8
ffff80000010816d:	41 51                	push   %r9
ffff80000010816f:	41 52                	push   %r10
ffff800000108171:	41 53                	push   %r11
ffff800000108173:	41 54                	push   %r12
ffff800000108175:	41 55                	push   %r13
ffff800000108177:	41 56                	push   %r14
ffff800000108179:	41 57                	push   %r15
ffff80000010817b:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108182:	48 8e da             	mov    %rdx,%ds
ffff800000108185:	48 8e c2             	mov    %rdx,%es
ffff800000108188:	48 89 e7             	mov    %rsp,%rdi
ffff80000010818b:	48 8d 05 93 be ff ff 	lea    -0x416d(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108192:	50                   	push   %rax
ffff800000108193:	48 c7 c6 23 00 00 00 	mov    $0x23,%rsi
ffff80000010819a:	e9 86 07 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff80000010819f <IRQ0x24_interrupt>:
ffff80000010819f:	6a 00                	pushq  $0x0
ffff8000001081a1:	fc                   	cld    
ffff8000001081a2:	50                   	push   %rax
ffff8000001081a3:	50                   	push   %rax
ffff8000001081a4:	48 8c c0             	mov    %es,%rax
ffff8000001081a7:	50                   	push   %rax
ffff8000001081a8:	48 8c d8             	mov    %ds,%rax
ffff8000001081ab:	50                   	push   %rax
ffff8000001081ac:	48 31 c0             	xor    %rax,%rax
ffff8000001081af:	55                   	push   %rbp
ffff8000001081b0:	57                   	push   %rdi
ffff8000001081b1:	56                   	push   %rsi
ffff8000001081b2:	52                   	push   %rdx
ffff8000001081b3:	51                   	push   %rcx
ffff8000001081b4:	53                   	push   %rbx
ffff8000001081b5:	41 50                	push   %r8
ffff8000001081b7:	41 51                	push   %r9
ffff8000001081b9:	41 52                	push   %r10
ffff8000001081bb:	41 53                	push   %r11
ffff8000001081bd:	41 54                	push   %r12
ffff8000001081bf:	41 55                	push   %r13
ffff8000001081c1:	41 56                	push   %r14
ffff8000001081c3:	41 57                	push   %r15
ffff8000001081c5:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001081cc:	48 8e da             	mov    %rdx,%ds
ffff8000001081cf:	48 8e c2             	mov    %rdx,%es
ffff8000001081d2:	48 89 e7             	mov    %rsp,%rdi
ffff8000001081d5:	48 8d 05 49 be ff ff 	lea    -0x41b7(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001081dc:	50                   	push   %rax
ffff8000001081dd:	48 c7 c6 24 00 00 00 	mov    $0x24,%rsi
ffff8000001081e4:	e9 3c 07 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff8000001081e9 <IRQ0x25_interrupt>:
ffff8000001081e9:	6a 00                	pushq  $0x0
ffff8000001081eb:	fc                   	cld    
ffff8000001081ec:	50                   	push   %rax
ffff8000001081ed:	50                   	push   %rax
ffff8000001081ee:	48 8c c0             	mov    %es,%rax
ffff8000001081f1:	50                   	push   %rax
ffff8000001081f2:	48 8c d8             	mov    %ds,%rax
ffff8000001081f5:	50                   	push   %rax
ffff8000001081f6:	48 31 c0             	xor    %rax,%rax
ffff8000001081f9:	55                   	push   %rbp
ffff8000001081fa:	57                   	push   %rdi
ffff8000001081fb:	56                   	push   %rsi
ffff8000001081fc:	52                   	push   %rdx
ffff8000001081fd:	51                   	push   %rcx
ffff8000001081fe:	53                   	push   %rbx
ffff8000001081ff:	41 50                	push   %r8
ffff800000108201:	41 51                	push   %r9
ffff800000108203:	41 52                	push   %r10
ffff800000108205:	41 53                	push   %r11
ffff800000108207:	41 54                	push   %r12
ffff800000108209:	41 55                	push   %r13
ffff80000010820b:	41 56                	push   %r14
ffff80000010820d:	41 57                	push   %r15
ffff80000010820f:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108216:	48 8e da             	mov    %rdx,%ds
ffff800000108219:	48 8e c2             	mov    %rdx,%es
ffff80000010821c:	48 89 e7             	mov    %rsp,%rdi
ffff80000010821f:	48 8d 05 ff bd ff ff 	lea    -0x4201(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108226:	50                   	push   %rax
ffff800000108227:	48 c7 c6 25 00 00 00 	mov    $0x25,%rsi
ffff80000010822e:	e9 f2 06 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff800000108233 <IRQ0x26_interrupt>:
ffff800000108233:	6a 00                	pushq  $0x0
ffff800000108235:	fc                   	cld    
ffff800000108236:	50                   	push   %rax
ffff800000108237:	50                   	push   %rax
ffff800000108238:	48 8c c0             	mov    %es,%rax
ffff80000010823b:	50                   	push   %rax
ffff80000010823c:	48 8c d8             	mov    %ds,%rax
ffff80000010823f:	50                   	push   %rax
ffff800000108240:	48 31 c0             	xor    %rax,%rax
ffff800000108243:	55                   	push   %rbp
ffff800000108244:	57                   	push   %rdi
ffff800000108245:	56                   	push   %rsi
ffff800000108246:	52                   	push   %rdx
ffff800000108247:	51                   	push   %rcx
ffff800000108248:	53                   	push   %rbx
ffff800000108249:	41 50                	push   %r8
ffff80000010824b:	41 51                	push   %r9
ffff80000010824d:	41 52                	push   %r10
ffff80000010824f:	41 53                	push   %r11
ffff800000108251:	41 54                	push   %r12
ffff800000108253:	41 55                	push   %r13
ffff800000108255:	41 56                	push   %r14
ffff800000108257:	41 57                	push   %r15
ffff800000108259:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108260:	48 8e da             	mov    %rdx,%ds
ffff800000108263:	48 8e c2             	mov    %rdx,%es
ffff800000108266:	48 89 e7             	mov    %rsp,%rdi
ffff800000108269:	48 8d 05 b5 bd ff ff 	lea    -0x424b(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108270:	50                   	push   %rax
ffff800000108271:	48 c7 c6 26 00 00 00 	mov    $0x26,%rsi
ffff800000108278:	e9 a8 06 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff80000010827d <IRQ0x27_interrupt>:
ffff80000010827d:	6a 00                	pushq  $0x0
ffff80000010827f:	fc                   	cld    
ffff800000108280:	50                   	push   %rax
ffff800000108281:	50                   	push   %rax
ffff800000108282:	48 8c c0             	mov    %es,%rax
ffff800000108285:	50                   	push   %rax
ffff800000108286:	48 8c d8             	mov    %ds,%rax
ffff800000108289:	50                   	push   %rax
ffff80000010828a:	48 31 c0             	xor    %rax,%rax
ffff80000010828d:	55                   	push   %rbp
ffff80000010828e:	57                   	push   %rdi
ffff80000010828f:	56                   	push   %rsi
ffff800000108290:	52                   	push   %rdx
ffff800000108291:	51                   	push   %rcx
ffff800000108292:	53                   	push   %rbx
ffff800000108293:	41 50                	push   %r8
ffff800000108295:	41 51                	push   %r9
ffff800000108297:	41 52                	push   %r10
ffff800000108299:	41 53                	push   %r11
ffff80000010829b:	41 54                	push   %r12
ffff80000010829d:	41 55                	push   %r13
ffff80000010829f:	41 56                	push   %r14
ffff8000001082a1:	41 57                	push   %r15
ffff8000001082a3:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001082aa:	48 8e da             	mov    %rdx,%ds
ffff8000001082ad:	48 8e c2             	mov    %rdx,%es
ffff8000001082b0:	48 89 e7             	mov    %rsp,%rdi
ffff8000001082b3:	48 8d 05 6b bd ff ff 	lea    -0x4295(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001082ba:	50                   	push   %rax
ffff8000001082bb:	48 c7 c6 27 00 00 00 	mov    $0x27,%rsi
ffff8000001082c2:	e9 5e 06 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff8000001082c7 <IRQ0x28_interrupt>:
ffff8000001082c7:	6a 00                	pushq  $0x0
ffff8000001082c9:	fc                   	cld    
ffff8000001082ca:	50                   	push   %rax
ffff8000001082cb:	50                   	push   %rax
ffff8000001082cc:	48 8c c0             	mov    %es,%rax
ffff8000001082cf:	50                   	push   %rax
ffff8000001082d0:	48 8c d8             	mov    %ds,%rax
ffff8000001082d3:	50                   	push   %rax
ffff8000001082d4:	48 31 c0             	xor    %rax,%rax
ffff8000001082d7:	55                   	push   %rbp
ffff8000001082d8:	57                   	push   %rdi
ffff8000001082d9:	56                   	push   %rsi
ffff8000001082da:	52                   	push   %rdx
ffff8000001082db:	51                   	push   %rcx
ffff8000001082dc:	53                   	push   %rbx
ffff8000001082dd:	41 50                	push   %r8
ffff8000001082df:	41 51                	push   %r9
ffff8000001082e1:	41 52                	push   %r10
ffff8000001082e3:	41 53                	push   %r11
ffff8000001082e5:	41 54                	push   %r12
ffff8000001082e7:	41 55                	push   %r13
ffff8000001082e9:	41 56                	push   %r14
ffff8000001082eb:	41 57                	push   %r15
ffff8000001082ed:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001082f4:	48 8e da             	mov    %rdx,%ds
ffff8000001082f7:	48 8e c2             	mov    %rdx,%es
ffff8000001082fa:	48 89 e7             	mov    %rsp,%rdi
ffff8000001082fd:	48 8d 05 21 bd ff ff 	lea    -0x42df(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108304:	50                   	push   %rax
ffff800000108305:	48 c7 c6 28 00 00 00 	mov    $0x28,%rsi
ffff80000010830c:	e9 14 06 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff800000108311 <IRQ0x29_interrupt>:
ffff800000108311:	6a 00                	pushq  $0x0
ffff800000108313:	fc                   	cld    
ffff800000108314:	50                   	push   %rax
ffff800000108315:	50                   	push   %rax
ffff800000108316:	48 8c c0             	mov    %es,%rax
ffff800000108319:	50                   	push   %rax
ffff80000010831a:	48 8c d8             	mov    %ds,%rax
ffff80000010831d:	50                   	push   %rax
ffff80000010831e:	48 31 c0             	xor    %rax,%rax
ffff800000108321:	55                   	push   %rbp
ffff800000108322:	57                   	push   %rdi
ffff800000108323:	56                   	push   %rsi
ffff800000108324:	52                   	push   %rdx
ffff800000108325:	51                   	push   %rcx
ffff800000108326:	53                   	push   %rbx
ffff800000108327:	41 50                	push   %r8
ffff800000108329:	41 51                	push   %r9
ffff80000010832b:	41 52                	push   %r10
ffff80000010832d:	41 53                	push   %r11
ffff80000010832f:	41 54                	push   %r12
ffff800000108331:	41 55                	push   %r13
ffff800000108333:	41 56                	push   %r14
ffff800000108335:	41 57                	push   %r15
ffff800000108337:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010833e:	48 8e da             	mov    %rdx,%ds
ffff800000108341:	48 8e c2             	mov    %rdx,%es
ffff800000108344:	48 89 e7             	mov    %rsp,%rdi
ffff800000108347:	48 8d 05 d7 bc ff ff 	lea    -0x4329(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010834e:	50                   	push   %rax
ffff80000010834f:	48 c7 c6 29 00 00 00 	mov    $0x29,%rsi
ffff800000108356:	e9 ca 05 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff80000010835b <IRQ0x2a_interrupt>:
ffff80000010835b:	6a 00                	pushq  $0x0
ffff80000010835d:	fc                   	cld    
ffff80000010835e:	50                   	push   %rax
ffff80000010835f:	50                   	push   %rax
ffff800000108360:	48 8c c0             	mov    %es,%rax
ffff800000108363:	50                   	push   %rax
ffff800000108364:	48 8c d8             	mov    %ds,%rax
ffff800000108367:	50                   	push   %rax
ffff800000108368:	48 31 c0             	xor    %rax,%rax
ffff80000010836b:	55                   	push   %rbp
ffff80000010836c:	57                   	push   %rdi
ffff80000010836d:	56                   	push   %rsi
ffff80000010836e:	52                   	push   %rdx
ffff80000010836f:	51                   	push   %rcx
ffff800000108370:	53                   	push   %rbx
ffff800000108371:	41 50                	push   %r8
ffff800000108373:	41 51                	push   %r9
ffff800000108375:	41 52                	push   %r10
ffff800000108377:	41 53                	push   %r11
ffff800000108379:	41 54                	push   %r12
ffff80000010837b:	41 55                	push   %r13
ffff80000010837d:	41 56                	push   %r14
ffff80000010837f:	41 57                	push   %r15
ffff800000108381:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108388:	48 8e da             	mov    %rdx,%ds
ffff80000010838b:	48 8e c2             	mov    %rdx,%es
ffff80000010838e:	48 89 e7             	mov    %rsp,%rdi
ffff800000108391:	48 8d 05 8d bc ff ff 	lea    -0x4373(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108398:	50                   	push   %rax
ffff800000108399:	48 c7 c6 2a 00 00 00 	mov    $0x2a,%rsi
ffff8000001083a0:	e9 80 05 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff8000001083a5 <IRQ0x2b_interrupt>:
ffff8000001083a5:	6a 00                	pushq  $0x0
ffff8000001083a7:	fc                   	cld    
ffff8000001083a8:	50                   	push   %rax
ffff8000001083a9:	50                   	push   %rax
ffff8000001083aa:	48 8c c0             	mov    %es,%rax
ffff8000001083ad:	50                   	push   %rax
ffff8000001083ae:	48 8c d8             	mov    %ds,%rax
ffff8000001083b1:	50                   	push   %rax
ffff8000001083b2:	48 31 c0             	xor    %rax,%rax
ffff8000001083b5:	55                   	push   %rbp
ffff8000001083b6:	57                   	push   %rdi
ffff8000001083b7:	56                   	push   %rsi
ffff8000001083b8:	52                   	push   %rdx
ffff8000001083b9:	51                   	push   %rcx
ffff8000001083ba:	53                   	push   %rbx
ffff8000001083bb:	41 50                	push   %r8
ffff8000001083bd:	41 51                	push   %r9
ffff8000001083bf:	41 52                	push   %r10
ffff8000001083c1:	41 53                	push   %r11
ffff8000001083c3:	41 54                	push   %r12
ffff8000001083c5:	41 55                	push   %r13
ffff8000001083c7:	41 56                	push   %r14
ffff8000001083c9:	41 57                	push   %r15
ffff8000001083cb:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001083d2:	48 8e da             	mov    %rdx,%ds
ffff8000001083d5:	48 8e c2             	mov    %rdx,%es
ffff8000001083d8:	48 89 e7             	mov    %rsp,%rdi
ffff8000001083db:	48 8d 05 43 bc ff ff 	lea    -0x43bd(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001083e2:	50                   	push   %rax
ffff8000001083e3:	48 c7 c6 2b 00 00 00 	mov    $0x2b,%rsi
ffff8000001083ea:	e9 36 05 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff8000001083ef <IRQ0x2c_interrupt>:
ffff8000001083ef:	6a 00                	pushq  $0x0
ffff8000001083f1:	fc                   	cld    
ffff8000001083f2:	50                   	push   %rax
ffff8000001083f3:	50                   	push   %rax
ffff8000001083f4:	48 8c c0             	mov    %es,%rax
ffff8000001083f7:	50                   	push   %rax
ffff8000001083f8:	48 8c d8             	mov    %ds,%rax
ffff8000001083fb:	50                   	push   %rax
ffff8000001083fc:	48 31 c0             	xor    %rax,%rax
ffff8000001083ff:	55                   	push   %rbp
ffff800000108400:	57                   	push   %rdi
ffff800000108401:	56                   	push   %rsi
ffff800000108402:	52                   	push   %rdx
ffff800000108403:	51                   	push   %rcx
ffff800000108404:	53                   	push   %rbx
ffff800000108405:	41 50                	push   %r8
ffff800000108407:	41 51                	push   %r9
ffff800000108409:	41 52                	push   %r10
ffff80000010840b:	41 53                	push   %r11
ffff80000010840d:	41 54                	push   %r12
ffff80000010840f:	41 55                	push   %r13
ffff800000108411:	41 56                	push   %r14
ffff800000108413:	41 57                	push   %r15
ffff800000108415:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010841c:	48 8e da             	mov    %rdx,%ds
ffff80000010841f:	48 8e c2             	mov    %rdx,%es
ffff800000108422:	48 89 e7             	mov    %rsp,%rdi
ffff800000108425:	48 8d 05 f9 bb ff ff 	lea    -0x4407(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010842c:	50                   	push   %rax
ffff80000010842d:	48 c7 c6 2c 00 00 00 	mov    $0x2c,%rsi
ffff800000108434:	e9 ec 04 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff800000108439 <IRQ0x2d_interrupt>:
ffff800000108439:	6a 00                	pushq  $0x0
ffff80000010843b:	fc                   	cld    
ffff80000010843c:	50                   	push   %rax
ffff80000010843d:	50                   	push   %rax
ffff80000010843e:	48 8c c0             	mov    %es,%rax
ffff800000108441:	50                   	push   %rax
ffff800000108442:	48 8c d8             	mov    %ds,%rax
ffff800000108445:	50                   	push   %rax
ffff800000108446:	48 31 c0             	xor    %rax,%rax
ffff800000108449:	55                   	push   %rbp
ffff80000010844a:	57                   	push   %rdi
ffff80000010844b:	56                   	push   %rsi
ffff80000010844c:	52                   	push   %rdx
ffff80000010844d:	51                   	push   %rcx
ffff80000010844e:	53                   	push   %rbx
ffff80000010844f:	41 50                	push   %r8
ffff800000108451:	41 51                	push   %r9
ffff800000108453:	41 52                	push   %r10
ffff800000108455:	41 53                	push   %r11
ffff800000108457:	41 54                	push   %r12
ffff800000108459:	41 55                	push   %r13
ffff80000010845b:	41 56                	push   %r14
ffff80000010845d:	41 57                	push   %r15
ffff80000010845f:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108466:	48 8e da             	mov    %rdx,%ds
ffff800000108469:	48 8e c2             	mov    %rdx,%es
ffff80000010846c:	48 89 e7             	mov    %rsp,%rdi
ffff80000010846f:	48 8d 05 af bb ff ff 	lea    -0x4451(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108476:	50                   	push   %rax
ffff800000108477:	48 c7 c6 2d 00 00 00 	mov    $0x2d,%rsi
ffff80000010847e:	e9 a2 04 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff800000108483 <IRQ0x2e_interrupt>:
ffff800000108483:	6a 00                	pushq  $0x0
ffff800000108485:	fc                   	cld    
ffff800000108486:	50                   	push   %rax
ffff800000108487:	50                   	push   %rax
ffff800000108488:	48 8c c0             	mov    %es,%rax
ffff80000010848b:	50                   	push   %rax
ffff80000010848c:	48 8c d8             	mov    %ds,%rax
ffff80000010848f:	50                   	push   %rax
ffff800000108490:	48 31 c0             	xor    %rax,%rax
ffff800000108493:	55                   	push   %rbp
ffff800000108494:	57                   	push   %rdi
ffff800000108495:	56                   	push   %rsi
ffff800000108496:	52                   	push   %rdx
ffff800000108497:	51                   	push   %rcx
ffff800000108498:	53                   	push   %rbx
ffff800000108499:	41 50                	push   %r8
ffff80000010849b:	41 51                	push   %r9
ffff80000010849d:	41 52                	push   %r10
ffff80000010849f:	41 53                	push   %r11
ffff8000001084a1:	41 54                	push   %r12
ffff8000001084a3:	41 55                	push   %r13
ffff8000001084a5:	41 56                	push   %r14
ffff8000001084a7:	41 57                	push   %r15
ffff8000001084a9:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001084b0:	48 8e da             	mov    %rdx,%ds
ffff8000001084b3:	48 8e c2             	mov    %rdx,%es
ffff8000001084b6:	48 89 e7             	mov    %rsp,%rdi
ffff8000001084b9:	48 8d 05 65 bb ff ff 	lea    -0x449b(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001084c0:	50                   	push   %rax
ffff8000001084c1:	48 c7 c6 2e 00 00 00 	mov    $0x2e,%rsi
ffff8000001084c8:	e9 58 04 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff8000001084cd <IRQ0x2f_interrupt>:
ffff8000001084cd:	6a 00                	pushq  $0x0
ffff8000001084cf:	fc                   	cld    
ffff8000001084d0:	50                   	push   %rax
ffff8000001084d1:	50                   	push   %rax
ffff8000001084d2:	48 8c c0             	mov    %es,%rax
ffff8000001084d5:	50                   	push   %rax
ffff8000001084d6:	48 8c d8             	mov    %ds,%rax
ffff8000001084d9:	50                   	push   %rax
ffff8000001084da:	48 31 c0             	xor    %rax,%rax
ffff8000001084dd:	55                   	push   %rbp
ffff8000001084de:	57                   	push   %rdi
ffff8000001084df:	56                   	push   %rsi
ffff8000001084e0:	52                   	push   %rdx
ffff8000001084e1:	51                   	push   %rcx
ffff8000001084e2:	53                   	push   %rbx
ffff8000001084e3:	41 50                	push   %r8
ffff8000001084e5:	41 51                	push   %r9
ffff8000001084e7:	41 52                	push   %r10
ffff8000001084e9:	41 53                	push   %r11
ffff8000001084eb:	41 54                	push   %r12
ffff8000001084ed:	41 55                	push   %r13
ffff8000001084ef:	41 56                	push   %r14
ffff8000001084f1:	41 57                	push   %r15
ffff8000001084f3:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001084fa:	48 8e da             	mov    %rdx,%ds
ffff8000001084fd:	48 8e c2             	mov    %rdx,%es
ffff800000108500:	48 89 e7             	mov    %rsp,%rdi
ffff800000108503:	48 8d 05 1b bb ff ff 	lea    -0x44e5(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010850a:	50                   	push   %rax
ffff80000010850b:	48 c7 c6 2f 00 00 00 	mov    $0x2f,%rsi
ffff800000108512:	e9 0e 04 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff800000108517 <IRQ0x30_interrupt>:
ffff800000108517:	6a 00                	pushq  $0x0
ffff800000108519:	fc                   	cld    
ffff80000010851a:	50                   	push   %rax
ffff80000010851b:	50                   	push   %rax
ffff80000010851c:	48 8c c0             	mov    %es,%rax
ffff80000010851f:	50                   	push   %rax
ffff800000108520:	48 8c d8             	mov    %ds,%rax
ffff800000108523:	50                   	push   %rax
ffff800000108524:	48 31 c0             	xor    %rax,%rax
ffff800000108527:	55                   	push   %rbp
ffff800000108528:	57                   	push   %rdi
ffff800000108529:	56                   	push   %rsi
ffff80000010852a:	52                   	push   %rdx
ffff80000010852b:	51                   	push   %rcx
ffff80000010852c:	53                   	push   %rbx
ffff80000010852d:	41 50                	push   %r8
ffff80000010852f:	41 51                	push   %r9
ffff800000108531:	41 52                	push   %r10
ffff800000108533:	41 53                	push   %r11
ffff800000108535:	41 54                	push   %r12
ffff800000108537:	41 55                	push   %r13
ffff800000108539:	41 56                	push   %r14
ffff80000010853b:	41 57                	push   %r15
ffff80000010853d:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108544:	48 8e da             	mov    %rdx,%ds
ffff800000108547:	48 8e c2             	mov    %rdx,%es
ffff80000010854a:	48 89 e7             	mov    %rsp,%rdi
ffff80000010854d:	48 8d 05 d1 ba ff ff 	lea    -0x452f(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108554:	50                   	push   %rax
ffff800000108555:	48 c7 c6 30 00 00 00 	mov    $0x30,%rsi
ffff80000010855c:	e9 c4 03 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff800000108561 <IRQ0x31_interrupt>:
ffff800000108561:	6a 00                	pushq  $0x0
ffff800000108563:	fc                   	cld    
ffff800000108564:	50                   	push   %rax
ffff800000108565:	50                   	push   %rax
ffff800000108566:	48 8c c0             	mov    %es,%rax
ffff800000108569:	50                   	push   %rax
ffff80000010856a:	48 8c d8             	mov    %ds,%rax
ffff80000010856d:	50                   	push   %rax
ffff80000010856e:	48 31 c0             	xor    %rax,%rax
ffff800000108571:	55                   	push   %rbp
ffff800000108572:	57                   	push   %rdi
ffff800000108573:	56                   	push   %rsi
ffff800000108574:	52                   	push   %rdx
ffff800000108575:	51                   	push   %rcx
ffff800000108576:	53                   	push   %rbx
ffff800000108577:	41 50                	push   %r8
ffff800000108579:	41 51                	push   %r9
ffff80000010857b:	41 52                	push   %r10
ffff80000010857d:	41 53                	push   %r11
ffff80000010857f:	41 54                	push   %r12
ffff800000108581:	41 55                	push   %r13
ffff800000108583:	41 56                	push   %r14
ffff800000108585:	41 57                	push   %r15
ffff800000108587:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010858e:	48 8e da             	mov    %rdx,%ds
ffff800000108591:	48 8e c2             	mov    %rdx,%es
ffff800000108594:	48 89 e7             	mov    %rsp,%rdi
ffff800000108597:	48 8d 05 87 ba ff ff 	lea    -0x4579(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010859e:	50                   	push   %rax
ffff80000010859f:	48 c7 c6 31 00 00 00 	mov    $0x31,%rsi
ffff8000001085a6:	e9 7a 03 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff8000001085ab <IRQ0x32_interrupt>:
ffff8000001085ab:	6a 00                	pushq  $0x0
ffff8000001085ad:	fc                   	cld    
ffff8000001085ae:	50                   	push   %rax
ffff8000001085af:	50                   	push   %rax
ffff8000001085b0:	48 8c c0             	mov    %es,%rax
ffff8000001085b3:	50                   	push   %rax
ffff8000001085b4:	48 8c d8             	mov    %ds,%rax
ffff8000001085b7:	50                   	push   %rax
ffff8000001085b8:	48 31 c0             	xor    %rax,%rax
ffff8000001085bb:	55                   	push   %rbp
ffff8000001085bc:	57                   	push   %rdi
ffff8000001085bd:	56                   	push   %rsi
ffff8000001085be:	52                   	push   %rdx
ffff8000001085bf:	51                   	push   %rcx
ffff8000001085c0:	53                   	push   %rbx
ffff8000001085c1:	41 50                	push   %r8
ffff8000001085c3:	41 51                	push   %r9
ffff8000001085c5:	41 52                	push   %r10
ffff8000001085c7:	41 53                	push   %r11
ffff8000001085c9:	41 54                	push   %r12
ffff8000001085cb:	41 55                	push   %r13
ffff8000001085cd:	41 56                	push   %r14
ffff8000001085cf:	41 57                	push   %r15
ffff8000001085d1:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001085d8:	48 8e da             	mov    %rdx,%ds
ffff8000001085db:	48 8e c2             	mov    %rdx,%es
ffff8000001085de:	48 89 e7             	mov    %rsp,%rdi
ffff8000001085e1:	48 8d 05 3d ba ff ff 	lea    -0x45c3(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001085e8:	50                   	push   %rax
ffff8000001085e9:	48 c7 c6 32 00 00 00 	mov    $0x32,%rsi
ffff8000001085f0:	e9 30 03 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff8000001085f5 <IRQ0x33_interrupt>:
ffff8000001085f5:	6a 00                	pushq  $0x0
ffff8000001085f7:	fc                   	cld    
ffff8000001085f8:	50                   	push   %rax
ffff8000001085f9:	50                   	push   %rax
ffff8000001085fa:	48 8c c0             	mov    %es,%rax
ffff8000001085fd:	50                   	push   %rax
ffff8000001085fe:	48 8c d8             	mov    %ds,%rax
ffff800000108601:	50                   	push   %rax
ffff800000108602:	48 31 c0             	xor    %rax,%rax
ffff800000108605:	55                   	push   %rbp
ffff800000108606:	57                   	push   %rdi
ffff800000108607:	56                   	push   %rsi
ffff800000108608:	52                   	push   %rdx
ffff800000108609:	51                   	push   %rcx
ffff80000010860a:	53                   	push   %rbx
ffff80000010860b:	41 50                	push   %r8
ffff80000010860d:	41 51                	push   %r9
ffff80000010860f:	41 52                	push   %r10
ffff800000108611:	41 53                	push   %r11
ffff800000108613:	41 54                	push   %r12
ffff800000108615:	41 55                	push   %r13
ffff800000108617:	41 56                	push   %r14
ffff800000108619:	41 57                	push   %r15
ffff80000010861b:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108622:	48 8e da             	mov    %rdx,%ds
ffff800000108625:	48 8e c2             	mov    %rdx,%es
ffff800000108628:	48 89 e7             	mov    %rsp,%rdi
ffff80000010862b:	48 8d 05 f3 b9 ff ff 	lea    -0x460d(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108632:	50                   	push   %rax
ffff800000108633:	48 c7 c6 33 00 00 00 	mov    $0x33,%rsi
ffff80000010863a:	e9 e6 02 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff80000010863f <IRQ0x34_interrupt>:
ffff80000010863f:	6a 00                	pushq  $0x0
ffff800000108641:	fc                   	cld    
ffff800000108642:	50                   	push   %rax
ffff800000108643:	50                   	push   %rax
ffff800000108644:	48 8c c0             	mov    %es,%rax
ffff800000108647:	50                   	push   %rax
ffff800000108648:	48 8c d8             	mov    %ds,%rax
ffff80000010864b:	50                   	push   %rax
ffff80000010864c:	48 31 c0             	xor    %rax,%rax
ffff80000010864f:	55                   	push   %rbp
ffff800000108650:	57                   	push   %rdi
ffff800000108651:	56                   	push   %rsi
ffff800000108652:	52                   	push   %rdx
ffff800000108653:	51                   	push   %rcx
ffff800000108654:	53                   	push   %rbx
ffff800000108655:	41 50                	push   %r8
ffff800000108657:	41 51                	push   %r9
ffff800000108659:	41 52                	push   %r10
ffff80000010865b:	41 53                	push   %r11
ffff80000010865d:	41 54                	push   %r12
ffff80000010865f:	41 55                	push   %r13
ffff800000108661:	41 56                	push   %r14
ffff800000108663:	41 57                	push   %r15
ffff800000108665:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010866c:	48 8e da             	mov    %rdx,%ds
ffff80000010866f:	48 8e c2             	mov    %rdx,%es
ffff800000108672:	48 89 e7             	mov    %rsp,%rdi
ffff800000108675:	48 8d 05 a9 b9 ff ff 	lea    -0x4657(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010867c:	50                   	push   %rax
ffff80000010867d:	48 c7 c6 34 00 00 00 	mov    $0x34,%rsi
ffff800000108684:	e9 9c 02 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff800000108689 <IRQ0x35_interrupt>:
ffff800000108689:	6a 00                	pushq  $0x0
ffff80000010868b:	fc                   	cld    
ffff80000010868c:	50                   	push   %rax
ffff80000010868d:	50                   	push   %rax
ffff80000010868e:	48 8c c0             	mov    %es,%rax
ffff800000108691:	50                   	push   %rax
ffff800000108692:	48 8c d8             	mov    %ds,%rax
ffff800000108695:	50                   	push   %rax
ffff800000108696:	48 31 c0             	xor    %rax,%rax
ffff800000108699:	55                   	push   %rbp
ffff80000010869a:	57                   	push   %rdi
ffff80000010869b:	56                   	push   %rsi
ffff80000010869c:	52                   	push   %rdx
ffff80000010869d:	51                   	push   %rcx
ffff80000010869e:	53                   	push   %rbx
ffff80000010869f:	41 50                	push   %r8
ffff8000001086a1:	41 51                	push   %r9
ffff8000001086a3:	41 52                	push   %r10
ffff8000001086a5:	41 53                	push   %r11
ffff8000001086a7:	41 54                	push   %r12
ffff8000001086a9:	41 55                	push   %r13
ffff8000001086ab:	41 56                	push   %r14
ffff8000001086ad:	41 57                	push   %r15
ffff8000001086af:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001086b6:	48 8e da             	mov    %rdx,%ds
ffff8000001086b9:	48 8e c2             	mov    %rdx,%es
ffff8000001086bc:	48 89 e7             	mov    %rsp,%rdi
ffff8000001086bf:	48 8d 05 5f b9 ff ff 	lea    -0x46a1(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001086c6:	50                   	push   %rax
ffff8000001086c7:	48 c7 c6 35 00 00 00 	mov    $0x35,%rsi
ffff8000001086ce:	e9 52 02 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff8000001086d3 <IRQ0x36_interrupt>:
ffff8000001086d3:	6a 00                	pushq  $0x0
ffff8000001086d5:	fc                   	cld    
ffff8000001086d6:	50                   	push   %rax
ffff8000001086d7:	50                   	push   %rax
ffff8000001086d8:	48 8c c0             	mov    %es,%rax
ffff8000001086db:	50                   	push   %rax
ffff8000001086dc:	48 8c d8             	mov    %ds,%rax
ffff8000001086df:	50                   	push   %rax
ffff8000001086e0:	48 31 c0             	xor    %rax,%rax
ffff8000001086e3:	55                   	push   %rbp
ffff8000001086e4:	57                   	push   %rdi
ffff8000001086e5:	56                   	push   %rsi
ffff8000001086e6:	52                   	push   %rdx
ffff8000001086e7:	51                   	push   %rcx
ffff8000001086e8:	53                   	push   %rbx
ffff8000001086e9:	41 50                	push   %r8
ffff8000001086eb:	41 51                	push   %r9
ffff8000001086ed:	41 52                	push   %r10
ffff8000001086ef:	41 53                	push   %r11
ffff8000001086f1:	41 54                	push   %r12
ffff8000001086f3:	41 55                	push   %r13
ffff8000001086f5:	41 56                	push   %r14
ffff8000001086f7:	41 57                	push   %r15
ffff8000001086f9:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108700:	48 8e da             	mov    %rdx,%ds
ffff800000108703:	48 8e c2             	mov    %rdx,%es
ffff800000108706:	48 89 e7             	mov    %rsp,%rdi
ffff800000108709:	48 8d 05 15 b9 ff ff 	lea    -0x46eb(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108710:	50                   	push   %rax
ffff800000108711:	48 c7 c6 36 00 00 00 	mov    $0x36,%rsi
ffff800000108718:	e9 08 02 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff80000010871d <IRQ0x37_interrupt>:
ffff80000010871d:	6a 00                	pushq  $0x0
ffff80000010871f:	fc                   	cld    
ffff800000108720:	50                   	push   %rax
ffff800000108721:	50                   	push   %rax
ffff800000108722:	48 8c c0             	mov    %es,%rax
ffff800000108725:	50                   	push   %rax
ffff800000108726:	48 8c d8             	mov    %ds,%rax
ffff800000108729:	50                   	push   %rax
ffff80000010872a:	48 31 c0             	xor    %rax,%rax
ffff80000010872d:	55                   	push   %rbp
ffff80000010872e:	57                   	push   %rdi
ffff80000010872f:	56                   	push   %rsi
ffff800000108730:	52                   	push   %rdx
ffff800000108731:	51                   	push   %rcx
ffff800000108732:	53                   	push   %rbx
ffff800000108733:	41 50                	push   %r8
ffff800000108735:	41 51                	push   %r9
ffff800000108737:	41 52                	push   %r10
ffff800000108739:	41 53                	push   %r11
ffff80000010873b:	41 54                	push   %r12
ffff80000010873d:	41 55                	push   %r13
ffff80000010873f:	41 56                	push   %r14
ffff800000108741:	41 57                	push   %r15
ffff800000108743:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010874a:	48 8e da             	mov    %rdx,%ds
ffff80000010874d:	48 8e c2             	mov    %rdx,%es
ffff800000108750:	48 89 e7             	mov    %rsp,%rdi
ffff800000108753:	48 8d 05 cb b8 ff ff 	lea    -0x4735(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010875a:	50                   	push   %rax
ffff80000010875b:	48 c7 c6 37 00 00 00 	mov    $0x37,%rsi
ffff800000108762:	e9 be 01 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff800000108767 <init_interrupt>:
ffff800000108767:	55                   	push   %rbp
ffff800000108768:	48 89 e5             	mov    %rsp,%rbp
ffff80000010876b:	41 57                	push   %r15
ffff80000010876d:	53                   	push   %rbx
ffff80000010876e:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108772:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000108772 <init_interrupt+0xb>
ffff800000108779:	49 bb b6 41 00 00 00 	movabs $0x41b6,%r11
ffff800000108780:	00 00 00 
ffff800000108783:	4c 01 db             	add    %r11,%rbx
ffff800000108786:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%rbp)
ffff80000010878d:	eb 3e                	jmp    ffff8000001087cd <init_interrupt+0x66>
ffff80000010878f:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000108792:	83 e8 20             	sub    $0x20,%eax
ffff800000108795:	48 ba 98 0f 00 00 00 	movabs $0xf98,%rdx
ffff80000010879c:	00 00 00 
ffff80000010879f:	48 98                	cltq   
ffff8000001087a1:	48 01 da             	add    %rbx,%rdx
ffff8000001087a4:	48 8b 14 c2          	mov    (%rdx,%rax,8),%rdx
ffff8000001087a8:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff8000001087ab:	be 02 00 00 00       	mov    $0x2,%esi
ffff8000001087b0:	89 c7                	mov    %eax,%edi
ffff8000001087b2:	49 89 df             	mov    %rbx,%r15
ffff8000001087b5:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001087ba:	48 b9 f9 79 ff ff ff 	movabs $0xffffffffffff79f9,%rcx
ffff8000001087c1:	ff ff ff 
ffff8000001087c4:	48 01 d9             	add    %rbx,%rcx
ffff8000001087c7:	ff d1                	callq  *%rcx
ffff8000001087c9:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
ffff8000001087cd:	83 7d ec 37          	cmpl   $0x37,-0x14(%rbp)
ffff8000001087d1:	7e bc                	jle    ffff80000010878f <init_interrupt+0x28>
ffff8000001087d3:	48 b8 cf 18 00 00 00 	movabs $0x18cf,%rax
ffff8000001087da:	00 00 00 
ffff8000001087dd:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff8000001087e1:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001087e6:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001087eb:	49 89 df             	mov    %rbx,%r15
ffff8000001087ee:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001087f3:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff8000001087fa:	ff ff ff 
ffff8000001087fd:	48 01 d9             	add    %rbx,%rcx
ffff800000108800:	ff d1                	callq  *%rcx
ffff800000108802:	be 11 00 00 00       	mov    $0x11,%esi
ffff800000108807:	bf 20 00 00 00       	mov    $0x20,%edi
ffff80000010880c:	49 89 df             	mov    %rbx,%r15
ffff80000010880f:	48 b8 05 b5 ff ff ff 	movabs $0xffffffffffffb505,%rax
ffff800000108816:	ff ff ff 
ffff800000108819:	48 01 d8             	add    %rbx,%rax
ffff80000010881c:	ff d0                	callq  *%rax
ffff80000010881e:	be 20 00 00 00       	mov    $0x20,%esi
ffff800000108823:	bf 21 00 00 00       	mov    $0x21,%edi
ffff800000108828:	49 89 df             	mov    %rbx,%r15
ffff80000010882b:	48 b8 05 b5 ff ff ff 	movabs $0xffffffffffffb505,%rax
ffff800000108832:	ff ff ff 
ffff800000108835:	48 01 d8             	add    %rbx,%rax
ffff800000108838:	ff d0                	callq  *%rax
ffff80000010883a:	be 04 00 00 00       	mov    $0x4,%esi
ffff80000010883f:	bf 21 00 00 00       	mov    $0x21,%edi
ffff800000108844:	49 89 df             	mov    %rbx,%r15
ffff800000108847:	48 b8 05 b5 ff ff ff 	movabs $0xffffffffffffb505,%rax
ffff80000010884e:	ff ff ff 
ffff800000108851:	48 01 d8             	add    %rbx,%rax
ffff800000108854:	ff d0                	callq  *%rax
ffff800000108856:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010885b:	bf 21 00 00 00       	mov    $0x21,%edi
ffff800000108860:	49 89 df             	mov    %rbx,%r15
ffff800000108863:	48 b8 05 b5 ff ff ff 	movabs $0xffffffffffffb505,%rax
ffff80000010886a:	ff ff ff 
ffff80000010886d:	48 01 d8             	add    %rbx,%rax
ffff800000108870:	ff d0                	callq  *%rax
ffff800000108872:	be 11 00 00 00       	mov    $0x11,%esi
ffff800000108877:	bf a0 00 00 00       	mov    $0xa0,%edi
ffff80000010887c:	49 89 df             	mov    %rbx,%r15
ffff80000010887f:	48 b8 05 b5 ff ff ff 	movabs $0xffffffffffffb505,%rax
ffff800000108886:	ff ff ff 
ffff800000108889:	48 01 d8             	add    %rbx,%rax
ffff80000010888c:	ff d0                	callq  *%rax
ffff80000010888e:	be 28 00 00 00       	mov    $0x28,%esi
ffff800000108893:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff800000108898:	49 89 df             	mov    %rbx,%r15
ffff80000010889b:	48 b8 05 b5 ff ff ff 	movabs $0xffffffffffffb505,%rax
ffff8000001088a2:	ff ff ff 
ffff8000001088a5:	48 01 d8             	add    %rbx,%rax
ffff8000001088a8:	ff d0                	callq  *%rax
ffff8000001088aa:	be 02 00 00 00       	mov    $0x2,%esi
ffff8000001088af:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff8000001088b4:	49 89 df             	mov    %rbx,%r15
ffff8000001088b7:	48 b8 05 b5 ff ff ff 	movabs $0xffffffffffffb505,%rax
ffff8000001088be:	ff ff ff 
ffff8000001088c1:	48 01 d8             	add    %rbx,%rax
ffff8000001088c4:	ff d0                	callq  *%rax
ffff8000001088c6:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001088cb:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff8000001088d0:	49 89 df             	mov    %rbx,%r15
ffff8000001088d3:	48 b8 05 b5 ff ff ff 	movabs $0xffffffffffffb505,%rax
ffff8000001088da:	ff ff ff 
ffff8000001088dd:	48 01 d8             	add    %rbx,%rax
ffff8000001088e0:	ff d0                	callq  *%rax
ffff8000001088e2:	be fd 00 00 00       	mov    $0xfd,%esi
ffff8000001088e7:	bf 21 00 00 00       	mov    $0x21,%edi
ffff8000001088ec:	49 89 df             	mov    %rbx,%r15
ffff8000001088ef:	48 b8 05 b5 ff ff ff 	movabs $0xffffffffffffb505,%rax
ffff8000001088f6:	ff ff ff 
ffff8000001088f9:	48 01 d8             	add    %rbx,%rax
ffff8000001088fc:	ff d0                	callq  *%rax
ffff8000001088fe:	be ff 00 00 00       	mov    $0xff,%esi
ffff800000108903:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff800000108908:	49 89 df             	mov    %rbx,%r15
ffff80000010890b:	48 b8 05 b5 ff ff ff 	movabs $0xffffffffffffb505,%rax
ffff800000108912:	ff ff ff 
ffff800000108915:	48 01 d8             	add    %rbx,%rax
ffff800000108918:	ff d0                	callq  *%rax
ffff80000010891a:	fb                   	sti    
ffff80000010891b:	90                   	nop
ffff80000010891c:	48 83 c4 10          	add    $0x10,%rsp
ffff800000108920:	5b                   	pop    %rbx
ffff800000108921:	41 5f                	pop    %r15
ffff800000108923:	5d                   	pop    %rbp
ffff800000108924:	c3                   	retq   

ffff800000108925 <do_IRQ>:
ffff800000108925:	55                   	push   %rbp
ffff800000108926:	48 89 e5             	mov    %rsp,%rbp
ffff800000108929:	41 57                	push   %r15
ffff80000010892b:	53                   	push   %rbx
ffff80000010892c:	48 83 ec 20          	sub    $0x20,%rsp
ffff800000108930:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000108930 <do_IRQ+0xb>
ffff800000108937:	49 bb f8 3f 00 00 00 	movabs $0x3ff8,%r11
ffff80000010893e:	00 00 00 
ffff800000108941:	4c 01 db             	add    %r11,%rbx
ffff800000108944:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000108948:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
ffff80000010894c:	bf 60 00 00 00       	mov    $0x60,%edi
ffff800000108951:	49 89 df             	mov    %rbx,%r15
ffff800000108954:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108959:	48 ba 37 b5 ff ff ff 	movabs $0xffffffffffffb537,%rdx
ffff800000108960:	ff ff ff 
ffff800000108963:	48 01 da             	add    %rbx,%rdx
ffff800000108966:	ff d2                	callq  *%rdx
ffff800000108968:	88 45 ef             	mov    %al,-0x11(%rbp)
ffff80000010896b:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
ffff80000010896f:	89 c1                	mov    %eax,%ecx
ffff800000108971:	48 b8 dc 18 00 00 00 	movabs $0x18dc,%rax
ffff800000108978:	00 00 00 
ffff80000010897b:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff80000010897f:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108984:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108989:	49 89 df             	mov    %rbx,%r15
ffff80000010898c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108991:	49 b8 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r8
ffff800000108998:	ff ff ff 
ffff80000010899b:	49 01 d8             	add    %rbx,%r8
ffff80000010899e:	41 ff d0             	callq  *%r8
ffff8000001089a1:	be 20 00 00 00       	mov    $0x20,%esi
ffff8000001089a6:	bf 20 00 00 00       	mov    $0x20,%edi
ffff8000001089ab:	49 89 df             	mov    %rbx,%r15
ffff8000001089ae:	48 b8 05 b5 ff ff ff 	movabs $0xffffffffffffb505,%rax
ffff8000001089b5:	ff ff ff 
ffff8000001089b8:	48 01 d8             	add    %rbx,%rax
ffff8000001089bb:	ff d0                	callq  *%rax
ffff8000001089bd:	90                   	nop
ffff8000001089be:	48 83 c4 20          	add    $0x20,%rsp
ffff8000001089c2:	5b                   	pop    %rbx
ffff8000001089c3:	41 5f                	pop    %r15
ffff8000001089c5:	5d                   	pop    %rbp
ffff8000001089c6:	c3                   	retq   
ffff8000001089c7:	55                   	push   %rbp
ffff8000001089c8:	48 89 e5             	mov    %rsp,%rbp
ffff8000001089cb:	53                   	push   %rbx
ffff8000001089cc:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff8000001089cc <do_IRQ+0xa7>
ffff8000001089d3:	49 bb 5c 3f 00 00 00 	movabs $0x3f5c,%r11
ffff8000001089da:	00 00 00 
ffff8000001089dd:	4c 01 d8             	add    %r11,%rax
ffff8000001089e0:	89 7d f4             	mov    %edi,-0xc(%rbp)
ffff8000001089e3:	89 75 f0             	mov    %esi,-0x10(%rbp)
ffff8000001089e6:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff8000001089ea:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
ffff8000001089ee:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
ffff8000001089f2:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
ffff8000001089f6:	8b 45 f4             	mov    -0xc(%rbp),%eax
ffff8000001089f9:	8b 55 f0             	mov    -0x10(%rbp),%edx
ffff8000001089fc:	89 d1                	mov    %edx,%ecx
ffff8000001089fe:	0f a2                	cpuid  
ffff800000108a00:	89 de                	mov    %ebx,%esi
ffff800000108a02:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
ffff800000108a06:	89 07                	mov    %eax,(%rdi)
ffff800000108a08:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000108a0c:	89 30                	mov    %esi,(%rax)
ffff800000108a0e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108a12:	89 08                	mov    %ecx,(%rax)
ffff800000108a14:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000108a18:	89 10                	mov    %edx,(%rax)
ffff800000108a1a:	90                   	nop
ffff800000108a1b:	5b                   	pop    %rbx
ffff800000108a1c:	5d                   	pop    %rbp
ffff800000108a1d:	c3                   	retq   
ffff800000108a1e:	55                   	push   %rbp
ffff800000108a1f:	48 89 e5             	mov    %rsp,%rbp
ffff800000108a22:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108a22 <do_IRQ+0xfd>
ffff800000108a29:	49 bb 06 3f 00 00 00 	movabs $0x3f06,%r11
ffff800000108a30:	00 00 00 
ffff800000108a33:	4c 01 d8             	add    %r11,%rax
ffff800000108a36:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
ffff800000108a3d:	00 
ffff800000108a3e:	48 c7 c0 00 80 ff ff 	mov    $0xffffffffffff8000,%rax
ffff800000108a45:	48 21 e0             	and    %rsp,%rax
ffff800000108a48:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108a4c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108a50:	5d                   	pop    %rbp
ffff800000108a51:	c3                   	retq   
ffff800000108a52:	55                   	push   %rbp
ffff800000108a53:	48 89 e5             	mov    %rsp,%rbp
ffff800000108a56:	41 57                	push   %r15
ffff800000108a58:	48 83 ec 18          	sub    $0x18,%rsp
ffff800000108a5c:	4c 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%r8        # ffff800000108a5c <do_IRQ+0x137>
ffff800000108a63:	49 bb cc 3e 00 00 00 	movabs $0x3ecc,%r11
ffff800000108a6a:	00 00 00 
ffff800000108a6d:	4d 01 d8             	add    %r11,%r8
ffff800000108a70:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000108a74:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108a78:	48 8b 80 80 00 00 00 	mov    0x80(%rax),%rax
ffff800000108a7f:	48 89 c1             	mov    %rax,%rcx
ffff800000108a82:	48 b8 e8 18 00 00 00 	movabs $0x18e8,%rax
ffff800000108a89:	00 00 00 
ffff800000108a8c:	49 8d 14 00          	lea    (%r8,%rax,1),%rdx
ffff800000108a90:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108a95:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108a9a:	4d 89 c7             	mov    %r8,%r15
ffff800000108a9d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108aa2:	49 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r9
ffff800000108aa9:	ff ff ff 
ffff800000108aac:	4d 01 c1             	add    %r8,%r9
ffff800000108aaf:	41 ff d1             	callq  *%r9
ffff800000108ab2:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffff800000108ab9:	48 83 c4 18          	add    $0x18,%rsp
ffff800000108abd:	41 5f                	pop    %r15
ffff800000108abf:	5d                   	pop    %rbp
ffff800000108ac0:	c3                   	retq   
ffff800000108ac1:	55                   	push   %rbp
ffff800000108ac2:	48 89 e5             	mov    %rsp,%rbp
ffff800000108ac5:	41 57                	push   %r15
ffff800000108ac7:	48 83 ec 18          	sub    $0x18,%rsp
ffff800000108acb:	48 8d 0d f9 ff ff ff 	lea    -0x7(%rip),%rcx        # ffff800000108acb <do_IRQ+0x1a6>
ffff800000108ad2:	49 bb 5d 3e 00 00 00 	movabs $0x3e5d,%r11
ffff800000108ad9:	00 00 00 
ffff800000108adc:	4c 01 d9             	add    %r11,%rcx
ffff800000108adf:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000108ae3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108ae7:	48 8b 40 60          	mov    0x60(%rax),%rax
ffff800000108aeb:	48 89 c2             	mov    %rax,%rdx
ffff800000108aee:	be ff ff ff 00       	mov    $0xffffff,%esi
ffff800000108af3:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000108af8:	49 89 cf             	mov    %rcx,%r15
ffff800000108afb:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108b00:	49 b8 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r8
ffff800000108b07:	ff ff ff 
ffff800000108b0a:	49 01 c8             	add    %rcx,%r8
ffff800000108b0d:	41 ff d0             	callq  *%r8
ffff800000108b10:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000108b15:	48 83 c4 18          	add    $0x18,%rsp
ffff800000108b19:	41 5f                	pop    %r15
ffff800000108b1b:	5d                   	pop    %rbp
ffff800000108b1c:	c3                   	retq   
ffff800000108b1d:	55                   	push   %rbp
ffff800000108b1e:	48 89 e5             	mov    %rsp,%rbp
ffff800000108b21:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108b21 <do_IRQ+0x1fc>
ffff800000108b28:	49 bb 07 3e 00 00 00 	movabs $0x3e07,%r11
ffff800000108b2f:	00 00 00 
ffff800000108b32:	4c 01 d8             	add    %r11,%rax
ffff800000108b35:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
ffff800000108b39:	89 f9                	mov    %edi,%ecx
ffff800000108b3b:	88 4d ec             	mov    %cl,-0x14(%rbp)
ffff800000108b3e:	89 f1                	mov    %esi,%ecx
ffff800000108b40:	88 4d e8             	mov    %cl,-0x18(%rbp)
ffff800000108b43:	88 55 e4             	mov    %dl,-0x1c(%rbp)
ffff800000108b46:	0f b6 55 ec          	movzbl -0x14(%rbp),%edx
ffff800000108b4a:	48 63 d2             	movslq %edx,%rdx
ffff800000108b4d:	48 89 d1             	mov    %rdx,%rcx
ffff800000108b50:	48 c1 e1 04          	shl    $0x4,%rcx
ffff800000108b54:	48 ba 10 ff ff ff ff 	movabs $0xffffffffffffff10,%rdx
ffff800000108b5b:	ff ff ff 
ffff800000108b5e:	48 8b 04 10          	mov    (%rax,%rdx,1),%rax
ffff800000108b62:	48 01 c8             	add    %rcx,%rax
ffff800000108b65:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108b69:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108b6d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff800000108b71:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108b75:	89 c2                	mov    %eax,%edx
ffff800000108b77:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108b7b:	66 89 10             	mov    %dx,(%rax)
ffff800000108b7e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108b82:	66 c7 40 02 08 00    	movw   $0x8,0x2(%rax)
ffff800000108b88:	0f b6 45 e4          	movzbl -0x1c(%rbp),%eax
ffff800000108b8c:	c1 e0 08             	shl    $0x8,%eax
ffff800000108b8f:	89 c2                	mov    %eax,%edx
ffff800000108b91:	0f b6 45 e8          	movzbl -0x18(%rbp),%eax
ffff800000108b95:	09 d0                	or     %edx,%eax
ffff800000108b97:	89 c2                	mov    %eax,%edx
ffff800000108b99:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108b9d:	66 89 50 04          	mov    %dx,0x4(%rax)
ffff800000108ba1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108ba5:	48 c1 e8 10          	shr    $0x10,%rax
ffff800000108ba9:	89 c2                	mov    %eax,%edx
ffff800000108bab:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108baf:	66 89 50 06          	mov    %dx,0x6(%rax)
ffff800000108bb3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108bb7:	48 c1 e8 20          	shr    $0x20,%rax
ffff800000108bbb:	89 c2                	mov    %eax,%edx
ffff800000108bbd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108bc1:	89 50 08             	mov    %edx,0x8(%rax)
ffff800000108bc4:	90                   	nop
ffff800000108bc5:	5d                   	pop    %rbp
ffff800000108bc6:	c3                   	retq   
ffff800000108bc7:	55                   	push   %rbp
ffff800000108bc8:	48 89 e5             	mov    %rsp,%rbp
ffff800000108bcb:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108bcf:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108bcf <do_IRQ+0x2aa>
ffff800000108bd6:	49 bb 59 3d 00 00 00 	movabs $0x3d59,%r11
ffff800000108bdd:	00 00 00 
ffff800000108be0:	4c 01 d8             	add    %r11,%rax
ffff800000108be3:	89 f1                	mov    %esi,%ecx
ffff800000108be5:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff800000108be9:	89 fa                	mov    %edi,%edx
ffff800000108beb:	88 55 fc             	mov    %dl,-0x4(%rbp)
ffff800000108bee:	89 ca                	mov    %ecx,%edx
ffff800000108bf0:	88 55 f8             	mov    %dl,-0x8(%rbp)
ffff800000108bf3:	0f b6 75 f8          	movzbl -0x8(%rbp),%esi
ffff800000108bf7:	0f b6 7d fc          	movzbl -0x4(%rbp),%edi
ffff800000108bfb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000108bff:	48 89 d1             	mov    %rdx,%rcx
ffff800000108c02:	ba 8e 00 00 00       	mov    $0x8e,%edx
ffff800000108c07:	49 b8 4f 79 ff ff ff 	movabs $0xffffffffffff794f,%r8
ffff800000108c0e:	ff ff ff 
ffff800000108c11:	4a 8d 04 00          	lea    (%rax,%r8,1),%rax
ffff800000108c15:	ff d0                	callq  *%rax
ffff800000108c17:	90                   	nop
ffff800000108c18:	c9                   	leaveq 
ffff800000108c19:	c3                   	retq   
ffff800000108c1a:	55                   	push   %rbp
ffff800000108c1b:	48 89 e5             	mov    %rsp,%rbp
ffff800000108c1e:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108c22:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108c22 <do_IRQ+0x2fd>
ffff800000108c29:	49 bb 06 3d 00 00 00 	movabs $0x3d06,%r11
ffff800000108c30:	00 00 00 
ffff800000108c33:	4c 01 d8             	add    %r11,%rax
ffff800000108c36:	89 f1                	mov    %esi,%ecx
ffff800000108c38:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff800000108c3c:	89 fa                	mov    %edi,%edx
ffff800000108c3e:	88 55 fc             	mov    %dl,-0x4(%rbp)
ffff800000108c41:	89 ca                	mov    %ecx,%edx
ffff800000108c43:	88 55 f8             	mov    %dl,-0x8(%rbp)
ffff800000108c46:	0f b6 75 f8          	movzbl -0x8(%rbp),%esi
ffff800000108c4a:	0f b6 7d fc          	movzbl -0x4(%rbp),%edi
ffff800000108c4e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000108c52:	48 89 d1             	mov    %rdx,%rcx
ffff800000108c55:	ba 8f 00 00 00       	mov    $0x8f,%edx
ffff800000108c5a:	49 b8 4f 79 ff ff ff 	movabs $0xffffffffffff794f,%r8
ffff800000108c61:	ff ff ff 
ffff800000108c64:	4a 8d 04 00          	lea    (%rax,%r8,1),%rax
ffff800000108c68:	ff d0                	callq  *%rax
ffff800000108c6a:	90                   	nop
ffff800000108c6b:	c9                   	leaveq 
ffff800000108c6c:	c3                   	retq   
ffff800000108c6d:	55                   	push   %rbp
ffff800000108c6e:	48 89 e5             	mov    %rsp,%rbp
ffff800000108c71:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108c75:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108c75 <do_IRQ+0x350>
ffff800000108c7c:	49 bb b3 3c 00 00 00 	movabs $0x3cb3,%r11
ffff800000108c83:	00 00 00 
ffff800000108c86:	4c 01 d8             	add    %r11,%rax
ffff800000108c89:	89 f1                	mov    %esi,%ecx
ffff800000108c8b:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff800000108c8f:	89 fa                	mov    %edi,%edx
ffff800000108c91:	88 55 fc             	mov    %dl,-0x4(%rbp)
ffff800000108c94:	89 ca                	mov    %ecx,%edx
ffff800000108c96:	88 55 f8             	mov    %dl,-0x8(%rbp)
ffff800000108c99:	0f b6 75 f8          	movzbl -0x8(%rbp),%esi
ffff800000108c9d:	0f b6 7d fc          	movzbl -0x4(%rbp),%edi
ffff800000108ca1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000108ca5:	48 89 d1             	mov    %rdx,%rcx
ffff800000108ca8:	ba ef 00 00 00       	mov    $0xef,%edx
ffff800000108cad:	49 b8 4f 79 ff ff ff 	movabs $0xffffffffffff794f,%r8
ffff800000108cb4:	ff ff ff 
ffff800000108cb7:	4a 8d 04 00          	lea    (%rax,%r8,1),%rax
ffff800000108cbb:	ff d0                	callq  *%rax
ffff800000108cbd:	90                   	nop
ffff800000108cbe:	c9                   	leaveq 
ffff800000108cbf:	c3                   	retq   
ffff800000108cc0:	55                   	push   %rbp
ffff800000108cc1:	48 89 e5             	mov    %rsp,%rbp
ffff800000108cc4:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108cc8:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108cc8 <do_IRQ+0x3a3>
ffff800000108ccf:	49 bb 60 3c 00 00 00 	movabs $0x3c60,%r11
ffff800000108cd6:	00 00 00 
ffff800000108cd9:	4c 01 d8             	add    %r11,%rax
ffff800000108cdc:	89 f1                	mov    %esi,%ecx
ffff800000108cde:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff800000108ce2:	89 fa                	mov    %edi,%edx
ffff800000108ce4:	88 55 fc             	mov    %dl,-0x4(%rbp)
ffff800000108ce7:	89 ca                	mov    %ecx,%edx
ffff800000108ce9:	88 55 f8             	mov    %dl,-0x8(%rbp)
ffff800000108cec:	0f b6 75 f8          	movzbl -0x8(%rbp),%esi
ffff800000108cf0:	0f b6 7d fc          	movzbl -0x4(%rbp),%edi
ffff800000108cf4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000108cf8:	48 89 d1             	mov    %rdx,%rcx
ffff800000108cfb:	ba ee 00 00 00       	mov    $0xee,%edx
ffff800000108d00:	49 b8 4f 79 ff ff ff 	movabs $0xffffffffffff794f,%r8
ffff800000108d07:	ff ff ff 
ffff800000108d0a:	4a 8d 04 00          	lea    (%rax,%r8,1),%rax
ffff800000108d0e:	ff d0                	callq  *%rax
ffff800000108d10:	90                   	nop
ffff800000108d11:	c9                   	leaveq 
ffff800000108d12:	c3                   	retq   
ffff800000108d13:	55                   	push   %rbp
ffff800000108d14:	48 89 e5             	mov    %rsp,%rbp
ffff800000108d17:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108d17 <do_IRQ+0x3f2>
ffff800000108d1e:	49 bb 11 3c 00 00 00 	movabs $0x3c11,%r11
ffff800000108d25:	00 00 00 
ffff800000108d28:	4c 01 d8             	add    %r11,%rax
ffff800000108d2b:	89 7d fc             	mov    %edi,-0x4(%rbp)
ffff800000108d2e:	89 75 f8             	mov    %esi,-0x8(%rbp)
ffff800000108d31:	89 55 f4             	mov    %edx,-0xc(%rbp)
ffff800000108d34:	89 4d f0             	mov    %ecx,-0x10(%rbp)
ffff800000108d37:	44 89 45 ec          	mov    %r8d,-0x14(%rbp)
ffff800000108d3b:	44 89 4d e8          	mov    %r9d,-0x18(%rbp)
ffff800000108d3f:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108d46:	ff ff ff 
ffff800000108d49:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108d4d:	48 8d 52 04          	lea    0x4(%rdx),%rdx
ffff800000108d51:	8b 4d fc             	mov    -0x4(%rbp),%ecx
ffff800000108d54:	89 0a                	mov    %ecx,(%rdx)
ffff800000108d56:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108d5d:	ff ff ff 
ffff800000108d60:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108d64:	48 8d 52 0c          	lea    0xc(%rdx),%rdx
ffff800000108d68:	8b 4d f8             	mov    -0x8(%rbp),%ecx
ffff800000108d6b:	89 0a                	mov    %ecx,(%rdx)
ffff800000108d6d:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108d74:	ff ff ff 
ffff800000108d77:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108d7b:	48 8d 52 14          	lea    0x14(%rdx),%rdx
ffff800000108d7f:	8b 4d f4             	mov    -0xc(%rbp),%ecx
ffff800000108d82:	89 0a                	mov    %ecx,(%rdx)
ffff800000108d84:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108d8b:	ff ff ff 
ffff800000108d8e:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108d92:	48 8d 52 24          	lea    0x24(%rdx),%rdx
ffff800000108d96:	8b 4d f0             	mov    -0x10(%rbp),%ecx
ffff800000108d99:	89 0a                	mov    %ecx,(%rdx)
ffff800000108d9b:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108da2:	ff ff ff 
ffff800000108da5:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108da9:	48 8d 52 2c          	lea    0x2c(%rdx),%rdx
ffff800000108dad:	8b 4d ec             	mov    -0x14(%rbp),%ecx
ffff800000108db0:	89 0a                	mov    %ecx,(%rdx)
ffff800000108db2:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108db9:	ff ff ff 
ffff800000108dbc:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108dc0:	48 8d 52 34          	lea    0x34(%rdx),%rdx
ffff800000108dc4:	8b 4d e8             	mov    -0x18(%rbp),%ecx
ffff800000108dc7:	89 0a                	mov    %ecx,(%rdx)
ffff800000108dc9:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108dd0:	ff ff ff 
ffff800000108dd3:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108dd7:	48 8d 52 3c          	lea    0x3c(%rdx),%rdx
ffff800000108ddb:	8b 4d 10             	mov    0x10(%rbp),%ecx
ffff800000108dde:	89 0a                	mov    %ecx,(%rdx)
ffff800000108de0:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108de7:	ff ff ff 
ffff800000108dea:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108dee:	48 8d 52 44          	lea    0x44(%rdx),%rdx
ffff800000108df2:	8b 4d 18             	mov    0x18(%rbp),%ecx
ffff800000108df5:	89 0a                	mov    %ecx,(%rdx)
ffff800000108df7:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108dfe:	ff ff ff 
ffff800000108e01:	48 8b 14 10          	mov    (%rax,%rdx,1),%rdx
ffff800000108e05:	48 8d 52 4c          	lea    0x4c(%rdx),%rdx
ffff800000108e09:	8b 4d 20             	mov    0x20(%rbp),%ecx
ffff800000108e0c:	89 0a                	mov    %ecx,(%rdx)
ffff800000108e0e:	48 ba 20 ff ff ff ff 	movabs $0xffffffffffffff20,%rdx
ffff800000108e15:	ff ff ff 
ffff800000108e18:	48 8b 04 10          	mov    (%rax,%rdx,1),%rax
ffff800000108e1c:	48 8d 40 54          	lea    0x54(%rax),%rax
ffff800000108e20:	8b 55 28             	mov    0x28(%rbp),%edx
ffff800000108e23:	89 10                	mov    %edx,(%rax)
ffff800000108e25:	90                   	nop
ffff800000108e26:	5d                   	pop    %rbp
ffff800000108e27:	c3                   	retq   

ffff800000108e28 <user_level_function>:
ffff800000108e28:	55                   	push   %rbp
ffff800000108e29:	48 89 e5             	mov    %rsp,%rbp
ffff800000108e2c:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108e2c <user_level_function+0x4>
ffff800000108e33:	49 bb fc 3a 00 00 00 	movabs $0x3afc,%r11
ffff800000108e3a:	00 00 00 
ffff800000108e3d:	4c 01 d8             	add    %r11,%rax
ffff800000108e40:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
ffff800000108e47:	00 
ffff800000108e48:	48 b8 48 65 6c 6c 6f 	movabs $0x6f57206f6c6c6548,%rax
ffff800000108e4f:	20 57 6f 
ffff800000108e52:	48 89 45 ea          	mov    %rax,-0x16(%rbp)
ffff800000108e56:	c7 45 f2 72 6c 64 21 	movl   $0x21646c72,-0xe(%rbp)
ffff800000108e5d:	66 c7 45 f6 0a 00    	movw   $0xa,-0xa(%rbp)
ffff800000108e63:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000108e68:	48 8d 55 ea          	lea    -0x16(%rbp),%rdx
ffff800000108e6c:	48 89 d7             	mov    %rdx,%rdi
ffff800000108e6f:	48 8d 15 05 00 00 00 	lea    0x5(%rip),%rdx        # ffff800000108e7b <sysexit_return_address>
ffff800000108e76:	48 89 e1             	mov    %rsp,%rcx
ffff800000108e79:	0f 34                	sysenter 

ffff800000108e7b <sysexit_return_address>:
ffff800000108e7b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108e7f:	eb fe                	jmp    ffff800000108e7f <sysexit_return_address+0x4>

ffff800000108e81 <system_call_function>:
ffff800000108e81:	55                   	push   %rbp
ffff800000108e82:	48 89 e5             	mov    %rsp,%rbp
ffff800000108e85:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108e89:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108e89 <system_call_function+0x8>
ffff800000108e90:	49 bb 9f 3a 00 00 00 	movabs $0x3a9f,%r11
ffff800000108e97:	00 00 00 
ffff800000108e9a:	4c 01 d8             	add    %r11,%rax
ffff800000108e9d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108ea1:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000108ea5:	48 8b 92 80 00 00 00 	mov    0x80(%rdx),%rdx
ffff800000108eac:	48 b9 d8 03 00 00 00 	movabs $0x3d8,%rcx
ffff800000108eb3:	00 00 00 
ffff800000108eb6:	48 01 c8             	add    %rcx,%rax
ffff800000108eb9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
ffff800000108ebd:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000108ec1:	48 89 d7             	mov    %rdx,%rdi
ffff800000108ec4:	ff d0                	callq  *%rax
ffff800000108ec6:	c9                   	leaveq 
ffff800000108ec7:	c3                   	retq   

ffff800000108ec8 <do_execve>:
ffff800000108ec8:	55                   	push   %rbp
ffff800000108ec9:	48 89 e5             	mov    %rsp,%rbp
ffff800000108ecc:	41 57                	push   %r15
ffff800000108ece:	53                   	push   %rbx
ffff800000108ecf:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108ed3:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000108ed3 <do_execve+0xb>
ffff800000108eda:	49 bb 55 3a 00 00 00 	movabs $0x3a55,%r11
ffff800000108ee1:	00 00 00 
ffff800000108ee4:	4c 01 db             	add    %r11,%rbx
ffff800000108ee7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000108eeb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108eef:	48 c7 40 50 00 00 80 	movq   $0x800000,0x50(%rax)
ffff800000108ef6:	00 
ffff800000108ef7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108efb:	48 c7 40 48 00 00 a0 	movq   $0xa00000,0x48(%rax)
ffff800000108f02:	00 
ffff800000108f03:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108f07:	48 c7 80 80 00 00 00 	movq   $0x0,0x80(%rax)
ffff800000108f0e:	00 00 00 00 
ffff800000108f12:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108f16:	48 c7 40 70 00 00 00 	movq   $0x0,0x70(%rax)
ffff800000108f1d:	00 
ffff800000108f1e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108f22:	48 c7 40 78 00 00 00 	movq   $0x0,0x78(%rax)
ffff800000108f29:	00 
ffff800000108f2a:	48 b8 09 19 00 00 00 	movabs $0x1909,%rax
ffff800000108f31:	00 00 00 
ffff800000108f34:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000108f38:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108f3d:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108f42:	49 89 df             	mov    %rbx,%r15
ffff800000108f45:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108f4a:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000108f51:	ff ff ff 
ffff800000108f54:	48 01 d9             	add    %rbx,%rcx
ffff800000108f57:	ff d1                	callq  *%rcx
ffff800000108f59:	ba 00 04 00 00       	mov    $0x400,%edx
ffff800000108f5e:	be 00 00 80 00       	mov    $0x800000,%esi
ffff800000108f63:	48 b8 00 c5 ff ff ff 	movabs $0xffffffffffffc500,%rax
ffff800000108f6a:	ff ff ff 
ffff800000108f6d:	48 8d 3c 03          	lea    (%rbx,%rax,1),%rdi
ffff800000108f71:	49 89 df             	mov    %rbx,%r15
ffff800000108f74:	48 b8 51 b4 ff ff ff 	movabs $0xffffffffffffb451,%rax
ffff800000108f7b:	ff ff ff 
ffff800000108f7e:	48 01 d8             	add    %rbx,%rax
ffff800000108f81:	ff d0                	callq  *%rax
ffff800000108f83:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108f88:	48 83 c4 10          	add    $0x10,%rsp
ffff800000108f8c:	5b                   	pop    %rbx
ffff800000108f8d:	41 5f                	pop    %r15
ffff800000108f8f:	5d                   	pop    %rbp
ffff800000108f90:	c3                   	retq   

ffff800000108f91 <kernel_thread_func>:
ffff800000108f91:	55                   	push   %rbp
ffff800000108f92:	48 89 e5             	mov    %rsp,%rbp
ffff800000108f95:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000108f95 <kernel_thread_func+0x4>
ffff800000108f9c:	49 bb 93 39 00 00 00 	movabs $0x3993,%r11
ffff800000108fa3:	00 00 00 
ffff800000108fa6:	4c 01 d8             	add    %r11,%rax
ffff800000108fa9:	41 5f                	pop    %r15
ffff800000108fab:	41 5e                	pop    %r14
ffff800000108fad:	41 5d                	pop    %r13
ffff800000108faf:	41 5c                	pop    %r12
ffff800000108fb1:	41 5b                	pop    %r11
ffff800000108fb3:	41 5a                	pop    %r10
ffff800000108fb5:	41 59                	pop    %r9
ffff800000108fb7:	41 58                	pop    %r8
ffff800000108fb9:	5b                   	pop    %rbx
ffff800000108fba:	59                   	pop    %rcx
ffff800000108fbb:	5a                   	pop    %rdx
ffff800000108fbc:	5e                   	pop    %rsi
ffff800000108fbd:	5f                   	pop    %rdi
ffff800000108fbe:	5d                   	pop    %rbp
ffff800000108fbf:	58                   	pop    %rax
ffff800000108fc0:	48 8e d8             	mov    %rax,%ds
ffff800000108fc3:	58                   	pop    %rax
ffff800000108fc4:	48 8e c0             	mov    %rax,%es
ffff800000108fc7:	58                   	pop    %rax
ffff800000108fc8:	48 83 c4 38          	add    $0x38,%rsp
ffff800000108fcc:	48 89 cf             	mov    %rcx,%rdi
ffff800000108fcf:	ff d1                	callq  *%rcx
ffff800000108fd1:	48 89 c7             	mov    %rax,%rdi
ffff800000108fd4:	e8 02 0a 00 00       	callq  ffff8000001099db <do_exit>
ffff800000108fd9:	90                   	nop
ffff800000108fda:	5d                   	pop    %rbp
ffff800000108fdb:	c3                   	retq   

ffff800000108fdc <init>:
ffff800000108fdc:	55                   	push   %rbp
ffff800000108fdd:	48 89 e5             	mov    %rsp,%rbp
ffff800000108fe0:	41 57                	push   %r15
ffff800000108fe2:	41 54                	push   %r12
ffff800000108fe4:	53                   	push   %rbx
ffff800000108fe5:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000108fe9:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000108fe9 <init+0xd>
ffff800000108ff0:	49 bb 3f 39 00 00 00 	movabs $0x393f,%r11
ffff800000108ff7:	00 00 00 
ffff800000108ffa:	4c 01 db             	add    %r11,%rbx
ffff800000108ffd:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
ffff800000109001:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109005:	48 89 c1             	mov    %rax,%rcx
ffff800000109008:	48 b8 24 19 00 00 00 	movabs $0x1924,%rax
ffff80000010900f:	00 00 00 
ffff800000109012:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000109016:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010901b:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000109020:	49 89 df             	mov    %rbx,%r15
ffff800000109023:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109028:	49 b8 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r8
ffff80000010902f:	ff ff ff 
ffff800000109032:	49 01 d8             	add    %rbx,%r8
ffff800000109035:	41 ff d0             	callq  *%r8
ffff800000109038:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010903d:	48 ba b1 7c ff ff ff 	movabs $0xffffffffffff7cb1,%rdx
ffff800000109044:	ff ff ff 
ffff800000109047:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff80000010904b:	ff d2                	callq  *%rdx
ffff80000010904d:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109051:	48 ba f8 fe ff ff ff 	movabs $0xfffffffffffffef8,%rdx
ffff800000109058:	ff ff ff 
ffff80000010905b:	48 8b 14 13          	mov    (%rbx,%rdx,1),%rdx
ffff80000010905f:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000109063:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109068:	48 ba b1 7c ff ff ff 	movabs $0xffffffffffff7cb1,%rdx
ffff80000010906f:	ff ff ff 
ffff800000109072:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff800000109076:	ff d2                	callq  *%rdx
ffff800000109078:	49 89 c4             	mov    %rax,%r12
ffff80000010907b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109080:	48 ba b1 7c ff ff ff 	movabs $0xffffffffffff7cb1,%rdx
ffff800000109087:	ff ff ff 
ffff80000010908a:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff80000010908e:	ff d2                	callq  *%rdx
ffff800000109090:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109094:	49 8d 94 24 40 7f 00 	lea    0x7f40(%r12),%rdx
ffff80000010909b:	00 
ffff80000010909c:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff8000001090a0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001090a5:	48 ba b1 7c ff ff ff 	movabs $0xffffffffffff7cb1,%rdx
ffff8000001090ac:	ff ff ff 
ffff8000001090af:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff8000001090b3:	ff d2                	callq  *%rdx
ffff8000001090b5:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff8000001090b9:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff8000001090bd:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff8000001090c1:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001090c6:	48 ba b1 7c ff ff ff 	movabs $0xffffffffffff7cb1,%rdx
ffff8000001090cd:	ff ff ff 
ffff8000001090d0:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff8000001090d4:	ff d2                	callq  *%rdx
ffff8000001090d6:	4c 8b 60 28          	mov    0x28(%rax),%r12
ffff8000001090da:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001090df:	48 ba b1 7c ff ff ff 	movabs $0xffffffffffff7cb1,%rdx
ffff8000001090e6:	ff ff ff 
ffff8000001090e9:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff8000001090ed:	ff d2                	callq  *%rdx
ffff8000001090ef:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff8000001090f3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001090f7:	48 89 c7             	mov    %rax,%rdi
ffff8000001090fa:	49 8b 64 24 10       	mov    0x10(%r12),%rsp
ffff8000001090ff:	ff 72 08             	pushq  0x8(%rdx)
ffff800000109102:	e9 c1 fd ff ff       	jmpq   ffff800000108ec8 <do_execve>
ffff800000109107:	b8 01 00 00 00       	mov    $0x1,%eax
ffff80000010910c:	48 83 c4 28          	add    $0x28,%rsp
ffff800000109110:	5b                   	pop    %rbx
ffff800000109111:	41 5c                	pop    %r12
ffff800000109113:	41 5f                	pop    %r15
ffff800000109115:	5d                   	pop    %rbp
ffff800000109116:	c3                   	retq   

ffff800000109117 <__switch_to>:
ffff800000109117:	55                   	push   %rbp
ffff800000109118:	48 89 e5             	mov    %rsp,%rbp
ffff80000010911b:	41 55                	push   %r13
ffff80000010911d:	41 54                	push   %r12
ffff80000010911f:	53                   	push   %rbx
ffff800000109120:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000109124:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000109124 <__switch_to+0xd>
ffff80000010912b:	49 bb 04 38 00 00 00 	movabs $0x3804,%r11
ffff800000109132:	00 00 00 
ffff800000109135:	4c 01 d8             	add    %r11,%rax
ffff800000109138:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
ffff80000010913c:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
ffff800000109140:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
ffff800000109144:	48 8b 52 28          	mov    0x28(%rdx),%rdx
ffff800000109148:	48 8b 0a             	mov    (%rdx),%rcx
ffff80000010914b:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff800000109152:	00 00 00 
ffff800000109155:	48 89 4c 10 04       	mov    %rcx,0x4(%rax,%rdx,1)
ffff80000010915a:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff800000109161:	00 00 00 
ffff800000109164:	48 8b 54 10 54       	mov    0x54(%rax,%rdx,1),%rdx
ffff800000109169:	89 d3                	mov    %edx,%ebx
ffff80000010916b:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff800000109172:	00 00 00 
ffff800000109175:	48 8b 54 10 4c       	mov    0x4c(%rax,%rdx,1),%rdx
ffff80000010917a:	41 89 d3             	mov    %edx,%r11d
ffff80000010917d:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff800000109184:	00 00 00 
ffff800000109187:	48 8b 54 10 44       	mov    0x44(%rax,%rdx,1),%rdx
ffff80000010918c:	41 89 d1             	mov    %edx,%r9d
ffff80000010918f:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff800000109196:	00 00 00 
ffff800000109199:	48 8b 54 10 3c       	mov    0x3c(%rax,%rdx,1),%rdx
ffff80000010919e:	41 89 d0             	mov    %edx,%r8d
ffff8000001091a1:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff8000001091a8:	00 00 00 
ffff8000001091ab:	48 8b 54 10 34       	mov    0x34(%rax,%rdx,1),%rdx
ffff8000001091b0:	41 89 d5             	mov    %edx,%r13d
ffff8000001091b3:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff8000001091ba:	00 00 00 
ffff8000001091bd:	48 8b 54 10 2c       	mov    0x2c(%rax,%rdx,1),%rdx
ffff8000001091c2:	41 89 d4             	mov    %edx,%r12d
ffff8000001091c5:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff8000001091cc:	00 00 00 
ffff8000001091cf:	48 8b 54 10 24       	mov    0x24(%rax,%rdx,1),%rdx
ffff8000001091d4:	89 d1                	mov    %edx,%ecx
ffff8000001091d6:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff8000001091dd:	00 00 00 
ffff8000001091e0:	48 8b 54 10 14       	mov    0x14(%rax,%rdx,1),%rdx
ffff8000001091e5:	41 89 d2             	mov    %edx,%r10d
ffff8000001091e8:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff8000001091ef:	00 00 00 
ffff8000001091f2:	48 8b 54 10 0c       	mov    0xc(%rax,%rdx,1),%rdx
ffff8000001091f7:	89 d6                	mov    %edx,%esi
ffff8000001091f9:	48 ba 98 00 00 00 00 	movabs $0x98,%rdx
ffff800000109200:	00 00 00 
ffff800000109203:	48 8b 54 10 04       	mov    0x4(%rax,%rdx,1),%rdx
ffff800000109208:	89 d7                	mov    %edx,%edi
ffff80000010920a:	53                   	push   %rbx
ffff80000010920b:	41 53                	push   %r11
ffff80000010920d:	41 51                	push   %r9
ffff80000010920f:	41 50                	push   %r8
ffff800000109211:	45 89 e9             	mov    %r13d,%r9d
ffff800000109214:	45 89 e0             	mov    %r12d,%r8d
ffff800000109217:	44 89 d2             	mov    %r10d,%edx
ffff80000010921a:	49 ba 45 7b ff ff ff 	movabs $0xffffffffffff7b45,%r10
ffff800000109221:	ff ff ff 
ffff800000109224:	4a 8d 04 10          	lea    (%rax,%r10,1),%rax
ffff800000109228:	ff d0                	callq  *%rax
ffff80000010922a:	48 83 c4 20          	add    $0x20,%rsp
ffff80000010922e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109232:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff800000109236:	48 8c e0             	mov    %fs,%rax
ffff800000109239:	48 89 42 18          	mov    %rax,0x18(%rdx)
ffff80000010923d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109241:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff800000109245:	48 8c e8             	mov    %gs,%rax
ffff800000109248:	48 89 42 20          	mov    %rax,0x20(%rdx)
ffff80000010924c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000109250:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109254:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109258:	48 8e e0             	mov    %rax,%fs
ffff80000010925b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010925f:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109263:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff800000109267:	48 8e e8             	mov    %rax,%gs
ffff80000010926a:	90                   	nop
ffff80000010926b:	48 8d 65 e8          	lea    -0x18(%rbp),%rsp
ffff80000010926f:	5b                   	pop    %rbx
ffff800000109270:	41 5c                	pop    %r12
ffff800000109272:	41 5d                	pop    %r13
ffff800000109274:	5d                   	pop    %rbp
ffff800000109275:	c3                   	retq   

ffff800000109276 <task_init>:
ffff800000109276:	55                   	push   %rbp
ffff800000109277:	48 89 e5             	mov    %rsp,%rbp
ffff80000010927a:	41 57                	push   %r15
ffff80000010927c:	41 56                	push   %r14
ffff80000010927e:	41 55                	push   %r13
ffff800000109280:	41 54                	push   %r12
ffff800000109282:	53                   	push   %rbx
ffff800000109283:	48 83 ec 18          	sub    $0x18,%rsp
ffff800000109287:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000109287 <task_init+0x11>
ffff80000010928e:	49 bb a1 36 00 00 00 	movabs $0x36a1,%r11
ffff800000109295:	00 00 00 
ffff800000109298:	4c 01 db             	add    %r11,%rbx
ffff80000010929b:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
ffff8000001092a2:	00 
ffff8000001092a3:	48 b8 e8 36 01 00 00 	movabs $0x136e8,%rax
ffff8000001092aa:	00 00 00 
ffff8000001092ad:	48 8b 14 03          	mov    (%rbx,%rax,1),%rdx
ffff8000001092b1:	48 b8 f8 36 01 00 00 	movabs $0x136f8,%rax
ffff8000001092b8:	00 00 00 
ffff8000001092bb:	48 89 14 03          	mov    %rdx,(%rbx,%rax,1)
ffff8000001092bf:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001092c6:	ff ff ff 
ffff8000001092c9:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001092cd:	48 8b 90 d0 02 00 00 	mov    0x2d0(%rax),%rdx
ffff8000001092d4:	48 b8 f8 36 01 00 00 	movabs $0x136f8,%rax
ffff8000001092db:	00 00 00 
ffff8000001092de:	48 89 54 03 08       	mov    %rdx,0x8(%rbx,%rax,1)
ffff8000001092e3:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001092ea:	ff ff ff 
ffff8000001092ed:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001092f1:	48 8b 90 d8 02 00 00 	mov    0x2d8(%rax),%rdx
ffff8000001092f8:	48 b8 f8 36 01 00 00 	movabs $0x136f8,%rax
ffff8000001092ff:	00 00 00 
ffff800000109302:	48 89 54 03 10       	mov    %rdx,0x10(%rbx,%rax,1)
ffff800000109307:	48 b8 a0 ff ff ff ff 	movabs $0xffffffffffffffa0,%rax
ffff80000010930e:	ff ff ff 
ffff800000109311:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000109315:	48 89 c2             	mov    %rax,%rdx
ffff800000109318:	48 b8 f8 36 01 00 00 	movabs $0x136f8,%rax
ffff80000010931f:	00 00 00 
ffff800000109322:	48 89 54 03 18       	mov    %rdx,0x18(%rbx,%rax,1)
ffff800000109327:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff80000010932e:	ff ff ff 
ffff800000109331:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000109335:	48 8b 90 e0 02 00 00 	mov    0x2e0(%rax),%rdx
ffff80000010933c:	48 b8 f8 36 01 00 00 	movabs $0x136f8,%rax
ffff800000109343:	00 00 00 
ffff800000109346:	48 89 54 03 20       	mov    %rdx,0x20(%rbx,%rax,1)
ffff80000010934b:	48 b8 58 ff ff ff ff 	movabs $0xffffffffffffff58,%rax
ffff800000109352:	ff ff ff 
ffff800000109355:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000109359:	48 89 c2             	mov    %rax,%rdx
ffff80000010935c:	48 b8 f8 36 01 00 00 	movabs $0x136f8,%rax
ffff800000109363:	00 00 00 
ffff800000109366:	48 89 54 03 28       	mov    %rdx,0x28(%rbx,%rax,1)
ffff80000010936b:	48 b8 f8 ff ff ff ff 	movabs $0xfffffffffffffff8,%rax
ffff800000109372:	ff ff ff 
ffff800000109375:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000109379:	48 89 c2             	mov    %rax,%rdx
ffff80000010937c:	48 b8 f8 36 01 00 00 	movabs $0x136f8,%rax
ffff800000109383:	00 00 00 
ffff800000109386:	48 89 54 03 30       	mov    %rdx,0x30(%rbx,%rax,1)
ffff80000010938b:	48 b8 f8 36 01 00 00 	movabs $0x136f8,%rax
ffff800000109392:	00 00 00 
ffff800000109395:	48 c7 44 03 38 00 00 	movq   $0x0,0x38(%rbx,%rax,1)
ffff80000010939c:	00 00 
ffff80000010939e:	48 b8 d0 ff ff ff ff 	movabs $0xffffffffffffffd0,%rax
ffff8000001093a5:	ff ff ff 
ffff8000001093a8:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001093ac:	48 8b 90 e8 02 00 00 	mov    0x2e8(%rax),%rdx
ffff8000001093b3:	48 b8 f8 36 01 00 00 	movabs $0x136f8,%rax
ffff8000001093ba:	00 00 00 
ffff8000001093bd:	48 89 54 03 40       	mov    %rdx,0x40(%rbx,%rax,1)
ffff8000001093c2:	48 b8 90 ff ff ff ff 	movabs $0xffffffffffffff90,%rax
ffff8000001093c9:	ff ff ff 
ffff8000001093cc:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001093d0:	48 8b 10             	mov    (%rax),%rdx
ffff8000001093d3:	48 b8 f8 36 01 00 00 	movabs $0x136f8,%rax
ffff8000001093da:	00 00 00 
ffff8000001093dd:	48 89 54 03 48       	mov    %rdx,0x48(%rbx,%rax,1)
ffff8000001093e2:	be 08 00 00 00       	mov    $0x8,%esi
ffff8000001093e7:	bf 74 01 00 00       	mov    $0x174,%edi
ffff8000001093ec:	49 89 df             	mov    %rbx,%r15
ffff8000001093ef:	48 b8 15 b7 ff ff ff 	movabs $0xffffffffffffb715,%rax
ffff8000001093f6:	ff ff ff 
ffff8000001093f9:	48 01 d8             	add    %rbx,%rax
ffff8000001093fc:	ff d0                	callq  *%rax
ffff8000001093fe:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109403:	48 ba b1 7c ff ff ff 	movabs $0xffffffffffff7cb1,%rdx
ffff80000010940a:	ff ff ff 
ffff80000010940d:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff800000109411:	ff d2                	callq  *%rdx
ffff800000109413:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109417:	48 8b 00             	mov    (%rax),%rax
ffff80000010941a:	48 89 c6             	mov    %rax,%rsi
ffff80000010941d:	bf 75 01 00 00       	mov    $0x175,%edi
ffff800000109422:	49 89 df             	mov    %rbx,%r15
ffff800000109425:	48 b8 15 b7 ff ff ff 	movabs $0xffffffffffffb715,%rax
ffff80000010942c:	ff ff ff 
ffff80000010942f:	48 01 d8             	add    %rbx,%rax
ffff800000109432:	ff d0                	callq  *%rax
ffff800000109434:	48 b8 e0 ff ff ff ff 	movabs $0xffffffffffffffe0,%rax
ffff80000010943b:	ff ff ff 
ffff80000010943e:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff800000109442:	48 89 c6             	mov    %rax,%rsi
ffff800000109445:	bf 76 01 00 00       	mov    $0x176,%edi
ffff80000010944a:	49 89 df             	mov    %rbx,%r15
ffff80000010944d:	48 b8 15 b7 ff ff ff 	movabs $0xffffffffffffb715,%rax
ffff800000109454:	ff ff ff 
ffff800000109457:	48 01 d8             	add    %rbx,%rax
ffff80000010945a:	ff d0                	callq  *%rax
ffff80000010945c:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff800000109463:	00 00 00 
ffff800000109466:	48 8b 44 03 54       	mov    0x54(%rbx,%rax,1),%rax
ffff80000010946b:	41 89 c2             	mov    %eax,%r10d
ffff80000010946e:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff800000109475:	00 00 00 
ffff800000109478:	48 8b 44 03 4c       	mov    0x4c(%rbx,%rax,1),%rax
ffff80000010947d:	41 89 c1             	mov    %eax,%r9d
ffff800000109480:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff800000109487:	00 00 00 
ffff80000010948a:	48 8b 44 03 44       	mov    0x44(%rbx,%rax,1),%rax
ffff80000010948f:	41 89 c0             	mov    %eax,%r8d
ffff800000109492:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff800000109499:	00 00 00 
ffff80000010949c:	48 8b 44 03 3c       	mov    0x3c(%rbx,%rax,1),%rax
ffff8000001094a1:	89 c7                	mov    %eax,%edi
ffff8000001094a3:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff8000001094aa:	00 00 00 
ffff8000001094ad:	48 8b 44 03 34       	mov    0x34(%rbx,%rax,1),%rax
ffff8000001094b2:	41 89 c4             	mov    %eax,%r12d
ffff8000001094b5:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff8000001094bc:	00 00 00 
ffff8000001094bf:	48 8b 44 03 2c       	mov    0x2c(%rbx,%rax,1),%rax
ffff8000001094c4:	41 89 c3             	mov    %eax,%r11d
ffff8000001094c7:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff8000001094ce:	00 00 00 
ffff8000001094d1:	48 8b 44 03 24       	mov    0x24(%rbx,%rax,1),%rax
ffff8000001094d6:	89 c1                	mov    %eax,%ecx
ffff8000001094d8:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff8000001094df:	00 00 00 
ffff8000001094e2:	48 8b 44 03 14       	mov    0x14(%rbx,%rax,1),%rax
ffff8000001094e7:	89 c2                	mov    %eax,%edx
ffff8000001094e9:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff8000001094f0:	00 00 00 
ffff8000001094f3:	48 8b 44 03 0c       	mov    0xc(%rbx,%rax,1),%rax
ffff8000001094f8:	89 c6                	mov    %eax,%esi
ffff8000001094fa:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff800000109501:	00 00 00 
ffff800000109504:	48 8b 44 03 04       	mov    0x4(%rbx,%rax,1),%rax
ffff800000109509:	41 52                	push   %r10
ffff80000010950b:	41 51                	push   %r9
ffff80000010950d:	41 50                	push   %r8
ffff80000010950f:	57                   	push   %rdi
ffff800000109510:	45 89 e1             	mov    %r12d,%r9d
ffff800000109513:	45 89 d8             	mov    %r11d,%r8d
ffff800000109516:	89 c7                	mov    %eax,%edi
ffff800000109518:	48 b8 45 7b ff ff ff 	movabs $0xffffffffffff7b45,%rax
ffff80000010951f:	ff ff ff 
ffff800000109522:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109526:	ff d0                	callq  *%rax
ffff800000109528:	48 83 c4 20          	add    $0x20,%rsp
ffff80000010952c:	48 b8 18 00 00 00 00 	movabs $0x18,%rax
ffff800000109533:	00 00 00 
ffff800000109536:	48 8b 14 03          	mov    (%rbx,%rax,1),%rdx
ffff80000010953a:	48 b8 98 00 00 00 00 	movabs $0x98,%rax
ffff800000109541:	00 00 00 
ffff800000109544:	48 89 54 03 04       	mov    %rdx,0x4(%rbx,%rax,1)
ffff800000109549:	48 b8 d8 36 00 00 00 	movabs $0x36d8,%rax
ffff800000109550:	00 00 00 
ffff800000109553:	48 8d 3c 03          	lea    (%rbx,%rax,1),%rdi
ffff800000109557:	49 89 df             	mov    %rbx,%r15
ffff80000010955a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010955f:	48 ba 6c b5 ff ff ff 	movabs $0xffffffffffffb56c,%rdx
ffff800000109566:	ff ff ff 
ffff800000109569:	48 01 da             	add    %rbx,%rdx
ffff80000010956c:	ff d2                	callq  *%rdx
ffff80000010956e:	ba 07 00 00 00       	mov    $0x7,%edx
ffff800000109573:	be 0a 00 00 00       	mov    $0xa,%esi
ffff800000109578:	48 b8 b4 c6 ff ff ff 	movabs $0xffffffffffffc6b4,%rax
ffff80000010957f:	ff ff ff 
ffff800000109582:	48 8d 3c 03          	lea    (%rbx,%rax,1),%rdi
ffff800000109586:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010958b:	48 b9 59 cd ff ff ff 	movabs $0xffffffffffffcd59,%rcx
ffff800000109592:	ff ff ff 
ffff800000109595:	48 8d 0c 0b          	lea    (%rbx,%rcx,1),%rcx
ffff800000109599:	ff d1                	callq  *%rcx
ffff80000010959b:	48 b8 d8 36 00 00 00 	movabs $0x36d8,%rax
ffff8000001095a2:	00 00 00 
ffff8000001095a5:	48 c7 44 03 10 01 00 	movq   $0x1,0x10(%rbx,%rax,1)
ffff8000001095ac:	00 00 
ffff8000001095ae:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001095b3:	48 ba b1 7c ff ff ff 	movabs $0xffffffffffff7cb1,%rdx
ffff8000001095ba:	ff ff ff 
ffff8000001095bd:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff8000001095c1:	ff d2                	callq  *%rdx
ffff8000001095c3:	48 89 c7             	mov    %rax,%rdi
ffff8000001095c6:	49 89 df             	mov    %rbx,%r15
ffff8000001095c9:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001095ce:	48 ba db b6 ff ff ff 	movabs $0xffffffffffffb6db,%rdx
ffff8000001095d5:	ff ff ff 
ffff8000001095d8:	48 01 da             	add    %rbx,%rdx
ffff8000001095db:	ff d2                	callq  *%rdx
ffff8000001095dd:	48 98                	cltq   
ffff8000001095df:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
ffff8000001095e3:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff8000001095e7:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff8000001095eb:	90                   	nop
ffff8000001095ec:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001095f1:	48 ba b1 7c ff ff ff 	movabs $0xffffffffffff7cb1,%rdx
ffff8000001095f8:	ff ff ff 
ffff8000001095fb:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff8000001095ff:	ff d2                	callq  *%rdx
ffff800000109601:	4c 8b 60 28          	mov    0x28(%rax),%r12
ffff800000109605:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010960a:	48 ba b1 7c ff ff ff 	movabs $0xffffffffffff7cb1,%rdx
ffff800000109611:	ff ff ff 
ffff800000109614:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff800000109618:	ff d2                	callq  *%rdx
ffff80000010961a:	4c 8b 78 28          	mov    0x28(%rax),%r15
ffff80000010961e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109622:	4c 8b 68 28          	mov    0x28(%rax),%r13
ffff800000109626:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010962a:	4c 8b 70 28          	mov    0x28(%rax),%r14
ffff80000010962e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109633:	48 ba b1 7c ff ff ff 	movabs $0xffffffffffff7cb1,%rdx
ffff80000010963a:	ff ff ff 
ffff80000010963d:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff800000109641:	ff d2                	callq  *%rdx
ffff800000109643:	48 89 c2             	mov    %rax,%rdx
ffff800000109646:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010964a:	48 89 d7             	mov    %rdx,%rdi
ffff80000010964d:	48 89 c6             	mov    %rax,%rsi
ffff800000109650:	55                   	push   %rbp
ffff800000109651:	50                   	push   %rax
ffff800000109652:	49 89 64 24 10       	mov    %rsp,0x10(%r12)
ffff800000109657:	49 8b 65 10          	mov    0x10(%r13),%rsp
ffff80000010965b:	48 8d 05 0d 00 00 00 	lea    0xd(%rip),%rax        # ffff80000010966f <task_init+0x3f9>
ffff800000109662:	49 89 47 08          	mov    %rax,0x8(%r15)
ffff800000109666:	41 ff 76 08          	pushq  0x8(%r14)
ffff80000010966a:	e9 a8 fa ff ff       	jmpq   ffff800000109117 <__switch_to>
ffff80000010966f:	58                   	pop    %rax
ffff800000109670:	5d                   	pop    %rbp
ffff800000109671:	90                   	nop
ffff800000109672:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
ffff800000109676:	5b                   	pop    %rbx
ffff800000109677:	41 5c                	pop    %r12
ffff800000109679:	41 5d                	pop    %r13
ffff80000010967b:	41 5e                	pop    %r14
ffff80000010967d:	41 5f                	pop    %r15
ffff80000010967f:	5d                   	pop    %rbp
ffff800000109680:	c3                   	retq   

ffff800000109681 <kernel_thread>:
ffff800000109681:	55                   	push   %rbp
ffff800000109682:	48 89 e5             	mov    %rsp,%rbp
ffff800000109685:	41 57                	push   %r15
ffff800000109687:	53                   	push   %rbx
ffff800000109688:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
ffff80000010968f:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff80000010968f <kernel_thread+0xe>
ffff800000109696:	49 bb 99 32 00 00 00 	movabs $0x3299,%r11
ffff80000010969d:	00 00 00 
ffff8000001096a0:	4c 01 db             	add    %r11,%rbx
ffff8000001096a3:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
ffff8000001096aa:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
ffff8000001096b1:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
ffff8000001096b8:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
ffff8000001096bf:	ba c0 00 00 00       	mov    $0xc0,%edx
ffff8000001096c4:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001096c9:	48 89 c7             	mov    %rax,%rdi
ffff8000001096cc:	49 89 df             	mov    %rbx,%r15
ffff8000001096cf:	48 b8 fa b3 ff ff ff 	movabs $0xffffffffffffb3fa,%rax
ffff8000001096d6:	ff ff ff 
ffff8000001096d9:	48 01 d8             	add    %rbx,%rax
ffff8000001096dc:	ff d0                	callq  *%rax
ffff8000001096de:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
ffff8000001096e5:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
ffff8000001096ec:	48 8b 85 20 ff ff ff 	mov    -0xe0(%rbp),%rax
ffff8000001096f3:	48 89 45 80          	mov    %rax,-0x80(%rbp)
ffff8000001096f7:	48 c7 45 a0 10 00 00 	movq   $0x10,-0x60(%rbp)
ffff8000001096fe:	00 
ffff8000001096ff:	48 c7 45 a8 10 00 00 	movq   $0x10,-0x58(%rbp)
ffff800000109706:	00 
ffff800000109707:	48 c7 45 d0 08 00 00 	movq   $0x8,-0x30(%rbp)
ffff80000010970e:	00 
ffff80000010970f:	48 c7 45 e8 10 00 00 	movq   $0x10,-0x18(%rbp)
ffff800000109716:	00 
ffff800000109717:	48 c7 45 d8 00 02 00 	movq   $0x200,-0x28(%rbp)
ffff80000010971e:	00 
ffff80000010971f:	48 b8 69 c6 ff ff ff 	movabs $0xffffffffffffc669,%rax
ffff800000109726:	ff ff ff 
ffff800000109729:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff80000010972d:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff800000109731:	48 8b b5 18 ff ff ff 	mov    -0xe8(%rbp),%rsi
ffff800000109738:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
ffff80000010973f:	b9 00 00 00 00       	mov    $0x0,%ecx
ffff800000109744:	ba 00 00 00 00       	mov    $0x0,%edx
ffff800000109749:	48 89 c7             	mov    %rax,%rdi
ffff80000010974c:	48 b8 40 ce ff ff ff 	movabs $0xffffffffffffce40,%rax
ffff800000109753:	ff ff ff 
ffff800000109756:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff80000010975a:	ff d0                	callq  *%rax
ffff80000010975c:	48 81 c4 e0 00 00 00 	add    $0xe0,%rsp
ffff800000109763:	5b                   	pop    %rbx
ffff800000109764:	41 5f                	pop    %r15
ffff800000109766:	5d                   	pop    %rbp
ffff800000109767:	c3                   	retq   

ffff800000109768 <do_fork>:
ffff800000109768:	55                   	push   %rbp
ffff800000109769:	48 89 e5             	mov    %rsp,%rbp
ffff80000010976c:	41 57                	push   %r15
ffff80000010976e:	53                   	push   %rbx
ffff80000010976f:	48 83 ec 40          	sub    $0x40,%rsp
ffff800000109773:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000109773 <do_fork+0xb>
ffff80000010977a:	49 bb b5 31 00 00 00 	movabs $0x31b5,%r11
ffff800000109781:	00 00 00 
ffff800000109784:	4c 01 db             	add    %r11,%rbx
ffff800000109787:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
ffff80000010978b:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
ffff80000010978f:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
ffff800000109793:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
ffff800000109797:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff80000010979e:	00 
ffff80000010979f:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
ffff8000001097a6:	00 
ffff8000001097a7:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
ffff8000001097ae:	00 
ffff8000001097af:	ba 91 00 00 00       	mov    $0x91,%edx
ffff8000001097b4:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001097b9:	bf 02 00 00 00       	mov    $0x2,%edi
ffff8000001097be:	49 89 df             	mov    %rbx,%r15
ffff8000001097c1:	48 b8 f2 ae ff ff ff 	movabs $0xffffffffffffaef2,%rax
ffff8000001097c8:	ff ff ff 
ffff8000001097cb:	48 01 d8             	add    %rbx,%rax
ffff8000001097ce:	ff d0                	callq  *%rax
ffff8000001097d0:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff8000001097d4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001097d8:	48 8b 50 08          	mov    0x8(%rax),%rdx
ffff8000001097dc:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff8000001097e3:	80 ff ff 
ffff8000001097e6:	48 01 d0             	add    %rdx,%rax
ffff8000001097e9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001097ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001097f1:	ba 08 00 00 00       	mov    $0x8,%edx
ffff8000001097f6:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001097fb:	48 89 c7             	mov    %rax,%rdi
ffff8000001097fe:	49 89 df             	mov    %rbx,%r15
ffff800000109801:	48 b8 fa b3 ff ff ff 	movabs $0xffffffffffffb3fa,%rax
ffff800000109808:	ff ff ff 
ffff80000010980b:	48 01 d8             	add    %rbx,%rax
ffff80000010980e:	ff d0                	callq  *%rax
ffff800000109810:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109815:	48 ba b1 7c ff ff ff 	movabs $0xffffffffffff7cb1,%rdx
ffff80000010981c:	ff ff ff 
ffff80000010981f:	48 8d 14 13          	lea    (%rbx,%rdx,1),%rdx
ffff800000109823:	ff d2                	callq  *%rdx
ffff800000109825:	48 89 c2             	mov    %rax,%rdx
ffff800000109828:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010982c:	48 8b 32             	mov    (%rdx),%rsi
ffff80000010982f:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
ffff800000109833:	48 89 30             	mov    %rsi,(%rax)
ffff800000109836:	48 89 78 08          	mov    %rdi,0x8(%rax)
ffff80000010983a:	48 8b 72 10          	mov    0x10(%rdx),%rsi
ffff80000010983e:	48 8b 7a 18          	mov    0x18(%rdx),%rdi
ffff800000109842:	48 89 70 10          	mov    %rsi,0x10(%rax)
ffff800000109846:	48 89 78 18          	mov    %rdi,0x18(%rax)
ffff80000010984a:	48 8b 72 20          	mov    0x20(%rdx),%rsi
ffff80000010984e:	48 8b 7a 28          	mov    0x28(%rdx),%rdi
ffff800000109852:	48 89 70 20          	mov    %rsi,0x20(%rax)
ffff800000109856:	48 89 78 28          	mov    %rdi,0x28(%rax)
ffff80000010985a:	48 8b 72 30          	mov    0x30(%rdx),%rsi
ffff80000010985e:	48 8b 7a 38          	mov    0x38(%rdx),%rdi
ffff800000109862:	48 89 70 30          	mov    %rsi,0x30(%rax)
ffff800000109866:	48 89 78 38          	mov    %rdi,0x38(%rax)
ffff80000010986a:	48 8b 72 40          	mov    0x40(%rdx),%rsi
ffff80000010986e:	48 8b 7a 48          	mov    0x48(%rdx),%rdi
ffff800000109872:	48 89 70 40          	mov    %rsi,0x40(%rax)
ffff800000109876:	48 89 78 48          	mov    %rdi,0x48(%rax)
ffff80000010987a:	48 8b 52 50          	mov    0x50(%rdx),%rdx
ffff80000010987e:	48 89 50 50          	mov    %rdx,0x50(%rax)
ffff800000109882:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109886:	48 89 c7             	mov    %rax,%rdi
ffff800000109889:	49 89 df             	mov    %rbx,%r15
ffff80000010988c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109891:	48 ba 6c b5 ff ff ff 	movabs $0xffffffffffffb56c,%rdx
ffff800000109898:	ff ff ff 
ffff80000010989b:	48 01 da             	add    %rbx,%rdx
ffff80000010989e:	ff d2                	callq  *%rdx
ffff8000001098a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001098a4:	48 89 c6             	mov    %rax,%rsi
ffff8000001098a7:	48 b8 d8 36 00 00 00 	movabs $0x36d8,%rax
ffff8000001098ae:	00 00 00 
ffff8000001098b1:	48 8d 3c 03          	lea    (%rbx,%rax,1),%rdi
ffff8000001098b5:	49 89 df             	mov    %rbx,%r15
ffff8000001098b8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001098bd:	48 ba fb b5 ff ff ff 	movabs $0xffffffffffffb5fb,%rdx
ffff8000001098c4:	ff ff ff 
ffff8000001098c7:	48 01 da             	add    %rbx,%rdx
ffff8000001098ca:	ff d2                	callq  *%rdx
ffff8000001098cc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001098d0:	48 8b 40 38          	mov    0x38(%rax),%rax
ffff8000001098d4:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001098d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001098dc:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff8000001098e0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001098e4:	48 c7 40 10 04 00 00 	movq   $0x4,0x10(%rax)
ffff8000001098eb:	00 
ffff8000001098ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001098f0:	48 83 c0 58          	add    $0x58,%rax
ffff8000001098f4:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff8000001098f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001098fc:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
ffff800000109900:	48 89 50 28          	mov    %rdx,0x28(%rax)
ffff800000109904:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109908:	48 05 40 7f 00 00    	add    $0x7f40,%rax
ffff80000010990e:	48 89 c1             	mov    %rax,%rcx
ffff800000109911:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109915:	ba c0 00 00 00       	mov    $0xc0,%edx
ffff80000010991a:	48 89 ce             	mov    %rcx,%rsi
ffff80000010991d:	48 89 c7             	mov    %rax,%rdi
ffff800000109920:	49 89 df             	mov    %rbx,%r15
ffff800000109923:	48 b8 51 b4 ff ff ff 	movabs $0xffffffffffffb451,%rax
ffff80000010992a:	ff ff ff 
ffff80000010992d:	48 01 d8             	add    %rbx,%rax
ffff800000109930:	ff d0                	callq  *%rax
ffff800000109932:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109936:	48 8d 90 00 80 00 00 	lea    0x8000(%rax),%rdx
ffff80000010993d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109941:	48 89 10             	mov    %rdx,(%rax)
ffff800000109944:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109948:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
ffff80000010994f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109953:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000109957:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010995b:	48 8d 90 40 7f 00 00 	lea    0x7f40(%rax),%rdx
ffff800000109962:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109966:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff80000010996a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010996e:	48 c7 40 18 10 00 00 	movq   $0x10,0x18(%rax)
ffff800000109975:	00 
ffff800000109976:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010997a:	48 c7 40 20 10 00 00 	movq   $0x10,0x20(%rax)
ffff800000109981:	00 
ffff800000109982:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109986:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff80000010998a:	83 e0 01             	and    $0x1,%eax
ffff80000010998d:	48 85 c0             	test   %rax,%rax
ffff800000109990:	75 2f                	jne    ffff8000001099c1 <do_fork+0x259>
ffff800000109992:	48 b8 f8 fe ff ff ff 	movabs $0xfffffffffffffef8,%rax
ffff800000109999:	ff ff ff 
ffff80000010999c:	48 8b 04 03          	mov    (%rbx,%rax,1),%rax
ffff8000001099a0:	48 89 c2             	mov    %rax,%rdx
ffff8000001099a3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001099a7:	48 89 90 98 00 00 00 	mov    %rdx,0x98(%rax)
ffff8000001099ae:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001099b2:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
ffff8000001099b9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001099bd:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff8000001099c1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001099c5:	48 c7 40 10 01 00 00 	movq   $0x1,0x10(%rax)
ffff8000001099cc:	00 
ffff8000001099cd:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001099d2:	48 83 c4 40          	add    $0x40,%rsp
ffff8000001099d6:	5b                   	pop    %rbx
ffff8000001099d7:	41 5f                	pop    %r15
ffff8000001099d9:	5d                   	pop    %rbp
ffff8000001099da:	c3                   	retq   

ffff8000001099db <do_exit>:
ffff8000001099db:	55                   	push   %rbp
ffff8000001099dc:	48 89 e5             	mov    %rsp,%rbp
ffff8000001099df:	41 57                	push   %r15
ffff8000001099e1:	48 83 ec 18          	sub    $0x18,%rsp
ffff8000001099e5:	48 8d 0d f9 ff ff ff 	lea    -0x7(%rip),%rcx        # ffff8000001099e5 <do_exit+0xa>
ffff8000001099ec:	49 bb 43 2f 00 00 00 	movabs $0x2f43,%r11
ffff8000001099f3:	00 00 00 
ffff8000001099f6:	4c 01 d9             	add    %r11,%rcx
ffff8000001099f9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff8000001099fd:	48 b8 41 19 00 00 00 	movabs $0x1941,%rax
ffff800000109a04:	00 00 00 
ffff800000109a07:	48 8d 14 01          	lea    (%rcx,%rax,1),%rdx
ffff800000109a0b:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109a10:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000109a15:	49 89 cf             	mov    %rcx,%r15
ffff800000109a18:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109a1d:	49 b8 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r8
ffff800000109a24:	ff ff ff 
ffff800000109a27:	49 01 c8             	add    %rcx,%r8
ffff800000109a2a:	41 ff d0             	callq  *%r8
ffff800000109a2d:	eb fe                	jmp    ffff800000109a2d <do_exit+0x52>
ffff800000109a2f:	55                   	push   %rbp
ffff800000109a30:	48 89 e5             	mov    %rsp,%rbp
ffff800000109a33:	53                   	push   %rbx
ffff800000109a34:	48 8d 05 f9 ff ff ff 	lea    -0x7(%rip),%rax        # ffff800000109a34 <do_exit+0x59>
ffff800000109a3b:	49 bb f4 2e 00 00 00 	movabs $0x2ef4,%r11
ffff800000109a42:	00 00 00 
ffff800000109a45:	4c 01 d8             	add    %r11,%rax
ffff800000109a48:	89 7d f4             	mov    %edi,-0xc(%rbp)
ffff800000109a4b:	89 75 f0             	mov    %esi,-0x10(%rbp)
ffff800000109a4e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000109a52:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
ffff800000109a56:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
ffff800000109a5a:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
ffff800000109a5e:	8b 45 f4             	mov    -0xc(%rbp),%eax
ffff800000109a61:	8b 55 f0             	mov    -0x10(%rbp),%edx
ffff800000109a64:	89 d1                	mov    %edx,%ecx
ffff800000109a66:	0f a2                	cpuid  
ffff800000109a68:	89 de                	mov    %ebx,%esi
ffff800000109a6a:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
ffff800000109a6e:	89 07                	mov    %eax,(%rdi)
ffff800000109a70:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109a74:	89 30                	mov    %esi,(%rax)
ffff800000109a76:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000109a7a:	89 08                	mov    %ecx,(%rax)
ffff800000109a7c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000109a80:	89 10                	mov    %edx,(%rax)
ffff800000109a82:	90                   	nop
ffff800000109a83:	5b                   	pop    %rbx
ffff800000109a84:	5d                   	pop    %rbp
ffff800000109a85:	c3                   	retq   

ffff800000109a86 <init_cpu>:
ffff800000109a86:	55                   	push   %rbp
ffff800000109a87:	48 89 e5             	mov    %rsp,%rbp
ffff800000109a8a:	41 57                	push   %r15
ffff800000109a8c:	53                   	push   %rbx
ffff800000109a8d:	48 83 ec 40          	sub    $0x40,%rsp
ffff800000109a91:	48 8d 1d f9 ff ff ff 	lea    -0x7(%rip),%rbx        # ffff800000109a91 <init_cpu+0xb>
ffff800000109a98:	49 bb 97 2e 00 00 00 	movabs $0x2e97,%r11
ffff800000109a9f:	00 00 00 
ffff800000109aa2:	4c 01 db             	add    %r11,%rbx
ffff800000109aa5:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%rbp)
ffff800000109aac:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
ffff800000109ab3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
ffff800000109aba:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
ffff800000109ac1:	48 c7 45 b0 00 00 00 	movq   $0x0,-0x50(%rbp)
ffff800000109ac8:	00 
ffff800000109ac9:	48 c7 45 b8 00 00 00 	movq   $0x0,-0x48(%rbp)
ffff800000109ad0:	00 
ffff800000109ad1:	c6 45 c0 00          	movb   $0x0,-0x40(%rbp)
ffff800000109ad5:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff800000109ad9:	48 8d 70 0c          	lea    0xc(%rax),%rsi
ffff800000109add:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff800000109ae1:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000109ae5:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff800000109ae9:	48 8d 50 04          	lea    0x4(%rax),%rdx
ffff800000109aed:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff800000109af1:	49 89 f1             	mov    %rsi,%r9
ffff800000109af4:	49 89 c8             	mov    %rcx,%r8
ffff800000109af7:	48 89 d1             	mov    %rdx,%rcx
ffff800000109afa:	48 89 c2             	mov    %rax,%rdx
ffff800000109afd:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109b02:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000109b07:	48 b8 5a 7c ff ff ff 	movabs $0xffffffffffff7c5a,%rax
ffff800000109b0e:	ff ff ff 
ffff800000109b11:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109b15:	ff d0                	callq  *%rax
ffff800000109b17:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109b1b:	8b 55 d4             	mov    -0x2c(%rbp),%edx
ffff800000109b1e:	89 10                	mov    %edx,(%rax)
ffff800000109b20:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109b24:	48 8d 50 04          	lea    0x4(%rax),%rdx
ffff800000109b28:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000109b2b:	89 02                	mov    %eax,(%rdx)
ffff800000109b2d:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109b31:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff800000109b35:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000109b38:	89 02                	mov    %eax,(%rdx)
ffff800000109b3a:	c6 45 bc 0a          	movb   $0xa,-0x44(%rbp)
ffff800000109b3e:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109b42:	48 89 c1             	mov    %rax,%rcx
ffff800000109b45:	48 b8 59 19 00 00 00 	movabs $0x1959,%rax
ffff800000109b4c:	00 00 00 
ffff800000109b4f:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000109b53:	be ff 00 00 00       	mov    $0xff,%esi
ffff800000109b58:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000109b5d:	49 89 df             	mov    %rbx,%r15
ffff800000109b60:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109b65:	49 b8 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r8
ffff800000109b6c:	ff ff ff 
ffff800000109b6f:	49 01 d8             	add    %rbx,%r8
ffff800000109b72:	41 ff d0             	callq  *%r8
ffff800000109b75:	c7 45 ec 02 00 00 80 	movl   $0x80000002,-0x14(%rbp)
ffff800000109b7c:	e9 ab 00 00 00       	jmpq   ffff800000109c2c <init_cpu+0x1a6>
ffff800000109b81:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff800000109b85:	48 8d 78 0c          	lea    0xc(%rax),%rdi
ffff800000109b89:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff800000109b8d:	48 8d 70 08          	lea    0x8(%rax),%rsi
ffff800000109b91:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
ffff800000109b95:	48 8d 48 04          	lea    0x4(%rax),%rcx
ffff800000109b99:	48 8d 55 d0          	lea    -0x30(%rbp),%rdx
ffff800000109b9d:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000109ba0:	49 89 f9             	mov    %rdi,%r9
ffff800000109ba3:	49 89 f0             	mov    %rsi,%r8
ffff800000109ba6:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109bab:	89 c7                	mov    %eax,%edi
ffff800000109bad:	48 b8 5a 7c ff ff ff 	movabs $0xffffffffffff7c5a,%rax
ffff800000109bb4:	ff ff ff 
ffff800000109bb7:	48 8d 04 03          	lea    (%rbx,%rax,1),%rax
ffff800000109bbb:	ff d0                	callq  *%rax
ffff800000109bbd:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109bc1:	8b 55 d0             	mov    -0x30(%rbp),%edx
ffff800000109bc4:	89 10                	mov    %edx,(%rax)
ffff800000109bc6:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109bca:	48 8d 50 04          	lea    0x4(%rax),%rdx
ffff800000109bce:	8b 45 d4             	mov    -0x2c(%rbp),%eax
ffff800000109bd1:	89 02                	mov    %eax,(%rdx)
ffff800000109bd3:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109bd7:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff800000109bdb:	8b 45 d8             	mov    -0x28(%rbp),%eax
ffff800000109bde:	89 02                	mov    %eax,(%rdx)
ffff800000109be0:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109be4:	48 8d 50 0c          	lea    0xc(%rax),%rdx
ffff800000109be8:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000109beb:	89 02                	mov    %eax,(%rdx)
ffff800000109bed:	c6 45 c0 00          	movb   $0x0,-0x40(%rbp)
ffff800000109bf1:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000109bf5:	48 89 c1             	mov    %rax,%rcx
ffff800000109bf8:	48 b8 69 19 00 00 00 	movabs $0x1969,%rax
ffff800000109bff:	00 00 00 
ffff800000109c02:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000109c06:	be ff 00 00 00       	mov    $0xff,%esi
ffff800000109c0b:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000109c10:	49 89 df             	mov    %rbx,%r15
ffff800000109c13:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109c18:	49 b8 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%r8
ffff800000109c1f:	ff ff ff 
ffff800000109c22:	49 01 d8             	add    %rbx,%r8
ffff800000109c25:	41 ff d0             	callq  *%r8
ffff800000109c28:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
ffff800000109c2c:	81 7d ec 04 00 00 80 	cmpl   $0x80000004,-0x14(%rbp)
ffff800000109c33:	0f 86 48 ff ff ff    	jbe    ffff800000109b81 <init_cpu+0xfb>
ffff800000109c39:	48 b8 6c 19 00 00 00 	movabs $0x196c,%rax
ffff800000109c40:	00 00 00 
ffff800000109c43:	48 8d 14 03          	lea    (%rbx,%rax,1),%rdx
ffff800000109c47:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109c4c:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000109c51:	49 89 df             	mov    %rbx,%r15
ffff800000109c54:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109c59:	48 b9 ee 85 ff ff ff 	movabs $0xffffffffffff85ee,%rcx
ffff800000109c60:	ff ff ff 
ffff800000109c63:	48 01 d9             	add    %rbx,%rcx
ffff800000109c66:	ff d1                	callq  *%rcx
ffff800000109c68:	90                   	nop
ffff800000109c69:	48 83 c4 40          	add    $0x40,%rsp
ffff800000109c6d:	5b                   	pop    %rbx
ffff800000109c6e:	41 5f                	pop    %r15
ffff800000109c70:	5d                   	pop    %rbp
ffff800000109c71:	c3                   	retq   

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
ffff80000010c82c:	00 80 ff ff 72 9c    	add    %al,-0x638d0001(%rax)
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
ffff80000010d8c0:	77 80                	ja     ffff80000010d842 <system_call_table+0xb42>
ffff80000010d8c2:	10 00                	adc    %al,(%rax)
ffff80000010d8c4:	00 80 ff ff c1 80    	add    %al,-0x7f3e0001(%rax)
ffff80000010d8ca:	10 00                	adc    %al,(%rax)
ffff80000010d8cc:	00 80 ff ff 0b 81    	add    %al,-0x7ef40001(%rax)
ffff80000010d8d2:	10 00                	adc    %al,(%rax)
ffff80000010d8d4:	00 80 ff ff 55 81    	add    %al,-0x7eaa0001(%rax)
ffff80000010d8da:	10 00                	adc    %al,(%rax)
ffff80000010d8dc:	00 80 ff ff 9f 81    	add    %al,-0x7e600001(%rax)
ffff80000010d8e2:	10 00                	adc    %al,(%rax)
ffff80000010d8e4:	00 80 ff ff e9 81    	add    %al,-0x7e160001(%rax)
ffff80000010d8ea:	10 00                	adc    %al,(%rax)
ffff80000010d8ec:	00 80 ff ff 33 82    	add    %al,-0x7dcc0001(%rax)
ffff80000010d8f2:	10 00                	adc    %al,(%rax)
ffff80000010d8f4:	00 80 ff ff 7d 82    	add    %al,-0x7d820001(%rax)
ffff80000010d8fa:	10 00                	adc    %al,(%rax)
ffff80000010d8fc:	00 80 ff ff c7 82    	add    %al,-0x7d380001(%rax)
ffff80000010d902:	10 00                	adc    %al,(%rax)
ffff80000010d904:	00 80 ff ff 11 83    	add    %al,-0x7cee0001(%rax)
ffff80000010d90a:	10 00                	adc    %al,(%rax)
ffff80000010d90c:	00 80 ff ff 5b 83    	add    %al,-0x7ca40001(%rax)
ffff80000010d912:	10 00                	adc    %al,(%rax)
ffff80000010d914:	00 80 ff ff a5 83    	add    %al,-0x7c5a0001(%rax)
ffff80000010d91a:	10 00                	adc    %al,(%rax)
ffff80000010d91c:	00 80 ff ff ef 83    	add    %al,-0x7c100001(%rax)
ffff80000010d922:	10 00                	adc    %al,(%rax)
ffff80000010d924:	00 80 ff ff 39 84    	add    %al,-0x7bc60001(%rax)
ffff80000010d92a:	10 00                	adc    %al,(%rax)
ffff80000010d92c:	00 80 ff ff 83 84    	add    %al,-0x7b7c0001(%rax)
ffff80000010d932:	10 00                	adc    %al,(%rax)
ffff80000010d934:	00 80 ff ff cd 84    	add    %al,-0x7b320001(%rax)
ffff80000010d93a:	10 00                	adc    %al,(%rax)
ffff80000010d93c:	00 80 ff ff 17 85    	add    %al,-0x7ae80001(%rax)
ffff80000010d942:	10 00                	adc    %al,(%rax)
ffff80000010d944:	00 80 ff ff 61 85    	add    %al,-0x7a9e0001(%rax)
ffff80000010d94a:	10 00                	adc    %al,(%rax)
ffff80000010d94c:	00 80 ff ff ab 85    	add    %al,-0x7a540001(%rax)
ffff80000010d952:	10 00                	adc    %al,(%rax)
ffff80000010d954:	00 80 ff ff f5 85    	add    %al,-0x7a0a0001(%rax)
ffff80000010d95a:	10 00                	adc    %al,(%rax)
ffff80000010d95c:	00 80 ff ff 3f 86    	add    %al,-0x79c00001(%rax)
ffff80000010d962:	10 00                	adc    %al,(%rax)
ffff80000010d964:	00 80 ff ff 89 86    	add    %al,-0x79760001(%rax)
ffff80000010d96a:	10 00                	adc    %al,(%rax)
ffff80000010d96c:	00 80 ff ff d3 86    	add    %al,-0x792c0001(%rax)
ffff80000010d972:	10 00                	adc    %al,(%rax)
ffff80000010d974:	00 80 ff ff 1d 87    	add    %al,-0x78e20001(%rax)
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
ffff80000010d99d:	25 78 0a 00        	and    $0x25000a78,%eax

ffff80000010d9a1 <.LC1>:
ffff80000010d9a1:	25 64 00 00 00       	and    $0x64,%eax
	...

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
ffff80000010e407:	ff 6a 02             	ljmp   *0x2(%rdx)
ffff80000010e40a:	00 00                	add    %al,(%rax)
ffff80000010e40c:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e40f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e415:	43 8f 03             	rex.XB popq (%r11)
ffff80000010e418:	83 04 00 00          	addl   $0x0,(%rax,%rax,1)
ffff80000010e41c:	00 00                	add    %al,(%rax)
ffff80000010e41e:	00 00                	add    %al,(%rax)
ffff80000010e420:	1c 00                	sbb    $0x0,%al
ffff80000010e422:	00 00                	add    %al,(%rax)
ffff80000010e424:	8c 01                	mov    %es,(%rcx)
ffff80000010e426:	00 00                	add    %al,(%rax)
ffff80000010e428:	1a 65 ff             	sbb    -0x1(%rbp),%ah
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
ffff80000010e447:	00 01                	add    %al,(%rcx)
ffff80000010e449:	66 ff                	data16 (bad) 
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
ffff80000010e467:	00 e7                	add    %ah,%bh
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
ffff80000010e48b:	00 8a 6a ff ff 9a    	add    %cl,-0x65000096(%rdx)
ffff80000010e491:	03 00                	add    (%rax),%eax
ffff80000010e493:	00 00                	add    %al,(%rax)
ffff80000010e495:	41 0e                	rex.B (bad) 
ffff80000010e497:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e49d:	48 83 03 03          	addq   $0x3,(%rbx)
ffff80000010e4a1:	8d 03                	lea    (%rbx),%eax
ffff80000010e4a3:	0c 07                	or     $0x7,%al
ffff80000010e4a5:	08 00                	or     %al,(%rax)
ffff80000010e4a7:	00 18                	add    %bl,(%rax)
ffff80000010e4a9:	00 00                	add    %al,(%rax)
ffff80000010e4ab:	00 14 02             	add    %dl,(%rdx,%rax,1)
ffff80000010e4ae:	00 00                	add    %al,(%rax)
ffff80000010e4b0:	00 6e ff             	add    %ch,-0x1(%rsi)
ffff80000010e4b3:	ff 83 00 00 00 00    	incl   0x0(%rbx)
ffff80000010e4b9:	41 0e                	rex.B (bad) 
ffff80000010e4bb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e4c1:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e4c4:	18 00                	sbb    %al,(%rax)
ffff80000010e4c6:	00 00                	add    %al,(%rax)
ffff80000010e4c8:	30 02                	xor    %al,(%rdx)
ffff80000010e4ca:	00 00                	add    %al,(%rax)
ffff80000010e4cc:	67 6e                	outsb  %ds:(%esi),(%dx)
ffff80000010e4ce:	ff                   	(bad)  
ffff80000010e4cf:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010e4d5:	41 0e                	rex.B (bad) 
ffff80000010e4d7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e4dd:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e4e0:	18 00                	sbb    %al,(%rax)
ffff80000010e4e2:	00 00                	add    %al,(%rax)
ffff80000010e4e4:	4c 02 00             	rex.WR add (%rax),%r8b
ffff80000010e4e7:	00 d1                	add    %dl,%cl
ffff80000010e4e9:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010e4ea:	ff                   	(bad)  
ffff80000010e4eb:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010e4f1:	41 0e                	rex.B (bad) 
ffff80000010e4f3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e4f9:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e4fc:	18 00                	sbb    %al,(%rax)
ffff80000010e4fe:	00 00                	add    %al,(%rax)
ffff80000010e500:	68 02 00 00 3b       	pushq  $0x3b000002
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
ffff80000010e520:	a5                   	movsl  %ds:(%rsi),%es:(%rdi)
ffff80000010e521:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010e522:	ff                   	(bad)  
ffff80000010e523:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010e529:	41 0e                	rex.B (bad) 
ffff80000010e52b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e531:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e534:	18 00                	sbb    %al,(%rax)
ffff80000010e536:	00 00                	add    %al,(%rax)
ffff80000010e538:	a0 02 00 00 0f 70 ff 	movabs 0x86ffff700f000002,%al
ffff80000010e53f:	ff 86 
ffff80000010e541:	00 00                	add    %al,(%rax)
ffff80000010e543:	00 00                	add    %al,(%rax)
ffff80000010e545:	41 0e                	rex.B (bad) 
ffff80000010e547:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e54d:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e550:	18 00                	sbb    %al,(%rax)
ffff80000010e552:	00 00                	add    %al,(%rax)
ffff80000010e554:	bc 02 00 00 79       	mov    $0x79000002,%esp
ffff80000010e559:	70 ff                	jo     ffff80000010e55a <_erodata+0x2c4>
ffff80000010e55b:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010e561:	41 0e                	rex.B (bad) 
ffff80000010e563:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e569:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e56c:	18 00                	sbb    %al,(%rax)
ffff80000010e56e:	00 00                	add    %al,(%rax)
ffff80000010e570:	d8 02                	fadds  (%rdx)
ffff80000010e572:	00 00                	add    %al,(%rax)
ffff80000010e574:	e3 70                	jrcxz  ffff80000010e5e6 <_erodata+0x350>
ffff80000010e576:	ff                   	(bad)  
ffff80000010e577:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010e57d:	41 0e                	rex.B (bad) 
ffff80000010e57f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e585:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e588:	18 00                	sbb    %al,(%rax)
ffff80000010e58a:	00 00                	add    %al,(%rax)
ffff80000010e58c:	f4                   	hlt    
ffff80000010e58d:	02 00                	add    (%rax),%al
ffff80000010e58f:	00 4d 71             	add    %cl,0x71(%rbp)
ffff80000010e592:	ff                   	(bad)  
ffff80000010e593:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010e599:	41 0e                	rex.B (bad) 
ffff80000010e59b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e5a1:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e5a4:	18 00                	sbb    %al,(%rax)
ffff80000010e5a6:	00 00                	add    %al,(%rax)
ffff80000010e5a8:	10 03                	adc    %al,(%rbx)
ffff80000010e5aa:	00 00                	add    %al,(%rax)
ffff80000010e5ac:	b7 71                	mov    $0x71,%bh
ffff80000010e5ae:	ff                   	(bad)  
ffff80000010e5af:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010e5b5:	41 0e                	rex.B (bad) 
ffff80000010e5b7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e5bd:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e5c0:	1c 00                	sbb    $0x0,%al
ffff80000010e5c2:	00 00                	add    %al,(%rax)
ffff80000010e5c4:	2c 03                	sub    $0x3,%al
ffff80000010e5c6:	00 00                	add    %al,(%rax)
ffff80000010e5c8:	21 72 ff             	and    %esi,-0x1(%rdx)
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
ffff80000010e5e7:	00 e3                	add    %ah,%bl
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
ffff80000010e607:	00 a5 75 ff ff e2    	add    %ah,-0x1d00008b(%rbp)
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
ffff80000010e628:	67 77 ff             	addr32 ja ffff80000010e62a <_erodata+0x394>
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
ffff80000010e647:	00 29                	add    %ch,(%rcx)
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
ffff80000010e667:	00 5f 7b             	add    %bl,0x7b(%rdi)
ffff80000010e66a:	ff                   	(bad)  
ffff80000010e66b:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010e671:	41 0e                	rex.B (bad) 
ffff80000010e673:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e679:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e67c:	18 00                	sbb    %al,(%rax)
ffff80000010e67e:	00 00                	add    %al,(%rax)
ffff80000010e680:	e8 03 00 00 c9       	callq  ffff7fffc910e688 <OLDSS+0xffff7fffc910e5d0>
ffff80000010e685:	7b ff                	jnp    ffff80000010e686 <_erodata+0x3f0>
ffff80000010e687:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010e68d:	41 0e                	rex.B (bad) 
ffff80000010e68f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e695:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e698:	18 00                	sbb    %al,(%rax)
ffff80000010e69a:	00 00                	add    %al,(%rax)
ffff80000010e69c:	04 04                	add    $0x4,%al
ffff80000010e69e:	00 00                	add    %al,(%rax)
ffff80000010e6a0:	33 7c ff ff          	xor    -0x1(%rdi,%rdi,8),%edi
ffff80000010e6a4:	86 00                	xchg   %al,(%rax)
ffff80000010e6a6:	00 00                	add    %al,(%rax)
ffff80000010e6a8:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e6ab:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e6b1:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e6b4:	18 00                	sbb    %al,(%rax)
ffff80000010e6b6:	00 00                	add    %al,(%rax)
ffff80000010e6b8:	20 04 00             	and    %al,(%rax,%rax,1)
ffff80000010e6bb:	00 9d 7c ff ff 86    	add    %bl,-0x79000084(%rbp)
ffff80000010e6c1:	00 00                	add    %al,(%rax)
ffff80000010e6c3:	00 00                	add    %al,(%rax)
ffff80000010e6c5:	41 0e                	rex.B (bad) 
ffff80000010e6c7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e6cd:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e6d0:	18 00                	sbb    %al,(%rax)
ffff80000010e6d2:	00 00                	add    %al,(%rax)
ffff80000010e6d4:	3c 04                	cmp    $0x4,%al
ffff80000010e6d6:	00 00                	add    %al,(%rax)
ffff80000010e6d8:	07                   	(bad)  
ffff80000010e6d9:	7d ff                	jge    ffff80000010e6da <_erodata+0x444>
ffff80000010e6db:	ff 86 00 00 00 00    	incl   0x0(%rsi)
ffff80000010e6e1:	41 0e                	rex.B (bad) 
ffff80000010e6e3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e6e9:	46 8f 03             	rex.RX popq (%rbx)
ffff80000010e6ec:	20 00                	and    %al,(%rax)
ffff80000010e6ee:	00 00                	add    %al,(%rax)
ffff80000010e6f0:	58                   	pop    %rax
ffff80000010e6f1:	04 00                	add    $0x0,%al
ffff80000010e6f3:	00 71 7d             	add    %dh,0x7d(%rcx)
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
ffff80000010e718:	56                   	push   %rsi
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
ffff80000010e737:	00 b8 81 ff ff 6d    	add    %bh,0x6dffff81(%rax)
ffff80000010e73d:	00 00                	add    %al,(%rax)
ffff80000010e73f:	00 00                	add    %al,(%rax)
ffff80000010e741:	41 0e                	rex.B (bad) 
ffff80000010e743:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e749:	02 68 0c             	add    0xc(%rax),%ch
ffff80000010e74c:	07                   	(bad)  
ffff80000010e74d:	08 00                	or     %al,(%rax)
ffff80000010e74f:	00 20                	add    %ah,(%rax)
ffff80000010e751:	00 00                	add    %al,(%rax)
ffff80000010e753:	00 bc 04 00 00 05 82 	add    %bh,-0x7dfb0000(%rsp,%rax,1)
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
ffff80000010e77c:	51                   	push   %rcx
ffff80000010e77d:	82                   	(bad)  
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
ffff80000010e7a0:	aa                   	stos   %al,%es:(%rdi)
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
ffff80000010e7c1:	05 00 00 56 90       	add    $0x90560000,%eax
ffff80000010e7c6:	ff                   	(bad)  
ffff80000010e7c7:	ff 92 03 00 00 00    	callq  *0x3(%rdx)
ffff80000010e7cd:	41 0e                	rex.B (bad) 
ffff80000010e7cf:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e7d5:	47 8f 03             	rex.RXB popq (%r11)
ffff80000010e7d8:	83 04 03 86          	addl   $0xffffff86,(%rbx,%rax,1)
ffff80000010e7dc:	03 0c 07             	add    (%rdi,%rax,1),%ecx
ffff80000010e7df:	08 24 00             	or     %ah,(%rax,%rax,1)
ffff80000010e7e2:	00 00                	add    %al,(%rax)
ffff80000010e7e4:	4c 05 00 00 c4 93    	rex.WR add $0xffffffff93c40000,%rax
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
ffff80000010e810:	12 95 ff ff 57 00    	adc    0x57ffff(%rbp),%dl
ffff80000010e816:	00 00                	add    %al,(%rax)
ffff80000010e818:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e81b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e821:	02 52 0c             	add    0xc(%rdx),%dl
ffff80000010e824:	07                   	(bad)  
ffff80000010e825:	08 00                	or     %al,(%rax)
ffff80000010e827:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010e82a:	00 00                	add    %al,(%rax)
ffff80000010e82c:	94                   	xchg   %eax,%esp
ffff80000010e82d:	05 00 00 49 95       	add    $0x95490000,%eax
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
ffff80000010e850:	93                   	xchg   %eax,%ebx
ffff80000010e851:	95                   	xchg   %eax,%ebp
ffff80000010e852:	ff                   	(bad)  
ffff80000010e853:	ff 25 00 00 00 00    	jmpq   *0x0(%rip)        # ffff80000010e859 <_erodata+0x5c3>
ffff80000010e859:	41 0e                	rex.B (bad) 
ffff80000010e85b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e861:	60                   	(bad)  
ffff80000010e862:	0c 07                	or     $0x7,%al
ffff80000010e864:	08 00                	or     %al,(%rax)
ffff80000010e866:	00 00                	add    %al,(%rax)
ffff80000010e868:	1c 00                	sbb    $0x0,%al
ffff80000010e86a:	00 00                	add    %al,(%rax)
ffff80000010e86c:	d4                   	(bad)  
ffff80000010e86d:	05 00 00 98 95       	add    $0x95980000,%eax
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
ffff80000010e88d:	05 00 00 9d 95       	add    $0x959d0000,%eax
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
ffff80000010e8b0:	af                   	scas   %es:(%rdi),%eax
ffff80000010e8b1:	95                   	xchg   %eax,%ebp
ffff80000010e8b2:	ff                   	(bad)  
ffff80000010e8b3:	ff 35 00 00 00 00    	pushq  0x0(%rip)        # ffff80000010e8b9 <_erodata+0x623>
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
ffff80000010e8d0:	c4                   	(bad)  
ffff80000010e8d1:	95                   	xchg   %eax,%ebp
ffff80000010e8d2:	ff                   	(bad)  
ffff80000010e8d3:	ff 36                	pushq  (%rsi)
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
ffff80000010e8f0:	da 95 ff ff 59 00    	ficoml 0x59ffff(%rbp)
ffff80000010e8f6:	00 00                	add    %al,(%rax)
ffff80000010e8f8:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e8fb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e901:	02 54 0c 07          	add    0x7(%rsp,%rcx,1),%dl
ffff80000010e905:	08 00                	or     %al,(%rax)
ffff80000010e907:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010e90a:	00 00                	add    %al,(%rax)
ffff80000010e90c:	74 06                	je     ffff80000010e914 <_erodata+0x67e>
ffff80000010e90e:	00 00                	add    %al,(%rax)
ffff80000010e910:	13 96 ff ff 57 00    	adc    0x57ffff(%rsi),%edx
ffff80000010e916:	00 00                	add    %al,(%rax)
ffff80000010e918:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e91b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e921:	02 52 0c             	add    0xc(%rdx),%dl
ffff80000010e924:	07                   	(bad)  
ffff80000010e925:	08 00                	or     %al,(%rax)
ffff80000010e927:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010e92a:	00 00                	add    %al,(%rax)
ffff80000010e92c:	94                   	xchg   %eax,%esp
ffff80000010e92d:	06                   	(bad)  
ffff80000010e92e:	00 00                	add    %al,(%rax)
ffff80000010e930:	4a 96                	rex.WX xchg %rax,%rsi
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
ffff80000010e950:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000010e951:	96                   	xchg   %eax,%esi
ffff80000010e952:	ff                   	(bad)  
ffff80000010e953:	ff 45 00             	incl   0x0(%rbp)
ffff80000010e956:	00 00                	add    %al,(%rax)
ffff80000010e958:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010e95b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010e961:	02 40 0c             	add    0xc(%rax),%al
ffff80000010e964:	07                   	(bad)  
ffff80000010e965:	08 00                	or     %al,(%rax)
ffff80000010e967:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010e96a:	00 00                	add    %al,(%rax)
ffff80000010e96c:	d4                   	(bad)  
ffff80000010e96d:	06                   	(bad)  
ffff80000010e96e:	00 00                	add    %al,(%rax)
ffff80000010e970:	93                   	xchg   %eax,%ebx
ffff80000010e971:	96                   	xchg   %eax,%esi
ffff80000010e972:	ff                   	(bad)  
ffff80000010e973:	ff                   	(bad)  
ffff80000010e974:	3a 00                	cmp    (%rax),%al
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
ffff80000010e990:	ad                   	lods   %ds:(%rsi),%eax
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
ffff80000010e9b0:	b7 9d                	mov    $0x9d,%bh
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
ffff80000010e9d4:	51                   	push   %rcx
ffff80000010e9d5:	9f                   	lahf   
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
ffff80000010e9f8:	cf                   	iret   
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
ffff80000010ea1b:	00 02                	add    %al,(%rdx)
ffff80000010ea1d:	a0 ff ff 34 00 00 00 	movabs 0x410000000034ffff,%al
ffff80000010ea24:	00 41 
ffff80000010ea26:	0e                   	(bad)  
ffff80000010ea27:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010ea2d:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000010ea2e:	0c 07                	or     $0x7,%al
ffff80000010ea30:	08 00                	or     %al,(%rax)
ffff80000010ea32:	00 00                	add    %al,(%rax)
ffff80000010ea34:	20 00                	and    %al,(%rax)
ffff80000010ea36:	00 00                	add    %al,(%rax)
ffff80000010ea38:	a0 07 00 00 16 a0 ff 	movabs 0x6fffffa016000007,%al
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
ffff80000010ea60:	61                   	(bad)  
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
ffff80000010ea80:	e8 07 00 00 99       	callq  ffff7fff9910ea8c <OLDSS+0xffff7fff9910e9d4>
ffff80000010ea85:	a0 ff ff aa 00 00 00 	movabs 0x4100000000aaffff,%al
ffff80000010ea8c:	00 41 
ffff80000010ea8e:	0e                   	(bad)  
ffff80000010ea8f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010ea95:	02 a5 0c 07 08 00    	add    0x8070c(%rbp),%ah
ffff80000010ea9b:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010ea9e:	00 00                	add    %al,(%rax)
ffff80000010eaa0:	08 08                	or     %cl,(%rax)
ffff80000010eaa2:	00 00                	add    %al,(%rax)
ffff80000010eaa4:	23 a1 ff ff 53 00    	and    0x53ffff(%rcx),%esp
ffff80000010eaaa:	00 00                	add    %al,(%rax)
ffff80000010eaac:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010eaaf:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010eab5:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010eab8:	07                   	(bad)  
ffff80000010eab9:	08 00                	or     %al,(%rax)
ffff80000010eabb:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010eabe:	00 00                	add    %al,(%rax)
ffff80000010eac0:	28 08                	sub    %cl,(%rax)
ffff80000010eac2:	00 00                	add    %al,(%rax)
ffff80000010eac4:	56                   	push   %rsi
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
ffff80000010eae3:	00 89 a1 ff ff 53    	add    %cl,0x53ffffa1(%rcx)
ffff80000010eae9:	00 00                	add    %al,(%rax)
ffff80000010eaeb:	00 00                	add    %al,(%rax)
ffff80000010eaed:	41 0e                	rex.B (bad) 
ffff80000010eaef:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010eaf5:	02 4e 0c             	add    0xc(%rsi),%cl
ffff80000010eaf8:	07                   	(bad)  
ffff80000010eaf9:	08 00                	or     %al,(%rax)
ffff80000010eafb:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010eafe:	00 00                	add    %al,(%rax)
ffff80000010eb00:	68 08 00 00 bc       	pushq  $0xffffffffbc000008
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
ffff80000010eb24:	ef                   	out    %eax,(%dx)
ffff80000010eb25:	a1 ff ff 15 01 00 00 	movabs 0x410000000115ffff,%eax
ffff80000010eb2c:	00 41 
ffff80000010eb2e:	0e                   	(bad)  
ffff80000010eb2f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010eb35:	03 10                	add    (%rax),%edx
ffff80000010eb37:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff80000010eb3a:	08 00                	or     %al,(%rax)
ffff80000010eb3c:	18 00                	sbb    %al,(%rax)
ffff80000010eb3e:	00 00                	add    %al,(%rax)
ffff80000010eb40:	a8 08                	test   $0x8,%al
ffff80000010eb42:	00 00                	add    %al,(%rax)
ffff80000010eb44:	e4 a2                	in     $0xa2,%al
ffff80000010eb46:	ff                   	(bad)  
ffff80000010eb47:	ff 59 00             	lcall  *0x0(%rcx)
ffff80000010eb4a:	00 00                	add    %al,(%rax)
ffff80000010eb4c:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000010eb4f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010eb55:	00 00                	add    %al,(%rax)
ffff80000010eb57:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000010eb5a:	00 00                	add    %al,(%rax)
ffff80000010eb5c:	c4                   	(bad)  
ffff80000010eb5d:	08 00                	or     %al,(%rax)
ffff80000010eb5f:	00 21                	add    %ah,(%rcx)
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
ffff80000010eb7f:	00 48 a3             	add    %cl,-0x5d(%rax)
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
ffff80000010eba4:	ed                   	in     (%dx),%eax
ffff80000010eba5:	a3 ff ff 4b 00 00 00 	movabs %eax,0x41000000004bffff
ffff80000010ebac:	00 41 
ffff80000010ebae:	0e                   	(bad)  
ffff80000010ebaf:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000010ebb5:	02 46 0c             	add    0xc(%rsi),%al
ffff80000010ebb8:	07                   	(bad)  
ffff80000010ebb9:	08 00                	or     %al,(%rax)
ffff80000010ebbb:	00 24 00             	add    %ah,(%rax,%rax,1)
ffff80000010ebbe:	00 00                	add    %al,(%rax)
ffff80000010ebc0:	28 09                	sub    %cl,(%rcx)
ffff80000010ebc2:	00 00                	add    %al,(%rax)
ffff80000010ebc4:	18 a4 ff ff 3b 01 00 	sbb    %ah,0x13bff(%rdi,%rdi,8)
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
ffff80000010ebeb:	00 2b                	add    %ch,(%rbx)
ffff80000010ebed:	a5                   	movsl  %ds:(%rsi),%es:(%rdi)
ffff80000010ebee:	ff                   	(bad)  
ffff80000010ebef:	ff 5f 01             	lcall  *0x1(%rdi)
ffff80000010ebf2:	00 00                	add    %al,(%rax)
ffff80000010ebf4:	00 41 0e             	add    %al,0xe(%rcx)
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
ffff80000010ec14:	62                   	(bad)  
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
ffff80000010ec3b:	00 a4 09 00 00 41 aa 	add    %ah,-0x55bf0000(%rcx,%rcx,1)
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
ffff80000010ec64:	04 ab                	add    $0xab,%al
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
ffff80000010ec87:	00 53 ad             	add    %dl,-0x53(%rbx)
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
ffff80000010eca8:	87 ad ff ff 57 00    	xchg   %ebp,0x57ffff(%rbp)
ffff80000010ecae:	00 00                	add    %al,(%rax)
ffff80000010ecb0:	00 41 0e             	add    %al,0xe(%rcx)
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
ffff80000010eccc:	ba ad ff ff ec       	mov    $0xecffffad,%edx
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
