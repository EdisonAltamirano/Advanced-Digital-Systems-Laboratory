library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity keyboard is
	port(
			keyboard_clk, keyboard_data, clk_25Mhz, reset : in std_logic;
			scan_code : out std_logic_vector(7 downto 0);
			parity : out std_logic
		);
end entity;

architecture arch of keyboard is
	
	type state_type is (start, wtclklo, wtclkhi, getkey);
	signal state : state_type;
	signal keyboard_clk_filtered, data_filtered : std_logic;
	signal keyboard_clk_filter, data_filter : std_logic_vector(7 downto 0);
	signal shift_in : std_logic_vector(10 downto 0);
	signal key_data : std_logic_vector(7 downto 0);
	signal parity_bit : std_logic;
	signal incount : unsigned(3 downto 0);
	constant incount_max : unsigned(3 downto 0) := "1011";
	
	begin
	
	clock_filter : process(clk_25Mhz, reset)
	begin
		if reset = '1' then
			keyboard_clk_filter <= (others => '0');
			data_filter <= (others => '0');
			keyboard_clk_filtered <= '1';
			data_filtered <= '1';
		elsif clk_25Mhz'event and clk_25Mhz = '1' then
			keyboard_clk_filter(7) <= keyboard_clk;
			keyboard_clk_filter(6 downto 0) <= keyboard_clk_filter(7 downto 1);
			data_filter(7) <= keyboard_data;
			data_filter(6 downto 0) <= data_filter(7 downto 1);
			
			if keyboard_clk_filter = x"FF" then
				keyboard_clk_filtered <= '1';
			elsif keyboard_clk_filter = x"00" then
				keyboard_clk_filtered <= '0';
			end if;
			
			if data_filter = x"FF" then
				data_filtered <= '1';
			elsif data_filter = x"00" then
				data_filtered <= '0';
			end if;
		end if;
	end process;
	
	
	state_machine : process(clk_25Mhz, reset)
	begin
		if reset = '1' then
			state <= start;
			incount <= (others => '0');
			shift_in <= (others => '0');
			key_data <= (others => '0');
		elsif clk_25Mhz'event and clk_25Mhz = '1' then
			case state is
			
				when start =>
					if data_filtered = '1' then
						state <= start;
					else
						state <= wtclklo;
					end if;
					
				when wtclklo =>
					if incount < incount_max then
						if keyboard_clk_filtered = '1' then
							state <= wtclklo;
						else
							state <= wtclkhi;
							shift_in <= data_filtered & shift_in(10 downto 1);
						end if;
					else
						state <= getkey;
					end if;
					
				when wtclkhi =>
					if keyboard_clk_filtered = '0' then
						state <= wtclkhi;
					else
						state <= wtclklo;
						incount <= incount + 1;
					end if;
					
				when getkey =>
					key_data <= shift_in(8 downto 1);
					parity_bit <= shift_in(9);
					incount <= (others => '0');
					state <= wtclklo;
			end case;
		end if;
	end process;
	
	scan_code <= key_data;
	parity <= parity_bit;
	
end architecture;