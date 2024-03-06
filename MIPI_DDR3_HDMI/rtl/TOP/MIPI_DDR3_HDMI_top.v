`timescale 1ns / 1ps
module MIPI_DDR3_HDMI_top #(
    Mipi_Lane_Num = 2
)(
    input   wire                          I_Top_Sys_Clk       ,//50MHZ
    input   wire                          I_Top_Rst_n         ,  
//Mipi CSI            
    input   wire                          I_Mipi_phy_clk_p    ,
    input   wire                          I_Mipi_phy_clk_n    ,
    input   wire    [Mipi_Lane_Num-1:0]   I_Mipi_phy_lane_p   ,
    input   wire    [Mipi_Lane_Num-1:0]   I_Mipi_phy_lane_n   ,
//MIPI CCI
    output  wire                          O_Mipi_I2C_SCL      ,
    inout                                 IO_Mipi_I2C_SDA     ,
//MIPI Camera Config              
    output  wire                          O_Mipi_ls_GPIO      ,
    input   wire                          I_Mipi_ls_Clk_p     ,
    input   wire                          I_Mipi_ls_Clk_n     ,
    input   wire    [Mipi_Lane_Num-1:0]   I_Mipi_ls_Data_p    ,
    input   wire    [Mipi_Lane_Num-1:0]   I_Mipi_ls_Data_n    ,
    //ddr3
    output  wire    [13:0]	              ddr3_addr           ,              
    output  wire    [2:0]		          ddr3_ba             ,          
    output  wire    			          ddr3_cas_n          ,              
    output  wire       		              ddr3_ck_n           ,              
    output  wire       		              ddr3_ck_p           ,              
    output  wire       		              ddr3_cke            ,              
    output  wire    			          ddr3_ras_n          ,              
    output  wire    			          ddr3_reset_n        ,                  
    output  wire    			          ddr3_we_n           ,              
    inout   wire    [15:0]		          ddr3_dq             ,          
    inout   wire    [1:0]		          ddr3_dqs_n          ,              
    inout   wire    [1:0]		          ddr3_dqs_p          ,              
    output  wire       		              ddr3_cs_n           ,              
    output  wire    [1:0]		          ddr3_dm             ,          
    output  wire       		              ddr3_odt            ,
    //Hdmi    
    output  wire                          O_Tmds_Clk_p        ,
    output  wire                          O_Tmds_Clk_n        ,
    output  wire    [2:0]                 O_Tmds_data_p       ,
    output  wire    [2:0]                 O_Tmds_data_n       
    );

//--------------------------------Port Defination----------------------------------//
//pll                   
    //PLL 0                 
            wire                    clk_50MHZ           ;      
            wire                    clk_100MHZ          ;      
            wire                    clk_200MHZ          ;      
            wire                    LOCK_0              ;  
    //PLL 1                 
            wire                    clk_PIXEL           ;
            wire                    clk_5xPIXEL         ;
            wire                    LOCK_1              ;  
//MIG       
            wire                    ui_clk              ;
            wire        			init_calib_complete ;
        //aw
            wire    [3:0]	        s_axi_awid          ;
            wire    [27:0]	        s_axi_awaddr        ;
            wire    [7:0]	        s_axi_awlen         ;
            wire    [2:0]	        s_axi_awsize        ;
            wire    [1:0]	        s_axi_awburst       ;
            wire        	        s_axi_awlock        ;
            wire    [3:0]	        s_axi_awcache       ;
            wire    [2:0]	        s_axi_awprot        ;
            wire    [3:0]	        s_axi_awqos         ;
            wire     		        s_axi_awvalid       ;
            wire			        s_axi_awready       ;
        //w
            wire    [127:0]	        s_axi_wdata         ;
            wire    [15:0]	        s_axi_wstrb         ;
            wire			        s_axi_wlast         ;
            wire 			        s_axi_wvalid        ;
            wire	    	        s_axi_wready        ;
        //b
            wire    [3:0]	        s_axi_bid           ;
            wire    [1:0]	        s_axi_bresp         ;
            wire    		        s_axi_bvalid        ;
            wire 			        s_axi_bready        ;
        //ar
            wire    [3:0]	        s_axi_arid          ;
            wire    [26:0]	        s_axi_araddr        ;
            wire    [7:0]	        s_axi_arlen         ;
            wire    [2:0]	        s_axi_arsize        ;
            wire    [1:0]	        s_axi_arburst       ;
            wire        	        s_axi_arlock        ;
            wire    [3:0]	        s_axi_arcache       ;
            wire    [2:0]	        s_axi_arprot        ;
            wire    [3:0]	        s_axi_arqos         ;
            wire 			        s_axi_arvalid       ;
            wire    		        s_axi_arready       ;
        //r
            wire    [3:0]	        s_axi_rid           ;
            wire    [127:0]	        s_axi_rdata         ;
            wire    [1:0]	        s_axi_rresp         ;
            wire			        s_axi_rlast         ;
            wire			        s_axi_rvalid        ;
            wire     		        s_axi_rready        ;
        //Mig ctrl
            wire                    Aw_Wr_trigger       ;
            wire                    wdata_fifo_Rd_en    ;
            wire    [127:0]         wdata_fifo_Rd_data  ;
            wire                    R_Rd_trigger        ;
            wire                    rdata_fifo_Wr_en    ;
            wire    [127:0]         rdata_fifo_wr_data  ;
            wire                    post_start          ;
            wire                    Rd_Start_FIFO       ;
        //Mipi CCI
            wire                    OV5640_ConFigSet_done;
        //Mipi_raw10_depacker
            wire    [40-1:0]        Mipi_raw10_depacker_Data   ;
            wire                    Mipi_raw10_depacker_Vaild  ;
            wire                    Mipi_CSI_Byte_CLK          ;
            wire                    Mipi_Unpacket_V_sync       ;
            wire    [127:0]         O_Pixel_Data               ;     
            wire                    O_Pixel_Vaild              ;
        //HDMI
            wire                    rdata_fifo_rd_en    ;
            wire    [15:0]          rdata_fifo_rd_data  ;
            wire                    VGA_Sync            ;
//--------------------------------Port Defination----------------------------------//

//--------------------------------Main Code----------------------------------------//
//--------------------------------Main Code----------------------------------------//

//--------------------------------Instance-----------------------------------------//
    //PLL
    clk_wiz_0 PLL_0 (
        // Clock out ports
        .clk_50MHZ      ( clk_50MHZ  ),     // output clk_50MHZ
        .clk_100MHZ     ( clk_100MHZ ),     // output clk_100MHZ
        .clk_200MHZ     ( clk_200MHZ ),     // output clk_200MHZ
        // Status and control signals
        .reset          (!I_Top_Rst_n),       // input reset
        .locked         ( LOCK_0     ),       // output locked
        // Clock in ports
        .Sys_50MHZ      ( I_Top_Sys_Clk )      // input clk_50
    );
    clk_wiz_1 PLL_1(
        // Clock out ports
        .clk_PIXEL      ( clk_PIXEL   ),     // output clk_PIXEL
        .clk_5xPIXEL    ( clk_5xPIXEL ),     // output clk_5xPIXEL
        // Status and control signals
        .reset          ( !LOCK_0     ),     // input reset
        .locked         ( LOCK_1      ),     // output locked
        // Clock in ports
        .clk_100_IN     ( clk_100MHZ  )      // input clk_100_IN
    ); 
    IIC_Camera_Config  u_IIC_Camera_Config (
        .I_Top_Sys_Clk           ( clk_50MHZ             ),
        .I_Top_Rst_n             ( LOCK_0                ),
        .I_Mipi_ls_Clk_p         ( I_Mipi_ls_Clk_p       ),
        .I_Mipi_ls_Clk_n         ( I_Mipi_ls_Clk_n       ),
        .I_Mipi_ls_Data_p        ( I_Mipi_ls_Data_p      ),
        .I_Mipi_ls_Data_n        ( I_Mipi_ls_Data_n      ),

        .O_Mipi_I2C_SCL          ( O_Mipi_I2C_SCL        ),
        .O_Mipi_ls_GPIO          ( O_Mipi_ls_GPIO        ),
        .OV5640_ConFigSet_done   ( OV5640_ConFigSet_done ),

        .IO_Mipi_I2C_SDA         ( IO_Mipi_I2C_SDA       )
    );
    Mipi_camera_top  u_Mipi_top (
        .I_Top_Rst_n                  ( LOCK_0 && 
                                        init_calib_complete && 
                                        OV5640_ConFigSet_done),
        .I_Mipi_phy_clk_p             ( I_Mipi_phy_clk_p             ),
        .I_Mipi_phy_clk_n             ( I_Mipi_phy_clk_n             ),
        .I_Mipi_phy_lane_p            ( I_Mipi_phy_lane_p            ),
        .I_Mipi_phy_lane_n            ( I_Mipi_phy_lane_n            ),

        .O_Mipi_raw10_depacker_Data   ( Mipi_raw10_depacker_Data     ),
        .O_Mipi_raw10_depacker_Vaild  ( Mipi_raw10_depacker_Vaild    ),
        .O_Mipi_CSI_Byte_CLK          ( Mipi_CSI_Byte_CLK            ),
        .O_Mipi_Unpacket_V_sync       ( Mipi_Unpacket_V_sync         )
    );
    wdata_rdata_fifo wdata_rdata_fifo(
        .Rst_n                   ( LOCK_1                              ),
        .rd_fifo_rst             ( VGA_Sync                            ),
        .wr_fifo_rst             ( Mipi_Unpacket_V_sync                ),
        .wdata_fifo_wr_clk       ( Mipi_CSI_Byte_CLK                   ),
        .wdata_fifo_rd_clk       ( ui_clk                              ),

        .wdata_fifo_wr_vaild     ( Mipi_raw10_depacker_Vaild           ),
        .wdata_fifo_wr_data      ( Mipi_raw10_depacker_Data            ),

        .wdata_fifo_rd_en        ( wdata_fifo_Rd_en                    ),
        .wdata_fifo_rd_data      ( wdata_fifo_Rd_data                  ),

        .rdata_fifo_wr_clk       ( ui_clk                              ),
        .rdata_fifo_rd_clk       ( clk_PIXEL                           ),

        .rdata_fifo_wr_en        ( rdata_fifo_Wr_en                    ),
        .rdata_fifo_wr_data      ( rdata_fifo_wr_data                  ),

        .rdata_fifo_rd_en        ( rdata_fifo_rd_en                    ),
        .rdata_fifo_rd_data      ( rdata_fifo_rd_data                  ),
        .Wr_req                  ( Aw_Wr_trigger                       ),
        .Rd_req                  ( R_Rd_trigger                        ),
        .Rd_Start                ( Rd_Start_FIFO                       )
    );
    HDMI_Process_top  u_Hdmi_top (
        .Pixl_CLK                ( clk_PIXEL           ),
        .Pixl_5xCLK              ( clk_5xPIXEL         ),
        .Rst_n                   ( LOCK_1 && 
                                   init_calib_complete &&
                                   Rd_Start_FIFO),

        .rdata_fifo_rd_data      ( rdata_fifo_rd_data  ),
        .rdata_fifo_rd_en        ( rdata_fifo_rd_en    ),
        .Tmds_Clk_p              ( O_Tmds_Clk_p        ),
        .Tmds_Clk_n              ( O_Tmds_Clk_n        ),
        .Tmds_data_p             ( O_Tmds_data_p       ),
        .Tmds_data_n             ( O_Tmds_data_n       ),
        .O_VGA_Sync              ( VGA_Sync            )
    );
    DMA_Custom DMA_Custom(
        .ui_clk                  ( ui_clk             ),
        .Rst_INIT_DONE           ( init_calib_complete),
     //Control
        .Rd_Rst_Sync             ( VGA_Sync            ), 
        .Wr_Rst_Sync             ( Mipi_Unpacket_V_sync),
        .Wr_Clk                  ( Mipi_CSI_Byte_CLK   ),
        .Rd_Clk                  ( clk_PIXEL           ),

        .Aw_Wr_trigger           ( Aw_Wr_trigger      ),
        .wdata_fifo_Rd_en        ( wdata_fifo_Rd_en   ),
        .wdata_fifo_Rd_data      ( wdata_fifo_Rd_data ),
        .R_Rd_trigger            ( R_Rd_trigger       ),
        .rdata_fifo_Wr_en        ( rdata_fifo_Wr_en   ),
        .rdata_fifo_wr_data      ( rdata_fifo_wr_data ),
     //aw
        .m_axi_awid              ( s_axi_awid         ),
        .m_axi_awaddr            ( s_axi_awaddr       ),
        .m_axi_awlen             ( s_axi_awlen        ),
        .m_axi_awsize            ( s_axi_awsize       ),
        .m_axi_awburst           ( s_axi_awburst      ),
        .m_axi_awlock            ( s_axi_awlock       ),
        .m_axi_awcache           ( s_axi_awcache      ),
        .m_axi_awprot            ( s_axi_awprot       ),
        .m_axi_awqos             ( s_axi_awqos        ),
        .m_axi_awvalid           ( s_axi_awvalid      ),
        .m_axi_awready           ( s_axi_awready      ),
     //w
        .m_axi_wdata             ( s_axi_wdata        ),
        .m_axi_wstrb             ( s_axi_wstrb        ),
        .m_axi_wlast             ( s_axi_wlast        ),
        .m_axi_wvalid            ( s_axi_wvalid       ),
        .m_axi_wready            ( s_axi_wready       ),
     //b
        .m_axi_bid               ( s_axi_bid          ),
        .m_axi_bresp             ( s_axi_bresp        ),
        .m_axi_bvalid            ( s_axi_bvalid       ),
        .m_axi_bready            ( s_axi_bready       ),
     //ar
        .m_axi_arid              ( s_axi_arid         ),
        .m_axi_araddr            ( s_axi_araddr       ),
        .m_axi_arlen             ( s_axi_arlen        ),
        .m_axi_arsize            ( s_axi_arsize       ),
        .m_axi_arburst           ( s_axi_arburst      ),
        .m_axi_arlock            ( s_axi_arlock       ),
        .m_axi_arcache           ( s_axi_arcache      ),
        .m_axi_arprot            ( s_axi_arprot       ),
        .m_axi_arqos             ( s_axi_arqos        ),
        .m_axi_arvalid           ( s_axi_arvalid      ),
        .m_axi_arready           ( s_axi_arready      ),
     //r
        .m_axi_rid               ( s_axi_rid          ),
        .m_axi_rdata             ( s_axi_rdata        ),
        .m_axi_rresp             ( s_axi_rresp        ),
        .m_axi_rlast             ( s_axi_rlast        ),
        .m_axi_rvalid            ( s_axi_rvalid       ),
        .m_axi_rready            ( s_axi_rready       )
    );
    mig_7series_0 u_mig_7series_0 (
     // Memory interface ports
        .ddr3_addr                      (ddr3_addr),            // output [13:0]	ddr3_addr
        .ddr3_ba                        (ddr3_ba),              // output [2:0]		ddr3_ba
        .ddr3_cas_n                     (ddr3_cas_n),           // output			ddr3_cas_n
        .ddr3_ck_n                      (ddr3_ck_n),            // output [0:0]		ddr3_ck_n
        .ddr3_ck_p                      (ddr3_ck_p),            // output [0:0]		ddr3_ck_p
        .ddr3_cke                       (ddr3_cke),             // output [0:0]		ddr3_cke
        .ddr3_ras_n                     (ddr3_ras_n),           // output			ddr3_ras_n
        .ddr3_reset_n                   (ddr3_reset_n),         // output			ddr3_reset_n
        .ddr3_we_n                      (ddr3_we_n),            // output			ddr3_we_n
        .ddr3_dq                        (ddr3_dq),              // inout [15:0]		ddr3_dq
        .ddr3_dqs_n                     (ddr3_dqs_n),           // inout [1:0]		ddr3_dqs_n
        .ddr3_dqs_p                     (ddr3_dqs_p),           // inout [1:0]		ddr3_dqs_p
        .init_calib_complete            (init_calib_complete),  // output			init_calib_complete
        .ddr3_cs_n                      (ddr3_cs_n),            // output [0:0]		ddr3_cs_n
        .ddr3_dm                        (ddr3_dm),              // output [1:0]		ddr3_dm
        .ddr3_odt                       (ddr3_odt),             // output [0:0]		ddr3_odt
     // Application interface ports
        .ui_clk                         (ui_clk),               // output			ui_clk
        .ui_clk_sync_rst                (),                     // output			ui_clk_sync_rst
        .mmcm_locked                    (),                     // output			mmcm_locked
        .aresetn                        (LOCK_0),               // input			aresetn
        .app_sr_req                     (1'b0),                 // input			app_sr_req
        .app_ref_req                    (1'b0),                 // input			app_ref_req
        .app_zq_req                     (1'b0),                 // input			app_zq_req
        .app_sr_active                  (),                     // output			app_sr_active
        .app_ref_ack                    (),                     // output			app_ref_ack
        .app_zq_ack                     (),                     // output			app_zq_ack
     // Slave Interface Write Address Ports
        .s_axi_awid                     (s_axi_awid),           // input [3:0]			s_axi_awid
        .s_axi_awaddr                   (s_axi_awaddr),         // input [27:0]			s_axi_awaddr
        .s_axi_awlen                    (s_axi_awlen),          // input [7:0]			s_axi_awlen
        .s_axi_awsize                   (s_axi_awsize),         // input [2:0]			s_axi_awsize
        .s_axi_awburst                  (s_axi_awburst),        // input [1:0]			s_axi_awburst
        .s_axi_awlock                   (s_axi_awlock),         // input [0:0]			s_axi_awlock
        .s_axi_awcache                  (s_axi_awcache),        // input [3:0]			s_axi_awcache
        .s_axi_awprot                   (s_axi_awprot),         // input [2:0]			s_axi_awprot
        .s_axi_awqos                    (s_axi_awqos),          // input [3:0]			s_axi_awqos
        .s_axi_awvalid                  (s_axi_awvalid),        // input			    s_axi_awvalid
        .s_axi_awready                  (s_axi_awready),        // output			    s_axi_awready
     // Slave Interface Write Data Ports
        .s_axi_wdata                    (s_axi_wdata),          // input [127:0]		s_axi_wdata
        .s_axi_wstrb                    (s_axi_wstrb),          // input [15:0]			s_axi_wstrb
        .s_axi_wlast                    (s_axi_wlast),          // input			    s_axi_wlast
        .s_axi_wvalid                   (s_axi_wvalid),         // input			    s_axi_wvalid
        .s_axi_wready                   (s_axi_wready),         // output			    s_axi_wready
     // Slave Interface Write Response Ports
        .s_axi_bid                      (s_axi_bid),            // output [3:0]			s_axi_bid
        .s_axi_bresp                    (s_axi_bresp),          // output [1:0]			s_axi_bresp
        .s_axi_bvalid                   (s_axi_bvalid),         // output			    s_axi_bvalid
        .s_axi_bready                   (s_axi_bready),         // input			    s_axi_bready
     // Slave Interface Read Address Ports
        .s_axi_arid                     (s_axi_arid),           // input [3:0]			s_axi_arid
        .s_axi_araddr                   (s_axi_araddr),         // input [27:0]			s_axi_araddr
        .s_axi_arlen                    (s_axi_arlen),          // input [7:0]			s_axi_arlen
        .s_axi_arsize                   (s_axi_arsize),         // input [2:0]			s_axi_arsize
        .s_axi_arburst                  (s_axi_arburst),        // input [1:0]			s_axi_arburst
        .s_axi_arlock                   (s_axi_arlock),         // input [0:0]			s_axi_arlock
        .s_axi_arcache                  (s_axi_arcache),        // input [3:0]			s_axi_arcache
        .s_axi_arprot                   (s_axi_arprot),         // input [2:0]			s_axi_arprot
        .s_axi_arqos                    (s_axi_arqos),          // input [3:0]			s_axi_arqos
        .s_axi_arvalid                  (s_axi_arvalid),        // input			    s_axi_arvalid
        .s_axi_arready                  (s_axi_arready),        // output			    s_axi_arready
     // Slave Interface Read Data Ports
        .s_axi_rid                      (s_axi_rid),            // output [3:0]			s_axi_rid
        .s_axi_rdata                    (s_axi_rdata),          // output [127:0]		s_axi_rdata
        .s_axi_rresp                    (s_axi_rresp),          // output [1:0]			s_axi_rresp
        .s_axi_rlast                    (s_axi_rlast),          // output			    s_axi_rlast
        .s_axi_rvalid                   (s_axi_rvalid),         // output			    s_axi_rvalid
        .s_axi_rready                   (s_axi_rready),         // input			    s_axi_rready
     // System Clock Ports
        .sys_clk_i                      (clk_200MHZ),           // input			    sys_clk_i
        .sys_rst                        (LOCK_0)                // input                sys_rst
    );
//--------------------------------Instance-----------------------------------------//
endmodule