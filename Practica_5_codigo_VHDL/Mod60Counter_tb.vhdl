
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mod60_Counter_tb is
end;

architecture bench of mod60_Counter_tb is

  component mod60_Counter
      port(
      clk, reset: in std_logic;
      x: out std_logic_vector(3 downto 0);    
      y: out std_logic_vector(3 downto 0); 
      z: out std_logic_vector(3 downto 0));     
  end component;

  signal clk, reset: std_logic;
  signal x: std_logic_vector(3 downto 0);
  signal y: std_logic_vector(3 downto 0);
  signal z: std_logic_vector(3 downto 0);
  constant clock_period: time := 1 ns;
  signal stop_the_clock: boolean;
begin

  uut: Mod60_Counter port map ( clk   => clk,
                                reset => reset,
                                x     => x,
                                y     => y,
                                z     => z );

        stimulus: process
        begin
                               
        -- Put initialisation code here
            reset <= '1';
            wait for 1 ns;                     
            reset <= '0';
            wait for 100 ns;
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
  