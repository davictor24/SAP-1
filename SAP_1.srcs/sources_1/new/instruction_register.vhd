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
    Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           Li : in STD_LOGIC;
           Ei : in STD_LOGIC;
           CLR : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0);
           Q_tri : out STD_LOGIC_VECTOR (3 downto 0));
end instruction_register;

architecture Behavioral of instruction_register is

signal Q_tmp : STD_LOGIC_VECTOR (7 downto 0);

begin
    process(D, CLK, Li, Ei, CLR)
    begin
        if CLR = '1' then
            Q_tmp <= (Q_tmp'range => '0');
        elsif (rising_edge(CLK) and Li = '0') then
            Q_tmp <= D; 
        end if; 
        
        Q <= Q_tmp(7 downto 4); 
        Q_tri <= Q_tmp(3 downto 0) when Ei = '0' else (Q_tri'range => 'Z'); 
    
    end process; 

end Behavioral;
