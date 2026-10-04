`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2024 11:39:24 AM
// Design Name: 
// Module Name: multiplier
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multiplier1(a,b,sum);
input [7:0] a,b;
output [15:0]sum;
wire [56:1]s;
wire [72:1]c;
white_box w1(a[0],b[0],1'b0,1'b0,sum[0],c[1]);
white_box w2(a[1],b[0],1'b0,1'b0,s[1],c[2]);
white_box w3(a[0],b[1],s[1],c[1],sum[1],c[3]);
white_box w4(a[2],b[0],1'b0,1'b0,s[2],c[4]);
white_box w5(a[1],b[1],s[2],c[2],s[3],c[5]);
white_box w6(a[0],b[2],s[3],c[3],sum[2],c[6]);
white_box w7(a[3],b[0],1'b0,1'b0,s[4],c[7]);
white_box w8(a[2],b[1],s[4],c[4],s[5],c[8]);
white_box w9(a[1],b[2],s[5],c[5],s[6],c[9]);
white_box w10(a[0],b[3],s[6],c[6],sum[3],c[10]);
white_box w11(a[4],b[0],1'b0,1'b0,s[7],c[11]);
white_box w13(a[3],b[1],s[7],c[7],s[8],c[12]);
white_box w14(a[2],b[2],s[8],c[8],s[9],c[13]);
white_box w15(a[1],b[3],s[9],c[9],s[10],c[14]);
white_box w16(a[0],b[4],s[10],c[10],sum[4],c[15]);
white_box w17(a[5],b[0],1'b0,1'b0,s[11],c[16]);
white_box w18(a[4],b[1],s[11],c[11],s[12],c[17]);
white_box w19(a[3],b[2],s[12],c[12],s[13],c[18]);
white_box w20(a[2],b[3],s[13],c[13],s[14],c[19]);
white_box w21(a[1],b[4],s[14],c[14],s[15],c[20]);
white_box w22(a[0],b[5],s[15],c[15],sum[5],c[21]);
white_box w23(a[6],b[0],1'b0,1'b0,s[16],c[22]);
white_box w24(a[5],b[1],s[16],c[16],s[17],c[23]);
white_box w25(a[4],b[2],s[17],c[17],s[18],c[24]);
white_box w26(a[3],b[3],s[18],c[18],s[19],c[25]);
white_box w27(a[2],b[4],s[19],c[19],s[20],c[26]);
white_box w28(a[1],b[5],s[20],c[20],s[21],c[27]);
white_box w29(a[0],b[6],s[21],c[21],sum[6],c[28]);
grey_box   g1(a[7],b[0],1'b0,1'b0,s[22],c[57]);
white_box w30(a[6],b[1],s[22],c[22],s[23],c[29]);
white_box w31(a[5],b[2],s[23],c[23],s[24],c[30]);
white_box w32(a[4],b[3],s[24],c[24],s[25],c[31]);
white_box w33(a[3],b[4],s[25],c[25],s[26],c[32]);
white_box w34(a[2],b[5],s[26],c[26],s[27],c[33]);
white_box w35(a[1],b[6],s[27],c[27],s[28],c[34]);
grey_box   g2(a[0],b[7],s[28],c[28],sum[7],c[35]);
grey_box   g3(a[7],b[1],1'b0,c[57],s[29],c[58]);
white_box w36(a[6],b[2],s[29],c[29],s[30],c[36]);
white_box w37(a[5],b[3],s[30],c[30],s[31],c[37]);
white_box w38(a[4],b[4],s[31],c[31],s[32],c[38]);
white_box w39(a[3],b[5],s[32],c[32],s[33],c[39]);
white_box w40(a[2],b[6],s[33],c[33],s[34],c[40]);
grey_box   g4(a[1],b[7],s[34],c[34],s[35],c[41]);
grey_box   g5(a[7],b[2],1'b0,c[58],s[36],c[59]);
white_box w41(a[6],b[3],s[36],c[36],s[37],c[42]);
white_box w42(a[5],b[4],s[37],c[37],s[38],c[43]);
white_box w43(a[4],b[5],s[38],c[38],s[39],c[44]);
white_box w44(a[3],b[6],s[39],c[39],s[40],c[45]);
grey_box   g6(a[2],b[7],s[40],c[40],s[41],c[46]);
grey_box   g7(a[7],b[3],1'b0,c[59],s[42],c[60]);
white_box w45(a[6],b[4],s[42],c[42],s[43],c[47]);
white_box w46(a[5],b[5],s[43],c[43],s[44],c[48]);
white_box w47(a[4],b[6],s[44],c[44],s[45],c[49]);
grey_box   g8(a[3],b[7],s[45],c[45],s[46],c[50]);
grey_box   g9(a[7],b[4],1'b0,c[60],s[47],c[61]);
white_box w48(a[6],b[5],s[47],c[47],s[48],c[51]);
white_box w49(a[5],b[6],s[48],c[48],s[49],c[52]);
grey_box   g10(a[4],b[7],s[49],c[49],s[50],c[53]);
grey_box   g11(a[7],b[5],1'b0,c[61],s[51],c[62]);
white_box w50(a[6],b[6],s[51],c[51],s[52],c[54]);
grey_box   g12(a[5],b[7],s[52],c[52],s[53],c[55]);
grey_box   g13(a[7],b[6],1'b0,c[62],s[54],c[63]);
grey_box   g14(a[6],b[7],s[54],c[54],s[55],c[56]);
white_box w51(a[7],b[7],1'b0,c[63],s[56],c[64]);
full_adder f1(s[35],c[35],1'b1,sum[8],c[65]); 
full_adder f2(s[41],c[41],c[65],sum[9],c[66]); 
full_adder f3(s[46],c[46],c[66],sum[10],c[67]); 
full_adder f4(s[50],c[50],c[67],sum[11],c[68]); 
full_adder f5(s[53],c[53],c[68],sum[12],c[69]); 
full_adder f6(s[55],c[55],c[69],sum[13],c[70]); 
full_adder f7(s[56],c[56],c[70],sum[14],c[71]); 
full_adder f8(c[64],c[71],1'b1,sum[15],c[72]); 

endmodule