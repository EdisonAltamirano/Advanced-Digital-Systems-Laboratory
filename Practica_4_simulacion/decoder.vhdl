library ieee;
use ieee.std_logic_1164.all;

entity decoder is
	port (
			sel : in std_logic_vector(3 downto 0);
			r : out std_logic_vector(15 downto 0)
		);
end entity;

architecture behav of decoder is
begin
	process (sel)
	begin
	
		r <= "0000000000000000";
		
		case sel is
			when "0000" => r(0) <= '1';
			when "0001" => r(1) <= '1';
			when "0010" => r(2) <= '1';
			when "0011" => r(3) <= '1';
			when "0100" => r(4) <= '1';
			when "0101" => r(5) <= '1';
			when "0110" => r(6) <= '1';
			when "0111" => r(7) <= '1';
			when "1000" => r(8) <= '1';
			when "1001" => r(9) <= '1';
			when "1010" => r(10) <= '1';
			when "1011" => r(11) <= '1';
			when "1100" => r(12) <= '1';
			when "1101" => r(13) <= '1';
			when "1110" => r(14) <= '1';
			when "1111" => r(15) <= '1';
			when others => r <= "0000000000000000";
		end case;
	end process;
end architecture;
			