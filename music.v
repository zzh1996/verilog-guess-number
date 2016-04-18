`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:47:34 12/02/2015 
// Design Name: 
// Module Name:    music 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module wave(
	input clk,
	input [3:0]node,
	output reg wav
	);
	
	reg [31:0]cnt;
	reg [31:0]max;
	
	always@(*)
	begin
		case(node)
			0:max=-1;
			1:max=47778;
			2:max=42566;
			3:max=37922;
			4:max=35793;
			5:max=31888;
			6:max=28409;
			7:max=25310;
			8:max=23889;
			9:max=21283;
			10:max=18961;
			11:max=17897;
			12:max=15944;
			13:max=14205;
			14:max=12655;
			15:max=11945;
		endcase
	end
	
	always@(posedge clk)
	begin
		if(cnt>=max)
		begin
			cnt<=0;
			wav<=~wav;
		end
		else
			cnt<=cnt+1;
	end
	
endmodule

module music(
	input clk,
	input rst_n,
	output beep
   );
	 
	reg [207:0]music=0;
	reg [207:0]delay=0;
	
	reg [31:0]max;
	reg [31:0]cnt;
	reg t;
	reg [3:0]left=0;
	reg wt=0;
	reg [3:0]node;
	
	wave w(clk,node,beep);
	
	always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			cnt<=0;
		else if(cnt>=max)
		begin
			cnt<=0;
			t<=~t;
		end
		else
			cnt<=cnt+1;
	end
	
	always@(posedge t or negedge rst_n)
	begin
		if(~rst_n)begin
			left<=1;
			wt<=0;
			node<=0;
			music<=208'h58898766699a98755aaba986556978_58887787659a98c5556978;
			delay<=208'h221111222211112222111122112224_2222422224222222112226;
		end else begin
			left<=left-1;
			if(left==1)
			begin
				if(wt)
				begin
					music<={music[203:0],music[207:204]};
					delay<={delay[203:0],delay[207:204]};
					node<=music[207:204];
					left<=delay[207:204];
					max<=5172413;
					wt<=0;
				end
				else
				begin
					node<=0;
					left<=1;
					max<=250000;
					wt<=1;
				end
			end
		end
	end

endmodule

