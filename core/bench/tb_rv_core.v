//-------------------------------------------------------------------
//                                                                 
//  COPYRIGHT (C) 2023, devin
//  balddonkey@outlook.com
//
//-------------------------------------------------------------------
// Title       : tb_rv_core
// Author      : Devin
// Editor	   : code
// Created     : 
// Description : 
//               
// $Id$ 
//-------------------------------------------------------------------  

`timescale 1ns / 1ps

module tb_rv_core(
	
);


//------------------------ SIGNALS ------------------------//

localparam CLK_PERIOD = 10;
reg  clk;
reg  rstn;

//------------------------ PROCESS ------------------------//

initial begin
    clk     <= 1'b0;
    rstn    <= 1'b0;
    repeat(4) @(posedge clk);
    rstn    <= 1'b1;
end

always begin
    #(CLK_PERIOD/2) clk <= ~clk;
end

initial begin
    $fsdbDumpfile("wave.fsdb");
    $fsdbDumpvars(0);
end

initial begin
    $readmemb("instr.txt",u_rv_core.u_instr_mem.u_instr_dpram.BRAM);
end

//------------------------ INSTANTIATE ------------------------//

rv_core u_rv_core(
    .clk(clk),
    .rstn(rstn)
);

endmodule