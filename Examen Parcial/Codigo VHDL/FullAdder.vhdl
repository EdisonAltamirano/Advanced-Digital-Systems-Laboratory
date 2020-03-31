library IEEE;
use ieee.numeric_bit.all;
use ieee.std_logic_1164.all;
 
entity full_adder_vhdl_code is
 Port ( A : in BIT;
 B : in BIT;
 Cin : in BIT;
 S : out BIT;
 Cout : out BIT);
end full_adder_vhdl_code;
 
architecture test of full_adder_vhdl_code is
 
begin
 
 S <= A XOR B XOR Cin ;
 Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B) ;
 
end test;