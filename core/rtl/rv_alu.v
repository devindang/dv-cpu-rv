//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2023, devin
//  balddonkey@outlook.com
//
//-------------------------------------------------------------------
// Title       : rv_alu.v
// Author      : Devin
// Editor      : VIM
// Created     :
// Description : Algorithm logic unit.
//
// $Id$
//-------------------------------------------------------------------

`timescale 1ns / 1ps

module rv_alu(
    input       [63:0]  op1_i,
    input       [63:0]  op2_i,
    input       [3:0]   op_sel_i,
    output  reg [63:0]  result,
    output              zero
);

//------------------------ PROCESS ------------------------//

always @(op_sel_i, op1_i, op2_i) begin
    case(op_sel_i)
        4'b0000: result <= op1_i & op2_i;           // and
        4'b0001: result <= op1_i | op2_i;           // or
        4'b0010: result <= op1_i + op2_i;           // add
        4'b0110: result <= op1_i - op2_i;           // subtract
        4'b0111: result <= op1_i < op2_i ? 1 : 0;   // set less than
        4'b1100: result <= ~(op1_i | op2_i);        // nor
        default: result <= 0;
    endcase
end

assign zero = ~(|result);

endmodule