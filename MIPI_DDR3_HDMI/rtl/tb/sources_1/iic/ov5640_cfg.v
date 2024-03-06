// *********************************************************************************
// Project Name : OSXXXX
// Author       : dengkanwen
// Email        : dengkanwen@163.com
// Website      : http://www.opensoc.cn/
// Create Time  : 2017/5/11 22:31:05
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
// 2017/5/11    Kevin           1.0                     Original
//  
// *********************************************************************************
`timescale      1ns/1ns

module  ov5640_cfg(
        // system signals
        input                   sclk                    ,       // IIC_SCL x2
        input                   s_rst_n                 ,       
        // IIC Interfaces
        output  wire            iic_scl                 ,
        inout                   iic_sda                 ,
        // Debug Interfaces
        output  wire            cfg_done
);

//========================================================================\
// =========== Define Parameter and Internal signals =========== 
//========================================================================/
localparam      ANUM            =       122                     ;
localparam      DELAY_200US     =       10000                   ;

wire    [31:0]                  cfg_array[ANUM-1:0]             ;
reg     [ 8:0]                  cfg_index                       ;
reg                             start                           ;       
// wire                            cfg_done                        ;       
reg     [15:0]                  cnt_200us                       ;
wire                            busy_neg                        ;       
reg     [ 2:0]                  busy_arr                        ;
wire                            busy                            ;       

wire                            iic_start                       ;
wire    [31:0]                  iic_wdata                       ;
//=============================================================================
//**************    Main Code   **************
//=============================================================================
//                                ID    REG_ADDR  REG_VAL
assign  cfg_array[000]  =       {8'h78, 16'h3103, 8'h11};
assign  cfg_array[001]  =       {8'h78, 16'h3008, 8'h82};
assign  cfg_array[002]  =       {8'h78, 16'h3008, 8'h42};
assign  cfg_array[003]  =       {8'h78, 16'h3103, 8'h03};
assign  cfg_array[004]  =       {8'h78, 16'h3017, 8'h00};
assign  cfg_array[005]  =       {8'h78, 16'h3018, 8'h00};
assign  cfg_array[006]  =       {8'h78, 16'h3034, 8'h18};
assign  cfg_array[007]  =       {8'h78, 16'h3035, 8'h11};       // PLL root divider, bit[4], PLL pre-divider, bit[3:0]
assign  cfg_array[008]  =       {8'h78, 16'h3036, 8'h38};       // PCLK root divider, bit[5:4], SCLK2x root divider, bit[3:2] // SCLK root divider, bit[1:0] 
assign  cfg_array[009]  =       {8'h78, 16'h3037, 8'h11};
assign  cfg_array[010]  =       {8'h78, 16'h3108, 8'h01};
assign  cfg_array[011]  =       {8'h78, 16'h303D, 8'h10};
assign  cfg_array[012]  =       {8'h78, 16'h303B, 8'h19};
assign  cfg_array[013]  =       {8'h78, 16'h3630, 8'h2e};
assign  cfg_array[014]  =       {8'h78, 16'h3631, 8'h0e};
assign  cfg_array[015]  =       {8'h78, 16'h3632, 8'he2};
assign  cfg_array[016]  =       {8'h78, 16'h3633, 8'h23};
assign  cfg_array[017]  =       {8'h78, 16'h3621, 8'he0};
assign  cfg_array[018]  =       {8'h78, 16'h3704, 8'ha0};
assign  cfg_array[019]  =       {8'h78, 16'h3703, 8'h5a};
assign  cfg_array[020]  =       {8'h78, 16'h3715, 8'h78};
assign  cfg_array[021]  =       {8'h78, 16'h3717, 8'h01};
assign  cfg_array[022]  =       {8'h78, 16'h370b, 8'h60};
assign  cfg_array[023]  =       {8'h78, 16'h3705, 8'h1a};
assign  cfg_array[024]  =       {8'h78, 16'h3905, 8'h02};
assign  cfg_array[025]  =       {8'h78, 16'h3906, 8'h10};
assign  cfg_array[026]  =       {8'h78, 16'h3901, 8'h0a};
assign  cfg_array[027]  =       {8'h78, 16'h3731, 8'h02};
assign  cfg_array[028]  =       {8'h78, 16'h3600, 8'h37};
assign  cfg_array[029]  =       {8'h78, 16'h3601, 8'h33};
assign  cfg_array[030]  =       {8'h78, 16'h302d, 8'h60};
assign  cfg_array[031]  =       {8'h78, 16'h3620, 8'h52};
assign  cfg_array[032]  =       {8'h78, 16'h371b, 8'h20};
assign  cfg_array[033]  =       {8'h78, 16'h471c, 8'h50};
assign  cfg_array[034]  =       {8'h78, 16'h3a13, 8'h43};
assign  cfg_array[035]  =       {8'h78, 16'h3a18, 8'h00};
assign  cfg_array[036]  =       {8'h78, 16'h3a19, 8'hf8};
assign  cfg_array[037]  =       {8'h78, 16'h3635, 8'h13};
assign  cfg_array[038]  =       {8'h78, 16'h3636, 8'h06};
assign  cfg_array[039]  =       {8'h78, 16'h3634, 8'h44};     
assign  cfg_array[040]  =       {8'h78, 16'h3622, 8'h01};
assign  cfg_array[041]  =       {8'h78, 16'h3c01, 8'h34};
assign  cfg_array[042]  =       {8'h78, 16'h3c04, 8'h28};
assign  cfg_array[043]  =       {8'h78, 16'h3c05, 8'h98};
assign  cfg_array[044]  =       {8'h78, 16'h3c06, 8'h00};
assign  cfg_array[045]  =       {8'h78, 16'h3c07, 8'h08};
assign  cfg_array[046]  =       {8'h78, 16'h3c08, 8'h00};
assign  cfg_array[047]  =       {8'h78, 16'h3c09, 8'h1c};
assign  cfg_array[048]  =       {8'h78, 16'h3c0a, 8'h9c};
assign  cfg_array[049]  =       {8'h78, 16'h3c0b, 8'h40};
assign  cfg_array[050]  =       {8'h78, 16'h503d, 8'h00};       // 8'h80 : standard eight color bar,  8'h00: normal
assign  cfg_array[051]  =       {8'h78, 16'h3820, 8'h46};
assign  cfg_array[052]  =       {8'h78, 16'h300e, 8'h45};
assign  cfg_array[053]  =       {8'h78, 16'h4800, 8'h14};
assign  cfg_array[054]  =       {8'h78, 16'h302e, 8'h08};
assign  cfg_array[055]  =       {8'h78, 16'h4300, 8'h6f};
assign  cfg_array[056]  =       {8'h78, 16'h501f, 8'h01};
assign  cfg_array[057]  =       {8'h78, 16'h4713, 8'h03};
assign  cfg_array[058]  =       {8'h78, 16'h4407, 8'h04};
assign  cfg_array[059]  =       {8'h78, 16'h440e, 8'h00};    
assign  cfg_array[060]  =       {8'h78, 16'h460b, 8'h35};
assign  cfg_array[061]  =       {8'h78, 16'h460c, 8'h20};
assign  cfg_array[062]  =       {8'h78, 16'h3824, 8'h01};
assign  cfg_array[063]  =       {8'h78, 16'h5000, 8'h07};
assign  cfg_array[064]  =       {8'h78, 16'h5001, 8'h03};
assign  cfg_array[065]  =       {8'h78, 16'h3008, 8'h42};
assign  cfg_array[066]  =       {8'h78, 16'h3035, 8'h21};
assign  cfg_array[067]  =       {8'h78, 16'h3036, 8'h46};
assign  cfg_array[068]  =       {8'h78, 16'h3037, 8'h05};
assign  cfg_array[069]  =       {8'h78, 16'h3108, 8'h11};  
assign  cfg_array[070]  =       {8'h78, 16'h3034, 8'h1A};
assign  cfg_array[071]  =       {8'h78, 16'h3800, 8'h01}; // X address start high byte
assign  cfg_array[072]  =       {8'h78, 16'h3801, 8'h50}; // X address start low byte
assign  cfg_array[073]  =       {8'h78, 16'h3802, 8'h01}; // Y address start high byte
assign  cfg_array[074]  =       {8'h78, 16'h3803, 8'hAA};
assign  cfg_array[075]  =       {8'h78, 16'h3804, 8'h08}; // 
assign  cfg_array[076]  =       {8'h78, 16'h3805, 8'hEF}; // 
assign  cfg_array[077]  =       {8'h78, 16'h3806, 8'h05};
assign  cfg_array[078]  =       {8'h78, 16'h3807, 8'hF9};
assign  cfg_array[079]  =       {8'h78, 16'h3810, 8'h00};    
assign  cfg_array[080]  =       {8'h78, 16'h3811, 8'h10}; // 
assign  cfg_array[081]  =       {8'h78, 16'h3812, 8'h00};
assign  cfg_array[082]  =       {8'h78, 16'h3813, 8'h0C};
assign  cfg_array[083]  =       {8'h78, 16'h3808, 8'h07};       // X_OUTPUT_SIZE:16'h0520 -> 1280
assign  cfg_array[084]  =       {8'h78, 16'h3809, 8'h80};       
assign  cfg_array[085]  =       {8'h78, 16'h380a, 8'h04};       // Y_OUTPUT_SIZE:16'h02d0 -> 720
assign  cfg_array[086]  =       {8'h78, 16'h380b, 8'h38};       
assign  cfg_array[087]  =       {8'h78, 16'h380c, 8'h09};
assign  cfg_array[088]  =       {8'h78, 16'h380d, 8'hC4};
assign  cfg_array[089]  =       {8'h78, 16'h380e, 8'h04};  
assign  cfg_array[090]  =       {8'h78, 16'h380f, 8'h60};
assign  cfg_array[091]  =       {8'h78, 16'h3814, 8'h11};
assign  cfg_array[092]  =       {8'h78, 16'h3815, 8'h11};
assign  cfg_array[093]  =       {8'h78, 16'h3821, 8'h00};
assign  cfg_array[094]  =       {8'h78, 16'h4837, 8'h24};
assign  cfg_array[095]  =       {8'h78, 16'h3618, 8'h00};
assign  cfg_array[096]  =       {8'h78, 16'h3612, 8'h59};
assign  cfg_array[097]  =       {8'h78, 16'h3708, 8'h64};
assign  cfg_array[098]  =       {8'h78, 16'h3709, 8'h52};
assign  cfg_array[099]  =       {8'h78, 16'h370c, 8'h03};     
assign  cfg_array[100]  =       {8'h78, 16'h4300, 8'h00}; // Formatter RAW, [3:0]=0x0 BGBG/GRGR
assign  cfg_array[101]  =       {8'h78, 16'h501f, 8'h03}; // Format select ISP RAW (DPC)
assign  cfg_array[102]  =       {8'h78, 16'h3406, 8'h00};
assign  cfg_array[103]  =       {8'h78, 16'h5192, 8'h04};
assign  cfg_array[104]  =       {8'h78, 16'h5191, 8'hf8};
assign  cfg_array[105]  =       {8'h78, 16'h518d, 8'h26};
assign  cfg_array[106]  =       {8'h78, 16'h518f, 8'h42};
assign  cfg_array[107]  =       {8'h78, 16'h518e, 8'h2b};
assign  cfg_array[108]  =       {8'h78, 16'h5190, 8'h42};
assign  cfg_array[109]  =       {8'h78, 16'h518b, 8'hd0};       
assign  cfg_array[110]  =       {8'h78, 16'h518c, 8'hbd};
assign  cfg_array[111]  =       {8'h78, 16'h5187, 8'h18};
assign  cfg_array[112]  =       {8'h78, 16'h5188, 8'h18};
assign  cfg_array[113]  =       {8'h78, 16'h5189, 8'h56};
assign  cfg_array[114]  =       {8'h78, 16'h518a, 8'h5c};
assign  cfg_array[115]  =       {8'h78, 16'h5186, 8'h1c};
assign  cfg_array[116]  =       {8'h78, 16'h5181, 8'h50};
assign  cfg_array[117]  =       {8'h78, 16'h5184, 8'h20};
assign  cfg_array[118]  =       {8'h78, 16'h5182, 8'h11};
assign  cfg_array[119]  =       {8'h78, 16'h5183, 8'h00};        
assign  cfg_array[120]  =       {8'h78, 16'h5001, 8'h03};
assign  cfg_array[121]  =       {8'h78, 16'h3008, 8'h02};

//-----------------------------------------------------------------------------

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                start   <=      1'b0;
        else if(cfg_index == 'd0 && start == 1'b0)
                start   <=      1'b1;
        else if(busy_neg == 1'b1 && cfg_index < ANUM)
                start   <=      1'b1;
        else
                start   <=      1'b0;
end

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                cfg_index       <=      'd0;
        else if(cfg_index >= ANUM)
                cfg_index       <=      ANUM;
        else if(start == 1'b1)
                cfg_index       <=      cfg_index + 1'b1;
end

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                cnt_200us       <=      'd0;
        else if(cfg_index >= ANUM && cfg_done == 1'b0)
                cnt_200us       <=      cnt_200us + 1'b1;
end

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                busy_arr        <=      'd0;
        else
                busy_arr        <=      {busy_arr[1:0], busy}; 
end

assign  busy_neg        =       busy_arr[2] & ~busy_arr[1];
assign  iic_start       =       (cfg_done == 1'b1) ? 1'b0 : start;
assign  iic_wdata       =       (cfg_done == 1'b1) ? 'd0 : cfg_array[cfg_index];
assign  cfg_done        =       (cnt_200us >= DELAY_200US) ? 1'b1 : 1'b0;

ov5640_iic     ov5640_iic_inst(
        // system signals
        .sclk                   (sclk                   ),
        .s_rst_n                (s_rst_n                ),
        // IIC
        .iic_scl                (iic_scl                ),
        .iic_sda                (iic_sda                ),
        // Othesr
        .start                  (iic_start              ),
        .wdata                  (iic_wdata              ),
        .riic_data              (riic_data              ),
        .busy                   (busy                   )
);

endmodule
