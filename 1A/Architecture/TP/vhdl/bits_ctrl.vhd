library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bits_ctrl is
	port (
		d4 : in std_logic ;
		d3 : in std_logic ;
		d2 : in std_logic ;
		d1 : in std_logic ;
		c3 : out std_logic ;
		c2 : out std_logic ;
		c1 : out std_logic
	);
end bits_ctrl;

architecture synthesis of bits_ctrl is

	-- submodules declarations
	component ouex3
		port (
			e1 : in std_logic ;
			e2 : in std_logic ;
			e3 : in std_logic ;
			s : out std_logic
		) ;
	end component ;

begin

	-- components instanciations
	ouex3_0 : ouex3 port map (d4, d2, d1, c1) ;
	ouex3_1 : ouex3 port map (d4, d3, d1, c2) ;
	ouex3_2 : ouex3 port map (d4, d3, d2, c3) ;

end synthesis;
