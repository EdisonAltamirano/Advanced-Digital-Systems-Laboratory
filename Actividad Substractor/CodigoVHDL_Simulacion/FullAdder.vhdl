library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity fa is
    port (a : in STD_LOGIC;
          b : in STD_LOGIC;
          c : in STD_LOGIC;
          sum : out STD_LOGIC;
          carry : out STD_LOGIC
          );
end fa;

architecture fa_arc of fa is

begin
  
    sum <= a xor b xor c;
    carry <= (a and b) or (b and c) or (c and a);
  
end fa_arc;