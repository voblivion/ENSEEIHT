module G = Graph.Pack.Digraph;;
module V = G.V;;
module M = G.Mark;;
module S = Set.Make(G.V);;
module E = G.E;;

(* creer_graph_oriente
 * Crée un graphe orienté avec des poids sur les arrêtes.
 *
 * IN : lv la liste des sommets, lp la liste des arrêtes (triplets) avec poids
 * OUT : g le graph orienté créé
 *)
let creer_graph_oriente lv lep =
    let go = G.create () in begin
        List.iter (fun t -> G.add_vertex go (V.create t)) lv;
        List.iter (fun (v1, v2, p12) ->
            G.add_edge_e go (E.create (G.find_vertex go v1) p12 (G.find_vertex go v2))) lep;
        go;
    end
;;

(* print_vertex
 * Affiche un sommet d'un graphe.
 *)
let print_vertex fmt v = Format.fprintf fmt "%i" (V.label v);;

(* sans_dependance
 * Retourne la liste des noeuds d'un graphe orienté qui n'ont pas de prédécesseurs.
 *
 * IN : g le graphe dans lequel retrouver les noeuds
 * OUT : l la liste des noeuds sans prédécesserus du graphe
 *)
let sans_dependance g = G.fold_vertex (fun v l ->
    if G.in_degree g v = 0 then v::l else l) g []
;;

(* a_pred_numerotes
 * Détermine si le noeud donné a tous ses prédécesseurs dans la liste donnée.
 *
 * IN : g le graphe, z la liste, v le noeud
 * OUT : true ssi tous les prédécesseurs de v dans g sont dans z
 *)
let a_pred_numerotes g z v = List.for_all (fun v ->
    List.mem v z) (G.pred g v)
;;

(* tri_topologique
 * Effectue le tri topologique d'un graphe donné.
 *
 * IN : g le graphe à trier.
 * OUT : l la liste des noeuds triés.
 *)
let tri_topologique g =
    let y = sans_dependance g in
    let rec aux z = function
        | [] -> z
        | v::y -> aux (v::z) (G.fold_succ (fun w y ->
            if (a_pred_numerotes g (v::z) w) then (w::y) else y) g v y)
    in List.rev (aux [] y)
;;
