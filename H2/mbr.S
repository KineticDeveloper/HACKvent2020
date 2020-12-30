
strange.gif:     file format binary


Disassembly of section .data:

00000000 <.data>:
   0:	47                   	inc    %di
   1:	49                   	dec    %cx
   2:	46                   	inc    %si
   3:	38 39                	cmp    %bh,(%bx,%di)
   5:	61                   	popa   
   6:	80 00 10             	addb   $0x10,(%bx,%si)
   9:	00 a1 03 00          	add    %ah,0x3(%bx,%di)
   d:	00 00                	add    %al,(%bx,%si)
   f:	00 fe                	add    %bh,%dh
  11:	00 00                	add    %al,(%bx,%si)
  13:	9d                   	popf   
  14:	9d                   	popf   
  15:	9d                   	popf   
  16:	fd                   	std    
  17:	fd                   	std    
  18:	fd                   	std    
  19:	21 fe                	and    %di,%si
  1b:	03 00                	add    (%bx,%si),%ax
  1d:	eb 04                	jmp    0x23
  1f:	00 21                	add    %ah,(%bx,%di)
  21:	fe                   	(bad)  
  22:	ee                   	out    %al,(%dx)
  23:	31 db                	xor    %bx,%bx
  25:	b4 0e                	mov    $0xe,%ah
  27:	8a 87 f4 7c          	mov    0x7cf4(%bx),%al
  2b:	8a 8f 9e 7c          	mov    0x7c9e(%bx),%cl
  2f:	84 c0                	test   %al,%al
  31:	74 07                	je     0x3a
  33:	30 c8                	xor    %cl,%al
  35:	cd 10                	int    $0x10
  37:	43                   	inc    %bx
  38:	eb ed                	jmp    0x27
  3a:	b8 00 07             	mov    $0x700,%ax
  3d:	b7 f0                	mov    $0xf0,%bh
  3f:	31 c9                	xor    %cx,%cx
  41:	ba 50 19             	mov    $0x1950,%dx
  44:	cd 10                	int    $0x10
  46:	b4 02                	mov    $0x2,%ah
  48:	b7 00                	mov    $0x0,%bh
  4a:	ba 00 06             	mov    $0x600,%dx
  4d:	cd 10                	int    $0x10
  4f:	ba 03 00             	mov    $0x3,%dx
  52:	be 44 01             	mov    $0x144,%si
  55:	31 ff                	xor    %di,%di
  57:	85 ff                	test   %di,%di
  59:	75 1e                	jne    0x79
  5b:	81 fe e0 00          	cmp    $0xe0,%si
  5f:	75 02                	jne    0x63
  61:	fa                   	cli    
  62:	f4                   	hlt    
  63:	b8 0d 0e             	mov    $0xe0d,%ax
  66:	cd 10                	int    $0x10
  68:	b0 0a                	mov    $0xa,%al
  6a:	cd 10                	int    $0x10
  6c:	b9 1b 00             	mov    $0x1b,%cx
  6f:	b0 20                	mov    $0x20,%al
  71:	cd 10                	int    $0x10
  73:	49                   	dec    %cx
  74:	75 f9                	jne    0x6f
  76:	bf 19 00             	mov    $0x19,%di
  79:	89 f1                	mov    %si,%cx
  7b:	21 d1                	and    %dx,%cx
  7d:	01 c9                	add    %cx,%cx
  7f:	89 f3                	mov    %si,%bx
  81:	c1 eb 02             	shr    $0x2,%bx
  84:	8b af 9e 7c          	mov    0x7c9e(%bx),%bp
  88:	d3 ed                	shr    %cl,%bp
  8a:	21 d5                	and    %dx,%bp
  8c:	8a 86 f0 7c          	mov    0x7cf0(%bp),%al
  90:	cd 10                	int    $0x10
  92:	4f                   	dec    %di
  93:	4e                   	dec    %si
  94:	75 c1                	jne    0x57
  96:	b4 01                	mov    $0x1,%ah
  98:	b5 3f                	mov    $0x3f,%ch
  9a:	cd 10                	int    $0x10
  9c:	fa                   	cli    
  9d:	f4                   	hlt    
  9e:	55                   	push   %bp
  9f:	5d                   	pop    %bp
  a0:	df d5                	(bad)  
  a2:	5d                   	pop    %bp
  a3:	55                   	push   %bp
  a4:	0d 5e 6f             	or     $0x6f5e,%ax
  a7:	03 39                	add    (%bx,%di),%di
  a9:	57                   	push   %di
  aa:	23 11                	and    (%bx,%di),%dx
  ac:	94                   	xchg   %ax,%sp
  ad:	1b de                	sbb    %si,%bx
  af:	0c 8c                	or     $0x8c,%al
  b1:	2b 37                	sub    (%bx),%si
  b3:	bf 80 53             	mov    $0x5380,%di
  b6:	15 4e 54             	adc    $0x544e,%ax
  b9:	94                   	xchg   %ax,%sp
  ba:	9a d6 5f 2d a1       	lcall  $0xa12d,$0x5fd6
  bf:	cf                   	iret   
  c0:	cf                   	iret   
  c1:	50                   	push   %ax
  c2:	8a 0f                	mov    (%bx),%cl
  c4:	a5                   	movsw  %ds:(%si),%es:(%di)
  c5:	9d                   	popf   
  c6:	a9 ed 29             	test   $0x29ed,%ax
  c9:	84 48 6c             	test   %cl,0x6c(%bx,%si)
  cc:	9c                   	pushf  
  cd:	f8                   	clc    
  ce:	44                   	inc    %sp
  cf:	8e 51 b2             	mov    -0x4e(%bx,%di),%ss
  d2:	a9 b9 1f             	test   $0x1fb9,%ax
  d5:	39 54 55             	cmp    %dx,0x55(%si)
  d8:	37                   	aaa    
  d9:	63 76 55             	arpl   %si,0x55(%bp)
  dc:	c5 d5 7c 49 e4       	vhaddpd -0x1c(%bx,%di),%ymm5,%ymm1
  e1:	5c                   	pop    %sp
  e2:	0d 03 73             	or     $0x7303,%ax
  e5:	a4                   	movsb  %ds:(%si),%es:(%di)
  e6:	16                   	push   %ss
  e7:	33 30                	xor    (%bx,%si),%si
  e9:	54                   	push   %sp
  ea:	c5 44 97             	lds    -0x69(%si),%ax
  ed:	4c                   	dec    %sp
  ee:	55                   	push   %bp
  ef:	00 db                	add    %bl,%bl
  f1:	df dc                	(bad)  
  f3:	20 58 57             	and    %bl,0x57(%bx,%si)
  f6:	97                   	xchg   %ax,%di
  f7:	83 6f 65 76          	subw   $0x76,0x65(%bx)
  fb:	36 5e                	ss pop %si
  fd:	67 5d                	addr32 pop %bp
  ff:	64 4d                	fs dec %bp
 101:	3c a5                	cmp    $0xa5,%al
 103:	75 f3                	jne    0xf8
 105:	7c e0                	jl     0xe7
 107:	1f                   	pop    %ds
 108:	06                   	push   %es
 109:	d1 ad 66 24          	shrw   0x2466(%di)
 10d:	78 3c                	js     0x14b
 10f:	a3 e7 00             	mov    %ax,0xe7
 112:	2c 00                	sub    $0x0,%al
 114:	00 00                	add    %al,(%bx,%si)
 116:	00 80 00 10          	add    %al,0x1000(%bx,%si)
 11a:	00 00                	add    %al,(%bx,%si)
 11c:	02 c7                	add    %bh,%al
 11e:	84 8f a9 cb          	test   %cl,-0x3457(%bx)
 122:	ed                   	in     (%dx),%ax
 123:	cf                   	iret   
 124:	86 9c f2 d0          	xchg   %bl,-0x2f0e(%si)
 128:	8b 33                	mov    (%bp,%di),%si
 12a:	76 17                	jbe    0x143
 12c:	08 0f                	or     %cl,(%bx)
 12e:	7e 62                	jle    0x192
 130:	48                   	dec    %ax
 131:	8e 66 89             	mov    -0x77(%bp),%fs
 134:	9e                   	sahf   
 135:	6a ca                	push   $0xffca
 137:	1a 19                	sbb    (%bx,%di),%bl
 139:	10 04                	adc    %al,(%si)
 13b:	80 46 77 48          	addb   $0x48,0x77(%bp)
 13f:	8c e7                	mov    %fs,%di
 141:	f2 5c                	repnz pop %sp
 143:	ad                   	lods   %ds:(%si),%ax
 144:	3e fb                	ds sti 
 146:	0b 02                	or     (%bp,%si),%ax
 148:	87 23                	xchg   %sp,(%bp,%di)
 14a:	d0 06 c7 ab          	rolb   -0x5439
 14e:	51                   	push   %cx
 14f:	12 ba 66 93          	adc    -0x6c9a(%bp,%si),%bh
 153:	67 10 4a 89          	adc    %cl,-0x77(%edx)
 157:	d4 a9                	aam    $0xa9
 159:	ef                   	out    %ax,(%dx)
 15a:	d3 c9                	ror    %cl,%cx
 15c:	25 5f 37             	and    $0x375f,%ax
 15f:	a7                   	cmpsw  %es:(%di),%ds:(%si)
 160:	f7 59 a9             	negw   -0x57(%bx,%di)
 163:	8a ad e3 aa          	mov    -0x551d(%di),%ch
 167:	e0 c3                	loopne 0x12c
 169:	d4 36                	aam    $0x36
 16b:	be ec ef             	mov    $0xefec,%si
 16e:	ac                   	lods   %ds:(%si),%al
 16f:	4c                   	dec    %sp
 170:	8e c3                	mov    %bx,%es
 172:	49                   	dec    %cx
 173:	9e                   	sahf   
 174:	b3 fd                	mov    $0xfd,%bl
 176:	0c 6b                	or     $0x6b,%al
 178:	eb f7                	jmp    0x171
 17a:	ce                   	into   
 17b:	e8 5c 0e             	call   0xfda
 17e:	28 56 77             	sub    %dl,0x77(%bp)
 181:	87 c7                	xchg   %ax,%di
 183:	67 68 78 10          	addr32 push $0x1078
 187:	a8 f8                	test   $0xf8,%al
 189:	47                   	inc    %di
 18a:	44                   	inc    %sp
 18b:	58                   	pop    %ax
 18c:	78 08                	js     0x196
 18e:	c9                   	leave  
 18f:	96                   	xchg   %ax,%si
 190:	c8 b8 58 59          	enter  $0x58b8,$0x59
 194:	e2 f8                	loop   0x18e
 196:	11 a9 d9 47          	adc    %bp,0x47d9(%bx,%di)
 19a:	d9 69 59             	fldcw  0x59(%bx,%di)
 19d:	84 99 b9 39          	test   %bl,0x39b9(%bx,%di)
 1a1:	1a e3                	sbb    %bl,%ah
 1a3:	f7 e9                	imul   %cx
 1a5:	c9                   	leave  
 1a6:	38 48 98             	cmp    %cl,-0x68(%bx,%si)
 1a9:	47                   	inc    %di
 1aa:	ba 39 79             	mov    $0x7939,%dx
 1ad:	0a 0b                	or     (%bp,%di),%cl
 1af:	87 97 86 b4          	xchg   %dx,-0x4b7a(%bx)
 1b3:	d6                   	(bad)  
 1b4:	aa                   	stos   %al,%es:(%di)
 1b5:	35 60 8a             	xor    $0x8a60,%ax
 1b8:	1a 1b                	sbb    (%bp,%di),%bl
 1ba:	87 b5 84 4b          	xchg   %si,0x4b84(%di)
 1be:	43                   	inc    %bx
 1bf:	ab                   	stos   %ax,%es:(%di)
 1c0:	09 c5                	or     %ax,%bp
 1c2:	bb 5b 66             	mov    $0x665b,%bx
 1c5:	94                   	xchg   %ax,%sp
 1c6:	55                   	push   %bp
 1c7:	aa                   	stos   %al,%es:(%di)
 1c8:	64 73 00             	fs jae 0x1cb
 1cb:	49                   	dec    %cx
 1cc:	6c                   	insb   (%dx),%es:(%di)
 1cd:	5c                   	pop    %sp
 1ce:	3c e5                	cmp    $0xe5,%al
 1d0:	72 24                	jb     0x1f6
 1d2:	b3 5c                	mov    $0x5c,%bl
 1d4:	23 fc                	and    %sp,%di
 1d6:	94                   	xchg   %ax,%sp
 1d7:	04 b1                	add    $0xb1,%al
 1d9:	cd dd                	int    $0xdd
 1db:	ed                   	in     (%dx),%ax
 1dc:	8d a0 61 61          	lea    0x6161(%bx,%si),%sp
 1e0:	3d ce 41             	cmp    $0x41ce,%ax
 1e3:	51                   	push   %cx
 1e4:	00 00                	add    %al,(%bx,%si)
 1e6:	21 fe                	and    %di,%si
 1e8:	11 75 76             	adc    %si,0x76(%di)
 1eb:	61                   	popa   
 1ec:	67 3a 2d 2d 78 72 72 	addr32 cmp 0x7272782d,%ch
 1f3:	63 2d                	arpl   %bp,(%di)
 1f5:	74 62                	je     0x259
 1f7:	76 61                	jbe    0x25a
 1f9:	74 00                	je     0x1fb
 1fb:	3b 00                	cmp    (%bx,%si),%ax
 1fd:	00 55 aa             	add    %dl,-0x56(%di)
