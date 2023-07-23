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
    input               rstn,
    input       [6:0]   opcode_i,
    output  reg         branch_o,
    output  reg         mem_read_o,
    output  reg         mem_to_reg_o,
    output  reg [1:0]   alu_op_o,
    output  reg         mem_write_o,
    output  reg         alu_src_o,
    output  reg         reg_write_o
);

//------------------------ PROCESS ------------------------//

always @(negedge rstn or opcode_i) begin
    if(!rstn) begin
        branch_o        <=  1'b0;
        mem_read_o      <=  1'b0;
        mem_to_reg_o    <=  1'b0;
        alu_op_o        <=  2'b00;
        mem_write_o     <=  1'b0;
        alu_src_o       <=  1'b0;
        reg_write_o     <=  1'b0;
    end else begin
        case(opcode_i)
            7'b0110011: begin   // R-type
                branch_o        <=  1'b0;
                mem_read_o      <=  1'b0;
                mem_to_reg_o    <=  1'b0;
                alu_op_o        <=  2'b10;
                mem_write_o     <=  1'b0;
                alu_src_o       <=  1'b0;
                reg_write_o     <=  1'b1;
            end
            7'b0000011: begin   // ld
                branch_o        <=  1'b0;
                mem_read_o      <=  1'b1;
                mem_to_reg_o    <=  1'b1;
                alu_op_o        <=  2'b00;
                mem_write_o     <=  1'b0;
                alu_src_o       <=  1'b1;
                reg_write_o     <=  1'b1;
            end
            7'b0100011: begin   // sd
                branch_o        <=  1'b0;
                mem_read_o      <=  1'b0;
                mem_to_reg_o    <=  1'b0;
                alu_op_o        <=  2'b00;
                mem_write_o     <=  1'b1;
                alu_src_o       <=  1'b1;
                reg_write_o     <=  1'b0;
            end
            7'b0010011: begin   // addi
                branch_o        <=  1'b0;
                mem_read_o      <=  1'b0;
                mem_to_reg_o    <=  1'b0;
                alu_op_o        <=  2'b00;
                mem_write_o     <=  1'b0;
                alu_src_o       <=  1'b1;
                reg_write_o     <=  1'b1;
            end
            7'b1100011: begin   // beq
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
end

endmodule