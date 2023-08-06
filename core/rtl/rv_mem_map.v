//-------------------------------------------------------------------
//                                                                 
//  COPYRIGHT (C) 2023, devin
//  balddonkey@outlook.com
//
//-------------------------------------------------------------------
// Title       : rv_mem_map
// Author      : Devin
// Editor	   : code
// Created     : 
// Description : Mapping CPU resources to Memory part.
//               
// $Id$ 
//-------------------------------------------------------------------  

`timescale 1ns / 1ps

module rv_mem_map(
    input       [2:0]   funct3_i,
    input       [63:0]  addr_i,
    input       [63:0]  rd_data_i,
    output  reg [63:0]  addr_map_o,
    output  reg [7:0]   wr_strobe_o,
    output  reg [63:0]  rd_data_map_o
);

//------------------------ PROCESS ------------------------//

always @(*) begin
    case(funct3_i[1:0])
        2'b00: begin   // lb, sb
            addr_map_o <= {3'b000,addr_i[63:3]};
            case(addr_i[2:0])
                3'b000: begin
                    wr_strobe_o   <= 8'b0000_0001;
                    rd_data_map_o <= {{56{~funct3_i[2] & rd_data_i[7]}},rd_data_i[7:0]};
                end
                3'b001: begin
                    wr_strobe_o   <= 8'b0000_0010;
                    rd_data_map_o <= {{56{~funct3_i[2] & rd_data_i[15]}},rd_data_i[15:8]};
                end
                3'b010: begin
                    wr_strobe_o   <= 8'b0000_0100;
                    rd_data_map_o <= {{56{~funct3_i[2] & rd_data_i[23]}},rd_data_i[23:16]};
                end
                3'b011: begin
                    wr_strobe_o   <= 8'b0000_1000;
                    rd_data_map_o <= {{56{~funct3_i[2] & rd_data_i[31]}},rd_data_i[31:24]};
                end
                3'b100: begin
                    wr_strobe_o   <= 8'b0001_0000;
                    rd_data_map_o <= {{56{~funct3_i[2] & rd_data_i[39]}},rd_data_i[39:32]};
                end
                3'b101: begin
                    wr_strobe_o   <= 8'b0010_0000;
                    rd_data_map_o <= {{56{~funct3_i[2] & rd_data_i[47]}},rd_data_i[47:40]};
                end
                3'b110: begin
                    wr_strobe_o   <= 8'b0100_0000;
                    rd_data_map_o <= {{56{~funct3_i[2] & rd_data_i[55]}},rd_data_i[55:48]};
                end
                3'b111: begin
                    wr_strobe_o   <= 8'b1000_0000;
                    rd_data_map_o <= {{56{~funct3_i[2] & rd_data_i[63]}},rd_data_i[63:56]};
                end
                default: ;
            endcase
        end
        2'b01: begin    // lh, lhu, sh
            addr_map_o <= {2'b00,addr_i[63:2]};
            case(addr_i[1:0])
                2'b00: begin
                    wr_strobe_o   <= 8'b0000_0011;
                    rd_data_map_o <= {{48{~funct3_i[2] & rd_data_i[15]}},rd_data_i[15:0]};
                end
                2'b01: begin
                    wr_strobe_o   <= 8'b0000_1100;
                    rd_data_map_o <= {{48{~funct3_i[2] & rd_data_i[31]}},rd_data_i[31:16]};
                end
                2'b10: begin
                    wr_strobe_o   <= 8'b0011_0000;
                    rd_data_map_o <= {{48{~funct3_i[2] & rd_data_i[47]}},rd_data_i[47:32]};
                end
                2'b11: begin
                    wr_strobe_o   <= 8'b1100_0000;
                    rd_data_map_o <= {{48{~funct3_i[2] & rd_data_i[63]}},rd_data_i[63:48]};
                end
                default: ;
            endcase
        end
        2'b10: begin    // lw, lwu. sw
            addr_map_o <= {1'b0,addr_i[63:1]};
            case(addr_i[0])
                1'b0: begin
                    wr_strobe_o   <= 8'b0000_1111;
                    rd_data_map_o <= {{32{~funct3_i[2] & rd_data_i[31]}},rd_data_i[31:0]};
                end
                1'b1: begin
                    wr_strobe_o   <= 8'b1111_0000;
                    rd_data_map_o <= {{32{~funct3_i[2] & rd_data_i[63]}},rd_data_i[63:32]};
                end
                default: ;
            endcase
        end
        2'b11: begin    // ld, sd
            addr_map_o    <= addr_i;
            wr_strobe_o   <= 8'b1111_1111;
            rd_data_map_o <= rd_data_i;
        end
    endcase
end


endmodule