library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity subtractor_4bit_tb is
end;

architecture bench of subtractor_4bit_tb is

  component subtractor_4bit
       port(
           a : in STD_LOGIC_VECTOR(3 downto 0);
           b : in STD_LOGIC_VECTOR(3 downto 0);
           borrow : out STD_LOGIC;
           diff : out STD_LOGIC_VECTOR(3 downto 0)
           );
  end component;

  signal a: STD_LOGIC_VECTOR(3 downto 0);
  signal b: STD_LOGIC_VECTOR(3 downto 0);
  signal borrow: STD_LOGIC;
  signal diff: STD_LOGIC_VECTOR(3 downto 0) ;

begin

  uut: subtractor_4bit port map ( a      => a,
                                  b      => b,
                                  borrow => borrow,
                                  diff   => diff );

  stimulus: process
  begin
  
    -- Put initialisation code here
    a(0) <= '0';
    a(1) <= '0';
    a(2) <= '1';
    a(3) <= '1';
    b(0) <= '0';
    b(1) <= '1';
    b(2) <= '0';
    b(3) <= '0';
    wait for 5 ns;
    a(0) <= '0';
    a(1) <= '1';
    a(2) <= '0';
    a(3) <= '1';
    b(0) <= '0';
    b(1) <= '1';
    b(2) <= '0';
    b(3) <= '0';
    wait for 5 ns;
    a(0) <= '1';
    a(1) <= '1';
    a(2) <= '0';
    a(3) <= '0';
    b(0) <= '0';
    b(1) <= '1';
    b(2) <= '1';
    b(3) <= '1';
    wait for 5 ns;
    a(0) <= '0';
    a(1) <= '1';
    a(2) <= '1';
    a(3) <= '0';
    b(0) <= '1';
    b(1) <= '1';
    b(2) <= '1';
    b(3) <= '1';
    wait for 5 ns;

    -- Put test bench stimulus code here

    wait;
  end process;


end;