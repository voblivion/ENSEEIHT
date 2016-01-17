N=833333
delay100ms:
	push	%r1
	set	N, %r1
loop100ms:
	deccc	%r1
	bgt	loop100ms
	pop	%r1
	ret