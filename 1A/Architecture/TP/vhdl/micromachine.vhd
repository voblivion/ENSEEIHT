library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity micromachine is
	port (
		rst : in std_logic ;
		clk : in std_logic ;
		areg : in std_logic_vector (4 downto 0) ;
		breg : in std_logic_vector (4 downto 0) ;
		dreg : in std_logic_vector (4 downto 0) ;
		cmd_ual : in std_logic_vector (5 downto 0) ;
		oe_num : in std_logic_vector (1 downto 0) ;
		write : in std_logic ;
		monitor : in std_logic_vector (31 downto 0) ;
		switch : in std_logic_vector (7 downto 0) ;
		swclk : in std_logic ;
		dbus : inout std_logic_vector (31 downto 0) ;
		n : out std_logic ;
		z : out std_logic ;
		v : out std_logic ;
		c : out std_logic ;
		ir : out std_logic_vector (31 downto 0) ;
		break : out std_logic ;
		leds : out std_logic_vector (7 downto 0)
	);
end micromachine;

architecture synthesis of micromachine is

	-- submodules declarations
	component registres
		port (
			rst : in std_logic ;
			clk : in std_logic ;
			areg : in std_logic_vector (4 downto 0) ;
			breg : in std_logic_vector (4 downto 0) ;
			dreg : in std_logic_vector (4 downto 0) ;
			dbus : in std_logic_vector (31 downto 0) ;
			abus : inout std_logic_vector (31 downto 0) ;
			bbus : inout std_logic_vector (31 downto 0) ;
			ir : out std_logic_vector (31 downto 0) ;
			break : out std_logic
		) ;
	end component ;
	component decoder2to4
		port (
			e : in std_logic_vector (1 downto 0) ;
			s : out std_logic_vector (3 downto 0)
		) ;
	end component ;
	component decoder4to16
		port (
			e : in std_logic_vector (3 downto 0) ;
			s : out std_logic_vector (15 downto 0)
		) ;
	end component ;
	component rams_asyn_read512x32
		port (
			clk  : in std_logic;
			we  : in std_logic;
			addr  : in std_logic_vector(8 downto 0);
			di  : in std_logic_vector(31 downto 0);
			do  : out std_logic_vector(31 downto 0)
		) ;
	end component ;
	component ual
		port (
			a : in std_logic_vector (31 downto 0) ;
			b : in std_logic_vector (31 downto 0) ;
			cmd : in std_logic_vector (5 downto 0) ;
			s : inout std_logic_vector (31 downto 0) ;
			setn : out std_logic ;
			setz : out std_logic ;
			setvc : out std_logic ;
			n : out std_logic ;
			z : out std_logic ;
			v : out std_logic ;
			c : out std_logic
		) ;
	end component ;

	-- buffer signals declarations
	signal ir_int : std_logic_vector (31 downto 0) ;

	-- internal signals declarations
	signal abus : std_logic_vector (31 downto 0) ;
	signal bbus : std_logic_vector (31 downto 0) ;
	signal oe : std_logic_vector (3 downto 0) ;
	signal cs : std_logic_vector (15 downto 0) ;
	signal n_ual : std_logic ;
	signal setn : std_logic ;
	signal z_ual : std_logic ;
	signal setz : std_logic ;
	signal v_ual : std_logic ;
	signal setvc : std_logic ;
	signal writeram : std_logic ;
	signal writeleds : std_logic ;
	signal oemon : std_logic ;
	signal oeswi : std_logic ;
	signal oeram : std_logic ;
	signal oeual : std_logic ;
	signal dswitch : std_logic_vector (7 downto 0) ;
	signal data_out : std_logic_vector (31 downto 0) ;
	signal super_switch : std_logic_vector (31 downto 0) ;
	signal dbus_ual : std_logic_vector (31 downto 0) ;
	signal c_ual : std_logic ;

begin

	-- buffer signals assignations
	ir(31 downto 0) <= ir_int(31 downto 0) ;

	-- concurrent statements
	writeram <= write and cs(0) ;
	writeleds <= write and cs(11) ;
	oemon <= oe(3) ;
	oeswi <= oe(2) and cs(9) ;
	oeram <= oe(2) and cs(0) ;
	oeual <= oe(1) ;
	dbus(31 downto 0) <= data_out(31 downto 0) when oeram = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	dbus(31 downto 0) <= monitor(31 downto 0) when oemon = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	super_switch(31 downto 8) <= "000000000000000000000000" ;
	super_switch(7 downto 0) <= switch(7 downto 0) ;
	dbus(31 downto 0) <= super_switch(31 downto 0) when oeswi = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	dbus(31 downto 0) <= dbus_ual(31 downto 0) when oeual = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;

	-- sequential statements
	process (clk, rst) begin
		if rst = '1' then
			n <= '0' ;
		elsif setn = '1' and clk'event and clk = '1' then
			n <= n_ual ;
		end if ;
	end process ;
	process (clk, rst) begin
		if rst = '1' then
			z <= '0' ;
		elsif setz = '1' and clk'event and clk = '1' then
			z <= z_ual ;
		end if ;
	end process ;
	process (clk, rst) begin
		if rst = '1' then
			v <= '0' ;
		elsif setvc = '1' and clk'event and clk = '1' then
			v <= v_ual ;
		end if ;
	end process ;
	process (clk, rst) begin
		if rst = '1' then
			c <= '0' ;
		elsif setvc = '1' and clk'event and clk = '1' then
			c <= n_ual ;
		end if ;
	end process ;
	process (swclk, rst) begin
		if rst = '1' then
			dswitch(7 downto 0) <= "00000000" ;
		elsif swclk'event and swclk = '1' then
			dswitch(7 downto 0) <= switch(7 downto 0) ;
		end if ;
	end process ;
	process (clk, rst) begin
		if rst = '1' then
			leds(7 downto 0) <= "00000000" ;
		elsif writeleds = '1' and clk'event and clk = '1' then
			leds(7 downto 0) <= dbus(7 downto 0) ;
		end if ;
	end process ;

	-- components instanciations
	registres_0 : registres port map (rst, clk, areg(4 downto 0), breg(4 downto 0), dreg(4 downto 0), dbus(31 downto 0), abus(31 downto 0), bbus(31 downto 0), ir_int(31 downto 0), break) ;
	decoder2to4_1 : decoder2to4 port map (oe_num(1 downto 0), oe(3 downto 0)) ;
	decoder4to16_2 : decoder4to16 port map (abus(31 downto 28), cs(15 downto 0)) ;
	rams_asyn_read512x32_3 : rams_asyn_read512x32 port map (clk, writeram, abus(8 downto 0), dbus(31 downto 0), data_out(31 downto 0)) ;
	ual_4 : ual port map (abus(31 downto 0), bbus(31 downto 0), cmd_ual(5 downto 0), dbus_ual(31 downto 0), setn, setz, setvc, n_ual, z_ual, v_ual, c_ual) ;

end synthesis;
