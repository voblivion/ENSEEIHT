with text_io; use text_io;
with ada.integer_text_io; use ada.integer_text_io;

procedure traitements_binaires is
	type BINAIRE is ARRAY(0..7) of integer;

	-- DECLARATIONS FONCTIONS ET PROCEDURES
	-- Procédure : affichage
	-- Paramètres : nb (nombre binaire) [Donnée]
	procedure affichage (Fnb : IN BINAIRE) is
	begin
		for k in reverse 0..7 loop
			put(Fnb(k), 1);
		end loop;
	end affichage;
	-- Fonction : binaireDecimale
	-- Paramètres : bn (nombre binaire) [Donnée]
	-- Retour : n (nombre décimal)
	function binaireDecimale (Fnb : IN BINAIRE) return integer is
		n : integer := 0;
	begin
		for k in reverse 0..7 loop
			n := 2*n+Fnb(k);
		end loop;
		return n;
	end binaireDecimale;
	-- Fonction decimaleBinaire
	-- Paramètres : n (nombre décimal) [Donnée]
	-- Retour : nb (nombre binaire)
	function decimaleBinaire (Fn : IN integer) return BINAIRE is
		bn : BINAIRE;
		i : integer := 128;
		m : integer;
	begin
		-- Il y a une manière élégante avec ** (= ^)
		m := Fn;
		for k in reverse 0..7 loop
			if m-i >= 0 then
				bn(k) := 1;
				m := m-i;
			else
				bn(k) := 0;
			end if;
			i := i/2;
		end loop;
		return bn;
	end decimaleBinaire;
	-- Fonction : additionBinaire
	-- Paramètres : nb1, nb2 (nombres binaires) [Données]
	-- Retour : nb (nombre binaire)
	function additionBinaire (Fnb1 : IN BINAIRE; Fnb2 : IN BINAIRE) return BINAIRE is
	begin
		return decimaleBinaire(binaireDecimale(Fnb1)+binaireDecimale(Fnb2));
	end additionBinaire;
	-- DECLARATIONS VARIABLES
	nb : BINAIRE;
begin
	for k in 0..7 loop
		get(nb(k));
	end loop; NEW_LINE; NEW_LINE;
	affichage(nb);
	put(binaireDecimale(nb)); NEW_LINE; NEW_LINE;
	affichage(decimaleBinaire(149)); put(149);NEW_LINE; NEW_LINE;
	affichage(additionBinaire(nb, decimaleBinaire(149)));
end traitements_binaires;
