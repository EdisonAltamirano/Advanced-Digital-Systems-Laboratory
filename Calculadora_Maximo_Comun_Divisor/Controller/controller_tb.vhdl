library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity controller_tb is
end;

architecture bench of controller_tb is

  component controller 
      port(
          X_i, Y_i : out std_logic_vector(3 downto 0);
          X_sel, Y_sel: out std_logic;
          X_ld, Y_ld : out std_logic;
          X_sub, Y_sub : out std_logic;
          O_enb : out std_logic;
          timer : in std_logic;
          X_gt_Y, X_eq_Y, X_lt_Y : in std_logic
          );
  end component;

  signal X_i, Y_i: std_logic_vector(3 downto 0);
  signal X_sel, Y_sel: std_logic;
  signal X_ld, Y_ld: std_logic;
  signal X_sub, Y_sub: std_logic;
  signal O_enb: std_logic;
  signal timer: std_logic;
  signal X_gt_Y, X_eq_Y, X_lt_Y: std_logic ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: controller port map ( X_i    => X_i,
                             Y_i    => Y_i,
                             X_sel  => X_sel,
                             Y_sel  => Y_sel,
                             X_ld   => X_ld,
                             Y_ld   => Y_ld,
                             X_sub  => X_sub,
                             Y_sub  => Y_sub,
                             O_enb  => O_enb,
                             timer  => timer,
                             X_gt_Y => X_gt_Y,
                             X_eq_Y => X_eq_Y,
                             X_lt_Y => X_lt_Y );

  stimulus: process
  begin
  
    -- Put initialisation code here


    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      timer <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
  