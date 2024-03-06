module  lane_align(
        // system signals
        input                   sclk                    ,       
        input                   s_rst_n                 ,       
        // MIPI Lane Data
        input           [ 7:0]  lane0_byte_data         ,       
        input           [ 7:0]  lane1_byte_data         ,       
        input                   lane0_byte_vld          ,       
        input                   lane1_byte_vld          ,       
        // 
        output  reg     [15:0]  word_data               ,       
        output  reg             word_vld                ,       
        input                   packet_done             ,             
        output  reg             invalid_start                  
);

//========================================================================\
// =========== Define Parameter and Internal signals =========== 
//========================================================================/
localparam      LANE0_FIRST     =       2'b01                   ;
localparam      LANE1_FIRST     =       2'b10                   ;
localparam      NONE_FIRST      =       2'b11                   ;


wire                            lane_vld_or                     ;       
reg                             lane_vld_or_r1                  ;       
wire                            lane_vld_or_pos                 ;       
reg                             lane_vld_or_pos_r1              ;       
        
reg     [ 7:0]                  lane0_byte_data_r1              ;       
reg     [ 7:0]                  lane1_byte_data_r1              ;       
reg                             lane0_byte_vld_r1               ;       
reg                             lane1_byte_vld_r1               ;       
reg     [ 1:0]                  tap                             ;       

wire                            lane_vld_and                    ;       

//=============================================================================
//**************    Main Code   **************
//=============================================================================

always  @(posedge sclk) begin
        lane0_byte_data_r1      <=      lane0_byte_data;
        lane1_byte_data_r1      <=      lane1_byte_data;
        lane0_byte_vld_r1       <=      lane0_byte_vld;
        lane1_byte_vld_r1       <=      lane1_byte_vld;
        lane_vld_or_pos_r1      <=      lane_vld_or_pos;
        lane_vld_or_r1          <=      lane_vld_or;
end

assign  lane_vld_or     =       lane0_byte_vld | lane1_byte_vld;
assign  lane_vld_or_pos =       lane_vld_or & (~lane_vld_or_r1);
assign  lane_vld_and    =       lane0_byte_vld & lane1_byte_vld;

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                tap     <=      NONE_FIRST;
        else if(lane_vld_or_pos == 1'b1)
                tap     <=      {lane1_byte_vld, lane0_byte_vld};
end

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                invalid_start   <=      1'b0;
        else if(lane_vld_or_pos_r1 == 1'b1 && lane_vld_and == 1'b0)
                invalid_start   <=      1'b1;
        else
                invalid_start   <=      1'b0;
end

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                word_vld        <=      1'b0;
        else if(packet_done == 1'b1)
                word_vld        <=      1'b0;
        else if(lane_vld_or_pos_r1 == 1'b1 && lane_vld_and == 1'b1)
                word_vld        <=      1'b1;
end

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0) begin
                word_data       <=      16'h0;
        end
        else case(tap)
                LANE0_FIRST: begin
                        word_data       <=      {lane1_byte_data, lane0_byte_data_r1};                  
                end
                LANE1_FIRST: begin
                        word_data       <=      {lane1_byte_data_r1, lane0_byte_data};                  
                end
                NONE_FIRST: begin
                        word_data       <=      {lane1_byte_data_r1, lane0_byte_data_r1};                  
                end
                default: begin
                        word_data       <=      {lane1_byte_data_r1, lane0_byte_data_r1};                  
                end
        endcase
end




endmodule
