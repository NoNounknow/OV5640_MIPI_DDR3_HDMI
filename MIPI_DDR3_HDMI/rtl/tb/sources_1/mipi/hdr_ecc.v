module  hdr_ecc(
        input           [23:0]  ph_data                 ,       
        output  reg     [ 7:0]  ecc_rlst                       
);

always  @(*) begin
        ecc_rlst[7] = 1'b0;
        ecc_rlst[6] = 1'b0;
        ecc_rlst[5] = ph_data[10] ^ ph_data[11] ^ ph_data[12] ^ ph_data[13] ^ ph_data[14] ^ ph_data[15] ^ ph_data[16] ^ ph_data[17] ^ ph_data[18] ^ ph_data[19] ^ ph_data[21] ^ ph_data[22] ^ ph_data[23];
        ecc_rlst[4] = ph_data[4] ^ ph_data[5] ^ ph_data[6] ^ ph_data[7] ^ ph_data[8] ^ ph_data[9] ^ ph_data[16] ^ ph_data[17] ^ ph_data[18] ^ ph_data[19] ^ ph_data[20] ^ ph_data[22] ^ ph_data[23];
        ecc_rlst[3] = ph_data[1] ^ ph_data[2] ^ ph_data[3] ^ ph_data[7] ^ ph_data[8] ^ ph_data[9] ^ ph_data[13] ^ ph_data[14] ^ ph_data[15] ^ ph_data[19] ^ ph_data[20] ^ ph_data[21] ^ ph_data[23];
        ecc_rlst[2] = ph_data[0] ^ ph_data[2] ^ ph_data[3] ^ ph_data[5] ^ ph_data[6] ^ ph_data[9] ^ ph_data[11] ^ ph_data[12] ^ ph_data[15] ^ ph_data[18] ^ ph_data[20] ^ ph_data[21] ^ ph_data[22];
        ecc_rlst[1] = ph_data[0] ^ ph_data[1] ^ ph_data[3] ^ ph_data[4] ^ ph_data[6] ^ ph_data[8] ^ ph_data[10] ^ ph_data[12] ^ ph_data[14] ^ ph_data[17] ^ ph_data[20] ^ ph_data[21] ^ ph_data[22] ^ ph_data[23];
        ecc_rlst[0] = ph_data[0] ^ ph_data[1] ^ ph_data[2] ^ ph_data[4] ^ ph_data[5] ^ ph_data[7] ^ ph_data[10] ^ ph_data[11] ^ ph_data[13] ^ ph_data[16] ^ ph_data[20] ^ ph_data[21] ^ ph_data[22] ^ ph_data[23];
end






endmodule
