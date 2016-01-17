library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ucmp16 is
	port (
		a : in std_logic_vector (15 downto 0) ;
		b : in std_logic_vector (15 downto 0) ;
		sup : out std_logic ;
		eq : out std_logic
	);
end ucmp16;

architecture synthesis of ucmp16 is

	-- submodules declarations
	component ucmp8
		port (
			a : in std_logic_vector (7 downto 0) ;
			b : in std_logic_vector (7 downto 0) ;
			sup : out std_logic ;
			eq : out std_logic
		) ;
	end component ;

	-- internal signals declarations
	signal supi : std_logic ;
	signal eqi : std_logic ;
	signal supj : std_logic ;
	signal eqj : std_logic ;

begin

	-- concurrent statements
	eq <= eqi and eqj ;
	sup <= (supi) or (eqi and supj) ;

	-- components instanciations
	ucmp8_0 : ucmp8 port map (a(15 downto 8), b(15 downto 8), supi, eqi) ;
	ucmp8_1 : ucmp8 port map (a(7 downto 0), b(7 downto 0), supj, eqj) ;

end synthesis;
