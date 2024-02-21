module MEMORY_CONTROLLER
#(
  parameter ADDR_W = 17,
  parameter DATA_W = 8
)
(
    input       sysclk,
    input       FPGA_BUSY,
    input [1:0] FPGA_STATE,
    input [1:0] SRAM_STATE,
    input [1:0] FLASH_STATE,
    input [1:0] CPU_STATE
);


localparam STATE_IDLE      = 0;
localparam STATE_READ      = 1;
localparam STATE_WRITE     = 2;

localparam TRI_HI_Z        =1'bZ;

reg [1:0] DEVICE_SEL = 0;

always @ (posedge sysclk)
  begin
    
  end

always @ (DEVICE_SEL)
  begin
    
  end

endmodule




/*

if

*/
