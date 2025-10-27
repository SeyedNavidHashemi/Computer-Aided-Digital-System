`timescale 1ns/1ns

module controller (clk, rst, write_en, read_en, ready, valid, init, inc_w, inc_r, wen);
input clk, rst, write_en, read_en, ready, valid;
output reg init, inc_w, inc_r, wen;

assign inc_w = (write_en && ready) ? 1'b1 : 1'b0;
assign wen = (write_en && ready) ? 1'b1 : 1'b0;
assign inc_r = (read_en && valid) ? 1'b1 : 1'b0;

endmodule
