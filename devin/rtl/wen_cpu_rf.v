//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2023, devin
//  balddonkey@outlook.com
//
//-------------------------------------------------------------------
// Title       : cpu_rf
// Author      : Devin
// Editor      : VIM
// Created     :
// Description : Register File module.
//
// $Id$
//-------------------------------------------------------------------

`timescale 1ns / 1ps

module cpu_rf#(
	parameter REG_WID = 10
)(
	input						clk,
	input	[REG_WID-1:0]		data_RF_i,
	input						wr_en_i,
	input	[1:0]				wr_addr_i,
	input						rd_A_en_i,
	input	[1:0]				rd_A_addr_i,
	input						rd_B_en_i,
	input	[1:0]				rd_B_addr_i,
	output reg [REG_WID-1:0]	data_A_o,
	output reg [REG_WID-1:0]	data_B_o
);

//------------------------ SIGNALS DECLARING GOES BELOW ------------------------//

reg [REG_WID-1:0] register [3:0];

//------------------------ PROCESS GOES BELOW ------------------------//

always @(posedge clk) begin
	if(wr_en_i) begin
		register[wr_addr_i] <= data_RF_i;
	end
end

always @(posedge clk) begin
	if(rd_A_en_i) begin
		A <= register[rd_A_addr_i];
	end
end

always @(posedge clk) begin
	if(rd_B_en_i) begin
		A <= register[rd_B_addr_i];
	end
end

//------------------------ INSTANTIATE GOES BELOW ------------------------//


endmodule
