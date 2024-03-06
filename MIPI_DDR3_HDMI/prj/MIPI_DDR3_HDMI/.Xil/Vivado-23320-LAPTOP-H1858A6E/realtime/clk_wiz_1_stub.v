// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_1(clk_PIXEL, clk_5xPIXEL, reset, locked, 
  clk_100_IN);
  output clk_PIXEL;
  output clk_5xPIXEL;
  input reset;
  output locked;
  input clk_100_IN;
endmodule
