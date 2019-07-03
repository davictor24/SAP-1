library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity accumulator is
    Port ( D_acc : in STD_LOGIC_VECTOR (7 downto 0);
           CLK_acc : in STD_LOGIC;
           La_acc : in STD_LOGIC;
           Ea_acc : in STD_LOGIC;
           CLR_acc : in STD_LOGIC;
           Q_acc : out STD_LOGIC_VECTOR (7 downto 0);
           Q_tri_acc : out STD_LOGIC_VECTOR (7 downto 0));
end accumulator;

architecture Behavioral of accumulator is

signal Q_tmp_acc : STD_LOGIC_VECTOR (7 downto 0);

begin
    process(D_acc, CLK_acc, La_acc, Ea_acc, CLR_acc)
    begin
        if CLR_acc = '1' then
            Q_tmp_acc <= (Q_tmp_acc'range => '0');
        elsif (rising_edge(CLK_acc) and La_acc = '0') then
            Q_tmp_acc <= D_acc; 
        end if; 
        
        Q_acc <= Q_tmp_acc; 
        Q_tri_acc <= Q_tmp_acc when Ea_acc = '1' else (Q_tri_acc'range => 'Z'); 
    
    end process; 

end Behavioral;
