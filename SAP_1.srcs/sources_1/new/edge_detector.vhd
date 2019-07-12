library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity edge_detector is
    Port ( A : in STD_LOGIC;
           X : out STD_LOGIC);
end edge_detector;

architecture Behavioral of edge_detector is

begin
    X <= A and (not A);

end Behavioral;
