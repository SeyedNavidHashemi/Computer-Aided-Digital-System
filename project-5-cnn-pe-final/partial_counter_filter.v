module PartialCounterFilter #(parameter CONFIG_BIT = 4)
(clk, init, inc, filter_size, cnt_out, cout);

    input clk, init, inc, cnt_out;
    input[CONFIG_BIT-1:0] filter_size;
    output reg[CONFIG_BIT-1:0] cnt_out;
    output reg cout;

    always @(posedge clk) begin
        if (init) begin
            cnt_out <= 0;    
            cout <= 0;      
        end
        else if (inc) begin
            if (cnt_out == filter_size - 1) begin
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