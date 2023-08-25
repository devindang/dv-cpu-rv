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
//  Title       : rv_dpram.v
//  Dependances : (f)clog2
//  Editor      : VIM
//  Created     : 2023-07-22
//  Description : Dual ports block memory model.
//
//-------------------------------------------------------------------

`timescale 1ns / 1ps

module rv_dpram #(
    parameter WIDTH = 32,
    parameter DEPTH = 1024
) (
    input                           clk,
    input                           wena,   // write port
    input       [WIDTH/8-1:0]       strobe, // byte strobe
    input       [clog2(DEPTH)-1:0]  addra,
    input       [WIDTH-1:0]         dina,
    input                           renb,   // read port
    input       [clog2(DEPTH)-1:0]  addrb,
    output      [WIDTH-1:0]         doutb
);

//------------------------ TEMPLATE ------------------------//

// rv_dpram #(
//     .WIDTH (32),
//     .DEPTH (1024)
// ) your_instance_name (
//     .clk(clk),
//     .wena(wena),
//     .strobe(strobe),// [WIDTH/8-1:0]
//     .addra(addra),  // [clog2(DEPTH)-1:0]
//     .dina(dina),    // [WIDTH-1:0]
//     .renb(renb),
//     .addrb(addrb),  // [clog2(DEPTH)-1:0]
//     .doutb(doutb)   // [WIDTH-1:0]
// );

//------------------------ SIGNALS ------------------------//

reg [WIDTH-1:0] BRAM [DEPTH-1:0];

//------------------------ PROCESS ------------------------//

genvar i;
generate
    for(i=0; i<WIDTH/8; i=i+1) begin
        always @(posedge clk) begin
            if(wena) begin
                if(strobe[i]) begin
                    BRAM[addra][8*i+7:8*i] <= dina[8*i+7:8*i];
                end
            end
        end
    end
endgenerate

assign doutb = renb ? BRAM[addrb] : 'd0;

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
