let rec fact = function
	| 0 -> 1
	| n -> n* fact (n-1);;

(* Question 2 : *)
(* la suite des paramètres envoyés à la fonction récursive fact décroît strictement d'où terminaison *)
(* dois-je préciser que le cas terminal est ateint puisque la décroissance se fait de 1 en 1 ? *)

(* Question 3 : *)
(* la complexité est en O(n) (décroissance de 1 en 1 depuis n jusque 0) *)
