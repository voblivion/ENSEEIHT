(* count
 * Compte le nombre d'occurence de n comme premier élément des couples de l
 * Signature : 'a -> ('a * 'b) list -> int
 *)
let rec count n l =
    List.fold_right (fun (l, g) m -> if l == n then m + 1 else m) l 0
;;
