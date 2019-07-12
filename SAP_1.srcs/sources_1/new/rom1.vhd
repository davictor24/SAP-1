library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity rom1 is
    Port ( addr : in STD_LOGIC_VECTOR (3 downto 0);
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end rom1;

architecture Behavioral of rom1 is

type mem is array (0 to 15) of std_logic_vector(3 downto 0);

constant memory: mem := (
    0 => "0000",
    1 => "0000",
    2 => "0000",
    3 => "1100",    -- OUT
    4 => "0000",
    5 => "0000",
    6 => "1001",    -- SUB
    7 => "0000",
    8 => "0000",
    9 => "0000",
    10 => "0000",   -- HLT
    11 => "0011",   -- LDA
    12 => "0000",
    13 => "0110",   -- ADD
    14 => "0000",
    15 => "0000",
    others => "0000"
);

signal addr_int : integer range 0 to 15;

begin
    addr_int <= to_integer(unsigned(addr));
    Q <= memory(addr_int);

end Behavioral;
