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
//  Title       : rv_branch_predict.v
//  Dependances : 
//  Editor      : VIM
//  Created     : 2023-07-29
//  Description : Dynamic 2-bit branch prediction.
//
//-------------------------------------------------------------------

`include "defines.v"

module rv_branch_predict(
    input               clk,
    input               rstn,
    input               ID_branch_i,
    input               EX_branch_i,
    input               EX_taken_i,
    input               EX_jal_i,
    input               EX_jalr_i,
    input       [3:0]   EX_addr_i,
    input       [3:0]   ID_addr_i,
    output  reg         IF_flush_o,
    output  reg         IF_predict_o
);

//------------------------ SIGNALS ------------------------//

reg [1:0]   bpb [15:0];    // branch prediction buffer
// use branch targer buffer will save one cycle for target calculation.

//------------------------ PROCESS ------------------------//

// dynamic branch prediction 
integer i;
always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        for (i=0; i<=15; i=i+1) begin
            bpb[i] <= 'd0;
        end
    end else begin
        if(EX_branch_i & EX_taken_i) begin
            if(bpb[EX_addr_i]<3) begin
                bpb[EX_addr_i] <= bpb[EX_addr_i]+1;
            end
        end else begin
            if(EX_branch_i & !EX_taken_i) begin
                if(bpb[EX_addr_i]>0) begin
                    bpb[EX_addr_i] <= bpb[EX_addr_i]-1;
                end
            end
        end
    end
end

always @(*) begin
    if(EX_branch_i) begin
        if(EX_taken_i) begin
            if(bpb[EX_addr_i]>=2) begin // predict correct
                IF_flush_o  <=  1'b0;
            end else begin
                IF_flush_o  <=  1'b1;   // nop
            end
        end else begin
            if(bpb[EX_addr_i]<2) begin  // predict correct
                IF_flush_o  <=  1'b0;
            end else begin
                IF_flush_o  <=  1'b1;   // nop
            end
        end
        if(EX_jal_i | EX_jalr_i) begin
            IF_flush_o  <=  1'b1;
        end
    end else begin
        IF_flush_o  <=  1'b0;
    end
end

always @(*) begin
    if(ID_branch_i) begin
        if(bpb[ID_addr_i]>=2) begin // predict branch
            IF_predict_o <=  1'b1;
        end else begin
            IF_predict_o <=  1'b0;
        end
    end else begin
        IF_predict_o  <=  1'b0;
    end
end

//------------------------ INST ------------------------//


endmodule