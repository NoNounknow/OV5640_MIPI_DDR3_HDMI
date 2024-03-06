module axi_dma #(
	parameter 	AXI_ADDR_WIDTH	= 32			,
	parameter 	AXI_BUF_SIZE	= 3				,
	parameter   AXI_ADDR_BASE	= 32'h00000000	,

	parameter	WR_CH_EN		= 1				,
	parameter 	WR_BURST_LEN	= 80			, 
	parameter 	WR_DATA_WIDTH	= 64			,
	parameter 	WR_IW			= 640			,
	parameter 	WR_IH			= 512			,

	parameter	RD_CH_EN		= 1				,
	parameter	RD_BURST_LEN	= 80            ,
	parameter 	RD_DATA_WIDTH	= 64			,
	parameter	RD_IW			= 640           ,
	parameter	RD_IH			= 512           ,
	
	parameter   I_DW 			= 8				,
	parameter   O_DW 			= 8			
)
(

	input	wire		    					pre_clk				,
	input   wire								pre_vs				,
	input	wire            					pre_de				,
	input	wire    [I_DW-1:0]					pre_data			,

	input  	wire								post_clk			,
	input  	wire								post_de				,
	output 	wire	[O_DW-1:0]    				post_data			,
	output 	reg								 	post_start			,
	
	input	wire								axi_rd_start		,

	input	wire	[7:0]						i_wr_index			,	
	output	reg		[7:0]						o_wr_index			,

	output	reg									wr_irq				,
	
	input 	wire  								M_AXI_ACLK			,
	input 	wire  								M_AXI_ARESETN		,
	output 	wire 								M_AXI_AWID			,	 
	output 	wire    [AXI_ADDR_WIDTH-1:0] 		M_AXI_AWADDR		,    
	output 	wire    [7:0]						M_AXI_AWLEN			,    
	output 	wire    [2:0]						M_AXI_AWSIZE		,    
	output 	wire    [1:0] 						M_AXI_AWBURST		,    
	output 	wire  								M_AXI_AWLOCK		,    
	output 	wire    [3:0] 						M_AXI_AWCACHE		,    
	output 	wire    [2:0] 						M_AXI_AWPROT		,    
	output 	wire    [3:0] 						M_AXI_AWQOS			,    
	output 	wire  								M_AXI_AWVALID		,    
	input	wire  								M_AXI_AWREADY		,    
	output  wire    [WR_DATA_WIDTH-1:0] 		M_AXI_WDATA			,	 
	output  wire 	[WR_DATA_WIDTH/8-1:0] 		M_AXI_WSTRB			,	 
	output  wire  								M_AXI_WLAST			,	 			 
	output  wire  								M_AXI_WVALID		,	 
	input   wire  								M_AXI_WREADY		,	 
	input   wire 	 							M_AXI_BID			,		
	input   wire 	[1:0] 						M_AXI_BRESP			,		
	input   wire  								M_AXI_BVALID		,	
	output  wire  								M_AXI_BREADY		,	 																		 
	output  wire 	 							M_AXI_ARID			,	 
	output  wire 	[AXI_ADDR_WIDTH-1:0] 		M_AXI_ARADDR		,	 	
	output  wire 	[7:0] 						M_AXI_ARLEN			,	 
	output  wire 	[2:0]						M_AXI_ARSIZE		,	 
	output  wire 	[1:0] 						M_AXI_ARBURST		,	 
	output  wire  								M_AXI_ARLOCK		,	 
	output  wire 	[3:0] 						M_AXI_ARCACHE		,	 
	output  wire 	[2:0] 						M_AXI_ARPROT		,	 
	output  wire 	[3:0] 						M_AXI_ARQOS			,	  	   
	output  wire  								M_AXI_ARVALID		,	 
	input   wire  								M_AXI_ARREADY		,	 
	input   wire 	 							M_AXI_RID			,	 
	input   wire 	[RD_DATA_WIDTH-1:0] 		M_AXI_RDATA			,	 
	input   wire 	[1:0] 						M_AXI_RRESP			,	 
	input   wire  								M_AXI_RLAST			,	  
	input   wire  								M_AXI_RVALID		,    
	output  wire  							    M_AXI_RREADY			 
);	

localparam 	addr_offset 		= 	WR_IW*WR_IH						;

localparam  wr_burst_bytes		= 	WR_BURST_LEN*WR_DATA_WIDTH/8	;	
localparam  rd_burst_bytes		= 	RD_BURST_LEN*RD_DATA_WIDTH/8	;

localparam 	wr_burst_times 		= 	WR_IW*WR_IH/wr_burst_bytes		;	
localparam 	rd_burst_times 		= 	RD_IW*RD_IH/rd_burst_bytes		;	

//AXI_WR
reg  	 							per_vs_r		;
wire 								per_pose		;
wire 								per_nege		;
wire								ext_per_pose	;

wire								o_data_de 		; 	
wire	[WR_DATA_WIDTH-1:0]			o_data		    ;

wire								sys_per_nege	;
reg									sys_per_nege_r	;	

reg		[7:0] 						wr_index		; 	
reg		[31:0]						wr_base_addr	;	
reg									wr_burst_start	;	
reg									wr_cycle_flag	;		
		
reg  								axi_awvalid		;	
reg 	[AXI_ADDR_WIDTH-1:0] 		axi_awaddr		;
reg  								axi_wvalid		;
wire 	[WR_DATA_WIDTH-1:0] 		axi_wdata		;
reg  								axi_wlast		;
wire  								axi_bready		;

reg	    [7:0]						burst_cnt		;		
wire								axi_wdata_de	;	

wire								wr_full			;
wire								wr_empty		;
wire	[10:0]						wr_rd_data_count;
wire	[10:0]						wr_wr_data_count;

reg		[15:0]  					cnt_1us			;
		
always@(posedge pre_clk)
	if(!M_AXI_ARESETN)
		per_vs_r <= 1'd0;
	else 
		per_vs_r <= pre_vs;

assign	per_pose		= ~per_vs_r&&pre_vs			;
assign  per_nege		= ~pre_vs&&per_vs_r			;

data_sync_ext u1_data_sync_ext(
	.clka			(pre_clk		),
	.rst_n			(M_AXI_ARESETN	),	
	.pulse_a		(per_pose		),
	.ext_pulse_a	(ext_per_pose	)
);

data_joint #(
	.IW_WIDTH		(I_DW		  	),
	.OW_WIDTH		(WR_DATA_WIDTH	)
)
u1_data_joint
(	
	.clk			(pre_clk		),
	.rst_n			(~per_pose&&M_AXI_ARESETN	),
	.i_data_de   	(pre_de			),
	.i_data			(pre_data		),
	.o_data_de   	(o_data_de  	),            
	.o_data		    (o_data			)
);		

fifo_8_sys u1_fifo_fs_start
(
	.wr_clk			(pre_clk		), 
	.rd_clk			(M_AXI_ACLK		), 
	.din			(8'd1			), 
	.wr_en			(per_nege		), 
	.rd_en			(~sys_per_nege	), 
	.dout			(				), 
	.full			(				), 
	.empty			(sys_per_nege	)
);
	
always@(posedge M_AXI_ACLK)
	if(!M_AXI_ARESETN )	
		sys_per_nege_r <= 1'b0;
	else
		sys_per_nege_r <= ~sys_per_nege;
	
always@(posedge M_AXI_ACLK)
	if(!M_AXI_ARESETN)
		wr_index <= 'd1;
	else if(~sys_per_nege==1'b1&&wr_index==AXI_BUF_SIZE[7:0])
		wr_index <= 'd1;
	else if(~sys_per_nege==1'b1)
		wr_index <= wr_index + 1'b1;
	else
		wr_index <= wr_index;

always@(posedge M_AXI_ACLK)
	if(!M_AXI_ARESETN)
		o_wr_index <= 'd0;
	else
		o_wr_index <= wr_index;
		
always@(posedge M_AXI_ACLK)
	if(!M_AXI_ARESETN)
		wr_base_addr <= 'd0;
	else if(~sys_per_nege==1'b1&&wr_index==AXI_BUF_SIZE[7:0])
		wr_base_addr <= 'd0;
	else if(~sys_per_nege==1'b1)
		wr_base_addr <= wr_base_addr + addr_offset;
	else
		wr_base_addr <= wr_base_addr;			
		
always@(posedge M_AXI_ACLK)
	if(!M_AXI_ARESETN)
		wr_burst_start <= 1'b0;
	else if(wr_rd_data_count>=WR_BURST_LEN&&WR_CH_EN[0]==1'b1)
		wr_burst_start <= 1'b1;
	else 
		wr_burst_start <= 1'b0;              

always@(posedge M_AXI_ACLK)
	if(!M_AXI_ARESETN)
		wr_cycle_flag <= 1'b0;
	else if(wr_cycle_flag==1'b1&&axi_wvalid==1'b1&&M_AXI_WREADY==1'b1&&axi_wlast==1'b1)   
		wr_cycle_flag <= 1'b0;
	else if(wr_burst_start==1'b1&&wr_cycle_flag==1'b0)
		wr_cycle_flag <= 1'b1;                            
	else
		wr_cycle_flag <= wr_cycle_flag;

always@(posedge M_AXI_ACLK)
	if(!M_AXI_ARESETN)
		axi_awvalid <= 1'b0;
	else if(axi_awvalid==1'b1&&M_AXI_AWREADY==1'b1)
		axi_awvalid <= 1'b0;
	else if(wr_burst_start==1'b1&&wr_cycle_flag==1'b0)
		axi_awvalid <= 1'b1;     
	else
		axi_awvalid <= axi_awvalid;
	
always@(posedge M_AXI_ACLK)
	if(!M_AXI_ARESETN)
		axi_awaddr <= 'd0;
	else if(sys_per_nege_r==1'b1)	
		axi_awaddr <= wr_base_addr;
	else if(axi_awvalid==1'b1&&M_AXI_AWREADY==1'b1)
		axi_awaddr <= axi_awaddr + wr_burst_bytes ;  
	else
		axi_awaddr <= axi_awaddr;

always@(posedge M_AXI_ACLK)
	if(!M_AXI_ARESETN)
		axi_wvalid <= 1'b0;
	else if(axi_wvalid==1'b1&&M_AXI_WREADY==1'b1&&burst_cnt==WR_BURST_LEN-1)
		axi_wvalid <= 1'b0;
	else if(axi_awvalid==1'b1&&M_AXI_AWREADY==1'b1)
		axi_wvalid <= 1'b1;
	else
		axi_wvalid <= axi_wvalid;
	
always@(posedge M_AXI_ACLK)
	if(!M_AXI_ARESETN)
		burst_cnt <= 'd0;
	else if(axi_wvalid==1'b1&&M_AXI_WREADY==1'b1&&burst_cnt==WR_BURST_LEN-1)
		burst_cnt <= 'd0;
	else if(axi_wvalid==1'b1&&M_AXI_WREADY==1'b1)
		burst_cnt <= burst_cnt + 1'b1;            
	else 
		burst_cnt <= burst_cnt ;	
	
always@(posedge M_AXI_ACLK)
	if(!M_AXI_ARESETN)
		axi_wlast <= 1'b0;
	else if(axi_wvalid==1'b1&&M_AXI_WREADY==1'b1&&burst_cnt==WR_BURST_LEN-1)
		axi_wlast <= 1'b0;
	else if(axi_wvalid==1'b1&&M_AXI_WREADY==1'b1&&burst_cnt==WR_BURST_LEN-2) 
		axi_wlast <= 1'b1;
	else
		axi_wlast <= axi_wlast;
					
assign axi_bready = 1'b1;  
		
assign axi_wdata_de = axi_wvalid&&M_AXI_WREADY;  

always@(posedge M_AXI_ACLK)
	if(!M_AXI_ARESETN)
		wr_irq <= 1'b0;
	else if(cnt_1us==99)
		wr_irq <= 1'b0;
	else if(~sys_per_nege==1'b1)
		wr_irq <= 1'b1;
	else
		wr_irq <= wr_irq;

always@(posedge M_AXI_ACLK)
	if(!M_AXI_ARESETN)
		cnt_1us <= 'd0;
	else if(cnt_1us==99)
		cnt_1us <= 'd0;
	else if(wr_irq==1'b1)
		cnt_1us <= cnt_1us + 1'b1;
	else
		cnt_1us <= cnt_1us;    

generate
  if (WR_CH_EN[0]==1) begin: WR_EN
	fifo_wr_64_64	u1_fifo_wr_64_64
	(
		.rst         		(ext_per_pose				),
		.wr_clk				(pre_clk					),            
		.rd_clk				(M_AXI_ACLK					),           
		.din				(o_data						),	           
		.wr_en				(o_data_de					),           
		.rd_en				(axi_wdata_de				),            
		.dout				(axi_wdata					),              
		.full				(wr_full					),                   
		.empty				(wr_empty					),                 
		.rd_data_count		(wr_rd_data_count			), 
		.wr_data_count		(wr_wr_data_count			)
	);
  end
endgenerate

//AXI_RD
reg 	[7:0]    					rd_index			;
reg		[7:0]    					rd_index_r			;
reg 	[AXI_ADDR_WIDTH-1 : 0]	  	rd_base_addr		;

reg									rd_cycle_flag		;
reg									rd_cmd_flag			;
reg									rd_data_flag		;

reg  								axi_arvalid			;
reg 	[AXI_ADDR_WIDTH-1:0] 		axi_araddr			;
reg  								axi_rready			;

reg  	[15:0]						rd_hcnt				;		
reg  	[15:0]						rd_vcnt				;

wire								axi_rdata_de		;	
wire	[RD_DATA_WIDTH-1:0]			axi_rdata			;

wire								rd_full				;
wire								rd_empty			;
wire	[13:0]						rd_rd_data_count	;
wire	[10:0]           			rd_wr_data_count    ;


always@(posedge M_AXI_ACLK)
	if(!M_AXI_ARESETN)
		rd_index <= 0;
	else
		case(WR_CH_EN[0])
			1'b0: 
				if(i_wr_index>1'b1)
					rd_index <= i_wr_index-1'b1;
				else
					rd_index <= AXI_BUF_SIZE[7:0];	
			1'b1: 
				if(wr_index>1'b1)
					rd_index <= wr_index-1'b1;
				else
					rd_index <= AXI_BUF_SIZE[7:0];
					
			default:rd_index <= rd_index;
		endcase			

always@(posedge M_AXI_ACLK)
	if(!M_AXI_ARESETN)
		rd_index_r <= 'd0;
	else
		rd_index_r <= rd_index-1'b1;
		
always@(posedge M_AXI_ACLK)
	if(!M_AXI_ARESETN)
		rd_base_addr <= 'd0;
	else
		rd_base_addr <= rd_index_r*addr_offset;
	
always@(posedge M_AXI_ACLK)
	if(!M_AXI_ARESETN)
		rd_cycle_flag <= 1'b0;
	else if(RD_CH_EN[0]==1'b1&&axi_rd_start==1'b1)
		rd_cycle_flag <= 1'b1;
	else
		rd_cycle_flag <= rd_cycle_flag;
		
always@(posedge M_AXI_ACLK)
	if(!M_AXI_ARESETN)
		rd_cmd_flag <= 1'b0;
	else if(axi_arvalid==1'b1&&M_AXI_ARREADY==1'b1)  
		rd_cmd_flag <= 1'b0;
	else if(rd_cycle_flag==1'b1&&rd_data_flag==1'b0)
		rd_cmd_flag <= 1'b1;
	else
		rd_cmd_flag <= rd_cmd_flag;

always@(posedge M_AXI_ACLK)
	if(!M_AXI_ARESETN)
		axi_arvalid <= 1'b0;
	else if(axi_arvalid==1'b1&&M_AXI_ARREADY==1'b1)
		axi_arvalid <= 1'b0;
	else if(rd_cmd_flag==1'b1&&rd_wr_data_count<RD_BURST_LEN*4)
		axi_arvalid <= 1'b1;
	else
		axi_arvalid <= axi_arvalid;
		
always@(posedge M_AXI_ACLK)
	if(!M_AXI_ARESETN)
		axi_araddr <= 'd0;
	else if(M_AXI_RVALID==1'b1&&axi_rready==1'b1&&rd_hcnt==(RD_BURST_LEN-1'b1)&&rd_vcnt==rd_burst_times-1'b1)
		axi_araddr <= rd_base_addr;
	else if(axi_arvalid==1'b1&&M_AXI_ARREADY==1'b1)
		axi_araddr <= axi_araddr + rd_burst_bytes;	
	else
		axi_araddr <= axi_araddr;
		
always@(posedge M_AXI_ACLK)
	if(!M_AXI_ARESETN)
		rd_data_flag <= 1'b0; 
	else if(axi_rready==1'b1&&M_AXI_RVALID==1'b1&&M_AXI_RLAST==1'b1)
		rd_data_flag <= 1'b0;
	else if(axi_arvalid==1'b1&&M_AXI_ARREADY==1'b1)
		rd_data_flag <= 1'b1;
	else
		rd_data_flag <= rd_data_flag;
			
always@(posedge M_AXI_ACLK)
	if(!M_AXI_ARESETN)
		axi_rready <= 1'b0;
	else if(rd_data_flag==1'b0)
		axi_rready <= 1'b0;
	else if(rd_data_flag==1'b1)
		axi_rready <= 1'b1;
	else
		axi_rready <= axi_rready;
						
always@(posedge M_AXI_ACLK)
	if(!M_AXI_ARESETN)
		rd_hcnt <= 'd0;
	else if(M_AXI_RVALID==1'b1&&axi_rready==1'b1&&rd_hcnt==RD_BURST_LEN-1'b1)
		rd_hcnt <= 'd0;
	else if(M_AXI_RVALID==1'b1&&axi_rready==1'b1)
		rd_hcnt <= rd_hcnt + 1'b1;	
	else
		rd_hcnt <= rd_hcnt;

always@(posedge M_AXI_ACLK)
	if(!M_AXI_ARESETN)
		rd_vcnt <= 'd0;
	else if(M_AXI_RVALID==1'b1&&axi_rready==1'b1&&rd_hcnt==(RD_BURST_LEN-1'b1)&&rd_vcnt==rd_burst_times-1'b1)
		rd_vcnt <= 'd0;
	else if(M_AXI_RVALID==1'b1&&axi_rready==1'b1&&rd_hcnt==RD_BURST_LEN-1'b1)
		rd_vcnt <= rd_vcnt + 1'b1;	
	else
		rd_vcnt <= rd_vcnt;

assign axi_rdata_de = M_AXI_RVALID&&axi_rready;
assign axi_rdata = M_AXI_RDATA;

generate
  if (RD_CH_EN[0]==1) begin: RD_EN
	fifo_rd_64_8	u1_fifo_rd_64_8
	(
		.wr_clk				(M_AXI_ACLK					),            
		.rd_clk				(post_clk					),           
		.din				(axi_rdata					),	           
		.wr_en				(axi_rdata_de				),           
		.rd_en				(post_de					),            
		.dout				(post_data					),              
		.full				(rd_full					),                   
		.empty				(rd_empty					),                 
		.rd_data_count		(rd_rd_data_count			), 
		.wr_data_count		(rd_wr_data_count			)
	);
  end
endgenerate


function integer clogb2 (input integer bit_depth);              
	begin                                                           
		for(clogb2=0; bit_depth>0; clogb2=clogb2+1)                   
			bit_depth = bit_depth >> 1;                                 
	end                                                           
endfunction  


assign 	M_AXI_AWID			= 1'b0							;
assign 	M_AXI_AWVALID		= axi_awvalid					;
assign 	M_AXI_AWADDR		= AXI_ADDR_BASE + axi_awaddr	;
assign 	M_AXI_AWLEN			= WR_BURST_LEN - 1'b1			;
assign 	M_AXI_AWSIZE		= clogb2((WR_DATA_WIDTH/8)-1)	;
assign 	M_AXI_AWBURST		= 2'b01							;
assign 	M_AXI_AWLOCK		= 1'b0							;
assign 	M_AXI_AWCACHE		= 4'b0010						;
assign 	M_AXI_AWPROT		= 3'b000						;
assign 	M_AXI_AWQOS			= 4'b0000						;
assign 	M_AXI_WVALID		= axi_wvalid					;
assign 	M_AXI_WDATA			= axi_wdata						;
assign 	M_AXI_WSTRB			= {(WR_DATA_WIDTH/8){1'b1}}	;
assign 	M_AXI_WLAST			= axi_wlast						;
assign 	M_AXI_BREADY		= axi_bready					;

assign 	M_AXI_ARID			= 1'b0							;
assign 	M_AXI_ARVALID		= axi_arvalid					;
assign 	M_AXI_ARADDR		= AXI_ADDR_BASE + axi_araddr	;
assign 	M_AXI_ARLEN			= RD_BURST_LEN-1'b1				;
assign 	M_AXI_ARSIZE		= clogb2((RD_DATA_WIDTH/8)-1)	;
assign 	M_AXI_ARBURST		= 2'b01							;
assign 	M_AXI_ARLOCK		= 1'b0							;
assign 	M_AXI_ARCACHE		= 4'b0010						;
assign 	M_AXI_ARPROT		= 3'b000						;
assign 	M_AXI_ARQOS			= 4'b0000						;
assign 	M_AXI_RREADY		= axi_rready					;

//post
reg [15:0] 	post_hcnt	;
reg [15:0] 	post_vcnt	;

always@(posedge post_clk)
	if(!M_AXI_ARESETN)
		post_start <= 1'b0;
	else if(rd_rd_data_count>=RD_BURST_LEN*8*4)
		post_start <= 1'b1;
	else 
		post_start <= post_start;

always@(posedge post_clk)
	if(!M_AXI_ARESETN)
		post_hcnt <= 'd0;
	else if(post_hcnt==RD_IW-1&&post_de==1'b1)
		post_hcnt <= 'd0;
	else if(post_de==1'b1)
		post_hcnt <= post_hcnt + 1'b1;
	else
		post_hcnt <= post_hcnt;		

always@(posedge post_clk)
	if(!M_AXI_ARESETN)
		post_vcnt <= 'd0;
	else if(post_hcnt==RD_IW-1'b1&&post_vcnt==RD_IH-1&&post_de==1'b1)
		post_vcnt <= 'd0;
	else if(post_hcnt==RD_IW-1'b1&&post_de==1'b1)
		post_vcnt <= post_vcnt + 1'b1;
	else
		post_vcnt <= post_vcnt;
                                                        	
endmodule
