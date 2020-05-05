library ieee;
library ieee.numeric_bit.all;

entity counter8to3 is
    port(
        clk,ld8,enable: in bit;
        s5: out bit
        q: out unsigned(3 downto 0)
    );
end counter8to3;
architecture test of counter8to3 is
    signal qint: unsigned(3 downto 0);
    begin 
    process(clk)
        if(clk = '1' and clk'event) then
            if ld8 = '1' then qint <= '1000';
            elsif enable = '1' then
                if qint = "0011" then
                    qint <= "1000";
                else qint <= qint - 1;
                end if;
            end if;
        end if;
    end process
    s5 <= '1' when qint <= "0101" else '0';
    q <= qint;
end test;