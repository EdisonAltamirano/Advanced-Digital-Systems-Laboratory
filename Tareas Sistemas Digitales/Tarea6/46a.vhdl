library ieee;
library ieee.numeric_bit.all;

entity ROM4_3 is
    port(ROMin: in unsigned(0 to 3));
        ROMout:out unsigned(0 to 2));
end ROM4_3;

architecture test of ROM4_3 is
    type ROM16x3 is array (0 to 15) of unsigned(0 to 2);
    constant ROM1: ROM16X3 := ("000","001","001","010",
    "010","011","001","010","010","011","010","011","011","100");
    signal index: integer range 0 to 15;
begin
    index <= to_integer(ROMin);
    ROMout <= ROM1(index);
end test;
