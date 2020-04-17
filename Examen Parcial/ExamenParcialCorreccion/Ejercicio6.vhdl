library ieee;
use ieee.numeric_bit.all;
use IEEE.Std_logic_1164.all;
entity circuit is
    port(A:in bit_vector(3 downto 0);
        B:in bit_vector(3 downto 0));
end circuit;
architecture test of circuit is 
    begin
        B <= not A;
    end test;
    
    