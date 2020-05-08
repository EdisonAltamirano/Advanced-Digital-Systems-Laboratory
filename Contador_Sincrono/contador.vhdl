library ieee;
use ieee.numeric_bit.all;

entity counter4 is
	port(
			CEPn, CETn, Clk, PEn, UpDown : in bit;
			D: in unsigned(3 downto 0);
			Q: out unsigned(3 downto 0);
			TC: out bit
		);
end counter4;

architecture behav of counter4 is

	signal Q_int: unsigned(3 downto 0);
	
	begin
	
	Q <= Q_int;
	TC <= not ((Q_int(3) and Q_int(2) and Q_int(1) and Q_int(0) and UpDown) or (not Q_int(3) and not Q_int(2) and not Q_int(1) and not Q_int(0) and not UpDown));
	
	process(Clk)
	begin
		if Clk'event and Clk = '1' then
			if PEn = '0' then Q_int <= D;
			else if CEPn = '0' and CETn = '0' then
					if UpDown = '1' then Q_int <= Q_int+1;
					else Q_int <= Q_int-1; end if;
				end if;
			end if;
		end if;
	end process;
	
end architecture;