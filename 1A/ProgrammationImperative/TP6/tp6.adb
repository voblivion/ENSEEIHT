with text_io; use text_io;
with ada.integer_text_io; use ada.integer_text_io;

procedure tp6 is
	NMAX : constant integer := 100;
	type arr is Array(1..NMAX) of integer;
	
	-- Fonctions
	--================== MacCarthy =================--
	function maccarthy(n : in integer) return integer is
	begin
		if n > 100 then
			return n;
		else
			return maccarthy(maccarthy(n+1));
		end if;
	end maccarthy;
	--================== ArrayDisplayReverse ==================--
	procedure arraydisplayreverse(a : in arr; n : in integer) is
	begin
		if n >= 1 then
			put("|    |    |");NEW_LINE;
			put("|"); put(n, 3);put(" ");
			put("|"); put(a(n), 3);put(" |");NEW_LINE;
			put("|____|____|");NEW_LINE;
			arraydisplayreverse(a, n-1);
		end if;
	end;
	--========================== ArrayDisplay ==========================--
	procedure arraydisplay(a : in arr; d : in integer; n : in integer) is
	begin
		if d <= n then
			put("|    |    |");NEW_LINE;
			put("|"); put(d, 3);put(" ");
			put("|"); put(a(d), 3);put(" |");NEW_LINE;
			put("|____|____|");NEW_LINE;
			arraydisplay(a, d+1, n);
		end if;
	end;
	--========================== ArrayFind ==========================--
	function arrayfind(a : in arr; n : in integer; e : in integer) return integer is
	begin
		if n >= 1 then 
			if a(n) = e then
				return n;
			else
				return arrayfind(a, n-1, e);
			end if;
		else
			return 0;
		end if;
	end;
	--=================== ArrayIniy ===================--
	procedure arrayinit(a : out arr; n : out integer) is
	begin
		put("Taille du tableau : ");
		get(n);
		for k in 1..n loop
			put("Element ");put(k, 3);put(" du tableau : ");
			get(a(k));
		end loop;
	end;

	-- Variables
	n : integer;
	a : arr;
	m : integer;
	p : integer;
begin
	arrayinit(a, n);
	arraydisplayreverse(a, n); NEW_LINE;
	put("Element à trouver :");
	get(m);
	p := arrayfind(a, n, m);
	if p = 0 then
		put("Element pas trouvé.");
	else
		put("Element trouvé en position ");put(p, 3);
	end if;
end tp6;
		
