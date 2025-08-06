`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2025 11:54:21 PM
// Design Name: 
// Module Name: sev
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


module sev(
input clk,
input [3:0]a,
input [3:0]b,
input [3:0]c,
input [3:0]d,
output reg [7:0]anode,
output reg [6:0]seven,
output dp
);

reg [1:0] refresh;
reg [3:0]value;
reg [16:0] count = 0;  // Can count up to at least 100000
reg [1:0] refresh = 0;

assign dp = 1;

always @(posedge clk) begin
    if (count >= 100_000) begin
        count <= 0;
        refresh <= refresh + 1;
    end
     else begin
        count <= count + 1;
    end
end

always@(*)
begin
case(refresh)
2'b00: begin
    anode = 8'b11111110;
    value = a;
    end
2'b01:begin
    anode = 8'b11111101;
    value = b;
    end
2'b10:begin
    anode = 8'b11111011;
    value = c;
    end
2'b11:begin
    anode = 8'b11110111;
    value = d;
    end
    endcase
    
case(value)
    7'h0: seven = 7'b0000001;
    7'h1: seven = 7'b1001111;
    7'h2: seven = 7'b0010010;
    7'h3: seven = 7'b0000110;
    7'h4: seven = 7'b1001100;
    7'h5: seven = 7'b0100100;
    7'h6: seven = 7'b0100000;
    7'h7: seven = 7'b0001111;
    7'h8: seven = 7'b0000000;
    7'h9: seven = 7'b0000100;
    7'hA: seven = 7'b0001000;
    7'hB: seven = 7'b0000000;
    7'hC: seven = 7'b0110001;
    7'hD: seven = 7'b0000001;
    7'hE: seven = 7'b0110000;
    7'hF: seven = 7'b0111000;
    default: seven = 7'b1111110;
endcase
    end
endmodule
