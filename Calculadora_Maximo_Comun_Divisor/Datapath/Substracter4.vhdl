library ieee;
use ieee.std_logic_1164.all;

entity Substracter4 is
	port (A, B : in std_logic_vector(3 downto 0); Cin : in std_logic; S : out std_logic_vector(3 downto 0); Cout : out std_logic);
end Substracter4;

architecture behav of Substracter4 is
component fullSubstracter
	port (A, B, Ci : in std_logic; Subs, Co : out std_logic);
end component;

signal C: std_logic_vector(3 downto 1);

begin
	FS0: fullSubstracter port map (A(0), B(0), Cin, C(1), S(0));
	FS1: fullSubstracter port map (A(1), B(1), C(1), C(2), S(1));
	FS2: fullSubstracter port map (A(2), B(2), C(2), C(3), S(2));
	FS3: fullSubstracter port map (A(3), B(3), C(3), Cout, S(3));
end behav;