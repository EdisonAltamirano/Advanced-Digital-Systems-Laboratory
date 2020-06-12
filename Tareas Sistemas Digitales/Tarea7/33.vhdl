library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity T33 is 
port(
    X: in bit;
    clk: in bit;
    Z: out bit);
end T33;
architecture test of T33 is
    signal D1 : bit := '0';
    signal D0 : bit := '0';
    signal Q1, Q0: bit;
    type lut8x3 is array(0 to 7) of unsigned(2 downto 0);
    signal rom:lut8x3:=("000","010","101","111","011","110","101");
    signal enter : unsigned(2 downt 0);
    begin
        enter <= Q1 & Q2 & X;
        process(clk)
            if (clk'event and clk='1') then
                Q1 <= D1;
                Q0 <= D0;
            end if;
        end process;

        process(enter)
        variable ext : unsigned(2 downto 0);
        begin
            ext := rom(to_interger(enter));
            D1 <= ext(2);
            D0 <= ext(1);
            Z <= ext(0);
        end process;
    end test;
