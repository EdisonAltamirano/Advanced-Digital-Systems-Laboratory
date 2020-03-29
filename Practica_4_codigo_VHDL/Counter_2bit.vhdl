library ieee;
use ieee.std_logic_1164.all;

entity bit_counter is
  port (
    clk       : in  std_logic;
    rst       : in  std_logic;
    count_out : out std_logic_vector(1 downto 0);
    carry : out std_logic);
end bit_counter;

architecture bit_counter_ar of bit_counter is

-- Defining Internal Signals

signal sig1,sig2 : std_logic;
  signal count_out_sig : std_logic_vector (1 downto 0);
signal carrys: std_logic;
begin  -- 2bit_counter_ar

   process (clk, rst)
-- purpose: sequential part of counter
  -- type   : sequential
  -- inputs : clk, rst
  -- outputs:

  begin  -- process
    if rst = '1' then                   -- asynchronous reset (active high)
      count_out_sig <= "00";
      carrys <= '0';
    elsif clk'event and clk = '1' then  -- rising clock edge
      if count_out_sig = "11" then
        carrys <= '1';
        end if;
      count_out_sig(0) <= sig1;
      count_out_sig(1) <= sig2;
    end if;
  end process;

-- Combinational Logic 

  sig1 <= not count_out_sig(0);
  sig2 <= count_out_sig(1) xor count_out_sig(0);
  count_out <= count_out_sig;
  carry <= carrys;
end bit_counter_ar;