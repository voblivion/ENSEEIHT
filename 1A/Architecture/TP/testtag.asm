	clr	%r1
	set	TAB, %r4
	clr	%r2
loop:	ld	[%r4+%r2], %r3
	addcc	%r1, %r3, %r1
	inccc	%r2
	cmp	%r2, 9
	bleu	loop
	TAB:	-word 1,2,3,4,5,6