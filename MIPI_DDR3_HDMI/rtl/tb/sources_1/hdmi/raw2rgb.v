module  raw2rgb(
        // system signals
        input                   sclk                    ,       
        input                   s_rst_n                 ,       
        // 
        input                   i_vga_vsync             ,       
        input                   i_vga_hsync             ,       
        input                   i_vga_de                ,       
        input           [ 7:0]  raw_data                ,
        // 
        output  reg             o_vga_vsync             ,
        output  reg             o_vga_hsync             ,
        output  reg             o_vga_de                ,       
        output  reg     [ 7:0]  o_vga_r                 ,       
        output  reg     [ 7:0]  o_vga_g                 ,       
        output  reg     [ 7:0]  o_vga_b                        
);

//========================================================================\
// =========== Define Parameter and Internal signals =========== 
//========================================================================/

reg     [ 7:0]                  raw_data_r1                     ;       

wire                            fifo_rd_en                      ;       
wire    [ 7:0]                  fifo_rd_data                    ;       
reg     [ 7:0]                  fifo_rd_data_r1                 ;       
reg     [15:0]                  row_cnt                         ;       
reg     [15:0]                  col_cnt                         ;

wire    [ 8:0]                  sum0                            ;
wire    [ 8:0]                  sum1                            ;

//=============================================================================
//**************    Main Code   **************
//=============================================================================
always  @(posedge sclk) begin
        o_vga_vsync     <=      i_vga_vsync;
        o_vga_hsync     <=      i_vga_hsync;
        o_vga_de        <=      i_vga_de;

        raw_data_r1     <=      raw_data;
        fifo_rd_data_r1 <=      fifo_rd_data;
end

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                row_cnt <=      'd0;
        else if(i_vga_vsync == 1'b1)
                row_cnt <=      'd0;
        else if(i_vga_de == 1'b0 && o_vga_de == 1'b1)
                row_cnt <=      row_cnt + 1'b1;
end

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                col_cnt <=      'd0;
        else if(i_vga_de == 1'b1)
                col_cnt <=      col_cnt + 1'b1;
        else 
                col_cnt <=      'd0;
end

assign  fifo_rd_en      =       (row_cnt >= 'd1) ? i_vga_de : 1'b0;
assign  sum0            =       fifo_rd_data + raw_data_r1;
assign  sum1            =       fifo_rd_data_r1 + raw_data;

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0) begin
                o_vga_r <=      8'h0;
                o_vga_g <=      8'h0;
                o_vga_b <=      8'h0;
        end
        else if(i_vga_de == 1'b1)
                case({row_cnt[0], col_cnt[0]})
                        2'b00: begin // RGGB 
                                o_vga_r <=      fifo_rd_data_r1;        
                                o_vga_g <=      sum0[8:1];
                                o_vga_b <=      raw_data;
                        end
                        2'b10:  begin// GBRG
                                o_vga_r <=      raw_data_r1;        
                                o_vga_g <=      sum1[8:1];
                                o_vga_b <=      fifo_rd_data;
                        end
                        2'b01:  begin// GRBG
                                o_vga_r <=      fifo_rd_data;        
                                o_vga_g <=      sum1[8:1];
                                o_vga_b <=      raw_data_r1;
                        end
                        2'b11:  begin// BGGR
                                o_vga_r <=      raw_data;        
                                o_vga_g <=      sum0[8:1];
                                o_vga_b <=      raw_data_r1;
                        end
                endcase
        else begin
                o_vga_r <=      8'h0;
                o_vga_g <=      8'h0;
                o_vga_b <=      8'h0;
        end
end


fifo_generator_1 fifo_generator_1 (
        .clk                    (sclk                   ),      // input wire clk
        .srst                   (i_vga_vsync            ),    // input wire srst
        .din                    (raw_data               ),      // input wire [7 : 0] din
        .wr_en                  (i_vga_de               ),  // input wire wr_en
        .rd_en                  (fifo_rd_en             ),  // input wire rd_en
        .dout                   (fifo_rd_data           ),    // output wire [7 : 0] dout
        .full                   (                       ),    // output wire full
        .empty                  (                       )// output wire empty
);


endmodule
