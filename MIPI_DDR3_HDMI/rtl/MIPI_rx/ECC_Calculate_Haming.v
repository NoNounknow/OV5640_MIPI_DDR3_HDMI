module ECC_Calculate_Haming #(
    parameter  Data_bit_width      = 24,
    parameter  Redundant_bit_width =  8
)(
    input   wire    [Data_bit_width -1:0]        I_Data        ,
    output  wire    [Redundant_bit_width-1:0]    O_ECC         
);
            reg     [Redundant_bit_width-1:0]    r_O_ECC;     
            assign O_ECC = r_O_ECC;
    always@(*) begin
            r_O_ECC[7] <= 1'b0;
            r_O_ECC[6] <= 1'b0;
            r_O_ECC[5] <= ^{I_Data[10], I_Data[11], I_Data[12], I_Data[13], I_Data[14], I_Data[15], 
                          I_Data[16], I_Data[17], I_Data[18], I_Data[19], I_Data[21], I_Data[22], I_Data[23]};
            r_O_ECC[4] <= ^{I_Data[ 4], I_Data[ 5], I_Data[ 6], I_Data[ 7], I_Data[ 8], I_Data[ 9], 
                          I_Data[16], I_Data[17], I_Data[18], I_Data[19], I_Data[20], I_Data[22], I_Data[23]};
            r_O_ECC[3] <= ^{I_Data[ 1], I_Data[ 2], I_Data[ 3], I_Data[ 7], I_Data[ 8], I_Data[ 9], 
                          I_Data[13], I_Data[14], I_Data[15], I_Data[19], I_Data[20], I_Data[21], I_Data[23]};
            r_O_ECC[2] <= ^{I_Data[ 0], I_Data[ 2], I_Data[ 3], I_Data[ 5], I_Data[ 6], I_Data[ 9], 
                          I_Data[11], I_Data[12], I_Data[15], I_Data[18], I_Data[20], I_Data[21], I_Data[22]};
            r_O_ECC[1] <= ^{I_Data[ 0], I_Data[ 1], I_Data[ 3], I_Data[ 4], I_Data[ 6], I_Data[ 8], 
                          I_Data[10], I_Data[12], I_Data[14], I_Data[17], I_Data[20], I_Data[21], I_Data[22], I_Data[23]};
            r_O_ECC[0] <= ^{I_Data[ 0], I_Data[ 1], I_Data[ 2], I_Data[ 4], I_Data[ 5], I_Data[ 7], 
                          I_Data[10], I_Data[11], I_Data[13], I_Data[16], I_Data[20], I_Data[21], I_Data[22], I_Data[23]};
    end
endmodule