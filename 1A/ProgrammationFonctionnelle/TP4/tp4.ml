(* EXERCICE 1 *)
(* e est de type 'a et la liste est de type 'a-list *)
(* type : 'a -> 'a-list -> bool *)
let rec belong e = function
	| [] -> false
	| h::t -> if h=e then true else belong e t;;

(* EXERCICE 2 *)
(* la liste est de type 'a-list *)
(* type : 'a-list -> 'a-list *)
let set_of_list l =
	let rec aux m = function
		| [] -> m
		| h::t -> if belong h m then aux m t else aux (h::m) t
	in aux [] l;;

(* EXERCICE 3 *)
(* f est de type 'a->'b et la liste est de type 'a-list *)
(* type : 'a -> 'b -> 'a-list -> 'b-list *)
let rec map f = function
	| [] -> []
	| h::t -> (f h)::(map f t);;

(* EXERCICE 4 *)
(* a est de type 'a et l de type 'a-list *)
(* type : 'a -> 'a-list -> 'a-list *)
(* précondition : la(les) liste(s) est(sont) un(des) ensemble(s) ! *)
let add e l = if belong e l then l else e::l;;
(* si a est déjà dans l on ne l'ajoute pas *)

(* EXERCICE 5 *)
(* les deux listes sont de type 'a-list *)
(* type : 'a-list -> 'a-list -> 'a-list *)
(* précondition : la(les) liste(s) est(sont) un(des) ensemble(s) ! *)
let rec union l = function
	| [] -> l
	| h::t -> if belong h l then union l t else union (h::l) t;;

(* EXERCICE 6 *)
(* e est de type 'a et la liste est de type 'a-list *)
(* type : 'a -> 'a-list -> 'a-list *)
(* précondition : la(les) liste(s) est(sont) un(des) ensemble(s) ! *)
let rec remove e = function
	| [] -> []
	| h::q -> if e = h then q else h::(remove e q);;
(* si l'élément e n'est pas dans la liste, elle est retournée tel-quel *)

(* EXERCICE 7 *)
(* e est de type 'a et la liste est de type 'a-list *)
(* type : 'a-list -> 'a-list -> 'a list *)
(* précondition : la(les) liste(s) est(sont) un(des) ensemble(s) ! *)
let rec minus l = function
	| [] -> l
	| h::t -> minus (remove h l) t;;

(* EXERCICE 8 *)
(* f est de type 'a->'b et l est de type 'a *)
(* type : 'a -> 'b -> 'a-list -> 'b-list *)
(* précondition : la(les) liste(s) est(sont) un(des) ensemble(s) ! *)
let image_of f l =
	let rec aux m f = function
		| [] -> m
		| h::t -> aux (add (f h) m) f t
	in aux [] f l;;

(* EXERCICE 9 *)
(* type : 'a-list-list -> 'a-list *)
	
(* EXERCICE 10 *)
(* type : 'a-list-list -> 'a-list *)
(* précondition : la(les) liste(s) est(sont) un(des) ensemble(s) ! *)
let rec union_indexee = function
	| [] -> []
	| h::t -> union h (union_indexee t);;


