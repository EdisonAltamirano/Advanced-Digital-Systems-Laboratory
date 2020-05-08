library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity shift_register_8bits_tb is
end;

architecture bench of shift_register_8bits_tb is

  component shift_register_8bits
      port(
        x: in std_logic_vector(7 downto 0);
        s: in std_logic_vector(1 downto 0);
        rsd,lsd,clrb,clk: in std_logic;
        y: inout std_logic_vector(7 downto 0)
      );
  end component;

  signal x: std_logic_vector(7 downto 0);
  signal s: std_logic_vector(1 downto 0);
  signal rsd,lsd,clrb,clk:  std_logic;
  signal y: std_logic_vector(7 downto 0);
  constant period : time := 10 ns;

begin

  uut: shift_register_8bits port map ( x    => x,
                                       s    => s,
                                       rsd  => rsd,
                                       lsd  => lsd,
                                       clrb => clrb,
                                       clk  => clk,
                                       y    => y );

  clk_process : process
  begin
    clk <= '0';
    wait for period/2;
    clk <= '1';
    wait for period/2;
  end process;                                
  clrb <= '0', '1' after period*4, '0' after period*20;
  s <= "00", "11" after period*5, "10" after period*6, "01" after period*12, "00" after period*16;
  x <= "10101010";
  rsd <= '0';
  lsd <= '1';
end bench;