library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity sap_1 is
    Port ( addr : in STD_LOGIC_VECTOR (3 downto 0);
           data : in STD_LOGIC_VECTOR (7 downto 0);
           prog_run : in STD_LOGIC;
           hex_dec : in STD_LOGIC;
           write : in STD_LOGIC;
           clr : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           cathodes : out STD_LOGIC_VECTOR (6 downto 0);
           display_select : out STD_LOGIC_VECTOR (3 downto 0));
end sap_1;

architecture Behavioral of sap_1 is

-- output LEDs
signal addr_led : STD_LOGIC_VECTOR (3 downto 0);
signal data_led : STD_LOGIC_VECTOR (7 downto 0);
signal prog_run_led : STD_LOGIC;
signal hex_dec_led : STD_LOGIC;

-- control signals
signal control_signals : STD_LOGIC_VECTOR (11 downto 0);
signal Cp : STD_LOGIC;
signal Ep : STD_LOGIC;
signal Lm : STD_LOGIC;
signal CE : STD_LOGIC;
signal Li : STD_LOGIC;
signal Ei : STD_LOGIC;
signal La : STD_LOGIC;
signal Ea : STD_LOGIC;
signal Su : STD_LOGIC;
signal Eu : STD_LOGIC;
signal Lb : STD_LOGIC;
signal Lo : STD_LOGIC;
signal HLT : STD_LOGIC;

-- clk and reset
signal CLK_p : STD_LOGIC;
signal RESET_p : STD_LOGIC;
signal CLK_n : STD_LOGIC;
signal RESET_n : STD_LOGIC;

-- bus connections
signal W_bus : STD_LOGIC_VECTOR (7 downto 0);
signal Q_program_counter : STD_LOGIC_VECTOR (3 downto 0);
signal D_mar : STD_LOGIC_VECTOR (3 downto 0);
signal Q_tri_instruction_register : STD_LOGIC_VECTOR (3 downto 0);
signal Q_tri_accumulator : STD_LOGIC_VECTOR (7 downto 0);
signal S_adder_subtractor : STD_LOGIC_VECTOR (7 downto 0);

-- other connections
signal Q_mar : STD_LOGIC_VECTOR (3 downto 0);
signal addr_ram : STD_LOGIC_VECTOR (3 downto 0);
signal CLK_ram : STD_LOGIC;
signal str_ram : STD_LOGIC;
signal ld_ram : STD_LOGIC;
signal clr_ram : STD_LOGIC;
signal I_control_sequencer : STD_LOGIC_VECTOR (3 downto 0);
signal A_adder_subtractor : STD_LOGIC_VECTOR (7 downto 0);
signal B_adder_subtractor : STD_LOGIC_VECTOR (7 downto 0);
signal Q_output_register : STD_LOGIC_VECTOR (7 downto 0);

signal prog_run_edge : STD_LOGIC;

component program_counter
    Port ( Cp : in STD_LOGIC;
           Ep : in STD_LOGIC;
           CLK : in STD_LOGIC;
           CLR : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component; 

component mar
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           CLK : in STD_LOGIC;
           Lm : in STD_LOGIC;
           CLR : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component; 

component ram
    Port ( addr : in STD_LOGIC_VECTOR (3 downto 0);
           Din : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           str : in STD_LOGIC;
           ld : in STD_LOGIC;
           CLR : in STD_LOGIC;
           Dout : out STD_LOGIC_VECTOR (7 downto 0));
end component; 

component instruction_register
    Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           Li : in STD_LOGIC;
           Ei : in STD_LOGIC;
           CLR : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0);
           Q_tri : out STD_LOGIC_VECTOR (3 downto 0));
end component; 

component control_sequencer
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           CLK : in STD_LOGIC;
           CLR : in STD_LOGIC;
           control_word : out STD_LOGIC_VECTOR (11 downto 0);
           HLT : out STD_LOGIC);
end component; 

component accumulator
    Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           La : in STD_LOGIC;
           Ea : in STD_LOGIC;
           CLR : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (7 downto 0);
           Q_tri : out STD_LOGIC_VECTOR (7 downto 0));
end component; 

component adder_subtractor
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           S : out STD_LOGIC_VECTOR (7 downto 0);
           Su : in STD_LOGIC;
           Eu : in STD_LOGIC);
end component; 

component b_register
    Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           Lb : in STD_LOGIC;
           CLR : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end component; 

component output_register
    Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC;
           Lo : in STD_LOGIC;
           CLR : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end component; 

component seven_segment_driver
    Port ( number : in STD_LOGIC_VECTOR (7 downto 0);
           hex_dec : in STD_LOGIC;
           clk : in STD_LOGIC;
           cathodes : out STD_LOGIC_VECTOR (6 downto 0);
           display_select : out STD_LOGIC_VECTOR (3 downto 0));
end component; 

component edge_detector
    Port ( A : in STD_LOGIC;
           X : out STD_LOGIC);
end component; 

begin
    -- output LEDs
    addr_led <= addr; 
    data_led <= data; 
    prog_run_led <= prog_run; 
    hex_dec_led <= hex_dec; 
    
    -- control signals
    Cp <= control_signals(11); 
    Ep <= control_signals(10); 
    Lm <= control_signals(9); 
    CE <= control_signals(8); 
    Li <= control_signals(7); 
    Ei <= control_signals(6); 
    La <= control_signals(5); 
    Ea <= control_signals(4); 
    Su <= control_signals(3); 
    Eu <= control_signals(2); 
    Lb <= control_signals(1); 
    Lo <= control_signals(0); 
    
    -- clk and reset
    CLK_p <= clk when prog_run and (not HLT) else 'Z'; 
    RESET_p <= reset or prog_run_edge; 
    CLK_n <= not CLK_p; 
    RESET_n <= not RESET_p; 
    
    -- bus connections
    W_bus <= "0000" & Q_program_counter; 
    D_mar <= W_bus(3 downto 0);
    W_bus <= "0000" & Q_tri_instruction_register; 
    W_bus <= Q_tri_accumulator; 
    W_bus <= S_adder_subtractor; 
    
    -- other connections
    addr_ram <= addr when prog_run = '0' else Q_mar; 
    CLK_ram <= write and (not prog_run); 
    str_ram <= not prog_run; 
    ld_ram <= '0' when prog_run = '0' else CE; 
    clr_ram <= clr and (not prog_run); 
    
    -- maps
    U0: program_counter port map(Cp, Ep, CLK_p, RESET_p, Q_program_counter);
    U1: mar port map(D_mar, CLK_p, Lm, RESET_p, Q_mar);
    U2: ram port map(addr_ram, data, CLK_ram, str_ram, ld_ram, clr_ram, W_bus);
    U3: instruction_register port map(W_bus, CLK_p, Li, Ei, RESET_p, I_control_sequencer, Q_tri_instruction_register);
    U4: control_sequencer port map(I_control_sequencer, CLK_p, RESET_p, control_signals, HLT);
    U5: accumulator port map(W_bus, CLK_p, La, Ea, RESET_p, A_adder_subtractor, Q_tri_accumulator);
    U6: adder_subtractor port map(A_adder_subtractor, B_adder_subtractor, S_adder_subtractor, Su, Eu);
    U7: b_register port map(W_bus, CLK_p, Lb, RESET_p, B_adder_subtractor);
    U8: output_register port map(W_bus, CLK_p, Lo, RESET_p, Q_output_register);
    U9: seven_segment_driver port map(Q_output_register, hex_dec, clk, cathodes, display_select);
    U10: edge_detector port map(prog_run, prog_run_edge);

end Behavioral;
