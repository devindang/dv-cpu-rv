//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2023, devin
//  balddonkey@outlook.com
//
//-------------------------------------------------------------------
// Title       : rv_imm_gen.V
// Author      : Devin
// Editor      : VIM
// Created     :
// Description : Immediate generation.
//
// $Id$
//-------------------------------------------------------------------

`timescale 1ns / 1ps

module rv_imm_gen(
    input       [31:0]  instr_i,
    output  reg [63:0]  expand_o
);

//------------------------ PROCESS ------------------------//

always @(instr_i) begin
    case(instr_i[6:0])  // opcode filed
        7'b0000011: expand_o <= {{52{instr_i[31]}},instr_i[31:20]};  // load
        7'b0100011: expand_o <= {{52{instr_i[31]}},instr_i[31:25],instr_i[11:7]};  // store
        7'b1100011: expand_o <= {{52{instr_i[31]}},instr_i[31],instr_i[7],instr_i[30:25],instr_i[11:8]};  // branch
        7'b0110111: expand_o <= {{32{instr_i[31]}},instr_i[31:12],12'd0};   // LUI
        7'b0010111: expand_o <= {{32{instr_i[31]}},instr_i[31:12],12'd0};   // AUIPC
        default: expand_o <= 64'd0;
    endcase
end

endmodule