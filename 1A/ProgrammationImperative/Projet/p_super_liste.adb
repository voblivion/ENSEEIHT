package body P_Super_Liste is
	
	--==============================================================
	-- Déclaration des corps des Procédures et Fonctions
	--==============================================================
	
	----------------------------------------------------------------
	-- Fonction : SL_Creer_Vide
	----------------------------------------------------------------
	function SL_Creer_Vide return T_Super_Liste is
	begin
		return (null, null);
	end SL_Creer_Vide;
	
	----------------------------------------------------------------
	-- Fonction : SL_Est_Vide
	----------------------------------------------------------------
	function SL_Est_Vide(SL : IN T_Super_Liste) return boolean is
	begin
		return SL.Premiere_Case = null;
	end SL_Est_Vide;
	
	----------------------------------------------------------------
	-- Fonction : SL_Tete
	----------------------------------------------------------------
	function SL_Tete(SL : IN T_Super_Liste) return T is
	begin
		return SL.Premiere_Case.all.Contenu;
		
	exception
		when CONSTRAINT_ERROR => raise LISTE_VIDE;
	end SL_Tete;
	
	----------------------------------------------------------------
	-- Fonction : SL_Queue
	----------------------------------------------------------------
	function SL_Queue(SL : IN T_Super_Liste) return T is
	begin
		return SL.Derniere_Case.all.Contenu;
		
	exception
		when CONSTRAINT_ERROR => raise LISTE_VIDE;
	end SL_Queue;
	
	----------------------------------------------------------------
	-- Procedure : SL_Ajouter_Tete
	----------------------------------------------------------------
	procedure SL_Ajouter_Tete(SL : IN OUT T_Super_Liste; E : IN T) is
	begin
		SL.Premiere_Case := new T_Case'(E, SL.Premiere_Case);
		if SL.Derniere_Case = null then
			SL.Derniere_Case := SL.Premiere_Case;
		end if;
	end SL_Ajouter_Tete;
	
	----------------------------------------------------------------
	-- Procedure : SL_Retirer_Tete
	----------------------------------------------------------------
	procedure SL_Retirer_Tete(SL : IN OUT T_Super_Liste) is
	begin
		SL.Premiere_Case := SL.Premiere_Case.all.Case_Suivante;
		if SL.Premiere_Case = null then
			SL.Derniere_Case := null;
		end if;
		
	exception
		when CONSTRAINT_ERROR => raise LISTE_VIDE;
	end SL_Retirer_Tete;
	
	----------------------------------------------------------------
	-- Procedure : SL_Retirer_Plusieurs_Tete
	----------------------------------------------------------------
	procedure SL_Retirer_Plusieurs_Tete(SL : IN OUT T_Super_Liste; N : IN integer) is
	begin
		for k in 1..N loop
			SL_Retirer_Tete(SL);
		end loop;
	end SL_Retirer_Plusieurs_Tete;
	
	----------------------------------------------------------------
	-- Procedure : SL_Ajouter_Queue
	----------------------------------------------------------------
	procedure SL_Ajouter_Queue(SL : IN OUT T_Super_Liste; E : IN T) is
	begin
		if SL.Premiere_Case = null then
			SL.Premiere_Case := new T_Case'(E,null);
			SL.Derniere_Case := SL.Premiere_Case;
		else
			SL.Derniere_Case.all.Case_Suivante := new T_Case'(E,null);
			SL.Derniere_Case := SL.Derniere_Case.all.Case_Suivante;
		end if;
	end SL_Ajouter_Queue;
	
	----------------------------------------------------------------
	-- Procedure : SL_Retirer_Queue
	----------------------------------------------------------------
	procedure SL_Retirer_Queue(SL : IN OUT T_Super_Liste) is
		Slt : T_Super_Liste;
	begin
		if SL.Premiere_Case = SL.Derniere_Case then
			SL := (null, null);
		else
			SLt := (SL.Premiere_Case.all.Case_Suivante, SL.Derniere_Case);
			SL_Retirer_Queue(Slt);
		end if;
		
	exception
		when CONSTRAINT_ERROR => raise LISTE_VIDE;
	end SL_Retirer_Queue;
	
	----------------------------------------------------------------
	-- Procedure : SL_Retirer_Plusieurs_Queue
	----------------------------------------------------------------
	procedure SL_Retirer_Plusieurs_Queue(SL : IN OUT T_Super_Liste; N : IN integer) is
	begin
		for k in 1..N loop
			SL_Retirer_Queue(SL);
		end loop;
	end SL_Retirer_Plusieurs_Queue;
	
	----------------------------------------------------------------
	-- Procedure : SL_Concatener_Tete
	----------------------------------------------------------------
	procedure SL_Concatener_Tete(SL : IN OUT T_Super_Liste; SLb : IN T_Super_Liste) is
	begin
		if SL.Premiere_Case = null then
			SL.Premiere_Case := SLb.Premiere_Case;
			SL.Derniere_Case := SLb.Derniere_Case;
		elsif SLb.Premiere_Case /= null then
			SLb.Derniere_Case.all.Case_Suivante := SL.Premiere_Case;
			SL.Premiere_Case := SLb.Premiere_Case;
		end if;
	end SL_Concatener_Tete;
	
	----------------------------------------------------------------
	-- Procedure : SL_Concatener_Queue
	----------------------------------------------------------------
	procedure SL_Concatener_Queue(SL : IN OUT T_Super_Liste; SLb : IN T_Super_Liste) is
	begin
		if SL.Premiere_Case = null then
			SL.Premiere_Case := SLb.Premiere_Case;
			SL.Derniere_Case := SLb.Derniere_Case;
		else
			SL.Derniere_Case.all.Case_Suivante := SLb.Premiere_Case;
			SL.Derniere_Case := SLb.Derniere_Case;
		end if;
	end SL_Concatener_Queue;
	
	----------------------------------------------------------------
	-- Procedure : put
	----------------------------------------------------------------
	procedure Put(SL : IN T_Super_Liste) is
		Slt : T_Super_Liste;
	begin
		if SL.Premiere_Case /= null then
			Put(SL.Premiere_Case.all.Contenu);
			if SL.Premiere_Case /= SL.Derniere_Case then
				SLt := (SL.Premiere_Case.all.Case_Suivante, SL.Derniere_Case);
				Put(SLt);
			end if;
		end if;
	end Put;
	
	----------------------------------------------------------------
	-- Procedure : SL_Taille
	----------------------------------------------------------------
	function SL_Taille(SL : IN T_Super_Liste) return integer is
		--------------------------------------------------------
		-- Function : Taille
		--------------------------------------------------------
		function Taille(A_Ca : IN A_Case; n : IN integer) return integer is
		begin
			if A_Ca = null then
				return n;
			else
				return Taille(A_Ca.all.Case_Suivante, n+1);
			end if;
		end Taille;
	begin
		return Taille(SL.Premiere_Case, 0);
	end SL_Taille;
	
end P_Super_Liste;














