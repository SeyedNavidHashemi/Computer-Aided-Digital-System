module BaseCounterIFMAP #(parameter CONFIG_BIT = 4, parameter NUM_OF_REG = 16)
(clk, ld, inc, load_data, stride, cnt_out, cout);

    input clk, inc;
    input[CONFIG_BIT-1;0] load_data, stride;
    output reg [CONFIG_BIT-1:0] cnt_out;
    output reg cout;

    always @(posedge clk) begin
        if (ld) begin
            cnt_out <= load_data;
        end
        else if (inc) begin
            cnt_out <= cnt_out + stride;     
        end 
    end
endmodule