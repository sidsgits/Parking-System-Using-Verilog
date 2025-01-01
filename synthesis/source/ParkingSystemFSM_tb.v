module ParkingSystemFSM_tb;

    // Inputs
    reg clk;
    reg rstn;
    reg vehicle_at_entry;
    reg vehicle_at_exit;
    reg correct_password;

    // Outputs
    wire entry_gate;
    wire exit_gate;
    wire entry_led;
    wire exit_led;
    wire [2:0] state;
    wire [7:0] vehicle_count;
    wire [6:0] seg_display; // 7-segment display output

    // Instantiate the FSM module
    Car_Parking_System_FSM uut (
        .clk(clk),
        .rstn(rstn),
        .vehicle_at_entry(vehicle_at_entry),
        .vehicle_at_exit(vehicle_at_exit),
        .correct_password(correct_password),
        .entry_gate(entry_gate),
        .exit_gate(exit_gate),
        .entry_led(entry_led),
        .exit_led(exit_led),
        .state(state),
        .vehicle_count(vehicle_count),
        .seg_display(seg_display)
    );

    // Clock generation
    initial begin
        clk = 1;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Extended test cases
    initial begin
        // Monitor signals for debugging
        $monitor("Time: %0t |vehicle_at_entry: %b | vehicle_at_exit: %b | correct_password: %b | State: %b | Entry Gate: %b | Exit Gate: %b | Vehicle Count: %d | Entry LED: %b | Exit LED: %b | 7-Segment Display: %b",$time, vehicle_at_entry, vehicle_at_exit, correct_password, state, entry_gate, exit_gate, vehicle_count, entry_led, exit_led, seg_display);

        // Initial rstn
        rstn = 1;
        vehicle_at_entry = 0;
        vehicle_at_exit = 0;
        correct_password = 0;

        #10 rstn = 0; // Release rstn
        $display("rstn released");

        // Test Case 1: Basic Vehicle Entry
        #10 vehicle_at_entry = 1;
        #10 correct_password = 1;
        $display("Vehicle entry request with correct password");
        #10 vehicle_at_entry = 0; correct_password = 0;
        $display("Vehicle entry completed");
        $display("TEST CASE completed");

        // Test Case 2: Vehicle Exit
        #30 vehicle_at_exit = 1;
        #10 vehicle_at_exit = 0;
        $display("Vehicle exit completed");
        $display("TEST CASE completed");

        // Test Case 3: Incorrect Password
        #20 vehicle_at_entry = 1;
        #10 correct_password = 0; // Incorrect password, should go to ERROR state
        $display("Incorrect password, should go to ERROR state");
        #10 vehicle_at_entry = 0;
        $display("TEST CASE completed");
	
	uut.vehicle_count =25;

        // Test Case 4: Full Parking Lot
        #20 rstn = 1; #10 rstn = 0; // rstn FSM
        uut.vehicle_count = 100; // Simulate parking lot full
        #10 vehicle_at_entry = 1; correct_password = 0;
        #10 vehicle_at_entry = 0;
        $display("TEST CASE completed");

        // Test Case 5: Multiple Entries and Exits
        #30 uut.vehicle_count = 98; // Set vehicle count close to MAX_CAPACITY
        #10 vehicle_at_entry = 1; correct_password = 1; // Entry 1
        #10 vehicle_at_entry = 0;
        #10 vehicle_at_exit = 1; // Exit 1
        #10 vehicle_at_exit = 0;
        #10 vehicle_at_entry = 1; correct_password = 1; // Entry 2
        #10 vehicle_at_entry = 0;
        #10 vehicle_at_exit = 1; // Exit 2
        #10 vehicle_at_exit = 0;
        $display("TEST CASE completed");

        // Test Case 6: Concurrent Entry and Exit Requests
        #20 vehicle_at_entry = 1; vehicle_at_exit = 1; correct_password = 1;
        #10 vehicle_at_entry = 0; vehicle_at_exit = 0; correct_password = 0;
        $display("TEST CASE completed");

        // Test Case 7: Edge Condition at MAX_CAPACITY
        #30 uut.vehicle_count = 99; // One vehicle away from full
        #10 vehicle_at_entry = 1; correct_password = 1; // Should allow entry
        #10 vehicle_at_entry = 0;
        #10 vehicle_at_entry = 1; correct_password = 1; // Should block entry
        #10 vehicle_at_entry = 0;
        $display("TEST CASE completed");

        // End of simulation
        #50 $finish;
    end

endmodule

