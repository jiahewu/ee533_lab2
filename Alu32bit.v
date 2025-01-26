`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:21:19 01/25/2025 
// Design Name:    32-bit ALU
// Module Name:    ALU32bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This is a 32-bit ALU which has addition, subtraction, logical shifter, and, or functions.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU32bit(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] alu_out,
    output reg cout,
    input [1:0] sel
    );//sub equals to cin
 
reg [31:0] result;
assign alu_out = result;
reg raw_cout;
reg [31:0] result_add_sub, result_sht, result_and, result_or;
reg [31:0] bm;	 


	 
always @(*)
  begin
  bm = sub ? ~b:b;
  result_add_sub = a+bm+sub; //add or sub depends on sub control bit
  result_sht = a<<1;//logical left shift 1 bit each time
  result_and = a&b;
  result_or = a|b;
  raw_cout =  (a&bm)|(a&sub)|(bm&sub);
  cout = sub? ~raw_cout:raw_cout;
  case(sel)
    2'b00: result = result_add_sub;
    2'b01: result = result_sht;
    2'b10: result = result_and;
    2'b11: result = result_or;	 
	endcase
  end
endmodule