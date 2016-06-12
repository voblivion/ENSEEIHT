(* sans_predecesseur
 * Retourne la liste des noeuds d'un graphe orienté qui n'ont pas de prédécesseur.
 *
 * IN : g le graphe dans lequel retrouver les noeuds
 * OUT : l la liste des noeuds sans prédécesserus du graphe
 *)
let sans_predecesseur g = DAG.fold_vertex (fun v l ->
    if DAG.in_degree g v = 0 then v::l else l) g []
;;

(* sans_successeur
 * Retourne la liste des noeuds d'un graphe orienté qui n'ont pas de successeur.
 *
 * IN : g le graphe dans lequel retrouver les noeuds
 * OUT : l la liste des noeuds sans prédécesserus du graphe
 *)
let sans_successeur g = DAG.fold_vertex (fun v l ->
    if DAG.out_degree g v = 0 then v::l else l) g []
;;


(* a_pred_numerotes
 * Détermine si le noeud donné a tous ses prédécesseurs dans la liste donnée.
 *
 * IN : g le graphe, z la liste, v le noeud
 * OUT : true ssi tous les prédécesseurs de v dans g sont dans z
 *)
let a_pred_dans g z v = List.for_all (fun v ->
    List.mem v z) (DAG.pred g v)
;;

(* tri_topologique
 * Effectue le tri topologique d'un graphe donné.
 *
 * IN : g le graphe à trier.
 * OUT : l la liste des noeuds triés.
 *)
let tri_topologique g =
    let y = sans_predecesseur g in
    let rec aux z = function
        | [] -> z
        | v::y -> aux (v::z) (DAG.fold_succ (fun w y ->
            if (a_pred_dans g (v::z) w) then (w::y) else y) g v y)
    in List.rev (aux [] y)
;;

type trace = (DAG.vertex list) list;;

let first f l =
    let rec aux = function
        | (_, []) -> (None, [])
        | (_, h::t) -> if f h then (Some h, t)
            else let (w, k) = aux (None, t) in match w with
                | None -> (None, h::t)
                | Some v -> (w, h::k)
    in aux (None, l)
;;

let vertex_list g = DAG.fold_vertex (fun v l -> v::l) g [];;

(* ordonnanceur_sans_heuristique
 * Calcule la trace d'exécution à partir d'un DAG.
 * 
 * IN : g le graph dont on doit calculer la trace d'exécution.
 * OUT : l la liste des listes d'exécution
 *)
let ordonnanceur_sans_heuristique r g =
    let rec aux l d a = function
        | [] -> l
        | y ->
            if d = 0 then
                match l with
                    | [] -> aux ([]::l) r a y
                    | h::t -> aux ([]::l) r (h@a) y
            else
                match l with
                    | [] -> failwith "Error : l ne devrait pas etre vide"
                    | h::t ->
                        let (w, z) = first (fun w -> a_pred_dans g a w) y in
                            match w with
                                | None -> aux l 0 a y
                                | Some v -> aux ((v::h)::t) (d-1) a z
    in List.rev (aux [] 0 [] (vertex_list g))
;;

let initialiser_marques = DAG.iter_vertex (fun v -> DAG.Mark.set v (-1));;

let marquer_profondeur g =
    let rec aux = function
        | [] -> ()
        | v::b -> let b = DAG.fold_pred (fun w b -> begin
                    DAG.Mark.set w (max (DAG.Mark.get w) ((DAG.Mark.get v) + 1));
                    if DAG.fold_succ (fun x c -> c && (DAG.Mark.get x) <> (-1)) g w true then
                        w::b
                    else
                        b
                end) g v b in aux b
    in
        begin
            initialiser_marques;
            let border = List.find_all (fun v -> (List.length (DAG.succ g v)) = 0) (vertex_list g) in begin
                List.iter (fun v -> DAG.Mark.set v 0) border;
                aux border;
            end
        end
;;

let best f l =
    let (o, n) = List.partition f l in
    let o = List.sort (fun v w -> (DAG.Mark.get w) - (DAG.Mark.get v)) o in
    match o with
        | [] -> (None, n)
        | h::t -> (Some h, t@n)
;;

(* ordonnanceur_avec_heuristique
 * Calcule la trace d'exécution à partir d'un DAG, avec heuristique.
 * 
 * IN : g le graph dont on doit calculer la trace d'exécution.
 * OUT : l la liste des listes d'exécution
 *)
let ordonnanceur_avec_heuristique r g =
    let rec aux l d a = function
        | [] -> l
        | y ->
            if d = 0 then
                match l with
                    | [] -> aux ([]::l) r a y
                    | h::t -> aux ([]::l) r (h@a) y
            else
                match l with
                    | [] -> failwith "Error : l ne devrait pas etre vide"
                    | h::t ->
                        let (w, z) = best (fun w -> a_pred_dans g a w) y in
                            match w with
                                | None -> aux l 0 a y
                                | Some v -> aux ((v::h)::t) (d-1) a z

    in
        begin
            marquer_profondeur g;
            List.rev (aux [] 0 [] (vertex_list g));
        end
;;

let ordonnanceur_contrainte_memoire r m g =
    let rec aux l d a cm = function
        | [] -> l
        | y ->
            if d = 0 then
                match l with
                    | [] -> aux ([]::l) r a m y
                    | h::t -> aux ([]::l) r (h@a) m y
            else
                match l with
                    | [] -> failwith "Error : l ne devrait pas etre vide"
                    | h::t ->
                        let (w, z) = best (fun w -> (a_pred_dans g a w) && (snd (DAG.V.label w) <= cm)) y in
                            match w with
                                | None -> aux l 0 a cm y
                                | Some v -> aux ((v::h)::t) (d-1) a (cm - (snd (DAG.V.label v))) z

    in
        begin
            marquer_profondeur g;
            List.rev (aux [] 0 [] m (vertex_list g));
        end
;;

