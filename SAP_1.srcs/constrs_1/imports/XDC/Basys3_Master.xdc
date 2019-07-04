## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]


# Program/run switch
set_property PACKAGE_PIN V17 [get_ports {prog_run}]
set_property IOSTANDARD LVCMOS33 [get_ports {prog_run}]

# Decimal/hexadecimal switch
set_property PACKAGE_PIN V16 [get_ports {hex_dec}]
set_property IOSTANDARD LVCMOS33 [get_ports {hex_dec}]

# 8-bit data switch
set_property PACKAGE_PIN W15 [get_ports {data[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[0]}]
set_property PACKAGE_PIN V15 [get_ports {data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[1]}]
set_property PACKAGE_PIN W14 [get_ports {data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[2]}]
set_property PACKAGE_PIN W13 [get_ports {data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[3]}]
set_property PACKAGE_PIN V2 [get_ports {data[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[4]}]
set_property PACKAGE_PIN T3 [get_ports {data[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[5]}]
set_property PACKAGE_PIN T2 [get_ports {data[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[6]}]
set_property PACKAGE_PIN R3 [get_ports {data[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[7]}]

# 4-bit address switch
set_property PACKAGE_PIN W2 [get_ports {addr[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {addr[0]}]
set_property PACKAGE_PIN U1 [get_ports {addr[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {addr[1]}]
set_property PACKAGE_PIN T1 [get_ports {addr[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
set_property PACKAGE_PIN R2 [get_ports {addr[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {addr[3]}]


# Program/run LED
set_property PACKAGE_PIN U16 [get_ports {prog_run_led}]
set_property IOSTANDARD LVCMOS33 [get_ports {prog_run_led}]

# Decimal/hexadecimal LED
set_property PACKAGE_PIN E19 [get_ports {hex_dec_led}]
set_property IOSTANDARD LVCMOS33 [get_ports {hex_dec_led}]

# 8-bit data LEDs
set_property PACKAGE_PIN W18 [get_ports {data_led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_led[0]}]
set_property PACKAGE_PIN U15 [get_ports {data_led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_led[1]}]
set_property PACKAGE_PIN U14 [get_ports {data_led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_led[2]}]
set_property PACKAGE_PIN V14 [get_ports {data_led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_led[3]}]
set_property PACKAGE_PIN V13 [get_ports {data_led[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_led[4]}]
set_property PACKAGE_PIN V3 [get_ports {data_led[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_led[5]}]
set_property PACKAGE_PIN W3 [get_ports {data_led[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_led[6]}]
set_property PACKAGE_PIN U3 [get_ports {data_led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_led[7]}]

# 4-bit address LEDs
set_property PACKAGE_PIN P3 [get_ports {addr_led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {addr_led[0]}]
set_property PACKAGE_PIN N3 [get_ports {addr_led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {addr_led[1]}]
set_property PACKAGE_PIN P1 [get_ports {addr_led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {addr_led[2]}]
set_property PACKAGE_PIN L1 [get_ports {addr_led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {addr_led[3]}]


# Seven-segment display cathodes
set_property PACKAGE_PIN W7 [get_ports {cathodes[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathodes[0]}]
set_property PACKAGE_PIN W6 [get_ports {cathodes[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathodes[1]}]
set_property PACKAGE_PIN U8 [get_ports {cathodes[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathodes[2]}]
set_property PACKAGE_PIN V8 [get_ports {cathodes[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathodes[3]}]
set_property PACKAGE_PIN U5 [get_ports {cathodes[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathodes[4]}]
set_property PACKAGE_PIN V5 [get_ports {cathodes[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathodes[5]}]
set_property PACKAGE_PIN U7 [get_ports {cathodes[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cathodes[6]}]

# Seven-segment display select
set_property PACKAGE_PIN U2 [get_ports {display_select[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {display_select[0]}]
set_property PACKAGE_PIN U4 [get_ports {display_select[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {display_select[1]}]
set_property PACKAGE_PIN V4 [get_ports {display_select[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {display_select[2]}]
set_property PACKAGE_PIN W4 [get_ports {display_select[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {display_select[3]}]


# Write to RAM button
set_property PACKAGE_PIN U18 [get_ports write]
set_property IOSTANDARD LVCMOS33 [get_ports write]

# Clear RAM button
set_property PACKAGE_PIN W19 [get_ports clr]
set_property IOSTANDARD LVCMOS33 [get_ports clr]

# Reset computer button
set_property PACKAGE_PIN T17 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]


set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
