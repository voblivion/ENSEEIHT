library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity dec7segs is
	port (
		sw : in std_logic_vector (3 downto 0) ;
		ssg : out std_logic_vector (7 downto 0) ;
		an : out std_logic_vector (3 downto 0)
	);
end dec7segs;

architecture synthesis of dec7segs is

	-- submodules declarations
	component dec7segsH
		port (
			sw : in std_logic_vector (3 downto 0) ;
			seg : out std_logic_vector (6 downto 0)
		) ;
	end component ;

	-- internal signals declarations
	signal si : std_logic_vector (6 downto 0) ;

begin

	-- concurrent statements
	ssg(6 downto 0) <= not si(6 downto 0) ;
	an(3 downto 0) <= "0001" ;
	ssg(7) <= '1' ;

	-- components instanciations
	dec7segsH_0 : dec7segsH port map (sw(3 downto 0), si(6 downto 0)) ;

end synthesis;
