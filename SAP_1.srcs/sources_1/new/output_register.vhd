library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity output_register is
    Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           Lo : in STD_LOGIC;
           CLR : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end output_register;

architecture Behavioral of output_register is
begin
    process(D, CLK, Lo, CLR)
    begin
        if CLR = '1' then
            Q <= (others => '0');
        elsif (rising_edge(CLK) and Lo = '0') then
            Q <= D; 
        end if; 
    end process; 

end Behavioral;
