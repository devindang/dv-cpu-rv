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
    input   [11:0]  addr,
    input           wr_en,
    input   [63:0]  wr_data,
    input           rd_en,
    output  [63:0]  rd_data
);

//------------------------ INST ------------------------//

rv_dpram #(
    .WIDTH (64),
    .DEPTH (4096)
) u_data_dpram (
    .clk(clk),
    .wena(wr_en),
    .addra(addr),  // [clog2(DEPTH)-1:0]
    .dina(wr_data),    // [WIDTH-1:0]
    .renb(rd_en),
    .addrb(addr),  // [clog2(DEPTH)-1:0]
    .doutb(rd_data)   // [WIDTH-1:0]
);

endmodule
