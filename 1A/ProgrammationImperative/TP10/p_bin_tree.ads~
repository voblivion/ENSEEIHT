

generic
	type T is private;

package p_bin_tree is
	-- TYPES --
	type a_bin_tree is private;

	------------------------------------------------------------------------------------------
	-- FONCTION - BT_MAKE_NODE								--
	-- Crée un nouveau noeud avec les paramètres						--
	-- Parametre : left et right sont des a_bin_tree, value est un T			--
	-- Retour : un a_bin_tree								--
	-- Postcondition : la valeur retournée est le noeud de valeur value et de fils left et	--
	-- 	right.										--
	------------------------------------------------------------------------------------------
	function bt_make_node(left : IN a_bin_tree; value : IN T; right : IN a_bin_tree) return a_bin_tree;
	
	------------------------------------------------------------------------------------------
	-- FONCTION - BT_MAKE_LEAF								--
	-- Crée une nouvelle feuille avec lesparamètres						--
	-- Parametre : value est un T								--
	-- Retour : un a_bin_tree								--
	-- Postcondition : la valeur retournée est la feuille de valeur value.			--
	------------------------------------------------------------------------------------------
	function bt_make_leaf(value : IN T) return a_bin_tree;
	
	------------------------------------------------------------------------------------------
	-- FONCTION - BT_MAKE_EMPTY								--
	-- Crée un arbre binaire vide								--
	-- Parametre : aucun								--
	-- Retour : un a_bin_tree								--
	-- Postcondition : la valeur retournée est le pointeur null.				--
	------------------------------------------------------------------------------------------
	function bt_make_empty return a_bin_tree;
	
	--======================================================================================--
	-- 				    ACCESSEURS			 		  	--
	--======================================================================================--
	
	------------------------------------------------------------------------------------------
	-- FONCTION - BT_LEFT									--
	-- Retourne le fils gauche d'un arbre binaire						--
	-- Parametre : bin_tree est un a_bin_tree						--
	-- Retour : un a_bin_tree								--
	-- Postcondition : la valeur retournée est le fils gauche de l'abre donné.		--
	------------------------------------------------------------------------------------------
	function bt_left(bin_tree : IN a_bin_tree) return a_bin_tree;
	------------------------------------------------------------------------------------------
	-- FONCTION - BT_RIGHT									--
	-- Retourne le fils droit d'un arbre binaire						--
	-- Parametre : bin_tree est un a_bin_tree						--
	-- Retour : un a_bin_tree								--
	-- Postcondition : la valeur retournée est le fils droit de l'abre donné.		--
	------------------------------------------------------------------------------------------
	function bt_right(bin_tree : IN a_bin_tree) return a_bin_tree;
	
	------------------------------------------------------------------------------------------
	-- FONCTION - BT_LEFT									--
	-- Retourne la valeur de la racine de l'arbre binaire donné				--
	-- Parametre : bin_tree est un a_bin_tree						--
	-- Retour : un a_bin_tree								--
	-- Postcondition : la valeur retournée est celle de la racine de l'arbre binaire donné.	--
	------------------------------------------------------------------------------------------
	function bt_value(bin_tree : IN a_bin_tree) return T;
	
	--======================================================================================--
	-- 				    SCANNERS			 		  	--
	--======================================================================================--
	
	------------------------------------------------------------------------------------------
	-- FONCTION - BT_IS_LEAF								--
	-- Retourne la valeur de la racine de l'arbre binaire donné				--
	-- Parametre : bin_tree est un a_bin_tree						--
	-- Retour : un boolean									--
	-- Postcondition : true si l'arbre donné à deux fils null, false sinon.			--
	------------------------------------------------------------------------------------------
	function bt_is_leaf(bin_tree : IN a_bin_tree) return boolean;
	
	--======================================================================================--
	-- 				    MUTATEURS			 		  	--
	--======================================================================================--
	
	------------------------------------------------------------------------------------------
	-- PROCEDURE - BT_SET_LEFT								--
	-- Modifie le fils gauche d'un arbre							--
	-- Parametre : bin_tree et left sont des a_bin_tree					--
	-- Postcondition : le fils gauche de bin_tree est left.					--
	------------------------------------------------------------------------------------------
	procedure bt_set_left(bin_tree : IN a_bin_tree; left : IN a_bin_tree);
	
	------------------------------------------------------------------------------------------
	-- PROCEDURE - BT_SET_RIGHT								--
	-- Modifie le fils droit d'un arbre							--
	-- Parametre : bin_tree et right sont des a_bin_tree					--
	-- Postcondition : le fils droit de bin_tree est right.					--
	------------------------------------------------------------------------------------------
	procedure bt_set_right(bin_tree : IN a_bin_tree; right : IN a_bin_tree);
	
	------------------------------------------------------------------------------------------
	-- PROCEDURE - BT_SET_LEFT								--
	-- Modifie la valeur de la racine d'un arbre						--
	-- Parametre : bin_tree est un a_bin_tree, value est un T				--
	-- Postcondition : la valeur de la racine de bin_tree est value.			--
	------------------------------------------------------------------------------------------
	procedure bt_set_value(bin_tree : IN a_bin_tree; value : IN T);
	
	
private
	-- TYPE BIN TREE --	
	type t_bin_tree;
	type a_bin_tree is access bin_tree;
	type t_bin_tree is record
		value : T;
		left : a_bin_tree;
		right : a_bin_tree;
	end record;
end p_bin_tree;
