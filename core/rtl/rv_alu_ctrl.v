//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2023, devin
//  balddonkey@outlook.com
//
//-------------------------------------------------------------------
// Title       : rv_alu_ctrl.v
// Author      : Devin
// Editor      : VIM
// Created     :
// Description : ALU control unit.
//
// $Id$
//-------------------------------------------------------------------

`timescale 1ns / 1ps

module rv_alu_ctrl(
    input       [1:0]   alu_op_i,
    input       [3:0]   instr_part_i,
    output  reg [3:0]   alu_op_sel_o
);

//------------------------ PROCESS ------------------------//

always @(alu_op_i) begin
    casez(alu_op_i)
        2'b00: begin
            alu_op_sel_o <= 4'b0010;
        end
        2'b?1: begin
            alu_op_sel_o <= 4'b0110;
        end
        2'b1?: begin
            case(instr_part_i)
                4'b0_000: alu_op_sel_o <= 4'b0010;
                4'b1_000: alu_op_sel_o <= 4'b0110;
                4'b0_111: alu_op_sel_o <= 4'b0000;
                4'b0_110: alu_op_sel_o <= 4'b0001;
                default: alu_op_sel_o <= 4'b1111;   // invalid operation.
            endcase
        end
        default: alu_op_sel_o <= 4'b1111;
    endcase
end

endmodule