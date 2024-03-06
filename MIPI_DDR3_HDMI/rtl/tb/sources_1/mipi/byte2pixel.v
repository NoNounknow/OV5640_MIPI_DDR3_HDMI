module  byte2pixel(
        // system signals
        input                   sclk                    ,       
        input                   s_rst_n                 ,       
        // RAW Data
        input                   raw_vld                 ,       
        input           [15:0]  raw_data                ,       
        input                   raw_vsync               ,       
        // Pixel Data
        output  reg             pixel_vld               ,       
        output  reg     [39:0]  pixel_data                     // {P1, P2, P3, P4}       
);

//========================================================================\
// =========== Define Parameter and Internal signals =========== 
//========================================================================/
reg                             frame_valid                     ;       
reg     [ 2:0]                  raw_cnt                         ;       
reg     [15:0]                  raw_data_r1                     ;       
reg     [15:0]                  raw_data_r2                     ;       

//=============================================================================
//**************    Main Code   **************
//=============================================================================

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                frame_valid     <=      1'b0;
        else if(raw_vsync == 1'b1)
                frame_valid     <=      1'b1;
end

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                raw_cnt <=      'd0;
        else if(raw_cnt == 'd4 && frame_valid == 1'b1 && raw_vld == 1'b1)
                raw_cnt <=      'd0;
        else if(frame_valid == 1'b1 && raw_vld == 1'b1)
                raw_cnt <=      raw_cnt + 1'b1;
end

always  @(posedge sclk) begin
        raw_data_r1     <=      raw_data;
        raw_data_r2     <=      raw_data_r1;
end

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                pixel_vld       <=      1'b0;
        else if(raw_cnt == 'd4 && frame_valid == 1'b1 && raw_vld == 1'b1)
                pixel_vld       <=      1'b1;
        else if(raw_cnt == 'd2 && frame_valid == 1'b1 && raw_vld == 1'b1)
                pixel_vld       <=      1'b1;
        else
                pixel_vld       <=      1'b0;
end

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                pixel_data      <=      32'h0;
        else if(raw_cnt == 'd2 && frame_valid == 1'b1 && raw_vld == 1'b1)
                pixel_data      <=      {raw_data_r2[07:00], raw_data[1:0],
                                         raw_data_r2[15:08], raw_data[3:2],
                                         raw_data_r1[07:00], raw_data[5:4],
                                         raw_data_r1[15:08], raw_data[7:6]};
        else if(raw_cnt == 'd4 && frame_valid == 1'b1 && raw_vld == 1'b1)
                pixel_data      <=      {raw_data_r2[15:08], raw_data[09:08],
                                         raw_data_r1[07:00], raw_data[11:10],
                                         raw_data_r1[15:08], raw_data[13:12],
                                         raw_data[07:00],    raw_data[15:14]};
end


endmodule
