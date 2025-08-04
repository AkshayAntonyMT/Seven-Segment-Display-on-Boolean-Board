`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2025 04:11:23 PM
// Design Name: 
// Module Name: rgb
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


module rgb(
input clk,
output reg ra,ga,ba,rb,gb,bb
    );
    
reg [30:0] count;
reg tick;
reg [1:0]c;
 always@(posedge clk)
 begin
 if (count >= 99_999_999) begin
    count <= 0;
    tick <= 1;
    end
 else
    count <= count+1;
  end
  
  always@(posedge tick)
  begin
  c=c+1;
  if(c==0) begin
  ra=1;
  bb=1;
  ga=0;
  rb=0;
  ba=0;
  gb=0;
  end
  else if(c==1)begin
  ga=1;
  rb=1;
  ra=0;
  bb=0;
  ba=0;
  gb=0;
  end
  else begin
  ba=1;
  gb=1;
  ga=0;
  rb=0;
  ra=0;
  bb=0;
  end
  end
endmodule
