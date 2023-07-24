onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -label sim:/tb_rv_core/Group1 -group {Region: sim:/tb_rv_core} /tb_rv_core/clk
add wave -noupdate -expand -label sim:/tb_rv_core/Group1 -group {Region: sim:/tb_rv_core} /tb_rv_core/rstn
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/clk
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/rstn
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/PC
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/PC_next
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/PC_inc
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/PC_src
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/PC_target
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/instruction
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/expansion
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/instr_reg
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/rf_rd_en
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/rf_wr_data
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/rf_rd_data1
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/rf_rd_data2
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/alu_op1
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/alu_op2
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/alu_op_sel
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/alu_result
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/instr_part
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/mem_dout
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/branch
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/mem_read
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/mem_to_reg
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/mem_write
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/alu_src
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/reg_write
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/reg_src
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/branch_taken
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/phase
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/PC_load
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/Group1 -group {Region: sim:/tb_rv_core/u_rv_core} /tb_rv_core/u_rv_core/IR_load
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_instr_mem/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_instr_mem} /tb_rv_core/u_rv_core/u_instr_mem/clk
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_instr_mem/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_instr_mem} /tb_rv_core/u_rv_core/u_instr_mem/pc_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_instr_mem/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_instr_mem} /tb_rv_core/u_rv_core/u_instr_mem/instr_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_ctrl/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_ctrl} /tb_rv_core/u_rv_core/u_ctrl/rstn
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_ctrl/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_ctrl} /tb_rv_core/u_rv_core/u_ctrl/opcode_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_ctrl/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_ctrl} /tb_rv_core/u_rv_core/u_ctrl/branch_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_ctrl/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_ctrl} /tb_rv_core/u_rv_core/u_ctrl/mem_read_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_ctrl/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_ctrl} /tb_rv_core/u_rv_core/u_ctrl/mem_to_reg_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_ctrl/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_ctrl} /tb_rv_core/u_rv_core/u_ctrl/mem_write_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_ctrl/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_ctrl} /tb_rv_core/u_rv_core/u_ctrl/alu_src_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_ctrl/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_ctrl} /tb_rv_core/u_rv_core/u_ctrl/reg_write_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_ctrl/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_ctrl} /tb_rv_core/u_rv_core/u_ctrl/reg_src_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/clk
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/rstn
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_rf/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_rf} /tb_rv_core/u_rv_core/u_rf/rd_en_i
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
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_alu/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_alu} /tb_rv_core/u_rv_core/u_alu/result
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_branch_test/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_branch_test} /tb_rv_core/u_rv_core/u_branch_test/alu_result_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_branch_test/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_branch_test} /tb_rv_core/u_rv_core/u_branch_test/funct3_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_branch_test/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_branch_test} /tb_rv_core/u_rv_core/u_branch_test/taken_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_branch_test/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_branch_test} /tb_rv_core/u_rv_core/u_branch_test/zero
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_alu_ctrl/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_alu_ctrl} /tb_rv_core/u_rv_core/u_alu_ctrl/opcode_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_alu_ctrl/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_alu_ctrl} /tb_rv_core/u_rv_core/u_alu_ctrl/instr_part_i
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_alu_ctrl/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_alu_ctrl} /tb_rv_core/u_rv_core/u_alu_ctrl/alu_op_sel_o
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_data_mem/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_data_mem} /tb_rv_core/u_rv_core/u_data_mem/clk
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_data_mem/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_data_mem} /tb_rv_core/u_rv_core/u_data_mem/addr
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_data_mem/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_data_mem} /tb_rv_core/u_rv_core/u_data_mem/wr_en
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_data_mem/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_data_mem} /tb_rv_core/u_rv_core/u_data_mem/wr_data
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_data_mem/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_data_mem} /tb_rv_core/u_rv_core/u_data_mem/rd_en
add wave -noupdate -expand -label sim:/tb_rv_core/u_rv_core/u_data_mem/Group1 -group {Region: sim:/tb_rv_core/u_rv_core/u_data_mem} /tb_rv_core/u_rv_core/u_data_mem/rd_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3001 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ns} {10789 ns}
