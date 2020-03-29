
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity bit_counter_tb is
end;

architecture bench of bit_counter_tb is

  component bit_counter
    port (
      clk       : in  std_logic;
      rst       : in  std_logic;
      count_out : out std_logic_vector(1 downto 0));
  end component;

  signal clk: std_logic;
  signal rst: std_logic;
  signal count_out: std_logic_vector(1 downto 0);

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: bit_counter port map ( clk       => clk,
                              rst       => rst,
                              count_out => count_out );

  stimulus: process
  begin
  
    -- Put initialisation code here

    rst <= '1';
    wait for 5 ns;
    rst <= '0';
    wait for 100 ns;
    rst <= '1';
    wait for 5 ns;

    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
  