delay:
	set	0xFF, %sp
	set	0xA0000000, %r8
	set	0b1111, %r1
	st	%r1, [%r8+1]
	clr	%r1
loop:
	st	%r1, [%r8]
	call	delay100ms
	inccc	%r1
	ba	loop
N=175000
delay100ms:
	push	%r1
	set	N, %r1
loop100ms:
	deccc	%r1
	bgt	loop100ms
	pop	%r1
	ret