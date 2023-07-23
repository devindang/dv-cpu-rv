//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2023, devin
//  balddonkey@outlook.com
//
//-------------------------------------------------------------------
// Title       : rv_instr_mem.V
// Author      : Devin
// Editor      : VIM
// Created     :
// Description : Instruction memory.
//
// $Id$
//-------------------------------------------------------------------

`timescale 1ns / 1ps

module rv_instr_mem(
    input           clk,
    input   [9:0]   addr_i,
    output  [31:0]  instr_o
);

//------------------------ INST ------------------------//

rv_dpram #(
    .WIDTH (32),
    .DEPTH (1024)
) u_instr_dpram (
    .clk(clk),
    .wena(1'b0),
    .addra(10'b0),  // [clog2(DEPTH)-1:0]
    .dina(32'b0),    // [WIDTH-1:0]
    .renb(1'b1),
    .addrb(addr_i),  // [clog2(DEPTH)-1:0]
    .doutb(instr_o)   // [WIDTH-1:0]
);

endmodule
