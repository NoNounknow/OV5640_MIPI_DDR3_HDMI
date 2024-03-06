set_property SRC_FILE_INFO {cfile:d:/three_verilog/MIPI_DDR3_HDMI/prj/MIPI_DDR3_HDMI/MIPI_DDR3_HDMI.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc rfile:../../../MIPI_DDR3_HDMI.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports Sys_50MHZ]] 0.200
