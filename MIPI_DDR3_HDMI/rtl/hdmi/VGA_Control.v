module VGA_Control #(
    parameter   H_Sync       = 44,
    parameter   H_backporch  = 148 ,
    parameter   H_left       = 0   ,
    parameter   H_data       = 1920,
    parameter   H_right      = 0   ,
    parameter   H_Frontporch = 88  ,
    parameter   H_total      = H_Sync + H_backporch + H_left + H_data + H_right + H_Frontporch,
    parameter   H_width      = $clog2(H_total),
    parameter   V_Sync       = 5,
    parameter   V_backporch  = 36 ,
    parameter   V_left       = 0  ,
    parameter   V_data       = 1080,
    parameter   V_right      = 0  ,
    parameter   V_Frontporch = 4  ,
    parameter   V_total      = V_Sync + V_backporch + V_left + V_data + V_right + V_Frontporch,
    parameter   V_width      = $clog2(V_total),
    parameter   RGB_width    = 24,
    //color
    parameter   RED   = 24'b11111111_00000000_00000000,
    parameter   GRENN = 24'b00000000_11111111_00000000,
    parameter   BLUE  = 24'b00000000_00000000_11111111,
    parameter   white = 24'b11111111_11111111_11111111,
    parameter   black = 24'b00000000_00000000_00000000
)(
    input   wire                        Sys_clk      ,
    input   wire                        Rst_n        ,
    //RGB
    output  wire    [7:0]               Red_Sign     ,
    output  wire    [7:0]               Green_Sign   ,
    output  wire    [7:0]               Blue_Sign    ,
    //Sync
    output  reg                         H_Sync_sign  ,
    output  reg                         V_Sync_sign  ,
    //addr
    output  wire    [H_width-1:0]       H_addr       ,
    output  wire    [V_width-1:0]       V_addr       ,
    //ddr3 rdata fifo
    input   wire    [15:0]              rdata_fifo_rd_data  ,
    output  wire                        rdata_fifo_rd_en   
);

            reg     [H_width-1:0]       H_cnt          ;
            reg     [V_width-1:0]       V_cnt          ;

//          wire    [RGB_width-1:0]     rgb            ;
//          reg                         H_full         ;
//          reg                         V_full         ;
        //background    
            reg     [RGB_width-1:0]     backgroud_color ;
            wire    [7:0]               Concat_R        ;
            wire    [7:0]               Concat_G        ;
            wire    [7:0]               Concat_B        ;
            wire                        Pixl_avai       ;
            
    assign rdata_fifo_rd_en = Pixl_avai                 ;
    assign Concat_R = rdata_fifo_rd_data[7:0];
    assign Concat_G = rdata_fifo_rd_data[7:0];
    assign Concat_B = rdata_fifo_rd_data[7:0];
//Sync
    always@(posedge Sys_clk or negedge Rst_n) begin
        if(Rst_n == 0) begin
            H_Sync_sign <= 1'b1;
        end else if(H_cnt == H_total - 1'b1) begin
            H_Sync_sign <= 1'b1;
        end else if(H_cnt == H_Sync -1'b1) begin
            H_Sync_sign <= 1'b0;
        end
    end
    always@(posedge Sys_clk or negedge Rst_n) begin
        if(Rst_n == 0) begin
            V_Sync_sign <= 1'b1;
        end else if((V_cnt == V_total - 1'b1) && (H_cnt == H_total - 1'b1)) begin
            V_Sync_sign <= 1'b1;
        end else if((V_cnt == V_Sync  - 1'b1) && (H_cnt == H_total - 1'b1)) begin
            V_Sync_sign <= 1'b0;
        end
    end
//backgroud_color
    always@(posedge Sys_clk or negedge Rst_n) begin
        if(Rst_n == 0) begin
            backgroud_color <= white;
        end else if(V_addr >= 0 && V_addr <= ((V_data >> 2'd3) - 1'b1)) begin
            backgroud_color <= RED;
        end else if(V_addr >= (V_data >> 2'd3) 
                 && V_addr <= (V_data >> 2'd2) - 1'b1) begin
            backgroud_color <= GRENN;
        end else if(V_addr >= (V_data >> 2'd2) && (V_addr <= (V_data - 1'b1))) begin
            backgroud_color <= BLUE;
        end else begin
            backgroud_color <= white;
        end
    end
//addr
    assign H_addr    =  (Pixl_avai)?(H_cnt - (H_Sync + H_backporch +  H_left)):10'd0;
    assign V_addr    =  (Pixl_avai)?(V_cnt - (V_Sync + V_backporch +  V_left)):10'd0;
//pixl_able
    assign Pixl_avai = (H_cnt >  (H_Sync + H_backporch  + H_left  -1'b1 ))
                    && (H_cnt <= (H_total- H_Frontporch - H_right -1'b1 )) 
                    && (V_cnt >  (V_Sync + V_backporch +  V_left  -1'b1 ))
                    && (V_cnt <= (V_total- V_Frontporch - V_right -1'b1 ));
//RGB
    assign {Red_Sign,Green_Sign,Blue_Sign} = (Pixl_avai) ? {Concat_R,Concat_G, Concat_B} : backgroud_color;
    // assign rgb = {Concat_R,Concat_G, Concat_B};
//CNT_H_V
    always@(posedge Sys_clk or negedge Rst_n) begin
        if(Rst_n == 0) begin
            H_cnt <= 0;
        end else if(H_cnt == H_total - 1'b1) begin
            H_cnt <= 0;
        end else begin
            H_cnt <= H_cnt + 1'b1;
        end
    end
//    always@(posedge Sys_clk or negedge Rst_n) begin
//        if(Rst_n == 0) begin
//            H_full <= 1'b0;
//        end else if(H_cnt == H_total - 1'b1) begin
//            H_full <= 1'b1;
//        end else begin
//            H_full <= 1'b0;
//        end
//    end
    always@(posedge Sys_clk or negedge Rst_n) begin
        if(Rst_n == 0) begin
            V_cnt <= 0;
        end else if((V_cnt == V_total - 1'b1) && (H_cnt == H_total - 1'b1)) begin
            V_cnt <= 0;
        end else if(H_cnt == H_total - 1'b1) begin
            V_cnt <= V_cnt + 1'b1;
        end else begin
            V_cnt <= V_cnt;
        end
    end
//    always@(posedge Sys_clk or negedge Rst_n) begin
//        if(Rst_n == 0) begin
//            V_full <= 1'b0;
//        end else if((V_cnt == V_total - 1'b1) && (H_cnt == H_total - 1'b1)) begin
//            V_full <= 1'b1;
//        end else begin
//            V_full <= 1'b0;
//        end
//    end
endmodule