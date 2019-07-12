library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;


entity seven_segment_driver is
    Port ( number : in STD_LOGIC_VECTOR (7 downto 0);
           hex_dec : in STD_LOGIC;
           clk : in STD_LOGIC;
           cathodes : out STD_LOGIC_VECTOR (6 downto 0);
           display_select : out STD_LOGIC_VECTOR (3 downto 0));
end seven_segment_driver;

architecture Behavioral of seven_segment_driver is

type int_array is array(0 to 3) of integer;

signal radix : integer; 
signal number_int : integer; 
signal number_array : int_array := (others => 0);
signal to_display : integer := 0; 
signal refresh_counter : STD_LOGIC_VECTOR (17 downto 0);
signal select_counter : STD_LOGIC_VECTOR (1 downto 0);
signal x : int_array := (others => 0);
signal y : int_array := (others => 0);

begin
    radix <= 16 when hex_dec = '0' else 10; 
    number_int <= to_integer(unsigned(number));

    process(clk)
    begin
        if (rising_edge(clk)) then
            refresh_counter <= refresh_counter + 1;
        end if; 
        select_counter <= refresh_counter(17 downto 16); 
    end process; 
    
    process(radix, number_int)
    begin
        x(0) <= number_int;
        y(0) <= x(0) / radix; 
        x(1) <= y(0); 
        y(1) <= x(1) / radix; 
        x(2) <= y(1); 
        y(2) <= x(2) / radix; 
        x(3) <= y(2); 
        y(3) <= x(3) / radix; 
        
        number_array(0) <= x(0) - (y(0) * radix);
        number_array(1) <= x(1) - (y(1) * radix);
        number_array(2) <= x(2) - (y(2) * radix);
        number_array(3) <= x(3) - (y(3) * radix);
    end process;
    
    process(select_counter)
    begin
        case select_counter is
        when "00" =>
            display_select <= "1110"; 
            to_display <= number_array(0);
        when "01" =>
            display_select <= "1101"; 
            to_display <= number_array(1);
        when "10" =>
            display_select <= "1011"; 
            to_display <= number_array(2);
        when "11" =>
            display_select <= "0111"; 
            to_display <= number_array(3);
        end case;
    end process;
    
    process(to_display)
    begin
        case to_display is
        when 0 => cathodes <= "1000000"; -- 0     
        when 1 => cathodes <= "1111001"; -- 1 
        when 2 => cathodes <= "0100100"; -- 2 
        when 3 => cathodes <= "0110000"; -- 3 
        when 4 => cathodes <= "0011001"; -- 4 
        when 5 => cathodes <= "0010010"; -- 5 
        when 6 => cathodes <= "0000010"; -- 6 
        when 7 => cathodes <= "1111000"; -- 7 
        when 8 => cathodes <= "0000000"; -- 8     
        when 9 => cathodes <= "0010000"; -- 9 
        when 10 => cathodes <= "0001000"; -- A
        when 11 => cathodes <= "0000011"; -- b
        when 12 => cathodes <= "1000110"; -- C
        when 13 => cathodes <= "0100001"; -- d
        when 14 => cathodes <= "0000110"; -- E
        when 15 => cathodes <= "0001110"; -- F
        when others => cathodes <= "1111111"; -- blank
        end case;
    end process;

end Behavioral;
