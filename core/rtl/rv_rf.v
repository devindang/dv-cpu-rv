//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2023, devin
//  balddonkey@outlook.com
//
//-------------------------------------------------------------------
// Title       : rv_rf.V
// Author      : Devin
// Editor      : VIM
// Created     :
// Description : Register file.
//
// $Id$
//-------------------------------------------------------------------

`timescale 1ns / 1ps

module rv_rf(
    input               clk,
    input               rstn,
    input       [4:0]   rd_reg1_i,
    input       [4:0]   rd_reg2_i,
    input       [4:0]   wr_reg_i,
    input       [63:0]  wr_data_i,
    input               wr_en_i,
    output  reg [63:0]  rd_data1_o,
    output  reg [63:0]  rd_data2_o
);

//------------------------ SIGNALS ------------------------//

reg [63:0] reg_x [31:0];

//------------------------ PROCESS ------------------------//

always @(posedge clk) begin
    if(wr_en_i) begin
        if(wr_reg_i!=0) begin
            reg_x[wr_reg_i] <= wr_data_i;
        end
    end
end

always @(*) begin
    rd_data1_o <= reg_x[rd_reg1_i];
    rd_data2_o <= reg_x[rd_reg2_i];
end

//------------------------ SIMULATION ------------------------//

integer i;

initial begin
    for(i=0; i<32; i=i+1) begin
        reg_x[i] <= 'd0;
    end
end

wire [63:0] x0  = reg_x[0];
wire [63:0] x1  = reg_x[1];
wire [63:0] x2  = reg_x[2];
wire [63:0] x3  = reg_x[3];
wire [63:0] x4  = reg_x[4];
wire [63:0] x5  = reg_x[5];
wire [63:0] x6  = reg_x[6];
wire [63:0] x7  = reg_x[7];
wire [63:0] x8  = reg_x[8];
wire [63:0] x9  = reg_x[9];
wire [63:0] x10 = reg_x[10];
wire [63:0] x11 = reg_x[11];
wire [63:0] x12 = reg_x[12];
wire [63:0] x13 = reg_x[13];
wire [63:0] x14 = reg_x[14];
wire [63:0] x15 = reg_x[15];
wire [63:0] x16 = reg_x[16];
wire [63:0] x17 = reg_x[17];
wire [63:0] x18 = reg_x[18];
wire [63:0] x19 = reg_x[19];
wire [63:0] x20 = reg_x[20];
wire [63:0] x21 = reg_x[21];
wire [63:0] x22 = reg_x[22];
wire [63:0] x23 = reg_x[23];
wire [63:0] x24 = reg_x[24];
wire [63:0] x25 = reg_x[25];
wire [63:0] x26 = reg_x[26];
wire [63:0] x27 = reg_x[27];
wire [63:0] x28 = reg_x[28];
wire [63:0] x29 = reg_x[29];
wire [63:0] x30 = reg_x[30];
wire [63:0] x31 = reg_x[31];

endmodule