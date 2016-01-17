library IEEE;
library UNISIM;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity reg32 is
	port (
		rst : in std_logic ;
		clk : in std_logic ;
		en : in std_logic ;
		d : in std_logic_vector (31 downto 0) ;
		q : out std_logic_vector (31 downto 0)
	);
end reg32;

architecture synthesis of reg32 is

begin

	-- sequential statements
	process (clk, rst) begin
		if rst = '1' then
			q(31 downto 0) <= "00000000000000000000000000000000" ;
		elsif en = '1' and clk'event and clk = '1' then
			q(31 downto 0) <= d(31 downto 0) ;
		end if ;
	end process ;

end synthesis;
