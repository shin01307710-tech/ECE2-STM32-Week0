`timescale 1ns/1ps
module tb;
    reg [3:0] a,b;
    wire [7:0] m;
    integer x,y;
    mult_4bit dut(a,b,m);
    initial begin
        for(x=0;x<16;x=x+1)
            for(y=0;y<16;y=y+1) begin
                a=x; b=y; #1;
                if(m !== x*y)
                    $fatal(1,"Multiplier mismatch");
            end
        $display("PASS: multiplier, 256 input pairs");
        $finish;
    end
endmodule
