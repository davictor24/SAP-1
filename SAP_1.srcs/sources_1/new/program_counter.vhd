library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity program_counter is
    Port ( Cp : in STD_LOGIC;
           Ep : in STD_LOGIC;
           CLK : in STD_LOGIC;
           CLR : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0) := "0000");
end program_counter;

architecture Behavioral of program_counter is
begin
    process(Cp, Ep, CLK, CLR)
        variable Q_tmp : STD_LOGIC_VECTOR (3 downto 0) := Q; 
    begin
        if CLR = '1' then
            Q_tmp := "0000";
        elsif (falling_edge(CLK) and Cp = '1') then
            Q_tmp := Q_tmp + 1; 
        end if; 
        Q <= Q_tmp when Ep = '1' else "ZZZZ"; 
    end process; 

end Behavioral;
