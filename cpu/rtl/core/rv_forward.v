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
//  Title       : rv_forward.v
//  Dependances : 
//  Editor      : VIM
//  Created     : 2023-07-26
//  Description : Forwarding unit for data hazard in pipelined arch.
//
//-------------------------------------------------------------------

`include "defines.v"

module rv_forward(
    input       [6:0]   opcode_i,
    input       [4:0]   EX_rs1_i,
    input       [4:0]   EX_rs2_i,
    input               MEM_reg_write_i,
    input       [4:0]   MEM_rd_i,
    input               WB_reg_write_i,
    input       [4:0]   WB_rd_i,
    output  reg [1:0]   forward_A_o,
    output  reg [1:0]   forward_B_o
);

//------------------------ SIGNALS ------------------------//

wire type_I;    // do not use rs2 for forwarding when I-type.

//------------------------ PROCESS ------------------------//

assign type_I = (opcode_i==7'b0010011 | opcode_i==7'b0000011);

always @(*) begin
    if(MEM_reg_write_i & MEM_rd_i!=0 & MEM_rd_i==EX_rs1_i) begin
        forward_A_o <= 2'b10;       // case 1a
    end else if(WB_reg_write_i & WB_rd_i!=0 & WB_rd_i==EX_rs1_i) begin
        forward_A_o <= 2'b01;       // case 2a
    end else begin
        forward_A_o <= 2'b00;
    end

    if(MEM_reg_write_i & MEM_rd_i!=0 & MEM_rd_i==EX_rs2_i & ~type_I) begin
        forward_B_o <= 2'b10;       // case 1b
    end else if(MEM_reg_write_i & MEM_rd_i!=0 & WB_rd_i==EX_rs2_i & ~type_I) begin
        forward_B_o <= 2'b01;       // case 2b
    end else begin
        forward_B_o <= 2'b00;
    end

end

endmodule