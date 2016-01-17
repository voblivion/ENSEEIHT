library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity uart_em_comm is
    port (
        mclk : in std_logic ;
        pdb : inout std_logic_vector (7 downto 0) ;
        astb : in std_logic ;
        dstb : in std_logic ;
        pwr : in std_logic ;
        pwait : out std_logic
) ;
end uart_em_comm ;

architecture synthesis of uart_em_comm is

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
	component uart_em
		port (
			rst : in std_logic ;
			clk : in std_logic ;
			data : in std_logic_vector (7 downto 0) ;
			send : in std_logic ;
			sent : out std_logic ;
			sout : out std_logic ;
			bit : out std_logic_vector (3 downto 0)
		) ;
	end component ;

    -- internal signals declarations
    signal pc2board : std_logic_vector (127 downto 0) ;
    signal board2pc : std_logic_vector (127 downto 0) ;
    signal rst : std_logic ;
    signal clk : std_logic ;
    signal data : std_logic_vector (7 downto 0) ;
    signal send : std_logic ;
    signal sent : std_logic ;
    signal sout : std_logic ;
    signal bit : std_logic_vector (3 downto 0) ;

begin

    -- combinatorial statements
    rst <= pc2board(0) ;
    clk <= pc2board(1) ;
    data(7 downto 0) <= pc2board(9 downto 2) ;
    send <= pc2board(10) ;
    board2pc(0) <= sent ;
    board2pc(1) <= sout ;
    board2pc(5 downto 2) <= bit(3 downto 0) ;

    -- components instanciations
    commUSB_0 : commUSB port map (mclk, pdb(7 downto 0), astb, dstb, pwr, pwait, pc2board(127 downto 0), board2pc(127 downto 0)) ;
    uart_em_0 : uart_em port map (rst, clk, data(7 downto 0), send, sent, sout, bit(3 downto 0)) ;


end synthesis;
