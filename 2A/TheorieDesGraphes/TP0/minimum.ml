(* minimum
 * Retourne le minimum d'une liste
 * Signature : 'a list -> 'a
 *)
let rec minimum = function
    | [] -> failwith "Liste vide"
    | h::t -> List.fold_right min (h::t) h
;;
