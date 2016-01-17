library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity addbin is
	port (
		btn : in std_logic_vector (1 downto 0) ;
		sw : in std_logic_vector (7 downto 7) ;
		s : out std_logic ;
		cout : out std_logic
	);
end addbin;

architecture synthesis of addbin is

begin

	-- concurrent statements
	s <= (btn(0) and (not btn(1)) and (not sw(7))) or ((not btn(0)) and btn(1) and (not sw(7))) or ((not btn(0)) and (not btn(1)) and sw(7)) or (btn(0) and btn(1) and sw(7)) ;
	cout <= (btn(0) and btn(1)) or (btn(0) and sw(7)) or (btn(1) and sw(7)) ;

end synthesis;
