module dpram #(parameter DEPTH = 16,
    parameter WIDTH = 8)(
    input wclk,
    input wen,
    input [$clog2(DEPTH)-1:0] waddr,
    input [WIDTH-1:0] wdata,
    input rclk,
    input ren,
    input [$clog2(DEPTH)-1:0] raddr,
    output reg [WIDTH-1:0] rdata
);

reg [WIDTH-1:0] RAM_MEM [0:DEPTH-1];

always @(posedge wclk) begin
    if(wen)
        RAM_MEM[waddr] <= wdata;
end 

always @(posedge rclk) begin
    if(ren)
        rdata <= RAM_MEM[raddr];
end 

endmodule