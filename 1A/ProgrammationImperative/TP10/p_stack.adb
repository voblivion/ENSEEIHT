

package body p_stack is
	-- Constructeurs
	-- Init :
	function init_stack return t_stack is
	begin
		return null;
	end init_stack;
	
	-- Push : ajoute un élément sur la pile --
	procedure push_stack(stack : IN OUT t_stack; f_t : IN T) is
		tmp_stack : t_stack;
	begin
		tmp_stack := new t_stack_case;
		tmp_stack.all.value := f_t;
		tmp_stack.all.next := stack;
		stack := tmp_stack;
	end push_stack;
	
	-- Destructeurs
	-- Pop : retire l'élément au dessus de la pile --
	procedure pop_stack(stack : IN OUT t_stack) is
	begin
		stack := stack.all.next;
		
		exception
			when CONSTRAINT_ERROR => raise STACK_IS_EMPTY;
	end pop_stack;
	
	-- Accesseurs
	-- Top :
	function top_stack(stack : IN t_stack) return T is
	begin
		return stack.all.value;
		exception
			when CONSTRAINT_ERROR => raise STACK_IS_EMPTY;
	end top_stack;
	
	
	-- Testeurs
	-- Empty :
	function empty_stack(stack : IN t_stack) return boolean is
	begin
		return stack = null;
	end empty_stack;
	
end p_stack;
	
	
	
