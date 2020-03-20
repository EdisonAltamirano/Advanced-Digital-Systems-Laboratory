library ieee;
use ieee.std_logic_1164.all;

entity decadeC_tb is
end decadeC_tb;

architecture behav of decadeC_tb is
	component FourBitSynchDecadeCounter is
		port (Clk, rst: in std_logic; Q0, Q1, Q2, Q3, Q0b, Q1b, Q2b, Q3b: inout std_logic);
	end component FourBitSynchDecadeCounter;
	
	signal Clk : std_logic := '0';
	signal rst : std_logic := '0';
	signal Q0, Q1, Q2, Q3, Q0b, Q1b, Q2b, Q3b : std_logic;
	
	constant clk_period : time := 10 ns;
	
	begin
	
	counter: FourBitSynchDecadeCounter port map (Clk => Clk, rst => rst, Q0 => Q0, Q1 => Q1, Q2 => Q2, Q3 => Q3, Q0b => Q0b, Q1b => Q1b, Q2b => Q2b, Q3b => Q3b);
	
	clk_process :process
	begin
	clk <= '0';
	wait for clk_period/2;
	clk <= '1';
	wait for clk_period/2;
	end process;
	
	startup : process
	begin
	
	rst <= '1';
	wait for 5 ns;
	
	rst <= '0';
	wait for 100 ms;
	
	end process;
	
end architecture behav;
	