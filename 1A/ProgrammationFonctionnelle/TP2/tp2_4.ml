let abs a = if a < 0 then (-a) else a;;

let pgcd a b =
	let rec aux a b =
		if a = b then a
		else if a < b then aux a (b-a)
		else aux (a-b) b
	in
		aux (abs a) (abs b);;

(* les préconditions (a > 0 et b > 0) sont ici levées en appelant la fonction auxiliaire (qui fait le travail
de pgcd initial) sur les valeurs absolues des paramètres fournis par l'utilisateur *)
