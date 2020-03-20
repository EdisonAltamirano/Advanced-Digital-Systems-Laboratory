entity full_four_substractor is
    port(A, B: in bit_vector(3 downto 0);
    CIN: in bit;
    D: out bit_vector(3 downto 0);
    BOUT: out bit);
    end full_four_substractor;
architecture four_substractor of full_four_substractor is 
    signal BO: bit_vector(3 downto 0) := "0000";
    component fullsubstractor 
        port(A, B, CIN: in bit;
            DIFF, BOUT: out bit);
    end component;
begin 
    FS0: fullsubstractor port map(A(0), B(0), CIN, D(0), BO(1));
    FS1: fullsubstractor port map(A(1), B(1), BO(1), D(1), BO(2));
    FS2: fullsubstractor port map(A(2), B(2), BO(2), D(2), BO(3));
    FS3: fullsubstractor port map(A(3), B(3), BO(3), D(3), BOUT);
end four_substractor;