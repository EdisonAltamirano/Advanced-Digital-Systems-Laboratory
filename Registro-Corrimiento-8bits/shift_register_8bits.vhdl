library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity shift_register_8bits is
    port(
        x: in std_logic_vector(7 downto 0);
        s: in std_logic_vector(1 downto 0);
        rsd,lsd,clrb,clk: in std_logic;
        y: inout std_logic_vector(7 downto 0)
    );
end shift_register_8bits;
architecture test of shift_register_8bits is
    component shift74194 is
        port(
            clr, clk, sdr, sdl : in std_logic;
            mode : in std_logic_vector(1 downto 0);
            parallel : in std_logic_vector(3 downto 0);
            q : inout std_logic_vector(3 downto 0)
        );
    end component;
begin
    S0: shift74194 port map(clrb, clk, y(4), lsd, s, x(3 downto 0), y(3 downto 0));
    S1: shift74194 port map(clrb, clk, rsd, y(3), s, x(7 downto 4), y(7 downto 4));
end test;