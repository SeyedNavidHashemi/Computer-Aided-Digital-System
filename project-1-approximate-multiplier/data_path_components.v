`timescale 1ns/1ns

parameter in_buf = 16;
parameter out_buf = 32;
parameter input_mult = 8;
parameter output_mult = 16;
parameter up_down_counter = 4;
parameter up_counter = 3;
parameter up_counter_16 = 4;

// module shift_register_inbuf(reg_in, shift_en, load_en, clk, rst, reg_out);
//     input [in_buf - 1 : 0] reg_in;
//     input shift_en, load_en, clk, rst;
//     output reg[in_buf - 1 : 0] reg_out;
    

//     always @(posedge clk, posedge rst) begin
//         if(rst)
//             reg_out <= input_reg'b0;
//         else if(load_en)
//             reg_out <= reg_in;
//         else if(shift_en)
//             reg_out <= {reg_out[in_buf - 2:0], 1'b0};
//     end 
// endmodule

module multiplier(A, B, result);
    input [input_mult - 1 : 0] A, B;
    output [output_mult : 0] result;

    assign result = A * B;
endmodule

// module shift_register_outbuf(reg_in, shift_en, load_en, init, clk, rst, reg_out);
//     input [in_buf - 1 : 0] reg_in;
//     input shift_en, load_en, init, clk, rst;
//     output reg[out_buf - 1 : 0] reg_out;
    

//     always @(posedge clk, posedge rst) begin
//         if(rst)
//             reg_out <= out_buf'b0;
//         else if(init):
//             reg_out <= out_buf'b0;
//         else if(load_en)
//             reg_out <= {reg_in, in_buf'b0};
//         else if(shift_en)
//             reg_out <= {1'b0, reg_out[out_buf - 1:1]};
//     end 
// endmodule

module up_down_counter(clk, rst, dec_cnt, inc_cnt, init_cnt, zero);
    input clk, rst, dec_cnt, inc_cnt, init_cnt;
    output reg zero;

    reg [up_down_counter - 1 : 0] cnt_out;

    always @(posedge clk, posedge rst) begin
        if(rst)
            cnt_out <= up_down_counter'b0;
        else if(init_cnt)
            cnt_out <= up_down_counter'b0;
        else if(dec_cnt)
            cnt_out <= cnt_out - 1;
        else if(inc_cnt)
            cnt_out <= cnt_out + 1;
    end
    assign zero = |cnt_out;        
endmodule

// module up_counter_8(clk, rst, inc_cnt, init_cnt, cout, cnt_out);
//     input clk, rst, inc_cnt, init_cnt;
//     output reg cout;

//     output reg [up_counter - 1 : 0] cnt_out;

//     always @(posedge clk, posedge rst) begin
//         if(rst)
//             cnt_out <= up_counter'b0;
//         else if(init_cnt)
//             cnt_out <= up_counter'b0;
//         else if(inc_cnt)
//             cnt_out <= cnt_out + 1;
//     end
//     assign cout = ~(|cnt_out);        
// endmodule

module up_counter_16(clk, rst, inc_cnt, init_cnt, cout, cnt_out);
    input clk, rst, inc_cnt, init_cnt;
    output reg cout;

    output reg [up_counter_16 - 1 : 0] cnt_out;

    always @(posedge clk, posedge rst) begin
        if(rst)
            cnt_out <= up_counter_16'b0;
        else if(init_cnt)
            cnt_out <= up_counter_16'b0;
        else if(inc_cnt)
            cnt_out <= cnt_out + 1;
    end
    assign cout = ~(|cnt_out);        
endmodule


