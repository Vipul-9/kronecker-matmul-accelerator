`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2024 10:47:01 AM
// Design Name: 
// Module Name: grey_box
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


module grey_box(e,f,sin,cin,sout,cout);
input e,f,sin,cin;
output sout,cout;
wire t1;

nand a1(t1,e,f);
full_adder m2(t1,sin,cin,sout,cout);
endmodule