(* Retourne le code binaire de Gray à n bits
 * parametres : n est un entier naturel
 *)
let rec gray = function
    | 0 -> [[]]
    | n -> let gray_pre = gray (n-1) in
        (List.map (fun l -> 0::l) gray_pre)@(List.rev_map (fun l -> 1::l) gray_pre);;
(* Retourne les bombinaisons de n éléments de la liste l
 * parametres : n est un entier naturel plus petit que la taille de la liste l
 *)
let rec comb_list l = function
    | 0 -> [[]]
    | n ->
        if List.length l = n then [l]
        else
            match l with
                | [] -> failwith "T'en as trop pris gros !"
                | h::t ->
                    (List.map (fun m -> h::m) (comb_list t (n-1)))@(comb_list t
                    n);;
(* Retourne la liste de toutes liste possible d'insertion de e dans l
 * parametres :
 *)
let rec insertion_partout e = function
    | [] -> [[e]]
    | h::t -> (e::(h::t))::(List.map (fun l -> h::l) (insertion_partout e t));;

(* Retourne la liste des permutations possibles de l
 * Parametre :
 *)
let rec permutations = function
    | [] -> [[]]
    | h::t -> List.flatten (List.map (fun l -> insertion_partout h l) (permutations t));;

(*
 *
 *)
let partitions n =
    let rec aux n = function
        | 0 -> failwith "Never happens !"
        | t ->
                if t = n then [[t]]
                else
                    if 2*t > n then [[n]]
                        else (List.map (fun l -> t::l) (aux (n-t) t))@(aux n
                        (t+1))
    in
        aux n 1;;
        
