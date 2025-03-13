current_design top
set name "clk_i"
set clock_port [get_port $name]
create_clock -name $name -period 100.00 $clock_port
set clock [get_clock $name]
set inputs [all_inputs]
set clk_ix [lsearch [all_inputs] $clock_port]
set all_inputs_no_clk [lreplace [all_inputs] $clk_ix $clk_ix ""]
set outputs [all_outputs]
set_input_delay 2.0 -clock $clock $all_inputs_no_clk
set_output_delay 2.0 -clock $clock [all_outputs]
set_load 0.006 [all_outputs]
set_input_transition 0.05 $all_inputs_no_clk
set_driving_cell -lib_cell sky130_fd_sc_hd__dfxtp_1 -pin Q $all_inputs_no_clk
set_driving_cell -lib_cell sky130_fd_sc_hd__clkbuf_2 -pin X $clock_port
