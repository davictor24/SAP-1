library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity b_register is
    Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           Lb : in STD_LOGIC;
           CLR : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end b_register;

architecture Behavioral of b_register is

signal Q_tmp : STD_LOGIC_VECTOR (7 downto 0);

begin
    process(D, CLK, Lb, CLR)
    begin
        if CLR = '1' then
            Q_tmp <= (Q_tmp'range => '0');
        elsif (rising_edge(CLK) and Lb = '0') then
            Q_tmp <= D; 
        end if; 
        
        Q <= Q_tmp; 
    
    end process; 

end Behavioral;
