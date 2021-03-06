type 'a tree = Empty | Node of 'a tree * 'a * 'a tree;;

(* SUPER TREE *)
let t = Node(Node(Node(Empty, 1, Empty), 2, Node(Empty, 3, Node(Empty, 4, Empty))), 5, Node(Node(Empty, 6, Empty), 7, Empty));;

(* BELONGS *)
let rec belongs x = function
	| Empty -> false;
	| Node(lt, y, rt) ->
		if x = y then true
		else if x < y then belongs x lt
		else belongs x rt;; (* C(n) = h *)

(* ADD *)
let rec add x = function
	| Empty -> Node(Empty, x, Empty)
	| Node(lt, y, rt) ->
		if x < y then Node(add x lt, y, rt)
		else Node(lt, y, add x rt);;

(* FOLD *)
let rec fold f t d = match t with
	| Empty -> d
	| Node(lt, x, rt) -> f (fold f lt d) x (fold f rt d);;

(* CARD *)
let card t = fold (fun l x r -> l+1+r) t 0;;

(* FLATTEN *)
let flatten t = fold (fun l x r -> l@(x::r)) t [];;

(* MAKE *)
let make l = List.fold_right (add) l Empty;;

(* SORT *)
let sort l = flatten (make l);;

(* REMOVE MIN *)
let rec remove_min = function
	| Empty -> failwith "ça n'arrive pas ce genre de choses dans la vie"
	| Node(Empty, x, rt) -> (x, rt)
	| Node(lt, x, rt) -> let (m, tt) = remove_min lt in (m, Node(tt, x, rt));;

(* REMOVE *)
let rec remove x = function
	| Empty -> Empty
	| Node(Empty, y, rt) -> rt
	| Node(lt, x, Empty) -> lt
	| Node(lt, y, rt) ->
		if x = y then
			if lt = Empty then rt
			else if rt = Empty then lt
			else let (y, tt) = remove_min rt in Node(lt, y, tt)
		else if x < y then Node(remove x lt, y, rt)
		else Node(lt, y, remove x rt);;








