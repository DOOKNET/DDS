#------------------GLOBAL--------------------#
#------------------HSEP4CE30 VER2.0 FOR EDA6.1-----------------#
 set_global_assignment -name RESERVE_ALL_UNUSED_PINS "AS INPUT TRI-STATED"
 set_global_assignment -name ENABLE_INIT_DONE_OUTPUT OFF

#------------------------复位引脚--------------------------
 set_location_assignment PIN_E4 -to rst_n

#------------------------时钟引脚--------------------------
#clk_50--50M, clk_20--20M
#set_location_assignment PIN_G22 -to clk_20 
 set_location_assignment PIN_G1 -to clk 

#------------------------4个按键---------------------------
#set_location_assignment PIN_T1  	-to KEY[0]
#set_location_assignment PIN_T2		-to KEY[1]
#set_location_assignment PIN_AA3	-to KEY[2]
#set_location_assignment PIN_Y3		-to KEY[3]


#--------------------串口对应的引脚------------------------
#set_location_assignment PIN_B22 -to RXD
#set_location_assignment PIN_C20 -to TXD


#---------------------J11正面双路DA1-------------------------
 set_location_assignment PIN_D20	-to sin_10[13]
 set_location_assignment PIN_D21	-to sin_10[12]
 set_location_assignment PIN_D22	-to sin_10[11]
 set_location_assignment PIN_E21	-to sin_10[10]
 set_location_assignment PIN_E22	-to sin_10[9]
 set_location_assignment PIN_F17	-to sin_10[8]
 set_location_assignment PIN_F19	-to sin_10[7]
 set_location_assignment PIN_F20	-to sin_10[6]
 set_location_assignment PIN_F21	-to sin_10[5]
 set_location_assignment PIN_F22	-to sin_10[4]
 set_location_assignment PIN_G17	-to sin_10[3]
 set_location_assignment PIN_G18	-to sin_10[2]
 set_location_assignment PIN_H17	-to sin_10[1]
 set_location_assignment PIN_H18	-to sin_10[0]
 set_location_assignment PIN_H19	-to write_1
 set_location_assignment PIN_H20	-to da_clk1

#---------------------J11正面双路DA2-------------------------
 set_location_assignment PIN_H21    -to da_clk2
 set_location_assignment PIN_H22    -to write_2
 set_location_assignment PIN_J17	-to sin_30[13]
 set_location_assignment PIN_J18	-to sin_30[12]
 set_location_assignment PIN_J21	-to sin_30[11]
 set_location_assignment PIN_J22	-to sin_30[10]
 set_location_assignment PIN_K17	-to sin_30[9]
 set_location_assignment PIN_K18    -to sin_30[8]
 set_location_assignment PIN_K19	-to sin_30[7]
 set_location_assignment PIN_K21	-to sin_30[6]
 set_location_assignment PIN_K22	-to sin_30[5]
 set_location_assignment PIN_L21	-to sin_30[4]
 set_location_assignment PIN_L22	-to sin_30[3]
 set_location_assignment PIN_M19	-to sin_30[2]
 set_location_assignment PIN_M20    -to sin_30[1]
 set_location_assignment PIN_M21	-to sin_30[0]

#---------------------J7正面双路DA1-------------------------
 set_location_assignment PIN_U11	-to sin_50[13]
 set_location_assignment PIN_V11	-to sin_50[12]
 set_location_assignment PIN_T10	-to sin_50[11]
 set_location_assignment PIN_U10	-to sin_50[10]
 set_location_assignment PIN_V10	-to sin_50[9]
 set_location_assignment PIN_Y10	-to sin_50[8]
 set_location_assignment PIN_AA10	-to sin_50[7]
 set_location_assignment PIN_AB10	-to sin_50[6]
 set_location_assignment PIN_T9		-to sin_50[5]
 set_location_assignment PIN_U9		-to sin_50[4]
 set_location_assignment PIN_V9		-to sin_50[3]
 set_location_assignment PIN_AA9	-to sin_50[2]
 set_location_assignment PIN_AB9	-to sin_50[1]
 set_location_assignment PIN_T8		-to sin_50[0]
 set_location_assignment PIN_U8		-to write_3
 set_location_assignment PIN_V8		-to da_clk3

#---------------------J7正面双路DA2-------------------------
 set_location_assignment PIN_W8	    -to da_clk4
 set_location_assignment PIN_Y8	    -to write_4
 set_location_assignment PIN_AA8	-to sin_70[13]
 set_location_assignment PIN_AB8	-to sin_70[12]
 set_location_assignment PIN_U7		-to sin_70[11]
 set_location_assignment PIN_V7		-to sin_70[10]
 set_location_assignment PIN_W7		-to sin_70[9]
 set_location_assignment PIN_Y7	    -to sin_70[8]
 set_location_assignment PIN_AA7	-to sin_70[7]
 set_location_assignment PIN_AB7	-to sin_70[6]
 set_location_assignment PIN_V6		-to sin_70[5]
 set_location_assignment PIN_W6		-to sin_70[4]
 set_location_assignment PIN_Y6		-to sin_70[3]
 set_location_assignment PIN_V5		-to sin_70[2]
 set_location_assignment PIN_AA5    -to sin_70[1]
 set_location_assignment PIN_AB5	-to sin_70[0]

