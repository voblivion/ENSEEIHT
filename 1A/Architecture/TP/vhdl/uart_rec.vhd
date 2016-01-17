library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity uart_rec is
	port (
		rst : in std_logic ;
		clk : in std_logic ;
		sin : in std_logic ;
		dout : out std_logic_vector (7 downto 0) ;
		rcvd : out std_logic
	);
end uart_rec;

architecture synthesis of uart_rec is

	-- submodules declarations
	component count0to39
		port (
			rst : in std_logic ;
			clk : in std_logic ;
			en : in std_logic ;
			s : out std_logic_vector (5 downto 0)
		) ;
	end component ;
	component decoder6to64
		port (
			e : in std_logic_vector (5 downto 0) ;
			s : out std_logic_vector (63 downto 0)
		) ;
	end component ;

	-- buffer signals declarations
	signal dout_int : std_logic_vector (7 downto 0) ;

	-- internal signals declarations
	signal en : std_logic ;
	signal dbit : std_logic_vector (63 downto 0) ;
	signal bit : std_logic_vector (5 downto 0) ;
	signal ena : std_logic ;

begin

	-- buffer signals assignations
	dout(7 downto 0) <= dout_int(7 downto 0) ;

	-- concurrent statements
	en <= (not dbit(0)) or (not sin) ;
	ena <= (dbit(2)) or (dbit(6)) or (dbit(10)) or (dbit(14)) or (dbit(18)) or (dbit(22)) or (dbit(26)) or (dbit(30)) or (dbit(34)) ;
	rcvd <= (dbit(36)) or (dbit(37)) or (dbit(38)) or (dbit(39)) ;

	-- sequential statements
	process (clk, rst) begin
		if rst = '1' then
			dout_int(6 downto 0) <= "0000000" ;
		elsif ena = '1' and clk'event and clk = '1' then
			dout_int(6 downto 0) <= dout_int(7 downto 1) ;
		end if ;
	end process ;
	process (clk, rst) begin
		if rst = '1' then
			dout_int(7) <= '0' ;
		elsif ena = '1' and clk'event and clk = '1' then
			dout_int(7) <= sin ;
		end if ;
	end process ;

	-- components instanciations
	count0to39_0 : count0to39 port map (rst, clk, en, bit(5 downto 0)) ;
	decoder6to64_1 : decoder6to64 port map (bit(5 downto 0), dbit(63 downto 0)) ;

end synthesis;
