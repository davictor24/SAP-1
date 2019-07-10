library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity edge_detector is
    Port ( A : in STD_LOGIC;
           X : out STD_LOGIC);
end edge_detector;

architecture Behavioral of edge_detector is

begin
    X <= A and (not A);

end Behavioral;
