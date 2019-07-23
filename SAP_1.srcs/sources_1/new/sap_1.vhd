library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sap_1 is
    Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR(15 downto 0); 
           led : out STD_LOGIC_VECTOR(15 downto 0); 
           seg : out STD_LOGIC_VECTOR(6 downto 0); 
           an : out STD_LOGIC_VECTOR(3 downto 0);
           btnL : in STD_LOGIC;
           btnC : in STD_LOGIC;
           btnR : in STD_LOGIC);
end sap_1;

architecture Behavioral of sap_1 is
    -- I/O
    signal addr : STD_LOGIC_VECTOR (3 downto 0);
    signal data : STD_LOGIC_VECTOR (7 downto 0);
    signal prog_run : STD_LOGIC;
    signal hex_dec : STD_LOGIC;
    signal write : STD_LOGIC;
    signal clr : STD_LOGIC;
    signal reset : STD_LOGIC;
    signal cathodes : STD_LOGIC_VECTOR (6 downto 0);
    signal display_select : STD_LOGIC_VECTOR (3 downto 0);
    
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
    signal Q_program_counter : STD_LOGIC_VECTOR (3 downto 0);
    signal D_mar : STD_LOGIC_VECTOR (3 downto 0);
    signal Dout_ram : STD_LOGIC_VECTOR (7 downto 0);
    signal D_instruction_register : STD_LOGIC_VECTOR (7 downto 0);
    signal Q_tri_instruction_register : STD_LOGIC_VECTOR (3 downto 0);
    signal D_accumulator : STD_LOGIC_VECTOR (7 downto 0);
    signal Q_tri_accumulator : STD_LOGIC_VECTOR (7 downto 0);
    signal S_adder_subtractor : STD_LOGIC_VECTOR (7 downto 0);
    signal D_b_register : STD_LOGIC_VECTOR (7 downto 0);
    signal D_output_register : STD_LOGIC_VECTOR (7 downto 0);
    
    -- other connections
    signal Q_mar : STD_LOGIC_VECTOR (3 downto 0);
    signal addr_ram : STD_LOGIC_VECTOR (3 downto 0);
    signal CLK_ram : STD_LOGIC;
    signal str_ram : STD_LOGIC;
    signal ld_ram : STD_LOGIC;
    signal clr_ram : STD_LOGIC;
    signal hex_dec_new : STD_LOGIC; 
    signal number_seven_segment_driver : STD_LOGIC_VECTOR (11 downto 0);
    signal I_controller_sequencer : STD_LOGIC_VECTOR (3 downto 0);
    signal A_adder_subtractor : STD_LOGIC_VECTOR (7 downto 0);
    signal B_adder_subtractor : STD_LOGIC_VECTOR (7 downto 0);
    signal Q_output_register : STD_LOGIC_VECTOR (7 downto 0);
    
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
           trigger : in STD_LOGIC;
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
    
    component controller_sequencer
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
               Q : inout STD_LOGIC_VECTOR (7 downto 0);
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
        Port ( number : in STD_LOGIC_VECTOR (11 downto 0);
               hex_dec : in STD_LOGIC;
               clk : in STD_LOGIC;
               cathodes : out STD_LOGIC_VECTOR (6 downto 0);
               display_select : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
begin
   -- I/O
    addr <= sw(15 downto 12);
    data <= sw(11 downto 4);
    hex_dec <= sw(1);
    prog_run <= sw(0);
    clr <= btnL; 
    write <= btnC;
    reset <= btnR;
    cathodes <= seg;
    display_select <= an; 
    led <= sw; 
    
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
    RESET_p <= reset; 
    CLK_n <= not CLK_p; 
    RESET_n <= not RESET_p; 
    
    -- bus connections
    process(Ep, Lm, ld_ram, Li, Ei, La, Ea, Eu, Lb, Lo)
        variable W_bus : STD_LOGIC_VECTOR (7 downto 0);
    begin
        if Ep = '1' then
            W_bus(3 downto 0) := Q_program_counter; 
        elsif ld_ram = '1' then
            W_bus := Dout_ram; 
        elsif Ei = '0' then
            W_bus(3 downto 0) := Q_tri_instruction_register; 
        elsif Ea = '1' then
            W_bus := Q_tri_accumulator; 
        elsif Eu = '1' then
            W_bus := S_adder_subtractor; 
        end if;
        
        if Lm = '0' then
            D_mar <= W_bus(3 downto 0);
        end if;
        if Li = '0' then
            D_instruction_register <= W_bus;
        end if;
        if La = '0' then
            D_accumulator <= W_bus; 
        end if;
        if Lb = '0' then
            D_b_register <= W_bus; 
        end if;
        if Lo = '0' then
            D_output_register <= W_bus; 
        end if; 
    end process;
    
    -- other connections
    addr_ram <= addr when prog_run = '0' else Q_mar; 
    CLK_ram <= write and (not prog_run); 
    str_ram <= not prog_run; 
    ld_ram <= '0' when prog_run = '0' else not CE; 
    clr_ram <= clr and (not prog_run); 
    hex_dec_new <= '0' when prog_run = '0' else hex_dec; 
    number_seven_segment_driver <= addr & data when prog_run = '0' else "0000" & Q_output_register;
    
    -- maps
    U0: program_counter port map(Cp, Ep, CLK_p, RESET_p, Q_program_counter);
    U1: mar port map(D_mar, CLK_p, Lm, RESET_p, Q_mar);
    U2: ram port map(addr_ram, data, CLK_ram, str_ram, ld_ram, clr_ram, Dout_ram);
    U3: instruction_register port map(D_instruction_register, CLK_p, Li, Ei, RESET_p, I_controller_sequencer, Q_tri_instruction_register);
    U4: controller_sequencer port map(I_controller_sequencer, CLK_p, RESET_p, control_signals, HLT);
    U5: accumulator port map(D_accumulator, CLK_p, La, Ea, RESET_p, A_adder_subtractor, Q_tri_accumulator);
    U6: adder_subtractor port map(A_adder_subtractor, B_adder_subtractor, S_adder_subtractor, Su, Eu);
    U7: b_register port map(D_b_register, CLK_p, Lb, RESET_p, B_adder_subtractor);
    U8: output_register port map(D_output_register, CLK_p, Lo, RESET_p, Q_output_register);
    U9: seven_segment_driver port map(number_seven_segment_driver, hex_dec_new, clk, cathodes, display_select);

end Behavioral;
