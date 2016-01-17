library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity shift1 is
	port (
		r : in std_logic ;
		en : in std_logic ;
		e : in std_logic_vector (31 downto 0) ;
		s : out std_logic_vector (31 downto 0)
	);
end shift1;

architecture synthesis of shift1 is

begin

	-- concurrent statements
	s(30 downto 1) <= 
		(e(30 downto 1) and ((not en)&(not en)&(not en)&(not en)&(not en)&(not en)&(not en)&(not en)&(not en)&(not en)&(not en)&(not en)&(not en)&(not en)&(not en)&(not en)&(not en)&(not en)&(not en)&(not en)&(not en)&(not en)&(not en)&(not en)&(not en)&(not en)&(not en)&(not en)&(not en)&(not en))) or
		(e(31 downto 2) and (en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en) and (r&r&r&r&r&r&r&r&r&r&r&r&r&r&r&r&r&r&r&r&r&r&r&r&r&r&r&r&r&r)) or
		(e(29 downto 0) and (en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en&en) and ((not r)&(not r)&(not r)&(not r)&(not r)&(not r)&(not r)&(not r)&(not r)&(not r)&(not r)&(not r)&(not r)&(not r)&(not r)&(not r)&(not r)&(not r)&(not r)&(not r)&(not r)&(not r)&(not r)&(not r)&(not r)&(not r)&(not r)&(not r)&(not r)&(not r))) ;
	s(31) <= ((not en) and e(31)) or (en and (not r) and e(30)) ;
	s(0) <= ((not en) and e(0)) or (en and r and e(1)) ;

end synthesis;
