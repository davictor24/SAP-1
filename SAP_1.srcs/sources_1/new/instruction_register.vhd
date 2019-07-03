library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instruction_register is
    Port ( D_i : in STD_LOGIC_VECTOR (7 downto 0);
           CLK_i : in STD_LOGIC;
           Li_i : in STD_LOGIC;
           Ei_i : in STD_LOGIC;
           CLR_i : in STD_LOGIC;
           Q_i : out STD_LOGIC_VECTOR (3 downto 0);
           Q_tri_i : out STD_LOGIC_VECTOR (3 downto 0));
end instruction_register;

architecture Behavioral of instruction_register is

signal Q_tmp_i : STD_LOGIC_VECTOR (7 downto 0);

begin
    process(D_i, CLK_i, Li_i, Ei_i, CLR_i)
    begin
        if CLR_i = '1' then
            Q_tmp_i <= (Q_tmp_i'range => '0');
        elsif (rising_edge(CLK_i) and Li_i = '0') then
            Q_tmp_i <= D_i; 
        end if; 
        
        Q_i <= Q_tmp_i(7 downto 4); 
        Q_tri_i <= Q_tmp_i(3 downto 0) when Ei_i = '0' else (Q_tri_i'range => 'Z'); 
    
    end process; 

end Behavioral;
