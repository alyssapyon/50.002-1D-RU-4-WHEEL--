/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module game_miniBeta_1 (
    input clk,
    input rst,
    input reset_button,
    input select_button,
    output reg [15:0] level,
    output reg [15:0] randA,
    output reg [15:0] randB
  );
  
  
  
  reg [15:0] inputAlu_a;
  
  reg [15:0] inputAlu_b;
  
  wire [16-1:0] M_alu_out;
  wire [3-1:0] M_alu_zvn;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  reg [6-1:0] M_alu_alufn_signal;
  alu_10 alu (
    .a(M_alu_a),
    .b(M_alu_b),
    .alufn_signal(M_alu_alufn_signal),
    .out(M_alu_out),
    .zvn(M_alu_zvn)
  );
  
  wire [6-1:0] M_controlunit_alufn;
  wire [1-1:0] M_controlunit_wdsel;
  wire [3-1:0] M_controlunit_asel;
  wire [2-1:0] M_controlunit_alu_out_sel;
  wire [4-1:0] M_controlunit_regfile_write_address;
  wire [4-1:0] M_controlunit_regfile_read_address_a;
  wire [4-1:0] M_controlunit_regfile_read_address_b;
  wire [1-1:0] M_controlunit_we_regfile;
  reg [16-1:0] M_controlunit_regfile_datain;
  reg [1-1:0] M_controlunit_reset_button;
  reg [1-1:0] M_controlunit_select_button;
  game_CU_11 controlunit (
    .clk(clk),
    .rst(rst),
    .regfile_datain(M_controlunit_regfile_datain),
    .reset_button(M_controlunit_reset_button),
    .select_button(M_controlunit_select_button),
    .alufn(M_controlunit_alufn),
    .wdsel(M_controlunit_wdsel),
    .asel(M_controlunit_asel),
    .alu_out_sel(M_controlunit_alu_out_sel),
    .regfile_write_address(M_controlunit_regfile_write_address),
    .regfile_read_address_a(M_controlunit_regfile_read_address_a),
    .regfile_read_address_b(M_controlunit_regfile_read_address_b),
    .we_regfile(M_controlunit_we_regfile)
  );
  wire [16-1:0] M_player_out_a;
  wire [16-1:0] M_player_out_b;
  wire [16-1:0] M_player_level;
  wire [16-1:0] M_player_randA;
  wire [16-1:0] M_player_randB;
  reg [4-1:0] M_player_write_address;
  reg [1-1:0] M_player_we;
  reg [16-1:0] M_player_data;
  reg [4-1:0] M_player_read_address_a;
  reg [4-1:0] M_player_read_address_b;
  game_miniRegfiles_12 player (
    .clk(clk),
    .rst(rst),
    .write_address(M_player_write_address),
    .we(M_player_we),
    .data(M_player_data),
    .read_address_a(M_player_read_address_a),
    .read_address_b(M_player_read_address_b),
    .out_a(M_player_out_a),
    .out_b(M_player_out_b),
    .level(M_player_level),
    .randA(M_player_randA),
    .randB(M_player_randB)
  );
  wire [37-1:0] M_wheelLED_led;
  reg [1-1:0] M_wheelLED_select_button;
  reg [1-1:0] M_wheelLED_reset_button;
  wheelLED_2 wheelLED (
    .clk(clk),
    .rst(rst),
    .select_button(M_wheelLED_select_button),
    .reset_button(M_wheelLED_reset_button),
    .led(M_wheelLED_led)
  );
  wire [1-1:0] M_vc_out;
  wire [16-1:0] M_vc_debug;
  variable_counter_13 vc (
    .clk(clk),
    .rst(rst),
    .out(M_vc_out),
    .debug(M_vc_debug)
  );
  wire [1-1:0] M_count_value;
  counter_14 count (
    .clk(clk),
    .rst(rst),
    .value(M_count_value)
  );
  
  wire [16-1:0] M_ledTOnum_userAnswer;
  reg [37-1:0] M_ledTOnum_led;
  ledTOnum_15 ledTOnum (
    .led(M_ledTOnum_led),
    .userAnswer(M_ledTOnum_userAnswer)
  );
  
  always @* begin
    M_controlunit_reset_button = reset_button;
    M_controlunit_select_button = select_button;
    M_wheelLED_reset_button = reset_button;
    M_wheelLED_select_button = select_button;
    M_ledTOnum_led = M_wheelLED_led;
    M_player_we = M_controlunit_we_regfile;
    M_player_write_address = M_controlunit_regfile_write_address;
    M_player_read_address_a = M_controlunit_regfile_read_address_a;
    M_player_read_address_b = M_controlunit_regfile_read_address_b;
    M_controlunit_regfile_datain = M_player_out_b;
    
    case (M_controlunit_asel)
      2'h0: begin
        inputAlu_a = 1'h0;
      end
      2'h1: begin
        inputAlu_a = 1'h1;
      end
      2'h2: begin
        inputAlu_a = M_player_out_a;
      end
      default: begin
        inputAlu_a = 1'h0;
      end
    endcase
    inputAlu_b = M_player_out_b;
    M_alu_a = inputAlu_a;
    M_alu_b = inputAlu_b;
    M_alu_alufn_signal = M_controlunit_alufn;
    
    case (M_controlunit_alu_out_sel)
      2'h0: begin
        M_player_data = 1'h0;
      end
      2'h1: begin
        M_player_data = M_vc_out;
      end
      2'h2: begin
        M_player_data = M_ledTOnum_userAnswer;
      end
      default: begin
        M_player_data = M_alu_out;
      end
    endcase
    level = M_player_level;
    randA = M_player_randA;
    randB = M_player_randB;
  end
endmodule
