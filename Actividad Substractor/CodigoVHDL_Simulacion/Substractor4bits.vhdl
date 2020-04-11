library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity subtractor_4bit is
     port(
         a : in STD_LOGIC_VECTOR(3 downto 0);
         b : in STD_LOGIC_VECTOR(3 downto 0);
         borrow : out STD_LOGIC;
         diff : out STD_LOGIC_VECTOR(3 downto 0)
         );
end subtractor_4bit;

architecture subtractor_4bit_arc of subtractor_4bit is  

Component fa is
    port (a : in STD_LOGIC;
          b : in STD_LOGIC;
          c : in STD_LOGIC;
          sum : out STD_LOGIC;
          carry : out STD_LOGIC
          );
end component;      

signal s : std_logic_vector (2 downto 0);
signal l : std_logic_vector (3 downto 0);

begin  
  
    l <= not b;
  
    u0 : fa port map (a(0),l(0),'1',diff(0),s(0));
    u1 : fa port map (a(1),l(1),s(0),diff(1),s(1));
    u2 : fa port map (a(2),l(2),s(1),diff(2),s(2));
    ue : fa port map (a(3),l(3),s(2),diff(3),borrow);    
  

end subtractor_4bit_arc;             