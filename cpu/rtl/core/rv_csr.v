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
//  Title       : rv_csr.v
//  Dependances : 
//  Editor      : VIM
//  Created     : 2023-08-25
//  Description : Control Status Register.
//
//-------------------------------------------------------------------

`include "defines.v"

module rv_csr(

);

//------------------------ SIGNALS ------------------------//

// CSR Machine Trap Setup
    reg  [`MXLEN-1:0] csr_mstatus;   // Machine status register.
    wire [`MXLEN-1:0] csr_misa;      // ISA and extensions.
    reg  [`MXLEN-1:0] csr_mie;       // Machine interrupt-enable register.
    reg  [`MXLEN-1:0] csr_mtvec;     // Machine trap-handler base address.

// CSR Machine Trap Handling
    reg  [`MXLEN-1:0] csr_mscratch;  // Scratch register for machine trap handlers.
    reg  [`MXLEN-1:0] csr_mepc;      // Machine exception program counter.
    reg  [`MXLEN-1:0] csr_mcause;    // Machine trap cause.
    reg  [`MXLEN-1:0] csr_mtval;     // Machine bad address or instruction.
    reg  [`MXLEN-1:0] csr_mip;       // Machine interrupt pending.

// CSR Machine Information Registers
    wire [`MXLEN-1:0] csr_mvendorid; // Vendor ID.
    reg  [`MXLEN-1:0] csr_marchid;   // Architecture ID.
    reg  [`MXLEN-1:0] csr_mimpid;    // Implementation ID.
    reg  [`MXLEN-1:0] csr_mhartid;   // Hardware thread ID.


// mstatus field
    wire        mstatus_SD;
`ifdef MXL_64
    wire        MBE;
    wire        SBE;
    wire [1:0]  SXL;
    wire [1:0]  UXL;
`endif
    wire        TSR;
    wire        TW;
    wire        TVM;
    wire        MXR;
    wire        SUM;
    wire        MPRV;
    wire [1:0]  mstatus_XS;
    wire [1:0]  mstatus_FS;
    wire [1:0]  mstatus_MPP;
    wire [1:0]  mstatus_VS;
    wire [1:0]  mstatus_SPP;
    wire        MPIE;
    wire        UBE;
    wire        SPIE;
    wire        MIE;
    wire        SIE;


//------------------------ PROCESS ------------------------//


//****************************** misa ******************************//

// WARL (Write Any Read Legal) is not implemented.
`ifdef MXL_64
    assign csr_misa[`MXLEN-1:`MXLEN-2] = 2'b10;  // RV64
`else
    assign csr_misa[`MXLEN-1:`MXLEN-2] = 2'b01;  // RV32
`endif
    assign csr_misa[`MXLEN-3:26] <= (`MXLEN-28)'d0;
    assign csr_misa[0]  = 1'b0;                  // A, Atomic extension
    assign csr_misa[1]  = 1'b0;                  // B, Tentatively reserved for Bit-Manipulation extension
    assign csr_misa[2]  = 1'b0;                  // C, Compressed extension
    assign csr_misa[3]  = `ISA_RV_D & `ISA_RV_F; // D, Double-precision floating-point extension
    assign csr_misa[4]  = 1'b0;                  // E, RV32E base ISA
    assign csr_misa[5]  = `ISA_RV_F;             // F, Single-precision floating-point extension
    assign csr_misa[6]  = 1'b0;                  // G, Reserved
    assign csr_misa[7]  = 1'b0;                  // H, Hypervisor extension
    assign csr_misa[8]  = 1'b1;                  // I, RV32I/RV64I/RV128I base ISA
    assign csr_misa[9]  = 1'b0;                  // J, Tentatively reserved for Dynamically Translated Languages extension
    assign csr_misa[10] = 1'b0;                  // K, Reserved
    assign csr_misa[11] = 1'b0;                  // L, Reserved
    assign csr_misa[12] = `ISA_RV_M;             // M, Integer Multiply/Divide extension
    assign csr_misa[13] = 1'b0;                  // N, ZTentatively reserved for User-Level Interrupts extension
    assign csr_misa[14] = 1'b0;                  // O, Reserved
    assign csr_misa[15] = 1'b0;                  // P, Tentatively reserved for Packed-SIMD extension
    assign csr_misa[16] = 1'b0;                  // Q, Quad-precision floating-point extension
    assign csr_misa[17] = 1'b0;                  // R, Reserved
    assign csr_misa[18] = 1'b0;                  // S, Supervisor mode implemented
    assign csr_misa[19] = 1'b0;                  // T, Reserved
    assign csr_misa[20] = 1'b0;                  // U, User mode implemented
    assign csr_misa[21] = 1'b0;                  // V, Tentatively reserved for Vector extension
    assign csr_misa[22] = 1'b0;                  // W, Reserved
    assign csr_misa[23] = 1'b0;                  // X, Non-standard extension present
    assign csr_misa[24] = 1'b0;                  // Y, Reserved
    assign csr_misa[25] = 1'b0;                  // Z, Reserved

//****************************** mvendorid ******************************//

    assign csr_mvendorid = `VENDORID;

//****************************** marchid ******************************//

    assign csr_marchid   = `ARCHID;

//****************************** mimpid ******************************//

    assign csr_mimpid    = `IMPID;

//****************************** mhartid ******************************//

    assign csr_mhartid   = `HARTID;

//****************************** mstatus ******************************//

`ifndef ISA_RV_F
    assign mstatus_FS = 2'b00;
`endif

// Write CSR
    always @(*) begin
        if(!rstn) begin

        end else begin

        end
    end


//------------------------ INST ------------------------//


endmodule