with Ada.Text_IO; use Ada.Text_IO;

package body P_Arbre_Huffman is
	
	-------------------------------------------------------------------------------
	-- Sous-Programme : Ah_Valeur
	-------------------------------------------------------------------------------
	function Ah_Valeur(A_Ah : IN A_Arbre_Huffman) return character is
	begin

		return A_Ah.all.Valeur;
		
	exception
		when CONSTRAINT_ERROR => raise ARBRE_VIDE;
	end Ah_Valeur;

	-------------------------------------------------------------------------------
	-- Sous-Programme : Ah_Frequence
	-------------------------------------------------------------------------------
	function Ah_Frequence(A_Ah : IN A_Arbre_Huffman) return integer is
	begin

		return A_Ah.all.Frequence;
		
	exception
		when CONSTRAINT_ERROR => raise ARBRE_VIDE;
	end Ah_Frequence;

	-------------------------------------------------------------------------------
	-- Sous-Programme : Ah_Pere
	-------------------------------------------------------------------------------
	function Ah_Pere(A_Ah : IN A_Arbre_Huffman) return A_Arbre_Huffman is
	begin

		return A_Ah.all.Pere;
		
	exception
		when CONSTRAINT_ERROR => raise ARBRE_VIDE;
	end Ah_Pere;

	-------------------------------------------------------------------------------
	-- Sous-Programme : Ah_Fils_Gauche
	-------------------------------------------------------------------------------
	function Ah_Fils_Gauche(A_Ah : IN A_Arbre_Huffman) return A_Arbre_Huffman is
	begin

		return A_Ah.all.Fils_Gauche;
		
	exception
		when CONSTRAINT_ERROR => raise ARBRE_VIDE;
	end Ah_Fils_Gauche;

	-------------------------------------------------------------------------------
	-- Sous-Programme : Ah_Fils_Droit
	-------------------------------------------------------------------------------
	function Ah_Fils_Droit(A_Ah : IN A_Arbre_Huffman) return A_Arbre_Huffman is
	begin

		return A_Ah.all.Fils_Droit;
		
	exception
		when CONSTRAINT_ERROR => raise ARBRE_VIDE;
	end Ah_Fils_Droit;


	-------------------------------------------------------------------------------
	-- Sous-Programme : Ah_Precedent
	-------------------------------------------------------------------------------
	function Ah_Precedent(A_Ah : IN A_Arbre_Huffman) return A_Arbre_Huffman is
	begin

		return A_Ah.all.Precedent;
		
	exception
		when CONSTRAINT_ERROR => raise ARBRE_VIDE;
	end Ah_Precedent;

	-------------------------------------------------------------------------------
	-- Sous-Programme : Ah_Suivant
	-------------------------------------------------------------------------------
	function Ah_Suivant(A_Ah : IN A_Arbre_Huffman) return A_Arbre_Huffman is
	begin

		return A_Ah.all.Suivant;
		
	exception
		when CONSTRAINT_ERROR => raise ARBRE_VIDE;
	end Ah_Suivant;

	-------------------------------------------------------------------------------
	-- Sous-Programme : Ah_Creer_Vide
	-------------------------------------------------------------------------------
	function Ah_Creer_Vide return A_Arbre_Huffman is
	begin

		return new T_Arbre_Huffman'(ASCII.NUL, 0, null, null, null, null, null);
	end Ah_Creer_Vide;

	-------------------------------------------------------------------------------
	-- Sous-Programme : Ah_Creer_Feuille
	-------------------------------------------------------------------------------
	function Ah_Creer_Feuille(Valeur : IN character) return A_Arbre_Huffman is
	begin

		return new T_Arbre_Huffman'(Valeur, 0, null, null, null, null, null);
	end Ah_Creer_Feuille;

	-------------------------------------------------------------------------------
	-- Sous-Programme : Ah_Est_Null
	-------------------------------------------------------------------------------
	function Ah_Est_Null(A_Ah : IN A_Arbre_Huffman) return boolean is
	begin

		return A_Ah = null;
	end Ah_Est_Null;

	-------------------------------------------------------------------------------
	-- Sous-Programme : Ah_Est_Vide
	-------------------------------------------------------------------------------
	function Ah_Est_Vide(A_Ah : IN A_Arbre_Huffman) return boolean is
	begin

		return A_Ah.all.Valeur = ASCII.NUL and then A_Ah.all.Fils_Gauche = null and then A_Ah.all.Fils_Droit = null;
		
	exception
		when CONSTRAINT_ERROR => raise ARBRE_VIDE;
	end Ah_Est_Vide;

	-------------------------------------------------------------------------------
	-- Sous-Programme : Ah_Est_Feuille
	-------------------------------------------------------------------------------
	function Ah_Est_Feuille(A_Ah : IN A_Arbre_Huffman) return boolean is
	begin

		return A_Ah.all.Fils_Gauche = null and then A_Ah.all.Fils_Droit = null;
		
	exception
		when CONSTRAINT_ERROR => raise ARBRE_VIDE;
	end Ah_Est_Feuille;

	-------------------------------------------------------------------------------
	-- Sous-Programme : Ah_Est_Racine
	-------------------------------------------------------------------------------
	function Ah_Est_Racine(A_Ah : IN A_Arbre_Huffman) return boolean is
	begin

		return A_Ah.all.Pere = null;
		
	exception
		when CONSTRAINT_ERROR => raise ARBRE_VIDE;
	end Ah_Est_Racine;

	-------------------------------------------------------------------------------
	-- Sous-Programme : Ah_Est_Fils_Gauche
	-------------------------------------------------------------------------------
	function Ah_Est_Fils_Gauche(A_Ah : IN A_Arbre_Huffman) return boolean is
	begin
		if A_Ah.all.Pere = null then
			return false;
		elsif A_Ah.all.Suivant = null then
			return false;
		else
			return A_Ah.all.Pere = A_Ah.all.Suivant.all.Pere;
		end if;	
		
	exception
		when CONSTRAINT_ERROR => raise ARBRE_VIDE;
	end Ah_Est_Fils_Gauche;
	

	-------------------------------------------------------------------------------
	-- Sous-Programme : Put
	-------------------------------------------------------------------------------
	procedure Put(A_Ah : IN A_Arbre_Huffman) is
		-----------------------------------------------------------------------
		-- Sous-Programme : Indenter
		-- Sémantique : Afficher une indentation de taille variable
		-----------------------------------------------------------------------
		procedure Indenter(Taille : IN integer) is
		begin
			for k in 1..Taille loop
				put("   ");
			end loop;
		end Indenter;
		
		-----------------------------------------------------------------------
		-- Sous-Programme : Afficher_Noeud
		-- Sémantique : Afficher le contenu d'un noeud avec indentation
		-----------------------------------------------------------------------
		procedure Afficher_Noeud(A_Ah : IN A_Arbre_Huffman; Profondeur : IN integer) is
		begin
			-- Si on est sur la feuille vide, afficher les données de la feuille vide
			if Ah_Est_Vide(A_Ah) then
				Indenter(Profondeur);
					put("Vide");
			-- Sinon si on est sur une feuille, afficher les données de la feuille
			elsif Ah_Est_Feuille(A_Ah) then
				Indenter(Profondeur);
					put("Feuille (Valeur : "); 
					put(A_Ah.all.Valeur);
					put("; Fréquence : ");
					put(Integer'Image(A_Ah.all.Frequence));
					put(")"); NEW_LINE;
			-- Sinon on est sur un noeud, afficher les données de ses noeuds puis afficher ses fils
			else
				Indenter(Profondeur);
					put("Noeud (Fréquence : ");
					put(Integer'Image(A_Ah.all.Frequence));
					put(")"); NEW_LINE;
				Afficher_Noeud(A_Ah.all.Fils_Gauche, Profondeur+1);
				Afficher_Noeud(A_Ah.all.Fils_Droit, Profondeur+1);
			end if;
		end Afficher_Noeud;
	begin

		Afficher_Noeud(A_Ah, 0); NEW_LINE;
		
	exception
		when CONSTRAINT_ERROR => raise ARBRE_VIDE;
	end Put;

	-------------------------------------------------------------------------------
	-- Sous-Programme : Ah_Rechercher_Feuille
	-------------------------------------------------------------------------------
	function Ah_Rechercher_Feuille(A_Ah : IN A_Arbre_Huffman; Valeur : IN character) return A_Arbre_Huffman is

		Tmp_Ah : A_Arbre_Huffman;
	begin
		if Ah_Est_Feuille(A_Ah) then
			if A_Ah.all.Valeur = Valeur then
				return A_Ah;
			else
				return null;
			end if;
		else
			Tmp_Ah := Ah_Rechercher_Feuille(A_Ah.all.Fils_Gauche, Valeur);
			if Tmp_Ah /= null then
				return Tmp_Ah;
			else
				return Ah_Rechercher_Feuille(A_Ah.all.Fils_Droit, Valeur);
			end if;
		end if;
		
	exception
		when CONSTRAINT_ERROR => raise ARBRE_VIDE;
	end Ah_Rechercher_Feuille;
	

	-------------------------------------------------------------------------------
	-- Sous-Programme : Ah_Mot_Binaire
	-------------------------------------------------------------------------------
	function Ah_Mot_Binaire(A_Ah : IN A_Arbre_Huffman; Valeur : IN character) return T_Mot_Binaire is
		-----------------------------------------------------------------------
		-- Sous-Programme : Ajouter_Mot_Binaire_Pere
		-- Sémantique : Ajoute au code binaire courant celui du père.
		-----------------------------------------------------------------------
		procedure Ajouter_Mot_Binaire_Pere(A_Ah : IN A_Arbre_Huffman; Mb_Courant : IN OUT T_Mot_Binaire) is
		begin
			if not Ah_Est_Racine(A_Ah) then
				if Ah_Est_Fils_Gauche(A_Ah) then
					Mb_Ajouter_Tete(Mb_Courant, Bi_Creer_Un);
				else
					Mb_Ajouter_Tete(Mb_Courant, Bi_Creer_Zero);
				end if;
				Ajouter_Mot_Binaire_Pere(A_Ah.all.Pere, Mb_Courant);
			end if;
		end Ajouter_Mot_Binaire_Pere;
		
		Mb : T_Mot_Binaire;
	begin
		Mb := Mb_Creer_Vide;
		
		Ajouter_Mot_Binaire_Pere(Ah_Rechercher_Feuille(A_Ah, Valeur), Mb);
		
		return Mb;
		
	exception
		when CONSTRAINT_ERROR => raise ARBRE_VIDE;
	end Ah_Mot_Binaire;
	
	-------------------------------------------------------------------------------
	-- Sous-Programme : Ah_Lire_Binaire
	-------------------------------------------------------------------------------
	function Ah_Lire_Binaire(A_Ah : IN A_Arbre_Huffman; Bi : IN T_Binaire) return A_Arbre_Huffman is
	begin
		if Bi_Creer_Un = Bi then
			return A_Ah.all.Fils_Gauche;
		else
			return A_Ah.all.Fils_Droit;
		end if;
		
	exception
		when CONSTRAINT_ERROR => raise ARBRE_VIDE;
	end Ah_Lire_Binaire;

	-------------------------------------------------------------------------------
	-- Sous-Programme : MaJ_nouvelle_feuille
	-------------------------------------------------------------------------------
	procedure Maj_Nouvelle_Feuille(A_Ah : IN OUT A_Arbre_Huffman; Valeur : IN character) is
	
		Ancienne_Feuille_Vide : A_Arbre_Huffman;
		A_Feuille_Vide : A_Arbre_Huffman;
		A_Feuille : A_Arbre_Huffman;
	begin
		-- Créer la nouvelle feuille
		A_Feuille := Ah_Creer_Feuille(Valeur);
		-- Créer la nouvelle feuille vide
		A_Feuille_Vide := Ah_Creer_Vide;
		-- Chercher l'actuelle feuille vide
		Ancienne_Feuille_Vide := Ah_Rechercher_Feuille(A_Ah, ASCII.NUL);
		-- La nouvelle feuille devient son fils gauche
		Ancienne_Feuille_Vide.all.Fils_Gauche := A_Feuille;
		-- La nouvelle feuille vide devient son fils droit
		Ancienne_Feuille_Vide.all.Fils_Droit := A_Feuille_Vide;
		-- Changer la valeur du Pere des deux nouvelles feuilles
		A_Feuille.all.Pere := Ancienne_Feuille_Vide;
		A_Feuille_Vide.all.Pere := Ancienne_Feuille_Vide;
		-- Mettre à jour les valeurs suivant et précédent des feuilles et du noeud
		A_Feuille.all.Precedent := Ancienne_Feuille_Vide;
		A_Feuille.all.Suivant := A_Feuille_Vide;
		Ancienne_Feuille_Vide.all.Suivant := A_Feuille;
		A_Feuille_Vide.all.Precedent := A_Feuille;
		
	exception
		when CONSTRAINT_ERROR => raise ARBRE_VIDE;
	end Maj_Nouvelle_Feuille;

	-------------------------------------------------------------------------------
	-- Sous-Programme : MaJ_Arbre
	-------------------------------------------------------------------------------
	procedure Maj_Arbre(A_Ah : IN OUT A_Arbre_Huffman; Valeur : IN character) is
		-----------------------------------------------------------------------
		-- Sous-Programme : Premier_Meme_Poid
		-- Sémantique : Retourne le premier noeud (Ordre Gallager) de même poid
		-----------------------------------------------------------------------
		function Premier_Meme_Poids(A_Ah : IN A_Arbre_Huffman) return A_Arbre_Huffman is
		begin
			if not Ah_Est_Racine(A_Ah) and then A_Ah.all.Precedent.all.Frequence = A_Ah.all.Frequence then
				return Premier_Meme_Poids(A_Ah.all.Precedent);
			else
				return A_Ah;
			end if;
		end Premier_Meme_Poids;
		
		A_Noeud : A_Arbre_Huffman;
		A_Premier : A_Arbre_Huffman;
		A_Copie : A_Arbre_Huffman;
		Copie_Valeur : Character;
	begin
		-- Initialiser le noeud courant avec la feuille de l'élément ajouté
		A_Noeud := Ah_Rechercher_Feuille(A_Ah, Valeur);
		-- Mettre à jour l'arbre jusqu'à ce que le noeud courant soit la racine
		loop
			-- Trouver le premier noeud de même poids que le noeud courant dans l'ordre de Gallager
			A_Premier := Premier_Meme_Poids(A_Noeud);
			-- Si le noeud trouvé n'est pas le père du noeud courant...
			if A_Noeud.all.Pere /= A_Premier then
				-- ...Echanger les deux noeuds
				Copie_Valeur := A_Noeud.all.Valeur;
				A_Noeud.all.Valeur := A_Premier.all.Valeur;
				A_Premier.all.Valeur := Copie_Valeur;
				
				--if not Ah_Est_Feuille(A_Noeud) and not Ah_Est_Feuille(A_Premier) then
				--	A_Copie := A_Noeud.all.Fils_Gauche.all.Precedent;
				--	A_Noeud.all.Fils_Gauche.all.Precedent := A_Premier.all.Fils_Gauche.all.Precedent;
				--	A_Premier.all.Fils_Gauche.all.Precedent := A_Copie;
				--	
				--	A_Copie := A_Noeud.all.Fils_Gauche.all.Suivant;
				--	A_Noeud.all.Fils_Gauche.all.Suivant := A_Premier.all.Fils_Gauche.all.Suivant;
				--	A_Premier.all.Fils_Gauche.all.Suivant := A_Copie;
				--end if;
					
								
				
				A_Copie := A_Noeud.all.Fils_Gauche;
				A_Noeud.all.Fils_Gauche := A_Premier.all.Fils_Gauche;
				A_Premier.all.Fils_Gauche := A_Copie;
				A_Copie := A_Noeud.all.Fils_Droit;
				A_Noeud.all.Fils_Droit := A_Premier.all.Fils_Droit;
				A_Premier.all.Fils_Droit := A_Copie;
				
				if not Ah_Est_Feuille(A_Noeud) then
					A_Noeud.all.Fils_Gauche.all.Pere := A_Noeud;
					A_Noeud.all.Fils_Droit.all.Pere := A_Noeud;
				end if;
				if not Ah_Est_Feuille(A_Premier) then
					A_Premier.all.Fils_Gauche.all.Pere := A_Premier;
					A_Premier.all.Fils_Droit.all.Pere := A_Premier;
				end if;
				
				-- C'est difficile à voir ça intuitivement mais il n'est en fait pas nécessaire d'échanger les suivants et précédents des fils
				A_Noeud := A_Premier;
			end if;
			-- Incrémenter le poids du noeud courant
			A_Noeud.all.Frequence := A_Noeud.all.Frequence + 1;
			-- Le noeud courant devient le père du noeud courant
			A_Noeud := A_Noeud.all.Pere;
			exit when Ah_Est_Racine(A_Noeud);
		end loop;
		-- Le noeud courant est la racine de l'arbre
		-- Incrémenter le poids de la racine de l'arbre
		A_Noeud.all.Frequence := A_Noeud.all.Frequence + 1;
		
	exception
		when CONSTRAINT_ERROR => raise ARBRE_VIDE;
	end Maj_Arbre;
	
end P_Arbre_Huffman;














