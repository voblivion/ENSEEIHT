pragma Assertion_Policy(CHECK);
with Ada.Assertions; use Ada.Assertions;
with text_io; use text_io;
with ada.integer_text_io; use ada.integer_text_io;
with ada.numerics.discrete_random;

procedure tri_insertion is
	NMAX : constant integer := 10000;
	MMAX : constant integer := 100000;
	type interval is range 1..MMAX;
	package gen is new ada.numerics.discrete_random(interval);
	use gen;
	gnrtr : generator;

	type INT_ARRAY is ARRAY(1..NMAX) of integer;
	tab : INT_ARRAY;
	nbr_elts : integer := 0;
	
	
	
	-- ===== FILL ===== --
	procedure fill_array(Farray : IN OUT INT_ARRAY; nbr_elts : OUT integer) is
	
	begin
		reset(gnrtr);
		for i in 1..NMAX loop
			Farray(i) := Integer'Value(interval'Image(random(gnrtr)));
		end loop;
		nbr_elts := NMAX;
	end fill_array;

	-- ===== INSERT ===== --
	-- Specification : Ajoute un élément à sa place dans un tableau trié
	procedure insert_element_in_array(Farray : IN OUT INT_ARRAY; FarrayLength : IN OUT integer; Felement : IN OUT integer)
	with
		pre => (for all i in 1..(FarrayLength-1) => (Farray(i) <= Farray(i+1))),
		post => (for all i in 1..(FarrayLength-1) => (Farray(i) <= Farray(i+1)));
	procedure insert_element_in_array(Farray : IN OUT INT_ARRAY; FarrayLength : IN OUT integer; Felement : IN OUT integer) is
		tmp : integer;
	begin
		for i in 1..FarrayLength loop
			if Felement < Farray(i) then
				tmp := Farray(i);
				Farray(i) := Felement;
				Felement := tmp;
			end if;
		end loop;
		FarrayLength := FarrayLength+1;
		Farray(FarrayLength) := Felement;
	end insert_element_in_array;

	-- ===== TRI ===== --
	-- Specification : Tri le tableau entré en paramètre dans l'ordre croissant
	-- Parametres
		-- Farray : INT_ARRAY
		-- FarrayLength : integer
	procedure sort_array(Farray : IN OUT INT_ARRAY; FarrayLength : IN integer) is
		j : integer;
	begin
		for i in 1..FarrayLength loop
			j := i-1;
			insert_element_in_array(Farray, j, Farray(i));
		end loop;
	end sort_array;
begin
	-- Remplissage du tableau
	fill_array(tab, nbr_elts);
	
	-- Triage du tableau
	sort_array(tab, nbr_elts);
	
	-- Affichage du tableau
	for i in 1..nbr_elts loop
		put(tab(i), 8);
	end loop;
	
end tri_insertion;
