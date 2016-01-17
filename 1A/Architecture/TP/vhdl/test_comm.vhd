library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity test_comm is
    port (
        mclk : in std_logic ;
        pdb : inout std_logic_vector (7 downto 0) ;
        astb : in std_logic ;
        dstb : in std_logic ;
        pwr : in std_logic ;
        pwait : out std_logic;
        ssg : out std_logic_vector (6 downto 0) ;

        an : out std_logic_vector (3 downto 0)

) ;
end test_comm ;

architecture synthesis of test_comm is

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
	component test
		port (
			mclk : in std_logic ;
			data : in std_logic_vector (15 downto 0) ;
			ssg : out std_logic_vector (6 downto 0) ;
			an : out std_logic_vector (3 downto 0)
		) ;
	end component ;

    -- internal signals declarations
    signal pc2board : std_logic_vector (127 downto 0) ;
    signal board2pc : std_logic_vector (127 downto 0) ;
    signal data : std_logic_vector (15 downto 0) ;

begin

    -- combinatorial statements
    data(15 downto 0) <= pc2board(15 downto 0) ;

    -- components instanciations
    commUSB_0 : commUSB port map (mclk, pdb(7 downto 0), astb, dstb, pwr, pwait, pc2board(127 downto 0), board2pc(127 downto 0)) ;
    test_0 : test port map (mclk, data(15 downto 0), ssg(6 downto 0), an(3 downto 0)) ;


end synthesis;
