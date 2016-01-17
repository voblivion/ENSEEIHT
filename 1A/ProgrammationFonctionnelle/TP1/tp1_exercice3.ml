let a = 1;;
let a = 2 and b = a+1;;	(* la nouvelle valeur de a n'est pas utilisé pour b *)
let c = let a = 7 and d = 5 in a*d;;
a;;	(* 2 *)
b;;	(* 2 *)
c;;	(* 35 *)
d;;	(* d n'existe evidemment plus dans l'env. global *)
