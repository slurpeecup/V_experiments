

module  adder (
    input   a,
            b,
            cin, 
    output  c, 
            cout
            );
    
assign c = ((a^b) ^ (cin));
assign cout = ((a & b) | (cin & (a^b)));

endmodule 