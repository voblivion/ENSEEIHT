(* Utils *)
let rev l = let rec aux m = function | [] -> m | h::t  -> aux (h::m) t in aux [] l;;
let rec length = function | [] -> 0 | h::t -> 1+(length t);;

(* Exercice 1 *)
let pol1 = [3.0;2.0;4.0] and pol2 = [-40.0;2.0;21.0;2.0] and pol3 = [3.5;4.0];;

(* Exercice 2 *)
(* parametres : P : 'a-list *)
(* preconditions : / *)
(* type : 'a list -> int *)
let rec degree = function
	| [] -> -1
	| [h] -> if h = 0. then -1 else 0
	| 0.::t -> let d = degree t in if d = 0 then -1 else 1+d
	| _::t -> 1+(degree t);;
	
(* tests :
	degree pol1 -> 2
	degree pol2 -> 3
	degree pol3 -> 1
	degree [] -> -1
	degree [4.0] -> 0	*)
degree pol1;;
degree pol2;;
degree pol3;;
degree [];;
degree [4.0];;
degree [0.];;

(* Exercice 3 *)
(* parametres : P : 'a-list, i : int *)
(* preconditions : i est positif pour que ça ait un sens *)
(* type : int -> 'a list -> 'a *)
let rec coeff i = function
	| [] -> 0.
	| h::q -> if i = 0 then h else coeff (i-1) q;;
(* tests :
	coeff 1 pol1 -> 2.0
	coeff 3 pol2 -> 2.0
	coeff 0 pol3 -> 3.5
	coeff 1 [] -> 0
	coeff 0 [4.0] -> 4.0	*)
coeff 1 pol1;;
coeff 3 pol2;;
coeff 0 pol3;;
coeff 1 [];;
coeff 0 [4.0];;

(* Exercice 4 *)
(* parametres : n : int *)
(* preconditions : n est positif *)
(* type : int -> 'a list *)
let monome n =
	let rec aux p = function
		| 0 -> p
		| k -> aux (0.::p) (k-1)
	in aux [1.] n;;
(* tests :
	monome 4 -> [0.;0.;0.;0.;1.]
	monome 0 -> [1.]	*)
monome 4;;
monome 0;;

(* Exercice 5 *)
(* parametres : P : 'a-list, x : float *)
(* preconditions : / *)
(* type : ffloat -> loat list -> float *)
let rec evaluate x = function
	| [] -> 0.
	| h::t -> h+.x*.(evaluate x t);;
(* tests :
	evaluate 1 pol2 -> -15.
	evaluate 2 pol1 -> 23.
	evaluate 4 [] -> 0.
	evaluate 7 [4.] -> 4.	*)
evaluate 1. pol2;;
evaluate 2. pol1;;
evaluate 4. [];;
evaluate 7. [4.];;

(* Exercice 6 *)
(* parametres : P : 'a-list, m : int *)
(* preconditions : m est supérieur au degré de P *)
(* type 'a list -> int -> 'a list *)
let extend p m =
	let rec aux k =
		if k <= 0 then [] else 0.::(aux (k-1))
	in p@(aux (m - (degree p)));;
(* tests :
	extend pol1 4 -> [3.0;2.0;4.0;0.;0.] *)
extend pol1 4;;

(* Exercice 7 *)
(* parametres : P : 'a-list *)
(* preconditions : / *)
(* type 'a list -> 'a list *)
let rec retract = function
	| [] -> []
	| [0.] -> []
	| [h] -> [h]
	| h::t -> let r = retract t in
		if r = [] && h = 0. then [] else h::r;;
(* tests :
	retract extend pol1 4 -> [3.;2.;4.]	*)
retract (extend pol1 4);;

(* Exercice 8 *)
(* parametres : f : 'a -> 'b, P : 'a-list *)
(* preconditions : / *)
(* type : 'a -> 'b -> 'a list -> 'b list *)
let rec map f = function
	| [] -> []
	| h::t -> (f h)::(map f t);;
(* tests : déjà fait dans l'autre TP *)

(* parametres : f : 'a -> 'b -> 'c, P : 'a-list, Q : 'a-list *)
(* preconditions : p et q sont de même taille *)
(* type : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list *)
let rec map2 f p = function
	| [] -> []
	| h::t -> match p with
		| [] -> (f 0. h)::(map2 f [] t)
		| hq::tq -> (f hq h)::(map2 f tq t);;

(* Exercice 9 *)
(* parametres : P : 'a-list, a : float *)
(* preconditions : / *)
(* type : float -> float list -> float list *)
let rec scal_mult a p = retract (map (fun x -> a*.x) p);;
(* tests :
	scal_mult 5. pol3 -> [17.5;20.] *)
scal_mult 5. pol3;;
scal_mult 0. pol2;;

(* Exercice 10 *)

(* parametres : P : 'a-list, Q : 'a-list *)
(* preconditions : / *)
(* type : float list -> float list -> float list *)
let plus p q =
	let d = max (degree p) (degree q)
	in
		retract (map2 (fun x y -> x+.y) (extend p d) (extend q d));;
(* tests :
	plus pol1 pol3 -> [6.5;6.;4.]	*)
plus pol1 pol3;;
plus pol2 pol3;;

(* parametres : P : 'a-list, Q : 'a-list *)
(* preconditions : / *)
(* type : float list -> float list -> float list *)
let minus p q =
	let d = (max (degree p) (degree q))
	in
		retract (map2 (fun x y -> x-.y) (extend p d) (extend q d));;
(* tests :
	minus pol3 [0.5;4.] -> [3.]	*)
minus pol3 [0.5;4.];;

(* Exercice 11 *)
(* parametres : P : 'a-list, Q : 'a-list *)
(* preconditions : / *)
(* type : float list -> float list -> float list *)
let rec mult p = function
	| [] -> []
	| h::t -> plus (scal_mult h p) (0.::(mult p t));;
(* tests :
	mult pol1 pol3 -> [10.5;19.;22.;16.]	*)
mult pol1 pol2;;

(* Exercice 12 *)
(* parametres : P : 'a-list *)
(* preconditions : / *)
(* type : float list -> float list *)
let derive = function
	| [] -> []
	| h::t ->
		let rec aux k = function
			| [] -> []
			| h::t -> (k*.h)::(aux (k+.1.) t)
		in aux 1. t;;
(* tests :
	derive pol1 -> [2.;8.]	*)
derive pol1;;

(* Exercice 13 *)
let rec mon_mult p = function
	| 0 -> p
	| n -> mon_mult (0.::p) (n-1);;

(* parametres : P : 'a-list, Q : 'a-list *)
(* preconditions : Q divise P *)
(* type : float list -> float list -> float list *)
let rec divise p q =
	let rec aux p q m0 =
		let p = retract p in
		let n = degree p in
		let m = degree q in
		if n = -1 then extend [] (m0-1)
		else
			let c = (coeff n p)/.(coeff m q) in
			let r = scal_mult c (mon_mult q (n-m)) in
				extend ((aux (minus p r) q (n-m))@[c]) (m0-1)
	in aux p q (degree p - degree q);;
(* tests :
	pol3 = divise (mult pol1 pol3) pol1 -> true	*)
pol3 = divise (mult pol1 pol3) pol1;;
pol2 = divise (mult pol1 pol2) pol1;;
pol1 = divise (mult pol3 pol1) pol3;;
divise [1.;2.;1.] [1.;1.];;

(* TP PARFAIT ! <3 *)




