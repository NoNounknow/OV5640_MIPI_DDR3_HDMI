module test_dma (
    input   wire                I_Clk               ,
    input   wire                Rst                 ,
    input   wire    [127:0]     wdata_fifo_wr_data  ,
    input   wire                wdata_fifo_wr_vaild ,
    input   wire                wdata_fifo_rd_en    ,
    input   wire    [127:0]     wdata_fifo_rd_data  ,
    input   wire    [127:0]     wdata_fifo_rd_data  ,
    input   wire                rdata_fifo_Wr_en    ,
    input   wire    [127:0]     rdata_fifo_wr_data  ,
    input   wire                rdata_fifo_rd_en    ,
    input   wire    [015:0]     rdata_fifo_rd_data  ,
    input   wire                Aw_Wr_trigger       ,
    input   wire                R_Rd_trigger        ,
    input   wire                VGA_Sync            ,
    input   wire                Mipi_Unpacket_V_sync,
    input   wire                clk_PIXEL           ,
    input   wire    [32:0]      waddr               ,
    input   wire    [32:0]      raddr               
);
            reg [15:0]  hcnt                    ;
            reg [15:0]  vcnt                    ;
            reg         r_rdata_fifo_rd_en      ;
            wire        Pose_rdata_fifo_rd_en   ;
    always@(posedge clk_PIXEL) begin
        r_rdata_fifo_rd_en <= rdata_fifo_rd_en;
    end
    assign  Pose_rdata_fifo_rd_en = (rdata_fifo_rd_en == 1'b0)&7(r_rdata_fifo_rd_en == 1'b1);
    always@(posedge clk_PIXEL or negedge Rst) begin
        if(Rst == 1'b0) begin
            hcnt <= 'd0;
        end else if(rdata_fifo_rd_en == 1'b1) begin
            hcnt <= hcnt + 1'b1;
        end else begin
            hcnt <= 'd0;
        end
    end

    always@(posedge clk_PIXEL or negedge Rst) begin
        if(Rst == 1'b0) begin
            vcnt <= 'd0;
        end else if(Pose_rdata_fifo_rd_en == 1'b1) begin
            vcnt <= vcnt + 1'b1;
        end else if(VGA_Sync == 1'b1) begin
            vcnt <= 'd0;
        end else begin
            vcnt <= vcnt;
        end
    end

ila_1 ila_1 (
	.clk(I_Clk), // input wire clk
	.probe0 (    hcnt                ),  
	.probe1 (    vcnt                ),  
    .probe2 (    wdata_fifo_wr_data  ),        
    .probe3 (    wdata_fifo_wr_vaild ),        
    .probe4 (    wdata_fifo_rd_en    ),        
    .probe5 (    wdata_fifo_rd_data  ),        
    .probe6 (    wdata_fifo_rd_data  ),        
    .probe7 (    rdata_fifo_Wr_en    ),        
    .probe8 (    rdata_fifo_wr_data  ),        
    .probe9 (    rdata_fifo_rd_en    ),        
    .probe10 (    rdata_fifo_rd_data  ),        
    .probe11 (    Aw_Wr_trigger       ),        
    .probe12 (    R_Rd_trigger        ),        
    .probe13 (    VGA_Sync            ),        
    .probe14 (    Mipi_Unpacket_V_syn ),        
    .probe15 (    clk_PIXEL           ),        
    .probe16 (    waddr               ),        
    .probe17 (    raddr               )    

);

endmodule