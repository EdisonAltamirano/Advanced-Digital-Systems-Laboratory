library ieee;
use ieee.numeric_bit.all;

entity testbench is
    port(time1: out time);
end testbench;

architecture test1 of testbench is
    signal clk, Ld8, Enable, S5:bit;
    signal Q: unsigned(3 downto 0);
    component countQ1 is
        port(clk, ld8, enable:in bit; s5: out bit;
        Q: out unsigned(3 downto 0));
    end component;
begin
    time1 <= now when s5 = '1' else 0 ns;
    clk <= not clk after 50 ns;
    ld8 <= '1', '0' after 100 ns;
    enable <= '0', '1' after 100 ns, '0' after 600 ns,
              '1' after 800 ns, '0' after 1800 ns;
    CONT1: countQ1 port map(clk, ld8, enable, s5, q);
end test1;