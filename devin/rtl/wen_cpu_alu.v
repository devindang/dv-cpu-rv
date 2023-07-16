//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2023, devin
//  balddonkey@outlook.com
//
//-------------------------------------------------------------------
// Title       : cpu_alu.v
// Author      : Devin
// Editor      : VIM
// Created     :
// Description : Algorithm Logic Unit, refer to Table of opcodes.
//
// $Id$
//-------------------------------------------------------------------

`timescale 1ns / 1ps

module cpu_alu #(
	parameter REG_WID = 10	
)(
	input	[2:0]				OP,		// operation code
	input						Si,		// status input
	input	[REG_WID-1:0]		A,		// operand A
	input	[REG_WID-1:0]		B,		// operand B
	output	reg	[REG_WID-1:0]	R,		// result
	output	reg					So		// status output
);

//------------------------ SIGNALS DECLARING GOES BELOW ------------------------//



//------------------------ PROCESS GOES BELOW ------------------------//

always @(*) begin
	case(OP)
		3'b000:	{So, R} <= A;
		3'b001: {So, R} <= A < B ? 1 : 0;
		3'b100: {So, R} <= A + B;
		3'b101: {So, R} <= A - B;
		3'b110: {So, R} <= A & B;
		3'b111: {So, R} <= A | B;
		default: {So, R} <= A;
	endcase
end

//------------------------ INSTANTIATE GOES BELOW ------------------------//


endmodule
