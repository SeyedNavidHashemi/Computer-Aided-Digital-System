
module WriteCounter(parameter CONFIG_BIT = 4, parameter NUM_OF_REG = 12)
(clk, init, inc, cnt_out, cout);

    input clk, init, inc;
    output reg [CONFIG_BIT - 1:0] cnt_out;
    output reg cout;

    always @(posedge clk) begin
        if (init) begin
            cnt_out <= 0;      
            cout <= 0;
        end
        else if (inc) begin
            if (inc_counter == NUM_OF_REG - 1) begin
                cnt_out <= 0;   
                cout <= 1;   
            end 
            else begin
                cnt_out <= cnt_out + 1;
                cout <= 0;
            end
        end
    end
endmodule