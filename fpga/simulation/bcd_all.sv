`timescale 1ns/1ps

module bcd_conv(
    input wire [3:0] one, ten,
    output wire [6:0] bin,
    output wire valid
);
    assign bin = ten * 7'd10 + one;
    assign valid = (ten <= 9) && (one <= 9);
endmodule

module tb;
    reg [3:0] ten, one;
    wire [6:0] bin;
    wire valid;
    integer t, o;

    bcd_conv dut(one, ten, bin, valid);

    initial begin
        $dumpfile("bcd_wave.vcd");
        $dumpvars(0, tb);

        for(t=0; t<16; t=t+1)
            for(o=0; o<16; o=o+1) begin
                ten=t;
                one=o;
                #10;

                if(valid !== ((t<10)&&(o<10)))
                    $fatal(1, "BCD valid error");

                if(t<10 && o<10 && bin !== t*10+o)
                    $fatal(1, "BCD conversion error");
            end

        $display("PASS: BCD - 256 combinations");
        $finish;
    end
endmodule