// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu Dec  7 20:35:56 2023
// Host        : LAPTOP-H1858A6E running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ fifo_8_sys_sim_netlist.v
// Design      : fifo_8_sys
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a75tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_8_sys,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_7 U0
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

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* REG_OUTPUT = "1" *) 
(* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) (* VERSION = "0" *) 
(* WIDTH = "4" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray
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
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray__2
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 84272)
`pragma protect data_block
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
s5TiTsmiV41vRw4DHio3Iaghc60j7Fe5oXA=
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
