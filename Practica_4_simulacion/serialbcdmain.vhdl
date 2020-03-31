library ieee;
use ieee.std_logic_1164.all;

entity serialbcdmain is
	port (
			Imsb, Imsa, Ilsa, Ilsb : in std_logic;
			clock, reset : in std_logic;
			Omsb, Omsa, Olsa, Olsb : out std_logic
		);
end entity;

architecture behav of serialbcdmain is

	component decoder is
		port (
			sel : in std_logic_vector(3 downto 0);
			r : out std_logic_vector(15 downto 0)
		);
	end component;
	
	component mux1bit is
		port (
			x, y : in std_logic_vector(3 downto 0);
			sel : in std_logic;
			res : out std_logic_vector(3 downto 0)
		);
	end component;
	
	component DFF is
		port (Clk, D, Clr, Set, Enable : in std_logic; Q : out std_logic);
	end component;
	
	signal inmux : std_logic_vector(3 downto 0);
	signal decoder1, decoder2 : std_logic_vector(15 downto 0);
	signal q : std_logic_vector(3 downto 0);
	signal selmux : std_logic;
	signal resmux : std_logic_vector(3 downto 0);
	signal d0, d1, d2, d3 : std_logic;
	
	begin
	
		MUX : mux1bit port map(inmux, inmux, selmux, resmux);
		DEC1 : decoder port map(q, decoder1);
		DEC2 : decoder port map(resmux, decoder2);
		DFF0 : DFF port map(clock, d0, reset, '0', '1', q(0));
		DFF1 : DFF port map(clock, d1, reset, '0', '1', q(1));
		DFF2 : DFF port map(clock, d2, reset, '0', '1', q(2));
		DFF3 : DFF port map(clock, d3, reset, '0', '1', q(3));
		
		inmux(0) <= Ilsb;
		inmux(1) <= Ilsa;
		inmux(2) <= Imsa;
		inmux(3) <= Imsb;
		
		selmux <= decoder1(10) or decoder1(11) or decoder1(12) or decoder1(13) or decoder1(14) or decoder1(15);
		
		d0 <= decoder2(5) or decoder2(6) or decoder2(7) or decoder2(8) or decoder2(9);
		d1 <= decoder2(4) or decoder2(9);
		d2 <= decoder2(2) or decoder2(3) or decoder2(7) or decoder2(8);
		d3 <= decoder2(1) or decoder2(3) or decoder2(6) or decoder2(8);
		
		Omsb <= q(0);
		Omsa <= q(1);
		Olsa <= q(2);
		Olsb <= q(3);
		
end architecture;