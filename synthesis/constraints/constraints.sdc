###################################################################

## timing contstraints
# 500 MHz -> 2ns

create_clock [get_ports clk]  -period 2  -waveform {0 1}
set_clock_uncertainty 0.3  [get_clocks clk]


set_clock_transition -rise 0.05 [get_clocks clk]
set_clock_transition -fall 0.05 [get_clocks clk]

#set_input_delay -clock clk  1.2  [get_ports rst]
set_input_delay -clock clk  1.2  [get_ports rstn]
set_input_delay -clock clk  1.2  [get_ports vehicle_at_entry]
set_input_delay -clock clk  1.2  [get_ports vehicle_at_exit]
set_input_delay -clock clk  1.2  [get_ports correct_password]



set_output_delay -clock clk  1.2  [get_ports entry_gate]
set_output_delay -clock clk  1.2  [get_ports exit_gate]
set_output_delay -clock clk  1.2  [get_ports entry_led]
set_output_delay -clock clk  1.2  [get_ports exit_led]

set_output_delay -clock clk  1.2  [get_ports {state[2]}]
set_output_delay -clock clk  1.2  [get_ports {state[1]}]
set_output_delay -clock clk  1.2  [get_ports {state[0]}]
set_output_delay -clock clk  1.2  [get_ports {vehicle_count[7]}]
set_output_delay -clock clk  1.2  [get_ports {vehicle_count[6]}]
set_output_delay -clock clk  1.2  [get_ports {vehicle_count[5]}]
set_output_delay -clock clk  1.2  [get_ports {vehicle_count[4]}]
set_output_delay -clock clk  1.2  [get_ports {vehicle_count[3]}]
set_output_delay -clock clk  1.2  [get_ports {vehicle_count[2]}]
set_output_delay -clock clk  1.2  [get_ports {vehicle_count[1]}]
set_output_delay -clock clk  1.2  [get_ports {vehicle_count[0]}]
set_output_delay -clock clk  1.2  [get_ports {seg_display[6]}]
set_output_delay -clock clk  1.2  [get_ports {seg_display[5]}]
set_output_delay -clock clk  1.2  [get_ports {seg_display[4]}]
set_output_delay -clock clk  1.2  [get_ports {seg_display[3]}]
set_output_delay -clock clk  1.2  [get_ports {seg_display[2]}]
set_output_delay -clock clk  1.2  [get_ports {seg_display[1]}]
set_output_delay -clock clk  1.2  [get_ports {seg_display[0]}]


set_load -pin_load  1.2  [get_ports {state[2]}]
set_load -pin_load  1.2  [get_ports {state[1]}]
set_load -pin_load  1.2  [get_ports {state[0]}]
set_load -pin_load  1.2  [get_ports {vehicle_count[7]}]
set_load -pin_load  1.2  [get_ports {vehicle_count[6]}]
set_load -pin_load  1.2  [get_ports {vehicle_count[5]}]
set_load -pin_load  1.2  [get_ports {vehicle_count[4]}]
set_load -pin_load  1.2  [get_ports {vehicle_count[3]}]
set_load -pin_load  1.2  [get_ports {vehicle_count[2]}]
set_load -pin_load  1.2  [get_ports {vehicle_count[1]}]
set_load -pin_load  1.2  [get_ports {vehicle_count[0]}]
set_load -pin_load  1.2  [get_ports {seg_display[6]}]
set_load -pin_load  1.2  [get_ports {seg_display[5]}]
set_load -pin_load  1.2  [get_ports {seg_display[4]}]
set_load -pin_load  1.2  [get_ports {seg_display[3]}]
set_load -pin_load  1.2  [get_ports {seg_display[2]}]
set_load -pin_load  1.2  [get_ports {seg_display[1]}]
set_load -pin_load  1.2  [get_ports {seg_display[0]}]

