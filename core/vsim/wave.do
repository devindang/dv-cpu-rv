onerror {resume}
quietly virtual signal -install /tb_rv_core/u_rv_core { /tb_rv_core/u_rv_core/instr_MEM[11:7]} MEM_rd
quietly virtual signal -install /tb_rv_core/u_rv_core { /tb_rv_core/u_rv_core/instr_ID[19:15]} ID_rs1
quietly virtual signal -install /tb_rv_core/u_rv_core { /tb_rv_core/u_rv_core/instr_ID[24:20]} ID_rs2
quietly virtual signal -install /tb_rv_core/u_rv_core { /tb_rv_core/u_rv_core/instr_WB[11:7]} WB_rd
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/clk
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/rstn
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} -expand -group sim:/tb_rv_core/u_rv_core/Group1 -radix unsigned /tb_rv_core/u_rv_core/PC
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} -expand -group sim:/tb_rv_core/u_rv_core/Group1 /tb_rv_core/u_rv_core/ID_rf_forward
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} -expand -group sim:/tb_rv_core/u_rv_core/Group1 /tb_rv_core/u_rv_core/ID_reg_write_b
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} -expand -group sim:/tb_rv_core/u_rv_core/Group1 -radix unsigned /tb_rv_core/u_rv_core/ID_rs1
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} -expand -group sim:/tb_rv_core/u_rv_core/Group1 -radix unsigned /tb_rv_core/u_rv_core/ID_rs2
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} -expand -group sim:/tb_rv_core/u_rv_core/Group1 -radix unsigned /tb_rv_core/u_rv_core/MEM_rd
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} -expand -group sim:/tb_rv_core/u_rv_core/Group1 -radix unsigned /tb_rv_core/u_rv_core/WB_rd
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} -expand -group sim:/tb_rv_core/u_rv_core/Group1 -radix unsigned /tb_rv_core/u_rv_core/WB_rf_wr_data
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} -expand -group sim:/tb_rv_core/u_rv_core/Group1 -radix unsigned /tb_rv_core/u_rv_core/ID_rf_rd_data1
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} -expand -group sim:/tb_rv_core/u_rv_core/Group1 -radix unsigned /tb_rv_core/u_rv_core/ID_rf_rd_data2
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} -expand -group sim:/tb_rv_core/u_rv_core/Group1 -radix unsigned /tb_rv_core/u_rv_core/EX_alu_op1
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} -expand -group sim:/tb_rv_core/u_rv_core/Group1 -radix unsigned /tb_rv_core/u_rv_core/EX_alu_op2
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} -expand -group sim:/tb_rv_core/u_rv_core/Group1 -radix unsigned /tb_rv_core/u_rv_core/EX_alu_result
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} -radix unsigned /tb_rv_core/u_rv_core/PC
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} -radix unsigned /tb_rv_core/u_rv_core/PC_IF
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} -radix unsigned /tb_rv_core/u_rv_core/PC_ID
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} -radix unsigned /tb_rv_core/u_rv_core/PC_EX
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/instr_IF
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/instr_ID
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/instr_EX
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/instr_MEM
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/instr_WB
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/EX_PC_src
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/EX_PC_target
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/MEM_PC_target_r
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/ID_imm_expand
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/EX_imm_expand_r
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/WB_rf_wr_data
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/ID_rf_rd_data1
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/ID_rf_rd_data2
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/EX_rf_rd_data1_r
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/EX_rf_rd_data2_r
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/EX_alu_op1
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/EX_alu_op2
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/EX_alu_op_sel
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/EX_alu_result
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/MEM_alu_result_r
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/WB_alu_result_r2
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/EX_instr_part
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/MEM_mem_dout
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/WB_mem_dout_r
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/ID_branch_b
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/ID_mem_read_b
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/ID_mem_to_reg_b
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/ID_mem_write_b
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/ID_alu_src_b
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/ID_reg_write_b
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/ID_branch
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/ID_mem_read
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/ID_mem_to_reg
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/ID_mem_write
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/ID_alu_src
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/ID_reg_write
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/EX_branch_taken
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/EX_branch_r
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/MEM_mem_read_r
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/WB_mem_to_reg_r
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/MEM_mem_write_r
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/EX_alu_src_r
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/WB_reg_write_r
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/IF_ID_reg
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/ID_EX_reg
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/EX_MEM_reg
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/MEM_WB_reg
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/ID_EX_ctrl_reg
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/EX_MEM_ctrl_reg
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/MEM_WB_ctrl_reg
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/ID_rf_forward
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/EX_forward_A
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/EX_forward_B
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/EX_rf_rd_data2_fw
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/IF_PC_write
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/IF_ID_write
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/ID_ctrl_write
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/IF_flush
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/IF_predict
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/IF_predict_r
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_instr_mem/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_instr_mem} /tb_rv_core/u_rv_core/u_instr_mem/clk
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_instr_mem/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_instr_mem} /tb_rv_core/u_rv_core/u_instr_mem/pc_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_instr_mem/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_instr_mem} /tb_rv_core/u_rv_core/u_instr_mem/instr_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram} /tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram/clk
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram} /tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram/wena
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram} /tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram/addra
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram} /tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram/dina
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram} /tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram/renb
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram} /tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram/addrb
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram} /tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram/doutb
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram/clog2/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram/clog2} /tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram/clog2/clog2
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram/clog2/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram/clog2} /tb_rv_core/u_rv_core/u_instr_mem/u_instr_dpram/clog2/depth
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_ctrl/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_ctrl} /tb_rv_core/u_rv_core/u_ctrl/rstn
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_ctrl/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_ctrl} /tb_rv_core/u_rv_core/u_ctrl/opcode_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_ctrl/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_ctrl} /tb_rv_core/u_rv_core/u_ctrl/branch_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_ctrl/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_ctrl} /tb_rv_core/u_rv_core/u_ctrl/mem_read_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_ctrl/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_ctrl} /tb_rv_core/u_rv_core/u_ctrl/mem_to_reg_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_ctrl/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_ctrl} /tb_rv_core/u_rv_core/u_ctrl/mem_write_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_ctrl/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_ctrl} /tb_rv_core/u_rv_core/u_ctrl/alu_src_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_ctrl/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_ctrl} /tb_rv_core/u_rv_core/u_ctrl/reg_write_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/clk
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/rstn
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/rd_reg1_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/rd_reg2_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/wr_reg_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/wr_data_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/wr_en_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/rd_data1_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/rd_data2_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x0
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x1
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x2
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x3
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x4
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x5
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x6
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x7
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x8
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x9
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x10
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x11
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x12
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x13
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x14
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x15
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x16
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x17
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x18
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x19
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x20
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x21
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x22
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x23
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x24
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x25
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x26
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x27
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x28
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x29
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x30
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/x31
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_imm_gen/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_imm_gen} /tb_rv_core/u_rv_core/u_imm_gen/instr_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_imm_gen/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_imm_gen} /tb_rv_core/u_rv_core/u_imm_gen/expand_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_alu/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_alu} /tb_rv_core/u_rv_core/u_alu/op1_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_alu/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_alu} /tb_rv_core/u_rv_core/u_alu/op2_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_alu/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_alu} /tb_rv_core/u_rv_core/u_alu/op_sel_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_alu/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_alu} /tb_rv_core/u_rv_core/u_alu/result_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_branch_test/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_branch_test} /tb_rv_core/u_rv_core/u_branch_test/alu_result_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_branch_test/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_branch_test} /tb_rv_core/u_rv_core/u_branch_test/funct3_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_branch_test/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_branch_test} /tb_rv_core/u_rv_core/u_branch_test/taken_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_branch_test/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_branch_test} /tb_rv_core/u_rv_core/u_branch_test/zero
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_alu_ctrl/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_alu_ctrl} /tb_rv_core/u_rv_core/u_alu_ctrl/opcode_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_alu_ctrl/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_alu_ctrl} /tb_rv_core/u_rv_core/u_alu_ctrl/instr_part_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_alu_ctrl/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_alu_ctrl} /tb_rv_core/u_rv_core/u_alu_ctrl/alu_op_sel_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_data_mem/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_data_mem} /tb_rv_core/u_rv_core/u_data_mem/clk
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_data_mem/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_data_mem} /tb_rv_core/u_rv_core/u_data_mem/addr_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_data_mem/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_data_mem} /tb_rv_core/u_rv_core/u_data_mem/wr_en_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_data_mem/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_data_mem} /tb_rv_core/u_rv_core/u_data_mem/wr_data_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_data_mem/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_data_mem} /tb_rv_core/u_rv_core/u_data_mem/rd_en_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_data_mem/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_data_mem} /tb_rv_core/u_rv_core/u_data_mem/rd_data_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_data_mem/u_data_dpram/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_data_mem/u_data_dpram} /tb_rv_core/u_rv_core/u_data_mem/u_data_dpram/clk
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_data_mem/u_data_dpram/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_data_mem/u_data_dpram} /tb_rv_core/u_rv_core/u_data_mem/u_data_dpram/wena
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_data_mem/u_data_dpram/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_data_mem/u_data_dpram} /tb_rv_core/u_rv_core/u_data_mem/u_data_dpram/addra
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_data_mem/u_data_dpram/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_data_mem/u_data_dpram} /tb_rv_core/u_rv_core/u_data_mem/u_data_dpram/dina
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_data_mem/u_data_dpram/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_data_mem/u_data_dpram} /tb_rv_core/u_rv_core/u_data_mem/u_data_dpram/renb
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_data_mem/u_data_dpram/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_data_mem/u_data_dpram} /tb_rv_core/u_rv_core/u_data_mem/u_data_dpram/addrb
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_data_mem/u_data_dpram/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_data_mem/u_data_dpram} /tb_rv_core/u_rv_core/u_data_mem/u_data_dpram/doutb
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_data_mem/u_data_dpram/clog2/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_data_mem/u_data_dpram/clog2} /tb_rv_core/u_rv_core/u_data_mem/u_data_dpram/clog2/clog2
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_data_mem/u_data_dpram/clog2/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_data_mem/u_data_dpram/clog2} /tb_rv_core/u_rv_core/u_data_mem/u_data_dpram/clog2/depth
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_forward/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_forward} /tb_rv_core/u_rv_core/u_forward/opcode_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_forward/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_forward} /tb_rv_core/u_rv_core/u_forward/EX_rs1_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_forward/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_forward} /tb_rv_core/u_rv_core/u_forward/EX_rs2_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_forward/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_forward} /tb_rv_core/u_rv_core/u_forward/MEM_reg_write_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_forward/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_forward} /tb_rv_core/u_rv_core/u_forward/MEM_rd_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_forward/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_forward} /tb_rv_core/u_rv_core/u_forward/WB_reg_write_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_forward/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_forward} /tb_rv_core/u_rv_core/u_forward/WB_rd_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_forward/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_forward} /tb_rv_core/u_rv_core/u_forward/forward_A_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_forward/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_forward} /tb_rv_core/u_rv_core/u_forward/forward_B_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_forward/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_forward} /tb_rv_core/u_rv_core/u_forward/type_I
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_hzd_detect/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_hzd_detect} /tb_rv_core/u_rv_core/u_hzd_detect/clk
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_hzd_detect/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_hzd_detect} /tb_rv_core/u_rv_core/u_hzd_detect/rstn
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_hzd_detect/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_hzd_detect} /tb_rv_core/u_rv_core/u_hzd_detect/EX_mem_read_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_hzd_detect/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_hzd_detect} /tb_rv_core/u_rv_core/u_hzd_detect/EX_reg_rd_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_hzd_detect/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_hzd_detect} /tb_rv_core/u_rv_core/u_hzd_detect/instr_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_hzd_detect/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_hzd_detect} /tb_rv_core/u_rv_core/u_hzd_detect/IF_flush_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_hzd_detect/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_hzd_detect} /tb_rv_core/u_rv_core/u_hzd_detect/PC_write_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_hzd_detect/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_hzd_detect} /tb_rv_core/u_rv_core/u_hzd_detect/IF_ID_write_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_hzd_detect/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_hzd_detect} /tb_rv_core/u_rv_core/u_hzd_detect/ctrl_write_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_hzd_detect/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_hzd_detect} /tb_rv_core/u_rv_core/u_hzd_detect/ID_reg_rs1
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_hzd_detect/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_hzd_detect} /tb_rv_core/u_rv_core/u_hzd_detect/ID_reg_rs2
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_branch_predict/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_branch_predict} /tb_rv_core/u_rv_core/u_branch_predict/clk
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_branch_predict/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_branch_predict} /tb_rv_core/u_rv_core/u_branch_predict/rstn
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_branch_predict/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_branch_predict} /tb_rv_core/u_rv_core/u_branch_predict/ID_branch_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_branch_predict/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_branch_predict} /tb_rv_core/u_rv_core/u_branch_predict/EX_branch_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_branch_predict/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_branch_predict} /tb_rv_core/u_rv_core/u_branch_predict/EX_taken_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_branch_predict/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_branch_predict} /tb_rv_core/u_rv_core/u_branch_predict/EX_addr_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_branch_predict/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_branch_predict} /tb_rv_core/u_rv_core/u_branch_predict/ID_addr_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_branch_predict/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_branch_predict} /tb_rv_core/u_rv_core/u_branch_predict/IF_flush_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_branch_predict/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_branch_predict} /tb_rv_core/u_rv_core/u_branch_predict/IF_predict_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_branch_predict/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_branch_predict} /tb_rv_core/u_rv_core/u_branch_predict/i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {68 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 171
configure wave -valuecolwidth 85
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {5 ns} {174 ns}
