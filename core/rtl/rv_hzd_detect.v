//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2023, devin
//  balddonkey@outlook.com
//
//-------------------------------------------------------------------
// Title       : rv_hzd_detect.V
// Author      : Devin
// Editor      : VIM
// Created     :
// Description :
//
// $Id$
//-------------------------------------------------------------------

`timescale 1ns / 1ps

module rv_hzd_detect(
    input               clk,
    input               rstn,
    input               EX_mem_read_i,
    input       [4:0]   EX_reg_rd_i,
    input               EX_branch_i,
    input       [31:0]  instr_i,
    // input               IF_flush_i,
    output  reg         PC_write_o,     // stall
    output  reg         IF_ID_write_o,  // stall
    output  reg         ctrl_write_o    // stall
);


//------------------------ SIGNALS ------------------------//

wire [4:0]  ID_reg_rs1;
wire [4:0]  ID_reg_rs2;

//------------------------ PROCESS ------------------------//

// stall for ld, branch

always @(*) begin
    if(EX_mem_read_i & ((EX_reg_rd_i==ID_reg_rs1) | (EX_reg_rd_i==ID_reg_rs2))) begin
        PC_write_o      <=  1'b0;
        IF_ID_write_o   <=  1'b0;
        ctrl_write_o    <=  1'b0;
    // end else if(IF_flush_i==1'b1) begin
    end else if(EX_branch_i==1'b1) begin
        ctrl_write_o    <=  1'b0;
    end else begin
        PC_write_o      <=  1'b1;
        IF_ID_write_o   <=  1'b1;
        ctrl_write_o    <=  1'b1;
    end
end

assign ID_reg_rs1 = instr_i[19:15];
assign ID_reg_rs2 = instr_i[24:20];

//------------------------ INST ------------------------//


endmodule