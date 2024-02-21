
`timescale 1ns / 1ps

module adderTB();

reg a   = 0;
reg b   = 0;
reg cin = 0;

wire c;
wire cout;

adder A (.a(a),.b(b),.cin(cin),.c(c),.cout(cout));

initial 

begin

    $dumpfile("hi_tb.vcd");
    $dumpvars(6,adderTB);

#10 a   = 1;
#10 b   = 1;
#10 cin = 1;
#10 b   = 0;
#10 cin = 0;
end

endmodule