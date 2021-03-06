pragma Assertion_Policy(CHECK);
with Ada.Assertions; use Ada.Assertions;
with text_io; use text_io;
with ada.integer_text_io; use ada.integer_text_io;
with ada.numerics.discrete_random;

procedure ensembleordone is
	-- Constantes --
	NMAX : constant integer := 1000;
	MAXINT : constant integer := 100;

	-- Types --
	type elements is array(1..NMAX) of integer;
	type set is record
	  content : elements;
	  size : integer;
	end record;
	
	-- Aléatoire --
	type randomInterval is range 1..MAXINT;
	package pkgRandomGen is new ada.numerics.discrete_random(randomInterval);
	use pkgRandomGen;
	gen : generator;
	
	-- NewSet --
	-- Spec.: crée un noouvel ensemble et le retourne
	function newSet return set is
		elts : elements;
	begin
		elts(1) := 0; -- Pour éviter un warning ("elts jamais assigné")
		return (content => elts, size => 0);
	end newSet;
	
	-- Belongs --
	-- Spec.: retourne true si Fe est dans l'ensemble, false sinon
	-- Pre : Fs est un ensemble
	function belongsToSet(Fe : IN integer; Fs : IN set) return boolean is
		c : boolean := false;
		i : integer := 1;
	begin
		while (i <= Fs.size and not c) and then Fe >= Fs.content(i) loop
			if Fs.content(i) = Fe then
				c := true;
			end if;
			i := i+1;
		end loop;
		return c;
	end belongsToSet;

	-- AddToSet --
	-- Spec.: ajoute Fe à l'ensemble Fs
	-- Pre : Fs est un ensemble
	-- Post : Fs est un ensemble et Fe est dans Fs
	--procedure addToSet(Fe : IN integer; Fs : IN OUT set)
	--with
	--	pre => (for all i in 1..Fs.size => (For all j in (i+1)..Fs.size => Fs.content(i) < Fs.content(j))),
	--	post => (for all i in 1..Fs.size => (For all k in (i+1)..Fs.size => Fs.content(i) < Fs.content(k)));
	procedure addToSet(Fe : IN integer; Fs : IN OUT set) is
		c : boolean := false;
		j : integer := 1;
	begin
		-- Si l'ensemble est vide maintenant il contient Fe
		if Fs.size = 0 then
			Fs.size := 1;
			Fs.content(1) := Fe;
		-- Sinon on essaye de rajouter Fe à l'ensemble

		-- Je rajoute chaque élément de l'ensemble dans l'ensemble et si je suis à la "bonne position" je rajoute l'élement à ajouter
		else
			for i in 1..Fs.size loop
				-- Si Fe est dans l'ensemble alors on dit que c'est le cas (c = true) et on continu d'ajouter les éléments
				if Fs.content(i) = Fe then
					Fs.content(j) := Fs.content(i);
					j := j+1;
					c := true;
				-- Si Fe n'est pas dans l'ensemble et que l'élément observé est plus grand, on met Fe dedans et on le dit
				elsif Fs.content(i) > Fe and not c then
					Fs.content(j) := Fe;
					j := j+1;
					c := true;
					Fs.content(j) := Fs.content(i);
					j := j+1;
				-- Sinon on continu d'ajouter les éléments (car Fe est dedans ou l'élément observe est plus petit)
				else
					Fs.content(j) := Fs.content(i);
					j := j+1;
				end if;
			end loop;
			Fs.size := j-1;
		end if;
	end addToSet;
	
	--RemoveOfSet --
	-- Spec.: retire Fe de l'ensemble Fs
	-- Pre : Fs est un ensemble
	-- Post : Fs est un ensemble et Fe n'est pas dans Fs
	procedure removeOfSet(Fe : IN integer; Fs : IN OUT set)
	with
		pre => (for all i in 1..Fs.size => (For all j in (i+1)..Fs.size => Fs.content(i) < Fs.content(j))),
		post => (for all i in 1..Fs.size => (For all j in (i+1)..Fs.size => (Fs.content(i) < Fs.content(j) and Fs.content(i) /= Fe)));
	procedure removeOfSet(Fe : IN integer; Fs : IN OUT set) is
		j : integer := 1;
	begin
		for i in 1..Fs.size loop
			if Fs.content(i) /= Fe then
				Fs.content(j) := Fs.content(i);
				j := j+1;
			end if;
		end loop;
		Fs.size := j-1;
	end removeOfSet;
	
	-- DisplaySet
	-- Spec.: affiche les éléments de l'ensemble Fs
	procedure displaySet(Fs : IN OUT set) is
	begin
		for i in 1..(Fs.size-1) loop
			put(integer'Image(Fs.content(i)) & ", ");
		end loop;
		if Fs.size /= 0 then
			put(integer'Image(Fs.content(Fs.size)));
		end if;
	end displaySet;

	-- Variables --
	testSet : set;
begin
	-- Création de l'ensemble test
	testSet := newSet;
	-- Remplissage de l'ensemble test
	reset(gen);
	for i in 1..100 loop
		addToSet(Integer'Value(randomInterval'Image(random(gen))), testSet);
	end loop;
	displaySet(testSet);
	NEW_LINE;
	put(testSet.size);
end ensembleordone;

