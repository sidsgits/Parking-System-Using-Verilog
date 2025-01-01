module Car_Parking_System_FSM (
    input clk, 
    input rstn, 
    input vehicle_at_entry, 
    input vehicle_at_exit, 
    input correct_password, 
    output reg entry_gate, 
    output reg exit_gate, 
    output reg entry_led, 
    output reg exit_led, 
    output reg [2:0] state, 
    output reg [7:0] vehicle_count, 
    output reg [6:0] seg_display
);

    // States
    parameter IDLE = 3'b000, 
              AUTHENTICATE = 3'b001, 
              ALLOW_ENTRY = 3'b010, 
              ALLOW_EXIT = 3'b011, 
              ERROR = 3'b100;

    reg [2:0] present_state, next_state;

    // State transition logic (asynchronous reset)
    always @(posedge clk or posedge rstn) begin
        if (rstn) begin
            present_state <= IDLE;
        end else begin
            present_state <= next_state;
        end
    end

    // Next state and output logic
    always @(*) begin
        
        next_state = present_state;
        entry_gate = 0;
        exit_gate = 0;
        entry_led = 0;
        exit_led = 0;
        seg_display = 7'b1000000; // Default "IDLE" 

        case (present_state)
            IDLE: begin
                seg_display = 7'b1111110; // IDLE state display
                if (vehicle_at_entry && vehicle_count < 100) 
                    next_state = AUTHENTICATE;
                else if (vehicle_at_exit && vehicle_count > 0) 
                    next_state = ALLOW_EXIT;
            end

            AUTHENTICATE: begin
                seg_display = 7'b0110000; // AUTHENTICATE state display
                if (correct_password)
                    next_state = ALLOW_ENTRY;
                else
                    next_state = ERROR;
            end

            ALLOW_ENTRY: begin
                entry_gate = 1; // Open entry gate
                entry_led = 1;  // Turn on entry LED
                next_state = IDLE; // Return to IDLE
            end

            ALLOW_EXIT: begin
                seg_display = 7'b0001101; // ALLOW_EXIT state display
                exit_gate = 1; // Open exit gate
                exit_led = 1;  // Turn on exit LED
                next_state = IDLE; // Return to IDLE
            end

            ERROR: begin
                seg_display = 7'b0000011; // ERROR state display
                next_state = IDLE; // Return to IDLE after error
            end

            default: begin
                next_state = IDLE;
            end
        endcase
    end

    // Vehicle count logic
    always @(posedge clk or posedge rstn) begin
        if (rstn) begin
            vehicle_count <= 0;
        end else begin
            case (present_state)
                ALLOW_ENTRY: if (entry_gate) vehicle_count <= vehicle_count + 1;
                ALLOW_EXIT: if (exit_gate) vehicle_count <= vehicle_count - 1;
                default: vehicle_count <= vehicle_count;
            endcase
        end
    end

    // Output current state
    always @(posedge clk or posedge rstn) begin
        if (rstn) begin
            state <= IDLE;
        end else begin
            state <= present_state;
        end
    end

endmodule

