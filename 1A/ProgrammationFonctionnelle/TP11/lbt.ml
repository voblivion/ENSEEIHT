

type 'a lbt =
	| Empty
	| Node of 'a lbt * 'a * 'a lbt;;

let rec deep = function
	| Empty -> 0
	| Node(l, e, r) -> 1 + deep l;;

let rec union t1 t2 = match (t1, t2) with
	| (Empty, _) -> t2
	| (_, Empty) -> t1
	| (Node(l1, e1, r1), Node(l2, e2, r2)) ->
		if e1 <= e2 then
			let t3 = union t2 r1 in
			if deep t3 > deep l1 then Node(t3, e1, l1)
			else Node(l1, e1, t3)
		else
			let t3 = union t1 r2 in
			if deep t3 > deep l2 then Node(t3, e2, l2)
			else Node(l2, e2, t3);;


let add t e = union t (Node(Empty, e, Empty));;

let min = function
	| Empty -> failwith "Empty tree"
	| Node(_,e,_) -> e;;

let maxs = function
	| Empty -> failwith "Empty tree"
	| Node(l,e,r) -> union l r;;

let empty_lbt = Empty;;

let is_lbt_empty = function
	| Empty -> true
	| _ -> false;;

let rec fold f t d = match t with
	| Empty -> d
	| Node(l,e,r) -> f e (fold f (maxs t) d);;

let card t = fold (fun e n -> n+1) t 0;;
