`timescale 1ns/1ns

module DataPath#(parameter Data_Width, parameter IFMAP_NUM_OF_REG, parameter FILTER_NUM_OF_REG, parameter ADDR_WIDTH_IFMAP, parameter ADDR_WIDTH_FILTER, parameter ELEMENT_WIDTH)
                (clk, rst, wen, );

    wire [ADDR_WIDTH_IFMAP - 1:0] waddr_IFMAP, raddr_IFMAP;
    wire [Data_Width - 1:0] din_IFMAP, dataout_IFMAP;




    RegisterTypeSP #(.NUM_REG(IFMAP_NUM_OF_REG), .DATA_WIDTH(Data_Width), .ADDR_WIDTH(ADDR_WIDTH_IFMAP)) 
                    IFMAP_SP(.clk(clk), .wen(wen), .waddr(waddr_IFMAP), .din(din_IFMAP), .raddr(raddr_IFMAP), .dout(dataout_IFMAP));

    
endmodule