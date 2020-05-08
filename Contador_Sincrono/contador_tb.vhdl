library ieee;
use ieee.numeric_bit.all;

entity counter4_tb is
end entity;

architecture arch of counter4_tb is

	component counter4 is
		port(
			CEPn, CETn, Clk, PEn, UpDown : in bit;
			D: in unsigned(3 downto 0);
			Q: out unsigned(3 downto 0);
			TC: out bit
		);
	end component;
	
	signal CEPn, CETn : bit := '0';
	signal PEn : bit := '1';
	signal D, Q : unsigned(3 downto 0);
	signal Clk, TC : bit;
	signal UpDown : bit := '1';
	
	begin
	
	COUNTER: counter4 port map(CEPn, CETn, Clk, PEn, UpDown, D, Q, TC);
	
	clk_process: process
	begin
			Clk <= '0';
			wait for 5 ns;
			Clk <= '1';
			wait for 5 ns;
	end process;
	
	test: process
	begin
		D <= "0110";
		PEn <= '0';
		wait for 10 ns;
		
		PEn <= '1';
		
		wait for 500 ns;
		
		UpDown <= '0';
		wait for 1000 ns;
	end process;
	
end architecture;