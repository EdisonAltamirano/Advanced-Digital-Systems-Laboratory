entity Param is 
    port(A, B, C, D : in bit;
        Z: out bit);
end Param;

architecture Circuit of Param is
    signal E, F, G, H, I : bit;
    begin
        G <= (A and B and C) after 5 ns;
        E <= G or D after 5 ns;
        H <= B nor C after 5 ns;
        F <= H nand A after 5 ns;
        I <= not F after 2 ns;
        Z <= I xor E after 5 ns;
end Circuit; 