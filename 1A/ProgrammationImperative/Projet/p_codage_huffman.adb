with ada.text_io; use ada.text_io;
with ada.integer_text_io; use ada.integer_text_io;

package body P_Codage_Huffman is
	
	
	
	--==============================================================
	-- Déclaration des Procédures et Fonctions
	--==============================================================
	
	----------------------------------------------------------------
	-- Function : Caractere_En_ASCII
	----------------------------------------------------------------
	function Caractere_En_ASCII(Char : IN character; Taille_ASCII : IN integer) return T_Mot_Binaire is
		Mb : T_Mot_Binaire;
		Code_ASCII : integer;
	begin
		Mb := Mb_Creer_Vide;
		Code_ASCII := Character'Pos(Char);
		
		for k in 1..Taille_ASCII loop
			if (Code_ASCII mod 2) = 0 then
				Mb_Ajouter_Tete(Mb, Bi_Creer_Zero);
			else
				Mb_Ajouter_Tete(Mb, Bi_Creer_Un);
			end if;
			Code_ASCII := Code_ASCII / 2;
		end loop;
		-- On a ajouté les Taille_ASCII premiers bits du code ascii du caractere dans la valeur de retour
		
		return Mb;
	end Caractere_En_ASCII;
	
	----------------------------------------------------------------
	-- Function : ASCII_En_Caractere
	----------------------------------------------------------------
	function ASCII_En_Caractere(Mb : IN T_Mot_Binaire; Taille_ASCII : IN integer) return character is
		Mb_tmp : T_Mot_Binaire;
		Code_ASCII : integer;
	begin
		Mb_Tmp := Mb;
		Code_ASCII := 0;
		
		for k in 1..Taille_ASCII loop
			Code_ASCII := Code_ASCII * 2;
			if Bi_Creer_Un = Mb_Tete(Mb_Tmp) then
				Code_ASCII := Code_ASCII + 1;
			end if;
			Mb_Retirer_Tete(Mb_Tmp);
		end loop;
		-- On a lu l'ASCII en entier
		
		return Character'Val(Code_ASCII);
	end ASCII_En_Caractere;
	
	----------------------------------------------------------------
	-- Function : Ch_Coder
	----------------------------------------------------------------
	function Ch_Encoder(Ch : IN T_Chaine; Taille_ASCII : IN integer) return T_Mot_Binaire is
		Arbre_Huffman : A_Arbre_Huffman;
		Message_Code : T_Mot_Binaire;
		Caractere : character;
	begin
		-- Initialisation de l'arbre
		Arbre_Huffman := Ah_Creer_Vide;
		-- Initialisation du message codé
		Message_Code := Mb_Creer_Vide;
		
		-- Pour chaque caractère de la chaine faire...
		for k in 1..Ch_Taille(Ch) loop
			Caractere := Ch_Caractere(Ch, k);
			
			-- Si le caractère a déjà été placé dans l'arbre alors...
			if not Ah_Est_Null(Ah_Rechercher_Feuille(Arbre_Huffman, Caractere)) then
				-- Ajouter son code dans le message codé en construction
				Mb_Concatener_Queue(Message_Code, Ah_Mot_Binaire(Arbre_Huffman, Caractere));
				-- Mettre à jour l'arbre pour le caractère courant
				Maj_Arbre(Arbre_Huffman, Caractere);
				
			-- Sinon le caractère n'a pas déjà été placé dans l'arbre alors
			else
				-- Ajouter le code de l'élément vide dans le message codé en construction
				Mb_Concatener_Queue(Message_Code, Ah_Mot_Binaire(Arbre_Huffman, ASCII.NUL));
				-- Ajouter le code ASCII du caractère courant
				Mb_Concatener_Queue(Message_Code, Caractere_En_ASCII(Caractere, Taille_ASCII));
				-- Ajouter une feuille dans l'arbre pour le nouveau caractère
				Maj_Nouvelle_Feuille(Arbre_Huffman, Caractere);
				-- Mettre à jour l'arbre pour le caractère courant
				Maj_Arbre(Arbre_Huffman, Caractere);
			
			end if;
		end loop;
		-- Tous les caractères de la chaine d'entrée ont été traités
		
		return Message_Code;
	end Ch_Encoder;
	
	----------------------------------------------------------------
	-- Function : Ch_Decoder
	----------------------------------------------------------------
	function Ch_Decoder(Mb : IN T_Mot_Binaire; Taille_ASCII : IN integer) return T_Chaine is
		--------------------------------------------------------
		-- Function : Sous_Mot_Binaire
		-- Sémantique : Retourne le sous mot-binaire de celui fourni qui contient ses n premiers caractères.
		--------------------------------------------------------
		function Sous_Mot_Binaire(Mb : IN T_Mot_Binaire; n : IN integer) return T_Mot_Binaire is
			Mb_Tmp : T_Mot_Binaire;
			Mb_Retour : T_Mot_Binaire;
		begin
			Mb_Tmp := Mb;
			Mb_Retour := Mb_Creer_Vide;
			for k in 1..n loop
				Mb_Ajouter_Queue(Mb_Retour, Mb_Tete(Mb_Tmp));
				Mb_Retirer_Tete(Mb_Tmp);
			end loop;
			return Mb_Retour;
		end Sous_Mot_Binaire;
		
		Arbre_Huffman : A_Arbre_Huffman;-- L'arbre de huffman à l'état courant
		Noeud_Courant : A_Arbre_Huffman;-- Le noeud de l'arbre sur lequel on se trouve (en lisant les Uns et Zeros successifs)
		Message_Decode : T_Chaine;	-- Le message décodé actuel
		Caractere : character;		-- Le 'character' qu'on vient de réussir à lire
		Mb_Courant : T_Mot_Binaire;	-- Le mot binaire qu'il reste à décoder
	begin
		-- Faire une copie du code à décoder
		Mb_Courant := Mb;
		-- Initialisation de l'arbre
		Arbre_Huffman := Ah_Creer_Vide;
		-- Initialisation du message décodé
		Message_Decode := Ch_Creer_Vide;
		-- Initialisation du noeud courant
		Noeud_Courant := Arbre_Huffman;
		
		-- Si le code n'est pas vide lire le premier caractère qui est un ASCII
		if not Mb_Est_Vide(Mb_Courant) then
			-- Déterminer le caractère à partir de l'ascii lu
			Caractere := ASCII_En_Caractere(Sous_Mot_Binaire(Mb_Courant, Taille_ASCII), Taille_ASCII);
			-- Retirer du message restant à décoder les éléments lus
			Mb_Retirer_Plusieurs_Tete(Mb_Courant, Taille_ASCII);
			-- Ajouter le caractère dans le message décodé
			Ch_Ajouter_Queue(Message_Decode, Caractere);
			-- Ajouter une feuille dans l'arbre pour le nouveau caractère
			Maj_Nouvelle_Feuille(Arbre_Huffman, Caractere);
			-- Mettre à jour l'arbre
			Maj_Arbre(Arbre_Huffman, Caractere);
		end if;
		
		-- Tant qu'il reste des caractères dans le code à décoder, compléter le message décodé en les lisant
		while not Mb_Est_Vide(Mb_Courant) loop
			-- Se déplacer dans l'arbre en fonction du binaire en tête du code restant à décoder
			Noeud_Courant := Ah_Lire_Binaire(Noeud_Courant, Mb_Tete(Mb_Courant));
			
			-- Retirer le binaire lu du début du code restant à décoder
			Mb_Retirer_Tete(Mb_Courant);
			-- Si on est arrivé sur une feuille vide lire l'ascci et mettre à jour arbre et message décodé
			if Ah_Est_Vide(Noeud_Courant) then
				-- Déterminer le caractère à partir de l'ascii lu
				Caractere := ASCII_En_Caractere(Sous_Mot_Binaire(Mb_Courant, Taille_ASCII), Taille_ASCII);
				-- Retirer du message restant à décoder les éléments lus
				Mb_Retirer_Plusieurs_Tete(Mb_Courant, Taille_ASCII);
				-- Ajouter le caractère dans le message décodé
				Ch_Ajouter_Queue(Message_Decode, Caractere);
				-- Ajouter une feuille dans l'arbre pour le nouveau caractère
				Maj_Nouvelle_Feuille(Arbre_Huffman, Caractere);
				-- Mettre à jour l'arbre
				Maj_Arbre(Arbre_Huffman, Caractere);
				-- Remettre le noeud courant en haut de l'arbre
				Noeud_Courant := Arbre_Huffman;
			-- Sinon si on est sur une feuille récupérer le caractère lu et mettre à jour arbre et lessage décodé
			elsif Ah_Est_Feuille(Noeud_Courant) then
				Caractere := Ah_Valeur(Noeud_Courant);
				-- Ajouter le caractère dans le message décodé
				Ch_Ajouter_Queue(Message_Decode, Caractere);
				-- Mettre à jour l'arbre
				Maj_Arbre(Arbre_Huffman, Caractere);
				-- Remettre le noeud courant en haut de l'arbre
				Noeud_Courant := Arbre_Huffman;
			end if;
		end loop;
		-- Tous les binaires du message codé ont été lus
		
		return Message_Decode;
	exception
		when others => raise CODE_INVALIDE;
	end Ch_Decoder;
	
end P_Codage_Huffman;













