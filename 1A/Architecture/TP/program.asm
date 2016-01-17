N=175000
delay:
	set	0xFF, %sp		// la pile
	set	0xA0000000, %r8	// l'afficheur
	set	0b1111, %r1
	st	%r1, [%r8+1]
	set	0x90000000, %r7	// les switchs
	clr	%r3
	set	0b11, %r1
	st	%r3, [%r8]
loop_s:
	set	0b10, %r2
	call	sw_values
	bne	not_rst
	clr	%r3
	st	%r3, [%r8]
not_rst:
	set	0b01, %r2
	call	sw_values
	bne	loop_s
	ba	loop_r
loop_r:
	set	0b00, %r2
	call	sw_values
	bne	not_stop
	ba	loop_s
not_stop:
	inccc	%r3
	call	delay100ms
	st	%r3, [%r8]
	ba	loop_r

delay100ms:
	push	%r1
	set	N, %r1
loop100ms:
	deccc	%r1
	bgt	loop100ms
	pop	%r1
	ret

sw_values:
	push	%r3
	ld	[%r7], %r3
	and	%r1, %r3, %r3
	xorcc	%r2, %r3, %r3
	pop	%r3
	ret