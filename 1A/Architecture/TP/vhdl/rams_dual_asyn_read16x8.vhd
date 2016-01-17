library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_unsigned.all ;

--- Dual-Port RAM with Asynchronous Read

entity rams_dual_asyn_read16x8 is
	port (
		clk  : in std_logic;
		we  : in std_logic;
		waddr  : in std_logic_vector(3 downto 0);
		raddr  : in std_logic_vector(3 downto 0);
		di  : in std_logic_vector(7 downto 0);
		wdo  : out std_logic_vector(7 downto 0);
		rdo  : out std_logic_vector(7 downto 0)
	) ;
end rams_dual_asyn_read16x8 ;

architecture synthesis of rams_dual_asyn_read16x8 is
	type ram_type is array (15 downto 0) of std_logic_vector (7 downto 0) ;
	signal RAM: ram_type ;

begin
	process (clk) begin
		if clk'event and clk='1' then
			if we='1' then
				RAM(conv_integer(waddr)) <= di ;
			end if ;
		end if ;
	end process ;
	wdo <= RAM(conv_integer(waddr)) ;
	rdo <= RAM(conv_integer(raddr)) ;

end synthesis ;
