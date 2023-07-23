//-------------------------------------------------------------------
//                                                                 
//  COPYRIGHT (C) 2023, devin
//  balddonkey@outlook.com
//
//-------------------------------------------------------------------
// Title       : file_name
// Author      : Devin
// Editor	   : VIM
// Created     : 
// Description : 
//               
// $Id$ 
//-------------------------------------------------------------------  

`timescale 1ns / 1ps

module rv_core(
    input   clk,
    input   rstn
);


//------------------------ SIGNALS ------------------------//

// Data path

reg  [9:0]  PC;
wire [9:0]  PC_next;
wire [9:0]  PC_inc;
reg  [31:0] instruction;
wire [63:0] expansion;

wire [63:0] rf_wr_data;
wire [63:0] rf_rd_data1;
wire [63:0] rf_rd_data2;

wire [63:0] alu_op1;
wire [63:0] alu_op2;
wire [3:0]  alu_op_sel;
wire        alu_zero;
wire [63:0] alu_result;

wire [3:0]  instr_part;
reg  [63:0] mem_dout;

// Control path

wire        branch;
wire        mem_read;
wire        mem_to_reg;
wire [1:0]  alu_op;
wire        mem_write;
wire        alu_src;
wire        reg_write;

reg  [3:0]  phase = 4'd0;
reg         PC_load;

//------------------------ PROCESS ------------------------//

// CPU core

assign PC_inc = PC + 1; // +4 in byte.
assign PC_src = branch & alu_zero;
assign PC_target = PC + {expansion[62:0], 1'b0};
assign PC_next = PC_src ? PC_target : PC_inc;

always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        PC  <= 'd0;
    end else begin
        if(PC_load) begin
            PC  <= PC_next;
        end
    end
end

assign alu_op1 = rf_rd_data1;
assign alu_op2 = alu_src ? expansion : rf_rd_data2;
assign instr_part = {instruction[30],instruction[14:12]};   // part of funct7, and funct3

assign rf_wr_data = mem_to_reg ? mem_dout : alu_result;

// controller

always @(posedge clk) begin
    phase   <= phase + 1;
end

always @(posedge clk) begin
    if(phase==1) begin
        PC_load <= 1'b1;
    end else begin
        PC_load <= 1'b0;
    end
end

//------------------------ INSTANTIATE ------------------------//

rv_instr_mem u_instr_mem(
    .clk(clk),
    .addr_i(PC),
    .instr_o(instruction)
);

rv_ctrl u_ctrl(
    .instr_part_i(instruction[6:0]),
    .branch_o(branch),
    .mem_read_o(mem_read),
    .mem_to_reg_o(mem_to_reg),
    .alu_op_o(alu_op),
    .mem_write_o(mem_write),
    .alu_src_o(alu_src),
    .reg_write_o(reg_write)
);

rv_rf u_rf(
    .clk(clk),
    .rd_reg1_i(instruction[19:15]),
    .rd_reg2_i(instruction[24:20]),
    .wr_reg_i(instruction[11:7]),
    .wr_data_i(rf_wr_data),
    .wr_en_i(reg_write),
    .rd_data1_o(rf_rd_data1),
    .rd_data2_o(rf_rd_data2)
);

rv_imm_gen u_imm_gen(
    .instr_i(instruction),
    .expand_o(expansion)
);

rv_alu u_alu(
    .op1_i(alu_op1),
    .op2_i(alu_op2),
    .op_sel_i(alu_op_sel),
    .result(alu_result),
    .zero(alu_zero)
);


rv_alu_ctrl u_alu_ctrl(
    .alu_op_i(alu_op),
    .instr_part_i(instr_part),
    .alu_op_sel_o(alu_op_sel)
);

rv_data_mem u_data_mem(
    .clk(clk),
    .addr(alu_result[31:0]),
    .wr_en(mem_write),
    .wr_data(rf_rd_data2),
    .rd_en(mem_read),
    .rd_data(mem_dout)
);

endmodule