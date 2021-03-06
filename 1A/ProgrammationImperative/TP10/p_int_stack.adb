

package body p_int_stack is
	-- Constructeurs
	-- Init :
	function init_int_stack return t_int_stack is
	begin
		return null;
	end init_int_stack;
	
	-- Push : ajoute un élément sur la pile --
	procedure push_int_stack(int_stack : IN OUT t_int_stack; int : IN integer) is
		tmp_int_stack : t_int_stack;
	begin
		tmp_int_stack := new t_int_stack_case;
		tmp_int_stack.all.value := int;
		tmp_int_stack.all.next := int_stack;
		int_stack := tmp_int_stack;
	end push_int_stack;
	
	-- Destructeurs
	-- Pop : retire l'élément au dessus de la pile --
	procedure pop_int_stack(int_stack : IN OUT t_int_stack) is
	begin
		int_stack := int_stack.all.next;
		
		exception
			when CONSTRAINT_ERROR => raise INT_STACK_IS_EMPTY;
	end pop_int_stack;
	
	-- Accesseurs
	-- Top :
	function top_int_stack(int_stack : IN t_int_stack) return integer is
	begin
		return int_stack.all.value;
		exception
			when CONSTRAINT_ERROR => raise INT_STACK_IS_EMPTY;
	end top_int_stack;
	
	
	-- Testeurs
	-- Empty :
	function empty_int_stack(int_stack : IN t_int_stack) return boolean is
	begin
		return int_stack = null;
	end empty_int_stack;
	
end p_int_stack;
	
	
	
