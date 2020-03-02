----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:07:27 11/06/2019 
-- Design Name: 
-- Module Name:    multiplicador4Bits - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity multiplicador4Bits is 
	port (
		x: in  std_logic_vector (3 downto 0);
		y: in  std_logic_vector (3 downto 0);
		r: out std_logic_vector (7 downto 0)
    );
end entity multiplicador4Bits;

architecture structural of multiplicador4Bits is

component Ripple_Adder
	port ( 
		A:      in  std_logic_vector (3 downto 0);
		B:      in  std_logic_vector (3 downto 0);
		Cin:    in  std_logic;
		S:      out std_logic_vector (3 downto 0);
		Cout:    out std_logic
	);
end component; 

signal A0, A1, A2:  std_logic_vector (3 downto 0);
signal B0, B1, B2:  std_logic_vector (3 downto 0);
signal halfAdder: std_logic;

begin
   A0 <= (x(3) nand y(1), x(3) nand y(0), x(2) and y(0), x(1) and y(0));
   A1 <= (x(3) nand y(2), x(2) and y(2), x(1) and y(2), x(0) and y(2));
   A2 <= (x(3) and y(3), x(2) nand y(3), x(1) nand y(3), x(0) nand y(3));
   B0 <=  ('1',          x(2) and y(1), x(1) and y(1), x(0) and y(1));
	Ripple_Adder1: 
		Ripple_Adder 
			port map (
				a => A0,
				b => B0,
				cin => '0',
				cout => B1(3),
				S(3) => B1(2),
				S(2) => B1(1),
				S(1) => B1(0),
				S(0) => r(1)
	);
	-- Stimulus process
stim_proc: process
begin
-- hold reset state for 100 ns.
wait for 100 ns;
A0 <= "0110";
B0 <= "1100";
B1 <= "1101";
 
wait for 100 ns;
A0 <= "1101";
B0 <= "1010";
B1 <= "1111"; 
wait for 100 ns;
A0 <= "0111";
B0 <= "0110";
B1 <= "0101";
 
wait for 100 ns;
A0 <= "1110";
B0 <= "0110";
B1 <= "1111";
 
wait for 100 ns;
A0 <= "0111";
B0 <= "1101";
B1 <= "0101";
 
wait;
 
end process;
	Ripple_Adder2: 
		Ripple_Adder 
			port map (
				a => A1,
				b => B1,
				cin => '0',
				cout => B2(3),
				S(3) => B2(2),
				S(2) => B2(1),
				S(1) => B2(0),
				S(0) => r(2)
	);
	Ripple_Adder3: 
		Ripple_Adder 
			port map (
				a => A2,
				b => B2,
				cin => '0',
				cout => halfAdder,
				S => r(6 downto 3)
	);
	r(0) <= x(0) and y(0); 
	r(7) <= '1' xor halfAdder;
end architecture structural;