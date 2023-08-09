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
    input       [6:0]   opcode_i,
    input       [3:0]   instr_part_i,
    output  reg [3:0]   alu_op_sel_o,
    output  reg         alu_op_32b_o
);

//------------------------ PROCESS ------------------------//

always @(opcode_i, instr_part_i) begin              // inst // alu
    case(opcode_i)
        7'b0110011: begin   // R-type
            alu_op_sel_o <= instr_part_i;
            alu_op_32b_o <= 1'b0;
        end
        7'b0111011: begin   // R-type 32b
            alu_op_sel_o <= instr_part_i;
            alu_op_32b_o <= 1'b1;
        end
        7'b0010011: begin   // I-type
            if(instr_part_i[2:0]==3'b101) begin    // SRLI, SRAI
                alu_op_sel_o <= instr_part_i;
            end else begin
                alu_op_sel_o <= {1'b0, instr_part_i[2:0]};
            end
            alu_op_32b_o <= 1'b0;
        end
        7'b0011011: begin   // I-type 32b
            if(instr_part_i[2:0]==3'b101) begin    // SRLI, SRAI
                alu_op_sel_o <= instr_part_i;
            end else begin
                alu_op_sel_o <= {1'b0, instr_part_i[2:0]};
            end
            alu_op_32b_o <= 1'b1;
        end
        7'b0000011: begin   // I-type Load
            alu_op_sel_o <= 4'b0000;                // ld   // add
            alu_op_32b_o <= 1'b0;
        end
        7'b0100011: begin   // S-type
            alu_op_sel_o <= 4'b0000;
            alu_op_32b_o <= 1'b0;
        end
        7'b1100011: begin   // B-type
            case(instr_part_i[2:0])
                3'b000: alu_op_sel_o <= 4'b1000;    // beq  // subtract
                3'b001: alu_op_sel_o <= 4'b1000;    // bne  // subtract
                3'b100: alu_op_sel_o <= 4'b0010;    // blt  // set less than
                3'b101: alu_op_sel_o <= 4'b0010;    // bge  // set less than
                3'b110: alu_op_sel_o <= 4'b0011;    // bltu // set less than unsigned
                3'b111: alu_op_sel_o <= 4'b0011;    // bgeu // set less than unsigned
                default: alu_op_sel_o <= 4'b1111;
            endcase
            alu_op_32b_o <= 1'b0;
        end
        7'b0110111: begin   // U-type LUI
            alu_op_sel_o <= 4'b0000;
            alu_op_32b_o <= 1'b0;
        end
        7'b0010111: begin   // U-type AUIPC
            alu_op_sel_o <= 4'b0000;
            alu_op_32b_o <= 1'b0;
        end
        7'b1101111: begin   // J-type JAL
            alu_op_sel_o <= 4'b0000;
            alu_op_32b_o <= 1'b0;
        end
        7'b1100111: begin   // I-type JALR
            alu_op_sel_o <= 4'b0000;                // jalr // add
            alu_op_32b_o <= 1'b0;
        end
        default: begin
            alu_op_sel_o <= 4'b1111;
            alu_op_32b_o <= 1'b0;
        end
    endcase
end

endmodule