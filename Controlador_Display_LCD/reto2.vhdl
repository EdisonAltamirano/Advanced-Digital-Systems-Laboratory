library ieee;
use ieee.std_logic_1164.all;

entity lcd is
	port(
			CLK, RESET, RSin, RWin: in std_logic;
			DATAin: in std_logic_vector(7 downto 0);
			RS, RW, EN: out std_logic;
			DATA: out std_logic_vector(7 downto 0)
		);
end entity;

architecture behav of lcd is

type state_type is (IDLE, READY);
signal present_state : state_type := IDLE;
signal next_state : state_type;

begin
	
	process(CLK)
	begin
		if CLK'event and CLK = '1' then
			if RESET = '1' then present_state <= IDLE;
			else present_state <= next_state; end if;
		end if;
	end process;
	
	process(present_state, RSin, DATAin)
	begin
		case present_state is
			when IDLE =>
				if DATAin'event or RSin'event then next_state <= READY;
				else next_state <= IDLE; end if;
				EN <= '0';
			when READY =>
				DATA <= DATAin;
				RS <= RSin;
				RW <= RWin;
				EN <= '1';
			when others => NULL;
		end case;
	end process;
	
end architecture;
				
	
		