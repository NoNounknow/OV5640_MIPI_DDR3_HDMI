`timescale 1ns / 1ps
`define Clock_Period 10
module tb_Mipi_SIM;
// MIPI_SIM_top Inputs
    reg           I_Top_Rst_n             ;
    reg           Mipi_CSI_Byte_CLK       ;
    wire   [7:0]  Mipi_CSI_Byte_Lane0_Data;
    wire   [7:0]  Mipi_CSI_Byte_Lane1_Data;
    // MIPI_SIM_top Outputs
    wire  [15:0]  Mipi_Unpacket_Data      ;
    wire          Mipi_Unpacket_Vaild     ;
    wire          Mipi_Unpacket_done      ;
    wire          Mipi_Unpacket_V_sync    ;

    reg   [7:0]   Lane0_Read [2047:0];
    reg   [7:0]   Lane1_Read [2047:0];
    reg   [10:0]  index              ;

initial begin
    Mipi_CSI_Byte_CLK = 1'b0;
end
always #(`Clock_Period/2) Mipi_CSI_Byte_CLK = ~ Mipi_CSI_Byte_CLK;

initial begin
    $readmemh ( "D:/three_verilog/MIPI_DDR3_HDMI/sim/MIPI_trans/MIPI_trans.srcs/sim_1/new/lane0.txt", 
    Lane0_Read) ;
    $readmemh ( "D:/three_verilog/MIPI_DDR3_HDMI/sim/MIPI_trans/MIPI_trans.srcs/sim_1/new/lane1.txt", 
    Lane1_Read) ;
end

initial begin
    I_Top_Rst_n <= 1'b0;
    repeat(10) @(posedge Mipi_CSI_Byte_CLK);
    I_Top_Rst_n <= 1'b1;
end
    always@(posedge Mipi_CSI_Byte_CLK or negedge I_Top_Rst_n) begin
        if(I_Top_Rst_n == 1'b0) begin
            index <= 'd0;
        end else begin
            index <= index + 1'b1;
        end
    end
    assign Mipi_CSI_Byte_Lane0_Data = Lane0_Read[index];
    assign Mipi_CSI_Byte_Lane1_Data = Lane1_Read[index];
    
    MIPI_SIM_top  u_MIPI_SIM_top (
        .I_Top_Rst_n               ( I_Top_Rst_n              ),
        .Mipi_CSI_Byte_CLK         ( Mipi_CSI_Byte_CLK        ),
        .Mipi_CSI_Byte_Lane0_Data  ( Mipi_CSI_Byte_Lane0_Data ),
        .Mipi_CSI_Byte_Lane1_Data  ( Mipi_CSI_Byte_Lane1_Data ),

        .Mipi_Unpacket_Data        ( Mipi_Unpacket_Data       ),
        .Mipi_Unpacket_Vaild       ( Mipi_Unpacket_Vaild      ),
        .Mipi_Unpacket_done        ( Mipi_Unpacket_done       ),
        .Mipi_Unpacket_V_sync      ( Mipi_Unpacket_V_sync     )
    );

endmodule
 