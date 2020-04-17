library ieee;
use ieee.numeric_bit.all;
use IEEE.Std_logic_1164.all;
entity circuit is 
    port(A,B,C,D: in bit;
        X,Y,R,E: out bit);
    end circuit;
architecture test of circuit is 
    signal S,E1,F1:bit;
    begin
        S <= A and B after 1 ns;
        R <= S;
        E1 <= not C after 1 ns;
        E <= E1;
        F1 <= (B nand A) nand D after 1 ns;
        X <= (E1 or S) or F1 after 1 ns;
        Y <= F1;
    end test;
 