`timescale  1ns / 1ps
module tb_Mipi_Byte_Alignment;
// Mipi_Byte_Alignment Parameters
parameter Clock_Period  = 20;

// Mipi_Byte_Alignment Inputs
reg          I_CLK                 ;
reg          I_Rst_n               ;
reg   [7:0]  I_Mipi_CSI_Byte_Data  ;
reg          I_ReSearch_Offset     ;

// Mipi_Byte_Alignment Outputs
wire  [7:0]  O_Mipi_Byte_Alignment         ;
wire  O_Mipi_Byte_Alignment_Vaild          ;

initial I_CLK = 0;
always #(Clock_Period/2) I_CLK = ~ I_CLK;

Mipi_Byte_Alignment  u_Mipi_Byte_Alignment (
    .I_CLK                        ( I_CLK                      ),
    .I_Rst_n                      ( I_Rst_n                    ),
    .I_Mipi_CSI_Byte_Data         ( I_Mipi_CSI_Byte_Data       ),
    .I_ReSearch_Offset            ( I_ReSearch_Offset          ),

    .O_Mipi_Byte_Alignment_Data   ( O_Mipi_Byte_Alignment      ),
    .O_Mipi_Byte_Alignment_Vaild  ( O_Mipi_Byte_Alignment_Vaild)
);

initial
begin
    I_Rst_n              <= 'd0;
    I_Mipi_CSI_Byte_Data <= 'd0;
    I_ReSearch_Offset    <= 'd0;
    repeat(10) @(posedge I_CLK);
    I_Rst_n <= 1'b1;
    repeat(10) @(posedge I_CLK);
    I_Mipi_CSI_Byte_Data <= 8'ha8;
    repeat(1) @(posedge I_CLK);
    I_Mipi_CSI_Byte_Data <= 8'hc6;
    repeat(1) @(posedge I_CLK);
    I_Mipi_CSI_Byte_Data <= 8'ha5;
    repeat(1) @(posedge I_CLK);
    I_Mipi_CSI_Byte_Data <= 8'hbc;
    repeat(1) @(posedge I_CLK);
    I_Mipi_CSI_Byte_Data <= 8'ha8;
    repeat(1) @(posedge I_CLK);
    I_Mipi_CSI_Byte_Data <= 8'hc6;
    repeat(1) @(posedge I_CLK);
    I_Mipi_CSI_Byte_Data <= 8'ha5;
    repeat(1) @(posedge I_CLK);
    I_Mipi_CSI_Byte_Data <= 8'hbc;
    repeat(10) @(posedge I_CLK);
    I_ReSearch_Offset    <= 1'b1;
    repeat(100) @(posedge I_CLK);
    repeat(1) @(posedge I_CLK);
    I_Mipi_CSI_Byte_Data <= 8'hbc;
    repeat(1) @(posedge I_CLK);
    I_Mipi_CSI_Byte_Data <= 8'ha8;
    repeat(1) @(posedge I_CLK);
    I_Mipi_CSI_Byte_Data <= 8'hc6;
    repeat(1) @(posedge I_CLK);
    I_Mipi_CSI_Byte_Data <= 8'ha5;
    repeat(1) @(posedge I_CLK);
    I_Mipi_CSI_Byte_Data <= 8'hbc;
end

endmodule