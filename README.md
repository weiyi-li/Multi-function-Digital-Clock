# Multi-function-Digital-Clock
A multi-function digital clock implemented in Verilog HDL, supported by Quartus II and Altera DE1 FPGA.  
Functions: Clock count | Stopwatch | Countdown | Time setting | Reset | Pulse and continue | LED display  
The codes are divided into two parts and they are defining the behaviors and functions of countclock_basic and segment7 respectively.
### countclock_basic  
The part of countclock_basic is composed of several blocks, which count for different functions.  
· Frequency division clk: introduce a clock signal of 27000000Hz, which count 1 second each time  
· Initial zero status rstn: introduce a negative reset control to zero out the display  
· Clock count enaclk: enable clock count function  
· Time setting enaset: enable time setting function  
· Stopwatch enastp: enable stopwatch function  
· Countdown enactd: enable countdown function  
· LED: enable LED light LEDR0 when unit digit of second reaches 0.  
· Automatic counting: count up the register _reg [26:0]_ count by default under all conditions  
## segment7  
The part of segment7 counts for four 7-segment LED display.  
· Case disp: assign the seven single segments to the outputs correspondingly  

The block diagram consisting of the created symbol from Verilog HDL code is shown below.
![Image](https://github.com/weiyi-li/Multi-function-Digital-Clock/blob/master/Image/Hardware%20block%20diagram%20by%20created%20symbols.PNG)
