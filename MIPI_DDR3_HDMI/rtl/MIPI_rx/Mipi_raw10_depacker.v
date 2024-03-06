//Raw10 to RGB
module Mipi_raw10_depacker (
    input   wire           I_CLK   ,
    input   wire           I_Rst_n ,
    input   wire [16-1:0]  I_Mipi_Unpacket_Data  ,
    input   wire           I_Mipi_Unpacket_Vaild ,
    input   wire           I_Mipi_Sync           ,
    output  wire [40-1:0]  O_Mipi_raw10_depacker_Data  ,
    output  wire           O_Mipi_raw10_depacker_Vaild  
);
    //--------------------------------Port Define------------------------------------------------------//
            reg  [2:0]      Pixl_Cnt                ;
            reg  [15:0]     r1_Unpacket_Data        ;
            reg  [15:0]     r2_Unpacket_Data        ;
            reg  [31:0]     rr_Unpacket_Data        ;
            reg             r_O_Mipi_raw10_depacker_Vaild ;
            reg             Frame_Begin             ;
        //Raw10
            reg  [9:0]      SIGN_A; 
            reg  [9:0]      SIGN_B;
            reg  [9:0]      SIGN_C;
            reg  [9:0]      SIGN_D;
    //--------------------------------Port Define------------------------------------------------------//

    //--------------------------------Main Code-------------------------------------------------------//

    //Frame_Begin
    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0) begin
            Frame_Begin <= 1'b0;
        end else if(I_Mipi_Sync == 1'b1) begin
            Frame_Begin <= 1'b1;
        end
    end

    //Pixl_Cnt
    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0) begin
            Pixl_Cnt <= 3'd0;
        end else if((Frame_Begin == 1'b1) && (I_Mipi_Unpacket_Vaild == 1'b1)) begin
            if(Pixl_Cnt == 3'd4) begin 
                Pixl_Cnt <= 3'd0;
            end else begin
                Pixl_Cnt <= Pixl_Cnt + 1'b1;
            end
        end 
    end

    //r_Unpacket_Data
    always @(posedge I_CLK) begin
        rr_Unpacket_Data <= {I_Mipi_Unpacket_Data,rr_Unpacket_Data[16+:16]};
    end

    //r_O_Mipi_raw10_depacker_Vaild
    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0) begin
            r_O_Mipi_raw10_depacker_Vaild <= 1'b0;
        end else if(Frame_Begin == 1'b1 && I_Mipi_Unpacket_Vaild == 1'b1 &&((Pixl_Cnt == 3'd2)|(Pixl_Cnt == 3'd4))) begin
            r_O_Mipi_raw10_depacker_Vaild <= 1'b1;
        end else begin
            r_O_Mipi_raw10_depacker_Vaild <= 1'b0;
        end
    end

    assign  O_Mipi_raw10_depacker_Data  = {SIGN_A,
                                           SIGN_B,
                                           SIGN_C,
                                           SIGN_D};
    assign  O_Mipi_raw10_depacker_Vaild = r_O_Mipi_raw10_depacker_Vaild   ;    

    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0) begin
            SIGN_A  <= 10'd0;
            SIGN_B  <= 10'd0;
            SIGN_C  <= 10'd0;
            SIGN_D  <= 10'd0;
        end else if(Frame_Begin == 1'b1) begin
            if((Pixl_Cnt == 3'd2) && (I_Mipi_Unpacket_Vaild == 1'b1)) begin
                SIGN_A <= {rr_Unpacket_Data[00+:8],I_Mipi_Unpacket_Data[0+:2]};
                SIGN_B <= {rr_Unpacket_Data[08+:8],I_Mipi_Unpacket_Data[2+:2]};
                SIGN_C <= {rr_Unpacket_Data[16+:8],I_Mipi_Unpacket_Data[4+:2]};
                SIGN_D <= {rr_Unpacket_Data[24+:8],I_Mipi_Unpacket_Data[6+:2]};
            end else if((Pixl_Cnt == 3'd4) && (I_Mipi_Unpacket_Vaild == 1'b1)) begin
                SIGN_A <= {rr_Unpacket_Data[08+:8],I_Mipi_Unpacket_Data[8+:2]};
                SIGN_B <= {rr_Unpacket_Data[16+:8],I_Mipi_Unpacket_Data[10+:2]};
                SIGN_C <= {rr_Unpacket_Data[24+:8],I_Mipi_Unpacket_Data[12+:2]};
                SIGN_D <= {I_Mipi_Unpacket_Data[00+:8],I_Mipi_Unpacket_Data[14+:2]};
            end
        end 
    end
    //--------------------------------Main Code-------------------------------------------------------//
endmodule
