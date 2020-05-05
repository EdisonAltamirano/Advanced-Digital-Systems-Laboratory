library ieee;
library ieee.numeric_bit.all;

entity decadecounter is
    port(
        d: in bit_vector(3 downto 0);
        clk,clr,ent,enp,up, load: in bit;
        q: inout bit_vector(3 downto 0);
        co: out bit_vector
    );
end decadecounter;

architecture test of decadecounter is:

begin
process(clr,clk)
    if clr = '0' then
        q <= '0000';
    elsif clk = '1' and clk'event then
        if load = '0' then q <= d;
        elsif (enp = '1' and ent ='1' and (not up) = '1') then
            if q = "0000" then q <= "1001";
            else q <= q - 1;
            end if; --decrement
        elsif (enp = '1' and ent ='1' and up = '1') then
            if q = "1001" then q <= "0000";
            else q <= q + 1;
            end if; --increment
        end if;
    end if;
end process;
co <= '1' when (ent = '1') and ((up = '1' and (q <= "1001")) or 
               (up = '0'  and (q <= "0000")) else '0';
end test;