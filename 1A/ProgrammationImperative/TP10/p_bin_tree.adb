




package body p_bin_tree is
	-- TYPES --
	type a_bin_tree is private;


	--======================================================================================--
	-- 				    CONSTRUCTEURS		 		  	--
	--======================================================================================--
	
	------------------------------------------------------------------------------------------
	-- FONCTION - BT_MAKE_NODE								--
	------------------------------------------------------------------------------------------
	function bt_make_node(left : IN a_bin_tree, value : IN T, right : IN a_bin_tree) return a_bin_tree is
		bin_tree : a_bin_tree;
	begin
		bin_tree := new t_bin_tree;
		bin_tree.all.left := left;
		bin_tree.all.right := right;
		bin_tree.all.value := value;
		return bin_tree;
	end bt_make_node;
	
	------------------------------------------------------------------------------------------
	-- FONCTION - BT_MAKE_LEAF								--
	------------------------------------------------------------------------------------------
	function bt_make_leaf(value : IN T) return a_bin_tree is
		bin_tree : a_bin_tree;
	begin
		bin_tree := new t_bin_tree;
		bin_tree.all.left := null;
		bin_tree.all.right := null;
		bin_tree.all.value := value;
		return bin_tree;
	end bt_make_leaf;
	
	------------------------------------------------------------------------------------------
	-- FONCTION - BT_MAKE_EMPTY								--
	------------------------------------------------------------------------------------------
	function bt_make_empty return a_bin_tree is
	begin
		return null;
	end bt_make_leaf;
	
	--======================================================================================--
	-- 				    ACCESSEURS			 		  	--
	--======================================================================================--
	
	------------------------------------------------------------------------------------------
	-- FONCTION - BT_LEFT									--
	------------------------------------------------------------------------------------------
	function bt_left(bin_tree : IN a_bin_tree) return a_bin_tree is
	begin
		return bin_tree.all.left;
	end bt_left;
	
	------------------------------------------------------------------------------------------
	-- FONCTION - BT_RIGHT									--
	------------------------------------------------------------------------------------------
	function bt_right(bin_tree : IN a_bin_tree) return a_bin_tree is
	begin
		return bin_tree.all.right;
	end bt_right;
	
	------------------------------------------------------------------------------------------
	-- FONCTION - BT_LEFT									--
	------------------------------------------------------------------------------------------
	function bt_value(bin_tree : IN a_bin_tree) return T is
	begin
		return bin_tree.all.value;
	end bt_value;
	
	--======================================================================================--
	-- 				    SCANNERS			 		  	--
	--======================================================================================--
	
	------------------------------------------------------------------------------------------
	-- FONCTION - BT_IS_LEAF								--
	------------------------------------------------------------------------------------------
	function bt_is_leaf(bin_tree : IN a_bin_tree) return boolean is
	begin
		return (bin_tree.all.left = null and bin_tree.all.right = null);
	end bt_is_leaf;
	
	--======================================================================================--
	-- 				    MUTATEURS			 		  	--
	--======================================================================================--
	
	------------------------------------------------------------------------------------------
	-- PROCEDURE - BT_SET_LEFT								--
	------------------------------------------------------------------------------------------
	procedure bt_set_left(bin_tree : IN a_bin_tree; left : IN a_bin_tree) is
	begin
		bin_tree.all.left = left;
	end bt_set_left;
	
	------------------------------------------------------------------------------------------
	-- PROCEDURE - BT_SET_RIGHT								--
	------------------------------------------------------------------------------------------
	procedure bt_set_right(bin_tree : IN a_bin_tree; right : IN a_bin_tree) is
	begin
		bin_tree.all.left = right;
	end bt_set_right;
	
	------------------------------------------------------------------------------------------
	-- PROCEDURE - BT_SET_LEFT								--
	------------------------------------------------------------------------------------------
	procedure bt_set_value(bin_tree : IN a_bin_tree; value : IN T) is
	begin
		bin_tree.all.value = value;
	end bt_set_left;
	
end p_bin_tree;
