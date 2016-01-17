library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ouex3 is
	port (
		e1 : in std_logic ;
		e2 : in std_logic ;
		e3 : in std_logic ;
		s : out std_logic
	);
end ouex3;

architecture synthesis of ouex3 is

begin

	-- concurrent statements
	s <= (e1 and (not e2) and (not e3)) or ((not e1) and e2 and (not e3)) or ((not e1) and (not e2) and e3) or (e1 and e2 and e3) ;

end synthesis;
