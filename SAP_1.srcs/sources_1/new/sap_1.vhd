library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sap_1 is
    Port ( addr : in STD_LOGIC_VECTOR (3 downto 0);
           data : in STD_LOGIC_VECTOR (7 downto 0);
           prog_run : in STD_LOGIC;
           write : in STD_LOGIC;
           clr : in STD_LOGIC;
           reset : in STD_LOGIC;
           cathodes : out STD_LOGIC_VECTOR (7 downto 0);
           display_select : out STD_LOGIC_VECTOR (3 downto 0));
end sap_1;

architecture Behavioral of sap_1 is

begin


end Behavioral;