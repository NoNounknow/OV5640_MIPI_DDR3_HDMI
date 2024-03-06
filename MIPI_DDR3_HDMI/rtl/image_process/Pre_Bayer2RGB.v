module Pre_Bayer2RGB #(
    parameter   Image_width = 1920,
    parameter   Image_Higth = 1080,
    parameter   Pixel_Num = 4     ,
    parameter   Col_Max = Image_width/Pixel_Num,
    parameter   I_w = 40
)(
    input   wire                           I_CLK   ,
    input   wire                           I_Rst_n ,
    input   wire                           I_Mipi_Unpacket_V_sync      ,
    input   wire [I_w-1:0]                 I_Mipi_raw10_depacker_Data  ,
    input   wire                           I_Mipi_raw10_depacker_Vaild ,
    output  reg                            O_RGB_Vaild                 ,
    output  wire [63:0]                    O_RGB_Data                   
);
            reg  [12:0]         Row_Cnt_wr     ;
            reg  [12:0]         Row_Cnt_rd     ;
            reg  [12:0]         Col_Cnt_wr     ;          
            reg  [12:0]         Col_Cnt_rd     ;   

        //FIFO
           wire                 FIFO_Wr_EN     ;
            reg                 r_FIFO_Wr_EN   ;
            reg                 rr_FIFO_Wr_EN  ;
           wire  [31:0]         FIFO_Wr_Data   ;
            reg  [31:0]         r1_FIFO_Wr_Data;
            reg  [31:0]         r2_FIFO_Wr_Data;
            reg                 FIFO_Rd_EN     ;
            reg                 r_FIFO_Rd_EN   ;
            reg                 rr_FIFO_Rd_EN  ;
           wire  [31:0]         FIFO_Rd_Data   ;
            reg  [31:0]         r_FIFO_Rd_Data ;
        //Pixel
            reg  [23:0]         Pixel   [3:0]  ;
            reg                 Pixel_flag     ;
        //FIFO 
            wire                full           ;
            wire                empty          ;
            wire                wr_rst_busy    ;
            wire                rd_rst_busy    ;
            reg                 Padding_Lock   ;
            reg [2:0]           Padding_Locking;
    //Col_Cnt_wr
    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0) begin
            Col_Cnt_wr <= 'd0;
        end else if(I_Mipi_Unpacket_V_sync == 1'b1) begin
            Col_Cnt_wr <= 'd0;
        end else if(I_Mipi_raw10_depacker_Vaild == 1'b1) begin
            if(Col_Cnt_wr == Col_Max - 1'b1) begin
                Col_Cnt_wr <= 'd0;
            end else begin
                Col_Cnt_wr <= Col_Cnt_wr + 1'b1;
            end
        end else begin
            Col_Cnt_wr <= Col_Cnt_wr;
        end
    end 

    //Row_Cnt_wr
    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0) begin
            Row_Cnt_wr <= 'd0;
        end else if(I_Mipi_Unpacket_V_sync == 1'b1) begin
            Row_Cnt_wr <= 'd0;
        end else if(I_Mipi_raw10_depacker_Vaild == 1'b1 && Col_Cnt_wr == Col_Max - 1'b1) begin
            if(Row_Cnt_wr == Image_Higth - 1'b1) begin
                Row_Cnt_wr <= 'd0;
            end else begin
                Row_Cnt_wr <= Row_Cnt_wr + 1'b1;
            end
        end else begin
            Row_Cnt_wr <= Row_Cnt_wr;
        end
    end 

    //Col_Cnt_rd:
    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0) begin
            Col_Cnt_rd <= 'd0;
        end else if(I_Mipi_Unpacket_V_sync == 1'b1) begin
            Col_Cnt_rd <= 'd0;
        end else if(FIFO_Rd_EN == 1'b1) begin
            if(Col_Cnt_rd == Col_Max - 1'b1) begin
                Col_Cnt_rd <= 'd0;
            end else begin
                Col_Cnt_rd <= Col_Cnt_rd + 1'b1;
            end
        end else begin
            Col_Cnt_rd <= Col_Cnt_rd;
        end
    end 

    //Row_Cnt_rd 
    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0) begin
            Row_Cnt_rd <= 'd0;
        end else if(I_Mipi_Unpacket_V_sync == 1'b1) begin
            Row_Cnt_rd <= 'd0;
        end else if(FIFO_Rd_EN == 1'b1 && Col_Cnt_rd == Col_Max - 1'b1) begin 
            if(Row_Cnt_rd == Image_Higth - 1'd1) begin
                Row_Cnt_rd <= 'd0;
            end else begin
                Row_Cnt_rd <= Row_Cnt_rd + 1'b1;
            end
        end else begin
            Row_Cnt_rd <= Row_Cnt_rd;
        end
    end 

    //Pixel_flag
    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0) begin
            Pixel_flag <= 1'b0;
        end else if(I_Mipi_Unpacket_V_sync == 1'b1) begin
            Pixel_flag <= 1'b0;
        end else if(FIFO_Rd_EN == 1'b1 && Col_Cnt_rd == Col_Max - 1'b1) begin
            Pixel_flag <= ~Pixel_flag;
        end else begin
            Pixel_flag <= Pixel_flag;
        end
    end 

    //FIFO
        assign   FIFO_Wr_EN   =  I_Mipi_raw10_depacker_Vaild ;//·½±ãpadding
        assign   FIFO_Wr_Data = {I_Mipi_raw10_depacker_Data[32+:8],
                                 I_Mipi_raw10_depacker_Data[22+:8],
                                 I_Mipi_raw10_depacker_Data[12+:8],
                                 I_Mipi_raw10_depacker_Data[02+:8]}; 

    //FIFO_Rd_EN
    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0) begin
            FIFO_Rd_EN <= 1'b0;
        end else if(FIFO_Rd_EN == 1'b1 && Col_Cnt_rd == Col_Max - 1'b1) begin
            FIFO_Rd_EN <= 1'b0;
        end else if((Row_Cnt_wr > 'd0) && (I_Mipi_raw10_depacker_Vaild == 1'b1)) begin
            FIFO_Rd_EN <= 1'b1;
        end else begin
            FIFO_Rd_EN <= FIFO_Rd_EN;
        end
    end 

    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0) begin
            r_FIFO_Rd_EN  <= 'd0;
            rr_FIFO_Rd_EN <= 'd0;
            r_FIFO_Wr_EN  <= 'd0;
            rr_FIFO_Wr_EN <= 'd0;
        end else begin
            r_FIFO_Rd_EN  <= FIFO_Rd_EN  ;
            rr_FIFO_Rd_EN <= r_FIFO_Rd_EN;
            r_FIFO_Wr_EN  <= FIFO_Wr_EN  ;
            rr_FIFO_Wr_EN <= r_FIFO_Wr_EN;
        end
    end 

    //reg
    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0) begin
            r1_FIFO_Wr_Data <= 'd0;
            r_FIFO_Rd_Data <= 'd0;
            r2_FIFO_Wr_Data <= 'd0;
        end else if(I_Mipi_Unpacket_V_sync == 1'b1) begin
            r1_FIFO_Wr_Data <= 'd0;
            r_FIFO_Rd_Data <= 'd0;
            r2_FIFO_Wr_Data <= 'd0;
        end else begin
            r1_FIFO_Wr_Data <= FIFO_Wr_Data;
            r_FIFO_Rd_Data <= FIFO_Rd_Data;
            r2_FIFO_Wr_Data<= r1_FIFO_Wr_Data;
        end
    end 

    //Padding
    always @(posedge I_CLK) begin
        Padding_Locking <= {Padding_Locking[1:0],Padding_Lock};
    end
    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0) begin
            Padding_Lock <= 1'b0;
        end else if(rr_FIFO_Rd_EN == 1'b1 && r_FIFO_Rd_EN == 1'b0) begin
            Padding_Lock <= 1'b1;
        end else if(Padding_Locking[2] == 1'b1) begin
            Padding_Lock <= 1'b0;
        end
    end 

    //Pixel
    always @(*) begin
        if(Padding_Lock != 1'b1) begin
            if(Row_Cnt_wr >'d0) begin
                O_RGB_Vaild <= rr_FIFO_Rd_EN;
            end else if(Row_Cnt_wr == 'd0)begin
                O_RGB_Vaild <= rr_FIFO_Wr_EN;
            end        
        end else if(Padding_Lock == 1'b1) begin
            if(Padding_Locking[1] == 1'b1) begin
                O_RGB_Vaild <= 1'b1;
            end else begin
                O_RGB_Vaild <= 1'b0;
            end
        end else begin
            O_RGB_Vaild <= 1'b0;
        end
    end
    assign  O_RGB_Data  = (O_RGB_Vaild)?
                          ({{Pixel[0][23-:5],Pixel[0][15-:6],Pixel[0][7-:5]},
                           {Pixel[1][23-:5],Pixel[1][15-:6],Pixel[1][7-:5]},
                           {Pixel[2][23-:5],Pixel[2][15-:6],Pixel[2][7-:5]},
                           {Pixel[3][23-:5],Pixel[3][15-:6],Pixel[3][7-:5]}}):(64'd0);

    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0) begin
            Pixel[0] <= 24'd0;     
            Pixel[1] <= 24'd0;   
            Pixel[2] <= 24'd0;  
            Pixel[3] <= 24'd0;
        end else if(Padding_Lock == 1'b1) begin
            Pixel[0] = {r2_FIFO_Wr_Data[16+:8],
                    (r_FIFO_Rd_Data[16+:8]+r2_FIFO_Wr_Data[24+:08])>>1,
                        r_FIFO_Rd_Data[24+:8]};
            Pixel[1] = {r2_FIFO_Wr_Data[16+:8],
                    (r_FIFO_Rd_Data[16+:8]+r2_FIFO_Wr_Data[08+:08])>>1,
                        r_FIFO_Rd_Data[08+:8]};
            Pixel[2] = {r2_FIFO_Wr_Data[00+:8],
                    (r_FIFO_Rd_Data[00+:8]+r2_FIFO_Wr_Data[08+:08])>>1,
                        r_FIFO_Rd_Data[08+:8]};
            Pixel[3] = {r2_FIFO_Wr_Data[00+:8],
                    (r_FIFO_Rd_Data[00+:8]+  r1_FIFO_Wr_Data[24+:08])>>1,
                        FIFO_Rd_Data[24+:8]};
        end else if(Padding_Lock == 1'b0) begin
                if((Row_Cnt_wr > 'd0) && (r_FIFO_Rd_EN == 1'b1)) begin
                    case (Pixel_flag)
                        1'b0:begin
                            Pixel[0] = {r2_FIFO_Wr_Data[16+:8],
                                    (r_FIFO_Rd_Data[16+:8]+r2_FIFO_Wr_Data[24+:08])>>1,
                                        r_FIFO_Rd_Data[24+:8]};
                            Pixel[1] = {r2_FIFO_Wr_Data[16+:8],
                                    (r_FIFO_Rd_Data[16+:8]+r2_FIFO_Wr_Data[08+:08])>>1,
                                        r_FIFO_Rd_Data[08+:8]};
                            Pixel[2] = {r2_FIFO_Wr_Data[00+:8],
                                    (r_FIFO_Rd_Data[00+:8]+r2_FIFO_Wr_Data[08+:08])>>1,
                                        r_FIFO_Rd_Data[08+:8]};
                            Pixel[3] = {r2_FIFO_Wr_Data[00+:8],
                                    (r_FIFO_Rd_Data[00+:8]+  r1_FIFO_Wr_Data[24+:08])>>1,
                                        FIFO_Rd_Data[24+:8]};
                        end
                        1'b1:begin
                            Pixel[0] = {r_FIFO_Rd_Data[16+:8],
                                    (r_FIFO_Rd_Data[24+:8]+r2_FIFO_Wr_Data[16+:08])>>1,
                                        r2_FIFO_Wr_Data[24+:8]};
                            Pixel[1] = {r_FIFO_Rd_Data[16+:8],
                                    (r_FIFO_Rd_Data[08+:8]+r2_FIFO_Wr_Data[16+:08])>>1,
                                        r2_FIFO_Wr_Data[08+:8]};
                            Pixel[2] = {r_FIFO_Rd_Data[00+:8],
                                    (r_FIFO_Rd_Data[08+:8]+r2_FIFO_Wr_Data[00+:08])>>1,
                                        r2_FIFO_Wr_Data[08+:8]};
                            Pixel[3] = {r_FIFO_Rd_Data[00+:8],
                                    (r2_FIFO_Wr_Data[00+:8]+  FIFO_Rd_Data[24+:08])>>1,
                                        r1_FIFO_Wr_Data[24+:8]};
                        end
                        default: begin
                            Pixel[0] = {r2_FIFO_Wr_Data[16+:8],
                                    (r_FIFO_Rd_Data[16+:8]+r2_FIFO_Wr_Data[24+:08])>>1,
                                        r_FIFO_Rd_Data[24+:8]};
                            Pixel[1] = {r2_FIFO_Wr_Data[16+:8],
                                    (r_FIFO_Rd_Data[16+:8]+r2_FIFO_Wr_Data[08+:08])>>1,
                                        r_FIFO_Rd_Data[08+:8]};
                            Pixel[2] = {r2_FIFO_Wr_Data[00+:8],
                                    (r_FIFO_Rd_Data[00+:8]+r2_FIFO_Wr_Data[08+:08])>>1,
                                        r_FIFO_Rd_Data[08+:8]};
                            Pixel[3] = {r2_FIFO_Wr_Data[00+:8],
                                    (r_FIFO_Rd_Data[00+:8]+r1_FIFO_Wr_Data[24+:08])>>1,
                                        FIFO_Rd_Data[24+:8]};
                        end
                    endcase
            end else if((Row_Cnt_wr == 'd0) &&(r_FIFO_Wr_EN)) begin
                            Pixel[0] = {8'b0,
                                        r2_FIFO_Wr_Data[16+:8],
                                        r2_FIFO_Wr_Data[24+:8]};
                            Pixel[1] = {8'b0,
                                        r2_FIFO_Wr_Data[16+:8],
                                        r2_FIFO_Wr_Data[08+:8]};
                            Pixel[2] = {8'b0,
                                        r2_FIFO_Wr_Data[00+:8],
                                        r2_FIFO_Wr_Data[08+:8]};
                            Pixel[3] = {8'b0,
                                        r2_FIFO_Wr_Data[00+:8],
                                      r1_FIFO_Wr_Data[24+:8]};
            end
        end else begin
            Pixel[0] <= 24'd0;     
            Pixel[1] <= 24'd0;   
            Pixel[2] <= 24'd0;  
            Pixel[3] <= 24'd0;
        end
    end


    Sfifo_Raw2RGB_w32x1024_r32x1024  Raw2RGB_FIFO_0(
    .rst        (!I_Rst_n                     ),// input wire rst
    .wr_clk     ( I_CLK                       ),// input wire wr_clk
    .rd_clk     ( I_CLK                       ),// input wire rd_clk
    .din        ( FIFO_Wr_Data                ),// input wire [31 : 0] din
    .wr_en      ( I_Mipi_raw10_depacker_Vaild ),// input wire wr_en
    .rd_en      ( FIFO_Rd_EN                  ),// input wire rd_en
    .dout       ( FIFO_Rd_Data                ),// output wire [31 : 0] dout
    .full       ( full                        ),// output wire full
    .empty      ( empty                       ),// output wire empty
    .wr_rst_busy( wr_rst_busy                 ),// output wire wr_rst_busy
    .rd_rst_busy( rd_rst_busy                 ) // output wire rd_rst_busy
    );
endmodule