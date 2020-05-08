library ieee;
use ieee.numeric_bit.all;

entity counter99_tb is
end entity;

architecture arch of counter99_tb is
	
	component counter99 is
		port(
			CEPn, CETn, Clk, UpDown : in bit;
			Q: out unsigned(7 downto 0);
			TC: out bit
		);
	end component;
	
	signal CEPn, CETn : bit := '0';
	signal UpDown : bit := '1';
	signal Clk, TC : bit;
	signal Q : unsigned(7 downto 0);
	
	begin
	
	CONTADOR99: counter99 port map(CEPn, CETn, Clk, UpDown, Q, TC);
	
	clk_process: process
	begin
			Clk <= '0';
			wait for 5 ns;
			Clk <= '1';
			wait for 5 ns;
	end process;
	
	count_process: process
	begin
		wait for 50 ns;
		
		UpDown <= '0';
		
		wait for 1000 ns;
		
		UpDown <= '1';
		
	end process;
	
end architecture;