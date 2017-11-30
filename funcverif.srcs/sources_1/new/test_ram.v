`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2017 06:55:57 PM
// Design Name: 
// Module Name: test_ram
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


module test_ram;

integer i, results;
reg [7:0] index [31:0];
reg [3:0] address;
reg [7:0] din;
reg we;
wire clock;
wire [7:0] dout;
parameter delay = 1;

//Stimuli File
initial
    begin
    $readmemh ("stimuli.in", index);
    end
    
initial
    begin
    i = 0;
    we = 1;
    results = $fopen ("verification.txt", "w");
    end   
    
ram i1(.dataout(dout), .datain(din), .address(address), .we(we), .clock(clock));

clock i2(.clock(clock));

always @ (negedge clock)
    begin
    if (we == 1)
        begin
        address = index [i];
        #delay
        i = i+1;
        @(negedge clock) din = index [i];
        if (i >= 32)
            begin
            #delay
            i = 0;
            we = 0;
            end
        else
            begin
            #delay
            i = i + 1;
            end
        end
    else
        begin
        if (i > 15)
            begin
            $fclose (results);
            #delay
            i = 0;
            we = 1;
            $finish;
            end
        else
            begin
            address = i;
            @(negedge clock) $fwrite (results, "%h %h\n", address, dout);
            i = i + 1;
            end
        end
    end                             
endmodule
