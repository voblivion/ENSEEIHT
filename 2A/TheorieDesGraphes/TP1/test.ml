module G = Graph.Pack.Graph;;
module V = G.V;;
module M = G.Mark;;

(* Création d'un graphe *)
let g = G.create ();;

(* Création de trois sommets *)
let v1 = V.create 1;;
let v2 = V.create 2;;
let v3 = V.create 3;;
let v4 = V.create 4;;
let v5 = V.create 5;;

(* Ajout des trois sommets au graphe *)
G.add_vertex g v1;;
G.add_vertex g v2;;
G.add_vertex g v3;;
G.add_vertex g v4;;
G.add_vertex g v5;;

(* Ajout d'arrêtes *)
G.add_edge g v4 v5;;
G.add_edge g v5 v2;;
G.add_edge g v1 v3;;
G.add_edge g v3 v2;;
G.add_edge g v2 v1;;
G.add_edge g v2 v4;;
G.add_edge g v4 v3;;
G.add_edge g v3 v5;;
