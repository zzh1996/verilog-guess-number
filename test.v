`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:32:56 11/30/2015
// Design Name:   top
// Module Name:   S:/verilog/game/test.v
// Project Name:  game
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg clk;
	reg [7:0] sw;
	reg [3:0] btn;

	// Outputs
	wire [3:0] an;
	wire [6:0] seg;
	wire dp;
	wire [7:0] led;
	wire [19:0] data;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.sw(sw), 
		.btn(btn), 
		.an(an), 
		.seg(seg), 
		.dp(dp), 
		.led(led),
		.data(data)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		sw = 0;
		btn = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		while(1)
		begin
		#20000000;
		btn[0]=1;
		#20000000;
		btn[0]=0;
		end

	end
	
	always #10 clk=~clk;
      
endmodule

