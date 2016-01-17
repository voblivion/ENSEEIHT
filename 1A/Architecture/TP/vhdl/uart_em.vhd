library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity uart_em is
	port (
		rst : in std_logic ;
		clk : in std_logic ;
		data : in std_logic_vector (7 downto 0) ;
		send : in std_logic ;
		sent : out std_logic ;
		sout : out std_logic
	);
end uart_em;

architecture synthesis of uart_em is

	-- submodules declarations
	component count0to9
		port (
			rst : in std_logic ;
			clk : in std_logic ;
			en : in std_logic ;
			s : out std_logic_vector (3 downto 0)
		) ;
	end component ;
	component decoder4to16
		port (
			e : in std_logic_vector (3 downto 0) ;
			s : out std_logic_vector (15 downto 0)
		) ;
	end component ;

	-- internal signals declarations
	signal en : std_logic ;
	signal dbit : std_logic_vector (15 downto 0) ;
	signal bit : std_logic_vector (3 downto 0) ;
	signal tsend : std_logic ;
	signal tdata : std_logic_vector (7 downto 0) ;

begin

	-- concurrent statements
	en <= (not dbit(0)) or (send) ;
	tsend <= send and dbit(0) ;
	sout <= (dbit(2) and tdata(0)) or (dbit(3) and tdata(1)) or (dbit(4) and tdata(2)) or (dbit(5) and tdata(3)) or (dbit(6) and tdata(4)) or (dbit(7) and tdata(5)) or (dbit(8) and tdata(6)) or (dbit(9) and tdata(7)) or (dbit(0)) ;
	sent <= dbit(9) ;

	-- sequential statements
	process (clk, rst) begin
		if rst = '1' then
			tdata(7 downto 0) <= "00000000" ;
		elsif tsend = '1' and clk'event and clk = '1' then
			tdata(7 downto 0) <= data(7 downto 0) ;
		end if ;
	end process ;

	-- components instanciations
	count0to9_0 : count0to9 port map (rst, clk, en, bit(3 downto 0)) ;
	decoder4to16_1 : decoder4to16 port map (bit(3 downto 0), dbit(15 downto 0)) ;

end synthesis;
