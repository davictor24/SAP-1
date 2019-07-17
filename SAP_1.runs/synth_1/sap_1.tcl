# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param chipscope.maxJobs 2
set_param synth.incrementalSynthesisCache C:/Users/duroj/AppData/Roaming/Xilinx/Vivado/.Xil/Vivado-9144-Victor/incrSyn
set_param xicom.use_bs_reader 1
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/Documents/Vivado/SAP_1/SAP_1.cache/wt [current_project]
set_property parent.project_path D:/Documents/Vivado/SAP_1/SAP_1.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo d:/Documents/Vivado/SAP_1/SAP_1.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -vhdl2008 -library xil_defaultlib {
  D:/Documents/Vivado/SAP_1/SAP_1.srcs/sources_1/new/sap_1.vhd
  D:/Documents/Vivado/SAP_1/SAP_1.srcs/sources_1/new/edge_detector.vhd
  D:/Documents/Vivado/SAP_1/SAP_1.srcs/sources_1/new/presettable_counter.vhd
  D:/Documents/Vivado/SAP_1/SAP_1.srcs/sources_1/new/ring_counter.vhd
  D:/Documents/Vivado/SAP_1/SAP_1.srcs/sources_1/new/rom1.vhd
  D:/Documents/Vivado/SAP_1/SAP_1.srcs/sources_1/new/rom2.vhd
  D:/Documents/Vivado/SAP_1/SAP_1.srcs/sources_1/new/control_sequencer.vhd
  D:/Documents/Vivado/SAP_1/SAP_1.srcs/sources_1/new/ram.vhd
  D:/Documents/Vivado/SAP_1/SAP_1.srcs/sources_1/new/seven_segment_driver.vhd
  D:/Documents/Vivado/SAP_1/SAP_1.srcs/sources_1/new/accumulator.vhd
  D:/Documents/Vivado/SAP_1/SAP_1.srcs/sources_1/new/program_counter.vhd
  D:/Documents/Vivado/SAP_1/SAP_1.srcs/sources_1/new/adder_subtractor.vhd
  D:/Documents/Vivado/SAP_1/SAP_1.srcs/sources_1/new/mar.vhd
  D:/Documents/Vivado/SAP_1/SAP_1.srcs/sources_1/new/instruction_register.vhd
  D:/Documents/Vivado/SAP_1/SAP_1.srcs/sources_1/new/output_register.vhd
  D:/Documents/Vivado/SAP_1/SAP_1.srcs/sources_1/new/b_register.vhd
  D:/Documents/Vivado/SAP_1/SAP_1.srcs/sources_1/new/controller_sequencer.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/Documents/Vivado/SAP_1/SAP_1.srcs/constrs_1/imports/XDC/Basys3_Master.xdc
set_property used_in_implementation false [get_files D:/Documents/Vivado/SAP_1/SAP_1.srcs/constrs_1/imports/XDC/Basys3_Master.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top sap_1 -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef sap_1.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file sap_1_utilization_synth.rpt -pb sap_1_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
