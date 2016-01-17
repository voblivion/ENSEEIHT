(* j'utilise 1 1 1 pour le début de la suite de padovan, c'est plus joli :) *)
let rec padovan = function
	| 0 -> 1
	| 1 -> 1
	| 2 -> 1;
	| n -> padovan (n-2) + padovan (n-3);;
padovan 10;;
padovan 20;;
padovan 50;;
(* padovan 100;; temp d'execution supérieur à 10sec *)

(* La compléxité est en ..? (presque n² ?) *)

let padovan2 n =
	let rec aux p q r i =
		if i = n then p
		else aux q r (q+r) (i+1)
	in
		aux 1 1 1 0;;

(* La compléxité est ici en O(n) à cause du 'i+1' *)
padovan2 10;;
padovan2 20;;
padovan2 50;;
padovan2 100;; (* immédiat ici *)
padovan2 200;; (* immédiat mais problème numérique : on dépasse 2^(4*8) *)
