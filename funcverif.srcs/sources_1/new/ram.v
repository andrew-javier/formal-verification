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


module ram(dataout, datain, address, we, clock);

output [7:0] dataout;
input [7:0] datain;
input [3:0] address;
input we, clock;

reg [7:0] ram [15:0];
reg [7:0] dataout;

always @ (posedge clock)
begin
case (we)
1'b0: dataout = ram [address];
1'b1: ram [address] = datain;
default: dataout = ram [address];
endcase
end
endmodule
