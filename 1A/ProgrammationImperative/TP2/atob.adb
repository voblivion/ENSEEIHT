with text_io; use text_io;
with ada.integer_text_io; use ada.integer_text_io;

procedure atob is
	CMAX : constant integer := 80;
	chaine : string(1..CMAX);
	lchaine : integer;
begin
	-- Lecture du mot
	put("Entrez une chaîne de caractères : ");
	get_line(chaine, lchaine);
	-- Echange des a par des b	
	for i in 1..lchaine loop
		if chaine(i) = 'a' then
			chaine(i) := 'b';
		end if;
	end loop;
	-- chaine ne contient plus de a mais des b à la place
	-- afficher le mot transformé
	put_line(chaine(1..lchaine));
end atob;
