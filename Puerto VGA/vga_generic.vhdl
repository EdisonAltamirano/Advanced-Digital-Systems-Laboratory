library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga is
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
end entity;

architecture arch of vga is

	signal hs, vs : std_logic;
	signal video_on : std_logic;
	signal h_count : std_logic_vector(9 downto 0) := "0000000000";
	signal v_count : std_logic_vector(9 downto 0) := "0000000000";
	signal v_counter_enable : std_logic;
	

	begin
	
		clk_out <= clk; --25 MHz
		
		
		-- Para contador horizontal
		process(clk)
		begin 
		
			if clk'event and clk = '1' then
				if h_count = std_logic_vector(unsigned(h_pixels) - 2) then
					v_counter_enable <= '1';
					h_count <= std_logic_vector(unsigned(h_count) + 1);
				elsif h_count = std_logic_vector(unsigned(h_pixels) - 1) then
					h_count <= "0000000000";
					v_counter_enable <= '0';
				else
					h_count <= std_logic_vector(unsigned(h_count) + 1);
					v_counter_enable <= '0';
				end if;
			end if;
		end process;
		
		h_sync <= '0' when unsigned(h_count) < 128 else '1';
		
		-- Para contador vertical
		process(clk)
		begin
			if (clk'event and clk = '1' and v_counter_enable = '1') then
				if v_count = std_logic_vector(unsigned(v_lines) -1) then
					v_count <= "0000000000";
				else
					v_count <= std_logic_vector(unsigned(v_count) + 1);
				end if;
			end if;
		end process;
		
		v_sync <= '0' when unsigned(v_count) < 2 else '1';
		
		video_on <= '1' when (((h_count < hfp) and (h_count >= hbp)) and ((v_count < vfp) and (v_count >= vbp))) else '0';
		
		process(video_on)
		begin
			r <= "000";
			g <= "000";
			b <= "00";
			if video_on = '1' then
				r <= red & red & red;
				g <= green & green & green;
				b <= blue & blue;
			end if;
		end process;
		
end architecture;