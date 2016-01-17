let coeff_aux (a,b) = if a = 0. then failwith "pente nulle" else b/.a;;
let coeff (a,b) (c,d) = let (e,f) = (c-.a, d-.b) in coeff_aux (e,f);;

let a = (0.,1.) and b = (3.,2.);;
coeff a b;;	(* 0.33333 *)

let a = (2.,1.) and b = (2.,7.);;
coeff a b;;	(* fail with .. *)
