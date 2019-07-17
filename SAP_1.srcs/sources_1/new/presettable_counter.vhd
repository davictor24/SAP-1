library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity presettable_counter is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           CLK : in STD_LOGIC;
           CLR : in STD_LOGIC;
           count_load : in STD_LOGIC;
           Q : inout STD_LOGIC_VECTOR (3 downto 0) := "0000");
end presettable_counter;

architecture Behavioral of presettable_counter is

signal count_load_temp : STD_LOGIC := '0';

begin
    process(D, CLK, CLR, count_load)
    begin
        if CLR = '1' then
            Q <= "0000";
        elsif rising_edge(CLK) then
            if count_load_temp = '1' then
                Q <= D;
            else
                Q <= Q + 1;
            end if;
        end if; 
        count_load_temp <= count_load; 
    end process;
    
end Behavioral;
