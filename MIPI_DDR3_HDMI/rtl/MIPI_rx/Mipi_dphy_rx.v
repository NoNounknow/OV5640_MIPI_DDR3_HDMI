`timescale 1ns / 1ps
 module Mipi_dphy_rx #(
    Mipi_Lane_Num = 2
)(
    input   wire            Rst_n                 ,
    //Mipi
    input   wire            I_Mipi_phy_clk_p    ,
    input   wire            I_Mipi_phy_clk_n    ,
    input   wire    [1:0]   I_Mipi_phy_lane_p   ,
    input   wire    [1:0]   I_Mipi_phy_lane_n   ,

    output  wire            O_Mipi_CSI_Byte_CLK        ,//Slow Clk
    output  wire    [7:0]   O_Mipi_CSI_Byte_Lane0_Data ,
    output  wire    [7:0]   O_Mipi_CSI_Byte_Lane1_Data   
    );
            wire            Bufd_CLK             ;
            wire            Bufd_Slow_Clk        ;   
            wire            Buff_Clk             ;
            wire            Buff_Clk_inv         ;
            wire            clock_enable         ;
//clk
    //diff to single:clk     
    IBUFDS
     #(.IOSTANDARD ("LVDS_25"))
     ibufds_clk_inst
     (.I          ( I_Mipi_phy_clk_p ),
      .IB         ( I_Mipi_phy_clk_n ),
      .O          ( Bufd_CLK         ));

    // High Speed BUFIO clock buffer
    BUFIO bufio_inst
     (.O ( Buff_Clk ),
      .I ( Bufd_CLK ));

    // BUFR generates the slow clock
    BUFR
     #(.SIM_DEVICE ("7SERIES"),
       .BUFR_DIVIDE("4"))
     clkout_buf_inst
      (.O    ( Bufd_Slow_Clk    ),
       .CE   ( 1'b1             ),
       .CLR  ( !Rst_n           ),
       .I    ( Bufd_CLK         ));

    assign  O_Mipi_CSI_Byte_CLK = Bufd_Slow_Clk ;//Output Slow Clk
    assign  Buff_Clk_inv        = ~ Buff_Clk    ;
    assign  clock_enable = 1'b1;
//data
    wire     [1:0]  Mipi_IBUFD_Data       ;//Diff data to Single data  
    wire     [1:0]  Mipi_IBUFD_Data_delay ;
    wire     [7:0]  iserdes_q [1:0]       ;
    wire     [1:0]  Bitslip               ;
    assign   Bitslip = 2'b00;
    //lane0
    //diff to single:data
    IBUFDS
      #(.DIFF_TERM  ("FALSE"),             // Differential termination
        .IOSTANDARD ("LVDS_25"))
     ibufds_inst_0
       (.I          ( I_Mipi_phy_lane_p[0]  ),
        .IB         ( I_Mipi_phy_lane_n[0]  ),
        .O          ( Mipi_IBUFD_Data[0]    ));

    assign   Mipi_IBUFD_Data_delay = Mipi_IBUFD_Data;

     ISERDESE2
       # (
         .DATA_RATE         ("DDR"),
         .DATA_WIDTH        (8),
         .INTERFACE_TYPE    ("NETWORKING"), 
         .DYN_CLKDIV_INV_EN ("FALSE"),
         .DYN_CLK_INV_EN    ("FALSE"),
         .NUM_CE            (2),
         .OFB_USED          ("FALSE"),
         .IOBDELAY          ("NONE"),                               // Use input at D to output the data on Q
         .SERDES_MODE       ("MASTER"))
       iserdese2_master_lane0 (
         .Q1                ( iserdes_q [0][7] ),
         .Q2                ( iserdes_q [0][6] ),
         .Q3                ( iserdes_q [0][5] ),
         .Q4                ( iserdes_q [0][4] ),
         .Q5                ( iserdes_q [0][3] ),
         .Q6                ( iserdes_q [0][2] ),
         .Q7                ( iserdes_q [0][1] ),
         .Q8                ( iserdes_q [0][0] ),
         .SHIFTOUT1         ( ),
         .SHIFTOUT2         ( ),
         .BITSLIP           ( Bitslip[0]),                  // 1-bit Invoke Bitslip. This can be used with any DATA_WIDTH, cascaded or not.
                                                            // The amount of BITSLIP is fixed by the DATA_WIDTH selection.
         .CE1               ( clock_enable   ),             // 1-bit Clock enable input
         .CE2               ( clock_enable   ),             // 1-bit Clock enable input
         .CLK               ( Buff_Clk       ),             // Fast source synchronous clock driven by BUFIO
         .CLKB              ( Buff_Clk_inv   ),             // Locally inverted fast 
         .CLKDIV            ( Bufd_Slow_Clk  ),             // Slow clock from BUFR.
         .CLKDIVP           ( 1'b0    ),
         .D                 ( Mipi_IBUFD_Data_delay[0]),    // 1-bit Input signal from IOB 
         .DDLY              ( 1'b0   ),                     // 1-bit Input from Input Delay component 
         .RST               ( !Rst_n ),                     // 1-bit Asynchronous reset only.
         .SHIFTIN1          ( 1'b0   ),
         .SHIFTIN2          ( 1'b0   ),
    // unused connections 
         .DYNCLKDIVSEL      ( 1'b0 ),
         .DYNCLKSEL         ( 1'b0 ),
         .OFB               ( 1'b0 ),
         .OCLK              ( 1'b0 ),
         .OCLKB             ( 1'b0 ),
         .O                 ( ));                                   // unregistered output of ISERDESE1
   
    //lane1 
    IBUFDS
      #(.DIFF_TERM  ("FALSE"),             // Differential termination
        .IOSTANDARD ("LVDS_25"))
     ibufds_inst_1
       (.I          ( I_Mipi_phy_lane_p[1] ),
        .IB         ( I_Mipi_phy_lane_n[1] ),
        .O          ( Mipi_IBUFD_Data[1]   ));

     ISERDESE2
       # (
         .DATA_RATE         ("DDR"),
         .DATA_WIDTH        (8),
         .INTERFACE_TYPE    ("NETWORKING"), 
         .DYN_CLKDIV_INV_EN ("FALSE"),
         .DYN_CLK_INV_EN    ("FALSE"),
         .NUM_CE            (2),
         .OFB_USED          ("FALSE"),
         .IOBDELAY          ("NONE"),                               // Use input at D to output the data on Q
         .SERDES_MODE       ("MASTER"))
       iserdese2_master_lane1 (
         .Q1                ( iserdes_q [1][7] ),
         .Q2                ( iserdes_q [1][6] ),
         .Q3                ( iserdes_q [1][5] ),
         .Q4                ( iserdes_q [1][4] ),
         .Q5                ( iserdes_q [1][3] ),
         .Q6                ( iserdes_q [1][2] ),
         .Q7                ( iserdes_q [1][1] ),
         .Q8                ( iserdes_q [1][0] ),
         .SHIFTOUT1         ( ),
         .SHIFTOUT2         ( ),
         .BITSLIP           ( Bitslip[1]),                  // 1-bit Invoke Bitslip. This can be used with any DATA_WIDTH, cascaded or not.
                                                            // The amount of BITSLIP is fixed by the DATA_WIDTH selection.
         .CE1               ( clock_enable   ),             // 1-bit Clock enable input
         .CE2               ( clock_enable   ),             // 1-bit Clock enable input
         .CLK               ( Buff_Clk       ),             // Fast source synchronous clock driven by BUFIO
         .CLKB              ( Buff_Clk_inv   ),             // Locally inverted fast 
         .CLKDIV            ( Bufd_Slow_Clk  ),             // Slow clock from BUFR.
         .CLKDIVP           ( 1'b0    ),
         .D                 ( Mipi_IBUFD_Data_delay[1]),    // 1-bit Input signal from IOB 
         .DDLY              ( 1'b0   ),                      // 1-bit Input from Input Delay component 
         .RST               ( !Rst_n ),                      // 1-bit Asynchronous reset only.
         .SHIFTIN1          ( 1'b0   ),
         .SHIFTIN2          ( 1'b0   ),
    // unused connections 
         .DYNCLKDIVSEL      ( 1'b0 ),
         .DYNCLKSEL         ( 1'b0 ),
         .OFB               ( 1'b0 ),
         .OCLK              ( 1'b0 ),
         .OCLKB             ( 1'b0 ),
         .O                 ( ));                                   // unregistered output of ISERDESE1
    
    assign   O_Mipi_CSI_Byte_Lane0_Data = iserdes_q[0];
    assign   O_Mipi_CSI_Byte_Lane1_Data = iserdes_q[1];
endmodule
