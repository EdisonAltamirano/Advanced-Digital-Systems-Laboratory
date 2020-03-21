entity Param is
    port( A: in bit;
        C: inout bit);
end Param;
architecture Circuit of Param is
    signal B: bit;
    begin 
        B <= A and C after 3 ns;
        C <= not B;
end Circuit;