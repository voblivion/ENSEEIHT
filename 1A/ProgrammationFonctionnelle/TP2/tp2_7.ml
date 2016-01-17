(* predicat attend ici un entier (positif) *)
let predicat n =
	if n = 1 then false
	else
		(* on simule une boucle 'for' avec une fonction auxilière *)
		let rec aux k = 
			if n = k then true
			else if n mod k = 0 then false
			else aux (k+1)
		in
			aux 2;;

predicat 1;;
predicat 2;;
predicat 3;;
predicat 49;;
predicat 101;;
predicat 3209;;
predicat 4949;;