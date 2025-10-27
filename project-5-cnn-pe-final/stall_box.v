module StallBox #(parameter CONFIG_BIT = 4)
(WriteAddr, ReadAddr, permission, OK, stall);

    input permission;
    input[CONFIG_BIT-1:0] WriteAddr, ReadAddr;
    output reg OK, stall;

    always @(*) begin
        if(WriteAddr == ReadAddr) begin
            if(permission) begin
                OK = 1;
                stall = 0;
            end
            else begin
                OK = 0;
                stall = 1;    
            end
        end
        else begin
            OK = 1;
            stall = 0;
        end
    end
endmodule