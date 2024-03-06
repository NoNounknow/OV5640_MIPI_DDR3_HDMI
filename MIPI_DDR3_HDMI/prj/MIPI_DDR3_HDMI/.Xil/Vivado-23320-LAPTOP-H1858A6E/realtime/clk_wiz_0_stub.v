// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_50MHZ, clk_100MHZ, clk_200MHZ, reset, locked, 
  Sys_50MHZ);
  output clk_50MHZ;
  output clk_100MHZ;
  output clk_200MHZ;
  input reset;
  output locked;
  input Sys_50MHZ;
endmodule
