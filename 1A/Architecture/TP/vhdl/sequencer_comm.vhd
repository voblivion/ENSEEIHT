library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sequencer_comm is
    port (
        mclk : in std_logic ;
        pdb : inout std_logic_vector (7 downto 0) ;
        astb : in std_logic ;
        dstb : in std_logic ;
        pwr : in std_logic ;
        pwait : out std_logic
) ;
end sequencer_comm ;

architecture synthesis of sequencer_comm is

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
	component sequencer
		port (
			rst : in std_logic ;
			clk : in std_logic ;
			mon_req : in std_logic ;
			mon_cmd : in std_logic_vector (3 downto 0) ;
			monitor : in std_logic_vector (37 downto 0) ;
			break : in std_logic ;
			run : in std_logic ;
			ir : in std_logic_vector (31 downto 0) ;
			n : in std_logic ;
			z : in std_logic ;
			v : in std_logic ;
			c : in std_logic ;
			it : in std_logic ;
			write : out std_logic ;
			oe_num : out std_logic_vector (1 downto 0) ;
			areg : out std_logic_vector (4 downto 0) ;
			breg : out std_logic_vector (4 downto 0) ;
			dreg : out std_logic_vector (4 downto 0) ;
			cmd_ual : out std_logic_vector (5 downto 0) ;
			mon_ack : out std_logic
		) ;
	end component ;

    -- internal signals declarations
    signal pc2board : std_logic_vector (127 downto 0) ;
    signal board2pc : std_logic_vector (127 downto 0) ;
    signal rst : std_logic ;
    signal clk : std_logic ;
    signal mon_req : std_logic ;
    signal mon_cmd : std_logic_vector (3 downto 0) ;
    signal monitor : std_logic_vector (37 downto 0) ;
    signal break : std_logic ;
    signal run : std_logic ;
    signal ir : std_logic_vector (31 downto 0) ;
    signal n : std_logic ;
    signal z : std_logic ;
    signal v : std_logic ;
    signal c : std_logic ;
    signal it : std_logic ;
    signal write : std_logic ;
    signal oe_num : std_logic_vector (1 downto 0) ;
    signal areg : std_logic_vector (4 downto 0) ;
    signal breg : std_logic_vector (4 downto 0) ;
    signal dreg : std_logic_vector (4 downto 0) ;
    signal cmd_ual : std_logic_vector (5 downto 0) ;
    signal mon_ack : std_logic ;

begin

    -- combinatorial statements
    rst <= pc2board(0) ;
    clk <= pc2board(1) ;
    mon_req <= pc2board(2) ;
    mon_cmd(3 downto 0) <= pc2board(6 downto 3) ;
    monitor(37 downto 0) <= pc2board(44 downto 7) ;
    break <= pc2board(45) ;
    run <= pc2board(46) ;
    ir(31 downto 0) <= pc2board(78 downto 47) ;
    n <= pc2board(79) ;
    z <= pc2board(80) ;
    v <= pc2board(81) ;
    c <= pc2board(82) ;
    it <= pc2board(83) ;
    board2pc(0) <= write ;
    board2pc(2 downto 1) <= oe_num(1 downto 0) ;
    board2pc(7 downto 3) <= areg(4 downto 0) ;
    board2pc(12 downto 8) <= breg(4 downto 0) ;
    board2pc(17 downto 13) <= dreg(4 downto 0) ;
    board2pc(23 downto 18) <= cmd_ual(5 downto 0) ;
    board2pc(24) <= mon_ack ;

    -- components instanciations
    commUSB_0 : commUSB port map (mclk, pdb(7 downto 0), astb, dstb, pwr, pwait, pc2board(127 downto 0), board2pc(127 downto 0)) ;
    sequencer_0 : sequencer port map (rst, clk, mon_req, mon_cmd(3 downto 0), monitor(37 downto 0), break, run, ir(31 downto 0), n, z, v, c, it, write, oe_num(1 downto 0), areg(4 downto 0), breg(4 downto 0), dreg(4 downto 0), cmd_ual(5 downto 0), mon_ack) ;


end synthesis;
