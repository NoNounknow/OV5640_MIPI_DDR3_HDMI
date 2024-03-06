module Mipi_Byte_Alignment (
    input   wire    I_CLK   ,
    input   wire    I_Rst_n ,
    //Mipi_dphy_rx
    input   wire    [7:0]   I_Mipi_CSI_Byte_Data       ,
    output  wire    [7:0]   O_Mipi_Byte_Alignment_Data ,
    output  wire            O_Mipi_Byte_Alignment_Vaild,
    input   wire            I_ReSearch_Offset      
);
//-----------Parameter & Port Define----------------------------------------------------------//
    localparam  SoT = 8'hB8;
            reg    [ 7:0]   r_Byte_data_delay_0   ;
            reg    [ 7:0]   r_Byte_data_delay_1   ;
        //Concat
           wire    [15:0]   Concat_Byte_data   ;
        //Offset  
            reg    [ 3:0]   Byte_Offset        ;  
        //Lock
            reg             ReSearch_delay     ;
            reg             Search_Locking     ;
            reg    [ 7:0]   r_O_Mipi_Byte_Alignment_Data ;
//-----------Parameter & Port Define----------------------------------------------------------//
    
    //delay & Concat
    always @(posedge I_CLK) begin
        {r_Byte_data_delay_0, r_Byte_data_delay_1}  <= {I_Mipi_CSI_Byte_Data, r_Byte_data_delay_0};
    end
    assign  Concat_Byte_data = {r_Byte_data_delay_0,r_Byte_data_delay_1};
    always @(posedge I_CLK) begin
        ReSearch_delay <= {ReSearch_delay,I_ReSearch_Offset};
    end
    
    //O_Mipi_Byte_Alignment_Vaild & Byte_Offset
    assign  O_Mipi_Byte_Alignment_Vaild = Search_Locking;

    //Search_Byte_Offset
    reg [3:0]   i;
    always @(posedge I_CLK or negedge I_Rst_n) begin
        if(I_Rst_n == 1'b0) begin
            Byte_Offset <= 4'b0;
            Search_Locking <= 1'b0;
        end else if(!ReSearch_delay && I_ReSearch_Offset) begin
            Byte_Offset <= 4'b0;
            Search_Locking <= 1'b0;
        end else if(Search_Locking == 1'b0) begin
            for(i=8'h0;i<8;i=i+1) begin
                if(Concat_Byte_data[(i+1'b1)+:8] == SoT) begin
                    Byte_Offset <= i[2:0] + 1'b1;
                    Search_Locking <= 1'b1;
                end
            end
        end
    end

    reg [15:0]  Concat_Byte_data_delay;
    always @(posedge I_CLK) begin
        Concat_Byte_data_delay = Concat_Byte_data;
    end

    assign O_Mipi_Byte_Alignment_Data = r_O_Mipi_Byte_Alignment_Data;

    always @(*) begin
        r_O_Mipi_Byte_Alignment_Data <= Concat_Byte_data_delay[Byte_Offset+:8];
    end
endmodule