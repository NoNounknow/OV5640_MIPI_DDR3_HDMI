`timescale 1ns / 1ps
module MIPI_rx_top #(
    Mipi_Lane_Num = 2
)(
    input   wire            I_Top_Sys_Clk         ,//50MHZ
    input   wire            I_Top_Rst_n           ,  
//Mipi CSI
    input   wire            I_Mipi_phy_clk_p    ,
    input   wire            I_Mipi_phy_clk_n    ,
    input   wire    [1:0]   I_Mipi_phy_lane_p   ,
    input   wire    [1:0]   I_Mipi_phy_lane_n   ,
//MIPI CCI
    output  wire             O_Mipi_I2C_SCL     ,
    inout                   IO_Mipi_I2C_SDA     ,
//MIPI Camera Config
    output  wire            O_Mipi_ls_GPIO      ,
    input   wire            I_Mipi_ls_Clk_p     ,
    input   wire            I_Mipi_ls_Clk_n     ,
    input   wire    [1:0]   I_Mipi_ls_Data_p    ,
    input   wire    [1:0]   I_Mipi_ls_Data_n    
    );

//--------------------------------Port Defination----------------------------------//
    //u_Mipi_dphy_rx
            wire            O_Mipi_CSI_Byte_CLK        ;
            wire    [7:0]   O_Mipi_CSI_Byte_Lane0_Data ;
            wire    [7:0]   O_Mipi_CSI_Byte_Lane1_Data ;
    //ov5640_ConFig
            wire            OV5640_ConFigSet_done       ;
            reg     [5:0]   I2C_DIV_CNT                 ;
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
//--------------------------------Main Code----------------------------------------//

//--------------------------------Instance-----------------------------------------//
    ov5640_cfg      ov5640_ConFig(
            .sclk      ( I2C_DIV_CNT[5]         ),
            .s_rst_n   ( I_Top_Rst_n            ),
            .iic_scl   ( O_Mipi_I2C_SCL         ),
            .iic_sda   ( IO_Mipi_I2C_SDA        ),
            .cfg_done  ( OV5640_ConFigSet_done  )
    );
    ila_0 ila_0 (
        .clk   ( O_Mipi_CSI_Byte_CLK         ), // input wire clk
        .probe0( O_Mipi_CSI_Byte_Lane0_Data  ), // input wire [7:0]  probe0  
        .probe1( O_Mipi_CSI_Byte_Lane1_Data  )  // input wire [7:0]  probe1
    );
    Mipi_dphy_rx  u_Mipi_dphy_rx (
        .Rst_n                       ( I_Top_Rst_n                ),
        .I_Mipi_phy_clk_p            ( I_Mipi_phy_clk_p           ),
        .I_Mipi_phy_clk_n            ( I_Mipi_phy_clk_n           ),
        .I_Mipi_phy_lane_p           ( I_Mipi_phy_lane_p          ),
        .I_Mipi_phy_lane_n           ( I_Mipi_phy_lane_n          ),

        .O_Mipi_CSI_Byte_CLK         ( O_Mipi_CSI_Byte_CLK        ),
        .O_Mipi_CSI_Byte_Lane0_Data  ( O_Mipi_CSI_Byte_Lane0_Data ),
        .O_Mipi_CSI_Byte_Lane1_Data  ( O_Mipi_CSI_Byte_Lane1_Data )
    );
//--------------------------------Instance-----------------------------------------//
endmodule