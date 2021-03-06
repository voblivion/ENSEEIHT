with text_io; use text_io;
with ada.integer_text_io; use ada.integer_text_io;
with ada.text_io; use ada.text_io;

procedure pointeurs is
	type pint is access integer;
	type matiere is record
		nom : string(1..5);
		nomlength : integer;
		note : pint := null;
	end record;
	type tab is array(1..100) of matiere;
	type module is record
		list : tab;
		length : integer;
	end record;
		
	-- initialisation d'une matière sans note --
	-- spec. : Retourne une matière avec un nom initialisé et sans note
	-- entrée : Fmatiere de type matiere
	-- précondition : aucune
	-- postcondition : Fmatiere a un nom
	procedure init_matiere(Fmatiere : IN OUT matiere) is
	begin
		Fmatiere.note := new integer;
		put("Entrez le nom de la matière : ");
		get_line(Fmatiere.nom, Fmatiere.nomlength);
		
	end init_matiere;
	-- affichage d'une matière --
	-- spec. : affiche le nom d'une matière et sa note si elle existe
	-- entrée : Fmatiere de type matiere
	-- précondition : aucune
	-- postcondition : aucune
	procedure disp_matiere(Fmatiere : IN matiere) is
	begin
		put_line("Matière :");
		put("    nom : "); put_line(Fmatiere.nom);
		put("    note : ");
		if (Fmatiere.note = null) then
			put_line("pas encore de note associée");
		else
			put(Fmatiere.note.all); NEW_LINE;
		end if;
	end disp_matiere;
	-- modification de la note d'une matière --
	-- spec. : initialise/modifie la note d'une matière
	-- entrée : Fmatiere de type matiere
	-- précondition : le nom de Fmatiere est initialisé
	-- postcondition : aucune
	procedure edit_matiere(Fmatiere : OUT matiere) is
	begin
		Fmatiere.note := new integer;
		put("Entrez la note dans la matière "); put(Fmatiere.nom); put(" : ");
		get(Fmatiere.note.all); SKIP_LINE; NEW_LINE;
	end edit_matiere;
	
	m : module;
begin
	m.length := 1;
	loop
		put("Entrez le nom d'une matière ou 'aucune' si vous souhaitez terminer de définir le module : ");
		init_matiere(m.list(m.length));
		
		if m.list(m.length).nom /= "aucun" then
			NEW_LINE;
			put("Entrez la note d'une matiere ou laissez vide : ");
			edit_matiere(m.list(m.length));
			m.length := m.length + 1;
		end if;
		exit when m.list(m.length).nom = "aucun";
	end loop;
	m.length := m.length - 1;
	for k in 1..(m.length) loop
		disp_matiere(m.list(k));
	end loop;			
end;







