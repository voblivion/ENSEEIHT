(* EXERCICE 1 *)
let un_entier = 160896 and un_reel = 3.141592 and une_chaine = "OCaML";;
un_entier;;
un_reel;;
une_chaine;;
let un_entier = "N7" and un_reel = "Toulouse";;
un_entier;; (* il y a un changement de type des variables un_entier et un_reel *)
un_reel;;
une_chaine;;

(* EXERCICE 2 *)
let exp1 = let a = 2*8 in let b = a+3 in let c = 3*7 in let d = 5-c in
	let e = 5*d in let f = a+e in b*f;;
let exp2 = let a = 3*4 in let b = a-2 in let c = 4*b in let d = c-5 in
	let e = d*b in b+e;;

(* EXERCICE 3 *)
let a = 1;;
let a = 2 and b = a+1;;	(* la nouvelle valeur de a n'est pas utilisé pour b *)
let c = let a = 7 and d = 5 in a*d;;
a;;	(* 2 *)
b;;	(* 2 *)
c;;	(* 35 *)
(*d;;	(* d n'existe evidemment plus dans l'env. global *)*)

(* EXERCICE 4 *)
let coeff_aux (a,b) = if a = 0. then failwith "pente nulle" else b/.a;;
let coeff (a,b) (c,d) = let (e,f) = (c-.a, d-.b) in coeff_aux (e,f);;

let a = (0.,1.) and b = (3.,2.);;
coeff a b;;	(* 0.33333 *)

let a = (2.,1.) and b = (2.,7.);;
(*coeff a b;;	(* fail with .. *)*)

(* EXERCICE 5 *)
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

(* EXERCICE 6 *)
(* dit si a = b *)
let compare_int (a : int) b = a = b;;
(* dit si a = 0 *)
let null a = a = 0;;
(* identité *)
let id a = a;;
(* dit si a = b *)
let compare a b = a = b;;
(* retourne la première patte du couple *)
let first (a,b) = a;;

(* EXERCICE 7 *)
let value_of_index (a,b,c) = function
	| 1 -> a
	| 2 -> b
	| 3 -> c
	| _ -> failwith "indefined index";;

let triplet = ("Je suis Victor.", "Hello world", "Allez l'OM");;
value_of_index triplet 1;;
value_of_index triplet 2;;
value_of_index triplet 3;;
value_of_index triplet 4;;	(* failwith.. *)
