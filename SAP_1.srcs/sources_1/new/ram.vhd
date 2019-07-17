library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ram is
    Port ( addr : in STD_LOGIC_VECTOR (3 downto 0);
           Din : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           str : in STD_LOGIC;
           ld : in STD_LOGIC;
           CLR : in STD_LOGIC;
           Dout : out STD_LOGIC_VECTOR (7 downto 0));
end ram;

architecture Behavioral of ram is
    type mem is array (0 to 15) of  STD_LOGIC_VECTOR (7 downto 0);
    
    signal memory : mem := (others => "00000000"); 
    signal addr_int : integer range 0 to 15;

begin
    process(addr, Din, CLK, str, ld, CLR)
    begin
        addr_int <= to_integer(unsigned(addr));
        if CLR = '1' then
            memory <= (others => "00000000"); 
        elsif str = '1' and rising_edge(CLK) then
            memory(addr_int) <= Din; 
        end if;
        Dout <= memory(addr_int) when ld = '1' else (others => 'Z');
    end process;

end Behavioral;
