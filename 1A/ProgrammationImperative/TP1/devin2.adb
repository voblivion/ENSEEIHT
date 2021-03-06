with text_io; use text_io;
with ada.integer_text_io; use ada.integer_text_io;
with Alea; use Alea;

procedure devin2 is
	n : integer;
	m : integer;
	min : integer;
	max : integer;
begin
	-- Ordinateur entre le nombre à deviner --
	n := Alea_1_100;
	
	-- Joueur devine le nombre --
	min := 1;
	max := 100;
	loop
		put("Joueur propose ");
		get(m);
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
end devin2;
			
