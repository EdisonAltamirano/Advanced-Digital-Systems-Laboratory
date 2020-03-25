
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity param26b_tb is
end;

architecture bench of param26b_tb is

  component param26b 
      port(A, B, C, D: in bit;
      G: out bit);
  end component;

  signal A, B, C, D: bit;
  signal G: bit;

begin

  uut: param26b port map ( A => A,
                           B => B,
                           C => C,
                           D => D,
                           G => G );

  stimulus: process
  begin
  
    -- Put initialisation code here
    A <= '1';
    B <= '1';
    C <= '1';
    D <= '1';
    wait for 1 ns;
    A <= '0';
    B <= '0';
    C <= '0';
    D <= '1';
    wait for 1 ns;
    A <= '1';
    B <= '1';
    C <= '1';
    D <= '1';
    wait for 1 ns;
    A <= '0';
    B <= '0';
    C <= '0';
    D <= '0';
    wait for 1 ns;

    -- Put test bench stimulus code here

    wait;
  end process;


end;