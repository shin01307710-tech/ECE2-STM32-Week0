`timescale 1ns/1ps
module tb;
    reg [3:0] ten,one;
    wire [6:0] bin;
    wire valid;
    integer t,o;
    bcd_conv dut(one,ten,bin,valid);

    initial begin
        for(t=0;t<16;t=t+1)
            for(o=0;o<16;o=o+1) begin
                ten=t; one=o; #1;
                if(valid !== ((t<10)&&(o<10)))
                    $fatal(1,"BCD validity mismatch");
                if(t<10 && o<10 && bin !== t*10+o)
                    $fatal(1,"BCD value mismatch");
            end
        $display("PASS: BCD, 100 valid + 156 invalid");
        $finish;
    end
endmodule
