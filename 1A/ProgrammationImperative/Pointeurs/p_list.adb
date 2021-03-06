package body p_list is
	-- exceptions --
	LIST_IS_EMPTY : exception;
	DATA_IS_NOT_IN_LIST : exception;

	-- function create empty list --
	function empty_list return t_list is
	begin
		return null;
	end empty_list;

	-- function is empty list ? --
	function is_list_empty(Flist : IN t_list) return boolean is
	begin
		return Flist = null;
	end is_list_empty;

	-- procedure push ahead list --
	procedure push_list(Flist : IN OUT t_list; Fe : IN integer) is
		tList : t_list;
	begin
		tList := new t_list_case;
		tList.all.value := Fe;
		tList.all.next := Flist;
		Flist := tList;
	end push_list;

	-- procedure display list --
	procedure display_list(Flist : IN t_list) is
		procedure sub_display_list(Flist : IN t_list) is
		begin
			if not is_list_empty(Flist) then
				put(";");
				put(Flist.all.value);
				sub_display_list(Flist.all.next);
			end if;
		end sub_display_list;
	begin
		put("[");
		if not is_list_empty(Flist) then
			put(Flist.all.value);
			sub_display_list(Flist.all.next);
		end if;
		put("]");
	end display_list;

	-- function search in list --
	function search_list(Flist : IN t_list; Fe : IN integer) return t_list is
	begin
		if is_list_empty(Flist) then
			return null;
		elsif Flist.all.value = Fe then
			return Flist;
		else
			return search_list(Flist.all.next, Fe);
		end if;
	end search_list;

	-- procedure swift after data in list --
	procedure swift_after_list(Flist : IN OUT t_list; Fe : IN integer; Fd : IN integer) is
		tCurrent : t_list;
		tNext : t_list;
	begin
		if is_list_empty(Flist) then
			raise LIST_IS_EMPTY;
		else
			tCurrent := Flist;
			while tCurrent /= null and then tCurrent.all.value /= Fd loop
				tCurrent := tCurrent.all.next;
			end loop;
			-- tCurrent = null si pas trouvé, la bonne case sinon --
			if is_list_empty(tCurrent) then
				raise DATA_IS_NOT_IN_LIST;
			else
				-- si Fd était le dernier élément de la liste --
				tNext := new t_list_case'(Fe, tCurrent.all.next);
				tCurrent.all := (tCurrent.all.value, tNext);
			end if;
		end if;
	end swift_after_list;

	-- procedure swift before data in list --
	procedure swift_before_list(Flist : IN OUT t_list; Fe : IN integer; Fd : IN integer) is
		tCurrent : t_list;
		tNext : t_list;
	begin
		if is_list_empty(Flist) then
			raise LIST_IS_EMPTY;
		else
			tCurrent := Flist;
			while tCurrent /= null and then tCurrent.all.value /= Fd loop
				tCurrent := tCurrent.all.next;
			end loop;
			-- tCurrent = null si pas trouvé, la bonne case sinon --
			if is_list_empty(tCurrent) then
				raise DATA_IS_NOT_IN_LIST;
			else
				-- si Fd était le dernier élément de la liste --
				tNext := new t_list_case'(tCurrent.all.value, tCurrent.all.next);
				tCurrent.all := (Fe, tNext);
			end if;
		end if;
	end swift_before_list;

	-- procedure pop list --
	procedure pop_list(Flist : IN OUT t_list; Fe : IN integer) is
		tPrev : t_list;
		tCurrent : t_list;
	begin
		tPrev := Flist;
		tCurrent := Flist;
		while tCurrent /= null and then tCurrent.all.next /= null loop
			tPrev := tCurrent;
			if tCurrent.all.value = Fe then
				tCurrent.all.value := tCurrent.all.next.all.value;
				tCurrent.all.next := tCurrent.all.next.all.next;
			else
				tCurrent := tCurrent.all.next;
			end if;
		end loop;
		if tCurrent.all.value = Fe then
			tPrev.all.next := null;
		end if;
	end pop_list;
end p_list;
