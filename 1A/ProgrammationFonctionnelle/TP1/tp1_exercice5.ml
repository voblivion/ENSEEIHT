let roots a b c = 
	if a = 0. then
		if b = 0. then
			failwith "no root"
		else
			let r = -.c/.b in (r,r)
	else
		let d = b*.b-.4.*.a*.c in
			if d < 0. then
				failwith "no root"
			else if d = 0. then
				let r = -.b/.(2.*.a) in (r,r)
			else
				let r1 = (-.b+.(sqrt d))/.(2.*.a)
				and r2 = (-.b-.(sqrt d))/.(2.*.a) in (r1, r2);;

roots 1. 0. 0.;;	(* (0, 0) *)
roots 0. 1. 0.;;	(* (0, 0) *)
roots 1. 0. (-1.);;	(* (-1, 1) *)
roots 2. (-10.) 12.;;	(* (2, 3) *)
