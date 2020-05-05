library ieee;
library ieee.numeric_bit.all
entity p2_37c is
    port(
        x,clk:in bit;
        s, v: out bit)
    );
end p2_37c;

architecture test of p2_37 is
component DFF
    port(d, clk: in bit;
         q: out bit
         qn: out bit:= '1');
end component;
component And2
    port(A1, A2: in bit; 
        z: out bit);
end component;
component Or2
    port(A1, A2: in bit; 
        z: out bit);
end component;
component And3
    port(A1, A2, A3: in bit; 
        z: out bit);
end component;
component Inverter
    port(A: in bit; 
        z: out bit);
end component;
signal q1, q2, q3: bit := '0';
signal xn, q1n, q2n, q3n: bit := '1';
signal d1, d2, d3: bit:= '0';
signal a1, a2, a3, a4, a5, a6: bit:= '0';
begin
   I1:  inverter port map(x, xn);
   G1:  and2 port map(q1n, q3, d1);
   G2:  and2 port map(q2n, q3n, a1);
   G3:  and3 port map(x, q1n, q2, a2);
   G4:  or2 port map(a1, a2, d2);
   G5:  and2 port map(q1n, q3, a3);
   G6:  and2 port map(q2, q3n, a4);
   G7:  or2 port map(a3, a4, d3);
   G8:  and2 port map(x, q2n, a5);
   G9:  and2 port map(xn, q2, a6);
   G10:  or2 port map(a5, a6, s);
   G11: and3 port map(x, q1, q2, v);
   DFF1:dff port map(d1, clk, q1, q1n);
   DFF2:dff port map(d2, clk, q2, q2n);
   DFF3:dff port map(d3, clk, q3, q3n);
end test;