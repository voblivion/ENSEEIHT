library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity dec7segsH is
	port (
		sw : in std_logic_vector (3 downto 0) ;
		seg : out std_logic_vector (6 downto 0)
	);
end dec7segsH;

architecture synthesis of dec7segsH is

	-- submodules declarations
	component decoder4to16
		port (
			e : in std_logic_vector (3 downto 0) ;
			s : out std_logic_vector (15 downto 0)
		) ;
	end component ;

	-- internal signals declarations
	signal si : std_logic_vector (15 downto 0) ;

begin

	-- concurrent statements
	seg(0) <= (si(0)) or (si(2)) or (si(3)) or (si(5)) or (si(6)) or (si(7)) or (si(8)) or (si(9)) or (si(10)) or (si(14)) or (si(15)) ;
	seg(1) <= (si(0)) or (si(1)) or (si(2)) or (si(3)) or (si(4)) or (si(7)) or (si(8)) or (si(9)) or (si(10)) or (si(13)) ;
	seg(2) <= (si(0)) or (si(1)) or (si(3)) or (si(4)) or (si(5)) or (si(6)) or (si(7)) or (si(8)) or (si(9)) or (si(10)) or (si(11)) or (si(13)) ;
	seg(3) <= (si(0)) or (si(2)) or (si(3)) or (si(5)) or (si(6)) or (si(8)) or (si(9)) or (si(11)) or (si(12)) or (si(13)) or (si(14)) ;
	seg(4) <= (si(0)) or (si(2)) or (si(6)) or (si(8)) or (si(10)) or (si(11)) or (si(12)) or (si(13)) or (si(14)) or (si(15)) ;
	seg(5) <= (si(0)) or (si(4)) or (si(5)) or (si(6)) or (si(8)) or (si(9)) or (si(10)) or (si(11)) or (si(14)) or (si(15)) ;
	seg(6) <= (si(2)) or (si(3)) or (si(4)) or (si(5)) or (si(6)) or (si(8)) or (si(9)) or (si(10)) or (si(11)) or (si(12)) or (si(13)) or (si(14)) or (si(15)) ;

	-- components instanciations
	decoder4to16_0 : decoder4to16 port map (sw(3 downto 0), si(15 downto 0)) ;

end synthesis;
