entity paramc is 
port(A, B, C, D: in bit;
    G: out bit);
end paramc;
architecture circuit of paramc is
    signal E, F: bit;
    begin
        E <= A and B;
        F <= E or C;
        G <= F and D;       
end circuit;