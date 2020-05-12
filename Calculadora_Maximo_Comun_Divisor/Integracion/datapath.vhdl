library ieee;
use ieee.std_logic_1164.all;

entity datapath is
	port(
			X_i, Y_i : in std_logic_vector(3 downto 0);
			X_sel, Y_sel: in std_logic;
			X_ld, Y_ld : in std_logic;
			X_sub, Y_sub : in std_logic;
			O_enb : in std_logic;
			Clk : in std_logic;
			X_gt_Y, X_eq_Y, X_lt_Y : out std_logic;
			Data_o : out std_logic_vector(3 downto 0)
		);
end datapath;

architecture behav of datapath is

	component register4bits is
		port(
			d : in std_logic_vector(3 downto 0);
			clk, ld, rst : in std_logic;
			q : out std_logic_vector(3 downto 0)
		);
	end component;
	
	component mux is
		port (
				x, y : in std_logic_vector(3 downto 0);
				sel : in std_logic;
				res : out std_logic_vector(3 downto 0)
			);
	end component;
	
	component Substracter4 is
		port (A, B : in std_logic_vector(3 downto 0); Cin : in std_logic; S : out std_logic_vector(3 downto 0); Cout : out std_logic);
	end component;
	
	component comparator is
		port(
			X, Y : in std_logic_vector(3 downto 0);
			xy_eq, xy_gt, xy_lt : out std_logic;
			R : out std_logic_vector(3 downto 0)
		);
	end component;

	signal r_mux_x, r_mux_y : std_logic_vector(3 downto 0);
	signal reg_x, reg_y : std_logic_vector(3 downto 0);
	signal r_comparator : std_logic_vector(3 downto 0);
	signal r_sub_x, r_sub_y : std_logic_vector(3 downto 0);
	signal Co_x, Co_y : std_logic;
	
	begin
	
		MUX_X : mux port map(X_i, r_sub_x, X_sel, r_mux_x);
		MUX_Y : mux port map(Y_i, r_sub_y, Y_sel, r_mux_y);
		
		REGISTER_X : register4bits port map(r_mux_x, Clk, X_ld, '0', reg_x);
		REGISTER_Y : register4bits port map(r_mux_y, Clk, Y_ld, '0', reg_y);
		
		COMP : comparator port map(reg_x, reg_y, X_eq_Y, X_gt_Y, X_lt_Y, r_comparator);
		
		SUB_X : Substracter4 port map(reg_x, reg_y, X_sub, r_sub_x, Co_x);
		SUB_Y : Substracter4 port map(reg_y, reg_x, Y_sub, r_sub_y, Co_y);
		
		REG_OUT : register4bits port map(r_comparator, Clk, O_enb, '0', Data_o);
		
end architecture;
	