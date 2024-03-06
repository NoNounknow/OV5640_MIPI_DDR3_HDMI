module  Post_Raw2Rgb (
    input   wire    I_Clk   ,
    input   wire    I_Rst_n ,

    input   wire         I_V_Sync        ,
    input   wire         I_H_Sync        ,
    input   wire         I_Raw_Vaild     ,
    input   wire [7:0]   I_Raw_Data      ,
    //
    output  wire         O_V_Sync        ,
    output  wire         O_H_Sync        ,
    output  wire         O_RGB_Vaild     ,
    output  wire [7:0]   O_RGB_Data_r    ,  
    output  wire [7:0]   O_RGB_Data_g    ,  
    output  wire [7:0]   O_RGB_Data_b         
);
        reg  [15:0] Row_Cnt      ;
        reg  [15:0] Col_Cnt      ;
        //FIFO
        wire        FIFO_Wr_en   ;
        wire [7:0]  FIFO_Wr_Data ;
        wire        FIFO_Rd_en   ;
        wire [7:0]  FIFO_Rd_data ;

        reg         r1_FIFO_Wr_en   ;
        reg  [7:0]  r1_FIFO_Wr_Data ;
        reg         r1_FIFO_Rd_en   ;
        reg  [7:0]  r1_FIFO_Rd_data ;

        wire        full            ;
        wire        empty           ;
        //Pose
        reg         r1_I_V_Sync     ;
        wire        Pose_I_V_Sync   ;
        wire        Ext_Pose_V_Sync ;
        reg         r1_I_H_Sync     ;
        wire        Pose_I_H_Sync   ;

        //Pixel
        reg [7:0]   RGB_Data_r;
        reg [8:0]   RGB_Data_g;
        reg [7:0]   RGB_Data_b;

    //FIFO
    assign  FIFO_Wr_en   = I_Raw_Vaild;
    assign  FIFO_Wr_Data = I_Raw_Data ;
    assign  FIFO_Rd_en   = (Row_Cnt >= 1)?(FIFO_Wr_en):(1'b0);

    always @(posedge I_Clk) begin
        r1_I_V_Sync     <= I_V_Sync    ;
        r1_I_H_Sync     <= I_H_Sync    ;

        r1_FIFO_Wr_en   <= FIFO_Wr_en  ;
        r1_FIFO_Wr_Data <= FIFO_Wr_Data;
        
        r1_FIFO_Rd_en   <= FIFO_Rd_en  ;
        r1_FIFO_Rd_data <= FIFO_Rd_data;
    end
    assign  Pose_I_V_Sync = (I_V_Sync == 1'b1)&&(r1_I_V_Sync == 1'b0);
    assign  Pose_I_H_Sync = (I_H_Sync == 1'b1)&&(r1_I_H_Sync == 1'b0);

    //Col_Cnt
    always @(posedge I_Clk or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0) begin
            Col_Cnt <= 'd0;
        end else if(Pose_I_H_Sync == 1'b1) begin
            Col_Cnt <= 'd0;
        end else if(FIFO_Wr_en == 1'b1) begin
            Col_Cnt <= Col_Cnt + 1'b1;
        end
    end
    //Row_Cnt
    always @(posedge I_Clk or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0) begin
            Row_Cnt <= 'd0;
        end else if(Pose_I_V_Sync == 1'b1) begin
            Row_Cnt <= 'd0;
        end else if(Pose_I_H_Sync == 1'b1) begin
            Row_Cnt <= Row_Cnt + 1'b1;
        end else begin
            Row_Cnt <= Row_Cnt;
        end
    end

    assign O_RGB_Vaild   = r1_FIFO_Wr_en   ;
    assign O_RGB_Data_r  = RGB_Data_r      ;  
    assign O_RGB_Data_g  = RGB_Data_g[8:1] ;  
    assign O_RGB_Data_b  = RGB_Data_b      ;  
    assign O_V_Sync      = r1_I_V_Sync     ;
    assign O_H_Sync      = r1_I_H_Sync     ;    

    always @(posedge I_Clk or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0) begin
            RGB_Data_r <= 'd0;
            RGB_Data_g <= 'd0;
            RGB_Data_b <= 'd0;
        end else if(FIFO_Wr_en == 1'b1) begin
            case({Row_Cnt[0],Col_Cnt[0]})
            2'b00:begin 
                RGB_Data_r <= r1_FIFO_Rd_data;
                RGB_Data_g <= FIFO_Rd_data + r1_FIFO_Wr_Data;
                RGB_Data_b <= FIFO_Wr_Data;
            end
            2'b01:begin
                RGB_Data_r <= FIFO_Rd_data;
                RGB_Data_g <= FIFO_Wr_Data + r1_FIFO_Rd_data;
                RGB_Data_b <= r1_FIFO_Wr_Data;
            end
            2'b10:begin
                RGB_Data_r <= r1_FIFO_Wr_Data;
                RGB_Data_g <= FIFO_Wr_Data + r1_FIFO_Rd_data;
                RGB_Data_b <= FIFO_Rd_data;
            end
            2'b11:begin
                RGB_Data_r <= FIFO_Wr_Data; 
                RGB_Data_g <= FIFO_Rd_data + r1_FIFO_Wr_Data;
                RGB_Data_b <= r1_FIFO_Rd_data;
            end
            endcase
        end else begin
            RGB_Data_r <= 'd0;
            RGB_Data_g <= 'd0;
            RGB_Data_b <= 'd0;
        end
    end

    data_sync_ext Post_Raw2Rgb_FIFO_Rst(
        .clka			(I_Clk          		),
        .rst_n			(I_Rst_n      	        ),	
        .pulse_a		(Pose_I_V_Sync  		),
        .ext_pulse_a	(Ext_Pose_V_Sync	    )
    );

    S_fifo_w8x2048_r8x2048 your_instance_name (
    .clk    (  I_Clk                      ), // input wire clk
    .srst   ( (Ext_Pose_V_Sync)|(!I_Rst_n)), // input wire srst
    .din    ( I_Raw_Data                  ), // input wire [7 : 0] din
    .wr_en  ( I_Raw_Vaild                 ), // input wire wr_en
    .rd_en  ( FIFO_Rd_en                  ), // input wire rd_en
    .dout   ( FIFO_Rd_data                ), // output wire [7 : 0] dout
    .full   ( ),                             // output wire full
    .empty  ( )                              // output wire empty
    );
endmodule