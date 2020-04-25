library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity mod10_counter is
   port(
      clk, reset: in std_logic;
      q: out std_logic_vector(3 downto 0);
      en: out std_logic
   );
end mod10_counter;

architecture two_seg_arch of mod10_counter is
   constant TEN: integer := 10;
   signal r_reg: unsigned(3 downto 0);
   signal r_next: unsigned(3 downto 0);
   signal en1: std_logic;
begin
   -- register
   process(clk,reset)
   begin
      if (reset='1') then
         r_reg <= (others=>'0');
      elsif (clk'event and clk='1') then
         r_reg <= r_next;
      end if;
      if (r_reg = "1001") then
         en1 <= '1';
         else
            en1 <= '0';
      end if;
   end process;
   -- next-state logic
   r_next <= (others=>'0') when r_reg=(TEN-1) else
             r_reg + 1;

   -- output logic
   q <= std_logic_vector(r_reg);
   en <= en1;
end two_seg_arch;
