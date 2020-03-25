library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Param24_tb is
end;

architecture bench of Param24_tb is

  component Param24 
      port(A, B, C, D : in bit;
          Z: out bit);
  end component;

  signal A, B, C, D: bit;
  signal Z: bit;

begin

  uut: Param24 port map ( A => A,
                          B => B,
                          C => C,
                          D => D,
                          Z => Z );

  stimulus: process
  begin
  
    -- Put initialisation code here
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

    -- Put test bench stimulus code here

    wait;
  end process;


end;