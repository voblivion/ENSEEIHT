with ada.integer_text_io; use ada.integer_text_io;
with text_io; use text_io;
procedure somme is
	s : integer;
	i : integer;
begin
	s := 0;
	loop
		put("Quel nombre ajouter à la somme ?");
		NEW_LINE;
		get(i);
		s:=s+i;
		put("La somme vaut ");
		put(s);
		NEW_LINE;
		exit when i = 0;
	end loop;
end somme;
