let rec fact = function | 0 -> 1 | n -> n * fact (n-1);;

(* dans les deux cas on attendra k et n des entiers positifs avec k <= n ! *)

(* on s'attendra dans le premier cas à avoir des problèmes numériques dès n = 21 (fact 21 > 2^(4*8)) *)
let coeffbinom k n = (fact n)/((fact k)*(fact (n-k)));;
(* La complexité est ici en O(n) à cause de l'appel de 'fact n' (n >= n-k, k) *)
coeffbinom 5 10;;
coeffbinom 6 15;;
coeffbinom 7 20;;
coeffbinom 8 21;; (* l'erreur était attendue ! *)

(* le second cas ne présente pas de problème numérique aussi 'rapidement' de part sa construction... *)
let rec coeffbin k n =
	if k = n then 1
	else if k = 1 then n
	else (coeffbin (k-1) (n-1)) + (coeffbin k (n-1));;
(* la compléxité est ici supérieure et est en O(k*(n-k)) *)
coeffbin 5 10;;
coeffbin 6 15;;
coeffbin 7 20;;
coeffbin 8 21;; (* pas d'erreur ici *)
coeffbin 8 25;;
coeffbin 9 30;; (* pas immédiat *)
coeffbin 10 35;; (* commence à prendre du temps *)
