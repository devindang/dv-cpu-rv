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
//  Title       : rv_itcm.v
//  Dependances : rv_dpram, (f)clog2
//  Editor      : VIM
//  Created     : 2023-07-22
//  Description : Instruction Tightly Coupled Memory.
//
//-------------------------------------------------------------------

`include "defines.v"

module rv_itcm(
    input                 clk,
    input   [`MXLEN-1:0]  pc_i,
    output  [31:0]        instr_o
);

//------------------------ INST ------------------------//

rv_dpram #(
    .WIDTH (32),
    .DEPTH (`ITCM_SIZE)
) u_instr_dpram (
    .clk(clk),
    .wena(1'b0),
    .strobe({4{1'b0}}),
    .addra((clog2(`ITCM_SIZE)-1)'b0),  // [clog2(DEPTH)-1:0]
    .dina(32'b0),    // [WIDTH-1:0]
    .renb(1'b1),
    .addrb(pc_i[clog2(`ITCM_SIZE)+1:2]),  // [clog2(DEPTH)-1:0]   // larger is not supported
    .doutb(instr_o)   // [WIDTH-1:0]
);

//------------------------ SUBROUTINE ------------------------//

function    integer clog2;
    input   integer depth;
    begin
        depth = depth-1;
        for(clog2=0; depth>0; clog2=clog2+1) begin
            depth = depth >> 1;
        end
    end
endfunction

endmodule
