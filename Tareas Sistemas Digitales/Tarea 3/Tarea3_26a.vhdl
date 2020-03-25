entity param26a is 
port(A, B, C, D: in bit;
    G: out bit);
end param26a;
architecture circuit of param26a is
    signal E, F: bit;
    begin
        E <= A and B;
        F <= E or C;
        G <= F and D;       
end circuit;