library ieee;
use ieee.std_logic_1164.all;

entity fullSubstracter is
	port (A, B, Ci : in std_logic; Subs, Co : out std_logic);
end fullSubstracter;

architecture behav of fullSubstracter is
begin
	Subs <= A xor B xor Ci;
	Co <= (Ci and not A) or (B and not A) or (B and Ci);
end behav;