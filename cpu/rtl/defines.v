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
//  Title       : defines.v
//  Dependances : 
//  Editor      : code
//  Created     : 2023-08-24
//  Description : Macro defines.
//
//-------------------------------------------------------------------

//----------------------------- CONFIGS -----------------------------

// ISA Extension
    `define MXL_64   1'b1   // Max Register Length 64
    `define ISA_RV_M 1'b0   // Multiplication and Division
    `define ISA_RV_F 1'b0   // Single-Precision Floating-Point
    `define ISA_RV_D 1'b0   // Double-Precision Floating-Point
    
// Memory configs
    `define ITCM_SIZE 256   // Instruction Tightly Coupled Memory Size
    `define DTCM_SIZE 4096  // Data Tightly Coupled Memory Size
    
// Verdor
    `define VENDORID  32'h0         // NC, Non-Commercial
    `define ARCHID    32'h0         // not released
    `define IMPID     32'h0000_0001 // v0.1
    `define HARTID    32'h0         // only 1 hart is supported

//------------------------------ MACROS -----------------------------

// CSR Machine Trap Setup
`ifdef MXL_64
    `define MXLEN   64  // Machine Register length
`else
    `define MXLEN   32
`endif
    `define CSR_MSTATUS     12'h300     // Machine status register.
    `define CSR_MISA        12'h301     // ISA and extensions.
    `define CSR_MIE         12'h304     // Machine interrupt-enable register.
    `define CSR_MTVEC       12'h305     // Machine trap-handler base address.
// CSR Machine Trap Handling
    `define CSR_MSCRATCH    12'h340     // Scratch register for machine trap handlers.
    `define CSR_MEPC        12'h341     // Machine exception program counter.
    `define CSR_MCAUSE      12'h342     // Machine trap cause.
    `define CSR_MTVAL       12'h343     // Machine bad address or instruction.
    `define CSR_MIP         12'h344     // Machine interrupt pending.
// CSR Machine Information Registers
    `define CSR_MVENDORID   12'hF11     // Vendor ID.
    `define CSR_MARCHID     12'hF12     // Architecture ID.
    `define CSR_MIMPID      12'hF13     // Implementation ID.
    `define CSR_MHARTID     12'hF14     // Hardware thread ID.


