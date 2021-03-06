with text_io; use text_io;
with ada.float_text_io; use ada.float_text_io;

procedure racine is
	x : float;
	p : float;
	q : float;
	e : float;
begin
	-- L'utilisateur entre un nombre --
	put("Choisir la précision : ");
	get(e); NEW_LINE;	
	put("Calculer la racine de : ");
	get(x); NEW_LINE;
	-- L'ordinateur calcul la racine --
	p := 1.0;
	q := 0.5*(p + x/p);
	while (p-q)*(p-q) > e*e loop
		p := q;
		q := 0.5*(p + x/p);
	end loop;
	put("La racine est : "); put(q);
end racine;
