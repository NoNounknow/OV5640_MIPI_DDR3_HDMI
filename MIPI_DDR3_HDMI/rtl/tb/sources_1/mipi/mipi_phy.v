module  mipi_phy(
        // 
        input                   s_rst_n                 ,
        //
        input                   mipi_clk_p              ,
        input                   mipi_clk_n              ,
        input           [ 1:0]  mipi_data_p             ,
        input           [ 1:0]  mipi_data_n             ,
        // 
        output  wire            mipi_byte_clk           ,
        output  wire    [ 7:0]  lane0_byte_data         ,
        output  wire    [ 7:0]  lane1_byte_data          
);

// Clock

wire                            clk_in_int                      ;
wire                            clk_in_int_buf                  ;
wire                            clk_div                         ;

IBUFDS
        #(.IOSTANDARD ("LVDS_25"))
ibufds_clk_inst(
        .I          (mipi_clk_p),
        .IB         (mipi_clk_n),
        .O          (clk_in_int)
);

// High Speed BUFIO clock buffer
BUFIO bufio_inst(
   .O(clk_in_int_buf),
    .I(clk_in_int)
);

// BUFR generates the slow clock
BUFR #(
    .SIM_DEVICE("7SERIES"),
    .BUFR_DIVIDE("4"))
clkout_buf_inst (
        .O (clk_div),
        .CE(1'b1),
        .CLR(~s_rst_n),
        .I (clk_in_int)
);

assign  mipi_byte_clk   =       clk_div;

// Data
// Lane0

wire    [ 1:0]  data_in_from_pins_int;
wire            clock_enable;
wire            clk_in_int_inv;

assign  clk_in_int_inv  =       ~(clk_in_int_buf);
assign  clock_enable    =       1'b1;

IBUFDS
      #(.DIFF_TERM  ("FALSE"),             // Differential termination
        .IOSTANDARD ("LVDS_25"))
ibufds_U0(
        .I          (mipi_data_p[0]),
        .IB         (mipi_data_n[0]),
        .O          (data_in_from_pins_int[0])
);

// declare the iserdes
ISERDESE2
       # (
         .DATA_RATE         ("DDR"),
         .DATA_WIDTH        (8),
         .INTERFACE_TYPE    ("NETWORKING"), 
         .DYN_CLKDIV_INV_EN ("FALSE"),
         .DYN_CLK_INV_EN    ("FALSE"),
         .NUM_CE            (2),
         .OFB_USED          ("FALSE"),
         .IOBDELAY          ("NONE"),                               // Use input at D to output the data on Q
         .SERDES_MODE       ("MASTER"))
iserdese2_U0 (
         .Q1                (lane0_byte_data[7]),
         .Q2                (lane0_byte_data[6]),
         .Q3                (lane0_byte_data[5]),
         .Q4                (lane0_byte_data[4]),
         .Q5                (lane0_byte_data[3]),
         .Q6                (lane0_byte_data[2]),
         .Q7                (lane0_byte_data[1]),
         .Q8                (lane0_byte_data[0]),
         .SHIFTOUT1         (),
         .SHIFTOUT2         (),
         .BITSLIP           (1'b0),                                // 1-bit Invoke Bitslip. This can be used with any DATA_WIDTH, cascaded or not.
                                                                   // The amount of BITSLIP is fixed by the DATA_WIDTH selection.
         .CE1               (clock_enable),                        // 1-bit Clock enable input
         .CE2               (clock_enable),                        // 1-bit Clock enable input
         .CLK               (clk_in_int_buf),                      // Fast source synchronous clock driven by BUFIO
         .CLKB              (clk_in_int_inv),                      // Locally inverted fast 
         .CLKDIV            (clk_div),                             // Slow clock from BUFR.
         .CLKDIVP           (1'b0),
         .D                 (data_in_from_pins_int[0]),         // 1-bit Input signal from IOB 
         .DDLY              (1'b0),                                // 1-bit Input from Input Delay component 
         .RST               (~s_rst_n),                            // 1-bit Asynchronous reset only.
         .SHIFTIN1          (1'b0),
         .SHIFTIN2          (1'b0),
    // unused connections
         .DYNCLKDIVSEL      (1'b0),
         .DYNCLKSEL         (1'b0),
         .OFB               (1'b0),
         .OCLK              (1'b0),
         .OCLKB             (1'b0),
         .O                 ()                                 // unregistered output of ISERDESE1
);  

IBUFDS
      #(.DIFF_TERM  ("FALSE"),             // Differential termination
        .IOSTANDARD ("LVDS_25"))
ibufds_U1(
        .I          (mipi_data_p[1]),
        .IB         (mipi_data_n[1]),
        .O          (data_in_from_pins_int[1])
);

// declare the iserdes
ISERDESE2
       # (
         .DATA_RATE         ("DDR"),
         .DATA_WIDTH        (8),
         .INTERFACE_TYPE    ("NETWORKING"), 
         .DYN_CLKDIV_INV_EN ("FALSE"),
         .DYN_CLK_INV_EN    ("FALSE"),
         .NUM_CE            (2),
         .OFB_USED          ("FALSE"),
         .IOBDELAY          ("NONE"),                               // Use input at D to output the data on Q
         .SERDES_MODE       ("MASTER"))
iserdese2_U1 (
         .Q1                (lane1_byte_data[7]),
         .Q2                (lane1_byte_data[6]),
         .Q3                (lane1_byte_data[5]),
         .Q4                (lane1_byte_data[4]),
         .Q5                (lane1_byte_data[3]),
         .Q6                (lane1_byte_data[2]),
         .Q7                (lane1_byte_data[1]),
         .Q8                (lane1_byte_data[0]),
         .SHIFTOUT1         (),
         .SHIFTOUT2         (),
         .BITSLIP           (1'b0),                                // 1-bit Invoke Bitslip. This can be used with any DATA_WIDTH, cascaded or not.
                                                                   // The amount of BITSLIP is fixed by the DATA_WIDTH selection.
         .CE1               (clock_enable),                        // 1-bit Clock enable input
         .CE2               (clock_enable),                        // 1-bit Clock enable input
         .CLK               (clk_in_int_buf),                      // Fast source synchronous clock driven by BUFIO
         .CLKB              (clk_in_int_inv),                      // Locally inverted fast 
         .CLKDIV            (clk_div),                             // Slow clock from BUFR.
         .CLKDIVP           (1'b0),
         .D                 (data_in_from_pins_int[1]),            // 1-bit Input signal from IOB 
         .DDLY              (1'b0),                                // 1-bit Input from Input Delay component 
         .RST               (~s_rst_n),                            // 1-bit Asynchronous reset only.
         .SHIFTIN1          (1'b0),
         .SHIFTIN2          (1'b0),
    // unused connections
         .DYNCLKDIVSEL      (1'b0),
         .DYNCLKSEL         (1'b0),
         .OFB               (1'b0),
         .OCLK              (1'b0),
         .OCLKB             (1'b0),
         .O                 ()                                     // unregistered output of ISERDESE1
);  


endmodule
