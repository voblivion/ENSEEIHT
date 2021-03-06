with P_Chaine; use P_Chaine;
with P_Arbre_Huffman;

generic
	type T_Binaire is private;
	with function Bi_Creer_Un return T_Binaire;
	with function Bi_Creer_Zero return T_Binaire;
	type T_Mot_Binaire is private;
	with function Mb_Creer_Vide return T_Mot_Binaire;
	with procedure Mb_Ajouter_Tete(Mb : IN OUT T_Mot_Binaire; Bi : IN T_Binaire);
	with function Mb_Tete(Mb : IN T_Mot_Binaire) return T_Binaire;
	with procedure Mb_Concatener_Queue(Mb : IN OUT T_Mot_Binaire; Mbb : IN T_Mot_Binaire);
	with procedure Mb_Retirer_Tete(Mb : IN OUT T_Mot_Binaire);
	with procedure Mb_Ajouter_Queue(Mb : IN OUT T_Mot_Binaire; Bi : IN T_Binaire);
	with function Mb_Est_Vide(Mb : IN T_Mot_Binaire) return boolean;
	with procedure Mb_Retirer_Plusieurs_Tete(Mb : IN OUT T_Mot_Binaire; n : IN integer);

package P_Codage_Huffman is
	
	package P_Arbre_Huffman_Inst is new P_Arbre_Huffman(T_Binaire, Bi_Creer_Un, Bi_Creer_Zero, T_Mot_Binaire, Mb_Creer_Vide, Mb_Ajouter_Tete, Mb_Tete);
	use P_Arbre_Huffman_Inst;
	
	CODE_INVALIDE : exception;
	
	--==============================================================
	-- Déclaration des Procédures et Fonctions
	--==============================================================
	
	----------------------------------------------------------------
	-- Function : Caractere_En_ASCII
	-- Sémantique : Transforme un caracteres en un mot binaire représentant son code ASCII.
	----------------------------------------------------------------
	function Caractere_En_ASCII(Char : IN character; Taille_ASCII : IN integer) return T_Mot_Binaire;
	
	----------------------------------------------------------------
	-- Function : ASCII_En_Caractere
	-- Sémantique : Transforme un ASCII (Super_Liste) en 'character'.
	----------------------------------------------------------------
	function ASCII_En_Caractere(Mb : IN T_Mot_Binaire; Taille_ASCII : IN integer) return character;
	
	----------------------------------------------------------------
	-- Function : Ch_Coder
	-- Sémantique : Retourne le mot binaire représentant le codage de huffman de la chaine fournie, avec Taille_ASCII pour taille des ASCII.
	----------------------------------------------------------------
	function Ch_Encoder(Ch : IN T_Chaine; Taille_ASCII : IN integer) return T_Mot_Binaire;
	
	----------------------------------------------------------------
	-- Function : Ch_Decoder
	-- Sémantique : Retourne la chaine représentée par le mot binaire fourni (Huffman), avec Taille_ASCII pour taille des ASCII.
	----------------------------------------------------------------
	function Ch_Decoder(Mb : IN T_Mot_Binaire; Taille_ASCII : IN integer) return T_Chaine;
	
end P_Codage_Huffman;
