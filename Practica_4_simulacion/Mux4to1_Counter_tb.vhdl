library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Mux4to1_Counter_tb is
end;

architecture bench of Mux4to1_Counter_tb is

  component Mux4to1_Counter
      port( A1,B1,C1,D1,CLEAR: in std_logic;
      CLOCK: inout std_logic;    
      CLOCK1: out std_logic;
      MUX: out std_logic); 
  end component;

  signal A1,B1,C1,D1,CLEAR: std_logic;
  signal CLOCK: std_logic;
  signal CLOCK1: std_logic;
  signal MUX: std_logic;
  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;
begin

  uut: Mux4to1_Counter port map ( A1     => A1,
                                  B1     => B1,
                                  C1     => C1,
                                  D1     => D1,
                                  CLEAR  => CLEAR,
                                  CLOCK  => CLOCK,
                                  CLOCK1 => CLOCK1,
                                  MUX    => MUX );

  stimulus: process
  begin
  
    -- Put initialisation code here
    CLEAR <= '1';
    A1 <= '0';
    B1 <= '0';
    C1 <= '0';
    D1 <= '1';
    wait for 5 ns;
    CLEAR <= '0';
    wait for 100 ns;
    CLEAR <= '1';
    A1 <= '0';
    B1 <= '0';
    C1 <= '0';
    D1 <= '0';
    wait for 5 ns;
    CLEAR <= '0';
    wait for 50 ns;

    -- Put test bench stimulus code here
    stop_the_clock <=true;
    wait;
  end process;
  clocking: process
  begin
    while not stop_the_clock loop
      CLOCK <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;


end;