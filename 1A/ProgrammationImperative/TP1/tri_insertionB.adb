with text_io; use text_io;
with ada.integer_text_io; use ada.integer_text_io;

procedure even is
	NMAX : constant integer := 200;
	type BOOL_ARRAY is ARRAY(2..NMAX) of boolean;
	nbrs : BOOL_ARRAY;
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
		get(un_tab(i));
	end loop;
	-- Condensage du tableau
	for i in 2..nbr_max loop
		if nbrs(i) then
			for j in (i+1)..nbr_max loop
				if j mod i = 0 then
					nbrs(j) := false;
				end if;
			end loop;
			put(i); put(' ');
		end if;
	end loop;
end even;
