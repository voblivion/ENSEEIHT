library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity test is
	port (
		mclk : in std_logic ;
		data : in std_logic_vector (15 downto 0) ;
		ssg : out std_logic_vector (6 downto 0) ;
		an : out std_logic_vector (3 downto 0)
	);
end test;

architecture synthesis of test is

	-- submodules declarations
	component clock28
		port (
			rst : in std_logic ;
			clk : in std_logic ;
			s : out std_logic_vector (27 downto 0)
		) ;
	end component ;
	component affmux
		port (
			rst : in std_logic ;
			clk : in std_logic ;
			data : in std_logic_vector (15 downto 0) ;
			anodes : out std_logic_vector (3 downto 0) ;
			seg : out std_logic_vector (6 downto 0)
		) ;
	end component ;

	-- internal signals declarations
	signal si : std_logic_vector (27 downto 0) ;
	signal ld : std_logic_vector (7 downto 0) ;
	signal a : std_logic_vector (3 downto 0) ;
	signal seg : std_logic_vector (6 downto 0) ;

begin

	-- concurrent statements
	ld(7 downto 0) <= si(27 downto 20) ;
	an(3 downto 0) <= not a(3 downto 0) ;
	ssg(6 downto 0) <= not seg(6 downto 0) ;

	-- components instanciations
	clock28_0 : clock28 port map ('0', mclk, si(27 downto 0)) ;
	affmux_1 : affmux port map ('0', si(7), data(15 downto 0), a(3 downto 0), seg(6 downto 0)) ;

end synthesis;
