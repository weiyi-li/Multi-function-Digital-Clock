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

## User Interface
Five toggle switches from SW4 to SW0 and four key buttons from Key3 to Key0 are used, and combinations of inputs give rise to different functions correspondingly. “1” means that the switch is “on” while “0” represents an “off” status of the switch. The toggle switch SW0 is fed by a clock signal _clk_, and another input _rstn_ representing negative reset is assigned to SW1.
### Clock count
    SW4 = 0  
    SW3 = 1  
    SW2 = 0  
    SW1 = 0  
    SW0 = 1  
Turn on the toggle switch SW0 and the clock signal _clk_ is supplied. Since the input _enaclk_ connected to SW3 represents the beginning of clock count, the clock will start
to count upon turning on the switch SW3. In this part, the clock count can also be reset, pulsed and continued. Turn off switch SW0 at clock counting status and the clock count will pulse due to the cutoff of clock signal. Turn it on again will make the count continue. In addition, turning off switch SW3 will lead to a reset and the display will show “0000”.

## Demonstration
![Image](https://github.com/weiyi-li/Multi-function-Digital-Clock/blob/master/Image/DE1 Sample.jpg)
   

