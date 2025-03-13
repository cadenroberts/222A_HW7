# Set units
set_units -time ns
set_units -capacitance pF
set_units -resistance kohm

# Define the clock
create_clock -name clk_i -period 100 [get_ports clk_i]
set_clock_uncertainty 0.2 [get_clocks clk_i]

# Define input constraints (for input ports only)
set_input_transition 0.05 [get_ports rst_ni]
set_input_transition 0.05 [get_ports test_en_i]
set_input_transition 0.05 [get_ports {hart_id_i[*]}]
set_input_transition 0.05 [get_ports {boot_addr_i[*]}]
set_input_transition 0.05 [get_ports instr_gnt_i]
set_input_transition 0.05 [get_ports instr_rvalid_i]
set_input_transition 0.05 [get_ports {instr_rdata_i[*]}]
set_input_transition 0.05 [get_ports instr_err_i]
set_input_transition 0.05 [get_ports data_gnt_i]
set_input_transition 0.05 [get_ports data_rvalid_i]
set_input_transition 0.05 [get_ports {data_rdata_i[*]}]
set_input_transition 0.05 [get_ports data_err_i]
set_input_transition 0.05 [get_ports {irq_*}]
set_input_transition 0.05 [get_ports debug_req_i]
set_input_transition 0.05 [get_ports fetch_enable_i]

set_input_delay 2 -clock clk_i [get_ports rst_ni]
set_input_delay 2 -clock clk_i [get_ports test_en_i]
set_input_delay 2 -clock clk_i [get_ports {hart_id_i[*]}]
set_input_delay 2 -clock clk_i [get_ports {boot_addr_i[*]}]
set_input_delay 2 -clock clk_i [get_ports instr_gnt_i]
set_input_delay 2 -clock clk_i [get_ports instr_rvalid_i]
set_input_delay 2 -clock clk_i [get_ports {instr_rdata_i[*]}]
set_input_delay 2 -clock clk_i [get_ports instr_err_i]
set_input_delay 2 -clock clk_i [get_ports data_gnt_i]
set_input_delay 2 -clock clk_i [get_ports data_rvalid_i]
set_input_delay 2 -clock clk_i [get_ports {data_rdata_i[*]}]
set_input_delay 2 -clock clk_i [get_ports data_err_i]
set_input_delay 2 -clock clk_i [get_ports {irq_*}]
set_input_delay 2 -clock clk_i [get_ports debug_req_i]
set_input_delay 2 -clock clk_i [get_ports fetch_enable_i]

# Set driving cell constraints for inputs (different corners)
foreach corner {tt_025C_1v80 ff_n40C_1v95 ss_100C_1v60} {
    set_driving_cell -lib_cell sky130_fd_sc_hd__dfxtp_1 -library sky130_fd_sc_hd__$corner [get_ports rst_ni]
    set_driving_cell -lib_cell sky130_fd_sc_hd__dfxtp_1 -library sky130_fd_sc_hd__$corner [get_ports test_en_i]
    set_driving_cell -lib_cell sky130_fd_sc_hd__dfxtp_1 -library sky130_fd_sc_hd__$corner [get_ports {hart_id_i[*]}]
    set_driving_cell -lib_cell sky130_fd_sc_hd__dfxtp_1 -library sky130_fd_sc_hd__$corner [get_ports {boot_addr_i[*]}]
    set_driving_cell -lib_cell sky130_fd_sc_hd__dfxtp_1 -library sky130_fd_sc_hd__$corner [get_ports instr_gnt_i]
    set_driving_cell -lib_cell sky130_fd_sc_hd__dfxtp_1 -library sky130_fd_sc_hd__$corner [get_ports instr_rvalid_i]
    set_driving_cell -lib_cell sky130_fd_sc_hd__dfxtp_1 -library sky130_fd_sc_hd__$corner [get_ports {instr_rdata_i[*]}]
    set_driving_cell -lib_cell sky130_fd_sc_hd__dfxtp_1 -library sky130_fd_sc_hd__$corner [get_ports instr_err_i]
    set_driving_cell -lib_cell sky130_fd_sc_hd__dfxtp_1 -library sky130_fd_sc_hd__$corner [get_ports data_gnt_i]
    set_driving_cell -lib_cell sky130_fd_sc_hd__dfxtp_1 -library sky130_fd_sc_hd__$corner [get_ports data_rvalid_i]
    set_driving_cell -lib_cell sky130_fd_sc_hd__dfxtp_1 -library sky130_fd_sc_hd__$corner [get_ports {data_rdata_i[*]}]
    set_driving_cell -lib_cell sky130_fd_sc_hd__dfxtp_1 -library sky130_fd_sc_hd__$corner [get_ports data_err_i]
    set_driving_cell -lib_cell sky130_fd_sc_hd__dfxtp_1 -library sky130_fd_sc_hd__$corner [get_ports {irq_*}]
    set_driving_cell -lib_cell sky130_fd_sc_hd__dfxtp_1 -library sky130_fd_sc_hd__$corner [get_ports debug_req_i]
    set_driving_cell -lib_cell sky130_fd_sc_hd__dfxtp_1 -library sky130_fd_sc_hd__$corner [get_ports fetch_enable_i]
}

# Set output constraints (for output ports only)
set_load 0.006 [get_ports instr_req_o]
set_load 0.006 [get_ports {instr_addr_o[*]}]
set_load 0.006 [get_ports data_req_o]
set_load 0.006 [get_ports data_we_o]
set_load 0.006 [get_ports {data_be_o[*]}]
set_load 0.006 [get_ports {data_addr_o[*]}]
set_load 0.006 [get_ports {data_wdata_o[*]}]
set_load 0.006 [get_ports {alert_*}]
set_load 0.006 [get_ports core_sleep_o]

set_output_delay 2 -clock clk_i [get_ports instr_req_o]
set_output_delay 2 -clock clk_i [get_ports {instr_addr_o[*]}]
set_output_delay 2 -clock clk_i [get_ports data_req_o]
set_output_delay 2 -clock clk_i [get_ports data_we_o]
set_output_delay 2 -clock clk_i [get_ports {data_be_o[*]}]
set_output_delay 2 -clock clk_i [get_ports {data_addr_o[*]}]
set_output_delay 2 -clock clk_i [get_ports {data_wdata_o[*]}]
set_output_delay 2 -clock clk_i [get_ports {alert_*}]
set_output_delay 2 -clock clk_i [get_ports core_sleep_o]

# Use SRAM macro corner TT_1p8V_25C for all corners
#set sram_corner "sky130_sram_1kbyte_1rw1r_32x256_8_TT_1p8V_25C"

#foreach corner {tt_025C_1v80 ff_n40C_1v95 ss_100C_1v60} {
#    set_library_corner $corner -sram_corner $sram_corner
#}

# Do NOT use describe_process_corner (Handled by OpenLane)

