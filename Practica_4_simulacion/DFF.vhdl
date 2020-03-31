library ieee;
use ieee.std_logic_1164.all;

entity DFF is
	port (Clk, D, Clr, Set, Enable : in std_logic; Q : out std_logic);
end DFF;

architecture behav of DFF is

	begin
	
	process (Clk, Clr, Set)
	begin
		if Enable = '1' then
			if Clr = '1' then Q <= '0';
			elsif Set = '1' then Q <= '1';
			elsif Clk'event and Clk = '1' then
				Q <= D;
			end if;
		end if;
	end process;
	
end architecture;