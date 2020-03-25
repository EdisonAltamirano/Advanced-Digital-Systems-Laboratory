library ieee;
use ieee.numeric_bit.all;

entity CascadeCounter_tb is
end CascadeCounter_tb;

architecture behaviour of CascadeCounter_tb is

	component CascadeCounter is
		port (Clear1, Clear2, Clock, Up: in bit; C_Output1, C_Output2: out bit_vector (3 downto 0));
	end component CascadeCounter;
	
	signal Clk : bit := '0';
	signal rst : bit := '0';
	signal UPDN, rco : bit;
	signal cout1, cout2: bit_vector(3 downto 0);
	
	constant clk_period : time := 10 ns;
	
	begin
	
	UpDown: CascadeCounter port map(Clear1 => rst, Clear2 => rst, Clock => Clk, Up => UPDN, C_Output1 => cout1, C_Output2 => cout2);
	
	clk_process :process
	begin
	clk <= '0';
	wait for clk_period/2;
	clk <= '1';
	wait for clk_period/2;
	end process; 
	
	startup : process
	begin
	
	rst <= '1';
	wait for 5 ns;
	
	rst <= '0';
	wait for 100 ms;
	
	end process;
	
	upydown : process
	begin
	
	UPDN <= '1';
	WAIT for 234 ns;
	
	UPDN <= '0';
	wait for 234 ns;
	
	end process;
	
end architecture;
	