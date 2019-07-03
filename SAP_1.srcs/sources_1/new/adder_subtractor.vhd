library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder_subtractor is
    Port ( A_adder : in STD_LOGIC_VECTOR (7 downto 0);
           B_adder : in STD_LOGIC_VECTOR (7 downto 0);
           Sum_adder : out STD_LOGIC_VECTOR (7 downto 0);
           Su_adder : in STD_LOGIC;
           Eu_adder : in STD_LOGIC);
end adder_subtractor;

architecture Behavioral of adder_subtractor is

signal result : STD_LOGIC_VECTOR (8 downto 0);

begin
    result <= ('0' & A_adder) + ('0' & B_adder) when Su_adder = '0' else ('0' & A_adder) - ('0' & B_adder); 
    Sum_adder <= result(7 downto 0) when Eu_adder = '1' else (Sum_adder'range => 'Z'); 
    
end Behavioral;
