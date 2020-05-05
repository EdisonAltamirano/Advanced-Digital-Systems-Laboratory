library ieee;
library ieee.numeric_bit.all
entity p2_37b is
    port(
        x,clk:in bit;
        s, v: out bit)
    );
end p2_37b;

architecture test of p2_37 is
signal q1, q2, q3: bit;
begin
    process(clk)
    begin
        if clk'event and clk = '0' then
            q1 <= not q1 and q3;
            q2 <= (not q2 and not q3) or (x and not q1 and q2);
            q3 <= (not q1 and q3) or (q2 and not q3); 
        end if;
    end process;
    s <=(x and not q2) or (not x and q2);
    v <=(x and q1 and q2);
end test;
