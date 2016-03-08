
package P_Chaine is

	Taille_Max : constant integer := 10000;
	
	--==============================================================
	-- Déclaration des Types privés mais visibles
	--==============================================================

	-- Déclaration du type principal du package
	type T_Chaine is private;
	
	--==============================================================
	-- Déclaration des Procédures et Fonctions
	--==============================================================
	
	----------------------------------------------------------------
	-- Procedure : Get
	-- Sémantique : lire dans la T_Chaine la 'string' rentrée en console (= get_line).
	----------------------------------------------------------------
	procedure Get(Ch : IN OUT T_Chaine);
	
	----------------------------------------------------------------
	-- Procedure : Put
	-- Sémantique : Affiche en console la T_Chaine donnée.
	----------------------------------------------------------------
	procedure Put(Ch : IN T_Chaine);
	
	----------------------------------------------------------------
	-- Function : Ch_Creer_Vide
	-- Sémantique : Crée un T_Chaine vide.
	----------------------------------------------------------------
	function Ch_Creer_Vide return T_Chaine;
	
	----------------------------------------------------------------
	-- Function : Ch_Creer
	----------------------------------------------------------------
	function Ch_Creer(Str : IN string; n : IN integer) return T_Chaine;
	
	----------------------------------------------------------------
	-- Procedure : Ch_Ajouter_Queue
	-- Sémantique : Ajouter Char à la fin de Ch.
	----------------------------------------------------------------
	procedure Ch_Ajouter_Queue(Ch : IN OUT T_Chaine; Char : IN character);
	
	----------------------------------------------------------------
	-- Function : Ch_Caractere
	-- Sémantique : retourne le k-ième 'charactère' de la T_Chaine donnée.
	----------------------------------------------------------------
	function Ch_Caractere(Ch : IN T_Chaine; k : IN integer) return character;
	
	----------------------------------------------------------------
	-- Function : Ch_Taille
	-- Sémantique : retourne la taille de la T_Chaine donnée
	----------------------------------------------------------------
	function Ch_Taille(Ch : IN T_Chaine) return integer;
	
private
	-- Le type T_Chaine
	type T_Chaine is record
		Chaine : string(1..Taille_Max);
		Taille : integer;
	end record;
end P_Chaine;
