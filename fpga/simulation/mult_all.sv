`timescale 1ns/1ps

module mult_4bit(
    input wire [3:0] a, b,
    output wire [7:0] m
);
    assign m = a * b;
endmodule

module tb;
    reg [3:0] a, b;
    wire [7:0] m;
    integer x, y;

    mult_4bit dut(a, b, m);

    initial begin
        $dumpfile("mult_wave.vcd");
        $dumpvars(0, tb);

        for(x=0; x<16; x=x+1)
            for(y=0; y<16; y=y+1) begin
                a=x;
                b=y;
                #10;
                if(m !== x*y)
                    $fatal(1, "Multiplier error: %0d * %0d", x, y);
            end

        $display("PASS: Multiplier - 256 combinations");
        $finish;
    end
endmodule