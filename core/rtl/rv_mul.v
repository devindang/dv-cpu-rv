//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2023, devin
//  balddonkey@outlook.com
//
//-------------------------------------------------------------------
// Title       : rv_mul.V
// Author      : Devin
// Editor      : code
// Created     : 2023-08-09 20:13:16
// Description :
//
// $Id$
//-------------------------------------------------------------------

`timescale 1ns / 1ps

module rv_mul(
    input               clk,
    input               rstn,
    input       [63:0]  mul_op1_i,
    input       [63:0]  mul_op2_i,
    output  reg [63:0]  mul_result_o
);

//------------------------ SIGNALS ------------------------//



//------------------------ PROCESS ------------------------//



//------------------------ INST ------------------------//


endmodule

module FA(a,b,cin,cout,s);
input a,b,cin;
output cout,s;
wire x,y,z;
xor x1(x,a,b);
xor x2(s,x,c);
and a1(y,a,b);
and a2(z,x,c);
or o1(cy,y,z);
endmodule