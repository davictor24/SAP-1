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

entity presettable_counter is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           CLK : in STD_LOGIC;
           CLR : in STD_LOGIC;
           count_load : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end presettable_counter;

architecture Behavioral of presettable_counter is

signal Q_tmp : STD_LOGIC_VECTOR (3 downto 0);

begin
    process(D, CLK, CLR, count_load)
    begin
        if CLR = '1' then
            Q_tmp <= (Q_tmp'range => '0');
        elsif rising_edge(CLK) then
            if count_load = '0' then
                Q_tmp <= Q_tmp + 1;
            else
                Q_tmp <= D;
            end if;
        end if; 
        
        Q <= Q_tmp;
    end process;
    
end Behavioral;
