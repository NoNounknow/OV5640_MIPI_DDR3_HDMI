module wdata_rdata_fifo #(
    parameter   IW_WIDTH = 40,
    parameter   OW_WIDTH = 128,
    parameter   IR_WIDTH = 128,
    parameter   OR_WIDTH = 16 ,
    parameter   wr_Brust_Length = 240,
    parameter   Rd_Brust_Length = 240
)(
    input   wire            Rst_n                    ,
    input   wire            rd_fifo_rst              ,
    input   wire            wr_fifo_rst              ,
     
    input   wire            wdata_fifo_wr_clk        ,
    input   wire            wdata_fifo_rd_clk        ,
    input   wire            wdata_fifo_wr_vaild      ,
    input   wire    [IW_WIDTH-1:0]   
                            wdata_fifo_wr_data       ,
    input   wire            wdata_fifo_rd_en         ,
    output  wire    [OW_WIDTH-1:0] 
                            wdata_fifo_rd_data       ,

    input   wire            rdata_fifo_wr_clk   ,
    input   wire            rdata_fifo_rd_clk   ,
    input   wire            rdata_fifo_wr_en    ,
    input   wire    [IR_WIDTH-1:0] 
                            rdata_fifo_wr_data  ,
    input   wire            rdata_fifo_rd_en    ,
    output  wire    [OR_WIDTH-1:0]  
                            rdata_fifo_rd_data  ,

    // output  wire    [127:0] O_Pixel_Data        ,
    // output  wire            O_Pixel_Vaild       ,

    output  wire            Wr_req              ,
    output  wire            Rd_req              ,
    output  wire            Rd_Start            
);
            wire    [63:0]  Pixel_Data          ;
            reg     [4:0]   Data_length         ;
            reg     [127:0] Concat_Data         ;
            reg             Concat_Done         ;
            wire    [20:0]  rd_data_count       ;
            wire    [20:0]  wr_data_count       ;
            reg             r_Rd_Start          ;

    // assign  O_Pixel_Data  = Concat_Data;
    // assign  O_Pixel_Vaild = Concat_Done;

    assign Wr_req = (rd_data_count >= wr_Brust_Length)?1'b1:1'b0;
    assign Rd_req = (wr_data_count < (Rd_Brust_Length<<1)-4)?1'b1:1'b0;
    assign Rd_Start =  r_Rd_Start ;
    always @(posedge rdata_fifo_rd_clk or negedge Rst_n) begin
        if(Rst_n == 1'b0) begin
            r_Rd_Start <= 1'b0;
        end else if(Rd_req == 1'b1) begin
            r_Rd_Start <= 1'b1;
        end else begin
            r_Rd_Start <= r_Rd_Start;
        end
    end

    assign Pixel_Data =  {wdata_fifo_wr_data[39:32], wdata_fifo_wr_data[39:32],
                          wdata_fifo_wr_data[29:22], wdata_fifo_wr_data[29:22],
                          wdata_fifo_wr_data[19:12], wdata_fifo_wr_data[19:12],
                          wdata_fifo_wr_data[09:02], wdata_fifo_wr_data[09:02]};

    always @(posedge wdata_fifo_wr_clk or negedge Rst_n) begin
        if(Rst_n == 'd0) begin
            Data_length <= 'd0;
        end else if(Data_length == 'd1 && wdata_fifo_wr_vaild) begin
            Data_length <= 'd0;
        end else if(wdata_fifo_wr_vaild) begin
            Data_length <= Data_length + 1'b1;
        end
    end
    always @(posedge wdata_fifo_wr_clk or negedge Rst_n) begin
        if(Rst_n == 'd0) begin
            Concat_Data <= 'd0;
        end else if(wdata_fifo_wr_vaild) begin
            Concat_Data <= {Concat_Data[0+:64],Pixel_Data};
        end
    end
    always @(posedge wdata_fifo_wr_clk or negedge Rst_n) begin
        if(Rst_n == 'd0) begin
            Concat_Done <= 'd0;
        end else if(Data_length == 'd1 && wdata_fifo_wr_vaild) begin
            Concat_Done <= 1'b1;
        end else begin
            Concat_Done <= 'd0;
        end
    end
    

    //wr sync
    reg              r_wr_fifo_rst      ;
    wire             Pose_wr_fifo_rst   ;
    wire             Ext_wr_fifo_rst    ;   

    always@(posedge wdata_fifo_wr_clk)
        if(!Rst_n)
            r_wr_fifo_rst <= 1'd0;
        else 
            r_wr_fifo_rst <= wr_fifo_rst;
    assign  Pose_wr_fifo_rst = (wr_fifo_rst)&&(!r_wr_fifo_rst);

    data_sync_ext wr_data_sync_ext(
        .clka			(wdata_fifo_wr_clk		),
        .rst_n			(Rst_n      	        ),	
        .pulse_a		(Pose_wr_fifo_rst		),
        .ext_pulse_a	(Ext_wr_fifo_rst	    )
    );


    //rd sync
    reg              r_rd_fifo_rst      ;
    wire             Pose_rd_fifo_rst   ;
    wire             Ext_rd_fifo_rst    ;

    always@(posedge rdata_fifo_rd_clk)
        if(!Rst_n)
            r_rd_fifo_rst <= 1'd0;
        else 
            r_rd_fifo_rst <= rd_fifo_rst;
    assign  Pose_rd_fifo_rst = (rd_fifo_rst)&&(!r_rd_fifo_rst);

    data_sync_ext rd_data_sync_ext(
        .clka			(rdata_fifo_rd_clk		),
        .rst_n			(Rst_n      	        ),	
        .pulse_a		(Pose_rd_fifo_rst		),
        .ext_pulse_a	(Ext_rd_fifo_rst	    )
    );

    wdata_fifo wdata_fifo (
    .rst          ( Ext_wr_fifo_rst      ), // input wire rst
    .wr_clk       ( wdata_fifo_wr_clk    ), // input wire wr_clk
    .rd_clk       ( wdata_fifo_rd_clk    ), // input wire rd_clk
    .din          ( Concat_Data          ), // input wire [127 : 0] din
    .wr_en        ( Concat_Done          ), // input wire wr_en
    .rd_en        ( wdata_fifo_rd_en     ), // input wire rd_en
    .dout         ( wdata_fifo_rd_data   ), // output wire [127 : 0] dout
    .full         (                      ), // output wire full
    .empty        (                      ), // output wire empty
    .rd_data_count(rd_data_count),          // output wire [5 : 0] rd_data_count
    .wr_rst_busy(),      // output wire wr_rst_busy
    .rd_rst_busy()      // output wire rd_rst_busy
    );

    rdata_fifo rdata_fifo (
    .rst          ( Ext_rd_fifo_rst       ), // input wire rst
    .wr_clk       ( rdata_fifo_wr_clk     ), // input wire wr_clk
    .rd_clk       ( rdata_fifo_rd_clk     ), // input wire rd_clk
    .din          ( rdata_fifo_wr_data    ), // input wire [127 : 0] din
    .wr_en        ( rdata_fifo_wr_en      ), // input wire wr_en
    .rd_en        ( rdata_fifo_rd_en      ), // input wire rd_en
    .dout         ( rdata_fifo_rd_data    ), // output wire [15 : 0] dout
    .full         (                       ), // output wire full
    .empty        (                       ), // output wire empty
    .wr_data_count(wr_data_count),    // output wire [5 : 0] wr_data_count
    .wr_rst_busy(),                   // output wire wr_rst_busy
    .rd_rst_busy()                    // output wire rd_rst_busy
    );
endmodule