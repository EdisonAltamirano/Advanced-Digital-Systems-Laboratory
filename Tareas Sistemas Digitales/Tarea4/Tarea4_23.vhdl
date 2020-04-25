library ieee;
use ieee.std_logic_1164.all;
entity mux is
  port (
    port( A, B, C, D : in bit;
        F: out bit        
    )
  ) ;
end mux;
architecture test of mux is
    signal sel : bit_vector(1 downto 0);
    begin  
        sel <= C&D;
        with sel select
            F <= (not A) after 10 ns when "00",
            B after 10 ns when "01",
            (not B) after 10 ns when "10",
            '0' after 10 ns when "11";
end test;

library ieee;
use ieee.std_logic_1164.all;
entity mux is
  port (
    port( A, B, C, D : in bit;
        F: out bit        
    )
  ) ;
end mux;
architecture test of mux is
    signal sel : bit_vector(1 downto 0);
    begin  
        sel <= C&D;
        with sel select
            F <= (not A) after 10 ns when "00",
            B after 10 ns when "01",
            (not B) after 10 ns when "10",
            '0' after 10 ns when "11";
end test;

