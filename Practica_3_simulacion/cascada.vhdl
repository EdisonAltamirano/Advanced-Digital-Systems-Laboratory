library ieee;
use ieee.numeric_bit.all;

entity CascadeCounter is
	port (Clear1, Clear2, Clock, Up: in bit; C_Output1, C_Output2: out bit_vector (3 downto 0));
end CascadeCounter;

architecture behaviour of CascadeCounter is

	component Decade_Counter is
		Port ( Clear          : in bit;
			 Clock          : in bit;
			 Load           : in bit;
			 Enable         : in bit;
			 Up             : in bit; -- 'UP = 1 // Down = 0'
			 Counter_Input  : in bit_vector (3 downto 0);
			 RCO            : out bit;
			 Counter_Output : out bit_vector (3 downto 0));

	end component Decade_Counter;
	
	signal enable2, RCO1, RCO2: bit;
	
	begin
	
	FF0: Decade_Counter port map (Clear => Clear1, Clock => Clock, Load => '0', Enable => '1', Up => Up, RCO => RCO1, Counter_Input => "0000", Counter_Output => C_Output1);
	FF1: Decade_Counter port map (Clear => Clear2, Clock => Clock, Load => '0', Enable => RCO1, Up => Up, RCO => RCO2, Counter_Input => "0000", Counter_Output => C_Output2);

end architecture behaviour;	