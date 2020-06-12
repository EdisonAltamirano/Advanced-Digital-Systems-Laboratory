library ieee;
use ieee.numeric_bit.all;
entity macrocell is
    port( S0,S1: in bit;
    D: in bit;
    AR, SP: in bit;
    clk: in bit;
    D1, D2: out bit);
end macrocell;
architecture test of macrocell is
    process(clk,ar)
    begin
        if AR = '1' then Q <= '0';
        else if clk'event and clk = '1' then
            if SP = '1' then Q <='1';
            else Q <=D;
            end if;
        end if;
    end if;
    end process;
    process(sel2,D,Q)
    begin
        case sel2 is 
        when "00" => OutMUX4 <= Q;
        when "01" => OutMUX4 <= Qn;
        when "10" => OutMUX4 <= D;
        when "11" => OutMUX4 <= not D;
        when others => null;
        end case;
    end process;
    
    process(S1,Q,OutmUx4)
    begin
        case S1 is 
        when "0" => OutMUX2 <= Qn;
        when "1" => OutMUX2 <= not OutMUX4;
        when others => null;
        end case;
    end process;

    end test;