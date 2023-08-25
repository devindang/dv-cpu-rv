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
//  Title       : rv_trap.v
//  Dependances : 
//  Editor      : VIM
//  Created     : 2023-07-22
//  Description : Trap deal.
//
//-------------------------------------------------------------------

`include "defines.v"

module rv_trap(
    input       clk,
    input       rstn,
    // exception
    input       access_fault_i,
    input       ecall_i,
    input       ebreak_i,
    input       instr_illegal_i,
    input       misaligned_i,
    // interrupt
    input       soft_irq_i,     // CLINT
    input       timer_irq_i,    // CLINT
    input       ext_irq_i,      // PLIC
    // transaction
    input       pc_i,       // mepc
    input       mem_addr_i, // mtval
    input       instr_i,    // mtval

);


//------------------------ SIGNALS ------------------------//



//------------------------ PROCESS ------------------------//



//------------------------ INST ------------------------//


endmodule