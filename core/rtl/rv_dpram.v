//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2023, devin
//  balddonkey@outlook.com
//
//-------------------------------------------------------------------
// Title       : rv_dpram.V
// Author      : Devin
// Editor      : VIM
// Created     :
// Description : Dual ports block memory model.
//
// $Id$
//-------------------------------------------------------------------

`timescale 1ns / 1ps

module rv_dpram #(
    parameter WIDTH = 32,
    parameter DEPTH = 1024
) (
    input                           clk,
    input                           wena,   // write port
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
//     .addra(addra),  // [clog2(DEPTH)-1:0]
//     .dina(dina),    // [WIDTH-1:0]
//     .renb(renb),
//     .addrb(addrb),  // [clog2(DEPTH)-1:0]
//     .doutb(doutb)   // [WIDTH-1:0]
// );

//------------------------ SIGNALS ------------------------//

reg [WIDTH-1:0] BRAM [DEPTH-1:0];

//------------------------ PROCESS ------------------------//

always @(posedge clk) begin
    if(wena) begin
        BRAM[addra] <= dina;
    end
end

assign doutb = renb ? BRAM[addrb] : 'd0;

//------------------------ INST ------------------------//

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
