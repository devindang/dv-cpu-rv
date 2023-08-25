//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2023, devin
//  balddonkey@outlook.com
//
//-------------------------------------------------------------------
//
//  Author      : Devin
//  Project     : dv-cpu-rv
//  Repository  : https://github.com/devindang/dv-cpu-rv
//  Title       : rv_imm_gen.v
//  Dependances : 
//  Editor      : VIM
//  Created     : 2023-07-22
//  Description : Immediate generation.
//
//-------------------------------------------------------------------

`include "defines.v"

module rv_imm_gen(
    input       [31:0]        instr_i,
    output  reg [`MXLEN-1:0]  expand_o
);

//------------------------ SIGNALS ------------------------//

wire [2:0]  funct3;

//------------------------ PROCESS ------------------------//

always @(instr_i) begin
    case(instr_i[6:0])  // opcode filed
        7'b0000011: expand_o <= {{(`MXLEN-12){instr_i[31]}},instr_i[31:20]};  // I-type load
        7'b0010011, 7'b0011011: begin
            if(funct3[1:0]==2'b01) begin
                expand_o <= {{(`MXLEN-6){1'b0}},instr_i[25:20]}; // I-type shift RV64I
            end else begin
                expand_o <= {{(`MXLEN-12){instr_i[31]}},instr_i[31:20]};  // I-type normal
            end
        end
        7'b1100111: expand_o <= {{(`MXLEN-12){instr_i[31]}},instr_i[31:20]};  // I-type JALR
        7'b0100011: expand_o <= {{(`MXLEN-12){instr_i[31]}},instr_i[31:25],instr_i[11:7]};  // S-type store
        7'b1100011: expand_o <= {{(`MXLEN-12){instr_i[31]}},instr_i[31],instr_i[7],instr_i[30:25],instr_i[11:8]};  // B-type branch
        7'b0110111: expand_o <= {{(`MXLEN-32){instr_i[31]}},instr_i[31:12],12'd0};   // LUI
        7'b0010111: expand_o <= {{(`MXLEN-32){instr_i[31]}},instr_i[31:12],12'd0};   // AUIPC
        7'b1101111: expand_o <= {{(`MXLEN-21){instr_i[31]}},instr_i[31],instr_i[19:12],instr_i[20],instr_i[30:21],1'b0}; // J-type    // shift-by-1 here
        default: expand_o <= `MXLEN'd0;
    endcase
end

assign funct3 = instr_i[14:12];

endmodule