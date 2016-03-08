with Ada.Text_Io; use Ada.Text_Io;

package body P_Binaire is
	
	--==============================================================
	-- Déclaration des Procédures et Fonctions
	--==============================================================
	
	----------------------------------------------------------------
	-- Procedure : Put
	-- Sémantique : Affiche en console le binaire donné.
	----------------------------------------------------------------
	procedure Put(Bi : IN T_Binaire) is
	begin
		if Bi = Un then
			put("1");
		else
			put("0");
		end if;
	end Put;
	
	----------------------------------------------------------------
	-- Procedure : Bi_Creer_Zero
	-- Sémantique : Créer un binaire de valeur Zero.
	----------------------------------------------------------------
	function Bi_Creer_Zero return T_Binaire is
	begin
		return Zero;
	end Bi_Creer_Zero;
	
	----------------------------------------------------------------
	-- Procedure : Bi_Creer_Un
	-- Sémantique : Créer un binaire de valeur Un.
	----------------------------------------------------------------
	function Bi_Creer_Un return T_Binaire is
	begin
		return Un;
	end Bi_Creer_Un;
	
	----------------------------------------------------------------
	-- Procedure : Bi_Est_Un
	-- Sémantique : Détermine si un binaire vaut Un.
	----------------------------------------------------------------
	function Bi_Est_Un(Bi : IN T_Binaire) return boolean is
	begin
		return Bi = Un;
	end Bi_Est_Un;

end P_Binaire;
	
