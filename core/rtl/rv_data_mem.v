//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2023, devin
//  balddonkey@outlook.com
//
//-------------------------------------------------------------------
// Title       : rv_data_mem.V
// Author      : Devin
// Editor      : VIM
// Created     :
// Description :
//
// $Id$
//-------------------------------------------------------------------

`timescale 1ns / 1ps

// MEM_ADDR_WID = 32

module rv_data_mem(
    input           clk,
    input   [63:0]  addr_i,
    input           wr_en_i,
    input   [63:0]  wr_data_i,
    input           rd_en_i,
    output  [63:0]  rd_data_o
);

//------------------------ INST ------------------------//

rv_dpram #(
    .WIDTH (64),
    .DEPTH (4096)
) u_data_dpram (
    .clk(clk),
    .wena(wr_en_i),
    .addra(addr_i[11:0]),  // [clog2(DEPTH)-1:0]  // larger is not supported
    .dina(wr_data_i),    // [WIDTH-1:0]
    .renb(rd_en_i),
    .addrb(addr_i[11:0]),  // [clog2(DEPTH)-1:0]
    .doutb(rd_data_o)   // [WIDTH-1:0]
);

endmodule
