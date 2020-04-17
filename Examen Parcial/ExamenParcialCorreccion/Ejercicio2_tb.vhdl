
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity circuit_tb is
end;

architecture bench of circuit_tb is

  component circuit 
      port(A,B,C,D: in bit;
          X,Y,R,E: out bit);
      end component;

  signal A,B,C,D: bit;
  signal X,Y,R,E: bit;

begin

  uut: circuit port map ( A => A,
                          B => B,
                          C => C,
                          D => D,
                          R => R,
                          X => X,
                          E => E,
                          Y => Y );

  stimulus: process
  begin 
  
    -- Put initialisation code here
   
    A <= '0';
    B <= '0';
    C <= '0';
    D <= '0';
    wait for 1 ns;
    A <= '1';
    B <= '1';
    C <= '0';
    D <= '1';
    wait for 1 ns;
    A <= '1';
    B <= '1';
    C <= '0';
    D <= '1';
    wait for 1 ns;
    A <= '0';
    B <= '1';
    C <= '1';
    D <= '1';
    wait for 1 ns;
    A <= '0';
    B <= '1';
    C <= '1';
    D <= '1';
    wait for 1 ns;
    A <= '0';
    B <= '0';
    C <= '1';
    D <= '1';
    wait for 1 ns;
    A <= '0';
    B <= '0';
    C <= '1';
    D <= '1';
    wait for 1 ns;
    A <= '0';
    B <= '0';
    C <= '1';
    D <= '0';
    wait for 1 ns;
    A <= '0';
    B <= '0';
    C <= '1';
    D <= '0';
    wait for 1 ns;
    A <= '0';
    B <= '1';
    C <= '0';
    D <= '0';
    wait for 1 ns;
    A <= '1';
    B <= '1';
    C <= '0';
    D <= '0';
    wait for 1 ns;
    A <= '1';
    B <= '1';
    C <= '0';
    D <= '0';
    wait for 1 ns;
    A <= '1';
    B <= '1';
    C <= '1';
    D <= '1';
    wait for 1 ns;
    A <= '0';
    B <= '1';
    C <= '1';
    D <= '1';
    wait for 1 ns;
    A <= '0';
    B <= '1';
    C <= '1';
    D <= '1';
    wait for 1 ns;
    A <= '0';
    B <= '0';
    C <= '0';
    D <= '1';
    wait for 1 ns;

    -- Put test bench stimulus code here

    wait;
  end process;


end;
