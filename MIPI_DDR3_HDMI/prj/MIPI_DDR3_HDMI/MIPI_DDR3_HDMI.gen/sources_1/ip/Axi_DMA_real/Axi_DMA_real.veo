// (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

// IP VLNV: xilinx.com:user:axi_dma:1.0
// IP Revision: 2

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
Axi_DMA_real your_instance_name (
  .pre_clk(pre_clk),              // input wire pre_clk
  .pre_vs(pre_vs),                // input wire pre_vs
  .pre_de(pre_de),                // input wire pre_de
  .pre_data(pre_data),            // input wire [31 : 0] pre_data
  .post_clk(post_clk),            // input wire post_clk
  .post_de(post_de),              // input wire post_de
  .post_data(post_data),          // output wire [15 : 0] post_data
  .post_start(post_start),        // output wire post_start
  .axi_rd_start(axi_rd_start),    // input wire axi_rd_start
  .i_wr_index(i_wr_index),        // input wire [7 : 0] i_wr_index
  .o_wr_index(o_wr_index),        // output wire [7 : 0] o_wr_index
  .wr_irq(wr_irq),                // output wire wr_irq
  .M_AXI_ACLK(M_AXI_ACLK),        // input wire M_AXI_ACLK
  .M_AXI_ARESETN(M_AXI_ARESETN),  // input wire M_AXI_ARESETN
  .M_AXI_AWID(M_AXI_AWID),        // output wire M_AXI_AWID
  .M_AXI_AWADDR(M_AXI_AWADDR),    // output wire [31 : 0] M_AXI_AWADDR
  .M_AXI_AWLEN(M_AXI_AWLEN),      // output wire [7 : 0] M_AXI_AWLEN
  .M_AXI_AWSIZE(M_AXI_AWSIZE),    // output wire [2 : 0] M_AXI_AWSIZE
  .M_AXI_AWBURST(M_AXI_AWBURST),  // output wire [1 : 0] M_AXI_AWBURST
  .M_AXI_AWLOCK(M_AXI_AWLOCK),    // output wire M_AXI_AWLOCK
  .M_AXI_AWCACHE(M_AXI_AWCACHE),  // output wire [3 : 0] M_AXI_AWCACHE
  .M_AXI_AWPROT(M_AXI_AWPROT),    // output wire [2 : 0] M_AXI_AWPROT
  .M_AXI_AWQOS(M_AXI_AWQOS),      // output wire [3 : 0] M_AXI_AWQOS
  .M_AXI_AWVALID(M_AXI_AWVALID),  // output wire M_AXI_AWVALID
  .M_AXI_AWREADY(M_AXI_AWREADY),  // input wire M_AXI_AWREADY
  .M_AXI_WDATA(M_AXI_WDATA),      // output wire [127 : 0] M_AXI_WDATA
  .M_AXI_WSTRB(M_AXI_WSTRB),      // output wire [15 : 0] M_AXI_WSTRB
  .M_AXI_WLAST(M_AXI_WLAST),      // output wire M_AXI_WLAST
  .M_AXI_WVALID(M_AXI_WVALID),    // output wire M_AXI_WVALID
  .M_AXI_WREADY(M_AXI_WREADY),    // input wire M_AXI_WREADY
  .M_AXI_BID(M_AXI_BID),          // input wire M_AXI_BID
  .M_AXI_BRESP(M_AXI_BRESP),      // input wire [1 : 0] M_AXI_BRESP
  .M_AXI_BVALID(M_AXI_BVALID),    // input wire M_AXI_BVALID
  .M_AXI_BREADY(M_AXI_BREADY),    // output wire M_AXI_BREADY
  .M_AXI_ARID(M_AXI_ARID),        // output wire M_AXI_ARID
  .M_AXI_ARADDR(M_AXI_ARADDR),    // output wire [31 : 0] M_AXI_ARADDR
  .M_AXI_ARLEN(M_AXI_ARLEN),      // output wire [7 : 0] M_AXI_ARLEN
  .M_AXI_ARSIZE(M_AXI_ARSIZE),    // output wire [2 : 0] M_AXI_ARSIZE
  .M_AXI_ARBURST(M_AXI_ARBURST),  // output wire [1 : 0] M_AXI_ARBURST
  .M_AXI_ARLOCK(M_AXI_ARLOCK),    // output wire M_AXI_ARLOCK
  .M_AXI_ARCACHE(M_AXI_ARCACHE),  // output wire [3 : 0] M_AXI_ARCACHE
  .M_AXI_ARPROT(M_AXI_ARPROT),    // output wire [2 : 0] M_AXI_ARPROT
  .M_AXI_ARQOS(M_AXI_ARQOS),      // output wire [3 : 0] M_AXI_ARQOS
  .M_AXI_ARVALID(M_AXI_ARVALID),  // output wire M_AXI_ARVALID
  .M_AXI_ARREADY(M_AXI_ARREADY),  // input wire M_AXI_ARREADY
  .M_AXI_RID(M_AXI_RID),          // input wire M_AXI_RID
  .M_AXI_RDATA(M_AXI_RDATA),      // input wire [127 : 0] M_AXI_RDATA
  .M_AXI_RRESP(M_AXI_RRESP),      // input wire [1 : 0] M_AXI_RRESP
  .M_AXI_RLAST(M_AXI_RLAST),      // input wire M_AXI_RLAST
  .M_AXI_RVALID(M_AXI_RVALID),    // input wire M_AXI_RVALID
  .M_AXI_RREADY(M_AXI_RREADY)    // output wire M_AXI_RREADY
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file Axi_DMA_real.v when simulating
// the core, Axi_DMA_real. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.

