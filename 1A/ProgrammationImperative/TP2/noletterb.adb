with text_io; use text_io;
with ada.integer_text_io; use ada.integer_text_io;

procedure noletterb is
	CMAX : constant integer := 80;
	chaine : string(1..CMAX);
	lchaine : integer;
	e : integer;
begin
	-- Lecture de la chaine
	put("Entrez une chaîne de caractères : ");
	get_line(chaine, lchaine);
	-- Retrait des lettres entre 'a' et 'z'
	e := 1;
	for i in 1..lchaine loop
		if chaine(i) < 'a' or chaine(i) > 'z' then
			chaine(e) := chaine(i);
			e := e + 1;
		end if;
	end loop;
	-- chaine ne contient plus de lettre entre 'a' et 'z'
	lchaine := e-1;
	-- Affichage de la chaine sans lettre entre 'a' et 'z'
	put_line(chaine(1..lchaine));
end noletterb;
