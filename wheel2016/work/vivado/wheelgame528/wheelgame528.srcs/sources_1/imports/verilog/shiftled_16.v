/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module shiftled_16 (
    input rst,
    input clk,
    input [36:0] led,
    input [36:0] shifter,
    output reg [36:0] out
  );
  
  
  
  always @* begin
    out = 1'h0;
    out = led >> shifter;
  end
endmodule
