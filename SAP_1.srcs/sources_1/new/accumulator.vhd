library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity accumulator is
    Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           La : in STD_LOGIC;
           Ea : in STD_LOGIC;
           CLR : in STD_LOGIC;
           Q : inout STD_LOGIC_VECTOR (7 downto 0);
           Q_tri : out STD_LOGIC_VECTOR (7 downto 0));
end accumulator;

architecture Behavioral of accumulator is
begin
    process(D, CLK, La, Ea, CLR)
    begin
        if CLR = '1' then
            Q <= (others => '0');
        elsif (rising_edge(CLK) and La = '0') then
            Q <= D; 
        end if; 
        Q_tri <= Q when Ea = '1' else (others => 'Z'); 
    end process; 

end Behavioral;
