(* creer_graph_oriente
 * Crée un graphe orienté avec des poids sur les arrêtes.
 *
 * IN : lv la liste des sommets, lp la liste des arrêtes (triplets) avec poids
 * OUT : g le graph orienté créé
 *)
(*let creer_graph_oriente lv lep =
    let go = DAG.create () in begin
        List.iter (fun t -> DAG.add_vertex go (Vertex.create t)) lv;
        List.iter (fun (v1, v2, p12) ->
            DAG.add_edge_e go (Edge.create (DAG.find_vertex go v1) p12 (DAG.find_vertex go v2))) lep;
        go;
    end
;;*)

(* print_vertex
 * Affiche un sommet d'un graphe.
 *)
let print_vertex fmt v = Format.fprintf fmt "('%s', %i, %i)" (fst (DAG.V.label v)) (snd (DAG.V.label v)) (DAG.Mark.get v);;
