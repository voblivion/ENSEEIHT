with text_io; use text_io;
with ada.integer_text_io; use ada.integer_text_io;

procedure spes is
	CMAX : constant integer := 80;
	type ztring is record
		content : string(1..CMAX);
		length : integer;
	end record;
	
	-- Pose une question et retourne la réponse entrée par l'utilisateur --
	function get_ztring(Fztring : IN ztring) return ztring is
		Gztring : ztring;
	begin
		put(Fztring.content(1..Fztring.length));
		get_line(Gztring.content, Gztring.length);
		return Gztring;
	end get_ztring;

	-- Rajoute un caractere Fc à la fin de la chaine Fz --
	procedure add_ztring(Fz : IN OUT ztring; Fc : IN character) is
	begin
		Fz.length := Fz.length + 1;
		Fz.content(Fz.length) := Fc;
	end add_ztring;
	
	-- Retourne la position Fpos de la prochaine "non-lettre" dans Fz --
	procedure next_no_letter(Fz : IN ztring; Fpos : IN OUT integer) is
	begin
		while Fpos <= Fz.length and Fz.content(Fpos) >= 'a' and Fz.content(Fpos) <= 'z' loop
			Fpos := Fpos+1;
		end loop;
	end next_no_letter;
	
	-- Affiche la chaine Fz --
	procedure display_ztring(Fz : IN ztring) is
	begin
		put(Fz.content(1..Fz.length));
	end display_ztring;
	
	procedure no_letters(Fz : IN ztring; Fy : IN OUT ztring) is
		NLPos : integer;
	begin
		NLPos := 1;
		next_no_letter(Fz, NLPos);
		while NLPos <= Fz.length loop
			add_ztring(Fy, Fz.content(NLPos));
			NLPos := NLPos + 1;
			next_no_letter(Fz, NLPos);
		end loop;
		--loop
		--	next_no_letter(Pztring, NLPos+1);
		--	if NLPos /= 0 then add_ztring(Rztring, Pztring.content(NLPos));
		--	else null;
		--	end if;
		--	exit when NLPos = 0;
		--end loop;
	end no_letters;

	Qztring : ztring;
	Pztring : ztring;
	Rztring : ztring;
begin
	-- Lecture de la chaine
	Qztring.content(1..36) := "Entrez une chaîne de caractères : ";
	Qztring.length := 36;
	Pztring := get_ztring(Qztring);
	
	-- Retrait des lettres entre 'a' et 'z'
	no_letters(Pztring, Rztring);	
	
	-- Affichage de la chaine sans lettre
	display_ztring(Rztring);
end spes;
