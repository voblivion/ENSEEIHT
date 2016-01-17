with text_io; use text_io;
with ada.integer_text_io; use ada.integer_text_io;

procedure condenser is
	NMAX : constant integer := 20;
	type CHAR_ARRAY is ARRAY(1..NMAX) of character;
	un_tab : CHAR_ARRAY;
	nbr_elts : integer := 0;
	new_nbr_elts : integer := 0;
begin
	-- Remplissage du tableau
	loop
		put("Combien d'éléments doit contenir le tableau ?");
		get(nbr_elts);
		exit when nbr_elts >= 0 and nbr_elts <= NMAX;
	end loop;	
	NEW_LINE;
	put("Remplissage du tableau :"); NEW_LINE;
	for i in 1..nbr_elts loop
		put("Valeur de l'élément "); put(i); put(" :");
		get(un_tab(i));
	end loop;
	new_nbr_elts := 0;
	-- Condensage du tableau
	for i in 1..nbr_elts loop
		if un_tab(i) /= ' ' then
			new_nbr_elts := new_nbr_elts + 1;
			un_tab(new_nbr_elts) := un_tab(i);
		end if;
	end loop;
	nbr_elts := new_nbr_elts;
	-- Affichage du tableau condensé
	for i in 1..nbr_elts loop
		put(un_tab(i));
	end loop;
end condenser;
