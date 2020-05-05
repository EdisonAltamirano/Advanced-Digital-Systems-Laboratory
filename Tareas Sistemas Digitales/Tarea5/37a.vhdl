library ieee;
library ieee.numeric_bit.all
entity p2_37a is
    port(
        x,clk:in bit;
        s, v: out bit)
    );
end p2_37a;

architecture test of p2_37 is
    type statetable is array
        (integer range <>, bit range <>) of integer;
    type outtable is array
        (integer range <>, bit range <>) of bit_vector(1 downto 0);
signal state, nextstate: integer := 0;
signal sv: bit_vector(1 downto 0);
constant st: statetable(0 to 5, '0' to '1') :=
    ((1,1), (2,4), (3,3), (0,0),
     (3,5), (0,0));
constant ot: outtable(0 to 5, '0' to '1') :=
    (("00","10"), ("10","00"), ("00","10"), ("00","10"),
    ("10","00"), ("10","01");
begin
    nextstate <= st(state,x);
    sv <= ot(state,x);
    s <= sv(1); --Alternate method s <= ot(state,x)(1)
    v <= sv(0); --                 v <= ot(state,x)(0)
    process(clk)
    begin
        if clk'event and clk = '0' then
            state <= nextstate;
        end if;
    end process;
end test;