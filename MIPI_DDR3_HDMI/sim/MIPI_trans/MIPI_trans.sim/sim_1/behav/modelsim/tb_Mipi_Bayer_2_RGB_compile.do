######################################################################
#
# File name : tb_Mipi_Bayer_2_RGB_compile.do
# Created on: Wed Dec 13 21:17:14 +0800 2023
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog  -incr -mfcu -work xil_defaultlib  \
"../../../../MIPI_trans.gen/sources_1/ip/Sfifo_Raw2RGB_w32x1024_r32x1024/sim/Sfifo_Raw2RGB_w32x1024_r32x1024.v" \
"../../../../../../rtl/MIPI_rx/ECC_Calculate_Haming.v" \
"../../../../../../rtl/MIPI_rx/Mipi_Bayer_2_RGB.v" \
"../../../../../../rtl/MIPI_rx/Mipi_Byte_Alignment.v" \
"../../../../../../rtl/MIPI_rx/Mipi_Lane_Alignment.v" \
"../../../../../../rtl/MIPI_rx/Mipi_Unpacket.v" \
"../../../../../../rtl/MIPI_rx/Mipi_raw10_depacker.v" \
"../../../../../../rtl/MIPI_rx/MIPI_test_top/MIPI_SIM_top.v" \
"../../../../MIPI_trans.srcs/sim_1/new/tb_Mipi_SIM.v" \
"../../../../../../rtl/tb/tb_padding.v" \


# compile glbl module
vlog -work xil_defaultlib "glbl.v"

quit -force

