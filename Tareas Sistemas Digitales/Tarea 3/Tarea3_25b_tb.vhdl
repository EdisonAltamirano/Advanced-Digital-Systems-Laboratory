library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity full_four_substractor_tb is
end;

architecture bench of full_four_substractor_tb is

  component full_four_substractor
      port(A, B: in bit_vector(3 downto 0);
      CIN: in bit;
      D: out bit_vector(3 downto 0);
      BOUT: out bit);
      end component;

  signal A, B: bit_vector(3 downto 0);
  signal CIN: bit;
  signal D: bit_vector(3 downto 0);
  signal BOUT: bit;

begin

  uut: full_four_substractor port map ( A    => A,
                                        B    => B,
                                        CIN  => CIN,
                                        D    => D,
                                        BOUT => BOUT );

  stimulus: process
  begin
  
    -- Put initialisation code here
    A <= "1111";
    B <= "1111";
    CIN <= '1';
    wait for 1 ns;
    A <= "0000";
    B <= "0000";
    CIN <= '0';
    wait for 1 ns;
    A <= "1101";
    B <= "1011";
    CIN <= '1';
    wait for 1 ns;
    A <= "1111";
    B <= "1001";
    CIN <= '1';
    wait for 1 ns;

    -- Put test bench stimulus code here

    wait;
  end process;


end;