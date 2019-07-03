library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mar is
    Port ( D_m : in STD_LOGIC_VECTOR (3 downto 0);
           CLK_m : in STD_LOGIC;
           Lm_m : in STD_LOGIC;
           CLR_m : in STD_LOGIC;
           Q_m : out STD_LOGIC_VECTOR (3 downto 0));
end mar;

architecture Behavioral of mar is

signal Q_tmp_m : STD_LOGIC_VECTOR (3 downto 0);

begin
    process(D_m, CLK_m, Lm_m, CLR_m)
    begin
        if CLR_m = '1' then
            Q_tmp_m <= (Q_tmp_m'range => '0');
        elsif (rising_edge(CLK_m) and Lm_m = '0') then
            Q_tmp_m <= D_m; 
        end if; 
        
        Q_m <= Q_tmp_m; 
    
    end process; 

end Behavioral;
