with Ada.integer_text_io; use Ada.integer_text_io;
with Ada.text_io; use Ada.text_io;
with p_stack;

procedure calculatrice is
	package p_int_stack is new p_stack(integer);
	use p_int_stack;
	
	commande : string(1..10);
	longueur : integer;
	stack : t_stack;
	what : string(1..10);
	length : integer;
	quit : boolean;
	n1 : integer;
	n2 : integer;
	not_enough : boolean;
	enough_one : boolean;
begin
	stack := init_stack;
	quit := false;
	
	-- Recevoir les indications de l'utilisateur et afficher les retour
	loop
		put("Voulez-vous entrer un (n)ombre ou un (o)pérateur ou (q)uitter ou faire une remise à (z)éro ? ");
		get_line(what, length);
		
		if what(1..1) = "n" then
				-- Recevoir le nombre entré par l'utilisateur et l'afficher
				put("Entrez le nombre à insérer : ");
				get_line(commande, longueur);
				push_stack(stack, integer'value(commande(1..longueur)));
		elsif what(1..1) = "o" then
				not_enough := false;
				enough_one := false;
				begin
					-- Récupérer les deux derniers nombres entrés dans la pile
					n1 := top_stack(stack);
					pop_stack(stack);
					enough_one := true;
					n2 := top_stack(stack);
					pop_stack(stack);
					exception
						when STACK_IS_EMPTY => not_enough := true;
				end;
				if not_enough then
					if enough_one then
						push_stack(stack, n1);
						put("Un nombre dans la pile ne suffit pas à faire une opération.");
					else
						put("Aucun nombre dans la pile pour faire une opération");
					end if;
				else
					-- Recevoir la commande entrée par l'utilisateur et l'afficher
					put("Entrez l'opération à utiliser [+,-,*,/] : ");
					get_line(commande, longueur);
					if commande(1..1) = "+" then
							put(n2);put("+");put(n1);put("=");put(n2+n1); NEW_LINE;
					elsif commande(1..1) = "-" then
							put(n2);put("-");put(n1);put("=");put(n2-n1); NEW_LINE;
					elsif commande(1..1) = "*" then
							put(n2);put("*");put(n1);put("=");put(n2*n1); NEW_LINE;
					elsif commande(1..1) = "/" then
							put(n2);put("/");put(n1);put("=");put(n2/n1); NEW_LINE;
					else
							put("Ceci n'est pas une opération valide."); NEW_LINE;
					end if;
				end if;
		elsif what(1..1) = "z" then
				stack := init_stack;
		elsif what(1..1) = "q" then
				quit := true;
		else
				put("Ceci n'est pas un choix valide.");
		end if;
		NEW_LINE;
		exit when quit;
	end loop;
end calculatrice;
