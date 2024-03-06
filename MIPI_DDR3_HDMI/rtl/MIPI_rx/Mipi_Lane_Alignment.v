module Mipi_Lane_Alignment (
    input   wire    I_CLK   ,
    input   wire    I_Rst_n ,
    //Byte_Alignment_Data
    input   wire    [7:0]   I_Mipi_Byte_Alignment_Data_0 ,
    input   wire            I_Mipi_Byte_Alignment_Vaild_0,
    input   wire    [7:0]   I_Mipi_Byte_Alignment_Data_1 ,
    input   wire            I_Mipi_Byte_Alignment_Vaild_1,
    input   wire            I_Mipi_Unpacket_done         ,
    //Lane_Alignment_Data
    output  wire    [15:0]  O_Mipi_Lane_Alignment_Data   ,
    output  reg             O_ReSearch_Offset_Lane       ,
    output  wire            O_Mipi_Lane_Alignment_Vaild
);
    //--------------------Port Define-----------------------------------------------//
    localparam Lane0_First = 2'b10;
    localparam Lane1_First = 2'b01;
    localparam Both_timing = 2'b11;
            wire            Vaild_Or    ;   
            wire            Vaild_And   ;
            reg             r_Vaild_Or  ;
           wire             Vaild_Or_Posedge  ;  
            reg             r_Vaild_Or_Posedge;
            reg     [15:0]  r_lane0_data;
            reg     [15:0]  r_lane1_data;
            reg     [ 1:0]  Flag        ;
    //--------------------Port Define-----------------------------------------------//

    //Vaild_Or
    assign  Vaild_And = (I_Mipi_Byte_Alignment_Vaild_0) & ( I_Mipi_Byte_Alignment_Vaild_1);
    assign  Vaild_Or  = (I_Mipi_Byte_Alignment_Vaild_0) | (I_Mipi_Byte_Alignment_Vaild_1);
    assign  Vaild_Or_Posedge = (!r_Vaild_Or) && Vaild_Or;

    always @(posedge I_CLK) begin
        r_Vaild_Or                      <= Vaild_Or        ; 
        r_Vaild_Or_Posedge              <= Vaild_Or_Posedge;
    end

    //Data_in delay
    always @(posedge I_CLK) begin
            r_lane0_data <= {r_lane0_data[7:0], I_Mipi_Byte_Alignment_Data_0};
            r_lane1_data <= {r_lane1_data[7:0], I_Mipi_Byte_Alignment_Data_1};
    end

    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0) begin
            Flag <= 2'd0;
        end else if(Vaild_Or_Posedge == 1'b1) begin
            Flag <= {I_Mipi_Byte_Alignment_Vaild_0,I_Mipi_Byte_Alignment_Vaild_1};
        end else begin
            Flag <= Flag;
        end
    end

    //O_Mipi_Lane_Alignment_Vaild
    reg             r_O_Mipi_Lane_Alignment_Vaild;
    reg  [15:0]     r_O_Mipi_Lane_Alignment_Data ;

    assign  O_Mipi_Lane_Alignment_Vaild = r_O_Mipi_Lane_Alignment_Vaild;
    assign  O_Mipi_Lane_Alignment_Data  = r_O_Mipi_Lane_Alignment_Data ;

    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0) begin
            r_O_Mipi_Lane_Alignment_Vaild <= 1'd0;
        end else if(I_Mipi_Unpacket_done == 1'b1) begin
             r_O_Mipi_Lane_Alignment_Vaild <= 1'd0;
        end else if(r_Vaild_Or_Posedge == 1'b1 && Vaild_And == 1'b1) begin
            r_O_Mipi_Lane_Alignment_Vaild <= 1'b1;
        end
    end

    //O_Mipi_Lane_Alignment_Data
    always @(*) begin
            case (Flag)
                Lane0_First:begin
                    r_O_Mipi_Lane_Alignment_Data <= {r_lane1_data[7:0], r_lane0_data[15:8]};
                end 
                Lane1_First:begin
                    r_O_Mipi_Lane_Alignment_Data <= {r_lane1_data[15:8], r_lane0_data[7:0]};
                end 
                Both_timing:begin
                    r_O_Mipi_Lane_Alignment_Data <= {r_lane1_data[15:8],  r_lane0_data[15:8]};
                end
                default: begin
                    r_O_Mipi_Lane_Alignment_Data <= {r_lane1_data[7:0], r_lane0_data[7:0]};
                end
            endcase
    end

    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 'd0) begin
            O_ReSearch_Offset_Lane <= 1'b0;
        end else if(Vaild_Or_Posedge == 1'b1) begin
            O_ReSearch_Offset_Lane <= 1'b0;
        end else if(r_Vaild_Or_Posedge == 1'b1 && Vaild_And == 1'b0) begin
            O_ReSearch_Offset_Lane <= 1'b1;
        end
    end 
endmodule
