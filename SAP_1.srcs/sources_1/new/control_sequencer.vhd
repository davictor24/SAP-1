library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_sequencer is
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           CLK : in STD_LOGIC;
           CLR : in STD_LOGIC;
           control_word : out STD_LOGIC_VECTOR (11 downto 0);
           HLT : out STD_LOGIC);
end control_sequencer;

architecture Behavioral of control_sequencer is

signal CLK_n : STD_LOGIC; 
signal CLR_n : STD_LOGIC; 
signal T : STD_LOGIC_VECTOR (5 downto 0) := "100000";
signal Q_rom1 : STD_LOGIC_VECTOR (3 downto 0);
signal Q_presettable_counter : STD_LOGIC_VECTOR (3 downto 0);
signal spike : STD_LOGIC; 
signal control_word_temp : STD_LOGIC_VECTOR (11 downto 0);
signal feedback : STD_LOGIC; 

component rom1
    Port ( addr : in STD_LOGIC_VECTOR (3 downto 0);
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component; 

component rom2
    Port ( addr : in STD_LOGIC_VECTOR (3 downto 0);
           Q : out STD_LOGIC_VECTOR (11 downto 0));
end component; 

component ring_counter
    Port ( CLK : in STD_LOGIC;
           CLR : in STD_LOGIC;
           T : out STD_LOGIC_VECTOR (5 downto 0) := "100000");
end component;

component edge_detector
    Port ( A : in STD_LOGIC;
           X : out STD_LOGIC);
end component;

component presettable_counter
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           CLK : in STD_LOGIC;
           CLR : in STD_LOGIC;
           count_load : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

begin
    CLK_n <= not CLK;
    CLR_n <= not CLR; 
    HLT <= I(3) and I(2) and (not I(1)) and (not I(0)); 
    feedback <= not ((not control_word_temp(11)) 
                and (not control_word_temp(10)) 
                and control_word_temp(9) 
                and control_word_temp(8) 
                and control_word_temp(7) 
                and control_word_temp(6) 
                and control_word_temp(5) 
                and (not control_word_temp(4)) 
                and (not control_word_temp(3)) 
                and (not control_word_temp(2)) 
                and control_word_temp(1) 
                and control_word_temp(0));
    
    U0: rom1 port map(I, Q_rom1);
    U1: edge_detector port map((T(5) or CLR), spike);
    U2: presettable_counter port map(Q_rom1, CLK_n, spike, T(3), Q_presettable_counter);
    U3: rom2 port map(Q_presettable_counter, control_word_temp);
    U4: ring_counter port map(CLK, CLR_n and feedback, T);

    control_word <= control_word_temp; 
end Behavioral;
