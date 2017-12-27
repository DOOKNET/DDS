module TOP(
	input	clk,
	input	rst_n,
	input	RXD,
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
//-------定义信号------//
assign	da_clk1 = clk;
assign	da_clk2 = clk;
assign	da_clk3 = clk;
assign	da_clk4 = clk;

assign	write_1 = clk;
assign	write_2 = clk;
assign	write_3 = clk;
assign	write_4 = clk;
//--------------------//
wire  	[7:0]	rx_data;
wire	rx_dong_sig;
wire	RX_En_Sig;

wire	[9:0]	phase_1;
wire	[9:0]	phase_2;
wire	[9:0]	phase_3;
wire	[9:0]	phase_4;
//--------调用串口模块-------//
uart_rx				uart_rx_inst0(
    .clk			(clk),
    .rst_n			(rst_n),
    .rx				(RXD),
    .rx_data		(rx_data),
    .rx_dong_sig	(rx_dong_sig)
);
//--------串口控制模块------//
rx_control			rx_control_inst1(
    .CLK			(clk),
	.RSTn			(rst_n),
	.RX_Done_Sig	(rx_dong_sig),
	.RX_Data		(rx_data),
	.RX_En_Sig		(RX_En_Sig),
	.phase_1		(phase_1),
	.phase_2		(phase_2),
	.phase_3		(phase_3),
	.phase_4		(phase_4)
);
//--------调用DDS模块--------//
 IQsin			IQsin_inst2(
    .clk		(clk),
    .rst_n		(rst_n),
	.phase_1	(phase_1),
	.phase_2	(phase_2),
	.phase_3	(phase_3),
	.phase_4	(phase_4),
    .sin_10		(sin_10),
	.sin_30		(sin_30),
	.sin_50		(sin_50),
	.sin_70		(sin_70)
);


endmodule 
