`timescale 1ns / 1ps
`include "adjustable_frequency_divider.v"
// fpga4student.com FPGA projects, VHDL projects, Verilog projects
// Verilog project: Verilog code for clock divider on FPGA
// Testbench Verilog code for clock divider on FPGA
module test;
      // Inputs
      reg clock_in;
      reg nreset;
      reg step_divisor;

      // Outputs
      wire clock_out;
      // Instantiate the Unit Under Test (UUT)
      // Test the clock divider in Verilog
      adjustable_frequency_divider uut (
            .clock_in(clock_in), 
            .clock_out(clock_out),
            .nreset(nreset),
            .step_divisor(step_divisor)
      );
      initial begin
            // Initialize Inputs
            clock_in = 0;
            // create input clock 50MHz
            forever #10 clock_in = ~clock_in;
      end


      initial begin
            nreset = 1'b0;
            step_divisor = 1'b0;
            #20 nreset = 1'b1;
            forever begin
                  #500 step_divisor = ~step_divisor;
                  #5 step_divisor = ~step_divisor;
            end

      end

      initial begin
            // Initialize Inputs
            $dumpvars;
            #100000 $finish;
      end

endmodule

