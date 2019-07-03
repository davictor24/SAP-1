library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity output_register is
    Port ( D_o : in STD_LOGIC_VECTOR (7 downto 0);
           CLK_o : in STD_LOGIC;
           Lo_o : in STD_LOGIC;
           CLR_o : in STD_LOGIC;
           Q_o : out STD_LOGIC_VECTOR (7 downto 0));
end output_register;

architecture Behavioral of output_register is

signal Q_tmp_o : STD_LOGIC_VECTOR (7 downto 0);

begin
    process(D_o, CLK_o, Lo_o, CLR_o)
    begin
        if CLR_o = '1' then
            Q_tmp_o <= (Q_tmp_o'range => '0');
        elsif (rising_edge(CLK_o) and Lo_o = '0') then
            Q_tmp_o <= D_o; 
        end if; 
        
        Q_o <= Q_tmp_o; 
    
    end process; 

end Behavioral;
