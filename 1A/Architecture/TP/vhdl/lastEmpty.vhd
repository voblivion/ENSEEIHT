library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity lastEmpty is
	port (
		w : in std_logic_vector (3 downto 0) ;
		r : in std_logic_vector (3 downto 0) ;
		s : out std_logic
	);
end lastEmpty;

architecture synthesis of lastEmpty is

	-- submodules declarations
	component adder4
		port (
			a : in std_logic_vector (3 downto 0) ;
			b : in std_logic_vector (3 downto 0) ;
			cin : in std_logic ;
			s : out std_logic_vector (3 downto 0) ;
			cout : out std_logic
		) ;
	end component ;
	component ucmp4
		port (
			a : in std_logic_vector (3 downto 0) ;
			b : in std_logic_vector (3 downto 0) ;
			sup : out std_logic ;
			eq : out std_logic
		) ;
	end component ;

	-- internal signals declarations
	signal nr : std_logic_vector (3 downto 0) ;
	signal cout : std_logic ;
	signal sup : std_logic ;

begin

	-- components instanciations
	adder4_0 : adder4 port map (r(3 downto 0), "0000", '1', nr(3 downto 0), cout) ;
	ucmp4_1 : ucmp4 port map (nr(3 downto 0), w(3 downto 0), sup, s) ;

end synthesis;
