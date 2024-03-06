module  top(
        // Memory interface ports
        output  wire    [13:0]  ddr3_addr               ,
        output  wire    [ 2:0]  ddr3_ba                 ,
        output  wire            ddr3_cas_n              ,
        output  wire            ddr3_ck_n               ,
        output  wire            ddr3_ck_p               ,
        output  wire            ddr3_cke                ,
        output  wire            ddr3_ras_n              ,
        output  wire            ddr3_reset_n            ,
        output  wire            ddr3_we_n               ,
        inout           [15:0]  ddr3_dq                 ,
        inout           [ 1:0]  ddr3_dqs_n              ,
        inout           [ 1:0]  ddr3_dqs_p              ,
        output  wire            ddr3_cs_n               ,
        output  wire    [ 1:0]  ddr3_dm                 ,
        output  wire            ddr3_odt                ,
        // system signals
        input                   clk_50m                 ,       // 50MHz
        input                   sys_rst_n               ,
        // RS232
        input                   rs232_rx                ,
        // HDMI
        output  wire            hdmi_clk_p              ,       
        output  wire            hdmi_clk_n              ,       
        output  wire    [ 2:0]  hdmi_data_p             ,       
        output  wire    [ 2:0]  hdmi_data_n             ,
        // MIPI
        input                   mipi_clk_p              ,
        input                   mipi_clk_n              ,
        input           [ 1:0]  mipi_data_p             ,
        input           [ 1:0]  mipi_data_n             ,
        output  wire            mipi_scl                ,       
        inout                   mipi_sda                ,       
        output  wire            mipi_gpio               ,       
        input                   ls_clk_p                ,       
        input                   ls_clk_n                ,       
        input           [ 1:0]  ls_data_p               ,       
        input           [ 1:0]  ls_data_n                              
);

//========================================================================\
// =========== Define Parameter and Internal signals =========== 
//========================================================================/
// Write Address Ports
wire    [ 3:0]  m_axi_awid              ;
wire    [27:0]  m_axi_awaddr            ;
wire    [ 7:0]  m_axi_awlen             ;
wire    [ 2:0]  m_axi_awsize            ;
wire    [ 1:0]  m_axi_awburst           ;
wire            m_axi_awlock            ;    
wire    [ 3:0]  m_axi_awcache           ;
wire    [ 2:0]  m_axi_awprot            ;
wire    [ 3:0]  m_axi_awqos             ;
wire            m_axi_awvalid           ;
wire            m_axi_awready           ;
// Write Data Ports                             
wire    [127:0] m_axi_wdata             ;
wire    [15:0]  m_axi_wstrb             ;
wire            m_axi_wlast             ;
wire            m_axi_wvalid            ;
wire            m_axi_wready            ;
// Write Response Ports                    
wire    [ 3:0]  m_axi_bid               ;
wire    [ 1:0]  m_axi_bresp             ;
wire            m_axi_bvalid            ;
wire            m_axi_bready            ;
// Read Address Ports                       
wire    [ 3:0]  m_axi_arid              ;
wire    [27:0]  m_axi_araddr            ;
wire    [ 7:0]  m_axi_arlen             ;
wire    [ 2:0]  m_axi_arsize            ;
wire    [ 1:0]  m_axi_arburst           ;
wire            m_axi_arlock            ;
wire    [ 3:0]  m_axi_arcache           ;
wire    [ 2:0]  m_axi_arprot            ;
wire    [ 3:0]  m_axi_arqos             ;
wire            m_axi_arvalid           ;
wire            m_axi_arready           ;
// Read Data Ports                        
wire    [ 3:0]  m_axi_rid               ;
wire    [127:0] m_axi_rdata             ;
wire    [ 1:0]  m_axi_rresp             ;
wire            m_axi_rlast             ;
wire            m_axi_rvalid            ;
wire            m_axi_rready            ;


wire                            ui_clk                          ;       
wire                            init_calib_complete             ;       


wire    [ 7:0]                  rx_data                         ;       
wire                            rx_data_vld                     ;   
wire    [127:0]                 wfifo_rd_data                   ;
wire                            wfifo_rd_en                     ;       
wire                            wr_trig                         ;       

wire                            sys_50m                         ;       
wire                            sys_100m                        ;       
wire                            sys_200m                        ;       
wire                            pll0_locked                     ;       
wire                            pll1_locked                     ;       

wire                            sys_74p25m                      ;       
wire                            sys_371p25m                     ;       


// RFIFO
wire                            rfifo_wr_en                     ;       
wire    [127:0]                 rfifo_wr_data                   ;       

wire                            rd_trig                         ;       

wire                            rfifo_rd_en                     ;       
wire    [15:0]                  rfifo_rd_data                   ;       

wire                            cfg_done                        ;       
wire                            pixel_clk                       ;       
wire                            pixel_vld                       ;       
wire    [39:0]                  pixel_data                      ;     
reg     [ 5:0]                  div_cnt                         ;  

wire                            vga_vsync                       ;     
reg     [20:0]                  dly_cnt                         ;   
//=============================================================================
//**************    Main Code   **************
//=============================================================================
always  @(posedge sys_50m or negedge pll0_locked) begin
        if(pll0_locked == 1'b0)
                div_cnt <=      'd0;
        else
                div_cnt <=      div_cnt + 1'b1; 
end

assign  mipi_gpio       =       1'b1;

always  @(posedge sys_50m or negedge pll0_locked) begin
        if(pll0_locked == 1'b0)
                dly_cnt <=      'd0;
        else if(dly_cnt[20] == 1'b0)
                dly_cnt <=      dly_cnt + 1'b1; 
end

clk_wiz_0 clk_wiz_0(
        // Clock out ports
        .clk_out1               (sys_50m                ),     // output clk_out1
        .clk_out2               (sys_100m               ),     // output clk_out2
        .clk_out3               (sys_200m               ),     // output clk_out3
         // Status and control signals
        .reset                  (~sys_rst_n             ), // input reset
        .locked                 (pll0_locked            ),       // output locked
        // Clock in ports
        .clk_in1                (clk_50m                )// input clk_in1
);

clk_wiz_1 clk_wiz_1(
        // Clock out ports
        .clk_out1               (sys_74p25m             ),     // output clk_out1
        .clk_out2               (sys_371p25m            ),     // output clk_out2
        // Status and control signals
        .reset                  (~pll0_locked           ), // input reset
        .locked                 (pll1_locked            ),       // output locked
        // Clock in ports
        .clk_in1                (sys_100m               )// input clk_in1
);

ov5640_cfg      ov5640_cfg_inst(
        // system signals
        .sclk                   (div_cnt[5]             ),
        .s_rst_n                (dly_cnt[20] & pll0_locked),
        // IIC Interfaces
        .iic_scl                (mipi_scl               ),
        .iic_sda                (mipi_sda               ),
        // Debug Interfaces
        .cfg_done               (cfg_done               )
);

mipi_top        mipi_top_inst(
        // system signals
        .s_rst_n                (pll0_locked & cfg_done & init_calib_complete),
        // 
        .mipi_clk_p             (mipi_clk_p             ),
        .mipi_clk_n             (mipi_clk_n             ),
        .mipi_data_p            (mipi_data_p            ),
        .mipi_data_n            (mipi_data_n            ),
        // 
        .pixel_clk              (pixel_clk              ),       
        .pixel_vld              (pixel_vld              ),       
        .pixel_data             (pixel_data             )       //      
);

/* uart_rx         uart_rx_inst(
        // system signals
        .sclk                   (sys_50m                ),
        .s_rst_n                (pll0_locked            ),
        // RS232
        .rs232_rx               (rs232_rx               ),
        // 
        .rx_data                (rx_data                ),
        .rx_data_vld            (rx_data_vld            )
); */

fifo_ctrl       fifo_ctrl_inst(
        // system signals
        .s_rst_n                (pll1_locked            ),
        // UART
        .pixel_data             (pixel_data             ),
        .pixel_vld              (pixel_vld              ),
        // WFIFO
        .wfifo_wr_clk           (pixel_clk              ),

        .wfifo_rd_clk           (ui_clk                 ),
        .wfifo_rd_en            (wfifo_rd_en            ),
        .wfifo_rd_data          (wfifo_rd_data          ),
        .wr_trig                (wr_trig                ),
        // RFIFO
        .rfifo_wr_clk           (ui_clk                 ),
        .rfifo_wr_en            (rfifo_wr_en            ),
        .rfifo_wr_data          (rfifo_wr_data          ),

        .rd_trig                (rd_trig                ),
        .vga_vsync              (vga_vsync              ),

        .rfifo_rd_clk           (sys_74p25m             ),
        .rfifo_rd_en            (rfifo_rd_en            ),
        .rfifo_rd_data          (rfifo_rd_data          )
);

axi4_master_ctrl        axi4_master_ctrl_inst(
        // system signals
        .sclk                   (ui_clk                 ),
        .s_rst_n                (init_calib_complete    ),
        // Write Address Ports
        .m_axi_awid             (m_axi_awid             ),
        .m_axi_awaddr           (m_axi_awaddr           ),
        .m_axi_awlen            (m_axi_awlen            ),
        .m_axi_awsize           (m_axi_awsize           ),
        .m_axi_awburst          (m_axi_awburst          ),
        .m_axi_awlock           (m_axi_awlock           ),
        .m_axi_awcache          (m_axi_awcache          ),
        .m_axi_awprot           (m_axi_awprot           ),
        .m_axi_awqos            (m_axi_awqos            ),
        .m_axi_awvalid          (m_axi_awvalid          ),
        .m_axi_awready          (m_axi_awready          ),
        // Write Data Ports                             
        .m_axi_wdata            (m_axi_wdata            ),
        .m_axi_wstrb            (m_axi_wstrb            ),
        .m_axi_wlast            (m_axi_wlast            ),
        .m_axi_wvalid           (m_axi_wvalid           ),
        .m_axi_wready           (m_axi_wready           ),
        // Write Response Ports                         
        .m_axi_bid              (m_axi_bid              ),
        .m_axi_bresp            (m_axi_bresp            ),
        .m_axi_bvalid           (m_axi_bvalid           ),
        .m_axi_bready           (m_axi_bready           ),
        // Read Address Ports                            
        .m_axi_arid             (m_axi_arid             ),
        .m_axi_araddr           (m_axi_araddr           ),
        .m_axi_arlen            (m_axi_arlen            ),
        .m_axi_arsize           (m_axi_arsize           ),
        .m_axi_arburst          (m_axi_arburst          ),
        .m_axi_arlock           (m_axi_arlock           ),
        .m_axi_arcache          (m_axi_arcache          ),
        .m_axi_arprot           (m_axi_arprot           ),
        .m_axi_arqos            (m_axi_arqos            ),
        .m_axi_arvalid          (m_axi_arvalid          ),
        .m_axi_arready          (m_axi_arready          ),
        // Read Data Ports                              
        .m_axi_rid              (m_axi_rid              ),
        .m_axi_rdata            (m_axi_rdata            ),
        .m_axi_rresp            (m_axi_rresp            ),
        .m_axi_rlast            (m_axi_rlast            ),
        .m_axi_rvalid           (m_axi_rvalid           ),
        .m_axi_rready           (m_axi_rready           ),
        //WFIFO
        .wr_trig                (wr_trig                ),
        .wfifo_rd_en            (wfifo_rd_en            ),
        .wfifo_rd_data          (wfifo_rd_data          ),
        // RFIFO
        .vga_vsync              (vga_vsync              ),
        .rd_trig                (rd_trig                ),
        .rfifo_wr_en            (rfifo_wr_en            ),
        .rfifo_wr_data          (rfifo_wr_data          )
);

hdmi_top        hdmi_top_inst(
        // system signals
        .fast_clk               (sys_371p25m            ),
        .low_clk                (sys_74p25m             ),
        .s_rst_n                (pll1_locked & init_calib_complete),
        // FIFO
        .fifo_rd_en             (rfifo_rd_en            ),
        .fifo_rd_data           (rfifo_rd_data          ),
        .vga_vsync              (vga_vsync              ),
        // HDMI
        .hdmi_clk_p             (hdmi_clk_p             ),
        .hdmi_clk_n             (hdmi_clk_n             ),
        .hdmi_data_p            (hdmi_data_p            ),
        .hdmi_data_n            (hdmi_data_n            )
);

mig_7series_0 u_mig_7series_0 (
        // Memory interface ports
        // 以ddr3_为前�?的这�?类端口，是与DDR3芯片相连
        .ddr3_addr              (ddr3_addr              ),  // output [13:0]		ddr3_addr
        .ddr3_ba                (ddr3_ba                ),  // output [2:0]		ddr3_ba
        .ddr3_cas_n             (ddr3_cas_n             ),  // output			ddr3_cas_n
        .ddr3_ck_n              (ddr3_ck_n              ),  // output [0:0]		ddr3_ck_n
        .ddr3_ck_p              (ddr3_ck_p              ),  // output [0:0]		ddr3_ck_p
        .ddr3_cke               (ddr3_cke               ),  // output [0:0]		ddr3_cke
        .ddr3_ras_n             (ddr3_ras_n             ),  // output			ddr3_ras_n
        .ddr3_reset_n           (ddr3_reset_n           ),  // output			ddr3_reset_n
        .ddr3_we_n              (ddr3_we_n              ),  // output			ddr3_we_n
        .ddr3_dq                (ddr3_dq                ),  // inout [15:0]		ddr3_dq
        .ddr3_dqs_n             (ddr3_dqs_n             ),  // inout [1:0]		ddr3_dqs_n
        .ddr3_dqs_p             (ddr3_dqs_p             ),  // inout [1:0]		ddr3_dqs_p
        .ddr3_cs_n              (ddr3_cs_n              ),  // output [0:0]		ddr3_cs_n
        .ddr3_dm                (ddr3_dm                ),  // output [1:0]		ddr3_dm
        .ddr3_odt               (ddr3_odt               ),  // output [0:0]		ddr3_odt
        // Application interface ports
        // init_calib_complete 拉高之前，不操作AXI接口
        .init_calib_complete    (init_calib_complete    ),  // output			init_calib_complete
        // AXI接口信号�?要与ui_clk 保持同步
        .ui_clk                 (ui_clk                 ),  // output			ui_clk
        .ui_clk_sync_rst        (                       ),  // output			ui_clk_sync_rst
        .mmcm_locked            (                       ),  // output			mmcm_locked
        .aresetn                (pll0_locked            ),  // input			aresetn
        .app_sr_req             (1'b0                   ),  // input			app_sr_req
        .app_ref_req            (1'b0                   ),  // input			app_ref_req
        .app_zq_req             (1'b0                   ),  // input			app_zq_req
        .app_sr_active          (                       ),  // output			app_sr_active
        .app_ref_ack            (                       ),  // output			app_ref_ack
        .app_zq_ack             (                       ),  // output			app_zq_ack
        
//////////////////////////////////////////////////////////
    // 从这里开始，是AXI4相关的端�?
        // Slave Interface Write Address Ports
        .s_axi_awid             (m_axi_awid             ),  // input [3:0]	        s_axi_awid
        .s_axi_awaddr           (m_axi_awaddr           ),  // input [27:0]	        s_axi_awaddr
        .s_axi_awlen            (m_axi_awlen            ),  // input [7:0]	        s_axi_awlen
        .s_axi_awsize           (m_axi_awsize           ),  // input [2:0]	        s_axi_awsize
        .s_axi_awburst          (m_axi_awburst          ),  // input [1:0]	        s_axi_awburst
        .s_axi_awlock           (m_axi_awlock           ),  // input [0:0]	        s_axi_awlock
        .s_axi_awcache          (m_axi_awcache          ),  // input [3:0]	        s_axi_awcache
        .s_axi_awprot           (m_axi_awprot           ),  // input [2:0]	        s_axi_awprot
        .s_axi_awqos            (m_axi_awqos            ),  // input [3:0]	        s_axi_awqos
        .s_axi_awvalid          (m_axi_awvalid          ),  // input			s_axi_awvalid
        .s_axi_awready          (m_axi_awready          ),  // output			s_axi_awready
        // Slave Interface Write Data Ports
        .s_axi_wdata            (m_axi_wdata            ),  // input [127:0]	        s_axi_wdata
        .s_axi_wstrb            (m_axi_wstrb            ),  // input [15:0]	        s_axi_wstrb
        .s_axi_wlast            (m_axi_wlast            ),  // input			s_axi_wlast
        .s_axi_wvalid           (m_axi_wvalid           ),  // input			s_axi_wvalid
        .s_axi_wready           (m_axi_wready           ),  // output			s_axi_wready
        // Slave Interface Write Response Ports
        .s_axi_bid              (m_axi_bid              ),  // output [3:0]	        s_axi_bid
        .s_axi_bresp            (m_axi_bresp            ),  // output [1:0]	        s_axi_bresp
        .s_axi_bvalid           (m_axi_bvalid           ),  // output			s_axi_bvalid
        .s_axi_bready           (m_axi_bready           ),  // input			s_axi_bready
        // Slave Interface Read Address Ports
        .s_axi_arid             (m_axi_arid             ),  // input [3:0]	        s_axi_arid
        .s_axi_araddr           (m_axi_araddr           ),  // input [27:0]	        s_axi_araddr
        .s_axi_arlen            (m_axi_arlen            ),  // input [7:0]	        s_axi_arlen
        .s_axi_arsize           (m_axi_arsize           ),  // input [2:0]	        s_axi_arsize
        .s_axi_arburst          (m_axi_arburst          ),  // input [1:0]	        s_axi_arburst
        .s_axi_arlock           (m_axi_arlock           ),  // input [0:0]	        s_axi_arlock
        .s_axi_arcache          (m_axi_arcache          ),  // input [3:0]	        s_axi_arcache
        .s_axi_arprot           (m_axi_arprot           ),  // input [2:0]	        s_axi_arprot
        .s_axi_arqos            (m_axi_arqos            ),  // input [3:0]	        s_axi_arqos
        .s_axi_arvalid          (m_axi_arvalid          ),  // input			s_axi_arvalid
        .s_axi_arready          (m_axi_arready          ),  // output			s_axi_arready
        // Slave Interface Read Data Ports
        .s_axi_rid              (m_axi_rid              ),  // output [3:0]	        s_axi_rid
        .s_axi_rdata            (m_axi_rdata            ),  // output [127:0]	        s_axi_rdata
        .s_axi_rresp            (m_axi_rresp            ),  // output [1:0]	        s_axi_rresp
        .s_axi_rlast            (m_axi_rlast            ),  // output			s_axi_rlast
        .s_axi_rvalid           (m_axi_rvalid           ),  // output			s_axi_rvalid
        .s_axi_rready           (m_axi_rready           ),  // input			s_axi_rready
//////////////////////////////////////////////////////////
        // System Clock Ports
        // sys_clk_i:�? DDR3 IP 提供的输入时�?
        .sys_clk_i              (sys_200m               ),  // input			sys_clk_i
        // active low
        .sys_rst                (pll0_locked            )// input                    sys_rst
);




endmodule
