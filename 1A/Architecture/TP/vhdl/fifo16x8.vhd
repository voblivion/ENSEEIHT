library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity fifo16x8 is
	port (
		rst : in std_logic ;
		clk : in std_logic ;
		put : in std_logic ;
		get : in std_logic ;
		din : in std_logic_vector (7 downto 0) ;
		dout : out std_logic_vector (7 downto 0) ;
		empty : out std_logic ;
		full : out std_logic
	);
end fifo16x8;

architecture synthesis of fifo16x8 is

	-- submodules declarations
	component rams_dual_asyn_read16x8
		port (
			clk  : in std_logic;
			we  : in std_logic;
			waddr  : in std_logic_vector(3 downto 0);
			raddr  : in std_logic_vector(3 downto 0);
			di  : in std_logic_vector(7 downto 0);
			wdo  : out std_logic_vector(7 downto 0);
			rdo  : out std_logic_vector(7 downto 0)
		) ;
	end component ;
	component count4
		port (
			rst : in std_logic ;
			clk : in std_logic ;
			en : in std_logic ;
			s : out std_logic_vector (3 downto 0)
		) ;
	end component ;
	component lastFull
		port (
			w : in std_logic_vector (3 downto 0) ;
			r : in std_logic_vector (3 downto 0) ;
			s : out std_logic
		) ;
	end component ;
	component lastEmpty
		port (
			w : in std_logic_vector (3 downto 0) ;
			r : in std_logic_vector (3 downto 0) ;
			s : out std_logic
		) ;
	end component ;

	-- buffer signals declarations
	signal empty_int : std_logic ;
	signal full_int : std_logic ;

	-- internal signals declarations
	signal incwraddr : std_logic ;
	signal wraddr : std_logic_vector (3 downto 0) ;
	signal rdaddr : std_logic_vector (3 downto 0) ;
	signal doutwr : std_logic_vector (7 downto 0) ;
	signal incrdaddr : std_logic ;
	signal lfull : std_logic ;
	signal lempty : std_logic ;
	signal tfull : std_logic ;
	signal tempty : std_logic ;
	signal nempty : std_logic ;

begin

	-- buffer signals assignations
	empty <= empty_int ;
	full <= full_int ;

	-- concurrent statements
	incwraddr <= put and (not full_int) ;
	incrdaddr <= get and (not empty_int) ;
	tfull <= (put and lfull and (not get)) or (full_int and (not get)) ;
	tempty <= (get and lempty and (not put)) or (empty_int and (not put)) ;
	empty_int <= not nempty ;

	-- sequential statements
	process (clk, rst) begin
		if rst = '1' then
			full_int <= '0' ;
		elsif clk'event and clk = '1' then
			full_int <= tfull ;
		end if ;
	end process ;
	process (clk, rst) begin
		if rst = '1' then
			nempty <= '0' ;
		elsif clk'event and clk = '1' then
			nempty <= not tempty ;
		end if ;
	end process ;

	-- components instanciations
	rams_dual_asyn_read16x8_0 : rams_dual_asyn_read16x8 port map (clk, incwraddr, wraddr(3 downto 0), rdaddr(3 downto 0), din(7 downto 0), doutwr(7 downto 0), dout(7 downto 0)) ;
	count4_1 : count4 port map (rst, clk, incwraddr, wraddr(3 downto 0)) ;
	count4_2 : count4 port map (rst, clk, incrdaddr, rdaddr(3 downto 0)) ;
	lastFull_3 : lastFull port map (wraddr(3 downto 0), rdaddr(3 downto 0), lfull) ;
	lastEmpty_4 : lastEmpty port map (wraddr(3 downto 0), rdaddr(3 downto 0), lempty) ;

end synthesis;
