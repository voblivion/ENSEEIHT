library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity test_uart_comm is
    port (
        mclk : in std_logic ;
        pdb : inout std_logic_vector (7 downto 0) ;
        astb : in std_logic ;
        dstb : in std_logic ;
        pwr : in std_logic ;
        pwait : out std_logic;
        sw : in std_logic_vector (7 downto 0) ;

        jc_in : in std_logic_vector (0 downto 0) ;

        ja_out : out std_logic_vector (0 downto 0) ;

        an : out std_logic_vector (3 downto 0) ;

        ssg : out std_logic_vector (6 downto 0)

) ;
end test_uart_comm ;

architecture synthesis of test_uart_comm is

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
	component test_uart
		port (
			rst : in std_logic ;
			mclk : in std_logic ;
			sw : in std_logic_vector (7 downto 0) ;
			send : in std_logic ;
			jc_in : in std_logic_vector (0 downto 0) ;
			ja_out : out std_logic_vector (0 downto 0) ;
			an : out std_logic_vector (3 downto 0) ;
			ssg : out std_logic_vector (6 downto 0) ;
			rcvd : out std_logic
		) ;
	end component ;

    -- internal signals declarations
    signal pc2board : std_logic_vector (127 downto 0) ;
    signal board2pc : std_logic_vector (127 downto 0) ;
    signal rst : std_logic ;
    signal send : std_logic ;
    signal rcvd : std_logic ;

begin

    -- combinatorial statements
    rst <= pc2board(0) ;
    send <= pc2board(1) ;
    board2pc(0) <= rcvd ;

    -- components instanciations
    commUSB_0 : commUSB port map (mclk, pdb(7 downto 0), astb, dstb, pwr, pwait, pc2board(127 downto 0), board2pc(127 downto 0)) ;
    test_uart_0 : test_uart port map (rst, mclk, sw(7 downto 0), send, jc_in(0 downto 0), ja_out(0 downto 0), an(3 downto 0), ssg(6 downto 0), rcvd) ;


end synthesis;
