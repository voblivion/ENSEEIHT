(* recherche : ('a -> 'a list) -> ('a -> bool) -> 'a -> 'a list *)
let recherche voisinage critere position =
	let rec cherche pos =
		if critere pos then
			[pos]
		else
			match cherche_liste (voisinage pos) with
				| [] -> []	(* pas de solutions *)
				| solution -> pos :: solution
	and cherche_liste positions =
		match positions with
			| [] -> []	(* pas de solutions *)
			| tpos::queue -> match cherche tpos with
				| [] -> cherche_liste queue
				| solution -> solution
	in cherche position;;

(* Exercice 1 *)
(* les positions possibles sont des couples (entier, liste) où entier est la somme restant à donner et liste l'ensemble des pièces restantes *)

(* Exercice 2 *)
let rec voisinage (s,l) = match l with
	| [] -> []
	| h::t ->
		if s >= h then
		(s-h,t)::(List.map (fun (sb, lb) -> (sb, h::lb)) (voisinage (s,t)))
		else
		(List.map (fun (sb, lb) -> (sb, h::lb)) (voisinage (s,t)));;

(* Exercice 3 *)
(* pas à prendre en compte les cycles puisque le nombre de pièce ne fait que diminuer donc il n'y en a pas *)
(* recherche retourne une liste de positions voisines où chacune est voisine de sa précédente moyennant une valeur de pièce qu'on lui a soustraite *)

(* Exercice 4 *)
let critere (s,l) = s = 0;;

(* Exercice 5 *)
let recherche_complete_un position = recherche voisinage critere position <> [];;

(* Exercice 6 *)
(* bon j'avais fait une fonction "voisinage" qui me permettais déjà d'avoir les pièces rendues ou presque .. je vois pas trop quoi ajouter .. *)

(* Exercice 7 *)
let recherche_complete_deux position =
	let positions = recherche_complete_un position in
	let rec aux = function
		| [] -> []
		| [h] -> []
		| (s1, _)::(s2, l)::q -> (s1-s2)::(aux ((s2, l)::q))
	in
		aux positions;;

(* Exercice 8 *)
(* question obscure .. même réponse qu'en 6 ? *)

(* Exercice 9 *)
let sup a b =
	if a < b then 1
	else if a > b then -1
	else 0;;
let recherche_complete_trois (somme, pieces) =
	recherche_complete_deux (somme, (List.sort (sup) pieces));;

(* La solution évoquée ne fonctionne QUE SI on n'utilise pas les pièces de 2c et 1c.
Après des maths pénibles doivent montrer pourquoi mais l'exemple est :
60 = 50 + 5 + 2 + 2 + 1
60 = 20 + 20 + 20 *)
