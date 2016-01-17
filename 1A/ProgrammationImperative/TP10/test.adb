with Ada.text_io; use Ada.text_io;
with Ada.integer_text_io; use Ada.integer_text_io;
with p_int_stack; use p_int_stack;

procedure test is
	s : t_int_stack;
begin
	s := init_int_stack;
	push_int_stack(s,5);
	push_int_stack(s,7);
	push_int_stack(s,13);
	push_int_stack(s,4);
	push_int_stack(s,8);
	push_int_stack(s,1);
	for k in 1..10 loop
		put(top_int_stack(s));
		pop_int_stack(s);
		NEW_LINE;
	end loop;
end test;
