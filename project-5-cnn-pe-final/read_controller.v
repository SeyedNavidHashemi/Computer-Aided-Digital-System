`timescale 1ns/1ns

module ReadController(clk, rst, valid, permission, req_buffer, wen_SP, inc_write_cnt);

    input clk, valid, permission;
    output req_buffer, wen_SP, inc_write_cnt;

    reg[1:0] ps, ns;
    parameter[0:1]
    Wait = 0, S2 = 1, Write = 2, UpCnt = 3;

    always @(*) begin
        case(ps)
            Wait: ns = valid ? S2 : Wait;
            S2: ns = permission ? Write : S2;
            Write: ns = UpCnt;
            UpCnt: ns = Wait; 
        endcase
    end
    
    always @(ps) begin
        {req_buffer, wen_SP, inc_write_cnt} = 3'b000;
        case(ps)
            Wait: ;
            S2: ;
            Write: {req_buffer, wen_SP} = 2'b11;
            UpCnt: inc_write_cnt = 1'b1; 
        endcase
    end

    always @(posedge clk) begin
        if(rst)
            ps <= Wait;
        else
            ps <= ns;
    end
    
endmodule