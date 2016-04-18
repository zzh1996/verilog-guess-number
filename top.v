`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:20:00 11/30/2015 
// Design Name: 
// Module Name:    top 
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

module button(//按钮消抖
	input in,
	input clk,
	output reg op=0
	);
	
	reg out=0;
	reg [31:0] cnt=0;
	
	always@(posedge clk)
	begin
		if(in!=out)
			cnt<=cnt+1;
		else
			cnt<=0;
		if(cnt>=500000)
		begin
			out<=in;
			cnt<=0;
		end
		if(cnt>=500000&&in)
		begin
			op<=1;
		end
		if(op)
			op<=0;
	end
endmodule

module switch(//开关消抖
	input in,
	input clk,
	output reg out=0
	);
	
	reg [31:0] cnt=0;
	
	always@(posedge clk)
	begin
		if(in!=out)
			cnt<=cnt+1;
		else
			cnt<=0;
		if(cnt>=500000)
		begin
			out<=in;
			cnt<=0;
		end
	end
endmodule

module clock(//指定频率时钟
	input clk,
	input [31:0]max,
	output reg c=0
	);
	
	reg [31:0]count1;
	
	always@(posedge clk)
	begin
		if(count1>=max)
		begin
			count1<=0;
			c<=~c;
		end
		else count1<=count1+1;
	end
endmodule

module display(//数码管
	input clk,
	input [19:0]num,
	output reg [3:0]an=4'b1110,
	output reg [6:0]seg
	);
	
	wire t1;
	reg [1:0]c=0;
	reg [4:0]n;
	
	clock cl(clk,25000,t1);
	
	always@(posedge t1)
	begin
		an<={an[2:0],an[3]};
		c<=c+1;
	end
	
	always@(*)
	begin
		case(n)
			0:seg=7'b1000000;//0 O
			1:seg=7'b1111001;//1 I
			2:seg=7'b0100100;//2
			3:seg=7'b0110000;//3
			4:seg=7'b0011001;//4
			5:seg=7'b0010010;//5 S
			6:seg=7'b0000010;//6
			7:seg=7'b1111000;//7
			8:seg=7'b0000000;//8
			9:seg=7'b0010000;//9 g
			10:seg=7'b0001000;//A
			11:seg=7'b0000011;//b
			12:seg=7'b1000110;//C
			13:seg=7'b0100001;//d
			14:seg=7'b0000110;//E
			15:seg=7'b0001110;//F
			16:seg=7'b0001001;//H
			17:seg=7'b1110001;//J
			18:seg=7'b1000111;//L
			19:seg=7'b0101011;//n
			20:seg=7'b0001100;//P
			21:seg=7'b0011000;//q
			22:seg=7'b0101111;//r
			23:seg=7'b0000111;//t
			24:seg=7'b1000001;//U
			25:seg=7'b0010001;//y
			26:seg=7'b0111111;//-
			27:seg=7'b1110111;//_
			28:seg=7'b1111011;//i
			29:seg=7'b0100011;//o
			30:seg=7'b1100011;//u
			31:seg=7'b1111111;//
		endcase
	end
	
	always@(*)
	begin
		case(c)
			0:n=num[4:0];
			1:n=num[9:5];
			2:n=num[14:10];
			3:n=num[19:15];
		endcase
	end
endmodule

module edit(//四位数字输入
	input clk,
	input rst,
	input left,
	input right,
	input inc,
	input dec,
	output reg [1:0]curr=3,
	output reg [15:0]num=0
	);
	
	always@(posedge clk or posedge rst)
	begin
		if(rst)
			curr<=3;
		else if(left)
			curr<=curr+1;
		else if(right)
			curr<=curr-1;
	end
	
	always@(posedge clk or posedge rst)
	begin
		if(rst)begin
			num<=0;
		end
		else if(inc)
			case(curr)
				0:num[3:0]<=num[3:0]<9?num[3:0]+1:0;
				1:num[7:4]<=num[7:4]<9?num[7:4]+1:0;
				2:num[11:8]<=num[11:8]<9?num[11:8]+1:0;
				3:num[15:12]<=num[15:12]<9?num[15:12]+1:0;
			endcase
		else if(dec)
			case(curr)
				0:num[3:0]<=num[3:0]>0?num[3:0]-1:9;
				1:num[7:4]<=num[7:4]>0?num[7:4]-1:9;
				2:num[11:8]<=num[11:8]>0?num[11:8]-1:9;
				3:num[15:12]<=num[15:12]>0?num[15:12]-1:9;
			endcase
	end
endmodule

module showedit(//数字输入显示
	input clk,
	input [15:0]num,
	input [1:0]curr,
	output reg [19:0]data//={5'd18,5'd0,5'd10,5'd13}
	);
	
	wire t;
	reg s=0;
	
	clock cl(clk,5000000,t);
	
	always@(posedge t)
	begin
		s<=~s;
	end
	
	always@(*)
	begin
		if(s)
			data={1'b0,num[15:12],1'b0,num[11:8],1'b0,num[7:4],1'b0,num[3:0]};
		else
			case(curr)
				0:data={1'b0,num[15:12],1'b0,num[11:8],1'b0,num[7:4],5'd27};
				1:data={1'b0,num[15:12],1'b0,num[11:8],5'd27,1'b0,num[3:0]};
				2:data={1'b0,num[15:12],5'd27,1'b0,num[7:4],1'b0,num[3:0]};
				3:data={5'd27,1'b0,num[11:8],1'b0,num[7:4],1'b0,num[3:0]};
			endcase
	end
endmodule

module mem(//游戏数据
	input [2:0]addr,
	input [15:0]idata,
	input we,
	output reg [15:0]odata
	);
	
	reg [15:0]data0;
	reg [15:0]data1;
	reg [15:0]data2;
	reg [15:0]data3;
	reg [15:0]data4;
	reg [15:0]data5;
	reg [15:0]data6;
	reg [15:0]data7;
	
	always@(*)
	begin
		case(addr)
			0:odata=data0;
			1:odata=data1;
			2:odata=data2;
			3:odata=data3;
			4:odata=data4;
			5:odata=data5;
			6:odata=data6;
			7:odata=data7;
		endcase
	end
	
	always@(posedge we)
	begin
		case(addr)
			0:data0<=idata;
			1:data1<=idata;
			2:data2<=idata;
			3:data3<=idata;
			4:data4<=idata;
			5:data5<=idata;
			6:data6<=idata;
			7:data7<=idata;
		endcase
	end
endmodule

module nosame(//无相同数字
	input [15:0]num,
	output ok
	);
	
	wire [3:0]n0;
	wire [3:0]n1;
	wire [3:0]n2;
	wire [3:0]n3;
	
	assign n0=num[3:0];
	assign n1=num[7:4];
	assign n2=num[11:8];
	assign n3=num[15:12];
	
	assign ok=n0!=n1&&n0!=n2&&n0!=n3&&n1!=n2&&n1!=n3&&n2!=n3;
endmodule

module judge(//判定几A几B
	input [15:0]ans,
	input [15:0]num,
	output [2:0]a,
	output [2:0]b
	);
	
	wire [3:0]n0;
	wire [3:0]n1;
	wire [3:0]n2;
	wire [3:0]n3;
	wire [3:0]a0;
	wire [3:0]a1;
	wire [3:0]a2;
	wire [3:0]a3;
	
	assign n0=num[3:0];
	assign n1=num[7:4];
	assign n2=num[11:8];
	assign n3=num[15:12];
	assign a0=ans[3:0];
	assign a1=ans[7:4];
	assign a2=ans[11:8];
	assign a3=ans[15:12];
	
	assign a=(n0==a0)+(n1==a1)+(n2==a2)+(n3==a3);
	assign b=(n0==a1)+(n0==a2)+(n0==a3)
			  +(n1==a0)+(n1==a2)+(n1==a3)
			  +(n2==a0)+(n2==a1)+(n2==a3)
			  +(n3==a0)+(n3==a1)+(n3==a2);
endmodule

module showjudge(//显示判定结果
	input [15:0]ans,
	input [15:0]num,
	output [19:0]data
	);
	
	wire [2:0]a;
	wire [2:0]b;
	judge j(ans,num,a,b);
	
	assign data={2'd0,a,5'd10,2'd0,b,5'd11}; 
endmodule

module showrec(//显示历史记录
	input clk,
	input rst,
	input [2:0]currrec,
	input inc,
	input dec,
	input [15:0]memdata,
	input [15:0]ans,
	output reg [19:0]data,
	output [2:0]addr
	);
	
	clock cl(clk,12500000,c);
	reg [1:0]state=0;
	reg [2:0]showrec=0;
	wire [19:0]judgedata;
	showjudge sj(ans,memdata,judgedata);
	
	wire [3:0]showrecplus1;
	assign showrecplus1=showrec+1;
	
	assign addr=showrec;
	
	wire operate;
	assign operate=inc|dec|rst;
	
	always@(posedge c or posedge operate)
	begin
		if(operate)
			state<=0;
		else if(state==2)
			state<=0;
		else
			state<=state+1;
	end
	
	always@(*)
	begin
		if(currrec==0)
			data={5'd19,5'd29,5'd19,5'd14};
		else
			case(state)
				0:data={1'd0,showrecplus1,5'd29,5'd15,2'd0,currrec};
				1:data={1'b0,memdata[15:12],1'b0,memdata[11:8],1'b0,memdata[7:4],1'b0,memdata[3:0]};
				2:data=judgedata;
				3:data=0;
			endcase
	end
	
	always@(posedge clk)
	begin
		if(showrec>=currrec)
			showrec<=0;
		else if(inc)
		begin
			if(showrec<currrec-1)
				showrec<=showrec+1;
			else
				showrec<=0;
		end
		else if(dec)
		begin
			if(showrec>0)
				showrec<=showrec-1;
			else
				showrec<=currrec-1;
		end
	end
endmodule

module hello(//欢迎
	input clk,
	output [19:0]data
	);
	
	reg [44:0]txt={5'd31,5'd31,5'd31,5'd31,5'd16,5'd14,5'd18,5'd18,5'd0};
	wire c;
	
	clock cl(clk,5000000,c);
	
	always@(posedge c)
	begin
		txt<={txt[39:0],txt[44:40]};
	end
	
	assign data=txt[44:25];
endmodule

module cong(//祝贺
	input clk,
	input rst,
	output [19:0]data
	);
	
	reg [94:0]txt;
	wire c;
	
	clock cl(clk,5000000,c);
	
	always@(posedge c or posedge rst)
	begin
		if(rst)
			txt<={5'd31,5'd31,5'd31,5'd31,5'd12,5'd29,5'd19,5'd9,5'd22,5'd10,5'd23,5'd24,5'd18,5'd10,5'd23,5'd28,5'd29,5'd19,5'd5};
		else
			txt<={txt[89:0],txt[94:90]};
	end
	
	assign data=txt[94:75];
endmodule

module lose(
	input clk,
	input rst,
	input [15:0]num,
	output [19:0]data
	);
	
	clock cl(clk,20000000,c);
	reg s=0;
	
	always@(posedge c or posedge rst)
	begin
		if(rst)
			s<=0;
		else
			s<=~s;
	end
	
	assign data=s?{1'b0,num[15:12],1'b0,num[11:8],1'b0,num[7:4],1'b0,num[3:0]}:{5'd18,5'd0,5'd5,5'd14};
endmodule

module gameover(
	input clk,
	input rst,
	input win,
	input [15:0]num,
	output [19:0]data
	);
	
	wire [19:0]data1,data2;
	cong cong1(clk,rst,data1);
	lose lose1(clk,rst,num,data2);
	
	assign data=win?data1:data2;
endmodule

module rndgen(//随机数产生
	input clk,
	output reg [15:0]random=0123
	);
	
	reg [15:0]rnd;
	wire ok;
	
	nosame n(rnd,ok);
	
	always@(posedge clk)
	begin
		if(ok)
			random<=rnd;
	end
	
	always@(posedge clk)
	begin
		if(rnd[3:0]<9)
			rnd[3:0]<=rnd[3:0]+1;
		else
			rnd[3:0]<=0;
		if(rnd[3:0]==9)
			if(rnd[7:4]<9)
				rnd[7:4]<=rnd[7:4]+1;
			else
				rnd[7:4]<=0;
		if(rnd[7:4]==9&&rnd[3:0]==9)
			if(rnd[11:8]<9)
				rnd[11:8]<=rnd[11:8]+1;
			else
				rnd[11:8]<=0;
		if(rnd[11:8]==9&&rnd[7:4]==9&&rnd[3:0]==9)
			if(rnd[15:12]<9)
				rnd[15:12]<=rnd[15:12]+1;
			else
				rnd[15:12]<=0;
	end
endmodule

module submit(
	input [15:0]ans,
	input [15:0]num,
	output [19:0]data
	);
	
	wire [19:0]sjdata;
	wire ok;
	
	showjudge sj(ans,num,sjdata);
	nosame n(num,ok);
	
	assign data=ok?sjdata:{5'd14,5'd22,5'd22,5'd31};
endmodule

module twinkle(
	input clk,
	input [2:0]n,
	output o
	);
	
	reg [7:0]br0=0;
	reg [6:0]cnt=0;
	wire c;
	wire [7:0]br;
	wire [7:0]brc=(br0+(n<<5))%256;
	clock c1(clk,250000,c);
	
	assign br=brc<128?brc:255-brc;
	
	always@(posedge c)
	begin
		br0<=br0+1;
	end
	
	always@(posedge clk)
	begin
		cnt<=cnt+1;
	end
	
	assign o=br>=cnt;
endmodule

module twinkle8(
	input clk,
	output [7:0]o
	);
	
	twinkle t0(clk,0,o[0]);
	twinkle t1(clk,1,o[1]);
	twinkle t2(clk,2,o[2]);
	twinkle t3(clk,3,o[3]);
	twinkle t4(clk,4,o[4]);
	twinkle t5(clk,5,o[5]);
	twinkle t6(clk,6,o[6]);
	twinkle t7(clk,7,o[7]);
endmodule

module sound(
	input clk,
	input press,
	input guesswrong,
	input win,
	output reg beep
	);
	
	wire music_out;
	reg press_en=0;
	reg [31:0]press_cnt=0;
	reg guesswrong_en=0;
	
	wire press_sound;
	wire guesswrong_sound;
	
	reg [3:0]guesswrong_node=0;
	
	music music1(clk,win,music_out);
	
	always@(posedge clk)
	begin
		if(press)begin
			press_en<=1;
			press_cnt<=5000000;
		end else if(press_cnt>0) begin
			press_cnt<=press_cnt-1;
		end else if(press_cnt==0) begin
			press_en<=0;
		end
	end
	
	clock c1(clk,20000,press_sound);
	
	wave wv(clk,guesswrong_node,guesswrong_sound);
	
	reg [31:0]guesswrong_cnt=0;
	
	always@(posedge clk)
	begin
		if(guesswrong)begin
			guesswrong_en<=1;
			guesswrong_node<=15;
			guesswrong_cnt<=2500000;
		end else if(guesswrong_cnt>0)
			guesswrong_cnt<=guesswrong_cnt-1;
		else if(guesswrong_cnt==0)begin
			guesswrong_cnt<=2500000;
			if(guesswrong_node>1)
				guesswrong_node<=guesswrong_node-1;
			else
				guesswrong_en<=0;
		end
	end
	
	always@(*)
	begin
		if(press_en)
			beep=press_sound;
		else if(guesswrong_en)
			beep=guesswrong_sound;
		else if(win)
			beep=music_out;
		else
			beep=1;
	end
endmodule

module top(
	input clk,//时钟
	input [7:0]sw,//拨动开关
	input [3:0]btn,//按钮
	output [3:0]an,//数码管使能
	output [6:0]seg,//数码管
	output dp,//数码管小数点
	output [7:0]led,//LED
	output beep//蜂鸣器
	);
	
	wire [19:0]edit_disp;//数字输入模块 数码管
	wire [19:0]hello_disp;//欢迎模块 数码管
	wire [19:0]rec_disp;//记录查看模块 数码管
	wire [19:0]submit_disp;//提交结果模块 数码管
	wire [19:0]gameover_disp;
	reg [19:0]disp;//数码管内容
	
	wire key_l,key_r,key_i,key_d;//消抖后 四个键
	reg edit_l,edit_r,edit_i,edit_d;//数字输入模块 按键
	reg rec_i,rec_d;//记录查看模块 按键
	
	wire [15:0]mem_odata;//内存输出
	
	reg [2:0]mem_addr;//内存地址
	wire [2:0]rec_addr;//查看模块请求读地址
	wire [15:0]mem_idata;//内存写数据
	reg mem_we=0;
	
	reg [3:0]curr_rec=0;//当前猜测计数
	reg [15:0]ans=16'h1234;//正确答案
	
	wire [15:0]edit_num;//当前输入内容
	
	reg [1:0]gamestate=0;//游戏状态 0:欢迎 1:输入 2:判定 3:游戏结束
	
	wire [15:0]random;//随机数
	
	wire nosame_ok;//无重复数字
	
	wire sw0,sw1,sw2,sw3,sw4,sw5,sw6,sw7;//消抖后开关
	
	wire sound_out;//声音输出
	
	wire [2:0]judge_a,judge_b;//判断结果
	
	reg win=0;//输赢
	
	reg gameover_rst=0;//游戏结束画面复位
	wire showrec_rst;//显示记录复位
	reg edit_rst=0;//输入数字复位
	
	wire [7:0]tw;//闪烁
	
	reg guess_wrong=0;
	
	//状态转换
	always@(posedge clk or posedge sw7)
	begin
		if(sw7)begin
			gamestate<=0;
			curr_rec<=0;
			win<=0;
		end
		else begin
			guess_wrong<=0;
			case(gamestate)
				0:begin
					if(key_l|key_r|key_i|key_d)begin
						gamestate<=1;
						curr_rec<=0;
						ans<=random;
						edit_rst<=1;
					end
				end
				1:begin
					edit_rst<=0;
					if(sw1&&~sw0)begin//提交猜测
						gamestate<=2;
						if(nosame_ok)begin
							curr_rec<=curr_rec+1;
							mem_we<=1;
							if(judge_a!=4)
								guess_wrong<=1;
						end
					end
				end
				2:begin
					if(nosame_ok)begin
						mem_we<=0;
						if(judge_a==4)begin
							win<=1;
							curr_rec<=curr_rec-1;
							gamestate<=3;
							gameover_rst<=1;
						end else if(curr_rec==8)begin
							win<=0;
							gamestate<=3;
							gameover_rst<=1;
						end
					end
					if(~sw1)
						gamestate<=1;
				end
				3:begin
					gameover_rst<=0;
					if(~sw1)begin
						gamestate<=0;
						curr_rec<=0;
						win<=0;
					end
				end
			endcase
		end
	end
	
	//游戏状态处理
	always@(*)
	begin
		if(sw6)begin//看答案
			disp={1'b0,ans[15:12],1'b0,ans[11:8],1'b0,ans[7:4],1'b0,ans[3:0]};
			mem_addr=0;
			edit_i=0;
			edit_d=0;
			edit_l=0;
			edit_r=0;
			rec_i=0;
			rec_d=0;
		end else
		if(gamestate==0)begin//欢迎
			disp=hello_disp;
			mem_addr=0;
			edit_l=0;
			edit_r=0;
			edit_i=0;
			edit_d=0;
			rec_i=0;
			rec_d=0;
		end else if(gamestate==3)begin//游戏结束
			disp=gameover_disp;
			mem_addr=0;
			edit_i=0;
			edit_d=0;
			edit_l=0;
			edit_r=0;
			rec_i=0;
			rec_d=0;
		end else if(sw0)begin//查看记录
			disp=rec_disp;
			mem_addr=rec_addr;
			edit_l=0;
			edit_r=0;
			edit_i=0;
			edit_d=0;
			rec_i=key_i;
			rec_d=key_d;
		end else begin
			if(gamestate==1)begin//输入
				disp=edit_disp;
				mem_addr=curr_rec[2:0];
				edit_i=key_i;
				edit_d=key_d;
				edit_l=key_l;
				edit_r=key_r;
				rec_i=0;
				rec_d=0;
			end else begin//判定
				disp=submit_disp;
				mem_addr=curr_rec[2:0];
				edit_i=0;
				edit_d=0;
				edit_l=0;
				edit_r=0;
				rec_i=0;
				rec_d=0;
			end
		end
	end
	
	//按键消抖
	button b1(btn[3],clk,key_l);
	button b2(btn[2],clk,key_r);
	button b3(btn[1],clk,key_i);
	button b4(btn[0],clk,key_d);
	
	//开关消抖
	switch s0(sw[0],clk,sw0);
	switch s1(sw[1],clk,sw1);
	switch s2(sw[2],clk,sw2);
	switch s3(sw[3],clk,sw3);
	switch s4(sw[4],clk,sw4);
	switch s5(sw[5],clk,sw5);
	switch s6(sw[6],clk,sw6);
	switch s7(sw[7],clk,sw7);
	
	//随机数
	rndgen rndgen1(clk,random);
	
	//游戏数据
	mem mem1(mem_addr,mem_idata,mem_we,mem_odata);
	assign mem_idata=edit_num;
	
	//七段数码管显示
	display display1(clk,disp,an,seg);
	
	//欢迎模块
	hello hello1(clk,hello_disp);
	
	//声音模块
	sound sound1(clk,key_l|key_r|key_i|key_d,guess_wrong,win,sound_out);
	assign beep=sw5?sound_out:1;
	
	//数字输入模块
	wire [1:0]edit_currdigit;
	edit edit1(clk,edit_rst,edit_l,edit_r,edit_i,edit_d,edit_currdigit,edit_num);
	showedit showedit1(clk,edit_num,edit_currdigit,edit_disp);
	
	//记录查看模块
	showrec showrec1(clk,showrec_rst,curr_rec[2:0],rec_i,rec_d,mem_odata,ans,rec_disp,rec_addr);
	assign showrec_rst=~sw0;
	
	//判断无重复数字
	nosame nosame1(edit_num,nosame_ok);
	
	//判断几A几B
	judge judge1(ans,edit_num,judge_a,judge_b);
	
	//提交结果模块
	submit submit1(ans,edit_num,submit_disp);
	
	//游戏结束
	gameover gameover1(clk,gameover_rst,win,ans,gameover_disp);
	
	//LED闪烁
	twinkle8 twinkle81(clk,tw);
	
	assign dp=1;
	assign led=(8'b11111111<<curr_rec)&tw;
endmodule
