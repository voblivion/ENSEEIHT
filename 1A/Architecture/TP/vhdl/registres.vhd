library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity registres is
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
	);
end registres;

architecture synthesis of registres is

	-- submodules declarations
	component decoder5to32
		port (
			e : in std_logic_vector (4 downto 0) ;
			s : out std_logic_vector (31 downto 0)
		) ;
	end component ;
	component reg32
		port (
			rst : in std_logic ;
			clk : in std_logic ;
			en : in std_logic ;
			d : in std_logic_vector (31 downto 0) ;
			q : out std_logic_vector (31 downto 0)
		) ;
	end component ;
	component eq32
		port (
			a : in std_logic_vector (31 downto 0) ;
			b : in std_logic_vector (31 downto 0) ;
			equal : out std_logic
		) ;
	end component ;

	-- buffer signals declarations
	signal ir_int : std_logic_vector (31 downto 0) ;

	-- internal signals declarations
	signal id : std_logic_vector (31 downto 0) ;
	signal ia : std_logic_vector (31 downto 0) ;
	signal ib : std_logic_vector (31 downto 0) ;
	signal r0 : std_logic_vector (31 downto 0) ;
	signal r1 : std_logic_vector (31 downto 0) ;
	signal r2 : std_logic_vector (31 downto 0) ;
	signal r3 : std_logic_vector (31 downto 0) ;
	signal r4 : std_logic_vector (31 downto 0) ;
	signal r5 : std_logic_vector (31 downto 0) ;
	signal r6 : std_logic_vector (31 downto 0) ;
	signal r7 : std_logic_vector (31 downto 0) ;
	signal r8 : std_logic_vector (31 downto 0) ;
	signal r9 : std_logic_vector (31 downto 0) ;
	signal r20 : std_logic_vector (31 downto 0) ;
	signal r21 : std_logic_vector (31 downto 0) ;
	signal r22 : std_logic_vector (31 downto 0) ;
	signal r26 : std_logic_vector (31 downto 0) ;
	signal r27 : std_logic_vector (31 downto 0) ;
	signal r28 : std_logic_vector (31 downto 0) ;
	signal r29 : std_logic_vector (31 downto 0) ;
	signal r30 : std_logic_vector (31 downto 0) ;

begin

	-- buffer signals assignations
	ir(31 downto 0) <= ir_int(31 downto 0) ;

	-- concurrent statements
	r0(31 downto 0) <= "00000000000000000000000000000000" ;
	r20(31 downto 0) <= "00000000000000000000000000000001" ;
	abus(31 downto 0) <= r0(31 downto 0) when ia(0) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	abus(31 downto 0) <= r1(31 downto 0) when ia(1) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	abus(31 downto 0) <= r2(31 downto 0) when ia(2) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	abus(31 downto 0) <= r3(31 downto 0) when ia(3) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	abus(31 downto 0) <= r4(31 downto 0) when ia(4) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	abus(31 downto 0) <= r5(31 downto 0) when ia(5) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	abus(31 downto 0) <= r6(31 downto 0) when ia(6) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	abus(31 downto 0) <= r7(31 downto 0) when ia(7) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	abus(31 downto 0) <= r8(31 downto 0) when ia(8) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	abus(31 downto 0) <= r9(31 downto 0) when ia(9) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	abus(31 downto 0) <= r20(31 downto 0) when ia(20) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	abus(31 downto 0) <= r21(31 downto 0) when ia(21) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	abus(31 downto 0) <= r22(31 downto 0) when ia(22) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	abus(31 downto 0) <= r26(31 downto 0) when ia(26) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	abus(31 downto 0) <= r27(31 downto 0) when ia(27) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	abus(31 downto 0) <= r28(31 downto 0) when ia(28) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	abus(31 downto 0) <= r29(31 downto 0) when ia(29) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	abus(31 downto 0) <= r30(31 downto 0) when ia(30) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	abus(31 downto 0) <= ir_int(31 downto 0) when ia(31) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	bbus(31 downto 0) <= r0(31 downto 0) when ib(0) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	bbus(31 downto 0) <= r1(31 downto 0) when ib(1) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	bbus(31 downto 0) <= r2(31 downto 0) when ib(2) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	bbus(31 downto 0) <= r3(31 downto 0) when ib(3) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	bbus(31 downto 0) <= r4(31 downto 0) when ib(4) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	bbus(31 downto 0) <= r5(31 downto 0) when ib(5) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	bbus(31 downto 0) <= r6(31 downto 0) when ib(6) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	bbus(31 downto 0) <= r7(31 downto 0) when ib(7) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	bbus(31 downto 0) <= r8(31 downto 0) when ib(8) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	bbus(31 downto 0) <= r9(31 downto 0) when ib(9) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	bbus(31 downto 0) <= r20(31 downto 0) when ib(20) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	bbus(31 downto 0) <= r21(31 downto 0) when ib(21) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	bbus(31 downto 0) <= r22(31 downto 0) when ib(22) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	bbus(31 downto 0) <= r26(31 downto 0) when ib(26) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	bbus(31 downto 0) <= r27(31 downto 0) when ib(27) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	bbus(31 downto 0) <= r28(31 downto 0) when ib(28) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	bbus(31 downto 0) <= r29(31 downto 0) when ib(29) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	bbus(31 downto 0) <= r30(31 downto 0) when ib(30) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	bbus(31 downto 0) <= ir_int(31 downto 0) when ib(31) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;

	-- components instanciations
	decoder5to32_0 : decoder5to32 port map (dreg(4 downto 0), id(31 downto 0)) ;
	decoder5to32_1 : decoder5to32 port map (areg(4 downto 0), ia(31 downto 0)) ;
	decoder5to32_2 : decoder5to32 port map (breg(4 downto 0), ib(31 downto 0)) ;
	reg32_3 : reg32 port map (rst, clk, id(1), dbus(31 downto 0), r1(31 downto 0)) ;
	reg32_4 : reg32 port map (rst, clk, id(2), dbus(31 downto 0), r2(31 downto 0)) ;
	reg32_5 : reg32 port map (rst, clk, id(3), dbus(31 downto 0), r3(31 downto 0)) ;
	reg32_6 : reg32 port map (rst, clk, id(4), dbus(31 downto 0), r4(31 downto 0)) ;
	reg32_7 : reg32 port map (rst, clk, id(5), dbus(31 downto 0), r5(31 downto 0)) ;
	reg32_8 : reg32 port map (rst, clk, id(6), dbus(31 downto 0), r6(31 downto 0)) ;
	reg32_9 : reg32 port map (rst, clk, id(7), dbus(31 downto 0), r7(31 downto 0)) ;
	reg32_10 : reg32 port map (rst, clk, id(8), dbus(31 downto 0), r8(31 downto 0)) ;
	reg32_11 : reg32 port map (rst, clk, id(9), dbus(31 downto 0), r9(31 downto 0)) ;
	reg32_12 : reg32 port map (rst, clk, id(21), dbus(31 downto 0), r21(31 downto 0)) ;
	reg32_13 : reg32 port map (rst, clk, id(22), dbus(31 downto 0), r22(31 downto 0)) ;
	reg32_14 : reg32 port map (rst, clk, id(26), dbus(31 downto 0), r26(31 downto 0)) ;
	reg32_15 : reg32 port map (rst, clk, id(27), dbus(31 downto 0), r27(31 downto 0)) ;
	reg32_16 : reg32 port map (rst, clk, id(28), dbus(31 downto 0), r28(31 downto 0)) ;
	reg32_17 : reg32 port map (rst, clk, id(29), dbus(31 downto 0), r29(31 downto 0)) ;
	reg32_18 : reg32 port map (rst, clk, id(30), dbus(31 downto 0), r30(31 downto 0)) ;
	reg32_19 : reg32 port map (rst, clk, id(31), dbus(31 downto 0), ir_int(31 downto 0)) ;
	eq32_20 : eq32 port map (r26(31 downto 0), r30(31 downto 0), break) ;

end synthesis;
