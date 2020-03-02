----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:13:13 11/06/2019 
-- Design Name: 
-- Module Name:    multiplicador4Bits7Segment - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplicador4Bits7Segment is
	port(
		clkin : in STD_LOGIC;
		num1: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		num2: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		resultado : OUT STD_LOGIC_VECTOR (7 DOWNTO 0):= "00000000";
		display : OUT STD_LOGIC_VECTOR (2 downto 0);
		extrDisplay : OUT STD_LOGIC
	);

end multiplicador4Bits7Segment;

architecture Behavioral of multiplicador4Bits7Segment is
	component multiplicador4BitsBCD
		port(
			a: in  std_logic_vector (3 downto 0);
			b: in  std_logic_vector (3 downto 0);
			s: out std_logic_vector (11 downto 0)
		);
	end component;
	
	component decoderBCD_7
		port (
			Entrada : in   STD_LOGIC_VECTOR (3 downto 0);
         Salida  : out  STD_LOGIC_VECTOR (7 downto 0)
		);
	end component;
	
	component multiplexorBCD
		port(
			a2 : in std_logic_vector(7 downto 0);
			a1 : in std_logic_vector(7 downto 0);
			a0 : in std_logic_vector(7 downto 0);
			sel : in std_logic_vector(1 downto 0);
			res : out std_logic_vector(7 downto 0)
		);
	end component;
	
	signal bcdSignal: std_logic_vector (11 downto 0);
	signal result2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
	signal result1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
	signal result0 : STD_LOGIC_VECTOR (7 DOWNTO 0);
	
	signal cont : STD_LOGIC_VECTOR (1 DOWNTO 0) := "00";
	signal refresh_counter : STD_LOGIC_VECTOR (19 DOWNTO 0);
	
	
begin
	
	multiplicador: multiplicador4BitsBCD port map(num1, num2, bcdSignal);
	decoder7Segmentos2: decoderBCD_7 port map(bcdSignal(11 downto 8),result2);
	decoder7Segmentos1: decoderBCD_7 port map(bcdSignal(7 downto 4), result1);
	decoder7Segmentos0: decoderBCD_7 port map(bcdSignal(3 downto 0), result0);
	
	--mux: multiplexorBCD port map(result2, result1, result0, cont, resultado);
	
	extrDisplay <= '1';
	
	
	process(clkin)
	begin 
		 if(rising_edge(clkin)) then
			  refresh_counter <= std_logic_vector(unsigned(refresh_counter) + 1);
		 end if;
	end process;
	
	cont <= refresh_counter(19 downto 18);
	
	
	
	process(cont, result0, result1, result2)
	begin
		case cont is
			when "00" =>
				resultado <= result0;
			when "01" =>
				resultado <= result1;
			when "10" =>
				resultado <= result2;
			when others => 
				resultado <= "10001110";
		end case;
	end process;
	
	process(cont)
	begin
		case cont is
			when "00" =>
				display <= "011";
			when "01" =>
				display <= "101";
			when "10" =>
				display <= "110";
			when others => 
				display <= "111";
		end case;
	end process;
	
end Behavioral;
