module  axi4_master_ctrl(
        // system signals
        input                   sclk                    ,
        input                   s_rst_n                 ,        
        // Write Address Ports
        output  wire    [ 3:0]  m_axi_awid              ,
        output  reg     [27:0]  m_axi_awaddr            ,
        output  wire    [ 7:0]  m_axi_awlen             ,
        output  wire    [ 2:0]  m_axi_awsize            ,
        output  wire    [ 1:0]  m_axi_awburst           ,
        output  wire            m_axi_awlock            ,       
        output  wire    [ 3:0]  m_axi_awcache           ,
        output  wire    [ 2:0]  m_axi_awprot            ,
        output  wire    [ 3:0]  m_axi_awqos             ,
        output  reg             m_axi_awvalid           ,
        input                   m_axi_awready           ,
        // Write Data Ports                             
        output  wire    [127:0] m_axi_wdata             ,
        output  wire    [15:0]  m_axi_wstrb             ,
        output  wire            m_axi_wlast             ,
        output  reg             m_axi_wvalid            ,
        input                   m_axi_wready            ,
        // Write Response Ports                         
        input           [ 3:0]  m_axi_bid               ,
        input           [ 1:0]  m_axi_bresp             ,
        input                   m_axi_bvalid            ,
        output  reg             m_axi_bready            ,
        // Read Address Ports                            
        output  wire    [ 3:0]  m_axi_arid              ,
        output  reg     [27:0]  m_axi_araddr            ,
        output  wire    [ 7:0]  m_axi_arlen             ,
        output  wire    [ 2:0]  m_axi_arsize            ,
        output  wire    [ 1:0]  m_axi_arburst           ,
        output  wire            m_axi_arlock            ,
        output  wire    [ 3:0]  m_axi_arcache           ,
        output  wire    [ 2:0]  m_axi_arprot            ,
        output  wire    [ 3:0]  m_axi_arqos             ,
        output  reg             m_axi_arvalid           ,
        input                   m_axi_arready           ,
        // Read Data Ports                              
        input           [ 3:0]  m_axi_rid               ,
        input           [127:0] m_axi_rdata             ,
        input           [ 1:0]  m_axi_rresp             ,
        input                   m_axi_rlast             ,
        input                   m_axi_rvalid            ,
        output  reg             m_axi_rready            ,
        // WFIFO
        input                   wr_trig                 ,
        output  wire            wfifo_rd_en             ,       
        input           [127:0] wfifo_rd_data           ,
        // RFIFO
        input                   rd_trig                 ,       
        input                   vga_vsync               ,       
        output  wire            rfifo_wr_en             ,       
        output  wire    [127:0] rfifo_wr_data                  
);

//========================================================================\
// =========== Define Parameter and Internal signals =========== 
//========================================================================/

localparam      AWADDR_MAX      =       1920*1080*2-256         ;
localparam      ARADDR_MAX      =       1920*1080*2-256         ;

// SIM
/*
localparam      AWADDR_MAX      =       1024*2-256              ;
localparam      ARADDR_MAX      =       1024*2-256              ;
*/
reg     [ 7:0]                  wr_cnt                          ;
reg                             wr_work                         ;       

reg                             rd_work                         ;    

reg                             vga_vsync_r1                    ;   
reg                             vga_vsync_r2                    ;   

//=============================================================================
//**************    Main Code   **************
//=============================================================================
always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                wr_work <=      1'b0;
        else if(m_axi_bready == 1'b1 && m_axi_bvalid == 1'b1)
                wr_work <=      1'b0;
        else if(wr_trig == 1'b1 && wr_work == 1'b0)
                wr_work <=      1'b1;
end


// Write Address 

assign  m_axi_awid      =       'd0;
// assign  m_axi_awaddr    =       'd64;    // 以字节为单位
assign  m_axi_awlen     =       'd15;   // Burst Len
assign  m_axi_awsize    =       'd4;
assign  m_axi_awburst   =       'd1;
assign  m_axi_awlock    =       1'b0;
assign  m_axi_awcache   =       1'b0;
assign  m_axi_awprot    =       1'b0;
assign  m_axi_awqos     =       1'b0;


always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                m_axi_awvalid   <=      1'b0;
        else if(m_axi_awvalid == 1'b1 && m_axi_awready == 1'b1)
                m_axi_awvalid   <=      1'b0;
        else if(wr_trig == 1'b1 && wr_work == 1'b0)
                m_axi_awvalid   <=      1'b1;
end

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                m_axi_awaddr   <=      'd0;
        else if(m_axi_awvalid == 1'b1 && m_axi_awready == 1'b1 && m_axi_awaddr == AWADDR_MAX)
                m_axi_awaddr   <=      'd0;
        else if(m_axi_awvalid == 1'b1 && m_axi_awready == 1'b1)
                m_axi_awaddr   <=      m_axi_awaddr + 'd256;
end

// Write Data
always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                m_axi_wvalid    <=      1'b0;
        else if(m_axi_wvalid == 1'b1 && m_axi_wready == 1'b1 && m_axi_wlast == 1'b1)
                m_axi_wvalid    <=      1'b0;
        else if(wr_trig == 1'b1 && wr_work == 1'b0)
                m_axi_wvalid    <=      1'b1;
end

assign  m_axi_wlast     =       (wr_cnt == m_axi_awlen) ? 1'b1 : 1'b0;
assign  m_axi_wstrb     =       16'hffff;

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                wr_cnt  <=      'd0;
        else if(m_axi_wvalid == 1'b1 && m_axi_wready == 1'b1 && m_axi_wlast == 1'b1)
                wr_cnt  <=      'd0;
        else if(m_axi_wvalid == 1'b1 && m_axi_wready == 1'b1)
                wr_cnt  <=      wr_cnt + 1'b1;
end

assign  m_axi_wdata     =       wfifo_rd_data;
assign  wfifo_rd_en     =       m_axi_wvalid & m_axi_wready;

// Write Response
always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                m_axi_bready    <=      1'b0;
        else if(m_axi_bready == 1'b1 && m_axi_bvalid == 1'b1)
                m_axi_bready    <=      1'b0;
        else if(m_axi_wvalid == 1'b1 && m_axi_wready == 1'b1 && m_axi_wlast == 1'b1)
                m_axi_bready    <=      1'b1;
end

// Read Address
assign  m_axi_arid      =       'd0;
//assign  m_axi_araddr    =       'd0;
assign  m_axi_arlen     =       'd15;
assign  m_axi_arsize    =       'd4;
assign  m_axi_arburst   =       'd1;
assign  m_axi_arlock    =       'd0;
assign  m_axi_arcache   =       'd0;
assign  m_axi_arprot    =       'd0;
assign  m_axi_arqos     =       'd0;
// assign  m_axi_arvalid   =       'd0;

always  @(posedge sclk) begin
        vga_vsync_r1    <=      vga_vsync;
        vga_vsync_r2    <=      vga_vsync_r1;
end 

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                rd_work <=      1'b0;
        else if(vga_vsync_r2 == 1'b1)
                rd_work <=      1'b0;
        else if(m_axi_rvalid == 1'b1 && m_axi_rready == 1'b1 && m_axi_rlast == 1'b1)
                rd_work <=      1'b0;
        else if(rd_trig == 1'b1 && rd_work == 1'b0)
                rd_work <=      1'b1;
end

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                m_axi_arvalid   <=      1'b0;
        else if(vga_vsync_r2 == 1'b1)
                m_axi_arvalid   <=      1'b0;
        else if(m_axi_arvalid == 1'b1 && m_axi_arready == 1'b1)
                m_axi_arvalid   <=      1'b0;
        else if(rd_trig == 1'b1 && rd_work == 1'b0)
                m_axi_arvalid   <=      1'b1;
end

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                m_axi_araddr    <=      'd0;
        else if(vga_vsync_r2 == 1'b1)
                m_axi_araddr    <=      'd0;
        else if(m_axi_arvalid == 1'b1 && m_axi_arready == 1'b1 && m_axi_araddr == ARADDR_MAX)
                m_axi_araddr    <=      'd0;
        else if(m_axi_arvalid == 1'b1 && m_axi_arready == 1'b1)
                m_axi_araddr    <=      m_axi_araddr + 'd256;
end


// Read Data
// assign  m_axi_rready    =       1'b0;
always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                m_axi_rready    <=      1'b0;
        else if(vga_vsync_r2 == 1'b1)
                m_axi_rready    <=      1'b0;
        else if(m_axi_rvalid == 1'b1 && m_axi_rready == 1'b1 && m_axi_rlast == 1'b1)
                m_axi_rready    <=      1'b0;
        else if(m_axi_arvalid == 1'b1 && m_axi_arready == 1'b1)
                m_axi_rready    <=      1'b1;
end

assign  rfifo_wr_data   =       m_axi_rdata;
assign  rfifo_wr_en     =       m_axi_rready & m_axi_rvalid;

endmodule
