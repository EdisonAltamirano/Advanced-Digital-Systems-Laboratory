entity paramc is 
    port(A, B, C, D: in bit;
    G: out bit);
end paramc;
architecture circuit of paramc is
    signal E, F: bit;
begin
    process(A, B, C, E, F)
    begin
        E <= A and B;
        F <= C or E;
        G <= F and D;
    end process;
end circuit;    