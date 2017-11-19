module IQsin(
    input 	clk,
    input   rst_n,
	input	[9:0]	phase_1,
	input	[9:0]	phase_2,
	input	[9:0]	phase_3,
	input	[9:0]	phase_4,
    output  [13:0]  sin_10,
	output  [13:0]  sin_30,
	output  [13:0]  sin_50,
	output  [13:0]  sin_70
);
//--------------------------------------------------------//
parameter   Freq_1 = 32'd858993;      	//100M--10k
parameter   Freq_2 = 32'd2576980;       //100M--30k
parameter   Freq_3 = 32'd4294967;       //100M--50k
parameter   Freq_4 = 32'd6012954;       //100M--70k
parameter   cnt_width =  8'd32;    
//--------------------------------------------------------//

//--------------------------------------------------------//
reg     [cnt_width-1:0]cnt_1 = 0;
reg     [cnt_width-1:0]cnt_2 = 0;
reg     [cnt_width-1:0]cnt_3 = 0;
reg     [cnt_width-1:0]cnt_4 = 0;
wire    [9:0]   addr_1;
wire	[9:0]	addr_2;
wire	[9:0]	addr_3;
wire	[9:0]	addr_4;
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)	begin
		cnt_1 <= 0;
		cnt_2 <= 0;
		cnt_3 <= 0;
		cnt_4 <= 0;
	end
	else	begin
	    cnt_1 <= cnt_1 + Freq_1;
		cnt_2 <= cnt_2 + Freq_2;
		cnt_3 <= cnt_3 + Freq_3;
		cnt_4 <= cnt_4 + Freq_4;
	end
end

assign  addr_1 = cnt_1[cnt_width-1:cnt_width-10] + phase_1;
assign  addr_2 = cnt_2[cnt_width-1:cnt_width-10] + phase_2;
assign  addr_3 = cnt_3[cnt_width-1:cnt_width-10] + phase_3;
assign  addr_4 = cnt_4[cnt_width-1:cnt_width-10] + phase_4;
//--------------------------------------------------------//

//--------------------调用两个双口ROM核--------------------//
ROM_1			ROM_1_inst0 (
	.address_a 	( addr_1 ),
	.address_b 	( addr_2 ),
	.clock 		( clk ),
	.q_a 		( sin_10 ),
	.q_b 		( sin_30 )
);

ROM_1			ROM_1_inst1 (
	.address_a 	( addr_3 ),
	.address_b 	( addr_4 ),
	.clock 		( clk ),
	.q_a 		( sin_50 ),
	.q_b 		( sin_70 )
);


endmodule
