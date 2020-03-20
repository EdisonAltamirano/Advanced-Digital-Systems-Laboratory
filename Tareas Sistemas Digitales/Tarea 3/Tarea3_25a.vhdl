entity fullsubstractor is
    port(A, B, CIN: in bit;
    DIFF, BOUT: out bit);
    end fullsubstractor;
architecture one_substractor of fullsubsctractor is
    begin 
    DIFF <=  A xor B xor CIN;
    BOUT <= (not A and B) or (B and CIN) or (not A and CIN);
end one_substractor;