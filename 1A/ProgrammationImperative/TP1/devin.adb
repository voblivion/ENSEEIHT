with text_io; use text_io;
with ada.integer_text_io; use ada.integer_text_io;

procedure devin is
	n : integer;
begin
	-- Joueur entre le nombre à deviner --
	loop
		put("Le joueur propose un nombre à faire deviner entre 1 et 100 : ");
		get(n);
		exit when n >= 0 and n <= 100;
	end loop;
	
	-- Ordinateur devine le nombre --
	loop 

