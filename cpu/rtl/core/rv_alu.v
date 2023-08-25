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
//  Title       : rv_alu.v
//  Dependances : 
//  Editor      : VIM
//  Created     : 2023-07-22
//  Description : Algorithm logic unit.
//
//-------------------------------------------------------------------

`include "defines.v"

module rv_alu(
    input   [`MXLEN-1:0]  op1_i,
    input   [`MXLEN-1:0]  op2_i,
    input   [3:0]         op_sel_i,
`ifdef MXL_64
    input                 op_32b_i,
`endif
    output  [`MXLEN-1:0]  result_o
);

//------------------------ PROCESS ------------------------//

    reg  [`MXLEN:0] result;

//------------------------ PROCESS ------------------------//

    always @(op_sel_i, op1_i, op2_i) begin
        case(op_sel_i)
            4'b0000: result <= op1_i + op2_i;                             // add
            4'b1000: result <= op1_i - op2_i;                             // sub
            4'b0001: result <= op1_i << op2_i;                            // sll
            4'b0010: result <= ($signed(op1_i) < $signed(op2_i)) ? 1 : 0; // slt
            4'b0011: result <= (op1_i < op2_i) ? 1 : 0;                   // sltu
            4'b0100: result <= op1_i ^ op2_i;                             // xor
            4'b0101: result <= op1_i >> op2_i;                            // srl
            4'b1101: result <= ($signed(op1_i)) >>> op2_i;                // sra
            4'b0110: result <= op1_i | op2_i;                             // or
            4'b0111: result <= op1_i & op2_i;                             // and
            default: result <= 0;
        endcase
    end

// Truncate and sign extend for 32bit operands.
`ifdef MXL_64
    assign result_o = op_32b_i ? {{32{result[31]}},result[31:0]} : result;
`else
    assign result_o = result;
`endif

endmodule