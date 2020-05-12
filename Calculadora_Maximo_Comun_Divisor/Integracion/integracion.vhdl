library ieee;
use ieee.std_logic_1164.all;

entity calcmcm is
	port(
			Clk: in std_logic;
			X_i, Y_i: in std_logic_vector(3 downto 0);
			Data_o: out std_logic_vector(3 downto 0)
		);
end calcmcm;

architecture arch of calcmcm is
	
	component datapath is
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
	end component;
	
	component controller is
		port(
        X_sel, Y_sel: out std_logic;
        X_ld, Y_ld : out std_logic;
        X_sub, Y_sub : out std_logic;
        O_enb : out std_logic;
        timer : in std_logic;
        X_gt_Y, X_eq_Y, X_lt_Y : in std_logic
        );
	end component;
	
	signal X_sel, Y_sel, X_ld, Y_ld, X_sub, Y_sub, O_enb, X_gt_Y, X_eq_Y, X_lt_Y: std_logic;
	
	begin
	
		DPATH: datapath port map(X_i, Y_i, X_sel, Y_sel, X_ld, Y_ld, X_sub, Y_sub, O_enb, Clk, X_gt_Y, X_eq_Y, X_lt_Y, Data_o);
		CONTR: controller port map(X_sel, Y_sel, X_ld, Y_ld, X_sub, Y_sub, O_enb, Clk, X_gt_Y, X_eq_Y, X_lt_Y);
		
end arch;