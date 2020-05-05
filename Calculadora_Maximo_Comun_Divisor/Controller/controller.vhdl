library ieee;
use ieee.std_logic_1164.all;

entity controller is 
    port(
        X_i, Y_i : out std_logic_vector(3 downto 0);
        X_sel, Y_sel: out std_logic;
        X_ld, Y_ld : out std_logic;
        X_sub, Y_sub : out std_logic;
        O_enb : out std_logic;
        timer : in std_logic;
        X_gt_Y, X_eq_Y, X_lt_Y : in std_logic
        );
end controller;

architecture arch of controller is
    type state_type is (MENOR, IGUAL, MAYOR);
    signal present_state, future_state : state_type;
    signal X_gt_Y1, X_eq_Y1, X_lt_Y1 : std_logic;
begin

--- SECUENCIAL
    process (timer)
    begin
    --  if timer = '1' and timer'event then
        if rising_edge(timer) then
            present_state <= future_state;
        end if;
    end process;

--- COMBINACIONAL
    process(X_gt_Y,X_eq_Y,X_lt_Y,present_state)
    begin
    X_sel <= '0';
    Y_sel <= '0';
    X_ld <= '1';
    Y_ld <= '1';
    X_sub <= '0';
    Y_sub <= '1';
    O_enb <= '0';
    future_state <= present_state;
    X_gt_Y1 <= X_gt_Y;
    X_eq_Y1 <= X_eq_Y;
    X_lt_Y1 <= X_lt_Y;
    case(present_state) is
        when MENOR =>
        X_sel <= '1';
        Y_sel <= '1';
        X_ld <= '1';
        Y_ld <= '1';
        X_sub <= '0';
        Y_sub <= '1';
        O_enb <= '0';
        if(X_lt_Y1='1') then future_state <= MENOR;
        elsif (X_gt_Y1='1') then future_state <= MAYOR;  
        else future_state <= IGUAL;
        end if;
        when IGUAL =>
        X_sel <= '0';
        Y_sel <= '0';
        X_ld <= '0';
        Y_ld <= '0';
        X_sub <= '0';
        Y_sub <= '0';
        O_enb <= '1';
        if(X_lt_Y1='1') then future_state <= IGUAL;
        elsif (X_gt_Y1='1') then future_state <= IGUAL;  
        else future_state <= IGUAL;
        end if;
        when MAYOR =>
        X_sel <= '0';
        Y_sel <= '0';
        X_ld <= '0';
        Y_ld <= '0';
        X_sub <= '0';
        Y_sub <= '0';
        O_enb <= '0';
        if(X_lt_Y1='1') then future_state <= MAYOR;
        elsif (X_gt_Y1='0') then future_state <= MAYOR;  
        else future_state <= MAYOR;
        end if;
    end case;
end process;
end arch ; -- arch