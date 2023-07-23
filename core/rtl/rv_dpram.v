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
// Description :
//
// $Id$
//-------------------------------------------------------------------

`timescale 1ns / 1ps

module rv_dpram #(
    parameter WIDTH = 32,
    parameter DEPTH = 1024
) (
    input   clka,
    input   wea,
    input [clog2(DEPTH)-1:0] 

);


//------------------------ SIGNALS ------------------------//



//------------------------ PROCESS ------------------------//



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