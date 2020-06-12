library ieee;
use ieee.std_logic_1164.all;

entity vga_tb is
	constant period : time := 40 ns; --Reloj de 25 MHz
end entity;

architecture arch of vga_tb is

	component vga is
		GENERIC(
		h_pixels : std_logic_vector(9 downto 0); -- 800 pixeles
		v_lines :std_logic_vector(9 downto 0); -- 521 lineas
		hbp : std_logic_vector(9 downto 0) ; -- Horizontal back porch : 144
		hfp : std_logic_vector(9 downto 0) ; -- Horizontal front porch : 784
		vbp : std_logic_vector(9 downto 0) ; -- Vertical back porch : 31
		vfp : std_logic_vector(9 downto 0) ); -- Vertical front porch : 511	
		
		port (
				clk : in std_logic;
				red, green, blue : in std_logic;
				clk_out : out std_logic;
				h_sync, v_sync : out std_logic;
				r, g : out std_logic_vector(2 downto 0);
				b : out std_logic_vector(1 downto 0)
			);
	end component;
	
	signal clk : std_logic := '0';
	signal clk_out : std_logic;
	signal red, green, blue : std_logic;
	signal h_sync, v_sync : std_logic;
	signal r, g : std_logic_vector(2 downto 0);
	signal b : std_logic_vector(1 downto 0);
	constant h_pixels : std_logic_vector(9 downto 0) := "1100100000"; -- 800 pixeles
	constant v_lines :std_logic_vector(9 downto 0) := "1000001001"; -- 521 lineas
	constant hbp : std_logic_vector(9 downto 0) := "0010010000"; -- Horizontal back porch : 144
	constant hfp : std_logic_vector(9 downto 0) := "1100010000"; -- Horizontal front porch : 784
	constant vbp : std_logic_vector(9 downto 0) := "0000011111"; -- Vertical back porch : 31
	constant vfp : std_logic_vector(9 downto 0) := "0111111111"; -- Vertical front porch : 511
	
	
	begin
	
		UUT : vga generic map(h_pixels, v_lines, hbp, hfp, vbp, vfp)
		port map(clk, red, green, blue, clk_out, h_sync, v_sync, r, g, b);
		
		clk <= not clk after (period/2);
		
		red <= '1';
		green <= '0';
		blue <= '1';
		
end arch;