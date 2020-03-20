entity Param is 
    port(M, N, Clk, CLR: in bit; Q: inout bit; Qn: out bit);
end Param;
architecture Circuit of Param is
begin
    process(Clk, CLR)
    begin
        if CLR = '0' then Q <= '0';
        elsif Clk = '0' and Clk'event then
            if M = '0' and N = '0' then Q <= not Q;
            elsif M = '0' and N = '1' then Q <= '1';
            elsif M = '1' and N = '0' then Q <= '0';
            elsif M = '1' and N = '1' then Q <= Q;
            end if;
        end if;
    end process;
    Qn <= not Q;
end Circuit;