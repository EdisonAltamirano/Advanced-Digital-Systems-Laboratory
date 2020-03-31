LIBRARY ieee;
use ieee.numeric_bit.all;
use ieee.std_logic_1164.all;
 
ENTITY Testbench_full_adder IS
END Testbench_full_adder;
 
ARCHITECTURE behavior OF Testbench_full_adder IS
 
 -- Component Declaration for the Unit Under Test (UUT)
 
 COMPONENT full_adder_vhdl_code
 PORT(
 A : IN BIT;
 B : IN BIT;
 Cin : IN BIT;
 S : OUT BIT;
 Cout : OUT BIT
 );
 END COMPONENT;
 
 --Inputs
 signal A : BIT := '0';
 signal B : BIT := '0';
 signal Cin : BIT := '0';
 
 --Outputs
 signal S : BIT;
 signal Cout : BIT;
 
BEGIN
 
 -- Instantiate the Unit Under Test (UUT)
 uut: full_adder_vhdl_code PORT MAP (
 A => A,
 B => B,
 Cin => Cin,
 S => S,
 Cout => Cout
 );
 
 -- Stimulus process
 stim_proc: process
 begin
 -- hold reset state for 100 ns.
 wait for 100 ns;
 
 -- insert stimulus here
 A <= '1';
 B <= '0';
 Cin <= '0';
 wait for 10 ns;
 
 A <= '0';
 B <= '1';
 Cin <= '0';
 wait for 10 ns;
 
 A <= '1';
 B <= '1';
 Cin <= '0';
 wait for 10 ns;
 
 A <= '0';
 B <= '0';
 Cin <= '1';
 wait for 10 ns;
 
 A <= '1';
 B <= '0';
 Cin <= '1';
 wait for 10 ns;
 
 A <= '0';
 B <= '1';
 Cin <= '1';
 wait for 10 ns;
 
 A <= '1';
 B <= '1';
 Cin <= '1';
 wait for 10 ns;
 
 end process;
 
END;