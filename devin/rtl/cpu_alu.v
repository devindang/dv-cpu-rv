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

module cpu_alu(
	input	[2:0]				OP,
	input	[REG_WID-1:0]		A,
	input	[REG_WID-1:0]		B,
	output	reg	[REG_WID-1:0]	R
);

//------------------------ SIGNALS DECLARING GOES BELOW ------------------------//



//------------------------ PROCESS GOES BELOW ------------------------//

always @(*) begin
	case(OP)
		3'b000:	R <= A;
		3'b001: R <= A < B ? 1 : 0;
		3'b010: R <= A + Val;
		3'b011: R <= A - Val;
		3'b100: R <= A + B;
		3'b101: R <= A - B;
		3'b110: R <= A & B;
		3'b111: R <= A | B;
		default: R <= A;
	end
end

//------------------------ INSTANTIATE GOES BELOW ------------------------//


endmodule
