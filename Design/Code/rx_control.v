module rx_control(
    	input 	CLK,
	input 	RSTn,
	input 	RX_Done_Sig,
	input 	[7:0]	RX_Data,
	output 	RX_En_Sig,
	output 	reg	[9:0]	phase_1 = 0,
	output 	reg	[9:0]	phase_2 = 0,
	output 	reg	[9:0]	phase_3 = 0,
	output 	reg	[9:0]	phase_4 = 0
);

/-----------------------------------/

reg isEn;

reg [15:0]phase_1_r=0;
reg [15:0]phase_2_r=0;
reg [15:0]phase_3_r=0;
reg [15:0]phase_4_r=0;
reg [3:0]i_cnt=0;
 

/---------------------------------/
assign RX_En_Sig = isEn;
/---------------------------------/
endmodule
