entity moore_match is
    port(x1,x2: in bit;
        clk: in bit;
        z: out bit);
end moore_match;
architecture  test of moore_match is 
signal state: natural:= 1;
begin
process(clk)
begin
    if clk = '0' and clk'event then
    case state is
        when 1 =>
            if(x1 xor x2) = '1' then 
            state <= 2 after 10 ns;
            z <= '0' after 20 ns;
            end if;
        when 2 => 
            if x2 = '1' then
            state <= 1 after 10 ns;
            z <= '1' after 20 ns;
            end if;
        when others => null;
    end case;
    end if;
end process;
end test;
