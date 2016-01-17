with text_io; use text_io;
with ada.integer_text_io; use ada.integer_text_io;

procedure even is
	NMAX : constant integer := 200;
	type BOOL_ARRAY is ARRAY(2..NMAX) of boolean;
	nbrs : BOOL_ARRAY;
	nbr_max : integer := 0;
begin
	-- Initialisation du tableau avec des "true" jusqu'à la valeur désirée N
	loop
		put("Jusqu'à quel nombre N doit on tester la primalité de ceux entre 1 et N ?");
		get(nbr_max);
		exit when nbr_max >= 2 and nbr_max <= NMAX;
	end loop;
	for i in 2..nbr_max loop
		nbrs(i) := true;
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
