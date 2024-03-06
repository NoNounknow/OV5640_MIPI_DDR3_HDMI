module Mipi_Unpacket #(
    parameter   Lane_Num = 2,
    parameter   Byte_w   = 8,
    parameter   Lane_Width = Lane_Num*Byte_w,
    parameter   Image_H = 1080,
    parameter   Image_W = 1920
)(
    input   wire          I_CLK   ,
    input   wire          I_Rst_n ,
//I_Mipi_Lane
    input   wire [Lane_Width - 1:0]        I_Mipi_Lane_Alignment_Data   ,
    input   wire                           I_Mipi_Lane_Alignment_Vaild  ,
    output  wire [Lane_Width-1:0]          O_Mipi_Unpacket_Data         ,
    output  wire                           O_Mipi_Unpacket_Vaild        ,
    output  wire                           O_Mipi_Unpacket_done         ,
    output  wire                           O_Mipi_Unpacket_V_sync       
);
    //--------------------------------Port Define------------------------------------------------------//
    //Start Flag
    localparam  SoT = 8'hB8;
    //Format
    localparam  Raw10 = 6'h2B;
    localparam  Frame_Start_Code = 6'h00;
    localparam  Frame_End_Code = 6'h01;
        //Vaild
            reg                         r_Mipi_Lane_Alignment_Vaild     ;
           wire                         Pose_Mipi_Lane_Alignment_Vaild  ;
            reg [2:0]                   r_Pose_Mipi_Lane_Alignment_Vaild;
            reg [Lane_Width - 1:0]      r_Mipi_Lane_Alignment_Data      ;
           wire [31:0]                  Concat_Data                     ;
        //DI & WC & ECC_Num
            reg [7:0]                   Data_ID               ;
           wire [1:0]                   Visual_Channl_ID      ;
           wire [5:0]                   Data_Type             ;           
            reg [15:0]                  Word_Count            ;
            reg [7:0]                   ECC_Num               ;

    //--------------------------------Port Define------------------------------------------------------//

    //--------------------------------Main Code-------------------------------------------------------//

    //r_Mipi_Lane_Alignment_Vaild
    //I_Mipi_Lane_Alignment_Data
    assign  Pose_Mipi_Lane_Alignment_Vaild = (!r_Mipi_Lane_Alignment_Vaild) & I_Mipi_Lane_Alignment_Vaild;
    always @(posedge I_CLK) begin
        r_Mipi_Lane_Alignment_Vaild      <= I_Mipi_Lane_Alignment_Vaild;
        r_Pose_Mipi_Lane_Alignment_Vaild <= {r_Pose_Mipi_Lane_Alignment_Vaild[2:0],Pose_Mipi_Lane_Alignment_Vaild};
        r_Mipi_Lane_Alignment_Data       <= I_Mipi_Lane_Alignment_Data;
    end

    //Concat_Data
    assign  Concat_Data = {I_Mipi_Lane_Alignment_Data, r_Mipi_Lane_Alignment_Data};
    always @(*) begin
            Data_ID    <= Concat_Data[ 0+: 8];
            Word_Count <= Concat_Data[ 8+:16];
            ECC_Num    <= Concat_Data[24+: 8];
    end

    //ECC_Calculate
    wire [23:0]                  I_ECC_Calculate_Data  ;
    wire [7:0]                   O_ECC_Calculate_Result;

    assign  I_ECC_Calculate_Data = {Word_Count, Data_ID};  
    
    //------------------------------------------Instance-----------------------------------------------//
    ECC_Calculate_Haming #(
        .Data_bit_width      ( 24 ),
        .Redundant_bit_width ( 8  ))
    ECC_Calculate_Haming_Inst0 (
        .I_Data                  ( I_ECC_Calculate_Data  ),

        .O_ECC                   ( O_ECC_Calculate_Result) 
    );
    //------------------------------------------Instance-----------------------------------------------//

    //Data_ID
    assign  Visual_Channl_ID = Data_ID[7:6];
    assign  Data_Type        = Data_ID[5:0];

    //O_Mipi_Unpacket_Vaild
    reg         r_O_Mipi_Unpacket_Vaild;
    reg [11:0]  Unpacket_Data_Count    ; 

    assign  O_Mipi_Unpacket_Data  = (r_O_Mipi_Unpacket_Vaild)?(I_Mipi_Lane_Alignment_Data):16'h0;
    assign  O_Mipi_Unpacket_Vaild = r_O_Mipi_Unpacket_Vaild   ;

    reg [15:0]  Word_Count_Max;
    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0)  begin
            Word_Count_Max <= 16'b0;
        end else if((I_Mipi_Lane_Alignment_Vaild == 1'b1) && (r_Pose_Mipi_Lane_Alignment_Vaild[1] == 1'b1)) begin
            if(Data_Type == Raw10 && O_ECC_Calculate_Result == ECC_Num) begin
                Word_Count_Max <= Word_Count;
            end else begin
                Word_Count_Max <= Word_Count_Max;
            end
        end
    end
    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0)  begin
            r_O_Mipi_Unpacket_Vaild <= 1'b0;
        end else if((I_Mipi_Lane_Alignment_Vaild == 1'b1) && (Unpacket_Data_Count == (Word_Count_Max >>1)-1'b1)) begin
            r_O_Mipi_Unpacket_Vaild <= 1'b0;
        end else if((I_Mipi_Lane_Alignment_Vaild == 1'b1) && (r_Pose_Mipi_Lane_Alignment_Vaild[1] == 1'b1)) begin
            if(Data_Type == Raw10 && O_ECC_Calculate_Result == ECC_Num) begin
                r_O_Mipi_Unpacket_Vaild <= 1'b1;
            end else begin
                r_O_Mipi_Unpacket_Vaild <= r_O_Mipi_Unpacket_Vaild;
            end
        end
    end
    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0)  begin
            Unpacket_Data_Count <= 11'd0;
        end else if(O_Mipi_Unpacket_Vaild == 1'b1) begin
            if(Unpacket_Data_Count == (Word_Count_Max >>1)-1'b1) begin
                Unpacket_Data_Count <= 11'd0;
            end else begin
                Unpacket_Data_Count <= Unpacket_Data_Count + 1'b1;
            end
        end else begin
            Unpacket_Data_Count <= 11'd0;
        end
    end

    //O_Mipi_Unpacket_done
    reg         r_O_Mipi_Unpacket_done;

    assign  O_Mipi_Unpacket_done = r_O_Mipi_Unpacket_done;

    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0)  begin
            r_O_Mipi_Unpacket_done <= 1'b0;
        end else if(r_Pose_Mipi_Lane_Alignment_Vaild[1] == 1'b1) begin
            if((O_ECC_Calculate_Result != ECC_Num) | (Data_Type != Raw10)) begin
                r_O_Mipi_Unpacket_done <= 1'b1;
            end else begin
                r_O_Mipi_Unpacket_done <= 1'b0;
            end
        end else if((O_Mipi_Unpacket_Vaild == 1'b1) && (Unpacket_Data_Count == (Word_Count_Max >>1)-1'b1)) begin
            r_O_Mipi_Unpacket_done <= 1'b1;
        end else begin
            r_O_Mipi_Unpacket_done <= 1'b0;
        end
    end

    //V_sync
    reg     r_V_sync;
    assign  O_Mipi_Unpacket_V_sync = r_V_sync;
    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0)  begin
            r_V_sync <= 1'b0;
        end else if((I_Mipi_Lane_Alignment_Vaild == 1'b1) && (r_Pose_Mipi_Lane_Alignment_Vaild[1] == 1'b1)) begin
            if((O_ECC_Calculate_Result == ECC_Num) && (Data_Type == Frame_Start_Code)) begin
                r_V_sync <= 1'b1;
            end else begin
                r_V_sync <= 1'b0;
            end 
        end else begin
            r_V_sync <= 1'b0;
        end
    end
    
    // //O_Mipi_Unpacket_Frame_end
    // reg     Frame_end;
    // assign  O_Mipi_Unpacket_Frame_end = Frame_end;
    // always @(posedge I_CLK or negedge I_Rst_n) begin
    //     if(I_Rst_n == 1'b0)  begin
    //         Frame_end <= 1'b0;
    //     end else if((I_Mipi_Lane_Alignment_Vaild == 1'b1) && (r_Pose_Mipi_Lane_Alignment_Vaild[1] == 1'b1)) begin
    //         if((O_ECC_Calculate_Result == ECC_Num) && (Data_Type == Frame_End_Code)) begin
    //             Frame_end <= 1'b1;
    //         end else begin
    //             Frame_end <= 1'b0;
    //         end 
    //     end else begin
    //         Frame_end <= 1'b0;
    //     end
    // end
    //--------------------------------Main Code-------------------------------------------------------//
endmodule