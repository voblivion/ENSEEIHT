with text_io; use text_io;
with ada.integer_text_io; use ada.integer_text_io;

procedure morpion is
	-- Déclaration des constantes --
	KMAX : constant integer := 10;
	-- Déclaration des types --
	Type Symbole is (LIBRE, ROND, CROIX);
	Type Damier is array(1..KMAX, 1..KMAX) of Symbole;
	Type Joueur is (JROND, JCROIX);
	Type Etat_Jeu is(EN_COURS, GAGNE, NUL);
	-- Déclarations des sous programmes --
	-- ========================= initialiser_jeu ========================= --
	-- sémantique : demande la taille du damier, le symbole du joueur commençant, et rempli la partie utile du damier avec des symboles LIBRE
	-- paramètres : le_damier (OUT, Damier), le_n (OUT, integer), le_joueur (OUT, Joueur)
	-- postconditions : la partie (1..le_n)*(1..le_n) du damier est rempli avec des LIBRE et le_n appartient à [1..KMAX]. Le Joueur est initialisé.
	procedure initialiser_jeu(le_damier : OUT Damier; le_n : IN OUT integer; le_joueur : OUT Joueur) is
		le_symbole : character;
	begin
		-- Demander la taille du damier --
		loop
			NEW_LINE; put("Donner la taille du damier : ");
			get(le_n); NEW_LINE;
			exit when le_n >= 1 and le_n <= KMAX;
		end loop;
		-- Le_n est la taille du damier, comprise entre 1 et KMAX --
		-- Initialiser le plateau --
		for i in 1..le_n loop
			for j in 1..le_n loop
				le_damier(i, j) := LIBRE;
			end loop;
		end loop;
		-- La partie effective du damier (1..Le_n, 1..Le_n) a ses cases remplies avec le symbole LIBRE --
		-- Demander le signe du joueur qui commence --
		loop
			put("Donner le symbole du joueur qui commence [X/O]: ");
			get(le_symbole); NEW_LINE;
			exit when le_symbole = 'X' or le_symbole = 'O';
		end loop;
		-- le_symbole vaut X ou O --

		-- On determine à partir du symbole le joueur qui commence
		if le_symbole = 'X' then
			le_joueur := JCROIX;
		else
			le_joueur := JROND;
		end if;
	end initialiser_jeu;
	-- ==================== afficher_jeu ==================== --
	-- sémantique : affiche la partie utile du damier de manière conviviale ainsi que le symbole du joueur dont c'est le tour
	-- paramètres : le_damier (IN, Damier), le_n (IN, integer), le_joueur (IN, Joueur)
	procedure afficher_jeu(le_damier : IN Damier; le_n : IN integer; le_joueur : IN Joueur) is
	begin
		put_line("============================================================");
		put_line("Le damier de la partie en cours est :");
		-- Afficher le damier --
		-- Afficher la bordure haute du damier --
		for k in 1..le_n loop
			put(" ____");
		end loop; NEW_LINE;
		-- Afficher les lignes du damier --
		for i in 1..le_n loop
			-- Afficher la partie haute de la ligne --
			put("|");
			for j in 1..le_n loop
				put("    |");
			end loop;
			-- Afficher la bordure gauche de la ligne --
			NEW_LINE; put("|  ");
			-- Afficher les cases de la ligne courante du damier --
			for j in 1..le_n loop
				-- Afficher le symbole de la case --
				if le_damier(i, j) = CROIX then
					put("X");
				elsif le_damier(i, j) = ROND then
					put("O");
				else
					put(" ");
				end if;
				-- Afficher la fin de la case --
				put(" |  ");
			end loop;
			-- Afficher la bordure basse de la ligne --
			NEW_LINE; put("|");
			for j in 1..le_n loop
				put("____|");
			end loop; NEW_LINE;
		end loop; NEW_LINE;
		-- Afficher le joueur courant --
		if le_joueur = JCROIX then
			put_line("C'est au joueur jouant les X de jouer.");
		else
			put_line("C'est au joueur jouant les O de jouer.");
		end if;
	end afficher_jeu;
	-- ==================== jouer ==================== --
	-- sémantique : fait joueur un joueur, actualise l'état du jeu, et change le joueur dont c'est le tour
	-- paramètres : le_damier (IN OUT, Damier), le_n (IN, integer), le_joueur (IN OUT, Joueur), l_etat (IN OUT Etat_Jeu)
	-- preconditions : Etat_Jeu = EN_COURS, le_damier contient une case LIBRE au moins
	-- postconditions : le_damier contient une case LIBRE de moins et une case du joueur en cours de plus. Le joueur en cours en sortie est l'inverse de celui en entrée. L'état est NUL si le damier est plein sans vainqueur, GAGNE si je joueur en entrée a gagné, EN_COURS sinon.
	procedure jouer(le_damier : IN OUT Damier; le_n : IN Integer; le_joueur : IN OUT Joueur; l_etat : IN OUT Etat_Jeu) is
		-- Déclaration des sous-programmes --
		-- =============== choisir_case =============== --
		-- sémantique : fait choisir au joueur courant la case à jouer parmis celles qui sont libres sur le damier
		-- paramètres : le_damier (IN OUT, Damier), le_n (IN, integer), le_joueur(OUT, Joueur)
		-- preconditions : le_damier contient une case LIBRE au moins
		-- postconditions : le_damier contient une case LIBRE de moins et une case du joueur en cours de plus.
		procedure choisir_case(le_damier : IN OUT Damier; le_n : IN Integer; le_joueur : IN Joueur) is
			-- Déclaration des sous-programmes --
			-- ========== afficher_jeu_detaille ========== --
			-- sémantique : affiche le jeu en remplissant les cases LIBRE avec un numéro qui leur est associé (j'ai décidé de ne pas faire "choix colonne puis choix ligne"). Un numéro de case est (sa_ligne - 1)*le_n+(sa_colonne-1) de façon à toute les numéroter depuis 0 jusque le_n²-1 de haut en bas et de gauche à droite.
			-- paramètres : le_damier (IN, Damier), le_n (IN, integer)
			procedure afficher_jeu_detaille(le_damier : IN Damier; le_n : IN integer) is
			begin
				-- Afficher le damier --
				-- Afficher la bordure haute du damier --
				for k in 1..le_n loop
					put(" ____");
				end loop;
				-- Afficher les lignes du damier --
				for i in 1..le_n loop
					-- Afficher la partie haute de la ligne --
					NEW_LINE;put("|");
					for j in 1..le_n loop
						put("    |");
					end loop;
					-- Afficher la bordure gauche de la ligne --
					NEW_LINE;put("| ");
					-- Afficher les cases de la ligne courante du damier --
					for j in 1..le_n loop
						-- Afficher le symbole de la case --
						if le_damier(i, j) = CROIX then
							put(" X");
						elsif le_damier(i, j) = ROND then
							put(" O");
						else
							put((i-1)*le_n+(j-1), 2);
						end if;
						-- Afficher la fin de la case --
						put(" | ");
					end loop; NEW_LINE;
					-- Afficher la bordure basse de la ligne --
					put("|");
					for j in 1..le_n loop
						put("____|");
					end loop;
				end loop; NEW_LINE;
			end afficher_jeu_detaille;
			-- ========== case_libre ========== --
			-- sémantique : détermine si la case en entrée est LIBRE dans le damier. Un numéro de case est (sa_ligne - 1)*le_n+(sa_colonne-1) de façon à toute les numéroter depuis 0 jusque le_n²-1 de haut en bas et de gauche à droite.
			-- paramètres : le_damier (IN, Damier), le_n (IN, integer), la_case(IN, integer); return boolean
			-- postconditions : le retour est "true" si et seulement si le numéro la_case fourni est un numéro de case valide ET que la dite case est libre
			function case_libre(le_damier : IN Damier; le_n : IN integer; la_case : IN integer) return boolean is
				la_ligne : integer;
				la_colonne : integer;
			begin
				la_ligne := 1 + (la_case / le_n);
				la_colonne := 1 + (la_case mod le_n);
				if la_ligne <= le_n and la_colonne <= le_n and la_case >= 0 then
					if le_damier(la_ligne, la_colonne) = LIBRE then
						return true;
					else
						return false;
					end if;
				else
					return false;
				end if;
			end afficher_jeu_detaille;
			-- Déclaration des variables --
			la_case : integer;
		begin
			-- Faire choisir la case à jouer au joueur courant --
			loop
				-- Afficher le damier avec les numéros des cases libres --
				afficher_jeu_detaille(le_damier, le_n);
				-- Demander au joueur de choisir la case à jouer --
				put("Choisir la case à jouer : ");
				get(la_case);
				-- S'arrêter quand la case chosie est bien libre --
				exit when case_libre(le_damier, le_n, la_case);
			end loop;
			-- la_case est la représentation entière d'une case libre du damier --
			-- Mettre à jour le damier --
			if le_joueur = JCROIX then
				le_damier(1 + la_case/le_n, 1 + la_case mod le_n) := CROIX;
			else
				le_damier(1 + la_case/le_n, 1 + la_case mod le_n) := ROND;
			end if;
		end choisir_case;
		-- =============== calculer_etat =============== --
		-- sémantique : actualise l'état du jeu en cours en fonction du joueur qui viens de jouer
		-- paramètres : le_damier (IN, Damier), le_n (IN, integer), le_joueur(IN, Joueur), l_etat (IN OUT, Etat_Jeu)
		-- preconditions : l_etat est EN_COURS et le joueur dont ce n'est pas le tour n'a pas gagné
		-- postconditions : L'état est NUL si le damier est plein sans vainqueur, GAGNE si je joueur en entrée a gagné, EN_COURS sinon.
		procedure calculer_etat(le_damier : IN Damier; le_n : IN integer; le_joueur : IN Joueur; l_etat : IN OUT Etat_Jeu) is
			-- Déclaration des sous-programmes --
			-- ========== ligne_gagne ========== --
			-- sémantique : détermine si l'une des lignes du damier est gagnante pour le symbole fourni
			-- paramètres : le_damier (IN, Damier), le_n (IN, integer), le_symbole(IN, Joueur); return boolean
			-- postconditions : le retour vaut true si et seulement si une ligne du damier est remplie de le_symbole
			function ligne_gagne(le_damier : IN Damier; le_n : IN integer; le_symbole : IN Symbole) return boolean is
				i, j : integer;
			begin
				-- Parcourir les lignes tant qu'elles ne sont pas gagnantes
				i := 1;
				loop
					-- Parcourir les cases de la ligne tant qu'elles contiennent le symbole du joueur --
					j := 1;
					while j <= le_n and then le_damier(i, j) = le_symbole loop
						j := j+1;
					end loop;
					-- j vaut le_n+1 si la ligne est gagnante pour le joueur, autre chose sinon --
					i := i+1;
					exit when j = le_n+1 or i > le_n;
				end loop;
				-- j vaut le_n+1 si la ligne est gagnante pour le joueur, autre chose sinon --
				return j = le_n+1;
			end ligne_gagne;
			-- ========== colonne_gagne ========== --
			-- sémantique : détermine si l'une des colonnes du damier est gagnante pour le symbole fourni
			-- paramètres : le_damier (IN, Damier), le_n (IN, integer), le_symbole(IN, Joueur); return boolean
			-- postconditions : le retour vaut true si et seulement si une colonne du damier est remplie de le_symbole
			function colonne_gagne(le_damier : IN Damier; le_n : IN integer; le_symbole : IN Symbole) return boolean is
				i, j : integer;
			begin
				-- Parcourir les colonnes tant qu'elles ne sont pas gagnantes
				j := 1;
				loop
					-- Parcourir les cases de la colonne tant qu'elles contiennent le symbole du joueur --
					i := 1;
					while i <= le_n and then le_damier(i, j) = le_symbole loop
						i := i+1;
					end loop;
					-- i vaut le_n+1 si la colonne est gagnante pour le joueur, autre chose sinon --
					j := j+1;
					exit when i = le_n+1 or j > le_n;
				end loop;
				-- i vaut le_n+1 si la colonne est gagnante pour le joueur, autre chose sinon --
				return i = le_n+1;
			end colonne_gagne;
			-- ========== premiere_diagonale_gagne ========== --
			-- sémantique : détermine si la première diagonale (haut gauche vers bas droit) du damier est gagnante pour le symbole fourni
			-- paramètres : le_damier (IN, Damier), le_n (IN, integer), le_symbole(IN, Joueur); return boolean
			-- postconditions : le retour vaut true si et seulement si la première diagonale du damier est remplie de le_symbole
			function premiere_diagonale_gagne(le_damier : IN Damier; le_n : IN integer; le_symbole : IN Symbole) return boolean is
				i : integer;
			begin
				-- Parcourir les cases de la diagonale première tant qu'elles contiennent le symbole du joueur --
				i := 1;
				while i <= le_n and then le_damier(i, i) = le_symbole loop
					i := i+1;
				end loop;
				-- i vaut le_n+1 si la diagonale premiere est gagnante pour le joueur, autre chose sinon --
				return i = le_n+1;
			end premiere_diagonale_gagne;
			-- ========== deuxieme_diagonale_gagne ========== --
			-- sémantique : détermine si la deuxième diagonale (haut droite vers bas gauche) du damier est gagnante pour le symbole fourni
			-- paramètres : le_damier (IN, Damier), le_n (IN, integer), le_symbole(IN, Joueur); return boolean
			-- postconditions : le retour vaut true si et seulement si la deuxième diagonale du damier est remplie de le_symbole
			function deuxieme_diagonale_gagne(le_damier : IN Damier; le_n : IN integer; le_symbole : IN Symbole) return boolean is
				i : integer;
			begin
				-- Parcourir les cases de la diagonale deuxieme tant qu'elles contiennent le symbole du joueur --
				i := 1;
				while i <= le_n and then le_damier(i, le_n+1-i) = le_symbole loop
					i := i+1;
				end loop;
				-- i vaut le_n+1 si la diagonale deuxieme est gagnante pour le joueur, autre chose sinon --
				return i = le_n+1;
			end deuxieme_diagonale_gagne;
			-- ========== damier_rempli ========== --
			-- sémantique : détermine si le damier est rempli
			-- paramètres : le_damier (IN, Damier), le_n (IN, integer); return boolean
			-- postconditions : le retour vaut true si et seulement si le damier est plein (aucune case LIBRE)
			function damier_rempli(le_damier : IN Damier; le_n : IN integer) return boolean is
				i, j : integer;
			begin
				-- On parcourt le damier tant que les cases rencontrées ne sont pas LIBRE --
				i := 1;
				j := 1;
				while j <= le_n and then le_damier(i,j) /= LIBRE loop
					i := i+1;
					if i > le_n then
						i := 1;
						j := j+1;
					end if;
				end loop;
				-- Si une case LIBRE est trouvée, j = le_n+1, sinon j <= le_n --
				return j = le_n+1;
			end damier_rempli;
			-- Déclaration des variables --
			le_symbole : Symbole;
		begin
			-- Déterminer le symbole du joueur --
			if le_joueur = JCROIX then
				le_symbole := CROIX;
			else
				le_symbole := ROND;
			end if;
			-- Changer l'état du jeu en GAGNE si une ligne, une colonne, ou une diagonale fait gagner le joueur courant --
			if ligne_gagne(le_damier, le_n, le_symbole) or colonne_gagne(le_damier, le_n, le_symbole) or premiere_diagonale_gagne(le_damier, le_n, le_symbole) or deuxieme_diagonale_gagne(le_damier, le_n, le_symbole) then
				l_etat := GAGNE;
			-- Changer l'état du jeu en NUL sinon et si il n'y a plus de case libre --
			elsif damier_rempli(le_damier, le_n) then
				l_etat := NUL;
			else
				l_etat := EN_COURS;
			end if;
		end calculer_etat;
	begin
		-- Le joueur choisit la case à cocher --
		choisir_case(le_damier, le_n, le_joueur);
		-- Déterminer si le coup fait changer l'état du jeu --
		calculer_etat(le_damier, le_n, le_joueur, l_etat);
		-- Changer le joueur courant --
		if le_joueur = JCROIX then
			le_joueur := JROND;
		else
			le_joueur := JCROIX;
		end if;
	end jouer;
	-- ==================== afficher_fin_de_jeu ==================== --
	-- sémantique : affiche le résultat de la partie
	-- paramètres : le_damier (IN, Damier), le_n (IN, integer), le_joueur (IN, Joueur), l_etat (IN Etat_Jeu);
	-- précondition : l_etat /= EN_COURS et si l_etat = GAGNE alors le joueur qui a gagné n'est pas le_joueur
	procedure afficher_fin_de_jeu(le_damier : IN Damier; le_n : IN integer; le_joueur: IN Joueur; l_etat : IN Etat_Jeu) is
	begin
		-- Afficher le damier --
		put_line("============================================================");
		-- Afficher la bordure haute du damier --
		for k in 1..le_n loop
			put(" ____");
		end loop;
		-- Afficher les lignes du damier --
		for i in 1..le_n loop
			-- Afficher la partie haute de la ligne --
			NEW_LINE; put("|");
			for j in 1..le_n loop
				put("    |");
			end loop;
			-- Afficher la bordure gauche de la ligne --
			NEW_LINE; put("|  ");
			-- Afficher les cases de la ligne courante du damier --
			for j in 1..le_n loop
				-- Afficher le symbole de la case --
				if le_damier(i, j) = CROIX then
					put("X");
				elsif le_damier(i, j) = ROND then
					put("O");
				else
					put(" ");
				end if;
				-- Afficher la fin de la case --
				put(" |  ");
			end loop;
			-- Afficher la bordure basse de la ligne --
			NEW_LINE; put("|");
			for j in 1..le_n loop
				put("____|");
			end loop;
		end loop; NEW_LINE;
		-- Afficher l'issue du jeu --
		if l_etat = NUL then
			put_line("Partie terminée : Il y a égalité."); NEW_LINE;
		elsif le_joueur = JCROIX then
			put_line("Partie terminée : Le joueur jouant les O a gagné."); NEW_LINE;
		else
			put_line("Partie terminée : Le joueur jouant les X a gagné."); NEW_LINE;
		end if;
	end afficher_fin_de_jeu;
	-- Déclaration des variables --
	le_damier : Damier;
	le_n : integer := 0;
	le_joueur : Joueur;
	l_etat : Etat_Jeu := EN_COURS;
begin
	-- Initialiser le jeu --
	initialiser_jeu(le_damier, le_n, le_joueur);
	-- Jouer la partie --
	loop
		-- Afficher le jeu en cours --
		afficher_jeu(le_damier, le_n, le_joueur);
		-- Faire jouer le joueur courant --
		jouer(le_damier, le_n, le_joueur, l_etat);
		-- S'arrêter quand le joueur gagné ou qu'il y a nul --
		exit when l_etat /= EN_COURS;
	end loop;
	-- L'état vaut NUL ou GAGNE si le_joueur a gagné --
	-- Afficher les données de fin de partie --
	afficher_fin_de_jeu(le_damier, le_n, le_joueur, l_etat);
end morpion;
