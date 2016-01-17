library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity fifo16x8_comm is
    port (
        mclk : in std_logic ;
        pdb : inout std_logic_vector (7 downto 0) ;
        astb : in std_logic ;
        dstb : in std_logic ;
        pwr : in std_logic ;
        pwait : out std_logic
) ;
end fifo16x8_comm ;

architecture synthesis of fifo16x8_comm is

    -- submodules declarations
    component commUSB
        port (
            mclk     : in std_logic;
            pdb      : inout std_logic_vector(7 downto 0);
            astb     : in std_logic;
            dstb     : in std_logic;
            pwr      : in std_logic;
            pwait    : out std_logic;
            pc2board : out std_logic_vector(127 downto 0);
            board2pc : in std_logic_vector(127 downto 0)
        ) ;
    end component ;
	component fifo16x8
		port (
			rst : in std_logic ;
			clk : in std_logic ;
			put : in std_logic ;
			get : in std_logic ;
			din : in std_logic_vector (7 downto 0) ;
			dout : out std_logic_vector (7 downto 0) ;
			empty : out std_logic ;
			full : out std_logic
		) ;
	end component ;

    -- internal signals declarations
    signal pc2board : std_logic_vector (127 downto 0) ;
    signal board2pc : std_logic_vector (127 downto 0) ;
    signal rst : std_logic ;
    signal clk : std_logic ;
    signal put : std_logic ;
    signal get : std_logic ;
    signal din : std_logic_vector (7 downto 0) ;
    signal dout : std_logic_vector (7 downto 0) ;
    signal empty : std_logic ;
    signal full : std_logic ;

begin

    -- combinatorial statements
    rst <= pc2board(0) ;
    clk <= pc2board(1) ;
    put <= pc2board(2) ;
    get <= pc2board(3) ;
    din(7 downto 0) <= pc2board(11 downto 4) ;
    board2pc(7 downto 0) <= dout(7 downto 0) ;
    board2pc(8) <= empty ;
    board2pc(9) <= full ;

    -- components instanciations
    commUSB_0 : commUSB port map (mclk, pdb(7 downto 0), astb, dstb, pwr, pwait, pc2board(127 downto 0), board2pc(127 downto 0)) ;
    fifo16x8_0 : fifo16x8 port map (rst, clk, put, get, din(7 downto 0), dout(7 downto 0), empty, full) ;


end synthesis;
