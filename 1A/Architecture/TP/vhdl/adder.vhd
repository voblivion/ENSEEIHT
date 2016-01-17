library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adder is
	port (
		a : in std_logic ;
		b : in std_logic ;
		cin : in std_logic ;
		s : out std_logic ;
		cout : out std_logic
	);
end adder;

architecture synthesis of adder is

begin

	-- concurrent statements
	s <= (a and b and cin) or (a and (not b) and (not cin)) or ((not a) and b and (not cin)) or ((not a) and (not b) and cin) ;
	cout <= (a and b) or (a and cin) or (b and cin) ;

end synthesis;
