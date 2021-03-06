with text_io; use text_io;
with ada.integer_text_io; use ada.integer_text_io;

procedure occurences is
	CMAX : constant integer := 80;
	chaine : string(1..CMAX);
	lchaine : integer;
	NMAX : constant integer := 26;
	type alpha_array is array(CHARACTER'POS('a')..CHARACTER'POS('z')) of integer;
	nbr_elts : integer := 26;	
	tab : alpha_array;
	n : integer;
begin
	-- Lecture de la chaine
	put("Entrez une chaîne de caractères : ");
	get_line(chaine, lchaine);
	-- Calcul du nombre d'occurence des lettres
	for i in CHARACTER'POS('a')..CHARACTER'POS('z') loop
		n := 0;
		for j in 1..lchaine loop
			if chaine(j) = CHARACTER'VAL(i) then
				n := n+1;
			end if;
		end loop;
		tab(i) := n;
		put(CHARACTER'VAL(i));put("|");put(tab(i));NEW_LINE;
	end loop;
end occurences;
