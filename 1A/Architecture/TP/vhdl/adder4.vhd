library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adder4 is
	port (
		a : in std_logic_vector (3 downto 0) ;
		b : in std_logic_vector (3 downto 0) ;
		cin : in std_logic ;
		s : out std_logic_vector (3 downto 0) ;
		cout : out std_logic
	);
end adder4;

architecture synthesis of adder4 is

	-- submodules declarations
	component adder
		port (
			a : in std_logic ;
			b : in std_logic ;
			cin : in std_logic ;
			s : out std_logic ;
			cout : out std_logic
		) ;
	end component ;

	-- internal signals declarations
	signal couti : std_logic ;
	signal coutj : std_logic ;
	signal coutk : std_logic ;

begin

	-- components instanciations
	adder_0 : adder port map (a(0), b(0), cin, s(0), couti) ;
	adder_1 : adder port map (a(1), b(1), couti, s(1), coutj) ;
	adder_2 : adder port map (a(2), b(2), coutj, s(2), coutk) ;
	adder_3 : adder port map (a(3), b(3), coutk, s(3), cout) ;

end synthesis;
