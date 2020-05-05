library ieee;
library ieee.numeric_bit.all;
entity Adder is 
port(
    A: in bit_vector(3 downto 0);
    B: in integer range 0 to 15;
    Sum : out bit_vector(4 downto 0)
);
end Adder;

architecture test of Adder is
signal sum5: unsigned(4 downto 0);
    begin
    sum5 <= '0' & unsigned(A) + to_unsigned(B,4);
    Sum <= bit_vector(sum5);
end test;