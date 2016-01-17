library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ucmp4 is
	port (
		a : in std_logic_vector (3 downto 0) ;
		b : in std_logic_vector (3 downto 0) ;
		sup : out std_logic ;
		eq : out std_logic
	);
end ucmp4;

architecture synthesis of ucmp4 is

	-- submodules declarations
	component ucmp2
		port (
			a : in std_logic_vector (1 downto 0) ;
			b : in std_logic_vector (1 downto 0) ;
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
	ucmp2_0 : ucmp2 port map (a(3 downto 2), b(3 downto 2), supi, eqi) ;
	ucmp2_1 : ucmp2 port map (a(1 downto 0), b(1 downto 0), supj, eqj) ;

end synthesis;