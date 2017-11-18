module IQsin(
    input 	clk_50M,
    input   rst_n,
    output  signed  [12:0]  sin_500,
	output  signed  [12:0]  sin_100
);
//--------------------------------------------------------//
parameter   Freq_I = 32'd42949673;      //frequence_I = 500k-50M
parameter   Freq_Q = 32'd8589935;       //frequence_Q = 100k-50M-干扰
parameter   cnt_width =  8'd32;    
//--------------------------------------------------------//

//--------------------------------------------------------//
reg     [cnt_width-1:0]cnt_I = 0;
reg     [cnt_width-1:0]cnt_Q = 0;
wire    [9:0]   addr_I;
wire	[9:0]	addr_Q;
always @(posedge clk_50M or negedge rst_n) begin
	if(!rst_n)	begin
		cnt_I <= 0;
		cnt_Q <= 0;
	end
	else	begin
	    cnt_I <= cnt_I + Freq_I;
		cnt_Q <= cnt_Q + Freq_Q;
	end
end

assign  addr_I = cnt_I[cnt_width-1:cnt_width-10];
assign  addr_Q = cnt_Q[cnt_width-1:cnt_width-10];
//--------------------------------------------------------//

//--------------------调用两个双口ROM核--------------------//
wire	signed	[11:0]	sin_100_r;
wire	signed	[11:0]	sin_500_r;

ROM_50_100      ROM_50_100_inst0(
	.address_a  (addr_I),           //500k
	.address_b  (addr_Q),           //100k
	.clock      (clk_50M),
	.q_a        (sin_500_r),            //sin_500k
	.q_b        (sin_100_r)            //sin_100k
);

assign	sin_100 = {sin_100_r[11],sin_100_r};
assign	sin_500 = {sin_500_r[11],sin_500_r};


endmodule
