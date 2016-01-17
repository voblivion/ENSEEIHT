
(* Exercice 1 *)

type 'b tree = Node of (bool * (('b * 'b tree) list));;

type ('a,'b) trie = (('a -> 'b list) * ('b list -> 'a) * ('b tree));;

(* Exercice 2 *)

let create deco reco = (deco, reco, Node(false, []));;

(* Exercice 3 *)

let rec find e = function
	| [] -> None
	| (c,tz)::t -> if e = c then Some (c,tz) else find e t;;

let rec replace (bc, btz) = function
	| [] -> [(bc, btz)]
	| (c,tz)::t -> 
		if bc = c then (bc, btz)::t
		else if bc < c then (bc, btz)::((c, tz)::t)
		else (c,tz)::(replace (bc, btz) t);;

let rec remove (bc, btz) = function
	| [] -> []
	| (c,tz)::t -> if bc = c then t else (c,tz)::(remove (bc,tz) t);;

(* Exercice 4 *)

let belongs m (deco, reco, t) =
	let rec aux (Node(b, branches)) = function
		| [] -> b
		| h::t -> match find h branches with
			| None -> false
			| Some(c,tz) -> aux tz t
	in aux t (deco m);;

(* Exercice 5 *)
let add m (deco, reco, t) =
	let rec aux (Node(b, branches)) = function
		| [] -> Node(true, branches)
		| h::t -> match find h branches with
			| None -> Node(b, (replace (h, aux (Node(false, [])) t) branches))
			| Some(c, tz) -> Node(b, (replace (h, aux tz t) branches))
	in (deco, reco, aux t (deco m));;

(* Exercice 6 *)
let remove m (deco, reco, t) =
	let rec aux (Node(b, branches)) = function
		| [] -> Node(false, branches)
		| h::t -> match find h branches with
			| None -> Node(b, branches)
			| Some(c, tz) -> Node(b, (replace (h, aux tz t) branches))
	in (deco, reco, aux t (deco m));;

(* Exercice 7 *)
let listing (deco, reco, t) =
	let rec aux l (c, Node(b, branches)) =
		if b = true then (c::l)::(List.flatten(List.map (aux (c::l)) branches))
		else List.flatten (List.map (aux (c::l)) branches)
	in let aux2 rm = match List.rev rm with
		| [] -> failwith "Negative length of word"
		| h::t -> reco t
	in match t with
		| Node(b, []) -> []
		| Node(b, (c, tz)::t2) -> List.map (aux2) (aux [] (c, t));;
	

(* Pour les entiers il vaut mieux choisir un parcours postfix ? *)


(*
	print_string
	print_newline
*)














