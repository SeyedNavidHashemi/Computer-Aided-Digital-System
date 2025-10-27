module BaseCounterFilter #(parameter CONFIG_BIT = 4, parameter NUM_OF_REG = 16)
(clk, init, inc, filter_size, cnt_out, cout);

    input clk, init, inc;
    input[CONFIG_BIT-1;0] filter_size;
    output reg [CONFIG_BIT-1:0] cnt_out;
    output reg cout;

    // Calculate the number of filters as a local parameter
    localparam [CONFIG_BIT-1:0] num_of_filters = filter_size / NUM_OF_REG;
    // Tracks the number of increments
    reg [CONFIG_BIT-1:0] inc_counter; 

    always @(posedge clk) begin
        if (init) begin
            cnt_out <= 0;         
            inc_counter <= 0;
            cout <= 0;
        end
        else if (inc) begin
            if (inc_counter == num_of_filters - 1) begin
                cnt_out <= 0;
                inc_counter <= 0;   
                cout <= 1;   
            end 
            else begin
                cnt_out <= cnt_out + filter_size;
                inc_counter <= inc_counter + 1;
                cout <= 0;
            end
        end
    end
endmodule