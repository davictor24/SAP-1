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
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           S : out STD_LOGIC_VECTOR (7 downto 0);
           Su : in STD_LOGIC;
           Eu : in STD_LOGIC);
end adder_subtractor;

architecture Behavioral of adder_subtractor is

signal result : STD_LOGIC_VECTOR (8 downto 0);

begin
    result <= ('0' & A) + ('0' & B) when Su = '0' else ('0' & A) - ('0' & B); 
    S <= result(7 downto 0) when Eu = '1' else (S'range => 'Z'); 
    
end Behavioral;
