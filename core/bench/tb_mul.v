//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2023, devin
//  balddonkey@outlook.com
//
//-------------------------------------------------------------------
// Title       : tb_mul.V
// Author      : Devin
// Editor      : VIM
// Created     : 2023-08-11 11:21:34
// Description :
//
// $Id$
//-------------------------------------------------------------------

`timescale 1ns / 1ps

module tb_mul(

);


//------------------------ SIGNALS ------------------------//

localparam CLK_PERIOD = 10;
reg  clk;
reg  rstn;
reg  [63:0] op1;
reg  [63:0] op2;
wire [63:0] result;

//------------------------ PROCESS ------------------------//

initial begin
    clk     <= 1'b0;
    rstn    <= 1'b0;
    repeat(4) @(posedge clk);
    rstn    <= 1'b1;
    #1;
    op1     <= 11424;
    op2     <= -22338;
    repeat(1024) @(posedge clk);
    $finish();
end

always begin
    #(CLK_PERIOD/2) clk <= ~clk;
end

initial begin
    $fsdbDumpfile("wave.fsdb");
    $fsdbDumpvars(0);
end

//------------------------ INST ------------------------//

rv_mul u_mul(
    .clk          (clk),
    .rstn         (rstn),
    .mul_op1_i    (op1),
    .mul_op2_i    (op2),
    .mul_result_o (result)
);

endmodule