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
    input       [31:0]  instr_i,
    input       [3:0]   addr_fw_i,
    input               branch_fw_i,
    input               taken_fw_i,
    output  reg         PC_write_o,     // stall
    output  reg         IF_ID_write_o,  // stall
    output  reg         ctrl_write_o,    // stall
    output  reg         IF_flush_o
);

reg [1:0]   btb [15:0];    // branch target buffer

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
    end else if(IF_flush_o==1'b1) begin
        ctrl_write_o    <=  1'b0;
    end else begin
        PC_write_o      <=  1'b1;
        IF_ID_write_o   <=  1'b1;
        ctrl_write_o    <=  1'b1;
    end
end

assign ID_reg_rs1 = instr_i[19:15];
assign ID_reg_rs2 = instr_i[24:20];


// dynamic branch prediction
integer i;
always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        for (i=0; i<=15; i=i+1) begin
            btb[i] <= 'd0;
        end
    end else begin
        if(branch_fw_i & taken_fw_i) begin
            if(btb[addr_fw_i]<3) begin
                btb[addr_fw_i] <= btb[addr_fw_i]+1;
            end
        end else begin
            if(branch_fw_i & !taken_fw_i) begin
                if(btb[addr_fw_i]>0) begin
                    btb[addr_fw_i] <= btb[addr_fw_i]-1;
                end
            end
        end
    end
end

always @(*) begin
    if(branch_fw_i) begin
        if(taken_fw_i) begin
            if(btb[addr_fw_i]>=2) begin // predict correct
                IF_flush_o  <=  1'b0;
            end else begin
                IF_flush_o  <=  1'b1;   // nop
            end
        end else begin
            if(btb[addr_fw_i]<2) begin  // predict correct
                IF_flush_o  <=  1'b0;
            end else begin
                IF_flush_o  <=  1'b1;   // nop
            end
        end
    end else begin
        IF_flush_o  <=  1'b0;
    end
end

//------------------------ INST ------------------------//


endmodule