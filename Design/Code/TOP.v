module TOP(
	input	clk,
	input	rst_n,
	output	[13:0]	sin_10,
	output	[13:0]	sin_30,
	output	[13:0]	sin_50,
	output	[13:0]	sin_70,
	output	da_clk1,
	output	da_clk2,
	output	da_clk3,
	output	da_clk4,
	output	write_1,
	output	write_2,
	output	write_3,
	output	write_4
);

assign	da_clk1 = clk;
assign	da_clk2 = clk;
assign	da_clk3 = clk;
assign	da_clk4 = clk;

assign	write_1 = clk;
assign	write_2 = clk;
assign	write_3 = clk;
assign	write_4 = clk;

//------------------------//
IQsin			IQ_sin_inst0(
    .clk		(clk),
    .rst_n		(rst_n),
    .sin_10		(sin_10),
	.sin_30		(sin_30),
	.sin_50		(sin_50),
	.sin_70		(sin_70)
);

endmodule 
