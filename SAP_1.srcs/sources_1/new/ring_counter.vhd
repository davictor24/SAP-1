library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ring_counter is
    Port ( CLK : in STD_LOGIC;
           CLR : in STD_LOGIC;
           T : out STD_LOGIC_VECTOR (5 downto 0) := "100000");
end ring_counter;

architecture Behavioral of ring_counter is

signal T_temp : STD_LOGIC_VECTOR (5 downto 0) := "100000";

begin
    process(CLK, CLR)
    begin
        if CLR = '0' then
            T_temp <= "100000";
        elsif falling_edge(clk) then
            T_temp(5) <= T_temp(0);
            T_temp(4) <= T_temp(5);
            T_temp(3) <= T_temp(4);
            T_temp(2) <= T_temp(3);
            T_temp(1) <= T_temp(2);
            T_temp(0) <= T_temp(1);
        end if;
        
        T <= T_temp; 
    end process;

end Behavioral;
