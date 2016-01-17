with ada.integer_text_io; use ada.integer_text_io;

procedure ral is
	-- Définition du type bintree od integer --
	type t_bintree_list;
	type t_bintree;
	type t_bintree_case is record
		root : integer;
		sons : t_bintree_list;
	end record;
	type t_bintree_list_case;
	type t_bintree_list is access t_bintree_list_case
	type t_bintree_list_case is record
		data : t_bintree;
		next : t_bintree_list;
	end record
		
	
	-- Définition du type list --
	type t_list;
	type t_list_case is record
		data : 
