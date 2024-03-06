// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Dec  7 20:35:57 2023
// Host        : LAPTOP-H1858A6E running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim d:/three_verilog/MIPI_DDR3_HDMI/ip/fifo_8_sys/fifo_8_sys_sim_netlist.v
// Design      : fifo_8_sys
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a75tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_8_sys,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module fifo_8_sys
   (wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;

  wire [7:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire wr_clk;
  wire wr_en;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [3:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [3:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [3:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "4" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "8" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "0" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "2" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "15" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "14" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "4" *) 
  (* C_RD_DEPTH = "16" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "4" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "4" *) 
  (* C_WR_DEPTH = "16" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "4" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  fifo_8_sys_fifo_generator_v13_2_7 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[3:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[3:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(1'b0),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[3:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "4" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module fifo_8_sys_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [3:0]src_in_bin;
  input dest_clk;
  output [3:0]dest_out_bin;

  wire [3:0]async_path;
  wire [2:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [3:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [3:0]\dest_graysync_ff[1] ;
  wire [3:0]dest_out_bin;
  wire [2:0]gray_enc;
  wire src_clk;
  wire [3:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(\dest_graysync_ff[1] [3]),
        .I3(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[3]),
        .Q(async_path[3]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "4" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module fifo_8_sys_xpm_cdc_gray__2
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [3:0]src_in_bin;
  input dest_clk;
  output [3:0]dest_out_bin;

  wire [3:0]async_path;
  wire [2:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [3:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [3:0]\dest_graysync_ff[1] ;
  wire [3:0]dest_out_bin;
  wire [2:0]gray_enc;
  wire src_clk;
  wire [3:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(\dest_graysync_ff[1] [3]),
        .I3(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[3]),
        .Q(async_path[3]),
        .R(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 83888)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
