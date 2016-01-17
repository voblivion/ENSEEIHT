with Ada.Text_Io; use Ada.Text_Io;

package body P_Chaine is

	--==============================================================
	-- Déclaration des corps des Procédures et Fonctions
	--==============================================================
	
	----------------------------------------------------------------
	-- Procedure : Get
	----------------------------------------------------------------
	procedure Get(Ch : IN OUT T_Chaine) is
	begin
		get_line(Ch.Chaine, Ch.Taille);
	end Get;
	
	----------------------------------------------------------------
	-- Procedure : Put
	----------------------------------------------------------------
	procedure Put(Ch : IN T_Chaine) is
	begin
		put(Ch.Chaine(1..Ch.Taille));
	end Put;
	
	----------------------------------------------------------------
	-- Function : Ch_Creer_Vide
	----------------------------------------------------------------
	function Ch_Creer_Vide return T_Chaine is
		Ch : T_Chaine;
	begin
		Ch.Taille := 0;
		return Ch;
	end Ch_Creer_Vide;
	
	----------------------------------------------------------------
	-- Function : Ch_Creer
	----------------------------------------------------------------
	function Ch_Creer(Str : IN string; n : IN integer) return T_Chaine is
		Ch : T_Chaine;
	begin
		Ch.Chaine(1..n) := Str(Str'First..n);
		Ch.Taille := n;
		return Ch;
	end Ch_Creer;
	
	----------------------------------------------------------------
	-- Procedure : Ch_Ajouter_Queue
	----------------------------------------------------------------
	procedure Ch_Ajouter_Queue(Ch : IN OUT T_Chaine; Char : IN character) is
	begin
		Ch.Taille := Ch.Taille+1;
		Ch.Chaine(Ch.Taille) := Char;
	end Ch_Ajouter_Queue;
	
	----------------------------------------------------------------
	-- Function : Ch_Caractere
	----------------------------------------------------------------
	function Ch_Caractere(Ch : IN T_Chaine; k : IN integer) return character is
	begin
		return Ch.Chaine(k);
	end Ch_Caractere;
	
	----------------------------------------------------------------
	-- Function : Ch_Taille
	----------------------------------------------------------------
	function Ch_Taille(Ch : IN T_Chaine) return integer is
	begin
		return Ch.Taille;
	end Ch_Taille;
	
end P_Chaine;
