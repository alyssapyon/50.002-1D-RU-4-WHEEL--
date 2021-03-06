/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module opLED_3 (
    input clk,
    input rst,
    input select_button,
    input reset_button,
    output reg [1:0] opled
  );
  
  
  
  localparam ADD_opstate = 2'd0;
  localparam SUB_opstate = 2'd1;
  localparam RESET_opstate = 2'd2;
  
  reg [1:0] M_opstate_d, M_opstate_q = ADD_opstate;
  
  always @* begin
    M_opstate_d = M_opstate_q;
    
    opled = 1'h0;
    
    case (M_opstate_q)
      ADD_opstate: begin
        if (select_button == 1'h0 && reset_button == 1'h0) begin
          M_opstate_d = SUB_opstate;
        end else begin
          if (select_button == 1'h1 && reset_button == 1'h0) begin
            opled = 1'h1;
          end else begin
            M_opstate_d = RESET_opstate;
          end
        end
      end
      SUB_opstate: begin
        if (select_button == 1'h0 && reset_button == 1'h0) begin
          M_opstate_d = ADD_opstate;
        end else begin
          if (select_button == 1'h1 && reset_button == 1'h0) begin
            opled = 4'ha;
          end else begin
            M_opstate_d = RESET_opstate;
          end
        end
      end
      RESET_opstate: begin
        opled = 1'h0;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_opstate_q <= 1'h0;
    end else begin
      M_opstate_q <= M_opstate_d;
    end
  end
  
endmodule
