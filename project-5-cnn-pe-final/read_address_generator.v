module ReadAddress #(parameter CONFIG_BIT = 4)
(BaseAddr, ParAddr, ReadAddr);

    input[CONFIG_BIT - 1:0] BaseAddr, ParAddr;
    output [CONFIG_BIT - 1:0] ReadAddr;

    assign ReadAddr = BaseAddr + ParAddr;
endmodule