`timescale  1ns / 1ps

module tb_Mipi_Bayer_2_RGB;

// Mipi_Bayer_2_RGB Parameters
parameter PERIOD       = 10                   ;
parameter Image_width  = 1920                 ;
parameter Image_Higth  = 1080                 ;
parameter Pixel_Num    = 4                    ;
parameter Col_Max      = Image_width/Pixel_Num;
parameter I_w          = 40                   ;

// Mipi_Bayer_2_RGB Inputs
reg   I_CLK                                = 0 ;
reg   I_Rst_n                              = 0 ;
reg   I_Mipi_Unpacket_V_sync               = 0 ;
reg   [I_w-1:0]  I_Mipi_raw10_depacker_Data = 0 ;
reg   I_Mipi_raw10_depacker_Vaild          = 0 ;

// Mipi_Bayer_2_RGB Outputs
wire          O_RGB_Vaild                  ;
wire  [63:0]  O_RGB_Data                   ;


initial begin
    I_CLK = 0;
end
always #5 I_CLK = ~ I_CLK;

Mipi_Bayer_2_RGB #(
    .Image_width ( Image_width ),
    .Image_Higth ( Image_Higth ),
    .Pixel_Num   ( Pixel_Num   ),
    .Col_Max     ( Col_Max     ),
    .I_w         ( I_w         ))
 u_Mipi_Bayer_2_RGB (
    .I_CLK                        ( I_CLK                       ),
    .I_Rst_n                      ( I_Rst_n                     ),
    .I_Mipi_Unpacket_V_sync       ( I_Mipi_Unpacket_V_sync      ),
    .I_Mipi_raw10_depacker_Data   ( I_Mipi_raw10_depacker_Data  ),
    .I_Mipi_raw10_depacker_Vaild  ( I_Mipi_raw10_depacker_Vaild ),
 
    .O_RGB_Vaild                  ( O_RGB_Vaild                 ),
    .O_RGB_Data                   ( O_RGB_Data                  )
);

initial
begin
    I_Rst_n <= 0;
    I_Mipi_Unpacket_V_sync      <= 'd0;
    I_Mipi_raw10_depacker_Data  <= 'd0;
    I_Mipi_raw10_depacker_Vaild <= 'd0;
    repeat(10) @(posedge I_CLK);
        I_Rst_n <= 1'b1;
    repeat(10) @(posedge I_CLK);
        Write_Lane;
end

    reg [9:0] R = 10'h0;
    reg [9:0] G = 10'h0;
    reg [9:0] B = 10'h0;
always @(posedge I_CLK or negedge I_Rst_n) begin
    if(I_Rst_n == 1'b0) begin
        R <= 10'h0;
        G <= 10'h0;
        B <= 10'h0;
    end else begin
        R <= R + 1'b1;
        G <= R + 2'd2;
        B <= R + 2'd3;
    end
end

task Write_Lane();
    integer i;
    integer j;
    begin
        for(j=0;j<1080;j=j+1) begin
            if(i == 0) begin
                I_Mipi_Unpacket_V_sync <= 1'b1;
            end else begin
                I_Mipi_Unpacket_V_sync <= 1'b0;
            end
            for(i=0;i<500;i=i+1) begin 
                @(posedge I_CLK)
                if(i < 20) begin
                    I_Mipi_raw10_depacker_Vaild <= 1'b0;
                    I_Mipi_raw10_depacker_Data  <= 'd0 ;
                end else if(i>20) begin
                    I_Mipi_raw10_depacker_Vaild <= 1'b1;
                    if(u_Mipi_Bayer_2_RGB.Pixel_flag == 1'b0) begin
                        I_Mipi_raw10_depacker_Data  <= {B,G,B,G};
                    end else begin
                        I_Mipi_raw10_depacker_Data  <= {G,R,G,R};
                    end
                end
            end
        end
    end
endtask

endmodule