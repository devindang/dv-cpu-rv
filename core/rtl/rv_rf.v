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
        reg_x[wr_reg_i] <= wr_data_i;
    end
end

always @(posedge clk) begin
    rd_data1_o <= reg_x[rd_reg1_i];
    rd_data2_o <= reg_x[rd_reg2_i];
end

endmodule