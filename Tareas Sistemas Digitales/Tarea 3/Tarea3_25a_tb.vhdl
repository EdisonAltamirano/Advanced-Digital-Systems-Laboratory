library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity fullsubstractor_tb is
end;

architecture bench of fullsubstractor_tb is

  component fullsubstractor
      port(A, B, CIN: in bit;
      DIFF, BOUT: out bit);
      end component;

  signal A, B, CIN: bit;
  signal DIFF, BOUT: bit;

begin

  uut: fullsubstractor port map ( A    => A,
                                  B    => B,
                                  CIN  => CIN,
                                  DIFF => DIFF,
                                  BOUT => BOUT );

  stimulus: process
  begin
  
    -- Put initialisation code here
    A <= '1';
    B <= '1';
    CIN <= '1';
    wait for 1 ns;
    A <= '0';
    B <= '0';
    CIN <= '0';
    wait for 1 ns;
    A <= '1';
    B <= '0';
    CIN <= '1';
    wait for 1 ns;
    A <= '1';
    B <= '1';
    CIN <= '1';
    wait for 1 ns;
    -- Put test bench stimulus code here

    wait;
  end process;


end;
  