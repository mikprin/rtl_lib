# Adjustable_frequency_divider

Frequency divider with edge triggered input which increases devisor ratio each time positive edge is triggered.

Test `test.v` can be used to verify module in testbench. Tested in ikarus verilog.

Use `step_divisor` input to increase the half if the divisor ratio by one.

Verified on Xilinux Zynq7000 FPGA.

## Parameters

COUNTER_RANGE defaults to 10. Range of the counter in the divider
MAX_DIVISION defaults to 10. Shows maxinum number which can be added to divisor before it resets to 1 again. Each iteration of `step_divisor` signal increases `half_divisor` by one before this limit. 
DIVISOR_RANGE defaults to  6;
