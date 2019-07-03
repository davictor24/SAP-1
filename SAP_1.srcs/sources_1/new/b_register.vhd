library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity b_register is
    Port ( D_b : in STD_LOGIC_VECTOR (7 downto 0);
           CLK_b : in STD_LOGIC;
           Lb_b : in STD_LOGIC;
           CLR_b : in STD_LOGIC;
           Q_b : out STD_LOGIC_VECTOR (7 downto 0));
end b_register;

architecture Behavioral of b_register is

signal Q_tmp_b : STD_LOGIC_VECTOR (7 downto 0);

begin
    process(D_b, CLK_b, Lb_b, CLR_b)
    begin
        if CLR_b = '1' then
            Q_tmp_b <= (Q_tmp_b'range => '0');
        elsif (rising_edge(CLK_b) and Lb_b = '0') then
            Q_tmp_b <= D_b; 
        end if; 
        
        Q_b <= Q_tmp_b; 
    
    end process; 

end Behavioral;
