library ieee;
use ieee.std_logic_1164.all;

entity JKFF is
port(
j: in std_logic;
k: in std_logic;
clk: in std_logic;
rst: in std_logic;
q: out std_logic;
qb: out std_logic);
end JKFF;

architecture behavioral of JKFF is
signal temp : std_logic;
begin

process(j,k,clk,rst)
begin

if(rst='1') then
 temp <= '0';
elsif (rising_edge(clk)) then
 if(j/=k) then
  temp <= j;
 elsif(j='1' and k='1') then
  temp <= not temp;
  elsif(j='0' and k='0') then
  temp <= temp;
 end if;
end if;
end process;

q <= temp;
qb <= not temp;

end behavioral;