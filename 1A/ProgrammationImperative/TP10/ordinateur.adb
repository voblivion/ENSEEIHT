with Ada.integer_text_io; use Ada.integer_text_io;
with Ada.text_io; use Ada.text_io;
with p_calculatrice; use p_calculatrice;

procedure ordinateur is
	calculatrice : t_calculatrice;
	
	action : string(1..16);
	action_length : integer;
	
	quit : boolean;
	
begin
	init(calculatrice);
	quit := false;
	
	loop
		put(value(calculatrice)); NEW_LINE;
		put("Any number or '+', '-', '*', '/' or 'off' or 'ac' : ");
		get_line(action, action_length);
		
		if action(1..action_length) = "+" then
			plus(calculatrice);
		elsif action(1..action_length) = "-" then
			minus(calculatrice);
		elsif action(1..action_length) = "*" then
			time(calculatrice);
		elsif action(1..action_length) = "/" then
			by(calculatrice);
		elsif action(1..action_length) = "off" then
			quit := true;
		elsif action(1..action_length) = "ac" then
			init(calculatrice);
		else
			number(calculatrice, integer'value(action(1..action_length)));
		end if;
		New_LINE;
		exit when quit;
	end loop;
end ordinateur;
