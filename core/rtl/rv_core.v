//-------------------------------------------------------------------                                                                 
//  COPYRIGHT (C) 2023, devin
//  balddonkey@outlook.com
//
//-------------------------------------------------------------------
// Title       : file_name
// Author      : Devin
// Editor	   : VIM
// Created     : 
// Description : RISC-V CPU core
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

reg  [63:0] PC;
reg  [63:0] PC_r;
wire [63:0] PC_r2;
wire [63:0] PC_r3;
wire        PC_src;
wire [63:0] PC_target;
wire [63:0] PC_target_r;
wire [31:0] instruction;
wire [31:0] instr_r;
wire [31:0] instr_r2;
wire [31:0] instr_r3;
wire [31:0] instr_r4;
wire [63:0] imm_expand;
wire [63:0] imm_expand_r;

wire [63:0] rf_wr_data;
wire [63:0] rf_rd_data1;
wire [63:0] rf_rd_data2;
wire [63:0] rf_rd_data1_r;
wire [63:0] rf_rd_data2_r;

reg  [63:0] alu_op1;
wire [63:0] alu_op2;
wire [3:0]  alu_op_sel;
wire [63:0] alu_result;
wire [63:0] alu_result_r;
wire [63:0] alu_result_r2;

wire [3:0]  instr_part;
wire [63:0] mem_dout;
wire [63:0] mem_dout_r;

// Control path

wire    branch_b;
wire    mem_read_b;
wire    mem_to_reg_b;
wire    mem_write_b;
wire    alu_src_b;
wire    reg_write_b;

reg     branch;
reg     mem_read;
reg     mem_to_reg;
reg     mem_write;
reg     alu_src;
reg     reg_write;

wire    branch_taken;
wire    branch_r;
wire    mem_read_r;
wire    mem_to_reg_r;
wire    mem_write_r;
wire    alu_src_r;
wire    reg_write_r;

// Pipelined Registers

reg  [2:0]   phase = 3'd0;  // five-stages
reg  [95:0]  IF_ID_reg;
reg  [287:0] ID_EX_reg;
reg  [223:0] EX_MEM_reg;
reg  [159:0] MEM_WB_reg;
reg  [5:0]   ID_EX_ctrl_reg;
reg  [4:0]   EX_MEM_ctrl_reg;
reg  [1:0]   MEM_WB_ctrl_reg;

// forwarding

wire [1:0]  forward_A;
wire [1:0]  forward_B;
reg  [63:0]  rf_rd_data2_fw;

// stall and prediction

wire PC_write;
wire IF_ID_write;
wire ctrl_write;
wire IF_flush;
wire IF_predict;
reg  IF_predict_r;

//------------------------ PROCESS ------------------------//


//----------- pipelined state register

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

//----------- Stage 1: Instruction Fetch

always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        PC              <= 'd0;
        PC_r            <= 'd0;
        IF_predict_r    <=  'd0;
        IF_ID_reg       <= 'd0;
    end else begin
        PC_r            <=  PC;     // allign with instruction
        IF_predict_r    <=  IF_predict;
        if(IF_predict) begin  // branch prediction
            PC  <= PC_target;
        end else if(PC_write) begin // stall
            if(IF_flush & IF_predict_r) begin
                PC  <=  PC_r+4;
            end else begin
                if(PC_src & !IF_predict_r) begin
                    PC  <= PC_target_r;
                end else begin
                    PC  <= PC+4;
                end
            end
        end
        if(IF_flush) begin
            IF_ID_reg[31:0] <=  32'd0;
        end else if(IF_ID_write) begin
            IF_ID_reg[31:0]  <= instruction;
            IF_ID_reg[95:32] <= PC_r;
        end
    end
end


//----------- Stage 2: Instruction Decode

always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        ID_EX_reg       <= 'd0;
        ID_EX_ctrl_reg  <= 'd0;
    end else begin
        ID_EX_reg[63:0]     <= PC_r2;
        ID_EX_reg[127:64]  <= imm_expand;
        ID_EX_reg[159:128]  <= instr_r;
        ID_EX_reg[223:160]  <= rf_rd_data1;
        ID_EX_reg[287:224]  <= rf_rd_data2;
        ID_EX_ctrl_reg[0]   <= reg_write;
        ID_EX_ctrl_reg[1]   <= mem_to_reg;
        ID_EX_ctrl_reg[2]   <= branch;
        ID_EX_ctrl_reg[3]   <= mem_read;
        ID_EX_ctrl_reg[4]   <= mem_write;
        ID_EX_ctrl_reg[5]   <= alu_src;
    end
end

assign PC_r2    = IF_ID_reg[95:32];
assign instr_r  = IF_ID_reg[31:0];

always @(*) begin
    if(ctrl_write) begin
        branch      <=  branch_b;
        mem_read    <=  mem_read_b;
        mem_to_reg  <=  mem_to_reg_b;
        mem_write   <=  mem_write_b;
        alu_src     <=  alu_src_b;
        reg_write   <=  reg_write_b;
    end else begin
        branch      <=  1'b0;
        mem_read    <=  1'b0;
        mem_to_reg  <=  1'b0;
        mem_write   <=  1'b0;
        alu_src     <=  1'b0;
        reg_write   <=  1'b0;
    end
end

//----------- Stage 3: Execute

always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        EX_MEM_reg      <= 'd0;
        EX_MEM_ctrl_reg <= 'd0;
    end else begin
        EX_MEM_reg[63:0]    <= PC_target;
        EX_MEM_reg[127:64]  <= alu_result;
        EX_MEM_reg[191:128] <= rf_rd_data2_fw;
        EX_MEM_reg[223:192] <= instr_r2;
        EX_MEM_ctrl_reg[0]  <= ID_EX_ctrl_reg[0];
        EX_MEM_ctrl_reg[1]  <= ID_EX_ctrl_reg[1];
        EX_MEM_ctrl_reg[2]  <= ID_EX_ctrl_reg[2];
        EX_MEM_ctrl_reg[3]  <= ID_EX_ctrl_reg[3];
        EX_MEM_ctrl_reg[4]  <= ID_EX_ctrl_reg[4];
    end
end

always @(*) begin
    case(forward_A)
        2'b00:   alu_op1  <=  rf_rd_data1_r;
        2'b10:   alu_op1  <=  alu_result_r;
        2'b01:   alu_op1  <=  rf_wr_data;
        default: alu_op1  <=  rf_rd_data1_r;
    endcase
end

always @(*) begin
    case(forward_B)
        2'b00:   rf_rd_data2_fw  <=  rf_rd_data2_r;
        2'b10:   rf_rd_data2_fw  <=  alu_result_r;
        2'b01:   rf_rd_data2_fw  <=  rf_wr_data;
        default: rf_rd_data2_fw  <=  rf_rd_data2_r;
    endcase
end

assign rf_rd_data1_r = ID_EX_reg[223:160];
assign rf_rd_data2_r = ID_EX_reg[287:224];
assign branch_r = ID_EX_ctrl_reg[2];
assign PC_src = branch_r & branch_taken;    // dd
assign PC_r3 = ID_EX_reg[63:0];
assign imm_expand_r = ID_EX_reg[127:64];
assign PC_target = PC_r2 + {imm_expand[62:0], 1'b0};
assign alu_src_r = ID_EX_ctrl_reg[5];
assign alu_op2 = alu_src_r ? imm_expand_r : rf_rd_data2_fw;
assign instr_r2 = ID_EX_reg[159:128];
assign instr_part = {instr_r2[30],instr_r2[14:12]};   // part of funct7, and funct3


//----------- Stage 4: Memory Access

always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        MEM_WB_reg      <= 'd0;
        MEM_WB_ctrl_reg <= 'd0;
    end else begin
        MEM_WB_reg[63:0]    <= mem_dout;
        MEM_WB_reg[127:64]  <= alu_result_r;
        MEM_WB_reg[159:128] <= instr_r3;
        MEM_WB_ctrl_reg[0]  <= EX_MEM_ctrl_reg[0];
        MEM_WB_ctrl_reg[1]  <= EX_MEM_ctrl_reg[1];
    end
end

assign mem_read_r = EX_MEM_ctrl_reg[3];
assign mem_write_r = EX_MEM_ctrl_reg[4];
assign PC_target_r = EX_MEM_reg[63:0];
assign alu_result_r = EX_MEM_reg[127:64];
assign instr_r3 = EX_MEM_reg[223:192];

//----------- Stage 5: Write Back

assign reg_write_r = MEM_WB_ctrl_reg[0];
assign mem_to_reg_r = MEM_WB_ctrl_reg[1];
assign mem_dout_r = MEM_WB_reg[63:0];
assign alu_result_r2 = MEM_WB_reg[127:64];
assign rf_wr_data = mem_to_reg_r ? mem_dout_r : alu_result_r2;
assign instr_r4 = MEM_WB_reg[159:128];

//------------------------ INSTANTIATE ------------------------//

rv_instr_mem u_instr_mem(
    .clk(clk),
    .pc_i(PC),
    .instr_o(instruction)
);

rv_ctrl u_ctrl(
    .rstn(rstn),
    .opcode_i(IF_ID_reg[6:0]),
    .branch_o(branch_b),
    .mem_read_o(mem_read_b),
    .mem_to_reg_o(mem_to_reg_b),
    .mem_write_o(mem_write_b),
    .alu_src_o(alu_src_b),
    .reg_write_o(reg_write_b)
);

rv_rf u_rf(
    .clk(clk),
    .rstn(rstn),
    .rd_reg1_i(IF_ID_reg[19:15]),
    .rd_reg2_i(IF_ID_reg[24:20]),
    .wr_reg_i(instr_r4[11:7]),
    .wr_data_i(rf_wr_data),
    .wr_en_i(reg_write_r),
    .rd_data1_o(rf_rd_data1),
    .rd_data2_o(rf_rd_data2)
);

rv_imm_gen u_imm_gen(
    .instr_i(IF_ID_reg[31:0]),
    .expand_o(imm_expand)
);

rv_alu u_alu(
    .op1_i(alu_op1),
    .op2_i(alu_op2),
    .op_sel_i(alu_op_sel),
    .result_o(alu_result)
);

rv_branch_test u_branch_test(
    .alu_result_i(alu_result),
    .funct3_i(instr_r2[14:12]),
    .taken_o(branch_taken)
);

rv_alu_ctrl u_alu_ctrl(
    .opcode_i(instr_r2[6:0]),   // opcode
    .instr_part_i(instr_part),  // funct3
    .alu_op_sel_o(alu_op_sel)
);

rv_data_mem u_data_mem(
    .clk(clk),
    .addr_i(alu_result_r),
    .wr_en_i(mem_write_r),
    .wr_data_i(EX_MEM_reg[191:128]),  // rf_rd_data2_fw
    .rd_en_i(mem_read_r),
    .rd_data_o(mem_dout)
);

rv_forward u_forward(
    .opcode_i(instr_r2[6:0]),
    .EX_rs1_i(instr_r2[19:15]),
    .EX_rs2_i(instr_r2[24:20]),
    .MEM_reg_write_i(EX_MEM_ctrl_reg[0]),
    .MEM_rd_i(instr_r3[11:7]),
    .WB_reg_write_i(MEM_WB_ctrl_reg[0]),
    .WB_rd_i(instr_r4[11:7]),
    .forward_A_o(forward_A),
    .forward_B_o(forward_B)
);

rv_hzd_detect u_hzd_detect(
    .clk(clk),
    .rstn(rstn),
    .EX_mem_read_i(ID_EX_ctrl_reg[3]),
    .EX_reg_rd_i(instr_r2[11:7]),
    .instr_i(instr_r),
    .IF_flush_i(IF_flush),
    .PC_write_o(PC_write),          // stall
    .IF_ID_write_o(IF_ID_write),    // stall
    .ctrl_write_o(ctrl_write)       // stall
);

rv_branch_predict u_branch_predict(
    .clk(clk),
    .rstn(rstn),
    .ID_branch_i(branch_b),
    .EX_branch_i(branch_r),
    .EX_taken_i(branch_taken),
    .EX_addr_i(instr_r2[11:8]),
    .ID_addr_i(instr_r[11:8]),
    .IF_flush_o(IF_flush),
    .IF_predict_o(IF_predict)
);

endmodule
