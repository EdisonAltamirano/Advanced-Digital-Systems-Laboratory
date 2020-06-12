library ieee;
use ieee.numeric_bit.all;
entity P_46 is
    port(A: in unsigned(11 downto 0);
        count: out unsigned(3 downto 0)
    );
end P_46;
architecture test of P_46 is 
    component ROM4_3 is
        port(ROMin: in unsigned(0 to 3));
            ROMout:out unsigned(0 to 2));
    end component;
    signal B,C,D: unsigned(0 to 2);
begin
    RO1: ROM4_3 port map(A(11 downto 8), B);
    RO2: ROM4_3 port map(A(7 downto 4), C);
    RO3: ROM4_3 port map(A(3 downto 0), D);
    count <= '0' & B + C + D;
end test;
