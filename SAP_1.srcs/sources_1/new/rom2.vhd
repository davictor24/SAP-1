library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rom2 is
    Port ( addr : in STD_LOGIC_VECTOR (3 downto 0);
           Q : out STD_LOGIC_VECTOR (11 downto 0));
end rom2;

architecture Behavioral of rom2 is

type mem is array (0 to 15) of std_logic_vector(11 downto 0);

constant memory: mem := (
    0 => "010111100011",
    1 => "101111100011",
    2 => "001001100011",
    3 => "000110100011",
    4 => "001011000011",
    5 => "001111100011",
    6 => "000110100011",
    7 => "001011100001",
    8 => "001111000111",
    9 => "000110100011",
    10 => "001011100001",
    11 => "001111001111",
    12 => "001111110010",
    13 => "001111100011",
    14 => "001111100011",
    15 => "000000000000",
    others => "000000000000"
);

signal addr_int : integer range 0 to 15;

begin
    addr_int <= to_integer(unsigned(addr));
    Q <= memory(addr_int);

end Behavioral;
