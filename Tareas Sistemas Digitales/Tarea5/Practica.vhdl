--5
-- Behavioral
architecture test of exercise is

    signal E: bit;
begin
    process(A,B,C)
    E <= A and B;
    X <= E nor C;
end test ; -- test

--DataFlow
architecture test of exercise is
begin
    E <= A and B;
    X <= E nor C;
end test ; -- test
--Estructural

architecture test of exercise is
    component And1
    port(A1, A2: in bit; 
        z: out bit);
    end component;
    component Nor1
    port(A1, A2: in bit; 
        z: out bit);
    end component;
    signal E: bit;
    begin
        G1 : And1 port map(A, B, E);
        G2: Nor1 port map(E,C,X);
    end test ; -- test


--6
--concurrent
sel <= A&B;
with sel select
    Q <= D0 when "00";
    Q <= D1 when "01";
    Q <= D3 when "10";
    Q <= D4 when others;
--sequential

sel <= A&B;
process(sel)
case sel is 
        when "00" => Q <= D0;
        when "01" => Q <= D1;
        when "10" => Q <= D2;
        when "11" => Q <= D3;
end case;
end process;
