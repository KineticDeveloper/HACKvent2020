
strange.gif:     file format binary


Disassembly of section .data:

00000000 <.data>:
   0:	47                   	inc    di
   1:	49                   	dec    cx
   2:	46                   	inc    si
   3:	38 39                	cmp    BYTE PTR [bx+di],bh
   5:	61                   	popa   
   6:	80 00 10             	add    BYTE PTR [bx+si],0x10
   9:	00 a1 03 00          	add    BYTE PTR [bx+di+0x3],ah
   d:	00 00                	add    BYTE PTR [bx+si],al
   f:	00 fe                	add    dh,bh
  11:	00 00                	add    BYTE PTR [bx+si],al
  13:	9d                   	popf   
  14:	9d                   	popf   
  15:	9d                   	popf   
  16:	fd                   	std    
  17:	fd                   	std    
  18:	fd                   	std    
  19:	21 fe                	and    si,di
  1b:	03 00                	add    ax,WORD PTR [bx+si]
  1d:	eb 04                	jmp    0x23
  1f:	00 21                	add    BYTE PTR [bx+di],ah
  21:	fe                   	(bad)  
  22:	ee                   	out    dx,al
  23:	31 db                	xor    bx,bx
  25:	b4 0e                	mov    ah,0xe
  27:	8a 87 f4 7c          	mov    al,BYTE PTR [bx+0x7cf4]
  2b:	8a 8f 9e 7c          	mov    cl,BYTE PTR [bx+0x7c9e]
  2f:	84 c0                	test   al,al
  31:	74 07                	je     0x3a
  33:	30 c8                	xor    al,cl
  35:	cd 10                	int    0x10
  37:	43                   	inc    bx
  38:	eb ed                	jmp    0x27
  3a:	b8 00 07             	mov    ax,0x700
  3d:	b7 f0                	mov    bh,0xf0
  3f:	31 c9                	xor    cx,cx
  41:	ba 50 19             	mov    dx,0x1950
  44:	cd 10                	int    0x10
  46:	b4 02                	mov    ah,0x2
  48:	b7 00                	mov    bh,0x0
  4a:	ba 00 06             	mov    dx,0x600
  4d:	cd 10                	int    0x10
  4f:	ba 03 00             	mov    dx,0x3
  52:	be 44 01             	mov    si,0x144
  55:	31 ff                	xor    di,di
  57:	85 ff                	test   di,di
  59:	75 1e                	jne    0x79
  5b:	81 fe e0 00          	cmp    si,0xe0
  5f:	75 02                	jne    0x63
  61:	fa                   	cli    
  62:	f4                   	hlt    
  63:	b8 0d 0e             	mov    ax,0xe0d
  66:	cd 10                	int    0x10
  68:	b0 0a                	mov    al,0xa
  6a:	cd 10                	int    0x10
  6c:	b9 1b 00             	mov    cx,0x1b
  6f:	b0 20                	mov    al,0x20
  71:	cd 10                	int    0x10
  73:	49                   	dec    cx
  74:	75 f9                	jne    0x6f
  76:	bf 19 00             	mov    di,0x19
  79:	89 f1                	mov    cx,si
  7b:	21 d1                	and    cx,dx
  7d:	01 c9                	add    cx,cx
  7f:	89 f3                	mov    bx,si
  81:	c1 eb 02             	shr    bx,0x2
  84:	8b af 9e 7c          	mov    bp,WORD PTR [bx+0x7c9e]
  88:	d3 ed                	shr    bp,cl
  8a:	21 d5                	and    bp,dx
  8c:	8a 86 f0 7c          	mov    al,BYTE PTR [bp+0x7cf0]
  90:	cd 10                	int    0x10
  92:	4f                   	dec    di
  93:	4e                   	dec    si
  94:	75 c1                	jne    0x57
  96:	b4 01                	mov    ah,0x1
  98:	b5 3f                	mov    ch,0x3f
  9a:	cd 10                	int    0x10
  9c:	fa                   	cli    
  9d:	f4                   	hlt    
  9e:	55                   	push   bp
  9f:	5d                   	pop    bp
  a0:	df d5                	(bad)  
  a2:	5d                   	pop    bp
  a3:	55                   	push   bp
  a4:	0d 5e 6f             	or     ax,0x6f5e
  a7:	03 39                	add    di,WORD PTR [bx+di]
  a9:	57                   	push   di
  aa:	23 11                	and    dx,WORD PTR [bx+di]
  ac:	94                   	xchg   sp,ax
  ad:	1b de                	sbb    bx,si
  af:	0c 8c                	or     al,0x8c
  b1:	2b 37                	sub    si,WORD PTR [bx]
  b3:	bf 80 53             	mov    di,0x5380
  b6:	15 4e 54             	adc    ax,0x544e
  b9:	94                   	xchg   sp,ax
  ba:	9a d6 5f 2d a1       	call   0xa12d:0x5fd6
  bf:	cf                   	iret   
  c0:	cf                   	iret   
  c1:	50                   	push   ax
  c2:	8a 0f                	mov    cl,BYTE PTR [bx]
  c4:	a5                   	movs   WORD PTR es:[di],WORD PTR ds:[si]
  c5:	9d                   	popf   
  c6:	a9 ed 29             	test   ax,0x29ed
  c9:	84 48 6c             	test   BYTE PTR [bx+si+0x6c],cl
  cc:	9c                   	pushf  
  cd:	f8                   	clc    
  ce:	44                   	inc    sp
  cf:	8e 51 b2             	mov    ss,WORD PTR [bx+di-0x4e]
  d2:	a9 b9 1f             	test   ax,0x1fb9
  d5:	39 54 55             	cmp    WORD PTR [si+0x55],dx
  d8:	37                   	aaa    
  d9:	63 76 55             	arpl   WORD PTR [bp+0x55],si
  dc:	c5 d5 7c 49 e4       	vhaddpd ymm1,ymm5,YMMWORD PTR [bx+di-0x1c]
  e1:	5c                   	pop    sp
  e2:	0d 03 73             	or     ax,0x7303
  e5:	a4                   	movs   BYTE PTR es:[di],BYTE PTR ds:[si]
  e6:	16                   	push   ss
  e7:	33 30                	xor    si,WORD PTR [bx+si]
  e9:	54                   	push   sp
  ea:	c5 44 97             	lds    ax,DWORD PTR [si-0x69]
  ed:	4c                   	dec    sp
  ee:	55                   	push   bp
  ef:	00 db                	add    bl,bl
  f1:	df dc                	(bad)  
  f3:	20 58 57             	and    BYTE PTR [bx+si+0x57],bl
  f6:	97                   	xchg   di,ax
  f7:	83 6f 65 76          	sub    WORD PTR [bx+0x65],0x76
  fb:	36 5e                	ss pop si
  fd:	67 5d                	addr32 pop bp
  ff:	64 4d                	fs dec bp
 101:	3c a5                	cmp    al,0xa5
 103:	75 f3                	jne    0xf8
 105:	7c e0                	jl     0xe7
 107:	1f                   	pop    ds
 108:	06                   	push   es
 109:	d1 ad 66 24          	shr    WORD PTR [di+0x2466],1
 10d:	78 3c                	js     0x14b
 10f:	a3 e7 00             	mov    ds:0xe7,ax
 112:	2c 00                	sub    al,0x0
 114:	00 00                	add    BYTE PTR [bx+si],al
 116:	00 80 00 10          	add    BYTE PTR [bx+si+0x1000],al
 11a:	00 00                	add    BYTE PTR [bx+si],al
 11c:	02 c7                	add    al,bh
 11e:	84 8f a9 cb          	test   BYTE PTR [bx-0x3457],cl
 122:	ed                   	in     ax,dx
 123:	cf                   	iret   
 124:	86 9c f2 d0          	xchg   BYTE PTR [si-0x2f0e],bl
 128:	8b 33                	mov    si,WORD PTR [bp+di]
 12a:	76 17                	jbe    0x143
 12c:	08 0f                	or     BYTE PTR [bx],cl
 12e:	7e 62                	jle    0x192
 130:	48                   	dec    ax
 131:	8e 66 89             	mov    fs,WORD PTR [bp-0x77]
 134:	9e                   	sahf   
 135:	6a ca                	push   0xffca
 137:	1a 19                	sbb    bl,BYTE PTR [bx+di]
 139:	10 04                	adc    BYTE PTR [si],al
 13b:	80 46 77 48          	add    BYTE PTR [bp+0x77],0x48
 13f:	8c e7                	mov    di,fs
 141:	f2 5c                	repnz pop sp
 143:	ad                   	lods   ax,WORD PTR ds:[si]
 144:	3e fb                	ds sti 
 146:	0b 02                	or     ax,WORD PTR [bp+si]
 148:	87 23                	xchg   WORD PTR [bp+di],sp
 14a:	d0 06 c7 ab          	rol    BYTE PTR ds:0xabc7,1
 14e:	51                   	push   cx
 14f:	12 ba 66 93          	adc    bh,BYTE PTR [bp+si-0x6c9a]
 153:	67 10 4a 89          	adc    BYTE PTR [edx-0x77],cl
 157:	d4 a9                	aam    0xa9
 159:	ef                   	out    dx,ax
 15a:	d3 c9                	ror    cx,cl
 15c:	25 5f 37             	and    ax,0x375f
 15f:	a7                   	cmps   WORD PTR ds:[si],WORD PTR es:[di]
 160:	f7 59 a9             	neg    WORD PTR [bx+di-0x57]
 163:	8a ad e3 aa          	mov    ch,BYTE PTR [di-0x551d]
 167:	e0 c3                	loopne 0x12c
 169:	d4 36                	aam    0x36
 16b:	be ec ef             	mov    si,0xefec
 16e:	ac                   	lods   al,BYTE PTR ds:[si]
 16f:	4c                   	dec    sp
 170:	8e c3                	mov    es,bx
 172:	49                   	dec    cx
 173:	9e                   	sahf   
 174:	b3 fd                	mov    bl,0xfd
 176:	0c 6b                	or     al,0x6b
 178:	eb f7                	jmp    0x171
 17a:	ce                   	into   
 17b:	e8 5c 0e             	call   0xfda
 17e:	28 56 77             	sub    BYTE PTR [bp+0x77],dl
 181:	87 c7                	xchg   di,ax
 183:	67 68 78 10          	addr32 push 0x1078
 187:	a8 f8                	test   al,0xf8
 189:	47                   	inc    di
 18a:	44                   	inc    sp
 18b:	58                   	pop    ax
 18c:	78 08                	js     0x196
 18e:	c9                   	leave  
 18f:	96                   	xchg   si,ax
 190:	c8 b8 58 59          	enter  0x58b8,0x59
 194:	e2 f8                	loop   0x18e
 196:	11 a9 d9 47          	adc    WORD PTR [bx+di+0x47d9],bp
 19a:	d9 69 59             	fldcw  WORD PTR [bx+di+0x59]
 19d:	84 99 b9 39          	test   BYTE PTR [bx+di+0x39b9],bl
 1a1:	1a e3                	sbb    ah,bl
 1a3:	f7 e9                	imul   cx
 1a5:	c9                   	leave  
 1a6:	38 48 98             	cmp    BYTE PTR [bx+si-0x68],cl
 1a9:	47                   	inc    di
 1aa:	ba 39 79             	mov    dx,0x7939
 1ad:	0a 0b                	or     cl,BYTE PTR [bp+di]
 1af:	87 97 86 b4          	xchg   WORD PTR [bx-0x4b7a],dx
 1b3:	d6                   	(bad)  
 1b4:	aa                   	stos   BYTE PTR es:[di],al
 1b5:	35 60 8a             	xor    ax,0x8a60
 1b8:	1a 1b                	sbb    bl,BYTE PTR [bp+di]
 1ba:	87 b5 84 4b          	xchg   WORD PTR [di+0x4b84],si
 1be:	43                   	inc    bx
 1bf:	ab                   	stos   WORD PTR es:[di],ax
 1c0:	09 c5                	or     bp,ax
 1c2:	bb 5b 66             	mov    bx,0x665b
 1c5:	94                   	xchg   sp,ax
 1c6:	55                   	push   bp
 1c7:	aa                   	stos   BYTE PTR es:[di],al
 1c8:	64 73 00             	fs jae 0x1cb
 1cb:	49                   	dec    cx
 1cc:	6c                   	ins    BYTE PTR es:[di],dx
 1cd:	5c                   	pop    sp
 1ce:	3c e5                	cmp    al,0xe5
 1d0:	72 24                	jb     0x1f6
 1d2:	b3 5c                	mov    bl,0x5c
 1d4:	23 fc                	and    di,sp
 1d6:	94                   	xchg   sp,ax
 1d7:	04 b1                	add    al,0xb1
 1d9:	cd dd                	int    0xdd
 1db:	ed                   	in     ax,dx
 1dc:	8d a0 61 61          	lea    sp,[bx+si+0x6161]
 1e0:	3d ce 41             	cmp    ax,0x41ce
 1e3:	51                   	push   cx
 1e4:	00 00                	add    BYTE PTR [bx+si],al
 1e6:	21 fe                	and    si,di
 1e8:	11 75 76             	adc    WORD PTR [di+0x76],si
 1eb:	61                   	popa   
 1ec:	67 3a 2d 2d 78 72 72 	addr32 cmp ch,BYTE PTR ds:0x7272782d
 1f3:	63 2d                	arpl   WORD PTR [di],bp
 1f5:	74 62                	je     0x259
 1f7:	76 61                	jbe    0x25a
 1f9:	74 00                	je     0x1fb
 1fb:	3b 00                	cmp    ax,WORD PTR [bx+si]
 1fd:	00 55 aa             	add    BYTE PTR [di-0x56],dl
