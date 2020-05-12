library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL; 
use std.textio.all;

entity display_lcd_tb is
end entity;

architecture  behav of display_lcd_tb is
	component display_lcd is
		port(
			clk, rst, rsin, rwin: in std_logic;
			data: in std_logic_vector(7 downto 0);
			rs, rw, en: out std_logic;
			q: out std_logic_vector(7 downto 0)
		);
	end component;
	
	signal clk, rst, rs, rw, en: std_logic;
	signal q: std_logic_vector(7 downto 0);
	signal qread : std_logic_vector(9 downto 0);
	
	begin
	
	LCD1: display_lcd port map(clk, rst, qread(0), qread(1), qread(9 downto 2), rs, rw, en, q);
	
	clk_process: process
	begin
		clk <= '0';
		wait for 5 ns;
		clk <= '1';
		wait for 5 ns;
	end process;
	
	leer: process
	
	variable l : line;
	variable status : file_open_status;
	variable j : integer;
	variable i   : std_logic_vector(1 to 10);
	variable separa   : string(1 to 2);
	
	file infile: text open read_mode is "lcd.txt";
	begin
		while(not endfile(infile)) loop
			readline(infile, l);
			read(l, j);	
			
		if j = 1 then qread(9) <= '1';
		else qread(9) <= '0';
		end if;
		read(l,separa);
		read(l, j);
		if j = 1 then qread(8) <= '1';
		else qread(8) <= '0';
		end if;
		read(l,separa);
		read(l, j);
		if j = 1 then qread(7) <= '1';
		else qread(7) <= '0';
		end if;
		read(l,separa);
		read(l, j);
		if j = 1 then qread(6) <= '1';
		else qread(6) <= '0';
		end if;
		read(l,separa);
		read(l, j);
		if j = 1 then qread(5) <= '1';
		else qread(5) <= '0';
		end if;
		read(l,separa);
		read(l, j);
		if j = 1 then qread(4) <= '1';
		else qread(4) <= '0';
		end if;
		read(l,separa);
		read(l, j);
		if j = 1 then qread(3) <= '1';
		else qread(3) <= '0';
		end if;
		read(l,separa);
		read(l, j);
		if j = 1 then qread(2) <= '1';
		else qread(2) <= '0';
		end if;
		read(l,separa);
		read(l, j);
		if j = 1 then qread(1) <= '1';
		else qread(1) <= '0';
		end if;
		read(l,separa);
		read(l, j);
		if j = 1 then qread(0) <= '1';
		else qread(0) <= '0';
		end if;
		end loop;
		
	end process;
	
end architecture;
	
	