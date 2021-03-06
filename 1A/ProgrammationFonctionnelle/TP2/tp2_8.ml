(* on admet ici plusieurs choses : *)
(* - a < b *)
(* - f(a)*f(b) < 0 *)
(* - f est continue *)

let abs x = if x < 0. then -.x else x;;

let rec zero f (a,b) =
	if abs (b-.a) < 0.0000000001 then a
	else if (f ((a+.b)/.2.)) = 0. then (a+.b)/.2.
	else if (f ((a+.b)/.2.))*.(f a) < 0. then zero f (a, ((a+.b)/.2.))
	else zero f (((a+.b)/.2.), b);;

let f x = x +. 3.;;
let g x = x*.x*.x +. 4.;;

zero f (-5., 5.);; (* -3 *)
zero g (-5., 5.);;
