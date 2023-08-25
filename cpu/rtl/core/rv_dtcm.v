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
//  Title       : rv_data_mem.v
//  Dependances : rv_dpram, (f)clog2
//  Editor      : VIM
//  Created     : 2023-07-22
//  Description : Data Tightly Coupled Memory
//
//-------------------------------------------------------------------

`include "defines.v"

// MEM_ADDR_WID = 32

module rv_dtcm(
    input                  clk,
    input   [`MXLEN-1:0]   addr_i,
    input                  wr_en_i,
    input   [`MXLEN/8-1:0] wr_strobe_i,
    input   [`MXLEN-1:0]   wr_data_i,
    input                  rd_en_i,
    output  [`MXLEN-1:0]   rd_data_o
);

//------------------------ INST ------------------------//

rv_dpram #(
    .WIDTH (`MXLEN),
    .DEPTH (`DTCM_SIZE)
) u_data_dpram (
    .clk(clk),
    .wena(wr_en_i),
    .strobe(wr_strobe_i),
    .addra(addr_i[clog2(`DTCM_SIZE)-1:0]),  // [clog2(DEPTH)-1:0]  // larger is not supported
    .dina(wr_data_i),    // [WIDTH-1:0]
    .renb(rd_en_i),
    .addrb(addr_i[clog2(`DTCM_SIZE)-1:0]),  // [clog2(DEPTH)-1:0]
    .doutb(rd_data_o)   // [WIDTH-1:0]
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
