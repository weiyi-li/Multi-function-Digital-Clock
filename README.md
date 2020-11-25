# Multi-function-Digital-Clock
A multi-function digital clock implemented in Verilog HDL, supported by Quartus II and Altera DE1 FPGA.  

## Functions
Clock count, stopwatch, countdown, time setting, reset, pulse and continue, LED display  
Codes are divided into two parts and they are defining the behaviors and functions of countclock_basic and segment7 respectively.

## Parts of code
### _countclock_basic_  
The part of _countclock_basic_ is composed of several blocks, which count for different functions.  
· Frequency division _clk_: introduce a clock signal of 27000000Hz, which count 1 second each time  
· Initial zero status _rstn_: introduce a negative reset control to zero out the display  
· Clock count _enaclk_: enable clock count function  
· Time setting _enaset_: enable time setting function  
· Stopwatch _enastp_: enable stopwatch function  
· Countdown _enactd_: enable countdown function  
· LED: enable LED light LEDR0 when unit digit of second reaches 0.  
· Automatic counting: count up the register _reg [26:0]_ count by default under all conditions  
### _segment7_  
The part of _segment7_ counts for four 7-segment LED display.  
· Case disp: assign the seven single segments to the outputs correspondingly  

The block diagram consisting of the created symbol from Verilog HDL code is shown below.
![Image](https://github.com/weiyi-li/Multi-function-Digital-Clock/blob/master/Image/Hardware%20block%20diagram%20by%20created%20symbols.PNG)
