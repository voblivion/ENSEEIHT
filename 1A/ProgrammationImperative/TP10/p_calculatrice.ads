with Ada.integer_text_io; use Ada.integer_text_io;
with Ada.text_io; use Ada.text_io;

package p_calculatrice is
	type t_calculatrice is private;
	
	-- Fonction permettant de rentrer un nombre dans la calculatrice --
	procedure number(f_calculatrice : IN OUT t_calculatrice; f_number : IN integer);
	
	-- Fonction permettant de remettre à zéro la calculatrice --
	procedure init(f_calculatrice : IN OUT t_calculatrice);
	
	-- Fonction permettant de commencer une addition --
	procedure plus(f_calculatrice : IN OUT t_calculatrice);
	
	-- Fonction permettant de commencer une soustraction --
	procedure minus(f_calculatrice : IN OUT t_calculatrice);
	
	-- Fonction permettant de commencer une multiplication --
	procedure time(f_calculatrice : IN OUT t_calculatrice);
	
	-- Fonction permettant de commencer une division --
	procedure by(f_calculatrice : IN OUT t_calculatrice);
	
	-- Fonction permettant de récupérer la valeur de la calculatrice --
	function value(f_calculatrice : IN t_calculatrice) return integer;
	
private
	type t_calculatrice is record
		value : integer;
		operation : character;
	end record;
end p_calculatrice;
