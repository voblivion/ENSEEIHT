pragma Assertion_Policy(CHECK);
with Ada.Assertions ; use Ada.Assertions ;
with text_io; use text_io;
with ada.integer_text_io; use ada.integer_text_io;

procedure bitmap is
	NMAX : constant integer := 8;
	type INT_ARRAY is ARRAY(1..NMAX) of integer;
	type BOOL_ARRAY is ARRAY(1..NMAX) of boolean;

	-- DECLARATIONS FONCTIONS ET PROCEDURES
	-- Procédure : displayAll
	-- Paramètres : Fvalues  [Donnée], Fbooleans [Donnée], Fmin [Donnée], Fmax [Donnée], Fnbr [Donnée]
	-- Spécification : Affiche le tableau et indique les valeurs significatives
	procedure displayAll (Fvalues : IN INT_ARRAY; Fbooleans : IN BOOL_ARRAY; Fmin : IN integer; Fmax : IN integer; Fnbr : IN integer) is
	begin
		put("__________________________________"); NEW_LINE;
		put("| indice | boolean |    value    |"); NEW_LINE;
		put("|________|_________|_____________|"); NEW_LINE;
		for k in 1..NMAX loop
			put("| ");put(k, 6); put(" | ");
			if Fbooleans(k) then put("  true  | ");
			else put(" false  | ");
			end if;
			put(Fvalues(k), 11); put(" |"); NEW_LINE;
		end loop;
		put("|________|_________|_____________|"); NEW_LINE;
		put("Valeurs significatives :"); put(Fnbr,4); NEW_LINE;
		put("Indice minimum :        "); put(Fmin,4); NEW_LINE;
		put("Indice maximum :        "); put(Fmax,4); NEW_LINE; NEW_LINE;
	end displayAll;
	-- DECLARATIONS FONCTIONS ET PROCEDURES
	-- Procédure : display
	-- Paramètres : Fvalues  [Donnée], Fbooleans [Donnée], Fmin [Donnée], Fmax [Donnée], Fnbr [Donnée]
	-- Spécification : Affiche les valeurs significatives du tableau
	procedure display (Fvalues : IN INT_ARRAY; Fbooleans : IN BOOL_ARRAY; Fmin : IN integer; Fmax : IN integer; Fnbr : IN integer) is
	begin
		put("________________________"); NEW_LINE;
		put("| indice |    value    |"); NEW_LINE;
		put("|________|_____________|"); NEW_LINE;
		for k in 1..NMAX loop
			if Fbooleans(k) then
				put("| ");put(k, 6); put(" | ");
				put(Fvalues(k)); put(" |"); NEW_LINE;
			end if;
			
		end loop;
		put("|________|_____________|"); NEW_LINE;
		put("Valeurs significatives :"); put(Fnbr,4); NEW_LINE;
		put("Indice minimum :        "); put(Fmin,4); NEW_LINE;
		put("Indice maximum :        "); put(Fmax,4); NEW_LINE; NEW_LINE;
	end display;
	-- Procédure : init
	-- Paramètres : Fbooleans [DonnéeRésultat]
	procedure init (Fbooleans : IN OUT BOOL_ARRAY) is
	begin
		for k in 1..NMAX loop
			Fbooleans(k) := false;
		end loop;
	end init;
	-- Procédure : addElement
	-- Paramètres : Fvalues  [Donnée/Résultat], Fbooleans [Donnée/Résultat], Fmin [Donnée/Résultat], Fmax [Donnée/Résultat], Fnbr [Donnée/Résultat], Felement [Donnée]
	procedure addElement (Fvalues : IN OUT INT_ARRAY; Fbooleans : IN OUT BOOL_ARRAY; Fmin : IN OUT integer; Fmax : IN OUT integer; Fnbr : IN OUT integer; Felement : IN integer)
		with
			pre => (Fnbr < NMAX);
	procedure addElement (Fvalues : IN OUT INT_ARRAY; Fbooleans : IN OUT BOOL_ARRAY; Fmin : IN OUT integer; Fmax : IN OUT integer; Fnbr : IN OUT integer; Felement : IN integer) is
		c : boolean := false;
		k : integer;
	begin
		-- Si le tableau est vide d'éléments significatifs, on ajoute l'élément au début
		if Fnbr = 0 then
			Fbooleans(1) := true;
			Fvalues(1) := Felement;
			Fnbr := 1;
			Fmin := 1;
			Fmax := 1;
		-- Si il reste de la place entre Fmin et Fmax, on met l'élément entre Fmin et Fmax
		elsif (Fmax - Fmin) >= Fnbr then
			k := Fmin+1;
			loop
				if not Fbooleans(k) then
					Fbooleans(k) := true;
					Fvalues(k) := Felement;
					Fnbr := Fnbr+1;
					c := true;
				end if;
				k := k+1;
				exit when c;
			end loop;
		-- Si il reste de la place dans le tableau, on ajoute l'élément là où il y a de la place
		elsif Fnbr < NMAX then
			k := 1;
			loop
				if not Fbooleans(k) then
					Fbooleans(k) := true;
					Fvalues(k) := Felement;
					Fnbr := Fnbr+1;
					c := true;
					if k < Fmin then
						Fmin := k;
					else Fmax := k;
					end if;
				end if;
				k := k+1;
				exit when c;
			end loop;
		end if;
		-- Le cas où il n'y a pas de place dans le tableau est "attrapé" par les préconditions 
	end addElement;
	-- Procédure : eraseIndice
	-- Paramètres : Fbooleans [Donnée/Résultat], Fmin [Donnée/Résultat], Fmax [Donnée/Résultat], Fnbr [Donnée/Résultat], Findice [Donnée]
	procedure eraseIndice (Fbooleans : IN OUT BOOL_ARRAY; Fmin : IN OUT integer; Fmax : IN OUT integer; Fnbr : IN OUT integer; Findice : IN integer) is
		k : integer;
		c : boolean;
	begin
		if Fbooleans(Findice) then
			Fbooleans(Findice) := false;
			Fnbr := Fnbr - 1;
			if Fnbr = 0 then
				Fmin := 0;
				Fmax := 0;
			elsif Findice = Fmin then
				k := Fmin;
				c := false;
				loop
					if Fbooleans(k) then
						Fmin := k;
						c := true;
					end if;
					k := k+1;
					exit when c;
				end loop;
			elsif Findice = Fmax then
				k := Fmax;
				c := false;
				loop
					if Fbooleans(k) then
						Fmax := k;
						c := true;
					end if;
					k := k-1;
					exit when c;
				end loop;
			end if;
		end if;
	end eraseIndice;
	-- Procédure : compact
	-- Paramètres : Fvalues  [Donnée/Résultat], Fbooleans [Donnée/Résultat], Fmin [Donnée/Résultat], Fmax [Donnée/Résultat], Fnbr [Donnée/Résultat], Felement [Donnée]
	procedure compact (Fvalues : IN OUT INT_ARRAY; Fbooleans : IN OUT BOOL_ARRAY; Fmin : IN integer; Fmax : IN OUT integer) is
		e : integer;
	begin
		e := Fmin;
		for k in Fmin..Fmax loop
			if Fbooleans(k) then
				Fvalues(e) := Fvalues(k);
				Fbooleans(e) := true;
				e := e+1;
			end if;
		end loop;
		for k in e..Fmax loop
			Fbooleans(k) := false;
		end loop;
		Fmax := e-1;
	end compact;
	-- Fonction : search
	-- Paramètres : Fvalues  [Donnée], Fbooleans [Donnée], Fmin [Donnée], Fmax [Donnée], Fvalue [Donnée]
	-- Retour : i (indice)
	function search (Fvalues : IN INT_ARRAY; Fbooleans : IN BOOL_ARRAY; Fmin : IN integer; Fmax : IN integer; Fvalue : IN integer) return integer is
		i : integer := 0;
		k : integer;
	begin
		k := Fmin;
		while k <= Fmax and i = 0 loop
			if Fbooleans(k) and then Fvalues(k) = Fvalue then
				i := k;
			else
				k := k+1;
			end if;
		end loop;
		return i;
	end search;

	values : INT_ARRAY;
	booleans : BOOL_ARRAY;
	min : integer := 0;
	max : integer := 0;
	nbr : integer := 0;
begin
	init(booleans);
	addElement(values, booleans, min, max, nbr, 8);
	addElement(values, booleans, min, max, nbr, 2);
	addElement(values, booleans, min, max, nbr, 18);
	addElement(values, booleans, min, max, nbr, 18);
	addElement(values, booleans, min, max, nbr, 3);
	addElement(values, booleans, min, max, nbr, 1);
	addElement(values, booleans, min, max, nbr, 83);
	addElement(values, booleans, min, max, nbr, 7);
	addElement(values, booleans, min, max, nbr, 21);
	display(values, booleans, min, max, nbr);
	eraseindice(booleans, min, max, nbr, 2);
	eraseindice(booleans, min, max, nbr, 1);
	eraseindice(booleans, min, max, nbr, 5);
	eraseindice(booleans, min, max, nbr, 6);
	addElement(values, booleans, min, max, nbr, 100);
	display(values, booleans, min, max, nbr);
	compact(values, booleans, min, max);
	display(values, booleans, min, max, nbr);
end bitmap;
