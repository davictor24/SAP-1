library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ring_counter is
    Port ( CLK : in STD_LOGIC;
           CLR : in STD_LOGIC;
           T : inout STD_LOGIC_VECTOR (5 downto 0) := "100000");
end ring_counter;

architecture Behavioral of ring_counter is

begin
    process(CLK, CLR)
    begin
        if CLR = '0' then
            T <= "100000";
        elsif falling_edge(clk) then
            T(5) <= T(0);
            T(4) <= T(5);
            T(3) <= T(4);
            T(2) <= T(3);
            T(1) <= T(2);
            T(0) <= T(1);
        end if;
    end process;

end Behavioral;
