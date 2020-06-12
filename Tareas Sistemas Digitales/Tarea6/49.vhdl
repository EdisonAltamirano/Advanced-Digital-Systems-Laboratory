architecture test1 of tester is
    component Mealy
    port(X, clk: in bit;
        Z: out bit);
    end component;
    signal XA: bit_vector(0 to 11) :=  "011011011100";
    signal ZA: bit_vector(0 to 11) :=  "100110110110";
    signal X, clk, Z: bit := '0';
begin
    clk <= not clk after 50 ns;
    M1: Mealy port map(X, clk, Z);
    process
    begin
        for i in 0 to 11 loop
            X <= XA(i) after 10 ns; --start first output immediatly
            wait until clk = '1' and clk'event;
            assert (Z = ZA(i))
            report "Error"
            severity error;
        end loop;
        report "sequence correct";
        end process;
end test1;