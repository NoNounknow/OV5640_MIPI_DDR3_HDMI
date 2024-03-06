module IIC_Camera_Config #(
    Mipi_Lane_Num = 2
)(
    input   wire                          I_Top_Sys_Clk         ,//50MHZ
    input   wire                          I_Top_Rst_n           ,  
//MIPI CCI
    output  wire                          O_Mipi_I2C_SCL      ,
    inout                                 IO_Mipi_I2C_SDA     ,
//MIPI Camera Config              
    output  wire                          O_Mipi_ls_GPIO      ,
    input   wire                          I_Mipi_ls_Clk_p     ,
    input   wire                          I_Mipi_ls_Clk_n     ,
    input   wire    [Mipi_Lane_Num-1:0]   I_Mipi_ls_Data_p    ,
    input   wire    [Mipi_Lane_Num-1:0]   I_Mipi_ls_Data_n    ,
    output  wire                          OV5640_ConFigSet_done
);
//--------------------------------Port Defination----------------------------------//
    //ov5640_ConFig
            reg     [5:0]   I2C_DIV_CNT                 ;
            reg     [20:0]  dly_cnt                     ; 
//--------------------------------Port Defination----------------------------------//            

//--------------------------------Main Code----------------------------------------//
    assign  O_Mipi_ls_GPIO = 1'b1;
    always @(posedge I_Top_Sys_Clk or negedge I_Top_Rst_n) begin
        if(I_Top_Rst_n == 'd0) begin
                dly_cnt <=      'd0;
        end else if(dly_cnt[20] == 1'b0)begin
                dly_cnt <=      dly_cnt + 1'b1; 
        end
    end
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
        .s_rst_n   ( dly_cnt[20] && I_Top_Rst_n),
        .iic_scl   ( O_Mipi_I2C_SCL         ),
        .iic_sda   ( IO_Mipi_I2C_SDA        ),
        .cfg_done  ( OV5640_ConFigSet_done  )
    );
//--------------------------------Instance-----------------------------------------//
endmodule