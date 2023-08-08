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
    output  reg         mem_write_o,
    output  reg [1:0]   alu1_src_o,
    output  reg         alu2_src_o,
    output  reg [1:0]   reg_read_o,
    output  reg         reg_write_o,
    output  reg         jal_o,
    output  reg         jalr_o
);

//------------------------ PROCESS ------------------------//

always @(negedge rstn or opcode_i) begin
    if(!rstn) begin
        branch_o        <=  1'b0;
        mem_read_o      <=  1'b0;
        mem_to_reg_o    <=  1'b0;
        mem_write_o     <=  1'b0;
        alu1_src_o      <=  2'b00;
        alu2_src_o      <=  1'b0;
        reg_read_o      <=  2'b00;
        reg_write_o     <=  1'b0;
        jal_o           <=  1'b0;
        jalr_o          <=  1'b0;
    end else begin
        case(opcode_i)
            7'b0110011: begin   // R-type
                branch_o        <=  1'b0;
                mem_read_o      <=  1'b0;
                mem_to_reg_o    <=  1'b0;
                mem_write_o     <=  1'b0;
                alu1_src_o      <=  2'b00;
                alu2_src_o      <=  1'b0;
                reg_read_o      <=  2'b11;
                reg_write_o     <=  1'b1;
                jal_o           <=  1'b0;
                jalr_o          <=  1'b0;
            end
            7'b0010011: begin   // I-type
                branch_o        <=  1'b0;
                mem_read_o      <=  1'b0;
                mem_to_reg_o    <=  1'b0;
                mem_write_o     <=  1'b0;
                alu1_src_o      <=  2'b00;
                alu2_src_o      <=  1'b1;
                reg_read_o      <=  2'b01;
                reg_write_o     <=  1'b1;
                jal_o           <=  1'b0;
                jalr_o          <=  1'b0;
            end
            7'b0000011: begin   // I-type Load
                branch_o        <=  1'b0;
                mem_read_o      <=  1'b1;
                mem_to_reg_o    <=  1'b1;
                mem_write_o     <=  1'b0;
                alu1_src_o      <=  2'b00;
                alu2_src_o      <=  1'b1;
                reg_read_o      <=  2'b01;
                reg_write_o     <=  1'b1;
                jal_o           <=  1'b0;
                jalr_o          <=  1'b0;
            end
            7'b0100011: begin   // S-type
                branch_o        <=  1'b0;
                mem_read_o      <=  1'b0;
                mem_to_reg_o    <=  1'b0;
                mem_write_o     <=  1'b1;
                alu1_src_o      <=  2'b00;
                alu2_src_o      <=  1'b1;
                reg_read_o      <=  2'b11;
                reg_write_o     <=  1'b0;
                jal_o           <=  1'b0;
                jalr_o          <=  1'b0;
            end
            7'b1100011: begin   // B-type
                branch_o        <=  1'b1;
                mem_read_o      <=  1'b0;
                mem_to_reg_o    <=  1'b0;
                mem_write_o     <=  1'b0;
                alu1_src_o      <=  2'b00;
                alu2_src_o      <=  1'b0;
                reg_read_o      <=  2'b11;
                reg_write_o     <=  1'b0;
                jal_o           <=  1'b0;
                jalr_o          <=  1'b0;
            end
            7'b1101111: begin   // J-type
                branch_o        <=  1'b1;
                mem_read_o      <=  1'b0;
                mem_to_reg_o    <=  1'b0;
                mem_write_o     <=  1'b0;
                alu1_src_o      <=  2'b10;  // PC
                alu2_src_o      <=  1'b1;
                reg_read_o      <=  2'b00;
                reg_write_o     <=  1'b1;
                jal_o           <=  1'b1;
                jalr_o          <=  1'b0;
            end
            7'b0110111: begin   // U-type LUI (unique)
                branch_o        <=  1'b0;
                mem_read_o      <=  1'b0;
                mem_to_reg_o    <=  1'b0;
                mem_write_o     <=  1'b0;
                alu1_src_o      <=  2'b01;  // force zero
                alu2_src_o      <=  1'b1;
                reg_read_o      <=  2'b00;
                reg_write_o     <=  1'b1;
                jal_o           <=  1'b0;
                jalr_o          <=  1'b0;
            end
            7'b0010111: begin   // U-type AUIPC (unique)
                branch_o        <=  1'b0;
                mem_read_o      <=  1'b0;
                mem_to_reg_o    <=  1'b0;
                mem_write_o     <=  1'b0;
                alu1_src_o      <=  2'b10;  // PC
                alu2_src_o      <=  1'b1;
                reg_read_o      <=  2'b00;
                reg_write_o     <=  1'b1;
                jal_o           <=  1'b0;
                jalr_o          <=  1'b0;
            end
            7'b1100111: begin   // I-type JALR
                branch_o        <=  1'b1;
                mem_read_o      <=  1'b0;
                mem_to_reg_o    <=  1'b0;
                mem_write_o     <=  1'b0;
                alu1_src_o      <=  2'b10;  // PC
                alu2_src_o      <=  1'b1;
                reg_read_o      <=  2'b01;
                reg_write_o     <=  1'b1;
                jal_o           <=  1'b0;
                jalr_o          <=  1'b1;
            end
            default: begin
                branch_o        <=  1'b0;
                mem_read_o      <=  1'b0;
                mem_to_reg_o    <=  1'b0;
                mem_write_o     <=  1'b0;
                alu1_src_o      <=  2'b00;
                alu2_src_o      <=  1'b0;
                reg_read_o      <=  2'b00;
                reg_write_o     <=  1'b0;
                jal_o           <=  1'b0;
                jalr_o          <=  1'b0;
            end
        endcase
    end
end

endmodule