with text_io; use text_io;
with ada.integer_text_io; use ada.integer_text_io;

procedure deuxieme is
	CMAX : constant integer := 80;
	nom : string(1..CMAX);
	lnom : integer;
begin
	put("Entrez votre nom : ");
	get_line(nom, lnom);
	put("Bonjour ");put_line(nom(1..lnom));
end deuxieme;
