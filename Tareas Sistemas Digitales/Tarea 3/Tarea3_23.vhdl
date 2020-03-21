entity Param is
    port( A: in bit;
        C: inout bit);
end Param;
architecture Circuit of Param is
    signal B: bit;
    begin 
        process(A,B,C);
        begin
            B <= A and C;
            C <= not B;
        end process;
end Circuit;