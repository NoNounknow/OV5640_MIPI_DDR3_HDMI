`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/27 22:56:38
// Design Name: 
// Module Name: data_joint
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module data_joint #(
	parameter IW_WIDTH=16,
	parameter OW_WIDTH=64
)
(	
	input 						clk			,
	input                   	rst_n		,
	input           			i_data_de   ,
	input 		 [IW_WIDTH-1:0]	i_data		,
	output  reg     			o_data_de   ,            
	output  reg  [OW_WIDTH-1:0] o_data		
);

reg  [7:0] cnt;


localparam num = OW_WIDTH/IW_WIDTH;

always@(posedge clk)
	if(!rst_n)
		cnt <= 8'd0;
	else if(cnt==num-1&&i_data_de)
		cnt <= 8'd0;
	else if(i_data_de==1'b1&&num>1)
		cnt <= cnt + 1'b1;
	else
		cnt <= cnt;

always@(posedge clk)
	if(!rst_n)
		o_data <= {OW_WIDTH{1'b0}};
	else if(i_data_de==1'b1&&num>1)
		o_data <= {o_data[OW_WIDTH-IW_WIDTH-1:0],i_data};
	else if(num==1)
		o_data <= i_data;
	else
		o_data <= o_data;
		
always@(posedge clk)
	if(!rst_n)
		o_data_de <= 1'b0;
	else if(cnt==num-1&&i_data_de&&num>1)
		o_data_de <= 1'b1;
	else if(num==1)
		o_data_de <= i_data_de;		
	else
		o_data_de <= 1'b0;	


endmodule
