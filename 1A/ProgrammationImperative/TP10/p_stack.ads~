
generic
	type T is private;

package p_stack is
	type t_stack is private;
	STACK_IS_EMPTY : exception;
	
	-- Constructeurs
	-- Init :
	function init_stack return t_stack;
	
	-- Push : ajoute un élément sur la pile --
	procedure push_stack(stack : IN OUT t_stack; f_t : IN T);
	
	-- Destructeurs
	-- Pop : retire l'élément au dessus de la pile --
	procedure pop_stack(stack : IN OUT t_stack);
	
	
	-- Accesseurs
	-- Top :
	function top_stack(stack : IN t_stack) return T;
	
	
	-- Testeurs
	-- Empty :
	function empty_stack(stack : IN t_stack) return boolean;
	
private
	type t_stack_case;
	type t_stack is access t_stack_case;
	type t_stack_case is record
		value : T;
		next : t_stack;
	end record;
end p_stack;
	
	
	
