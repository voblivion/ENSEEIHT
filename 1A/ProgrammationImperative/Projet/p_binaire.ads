
package P_Binaire is
	
	--==============================================================
	-- Déclaration des Types privés mais visibles
	--==============================================================

	-- Déclaration du type principal du package
	type T_Binaire is private;
	
	--==============================================================
	-- Déclaration des Procédures et Fonctions
	--==============================================================
	
	----------------------------------------------------------------
	-- Procedure : Put
	-- Sémantique : Affiche en console le binaire donné.
	----------------------------------------------------------------
	procedure Put(Bi : IN T_Binaire);
	
	----------------------------------------------------------------
	-- Procedure : Bi_Creer_Zero
	-- Sémantique : Créer un binaire de valeur Zero.
	----------------------------------------------------------------
	function Bi_Creer_Zero return T_Binaire;
	
	----------------------------------------------------------------
	-- Procedure : Bi_Creer_Un
	-- Sémantique : Créer un binaire de valeur Un.
	----------------------------------------------------------------
	function Bi_Creer_Un return T_Binaire;
	
	----------------------------------------------------------------
	-- Procedure : Bi_Est_Un
	-- Sémantique : Détermine si un binaire vaut Un.
	----------------------------------------------------------------
	function Bi_Est_Un(Bi : IN T_Binaire) return boolean;

private
	type T_Binaire is (Zero, Un);

end P_Binaire;
	
