//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2023, devin
//  balddonkey@outlook.com
//
//-------------------------------------------------------------------
// Title       : rv_ctrl.V
// Author      : Devin
// Editor      : VIM
// Created     :
// Description : Control path.
//
// $Id$
//-------------------------------------------------------------------

`timescale 1ns / 1ps

module rv_ctrl(
    input       [6:0]   instr_part_i,
    output  reg         branch_o,
    output  reg         mem_read_o,
    output  reg         mem_to_reg_o,
    output  reg [1:0]   alu_op_o,
    output  reg         mem_write_o,
    output  reg         alu_src_o,
    output  reg         reg_write_o
);

//------------------------ PROCESS ------------------------//

always @(instr_part_i) begin
    case(instr_part_i)
        6'b011001: begin    // R-type
            branch_o        <=  1'b0;
            mem_read_o      <=  1'b0;
            mem_to_reg_o    <=  1'b0;
            alu_op_o        <=  2'b10;
            mem_write_o     <=  1'b0;
            alu_src_o       <=  1'b0;
            reg_write_o     <=  1'b1;
        end
        6'b000011: begin    // ld
            branch_o        <=  1'b0;
            mem_read_o      <=  1'b1;
            mem_to_reg_o    <=  1'b0;
            alu_op_o        <=  2'b00;
            mem_write_o     <=  1'b0;
            alu_src_o       <=  1'b1;
            reg_write_o     <=  1'b1;
        end
        6'b010011: begin    // sd
            branch_o        <=  1'b0;
            mem_read_o      <=  1'b0;
            mem_to_reg_o    <=  1'b0;
            alu_op_o        <=  2'b00;
            mem_write_o     <=  1'b1;
            alu_src_o       <=  1'b1;
            reg_write_o     <=  1'b0;
        end
        6'b110011: begin    // beq
            branch_o        <=  1'b1;
            mem_read_o      <=  1'b0;
            mem_to_reg_o    <=  1'b0;
            alu_op_o        <=  2'b01;
            mem_write_o     <=  1'b0;
            alu_src_o       <=  1'b0;
            reg_write_o     <=  1'b0;
        end
        default: begin
            branch_o        <=  1'b0;
            mem_read_o      <=  1'b0;
            mem_to_reg_o    <=  1'b0;
            alu_op_o        <=  2'b00;
            mem_write_o     <=  1'b0;
            alu_src_o       <=  1'b0;
            reg_write_o     <=  1'b0;
        end
    endcase
end

endmodule