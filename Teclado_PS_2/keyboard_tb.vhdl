library IEEE;
use IEEE.Std_logic_1164.all;
use ieee.numeric_std.all;

entity keyboard_tb is
    constant clock_period : time := 0.5 ns; -- Reloj del sistema de 25MHz
    constant bit_period : time := 10 ns; -- 16.7 kHz max
end;

architecture bench of keyboard_tb is

  component keyboard
  	port(
  			keyboard_clk, keyboard_data, clk_25Mhz, reset : in std_logic;
  			scan_code : out std_logic_vector(7 downto 0);
  			parity : out std_logic
  		);
  end component;

  signal clk_25Mhz, reset: std_logic;
  signal scan_code: std_logic_vector(7 downto 0);
  signal parity: std_logic ;
  signal keyboard_clk : std_logic := '1';
  signal keyboard_data : std_logic := '0';
  signal stop_the_clock: boolean;
  
  type code_type is array (natural range <>) of std_logic_vector(7 downto 0);
  constant codes : code_type := ( x"15", x"1D"); -- Q, W

begin

  uut: keyboard port map ( keyboard_clk  => keyboard_clk,
                           keyboard_data => keyboard_data,
                           clk_25Mhz     => clk_25Mhz,
                           reset         => reset,
                           scan_code     => scan_code,
                           parity        => parity );
   stimulus: process
   begin
    reset<='1';
    keyboard_data <= '1';
    wait for (bit_period / 2);
    reset<='0';
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '1';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';
    
    keyboard_data <= '1';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '1';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '1';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '1';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '1';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '1';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '1';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '1';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '1';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';
    


    keyboard_data <= '0';
    
    wait for (bit_period / 2);
    reset<='0';
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '1';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '1';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '1';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '1';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '1';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '1';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '1';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';


    keyboard_data <= '1';
    
    wait for (bit_period / 2);
    reset<='0';
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '1';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '1';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '1';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '1';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '1';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';

    keyboard_data <= '1';
    wait for (bit_period / 2);
    keyboard_clk <= '0';
    wait for (bit_period / 2);
    keyboard_clk <= '1';
    -- Put test bench stimulus code here
    
    wait;
    end process;
                         
    clocking: process
    begin
    while not stop_the_clock loop
        clk_25Mhz <= '0', '1' after clock_period / 2;
    wait for clock_period;
    end loop;
    wait;
    end process;
                         
end;

                      
   