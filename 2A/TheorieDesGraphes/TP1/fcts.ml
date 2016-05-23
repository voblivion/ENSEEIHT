let est_degre_pair g v = (out_degree g v) mod 2 = 0;;

let sommets_impairs g = G.fold_vertex (fun v l -> if est_degre_pair g v then l else v::l) g [];;

let un_sommet g = G.fold_vertex (fun v _ -> Some v) g None;;

let afficher_sommet fmt v = Format.fprintf fmt "%i" (V.label v);;

let rec marquer_composante_connexe g v =
    match M.get v with
        | 0 ->
            begin
                M.set v 1;
                G.iter_succ (marquer_composante_connexe g) g v
            end
        | _ -> ()
;;

let est_connexe g = match un_sommet g with
    | None -> true
    | Some v ->
        begin
            M.clear g;
            marquer_composante_connexe g v;
            G.fold_vertex (fun v c -> c && M.get v = 1) g true;
        end
;;

let est_eulerien g = match est_connexe g with
    | false -> false
    | true -> match List.length (sommets_impairs g) with
        | 0 -> true
        | _ -> false
;;

let est_semi_eulerien g = match est_connexe g with
    | false -> false
    | true -> match List.length (sommets_impairs g) with
        | 2 -> true
        | _ -> false
;;

let rec chemin g a b =
    if a = b then
        [a]
    else
        match G.succ g a with
            | [] -> failwith "Pas Eulerien"
            | h::t ->
                begin
                    G.remove_edge g a h;
                    a::(chemin g h b);
                end
;;

let cycle g v =
    match G.succ g v with
        | [] -> failwith "Pas Eulerien"
        | h::t ->
            begin
                G.remove_edge g v h;
                v::(chemin g h v);
            end
;;

let rec completion g = function
    | [] -> []
    | h::t ->
        if G.out_degree g h = 0 then h::(completion g t)
        else completion g (cycle g h)@t
;;

let cycle_eulerien g = match un_sommet g with
    | None -> []
    | Some v -> completion g (cycle g v)
;;

let chemin_eulerien g =
    if est_eulerien g then
        match un_sommet g with
            | None -> failwith "Erreur inconnue"
            | Some v ->
            match G.succ g v with
                | [] -> failwith "Erreur inconnue"
                | h::t ->
                    begin
                        G.remove_edge g v h;
                        completion g (chemin g v h);
                    end
    else
        match sommets_impairs g with
            | a::b::[] -> completion g (chemin g a b)
            | _ -> failwith "Pas semi-Eulerien"
