//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2023, devin
//  balddonkey@outlook.com
//
//-------------------------------------------------------------------
// Title       : rv_branch_test.V
// Author      : Devin
// Editor      : VIM
// Created     :
// Description : Immediate generation.
//
// $Id$
//-------------------------------------------------------------------

`timescale 1ns / 1ps

module rv_branch_test(
    input       [63:0]  alu_result_i,
    input       [2:0]   funct3_i,
    output  reg         taken_o
);

wire zero;

//------------------------ PROCESS ------------------------//

assign zero = ~(|alu_result_i);

always @(funct3_i, alu_result_i) begin
    case(funct3_i)
        3'b000:  taken_o <= zero;            // beq
        3'b001:  taken_o <= ~zero;           // bne
        3'b100:  taken_o <= alu_result_i[0]; // blt
        3'b101:  taken_o <= ~alu_result_i[0];// bge
        3'b110:  taken_o <= 1'b0;            // bltu
        3'b111:  taken_o <= 1'b0;            // bgeu
        default: taken_o <= 1'b0;
    endcase
end


endmodule