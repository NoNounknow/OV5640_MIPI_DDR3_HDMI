// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Wed Dec 13 11:18:35 2023
// Host        : LAPTOP-H1858A6E running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Sfifo_Raw2RGB_w32x1024_r32x1024_sim_netlist.v
// Design      : Sfifo_Raw2RGB_w32x1024_r32x1024
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a75tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Sfifo_Raw2RGB_w32x1024_r32x1024,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (rst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    wr_rst_busy,
    rd_rst_busy);
  input rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [31:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [31:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [31:0]din;
  wire [31:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire rst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;
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
  wire [9:0]NLW_U0_data_count_UNCONNECTED;
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
  wire [9:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [9:0]NLW_U0_wr_data_count_UNCONNECTED;

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
  (* C_DATA_COUNT_WIDTH = "10" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "32" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "32" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_FULL_FLAGS_RST_VAL = "1" *) 
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
  (* C_HAS_RST = "1" *) 
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
  (* C_PRELOAD_LATENCY = "1" *) 
  (* C_PRELOAD_REGS = "0" *) 
  (* C_PRIM_FIFO_TYPE = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "1021" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "1020" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "10" *) 
  (* C_RD_DEPTH = "1024" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "10" *) 
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
  (* C_USE_DOUT_RST = "1" *) 
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
  (* C_WR_DATA_COUNT_WIDTH = "10" *) 
  (* C_WR_DEPTH = "1024" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "10" *) 
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
        .data_count(NLW_U0_data_count_UNCONNECTED[9:0]),
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
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[9:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(rd_rst_busy),
        .rst(rst),
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
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[9:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* REG_OUTPUT = "1" *) 
(* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) (* VERSION = "0" *) 
(* WIDTH = "10" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [9:0]src_in_bin;
  input dest_clk;
  output [9:0]dest_out_bin;

  wire [9:0]async_path;
  wire [8:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [9:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [9:0]\dest_graysync_ff[1] ;
  wire [9:0]dest_out_bin;
  wire [8:0]gray_enc;
  wire src_clk;
  wire [9:0]src_in_bin;

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
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[9]),
        .Q(\dest_graysync_ff[0] [9]),
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
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [9]),
        .Q(\dest_graysync_ff[1] [9]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(binval[4]),
        .I3(\dest_graysync_ff[1] [3]),
        .I4(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(binval[4]),
        .I3(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(binval[4]),
        .I2(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(binval[4]),
        .O(binval[3]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [8]),
        .I3(\dest_graysync_ff[1] [9]),
        .I4(\dest_graysync_ff[1] [7]),
        .I5(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [7]),
        .I2(\dest_graysync_ff[1] [9]),
        .I3(\dest_graysync_ff[1] [8]),
        .I4(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [9]),
        .I3(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[7]_i_1 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [9]),
        .I2(\dest_graysync_ff[1] [8]),
        .O(binval[7]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[8]_i_1 
       (.I0(\dest_graysync_ff[1] [8]),
        .I1(\dest_graysync_ff[1] [9]),
        .O(binval[8]));
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
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[8]),
        .Q(dest_out_bin[8]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [9]),
        .Q(dest_out_bin[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[8]_i_1 
       (.I0(src_in_bin[9]),
        .I1(src_in_bin[8]),
        .O(gray_enc[8]));
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
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[8]),
        .Q(async_path[8]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[9] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[9]),
        .Q(async_path[9]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "10" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray__2
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [9:0]src_in_bin;
  input dest_clk;
  output [9:0]dest_out_bin;

  wire [9:0]async_path;
  wire [8:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [9:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [9:0]\dest_graysync_ff[1] ;
  wire [9:0]dest_out_bin;
  wire [8:0]gray_enc;
  wire src_clk;
  wire [9:0]src_in_bin;

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
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[9]),
        .Q(\dest_graysync_ff[0] [9]),
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
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [9]),
        .Q(\dest_graysync_ff[1] [9]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(binval[4]),
        .I3(\dest_graysync_ff[1] [3]),
        .I4(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(binval[4]),
        .I3(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(binval[4]),
        .I2(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(binval[4]),
        .O(binval[3]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [8]),
        .I3(\dest_graysync_ff[1] [9]),
        .I4(\dest_graysync_ff[1] [7]),
        .I5(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [7]),
        .I2(\dest_graysync_ff[1] [9]),
        .I3(\dest_graysync_ff[1] [8]),
        .I4(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [9]),
        .I3(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[7]_i_1 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [9]),
        .I2(\dest_graysync_ff[1] [8]),
        .O(binval[7]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[8]_i_1 
       (.I0(\dest_graysync_ff[1] [8]),
        .I1(\dest_graysync_ff[1] [9]),
        .O(binval[8]));
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
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[8]),
        .Q(dest_out_bin[8]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [9]),
        .Q(dest_out_bin[9]),
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
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[8]_i_1 
       (.I0(src_in_bin[9]),
        .I1(src_in_bin[8]),
        .O(gray_enc[8]));
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
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[8]),
        .Q(async_path[8]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[9] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[9]),
        .Q(async_path[9]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* SIM_ASSERT_CHK = "0" *) 
(* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "SINGLE" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single__2
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* SIM_ASSERT_CHK = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SYNC_RST" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "SYNC_RST" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst__2
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 118240)
`pragma protect data_block
qZwzyHFcdSFp6lDeRnBKK/V3oYXgppKiB9OTPFtu00lomBdhDT1/Go3clWkWFqcfFEjUzgztG0JW
mF0xpIZhmCcnos7YksKUsQ+DQkGdmWO3gkR34pSPyn9nr6iFXzcTml9Xii0LX7JTjUQ3xBzqQ33A
p5H4LUVb0sZ2MCwZRULsYT1E3Q1tkCCLGfon5JGTB9Cbn1BivpSwdWMh9CEo4+QvxG6UzjMr1OVk
Clsuo5FupVFXqVmMj/PJH2BOX1Hfs7CkA9sdaaeCoi3rQ2ev4XlW2EtGweFwtVIhfLi+KP0u8Ief
PioveDF52233SzRvkoGwG3em54Sdujtrq2zlxV3Up2AtEnUBnBp1wXWv7u9F0FtkdNJMEw0MO3g3
7ECe3yyPD9DK2QS7mFxtX6WtTw7nTukCJbjptprf4PyatxtJxt+ByhzzTmYtKA7keKdAlWsUDhaL
38gXOqQ+ssEhUvFPADz1GiPWvN+h22nPORi8UrPI4AcytAH3NkQZtmgaMCYlD2Tluu0eyE5QZVO1
0wfxj+bWkFeQNh9llveV4KIeuJjk1HikGljxT2Jiqy+K1rmP/WkAjt5LHtUbDc+Hndu4wVg8ww4W
yyzmukCB+mdVvqsDtvPAVd0AKIvpsQ6FOKCyqCJFGz6YGkPE0j0VT0amK4CmeMRirpKcDNhz9fO/
Bgg2LX2snuVbAqG/84RAuwdwTLG2vJk2zuEgO9JdIY/h0iFUw7uwBzDlDUIQQSaJA4BYRDw94HYG
y3InA3/XuGSWeBWX7+3qZJlm39iLK0IkTDSwqwFh9aNDoVyDZetCLESneoMGGhrNkhbbWqaJk8mb
nV7KWnoV0y6YzObkB4ij+QJRw+Q/YEQ59k8IMN/HpADnz75UKLsteqoPdhmac1bfpTXk1SAGc3dR
wV+1WvKy1T/dS3ktFSFuF5Wdsjz/Zk68EefpgwvTuMaIsbNIkGnfIuzLf9XXEFeGss8+FeKnzG1/
cGJRTQ919Cj67WJy2U0sk0KHZ9e8wFRU+juv6ZKxk5OBbwtyom0L/Uf8qyVx7FTAVVkiJKe1PuLr
QDPZtqxJ9KIi7Nbqw+4pHZyXOODAB++PVUR1kyFd2PgE6zSnBPSJT0tCP/Tythip/eRENZd+pdxt
LSAJz0u5irRaFQSxaUix2jA8YGjNSKnLKYwLAH7O2IeimKOiHmyoO7xw/n6mPLYjc/OxkVBiHRJm
93Va8mxnxZKjXeyHGL2Ex3Xzxs8/Zn+AhPwy2rwKIKDFoxDKjMENS0bjgGnJ64nYkZjgQgZFOyNV
WL7LiAKSvbfgQTjVgMO53BzY7aelJR64cbYbH0OI8AcigrtmSySSjnhFhcj4k5sEoi9lDr2vP+jz
RZ6p3cSQ/zff80xIzvGpEPBJ3Ua0yNQM9hmSrhlKpUhzcPsCEGYCm8U6N/TRlAuC8alGGga1Kspr
qMIVOclAwcqOpl0+4FvfFji7szdCCsZx1wp8Al3/RY1L5fPL0JCSp+GZ7TAtkBuUGs0vzjSciT/p
WM+VV/bN4Mg4r+jAiRgA6RfinKjzbt9Zg0xwbVW0z2Gs1RON38LkT0KhYe9uvhFR93vAxVPPVmkN
BsQIjNYjwQb5mxuEsg50/WdR4LMLvqOMxL+WVjy/wkz3lJYkJEuFMBH8YZ0NFSwVRzELzImfaTat
UAuoHOVQgrkLNePrPqrvsqyiL4X/8Jf3+aGPALgQhx5vdRY06FCBN6yFX0GeIi81hvQzynbFO1Tg
4cXoXlERyBJPCqTvgxD5kTwQUbZt32Q7i+2PWcq3qkqCoL2KyJn3TRzckp/k6w+NXqaj0hgg0XQ4
lgNPNnl1tPbyeM5Gg5wpRFw+dqbpqpgkjBjvUnATlKoUGnghSdEb4jXgNZpqSshT0R7/uP51+4wq
hdNFLjypWxR0v4NRkfRgEPJ3PcJT8hd4Ev5DSe3ZeBVzAeExLjw2zgwDkiXBduQrjKNfbWTpCu1i
8OM5siAhyfmqwblMA4QRfj6XUsEz6pBQje4aJtLNCnNIqW6uPYo8Y8RGyPJXSqPOgMvpQVhATdVG
s2TjV7yuGi8qf5DZKtG9if6N+mMVnKdJdoQjiRIBNkeghtU3do1k3sYtP+lh+tLuR2esGaTtPqE0
rgGSy7amczmiVV4TImgc50NuIT4VdUIGHcZB2JaUKzmyUxbpG1yslVqyR1eFhzaZ+9PLc4M2I5Tz
v/kFbEqIu4Io9fByT227Au9OTap3/9mpPR/06jx0WfKILLcIgmWzxW3YVYuYXU9IvKOyHtynut0I
cZodPtSA9JEws4I5huqDhamGQMYGNxihTyHE4pJFGTQcZmlzLktSmiDjcG/Fhm+D0+AG2vp89l7m
U1hkoAayTgKcaubk710T/F5FFJ2RmhvLVBnj9JQaB/MAgPhhqBNSOI5zCykOP0nLe5477bKn7uAR
Gm6NfXbl/nL0xZpL1clkueV2e9U1I32JgCGoqDPSOJI9RqfcmQRc0Kiclj3DUJUS9sl2439BGGW4
0Acxv++99JXRrlU50xr2+YSPha09TloZn/Rflln4ubKqkrjen4K2hxpz4ZNLAZrxOA7HADFYNjky
KctAlMBxu2gf/KQFVPnn1Fx9pbQ5nijjSQKGExnfGSPS+WW03fLj1dxh79UxbG8SFDGOJqLjdy37
kP3EZWYjbtPQx6SV+/gg49+88qpMUI7l0103KUYd1rXA5rkEahELQ7wdiPDyjuqP6I0LnMDKyQHg
2x7ZHsBt3hcJdgWPN9BQqebq8VewLFUzALioAunlBctwyXGmJDEIAda+4d0ifE3hZDOy82GVKQpg
L2LknqHc5Nmt0DnFrnwkYH81nNR+TIVb63FpW6m9v7F8aKiEPNhUPa1C3AHzoYUxoQbDN7vgGgQF
Wz6fONKysXeOpGRogZ4dqeeipufa4fDAaJzFtDiJP7OE+op7Gm0qKjfjlCrv0776nV3WHpATyNaD
vg22Kt4uxPQ5wdl9eUDSprZkxI7lsFTKMubILTInxH126VdeU/R/CRwkteK1P+dkQNnmbD99hrwn
ou//qgbTIUTc/1q+mWRK4z3JaeF024kz8jge66wiRuqf4hDBoqrhg6llRgjxs71SW8EXr5fI6f6c
Tili3JARnr4WFL4pOBEkAblb7I+B+CKHKUWp1y4IJxZg0Qw0c3xIj4BgyDagy21TvmM4DgFlto+3
bE55pygAginrzU0ZkAQuCvCsFK/RoFBSJmDd3MLm6F8kTJmo/9p5/AS0GZASix52EryHUF4w4c5c
wx4AN7U7mC/Pg9n0HdqGwET5H56/btoOw2i0kR9o3iKrq9p8qP3B5vXVWy2GyWWYvLXgKswCcyoT
niG3Olw6v+j9fQE5cE/x06Of0VRH7gAY53acz451HxVHSxAHme8xCQgSoVzr5VtuysyuHmYEq8Ye
RXIYlbqF6piabTpOFC15ShU7C482Fx/7rNZywfIBjg0Wrud6ScFmpFItI/1f9Lwo6amWYdMAijqu
0reo18JyRZ901vsst+3h2sgHKkTH7oS0dWW0qyaGm8fXWkD6e4OF9nZY6uGXpbQAkJ7Dub7XG3ni
sMCXjVCF5qZvufyf/MoL+Az4l+zdt5eOjTUM43CtUfuI8Dvd1JvoLCqnVUQkdqguzHTDnqw2MLoo
0+IOe0Z4tc4T6k3IiD2S02kARZVXwgyHDkajSBkewG1i7pjVQuLTpsTvwcluXZeKJHgYVc63O/RR
QlbLC0TQyClP10RNm1v2kvfIBocOqLjPFb02nZO84neAtmKlyN2IeXdesYBfLmWr+zabWHMC2CKf
dNoOYDYZ+c3nygMHGm3Pcfj4fNrvuJdmDwT6jxtXFG5Gf0GRizer+zJWqumrgbAQi4JpUOiwAw7H
uNwdfmWDJkw6uZRjTVp9VS8pjSySIotr2hl0SihBYGCnZNRv9IgMgegBcelCFPnM0KgCKrwg0fsn
k1nvL334u+m6CJ+ZZnn1ziSImwjEhpYTmbeJbhjRn3BZ+AZlzqF6swuadhzGoXH9dGOSA+dgKiyc
oIy5nYMMm2YquzjsH8IBlcrMUc0vVFVo0vkynZFsd6ZHSqxNY9WMu0lEpUQodaC41m4k0/6yQTBi
RlKkzlxFEG5d/TnFCpkn9aoPyH6Iq9rqOSt0KQttrzE5zQJmbkRT1kUwI2QlR/aw2q3pCrOO9kKw
6CigyKj02Fe0JPlF2UzzYiI8/nzsluT5dQmSx59K1eh0JYMZoecfl7xTUvDwSkzBXXvNwO601IvH
SegX7JTHxfu90DilaYVxbgdq5WM9mnCqWNfojcxi1NanB9NJgETGWjVzvXKKkqIaUXR8fHwJZPUH
tz7upM3MHqWy8X0hd90LCQog6DC1uoHZ2L8Rc9l2p4GUJhHKGFHTQ0Oqzi7XbzHDttwMZ+MTkwxo
EwW5ITVp8oVLue+SQQgnmpQwbaTtczKLIaRM/bumeP62BRSpV4SjWxEm6B9O2yHqof8kmLud9M73
byGnHVnF+zeLTZ4OJ3aRtsQVd75+YNmU9HlOPkOtCMThBGVd1TgD+bOVyVXQS8DsV+oLrm0/68ab
420iVtKsfinG2d7hv681exxAUwjZB/YzWoMXFtm0qwA8Kv2e8v0k2pJ/bylL2U4TO+Frx/5J9OTg
aT3CB2dS5mhYbj92krYVr8HweNiRj4PaCWUjjQMzS5No4ZK70yKWh+guoDEk+X31qqAYHTPS+Uae
r5dJAOJQ+hrbnPyqw2T5rDWNUjL+eyTCgy6Z9+zf9Aup9TXVQb4JpJix3VNn69KnbnXQqUykMU6/
3tMuy2Kyr5L0NO32SKHfP/NPL/gpOuZ3ajS/M2VvEoFcgP/LTyDZ0ZgB9wmsMQpBSqv0qEGbSULI
APoOTWKsXdYc3ndkZTTFI8jQLmSi3PMVa+AjucEt3sSCY70/B1Qc69M4vbu6/V6M7S8z7FaUquCI
AYEnt8IW8QCTWyrkribm8NzE+PG3pxbEAAjPINdf5KNPKde+CIWbuSNIRM6Dm9dAaSoY1cFEqnEq
L6SlHkklWP3q5lVO68F+8ET7hEcW/ToLQkSQtw2dInRdVhptPTRmqB9GTw6vKvhxbzIT2dbKl0lb
nr1EjaV2aTOEoswAhF9maaX125adCXDwMZZuIhFzVXFFA1NIOEN51tut3sOebxtx1xMNwcn9wqB3
wPERUZY6RzrHYClXkimBFJluGD8mOHuBfBqGbumOD6lZAgr9c3knDnTvW1uGX2cFgx7QyUqogHtR
mO3OQvhNLp+bKA+x5mIcaTpBxvbL5k8mkT+3NO8aiBrn8t3GVc8bkWyE2vg7NQ6/ELScEa6hx+TL
pV+u+Jaba0lEG0izWCNlk3JmXSTooYrgmXc/ZrxoCFS4IWVUYGOJsp0RDFQnfz+EWpFUE1hBacQH
7vD6PV/7/UOO6kSv/YqBps4HBwu0X8vbLyF478CtlYH2EQ3s6Dkt9+fDzxc8m1w7ktIslEyRZ7ie
cUjZnT+jlmg/JBVRDzQokznATOG+l0gtQP+u82SpGx+ivIKC0cPwBzT1DMF1ytVFv0+R13cPXun/
VcIbg22d7val1yvc+HTQcGKyJDuY5yoSkfBKBe7rr1dQ4oXsA6QjEHGZ1WBT6tzAsDwZBcul8Fes
3BL1c/4lqke5mKix6S1skJb4mQ5yV5dLdjK/xqHVriOTRHEap5MVQ9bKWxB0LKotRWBP5nxraDyi
TJ+tjHCuXCWnMvVuX1f2xFfb+9zKuOjuomP4bADBPFHivJpStI+iJ/GC9su7iEFOubLeWu/ICEOe
MxHUd6u1MJhIZiI1R64sy3INCd/zhn6Nwiani/BnenJCOmsCEoaYXPTtxbDdd6R5LiARuxgPm5o0
/r9J80PSmwnz98Xj26vehGYYj06QcHv9pps8z3l35RiSld8iO1hfeh534PRb//0AJt94iGeqzlgV
SNQzv5AL56U/tNwhKuGmDYlM8xh9cfpSdw16kfe/IZyY25Azc56FEtmsWY5IFEIlW1As82GooKzb
gPGWRiSJmhF2QDsoVWZdnbLCIVXvz9sZ9tsWDchxvlj8rAj6xGIFTAf5FY7H41whw3FkLWD8DO7q
qLdB6Pm7MwtgZrvq2sRGpiv3102+URUApjrGF4yp6IZubRbaD2Pp/pEBmbxpZ6q3EYwxEQ3ZZmgD
D2fA9aulFlm12JyistvL1O2Rv9EXulx9JlQWgaf+tD4PLm2fV9uhfTg3Xar8JSpaQtC6AUutjtjE
nVcoMHyj2EjVpsgjkMkUJylrgtCpynaV9/C4kZsF3kp0KhfNo/Uax4jSp3AnEFMZoYiqUJNt556q
+8p3up7cNN9cCkprahCS74X09ZE6r3eOnlHmKYhjOGaRGMfsjSs12sqxPK5SBM5Dy2X+WhgMM0Hn
W7D7/6ceNuJFd/jZF+94EIvQjcp29i5ab7S8LzPg97r3whTJnt03w+U3UHN4EO1m7tiL9tE9l/kw
3gch0tdbCBgWs4KYwngXbPdp7yz5/1hhQR0/PVXtwQsEtIk6veoyDygIuYVNMAWpEgRw74/xgUP7
eVwP0qs+OPEUj+rlXMg/oP7Gxqr/gghXsqhWnDWCNMEduPMGgbm/Paif+zqcbavKsmeUJIlDH+VY
tXRpbPqq8V3U52xmf2Rx8/ejb36Soz3lJXNzkjzxZKC+xm2geg4SmcQIq0Zk8goFtDJNFCErU/IC
Gnv+PEM09O25urA/Jcb2B7nT7JDiMSsEZgWz92IeV0AWtX435eiB8eEZhC686JKkQarviWXpwwFx
2o4koSIicmTNiecw3taDXPiYUzEvKIS6D+BiJTi31bdDgszFjYGcJcwkPzvoRddfXGoj/D4AL3vZ
z1w3mOqxxwS2ms3BdlkxlagV8BNQJHAY5a0tMMiDgFduIUrzuHvyLWmhe1iyCRZuWED/yd4WTMwI
pw5GZhDjeygiz/Wow8Rlce/XmgYeF5ITOmkz27qwwRuWz6KWrqqKoVLSRkVOUnznfwcMOWaCbl3f
EMZ7v/mwL6dzGiygkYZXqEOAbOTMUMYUPNBAgqZnjBcn3vAhzUAgUferMBk8qy/w8OFiLQAjB0Gk
iK93I+nrLu7ClOqY1GltN8WT9w7jR8+bcVdHbaktDUwPfjvsKk+OVTiPv5C5BG7p8X/IDRvQBgML
Wta521X98IMgefjGoO+YFIWx0hubn2HW+lcXd08P8AJDYkmczIYmlFEAKknRDcpqiCf+3heShPm+
ccHRNLI2cvwskhExqYpWduoECorvVR/i1vI2tqnETtxtUpDYtmI4UKChqylf/p7h13RUJR3Yg2Vo
NdstcVd/ZgDAdxK73XdeQzEfzi0AGGlqrKmVF8A9ojHnZfbVHecwuaMe49qvUqUig1wmWVV5w5j/
1hVXvA1lyWBgOCO3n+Z2ZHGr+benidbIhi1DIOKc9Cm2E0Vc//zAZ5VivDJEmTxxw3sDQny02med
bAytBytFAs8MYP9P42g8MOL69dLsc6Uap5zotClVKq9y4xaO+U0ZHAcX/q7CiR6mYhJrtA4eMvaM
4VkyXVJLqyYyEU4PE4ZlonGNiTgqf6jX5ayXi78uO9y1Fiy8y330RR6yhx7lAgetPp1mFQEPDqgL
z+zkFNcY5DGHpPsPqqjzd8cn7bPnN0MZJ+txWuCGgdx6gDP0GTox5DqN+ytMiIMGse225XwQPN+q
JDfb/bzLS0RGnQoe6ksF0oqkp4eeWuH2sVTAg0SG7scnY2NGaD0Om2fZuSXbH8ktfGyZz2YE2J41
W9eK2Sw17gzFForjXzKlLC3ujtF2qb371UkLz+r7LwBzrnJnYMaVLd1dnXDU1GUJwrmHz1vYlPXH
PeepsSYy0kkhN32a8OQ4Rns2Vkoq7D2rC0hlTsSnYZEKHSo53aoiL3WwtjDGBHdHx64p41RnWLwZ
Gvh7KCD2ldG6xu8z4O9p/+QQAuyldGoqx+jS8lhiU77MpSSIPyjEZ+FABicQ9oMR3IS1XYgHEXYz
8TBzSyvVJdM3p3sdzVs78Yu4v9dL2e30wsW3C6jTi/urcUvOzUbw8D6uGZsDK8zmMi53vAboTM4P
71UfAYLE6zCFuosfU8ytLV/8JY/xy5tC5ncrPsD4+Llxwc0uFCy8yRpp5KaLrlNP7CqRk70rXfN+
zJ+pakna01b41z5/MikYdWobTIWiqtfAQVjnOv2NoHRn226LVKMPz1joGp89tLefFIDwxNb586lr
gWWN9GnlKBLmFtkDcMh/F0BckAYfi2GTUPK+Hxj5/BD2bd/5kSFNReDE8fHuUcemlzKb4pjuTrfq
hzR9fZuN1XfQ/3yvmUL8ae/oObSFKPW7F85Ub+RUdyjVOkU971oGMtIKQbjjJDESoHPM4WbYLzCS
AK232U+p3bYZ0894yIBRrgpu2s9HNT3mroYHNJlO2XGpbsb4QRUTuTGQWn0OPNcE91VHSklXWhP2
h28uXXdtb81z5Z18035ug4LnzZB+x/vogKEYfhelqxCQtYzNjFV1gg2FjTIA10FZoSuCp03mIxgs
tfqZyLKGHyk122D3gSy6l1QynF7LMZO5N+vpNNRJywIjRwpBsCxW5kezL7sfwHjUrLCAEAUmEIxK
+B7rCa8cEBdX6XVpgcTtLx2zgvbfAHYlcNclCNDMDMGObKHrAnRFO0s1m+zp4VQ3AGEMOoxqz7PQ
2nipETq8mXZvtYc+VrSboJST74zqFapvAteoqVjKCyhjUWrmu65rF8Bhbwd79kIT27CM3FQNueyM
QpA6YEoO8lek1A9nrRa968NkpgZ7hiZfW5FZNgS7fH2sjLnUHfdfjpIyhTI3iQQpOsulI0Oja1ai
y8ZYarACl1RQja/wmADVFFtgWXsPb7nCELPT0dkI18yl2uihZcvZjQYMZd8dwzF20lksZaZplARM
sX973adNhNHdykzW2CQGqpw0TECQMBNbclNHmnjdWTwTvNP+48bztohMIq+cRxqYaOxpPZTK8X5X
WfZMWXJSOWlB84jZEkKs6vXSOQsa8AJb34BAXz+mziVjqlOA+XWX0fhBjNVVWJrhESLveuLm2S5B
t+LCuxwiviE+qKEzJpSg9mq2Lq/EOapLR0X81I3WLrF02/GMdI8Fbwb6c8lT7dZoX/sUwCs9MOOp
PIa+31TMBF7c7CUN/ZMuxpmIm6v3D1Vl21jzYrgGoKgmkyOPhNx9mJByGjgvoO9hNjjou1n6gLj3
EvfiC6BKzx9NkKhlrhnDnFO4+kZIKegWBMwqMopJEN5otzEt9/HuS4BRLph1OTpUB8Q8G6K/pP2F
Gi0s0I+beuTHVV+7VY7s9A6zfkGQ+gnWYjdV+n7Qa1jzQjZDw+gdmVneybIO8biQqRjXhYVKLiUl
m4EqPACSZy0EMWwttKTLPPvlyoFeqUjgTl2kF7pVOyi1FVRyFGeBuHN8aXp5G8EWEaPUcuOhon5x
rfHQ5a2humguWIn9MTwsgUOlD+o6YFijWnH3n8TcB0lnJfcZA0ecQ7hVP58kiDJ0uPkvKtiT8uDa
Gy/mPyXXBkBooRYCFXRbKqfZBgiHLG1CX9vvMIC60kmIrkZzSkTE/btHA9nbBz+hNS+TvPSvnpvh
3sR9J8UMfVG56SbLPcTLrkZTS6dR/Q8sEwSHFDsYhDCuj0AJtibo0AvcyEREkOOJYafxevbMzQvy
ujrgfPLd634md+DrRwV/l61m60Eq8BL3BHXvSq/saVAqF9w4BqyU8pBgtoGT/DLtGbIiTHxu8tqA
y95tKr+RU67Tu8CbC0IX6ySLGdyXaOQ20UHn2iWo7d06torC0wYUmD7sHmDsyITP/QxRrfGSimE+
C3EQfk0Mg4gFCOvAqWJPQT0eOssW3zC8Q2fyHncdL84cdV9Fd71VSDA701vB/tZEAuUeLFbsGcfa
3NePy+dQmgk5CuAEe47aYDE5A1t0e5C6z3ax3v4ibMkgAnhdFszpOHKa8nFchADvp/I5DwIQO64Y
sNACst2zVLAMDX/t1Nfy57xaCyahs5aOzXKmm35k0Rz+xHMIxM4EGFl2Ctc4qxDz1YqiApfkw9fP
DeRcaXC0fUOiYXpOyjrgHKGJlEXX9VRngbBcTFnb+gH35QxizWaeIAB9KRU4MJWJoR1mi7yy37do
ZRkYSvV1J5igPYsCbznNpn5baaKCllED7subr8e4APS9uFrD6Owc24rioY+R95S6QrM6BUyZP6bb
xayTJHl7TQdaFkQGk16LJpnjWIDvNGbuHL/v0hesK2aFaTeBvV74Tq0pMpg3ULHlg9UvROj47u5/
Jbgx7MCWui+oUQJCjpliDDQAjwDIoKsEj76ZeiEC40kPQB0Mmq30thhjqMwk19Owk0CkhdXhGeGm
1r5j17WFqDbUcgHAgImdxOzGpXqOGTIkQPnyA5bylKruli50Bp/nA+lH7PkThiA4wHws1dcH2d8M
2RtP6zmL3iwEXOW8H+NGo3jfkNUKfls86U3TyaOF0qaToJD4yrVFPGHYWmw3ARwvbx2vVt/84vE8
FgKFZfTBPTpkdK7EFRREJ+j+i8yMEGeoF9ZzVKMKw/vAAnDf558uaqn3UdUx/lZoV69glNKb1DCA
3HVU0LPX1ZtJGITKEHVKRDut2gof9TCZTcDEP1aefWmImBCU7YmVh1eLJkcwIz/V6Xad7BN4g3zR
3U5Uhk/mpseln36tvKoaGiayATXt2EjABeydse5fl5vgPKHJbUybAi8w7RaWbW5bJ4yy2Bfv2uQq
3OfKB74/wnnoH07epnFS83sxq1UtJyMWarSQ1DVYgSx4UlvhQPPs1tBC4cVAj6neWV1Bd0y9StEe
NdM8REjwvk7vs4QPwIORdbPeFMSoyMEAiSBHqvqzzgwrYOH/BymP1ANhmH5zMMW6z9LCdAsIqKrD
+24HVCtQD1DO488olyhpqWi9fIHYlFKsVnoDdOcEPLExVkaEVP9KGXKFswwYuyP9VlsFmRoEMf7A
l3/h8Mz+p46bNZF6Fnu9V8TyOVn7Sm80q8vO1+PjEBh5tJPhNca+afoDHPHRjHnihCeM/C2pGapN
lLfhQY1QUcX+iMXuT1K/cEgMh1ybXJ+CRjyAvjPg9eaVenM7JKWlp0gYd8DgPDp6x9PdW/WmhKcW
qV6AzHZh5TxcXXhlEJR21KOPqxZoH895ZFL9sQbVXtHepKxfHUtDuKjdlPRanG4SuvAiY+3ai9Or
m47IWyLis1Fy+tjKM7OCvtYqJtc6uA1v9JWTpVF4mNGPFfSs8YU9xSlaLvt44DNQ7WkXBh116kyj
nwf/G8BaCX8fDFqL2/VwYBvRNh8nvxdhriGPTbRXoHkj31ZO5XOz/j2Z66Kf9CLrcIs05j20GBvx
FBFuDIkANW2vwJ3Wpth/1MCBKtJuXb8iaTVgTA9/bDd4Gl9S5+9+EV7yizweAeYH9T7xOU0/HTC5
3jSUCubmiVBSt1T4MBW5RimGc0+Yr5EKcBrG0LXf/a3DBdm+NQ1wdwcASJG/sAoZbPcIgGF2TjlS
TCI8CTsOPR8oQXIYyNZAvvicQ2cL0hAfEtX86v6Tt+26JZwCnWgcV4vDPmf6//ozi7BVEfP6UjCo
QDflZSn6p68iS8JU50GLzWTp68iFeE/qBMkSTPyTsiINtww/jMySCJwN4JPdLWvaZfa6rrGhk7Kl
MjBtbxHfBDQWI+ZHC37yr+cZ9A1f3tdsPbqMso7P6IlcsHZ4MP3I3OzVAl1NRxgcsW8lddauhUDH
crk2u3hF5VWVkfxzGrL4AxOYtNyhsHBK6mVbKOP4uFM1PvUv6hiKoEgRN4w1kLyYJXLGrqV2Hbxn
w8Oh1ONOvBoilk0XoIiJgI85DTabKppCWp0Guvxsh4JIAnaZtoetYAshcaLfDdAMyM2Ca7rf9LPz
7gis3UCVIzCqkN6wIMu9Ubyika+vH6l67RDL7p6Uhegwia08kebUGafExCtwjoIzBjxGYR/tmLnr
wT8q4KkMoSyAN9ahdCWHWhCWtBKsgJUy8IZ1R/e/UG6/ANShm/NVZGgmwsKyGlcrlJAy5tv66Ubq
QmtfRdEnglBy4rds3Nynmu3oRHGns3lwwDMWmMLe+w5IMRwXsOZNrBbuYbbrzm0seYDN9pPLVzlj
PBO2dOfvItUjXD+aq4T46qPQHabQAHxj7Si0T3uQw0m6aXzecgiU0J46cZon9Gz5YPDFm8fcan+b
NSTkCX8rTC9NoPFNjzTVzA/xg5Ez0uRm5Ysetkindd1r0u9d0roEQOTfIEJREfxrdApGxzvLLzG5
L069GcxYAVxDdzd7PbewMXV9Uo4NID+a+AnQQkKV6YUx5uxKCuo0E+Nvil1NaJYq+JE8tp24wOty
DEStIrTz25ch24JuoYQ1Ro+vev39OJzyvWldRdmiisDDed3T/sRqxDdr9BajCwFl3Q3OCjJggS8D
jIvvXqcNEKoUhw92zNN8E4J4t0Py8Vk6bkjVEGgI2JIcE9NVA+gpKp5BiWJqmEPLOzsNVPei56tS
XYXStd/m2nf9U3/QHNHpEsAd104KfSTaFXo6+XV6SCIc59P9z7B37zMnuy+dPeEwQ63Wgxj8iyVp
k1hdDzfmdZNnAOnSABzURwYIc+allhR5k9mcC/Qdm4KxAWk7ibIiVInwBBuHYU6mA7LD6iVc7TP+
efEAM6jCI7+HsFoohlWGVhHkBaM0rNp7P1uGnm2ftbbLMXO18t/mllzLDX2gdixIqLu2lBK4eexj
B/BFMDtrVj3AabQrbut1mHLCUYD378IzYZ8BMypzYoW2l96Buu5XQfM71b0AWEAHa31FkCr5S4bx
OprK7RB0wZAfsLSBuvQExuDx43YpHChUAN2PgTJn8bTXD0BxszHsDMX/IN1Gp46QDDuaDDnfjMxG
t+VZQeBIVAohAQHdQ1n/uRcm631HCHbAytWwjYY9huGEVFqJ7IicUjv3pAZ4GSieaUHnSaMSpq+B
L0RKVmWuKzgGQH0w6TWfh+ZX1Ip+vZHo/a4Ra63JTqivQVFCmxu8oxiW4P08LheAdCZHpRUp38SB
dJM/x+a/F7AvWTwTYtvMifwexyamyp1tfocRlXbIAThndV1GmIrBpLm1N2J55vxGoE8bQ8K0qZnF
0zPaNAWZr9tnEB5p6Vh07TJvfrj0vMszKeHNrONIqhL1vUfTtWGcwAlPqROTymmlGXev7rJxcLMV
614KRMU3d5yANOBpGtic0gM1tODzTZqrd/1pdhknoa9i4dy3BqqCo1lxkCg2gXfzK72/FkK1Gtpq
TpG5PNBLJAy63rDS3r5PMLQfrrMRpLT64kniroMD9VfaPgLO9XUhVmWgyErHGInNAmVtBDF+6EDz
8gQo1JX93rx8RaJtRBgXj8HTqvDX1IaqKXbTUhRWoLhdTb1r3KMkZDRGZ4FcW0GFQJ7tUYgu41u5
tFEnlBxZF2WTCpwjPoO1ob7FLJHON3Hz2CF7gRrTiZH+CN98xrfC3goOtvuohi4396c8sLHA8W3k
eCZQ3VRQGH120Ns/kAyBYA2Tduw8v+kLsP45f5xdHJtCqOkvwYJImapza5I8YWbvbG3OFgj3wjuY
q6Oq44h+/37Lqr8Q9rpc6NOjecbj+hJnoQcF4rzA/OkBtThEZzdmQwxyzUryPUxeKcaiSWR8gylz
G5uXSvZ/Pv1ej5wpm20raD6ULTsIKO7/M9pk/MW2rth/f6sYm/1xNBuzTj7hsI4ONY5UKrWaqFo5
EHYch/RCLDitWCwjXK7vecFm5QdaIDLdwgTQWbca7mWZwiQxFQXlmytIwJXLeXJOds92dSRaTsDG
/tTxueQzPma14WR4LB+1x4asSumnhs9kt2A2Up6KMxtsg4RD57NKH7HzAF7a+nJ/e52PCq5wQ1Po
CP1BFP7ZF4zxP5GoaQFZPmAci4AgxR7TG3gTQ++y07Ce3VqADHtkFiWUxY/U5dYB97GXAvUCZf+K
yWg5y8dhi98eeN60TmG74gApF/8YjHcnPok6N6WLKJikXnlGz4cbpsQ8FI/iRGcHVHkVjuXN5Uqv
50wi7wXaiZwTjQdXbTnUR38h80E5uvXLTJg/qn7X2aEnzT6NHD027Fe/uLOrAR//e1POMPoVq6aC
DRcoegHleSyqolA2UgpPl6IloCT1iUvKsrIRoevds8Ay0gFmiapgFBtI0iSYF1siA+wd4ACwbB0A
f6+e+lkQavUzOS1zZBViCRVih3mqJTAoVoq3MHNfb7dS+ZBxrLQk07H+rKgC4FkO1XwPsuPFAepg
EK8mmhzt9Ay1SV8/QyO6nmXt6KSboLd6wbhmEeDSVHd+eA1zrNwjPl89QqBXUaFa1AksfOwa2hN6
gv4lF/AzPPfZOGaX/VGvF2KYN/+8vJSR1aUqMUbN+lYZCX0+7UFJjGtJVsCsd0qODROiWzcXx4sH
xyCYr2s+z0OYQtB+oaMto/zqkaiA/mAvntkHVYfWvoqtxbPbd8OAdXwhdb4QlhhLsVKNjVGi5GhI
dwHfwJJl1HRmcJW7rJqiY2N8Yy6asU+xxdUmbtgrwUhg1c2hl4QtKb8utrthJc1nESIgPYVLcz6d
cOOtcHjPMBA2pGzV2wkuKE7AUutbt35OW49w7FJ17KAeaTaRHxKE1sUxpsYfJbVu3w67hGYrFrG6
xwC+6NoMkK0rY43/J0oLcQP/tHCKqHm74YjNf2oOuqsiVnzY237usFCqDDhrMoikOJMRW4eTHKSS
xa/3tmnlTno2CndP+W5wRrnzQuCIq6bXT9mbUFdxmi6jBbTn+vRz2NNYfR1muGX9qSB6j72unEZE
ktRK+Wj1vEJp+DoLhJRUHtXAONgkKUbWmpCmNNNOnggbIRqDHtxZQ8u7W+SwaBlZgnXLDH0eVlil
H7xkBs7V66bdaOxgDTavlHSla0CPgYK2SAvGexqZ7yZfUF2bPVq5HIsP68snD/M/Y5O0pamnbpeG
qCWsXJX+zdlquiUAjAR+z7Gy1FdAfyaCC7wElEjaY2VHIQpbhBZsuZpjZR5V+RHK60bfNb3j47dn
sP1xkac8/HF1Onz2uxn/VYtBT1T1PP2zZiFfFksTEBc9/7YE6Fa5OqjmbA7EMrBy3lizSoQcwa19
mgvhFmxcpqroEdVEWb+jcKHumb1cb9gVBAJGeVm+i66iasOr4N6mvA0mDmmTZiRvO33zef7PuyNA
vyMioNQFBFGOg//vZASZg+zDJP1iDObzx1rIYrGnT0LZ9qFD83Ch57xNp8/0ViswItK6YZb7Wk5d
YD1EDXHZAas4up+hGwBUBQpdfwuZy8yvjMPf5Kn+9XaYKPMjh9tA6N/5edqdWOMWD4Ijf4qFVvpF
//Xt3f/XYaehUoA+Kv3VjE8z5HVxVNxwRkpm6zKZwKTBzpRt5hH3SrwKHLK8GNRLpaELZzXFtB9y
w6liYdvi/Tilkw+elGnxD9gHO/tTHbA97duJU873Y0So+0gRVPZ7gKoVkSgM8NjBylqzXPD8maV8
v+mCunZvp8xaEY5o4JIn/d7STAXPWhj+NBXNOpFswRfuD8IYcFN4b9AuCsGAYmdv+wES/G0sMb5F
8Qz81LzP/XVMbRjmznYowolCVwIngv4ViJEXjVNH6A/3NucAoRybvn2KYeeZaXTi1NSEagUrI4EN
TNzwbGDqg3lZI2Q/h/ui1y1fT7GYCvEhgf2hRhSbAI9uGvuypfC8So7t5swZd30LHdye3ywix5ry
58zbp61FPAfEXaEXRxjB8VEeSXV5chqCS3+9w9/BzqK/wbA2u2GugPDSH8nmhKdGOJH3ElxHQUtn
a6b4Jbgk9nH2B9LibWHFI5nWnODjOM7KUkTvuK+1x+e02LCmwrEUCXuc/DGel0u0WijuJV/BY6eg
WLBr+8GIv4XLBe5b33VqTHDmoNguciL6YLvkAknp7892M+/5hdWqHvI3eKBUN+q3czuavNJyOubh
deMcRN7VlYfyat+edhZQfhQkp0C0Z+82nZDBo4sm7oSasKB6cjyNyXe11Prmr8HmIPPxJNuKLFm8
x01yi6vXthJkfLdwc5m8ED2OH4Cwh+4gNYUv94wKqXA6OqOk2lefQ6lGGeDW5pK5DP6puCLs/gPF
1GN7zfgkFLAhvDPpp+UGUUUXY2gitkYSDGPD/fSMA0O7KkWZc79r6wPcXyToH44X/9Jzdzs7nBMw
h/zeeRoD/UNuRL8YFAXjKOm2qaf5v2Gu8oeATPaJKDLQyCWIkCFhv5K8nWTRBopvZdDaDgJtfw+0
9L2Suu+3e+3JNlgHvOwmumM5YBfRxCjq38kwRiEwjEyzQZDWVEOKXClg68A5HpMVdPdf7slc/EZk
DMdWP/ad+BtjmZeur4wrm1WvWR9QpUys/dKJHE/o7PW6XPmWooQXghS7EsaFLrlLt4kq9pWTkQjq
sP4hYxCM1S6sk+2VvsES2WlXtWyrdN7u7ZXLyWvfH/Eh1fDuGipG5hQkQrJnL7WR4i9J9gtJhpA9
kygRxOn6AkPI/XjjK0SHRRPMIAzBrETP1hI8BMvfBpmBeF57EB+YHdWD9Yche31MvVtcT/IRY49f
d4rk0g+K8+tcCm0qmFEhUim5xaOhibidocrUHgtbIjCtNgTr8CQ/iGnj1kh0qOaRUBt6H8gDiACx
Kx2sQ3s01FI2SK58/o1stoJiVMEa9kR6RmWrF2+Za5dbQS5zifFjGhQtbb3waq08ty6hE4ALevv5
LwfN6Y+kcTTDfflWF9GiHyWb5nosxfG9BYuqt3MYaP7eY+pz4e3sl+h8O+OW0e60Bsvj6vYxVQ2U
yvBMovueBRbi4eEMm/e2a1ej2d1qchMx9x5af2or9djIwvrPw9hjyAjYgwfslJ12fhSJF5G4MmsF
rtJcIXSN6H86L1fqfrgrkWt+7qFkGQxBxKP5xd7ovIACWHf4c6atUYeEGxYOTwJ4xeigOiHmMbje
orGHOSO7jAOvarcGQzlEykkMhb/gozwtFpRPFauuUOKrtgZticotplg2CJSfMuspYDCFTPx2OHfF
dQ+s9Tvach5sL7Xbj4YqQ4BuvofpKxZ5DHVXTSG3kgTA/rWgXjMfYfBV99jgv+flb5VkEVtttufa
7+ZsLgnK3D2+LLA9FyURUKMZ5Kh+72F1b/LiWVEJ8F+3XqRQvB/NfOP5TJmYQl9rE6yHgdGgFxL8
pf9Pmo1eB+8S/6EJ7m8fzay5W9bfH1V1tmQ7KgA5yAx+iVLEgv4Bi03nzDqkLuXkT7rxUELB8Ybr
ZdGubeVPivG8pCkeh6nOncGcn6/40ttNe8xjnSZTiMlRMRMzsMkXDCxeuG6N2aYYBHnj25py07Yw
2E6YZSfeJX+bbWVoeioGkSbC7PTi2S3rmY4y4FzyCzeqGnTrcNP4777AMOhl2py7AbRe1SbMhchy
PEip64NOox2U/LPkIu5c7sWqKORZ+uosvx6gYpZ3V+oKUXL3EPmLrRCe78dQVuTAqhA/8qwYxka6
ymUExx7gRyNhDMYY+tHVLanekTym8OgLE0z3jOWA4KbV3FkEfGRvgOOzrXfT7qDg/14dI+lRX2RU
B+2RTbi4FDyA3hEpnXuYPWvzqphp1ckzFfP9cNgYxQoCW5uUsdATOySIQw8d6BzD5hBJTgdINOEw
LF6ehVcBWjnl1j2Ow6X+Ka0lRVUywo7JNIY9w9UAvKYL1M1hr0CrwixYSoKfJ6fiafbrYrIZJZpY
wXTw+SrlvdvIuPAI+yvXDKtXxjGL8l5w/jzt1b78PcMKD5gGK1N/qrE2++2svgatOuJJx2hhi36w
Rv/j7cyD72Nd0gF/IFjYOKY7OXLbqUKYS0FA0cnGxnxKMFyIJdxU6OgT9r/qi4tQAj79QUp85/uY
ufM708+pJ9iOTBGuPKMORy+8piy6YmmIc53/qwGGGNKVs8x1ukIdIWWhgQu/2+1PkNPqGSn+eoFW
O5H4n5gatd0E98ELp1ydOec2tVQw6EHEIFyMe5ZAtaxMbZhabOFBuz12w9SNxeAVp/T5BSWMHZsO
thLmWlGXz9CMEkATAxzP8BQ9ig4X3QvWAfOc85su0OlP7jwub1+bqqzbpYKdQcUPrzTluReOcg+l
qEngkLdXxQSksItO14KrCHOc8h2oj0dClgvlE7+StFKafFNPCsFOtAiFRbbbiqVsUwmKUkbfc0zh
Hq6/KCIvulC5MJStEkSXRTe/Um20YLy+FQ4L0xpUmXsK0m5FOZkC/yRLNY7MtSd45z43QNb/JMvb
Pr3PsLKm5qzdBuoYSozKG4rte4IqKH0eVDyD2TwO1xHAbd46O3YsW86a+OECxmQvPnOHVgSQEc7I
ofgf84YmzIWLf6VgpVxEOYg6pAN371Xf/nAUSy0w6JtGxgP7voakkksHS84q6cmKfmeMk/Kdx5xj
n124VuL5N7IqfxMzkfqkPx7Uo1LvYlXA7VwVe3XcQ9J6lowsv+rRpi6IqOq6QKhwWF0zB+4JtUCV
hyKpYazzBK84QnDGPGDCfphLYcHuARIZY4FPnum79XNy0Se1xA49yi4HEVWv0JX3ySpovDOOfSdR
F8Z4AVw1eS4NnyuW3E4tgZAmwlyI7bckfhUitBhgf6C96ZIyrYNlIkutHJYryGEFCUWsSDWhiKHu
1yXr8aILakoqbCDvu+y+oWlKZbDOQqCcB6MatzVyPGCe3bb/cSlF2sB/QmhCtfwvx07GxJh/7wmO
uW91yXNa8JbHeOv+RYEZ+fEPSEV+wOHZEBTYeJk13P4nCVkK2yKKldt4c9If36cPS11/Z1frd7Zd
dUos8tG0x8ROn2xSjC/SQcU78hKlZvstz5LbggbWJGJlc3c3GpiV4Hk8ay1gfATt2YCLR6a5JVSz
nOjeCVE8EQgsF3EwpIL+OCMI5GsQlymro/PUWABzmTN4ywIZsRpqVb2MWBGoUU5w4cHMnekbKV/R
ZBFPM0Ga6vB+TDkgHRkPwgulVxu1y4l+W5Jf5FreUCVrYLgwGmU2gjB4TPYDcPugrt4HCmWNWKmu
YF/GPs39tK7CsHHHU088J7YtuFcoBXg5fjc9C3Q4ayuG6dTV+TJqCDlxTLnCDM1PQJs6Wz4jI1up
UwnovGOMQ11tlSmRGwrTE8lZyS6BHatAeW1mb3vseXG3MbvchizODLcskOHB2eFzVdXGkcfeBaQ0
BWXmKmhiQjN5x0FsyS4IvFw9qFbBONVxujITMG3jHr1d3XsTTUscPCd5fdYbfFdsE55QIzwsv19Q
O0eX3+MNe+F81zKpYym92pgO80kHLSa7Bi0xiqBNxzOmbJGlIy4VTSIMcUjIPqviPOY2Y9oV8OrW
8TyhOQ/jJ6Ks5lmKxiOWm8MaEudYffWkudzphEi86Rj73hpVmjU5W6yx4i0+KwUC35YcMis/U0p0
gUyXaldxkMIIvnZWJJNV1JHbWI/CaQqtgoOe3fEq52Pnihx5Efw7IUlWE8Oz4vNauNX/0mb3Trqj
+fCYNji+mGOaUdkecJTT6vBUP8jzcm7XY3nqOOwURyE1QydN8uIE12UP7o//CtyWVrI/KUNOpAvc
l2oJ/gtLYIAsBxo6mT+LaQjpH7E4TgrnR9DGT+Gzqb6KaQathmiRk21Pv0zQqxCMh3vJVMnlkM5Q
hCh6bi/lppoHGC5T32hP5sWHw53bR0pRxDyxeTyERIDM+CEywK9jmxvOGZwXaa3z3SiT+pDH8PND
gmJsIfoyFf+OaF0cYLJqmDh6qDhPZGFBHrDtO6vA0O2ZzJ7TeX5UiDVInO43q7DsFesDmqR+w5KA
gcPnel/asLXfPeWgM0XRc27aB340EYwQCtm9LC4rrqoiWaVnxIodTcFHbdrK3V/CEpzQLucz3R/J
8lJUuPztH9Ce7RMXsABb3EKdxTKGP51EIAlqvUOulDZ8f8pHaeAPR8yvqaWYpCxSY8R5e30fO34I
y96gmBIoTyVo6SG9htXIQL7Vp2NqYpEztpDSQqSiTIM1QkuR0m5ipI6OWo48FEzfSbDguAnf2+8Q
ouTua6k4dhgmlcrFpTFNjwxqOUCiAHzFKciijVUbYi6udRDZ9SOoulC5G9QXee9Z6h4zhEjmOH0D
d4POvB4/PnQlj2AbbEgHpTPv6hhH1ql4VLOPBbYoY+aVPV1UBVZ1AhHKDKe8nb6DmYMpR+tIw3uI
WJrVQQdEnJV06eCDs5NiQZJ1/eHLNEU2i0+R1AaLIebaEy9ylSKqR1Ewkf4c+gr5egCR3P7cDyIh
4GPhlQFZFtN84fWgHYY4f93o6YM3zdrR+5mhHw//mAaHDEeK7A4yivNgRD3u/4iozGGBUDBAGsp3
J1uvd6/sq3TM4QwK3c+Wun5nkyioYUCen397eTJVm6Fxt5W0TIFJhmczeCytvrhWBX1hRW7AhsEo
PjmAIe0zrK4Qm5HaAjfm+xWE4NfB8u3wuNXALbGRABecmQtP7m3dqh/C8oNODi0JYzl+eK9Qnqzy
mQEos+hC6J+RRpcafFIavvZXN6RfDomDO3JKG1blf8iIwtlGbCw1nOBxcC8ME0Qu6nEkNkTCipTd
4LtPTSy+t/9kUDnwVXMMXY4MyBdchK/6QEUfDrc1D0AfVqYBgBaAVEVT+fYFhp8TXSn8Pe02vMGE
KSuJ09rkkyChU9FOJeztUQqJdpwtBqQXCCaeUBV7VHayQOb/88G63sGUE7wMlSUa8iIYDn7dq4Lv
r4teLoTMmT+fgnOQWRtfDdMSWw2+u012qzWq9rUB6pf5QrQ8XKtfoAYjL+FFyXdXzb4c22PYZjkU
KJShImwYvbQrVUOmzKQXzFB6y12MtQR1MIbDMhaaABPHrKu2Oe9fISnLwtVaN0qAhZGHQTdnVoK+
lQVpqLYP+Rlrh+qss0iAAqtoHUQ625d5ByhWR8KNgOdr7vhY+PswUQO/ECTbZZTNWIvgJFTYwWof
zzTobnl96jlPfaL8JoPmSxi48rYHaVaoYXLJHxYFNlmFhEP0nB7kXa4ZeYn4d1DfFzCWp4G7w2Ra
Uh+dB7EC65vDEGbsbQv2SWivHxwydtJnxit2ERDoVJ+CmR7R/mZdceEfmsQ+VPq24yjvbU6kRE9/
8ayP3Z4fOE55hoDf8fsLJZNT+g2bztddltIccSN/9X8MLladCNkgtbrvNsmLyBX4lOQEYAePmgfv
sSln/IluHrIZx2ebL+0Ni0sU3JZ+LnOHCtZmOj6i3sDeajZ0CCBSORaDJ+sOZOoO/hdy1QkoIUlg
pUqdd5n6y92WpfFbzqwvrBmExgxuT20uSk8hP58/pSt67gETA6/NoTPFN39p/UnEn0gHs9MEok5p
XZ2bTJ9p22Lvz4Cfo9AdKVeG7LoBpSmQy7tA5qlgpLRWCEmdlN8QCT/YHbRzUb9AgdJfTsbYw4zd
evgw7dVa3YMO3vGT5E7rsVQsKUB73S0bAcRJHhr6NRGsGIQ157+Oqq/rz9em0VXx0vlu9l+FauSx
vOJ/NFQWMm1InNjE4sE67QpGtBE+Sg41C8ialEJlr3JMcZT3lhkUMzHYQtBHh9T6nSEuw2F0Z1l6
sy/Lb7yCh/lm+MDFJQsyC3/mVM1eWgg47QrCOieYOGthltwNiynQ/P9M/pK2iO27rxEO8O7OvtdG
u8NFTDZSGDINiiFbUQ+UR1pp7INcd9RrZM5vMJ8ZfGYnN4bzTja2emcXlRhpDIYtPUBqZVMJlRjx
QJJsQiq9I0QJtdqlPGzefv5o8O5mXPa6CgV2M9+EpALFjL9stPwaYjVsZAuxDUL2hKpcc5+1Wz9B
O2HJ34YhRtdm/GcuRhwlLR+fPEw8omEwrYPbc9PtqLR9PffBCdEfaDYGb1HtE496V+9Ig/REq1TN
beOsMQLo5ZrIMvhtg/H/gVJ2QA+G2xASZOfWGZ2CWOzZAT70KhVFGWXPC9A9X+7/QJxUkHo4zTDu
K6T0jQcUxcAJu7ZzrCUSc3No/Ok5ochDNnUweoQLZMVfxz4oTd+lByKXI2DmYObfx6d/JCOBqLCV
tM0Ym9Dbg2/F8BoQGFOdvMmzPx1SPyK5eb5FrmP0AOshrPXY24of0wxQXE3rDZ1+85aSAzkEyGRm
tNx6uGZD2RNB/DfVVfj2u+VUn76QhVo6oZn9Z/Y71+jWKzdlNKk/VwEbHBf/9A42YJUv6Jd8Vo5i
j10+YIOcWjXgQXz6PB5YXnJrdUF4+Xg6pBv4Tqu3lduV9MaalTfomjw8Zue3NmDfR7ZY/VTCH2op
AU+67h98lkzjzZ/D6EUnpbGJbKCT/TUH7GmoMDWOozQPUlf3b5fcCKl+6/oVYjGEHLn5wGSLIJqu
tucOFYaT53zZyqAK+i3s63iISlWimAYj27RwAsGcmGD//pJ9Qky77BMiNDMOacWvtQFt/vh8Hk+L
kYNvadrzH1dyMluOhY1lHWpfOM/y7hZ4CxP1QREc45rZxuOaugy+ZCShIvAhq1isELuR1JtIy1z8
Wdk+G4DZw82UGvgX6/wucRv+N5mKprqEFjDtbwpDayUNZBGYOvQ2io8sBT88BLBvdiLWn9bit0I5
+nXpx8qQEe20TdE35/Tn/Rj8cWJAi43/FtdYUryQ1e7cdO9DtQ0+4iVc5tHU1fXG3Q6KpOQeMqXC
6WwZt7cdepsrJfTkh741MPDGOKHKFw1UEKs68zzsn77aV4w1AW5MATSUPajpmGp3FAkItqHwfUZ/
jf7uK4BaoAGvM+Zl8OSKIZ+7mcnSsNx9MOfQFfSq1VU/iA2NQipo8VBTGmpYAPg8Oz/ECCjR7nnk
ybC0xx7FRIjmUeKCYXqvLIsYdqKiUkt0x8H/3tu9z4b4WesVy/r1k6D68+XiWZo6ifyhDjhWoS1j
BjTbLcaokG5Ixc2EqF8r2iVCPTDp2fEL6BJfiI1fSy8Sue+LkwhH+jotV+2uOY3yBz5rZKObeX3K
/INSWZsRSYr147pleVCZUkDetwXOmxruALqQc+xxGqYZ9ks7XZzs4lkPWEdnm88ww1wzF6K9g3OF
AonilM9QPhF8GaMJuBaF1p4ULpmb2h2CFTAfm+HGou1tgx6QVgnoKmnh/BVzvwiDF8JxPbRMuE4b
E/7CYSeL+ZIJwPo16sSQ9D4aG/6W1s/LEh/tkbzv5ADxJJac96VrtNmsW/xAO84ZJdK26dtg12EO
yR0cbiZL3ERZYwxdQeSn3nI05+ySA4CO7x05Dk6sqjB1KwGQKUkfjcQhAojz9cKmRVN3+mTyYFOy
Zwaln3OB039+cw/oTise7rVXfOnC2bTYo6SbKqRkNXL+zg03HLV0u/qZQnA4fYEYPnmz8r3XeGr+
LR120Nl4FctAbscgk9CzQPRvRlE7N7EoiMb6LSyBN9nwPmVG/yMimGOWn/0bQaRNFE2Tvzyh8zmH
PrumK/IsxENfQC7VdGdyu7hsbGQMho8c8nUKlH/QwWJyuqPk3OtZxo0LTd44OSVd7IiyPSrzix2i
euxUSqO55TVGE5Nltp84uwfLmKeNH/9EPeV051i7wK2VGwmoMbWiRgnKMv+GS787wD/lckNNTiVH
zPphtzrPIJhUVOdiUGO2y3Ankcb1NN140edA+SdOJ7bECWXfRh6JMYBhctHX7EnvWnIyGDFHgC6h
PKQfoNB/QKX+OcyAbaRYjLH7ugiPxRK1je4qKkIvzwzaM290LQOWNom+ieZCFxEDKgub7V8loD13
3+47TY0n0B8g8Loh740Dl3t6tzQuo2ePAMklkw1vlrYsrI4Ep7soQE6Z+w83OC7gfu5diGzRWWs5
cUQpfqUyUjuMtbrpnfZShYdOP5N7dR62G+vPj8pJVKRTxGJ8piV8sf4tIA7ptgURCk/urdyuwrg1
WhKCJFC/6x5eeeUr9i41oHyJ64zmZw/fH+TrXHwwo4IukgfBoFvRaD30fL5IFJrEiGG4OZN7bY9s
3U3dFgQGSYEHlofA0BIFm8EVNwvHwRgv1rVt6+NhcxvtbrIGSuNX3NqK0vL84x8e4XT7SjClZcMC
KVWaht1n63xTg2eQzPkdulm8ASNgvX+zoiGTdBmB99b4Qb+EvwOdvKvwlawSRJVuHcWTUDdPgsGw
6HT5s6jaZhQmVzD9DUvWlz27N5fhHPF0p8EA1B4KRJyaAGxs53TWeIkgKCXu733gXCZP3iZgq6UH
jwa0ouRA+1hsn/2Y6U/L/LMWRY5zd20rYc/xhBIiSbxt8rQEOdOHw6D+a/sqzuA4mTjxz3NNf5Yu
N2spzzM0rhXIeU2Xxb8IV8FhnRj0R2yBgpe3v2nszUfGrV82qgyvLv2DRv9bWRhF0jiOX5k4Vkr5
vPhVVl62Tg08ezUzeUF2Yu8d9DJXBqIVsO/lSbb+7k84w4AJj/HEGTzrko26/a4Cv4+iLYVuurR6
l6vFId5ipsz1q5lZcqLRI+H+1ZQC5V52RhbSnU1tLkQS3WT7cGHRYRo9tA+ig9geJzJzirTATxY6
USnEjfQ2cgG5WpWPXhBopborQ/w0hwO0dEWt3JVXTNCsRlUQHvtIHaxNNQ7Q5IbhG/6RVoDiCKCZ
v1gYDCvlYurbRbhrAEiLcnIQSL8aPjuaM4NA17v1o0bBo6ubMJLgYoM7qCbgosvD7Ml5hBJAqO9A
IG+3OrIIBgUf5JoZau3zT+hUO9bDXmEC5nvgB97+Tz/2T1ntoiecBaiZwxuwCbXXsDnkn991URJc
M0WujxTWzNA30FbbFBtlWbowelhRKB4RvrsXs6PXbFaehYp+1JjcnHs3VeN/CjK923QWJYaaeXo3
kq2Gj3HHAv78kpg7BbLuchLJ+O9aL8h8V9XhR/9IT+WYaMcbz0PIgpdhFacE7mdqemov4EUMl4zR
gBWYUYqrocSGY9MvjbEIeZHZH2QdTsJeUK6YMtcqIYqeJMi7YPXfPlyKlmgYQlz1Mi44awqaZE4h
0q6uYslj/GdgahmbbJmd4fiO8zygW5eF4fcGdjVwUDLSP8S0rlBXiGNWuBFN3YjXbgKqKjhlV6tu
/+S9gr+LHXQdwt0R+wY85WqpBKEDprxSQBFga+27sVE1a7/c233XpUKZmh9+OFHRkppzaPKzI6sm
6VOnY/RVmvaAjzCnwqx8XA3LdAyb4gKWZuXzoJx6/QYAEAMskPv7iGalZuXouUklhsUTx2XpVB6U
z/LWd4gvVA0AVHrevRF12YRW8FYRXlGpNJtDE2B1Hi/7mqaf8LVU90rn9hSAc2YXYHjUNkzd8WVm
MmDqrmgtQH1StvLd5e0Vz/UOAgvNY//409SR+/828UVZIP00cuFF7gpGjFZh6aEymEjGZkDwbSMf
7bP2kyU7a5fq4zqFfb7nQFVI7Wn0Wvqo61z4Y1afzwXRXlrJ902GYbdNW5mQoOcLJFT2PEHPgkWy
PgNsBwCI0UHgma+oTlKVF8Bk5Ea7zBe0Yhv9AK4RGpKWu5J34szl5HtE7by+P2z5yWy1b+oQ0VJo
Iot3ZXrB8xyASub0VVRu/kbTIsIhFfX3jGCG3cVkFlymSjvn3cBhSMo5GBK/epQ2xhNUAe+xomxj
h6kImYC0KdNitARz54+HDc/WbtkSmtLqxk6B4lpg7QQp6P1JN6s83+2qjnGLiZ9nShU58DB8yHml
o6iz/l6tbvmqBR4MkUaCGlkDu8zhF0dHlwHd9wfiRPPHhZ93WR0nvL4659BRgmMrvfwMNDwcf712
L61SE0g1K9ObzD1+7SDwhfLmFlkBh8vYue8VJwHSJmk6xPRDnCzwAtaOffIQLRZuYIh+FdREzgDM
4jPzWu3wNYcAg5zm4JgPOI3n+5woQZyzSxKKDzo37GpLpBkabDidePgHwNTTSM3dILiWiNlf6H8U
Ibvj0s2OEVo9JUlxMwPEH8RgKfcy0G8TAXQvjXZ4p4QFncijJtaFxg6/AvtDssre9IFNcIG2o8TM
KLXd2YWoEk4v+0Idu6g36Km/7D7OilMs8309SuwpbIVOxTOWPgQ+F8ACBuzmyWGxXlJ08YiL4Xjh
/+pm0VbXzcFN1O36f1XbvL/CeaQT7vSflaRYLqc+B80L8o9Wp4bj+Q1Tg6J9MhtMMC/ErlMaGhcj
Civm/oJybX2Tk+twDEa7FPXNcztehWsghof8k48S0a6FWclHxhYfRIUittYvFKTQCqW8XTj9joOE
Hsxs0+w0xHUd0i6YXH7OX7JtDK6t+REAMUXI2ZJ7bvSh6+MU6+Wyz4wv04u+XhpJ6leq+0ErJC03
o7cK5g4Wk34OPG50WGlAXr6QorjukvfFlq/1ATiQe0Z22h3YP0qDVE5tAzNHSTgZFfLZIQK2KXWG
23bPCU+Lx/rp4xObRmiq7qGVbSn7r9yMsOBkKyqK5/CB3pkIKCZrtrVcz9soaxKMYbAZhJqMKxMV
V/eBHi7XGpJdxbARHBlCdiHUC2XaSyZZln66QkVlrNjh7SvdvGxgciIeq/nOUuuTEGp1k/ic15qt
z4WtLKI7R02svdUwMPgX2/eLrukI/NmNts+VSOhegExo2C97tAy8CGoJHx2AC0Z3uaLH0ZDjspXh
z/WjFdd8MbRU/EGYhenJ09sagJ5+MMZPvN7ZNCiYuXiULxk8pC8rKM66AOegdEBl/3gEBiCdwWVV
dLigqIB3riNDKKGvzY10gpBEn42INcqYwE4yrq03iAFN9uQdU1eLRG8zWGpo/g2fwc72KlwzNMTb
nzFBWVYjred/SEyEdcvizc1G5SfMw+kdWbhL7rZ637Z1+nJ93GUqVPL9v3WSgVGjuQfxuSuli0+Y
Z+B7K02bYn1K34JoAuk/uuWmpS1TBYINEZRDj6WfRsHRwNOi6jzugWOojnAB/5m/s3kuP9JsaOgl
1RhMI4HgkV6OtkGyqXVWR6v/A9h1lg2nZXcm597qSuAtP/sKL2H/HvJeH0ymNNPmqJOIfcYqeMMF
mGTW2Jq5TZycZ8e5doN1CD8PEKZiQjMC/eT/VAbdgEFG9TgmCGdupbovFhLohBDZsuZuegw8YVw/
Oi+kWOrKMiiVAUku+1uA1YOm576FPb/oduSOzwJhT9I+i6HN59EVzkHTyxw1SbcmKxgU55FBbqbf
CpgADBcpmvTNl9+6J/6T10eMjnn0vfhWw5qzmEJQqGT7BYwK1q+7aigTKN2rERZEfmRkR1KZyoX/
ITPBhg+cTUKF5aGAxldJn+xPizs0mdYjdJz6GTuysLSQomt7S89qd1c8EqAAXGedbOoAGr3wDsbJ
mnMtvwEgASiMhypsOFiO2b6Wa6u34V1ImKGFSfP5zfmEWmZOTf2Lx2qlfvSAxTxrG7liChTbIw+M
7Ldcq+9M9wBs1f37Ovk9xprwoPq+uKu0rsRplF2YYPJ9V8i56fYKsRK37mApp2LiQE9IvBr2YRt1
JEddDTbhFyK7ddD+pW1kgEC5RhGDom7iPv/3MAAADEKzojurSTwyFFRc1kzQMsEhvx8s5I7UftPv
jmcpckKJNI86B7tKuDC80yP7zMIbyul3ISX8+nXFbqMcxQlyUpv63tk72XHXUNf1Rh7JpAXKkIHY
JB54285Yz8FU427Uq5XKNQcdwxg86ClaEdkN2i7PjZjWNgm+2gk+JbTSblgmJghrUmm+voDm9B7d
WTOzm8yJQ902qlodtMMM/Dds6O/tVvBRs8r6PZAH6h76IkWpptPe2aWECEWYDjW4AVsyi9CNymFq
vwrKjilloEhXTf31XrLzI47+omR2HWNbc5RK5+KVok7uS3xBVN+I71ypYrmlSUYj2MRGKl8Wpphc
WJtM8i3ynnuVfiPT1iB2OC5+G2HWzNPBpwaMNHmTSvtiMhwEYzCj33uwk9fXe6rO2d2HY1c716BT
Jnv2fdzaAK6pUYxvhDrK16h3NW6m2CGFkhUoWuAfJFr/ZAWqWqvlBOgsawGhOjr4ZSuSyI2FNhGu
f2jqA7wGxOi6eka7lbJ8CmpXi8Xy0Z+Xg+dwULK5dXasfzzUFVTKi2r1Nj7ilnas2qjEO2rSpauF
GFeyl9QwvI2/qmuLBKL3B/2DqW+3LoqVjVixl7ppyGecPbxh36J8IQADgn7RocrhY9IpCXoUdTqd
tRtwtZzs++Y2x/588W7betdFriRXcMcISR45FdseBS+k9lYF1dFlkOauwe+2VwVzaCMrUdSu7nNp
rA9SzdPqVvjIUIZvxIANZUi/z2VmqFOmqIuCLGXkQCkKyNXyFtlij9LjTeU0O7D4gakddM1XkBid
db2v3Dii0hfe0vt/zZpUS621L4uU62y9sFtpIApvmSAVrAJLFY29e9+ehWxK1z/YJj8NzzVpx0yl
QuiXOZkhoy+csXCYKmXibaTeKJoEoVj5JJqZc4QS9RhcZ/YQ0thW5nOXm032O+8ned0c0iq5RitN
Bn5vrLJbVc9PxeJp4qMXSYr5LA5cA+FLLJRVEGP0FILHyafzcTtert6hMupbsI6S3HbbX0LiD0qs
QZVrgcw25bRFVcVvfEbjKS0YpgCSMo88X+Fw1V6rhqAIpWnxxe4rJifKfqnVfHZnLP/yCnNRB/RA
g0EMoBTP8MK2/hXUQLu68UyrsgeHiIGgoDS7paGsvbaWm7JLc9pRlEG8S8+muQjSMnN9msgthAZI
f9Jkb8mcO5Onn+nFyaRhFx5l/7Wiijqggr4lslun9dc/0fkuJul11xw9zf0gCogdktTMYc/VIN3u
3GItuZBrjw7Wyyfi8AMTlMkcpPs76pSm9hRBxs+XqPUcz/1xRfGz2lVPWmZdvZzCD+5xtUhRIBVQ
TNGijRpjADGzadWjJOUCUt4l5qlX+j2Bx9jqZ70/cQJkAwvTq1NxF5bLc00NtvVh+aamyGkuQGeE
9TrsFLr4P1KXLtPDe+oJlUFOdUCkTsf71KHhSeWrk2TlB8w64VOMfchjAlgbBmT5RDs0KuGTVxpP
gJteZwSR5kswAiLRRJlWDW/EJmJpOiTYzGRzsNvsXA7VP8jZU4fYXNHcYxyLU4Bt9ezoFu2rsJVQ
xMjqH8vC09vLUkaiuFPDUxk4jwL/DIHcWux1gHL8wONGHttCUB72wqkUiM8+YyUZh9evizlyaVH2
IhwR/merDmN/4qcdX62f59chngxgj9RQ3V/EeMn+Uw+BQwsBGzbwNcY35XAu7rTCCHkqh1xU2rXC
x9SFi7BcBmENbXqlNyMJ1wj8MkkiIpPFuXYuI//KX1p2XKGEavHIESuCHVjNPxEmwiEWC7LAoAR3
AC5UYDC2JgPdsIJR9MJE5mdLUa92C4rJApQY4tDIcoI3As4E6aBp337Q9O8wxwrJ4+P/xx3Db6Ma
Ewkdwmn5hBJBTWghxDmFlTVmYeCzAmLkYyHK//387vYW39FOEsTK230Y3wT6fOPCV9B+ZNS8awvL
n/gIBxZemxrhdFV5K8mHzYGd6a9r0ISuGHgkB4MEhN1yhhv8hKwkgyVm8SZ+O4AtJpgoYH61lipa
qbMdRX+kjZ7UOBZdPHa/RPhxqhQvuzNBcQuWZJBEkwLmeWNvKOzDnx4M5IG3Chklv6r33Jfld7iH
m1dVg9cg10w5TYsPTxT/BqcKlqPgqLH+UqpcE/y8B2STICWEd06TSjvSMdFi3m8JxVMH31ZWnP3U
XDGZymC1EB3/SCJYmBKwPoal2mvWP5wDUk9LIcRRloTfG99uJBoojlUcxVNy/Fckzx17Kqggoi6m
Mssa8NBuuiRgkC3QASPW1eiA8PCPdrso6ocfIIY3OUMcHb1wazr9A2MW09RXeN0J6UKbAauCqmpD
+RH+f8udWPf7vfg4Pplm3Dk+EsNM1LJY8BmGy9LWMMF+ZTjeOeuw+RXM7/sL/MvaBGebro0txu+t
J1URyQN+hMPhxR4vh6Ie5mFEMgh++b71E4sCdiLh6UMCfg8apX7upnSY5Tz7djLoJTlViSFVoAIG
3H9bHr/7RtsxY8kOdjtrpZ7nHX///ILMdE/8SKp7k7XB87Ib6u3fX9Yy70S9P83Z1ENlwzm1+lWI
ZXqu4wSndgvVOjpP6Qk0oUtrj236j3dmyJ7P2OfRoXmrJm4wq71ln+FRp+Ycdfq8zjJPrSCKQcw5
RUgEyNdTZGYhSeotuJz2x3iYrqo0ikBKJ73+oLBVM2cADcfE5bNATBeeCKKYMj6/ie2qg2aWXvIj
GQaQG7DWNziIrhkbZ2qR9zN4/WZzGDC2qxrR4TFlWnVj5ODQ0xVnroj6cgW9s6W1rcGChpafXyrc
orBPF8D7RHaCxlNgBbNz+nhUdfIesDXENk/lSO6hepplCeKXUllXiMQBPidpJTcxAtJ0EkelqpVe
yHFH7fi+ZcgSgMEHHSrWFbDfXCxYO8L5V8a3D7To8UAwO3ZDdQnQDrH+icRTqesazJ6WG6I43nCk
yQNHkiOYL4fLEHE86xtpq9Kf6Hpm/Qjf2SVj0IV5KoqmvyUC85Yi5V/nJglbgT+GS9n9g3cX5Utk
zij9jZq91gno+xswGCUvmGI4nppQxIkWiU7wP3XqSU2rv7Evc4vE5P9bPVbDerqoBdCu1BrBZgrI
OZmPNAKIq7s6/9FH2lY4XPRqkjuSibuiMgO+qwQHpZ+jWMvG1+TGUjmSEdBS8gGlWy+fFn1Lj6cP
wxpImsAjl6h8iOpo9slDnY2+4h/pUNJdYJx907B8tSKalp6Vkqn9FZE46dTrxRFRF33M7JcOMe3+
Y3VGl27UR4bFhgO25J99E9LL9f20+2Vq2UXnHNNeHhjrcpbMz3+wB64BbzJ/OEnM/h+GxI2nQVND
YvBDzAmI2p7hHNAtvzh4kGAjd0EEXhK32qmeFxuaoNkYr8eqhPccDW66llnk6JZpeyRPYGn/Wdwq
R3OAHj8TizA4pyffWreZrXm9n1UYAXOIzgnH6TPHxkpFQl2me9PZaX0WP8gUNSUvJvsAYdBwEpzP
FAJMfo46gC/CU+wRr0z7t+D0J9yplRcUhvahT6iNXuFP5upbe6RfCp1VDXG9hRVN0NECfXBLlIbP
DevpMAQedMQkH4v8KbbjP4ovwRWR8cfbA8BPe7bGX2tlkBjBQVvW9Da+UdpqKEQY+OTj0m0zpr56
t7IDnBedHwMDDIJSRqI/VdMrmto/7IDSCbyPOgNjEUVNyzChMFN2dfNTwS8i51L0TLMPuKQVh4Bo
0YDnrkZUOMZaHKlVciK7a82mmxHu85X2EmxQxLMnAeJVUrdeLztQwjoBadWrkoo4eYmA8+osVedL
A8sBnW/eTPCHCM56U18Y7UfXIGFDYs7l5I9IVFpj+hAESE2Css8IKHp/pCpcbLesgCtrtiOabP4X
JdfoJ0FfDeRKKVLCiNJvwVocn1wCrenG6LiaOUTuoGsoeRNgyOgJWB7r6KG3cwnXCSFGnt6C8QVe
lb2Eem6tumeC5X+UVLC6syHHTtKUvF7r+YWWFDkgoFbX9IHINTX8usY4yYzljghvLSAuIqfnKQDI
HMZWVoNBzEUafAaK1t0HncV9BMvwjZKboynVX3gBR4+QmpZT+gElCSwOyoA3vp3S3R/grmy9ZTIz
Oz/2T7LdFUIEmFmSId7U6UJIEdr1WSU4WFWuLg3do5EMlXXm7LDktpkz/EkFUwsW4Wk9DUQYHozd
G15ejPUxrXLf42ZiiJJP81OnEvQ4XFvpkXjvsTog6Ny2l+glha+aVnZmGOejb0qyXtBUwRv/RGsk
TvA7cOvbMSczRekYCEpaG04K7/EKPkwtOdPRTyaoRuw7/cQBePyBOlHWnOo1YtXGyuq7jA4002lR
P7qQDVSafwLefkRFnGJ9AeU/PI7Z2e+KwRJFA620E0MnuUoTViSngnFC4+ITbPwNa/opbPnZMuye
vik4IjNj+9WcDqXxL8eWyKmfSs6Amc1msH4oizluW/Gd9sp/oiN/p7ykl/wpJDk7q1mGF4hHJJ6T
I4s6jC1uCvVYkwE+pl1nmwuZDivXklSe+ofRpVUKarush+yFiXivNR8+z/LOtJkC+1217rU56ZNN
wx2jR4fdiUyxL6KTrM2CVO9MH+egj7uz7Z6+EiqQ4YseM/Z2CWscrJ23riTTr8mu0A7UCYF+yG1H
cBHihTvaeLWrvjVVY23PRct4fJExnjUrzqoMQ1/DPC8UFn/gBZhSJ6HBC+VOuEZOo7rUm911U4o4
s+dbsG2pmW4vaVvOOl6CNOPemmGmYBT64n7GEOHkkT7AUEbVf4QXzqmeeB+A+yUFNv7wJFcwlLFY
1eKl3O0vGJu08x3EqrVdcjicexw+KuTbHgTOiGkWTd60nwg3iGtCHrgFQKqL/ZdBXlPUgsF6FMCp
donX2XPUTRHdeST6YiOB2irjr4Q+OphahlLVRt9kf5Wd/oTX2INmRuoASQN1jykGEx99toQtOWzt
SSURsWGEkYVno0R7B/1CfxG3qwwNp8BrCCPrPgp/tecetn8qTnp83VFRcWwmxIl67vuzYo3GOU74
3xL39x1Lk043LQ/qaVrlWj6O4DRLWqzriskiaVPz+y5lMs/Gn3D+Sp8q4a3JU+TdPNbe8rcCHsI3
+2ylwWo3f+ixYVMKJnsGwrj8YuAXy7zwyWk5RSbjOeLeEW0FPzCwatZrHFP47lLaKpVRBIOeQyXx
snL9m98bjqbAaYUFMZelWglxCmTpUjl5+BtV6b0DShGjMr2hEvm9G49VKonOFd/dCecqYvtSdfEC
n/zV8fTMPbFNjexTrgAUPuFFLH4u2zqtRTp54zkWwxqltZVknSnoChtBNZqF8Pib4wMR5kubvn/h
IMJcgtHAY8o1Lq2g7kJfce3mgh/cjJYPIvL39x88g2crnx9HwDkyX5zdMsd2zy4AHwSvtiGtBpCX
XczbtWA+gLs0LvY9rpEaPME//MV9wwZMM7Ga40Q5casjcBGE8iGIVB92XjoPcxjCbYS05i0Vq2+D
ktu7rK1suNvrhhDZl8rXLS/8engnklG83uTKQ1G0VXvt6nZMPmxAJg1dvE8atDJ2DuGf4Rh5M9oT
4mqawjsavdsDRI567TeuOnrDoA4jsGgGtvE1Q4ATNLto2b3z6sJ2XlLC6c2CV1wxdDmw1uVqaN5S
OQLfVQKfVpkdLCKwTM+nvEHHjEy3qiIlwSv10kckrM0klwBzDF3FHxod/w6ESAXxxsza/K1hmEk4
qdrBuQztpuZcVKeCsPrGlacyCVwP+pSXCrf6QgBfHqeAIpt6qwx+S6nTSLwj1BZpT6lwLZDzz3VO
6qsujg5wB+bKBcgnwSEBjN4MxPDizx/YHIbqlqmVMGhdFR3oI53WLLy51qIHREDo7OoAt23PnW+d
HZwamEqnHS/QFeeQltG3MO7BslmQ4el+yy+Z0PAB49Mf2lcqXG+ikhOYZbUYpxx5RwQlMKrgyULt
Yr/ft1/5ko5rnoEAH7jgpAg78HmnFE5hJ+eJ9g5h0E1gtMcdo17JHcAy196ZfuK0z6FfOZ6FadV/
Gw9YaXmNdp4FVOeSMewOuveQcjDqqmieuSP9MNSoQ7IU+Aq+uAs6lx+3KQR52gfzszyaPplS+z3Z
LonWbpPyoYmTZAWExUra7w5hxHnPbeVEs6ugpJFEJEWDMiNN+5Bion86O67x3n5euz09AQcuuzHR
jflvGZyab9Wl+Wy4rBJptjIy522G/0J//4uIq5pC6rdWfbkUn33DVtcxnT700ouEQgsGZ+6j9kTp
cMMN5omS8crIR+9MAq9+r6v5gxAvb06q0JUpK3xs+pNRHthQKAVvqzPy151lm4sFDAI0VLPWF7Ca
9xX935IT5HGLs/tWow1uHboRH/gZS/cWbB6l5oYELJxzhGVG86LuOtwmKRRn6gIbVbi5nob135+J
AswxkwGuluMy2qjgBEM+UwOoapF0uONyGWcSmZNd5tQvc+7Smp1lNWNhEBtohAc+ETwDdRqJhtDE
3vrqd+4klB+2fA229k0HNfBkFL0ukYCg5Jr4X/sm0GEJzQC75IKUqXCjLpufAmODX32IghwMdnpt
gsGVP5KRMlpmbUE50EX+VwfvQuSe45an9OTLSVlHZ3QBl8WnVcFOaQDDWkkjxqlwdX43Zt3pOak6
7CZbTCDlH1SIm9UugYhtGoYttzpO+ov3VUoW1PYA1Z6u9dnZR9CC7UPW1a0tcVN6N4Zxc+G4e4Qc
ZMYuPQUXOKjvyKrXdx7kljgUG/qJAkOxE9RT0fcNGMGfpHbSOlSPU1+UmgH0aJO1tfTPMOzq7W6+
GKSd9fOzuC3DoPMStDf08ldmIqKMYoMd+CztUJ680Bpt7zpsB8pys1kZyAhQqfsA7MN9mgo7g9KP
ewj/bMUb/5b5LnlIxUD2BVeUKZUg1H9+S53gDqxMvKME6XARQtJ3NCRlQ4VTSrj57mmC9UfnQv8E
iH+R3R8wln4qKZ1EEmSZUvdVh4WNyKeFNmNAKf96XKrlcuk99hp18wJSBat04W0IruxOdiVnUd87
CMn1n+bKvtcOosSiWe892aJttmUIv3F27QCqQqP5tWp3Q1h699i9/owZfriSIo2P5h1IcdInXpnq
pw+8ekzo0PI1U9qtzWw/fUe1fE9IGkCd//0LPD/P7kymCHGqwaEVy98fbAwZcH58oGQZRoYPmKE6
TZjW0Pvi5gAF+ewD7LTrn72+vG0jVnWTBlGGUPjhMQASIsutvr7zhhmVNFWjrdY0ePrqDCQCjbYA
vj/f7hwKjJoruc5v2UEPz0ERJfVlBPlN8xR2GQT7H2UGk2zvqznMz6HGSI++1ulyOenhXpbNmuVi
aAR9LO3ckbYf2fGCwD+IFtHwpG/A2jdRqRc6CAEd4DBKpaysbW1VbhRtgx60mZEZ+Yv9Ap1wOGdT
/m7Y65RRV0bfbcTB1ztQqt/i7NwJxrVu8wW6Y1ulZPXdedtAnmQe60LsZRiFyb530RV7TzRDBF+I
H/fc0vj7aFAOKmv3curY1E/mYtZ1cr20Pn7HwAkNOXp1XuKY1dsDQXFZM0OR/QKD1dfvLzqYrqLJ
1e2vjpXMivwOB1xjRPoOWMcSg+x02Ltfk+ZJd9tZaUs+Kn2BOTggTk0LabSwZZZseJpFfhidj8jw
+z9rzi+PZdfD3CeUeDl38k+4aQusM0T6rHAi3aeigPJolqjcjFqRH+yII7Bx5bMss4SEnBzAHLd9
qDhuc1y85AxhfW83Ej+UKcmFamxqZmiUypCyCLSIHUbUzgAZ8MSOK8ccIdL4Vx3YC0VwENxxLhev
GfIrYALR+9/H9fpvtHwjhcE0s43tSqCfrO7qywyEDl1Pe+1EGtsH2NgG5sPiCR6dZcQacZ6uoKLU
AC92qPFci8cSkScv/37voGW3+t8H5rhTadzKppZkaMKD2sra33PnXNxmuMoCo2v7Swe/CYcXfH9h
gHAsFN8zoKguOyj27zaga+TR9qbLkKEjHkd5Ovj3Z11FeIVSlEKq0zH+//aq9F1KNptqzDfiCKaL
SfbIhFuupwVo25tZQtJlNT2quArAKp21qU3Nus/NmHkAHpZwA9fGgZTew8FvrmOoQfJauA8wAxQX
t+KeLO7S7znI1W11i5xv1n4xQiaZgPHjXitSNpAhh+KOKRUauMBx0tRu3FptbJuElWZqppc44Czq
yJsxwgcBWhEt9Z+CVmWfNRWPAjiXFX1AwDxgJZ2F8KZbNaRUAuXWzy6KUBzg97AVJk18mzhIVo+l
v2jR9FEAum1fzMXF8yDnyKgvom/+rFM//pFMY/HwWwOVbEPnAiRoIxI3upSekKI6/nSTy183Fk/7
f14/F/M7BWKaKD8rVaS91F7+S0sGj351Dv4IxroxRCEUZdWcT5bGCVwlyhKenDRB1wIcwQBfFS64
Fn9QfVHd1lLrMQRzuzNZPmhNoU3nQGk0HujbHkwsnQbbf6MGkLWfK/4DF4u7coiZ5gFl98ocuHrv
EUu+wwViPl0Pls0TgzvziviCL4uPpqAjwywjMCEGG4jYC4x3ilzzFB7oSmSobwBUboQNenRbGqan
ZtZyvf0YaJ8i2MS6x5/Y36FCwJFcmfT05RspW3SU9rl3DR1Q9QcPvRDkoDQEbQ6BpM8hUlDKJuR/
BZAroVfFT5RXjs2eCODlUZyJF1JJ/7EoHlnFwU2tAqK8pB1acCTMVUm8km2DI2N7/7l+RShOkqQP
toopHUcpYFQR+ooWUsxXm6tonJqEZtQSg+7P8/QtsvCa7/nGBIUszaRx+vTIDjG9E++Ean2o9WWk
GP53njxj7s5qPi/TMdGTNZ4QtQDajWHu2ZgJcL+E2LF4a2VvVGJVHsThSH5vqnJdYymv+kFs1V3h
ixgfcMi22+MI+p/y8Tl5w+Ic/XovLtukfF3qNwvJCnkWMUyJT7XyW5F0hp08w11Ph+99ZUDY9ngg
1f3yZOaHngbjDiKc6nhOKj2wpmG29e1AZ/+mA4XiiIpKkIpahzK1bBofo997evayhM2GJoyswgmE
DDzmBdBVvaHGcU3qTuk3IIohqGnsdi5japyWZSiKRCl8DcuFNqIdojBqHZHzWU1nlpZ9wKwCjoBW
cQ2Gu+zx98baryWqj8N2swYRd79Envsskisk21EL6dcWvOV8p21Y4xc9s03y6fO9Qn7/YB7a4bVe
OELcUFXMr4y2AaKTer4uStyp6GFD+MwnE1QuHiM/OmylXCE7JldmLWUriHvH2Cy6SPwTh57Zrkv8
DxzYd33+zp7rZ2fAmxno7iy81ep3VvOXBSv+DG/hgc83g90oj84exZr2L5MGsbM714fffR1LxTSu
kDxW9MSLuRAJNIDyMmn0mLF5EKcudOurW04uSqa+9qy3lyIJVSbtSg67Klgu4VhohruAKBqHntYy
SWBr9BT3BFu/NDsQNgMAZ99/8xKfdBer0kZ6qK38H4pVs83GXlFv/mpVyZPvCyNhiY/sOwFHREC9
DdpTbR/4OdtnAqIKOxL4k283/wvnxq0HQ36ldw5pm48wsYYQLSpn/hb+A11//CBXwtwEF6gJSHYu
HsuJOQsH8EaiXFdv6iO/3xKSbk1lwI6hAxVsd1bHxysfzDlqDwTTLKwG2L8vSKWgrs1sl0e0E5oM
LG4BvJP3iDiiFcvfGeXZeRQ7fI9juHQd3JpSI3aayHW0V7S/GkSrrMtzCO7yCwfqE7QWtv6xnMXT
td03M/m/+y/UMAbWhlqVYSVy60sVjnTeyBYP0OYoGHJDRitJWmlsB8lMG8TUp1JN6uoFbdJn54Kk
MZ/LhY43jFhRcf66tF+XCZEhc+7hHr3SZ2SBso4b3spNlp2Wjoi3lMbWbVIktX4wy8ciVRa2GbKy
Tg6R+TA5I1Gi4Lnk6UqIq8urpTBiy+SRxyAZkIe7fm0myXW0dImiURh4mwkYuzDA36WZKvZC2uQT
vEqM3WEQzWoahmdjinH93itzziMIVu6OpG6Lt/GD059IGbcpthtje2TzVIXE2HpJLdTwbgoHIrgH
LlvPzXSKxpD/F1IBOFX09lXgtyrhYktbBwpX1ZT6wi5+wVVJoRYv2EIcHHSHlmH8Tl6tq6fML80F
mCOgT/vSh8jgk2hXiqzgZUQVGCwBof2RkCti5LseCX0yIQaZoxvWjYtzYD5ZFKqI062nk7rGXFgp
pVvBF3xpM/uUf2TIRUzjs+U5RM92+qbZaA1VvgvBy99SeMMIiQFds/fprF7LqmnubHyYaaKxvF+x
IlDUlUz/KhQhw/zydZs/lVjtFG/QoqTH9kIS6sRRefgb/r2R6Wa5cB/MbSRCAizenSYtEhP4jmKb
0gMpaEHulg12GJ4x6N6+NMUvT5Pg+rJDfQWMomc/R3pp0DOjSRFLq2eLAIRoPUaXdBjbDHD8h2gV
wds8BV9W7tM1ZxD75NXW8KvJ0cXYnOJUNpyDOwuLfTrUIlnViwpN+Amg6fs+KTzSoqOGjrRHLKWb
1bJQ2JiwR/tsKlUCSLMSRaR3BipVvh+SWlCCAgTXWhcSjymI4YbWX5Jt11zkZ+Cjm/lK9Fp3aiHg
d0ONBWFI1LNFaxDjj3OPiawXBvhkTQHVU+vyHOS1WEcVOgLy8TgKnsL0AVDAwkuTEvqd7tJXLOZ0
ye1WPsYrkupln2BLtoV5jL9lsrRcv8Emj/QREoV68jL0YlQTeKazKYtm4wSCnr6ly+PG5UZUskvM
naM71n6z/srMQZ+F1uXCLEgWqg3fszuE250etgH3GM5UWmJAepUJSnC3Pfo2LQcSruBHYkLNNM/Q
8OOP3XLEGj4uNpzeXMJbZ+1fuB+xPKINjMbKZLHBpvd/DGuCIB5qAx2QX5WMA9+b/fsyBQtH+l7c
AdN22OFLG+J87B+2EU0lwb3X0iDifpC/D4ZA6dlndz87C+2PCGf/3N1fJ3Em4vja1gLV7qe3+8hr
0H2qXvZwryDl07QHM533F+kJc3IpYTRHQao7RH2ifQ+HidpigYfdn9C1xFilRB5MR7rjH2/dk+jv
1jwDVcVWFUihFyAZQQQ5AZyR2DsJAt6VUxrxQP3ulH8M74sxxILgSNcmu1ZkcJ8OAUWMOCZ/apzg
jc2Q7GBekMV6gQEE6gKKAUzbQKakyXDr0mcHgeMy1NxeCmgKGbNCj8LsGvk4tyDCY/51Z1ytZt+Z
y1LeQD9cRbjRIvl1i4qpCHKmJY0yx/SHNGOPqlc24RVHQZuwa7+nFaA/gCKu2C0Cp3H7SGL+GAjF
2WubjYBE9NjTCykvWwbA74UbbnGn38dvYG/3rFOKBjm6Tjl8IvMdPHYNQqy3WZ8qjitdwqk4pPhR
x7nMrhaPEootXiuKJIgzxh0V2wNu92kUrRc6OguEWc3QQoi0EW3JnC4DbVui/Nh3S693Hk42adLD
2fiCdbx0a5Mdj2uXi27PwCu9oLOLnekBKTVMy72UsUpJ37CHyWrxUe0SQKlCMz/H/Nbz3OYRYFLY
Nj8N6hNLCZe2ZWDzT2467iXdwWQtrWEmflo1sSXR+Op+DvHedzi9XkMbK67FCYp9t4TGeOd1m0th
Av7NiagJOhqwzTTjQ1yu9AaywtLUDQFuowQTZc8HphbUSNd+3ZJptTxjPgqqhlxvuXzleZZFbOhb
Swu+nmZO9AgRmeRy8vSQrmLrA+YBn/SomlCvLfcoUvb1ukaG2lHYtB6bhM1Y9wtULBFQGPUsiaVw
CcZqf0tyYlewk4VfRV+EFivbFLsj/Rtu9Tz26QlellquJqP+CjFPo7s7Qtrnhb89CEftrraEjqyR
2dqdnm4pM0FbAeTPOQyNeyzZG/oaDCuOCwxTwWHTdevhubc19Ez32g3NR1RW0whtYtWc81BvMghR
yRBPkhvvu/HnRTDHyrd4owHQ2BOFOJOoHLpTOPDifXxgZjGZkVjyuiGsVLXq63T+MV54L2T2F5m0
+2pFMMPFiErDhIx6WJhorUJzyiG1hH8MW78iCIBw61HmuEn1X2vhPAsIv/ER2nibgMQZGqgYvrSK
7gcRFE0syyIy4nemSN4vxpT4ZVaO9l78yAftkiWDb919oBBWnvJIX1TfaT2eMZc5EteP3tddHikt
rixJgsVCsVquSvzqVcBw8ewJoBoZ60oQB4pDQ10XFCwVeOe9KHYLJLrN6G2VfNLAavXqU+pT8HeY
z0LDerT1Aw0NPGmTp3GF2mFhZm5WM8NawDO3dPnK3Ag9er86og4il2ZV5mRC5f7n+3m3j8DLk+xQ
bo9Gop2tbdX/DivvBx4lYk+Eqvgb8Jog0kgcUzpYMj9LEJUB9gsBX+svSkPcC0e+oP1L8q/cW+Lt
Cnk3H3nowV5qlb5Aoz2MpYj39+GaYR5fLk7gYdNYW2sBWA6uxdHUD5dW7ucwNidFcNA5b6MAyUzh
xns0J+juUU0kKVHj0oz6VoyOBNXCCMZlJDERc1tVbYng5k+Vqc3cuUgDs+mddxWasRXwG2Jljb0y
S+2HgyKeXCFJ19/C7vOO4/goDR6ChG9kn4ks9OILjaqjDw/dVyK2sK8gCR1Yz/KLDZUXYU7n85io
tWqB5C37nhNDwCNneQzHrcJ/vLLhGlx7JevZaaumXgv5tQ9642TXmpX9vopeyhB3ccObOOtirXFu
njum8wkgKb3+dR46jW6Yg1ZAX1pulN3NOCNCQnQ5AAKeiPf5uXTD4aTXo3A4WXmsbd52k5tG2ZhZ
YfQXr/Vrikf3vUYT2/tZrm4w9Y4QFzPVlMRnAkhLlPCrR5NShQlc9NjEL4rGAqto7qFyiStiHdAn
nQGq2MGcWj7NS4ymhA1kqwIUypf1QgPpLtXDwacRh2gavlL827cMKuOv0DKvl2eMdlt2HxGBiPAX
Qj7mCRjRTiv9uBcvYPT6T0HfW8py/YKJLcoLN+Zs+gY8O68EGrc8viSbvafLN85YSvWFp0tXmxyt
IVUuUtZvi3q6baYmjaf9aP70HajpE/abu1P12MTew8xPJafXSuOJ9OBcbCZ6Yj7le6850wFedsQp
SEqnD7tioeKcqM6nLnStVFTEZvPslo1aeyp58Z2WKCVnlApD0/VpYVPMAI2wBuPRkYzIDzwJNRL9
/0VVUR36RzHx7CwQLz+VedO1Fz2THS7Vb6EPdQfVy9JZj2XpWLSRfqkO7IL34xABtWwI69Z0RIqb
Y6zoWVaP43tnBoEaIEtCiYa9CMrgeRIJ6cImIGy8y6PO8JCktXJjqsEDe7Xy4yG1/GjU7Tw+Gn9B
c8ps8dNPT9zyCTZbXXSLglXjUCla1tY8h2d+A/ewX5KS0VrlkMVnNArIljm74v5eZyXSnxhc7m2F
IXT4JQ+Vx4eEjPElq5m4j3idAEzBTMxMAMzHrZ2AUFs/Tir8wGQ0SgYqvrQFjE+zL8gtnHB9gjTC
BQJRizsHLrj85Rkhxj4SRbOuq0TWFZkqU1ZToaJts/v+XXr63yCPVZ79pxPHMR4VsB8PoP13BsT3
nyF3cUiyUPNj4lug9Y7ZLmfyg9iCbUNBvO/b/IwStrmrt//vptaLvNeaRzpHQ//DZwuefDwbVlWF
sWO8cwiaa1RzvSpkqQiHl6JICi3Oa9qXR8LUHQqnEX7YDRqiss0W1S4kaFTkpWBadQR3WcqT6ntr
d32ouLR5vVtULvCszt6r9SaMbgZJPDqZV8GLE472eyhz/xlpPcr5StcgtGOo104ousLRp5FaOTLa
toKVexdHj80lMWLuLfNwklzWqAQ4Ce9cZdrATMOJlYfB37l1TyJ6anEsJ3J0GEU74ZEGAeEqAG6g
yjob8NnEpBpPLUHzxj2p/1yiKs7Ur15pRAaOYHDtGnUmasjtHCFygTQRfNbU8XSYYeRbjbhI7ujg
tqQjeqmo74sB9hohKsgoQibFS++eDz54XjTPlQr+kfGwXcKg1tV6B358RgUCCy1X6yTrf6MO6r0m
GdUOnrMt9MyS5gJ3vyNCDdYqMfaiv0VsgVa7sAnzDuo2CPglqpXHrNB2dVVKh3yBV5MM9HsvGROc
6N5h5TOVbJdCSk8l/q3Ho2y3tPVlHHPDjLdyBeunMXXrClRm+kK2JUWh1bXDy5FPI2ZRhoHu5jxn
NUM8TCEu2+oIcPtRFTXyPY3WlcyuBxEG+9QKXbv10QehIQVvKtGAeginu5lGot7bVidBcy0joWdJ
iicjDJD0Xcv7AVnoaFG1vGfkBo5qlwMy6OjnWBEEFmroJbHYPDzWEFUP8j6kJxIFhPJcxs6KD//6
KeMLHZz8pKEECQy1VzmYlcEdCgLH5aq1agwrvzjKdeFnoQ1OsoWFX8SA5zo+oMsRrksVlsI5bTZ7
2rfQwMjsfNyWN4ov6U2DwieCA7FA++FCm5EQ46fNuoTn0oUGA4+6JvtX1pTGDy+4AyGkndjtVkQC
RR89bZ9lZyl9UzecNLBTtoRHrR5fL3vWYiAQuoovx+ntdYHlKrgvJNWaZYCTUBOAhjY/fGdcTxmk
PcYX01ODmzpNEn50gj4q3pLbe/ZNoe9DbFB2UKpqjNvFU4MJb5yDOoY4RQTYIrrd+P0PUL4RBiPx
AQWaqoFswZsLXizmERBRNdHeW0WDwf/zShI78c18CnPAbPgDaIl2L3KNzxRzH3FpsVa4j1ZkS2FD
bXug3FZ4CZlEj5Q1Uj/qUPF6AggJX3txrMfGQ33X/w/P9vTddNlnDYAlgcLjo/9LDIf2maPHGcXN
BFwpDGvAZTm3wlymnlGuXKJvT1N1sxwsvdzfqBWG8OrLLiZEpwr12K/jSpgvEcbVGpqNIjiHR/zD
xRXELuqmyfPHwZJ4aHmX8ngzJZcvE6UBot2zYaCMOifxwyTzZU3xuHtYf96A6Zr/csIw3ArQyv/h
8ipjA8H+JLO+Z0N71fZ7jdAEcNtHtZuKlgtpi//ZAywyfnS9Vu/XO1WoqCdLt1yONkfMvWc3Y4Oq
PtXHsLeXXaam0JBK6brpYuz3+osz7jPuwgsMgKrNFpFJ6WCz+IB2bI/BThFHnIJIIEXblj5DuhjR
3sP4YEQDqRJNWOAeArsH+7i7NuFtWMYIlTIUavbhFohmZ2xJ5LB8KFN537PmkAbqq3SNCE3p4N1g
i/hchSfY9UjZMEL5/WaiMWPuT9/VXNO8Vjfkc4R3mB1IH7o97IdaBOtITGwuSV3wdkP+V7LTVZQH
Z7IolSqjU+1TB1ImmbzZedKgBqx38Xg7tfUqplFQD8WbzfW6k08yWHsYzG2jPRHdJn05gIMigsdR
cG1FqH1RNoAOhmY1C1fr3kBUZCHAnUZtXzPuUzH6g3PrywUPwoqNslAeEeujEPkYnqn80ScSyQzq
loNLYhv4TFx5Z59nZGLp0RukqfzUePClqHaj99P6vL0zvHcYvdGnc66YwUqLN8mzBpqTQVHfHEUQ
MduSo/6ZMR2yi4RQPzdrxQRCMYWmjuW9N6U5uhd/jn9oOzhNejoNrAKCwf+db5Uv0OKguvK/OG4E
oAgnoatZif+OC1JzkXTyOHtrWBuWVKlNXHcdt/HPsaw+ihHWbxlZV7gXpLtbxCfDfyDUalbxl7Rb
3NIOsNGcCyBJBzOR6qgUSQ3/5a552CdI0POJa0rJGg0hrYeCCOS7dGr6tDCx0fNrN1ugoexOjl1N
QQetbK6jj4GmUi1ji3OpoUwsCX32NkHQRh86M/R/zDynSIA2xyL68tZvpe5ic+qIKdDSZRKHFmOJ
3LAkPFdDvj82jtqTA4TKMwS73JG1UEDJTiyzUjZFsOJiZwp+3lBUGyhLitrqMOUlhhjVoXHBmNJb
p6hmtEFqTCnL8gxikhoDLYOINfVL4vVSR7aul2qXbqODF/Cc3AyLwnq8foko/ft8aGTIio882G8z
Adlf/yrrBzAtaEqY+QzvXlXTh+336JQbiv7vZ6ojdc3ZIasyAu37oAoRwn01qfMHnQ61HQhA2RQh
LVNcLURYviWtkuVJf4JwzQAz4NPw9NjYRPGTEkaNNXKebKu3ItcNDMDoQa1axbSIl1CYmcbQ04yw
J18ZmTalHr177EnljDgvb4cFxFXmconNa9TzffGN0vrWSF/Av0wPzKA2l0cMJSCuDYPMronlLhH5
ZPrppQAlGD7bc2bh8XO8faMkfs/PWlmml7C7kYAlx2WYOjve+wGePEjfyh75YeEVl3TsIpmiqyf8
ScL/dnPCwFz/dJOpN5O0zP+NRXmmUZ7yp8L5HJsCbYCUJpOQIk3Gs4LpHiZHeAN80TgEmZXr7Q88
ldu5JkLnooxeW+7q/gJINuRNQPcgc12cc4XNAfu/Ze0M0jcVdVmN5/gf+0STRXfQPic7GaErIJOW
fOErIsLJgp6tIW4UHEce4qoqOwuiY+BtsZnfhfdNZbWDhugQzaic+tXU60xFblR7SWTPOtkSjE2I
rLZe3aPm1+j0vK4/Tqtsw09HzfW3CN7Kpbfv4tDkZ7h7CKUA4ZeamXQ16uEIAffZIY2+beAWfbWs
lBcZNscbPPCTK19VIQELcKFFfGgL5h2wsuQg4F503U/c9KFpS5BzAnrY2t/VIFKos0v/CgM6UiOJ
/nCS1Z4xEAMx21I0kzLE1q6ev/Oi2aZrdUwAhMNjTXPk8DyeLnd0A9bSP15yjT40C6KCEZ7rUoWI
BNmwjXog1gnUA2otAd+QpnYYakRjPYGHRxrSK22e0K65Y+8A86xjU8ADUY14YFF6UAdo1RjWl48Q
6QdUZxicHqopQnj68mHymeGKlJyc6ptnX7Gv2zJ6Mcs7ELcMGU3h5BBb4TQE62tB9q9vAmLIKBJ0
qNh2B2VNPJToBAqI8epqaZdiGAU997/mOCN0B/4On78RheYnikDCx7RAD7C/Ngs2dmxvKBLR6H0L
Xn85Ix/ibZxTpwFZo9jrAhmUUVB199awyTaToPqdg9UNNNYGaQNaArhAaObMoVDGmyRwpuBGP2oH
bhwe0y1gJ8eGR8izuphZGumdr9ImCf3cAvb3e9i3ZkOmktpjDrpy5gBIzaJ8ju+bB8o1nrBL9qg3
ZsfLzrvub5/ZQl3Ft6ZTromeRmK0+Ek3an3F1eWrZrGxeYs5nwZl+T8RAp99TdVmR/cHKqrKjsGe
bAOubSmGIWAkV+ooeZY9ZeXDfYet/d+2TVBmG3eTHNfoHppCpgTktg3CXX+Skv60YwHUn7vlHeSf
u6Wfh1Yjki2rjw9BCgaERoJMgOqHZJp0VCFQ3sfTXJe8674ACRTqc7KIsNftT1MrWESreRPOjVN5
xcfw/wCcWsdMvMc7FnXBy6m7GBWX/1GUUP4ZuysPjSdnPVDygsZPdkRHdsk3cVySknERd1wV4KSw
RzFsEi8qbHM4gxNEffaE4CA1sZlzLW/+p9h3wKWHqPnHf9Xx0RgvSZexdNVNxvy/JjB++z/A0YIQ
bgKHvPUOZsbaK6xG9uCP4AsF8WyXkWroQPnULMwFYAA/JrFj5TRI6LYhlVtjWPJ4IarzkWWVmFLl
NVxLO0TnDYnC7duhdRB5HTdBo717rhtbL+2mUl92KxCxoLp2lDgULozRPlnbuHYE4zRugUcnzvt6
Q82UFMwxxrjzzqITrt+z+827tUgwJ/WwyAf5nybVA7NdvsW8DjbRS/7C0xfd+3zWPzNYDRNYo7Ik
BT+7vSFjX6TJb1WJO4x8u52AXsHaCLclCI4Jgk+sFxe+h1VsitF1Y06hgncN8gnhVtZVyoQ5T9ow
bAGvlkiGbiX8lZq05Jm05ncvsrJkaq5UqqX2vLLC0ZYixtve4l5oZLCd9yAqHvuYn9tZvPIzjxTG
2L+KpSQfuNDnKQj2KIlaiZiJcfzHSANqPYNX593VUO/p9oDe2RC8+wZqMVTHkFWisTbQZ84lBAN3
WB7m6JKG9vtjWl2AaPloyMpLIF9VHOQams5vRqkkxIpE50gKljLeR6lUr70w1w3qDvv1/Vo+g9Mg
6wHL4c5sjJH1sAjfq41o0ryWmFocsCfWoK4DOekhN+79EtXkQeepG6nkmGkli5cl2YVaienDoEox
voEcBaNq4jLW1/84hW4buBEkrfKrUWe+ilSbLKJLtrP2dY51lWFDxxoxpgWjWDnArHKsHJe83qrs
3Kv4qaxOpbdCZwt79//D0FWyHjphd/ztVuVWCQvY4Cy7eULTWU8BCSkqBICogHgEBMV3SnKuAh4o
etnfF5jGBPeZrHb8vHZeYgVYReXmTaMb3pfCwqc26DASHsckPdxhnf/FLLvGUJu3XG3BjGgRYZw4
m9gV+R834sgBfFlVtHLeNPJT3EhE7cxjM/0v+MGa4LZI/ritE6+NUBjMq6f0cnZHqmMdmXxSY8Lb
sCCKUIkKDPF7NUcynUy3QuLs2lmdTb+NEOXN0M2TrNKBI3bN6NzweCN1NgMgHxClUMowjgrI97Jg
J+Dl3r5V0ZT51VyEg/s9+r4zdyIK2TAAN7BbEOBtKIZ55Uzp4lh22HMrCGeqdjfngsUmFjpxcoKv
cgmOiWtMK7uJxxK4gB9P/wUqpnNdpXnJ4oFc8nftE9GB62qTqwwiYb24BO95SJ8/HSCRfn5p/Nhr
7aHtL9PFv1A5gjrF36zvJ4KCgYdeN6Uaja1ejyyfosD2SIjCXgGagaKmfnWynNGRFcUVe3oa00G/
NxXUjC1vzPfgr3oubZ0eaZ8WbJ4S44BNfotCB7MuwE3YM7tEX9wsoGhBYo8MfpBKBIFRZKZGH/39
YwXybXW9YFn3SIXfMwLe8AuDR+/hgXUFirDH7jrZzVEcBrWa/KVROIJZ7kShBsIj9Zcxo12p9rj9
lUAeFvdBshCp9nNW/77U7BxlnDymqkEw5ziIG60MzHcXHPWaB8ifg79H69xuAzhVB2+J6BgVqNvC
ydVPsU+Vj7ifygnbfbHqNIJBTHaR53Jhkmegultn5/Qqp3hmgjBx3j0ljWYH/5ho4aWP9zUzhKRq
X4iYT483xiiR+A8uWa3WdBbeGuG0cNU2vBoolFTjxHqRk183enfLOhDteJAo7OScDQ3xndVEouZR
p7w6cyRS7V0pd089+PmC1aoaL6RbuDEtr3UBEpQSLrRmfyc5Z/DY4fvfFt3psnTmyDILUrXULrn2
UCHgj/WdcyZJO2XhdB6hXOdu+ZPduYTu0VMoH50cIPGy1VSQbJx5iw55AbnqpOjwOVcl/ZmwPe8S
hDBfU1lCVjUZFv7NBNlXe5A3Zkp4/lVonsVq6ZpAwd3fv17XDbuHImnBwOJ9PSOmTHi8alWs5WyB
WkvJWYXWEshnKwcXdb7Z2nEdW35qAa0l91ozq0qy0+hy5TdmDYw9TZKOgJ3T7mB8eOoLh3tfDmEL
zSTth4EDTVCtrxBxzxR0Yz/+Qx8FUFAUSoq0j+X70h0KsB3wmsyz+ZukU6MCsKR5NntTFnchPYE+
U8nZB2nPl0M6GwHkB3VGx1aswkT1UiPgLiIqQ7nurqn1kKyXOVeZrCP5oJWmNf0m35qcoYZm+BWv
7L/Gbkeedh91jvz8idx7d1fNsSAyEkisORQ5PqdRmFYXG/eCn2HjJpxRzmRXpEJw+dM55cBceqMy
PU7+wWZ6xQUDeTBWtX40dViBJMMRn0fAZaDx76yIdp0YoXn6XJPVt5v8S0PhS+hrRZy67A63pSZO
xRnOn66AZS4+6VJ9lCSUAXDFnVsJNkGkYUgBOEqRORTuNUmg5Kuy8o5qbCbGyyTKZVUBeRrurF3b
nZpIatk7teEbh+otI8MfsFrRlx+AG5WXDdmt9/7TUhajODIzJnqxirIOY+wg5vDYEugLk8xa+UEK
T+Q4+ObzY9CancniE2CrfseK0SYTgLwVkYHM7RmsHOr92NLOMtbnsgaBTW7SELJfE6677Yo0sN16
kuWgrZyUZ3enr2SFUfnnuI7PFU0e9ZTfDp+9ruaMIKwoIhfx+sqeAjuiXxSGRAa6PsCgpSRRo3ui
v3G/dR5/Z8j3AnXYR6BP9Rr/MT0Kqlb0mxxLO+zMUCAqY9AoLNlQTXfIt9jsLH/IPBE81vJamnuC
Tw0OFwG/AzvQjUwIDEU8OFU0hSElvTqdYre7MVEZBRJuMy/MtmewiZB8T21rw7gYxn8ZxtpE+9sw
di6al4GUslkpFLBX3Wl0xK+RtKXQRiNhOeTc5YaNarUuoP7NAs7fQB6diAmzcnccctYEQ0++WpHP
cAetC0S1J8wxhyombxxLJ06mgdff/7u0fF/CVsAOWIDPSHb3OHAvRAgMNeYYtZN6c+wpjNVfr+xA
IKzjPvvGYB+EfkYEmY/oBg9xqG2WgzbYTywQx4QiUT06p/6erfo9TK/RC2bjtx/ZiIiTWJ3SrD0B
MTAXyXTlU6DsQJTWviEb2cfTttzJA4QS3VSEVYuD6i0DMiEsSiDHTMr52iV1+sc5qKXZbQwoWyEg
jSgQ1nas6gZncGipY0ekg2WzIvaoHVbzlVSAOgJCjRV8ZBe04Wk6o4FjTlj73IAzECVfJo2QC+Y4
wCfq1+88kQl/pSo+4RjxJwiJOQIFUUrDLxoKNjDTrN1wMJyHwjdZYoU1IXAPfitGO3H8T7SsnvcO
QbIwQcNZchyMObDIQ8BX/cCYXiQERmwRi2YHwwzRZYCUskknJImH/32tg+sKNnCKS84druHo5ZQS
6u8CIl87xNTacdEp9NhAxtFAHA7Z2JmcwDXXwgBjvmubdXC/46vcpKOVcjPCfC8hYw18NmLjf1Ep
4qUWSQHHN0EkzA5ro7FUHV3IQLpStYIqmAjKi/IdkdPFS/bUILS4xh7aDkRMoUz+7rnJTy4qFpae
xpDrLdTieNu4Z4ISIM6/EacfoqYTR/cnNWecog+C74rkbjbtsk1Uxu/0aELfrY59LEREhzyNlivQ
CiInZkxxE5rpGlDIdYxHz/TWJhe/SMyjrS47YieNHnMDxFQJD30o7wks6Lii6ukrSFbbQxP0xFdN
oS3vsOYKI8+SXVrOEZ0hWJdU8hp1096qAo1+egVBLFLSflfquzXxL5GNQIY0Tf41rH56UzgNOF/f
yVjA205UXRBTxsMAVm7fhXshEPi+JkncFkaJ/KTwzlYLqDjNDB1OCggG2a5EVnsHuIDxK2K9ilYS
2B8eDPblfbxQ7nT4OXOm42TM+x1tTvvW5jriWDGkagh1G6M31k3JxJ1Px80AnecC5LD3UVmR6BCf
50GI1nvVIs7aXXtlT7UA2a7MgJXmSNCKhsFrnb6w6gg6tYcRcunOSjFFCavxRd61S9gv1Ut33bCo
RZF1fMhRqtR1O+TVX+l5Y3fOmYEfFrLQ8rD3F9GGZyDKz18mDRjgIj1tthRdsdpilET1Vt2/Bofi
l0m8o0fwx+gw0jOEcdmhN37VjClgk2+dDlIr8mUCjiIz7jeWM3U64BWAZQ7dVFT+89DcIIxBo73g
bdHkX5pJ3Ot3NKYv7QzZl8MFmvDFFsm6It72E//CR5xcYhUtAcxMn0WtJ9wP8zilqRrbTQjLJ2SC
D4c1TDQLvaR+xUrJrIMZPSesMnncRiWiCL8MDsZH4OVjNTPIwx5v1kR2nRkncXOyDlasMqA5IjiB
7KyXq1a1FgSjrqjWwVotQ53PwfREFihzyg07C8UP2l405s14jHpzKUqyJyAfzYlFcKCUiJHDOx+9
PCDtKMmvKHuEDHRukdDyA0NNSnlEPZLmC1H7P1V3VSIzOX02gZuTyVlayLhrFEyZ4ZSGc0nTsGhy
YLIbXTzJiOT1if4nVhbuQCWAwnJhfnIwU99jwoYvnZWI8kyZVql62bxBa7iadaB9rWkKrXmLhrxj
wZowJ80ncIiWr6inMv61c8/YmwI+TNEBf3GJsV+myp0Db5CTb2xVfA2/z3v9GQgHGpNzkNyy6rnH
flQZzN498vgPAMLsogDg1wcx7lxMlnbYFCMdN9ENdi2zLnFbLg63c9bdku9bQYXlIkxXL91pHAne
o+kd2XYMYCom0Iyj9RYLiL3mi5RTuCw0WyKFNR/vzNSShi7h143niIsIabIKvxdu9pA3xnOerAOJ
KKgUyQ6NJ366dg22fMBRxWtaba1TRgGDqg1ODG4L9RIXpQ1+F4kD5PB0ZXT9nRMNSwuIbjoh9tbv
RJbNkpBiqCTmrwCALRuEsV/FGhgT7chFTNzG1hW9Pqn6wmexE+/X3NyZb7RCEAmZh+0SkoSlz92I
6BTMSexWOayVEu1LWmQZNLKkfxTiYIsru0gYADw5i1VtnI8Jofy7vVcInq+iijFr9C0iF6sDij3H
NU4pzwQGrqB+YM0TfU3l59pqeUyRICXKpUHxdYi82WXYLZB2Y+bEDcLrTHy9q1sNLbr7y8KGSkGy
TGdCdigturj8pBfP6QN3kSHyUZtKX0oy3o32O7L8YfpTrkwYYntlAhLKT6qQumtPgbPxnaoh8niy
bzIVNdqxjw8+P2KdWLEIJzp25SldeS7T1UugLQCD12IIp6e8T5MMIK0Ytg119rXG/Wnq5t1Hcyoy
kjG3+G8eGAgw+jKoPLVip1ZCrnzQ3lXkNTjpmyah8aPNmdZZ1GYyyQSi29Vahy1CpC+9aI+NcoVw
rmQBHAnrEiOga/JqNLpGekI7Ie5L094oslOtk7vzV3v9R7AIdGmCINxg/VaDVCIojjHXtsXrMQxZ
xTYpDb2437bxu9q9IhBVpYiPjqsJ6AsoMOMQBaO8AzQRyO77yhzYMycIHDgmg0BFtxCk7rT6KOEG
XgPDnNG0roPWOLZDDl8IEwHnUBUXjrrbgxzGcxTwBQtrkcrr6+xSAD3UEMe76K7eCs8n0yRgS5t5
2YzC9ozY3FOX4P4YqWZoDQn7q0Csc6KpWSCnigO3rB07uxTlREeHhnsb3KYHMG/pip+254FNh5Tl
sv610gzL+J6zI7RsYKMSjBbCxXgNiUUH1wKqqWT6fQw3gtdyvU267CmseI1OdocSr3SoHB47BsX8
+5JulWYOyu/BO9WDGOOXQ2Cx1xfj6nC/gJc2YsOVB+yMKCdLSybXnwfFyoeSQ9g3F+injtZMidsS
e0DGkiCoaodTNpeXcc3C4yOdV8Kga2hRBC/warwtUf4Mg78QkENOsBMTq1ZfWz1l1ct70HkB0AH+
RE/BYN15lvJ5XXkO8Ti8krEQ57+aaBl7YPvInz/7D2bZJPyClnBP08gOCXe5fObSMITDNBgo7UVS
zMvj+cTv8c2DZPwEgaAV5CvmFIP0/FT0SVDYOaNoBncWuvqHNk/e7/cdcIVihVrjzLCrzW2oaZFe
7po9jAbz6cFmKdnVjuVpHroEnYOrlbUFSzpWmBbjViqPMjsjKSW9rp2W3qBmjmPTBHSII7f1ejc9
BiYad3sMGR53E0W8kTHQvnhyJjjyontdtgFnt2c1FCx39e7HDl7UL49jJhORoxVwtUQWn/YtbgXx
C1FpHwaYuuuOJR7yVhpRptnEs8k1u1L4az8UAsWguNa/gdMMbZO90RVf3L2+hNfddnEGUfNmntGc
lJp2hEG0pQVWp0R280yuEwUhc8QpqFPAmRpOPEPNwMUHc/EQnnhD21W6oezaSectBogSGc0n96iQ
c/OETUpvxWxtbG0mDoCiiNrFn62ZiSz/DazNIdFn5JzAk2hUnvSNjybeWl1Ymcpf4aBpxSlpN9X5
k7PAGvDNGfdCsQzkqzwB4qLRctTRnfWzYzUwxx57Z0TWpPbn4FLLB8oX/X+MkCLkwNmYDnErglvV
XCZ51xcdrT+97fYmOyz6orUyOJ8/OeLeQ8svMqQSPFYCBjYMTxP1ZYQ02bbcnLhk4pclaJJnbnlQ
pStyL2tpfwgXGwQNCMtBMN30QfvKXw+kH3W/gV9o6GejQGJwo8L4ZvsanLC0dwrMx1LIKdSih+LT
UK5N0IH4RUSfMr9VSHrsghYlzh1YBPv7IFJAAAHjfZ53fZZ0eUAifPLRkCaIpSRzNSAWetKsMka1
3icURdGZh1losLrkH/7hUBp4ilma4wBiMVfPGawjngGwD4uysuyRmh4ebNQJvS7w+Gm5zH2It6VL
K6j4IV0VpxFu0jxl4g5lXuAFMWwxinmoZT0yZdNEYojUNuO82mcEJAfasH4IFI1qoxbQqVJaV/hC
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
rGXmQNraQMa1UVkyMELGLZMklhFAMg==
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
