with Ada.integer_text_io; use Ada.integer_text_io;
with Ada.text_io; use Ada.text_io;

package p_list is
	
	-- Type public --
	type t_list is private;

	-- function create empty list --
	function empty_list return t_list;
	
	-- function is empty list ? --
	function is_list_empty(Flist : IN t_list) return boolean;

	-- procedure push ahead list --
	procedure push_list(Flist : IN OUT t_list; Fe : IN integer);

	-- procedure display list --
	procedure display_list(Flist : IN t_list);

	-- function search in list --
	function search_list(Flist : IN t_list; Fe : IN integer) return t_list;

	-- procedure swift after data in list --
	procedure swift_after_list(Flist : IN OUT t_list; Fe : IN integer; Fd : IN integer);

	-- procedure swift before data in list --
	procedure swift_before_list(Flist : IN OUT t_list; Fe : IN integer; Fd : IN integer);

	-- procedure pop list --
	procedure pop_list(Flist : IN OUT t_list; Fe : IN integer);

private
	type t_list_case;
	type t_list is access t_list_case;
	type t_list_case is record
		value : integer;
		next : t_list;
	end record;
end p_list;
		
		
		
		
