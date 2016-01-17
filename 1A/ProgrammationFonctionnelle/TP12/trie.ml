(*                           Module de trie                                   *)
(* Un type dont on aura besoin *)
type 'b tree = Node of (bool * (('b * 'b tree) list));;

(* type trie le mot est de type 'a, les "caractères" le composant de type 'b *)
type ('a,'b) trie = (('a -> 'b list) * ('b list -> 'a) * ('b tree));;

(* Quelques fonctions dont on aura besoin *)
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

(* nouveau : ('a -> 'b list) -> ('b list -> 'a) -> ('a, 'b) trie
fonction de création d'un trie
paramètres : ('a -> 'b list), la fonction de décomposition 
             ('b list -> 'a), la fonction de recomposition 
résultat   : un trie vide 
*)
let nouveau deco reco = (deco, reco, Node(false, []));;

(* appartient : 'a -> ('a, 'b) trie -> bool
fonction de test d'appartenance d'un mot au trie
paramètres : 'a, un mot
             ('a, 'b) trie, un trie 
résultat   : le résultat booléen du test
*)
let appartient m (deco, reco, t) =
	let rec aux (Node(b, branches)) = function
		| [] -> b
		| h::t -> match find h branches with
			| None -> false
			| Some(c,tz) -> aux tz t
	in aux t (deco m);;

(* ajout : 'a -> ('a, 'b) trie -> ('a, 'b) trie
fonction d'ajout d'un mot au trie
paramètres : 'a, un mot
             ('a, 'b) trie, un trie
résultat   : le trie avec le mot ajouté
*)
let ajout m (deco, reco, t) =
	let rec aux (Node(b, branches)) = function
		| [] -> Node(true, branches)
		| h::t -> match find h branches with
			| None -> Node(b, (replace (h, aux (Node(false, [])) t) branches))
			| Some(c, tz) -> Node(b, (replace (h, aux tz t) branches))
	in (deco, reco, aux t (deco m));;

(* retrait : 'a -> ('a, 'b) trie -> ('a, 'b) trie
fonction de retrait d'un mot au trie
paramètres : 'a , un mot
             ('a, 'b) trie, un trie
résultat   : le trie avec le mot retiré
*)
let remove m (deco, reco, t) =
	let rec aux (Node(b, branches)) = function
		| [] -> Node(false, branches)
		| h::t -> match find h branches with
			| None -> Node(b, branches)
			| Some(c, tz) -> Node(b, (replace (h, aux tz t) branches))
	in (deco, reco, aux t (deco m));;

let normalize (deco, reco, Node(b, branches)) =
	let rec aux = function
		| [] -> []
		| (c, Node(b, []))::tBranches ->
			if b = false then aux tBranches
			else (c, Node(b, []))::(aux tBranches)
		| (c, Node(b, h::t))::tBranches ->
			let auxT = (h::t) in match auxT with
				| [] -> aux tBranches
				| _ -> (c, Node(b, auxT))::(aux tBranches)
	in (deco, reco, Node(b, aux branches));;
			

let retrait m (deco, reco, t) = normalize (remove m (deco, reco, t));;

(* affiche : ('a -> unit) -> ('a, 'b) trie -> unit
procédure d'affichage d'un trie 
paramètres : ('a -> unit), une procédure d'affichage d'un mot 
             ('a, 'b) trie, un trie 
résultat   : rien
*)
let affiche (display : 'a -> unit) (tr : ('a, 'b) trie) =
	let listing (deco, reco, t) =
		let rec aux l (c, Node(b, branches)) =
			if b = true then (c::l)::(List.flatten(List.map (aux (c::l)) branches))
			else List.flatten (List.map (aux (c::l)) branches)
		in let aux2 rm = match List.rev rm with
			| [] -> failwith "Negative length of word"
			| h::t -> reco t
		in match t with
			| Node(b, []) -> []
			| Node(b, (c, tz)::t2) -> List.map (aux2) (aux [] (c, t))
	in List.iter (display) (listing tr);; 





