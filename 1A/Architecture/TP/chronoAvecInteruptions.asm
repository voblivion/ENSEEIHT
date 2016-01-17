N=175000
	ba	chrono
handler:
	cmp		%r9, %r0
	be		end_handler
	inccc	%r3
end_handler:
	reti
chrono:
	set	0xFF, %sp		// la pile
	set	0xA0000000, %r8	// l'afficheur
	st	%r0, [%r8]
	set	0b1111, %r1
	st	%r1, [%r8+1]
	set	0x90000000, %r7	// les switchs
	clr	%r3
	set	0b111, %r1
	st	%r3, [%r8]
	set	TAB, %r6	
	// pwmClk
		set 0xC0000000, %r5
		set	0x2FAF, %r3
		st	%r3, [%r5]
		set	0x17D7, %r3
		st	%r3, [%r5+1]
	// Doit compter ou pas ?
		clr	%r9
		clr	%r3

loop_stop:
	// if switch=001
		set	0b001, %r2
		call	sw_values
		bne	not_go
	// then
		ba	loop_go
	// else if switch=100
	not_go:
		set	0b0, %r9	// Desactiver incrémentation + delay
		set	0b100, %r2
		call	sw_values
		bne	not_read
	// then
		// if N > 0
			cmp	%r4, %r0
			be	not_read
		// then
			add	%r6, %r5, %r1
			ld	[%r1], %r1
			st	%r1, [%r8]		// Affichage TAB[i]
			set	0b111, %r1
			cmp	%r5, %r4
			be	i_eq_n
			inccc	%r5
			ba	end_i_eq_n
		i_eq_n:
			clr	%r5
		end_i_eq_n:
			bne	loop_read
	// else if switch=010
	not_read:
		set	0b010, %r2
		call	sw_values
		bne	not_reset
	// then
		clr	%r3		// T = 0
		clr	%r4		// N = 0
		clr	%r5		// I = 0
		st	%r3, [%r8]	// Affichage
	// else
	not_reset:
		ba	loop_stop
loop_go:
	// if switch=101
		set	0b101, %r2
		call	sw_values
		bne	not_store
	// then
		add	%r6, %r4, %r1
		st	%r3, [%r1]
		set	0b111, %r1
		inccc	%r4		// N+=1
		ba	loop_store
	// else if switch=000
	not_store:
		set	0b000, %r2
		call	sw_values
		bne	not_stop
	// then
		ba	loop_stop
	// else
	not_stop:
		set	0b1, %r9	// Activer incrémentation + delay
		st	%r3, [%r8]	// Affichage
		ba	loop_go
loop_store:
	// if switch=001
		set	0b001, %r2
		call	sw_values
		bne	not_go_b
	// then
		ba	loop_go
	// else
	not_go_b:
		set	0b1, %r9	// Activer incrémentation + delay
		st	%r3, [%r8]	// Affichage
		ba	loop_store

loop_read:
	// if switch=000
		set	0b000, %r2
		call sw_values
		bne	not_stop_b
	// then
		ba	loop_stop
	// else
	not_stop_b:
		ba	loop_read

delay100ms:
	push	%r1
	set	N, %r1
loop100ms:
	deccc	%r1
	bgt	loop100ms
	pop	%r1
	ret

sw_values:
	push	%r6
	ld	[%r7], %r6
	and	%r1, %r6, %r6
	xorcc	%r2, %r6, %r6
	pop	%r6
	ret

TAB:	.word 0
