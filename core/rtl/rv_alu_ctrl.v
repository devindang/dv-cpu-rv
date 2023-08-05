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
    output  reg [3:0]   alu_op_sel_o
);

//------------------------ PROCESS ------------------------//

always @(opcode_i, instr_part_i) begin              // inst // alu
    case(opcode_i)
        7'b0110011: begin   // R-type
            alu_op_sel_o <= instr_part_i;
        end
        7'b0010011: begin   // I-type
            alu_op_sel_o <= 4'b0000;                // addi // add
        end
        7'b0000011: begin   // I-type Load
            alu_op_sel_o <= 4'b0000;                // ld   // add
        end
        7'b0100011: begin   // S-type
            alu_op_sel_o <= 4'b0000;
        end
        7'b1100011: begin   // B-type
            case(instr_part_i[2:0])
                3'b000: alu_op_sel_o <= 4'b1000;    // beq  // subtract
                3'b100: alu_op_sel_o <= 4'b0010;    // blt  // set less than
                default: alu_op_sel_o <= 4'b1111;
            endcase
        end
        7'b0110111: begin   // U-type LUI
            alu_op_sel_o <= 4'b0000;
        end
        7'b0010111: begin   // U-type AUIPC
            alu_op_sel_o <= 4'b0000;
        end
        7'b1101111: begin   // J-type // reserve
            alu_op_sel_o <= 4'b1111;
        end
        default: alu_op_sel_o <= 4'b1111;
    endcase
end

endmodule