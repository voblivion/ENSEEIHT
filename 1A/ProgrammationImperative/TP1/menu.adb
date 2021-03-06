with text_io; use text_io;
with ada.integer_text_io; use ada.integer_text_io;

procedure menu is
	c : character;
	v : integer;
	d : boolean;
	q : boolean;
begin
	v := 0;
	d := false;
	q := false;
	loop
		put("Votre vitesse : "); put(v); NEW_LINE;
		put("Vous pouvez :"); NEW_LINE;
		put("------------------"); NEW_LINE;
		if not d then
			put("(d)émarrer"); NEW_LINE;
		end if;
		if d then
			put("(a)ccélerer"); NEW_LINE;
			put("(f)reiner"); NEW_LINE;
		end if;
		put("(q)uitter"); NEW_LINE;
		put("------------------"); NEW_LINE;
		put("Votre choix ?"); NEW_LINE;

		get(c); NEW_LINE;
		
		case c is
			when 'd' =>
				d := true;
				put("Démarrage moteur !"); NEW_LINE; NEW_LINE;
			when 'a' =>
				if d then
					v := v + 10;
					put("Accélération !"); NEW_LINE; NEW_LINE;
				end if;
			when 'f' =>
				if d and v >= 10 then
					v := v - 10;
					put("Deccélération !"); NEW_LINE; NEW_LINE;
				end if;
			when 'q' =>
				q := true;
				if v >= 30 then
					put("Vous mourrez !"); NEW_LINE;
				elsif v >= 10 then
					put("Vous vous fracturez la jambe !"); NEW_LINE;
				end if;
			when others =>
				put("Commande non reconnue."); NEW_LINE; NEW_LINE;
		end case;
		exit when q;
	end loop;
end menu;
				
