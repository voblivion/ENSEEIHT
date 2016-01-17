library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity equal3 is
	port (
		a : in std_logic_vector (2 downto 0) ;
		b : in std_logic_vector (2 downto 0) ;
		eq : out std_logic
	);
end equal3;

architecture synthesis of equal3 is

	-- internal signals declarations
	signal e : std_logic_vector (2 downto 0) ;

begin

	-- concurrent statements
	eq <= e(0) and e(1) and e(2) ;
	e(0) <= (a(0) and b(0)) or ((not a(0)) and (not b(0))) ;
	e(1) <= (a(1) and b(1)) or ((not a(1)) and (not b(1))) ;
	e(2) <= (a(2) and b(2)) or ((not a(2)) and (not b(2))) ;

end synthesis;
