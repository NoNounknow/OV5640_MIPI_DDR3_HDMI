module  mipi_top(
        // system signals
        input                   s_rst_n                 ,       
        // 
        input                   mipi_clk_p              ,
        input                   mipi_clk_n              ,
        input           [ 1:0]  mipi_data_p             ,
        input           [ 1:0]  mipi_data_n             ,  
        // 
        output  wire            pixel_clk               ,
        output  wire            pixel_vld               ,       
        output  wire    [39:0]  pixel_data                     // {P1, P2, P3, P4} 
);

//========================================================================\
// =========== Define Parameter and Internal signals =========== 
//========================================================================/

wire    [ 7:0]                  lane0_byte_data                 ;       
wire                            lane0_byte_vld                  ;       

wire    [ 7:0]                  lane1_byte_data                 ;       
wire                            lane1_byte_vld                  ;       

wire    [15:0]                  word_data                       ;       
wire                            word_vld                        ;       
wire                            invalid_start                   ;       
// wire                            packet_done                     ;       
wire                            mipi_byte_clk                   ;       

wire    [ 7:0]                  lane0_data                      ;       
wire    [ 7:0]                  lane1_data                      ;     

wire                            raw_vld                         ; 
wire    [39:0]                  raw_data                        ;
//=============================================================================
//**************    Main Code   **************
//=============================================================================

assign  pixel_clk       =       mipi_byte_clk;

mipi_phy        mipi_phy_inst(
        // 
        .s_rst_n                (s_rst_n                ),
        //
        .mipi_clk_p             (mipi_clk_p             ),
        .mipi_clk_n             (mipi_clk_n             ),
        .mipi_data_p            (mipi_data_p            ),
        .mipi_data_n            (mipi_data_n            ),
        // 
        .mipi_byte_clk          (mipi_byte_clk          ),
        .lane0_byte_data        (lane0_data             ),
        .lane1_byte_data        (lane1_data             )
);


byte_align      byte_align_U0(
        // system signals
        .sclk                   (mipi_byte_clk          ),
        .s_rst_n                (s_rst_n                ),
        // 
        .lane_data              (lane0_data             ),
        .mipi_byte_data         (lane0_byte_data        ),
        .mipi_byte_vld          (lane0_byte_vld         ),
        .re_find                (invalid_start | packet_done)
);

byte_align      byte_align_U1(
        // system signals
        .sclk                   (mipi_byte_clk          ),
        .s_rst_n                (s_rst_n                ),
        // 
        .lane_data              (lane1_data             ),
        .mipi_byte_data         (lane1_byte_data        ),
        .mipi_byte_vld          (lane1_byte_vld         ),
        .re_find                (invalid_start | packet_done)
);


lane_align      lane_align_inst(
        // system signals
        .sclk                   (mipi_byte_clk          ),
        .s_rst_n                (s_rst_n                ),
        // MIPI Lane Data
        .lane0_byte_data        (lane0_byte_data        ),
        .lane1_byte_data        (lane1_byte_data        ),
        .lane0_byte_vld         (lane0_byte_vld         ),
        .lane1_byte_vld         (lane1_byte_vld         ),
        // 
        .word_data              (word_data              ),
        .word_vld               (word_vld               ),
        .packet_done            (packet_done            ),
        .invalid_start          (invalid_start          )
);

packet_handler  packet_handler_inst(
        // system signals
        .sclk                   (mipi_byte_clk          ),
        .s_rst_n                (s_rst_n                ),
        // Word 
        .word_data              (word_data              ),
        .word_vld               (word_vld               ),
        //
        .raw_vld                (raw_vld                ),
        .raw_data               (raw_data               ),
        .raw_vsync              (raw_vsync              ),
        .packet_done            (packet_done            )
);

byte2pixel      byte2pixel_inst(
        // system signals
        .sclk                   (mipi_byte_clk          ),
        .s_rst_n                (s_rst_n                ),
        // RAW Data
        .raw_vld                (raw_vld                ),
        .raw_data               (raw_data               ),
        .raw_vsync              (raw_vsync              ),
        // Pixel Data
        .pixel_vld              (pixel_vld              ),
        .pixel_data             (pixel_data             )
);

/*
mipi_check      mipi_check_inst(
        // system signals
        .sclk                   (mipi_byte_clk          ),
        .s_rst_n                (s_rst_n                ),
        // 
        .raw_vld                (raw_vld                ),
        .raw_data               (raw_data               ),
        .raw_vsync              (raw_vsync              ),
        // MIPI 
        .lane0_data             (lane0_data             ),
        .lane1_data             (lane1_data             ),
        .lane0_byte_data        (lane0_byte_data        ),
        .lane0_byte_vld         (lane0_byte_vld         ),
        .lane1_byte_data        (lane1_byte_data        ),
        .lane1_byte_vld         (lane1_byte_vld         ),
        .word_data              (word_data              ),
        .word_vld               (word_vld               ),
        .invalid_start          (invalid_start          ),
        .packet_done            (packet_done            )
        
);*/
endmodule
