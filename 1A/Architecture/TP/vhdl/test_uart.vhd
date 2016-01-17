library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity test_uart is
	port (
		mclk : in std_logic ;
		sw : in std_logic_vector (7 downto 0) ;
		btn : in std_logic_vector (0 downto 0) ;
		jc_in : in std_logic_vector (0 downto 0) ;
		ja_out : out std_logic_vector (0 downto 0) ;
		an : out std_logic_vector (3 downto 0) ;
		ssg : out std_logic_vector (6 downto 0) ;
		ld : out std_logic_vector (7 downto 0)
	);
end test_uart;

architecture synthesis of test_uart is

	-- submodules declarations
	component clock28
		port (
			rst : in std_logic ;
			clk : in std_logic ;
			s : out std_logic_vector (27 downto 0)
		) ;
	end component ;
	component uart_em
		port (
			rst : in std_logic ;
			clk : in std_logic ;
			data : in std_logic_vector (7 downto 0) ;
			send : in std_logic ;
			sent : out std_logic ;
			sout : out std_logic
		) ;
	end component ;
	component uart_rec
		port (
			rst : in std_logic ;
			clk : in std_logic ;
			sin : in std_logic ;
			dout : out std_logic_vector (7 downto 0) ;
			rcvd : out std_logic
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
	signal clk : std_logic_vector (27 downto 0) ;
	signal dout : std_logic_vector (7 downto 0) ;
	signal data : std_logic_vector (15 downto 0) ;
	signal nan : std_logic_vector (3 downto 0) ;
	signal nseg : std_logic_vector (6 downto 0) ;

begin

	-- concurrent statements
	data(15 downto 8) <= sw(7 downto 0) ;
	data(7 downto 0) <= dout(7 downto 0) ;
	ld(7 downto 2) <= "000000" ;
	an(3 downto 0) <= not nan(3 downto 0) ;
	ssg(6 downto 0) <= not nseg(6 downto 0) ;

	-- components instanciations
	clock28_0 : clock28 port map ('0', mclk, clk(27 downto 0)) ;
	uart_em_1 : uart_em port map ('0', clk(22), sw(7 downto 0), btn(0), ld(1), ja_out(0)) ;
	uart_rec_2 : uart_rec port map ('0', clk(20), jc_in(0), dout(7 downto 0), ld(0)) ;
	affmux_3 : affmux port map ('0', clk(16), data(15 downto 0), nan(3 downto 0), nseg(6 downto 0)) ;

end synthesis;
