library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ucmp8 is
	port (
		a : in std_logic_vector (7 downto 0) ;
		b : in std_logic_vector (7 downto 0) ;
		sup : out std_logic ;
		eq : out std_logic
	);
end ucmp8;

architecture synthesis of ucmp8 is

	-- submodules declarations
	component ucmp4
		port (
			a : in std_logic_vector (3 downto 0) ;
			b : in std_logic_vector (3 downto 0) ;
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
	ucmp4_0 : ucmp4 port map (a(7 downto 4), b(7 downto 4), supi, eqi) ;
	ucmp4_1 : ucmp4 port map (a(3 downto 0), b(3 downto 0), supj, eqj) ;

end synthesis;
