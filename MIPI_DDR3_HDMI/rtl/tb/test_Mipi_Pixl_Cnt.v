module test_Mipi_Pixl_Cnt #(
    parameter   Lane_Num = 2,
    parameter   Byte_w   = 8,
    parameter   Lane_Width = Lane_Num*Byte_w,
    parameter   Image_H = 1080,
    parameter   Image_W = 1920
)(
    input   wire          I_CLK   ,
    input   wire          I_Rst_n ,
    input   wire  [15:0]  I_Mipi_Unpacket_Data  ,
    input   wire          I_Mipi_Unpacket_Vaild ,
    input   wire          I_Mipi_Unpacket_V_sync,
    output  reg           error                 ,
    output  reg   [9:0]   error_Cnt             ,
    output  reg   [15:0]  Frame_V_Count         ,
    output  wire          V_sync_Pose
);
    //V_sync
    reg         r_V_sync     ;
    reg         r_Unpacket_Vaild;

    assign  V_sync_Pose = (!r_V_sync && I_Mipi_Unpacket_V_sync);
    always @(posedge I_CLK) begin
        r_V_sync         <= I_Mipi_Unpacket_V_sync;
        r_Unpacket_Vaild <= I_Mipi_Unpacket_Vaild ;
    end
    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0) begin
            Frame_V_Count <= 12'd0;
        end else if((Frame_V_Count == Image_H) && (!r_Unpacket_Vaild && I_Mipi_Unpacket_Vaild)) begin
            Frame_V_Count <= 12'd0; 
        end else if((!r_V_sync && I_Mipi_Unpacket_V_sync) && (Frame_V_Count <= 12'd0))begin
            Frame_V_Count <= 12'd1;
        end else if(Frame_V_Count > 0) begin
            if(!r_Unpacket_Vaild && I_Mipi_Unpacket_Vaild) begin
                Frame_V_Count <= Frame_V_Count + 1'b1;
            end else begin
                Frame_V_Count <= Frame_V_Count;
            end
        end
    end

    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0) begin
            error <= 1'b0;
        end else if((Frame_V_Count != 0) && (V_sync_Pose)) begin
            error <= 1'b1;
        end else begin
            error <= 1'b0;
        end
    end

    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0) begin
            error_Cnt <= 1'b0;
        end else if(error == 1'b1) begin
            error_Cnt <= error_Cnt + 1'b1;
        end
    end
endmodule