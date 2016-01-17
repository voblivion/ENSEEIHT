type 'a lbt;;

(* Retourne un tas vide *)
val empty_lbt : 'a lbt;;

(* Dit si un tas est vide *)
val is_lbt_empty : 'a lbt -> bool;;

(* Opérateur fold sur un tas *)
val fold : ('a -> 'b -> 'b) -> 'a lbt -> 'b -> 'b;;

(* Retourne la cardinal d'un tas *)
val card : 'a lbt -> int;;
