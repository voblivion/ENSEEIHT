library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity count0to39 is
	port (
		rst : in std_logic ;
		clk : in std_logic ;
		en : in std_logic ;
		s : out std_logic_vector (5 downto 0)
	);
end count0to39;

architecture synthesis of count0to39 is

	-- buffer signals declarations
	signal s_int : std_logic_vector (5 downto 0) ;

	-- internal signals declarations
	signal n39 : std_logic ;
	signal t : std_logic_vector (5 downto 0) ;

begin

	-- buffer signals assignations
	s(5 downto 0) <= s_int(5 downto 0) ;

	-- concurrent statements
	n39 <= (not s_int(5)) or (s_int(4)) or (s_int(3)) or (not s_int(2)) or (not s_int(1)) or (not s_int(0)) ;
	t(0) <= (n39) or ((not n39) and s_int(0)) ;
	t(1) <= (s_int(0) and n39) or ((not n39) and s_int(1)) ;
	t(2) <= (s_int(1) and s_int(0) and n39) or ((not n39) and s_int(2)) ;
	t(3) <= (s_int(2) and s_int(1) and s_int(0) and n39) or ((not n39) and s_int(3)) ;
	t(4) <= (s_int(3) and s_int(2) and s_int(1) and s_int(0) and n39) or ((not n39) and s_int(4)) ;
	t(5) <= (s_int(4) and s_int(3) and s_int(2) and s_int(1) and s_int(0) and n39) or ((not n39) and s_int(5)) ;

	-- sequential statements
	process (clk, rst) begin
		if rst = '1' then
			s_int(5 downto 0) <= "000000" ;
		elsif en = '1' and clk'event and clk = '1' then
			s_int(5 downto 0) <= ((not t(5 downto 0)) and s_int(5 downto 0)) or (t(5 downto 0) and (not s_int(5 downto 0))) ;
		end if ;
	end process ;

end synthesis;
