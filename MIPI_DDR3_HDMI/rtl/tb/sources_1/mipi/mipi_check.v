/*
* mipi_check模块验证思路：
* 对解析出的图像数据量进行验证，定义计数器：row_cnt 
*
*
*
* 
*/
module  mipi_check(
        // system signals
        input                   sclk                    ,       
        input                   s_rst_n                 ,       
        // 
        input                   raw_vld                 ,       
        input           [15:0]  raw_data                ,
        input                   raw_vsync               ,
        // MIPI 
        input           [ 7:0]  lane0_data              ,
        input           [ 7:0]  lane1_data              ,
        input           [ 7:0]  lane0_byte_data         ,
        input                   lane0_byte_vld          ,
        input           [ 7:0]  lane1_byte_data         ,
        input                   lane1_byte_vld          ,
        input           [15:0]  word_data               ,
        input                   word_vld                ,
        input                   invalid_start           ,
        input                   packet_done           
        
);

ila_0 ila_0 (
	.clk(sclk), // input wire clk


	.probe0(raw_vld), // input wire [7:0]  probe0  
	.probe1(raw_data), // input wire [7:0]  probe1
	.probe2(raw_vsync), // input wire [7:0]  probe1
	.probe3(row_cnt), // input wire [7:0]  probe1
	.probe4(raw_vld_pos), // input wire [7:0]  probe1
	.probe5(row_err), // input wire [7:0]  probe1
	.probe6(row_err_cnt), // input wire [7:0]  probe1
	.probe7(lane0_data       ), // input wire [7:0]  probe1
	.probe8(lane1_data       ), // input wire [7:0]  probe1
	.probe9(lane0_byte_data  ), // input wire [7:0]  probe1
	.probe10(lane0_byte_vld   ), // input wire [7:0]  probe1
	.probe11(lane1_byte_data  ), // input wire [7:0]  probe1
	.probe12(lane1_byte_vld   ), // input wire [7:0]  probe1
	.probe13(word_data        ), // input wire [7:0]  probe1
	.probe14(word_vld         ), // input wire [7:0]  probe1
	.probe15(invalid_start    ), // input wire [7:0]  probe1
	.probe16(packet_done      ) // input wire [7:0]  probe1

);
//========================================================================\
// =========== Define Parameter and Internal signals =========== 
//========================================================================/

reg     [15:0]                  row_cnt                         ;       

reg                             raw_vld_r1                      ;

wire                            raw_vld_pos                     ;

reg                             row_err                         ;       
reg     [ 7:0]                  row_err_cnt                     ;
//=============================================================================
//**************    Main Code   **************
//=============================================================================
always  @(posedge sclk) begin
        raw_vld_r1      <=      raw_vld;
end

assign  raw_vld_pos     =       ~raw_vld_r1 & raw_vld;

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                row_cnt <=      'd0;
        else if(raw_vsync == 1'b1)
                row_cnt <=      'd0;
        else if(raw_vld_pos == 1'b1)
                row_cnt <=      row_cnt + 1'b1;
end

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                row_err <=      1'b0;
        else if(raw_vsync == 1'b1 && row_cnt != 'd1080)
                row_err <=      1'b1;
        else
                row_err <=      1'b0;
end

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                row_err_cnt     <=      'd0;
        else if(row_err == 1'b1)
                row_err_cnt     <=      row_err_cnt + 1'b1;
end




endmodule
