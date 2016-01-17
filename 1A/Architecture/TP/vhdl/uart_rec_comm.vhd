library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity uart_rec_comm is
    port (
        mclk : in std_logic ;
        pdb : inout std_logic_vector (7 downto 0) ;
        astb : in std_logic ;
        dstb : in std_logic ;
        pwr : in std_logic ;
        pwait : out std_logic
) ;
end uart_rec_comm ;

architecture synthesis of uart_rec_comm is

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
	component uart_rec
		port (
			rst : in std_logic ;
			clk : in std_logic ;
			sin : in std_logic ;
			dout : out std_logic_vector (7 downto 0) ;
			bit : out std_logic_vector (5 downto 0) ;
			rcvd : out std_logic
		) ;
	end component ;

    -- internal signals declarations
    signal pc2board : std_logic_vector (127 downto 0) ;
    signal board2pc : std_logic_vector (127 downto 0) ;
    signal rst : std_logic ;
    signal clk : std_logic ;
    signal sin : std_logic ;
    signal dout : std_logic_vector (7 downto 0) ;
    signal bit : std_logic_vector (5 downto 0) ;
    signal rcvd : std_logic ;

begin

    -- combinatorial statements
    rst <= pc2board(0) ;
    clk <= pc2board(1) ;
    sin <= pc2board(2) ;
    board2pc(7 downto 0) <= dout(7 downto 0) ;
    board2pc(13 downto 8) <= bit(5 downto 0) ;
    board2pc(14) <= rcvd ;

    -- components instanciations
    commUSB_0 : commUSB port map (mclk, pdb(7 downto 0), astb, dstb, pwr, pwait, pc2board(127 downto 0), board2pc(127 downto 0)) ;
    uart_rec_0 : uart_rec port map (rst, clk, sin, dout(7 downto 0), bit(5 downto 0), rcvd) ;


end synthesis;
