LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY testBench2 IS
END testBench2;
 
ARCHITECTURE behavior OF testBench2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplicador4Bits7Segment
    PORT(
         clk : IN  std_logic;
         num1 : IN  std_logic_vector(3 downto 0);
         num2 : IN  std_logic_vector(3 downto 0);
         resultado : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal num1 : std_logic_vector(3 downto 0) := (others => '0');
   signal num2 : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal resultado : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplicador4Bits7Segment PORT MAP (
          clk => clk,
          num1 => num1,
          num2 => num2,
          resultado => resultado
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		num1 <= "0101";
		num2 <= "0101";
		
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;