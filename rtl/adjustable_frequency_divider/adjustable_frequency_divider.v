`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2022 03:16:15 PM
// Design Name: 
// Module Name: adjustable_frequency_divider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module adjustable_frequency_divider(
    input wire clock_in, // input clock on FPGA
    input wire nreset, // Block reset
    input wire step_divisor, // step divisor 2 times
    output reg clock_out // output clock after dividing the input clock by divisor
    );
    
    parameter COUNTER_RANGE = 10;
    parameter MAX_DIVISION = 10;
    parameter DIVISOR_RANGE = 6;
    reg[COUNTER_RANGE-1:0] counter;
    reg[DIVISOR_RANGE-1:0] half_divisor = 20'd1;
    // The frequency of the output clk_out
    //  = The frequency of the input clk_in divided by DIVISOR
    // For example: Fclk_in = 50Mhz, if you want to get 1Hz signal to blink LEDs
    // You will modify the DIVISOR parameter value to 28'd50.000.000
    // Then the frequency of the output clk_out = 50Mhz/50.000.000 = 1Hz
    always @(posedge clock_in)
    begin 
        if ( nreset ) begin
            counter <= counter + 20'd1;
            if(counter>=( half_divisor*2 -1))
            counter <= 20'd0;
            clock_out <= (counter < half_divisor)?1'b1:1'b0;
        end
        else // RESET
        begin
            counter <= 20'd0;
            //half_divisor <= 20'd1;
        end
    end

    always @(posedge step_divisor) begin // Clocking in divisor step
        if ( nreset )
        begin
            if (half_divisor*2 < MAX_DIVISION) begin
                half_divisor <= half_divisor + 1'b1;
            end else begin
                half_divisor <= 20'd1;
            end
        end
    end
    
    
endmodule
