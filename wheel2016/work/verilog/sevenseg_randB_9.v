/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module sevenseg_randB_9 (
    input [15:0] randB,
    output reg [13:0] out
  );
  
  
  
  wire [7-1:0] M_randdig_out;
  reg [16-1:0] M_randdig_in;
  rand_digit_19 randdig (
    .in(M_randdig_in),
    .out(M_randdig_out)
  );
  
  always @* begin
    M_randdig_in = randB;
    out = M_randdig_out;
  end
endmodule