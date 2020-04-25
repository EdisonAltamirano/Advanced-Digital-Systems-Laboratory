library ieee;
use ieee.numeric_bit.all;
use ieee.std_logic_1164.all;
entity mod60_Counter is
    port(
    clk, reset: in std_logic;
    x: out std_logic_vector(3 downto 0);    
    y: out std_logic_vector(3 downto 0); 
    z: out std_logic_vector(3 downto 0));     
end mod60_Counter;

architecture test of mod60_Counter is
    component mod10_counter is
        port(
           clk, reset: in std_logic;
           q: out std_logic_vector(3 downto 0);
           en: out std_logic
        );
    end component mod10_counter;
    component mod6_counter is
        port(
           clk, reset: in std_logic;
           q: out std_logic_vector(3 downto 0);
           en: out std_logic
        );
    end component mod6_counter;
    component mod13_counter is
        port(
           clk, reset: in std_logic;
           q: out std_logic_vector(3 downto 0);
           en: out std_logic
        );
    end component mod13_counter; 
    signal q1: std_logic_vector(3 downto 0);
    signal q2: std_logic_vector(3 downto 0);
    signal q3: std_logic_vector(3 downto 0);
    signal en: std_logic;
    signal en1: std_logic;
    signal en2: std_logic;
    begin
        FF0: mod10_counter port map(clk =>clk,reset => reset, q => q1,en => en);
        FF1: mod6_counter port map(clk => en,reset => reset, q => q2,en => en1);
        FF2: mod13_counter port map(clk =>en1,reset => reset, q => q3, en => en2);
        x <= q1;
        y <= q2;
        z <= q3;
 end test;