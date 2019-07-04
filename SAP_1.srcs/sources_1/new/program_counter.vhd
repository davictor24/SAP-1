library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity program_counter is
    Port ( Cp : in STD_LOGIC;
           Ep : in STD_LOGIC;
           CLK : in STD_LOGIC;
           CLR : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end program_counter;

architecture Behavioral of program_counter is

signal Q_tmp : STD_LOGIC_VECTOR (3 downto 0);

begin
    process(Cp, Ep, CLK, CLR)
    begin
        if CLR = '0' then
            Q_tmp <= (Q_tmp'range => '0');
        elsif (falling_edge(CLK) and Cp = '1') then
            Q_tmp <= Q_tmp + 1; 
        end if; 
        
        Q <= Q_tmp when Ep = '1' else (Q'range => 'Z'); 
    
    end process; 

end Behavioral;
