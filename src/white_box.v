`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2024 10:46:33 AM
// Design Name: 
// Module Name: white_box
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


module white_box(a,b,sin,cin,sout,cout);
input a,b,sin,cin;
output sout,cout;
wire t2;

and a5(t2,a,b);
full_adder f1(t2,sin,cin,sout,cout);
endmodule