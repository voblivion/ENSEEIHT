with text_io; use text_io;
with ada.integer_text_io; use ada.integer_text_io;

procedure premier is
	NMAX : constant integer := 5;
	type INT_ARRAY is ARRAY(1..NMAX) of integer;
	un_tab : INT_ARRAY;
	nbr_elts : integer := 0;
	
	q : boolean := false;
	choix : character;
	ligne : integer := 0;
	
	occurence : integer;
	valeur : integer;
	j : integer;
	n : integer;
begin
	-- Choix de l'action à effectuer
	loop
		put("--------------------"); NEW_LINE; 
		put("Que souhaitez-vous faire ?"); NEW_LINE;
		put("(i)nitialiser le tableau"); NEW_LINE;
		if nbr_elts > 0 then
			put("a(f)ficher le tableau"); NEW_LINE;
			put("(m)odifier une ligne du tableau"); NEW_LINE;
			put("(a)ugmenter de 1 les valeurs du tableau"); NEW_LINE;
			put("(r)écupérer l'indice de la p-ième occurence d'une valeur"); NEW_LINE;
			put("i(n)sérer un élément au début du tableau"); NEW_LINE;
		end if;
		put("(q)uitter"); NEW_LINE;
		put("--------------------"); NEW_LINE; 
		get(choix); NEW_LINE; NEW_LINE; NEW_LINE; NEW_LINE; NEW_LINE; NEW_LINE; NEW_LINE;
		put("--------------------"); NEW_LINE;
		
		case choix is
			-- Lecture du tableau
			when 'i' =>
				put("Initialisation du tableau :"); NEW_LINE;
				put("--------------------"); NEW_LINE;
				-- Lecture du nombre d'éléments
				loop
					put("Combien d'éléments doit contenir le tableau ?");
					get(nbr_elts);
					NEW_LINE;
					exit when nbr_elts >= 0 and nbr_elts <= NMAX;
				end loop;
				-- Lecture des éléments
				put("Remplissage du tableau :"); NEW_LINE;
				for i in 1..nbr_elts loop
					put("Valeur de l'élément "); put(i); put(" :");
					get(un_tab(i));
				end loop;

			-- Affichage du tableau
			when 'f' =>
				put("Affichage du tableau :"); NEW_LINE;
				put("--------------------"); NEW_LINE;
				put("_________________________");NEW_LINE;
				for i in 1..nbr_elts loop
					put("|");put(i);put("|");put(un_tab(i));put("|");NEW_LINE;
				end loop;
				put("_________________________");

			-- Modification d'une ligne du tableau
			when 'm' =>
				put("Modification d'une ligne du tableau :"); NEW_LINE;
				put("--------------------"); NEW_LINE;
				loop
					put("Choix de la ligne à modifier : ");
					get(ligne); NEW_LINE;
					exit when ligne >= 1 and ligne <= nbr_elts;
				end loop;
				put("Valeur à mettre : ");
				get(un_tab(ligne));

			-- Incrémentation des valeurs du tableau
			when 'a' =>
				put("Incrémentation des valeurs du tableau."); NEW_LINE;
				put("--------------------"); NEW_LINE;
				for i in 1..nbr_elts loop
					un_tab(i) := un_tab(i)+1;
				end loop;

			-- Récupération de l'indice de p-ième occurence
			when 'r' =>
				put("Récupération de l'indice de p-ième occurence :"); NEW_LINE;
				put("--------------------"); NEW_LINE;
				-- Occurence
				put("Occurence souhaitée : ");
				get(occurence); NEW_LINE;
				-- Valeur à trouver
				put("Valeur à trouver : ");
				get(valeur); NEW_LINE;
				-- Recherche de la p-ième occurence				
				j:=1;
				n:=0;
				while j <= nbr_elts and occurence /= n loop
					if un_tab(j) = valeur then
						n := n+1;
					end if;
					j := j+1;
				end loop;
				-- j vaut nbr_elts+1 si occurence /= n et l'indice recherché sinon
				-- Affichage des résultats
				if occurence = 0 or occurence /= n then
					put("Valeur non présente ce nombre de fois.");
				else
					put(valeur); put(" présente sa "); put(occurence);
					put("-ième occurence à l'indice "); put(j-1);
				end if;

			-- Ajout d'un élément au début du tableau
			when 'n' =>
				put("Récupération de l'indice de p-ième occurence :"); NEW_LINE;
				put("--------------------"); NEW_LINE;
				if nbr_elts < NMAX then
					put("Valeur à ajouter : ");
					get(valeur);
					for i in reverse 1..nbr_elts loop
						un_tab(i+1) := un_tab(i);
					end loop;
					nbr_elts := nbr_elts+1;
					un_tab(1) := valeur;
				else
					put("Le tableau est déjà plein.");
				end if;

			-- Quitter
			when 'q' =>
				q := true;
			when others =>
				put("Commande non reconnue"); NEW_LINE;
		end case;
		NEW_LINE; NEW_LINE; NEW_LINE;
		exit when q;
	end loop;
end premier;
