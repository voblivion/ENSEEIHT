with text_io; use text_io;
with ada.integer_text_io; use ada.integer_text_io;

procedure spes2 is
	CMAX : constant integer := 80;
	type ztring is record
		content : string(1..CMAX);
		length : integer;
	end record;
	type alpha_array is array(CHARACTER'POS('a')..CHARACTER'POS('z')) of integer;
	
	-- Pose une question et retourne la réponse entrée par l'utilisateur --
	function get_ztring(Fztring : IN ztring) return ztring is
		Gztring : ztring;
	begin
		put(Fztring.content(1..Fztring.length));
		get_line(Gztring.content, Gztring.length);
		return Gztring;
	end get_ztring;

	-- Retourne le nombre d'occurences dans Fz de Fc
	function occurences_letter(Fz : IN ztring; Fc : IN character) return integer is
		n : integer;
	begin
		n := 0;
		for i in 1..Fz.length loop
			if Fz.content(i) = Fc then
				n := n + 1;
			end if;
		end loop;
		return n;
	end occurences_letter;
	
	-- Retourne le nombre d'occurences de chaques lettres de la chaine Fz
	function occurences_letters(Fz : IN ztring) return alpha_array is
		occurencesArray : alpha_array;
	begin
		for i in CHARACTER'POS('a')..CHARACTER'POS('z') loop
			occurencesArray(i) := occurences_letter(Fz, CHARACTER'VAL(i));
		end loop;
		return occurencesArray;
	end occurences_letters;
	
	-- Affiche un alpha_array
	procedure display_alpha_array(Aa : IN alpha_array) is
	begin
		put_line("__________");
		for i in CHARACTER'POS('a')..CHARACTER'POS('z') loop
			if Aa(i) /= 0 then
				put("| " & CHARACTER'VAL(i) & " | ");
				put(Aa(i), 2); put_line(" |");
			end if;
		end loop;
	end display_alpha_array;

	Qztring : ztring;
	Pztring : ztring;
	Alarray : alpha_array;
begin
	-- Lecture de la chaine
	Qztring.content(1..36) := "Entrez une chaîne de caractères : ";
	Qztring.length := 36;
	Pztring := get_ztring(Qztring);
	
	-- Recherche des occurences
	Alarray := occurences_letters(Pztring);

	-- Affichage des occurences
	display_alpha_array(Alarray);
	
end spes2;
