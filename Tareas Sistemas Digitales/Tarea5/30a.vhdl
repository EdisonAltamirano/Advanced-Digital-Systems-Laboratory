library ieee;
library ieee.numeric_bit.all
entity shift74194 is
    port(
    d: in bit_vector(3 downto 0);
    s: in bit_vector(1 downto 0);
    sdr,sdl,clrb,clk: in bit;
    q: in out bit_vector(3 downto 0)
    );
end shift74194;
architecture test of shift74194 is
    begin
        process(clk, clrb)
        if clrb = '1' then
            q <= "0000"; --clear
        elsif clk = '1' and clk'event then
            case(s) is
            when "00" => q <= q; --no action
            when "01" => q <= sdr & q(3 downto 1); --serial data right
            when "10" => q <= q(2 downto 0) & sdl; --serial data left
            when "11" => q <= d; --load
            end case;
        end if;
        end process;

    
end test;