library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sequencer is
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
	);
end sequencer;

architecture synthesis of sequencer is

	-- submodules declarations
	component eq4
		port (
			a : in std_logic_vector (3 downto 0) ;
			b : in std_logic_vector (3 downto 0) ;
			equal : out std_logic
		) ;
	end component ;

	-- internal signals declarations
	signal state : std_logic_vector (3 downto 0) ;
	signal stated : std_logic_vector (3 downto 0) ;
	signal is_fetch : std_logic ;
	signal is_memw1st : std_logic ;
	signal is_memw2st : std_logic ;
	signal is_memr1st : std_logic ;
	signal is_regr1st : std_logic ;
	signal is_regw1st : std_logic ;
	signal is_step : std_logic ;
	signal is_decode : std_logic ;
	signal is_pcplus1 : std_logic ;
	signal is_calc_imm : std_logic ;
	signal is_branch : std_logic ;
	signal is_addr_imm : std_logic ;
	signal is_addr : std_logic ;
	signal memwritecmd : std_logic ;
	signal memreadcmd : std_logic ;
	signal regreadcmd : std_logic ;
	signal regwritecmd : std_logic ;
	signal stepcmd : std_logic ;
	signal cond : std_logic ;
	signal wdreg : std_logic_vector (4 downto 0) ;
	signal wdregwr : std_logic ;
	signal a : std_logic ;
	signal b : std_logic ;
	signal e : std_logic ;
	signal d : std_logic ;
	signal ba : std_logic ;
	signal beq : std_logic ;
	signal bne : std_logic ;
	signal bneg : std_logic ;
	signal bpos : std_logic ;
	signal bcs : std_logic ;
	signal bcc : std_logic ;
	signal bvs : std_logic ;
	signal bvc : std_logic ;
	signal bg : std_logic ;
	signal bge : std_logic ;
	signal bl : std_logic ;
	signal ble : std_logic ;
	signal bgu : std_logic ;
	signal bleu : std_logic ;
	signal isba : std_logic ;
	signal isbeq : std_logic ;
	signal isbne : std_logic ;
	signal isbneg : std_logic ;
	signal isbpos : std_logic ;
	signal isbcs : std_logic ;
	signal isbcc : std_logic ;
	signal isbvs : std_logic ;
	signal isbvc : std_logic ;
	signal isbg : std_logic ;
	signal isbge : std_logic ;
	signal isbl : std_logic ;
	signal isble : std_logic ;
	signal isbgu : std_logic ;
	signal isbleu : std_logic ;

begin

	-- concurrent statements
	is_fetch <= (not state(3)) and (not state(2)) and (not state(1)) and (not state(0)) ;
	is_memw1st <= (not state(3)) and (not state(2)) and (not state(1)) and state(0) ;
	is_memw2st <= (not state(3)) and (not state(2)) and state(1) and (not state(0)) ;
	is_memr1st <= (not state(3)) and (not state(2)) and state(1) and state(0) ;
	is_regr1st <= (not state(3)) and state(2) and (not state(1)) and (not state(0)) ;
	is_regw1st <= (not state(3)) and state(2) and (not state(1)) and state(0) ;
	is_step <= (not state(3)) and state(2) and state(1) and (not state(0)) ;
	is_decode <= (not state(3)) and state(2) and state(1) and state(0) ;
	is_pcplus1 <= state(3) and (not state(2)) and (not state(1)) and (not state(0)) ;
	is_calc_imm <= state(3) and (not state(2)) and (not state(1)) and state(0) ;
	is_branch <= state(3) and (not state(2)) and state(1) and (not state(0)) ;
	is_addr_imm <= state(3) and (not state(2)) and state(1) and state(0) ;
	is_addr <= state(3) and state(2) and (not state(1)) and (not state(0)) ;
	stated(3 downto 0) <= 
		("0001" and (is_fetch&is_fetch&is_fetch&is_fetch) and (mon_req&mon_req&mon_req&mon_req) and (memwritecmd&memwritecmd&memwritecmd&memwritecmd)) or
		("0001" and (is_memw1st&is_memw1st&is_memw1st&is_memw1st) and (mon_req&mon_req&mon_req&mon_req)) or
		("0010" and (is_memw1st&is_memw1st&is_memw1st&is_memw1st) and ((not mon_req)&(not mon_req)&(not mon_req)&(not mon_req))) or
		("0000" and (is_memw2st&is_memw2st&is_memw2st&is_memw2st)) or
		("0011" and (is_fetch&is_fetch&is_fetch&is_fetch) and (mon_req&mon_req&mon_req&mon_req) and (memreadcmd&memreadcmd&memreadcmd&memreadcmd)) or
		("0011" and (is_memr1st&is_memr1st&is_memr1st&is_memr1st) and (mon_req&mon_req&mon_req&mon_req)) or
		("0000" and (is_memr1st&is_memr1st&is_memr1st&is_memr1st) and ((not mon_req)&(not mon_req)&(not mon_req)&(not mon_req))) or
		("0100" and (is_fetch&is_fetch&is_fetch&is_fetch) and (mon_req&mon_req&mon_req&mon_req) and (regreadcmd&regreadcmd&regreadcmd&regreadcmd)) or
		("0100" and (is_regr1st&is_regr1st&is_regr1st&is_regr1st) and (mon_req&mon_req&mon_req&mon_req)) or
		("0000" and (is_regr1st&is_regr1st&is_regr1st&is_regr1st) and ((not mon_req)&(not mon_req)&(not mon_req)&(not mon_req))) or
		("0101" and (is_fetch&is_fetch&is_fetch&is_fetch) and (mon_req&mon_req&mon_req&mon_req) and (regwritecmd&regwritecmd&regwritecmd&regwritecmd)) or
		("0101" and (is_regw1st&is_regw1st&is_regw1st&is_regw1st) and (mon_req&mon_req&mon_req&mon_req)) or
		("0000" and (is_regw1st&is_regw1st&is_regw1st&is_regw1st) and ((not mon_req)&(not mon_req)&(not mon_req)&(not mon_req))) or
		("0000" and (is_fetch&is_fetch&is_fetch&is_fetch) and ((not mon_req)&(not mon_req)&(not mon_req)&(not mon_req)) and ((not it)&(not it)&(not it)&(not it)) and ((not run)&(not run)&(not run)&(not run))) or
		("0000" and (is_fetch&is_fetch&is_fetch&is_fetch) and ((not mon_req)&(not mon_req)&(not mon_req)&(not mon_req)) and ((not it)&(not it)&(not it)&(not it)) and (break&break&break&break)) or
		("0110" and (is_fetch&is_fetch&is_fetch&is_fetch) and (mon_req&mon_req&mon_req&mon_req) and (stepcmd&stepcmd&stepcmd&stepcmd)) or
		("0110" and (is_step&is_step&is_step&is_step) and (mon_req&mon_req&mon_req&mon_req)) or
		("0111" and (is_step&is_step&is_step&is_step) and ((not mon_req)&(not mon_req)&(not mon_req)&(not mon_req))) or
		("0111" and (is_fetch&is_fetch&is_fetch&is_fetch) and (run&run&run&run) and ((not mon_req)&(not mon_req)&(not mon_req)&(not mon_req)) and ((not break)&(not break)&(not break)&(not break)) and ((not it)&(not it)&(not it)&(not it))) or
		("1000" and (is_decode&is_decode&is_decode&is_decode) and (ir(31)&ir(31)&ir(31)&ir(31)) and ((not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))) and ((not ir(13))&(not ir(13))&(not ir(13))&(not ir(13)))) or
		("1001" and (is_decode&is_decode&is_decode&is_decode) and (ir(31)&ir(31)&ir(31)&ir(31)) and ((not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))) and (ir(13)&ir(13)&ir(13)&ir(13))) or
		("1000" and (is_calc_imm&is_calc_imm&is_calc_imm&is_calc_imm)) or
		("0000" and (is_pcplus1&is_pcplus1&is_pcplus1&is_pcplus1)) or
		("0000" and (is_decode&is_decode&is_decode&is_decode) and ((not cond)&(not cond)&(not cond)&(not cond)) and ((not ir(31))&(not ir(31))&(not ir(31))&(not ir(31))) and ((not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))) and (ir(29)&ir(29)&ir(29)&ir(29))) or
		("1010" and (is_decode&is_decode&is_decode&is_decode) and (cond&cond&cond&cond) and ((not ir(31))&(not ir(31))&(not ir(31))&(not ir(31))) and ((not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))) and (ir(29)&ir(29)&ir(29)&ir(29))) or
		("0000" and (is_branch&is_branch&is_branch&is_branch)) or
		("1011" and (is_decode&is_decode&is_decode&is_decode) and (ir(31)&ir(31)&ir(31)&ir(31)) and (ir(30)&ir(30)&ir(30)&ir(30)) and (ir(13)&ir(13)&ir(13)&ir(13))) or
		("1100" and (is_decode&is_decode&is_decode&is_decode) and (ir(31)&ir(31)&ir(31)&ir(31)) and (ir(30)&ir(30)&ir(30)&ir(30)) and ((not ir(13))&(not ir(13))&(not ir(13))&(not ir(13)))) or
		("1100" and (is_addr_imm&is_addr_imm&is_addr_imm&is_addr_imm) and (ir(31)&ir(31)&ir(31)&ir(31)) and (ir(30)&ir(30)&ir(30)&ir(30)) and ((not ir(13))&(not ir(13))&(not ir(13))&(not ir(13)))) or
		("1000" and (is_addr&is_addr&is_addr&is_addr) and (ir(21)&ir(21)&ir(21)&ir(21))) or
		("1000" and (is_addr&is_addr&is_addr&is_addr) and ((not ir(21))&(not ir(21))&(not ir(21))&(not ir(21)))) or
		("1000" and (is_decode&is_decode&is_decode&is_decode) and ((not ir(29))&(not ir(29))&(not ir(29))&(not ir(29))) and ((not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))) and ((not ir(31))&(not ir(31))&(not ir(31))&(not ir(31)))) ;
	write <= (is_memw2st and '1') or (is_addr and ir(21) and '1') ;
	oe_num(1 downto 0) <= 
		("11" and (is_fetch&is_fetch) and (mon_req&mon_req) and (memwritecmd&memwritecmd)) or
		("11" and (is_memw1st&is_memw1st) and ((not mon_req)&(not mon_req))) or
		("01" and (is_memw2st&is_memw2st)) or
		("11" and (is_fetch&is_fetch) and (mon_req&mon_req) and (memreadcmd&memreadcmd)) or
		("10" and (is_memr1st&is_memr1st) and (mon_req&mon_req)) or
		("01" and (is_fetch&is_fetch) and (mon_req&mon_req) and (regreadcmd&regreadcmd)) or
		("01" and (is_regr1st&is_regr1st) and (mon_req&mon_req)) or
		("11" and (is_regw1st&is_regw1st) and ((not mon_req)&(not mon_req))) or
		("10" and (is_step&is_step) and ((not mon_req)&(not mon_req))) or
		("10" and (is_fetch&is_fetch) and (run&run) and ((not mon_req)&(not mon_req)) and ((not break)&(not break)) and ((not it)&(not it))) or
		("01" and (is_decode&is_decode) and (ir(31)&ir(31)) and ((not ir(30))&(not ir(30))) and ((not ir(13))&(not ir(13)))) or
		("01" and (is_decode&is_decode) and (ir(31)&ir(31)) and ((not ir(30))&(not ir(30))) and (ir(13)&ir(13))) or
		("01" and (is_calc_imm&is_calc_imm)) or
		("01" and (is_pcplus1&is_pcplus1)) or
		("01" and (is_decode&is_decode) and ((not cond)&(not cond)) and ((not ir(31))&(not ir(31))) and ((not ir(30))&(not ir(30))) and (ir(29)&ir(29))) or
		("01" and (is_decode&is_decode) and (cond&cond) and ((not ir(31))&(not ir(31))) and ((not ir(30))&(not ir(30))) and (ir(29)&ir(29))) or
		("01" and (is_branch&is_branch)) or
		("01" and (is_decode&is_decode) and (ir(31)&ir(31)) and (ir(30)&ir(30)) and (ir(13)&ir(13))) or
		("01" and (is_decode&is_decode) and (ir(31)&ir(31)) and (ir(30)&ir(30)) and ((not ir(13))&(not ir(13)))) or
		("01" and (is_addr_imm&is_addr_imm) and (ir(31)&ir(31)) and (ir(30)&ir(30)) and ((not ir(13))&(not ir(13)))) or
		("01" and (is_addr&is_addr) and (ir(21)&ir(21))) or
		("10" and (is_addr&is_addr) and ((not ir(21))&(not ir(21)))) or
		("01" and (is_decode&is_decode) and ((not ir(29))&(not ir(29))) and ((not ir(30))&(not ir(30))) and ((not ir(31))&(not ir(31)))) ;
	areg(4 downto 0) <= 
		("10101" and (is_memw2st&is_memw2st&is_memw2st&is_memw2st&is_memw2st)) or
		("10101" and (is_memr1st&is_memr1st&is_memr1st&is_memr1st&is_memr1st) and (mon_req&mon_req&mon_req&mon_req&mon_req)) or
		("11110" and (is_step&is_step&is_step&is_step&is_step) and ((not mon_req)&(not mon_req)&(not mon_req)&(not mon_req)&(not mon_req))) or
		("11110" and (is_fetch&is_fetch&is_fetch&is_fetch&is_fetch) and (run&run&run&run&run) and ((not mon_req)&(not mon_req)&(not mon_req)&(not mon_req)&(not mon_req)) and ((not break)&(not break)&(not break)&(not break)&(not break)) and ((not it)&(not it)&(not it)&(not it)&(not it))) or
		(ir(18 downto 14) and (is_decode&is_decode&is_decode&is_decode&is_decode) and (ir(31)&ir(31)&ir(31)&ir(31)&ir(31)) and ((not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))) and ((not ir(13))&(not ir(13))&(not ir(13))&(not ir(13))&(not ir(13)))) or
		("11111" and (is_decode&is_decode&is_decode&is_decode&is_decode) and (ir(31)&ir(31)&ir(31)&ir(31)&ir(31)) and ((not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))) and (ir(13)&ir(13)&ir(13)&ir(13)&ir(13))) or
		(ir(18 downto 14) and (is_calc_imm&is_calc_imm&is_calc_imm&is_calc_imm&is_calc_imm)) or
		("11110" and (is_pcplus1&is_pcplus1&is_pcplus1&is_pcplus1&is_pcplus1)) or
		("11110" and (is_decode&is_decode&is_decode&is_decode&is_decode) and ((not cond)&(not cond)&(not cond)&(not cond)&(not cond)) and ((not ir(31))&(not ir(31))&(not ir(31))&(not ir(31))&(not ir(31))) and ((not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))) and (ir(29)&ir(29)&ir(29)&ir(29)&ir(29))) or
		("11111" and (is_decode&is_decode&is_decode&is_decode&is_decode) and (cond&cond&cond&cond&cond) and ((not ir(31))&(not ir(31))&(not ir(31))&(not ir(31))&(not ir(31))) and ((not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))) and (ir(29)&ir(29)&ir(29)&ir(29)&ir(29))) or
		("11110" and (is_branch&is_branch&is_branch&is_branch&is_branch)) or
		("11111" and (is_decode&is_decode&is_decode&is_decode&is_decode) and (ir(31)&ir(31)&ir(31)&ir(31)&ir(31)) and (ir(30)&ir(30)&ir(30)&ir(30)&ir(30)) and (ir(13)&ir(13)&ir(13)&ir(13)&ir(13))) or
		(ir(18 downto 14) and (is_decode&is_decode&is_decode&is_decode&is_decode) and (ir(31)&ir(31)&ir(31)&ir(31)&ir(31)) and (ir(30)&ir(30)&ir(30)&ir(30)&ir(30)) and ((not ir(13))&(not ir(13))&(not ir(13))&(not ir(13))&(not ir(13)))) or
		(ir(18 downto 14) and (is_addr_imm&is_addr_imm&is_addr_imm&is_addr_imm&is_addr_imm) and (ir(31)&ir(31)&ir(31)&ir(31)&ir(31)) and (ir(30)&ir(30)&ir(30)&ir(30)&ir(30)) and ((not ir(13))&(not ir(13))&(not ir(13))&(not ir(13))&(not ir(13)))) or
		("10101" and (is_addr&is_addr&is_addr&is_addr&is_addr) and (ir(21)&ir(21)&ir(21)&ir(21)&ir(21))) or
		("10101" and (is_addr&is_addr&is_addr&is_addr&is_addr) and ((not ir(21))&(not ir(21))&(not ir(21))&(not ir(21))&(not ir(21)))) or
		("11111" and (is_decode&is_decode&is_decode&is_decode&is_decode) and ((not ir(29))&(not ir(29))&(not ir(29))&(not ir(29))&(not ir(29))) and ((not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))) and ((not ir(31))&(not ir(31))&(not ir(31))&(not ir(31))&(not ir(31)))) ;
	breg(4 downto 0) <= 
		("10110" and (is_memw2st&is_memw2st&is_memw2st&is_memw2st&is_memw2st)) or
		(monitor(4 downto 0) and (is_fetch&is_fetch&is_fetch&is_fetch&is_fetch) and (mon_req&mon_req&mon_req&mon_req&mon_req) and (regreadcmd&regreadcmd&regreadcmd&regreadcmd&regreadcmd)) or
		(monitor(4 downto 0) and (is_regr1st&is_regr1st&is_regr1st&is_regr1st&is_regr1st) and (mon_req&mon_req&mon_req&mon_req&mon_req)) or
		(ir(4 downto 0) and (is_decode&is_decode&is_decode&is_decode&is_decode) and (ir(31)&ir(31)&ir(31)&ir(31)&ir(31)) and ((not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))) and ((not ir(13))&(not ir(13))&(not ir(13))&(not ir(13))&(not ir(13)))) or
		("10101" and (is_calc_imm&is_calc_imm&is_calc_imm&is_calc_imm&is_calc_imm)) or
		("10100" and (is_pcplus1&is_pcplus1&is_pcplus1&is_pcplus1&is_pcplus1)) or
		("10100" and (is_decode&is_decode&is_decode&is_decode&is_decode) and ((not cond)&(not cond)&(not cond)&(not cond)&(not cond)) and ((not ir(31))&(not ir(31))&(not ir(31))&(not ir(31))&(not ir(31))) and ((not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))) and (ir(29)&ir(29)&ir(29)&ir(29)&ir(29))) or
		("10101" and (is_branch&is_branch&is_branch&is_branch&is_branch)) or
		(ir(4 downto 0) and (is_decode&is_decode&is_decode&is_decode&is_decode) and (ir(31)&ir(31)&ir(31)&ir(31)&ir(31)) and (ir(30)&ir(30)&ir(30)&ir(30)&ir(30)) and ((not ir(13))&(not ir(13))&(not ir(13))&(not ir(13))&(not ir(13)))) or
		("10101" and (is_addr_imm&is_addr_imm&is_addr_imm&is_addr_imm&is_addr_imm) and (ir(31)&ir(31)&ir(31)&ir(31)&ir(31)) and (ir(30)&ir(30)&ir(30)&ir(30)&ir(30)) and ((not ir(13))&(not ir(13))&(not ir(13))&(not ir(13))&(not ir(13)))) or
		(ir(29 downto 25) and (is_addr&is_addr&is_addr&is_addr&is_addr) and (ir(21)&ir(21)&ir(21)&ir(21)&ir(21))) ;
	dreg(4 downto 0) <= 
		("10101" and (is_fetch&is_fetch&is_fetch&is_fetch&is_fetch) and (mon_req&mon_req&mon_req&mon_req&mon_req) and (memwritecmd&memwritecmd&memwritecmd&memwritecmd&memwritecmd)) or
		("10110" and (is_memw1st&is_memw1st&is_memw1st&is_memw1st&is_memw1st) and ((not mon_req)&(not mon_req)&(not mon_req)&(not mon_req)&(not mon_req))) or
		("10101" and (is_fetch&is_fetch&is_fetch&is_fetch&is_fetch) and (mon_req&mon_req&mon_req&mon_req&mon_req) and (memreadcmd&memreadcmd&memreadcmd&memreadcmd&memreadcmd)) or
		(wdreg(4 downto 0) and (is_regw1st&is_regw1st&is_regw1st&is_regw1st&is_regw1st) and ((not mon_req)&(not mon_req)&(not mon_req)&(not mon_req)&(not mon_req))) or
		("11111" and (is_step&is_step&is_step&is_step&is_step) and ((not mon_req)&(not mon_req)&(not mon_req)&(not mon_req)&(not mon_req))) or
		("11111" and (is_fetch&is_fetch&is_fetch&is_fetch&is_fetch) and (run&run&run&run&run) and ((not mon_req)&(not mon_req)&(not mon_req)&(not mon_req)&(not mon_req)) and ((not break)&(not break)&(not break)&(not break)&(not break)) and ((not it)&(not it)&(not it)&(not it)&(not it))) or
		(ir(29 downto 25) and (is_decode&is_decode&is_decode&is_decode&is_decode) and (ir(31)&ir(31)&ir(31)&ir(31)&ir(31)) and ((not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))) and ((not ir(13))&(not ir(13))&(not ir(13))&(not ir(13))&(not ir(13)))) or
		("10101" and (is_decode&is_decode&is_decode&is_decode&is_decode) and (ir(31)&ir(31)&ir(31)&ir(31)&ir(31)) and ((not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))) and (ir(13)&ir(13)&ir(13)&ir(13)&ir(13))) or
		(ir(29 downto 25) and (is_calc_imm&is_calc_imm&is_calc_imm&is_calc_imm&is_calc_imm)) or
		("11110" and (is_pcplus1&is_pcplus1&is_pcplus1&is_pcplus1&is_pcplus1)) or
		("11110" and (is_decode&is_decode&is_decode&is_decode&is_decode) and ((not cond)&(not cond)&(not cond)&(not cond)&(not cond)) and ((not ir(31))&(not ir(31))&(not ir(31))&(not ir(31))&(not ir(31))) and ((not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))) and (ir(29)&ir(29)&ir(29)&ir(29)&ir(29))) or
		("10101" and (is_decode&is_decode&is_decode&is_decode&is_decode) and (cond&cond&cond&cond&cond) and ((not ir(31))&(not ir(31))&(not ir(31))&(not ir(31))&(not ir(31))) and ((not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))) and (ir(29)&ir(29)&ir(29)&ir(29)&ir(29))) or
		("11110" and (is_branch&is_branch&is_branch&is_branch&is_branch)) or
		("10101" and (is_decode&is_decode&is_decode&is_decode&is_decode) and (ir(31)&ir(31)&ir(31)&ir(31)&ir(31)) and (ir(30)&ir(30)&ir(30)&ir(30)&ir(30)) and (ir(13)&ir(13)&ir(13)&ir(13)&ir(13))) or
		("10101" and (is_decode&is_decode&is_decode&is_decode&is_decode) and (ir(31)&ir(31)&ir(31)&ir(31)&ir(31)) and (ir(30)&ir(30)&ir(30)&ir(30)&ir(30)) and ((not ir(13))&(not ir(13))&(not ir(13))&(not ir(13))&(not ir(13)))) or
		("10101" and (is_addr_imm&is_addr_imm&is_addr_imm&is_addr_imm&is_addr_imm) and (ir(31)&ir(31)&ir(31)&ir(31)&ir(31)) and (ir(30)&ir(30)&ir(30)&ir(30)&ir(30)) and ((not ir(13))&(not ir(13))&(not ir(13))&(not ir(13))&(not ir(13)))) or
		(ir(29 downto 25) and (is_addr&is_addr&is_addr&is_addr&is_addr) and ((not ir(21))&(not ir(21))&(not ir(21))&(not ir(21))&(not ir(21)))) or
		(ir(28 downto 24) and (is_decode&is_decode&is_decode&is_decode&is_decode) and ((not ir(29))&(not ir(29))&(not ir(29))&(not ir(29))&(not ir(29))) and ((not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))) and ((not ir(31))&(not ir(31))&(not ir(31))&(not ir(31))&(not ir(31)))) ;
	cmd_ual(5 downto 0) <= 
		("101000" and (is_memw2st&is_memw2st&is_memw2st&is_memw2st&is_memw2st&is_memw2st)) or
		("101000" and (is_fetch&is_fetch&is_fetch&is_fetch&is_fetch&is_fetch) and (mon_req&mon_req&mon_req&mon_req&mon_req&mon_req) and (regreadcmd&regreadcmd&regreadcmd&regreadcmd&regreadcmd&regreadcmd)) or
		("101000" and (is_regr1st&is_regr1st&is_regr1st&is_regr1st&is_regr1st&is_regr1st) and (mon_req&mon_req&mon_req&mon_req&mon_req&mon_req)) or
		(ir(24 downto 19) and (is_decode&is_decode&is_decode&is_decode&is_decode&is_decode) and (ir(31)&ir(31)&ir(31)&ir(31)&ir(31)&ir(31)) and ((not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))) and ((not ir(13))&(not ir(13))&(not ir(13))&(not ir(13))&(not ir(13))&(not ir(13)))) or
		("100000" and (is_decode&is_decode&is_decode&is_decode&is_decode&is_decode) and (ir(31)&ir(31)&ir(31)&ir(31)&ir(31)&ir(31)) and ((not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))) and (ir(13)&ir(13)&ir(13)&ir(13)&ir(13)&ir(13))) or
		(ir(24 downto 19) and (is_calc_imm&is_calc_imm&is_calc_imm&is_calc_imm&is_calc_imm&is_calc_imm)) or
		("100001" and (is_decode&is_decode&is_decode&is_decode&is_decode&is_decode) and (cond&cond&cond&cond&cond&cond) and ((not ir(31))&(not ir(31))&(not ir(31))&(not ir(31))&(not ir(31))&(not ir(31))) and ((not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))) and (ir(29)&ir(29)&ir(29)&ir(29)&ir(29)&ir(29))) or
		("100000" and (is_decode&is_decode&is_decode&is_decode&is_decode&is_decode) and (ir(31)&ir(31)&ir(31)&ir(31)&ir(31)&ir(31)) and (ir(30)&ir(30)&ir(30)&ir(30)&ir(30)&ir(30)) and (ir(13)&ir(13)&ir(13)&ir(13)&ir(13)&ir(13))) or
		("101000" and (is_addr&is_addr&is_addr&is_addr&is_addr&is_addr) and (ir(21)&ir(21)&ir(21)&ir(21)&ir(21)&ir(21))) or
		("100011" and (is_decode&is_decode&is_decode&is_decode&is_decode&is_decode) and ((not ir(29))&(not ir(29))&(not ir(29))&(not ir(29))&(not ir(29))&(not ir(29))) and ((not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))&(not ir(30))) and ((not ir(31))&(not ir(31))&(not ir(31))&(not ir(31))&(not ir(31))&(not ir(31)))) ;
	wdregwr <= is_fetch and mon_req and regwritecmd ;
	mon_ack <= (is_memw1st) or (is_memr1st and mon_req) or (is_regr1st and mon_req) or (is_regw1st and mon_req) ;
	a <= ir(28) ;
	b <= ir(27) ;
	e <= ir(26) ;
	d <= ir(25) ;
	ba <= '1' ;
	beq <= z ;
	bne <= not z ;
	bneg <= n ;
	bpos <= not n ;
	bcs <= c ;
	bcc <= not c ;
	bvs <= v ;
	bvc <= not v ;
	bg <= ((not z) and v and n) or ((not z) and (not v) and (not n)) ;
	bge <= (v and n) or ((not v) and (not n)) ;
	bl <= (n and (not v)) or ((not n) and v) ;
	ble <= (z) or (n and (not v)) or ((not n) and v) ;
	bgu <= (not z) or (not c) ;
	bleu <= (z) or (c) ;
	isba <= a and (not b) and (not e) and (not d) ;
	isbeq <= (not a) and (not b) and (not e) and d ;
	isbne <= a and (not b) and (not e) and d ;
	isbneg <= (not a) and b and e and (not d) ;
	isbpos <= a and b and e and (not d) ;
	isbcs <= (not a) and b and (not e) and d ;
	isbcc <= a and b and (not e) and d ;
	isbvs <= (not a) and b and e and d ;
	isbvc <= a and b and e and d ;
	isbg <= a and (not b) and e and (not d) ;
	isbge <= a and (not b) and e and d ;
	isbl <= (not a) and (not b) and e and d ;
	isble <= (not a) and (not b) and e and (not d) ;
	isbgu <= a and b and (not e) and (not d) ;
	isbleu <= (not a) and b and (not e) and (not d) ;
	cond <= (ba and isba) or (beq and isbeq) or (bne and isbne) or (bneg and isbneg) or (bpos and isbpos) or (bcs and isbcs) or (bcc and isbcc) or (bvs and isbvs) or (bvc and isbvc) or (bg and isbg) or (bge and isbge) or (bl and isbl) or (ble and isble) or (bgu and isbgu) or (bleu and isbleu) ;

	-- sequential statements
	process (clk, rst) begin
		if rst = '1' then
			state(3 downto 0) <= "0000" ;
		elsif clk'event and clk = '1' then
			state(3 downto 0) <= stated(3 downto 0) ;
		end if ;
	end process ;
	process (clk, rst) begin
		if rst = '1' then
			wdreg(4 downto 0) <= "00000" ;
		elsif wdregwr = '1' and clk'event and clk = '1' then
			wdreg(4 downto 0) <= monitor(36 downto 32) ;
		end if ;
	end process ;

	-- components instanciations
	eq4_0 : eq4 port map (mon_cmd(3 downto 0), "0000", memreadcmd) ;
	eq4_1 : eq4 port map (mon_cmd(3 downto 0), "0001", regreadcmd) ;
	eq4_2 : eq4 port map (mon_cmd(3 downto 0), "0010", memwritecmd) ;
	eq4_3 : eq4 port map (mon_cmd(3 downto 0), "0011", regwritecmd) ;
	eq4_4 : eq4 port map (mon_cmd(3 downto 0), "0100", stepcmd) ;

end synthesis;
