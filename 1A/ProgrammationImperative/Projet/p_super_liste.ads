
generic
	type T is private;
	with procedure Put(E : IN T);
	
package P_Super_Liste is
	
	LISTE_VIDE : exception;
	
	--==============================================================
	-- Déclaration des Types privés mais visibles
	--==============================================================
	
	-- Déclaration du type principal du package
	type T_Super_Liste is private;
	
	--==============================================================
	-- Déclaration des Procédures et Fonctions
	--==============================================================
	
	----------------------------------------------------------------
	-- Fonction : SL_Creer_Vide
	-- Paramètres : Aucun
	-- Retour : T_Super_Liste vide
	----------------------------------------------------------------
	function SL_Creer_Vide return T_Super_Liste;
	
	----------------------------------------------------------------
	-- Fonction : SL_Est_Vide
	-- Paramètres : SL la T_Super_Liste pour laquelle on doit déterminer la vacuité.
	-- Retour : Boolean
	----------------------------------------------------------------
	function SL_Est_Vide(SL : IN T_Super_Liste) return boolean;
	
	----------------------------------------------------------------
	-- Fonction : SL_Plusieurs_Tete
	-- Paramètres : SL la T_Super_Liste dont on doit retourner la tête.
	-- Retour : T
	----------------------------------------------------------------
	function SL_Tete(SL : IN T_Super_Liste) return T;
	
	----------------------------------------------------------------
	-- Fonction : SL_Queue
	-- Paramètres : SL la T_Super_Liste dont on doit retourner la queue.
	-- Retour : T
	----------------------------------------------------------------
	function SL_Queue(SL : IN T_Super_Liste) return T;
	
	----------------------------------------------------------------
	-- Procedure : SL_Ajouter_Tete
	-- Paramètres : SL la T_Super_Liste sur laquelle ajouter en tête E l'élément de type T.
	-- Retour : Aucun
	----------------------------------------------------------------
	procedure SL_Ajouter_Tete(SL : IN OUT T_Super_Liste; E : IN T);
	
	----------------------------------------------------------------
	-- Procedure : SL_Retirer_Tete
	-- Paramètres : SL la T_Super_Liste à laquelle retirer la tête
	-- Retour : 
	----------------------------------------------------------------
	procedure SL_Retirer_Tete(SL : IN OUT T_Super_Liste);
	
	----------------------------------------------------------------
	-- Procedure : SL_Retirer_Plusieurs_Tete
	-- Paramètres : SL la T_Super_Liste à laquelle retirer N éléments en tête.
	-- Retour : Aucun
	----------------------------------------------------------------
	procedure SL_Retirer_Plusieurs_Tete(SL : IN OUT T_Super_Liste; N : IN integer);
	
	----------------------------------------------------------------
	-- Procedure : SL_Ajouter_Queue
	-- Paramètres : SL la T_Super_Liste sur laquelle ajouter en queue E l'élément de type T.
	-- Retour : Aucun
	----------------------------------------------------------------
	procedure SL_Ajouter_Queue(SL : IN OUT T_Super_Liste; E : IN T);
	
	----------------------------------------------------------------
	-- Procedure : SL_Retirer_Queue
	-- Paramètres : SL la T_Super_Liste à laquelle retirer la Queue
	-- Retour : Aucun
	----------------------------------------------------------------
	procedure SL_Retirer_Queue(SL : IN OUT T_Super_Liste);
	
	----------------------------------------------------------------
	-- Procedure : SL_Retirer_Plusieurs_Queue
	-- Paramètres : SL la T_Super_Liste à laquelle retirer N éléments en queue.
	-- Retour : Aucun
	----------------------------------------------------------------
	procedure SL_Retirer_Plusieurs_Queue(SL : IN OUT T_Super_Liste; N : IN integer);
	
	----------------------------------------------------------------
	-- Procedure : SL_Concatener_Tete
	-- Paramètres : SL la T_Super_Liste à laquelle concatener en tête l'autre T_Super_Liste SLb.
	-- Retour : Aucun
	----------------------------------------------------------------
	procedure SL_Concatener_Tete(SL : IN OUT T_Super_Liste; SLb : IN T_Super_Liste);
	
	----------------------------------------------------------------
	-- Procedure : SL_Concatener_Queue
	-- Paramètres : SL la T_Super_Liste à laquelle concatener en queue l'autre T_Super_Liste SLb.
	-- Retour : Aucun
	----------------------------------------------------------------
	procedure SL_Concatener_Queue(SL : IN OUT T_Super_Liste; SLb : IN T_Super_Liste);
	
	----------------------------------------------------------------
	-- Procedure : put
	-- Paramètres : Affiche la T_Super_Liste SL fournie.
	-- Retour : Aucun
	----------------------------------------------------------------
	procedure Put(SL : IN T_Super_Liste);
	
	----------------------------------------------------------------
	-- Procedure : SL_Taille
	-- Paramètres : SL une T_Super_Liste dont on veut connaître la taille.
	-- Retour : Integer
	----------------------------------------------------------------
	function SL_Taille(SL : IN T_Super_Liste) return integer;
	
	--==============================================================
	-- Vraie déclaration des Types privés mais visibles
	--==============================================================
	
private
	type T_Case;
	-- Pointeur vers une case de liste
	type A_Case is access T_Case;
	-- Case d'une liste
	type T_Case is record
		Contenu : T;
		Case_Suivante : A_Case;
	end record;
	-- Le type conteneur principal
	type T_Super_Liste is record
		Premiere_Case : A_Case;
		Derniere_Case : A_Case;
	end record;
	
end P_Super_Liste;
