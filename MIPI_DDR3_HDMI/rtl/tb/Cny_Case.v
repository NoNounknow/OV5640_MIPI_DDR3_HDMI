module Cny_Case (
    input   wire    Rst_n ,
    input   wire    Clk_0 ,
    input   wire    Sync_0,
    input   wire    Clk_1 ,
    input   wire    Sync_1,
    output  wire    [10:0]  Frame_I_Cnt,
    output  wire    [10:0]  Frame_O_Cnt
);
    reg           r_Sync_0     ;
    wire          Pose_Sync_0  ;
    reg  [10:0]   r_Frame_I_Cnt;

    always @(posedge Clk_0) begin
        r_Sync_0 <= Sync_0;
    end

    assign Pose_Sync_0 = (!r_Sync_0)&&(Sync_0);
    assign Frame_I_Cnt = r_Frame_I_Cnt        ;
    always @(posedge Clk_0 or negedge Rst_n) begin
        if(Rst_n == 1'b0) begin
            r_Frame_I_Cnt <= 'd0;
        end else if(Pose_Sync_0 == 1'b1) begin
            r_Frame_I_Cnt <= r_Frame_I_Cnt + 1'b1;
        end
    end

    reg           r_Sync_1     ;
    wire          Pose_Sync_1  ;
    reg  [10:0]   r_Frame_O_Cnt;

    always @(posedge Clk_1) begin
        r_Sync_1 <= Sync_1;
    end

    assign Pose_Sync_1 = (!r_Sync_1)&&(Sync_1);
    assign Frame_O_Cnt = r_Frame_O_Cnt        ;
    always @(posedge Clk_1 or negedge Rst_n) begin
        if(Rst_n == 1'b0) begin
            r_Frame_O_Cnt <= 'd0;
        end else if(Pose_Sync_1 == 1'b1) begin
            r_Frame_O_Cnt <= r_Frame_O_Cnt + 1'b1;
        end
    end
ila_0 ila_0 (
	.clk(Clk_1), // input wire clk
	.probe0(Sync_0), // input wire [0:0]  probe0  
	.probe1(r_Frame_I_Cnt), // input wire [10:0]  probe1 
	.probe2(Sync_1), // input wire [0:0]  probe2 
	.probe3(r_Frame_O_Cnt) // input wire [10:0]  probe3
);
endmodule