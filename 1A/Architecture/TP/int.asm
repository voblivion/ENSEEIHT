	ba	program
handler_it:
	push	%r2
	push	%r3
	set		TAB, %r2
	ld		[%r2], %r3
	inccc	%r3
	st	%r3, [%r2]
	pop		%r3
	pop		%r3
	reti
program:
	// Pile
		set	0xFF, %sp			
	// Afficheur
		set	0xA0000000, %r8		
		set	0b1111, %r1
		st	%r1, [%r8+1]
	// Switchs
		set	0x90000000, %r7
	// pwmClk
		set 0xC0000000, %r5
		set	0x2FAF, %r3
		st	%r3, [%r5]
		set	0x17D7, %r3
		st	%r3, [%r5+1]
	// Time
		clr	%r3
	
	
chrono:
	// Afficher temps
		set		TAB, %r2
		ld		[%r2], %r3
		st	%r3, [%r8]
	ba	chrono
	
TAB:	.word 0