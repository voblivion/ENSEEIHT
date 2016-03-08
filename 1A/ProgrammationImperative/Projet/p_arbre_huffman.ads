
generic
	type T_Binaire is private;
	with function Bi_Creer_Un return T_Binaire;
	with function Bi_Creer_Zero return T_Binaire;
	type T_Mot_Binaire is private;
	with function Mb_Creer_Vide return T_Mot_Binaire;
	with procedure Mb_Ajouter_Tete(Mb : IN OUT T_Mot_Binaire; Bi : IN T_Binaire);
	with function Mb_Tete(Mb : IN T_Mot_Binaire) return T_Binaire;

package P_Arbre_Huffman is

	ARBRE_VIDE : exception;
	
	--==============================================================
	-- Déclaration des Types privés mais visibles
	--==============================================================

	-- Déclaration du type principal du package
	type A_Arbre_Huffman is private;
	
	--==============================================================
	-- Déclaration des Procédures et Fonctions
	--==============================================================
	
	----------------------------------------------------------------
	-- Sous-Programme : Ah_Valeur
	-- Sémantique : Retourner la valeur rangée à la racine d'un arbre de Huffman.
	-- Parametres : A_Ah un pointeur vers un arbre de huffman.
	-- Retour : Le caractère correspondant stocké dans le noeud pointé.
	-- Préconditions : A_Ah n'est pas null.
	-- Postconditions : /
	----------------------------------------------------------------
	function Ah_Valeur(A_Ah : IN A_Arbre_Huffman) return character;

	----------------------------------------------------------------
	-- Sous-Programme : Ah_Frequence
	-- Sémantique : Retourner le poids rangé à la racine d'un arbre de Huffman.
	-- Parametres : A_Ah un pointeur vers un arbre de huffman.
	-- Retour : L'entier étant le poids stocké dans le noeud pointé.
	-- Préconditions : A_Ah n'est pas null.
	-- Postconditions : /
	----------------------------------------------------------------
	function Ah_Frequence(A_Ah : IN A_Arbre_Huffman) return integer;

	----------------------------------------------------------------
	-- Sous-Programme : Ah_Pere
	-- Sémantique : Retourner l'arbre de Huffman père d'un arbre de Huffman.
	-- Parametres : A_Ah un pointeur vers un arbre de huffman.
	-- Retour : Un pointeur vers l'arbre de huffman qui est le père du noeud pointé ou null si le noeud pointé est sans père.
	-- Préconditions : A_Ah n'est pas null.
	-- Postconditions : /
	----------------------------------------------------------------
	function Ah_Pere(A_Ah : IN A_Arbre_Huffman) return A_Arbre_Huffman;

	----------------------------------------------------------------
	-- Sous-Programme : Ah_Fils_Gauche
	-- Sémantique : Retourner le fils gauche d'un arbre de Huffman.
	-- Parametres : A_Ah un pointeur vers un arbre de huffman.
	-- Retour : Un pointeur vers l'arbre de huffman qui est le fils gauche du noeud pointé ou null si le noeud pointé est sans fils gauche.
	-- Préconditions : A_Ah n'est pas null.
	-- Postconditions : /
	----------------------------------------------------------------
	function Ah_Fils_Gauche(A_Ah : IN A_Arbre_Huffman) return A_Arbre_Huffman;

	----------------------------------------------------------------
	-- Sous-Programme : Ah_Fils_Droit
	-- Sémantique : Retourner le fils droit d'un arbre de Huffman.
	-- Parametres : A_Ah un pointeur vers un arbre de huffman.
	-- Retour : Un pointeur vers l'arbre de huffman qui est le fils droit du noeud pointé ou null si le noeud pointé est sans fils droit.
	-- Préconditions : A_Ah n'est pas null.
	-- Postconditions : /
	----------------------------------------------------------------
	function Ah_Fils_Droit(A_Ah : IN A_Arbre_Huffman) return A_Arbre_Huffman;

	----------------------------------------------------------------
	-- Sous-Programme : Ah_Precedent
	-- Sémantique : Retourner le précédent d'un arbre de Huffman dans l'ordre de Gallager.
	-- Parametres : A_Ah un pointeur vers un arbre de huffman.
	-- Retour : Un pointeur vers l'arbre de huffman qui est le précédent du noeud pointé ou null si le noeud pointé est sans précédent.
	-- Préconditions : A_Ah n'est pas null.
	-- Postconditions : /
	----------------------------------------------------------------
	function Ah_Precedent(A_Ah : IN A_Arbre_Huffman) return A_Arbre_Huffman;

	----------------------------------------------------------------
	-- Sous-Programme : Ah_Suivant
	-- Sémantique : Retourner le suivant d'un arbre de Huffman dans l'ordre de Gallager.
	-- Parametres : A_Ah un pointeur vers un arbre de huffman.
	-- Retour : Un pointeur vers l'arbre de huffman qui est le suivant du noeud pointé ou null si le noeud pointé est sans suivant.
	-- Préconditions : A_Ah n'est pas null.
	-- Postconditions : /
	----------------------------------------------------------------
	function Ah_Suivant(A_Ah : IN A_Arbre_Huffman) return A_Arbre_Huffman;

	----------------------------------------------------------------
	-- Sous-Programme : Ah_Creer_Vide
	-- Sémantique : Créer un arbre de Huffman vide : par définition c'est une feuille contenant le caractère -1 à la fréquence 0.
	-- Parametres : /
	-- Retour : Un pointeur vers une feuille vide.
	-- Préconditions : /
	-- Postconditions : /
	----------------------------------------------------------------
	function Ah_Creer_Vide return A_Arbre_Huffman;

	----------------------------------------------------------------
	-- Sous-Programme : Ah_Creer_Feuille
	-- Sémantique : Créer un arbre de Huffman avec une valeur mais sans fils, (ah cette virgule...) avec une fréquence à 0.
	-- Parametres : Valeur un caractère.
	-- Retour : Un pointeur vers une feuille contenant la valeur fournie.
	-- Préconditions : /
	-- Postconditions : /
	----------------------------------------------------------------
	function Ah_Creer_Feuille(Valeur : IN character) return A_Arbre_Huffman;

	----------------------------------------------------------------
	-- Sous-Programme : Ah_Null
	-- Sémantique : Détecter si un arbre de Huffman est null ou non.
	-- Parametres : A_Ah un pointeur vers un arbre de huffman (ou null).
	-- Retour : un booléan déterminant si le pointeur est null.
	-- Préconditions : /
	-- Postconditions : /
	----------------------------------------------------------------
	function Ah_Est_Null(A_Ah : IN A_Arbre_Huffman) return boolean;

	----------------------------------------------------------------
	-- Sous-Programme : Ah_Vide
	-- Sémantique : Détecter si un arbre de Huffman est vide ou non.
	-- Parametres : A_Ah un pointeur vers un arbre de huffman.
	-- Retour : un booléan déterminant si le noeud pointé est une feuille vide.
	-- Préconditions : A_Ah n'est pas null.
	-- Postconditions : /
	----------------------------------------------------------------
	function Ah_Est_Vide(A_Ah : IN A_Arbre_Huffman) return boolean;

	----------------------------------------------------------------
	-- Sous-Programme : Ah_Est_Feuille
	-- Sémantique : Indiquer si un arbre de Huffman est une feuille (pas de fils).
	-- Parametres : A_Ah un pointeur vers un arbre de huffman.
	-- Retour : un booléan déterminant si le noeud pointé est une feuille.
	-- Préconditions : A_Ah n'est pas null.
	-- Postconditions : /
	----------------------------------------------------------------
	function Ah_Est_Feuille(A_Ah : IN A_Arbre_Huffman) return boolean;

	----------------------------------------------------------------
	-- Sous-Programme : Ah_Est_Racine
	-- Sémantique : Indiquer si un arbre de Huffman est sans père.
	-- Parametres : A_Ah un pointeur vers un arbre de huffman.
	-- Retour : un booléan déterminant si le noeud pointé est racine.
	-- Préconditions : A_Ah n'est pas null.
	-- Postconditions : /
	----------------------------------------------------------------
	function Ah_Est_Racine(A_Ah : IN A_Arbre_Huffman) return boolean;

	----------------------------------------------------------------
	-- Sous-Programme : Ah_Est_FilsGauche
	-- Sémantique : Indiquer si un arbre de Huffman est un fils gauche.
	-- Parametres : A_Ah un pointeur vers un arbre de huffman.
	-- Retour : un booléan déterminant si le noeud pointé est un fils gauche.
	-- Préconditions : A_Ah n'est pas null.
	-- Postconditions : /
	----------------------------------------------------------------
	function Ah_Est_Fils_Gauche(A_Ah : IN A_Arbre_Huffman) return boolean;
	

	----------------------------------------------------------------
	-- Sous-Programme : Put
	-- Sémantique : Afficher le contenu complet d'un arbre de Huffman.
	-- Parametres : A_Ah un pointeur vers un arbre de huffman.
	-- Retour : un booléan déterminant si le noeud pointé est un fils droit.
	-- Préconditions : A_Ah n'est pas null.
	-- Postconditions : /
	----------------------------------------------------------------
	procedure Put(A_Ah : IN A_Arbre_Huffman);

	----------------------------------------------------------------
	-- Sous-Programme : Ah_Rechercher_Feuille
	-- Sémantique : Rechercher la feuille d'un arbre de Huffman contenant une valeur.
	-- Parametres : A_Ah un pointeur vers un arbre de huffman, Valeur la valeur à trouver.
	-- Retour : un booléan déterminant si le noeud pointé est une feuille.
	-- Préconditions : A_Ah n'est pas null.
	-- Postconditions : /
	----------------------------------------------------------------
	function Ah_Rechercher_Feuille(A_Ah : IN A_Arbre_Huffman; Valeur : IN character) return A_Arbre_Huffman;
	

	----------------------------------------------------------------
	-- Sous-Programme : Ah_Mot_Binaire
	-- Sémantique : Rechercher le code binaire d'une valeur dans un arbre de Huffman.
	-- Parametres : A_Ah un pointeur vers un arbre de huffman, Valeur le caractere dont on veut le code déterminé par l'arbre.
	-- Retour : Un code binaire étant celui de la valeur fournie selon l'arbre.
	-- Préconditions : A_Ah n'est pas null.
	-- Postconditions : /
	----------------------------------------------------------------
	function Ah_Mot_Binaire(A_Ah : IN A_Arbre_Huffman; Valeur : IN character) return T_Mot_Binaire;
	
	----------------------------------------------------------------
	-- Sous-Programme : Ah_Lire_Binaire
	-- Sémantique : Retourne le sous-arbre obtenu après lecture du binaire fourni.
	-- Parametres : A_Ah un pointeur vers un arbre de huffman et Bi un binaire.
	-- Retour : A_Ah un pointeur vers un arbre de Huffman qui est le fils de celui fourni après avoir lu le binaire fourni (fils gauche si Un, fils droit si Zero).
	-- Préconditions : A_Ah n'est pas null.
	-- Postconditions : Le pointeur retourné n'est pas nul si l'arbre fourni n'est pas une feuille.
	----------------------------------------------------------------
	function Ah_Lire_Binaire(A_Ah : IN A_Arbre_Huffman; Bi : IN T_Binaire) return A_Arbre_Huffman;

	----------------------------------------------------------------
	-- Sous-Programme : MaJ_nouvelle_feuille
	-- Sémantique : Remplacer l'actuelle feuille vide de l'arbre a par un noeud dont le fils gauche est une feuille comportant une valeur, et le fils droit est la feuille vide.
	-- Parametres : A_Ah un pointeur vers un arbre de huffman, Valeur un caractere que l'arbre ne contient pas encore et pour lequel il faut y créer une feuille.
	-- Préconditions : A_Ah n'est pas null et ne contient pas la feuille de valeur celle fournie.
	-- Postconditions : L'arbre fourni contient désormais la feuille de valeur celle fournie.
	----------------------------------------------------------------
	procedure Maj_Nouvelle_Feuille(A_Ah : IN OUT A_Arbre_Huffman; Valeur : IN character);

	----------------------------------------------------------------
	-- Sous-Programme : MaJ_Arbre
	-- Sémantique : Mettre à jour un arbre de Huffman en ajoutant une nouvelle occurence d'une valeur.
	-- Parametres : A_Ah un pointeur vers un arbre de huffman, Valeur le caractere dont le poids dans l'arbre est à augmenter.
	-- Préconditions : A_Ah n'est pas null et contient la feuille de valeur celle fournie.
	-- Postconditions : La feuille de valeur celle fournie a vu son poids augmenté de un.
	----------------------------------------------------------------
	procedure Maj_Arbre(A_Ah : IN OUT A_Arbre_Huffman; Valeur : IN character);
	


private
	type T_Arbre_Huffman;
	-- Pointeur : vers arbre de Huffman
	type A_Arbre_Huffman is access T_Arbre_Huffman;
	-- Enregistrement : les données du noeud d'un arbre de Huffman
	type T_Arbre_Huffman is record
		Valeur :	character;
		Frequence :	integer;
		Pere :		A_Arbre_Huffman;
		Fils_Gauche :	A_Arbre_Huffman;
		Fils_Droit :	A_Arbre_Huffman;
		Suivant :	A_Arbre_Huffman;
		Precedent :	A_Arbre_Huffman;
	end record;
end P_Arbre_Huffman;

















