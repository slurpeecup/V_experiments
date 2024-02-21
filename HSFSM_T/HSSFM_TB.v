`define DUMPSTR(x) `"x.vcd`"
module HSSFM_TB
(
);


reg sysclk = 0;

wire [1:0] sus1;
wire [1:0] sus2;
wire [7:0] events;

HSSFM HSSFM1 (.sysclk (sysclk), .sus1 (sus1), .sus2(sus2),.EVENT_CTR(events));

always #1 sysclk = ~sysclk;


initial 
begin
  $dumpfile("HSSFM_TB.vcd");
  $dumpvars(2, HSSFM_TB);
  #1000
  $finish;
end
endmodule