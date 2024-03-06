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

// IP VLNV: xilinx.com:ip:v_tc:6.2
// IP Revision: 5

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
v_tc_0 your_instance_name (
  .clk(clk),                            // input wire clk
  .clken(clken),                        // input wire clken
  .gen_clken(gen_clken),                // input wire gen_clken
  .sof_state(sof_state),                // input wire sof_state
  .hsync_out(hsync_out),                // output wire hsync_out
  .hblank_out(hblank_out),              // output wire hblank_out
  .vsync_out(vsync_out),                // output wire vsync_out
  .vblank_out(vblank_out),              // output wire vblank_out
  .active_video_out(active_video_out),  // output wire active_video_out
  .resetn(resetn),                      // input wire resetn
  .fsync_out(fsync_out)                // output wire [0 : 0] fsync_out
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file v_tc_0.v when simulating
// the core, v_tc_0. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.

