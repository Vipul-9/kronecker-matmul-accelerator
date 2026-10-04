`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2024 10:47:30 AM
// Design Name: 
// Module Name: full_adder
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


module full_adder(a,b,cin,s,cout);
input a,b,cin;
output s,cout;
wire t;

xnor x1(t,a,b);
xnor x2(s,t,cin);
mux x3(cout,cin,a,t);
endmodule


module mux(w,x,y,z);
input x,y,z;
output w;
wire t1,t2,t3;

not n1(t1,z);
and a1(t2,x,t1);
and a2(t3,y,z);
or o1(w,t2,t3);
endmodule