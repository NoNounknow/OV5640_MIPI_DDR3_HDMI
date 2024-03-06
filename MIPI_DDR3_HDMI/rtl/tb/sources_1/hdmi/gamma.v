module  gamma(
        // system signals
        input                   sclk                    ,       
        input                   s_rst_n                 ,       
        // 
        input                   i_vga_vsync             ,       
        input                   i_vga_hsync             ,       
        input                   i_vga_de                ,       
        input           [ 7:0]  i_vga_r                 ,
        input           [ 7:0]  i_vga_g                 ,
        input           [ 7:0]  i_vga_b                 ,
        // 
        output  reg             o_vga_vsync             ,
        output  reg             o_vga_hsync             ,
        output  reg             o_vga_de                ,       
        output  wire    [ 7:0]  o_vga_r                 ,       
        output  wire    [ 7:0]  o_vga_g                 ,       
        output  wire    [ 7:0]  o_vga_b                        
);

//========================================================================\
// =========== Define Parameter and Internal signals =========== 
//========================================================================/


//=============================================================================
//**************    Main Code   **************
//=============================================================================
always  @(posedge sclk) begin
        o_vga_vsync     <=      i_vga_vsync;
        o_vga_hsync     <=      i_vga_hsync;
        o_vga_de        <=      i_vga_de;
end

gamma_rom_ip gamma_rom_RED (
        .clka           (sclk),    // input wire clka
        .addra          (i_vga_r),  // input wire [7 : 0] addra
        .douta          (o_vga_r)  // output wire [7 : 0] douta
);

gamma_rom_ip gamma_rom_GREEN (
        .clka           (sclk),    // input wire clka
        .addra          (i_vga_g),  // input wire [7 : 0] addra
        .douta          (o_vga_g)  // output wire [7 : 0] douta
);

gamma_rom_ip gamma_rom_BLUE (
        .clka           (sclk),    // input wire clka
        .addra          (i_vga_b),  // input wire [7 : 0] addra
        .douta          (o_vga_b)  // output wire [7 : 0] douta
);

endmodule
