library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity controller_sequencer is
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           CLK : in STD_LOGIC;
           CLR : in STD_LOGIC;
           control_word : out STD_LOGIC_VECTOR (11 downto 0);
           HLT : out STD_LOGIC);
end controller_sequencer;

architecture Behavioral of controller_sequencer is
    type mem1 is array (0 to 15) of std_logic_vector(3 downto 0);
    type mem2 is array (0 to 15) of std_logic_vector(11 downto 0);
    
    constant rom1: mem1 := (
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
        11 => "0000",
        12 => "0011",   -- LDA
        13 => "0000",
        14 => "0110",   -- ADD
        15 => "0000",
        others => "0000"
    );
    
    constant rom2: mem2 := (
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
    
    signal addr1 : integer range 0 to 15;
    signal addr2 : integer range 0 to 15 := 0;
    signal data1 : STD_LOGIC_VECTOR (3 downto 0); 
    signal T : integer range 0 to 5 := 0; 
    
begin
    addr1 <= to_integer(unsigned(I));
    data1 <= rom1(addr1); 
    control_word <= rom2(addr2); 
    HLT <= I(3) and (not I(2)) and I(1) and (not I(0)); 
    
    process(CLK, CLR)
    begin
        if CLR = '1' then 
            T <= 0; 
            addr2 <= 0; 
        elsif falling_edge(CLK) then
            if T = 5 then
                addr2 <= 0; 
            elsif T = 2 then
                addr2 <= to_integer(unsigned(data1));
            else 
                addr2 <= addr2 + 1;
            end if;
            T <= (T + 1) mod 6; 
        end if;
    end process;

end Behavioral;
