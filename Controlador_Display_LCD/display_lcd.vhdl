library ieee;
use ieee.std_logic_1164.all;

entity display_lcd is
	port(
			clk, rst, rsin, rwin: in std_logic;
			data: in std_logic_vector(7 downto 0);
			rs, rw, en: out std_logic;
			q: out std_logic_vector(7 downto 0)
		);
end entity;

architecture behav of display_lcd is

type state_type is (IDLE, READY);
signal present_state : state_type := IDLE;
signal next_state : state_type;

begin
	
	process(clk)
	begin
		if clk'event and clk = '1' then
			if rst = '1' then present_state <= IDLE;
			else present_state <= next_state; end if;
		end if;
	end process;
	
	process(present_state, rsin, data)
	begin
		case present_state is
			when IDLE =>
				if data'event or rsin'event then next_state <= READY;
				else next_state <= IDLE; end if;
				en <= '0';
			when READY =>
				q <= data;
				rs <= rsin;
				rw <= rwin;
				en <= '1';
			when others => NULL;
		end case;
	end process;
	
end architecture;
				
	
		