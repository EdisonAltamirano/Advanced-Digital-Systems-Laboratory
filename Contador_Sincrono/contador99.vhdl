library ieee;
use ieee.numeric_bit.all;

entity counter99 is
	port(
			CEPn, CETn, Clk, UpDown : in bit;
			Q: out unsigned(7 downto 0);
			TC: out bit
		);
end entity;

architecture behav of counter99 is

	component counter4 is
		port(
			CEPn, CETn, Clk, PEn, UpDown : in bit;
			D: in unsigned(3 downto 0);
			Q: out unsigned(3 downto 0);
			TC: out bit
		);
	end component;
	
	signal D: unsigned(7 downto 0);
	signal load: bit;
	signal Q_int: unsigned(7 downto 0);
	signal TC_int: bit;
	signal TC1, TC2: bit;
	
	begin
	
	COUNTER1: counter4 port map(CEPn, CETn, Clk, load, UpDown, D(3 downto 0), Q_int(3 downto 0), TC1);
	COUNTER2: counter4 port map(TC1, CETn, Clk, load, UpDown, D(7 downto 4), Q_int(7 downto 4), TC2);
	
	
	Q <= Q_int;
	TC <= TC_int;
	TC_int <= not ((not Q_int(7) and not Q_int(6) and not Q_int(5) and not Q_int(4) and not Q_int(3) and not Q_int(2) and not Q_int(1) and not Q_int(0) and not UpDown) or (not Q_int(7) and Q_int(6) and Q_int(5) and not Q_int(4) and not Q_int(3) and not Q_int(2) and Q_int(1) and Q_int(0) and UpDown));
	
	process(TC_int)
	begin
		if TC_int = '0' then
			if UpDown = '1' then
				D <= "00000000";
				load <= '0';
			else
				D <= "01100011";
				load <= '0';
			end if;
		else load <= '1';
		end if;
	end process;
	
end architecture;
	