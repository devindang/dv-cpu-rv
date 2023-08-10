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
// Description : radix4-booth-wallace multiplier.
//
// $Id$
//-------------------------------------------------------------------

`timescale 1ns / 1ps

module rv_mul(
    input               clk,
    input               rstn,
    input       [63:0]  mul_op1_i,  // multiplicand
    input       [63:0]  mul_op2_i,  // multiplier
    output  reg [63:0]  mul_result_o
);

//------------------------ SIGNALS ------------------------//

wire [31:0]  z1;            // abs(z) = 1
wire [31:0]  z2;            // abs(z) = 2, use the shifted one
wire [31:0]  n;             // negative
wire [64:0]  pp   [63:0];   // partial product
wire [64:0]  pp2c [63:0];   // partial product with 2's complement
wire [127:0] fpp [32:0];    // final partial product

//------------------------ PROCESS ------------------------//

//************************* Stage 0: BOOTH ENCODE *************************//

//  Booth Encoding & Partial Product Generation

genvar b, u;    // u for unit, b for bit
generate
    for(u=0; u<32; u=u+1) begin
        if(u==0) begin
            booth_encoder be0(
                .y({mul_op2_i[1], mul_op2_i[0], 1'b0}),
                .z1(z1[u]),
                .z2(z2[u]),
                .neg(n[u])
            );
        end else if(u==31) begin
            booth_encoder be1(
                .y({1'b0, 1'b0, mul_op2_i[63]}),
                .z1(z1[u]),
                .z2(z2[u]),
                .neg(n[u])
            );
        end else begin
            booth_encoder be2(
                .y({mul_op2_i[2*u+1], mul_op2_i[2*u], mul_op2_i[2*u-1]}),
                .z1(z1[u]),
                .z2(z2[u]),
                .neg(n[u])
            );
        end
        for(b=0; b<64; b=b+1) begin
            if(b==0) begin
                booth_selector bs(     // LSB
                    .z1(z1[u]),
                    .z2(z2[u]),
                    .y(mul_op2_i[b]),
                    .ys(1'b0),
                    .neg(n[u]),
                    .p(pp[u][b])
                );
                booth_selector bs0(
                    .z1(z1[u]),
                    .z2(z2[u]),
                    .y(mul_op2_i[b+1]),
                    .ys(mul_op2_i[b]),
                    .neg(n[u]),
                    .p(pp[u][b+1])
                );
            end else if(b==63) begin
                booth_selector u_bs(
                    .z1(z1[u]),
                    .z2(z2[u]),
                    .y(1'b0),
                    .ys(mul_op2_i[b]),
                    .neg(n[u]),
                    .p(pp[u][b+1])
                );
            end else begin
                booth_selector u_bs(
                    .z1(z1[u]),
                    .z2(z2[u]),
                    .y(mul_op2_i[b+1]),
                    .ys(mul_op2_i[b]),
                    .neg(n[u]),
                    .p(pp[u][b+1])
                );
            end
        end
        RCA #(65) u_rca(
            .a(pp[u]),
            .b({16'd0,n[u]}),
            .cin(1'b0),
            .sum(pp2c[u]),
            .cout()
        );
    end
endgenerate

// perform shift
genvar i;
generate
    for(i=0; i<32; i=i+1) begin
        if(i==32) begin
            assign fpp[i] = {pp2c[32][63:0], {64{1'b0}}};
        end else begin
            assign fpp[i] = {{(63-2*i){n[i]  & (z1[i]  | z2[i])}} , pp2c[i], {(2*i){1'b0}}} ;
        end
    end
endgenerate


//***************************** Stage 1 *****************************//


//***************************** Stage 2 *****************************//


//***************************** Stage 3 *****************************//


//***************************** Stage 4 *****************************//


//***************************** Stage 5 *****************************//


//***************************** Stage 6 *****************************//


//***************************** Stage 7 *****************************//


//***************************** Stage 8 *****************************//




endmodule

// Booth Encoder
module booth_encoder(y,z1,z2,neg);
input [2:0] y;      // y_{i+1}, y_i, y_{i-1}
output      z1;     // abs(z) = 1
output      z2;     // abs(z) = 2, use the shifted one
output      neg;    // negative
assign z1 = y[0] ^ y[1];
assign z2 = (y[0] & y[1] & ~y[2]) | (~y[0] & ~y[1] &y[2]);
assign neg = y[2];
endmodule

// Booth Selector
module booth_selector(z1,z2,y,ys,neg,p);
input   z1;
input   z2;
input   y;
input   ys;     // y shifted
input   neg;
output  p;      // product
assign p = (neg ^ ((z1 & y) | (z2 & ys)));
endmodule

// Carry Save Adder
module CSA #(
    parameter WID = 128
)(a, b, cin, sum, cout);
input  [WID-1:0] a, b, cin;
output [WID-1:0] sum, cout;
genvar i;
generate
    for(i=0; i<WID; i=i+1) begin
        FA u_fa(.a(a[i]),.b(b[i]),.cin(cin[i]),.sum(sum[i]),.cout(cout[i]));
    end
endgenerate
endmodule

// Ripple Carry Adder
module RCA #(
    parameter WID = 64
)(a, b, cin, sum, cout);
input  [WID-1:0] a, b;
input  cin;
output [WID-1:0] sum;
output cout;
wire  [WID-1:0] c;
genvar i;
generate
    for(i=0; i<WID; i=i+1) begin
        if(i==0) begin
            FA u_fa(
                .a(a[i]),
                .b(b[i]),
                .cin(cin),
                .sum(sum[i]),
                .cout(c[i])
            );
        end else begin
            FA u_fa(
                .a(a[i]),
                .b(b[i]),
                .cin(c[i-1]),
                .sum(sum[i]),
                .cout(c[i])
            );
        end
    end
endgenerate
endmodule

// Full Adder
module FA(a,b,cin,sum,cout);
input  a, b, cin;
output sum, cout;
wire   x, y, z;
xor x1(x,a,b);
xor x2(sum,x,c);
and a1(y,a,b);
and a2(z,x,c);
or  o1(cout,y,z);
endmodule