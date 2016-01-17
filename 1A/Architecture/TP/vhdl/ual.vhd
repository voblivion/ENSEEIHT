library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ual is
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
	);
end ual;

architecture synthesis of ual is

	-- submodules declarations
	component decoder6to64
		port (
			e : in std_logic_vector (5 downto 0) ;
			s : out std_logic_vector (63 downto 0)
		) ;
	end component ;
	component addsub32
		port (
			a : in std_logic_vector (31 downto 0) ;
			b : in std_logic_vector (31 downto 0) ;
			sub : in std_logic ;
			s : out std_logic_vector (31 downto 0) ;
			v : out std_logic ;
			c : out std_logic
		) ;
	end component ;
	component umult16x16
		port (
			arg1  : in std_logic_vector(15 downto 0);
			arg2  : in std_logic_vector(15 downto 0);
			res  : out std_logic_vector(31 downto 0)
		) ;
	end component ;
	component barrelshifter32
		port (
			r : in std_logic ;
			nb : in std_logic_vector (4 downto 0) ;
			e : in std_logic_vector (31 downto 0) ;
			s : out std_logic_vector (31 downto 0)
		) ;
	end component ;
	component eq32
		port (
			a : in std_logic_vector (31 downto 0) ;
			b : in std_logic_vector (31 downto 0) ;
			equal : out std_logic
		) ;
	end component ;

	-- internal signals declarations
	signal oe : std_logic_vector (63 downto 0) ;
	signal saddsub : std_logic_vector (31 downto 0) ;
	signal smul : std_logic_vector (31 downto 0) ;
	signal sand : std_logic_vector (31 downto 0) ;
	signal sor : std_logic_vector (31 downto 0) ;
	signal sxor : std_logic_vector (31 downto 0) ;
	signal s25 : std_logic_vector (31 downto 0) ;
	signal s13 : std_logic_vector (31 downto 0) ;
	signal sshift : std_logic_vector (31 downto 0) ;

begin

	-- concurrent statements
	s(31 downto 0) <= saddsub(31 downto 0) when oe(16) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	s(31 downto 0) <= saddsub(31 downto 0) when oe(0) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	s(31 downto 0) <= saddsub(31 downto 0) when oe(20) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	s(31 downto 0) <= saddsub(31 downto 0) when oe(4) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	s(31 downto 0) <= smul(31 downto 0) when oe(26) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	sand(31 downto 0) <= a(31 downto 0) and b(31 downto 0) ;
	s(31 downto 0) <= sand(31 downto 0) when oe(17) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	s(31 downto 0) <= sand(31 downto 0) when oe(1) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	sor(31 downto 0) <= (a(31 downto 0)) or (b(31 downto 0)) ;
	s(31 downto 0) <= sor(31 downto 0) when oe(18) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	s(31 downto 0) <= sor(31 downto 0) when oe(2) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	sxor(31 downto 0) <= (a(31 downto 0) and (not b(31 downto 0))) or ((not a(31 downto 0)) and b(31 downto 0)) ;
	s(31 downto 0) <= sxor(31 downto 0) when oe(19) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	s(31 downto 0) <= sxor(31 downto 0) when oe(3) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	s25(31 downto 25) <= 
		("1111111" and (a(24)&a(24)&a(24)&a(24)&a(24)&a(24)&a(24))) ;
	s25(24 downto 0) <= a(24 downto 0) ;
	s(31 downto 0) <= s25(31 downto 0) when oe(33) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	s13(12 downto 0) <= a(12 downto 0) ;
	s13(31 downto 13) <= 
		("1111111111111111111" and (a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12)&a(12))) ;
	s(31 downto 0) <= s13(31 downto 0) when oe(32) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	s(31 downto 0) <= sshift(31 downto 0) when oe(13) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	s(31 downto 0) <= sshift(31 downto 0) when oe(14) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	s(31 downto 8) <= a(23 downto 0) when oe(35) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	s(7 downto 0) <= "00000000" when oe(35) = '1' else "ZZZZZZZZ" ;
	s(31 downto 0) <= b(31 downto 0) when oe(40) = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ;
	n <= s(31) ;
	setn <= cmd(4) and (not cmd(3)) ;
	setz <= cmd(4) ;
	setvc <= cmd(4) and (not cmd(1)) and (not cmd(0)) ;

	-- components instanciations
	decoder6to64_0 : decoder6to64 port map (cmd(5 downto 0), oe(63 downto 0)) ;
	addsub32_1 : addsub32 port map (a(31 downto 0), b(31 downto 0), cmd(2), saddsub(31 downto 0), v, c) ;
	umult16x16_2 : umult16x16 port map (a(15 downto 0), b(15 downto 0), smul(31 downto 0)) ;
	barrelshifter32_3 : barrelshifter32 port map (cmd(0), b(4 downto 0), a(31 downto 0), sshift(31 downto 0)) ;
	eq32_4 : eq32 port map (s(31 downto 0), "00000000000000000000000000000000", z) ;

end synthesis;
