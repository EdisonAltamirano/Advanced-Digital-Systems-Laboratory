entity param26b is 
    port(A, B, C, D: in bit;
    G: out bit);
end param26b;
architecture circuit of param26b is
    signal E, F: bit;
begin
    process(A, B, C, E, F)
    begin
        E <= A and B;
        F <= C or E;
        G <= F and D;
    end process;
end circuit;    