let liste = [2;4;1;5;9;7;2;54;78;1;2;35;4;2;65;9;7;35;1;45;7];;

(* Exercice 1 *)
let rec insert ordre x = function
	| [] -> [x]
	| h::t -> if ordre x h then x::h::t else h::(insert (ordre) x t);;

(* Exercice 2 *)
let rec tri_insertion ordre = function
	| [] -> []
	| h::l -> insert ordre h (tri_insertion ordre l);;
	(* Test *)
	tri_insertion (<) liste;;

(* Exercice 3 *)
let rec decompose predicat = function
	| [] -> ([], [])
	| h::t -> let (l1, l2) = decompose (predicat) t in
		if predicat h then (h::l1,l2) else (l1,h::l2);;
(* La fonction termine car il y a stricte décroissance de la taille de la liste
	fournie en paramètre aux appels successifs de decompose *)

(* Exercice 4 *)
let rec tri_rapide ordre = function
	| [] -> []
	| h::t -> let (l1, l2) = decompose (fun x -> ordre x h) t in
		(tri_rapide (ordre) l1)@(h::(tri_rapide (ordre) l2));;
	(* Test *)
	tri_rapide (<) liste;;

(* Exercice 5 *)
let rec decompose2 = function
	| [] -> ([], [])
	| [h] -> ([h], [])
	| h1::h2::t -> let (l1, l2) = decompose2 t in
		(h1::l1, h2::l2);;

(* Exercice 6 *)
let rec recompose ordre l = function
	| [] -> l
	| h::t -> match l with
		| [] -> h::t
		| hl::tl -> if ordre h hl then h::(recompose (ordre) (hl::tl) t)
			else hl::(recompose (ordre) tl (h::t));;

(* Exercice 7 *)
let rec tri_fusion (ordre : 'a -> 'a -> bool) (l : 'a list) = match l with
	| [] -> []
	| [h] -> [h]
	| _ ->
		let (l1, l2) = decompose2 l in
			(recompose (ordre) (tri_fusion (ordre) l1) (tri_fusion (ordre) l2));;
	(* Test *)
	tri_fusion (<) liste;;

(* Exercice 8 *)
(*
	- pour améliorer la compléxité (ça se voit sur l'arbre des appels récursifs
		qui minimise ainsi sa hauteur)
	- un tri rapide sur une liste trié aura un arbre d'appels avec presque que
		une branche d'où une mauvaise compléxité *)














