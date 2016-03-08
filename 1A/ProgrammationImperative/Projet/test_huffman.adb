with ada.text_io; use ada.text_io;
with ada.integer_text_io; use ada.integer_text_io;

-- package pour la gestion simplifiée des chaînes de caractères
with P_Chaine; use P_Chaine;
-- package pour le codeur/décodeur de huffman
with P_Codage_Huffman;
-- package pour les binaires
with P_Binaire; use P_Binaire;
-- package pour les listes d'éléments
with P_Super_Liste;


procedure Test_Huffman is
	
	Taille_ASCII : constant integer := 8;
	
	package P_Mot_Binaire is new P_Super_Liste(T_Binaire, P_Binaire.Put);
	use P_Mot_Binaire;
	package P_Codage_Huffman_Inst is new P_Codage_Huffman(T_Binaire, Bi_Creer_Un, Bi_Creer_Zero, T_Super_Liste, SL_Creer_Vide, SL_Ajouter_Tete, SL_Tete, SL_Concatener_Queue, SL_Retirer_Tete, SL_Ajouter_Queue, SL_Est_Vide, SL_Retirer_Plusieurs_Tete);
	use P_Codage_Huffman_Inst;
	
	----------------------------------------------------------------
	-- Procédure : Afficher_Message_ASCII
	-- Sémantique : Affiche la version ascii (non encodée) d'une T_Chaine.
	----------------------------------------------------------------
	procedure Afficher_Message_ASCII(Ch : IN T_Chaine) is
	begin
		for k in 1..Ch_Taille(Ch) loop
			put(Caractere_En_ASCII(Ch_Caractere(Ch, k), Taille_ASCII));
		end loop;
	end Afficher_Message_ASCII;
	
	----------------------------------------------------------------
	-- Procédure : Chaine_En_ASCII
	-- Sémantique : Transforme la T_Chaine fournie en sa représentation ASCII.
	----------------------------------------------------------------
	function Chaine_En_ASCII(Ch : IN T_Chaine) return T_Super_Liste is
		Mb : T_Super_Liste;
	begin
		Mb := SL_Creer_Vide;
		for k in 1..Ch_Taille(Ch) loop
			if Ch_Caractere(Ch, k) = '0' then
				SL_Ajouter_Queue(Mb, Bi_Creer_Zero);
			else
				SL_Ajouter_Queue(Mb, Bi_Creer_Un);
			end if;
		end loop;
		return Mb;
	end Chaine_En_ASCII;
	
	
	
	Message : T_Chaine;
	Message_Code : T_Super_Liste;
	Message_Decode : T_Chaine;
	Choix : T_Chaine;
	Quitter : boolean;
begin
	----------------------------------------------------------------
	-- LANCEMENT DU PROGRAMME DE TEST 
	----------------------------------------------------------------
	put_line("  ______________________________ ");
	put_line(" |                              |");
	put_line(" | TESTER L'ENCODAGE DE HUFFMAN |");
	put_line(" |______________________________|");
	NEW_LINE;
	
	Quitter := false;
	loop
		--------------------------------------------------------
		-- CHOIX DE L'UTILISATEUR
		--------------------------------------------------------
		put_line("   Les actions possibles sont :");
		put_line("   - (e)ncoder une phrase de caractères");
		put_line("   - (d)écoder une phrase binaire");
		put_line("   - (t)ester encodage et décodage");
		put_line("   - (u)tiliser une phrase prédéfinie");
		put_line("   - (q)uitter");
		put("   Que souhaitez-vous faire ? ");get(Choix);
		put_line("================================================================================");
		
		case Ch_Caractere(Choix, 1) is
			when 'e' =>
				----------------------------------------
				-- Tester l'encodage
				----------------------------------------
				put_line("  ______________________________ ");
				put_line(" |                              |");
				put_line(" |      Encoder une phrase      |");
				put_line(" |______________________________|");
				NEW_LINE;
				put("   Entrez une phrase à encoder : "); get(Message);
				NEW_LINE;
				put("   - La phrase que vous avez entré utilise"); put(Integer'Image(Ch_Taille(Message)*Taille_ASCII)); put_line(" bits en mémoire.");
				NEW_LINE;
				put("   - Sa version binaire non encodée est : "); Afficher_Message_ASCII(Message); NEW_LINE;
				NEW_LINE;
				Message_Code := Ch_Encoder(Message, Taille_ASCII);
				put("   - Sa version binaire encodée est : "); put(Message_Code); put("."); NEW_LINE;
				NEW_LINE;
				put("   - Sa version encodée utilise"); put(Integer'Image(SL_Taille(Message_Code))); put_line(" bits en mémoire.");
				NEW_LINE;
				put("   - Le taux de volume compressé est de "); put(Integer'Image(100-(SL_Taille(Message_Code)*100)/(Ch_Taille(Message)*Taille_ASCII))); put_line("%.");
				NEW_LINE;
				put_line("================================================================================");NEW_LINE;
			when 'd' =>
				----------------------------------------
				-- Tester le décodage
				----------------------------------------
				put_line("  ______________________________ ");
				put_line(" |                              |");
				put_line(" |      Décoder une phrase      |");
				put_line(" |______________________________|");
				NEW_LINE;
				put("   Entrez une phrase binaire à décoder : "); get(Message);
				NEW_LINE;
				put("   - La phrase binaire que vous avez entré utilise"); put(Integer'Image(Ch_Taille(Message))); put_line(" bits en mémoire.");
				NEW_LINE;
				begin
					Message_Code := Chaine_En_ASCII(Message);
					Message_Decode := Ch_Decoder(Message_Code, Taille_ASCII);
					put("   - Sa version décodée est : "); put(Message_Decode); NEW_LINE;
					NEW_LINE;
					put("   - Sa version binaire non encodée est : "); Afficher_Message_ASCII(Message_Decode); NEW_LINE;
					NEW_LINE;
					put("   - Sa version décodée utilise"); put(Integer'Image(Ch_Taille(Message_Decode)*Taille_ASCII)); put_line(" bits en mémoire.");
					NEW_LINE;
					put("   - Le taux de volume compressé était de "); put(Integer'Image(100-(Ch_Taille(Message)*100)/(Ch_Taille(Message_Decode)*Taille_ASCII))); put_line("%.");
				exception
					when CODE_INVALIDE => put_line("   La phrase que vous avez entré ne correspond pas à une phrase encodée avec l'algorithme de Huffman 'feuille vide à droite'.");
				end;
				NEW_LINE;
				put_line("================================================================================");NEW_LINE;
			when 't' =>
				----------------------------------------
				-- Tester l'encodage et du décodage
				----------------------------------------
				put_line("  ______________________________ ");
				put_line(" |                              |");
				put_line(" |  Encoder/Décoder une phrase  |");
				put_line(" |______________________________|");
				NEW_LINE;
				put("   Entrez une phrase à encoder : "); get(Message);
				NEW_LINE;
				put("   - La phrase que vous avez entré utilise"); put(Integer'Image(Ch_Taille(Message)*Taille_ASCII)); put_line(" bits en mémoire.");
				NEW_LINE;
				put("   - Sa version binaire non encodée est : "); Afficher_Message_ASCII(Message); NEW_LINE;
				NEW_LINE;
				Message_Code := Ch_Encoder(Message, Taille_ASCII);
				put("   - Sa version binaire encodée est : "); put(Message_Code); put("."); NEW_LINE;
				NEW_LINE;
				put("   - Sa version encodée utilise"); put(Integer'Image(SL_Taille(Message_Code))); put_line(" bits en mémoire.");
				NEW_LINE;
				put("   - Le taux de volume compressé est de "); put(Integer'Image(100-(SL_Taille(Message_Code)*100)/(Ch_Taille(Message)*Taille_ASCII))); put_line("%.");
				NEW_LINE;
				Message_Decode := Ch_Decoder(Message_Code, Taille_ASCII);
				put("   - La version redécodée de votre phrase est : "); put(Message_Decode); NEW_LINE;
				NEW_LINE;
				put_line("================================================================================");NEW_LINE;
			when 'u' =>
				----------------------------------------
				-- Tester l'encodage et du décodage
				----------------------------------------
				put_line("  ______________________________ ");
				put_line(" |                              |");
				put_line(" |  Utiliser message prédéfini  |");
				put_line(" |______________________________|");
				NEW_LINE;
				Message := Ch_Creer("Anton Voyl n'arrivait pas à dormir. Il alluma. Son Jaz marquait minuit vingt. Il poussa un profond soupir, s'assit dans son lit, s'appuyant sur son polochon.", 157);
				put("   L'algorithme de Huffman sera utilisé sur le paragraphe suivant : "); put(Message); NEW_LINE;
				NEW_LINE;
				put("   - Cette phrase utilise"); put(Integer'Image(Ch_Taille(Message)*Taille_ASCII)); put_line(" bits en mémoire.");
				NEW_LINE;
				put("   - Sa version binaire non encodée est : "); Afficher_Message_ASCII(Message); NEW_LINE;
				NEW_LINE;
				Message_Code := Ch_Encoder(Message, Taille_ASCII);
				put("   - Sa version binaire encodée est : "); put(Message_Code); put("."); NEW_LINE;
				NEW_LINE;
				put("   - Sa version encodée utilise"); put(Integer'Image(SL_Taille(Message_Code))); put_line(" bits en mémoire.");
				NEW_LINE;
				put("   - Le taux de volume compressé est de "); put(Integer'Image(100-(SL_Taille(Message_Code)*100)/(Ch_Taille(Message)*Taille_ASCII))); put_line("%.");
				NEW_LINE;
				Message_Decode := Ch_Decoder(Message_Code, Taille_ASCII);
				put("   - La version redécodée la phrase utilisée est : "); put(Message_Decode); NEW_LINE;
				NEW_LINE;
				put_line("================================================================================");NEW_LINE;
			when 'q' =>
				----------------------------------------
				-- Quitter
				----------------------------------------
				NEW_LINE;
				put_line("   Il est temps de s'arrêter.");
				NEW_LINE;
				Quitter := true;
			when others =>
				----------------------------------------
				-- Choix non reconnu
				----------------------------------------
				NEW_LINE;
				put_line("   Le choix que vous avez effectué n'est pas reconnu. Recommencez.");
				NEW_LINE;
				put_line("================================================================================");NEW_LINE;
		end case;
		exit when Quitter;
	end loop;
end Test_Huffman;
