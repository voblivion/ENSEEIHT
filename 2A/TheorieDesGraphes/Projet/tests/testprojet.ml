open DAG.DAG
open DAG

module TestProjet =
struct
    let findver g t = 
        let li = fold_vertex (fun v lv -> if Vertex.equal (V.label t) (V.label v) then v::lv else lv) g [] in
        List.hd li;;

    let rec recuperevertexori g lv  = 
        match lv with
            t::q ->
                let v = findver g t in
                v :: (recuperevertexori g q)
            | [] -> [];;

    let rec recuperevertexori2 g llv  = 
        match llv with
            t::q ->
                (recuperevertexori g t)::(recuperevertexori2 g q)
            | [] -> [];;
    
	(*recupere tous les vertex d'un DAG*)
	let getallvertices g = fold_vertex (fun v lv -> (v::lv)) g [];;
    
	(*affiche une liste de vertex*)
	let affiche_list l_v = List.iter (fun v -> (Format.printf "%s " (Vertex.name (V.label v)) )) l_v;  Format.printf "\n";;
    
	(*affiche une liste de listes de vertex*)
	let affiche_list_list ll_v = List.iter affiche_list ll_v;;
    
	(*fonction verifiant que chaque vertex du graphe est present dans la liste*)
	let graphe_dans_liste g lv = fold_vertex (fun v b -> b && (List.mem v lv) ) g true ;;
	
	(*fonction verifiant que chaque vertex de la liste est present dans le graphe*)
	let liste_dans_graphe g lv = List.for_all (fun v -> (mem_vertex g v) ) lv;;
	
	(*fonction verifiant que la liste ne contient pas de doublons*)
	let rec pas_de_doublons lv =
		match lv with
		|[]   ->
			true
		|v::q ->
			(not (List.mem v q)) && (pas_de_doublons q) ;;
	
	(*fonction verifiant qu'une liste respecte l'ordre partiel du graphe*)
	let rec verif_ordre_partiel g lv =
		match lv with
		| []    -> (*si la liste est vide, l'ordre partiel est verifie (normal...)*)
			true
		| v::qv -> (*si la liste n'est pas vide, on vérifie que les successeurs du premier element sont dans la suite de la liste*)
			(List.for_all  (fun vpred -> not (List.mem vpred qv) ) (pred g v)) &&
			(verif_ordre_partiel g qv);;
	
	(*Verifie les conditions du tri_topologique*)
	let verif_tri_topo g lv =
		let g_in_l = graphe_dans_liste g lv in
		let l_in_g = liste_dans_graphe g lv in
		let pas_doub = pas_de_doublons lv in
		let ordre_par = verif_ordre_partiel g lv in
		
		if (not g_in_l) then Format.printf "Les elements du graphe ne sont pas tous dans la liste \n";
		if (not l_in_g) then Format.printf "Les elements de la liste ne sont pas tous dans le graphe \n";
		if (not pas_doub) then Format.printf "Des doublons existent dans la liste \n";
		if (not ordre_par) then Format.printf "L'ordre partiel n'est pas respecte \n";

		if (g_in_l && l_in_g && pas_doub && ordre_par) then Format.printf "Toutes les conditions sont respectees \n";
		
		(g_in_l && l_in_g && pas_doub && ordre_par);;
	
	(*verifie qu'un vertex appartient à une liste*)
	let vertex_dans_liste lv v = List.mem v lv;;

	(*verifie que les predecesseurs d'un vertex appartiennent à une liste*)
	let pred_vertex_dans_liste g lv v = List.for_all (vertex_dans_liste lv) (pred g v);;

	(*Verifie les conditions de l'ordonnanceur avec ressources limitees*)
	let verif_ordo_lim res g llv =
	    
		let max_ress_lim llv_ = (*verifie qu'a chaque etape, tous les processus pouvant être executés sont executés*)
			let rec aux llvfutur_ lvpast_ = (*décomposition de la liste en etape suivante, et precedente*)
		        match llvfutur_ with
		        |[] -> true
		        |lvcur::qlvfutur -> 
		        	if ((List.length lvcur) = res ) then (aux qlvfutur (lvpast_@lvcur))
		        	else
	        		begin
						let qfutur  = List.flatten qlvfutur in (*Pour chaque element futur, l'ensemble de ses predecesseurs n'est pas dans lvpast*)
				    	(List.for_all (fun vtest -> not(pred_vertex_dans_liste g lvpast_ vtest)) qfutur) && (aux qlvfutur (lvpast_@lvcur))
		        	end in
			(aux llv_ []) in
		
		let rec size_verif llv_ res_ = (*verifie qu'à chaque étape, on utilise au maximum le nombre de ressources que ce qu'on a*)
			match llv_ with
			| [] -> true
			| lv_::qlv_ ->
				((List.length lv_) <= res_) && (size_verif qlv_ res_) in
		
		let llv_flat = List.flatten llv in
		let g_in_l = graphe_dans_liste g llv_flat in
		let l_in_g = liste_dans_graphe g llv_flat in
		let pas_doub = pas_de_doublons llv_flat in
		let ordre_par = verif_ordre_partiel g llv_flat in
		let size = size_verif llv res in
		let max_ress = max_ress_lim llv in
		
		if (not g_in_l) then Format.printf "Les elements du graphe ne sont pas tous dans la liste \n";
		if (not l_in_g) then Format.printf "Les elements de la liste ne sont pas tous dans le graphe \n";
		if (not pas_doub) then Format.printf "Des doublons existent dans la liste \n";
		if (not ordre_par) then Format.printf "L'ordre partiel n'est pas respecte \n";
		if (not size) then Format.printf "Trop de ressources ont ete utilisees \n";
		if (not max_ress && size) then Format.printf "Le maximum de ressources n'est pas utilise a chaque etape \n";
        
		if (g_in_l && l_in_g && pas_doub && ordre_par && size && max_ress) then Format.printf "Toutes les conditions sont respectees \n";
		
		(g_in_l && l_in_g && pas_doub && ordre_par && size && max_ress);;
        
    let verif_ordo_lim_ss_contr res mem g llv =
        
        let current_memory lvcur = List.fold_right (fun vcur m -> m + (Vertex.memory (V.label vcur))) lvcur 0 in

		let max_ress_lim llv_ = (*verifie qu'a chaque etape, tous les processus pouvant être executés sont executés*)
			let rec aux llvfutur_ lvpast_ = (*décomposition de la liste en etape suivante, et precedente*)
		        match llvfutur_ with
		        |[] -> true
		        |lvcur::qlvfutur -> 
                    begin
                        let curr_ress = List.length lvcur in
                        let curr_mem = current_memory lvcur in
                        if (curr_ress = res || curr_mem = mem) then (aux qlvfutur (lvpast_@lvcur))
                        else
                            begin
                                (*Pour chaque element futur, l'ensemble de ses predecesseurs n'est pas dans lvpast, ou il nécessite plus de ressources que disponibles*)
                                let qfutur  = List.flatten qlvfutur in
                                let testproc v = 
                                    not(pred_vertex_dans_liste g lvpast_ v) ||
                                    Vertex.memory (V.label v) + curr_mem > mem in
                                let nomore = List.for_all testproc qfutur in
                                if nomore then aux qlvfutur (lvpast_@lvcur)
                                else false
                            end
                    end in
			(aux llv_ []) in

		        	(*if ((List.length lvcur) = res) then (aux qlvfutur (lvpast_@lvcur))
		        	else
	        		begin
                        let mem_cur = current_memory lvcur in
						let qfutur  = List.flatten qlvfutur in (*Pour chaque element futur, l'ensemble de ses predecesseurs n'est pas dans lvpast, ou il nécessite plus de ressources que disponibles*)
				    	(List.for_all (fun vtest -> not(pred_vertex_dans_liste g lvpast_ vtest) || (((Vertex.memory (V.label vtest)) + mem_cur) > mem) ) qfutur) && (aux qlvfutur (lvpast_@lvcur))
		        	end in*)
		
		let rec size_verif llv_ = (*verifie qu'à chaque étape, on utilise au maximum le nombre de ressources que ce qu'on a*)
			match llv_ with
			| [] -> true
			| lv_::qlv_ ->
				((List.length lv_) <= res) && ((current_memory lv_) <= mem) && (size_verif qlv_) in
		
		let llv_flat = List.flatten llv in
		let g_in_l = graphe_dans_liste g llv_flat in
		let l_in_g = liste_dans_graphe g llv_flat in
		let pas_doub = pas_de_doublons llv_flat in
		let ordre_par = verif_ordre_partiel g llv_flat in
		let size = size_verif llv in
		let max_ress = max_ress_lim llv in
		
		if (not g_in_l) then Format.printf "Les elements du graphe ne sont pas tous dans la liste \n";
		if (not l_in_g) then Format.printf "Les elements de la liste ne sont pas tous dans le graphe \n";
		if (not pas_doub) then Format.printf "Des doublons existent dans la liste \n";
		if (not ordre_par) then Format.printf "L'ordre partiel n'est pas respecte \n";
		if (not size) then Format.printf "Trop de ressources ont ete utilisees \n";
		if (not max_ress && size) then Format.printf "Le maximum de ressources n'est pas utilise a chaque etape \n";
        
		if (g_in_l && l_in_g && pas_doub && ordre_par && size && max_ress) then Format.printf "Toutes les conditions sont respectees \n";
		
		(g_in_l && l_in_g && pas_doub && ordre_par && size && max_ress);;
		
end




