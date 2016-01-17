

package p_int_stack is
	type t_int_stack is private;
	INT_STACK_IS_EMPTY : exception;
	
	-- Constructeurs
	-- Init :
	function init_int_stack return t_int_stack;
	
	-- Push : ajoute un élément sur la pile --
	procedure push_int_stack(int_stack : IN OUT t_int_stack; int : IN integer);
	
	-- Destructeurs
	-- Pop : retire l'élément au dessus de la pile --
	procedure pop_int_stack(int_stack : IN OUT t_int_stack);
	
	
	-- Accesseurs
	-- Top :
	function top_int_stack(int_stack : IN t_int_stack) return integer;
	
	
	-- Testeurs
	-- Empty :
	function empty_int_stack(int_stack : IN t_int_stack) return boolean;
	
private
	type t_int_stack_case;
	type t_int_stack is access t_int_stack_case;
	type t_int_stack_case is record
		value : integer;
		next : t_int_stack;
	end record;
end p_int_stack;
	
	
	
