module  uart_rx(
        // system signals
        input                   sclk                    ,       
        input                   s_rst_n                 ,       
        // RS232
        input                   rs232_rx                ,       // TXD
        // 
        output  reg     [ 7:0]  rx_data                 ,
        output  reg             rx_data_vld                    
);

//========================================================================\
// =========== Define Parameter and Internal signals =========== 
//========================================================================/

localparam      BAUD_END       =       'd434                    ;
localparam      BAUD_MID       =       BAUD_END/2               ;

reg                             rs232_rx_r1                     ;       
reg                             rs232_rx_r2                     ;       
reg                             rs232_rx_r3                     ;       

reg                             bit_flag                        ;       
reg     [ 8:0]                  baud_cnt                        ;       
reg     [ 3:0]                  bit_cnt                         ;

wire                            rs232_rx_neg                    ;       
reg                             rx_flag                         ;       

//=============================================================================
//**************    Main Code   **************
//=============================================================================


assign  rs232_rx_neg    =       ~rs232_rx_r2 & rs232_rx_r3;

always  @(posedge sclk) begin
        rs232_rx_r1     <=      rs232_rx;
        rs232_rx_r2     <=      rs232_rx_r1;
        rs232_rx_r3     <=      rs232_rx_r2;
end

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                bit_flag        <=      1'b0;
        else if(baud_cnt == BAUD_MID)
                bit_flag        <=      1'b1;
        else
                bit_flag        <=      1'b0;
end

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                baud_cnt       <=      'd0;
        else if(baud_cnt == (BAUD_END-1))
                baud_cnt       <=      'd0;
        else if(rx_flag == 1'b1)
                baud_cnt       <=      baud_cnt + 1'b1;
        else 
                baud_cnt       <=      'd0;
end

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                rx_flag <=      1'b0;
        else if(bit_cnt == 'd8 && baud_cnt == (BAUD_END-1))
                rx_flag <=      1'b0;
        else if(rs232_rx_neg == 1'b1)
                rx_flag <=      1'b1;
end

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                bit_cnt <=      'd0;
        else if(rx_flag == 1'b0)
                bit_cnt <=      'd0;
        else if(baud_cnt == (BAUD_END-1))
                bit_cnt <=      bit_cnt + 1'b1;
end

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                rx_data <=      'd0;
        else if(bit_flag == 1'b1)
                rx_data <=      {rs232_rx_r2, rx_data[7:1]};

end

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                rx_data_vld     <=      1'b0;
        else if(bit_cnt == 'd8 && bit_flag == 1'b1)
                rx_data_vld     <=      1'b1;
        else
                rx_data_vld     <=      1'b0;
end

endmodule
