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
wire [63:0] PC_ID;
wire [63:0] PC_EX;
wire [31:0] instr_IF;
wire [31:0] instr_ID;
wire [31:0] instr_EX;
wire [31:0] instr_MEM;
wire [31:0] instr_WB;

reg         EX_PC_src;
reg  [63:0] ID_PC_target;
wire [63:0] EX_PC_target;
wire [63:0] ID_imm_expand;
wire [63:0] EX_imm_expand;

wire [63:0] WB_rf_wr_data;
wire [63:0] ID_rf_rd_data1;
wire [63:0] ID_rf_rd_data2;
wire [63:0] EX_rf_rd_data1;
wire [63:0] EX_rf_rd_data2;

wire [63:0] EX_alu_op1;
wire [63:0] EX_alu_op2;
wire [3:0]  EX_alu_op_sel;
wire        EX_alu_op_32b;
wire [63:0] EX_alu_result;
wire [63:0] MEM_alu_result;
wire [63:0] WB_alu_result;

wire [3:0]  EX_instr_part;
wire [63:0] MEM_mem_dout;
wire [63:0] WB_mem_dout;

// Control path

wire        ID_branch_b;
wire        ID_mem_read_b;
wire        ID_mem_to_reg_b;
wire        ID_mem_write_b;
wire [1:0]  ID_alu1_src_b;
wire        ID_alu2_src_b;
wire [1:0]  ID_reg_read_b;
wire        ID_reg_write_b;
wire        ID_jal_b;
wire        ID_jalr_b;

reg         ID_branch;
reg         ID_mem_read;
reg         ID_mem_to_reg;
reg         ID_mem_write;
reg  [1:0]  ID_alu1_src;
reg         ID_alu2_src;
reg         ID_reg_write;
reg         ID_jal;
reg         ID_jalr;

wire        EX_branch_taken;
wire        EX_branch;
wire        MEM_mem_read;
wire        WB_mem_to_reg;
wire        MEM_mem_write;
wire [1:0]  EX_alu1_src;
wire        EX_alu2_src;
wire        WB_reg_write;
wire        EX_jal;
wire        EX_jalr;

// Pipelined Registers

reg  [95:0]  IF_ID_reg;
reg  [351:0] ID_EX_reg;
reg  [159:0] EX_MEM_reg;
reg  [159:0] MEM_WB_reg;
reg  [9:0]   ID_EX_ctrl_reg;
reg  [4:0]   EX_MEM_ctrl_reg;
reg  [1:0]   MEM_WB_ctrl_reg;

// forwarding

wire [1:0]  ID_rf_forward;
wire [1:0]  EX_forward_A;
wire [1:0]  EX_forward_B;
reg  [63:0] EX_alu_op1_fw;
reg  [63:0] EX_alu_op2_fw;

// stall and prediction

wire IF_PC_write;
wire IF_ID_write;
wire ID_ctrl_write;
wire IF_flush;
wire IF_predict;
reg  IF_predict_r;

// short load/store support

wire [7:0]  MEM_strobe;
wire [63:0] MEM_addr_map;
wire [63:0] MEM_mem_dout_map;

//------------------------ PROCESS ------------------------//

//----------- Stage 1: Instruction Fetch

always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        PC              <= 'd0;
        IF_predict_r    <=  'd0;
        IF_ID_reg       <= 'd0;
    end else begin
        IF_predict_r    <=  IF_predict;
        if(IF_predict) begin  // branch prediction
            PC  <= ID_PC_target;
        end else if(IF_PC_write) begin // stall
            if(IF_predict_r & IF_flush) begin
                PC  <= PC_ID;
            end else if(EX_PC_src & !IF_predict_r) begin
                PC  <= EX_PC_target;
            end else begin
                PC  <= PC+4;
            end
        end
        if(IF_flush) begin
            IF_ID_reg[31:0] <=  32'd0;
        end else if(IF_ID_write) begin
            IF_ID_reg[31:0]  <= instr_IF;
            IF_ID_reg[95:32] <= PC;
        end
    end
end


//----------- Stage 2: Instruction Decode

always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        ID_EX_reg       <= 'd0;
        ID_EX_ctrl_reg  <= 'd0;
    end else begin
        ID_EX_reg[63:0]     <= ID_imm_expand;
        ID_EX_reg[95:64]    <= instr_ID;
        ID_EX_reg[159:96]   <= ID_rf_forward[0] ? WB_rf_wr_data : ID_rf_rd_data1;
        ID_EX_reg[223:160]  <= ID_rf_forward[1] ? WB_rf_wr_data : ID_rf_rd_data2;
        ID_EX_reg[287:224]  <= PC_ID;
        ID_EX_reg[351:288]  <= ID_PC_target;
        ID_EX_ctrl_reg[0]   <= ID_reg_write;
        ID_EX_ctrl_reg[1]   <= ID_mem_to_reg;
        ID_EX_ctrl_reg[2]   <= ID_branch;
        ID_EX_ctrl_reg[3]   <= ID_mem_read;
        ID_EX_ctrl_reg[4]   <= ID_mem_write;
        ID_EX_ctrl_reg[5]   <= ID_alu2_src;
        ID_EX_ctrl_reg[7:6] <= ID_alu1_src;
        ID_EX_ctrl_reg[8]   <= ID_jal;
        ID_EX_ctrl_reg[9]   <= ID_jalr;
    end
end

assign ID_rf_forward[0] = ID_reg_read_b[0] & WB_reg_write & (instr_ID[19:15]==instr_WB[11:7]);
assign ID_rf_forward[1] = ID_reg_read_b[1] & WB_reg_write & (instr_ID[24:20]==instr_WB[11:7]);
assign PC_ID    = IF_ID_reg[95:32];
assign instr_ID  = IF_ID_reg[31:0];

always @(*) begin
    if(ID_ctrl_write) begin
        ID_branch      <=  ID_branch_b;
        ID_mem_read    <=  ID_mem_read_b;
        ID_mem_to_reg  <=  ID_mem_to_reg_b;
        ID_mem_write   <=  ID_mem_write_b;
        ID_alu1_src    <=  ID_alu1_src_b;
        ID_alu2_src    <=  ID_alu2_src_b;
        ID_reg_write   <=  ID_reg_write_b;
        ID_jal         <=  ID_jal_b;
        ID_jalr        <=  ID_jalr_b;
    end else begin
        ID_branch      <=  1'b0;
        ID_mem_read    <=  1'b0;
        ID_mem_to_reg  <=  1'b0;
        ID_mem_write   <=  1'b0;
        ID_alu1_src    <=  2'b00;
        ID_alu2_src    <=  1'b0;
        ID_reg_write   <=  1'b0;
        ID_jal         <=  1'b0;
        ID_jalr        <=  1'b0;
    end
end

// branch and jump control.
always @(*) begin
    if(ID_jal) begin
        ID_PC_target <= PC_ID + ID_imm_expand;  // shift-by-1 is in imm_gen unit, 'cause there's ALU operation for PC.
    end else if(ID_jalr) begin
        ID_PC_target <= ID_rf_rd_data1 + {ID_imm_expand[63:1],1'b0};  // jalr offset is in Bytes. The LSB is set to 0.
    end else begin
        ID_PC_target <= PC_ID + {ID_imm_expand[62:0], 1'b0};
    end
end

//----------- Stage 3: Execute

always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        EX_MEM_reg      <= 'd0;
        EX_MEM_ctrl_reg <= 'd0;
    end else begin
        EX_MEM_reg[63:0]  <= EX_alu_result;
        EX_MEM_reg[127:64] <= EX_alu_op2_fw;
        EX_MEM_reg[159:128] <= instr_EX;
        EX_MEM_ctrl_reg[0]  <= ID_EX_ctrl_reg[0];
        EX_MEM_ctrl_reg[1]  <= ID_EX_ctrl_reg[1];
        EX_MEM_ctrl_reg[2]  <= ID_EX_ctrl_reg[2];
        EX_MEM_ctrl_reg[3]  <= ID_EX_ctrl_reg[3];
        EX_MEM_ctrl_reg[4]  <= ID_EX_ctrl_reg[4];
    end
end

// forwarding unit for alu operand 1.
always @(*) begin
    case(EX_forward_A)
        2'b00:   EX_alu_op1_fw  <=  EX_rf_rd_data1;
        2'b10:   EX_alu_op1_fw  <=  MEM_alu_result;
        2'b01:   EX_alu_op1_fw  <=  WB_rf_wr_data;
        default: EX_alu_op1_fw  <=  EX_rf_rd_data1;
    endcase
end

// forwarding unit for alu operand 1.
always @(*) begin
    case(EX_forward_B)
        2'b00:   EX_alu_op2_fw  <=  EX_rf_rd_data2;
        2'b10:   EX_alu_op2_fw  <=  MEM_alu_result;
        2'b01:   EX_alu_op2_fw  <=  WB_rf_wr_data;
        default: EX_alu_op2_fw  <=  EX_rf_rd_data2;
    endcase
end

// branch and jump control.
always @(*) begin
    if(EX_jal) begin
        EX_PC_src    <= 1'b1;
    end else if(EX_jalr) begin
        EX_PC_src    <= 1'b1;
    end else  begin
        EX_PC_src    <= EX_branch & EX_branch_taken;
    end
end

assign instr_EX     = ID_EX_reg[96:64];
assign PC_EX        = ID_EX_reg[287:224];
assign EX_PC_target = ID_EX_reg[351:288];

assign EX_rf_rd_data1   = ID_EX_reg[159:96];
assign EX_rf_rd_data2   = ID_EX_reg[223:160];
assign EX_branch        = ID_EX_ctrl_reg[2];
assign EX_alu2_src      = ID_EX_ctrl_reg[5];
assign EX_alu1_src      = ID_EX_ctrl_reg[7:6];
assign EX_jal           = ID_EX_ctrl_reg[8];
assign EX_jalr          = ID_EX_ctrl_reg[9];
assign EX_imm_expand    = ID_EX_reg[63:0];
assign EX_alu_op1       = EX_alu1_src[1] ? PC_EX : (EX_alu1_src[0] ? 0 : EX_alu_op1_fw);  // 00:fw, 01:0, 10:PC
assign EX_alu_op2       = EX_alu2_src ? EX_imm_expand : EX_alu_op2_fw;
assign EX_instr_part    = {instr_EX[30],instr_EX[14:12]};   // part of funct7, and funct3

//----------- Stage 4: Memory Access

always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        MEM_WB_reg      <= 'd0;
        MEM_WB_ctrl_reg <= 'd0;
    end else begin
        MEM_WB_reg[63:0]    <= MEM_mem_dout_map;
        MEM_WB_reg[127:64]  <= MEM_alu_result;
        MEM_WB_reg[159:128] <= instr_MEM;
        MEM_WB_ctrl_reg[0]  <= EX_MEM_ctrl_reg[0];
        MEM_WB_ctrl_reg[1]  <= EX_MEM_ctrl_reg[1];
    end
end

assign MEM_mem_read = EX_MEM_ctrl_reg[3];
assign MEM_mem_write = EX_MEM_ctrl_reg[4];
assign MEM_alu_result = EX_MEM_reg[63:0];
assign instr_MEM = EX_MEM_reg[159:128];

//----------- Stage 5: Write Back

assign WB_reg_write = MEM_WB_ctrl_reg[0];
assign WB_mem_to_reg = MEM_WB_ctrl_reg[1];
assign WB_mem_dout = MEM_WB_reg[63:0];
assign WB_alu_result = MEM_WB_reg[127:64];
assign WB_rf_wr_data = WB_mem_to_reg ? WB_mem_dout : WB_alu_result;
assign instr_WB = MEM_WB_reg[159:128];

//------------------------ INSTANTIATE ------------------------//

rv_instr_mem u_instr_mem(
    .clk(clk),
    .pc_i(PC),
    .instr_o(instr_IF)
);

rv_ctrl u_ctrl(
    .rstn(rstn),
    .opcode_i(IF_ID_reg[6:0]),
    .branch_o(ID_branch_b),
    .mem_read_o(ID_mem_read_b),
    .mem_to_reg_o(ID_mem_to_reg_b),
    .mem_write_o(ID_mem_write_b),
    .alu1_src_o(ID_alu1_src_b),
    .alu2_src_o(ID_alu2_src_b),
    .reg_read_o(ID_reg_read_b),
    .reg_write_o(ID_reg_write_b),
    .jal_o(ID_jal_b),
    .jalr_o(ID_jalr_b)
);

rv_rf u_rf(
    .clk(clk),
    .rstn(rstn),
    .rd_reg1_i(IF_ID_reg[19:15]),
    .rd_reg2_i(IF_ID_reg[24:20]),
    .wr_reg_i(instr_WB[11:7]),
    .wr_data_i(WB_rf_wr_data),
    .wr_en_i(WB_reg_write),
    .rd_data1_o(ID_rf_rd_data1),
    .rd_data2_o(ID_rf_rd_data2)
);

rv_imm_gen u_imm_gen(
    .instr_i(IF_ID_reg[31:0]),
    .expand_o(ID_imm_expand)
);

rv_alu u_alu(
    .op1_i(EX_alu_op1),
    .op2_i(EX_alu_op2),
    .op_sel_i(EX_alu_op_sel),
    .op_32b_i(EX_alu_op_32b),
    .result_o(EX_alu_result)
);

rv_branch_test u_branch_test(
    .alu_result_i(EX_alu_result),
    .funct3_i(instr_EX[14:12]),
    .taken_o(EX_branch_taken)
);

rv_alu_ctrl u_alu_ctrl(
    .opcode_i(instr_EX[6:0]),   // opcode
    .instr_part_i(EX_instr_part),  // funct3
    .alu_op_sel_o(EX_alu_op_sel),
    .alu_op_32b_o(EX_alu_op_32b)
);

rv_data_mem u_data_mem(
    .clk(clk),
    .addr_i(MEM_addr_map),
    .wr_en_i(MEM_mem_write),
    .wr_strobe_i(MEM_strobe),
    .wr_data_i(EX_MEM_reg[127:64]),  // rf_rd_data2_fw
    .rd_en_i(MEM_mem_read),
    .rd_data_o(MEM_mem_dout)
);

rv_forward u_forward(
    .opcode_i(instr_EX[6:0]),
    .EX_rs1_i(instr_EX[19:15]),
    .EX_rs2_i(instr_EX[24:20]),
    .MEM_reg_write_i(EX_MEM_ctrl_reg[0]),
    .MEM_rd_i(instr_MEM[11:7]),
    .WB_reg_write_i(MEM_WB_ctrl_reg[0]),
    .WB_rd_i(instr_WB[11:7]),
    .forward_A_o(EX_forward_A),
    .forward_B_o(EX_forward_B)
);

rv_hzd_detect u_hzd_detect(
    .clk(clk),
    .rstn(rstn),
    .EX_mem_read_i(ID_EX_ctrl_reg[3]),
    .EX_reg_rd_i(instr_EX[11:7]),
    .EX_branch_i(EX_branch),
    .instr_i(instr_ID),
    .PC_write_o(IF_PC_write),          // stall
    .IF_ID_write_o(IF_ID_write),    // stall
    .ctrl_write_o(ID_ctrl_write)       // stall
);

rv_branch_predict u_branch_predict(
    .clk(clk),
    .rstn(rstn),
    .ID_branch_i(ID_branch_b),
    .EX_branch_i(EX_branch),
    .EX_taken_i(EX_branch_taken),
    .EX_jal_i(EX_jal),
    .EX_jalr_i(EX_jalr),
    .EX_addr_i(instr_EX[11:8]),
    .ID_addr_i(instr_ID[11:8]),
    .IF_flush_o(IF_flush),
    .IF_predict_o(IF_predict)
);

rv_mem_map u_mem_map(
    .funct3_i(instr_MEM[14:12]),
    .addr_i(MEM_alu_result),
    .rd_data_i(MEM_mem_dout),
    .addr_map_o(MEM_addr_map),
    .wr_strobe_o(MEM_strobe),
    .rd_data_map_o(MEM_mem_dout_map)
);

endmodule
