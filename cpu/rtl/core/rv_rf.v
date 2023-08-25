//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2023, devin
//  balddonkey@outlook.com
//
//-------------------------------------------------------------------
//
//  Author      : Devin
//  Project     : dv-cpu-rv
//  Repository  : https://github.com/devindang/dv-cpu-rv
//  Title       : rv_rf.v
//  Dependances : 
//  Editor      : VIM
//  Created     : 2023-07-22
//  Description : Register file.
//
//-------------------------------------------------------------------

`include "defines.v"

module rv_rf(
    input                    clk,
    input                    rstn,
    input       [4:0]        rd_reg1_i,
    input       [4:0]        rd_reg2_i,
    input       [4:0]        wr_reg_i,
    input       [`MXLEN-1:0] wr_data_i,
    input                    wr_en_i,
    output  reg [`MXLEN-1:0] rd_data1_o,
    output  reg [`MXLEN-1:0] rd_data2_o
);

//------------------------ SIGNALS ------------------------//

reg [`MXLEN-1:0] reg_x [31:0];

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

wire [`MXLEN-1:0] x0_zero   = reg_x[0];
wire [`MXLEN-1:0] x1_ra     = reg_x[1];
wire [`MXLEN-1:0] x2_sp     = reg_x[2];
wire [`MXLEN-1:0] x3_gp     = reg_x[3];
wire [`MXLEN-1:0] x4_tp     = reg_x[4];
wire [`MXLEN-1:0] x5_t0     = reg_x[5];
wire [`MXLEN-1:0] x6_t1     = reg_x[6];
wire [`MXLEN-1:0] x7_t2     = reg_x[7];
wire [`MXLEN-1:0] x8_s0_fp  = reg_x[8];
wire [`MXLEN-1:0] x9_s1     = reg_x[9];
wire [`MXLEN-1:0] x10_a0    = reg_x[10];
wire [`MXLEN-1:0] x11_a1    = reg_x[11];
wire [`MXLEN-1:0] x12_a2    = reg_x[12];
wire [`MXLEN-1:0] x13_a3    = reg_x[13];
wire [`MXLEN-1:0] x14_a4    = reg_x[14];
wire [`MXLEN-1:0] x15_a5    = reg_x[15];
wire [`MXLEN-1:0] x16_a6    = reg_x[16];
wire [`MXLEN-1:0] x17_a7    = reg_x[17];
wire [`MXLEN-1:0] x18_s2    = reg_x[18];
wire [`MXLEN-1:0] x19_s3    = reg_x[19];
wire [`MXLEN-1:0] x20_s4    = reg_x[20];
wire [`MXLEN-1:0] x21_s5    = reg_x[21];
wire [`MXLEN-1:0] x22_s6    = reg_x[22];
wire [`MXLEN-1:0] x23_s7    = reg_x[23];
wire [`MXLEN-1:0] x24_s8    = reg_x[24];
wire [`MXLEN-1:0] x25_s9    = reg_x[25];
wire [`MXLEN-1:0] x26_s10   = reg_x[26];
wire [`MXLEN-1:0] x27_s11   = reg_x[27];
wire [`MXLEN-1:0] x28_t3    = reg_x[28];
wire [`MXLEN-1:0] x29_t4    = reg_x[29];
wire [`MXLEN-1:0] x30_t5    = reg_x[30];
wire [`MXLEN-1:0] x31_t6    = reg_x[31];

endmodule