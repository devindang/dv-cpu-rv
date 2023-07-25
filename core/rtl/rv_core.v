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
reg  [9:0]  PC_inc;
wire        PC_src;
wire [9:0]  PC_target;
wire [31:0] instruction;
wire [63:0] imm_expand;

reg         rf_rd_en;
wire [63:0] rf_wr_data;
wire [63:0] rf_rd_data1;
wire [63:0] rf_rd_data2;

wire [63:0] alu_op1;
wire [63:0] alu_op2;
wire [3:0]  alu_op_sel;
wire [63:0] alu_result;

wire [3:0]  instr_part;
wire [63:0] mem_dout;

// Control path

wire        branch;
wire        mem_read;
wire        mem_to_reg;
wire        mem_write;
wire        alu_src;
wire        reg_write;
wire        reg_src;
wire        branch_taken;

// Pipelined Registers

reg  [2:0]   phase = 3'd0;  // five-stages
reg  [95:0]  IF_ID_reg;
reg  [255:0] ID_EX_reg;
reg  [191:0] EX_MEM_reg;
reg  [127:0] MEM_WB_reg;

//------------------------ PROCESS ------------------------//

// CPU core

assign PC_src = branch & branch_taken;
assign PC_target = PC + {imm_expand[8:0], 1'b0};
assign PC_next = PC_src ? PC_target : PC_inc;

assign alu_op1 = rf_rd_data1;
assign alu_op2 = alu_src ? imm_expand : rf_rd_data2;
assign instr_part = {IF_ID_reg[30],IF_ID_reg[14:12]};   // part of funct7, and funct3

// assign rf_wr_data = reg_src ? PC : (mem_to_reg ? mem_dout : alu_result);
assign rf_wr_data = mem_to_reg ? mem_dout : alu_result;


// pipelined state register
always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        phase   <= 'd0;
    end else begin
        if(phase==4) begin
            phase   <= 'd0;
        end else begin
            phase   <= phase + 1;
        end
    end
end

// Stage 1: Instruction Fetch
always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        PC_inc      <= 'd0;
        PC          <= 'd0;
        IF_ID_reg   <= 'd0;
    end else begin
        if(phase==0) begin
            PC_inc <= PC+4;
            if(PC_src) begin
                PC  <= PC_target;
            end else begin
                PC  <= PC_inc;
            end
            IF_ID_reg[31:0]  <= instruction;
            IF_ID_reg[95:32] <= PC;
        end
    end
end

// Stage 2: Instruction Decode
always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        ID_EX_reg <= 'd0;
        rf_rd_en  <= 1'b0;
    end else begin
        if(phase==1) begin
            ID_EX_reg[63:0]     <= rf_rd_data1;
            ID_EX_reg[127:64]   <= rf_rd_data2;
            ID_EX_reg[191:128]  <= imm_expand;
            ID_EX_reg[255:192]  <= IF_ID_reg[63:32];
            rf_rd_en <= 1'b1;
        end else begin
            rf_rd_en <= 1'b0;
        end
    end
end

// Stage 3: Execute
always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        EX_MEM_reg <= 'd0;
    end else begin
        if(phase==2) begin
            EX_MEM_reg[63:0]    <= alu_result;
            EX_MEM_reg[127:64]  <= ID_EX_reg[127:64];
            EX_MEM_reg[192:128] <= PC_target;
        end
    end
end

// Stage 4: Memory Access
always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        MEM_WB_reg <= 'd0;
    end else begin
        if(phase==3) begin
            EX_MEM_reg[63:0]    <= alu_result;
            EX_MEM_reg[127:64]  <= ID_EX_reg[127:64];
            EX_MEM_reg[192:128] <= PC_target;
        end
    end
end


//------------------------ INSTANTIATE ------------------------//

rv_instr_mem u_instr_mem(
    .clk(clk),
    .pc_i(PC),
    .instr_o(instruction)
);

rv_ctrl u_ctrl(
    .rstn(rstn),
    .opcode_i(IF_ID_reg[6:0]),
    .branch_o(branch),
    .mem_read_o(mem_read),
    .mem_to_reg_o(mem_to_reg),
    .mem_write_o(mem_write),
    .alu_src_o(alu_src),
    .reg_write_o(reg_write),
    .reg_src_o(reg_src)
);

rv_rf u_rf(
    .clk(clk),
    .rstn(rstn),
    .rd_en_i(rf_rd_en),
    .rd_reg1_i(IF_ID_reg[19:15]),
    .rd_reg2_i(IF_ID_reg[24:20]),
    .wr_reg_i(IF_ID_reg[11:7]),
    .wr_data_i(rf_wr_data),
    .wr_en_i(reg_write),
    .rd_data1_o(rf_rd_data1),
    .rd_data2_o(rf_rd_data2)
);

rv_imm_gen u_imm_gen(
    .instr_i(IF_ID_reg),
    .expand_o(imm_expand)
);

rv_alu u_alu(
    .op1_i(alu_op1),
    .op2_i(alu_op2),
    .op_sel_i(alu_op_sel),
    .result(alu_result)
);

rv_branch_test u_branch_test(
    .alu_result_i(alu_result),
    .funct3_i(IF_ID_reg[14:12]),
    .taken_o(branch_taken)
);

rv_alu_ctrl u_alu_ctrl(
    .opcode_i(IF_ID_reg[6:0]),
    .instr_part_i(instr_part),
    .alu_op_sel_o(alu_op_sel)
);

rv_data_mem u_data_mem(
    .clk(clk),
    .addr(alu_result[11:0]),
    .wr_en(mem_write),
    .wr_data(rf_rd_data2),
    .rd_en(mem_read),
    .rd_data(mem_dout)
);

endmodule
