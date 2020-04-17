library ieee;
use ieee.std_logic_1164.all;

entity FourBitSynchCounter is
	port (Clk, rst: in std_logic; Q0, Q1, Q2, Q3, Q0b, Q1b, Q2b, Q3b: inout std_logic);
end entity FourBitSynchCounter;

architecture LogicOperation of FourBitSynchCounter is
	component jkff is
		port (J, K, Clk, rst: in std_logic; Q, Qb: out std_logic);
	end component jkff;
	
	signal J1, J2, J3: std_logic;
	begin
	J1 <= Q0;
	J2 <= Q1 and Q0;
	J3 <= Q0 and Q1 and Q2;
	
	
	FF0: jkff port map (J => '1', K => '1', rst => rst, Clk => Clk, Q => Q0, Qb => Q0b);
	FF1: jkff port map (J => J1, K => J1, rst => rst, Clk => Clk, Q => Q1, Qb => Q1b);
	FF2: jkff port map (J => J2, K => J2, rst => rst, Clk => Clk, Q => Q2, Qb => Q2b);
	FF3: jkff port map (J => J3, K => J3, rst => rst, Clk => Clk, Q => Q3, Qb => Q3b);
	
end architecture LogicOperation; 