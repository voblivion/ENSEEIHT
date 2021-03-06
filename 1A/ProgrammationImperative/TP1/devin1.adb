with text_io; use text_io;
with ada.integer_text_io; use ada.integer_text_io;

procedure devin1 is
	n : integer;
	m : integer;
	min : integer;
	max : integer;
begin
	-- Joueur entre le nombre à deviner --
	loop
		put("Le joueur propose un nombre à faire deviner entre 1 et 100 : ");
		get(n);
		exit when n >= 0 and n <= 100;
	end loop;
	
	-- Ordinateur devine le nombre --
	min := 1;
	max := 100;
	loop
		put("Ordinateur propose ");
		m := (min + max)/2;
		put(m);
		if m > n then
			put(" mais c'est plus petit !"); NEW_LINE;
			max := m;
		elsif m < n then
			put(" mais c'est plus grand !"); NEW_LINE;
			min := m;
		end if;
		exit when m = n;
	end loop;
	put(" et il gagne !");
end devin1;
			
