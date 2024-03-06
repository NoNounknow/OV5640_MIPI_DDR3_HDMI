`timescale 1ns / 1ps
module MIPI_rx_top #(
    Mipi_Lane_Num = 2
)(
    input   wire                          I_Top_Sys_Clk         ,//50MHZ
    input   wire                          I_Top_Rst_n           ,  
//Mipi CSI            
    input   wire                          I_Mipi_phy_clk_p    ,
    input   wire                          I_Mipi_phy_clk_n    ,
    input   wire    [Mipi_Lane_Num-1:0]   I_Mipi_phy_lane_p   ,
    input   wire    [Mipi_Lane_Num-1:0]   I_Mipi_phy_lane_n   ,
//MIPI CCI
    output  wire                          O_Mipi_I2C_SCL     ,
    inout                                 IO_Mipi_I2C_SDA     ,
//MIPI Camera Config              
    output  wire                          O_Mipi_ls_GPIO      ,
    input   wire                          I_Mipi_ls_Clk_p     ,
    input   wire                          I_Mipi_ls_Clk_n     ,
    input   wire    [Mipi_Lane_Num-1:0]   I_Mipi_ls_Data_p    ,
    input   wire    [Mipi_Lane_Num-1:0]   I_Mipi_ls_Data_n    
    );

//--------------------------------Port Defination----------------------------------//

    //ov5640_ConFig
            wire            OV5640_ConFigSet_done       ;
            reg     [5:0]   I2C_DIV_CNT                 ;
    //u_Mipi_dphy_rx
            wire            Mipi_CSI_Byte_CLK          ;
            wire    [7:0]   Mipi_CSI_Byte_Lane0_Data   ;
            wire    [7:0]   Mipi_CSI_Byte_Lane1_Data   ;
    //Mipi_Byte_Alignment
            wire            ReSearch_Offset            ;
        //LANE0
            wire    [7:0]   Mipi_Byte_Alignment_Data_0 ;
            wire            Mipi_Byte_Alignment_Vaild_0;
        //LANE1
            wire    [7:0]   Mipi_Byte_Alignment_Data_1 ;
            wire            Mipi_Byte_Alignment_Vaild_1;
    //Mipi_Lane_Alignment
            wire            ReSearch_Offset_Lane       ;
            wire    [15:0]  Mipi_Lane_Alignment_Data   ;
            wire            Mipi_Lane_Alignment_Vaild  ;
    //Mipi_Unpacket
            wire    [15:0]  Mipi_Unpacket_Data         ;
            wire            Mipi_Unpacket_Vaild        ;
            wire            Mipi_Unpacket_done         ;
            wire            Mipi_Unpacket_V_sync       ;

//--------------------------------Port Defination----------------------------------//

//--------------------------------Main Code----------------------------------------//
    assign  O_Mipi_ls_GPIO = 1'b1;
    always @(posedge I_Top_Sys_Clk or negedge I_Top_Rst_n)begin
        if(I_Top_Rst_n == 'd0) begin
            I2C_DIV_CNT <= 'd0;
        end else begin
            I2C_DIV_CNT <= I2C_DIV_CNT + 1'b1;
        end
    end
    //IIC Rate 100k~400k 50MHZ / 2^5
//--------------------------------Main Code----------------------------------------//

//--------------------------------Instance-----------------------------------------//
    ov5640_cfg      ov5640_ConFig(
            .sclk      ( I2C_DIV_CNT[5]         ),
            .s_rst_n   ( I_Top_Rst_n            ),
            .iic_scl   ( O_Mipi_I2C_SCL         ),
            .iic_sda   ( IO_Mipi_I2C_SDA        ),
            .cfg_done  ( OV5640_ConFigSet_done  )
    );
    Mipi_dphy_rx  u_Mipi_dphy_rx (
        .Rst_n                       ( I_Top_Rst_n                ),
        .I_Mipi_phy_clk_p            ( I_Mipi_phy_clk_p           ),
        .I_Mipi_phy_clk_n            ( I_Mipi_phy_clk_n           ),
        .I_Mipi_phy_lane_p           ( I_Mipi_phy_lane_p          ),
        .I_Mipi_phy_lane_n           ( I_Mipi_phy_lane_n          ),

        .O_Mipi_CSI_Byte_CLK         ( Mipi_CSI_Byte_CLK        ),
        .O_Mipi_CSI_Byte_Lane0_Data  ( Mipi_CSI_Byte_Lane0_Data   ),
        .O_Mipi_CSI_Byte_Lane1_Data  ( Mipi_CSI_Byte_Lane1_Data   )
    );
    Mipi_Byte_Alignment  Mipi_Byte_Alignment_Inst_0 (
        .I_CLK                        ( Mipi_CSI_Byte_CLK          ),
        .I_Rst_n                      ( I_Top_Rst_n                ),
        .I_Mipi_CSI_Byte_Data         ( Mipi_CSI_Byte_Lane0_Data   ),
        .I_ReSearch_Offset            ( ReSearch_Offset_Lane | Mipi_Unpacket_done ),

        .O_Mipi_Byte_Alignment_Data   ( Mipi_Byte_Alignment_Data_0 ),
        .O_Mipi_Byte_Alignment_Vaild  ( Mipi_Byte_Alignment_Vaild_0)
    );
    Mipi_Byte_Alignment  Mipi_Byte_Alignment_Inst_1 (
        .I_CLK                        ( Mipi_CSI_Byte_CLK          ),
        .I_Rst_n                      ( I_Top_Rst_n                ),
        .I_Mipi_CSI_Byte_Data         ( Mipi_CSI_Byte_Lane1_Data   ),
        .I_ReSearch_Offset            ( ReSearch_Offset_Lane | Mipi_Unpacket_done ),

        .O_Mipi_Byte_Alignment_Data   ( Mipi_Byte_Alignment_Data_1 ),
        .O_Mipi_Byte_Alignment_Vaild  ( Mipi_Byte_Alignment_Vaild_1)
    );
    Mipi_Lane_Alignment  Mipi_Lane_Alignment_Inst0 (
        .I_CLK                          ( Mipi_CSI_Byte_CLK           ),
        .I_Rst_n                        ( I_Top_Rst_n                 ),
        .I_Mipi_Byte_Alignment_Data_0   ( Mipi_Byte_Alignment_Data_0  ),
        .I_Mipi_Byte_Alignment_Vaild_0  ( Mipi_Byte_Alignment_Vaild_0 ),
        .I_Mipi_Byte_Alignment_Data_1   ( Mipi_Byte_Alignment_Data_1  ),
        .I_Mipi_Byte_Alignment_Vaild_1  ( Mipi_Byte_Alignment_Vaild_1 ),
        .I_Mipi_Unpacket_done           ( Mipi_Unpacket_done          ),

        .O_ReSearch_Offset_Lane         ( ReSearch_Offset_Lane        ),
        .O_Mipi_Lane_Alignment_Data     ( Mipi_Lane_Alignment_Data    ),
        .O_Mipi_Lane_Alignment_Vaild    ( Mipi_Lane_Alignment_Vaild   )
    );
    Mipi_Unpacket Mipi_Unpacket_Inst0 (
        .I_CLK                        ( Mipi_CSI_Byte_CLK          ),
        .I_Rst_n                      ( I_Top_Rst_n                ),
        .I_Mipi_Lane_Alignment_Data   ( Mipi_Lane_Alignment_Data   ),
        .I_Mipi_Lane_Alignment_Vaild  ( Mipi_Lane_Alignment_Vaild  ),

        .O_Mipi_Unpacket_Data         ( Mipi_Unpacket_Data         ),
        .O_Mipi_Unpacket_Vaild        ( Mipi_Unpacket_Vaild        ),
        .O_Mipi_Unpacket_done         ( Mipi_Unpacket_done         ),
        .O_Mipi_Unpacket_V_sync       ( Mipi_Unpacket_V_sync       )
    );
//--------------------------------Instance-----------------------------------------//
endmodule