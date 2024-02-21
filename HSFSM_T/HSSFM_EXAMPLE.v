module HSSFM
(
  input        sysclk,
  output [1:0] sus1,
  output [1:0] sus2,
  output [7:0] EVENT_CTR
);



localparam IDLE        = 2'b00;
localparam RUN         = 2'b01;
localparam STALL       = 2'b10;
localparam ERR         = 2'b11;

reg [1:0] MASTER_STATE = 2'b00;


localparam SUBSTATE_RUNNING    = 2'b10;
localparam SUBSTATE_THINKING   = 2'b01;
localparam SUBSTATE_IDLE       = 2'b00;

reg [1:0] SUBSTATE_1 = 2'b00;
reg [1:0] SUBSTATE_2 = 2'b00;

reg [5:0] ticker     = 0;
reg [7:0] EVENT_CTR  = 0;    

always @ (posedge sysclk)
  begin
    if (ticker < 15)
      begin
      ticker = ticker  + 1;
        
      end
    else if (ticker >= 15)
      begin
        ticker       = 0;
        MASTER_STATE = MASTER_STATE + 1;
      end
  EVENT_CTR = EVENT_CTR + 1;
  end

always @ (MASTER_STATE)
  begin
    if (MASTER_STATE == IDLE)
      begin
        SUBSTATE_1 = SUBSTATE_IDLE;
        SUBSTATE_2 = SUBSTATE_RUNNING;
      end
    else if (MASTER_STATE == STALL)
      begin
        SUBSTATE_1 = SUBSTATE_RUNNING;
        SUBSTATE_2 = SUBSTATE_IDLE;
      end
  end

assign sus1 = SUBSTATE_1;
assign sus2 = SUBSTATE_2;

endmodule