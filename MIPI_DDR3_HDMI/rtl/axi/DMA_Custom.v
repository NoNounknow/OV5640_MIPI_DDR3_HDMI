`timescale 1ns / 1ps
module DMA_Custom #(
        parameter   Buff_NUM             = 3    ,
        parameter   W_Brust_Length       = 240  ,
        parameter   R_Brust_Length       = 240  ,
        parameter   W_Data_width         = 128  ,
        parameter   R_Data_width         = 128  ,
        parameter   Image_width          = 1920 ,
        parameter   Image_high           = 1080 ,
        parameter   Wr_addr_space        = 33   ,
        parameter   Rd_addr_space        = 33   ,
        parameter   Aw_init_Base_Addr    = 0
        )(                    
        input	wire    		    ui_clk                      ,
        input	wire    		    Rst_INIT_DONE               ,
        //Aw
        output  wire    [3:0]	    m_axi_awid                  ,
        output  reg    [Wr_addr_space-1:0]
                            	    m_axi_awaddr                ,
        output  wire    [7:0]	    m_axi_awlen                 ,
        output  wire    [2:0]	    m_axi_awsize                ,
        output  wire    [1:0]	    m_axi_awburst               ,
        output  wire        	    m_axi_awlock                ,
        output  wire    [3:0]	    m_axi_awcache               ,
        output  wire    [2:0]	    m_axi_awprot                ,
        output  wire    [3:0]	    m_axi_awqos                 ,
        output	reg     		    m_axi_awvalid               ,
        input   wire			    m_axi_awready               ,
        //w
        output  wire    [W_Data_width-1:0]	    
                                    m_axi_wdata                 ,
        output  wire    [15:0]	    m_axi_wstrb                 ,
        output  wire			    m_axi_wlast                 ,
        output  reg 			    m_axi_wvalid                ,
        input	wire	    	    m_axi_wready                ,
        //b
        input   wire    [3:0]	    m_axi_bid                   ,
        input   wire    [1:0]	    m_axi_bresp                 ,
        input	wire    		    m_axi_bvalid                ,
        output  reg 			    m_axi_bready                ,
        //Ar
        output  wire    [3:0]	    m_axi_arid                  ,
        output  reg    [Rd_addr_space-1:0]
                            	    m_axi_araddr                ,
        output  wire    [7:0]	    m_axi_arlen                 ,
        output  wire    [2:0]	    m_axi_arsize                ,
        output  wire    [1:0]	    m_axi_arburst               ,
        output  wire        	    m_axi_arlock                ,
        output  wire    [3:0]	    m_axi_arcache               ,
        output  wire    [2:0]	    m_axi_arprot                ,
        output  wire    [3:0]	    m_axi_arqos                 ,
        output  reg 			    m_axi_arvalid               ,
        input	wire    		    m_axi_arready               ,
        //r
        input   wire    [3:0]	    m_axi_rid                   ,
        input   wire    [R_Data_width-1:0]
                            	    m_axi_rdata                 ,
        input   wire    [1:0]	    m_axi_rresp                 ,//Read response
        input   wire			    m_axi_rlast                 ,
        input   wire			    m_axi_rvalid                ,
        output	reg     		    m_axi_rready                ,
        //FIFO_wdata
        input   wire                Aw_Wr_trigger               ,
        output  wire                wdata_fifo_Rd_en            ,
        input   wire    [W_Data_width-1:0]
                                    wdata_fifo_Rd_data          ,
        //FIFO_rdata
        input   wire                R_Rd_trigger                ,
        output  wire                rdata_fifo_Wr_en            ,
        output  wire    [R_Data_width-1:0]
                                    rdata_fifo_wr_data          ,
        //Sync
        input   wire                Rd_Rst_Sync                 ,
        input   wire                Wr_Rst_Sync                 ,
        input   wire                Wr_Clk                      ,
        input   wire                Rd_Clk                      
        // output  reg                 Rd_Start_DDR3       
    );
//========================================= Define Ports =========================================//
        localparam   Awaddr_Brust_Offset  = (W_Data_width)*(W_Brust_Length)/8             ;
        localparam   Araddr_Brust_Offset  = (R_Data_width)*(R_Brust_Length)/8             ;
        localparam   One_Frame_Size       = (Image_width)*(Image_high)*2                  ;
        localparam   Awaddr_Brust_max     = One_Frame_Size - (Awaddr_Brust_Offset)        ;      
        localparam   Araddr_Brust_max     = One_Frame_Size - (Araddr_Brust_Offset)        ;
        localparam   Aw_Size              = $clog2((W_Data_width/8)-1)                    ;
        localparam   Ar_Size              = $clog2((R_Data_width/8)-1)                    ;
        localparam   RAM_Start_1          = 0                                             ;
        localparam   RAM_Start_2          = One_Frame_Size                                ;
        localparam   RAM_Start_3          = One_Frame_Size*2                              ;
//========================================= Define Ports =========================================//


// W_Sync ----------------------------------------------------------------------------------------//

    reg  [4:0]      reg_Wr_Rst_Sync     ;
    wire            High_Wr_Rst_Sync    ;
    reg             r_High_Wr_Rst_Sync  ;
    wire            Pose_Wr_Rst_Sync    ;
    wire            Nege_Wr_Rst_Sync    ;
    reg             r_Pose_Wr_Rst_Sync  ;

    always @(posedge Wr_Clk) begin
        reg_Wr_Rst_Sync <= {reg_Wr_Rst_Sync[3:0],Wr_Rst_Sync};
    end 

    assign  High_Wr_Rst_Sync = |reg_Wr_Rst_Sync;

    always @(posedge ui_clk) begin
        r_High_Wr_Rst_Sync <= High_Wr_Rst_Sync;
        r_Pose_Wr_Rst_Sync <= Pose_Wr_Rst_Sync;
    end

    assign Pose_Wr_Rst_Sync = ( High_Wr_Rst_Sync)&&(!r_High_Wr_Rst_Sync);
    assign Nege_Wr_Rst_Sync = (!High_Wr_Rst_Sync)&&( r_High_Wr_Rst_Sync);

// W_Sync ----------------------------------------------------------------------------------------//

// wr_index --------------------------------------------------------------------------------------//

    reg  [2:0]                  wr_index    ;
    reg  [Wr_addr_space-1:0]    wr_base_addr;

    always @(posedge ui_clk or negedge Rst_INIT_DONE) begin
        if(Rst_INIT_DONE == 0) begin
            wr_index <= 'd1;
        end else if(Pose_Wr_Rst_Sync == 1'b1 && wr_index == Buff_NUM) begin
            wr_index <= 'd1;
        end else if(Pose_Wr_Rst_Sync == 1'b1) begin
            wr_index <= wr_index + 1'b1;
        end
    end
    always @(posedge ui_clk or negedge Rst_INIT_DONE) begin
        if(Rst_INIT_DONE == 0) begin
            wr_base_addr <= Aw_init_Base_Addr;
        end else if(Pose_Wr_Rst_Sync == 1'b1) begin
            case (wr_index)
                3'd1:begin
                    wr_base_addr <= RAM_Start_1;
                end 
                3'd2:begin
                    wr_base_addr <= RAM_Start_2;
                end
                3'd3:begin
                    wr_base_addr <= RAM_Start_3;
                end
                default:begin
                    wr_base_addr <= RAM_Start_1;
                end 
            endcase
        end else begin
            wr_base_addr <= wr_base_addr;
        end
    end

// wr_index --------------------------------------------------------------------------------------//

// Aw------ --------------------------------------------------------------------------------------//

    //Aw
            reg     [7:0]                   w_brust_cnt;
            reg                             Aw_running ;
    //ConFig
    assign   m_axi_awid     =    1'b0                   ;
    assign   m_axi_awlen    =    W_Brust_Length - 1'b1  ;
    assign   m_axi_awsize   =    Aw_Size                ;
    assign   m_axi_awburst  =    1'b1                   ;
    assign   m_axi_awlock   =    1'b0                   ;
    assign   m_axi_awcache  =    1'b0                   ;
    assign   m_axi_awprot   =    1'b0                   ;
    assign   m_axi_awqos    =    1'b0                   ; 
    //Aw_running
    always @(posedge ui_clk or negedge Rst_INIT_DONE) begin
        if(Rst_INIT_DONE == 0) begin
            Aw_running <= 'd0;
        end else if(m_axi_bvalid == 1'b1 && m_axi_bready == 1'b1) begin
            Aw_running <= 1'b0;
        end else if(Aw_Wr_trigger == 1'b1 && Aw_running == 1'b0) begin
            Aw_running <= 1'b1;
        end
    end
    //m_axi_awvalid
    always @(posedge ui_clk or negedge Rst_INIT_DONE) begin
        if(Rst_INIT_DONE == 0) begin
            m_axi_awvalid <= 1'b0;
        end else if(m_axi_awvalid == 1'b1 && m_axi_awready == 1'b1) begin
            m_axi_awvalid <= 1'b0;
        end else if(Aw_Wr_trigger == 1'b1 && Aw_running == 1'b0) begin
            m_axi_awvalid <= 1'b1;
        end
    end
    //m_axi_awaddr  
    always @(posedge ui_clk or negedge Rst_INIT_DONE) begin
        if(Rst_INIT_DONE == 0) begin
            m_axi_awaddr <= 'd0;
        end else if(r_Pose_Wr_Rst_Sync == 1'b1) begin
            m_axi_awaddr <= wr_base_addr;
        end else if(m_axi_awvalid == 1'b1 && m_axi_awready && m_axi_awaddr == Awaddr_Brust_max) begin
            m_axi_awaddr <= wr_base_addr;
        end else if(m_axi_awvalid == 1'b1 && m_axi_awready == 1'b1) begin
            m_axi_awaddr <= m_axi_awaddr + Awaddr_Brust_Offset;
        end
    end

// Aw---------------------------------------------------------------------------------------------//

// w----------------------------------------------------------------------------------------------//

    assign  m_axi_wdata      = wdata_fifo_Rd_data;
    assign  wdata_fifo_Rd_en = ((m_axi_wvalid == 1'b1)&&(m_axi_wready == 1'b1))?1'b1:1'b0;
    assign  m_axi_wstrb      = {(W_Data_width/8){1'b1}};
    assign  m_axi_wlast      = (w_brust_cnt == W_Brust_Length - 1'b1)?1'b1:1'b0;
    //w_brust_cnt
    always @(posedge ui_clk or negedge Rst_INIT_DONE) begin
        if(Rst_INIT_DONE == 0) begin
            w_brust_cnt <= 'd0;
        end else if((m_axi_wvalid == 1'b1)&&(m_axi_wready == 1'b1)) begin
            if(w_brust_cnt == W_Brust_Length - 1'b1) begin
                w_brust_cnt <= 'd0;
            end else begin
                w_brust_cnt <= w_brust_cnt + 1'b1;
            end
        end else begin
            w_brust_cnt <= w_brust_cnt;
        end
    end
    //m_axi_wvalid
    always @(posedge ui_clk or negedge Rst_INIT_DONE) begin
        if(Rst_INIT_DONE == 0) begin
            m_axi_wvalid <= 'd0;
        end else if(r_Pose_Wr_Rst_Sync == 1'b1) begin
            m_axi_wvalid <= 'd0;
        end else if(m_axi_wvalid == 1'b1 && m_axi_wready == 1'b1 && m_axi_wlast == 1'b1) begin
            m_axi_wvalid <= 'd0;
        end else if(m_axi_awvalid == 1'b1 && m_axi_awready == 1'b1) begin
            m_axi_wvalid <= 1'b1;
        end
    end

// w----------------------------------------------------------------------------------------------//

    //m_axi_bready
    always @(posedge ui_clk or negedge Rst_INIT_DONE) begin
        if(Rst_INIT_DONE == 0) begin
            m_axi_bready <= 'd0;
        end else if(m_axi_bready == 1'b1 && m_axi_bvalid == 1'b1) begin
            m_axi_bready <= 'd0;
        end else if(m_axi_wvalid == 1'b1 && m_axi_wready == 1'b1 && m_axi_wlast == 1'b1) begin
            m_axi_bready <= 1'b1;
        end
    end

// R_Sync------------------------------------------------------------------------------------------//
    reg                         reg_Rd_Rst_Sync         ;
    wire                        Pose_Rd_Rst_Sync_post   ;
    wire                        Pose_Rd_Rst_Sync        ;
    wire                        Nege_Rd_Rst_Sync        ;
    reg                         r_Pose_Rd_Rst_Sync      ;

    always @(posedge Rd_Clk) begin
        reg_Rd_Rst_Sync <= Rd_Rst_Sync;
    end
    assign  Pose_Rd_Rst_Sync_post = (Rd_Rst_Sync == 1'b1)&&(reg_Rd_Rst_Sync == 1'b0);

    data_sync_ext rd_sync_ext(
        .clka			(Rd_Clk         		),
        .rst_n			(Rst_INIT_DONE      	),	
        .pulse_a		(Pose_Rd_Rst_Sync_post	),
        .ext_pulse_a	(Pose_Rd_Rst_Sync	    )
    );


    always @(posedge ui_clk) begin
        r_Pose_Rd_Rst_Sync <= Pose_Rd_Rst_Sync;
    end




// R_Sync------------------------------------------------------------------------------------------//    

// rd_index----------------------------------------------------------------------------------------//  

    reg  [Rd_addr_space-1:0]    rd_base_addr  ;
    reg  [2:0]                  rd_index    ;
    reg  [2:0]                  r_rd_index  ;

    always @(posedge ui_clk or negedge Rst_INIT_DONE) begin
        if(Rst_INIT_DONE == 0) begin
            rd_index <= 'd0;
        end else if(Pose_Rd_Rst_Sync == 1'b1 && wr_index > 'd1) begin
            rd_index <= wr_index - 1'b1;
        end else if(Pose_Rd_Rst_Sync == 1'b1)begin
            rd_index <= Buff_NUM;
        end else begin
            rd_index <= rd_index;
        end
    end

    always @(posedge ui_clk or negedge Rst_INIT_DONE) begin
        if(Rst_INIT_DONE == 0) begin
            rd_base_addr <= 'd0;
        end else if(Pose_Rd_Rst_Sync)begin
            case (rd_index)
                3'd1:begin
                    rd_base_addr <= RAM_Start_1;
                end 
                3'd2:begin
                    rd_base_addr <= RAM_Start_2;
                end
                3'd3:begin
                    rd_base_addr <= RAM_Start_3;
                end
                default:begin
                    rd_base_addr <= RAM_Start_1;
                end 
            endcase
        end else begin
            rd_base_addr <= rd_base_addr;
        end
    end

// rd_index----------------------------------------------------------------------------------------//    

// Ar----------------------------------------------------------------------------------------------//    

    reg          Ar_running ;
    //ConFig
    assign  m_axi_arid     =  'd0                   ;
    assign  m_axi_arlen    =  R_Brust_Length - 1'b1 ;
    assign  m_axi_arsize   =  Ar_Size               ;
    assign  m_axi_arburst  =  1'b1                  ;
    assign  m_axi_arlock   =   'd0                  ;
    assign  m_axi_arcache  =   'd0                  ;
    assign  m_axi_arprot   =   'd0                  ;
    assign  m_axi_arqos    =   'd0                  ;
    //Ar_running
    always @(posedge ui_clk or negedge Rst_INIT_DONE) begin
        if(Rst_INIT_DONE == 0) begin
            Ar_running <= 'd0;
        end else if(r_Pose_Rd_Rst_Sync == 1'b1) begin
            Ar_running <= 'd0;
        end else if(m_axi_rlast == 1'b1 && m_axi_rvalid == 1'b1 && m_axi_rready == 1'b1) begin
            Ar_running <= 'd0;
        end else if(R_Rd_trigger == 1'b1 && Ar_running == 'd0) begin
            Ar_running <= 1'b1;
        end
    end
    //m_axi_araddr
    always @(posedge ui_clk or negedge Rst_INIT_DONE) begin
        if(Rst_INIT_DONE == 0) begin
            m_axi_araddr <= 'd0;
        end else if(r_Pose_Rd_Rst_Sync == 1'b1) begin
            m_axi_araddr <= rd_base_addr;
        end else if(m_axi_arvalid == 1'b1 && m_axi_arready == 1'b1 && m_axi_araddr == rd_base_addr + Araddr_Brust_max) begin
            m_axi_araddr <= rd_base_addr; 
        end else if(m_axi_arvalid == 1'b1 && m_axi_arready == 1'b1)
            m_axi_araddr <= m_axi_araddr + Araddr_Brust_Offset;
    end

    //m_axi_arvalid
    always @(posedge ui_clk or negedge Rst_INIT_DONE) begin
        if(Rst_INIT_DONE == 0) begin
            m_axi_arvalid <= 'd0;
        end else if(r_Pose_Rd_Rst_Sync == 1'b1) begin
            m_axi_arvalid <= 'd0;
        end else if(m_axi_arvalid == 1'b1 && m_axi_arready == 1'b1) begin
            m_axi_arvalid <= 'd0; 
        end else if(R_Rd_trigger == 1'b1 && Ar_running == 'd0) begin
            m_axi_arvalid <= 1'b1;
        end
    end

// Ar----------------------------------------------------------------------------------------------// 

// r-----------------------------------------------------------------------------------------------// 

    assign  rdata_fifo_Wr_en    =   ((m_axi_rvalid == 1'b1) && (m_axi_rready == 1'b1))?1'b1:1'b0;
    assign  rdata_fifo_wr_data  =   m_axi_rdata;
    always @(posedge ui_clk or negedge Rst_INIT_DONE) begin
        if(Rst_INIT_DONE == 0) begin
            m_axi_rready <= 'd0;
        end else if(r_Pose_Rd_Rst_Sync == 1'b1) begin
            m_axi_rready <= 'd0;
        end else if(m_axi_rready == 1'b1 && m_axi_rvalid == 1'b1 && m_axi_rlast == 1'b1) begin
            m_axi_rready <= 'd0;
        end else if(m_axi_arvalid == 1'b1 && m_axi_arready == 1'b1) begin
            m_axi_rready <= 1'b1;
        end
    end
// r-----------------------------------------------------------------------------------------------// 

 ila_0 ila_0 (
 	.clk(ui_clk), // input wire clk

 	.probe0(Pose_Wr_Rst_Sync), // input wire [15:0]  probe0  
 	.probe1(wr_base_addr), // input wire [15:0]  probe1 
 	.probe2(wr_index), // input wire [0:0]  probe2 
 	.probe3(Aw_running), // input wire [0:0]  probe3 
 	.probe4(m_axi_awaddr), // input wire [31:0]  probe4 
 	.probe5(Pose_Rd_Rst_Sync), // input wire [31:0]  probe5 
 	.probe6(rd_base_addr), // input wire [2:0]  probe6 
 	.probe7(rd_index), // input wire [0:0]  probe7 
 	.probe8(Ar_running), // input wire [0:0]  probe8 
 	.probe9(m_axi_araddr) // input wire [0:0]  probe9 

 );
endmodule
