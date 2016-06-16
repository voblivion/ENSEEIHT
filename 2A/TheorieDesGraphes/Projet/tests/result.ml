open Projet
open Dag_test
open Testprojet.TestProjet

let _ =
    print_string "Tests automatiques graphe\n";
    print_string "\n";
    print_string "Tri topologique\n";
    
    print_string "Dag1\n";
    let topodag1 = try (recuperevertexori dag1 (tri_topologique dag1)) with _-> print_string "Plantage lors de l'évaluation\n"; [] in
    let vtopodag1 = verif_tri_topo dag1 topodag1 in
    print_string "Dag2\n";
    let topodag2 = try (recuperevertexori dag2 (tri_topologique dag2)) with _-> print_string "Plantage lors de l'évaluation\n"; [] in
    let vtopodag2 = verif_tri_topo dag2 topodag2 in
    print_string "Dag3\n";
    let topodag3 = try (recuperevertexori dag3 (tri_topologique dag3)) with _-> print_string "Plantage lors de l'évaluation\n"; [] in
    let vtopodag3 = verif_tri_topo dag3 topodag3 in
    print_string "Dag4\n";
    let topodag4 = try (recuperevertexori dag4 (tri_topologique dag4)) with _-> print_string "Plantage lors de l'évaluation\n"; [] in
    let vtopodag4 = verif_tri_topo dag4 topodag4 in
    
    if vtopodag1 && vtopodag2 && vtopodag3 && vtopodag4
    then
        print_string "Success !\n"
    else
        print_string "Fail !\n";

    print_string "\n";






    print_string "Ordonnanceur ressources limitées sans heuristique\n";
    
    print_string "Dag1\n";
    let ordo3limdag1 = try (recuperevertexori2 dag1 (ordonnanceur_sans_heuristique 3 dag1)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo3limdag1 = verif_ordo_lim 3 dag1 ordo3limdag1 in

    let ordo4limdag1 = try (recuperevertexori2 dag1 (ordonnanceur_sans_heuristique 4 dag1)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo4limdag1 = verif_ordo_lim 4 dag1 ordo4limdag1 in

    print_string "Dag2\n";
    let ordo3limdag2 = try (recuperevertexori2 dag2 (ordonnanceur_sans_heuristique 3 dag2)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo3limdag2 = verif_ordo_lim 3 dag2 ordo3limdag2 in

    let ordo4limdag2 = try (recuperevertexori2 dag2 (ordonnanceur_sans_heuristique 4 dag2)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo4limdag2 = verif_ordo_lim 4 dag2 ordo4limdag2 in

    print_string "Dag3\n";
    let ordo3limdag3 = try (recuperevertexori2 dag3 (ordonnanceur_sans_heuristique 3 dag3)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo3limdag3 = verif_ordo_lim 3 dag3 ordo3limdag3 in

    let ordo4limdag3 = try (recuperevertexori2 dag3 (ordonnanceur_sans_heuristique 4 dag3)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo4limdag3 = verif_ordo_lim 4 dag3 ordo4limdag3 in

    print_string "Dag4\n";
    let ordo3limdag4 = try (recuperevertexori2 dag4 (ordonnanceur_sans_heuristique 3 dag4)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo3limdag4 = verif_ordo_lim 3 dag4 ordo3limdag4 in

    let ordo4limdag4 = try (recuperevertexori2 dag4 (ordonnanceur_sans_heuristique 4 dag4)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo4limdag4 = verif_ordo_lim 4 dag4 ordo4limdag4 in

    if vordo3limdag1 && vordo3limdag2 && vordo3limdag3 && vordo3limdag4 && vordo4limdag1 && vordo4limdag2 && vordo4limdag3 && vordo4limdag4 
    then
        print_string "Success !\n"
    else
        print_string "Fail !\n";
    
    print_string "\n";




    print_string "Ordonnanceur ressources limitées avec heuristique\n";

    print_string "Dag1\n";
    let ordo3limheurdag1 = try (recuperevertexori2 dag1 (ordonnanceur_avec_heuristique 3 dag1)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo3limheurdag1 = verif_ordo_lim 3 dag1 ordo3limheurdag1 in

    let ordo4limheurdag1 = try (recuperevertexori2 dag1 (ordonnanceur_avec_heuristique 4 dag1)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo4limheurdag1 = verif_ordo_lim 4 dag1 ordo4limheurdag1 in

    print_string "Dag2\n";
    let ordo3limheurdag2 = try (recuperevertexori2 dag2 (ordonnanceur_avec_heuristique 3 dag2)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo3limheurdag2 = verif_ordo_lim 3 dag2 ordo3limheurdag2 in

    let ordo4limheurdag2 = try (recuperevertexori2 dag2 (ordonnanceur_avec_heuristique 4 dag2)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo4limheurdag2 = verif_ordo_lim 4 dag2 ordo4limheurdag2 in

    print_string "Dag3\n";
    let ordo3limheurdag3 = try (recuperevertexori2 dag3 (ordonnanceur_avec_heuristique 3 dag3)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo3limheurdag3 = verif_ordo_lim 3 dag3 ordo3limheurdag3 in

    let ordo4limheurdag3 = try (recuperevertexori2 dag3 (ordonnanceur_avec_heuristique 4 dag3)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo4limheurdag3 = verif_ordo_lim 4 dag3 ordo4limheurdag3 in

    print_string "Dag4\n";
    let ordo3limheurdag4 = try (recuperevertexori2 dag4 (ordonnanceur_avec_heuristique 3 dag4)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo3limheurdag4 = verif_ordo_lim 3 dag4 ordo3limheurdag4 in

    let ordo4limheurdag4 = try (recuperevertexori2 dag4 (ordonnanceur_avec_heuristique 4 dag4)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo4limheurdag4 = verif_ordo_lim 4 dag4 ordo4limheurdag4 in
    
    let ameliore = 
          (if List.length ordo3limheurdag1 = 6 then 1 else 0)
        + (if List.length ordo3limheurdag2 = 8 then 1 else 0)
        + (if List.length ordo3limheurdag3 = 5 then 1 else 0)
        + (if List.length ordo3limheurdag4 = 11 then 1 else 0)
        + (if List.length ordo4limheurdag1 = 6 then 1 else 0)
        + (if List.length ordo4limheurdag2 = 8 then 1 else 0)
        + (if List.length ordo4limheurdag3 = 5 then 1 else 0)
        + (if List.length ordo4limheurdag4 = 11 then 1 else 0) in
    
    if vordo3limheurdag1 && vordo3limheurdag2 && vordo3limheurdag3 && vordo3limheurdag4 && vordo4limheurdag1 && vordo4limheurdag2 && vordo4limheurdag3 && vordo4limheurdag4 
    then
        begin
            print_string "Success !\n";
            print_string "Optimum atteint sur ";
            print_int    ameliore;
            print_string "/8 graphes !\n"
        end
    else
        print_string "Fail !\n";
    
    print_string "\n";




    print_string "Ordonnanceur avec contrainte mémoire\n";

    print_string "Dag1\n";
    let ordo3limmemdag1 = try (recuperevertexori2 dag1 (ordonnanceur_contrainte_memoire 3 2 dag1)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo3limmemdag1 = verif_ordo_lim_ss_contr 3 2 dag1 ordo3limmemdag1 in

    let ordo4limmemdag1 = try (recuperevertexori2 dag1 (ordonnanceur_contrainte_memoire 3 4 dag1)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo4limmemdag1 = verif_ordo_lim_ss_contr 3 4 dag1 ordo4limmemdag1 in

    print_string "Dag2\n";
    let ordo3limmemdag2 = try (recuperevertexori2 dag2 (ordonnanceur_contrainte_memoire 3 2 dag2)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo3limmemdag2 = verif_ordo_lim_ss_contr 3 2 dag2 ordo3limmemdag2 in

    let ordo4limmemdag2 = try (recuperevertexori2 dag2 (ordonnanceur_contrainte_memoire 3 4 dag2)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo4limmemdag2 = verif_ordo_lim_ss_contr 3 4 dag2 ordo4limmemdag2 in

    print_string "Dag3\n";
    let ordo3limmemdag3 = try (recuperevertexori2 dag3 (ordonnanceur_contrainte_memoire 3 2 dag3)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo3limmemdag3 = verif_ordo_lim_ss_contr 3 2 dag3 ordo3limmemdag3 in

    let ordo4limmemdag3 = try (recuperevertexori2 dag3 (ordonnanceur_contrainte_memoire 3 4 dag3)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo4limmemdag3 = verif_ordo_lim_ss_contr 3 4 dag3 ordo4limmemdag3 in

    print_string "Dag4\n";
    let ordo3limmemdag4 = try (recuperevertexori2 dag4 (ordonnanceur_contrainte_memoire 3 3 dag4)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo3limmemdag4 = verif_ordo_lim_ss_contr 3 3 dag4 ordo3limmemdag4 in

    let ordo4limmemdag4 = try (recuperevertexori2 dag4 (ordonnanceur_contrainte_memoire 3 4 dag4)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo4limmemdag4 = verif_ordo_lim_ss_contr 3 4 dag4 ordo4limmemdag4 in
    
    if vordo3limmemdag1 && vordo3limmemdag2 && vordo3limmemdag3 && vordo3limmemdag4 && vordo4limmemdag1 && vordo4limmemdag2 && vordo4limmemdag3 && vordo4limmemdag4 
    then
        begin
            print_string "Success !\n";
        end
    else
        print_string "Fail !\n";

    print_string "\n";





    print_string "Ordonnanceur avec contrainte mémoire et heuristique\n";
    
    print_string "Dag1\n";
    let ordo3limmembondag1 = try (recuperevertexori2 dag1 (ordonnanceur_contrainte_memoire_bonus 3 2 dag1)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo3limmembondag1 = verif_ordo_lim_ss_contr 3 2 dag1 ordo3limmembondag1 in

    let ordo4limmembondag1 = try (recuperevertexori2 dag1 (ordonnanceur_contrainte_memoire_bonus 3 4 dag1)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo4limmembondag1 = verif_ordo_lim_ss_contr 3 4 dag1 ordo4limmembondag1 in

    print_string "Dag2\n";
    let ordo3limmembondag2 = try (recuperevertexori2 dag2 (ordonnanceur_contrainte_memoire_bonus 3 2 dag2)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo3limmembondag2 = verif_ordo_lim_ss_contr 3 2 dag2 ordo3limmembondag2 in

    let ordo4limmembondag2 = try (recuperevertexori2 dag2 (ordonnanceur_contrainte_memoire_bonus 3 4 dag2)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo4limmembondag2 = verif_ordo_lim_ss_contr 3 4 dag2 ordo4limmembondag2 in

    print_string "Dag3\n";
    let ordo3limmembondag3 = try (recuperevertexori2 dag3 (ordonnanceur_contrainte_memoire_bonus 3 2 dag3)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo3limmembondag3 = verif_ordo_lim_ss_contr 3 2 dag3 ordo3limmembondag3 in

    let ordo4limmembondag3 = try (recuperevertexori2 dag3 (ordonnanceur_contrainte_memoire_bonus 3 4 dag3)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo4limmembondag3 = verif_ordo_lim_ss_contr 3 4 dag3 ordo4limmembondag3 in

    print_string "Dag4\n";
    let ordo3limmembondag4 = try (recuperevertexori2 dag4 (ordonnanceur_contrainte_memoire_bonus 3 3 dag4)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo3limmembondag4 = verif_ordo_lim_ss_contr 3 3 dag4 ordo3limmembondag4 in

    let ordo4limmembondag4 = try (recuperevertexori2 dag4 (ordonnanceur_contrainte_memoire_bonus 3 4 dag4)) with _-> print_string "Plantage lors de l'évaluation\n"; [[]] in
    let vordo4limmembondag4 = verif_ordo_lim_ss_contr 3 4 dag4 ordo4limmembondag4 in
    
    let ameliore = 
          (if List.length ordo3limmemdag1 = 9 then 1 else 0)
        + (if List.length ordo3limmemdag2 = 8 then 1 else 0)
        + (if List.length ordo3limmemdag3 = 7 then 1 else 0)
        + (if List.length ordo3limmemdag4 = 12 then 1 else 0)
        + (if List.length ordo4limmemdag1 = 6 then 1 else 0)
        + (if List.length ordo4limmemdag2 = 8 then 1 else 0)
        + (if List.length ordo4limmemdag3 = 5 then 1 else 0)
        + (if List.length ordo4limmemdag4 = 11 then 1 else 0) in

    if vordo3limmembondag1 && vordo3limmembondag2 && vordo3limmembondag3 && vordo3limmembondag4 && vordo4limmembondag1 && vordo4limmembondag2 && vordo4limmembondag3 && vordo4limmembondag4 
    then
        begin
            print_string "Success !\n";
            print_string "Optimum atteint sur ";
            print_int    ameliore;
            print_string "/8 graphes !\n"
        end
    else
        print_string "Fail !\n";


    ()
;;

    
	
