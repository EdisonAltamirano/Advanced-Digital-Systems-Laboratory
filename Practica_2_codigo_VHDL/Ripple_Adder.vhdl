----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:08:08 11/06/2019 
-- Design Name: 
-- Module Name:    Ripple_Adder - Behavioral 
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
use ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Ripple_Adder is
		port ( 
            A:      in  std_logic_vector (3 downto 0);
            B:      in  std_logic_vector (3 downto 0);
            Cin:    in  std_logic;
            S:      out std_logic_vector (3 downto 0);
           Cout:    out std_logic
        );
end Ripple_Adder;

architecture Behavioral of Ripple_Adder is
 
	component full_adder_vhdl_code
		Port (
			A : in std_logic;
			B : in std_logic;
			Cin : in std_logic;
			S : out std_logic;
			Cout : out std_logic);
	end component;
 
	signal c1,c2,c3: std_logic;
 
	begin

		FA1: full_adder_vhdl_code port map( A(0), B(0), Cin, S(0), c1);
		FA2: full_adder_vhdl_code port map( A(1), B(1), c1, S(1), c2);
		FA3: full_adder_vhdl_code port map( A(2), B(2), c2, S(2), c3);
		FA4: full_adder_vhdl_code port map( A(3), B(3), c3, S(3), Cout);
		
end Behavioral;

