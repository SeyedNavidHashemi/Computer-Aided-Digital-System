module RegisterTypeSP #(parameter NUM_REG = 12, DATA_WIDTH = 16, ADDR_WIDTH = 4) 
(clk, wen, waddr, din, raddr, dout);

    input clk, rst, wen;
    input [ADDR_WIDTH-1:0] waddr, raddr;
    input [DATA_WIDTH-1:0] din;
    output [DATA_WIDTH-1:0] dout;

    reg [DATA_WIDTH-1:0] registers[0:NUM_REG-1];

    always @(posedge clk) begin
        if (wen) begin
            registers[waddr] <= din;
        end
    end
    assign dout <= registers[raddr];
endmodule