module StartOrEndReg(parameter CONFIG_BIT = 4)
(clk, ld, reg_in, reg_out);

    input clk, ld;
    input[CONFIG_BIT-1:0] reg_in;
    output reg[CONFIG_BIT-1:0] reg_out;

    always @(posedge clk) begin
        if(ld)
            reg_out <= reg_in;
    end
endmodule 