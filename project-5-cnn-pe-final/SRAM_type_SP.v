module SRAMTypeSP #(parameter NUM_REG = 24, DATA_WIDTH = 16, ADDR_WIDTH = 5) 
(clk, chip_en, wen, ren, waddr, din, raddr, dout);
    
    input clk, chip_en, wen, ren
    input [ADDR_WIDTH-1:0] waddr, raddr;
    input [DATA_WIDTH-1:0] din;
    output reg [DATA_WIDTH-1:0] dout;

    reg [DATA_WIDTH-1:0] sram[0:NUM_REGISTERS-1];

    always @(posedge clk) begin
        if(chip_en) begin
            if (wen) begin
                sram[addr] <= din;
            end
        end
    end

    always @(posedge clk) begin
        if(chip_en) begin
            if (ren) begin
                dout <= sram[raddr];
            end
        end
    end
endmodule