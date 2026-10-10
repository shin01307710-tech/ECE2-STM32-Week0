module bcd_conv(
    input  wire [3:0] ten,
    input  wire [3:0] one,
    output wire [6:0] bin,
    output wire       valid
);
    assign bin = ten * 7'd10 + one;
    assign valid = (ten <= 4'd9) && (one <= 4'd9);
endmodule
