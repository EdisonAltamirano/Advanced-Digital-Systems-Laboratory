library ieee;
use ieee.numeric_bit.all;
use ieee.std_logic_1164.all;

ENTITY addsub IS
   PORT (
      A : IN BIT_VECTOR(7 DOWNTO 0);
      B : IN BIT_VECTOR(7 DOWNTO 0); 
      T : IN BIT;
      C_FLAG : OUT BIT;
      OV_FLAG : OUT BIT;
      R : OUT BIT_VECTOR(7 DOWNTO 0)
   );
END addsub;
architecture test_adder of addsub is

--Declaracion de componente FullAdder

component full_adder_vhdl_code is
    Port ( A : in BIT;
    B : in BIT;
    Cin : in BIT;
    S : out BIT;
    Cout : out BIT);
   end component;

--Senales que se utilizan dentro del circuito

signal Cx : bit_vector(7 downto 0);
signal Bx : bit_vector(7 downto 0);
signal Sx : bit_vector(7 downto 0);
begin
	
Bx(0) <= B(0) xor T;
Bx(1) <= B(1) xor T;
Bx(2) <= B(2) xor T;
Bx(3) <= B(3) xor T;
Bx(4) <= B(4) xor T;
Bx(5) <= B(5) xor T;
Bx(6) <= B(6) xor T;
Bx(7) <= B(7) xor T;
F0 : full_adder_vhdl_code port map(A(0), Bx(0), T, Sx(0), Cx(0));
F1 : full_adder_vhdl_code port map(A(1), Bx(1), Cx(0), Sx(1), Cx(1));
F2 : full_adder_vhdl_code port map(A(2), Bx(2), Cx(1), Sx(2), Cx(2));
F3 : full_adder_vhdl_code port map(A(3), Bx(3), Cx(2), Sx(3), Cx(3));
F4 : full_adder_vhdl_code port map(A(4), Bx(4), Cx(3), Sx(4), Cx(4));
F5 : full_adder_vhdl_code port map(A(5), Bx(5), Cx(4), Sx(5), Cx(5));
F6 : full_adder_vhdl_code port map(A(6), Bx(6), Cx(5), Sx(6), Cx(6));
F7 : full_adder_vhdl_code port map(A(7), Bx(7), Cx(6), Sx(7), Cx(7));
R <= Sx;
C_FLAG <= Cx(7);
OV_FLAG <= ((A(7) and Bx(7) and (not Sx(7))) or ((not A(7)) and (not Bx(7)) and Sx(7))) or (Cx(6) xor Cx(7));
end architecture;	