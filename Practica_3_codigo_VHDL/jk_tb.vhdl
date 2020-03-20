LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY JKFF_tb IS
END JKFF_tb;

ARCHITECTURE behavior OF JKFF_tb IS 

    COMPONENT JKFF
    PORT(
         j : IN  std_logic;
         k : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         q : OUT  std_logic;
         qb : OUT  std_logic
        );
    END COMPONENT;
    
   signal j : std_logic := '0';
   signal k : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal q : std_logic;
   signal qb : std_logic;

   constant clk_period : time := 10 ns;

BEGIN

   uut: entity work.JKFF PORT MAP (
          j => j,
          k => k,
          clk => clk,
          rst => rst,
          q => q,
          qb => qb
        );

  clk_process :process
  begin
  clk <= '0';
  wait for clk_period/2;
  clk <= '1';
  wait for clk_period/2;
  end process;

  stim_proc: process
  begin  

  rst <= '1';
  wait for 50 ns; 

  rst <= '0';
  j <= '0';
  k <= '1';
  wait for 50 ns;
  
  rst <= '0';
  j <= '1'; 
  k <= '0';
  wait for 50 ns;
  
  rst <= '0';
  j <= '1'; 
  k <= '1';
  wait for 50 ns;

  rst <= '0';
  j <= '0'; 
  k <= '0';
  wait;

  end process;

END;