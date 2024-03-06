// *********************************************************************************
// Project Name : OSXXXX
// Author       : dengkanwen
// Email        : dengkanwen@163.com
// Website      : http://www.opensoc.cn/
// Create Time  : 2017/5/5 22:48:12
// File Name    : .v
// Module Name  : 
// Called By    :
// Abstract     :
//
// CopyRight(c) 2016, OpenSoc Studio.. 
// All Rights Reserved
//
// *********************************************************************************
// Modification History:
// Date         By              Version                 Change Description
// -----------------------------------------------------------------------
// 2017/5/5    Kevin           1.0                     Original
//  
// *********************************************************************************
`timescale      1ns/1ns

module  ov5640_iic(
        // system signals
        input                   sclk                    ,       
        input                   s_rst_n                 ,       
        // IIC
        output  reg             iic_scl                 ,       
        inout                   iic_sda                 ,       
        // Othesr
        input                   start                   ,       
        input           [31:0]  wdata                   ,     
        output  reg     [ 7:0]  riic_data               ,
        output  reg             busy                    
);

//========================================================================\
// =========== Define Parameter and Internal signals =========== 
//========================================================================/
reg     [31:0]                  wsda_reg                        ;
reg     [ 5:0]                  cfg_cnt                         ;
reg                             iic_sda_reg                     ;
reg                             flag_ack                        ;       
reg     [ 3:0]                  delay_cnt                       ;
reg                             done                            ;       

wire                            dir                             ;       

//=============================================================================
//**************    Main Code   **************
//=============================================================================
always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                wsda_reg        <=      'd0;
        else if(start == 1'b1)
                wsda_reg        <=      wdata;
end

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                iic_scl <=      1'b1;
        else if(start == 1'b1)
                iic_scl <=      1'b0;
        else if(cfg_cnt == 'd28 && dir == 1'b1 && delay_cnt <= 'd3)
                iic_scl <=      1'b1;
        else if(busy == 1'b1)
                iic_scl <=      ~iic_scl;
        else
                iic_scl <=      1'b1;
end

always  @(negedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                busy    <=      1'b0;
        else if(start == 1'b1)
                busy    <=      1'b1;
        else if(done == 1'b1)
                busy    <=      1'b0;
end

always  @(negedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                cfg_cnt <=      'd0;
        else if((cfg_cnt >= 'd47 && dir == 1'b1) || (cfg_cnt >= 'd37 && dir == 1'b0))
                cfg_cnt <=      'd0;
        else if(cfg_cnt == 'd28 && delay_cnt <= 'd4 && dir == 1'b1)
                cfg_cnt <=      'd28;
        else if(busy == 1'b1 && iic_scl == 1'b0)
                cfg_cnt <=      cfg_cnt + 1'b1;
end

always  @(negedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                riic_data       <=      'd0;
        else if(iic_scl == 1'b1 && cfg_cnt >= 'd38 && flag_ack == 1'b1)
                riic_data       <=      {riic_data[6:0], iic_sda};
end

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                delay_cnt       <=      'd0;
        else if(dir == 1'b1 && cfg_cnt == 'd28)
                delay_cnt       <=      delay_cnt + 1'b1;
        else
                delay_cnt       <=      'd0;
end

always  @(negedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                done    <=      1'b0;
        else if(dir == 1'b1 && cfg_cnt == 'd46 && iic_scl == 1'b1)
                done    <=      1'b1;
        else if(dir == 1'b0 && cfg_cnt == 'd36 && iic_scl == 1'b1)
                done    <=      1'b1;
        else
                done    <=      1'b0;                
end

always  @(*) begin
        if(dir == 1'b1 && (cfg_cnt == 'd9 || cfg_cnt == 'd18 || cfg_cnt == 'd27 || (cfg_cnt >= 'd37 && cfg_cnt <= 'd45)))
                flag_ack        <=      1'b1;
        else if(dir == 1'b0 && (cfg_cnt == 'd9 || cfg_cnt == 'd18 || cfg_cnt == 'd27 || cfg_cnt == 'd36))
                flag_ack        <=      1'b1;
        else
                flag_ack        <=      1'b0;
end

always  @(*) begin
        if(dir == 1'b1)         // 0:write, 1:read
                case(cfg_cnt)
                        0: // START
                                if(busy == 1'b1)
                                        iic_sda_reg =      1'b0;
                                else
                                        iic_sda_reg =      1'b1;
                        // ID Address
                        1:      iic_sda_reg =      wsda_reg[31];   
                        2:      iic_sda_reg =      wsda_reg[30];
                        3:      iic_sda_reg =      wsda_reg[29];
                        4:      iic_sda_reg =      wsda_reg[28];
                        5:      iic_sda_reg =      wsda_reg[27];
                        6:      iic_sda_reg =      wsda_reg[26];
                        7:      iic_sda_reg =      wsda_reg[25];
                        8:      iic_sda_reg =      1'b0;
                        // Address High Byte
                        10:     iic_sda_reg =      wsda_reg[23];
                        11:     iic_sda_reg =      wsda_reg[22];
                        12:     iic_sda_reg =      wsda_reg[21];
                        13:     iic_sda_reg =      wsda_reg[20];
                        14:     iic_sda_reg =      wsda_reg[19];
                        15:     iic_sda_reg =      wsda_reg[18];
                        16:     iic_sda_reg =      wsda_reg[17];
                        17:     iic_sda_reg =      wsda_reg[16];
                        // Address Low Byte
                        19:     iic_sda_reg =      wsda_reg[15];
                        20:     iic_sda_reg =      wsda_reg[14];
                        21:     iic_sda_reg =      wsda_reg[13];
                        22:     iic_sda_reg =      wsda_reg[12];
                        23:     iic_sda_reg =      wsda_reg[11];
                        24:     iic_sda_reg =      wsda_reg[10];
                        25:     iic_sda_reg =      wsda_reg[9];
                        26:     iic_sda_reg =      wsda_reg[8];
                        // STOP & START
                        28:     
                                if(delay_cnt <= 'd1 || delay_cnt >= 'd4)
                                        iic_sda_reg =      1'b0;
                                else
                                        iic_sda_reg =      1'b1;
                        // ID Address
                        29:     iic_sda_reg =      wsda_reg[31];   
                        30:     iic_sda_reg =      wsda_reg[30];
                        31:     iic_sda_reg =      wsda_reg[29];
                        32:     iic_sda_reg =      wsda_reg[28];
                        33:     iic_sda_reg =      wsda_reg[27];
                        34:     iic_sda_reg =      wsda_reg[26];
                        35:     iic_sda_reg =      wsda_reg[25];
                        36:     iic_sda_reg =      wsda_reg[24];        
                        // STOP
                        47:     iic_sda_reg =      1'b0;
                        default:iic_sda_reg =      1'b1;
                endcase
        else 
                case(cfg_cnt)
                        0: // START
                                if(busy == 1'b1)
                                        iic_sda_reg =      1'b0;
                                else
                                        iic_sda_reg =      1'b1;
                        // ID Address
                        1:      iic_sda_reg =      wsda_reg[31];   
                        2:      iic_sda_reg =      wsda_reg[30];
                        3:      iic_sda_reg =      wsda_reg[29];
                        4:      iic_sda_reg =      wsda_reg[28];
                        5:      iic_sda_reg =      wsda_reg[27];
                        6:      iic_sda_reg =      wsda_reg[26];
                        7:      iic_sda_reg =      wsda_reg[25];
                        8:      iic_sda_reg =      1'b0;
                        // Address High Byte
                        10:     iic_sda_reg =      wsda_reg[23];
                        11:     iic_sda_reg =      wsda_reg[22];
                        12:     iic_sda_reg =      wsda_reg[21];
                        13:     iic_sda_reg =      wsda_reg[20];
                        14:     iic_sda_reg =      wsda_reg[19];
                        15:     iic_sda_reg =      wsda_reg[18];
                        16:     iic_sda_reg =      wsda_reg[17];
                        17:     iic_sda_reg =      wsda_reg[16];
                        // Address Low Byte
                        19:     iic_sda_reg =      wsda_reg[15];
                        20:     iic_sda_reg =      wsda_reg[14];
                        21:     iic_sda_reg =      wsda_reg[13];
                        22:     iic_sda_reg =      wsda_reg[12];
                        23:     iic_sda_reg =      wsda_reg[11];
                        24:     iic_sda_reg =      wsda_reg[10];
                        25:     iic_sda_reg =      wsda_reg[9];
                        26:     iic_sda_reg =      wsda_reg[8];
                        // Write Data
                        28:     iic_sda_reg =      wsda_reg[7];
                        29:     iic_sda_reg =      wsda_reg[6];
                        30:     iic_sda_reg =      wsda_reg[5];
                        31:     iic_sda_reg =      wsda_reg[4];
                        32:     iic_sda_reg =      wsda_reg[3];
                        33:     iic_sda_reg =      wsda_reg[2];
                        34:     iic_sda_reg =      wsda_reg[1];
                        35:     iic_sda_reg =      wsda_reg[0];   
                        // STOP
                        37:     iic_sda_reg =      1'b0;   
                        default:iic_sda_reg =      1'b1;   
                endcase
end

assign  iic_sda =       (flag_ack == 1'b1) ? 1'bz : iic_sda_reg; 
assign  dir     =       wsda_reg[24];

endmodule
