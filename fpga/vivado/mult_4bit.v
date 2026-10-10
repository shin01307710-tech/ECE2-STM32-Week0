module mult_4bit(
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire [7:0] m
);
    assign m = a * b;
endmodule
