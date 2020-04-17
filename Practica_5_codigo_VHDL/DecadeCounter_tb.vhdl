library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mod10_counter_tb is
end;

architecture bench of mod10_counter_tb is

  component mod10_counter
     port(
        clk, reset: in std_logic;
        q: out std_logic_vector(3 downto 0);
        en: out std_logic
     );
  end component;

  signal clk, reset: std_logic;
  signal q: std_logic_vector(3 downto 0);
  signal en: std_logic ;

  constant clock_period: time := 1 ns;
  signal stop_the_clock: boolean;

begin

  uut: mod10_counter port map ( clk   => clk,
                                reset => reset,
                                q     => q,
                                en    => en );

  stimulus: process
  begin
  
    -- Put initialisation code here
    reset <= '1';
    wait for 1 ns;
    
    reset <= '0';
    wait for 60 ns;

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
  