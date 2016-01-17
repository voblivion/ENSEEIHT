(* EXERCICE 1 *)
let inverse_ratio (p, q) = if p = 0 then failwith "0 non inversible" else (q, p);;
let add_ratio (a, b) (c, d) = (a*d + b*c, b*d);;

(* EXERCICE 2 *)
let rec fact = function
	| 0 -> 1
	| n -> n* fact (n-1);;

	(* Question 2 : *)
	(* la suite des paramètres envoyés à la fonction récursive fact décroît strictement d'où terminaison *)
	(* dois-je préciser que le cas terminal est ateint puisque la décroissance se fait de 1 en 1 ? *)

	(* Question 3 : *)
	(* la complexité est en O(n) (décroissance de 1 en 1 depuis n jusque 0) *)

(* EXERCICE 3 *)
let rec carre = function
	| 0 -> 0
	| n -> n*n + carre (n-1);;

	(* Question 2 : *)
	(* Termine pour les mêmes raisons que la question précédente *)

	(* Question 3 : *)
	(* Compléxité en O(n)... *)

(* EXERCICE 4 *)
let abs a = if a < 0 then (-a) else a;;

let pgcd a b =
	let rec aux a b =
		if a = b then a
		else if a < b then aux a (b-a)
		else aux (a-b) b
	in
		aux (abs a) (abs b);;

	(* les préconditions (a > 0 et b > 0) sont ici levées en appelant la fonction auxiliaire 
		(qui fait le travail de pgcd initial)
		sur les valeurs absolues des paramètres fournis par l'utilisateur *)

(* EXERCICE 5 *)
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

(* EXERCICE 6 *)
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

(* EXERCICE 7 *)
(* predicat attend ici un entier (positif) *)
let predicat n =
	if n = 1 then false
	else
		(* on simule une boucle 'for' avec une fonction auxilière *)
		let rec aux k = 
			if n = k then true
			else if n mod k = 0 then false
			else aux (k+1)
		in
			aux 2;;

predicat 1;;
predicat 2;;
predicat 3;;
predicat 49;;
predicat 101;;
predicat 3209;;
predicat 4949;;

(* EXERCICE 8 *)
(* on admet ici plusieurs choses : *)
(* - a < b *)
(* - f(a)*f(b) < 0 *)
(* - f est continue *)

let abs x = if x < 0. then -.x else x;;

let rec zero f (a,b) =
	if abs (b-.a) < 0.0000000001 then a (* epsilon est totalement arbitraire .. *)
	else if (f ((a+.b)/.2.)) = 0. then (a+.b)/.2.
	else if (f ((a+.b)/.2.))*.(f a) < 0. then zero f (a, ((a+.b)/.2.))
	else zero f (((a+.b)/.2.), b);;

let f x = x +. 3.;;
let g x = x*.x*.x +. 4.;;

zero f (-5., 5.);; (* -3 *)
zero g (-5., 5.);;
