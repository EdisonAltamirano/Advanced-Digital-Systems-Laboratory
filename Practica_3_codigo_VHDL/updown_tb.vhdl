library ieee;
use ieee.numeric_bit.all;

entity Decade_Counter_tb is
end Decade_Counter_tb;

architecture behaviour of Decade_Counter_tb is

	component Decade_Counter is
		port(Clear          : in bit;
			 Clock          : in bit;
			 Load           : in bit;
			 Enable         : in bit;
			 Up             : in bit; -- 'UP = 1 // Down = 0'
			 Counter_Input  : in bit_vector (3 downto 0);
			 RCO            : out bit;
			 Counter_Output : out bit_vector (3 downto 0));
	end component Decade_Counter;
	
	signal Clk : bit := '0';
	signal rst : bit := '0';
	signal enable : bit := '1';
	signal load : bit := '0';
	signal UPDN, rco : bit;
	signal cout, cin : bit_vector(3 downto 0);
	
	constant clk_period : time := 10 ns;
	
	begin
	
	UpDown: Decade_Counter port map(Clear => rst, Clock => Clk, Load => load, Enable => enable, Up => UPDN, Counter_Input => cin, RCO => rco, Counter_Output => cout);
	
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
	WAIT for 200 ns;
	
	UPDN <= '0';
	wait for 200 ns;
	
	end process;
	
end architecture;
	