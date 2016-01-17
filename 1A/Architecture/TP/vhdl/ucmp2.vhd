library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ucmp2 is
	port (
		a : in std_logic_vector (1 downto 0) ;
		b : in std_logic_vector (1 downto 0) ;
		sup : out std_logic ;
		eq : out std_logic
	);
end ucmp2;

architecture synthesis of ucmp2 is

	-- submodules declarations
	component ucmp1
		port (
			a : in std_logic ;
			b : in std_logic ;
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
	ucmp1_0 : ucmp1 port map (a(1), b(1), supi, eqi) ;
	ucmp1_1 : ucmp1 port map (a(0), b(0), supj, eqj) ;

end synthesis;
