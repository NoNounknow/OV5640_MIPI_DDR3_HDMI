set_property PACKAGE_PIN Y9 [get_ports I_Top_Rst_n]
set_property IOSTANDARD LVCMOS15 [get_ports I_Top_Rst_n]
set_property PACKAGE_PIN W19 [get_ports I_Top_Sys_Clk]
set_property IOSTANDARD LVCMOS33 [get_ports I_Top_Sys_Clk]

## set_property PACKAGE_PIN E22 [get_ports {hdmi_data_p[1]}]
## set_property PACKAGE_PIN G21 [get_ports {hdmi_data_p[0]}]
## set_property PACKAGE_PIN C18 [get_ports hdmi_clk_p]
## 
## set_property IOSTANDARD TMDS_33 [get_ports {hdmi_data_p[2]}]
## set_property IOSTANDARD TMDS_33 [get_ports {hdmi_data_n[2]}]
## 
## set_property IOSTANDARD TMDS_33 [get_ports {hdmi_data_p[1]}]
## set_property IOSTANDARD TMDS_33 [get_ports {hdmi_data_n[1]}]
## 
## set_property IOSTANDARD TMDS_33 [get_ports {hdmi_data_p[0]}]
## set_property IOSTANDARD TMDS_33 [get_ports {hdmi_data_n[0]}]
## set_property PACKAGE_PIN E16 [get_ports {hdmi_data_p[2]}]
## set_property IOSTANDARD TMDS_33 [get_ports hdmi_clk_p]
## set_property IOSTANDARD TMDS_33 [get_ports hdmi_clk_n]

set_property PACKAGE_PIN L18 [get_ports {I_Mipi_ls_Data_p[1]}]
set_property PACKAGE_PIN H18 [get_ports {I_Mipi_ls_Data_p[0]}]
set_property PACKAGE_PIN G16 [get_ports {I_Mipi_ls_Data_n[0]}]
set_property PACKAGE_PIN M18 [get_ports {I_Mipi_ls_Data_n[1]}]
set_property PACKAGE_PIN H17 [get_ports I_Mipi_ls_Clk_p]
set_property PACKAGE_PIN N20 [get_ports I_Mipi_ls_Clk_n]
set_property PACKAGE_PIN G17 [get_ports O_Mipi_ls_GPIO]
set_property PACKAGE_PIN H20 [get_ports O_Mipi_I2C_SCL]
set_property PACKAGE_PIN G13 [get_ports IO_Mipi_I2C_SDA]



set_property PACKAGE_PIN J19 [get_ports I_Mipi_phy_clk_p]
set_property PACKAGE_PIN N18 [get_ports {I_Mipi_phy_lane_p[1]}]
set_property PACKAGE_PIN N22 [get_ports {I_Mipi_phy_lane_p[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports I_Mipi_ls_Clk_p]
set_property IOSTANDARD LVCMOS33 [get_ports I_Mipi_ls_Clk_n]
set_property IOSTANDARD LVCMOS33 [get_ports O_Mipi_I2C_SCL]
set_property IOSTANDARD LVCMOS33 [get_ports IO_Mipi_I2C_SDA]
set_property IOSTANDARD LVCMOS33 [get_ports O_Mipi_ls_GPIO]
set_property IOSTANDARD LVCMOS33 [get_ports {I_Mipi_ls_Data_n[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {I_Mipi_ls_Data_n[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {I_Mipi_ls_Data_p[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {I_Mipi_ls_Data_p[0]}]



