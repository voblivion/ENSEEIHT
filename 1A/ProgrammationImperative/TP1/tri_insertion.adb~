with text_io; use text_io;
with ada.integer_text_io; use ada.integer_text_io;

procedure tri_insertion is
	NMAX : constant integer := 200;
	type INT_ARRAY is ARRAY(2..NMAX) of integer;
	tab : INT_ARRAY;
	nbr_elts : integer := 0;
begin
	-- Remplissage du tableau
	loop
		put("Nombre d'éléments dans le tableau : ");
		get(nbr_elts);
		exit when nbr_max >= 0 and nbr_elts <= NMAX;
	end loop;
	put("Remplissage du tableau :"); NEW_LINE;
	for i in 1..nbr_elts loop
		put("Valeur de la case "); put(i); put(" :");
		get(tab(i));
	end loop;
	-- Tri du tableau
	nbr_tries := 0;
	for i in 1..nbr_elts loop
		k := tab(i);
		for j in 1..i loop
			if k < tab(j) then
				temp := tab(j);
				tab(j) := k;
				k := temp;
			end if;
		end loop;
	end loop;
	-- Affichage du tableau
	for i in 1..nbr_elts loop
		put(tab(i));
	end loop;
	
end tri_insertion;
