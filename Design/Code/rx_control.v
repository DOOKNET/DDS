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
 
always @ ( posedge CLK or negedge RSTn )
     if( !RSTn ) begin 
			i_cnt<=0;
		end
	  else	begin     
			case(i_cnt)
				4'd0: begin i_cnt<=i_cnt+1;  isEn<=1'b1; end
				4'd1:if((RX_Data == 8'h01)&&RX_Done_Sig) begin i_cnt<=i_cnt+1; end
				4'd2:if( RX_Done_Sig ) begin phase_1_r[15:8] <= RX_Data; i_cnt<=i_cnt+1; end
				4'd3:if( RX_Done_Sig ) begin phase_1_r[7:0]  <= RX_Data; i_cnt<=i_cnt+1; end
				
				4'd4:if((RX_Data == 8'h02)&&RX_Done_Sig) begin i_cnt<=i_cnt+1; end
				4'd5:if( RX_Done_Sig ) begin phase_2_r[15:8] <= RX_Data; i_cnt<=i_cnt+1; end
				4'd6:if( RX_Done_Sig ) begin phase_2_r[7:0]  <= RX_Data; i_cnt<=i_cnt+1; end
				
				4'd7:if((RX_Data == 8'h03)&&RX_Done_Sig) begin i_cnt<=i_cnt+1; end
				4'd8:if( RX_Done_Sig ) begin phase_3_r[15:8] <= RX_Data; i_cnt<=i_cnt+1; end
				4'd9:if( RX_Done_Sig ) begin phase_3_r[7:0]  <= RX_Data; i_cnt<=i_cnt+1; end

				4'd10:if((RX_Data == 8'h04)&&RX_Done_Sig) begin i_cnt<=i_cnt+1; end
				4'd11:if( RX_Done_Sig ) begin phase_4_r[15:8] <= RX_Data; i_cnt<=i_cnt+1; end
				4'd12:if( RX_Done_Sig ) begin phase_4_r[7:0]  <= RX_Data; i_cnt<=i_cnt+1; end
				
				4'd13:begin  i_cnt<=i_cnt+1; phase_1<=phase_1_r[9:0]; phase_2<=phase_2_r[9:0]; phase_3<=phase_3_r[9:0]; phase_4<= phase_4_r[9:0];  end
				4'd14:begin isEn<=0; i_cnt<=0;  end
			endcase
	  end
/---------------------------------/
assign RX_En_Sig = isEn;
/---------------------------------/
endmodule

