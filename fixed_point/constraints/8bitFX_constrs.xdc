set_property PACKAGE_PIN N14 [get_ports {acc_o[7]}]
set_property PACKAGE_PIN R18 [get_ports {acc_o[6]}]
set_property PACKAGE_PIN V17 [get_ports {acc_o[5]}]
set_property PACKAGE_PIN U17 [get_ports {acc_o[4]}]
set_property PACKAGE_PIN U16 [get_ports {acc_o[3]}]
set_property PACKAGE_PIN V16 [get_ports {acc_o[2]}]
set_property PACKAGE_PIN T15 [get_ports {acc_o[1]}]
set_property PACKAGE_PIN U14 [get_ports {acc_o[0]}]
set_property PACKAGE_PIN J15 [get_ports {din[7]}]
set_property PACKAGE_PIN L16 [get_ports {din[6]}]
set_property PACKAGE_PIN M13 [get_ports {din[5]}]
set_property PACKAGE_PIN R15 [get_ports {din[4]}]
set_property PACKAGE_PIN R17 [get_ports {din[3]}]
set_property PACKAGE_PIN T18 [get_ports {din[2]}]
set_property PACKAGE_PIN U18 [get_ports {din[1]}]
set_property PACKAGE_PIN R13 [get_ports {din[0]}]
set_property PACKAGE_PIN T8 [get_ports {win[7]}]
set_property PACKAGE_PIN U8 [get_ports {win[6]}]
set_property PACKAGE_PIN R16 [get_ports {win[5]}]
set_property PACKAGE_PIN T13 [get_ports {win[4]}]
set_property PACKAGE_PIN H6 [get_ports {win[3]}]
set_property PACKAGE_PIN U12 [get_ports {win[2]}]
set_property PACKAGE_PIN U11 [get_ports {win[1]}]
set_property PACKAGE_PIN V10 [get_ports {win[0]}]
set_property DRIVE 12 [get_ports {acc_o[7]}]
set_property DRIVE 12 [get_ports {acc_o[6]}]
set_property DRIVE 12 [get_ports {acc_o[5]}]
set_property DRIVE 12 [get_ports {acc_o[4]}]
set_property DRIVE 12 [get_ports {acc_o[3]}]
set_property DRIVE 12 [get_ports {acc_o[2]}]
set_property DRIVE 12 [get_ports {acc_o[1]}]
set_property DRIVE 12 [get_ports {acc_o[0]}]
set_property SLEW SLOW [get_ports {acc_o[7]}]
set_property SLEW SLOW [get_ports {acc_o[6]}]
set_property SLEW SLOW [get_ports {acc_o[5]}]
set_property SLEW SLOW [get_ports {acc_o[4]}]
set_property SLEW SLOW [get_ports {acc_o[3]}]
set_property SLEW SLOW [get_ports {acc_o[2]}]
set_property SLEW SLOW [get_ports {acc_o[1]}]
set_property SLEW SLOW [get_ports {acc_o[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {acc_o[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {acc_o[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {acc_o[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {acc_o[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {acc_o[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {acc_o[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {acc_o[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {acc_o[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {din[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {win[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {win[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {win[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {win[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {win[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {win[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {win[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {win[0]}]

## Clock signal
create_clock -period 10.000 -name clk -waveform {0.000 5.000} -add [get_ports clk]

# Rising Edge System Synchronous Inputs
#
# A Single Data Rate (SDR) System Synchronous interface is
# an interface where the external device and the FPGA use
# the same clock, and a new data is captured one clock cycle
# after being launched
#
# input      __________            __________
# clock   __|          |__________|          |__
#           |
#           |------> (tco_min+trce_dly_min)
#           |------------> (tco_max+trce_dly_max)
#         __________      ________________
# data    __________XXXXXX_____ Data _____XXXXXXX
#


# Input Delay Constraint
set_input_delay -clock clk -max 1.600 [get_ports [get_ports {{din[*]} {win[*]}}]]
set_input_delay -clock clk -min 0.700 [get_ports [get_ports {{din[*]} {win[*]}}]]

# Report Timing Template
# report_timing -from [get_ports $input_ports] -max_paths 20 -nworst 1 -delay_type min_max -name sys_sync_rise_in  -file sys_sync_rise_in.txt;


# Rising Edge System Synchronous Outputs
#
# A System Synchronous design interface is a clocking technique in which the same
# active-edge of a system clock is used for both the source and destination device.
#
# dest        __________            __________
# clk    ____|          |__________|
#                                  |
#     (trce_dly_max+tsu) <---------|
#             (trce_dly_min-thd) <-|
#                        __    __
# data   XXXXXXXXXXXXXXXX__DATA__XXXXXXXXXXXXX
#

# Output Delay Constraint
set_output_delay -clock clk -max 1.150 [get_ports {acc_o[*]}]
set_output_delay -clock clk -min 0.450 [get_ports {acc_o[*]}]

# Report Timing Template
# report_timing -to [get_ports $output_ports] -max_paths 20 -nworst 1 -delay_type min_max -name sys_sync_rise_out -file sys_sync_rise_out.txt;

set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property PACKAGE_PIN E3 [get_ports clk]
set_property PACKAGE_PIN C12 [get_ports rstn]

set_property IOSTANDARD LVCMOS33 [get_ports rstn]
#set_property IOSTANDARD LVCMOS33 [get_ports vld_i]
#set_property IOSTANDARD LVCMOS33 [get_ports vld_o]

#set_property PACKAGE_PIN P17 [get_ports vld_i]
#set_property PACKAGE_PIN V11 [get_ports vld_o]
