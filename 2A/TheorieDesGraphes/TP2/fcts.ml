module G = Graph.Pack.Digraph;;
module V = G.V;;
module M = G.Mark;;
module S = Set.Make(G.V);;
module E = G.E;;

let creer_graphe_oriente lv lep =
    let go = create () in
    begin
        List.iter (fun t -> add_vertex go (V.create t)) lv;
        List.iter (fun (v1,v2,p12) ->
            add_edge_e go (E.create (find_vertex go v1) p12 (find_vertex go v2))) lep;
        go;
    end
;;

let un_sommet g = match (G.fold_vertex (fun v _ -> Some v) g None) with
    | None -> failwith "Pas de sommet"
    | Some v -> v;;

let sommets g = G.fold_vertex (fun v l -> v::l) g [];;

let min s = S.fold (fun a b -> if (M.get a) < (M.get b) then a else b) s (S.min_elt s);;

let folder e f =
    let w = E.dst e in
        let p = (M.get (E.src e)) + (E.label e) in
        (* Mettre à jour la marque des voisins de v *)
        if M.get w > p || M.get w = -1 then
            begin
                M.set w p;
                (* Ajouter au front les voisins de v modifiés *)
                S.add w f;
            end
        else f
;;

let rec dijkstra_parcourir g front =
    (* Retirer le plus petit noeud v du front *)
    let v = min front in
    let front = S.remove v front in
    let front = G.fold_succ_e folder g v front in
    if not (S.is_empty front) then
        dijkstra_parcourir g front
;;

let dijkstra g v =
    begin
        (* Marquer tous les noeuds comme non-visités *)
        M.clear g;
        G.iter_vertex (fun v -> M.set v (-1)) g;
        (* Marquer le noeud source à 0 *)
        M.set v 0;

        dijkstra_parcourir g (S.singleton v);
    end
;;
