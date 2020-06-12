library ieee;
library ieee.numeric_bit.all;
entity T32 is 
    port(
        A,B,C: in bit;
        F,G: out bit
    );
end T32;
architecture test of T32 is
    type LUT8x2 is array(0 to 7) of unsigned( 1 downto 0);
    signal rom: LUT8X2:=("11","11","10","00","01","00","10","10");
    signal ABC :unsigned(2 downto 0); 
    signal FG :unsigned(1 downto 0); 
    begin
        ABC <= A & B & C;
        FG <= rom(to_integer(ABC));
        F <= FG(1);
        G <= FG(0);
end test;