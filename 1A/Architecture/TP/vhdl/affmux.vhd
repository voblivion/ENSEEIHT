library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity affmux is
	port (
		rst : in std_logic ;
		clk : in std_logic ;
		data : in std_logic_vector (15 downto 0) ;
		anodes : out std_logic_vector (3 downto 0) ;
		seg : out std_logic_vector (6 downto 0)
	);
end affmux;

architecture synthesis of affmux is

	-- submodules declarations
	component count2
		port (
			rst : in std_logic ;
			clk : in std_logic ;
			en : in std_logic ;
			s : out std_logic_vector (1 downto 0)
		) ;
	end component ;
	component decoder2to4
		port (
			e : in std_logic_vector (1 downto 0) ;
			s : out std_logic_vector (3 downto 0)
		) ;
	end component ;
	component dec7segsH
		port (
			sw : in std_logic_vector (3 downto 0) ;
			seg : out std_logic_vector (6 downto 0)
		) ;
	end component ;

	-- buffer signals declarations
	signal anodes_int : std_logic_vector (3 downto 0) ;

	-- internal signals declarations
	signal si : std_logic_vector (1 downto 0) ;
	signal tmp : std_logic_vector (3 downto 0) ;

begin

	-- buffer signals assignations
	anodes(3 downto 0) <= anodes_int(3 downto 0) ;

	-- concurrent statements
	tmp(3 downto 0) <= 
		(data(15 downto 12) and (anodes_int(3)&anodes_int(3)&anodes_int(3)&anodes_int(3))) or
		(data(11 downto 8) and (anodes_int(2)&anodes_int(2)&anodes_int(2)&anodes_int(2))) or
		(data(7 downto 4) and (anodes_int(1)&anodes_int(1)&anodes_int(1)&anodes_int(1))) or
		(data(3 downto 0) and (anodes_int(0)&anodes_int(0)&anodes_int(0)&anodes_int(0))) ;

	-- components instanciations
	count2_0 : count2 port map (rst, clk, '1', si(1 downto 0)) ;
	decoder2to4_1 : decoder2to4 port map (si(1 downto 0), anodes_int(3 downto 0)) ;
	dec7segsH_2 : dec7segsH port map (tmp(3 downto 0), seg(6 downto 0)) ;

end synthesis;
