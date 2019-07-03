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
    Port ( Cp_p : in STD_LOGIC;
           Ep_p : in STD_LOGIC;
           CLK_p : in STD_LOGIC;
           CLR_p : in STD_LOGIC;
           Q_p: out STD_LOGIC_VECTOR (3 downto 0));
end program_counter;

architecture Behavioral of program_counter is

signal Q_tmp_p : STD_LOGIC_VECTOR (3 downto 0);

begin
    process(Cp_p, Ep_p, CLK_p, CLR_p)
    begin
        if CLR_p = '0' then
            Q_tmp_p <= (Q_tmp_p'range => '0');
        elsif (falling_edge(CLK_p) and Cp_p = '1') then
            Q_tmp_p <= Q_tmp_p + 1; 
        end if; 
        
        Q_p <= Q_tmp_p when Ep_p = '1' else (Q_p'range => 'Z'); 
    
    end process; 

end Behavioral;
