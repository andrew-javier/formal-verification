`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2017 06:44:06 PM
// Design Name: 
// Module Name: clock
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


module clock (clock);
output clock;
reg clock;
parameter half_period = 5;
parameter stop_time = 2000;

initial
clock = 0;

always
#half_period 
clock = ~clock;

initial
#stop_time 
$finish;
endmodule
