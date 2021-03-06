with Ada.integer_text_io; use Ada.integer_text_io;
with Ada.text_io; use Ada.text_io;
with p_list; use p_list;

procedure test_list is
	l : t_list;
	f : t_list;
begin
	l := empty_list;
	push_list(l, 10);
	push_list(l, 8);
	push_list(l, 3);
	push_list(l, 4);
	push_list(l, 9);
	display_list(l); NEW_LINE;
	f := search_list(l, 5);
	if is_list_empty(f) then
		put("Pas trouvé"); NEW_LINE;
	else
		put("Trouvé"); NEW_LINE;
	end if;
	swift_after_list(l, 2, 8);
	swift_after_list(l, 2, 8);
	swift_before_list(l, 2, 4);
	swift_before_list(l, 2, 9);
	swift_after_list(l, 2, 10);
	f := search_list(l, 8);
	if is_list_empty(f) then
		put("Pas trouvé"); NEW_LINE;
	else
		put("Trouvé"); NEW_LINE;
	end if;
	display_list(l); NEW_LINE;
	pop_list(l, 2);
	display_list(l); NEW_LINE;

	
end test_list;
		
		
		
		
		
		
		
