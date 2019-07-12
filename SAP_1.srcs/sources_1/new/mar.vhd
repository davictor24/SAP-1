library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mar is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           CLK : in STD_LOGIC;
           Lm : in STD_LOGIC;
           CLR : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end mar;

architecture Behavioral of mar is

signal Q_tmp : STD_LOGIC_VECTOR (3 downto 0);

begin
    process(D, CLK, Lm, CLR)
    begin
        if CLR = '1' then
            Q_tmp <= (Q_tmp'range => '0');
        elsif (rising_edge(CLK) and Lm = '0') then
            Q_tmp <= D; 
        end if; 
        
        Q <= Q_tmp; 
    
    end process; 

end Behavioral;
