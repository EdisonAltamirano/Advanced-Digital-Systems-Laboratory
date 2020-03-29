library ieee;
use ieee.numeric_bit.all;
use ieee.std_logic_1164.all;
entity Mux4to1_Counter is
    port( A1,B1,C1,D1,CLEAR: in std_logic;
    CLOCK: inout std_logic;    
    CLOCK1: out std_logic;
    MUX: out std_logic); 
end Mux4to1_Counter;

architecture Behavior of Mux4to1_Counter is
    component mux_4to1 is
        port(
    
        A,B,C,D : in STD_LOGIC;
        S0,S1: in STD_LOGIC;
        Z: out STD_LOGIC);
    end component mux_4to1;
    component bit_counter is
        port (
          clk       : in  std_logic;
          rst       : in  std_logic;
          count_out : out std_logic_vector(1 downto 0);
          carry       : out  std_logic);
      end component bit_counter;
    signal carry1: std_logic;
    signal count_out1: std_logic_vector(1 downto 0);
    begin
        FF0: bit_counter port map(clk =>CLOCK,rst => CLEAR,carry => carry1, count_out => count_out1);
        FF1: mux_4to1 port map(A => A1,B => B1,C => C1,D => D1,S0 => count_out1(0),S1 => count_out1(1),Z => MUX);
        CLOCK1 <= carry1 and Clock;
end Behavior;