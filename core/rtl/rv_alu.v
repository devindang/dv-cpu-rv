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
    output  reg [63:0]  result_o
);

//------------------------ PROCESS ------------------------//

always @(op_sel_i, op1_i, op2_i) begin
    case(op_sel_i)
        4'b0000: result_o <= op1_i + op2_i;                             // add
        4'b1000: result_o <= op1_i - op2_i;                             // sub
        4'b0001: result_o <= op1_i << op2_i;                            // sll
        4'b0010: result_o <= ($signed(op1_i) < $signed(op2_i)) ? 1 : 0; // slt
        4'b0011: result_o <= (op1_i < op2_i) ? 1 : 0;                   // sltu
        4'b0100: result_o <= op1_i ^ op2_i;                             // xor
        4'b0101: result_o <= op1_i >> op2_i;                            // srl
        4'b1101: result_o <= ($signed(op1_i)) >>> op2_i;                // sra
        4'b0110: result_o <= op1_i | op2_i;                             // or
        4'b0111: result_o <= op1_i & op2_i;                             // and
        default: result_o <= 0;
    endcase
end


endmodule