library ieee;
use ieee.std_logic_1164.all;

entity DFFBox is
	port(D1, D2, D3, D4, D5, D6, D7, Clk, Enable: in std_logic; Q1, Q2, Q3, Q4, Q5, Q6, Q7 : out std_logic);
end DFFBox;

architecture behaviour of DFFBox is
	component DFF is
		port(Clk, D, Clr, Set, Enable : in std_logic; Q : out std_logic);
	end component;
	
	begin
	
	FF1 : DFF port map (Clk => Clk, D => D1, Clr => '0', Set => '0', Enable => Enable, Q => Q1);
	FF2 : DFF port map (Clk => Clk, D => D2, Clr => '0', Set => '0', Enable => Enable, Q => Q2);
	FF3 : DFF port map (Clk => Clk, D => D3, Clr => '0', Set => '0', Enable => Enable, Q => Q3);
	FF4 : DFF port map (Clk => Clk, D => D4, Clr => '0', Set => '0', Enable => Enable, Q => Q4);
	FF5 : DFF port map (Clk => Clk, D => D5, Clr => '0', Set => '0', Enable => Enable, Q => Q5);
	FF6 : DFF port map (Clk => Clk, D => D6, Clr => '0', Set => '0', Enable => Enable, Q => Q6);
	FF7 : DFF port map (Clk => Clk, D => D7, Clr => '0', Set => '0', Enable => Enable, Q => Q7);
	
end architecture;