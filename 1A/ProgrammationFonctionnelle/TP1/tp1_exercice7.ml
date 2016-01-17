let value_of_index (a,b,c) = function
	| 1 -> a
	| 2 -> b
	| 3 -> c
	| _ -> failwith "indefined index";;

let triplet = ("Je suis Victor.", "Hello world", "Allez l'OM");;
value_of_index triplet 1;;
value_of_index triplet 2;;
value_of_index triplet 3;;
value_of_index triplet 4;;
