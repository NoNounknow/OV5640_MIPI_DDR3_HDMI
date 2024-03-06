module HDMI_Process_top ( 
    input   wire    Pixl_CLK                    ,
    input   wire    Pixl_5xCLK                  ,
    input   wire    Rst_n                       ,
    //RD_hdmi_data
    output  wire            rdata_fifo_rd_en    ,
    input   wire    [15:0]  rdata_fifo_rd_data  ,
    //Tmds
    output  wire            Tmds_Clk_p          ,
    output  wire            Tmds_Clk_n          ,
    output  wire    [2:0]   Tmds_data_p         ,
    output  wire    [2:0]   Tmds_data_n         ,
    output  wire            O_VGA_Sync
);
    //VGA Ports
            wire            Pre_H_Sync          ;
            wire            Pre_V_Sync          ;
    //HDMI Encode   
            wire    [9:0]   Encode_Red_10Bit    ;
            wire    [9:0]   Encode_Green_10Bit  ;
            wire    [9:0]   Encode_Blue_10Bit   ;
            wire    [9:0]   Encode_CLK_10Bit    ;
        //serializer Done   
            wire            Pre_Red             ;
            wire            Pre_Green           ;
            wire            Pre_Blue            ;
            wire            Pre_Clk             ;
        //Rst   
            wire            Rst_Posedge         ;
            wire            Rst_Negedge         ;
            wire            Pre_VGA_De          ;
        //bayer2rgb
            //0
            wire            P_0_V_Sync          ;
            wire            P_0_H_Sync          ;
            wire            P_0_VGA_De          ;
            wire    [7:0]   P_0_R               ;
            wire    [7:0]   P_0_G               ;
            wire    [7:0]   P_0_B               ;
            //1
            wire            P_1_V_Sync          ;
            wire            P_1_H_Sync          ;
            wire            P_1_VGA_De          ;
            wire    [7:0]   P_1_R               ;
            wire    [7:0]   P_1_G               ;
            wire    [7:0]   P_1_B               ;

    assign  rdata_fifo_rd_en = Pre_VGA_De       ;
    assign  Encode_CLK_10Bit = 10'b11111_00000  ;
    assign  Rst_Negedge      = (!Rst_Posedge)   ;
    assign  O_VGA_Sync       = Pre_V_Sync      ;

asyn_rst_syn reset_syn(
    .reset_n    ( Rst_n                 ),
    .clk        ( Pixl_CLK              ),
    .syn_reset  ( Rst_Posedge           )
    );

v_tc_0 v_tc_0 (
  .clk              ( Pixl_CLK),             // input wire clk
  .clken            ( 1'b1),                 // input wire clken
  .gen_clken        ( 1'b1),                 // input wire gen_clken
  .sof_state        ( 1'b1),                     // input wire sof_state
  .vsync_out        ( Pre_V_Sync),          // output wire vsync_out
  .hsync_out        ( Pre_H_Sync),          // output wire hsync_out
  .hblank_out       ( ),                     // output wire hblank_out
  .vblank_out       ( ),                     // output wire vblank_out
  .active_video_out ( Pre_VGA_De     ),      // output wire active_video_out
  .resetn           ( Rst_Negedge),          // input wire resetn
  .fsync_out        ( )                      // output wire [0 : 0] fsync_out
);
// VGA_Control VGA_Control(
//     .Sys_clk                 ( Pixl_CLK                   ),
//     .Rst_n                   ( Rst_Negedge                ),

//     .rdata_fifo_rd_en        ( Pre_VGA_De                 ),
//     .rdata_fifo_rd_data      ( rdata_fifo_rd_data         ),

//     .Red_Sign                ( Pre_RGB_Red_Sign           ),
//     .Green_Sign              ( Pre_RGB_Green_Sign         ),
//     .Blue_Sign               ( Pre_RGB_Blue_Sign          ),
//     .Pre_H_Sync              ( Pre_H_Sync                 ),
//     .Pre_V_Sync             ( Pre_V_Sync                  ),
//     .H_addr                  (                            ),
//     .V_addr                  (                            )
// );

Post_Raw2Rgb  u_Post_Raw2Rgb (
    .I_Clk                   ( Pixl_CLK                 ),
    .I_Rst_n                 ( Rst_Negedge              ),
    .I_V_Sync                ( Pre_V_Sync               ),
    .I_H_Sync                ( Pre_H_Sync               ),
    .I_Raw_Vaild             ( Pre_VGA_De               ),
    .I_Raw_Data              ( rdata_fifo_rd_data [7:0] ),

    .O_V_Sync                ( P_0_V_Sync          ),
    .O_H_Sync                ( P_0_H_Sync          ),
    .O_RGB_Vaild             ( P_0_VGA_De          ),
    .O_RGB_Data_r            ( P_0_R               ),
    .O_RGB_Data_g            ( P_0_G               ),
    .O_RGB_Data_b            ( P_0_B               )
);
// raw2rgb         raw2rgb_inst(
//         // system signals
//         .sclk                   (Pixl_CLK                ),
//         .s_rst_n                (Rst_Negedge                ),
//         // 
//         .i_vga_vsync            (Pre_V_Sync            ),
//         .i_vga_hsync            (Pre_H_Sync            ),
//         .i_vga_de               (Pre_VGA_De               ),
//         .raw_data               (rdata_fifo_rd_data[7:0]      ),
//         // 
//         .o_vga_vsync            (P_0_V_Sync      ),
//         .o_vga_hsync            (P_0_H_Sync      ),
//         .o_vga_de               (P_0_VGA_De         ),
//         .o_vga_r                (P_0_R  ),
//         .o_vga_g                (P_0_G          ),
//         .o_vga_b                (P_0_B          )
// );
//----------------------------------Gamma_06_Period----------------------------------------//
Gamma_06  u0_Gamma_06 (
    .Pre_Data                ( P_0_R  ),

    .Post_Data               ( P_1_R )
);
Gamma_06  u1_Gamma_06 (
    .Pre_Data                ( P_0_G  ),

    .Post_Data               ( P_1_G )
);
Gamma_06  u2_Gamma_06 (
    .Pre_Data                ( P_0_B  ),

    .Post_Data               ( P_1_B )
);
//----------------------------------Gamma_06_Period----------------------------------------//
//Encode VGA_Pixl_2_Tmds:编码为HDMI�?10位数据格�?
encode Inst0_Blue_EnCode (
	.clkin		( Pixl_CLK          ),
	.rstin		( Rst_Posedge       ),
	.din		( P_1_B             ),
	.c0			( P_0_V_Sync        ),
	.c1			( P_0_H_Sync        ),
	.de			( P_0_VGA_De        ),
	.dout		( Encode_Blue_10Bit )) ;
encode Inst0_Green_EnCode (
	.clkin		( Pixl_CLK          ),
	.rstin		( Rst_Posedge       ),
	.din	    ( P_1_G             ),
	.c0		    ( 1'b0              ),
	.c1		    ( 1'b0              ),
	.de			( P_0_VGA_De        ),
	.dout	    ( Encode_Green_10Bit)) ;
	
encode Inst0_Red_EnCode (
	.clkin		( Pixl_CLK          ),
	.rstin		( Rst_Posedge       ),
	.din		( P_1_R             ),
	.c0			( 1'b0              ),
	.c1			( 1'b0              ),
	.de			( P_0_VGA_De        ),
	.dout		( Encode_Red_10Bit  )) ;
//serializer == SelectIO 5:1 == OSERDESE2：DDR串行发�??
serializer_10_to_1 serializer_Blue(
    .reset              ( Rst_Posedge             ), 
    .paralell_clk       ( Pixl_CLK                ), 
    .serial_clk_5x      ( Pixl_5xCLK              ), 
    .paralell_data      ( Encode_Blue_10Bit       ), 

    .serial_data_out    ( Pre_Blue                )  
    );    
    
serializer_10_to_1 serializer_Green(
    .reset              ( Rst_Posedge             ), 
    .paralell_clk       ( Pixl_CLK                ), 
    .serial_clk_5x      ( Pixl_5xCLK              ), 
    .paralell_data      ( Encode_Green_10Bit      ),

    .serial_data_out    ( Pre_Green               )
    );
    
serializer_10_to_1 serializer_Red(
    .reset              ( Rst_Posedge             ), 
    .paralell_clk       ( Pixl_CLK                ), 
    .serial_clk_5x      ( Pixl_5xCLK              ), 
    .paralell_data      ( Encode_Red_10Bit        ),

    .serial_data_out    ( Pre_Red                 )
    );
//CLK
serializer_10_to_1 serializer_Clk(
    .reset              ( Rst_Posedge             ), 
    .paralell_clk       ( Pixl_CLK                ), 
    .serial_clk_5x      ( Pixl_5xCLK              ), 
    .paralell_data      ( Encode_CLK_10Bit        ),

    .serial_data_out    ( Pre_Clk                 )
    );
//OBUFDS
OBUFDS #(
    .IOSTANDARD         ("TMDS_33")    
) TMDS0 (
    .I                  ( Pre_Blue       ),
    .O                  ( Tmds_data_p[0] ),
    .OB                 ( Tmds_data_n[0] ) 
);

OBUFDS #(
    .IOSTANDARD         ("TMDS_33")    
) TMDS1 (
    .I                  ( Pre_Green    ),
    .O                  ( Tmds_data_p[1]),
    .OB                 ( Tmds_data_n[1] ) 
);

OBUFDS #(
    .IOSTANDARD         ("TMDS_33")    
) TMDS2 (
    .I                  ( Pre_Red        ), 
    .O                  ( Tmds_data_p[2] ), 
    .OB                 ( Tmds_data_n[2] )  
);

OBUFDS #(
    .IOSTANDARD         ("TMDS_33")    
) TMDS3 (
    .I                  ( Pre_Clk    ), 
    .O                  ( Tmds_Clk_p ),
    .OB                 ( Tmds_Clk_n ) 
);
endmodule