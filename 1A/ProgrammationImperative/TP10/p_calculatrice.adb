


package body p_calculatrice is
	
	-- Fonction permettant de remettre à zéro la calculatrice --
	procedure init(f_calculatrice : IN OUT t_calculatrice) is
	begin
		f_calculatrice.value := 0;
		f_calculatrice.operation := '=';
	end init;
	
	-- Fonction permettant de rentrer un nombre dans la calculatrice --
	procedure number(f_calculatrice : IN OUT t_calculatrice; f_number : IN integer) is
	begin
		if f_calculatrice.operation = '=' then
			f_calculatrice.value := f_number;
		elsif f_calculatrice.operation = '+' then
			f_calculatrice.value := f_calculatrice.value + f_number;
			f_calculatrice.operation := '=';
		elsif f_calculatrice.operation = '-' then
			f_calculatrice.value := f_calculatrice.value - f_number;
			f_calculatrice.operation := '=';
		elsif f_calculatrice.operation = '*' then
			f_calculatrice.value := f_calculatrice.value * f_number;
			f_calculatrice.operation := '=';
		elsif f_calculatrice.operation = '/' then
			f_calculatrice.value := f_calculatrice.value / f_number;
			f_calculatrice.operation := '=';
		end if;
	end number;
	
	
	-- Fonction permettant de commencer une addition --
	procedure plus(f_calculatrice : IN OUT t_calculatrice) is
	begin
		f_calculatrice.operation := '+';
	end plus;
	
	-- Fonction permettant de commencer une soustraction --
	procedure minus(f_calculatrice : IN OUT t_calculatrice) is
	begin
		f_calculatrice.operation := '-';
	end minus;
	
	-- Fonction permettant de commencer une multiplication --
	procedure time(f_calculatrice : IN OUT t_calculatrice) is
	begin
		f_calculatrice.operation := '*';
	end time;
	
	-- Fonction permettant de commencer une division --
	procedure by(f_calculatrice : IN OUT t_calculatrice) is
	begin
		f_calculatrice.operation := '/';
	end by;
	
	-- Fonction permettant de récupérer la valeur de la calculatrice --
	function value(f_calculatrice : IN t_calculatrice) return integer is
	begin
		return f_calculatrice.value;
	end value;
	
end p_calculatrice;
