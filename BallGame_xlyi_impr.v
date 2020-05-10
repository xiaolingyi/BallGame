/***************************************************************************************************
  Function: realize a ball game on the 16x16 matrix LED
  Author: Yi Xiaoling , based on Li Wensong'work 
ps:I will add my own improvement after come back to school  
This is 16×16 LED,and pause function,random initial ball position... 
Now only do the 16×16 LED part ,without corner deal....
  Student number: 16300720102                                                               
*****************************************************************************************************/
module BallGame_xlyi(clk,rst_n,left,right,GameOver,LED_R,LED_C,R,C,R_next,C_next,v_Horizon,v_Vertical,object_R0);
 
  input clk;
  input rst_n;
  input left;
  input right;
  input pause;
 
  output  GameOver; //GameOver=1 结束游戏，=0继续游戏
  output  [15:0] LED_R; //行
  output  [15:0] LED_C; //列
  output  [3:0]R;  //球现在的位置（R,C)，{R,C}的组合值决定LED点亮的位置
  output  [3:0]C;  
  output  [3:0]R_next;//球下一状态行和列的位置
  output  [3:0]C_next;
  output  v_Horizon; //水平速度
  output  v_Vertical; //垂直速度
  output  [15:0]object_R0; //第0行目标位置,每一位代表该0行该列的LED亮或不亮
       
  reg GameOver;
  reg [15:0] LED_R;
  reg [15:0] LED_C;
  reg [3:0] R;
  reg [3:0] C;
  reg [3:0] R_next; 
  reg [3:0] C_next;
  reg v_Horizon;
  reg v_Vertical;
  reg v_Horizon_Next; 
  reg v_Vertical_Next;
  reg [3:0]board; //board状态（0~15）
  reg [3:0]board_next; //弹板下一位置
  reg [1:0]scan_control;  //用于扫描控制
  reg divid_clk; //分频时钟
  reg [5:0] div_cnt; //分频计数器
  reg [7:0]object_R0;


	always @(posedge clk or negedge rst_n) //扫描控制信号的设置
		 if(rst_n==0)
			scan_control<= 0;
		 else if(scan_control==3'd2)  
			  scan_control <= 0;
			else
			  scan_control <= scan_control+1;


	always @(posedge clk or negedge rst_n)   //扫描显示。若scan_cnt为低电平，则根据（R,C）显示出球的位置来。
	        if(rst_n==0)                            //若scan_cnt为高电平，则根据board显示弹板的位置。
				begin   //初始化目标位置
					LED_R <= 16'b00000000_0000_0001;
					LED_C <= 16'b11111111_11111111;
					object_R0 <= 16'b11111111_11111111; //一开始第0行全亮
				end
			else
			   begin
			   if(scan_control==0) //scan_control为0时显示球所在的位置
					begin
						case({R,C})


8'h00:

 begin

  LED_R<=16'd1;

  LED_C<=16'd1;

 end

8'h01:

 begin

  LED_R<=16'd1;

  LED_C<=16'd2;

 end

8'h02:

 begin

  LED_R<=16'd1;

  LED_C<=16'd4;

 end

8'h03:

 begin

  LED_R<=16'd1;

  LED_C<=16'd8;

 end

8'h04:

 begin

  LED_R<=16'd1;

  LED_C<=16'd16;

 end

8'h05:

 begin

  LED_R<=16'd1;

  LED_C<=16'd32;

 end

8'h06:

 begin

  LED_R<=16'd1;

  LED_C<=16'd64;

 end

8'h07:

 begin

  LED_R<=16'd1;

  LED_C<=16'd128;

 end

8'h08:

 begin

  LED_R<=16'd1;

  LED_C<=16'd256;

 end

8'h09:

 begin

  LED_R<=16'd1;

  LED_C<=16'd512;

 end

8'h0a:

 begin

  LED_R<=16'd1;

  LED_C<=16'd1024;

 end

8'h0b:

 begin

  LED_R<=16'd1;

  LED_C<=16'd2048;

 end

8'h0c:

 begin

  LED_R<=16'd1;

  LED_C<=16'd4096;

 end

8'h0d:

 begin

  LED_R<=16'd1;

  LED_C<=16'd8192;

 end

8'h0e:

 begin

  LED_R<=16'd1;

  LED_C<=16'd16384;

 end

8'h0f:

 begin

  LED_R<=16'd1;

  LED_C<=16'd32768;

 end

8'h10:

 begin

  LED_R<=16'd2;

  LED_C<=16'd1;

 end

8'h11:

 begin

  LED_R<=16'd2;

  LED_C<=16'd2;

 end

8'h12:

 begin

  LED_R<=16'd2;

  LED_C<=16'd4;

 end

8'h13:

 begin

  LED_R<=16'd2;

  LED_C<=16'd8;

 end

8'h14:

 begin

  LED_R<=16'd2;

  LED_C<=16'd16;

 end

8'h15:

 begin

  LED_R<=16'd2;

  LED_C<=16'd32;

 end

8'h16:

 begin

  LED_R<=16'd2;

  LED_C<=16'd64;

 end

8'h17:

 begin

  LED_R<=16'd2;

  LED_C<=16'd128;

 end

8'h18:

 begin

  LED_R<=16'd2;

  LED_C<=16'd256;

 end

8'h19:

 begin

  LED_R<=16'd2;

  LED_C<=16'd512;

 end

8'h1a:

 begin

  LED_R<=16'd2;

  LED_C<=16'd1024;

 end

8'h1b:

 begin

  LED_R<=16'd2;

  LED_C<=16'd2048;

 end

8'h1c:

 begin

  LED_R<=16'd2;

  LED_C<=16'd4096;

 end

8'h1d:

 begin

  LED_R<=16'd2;

  LED_C<=16'd8192;

 end

8'h1e:

 begin

  LED_R<=16'd2;

  LED_C<=16'd16384;

 end

8'h1f:

 begin

  LED_R<=16'd2;

  LED_C<=16'd32768;

 end

8'h20:

 begin

  LED_R<=16'd4;

  LED_C<=16'd1;

 end

8'h21:

 begin

  LED_R<=16'd4;

  LED_C<=16'd2;

 end

8'h22:

 begin

  LED_R<=16'd4;

  LED_C<=16'd4;

 end

8'h23:

 begin

  LED_R<=16'd4;

  LED_C<=16'd8;

 end

8'h24:

 begin

  LED_R<=16'd4;

  LED_C<=16'd16;

 end

8'h25:

 begin

  LED_R<=16'd4;

  LED_C<=16'd32;

 end

8'h26:

 begin

  LED_R<=16'd4;

  LED_C<=16'd64;

 end

8'h27:

 begin

  LED_R<=16'd4;

  LED_C<=16'd128;

 end

8'h28:

 begin

  LED_R<=16'd4;

  LED_C<=16'd256;

 end

8'h29:

 begin

  LED_R<=16'd4;

  LED_C<=16'd512;

 end

8'h2a:

 begin

  LED_R<=16'd4;

  LED_C<=16'd1024;

 end

8'h2b:

 begin

  LED_R<=16'd4;

  LED_C<=16'd2048;

 end

8'h2c:

 begin

  LED_R<=16'd4;

  LED_C<=16'd4096;

 end

8'h2d:

 begin

  LED_R<=16'd4;

  LED_C<=16'd8192;

 end

8'h2e:

 begin

  LED_R<=16'd4;

  LED_C<=16'd16384;

 end

8'h2f:

 begin

  LED_R<=16'd4;

  LED_C<=16'd32768;

 end

8'h30:

 begin

  LED_R<=16'd8;

  LED_C<=16'd1;

 end

8'h31:

 begin

  LED_R<=16'd8;

  LED_C<=16'd2;

 end

8'h32:

 begin

  LED_R<=16'd8;

  LED_C<=16'd4;

 end

8'h33:

 begin

  LED_R<=16'd8;

  LED_C<=16'd8;

 end

8'h34:

 begin

  LED_R<=16'd8;

  LED_C<=16'd16;

 end

8'h35:

 begin

  LED_R<=16'd8;

  LED_C<=16'd32;

 end

8'h36:

 begin

  LED_R<=16'd8;

  LED_C<=16'd64;

 end

8'h37:

 begin

  LED_R<=16'd8;

  LED_C<=16'd128;

 end

8'h38:

 begin

  LED_R<=16'd8;

  LED_C<=16'd256;

 end

8'h39:

 begin

  LED_R<=16'd8;

  LED_C<=16'd512;

 end

8'h3a:

 begin

  LED_R<=16'd8;

  LED_C<=16'd1024;

 end

8'h3b:

 begin

  LED_R<=16'd8;

  LED_C<=16'd2048;

 end

8'h3c:

 begin

  LED_R<=16'd8;

  LED_C<=16'd4096;

 end

8'h3d:

 begin

  LED_R<=16'd8;

  LED_C<=16'd8192;

 end

8'h3e:

 begin

  LED_R<=16'd8;

  LED_C<=16'd16384;

 end

8'h3f:

 begin

  LED_R<=16'd8;

  LED_C<=16'd32768;

 end

8'h40:

 begin

  LED_R<=16'd16;

  LED_C<=16'd1;

 end

8'h41:

 begin

  LED_R<=16'd16;

  LED_C<=16'd2;

 end

8'h42:

 begin

  LED_R<=16'd16;

  LED_C<=16'd4;

 end

8'h43:

 begin

  LED_R<=16'd16;

  LED_C<=16'd8;

 end

8'h44:

 begin

  LED_R<=16'd16;

  LED_C<=16'd16;

 end

8'h45:

 begin

  LED_R<=16'd16;

  LED_C<=16'd32;

 end

8'h46:

 begin

  LED_R<=16'd16;

  LED_C<=16'd64;

 end

8'h47:

 begin

  LED_R<=16'd16;

  LED_C<=16'd128;

 end

8'h48:

 begin

  LED_R<=16'd16;

  LED_C<=16'd256;

 end

8'h49:

 begin

  LED_R<=16'd16;

  LED_C<=16'd512;

 end

8'h4a:

 begin

  LED_R<=16'd16;

  LED_C<=16'd1024;

 end

8'h4b:

 begin

  LED_R<=16'd16;

  LED_C<=16'd2048;

 end

8'h4c:

 begin

  LED_R<=16'd16;

  LED_C<=16'd4096;

 end

8'h4d:

 begin

  LED_R<=16'd16;

  LED_C<=16'd8192;

 end

8'h4e:

 begin

  LED_R<=16'd16;

  LED_C<=16'd16384;

 end

8'h4f:

 begin

  LED_R<=16'd16;

  LED_C<=16'd32768;

 end

8'h50:

 begin

  LED_R<=16'd32;

  LED_C<=16'd1;

 end

8'h51:

 begin

  LED_R<=16'd32;

  LED_C<=16'd2;

 end

8'h52:

 begin

  LED_R<=16'd32;

  LED_C<=16'd4;

 end

8'h53:

 begin

  LED_R<=16'd32;

  LED_C<=16'd8;

 end

8'h54:

 begin

  LED_R<=16'd32;

  LED_C<=16'd16;

 end

8'h55:

 begin

  LED_R<=16'd32;

  LED_C<=16'd32;

 end

8'h56:

 begin

  LED_R<=16'd32;

  LED_C<=16'd64;

 end

8'h57:

 begin

  LED_R<=16'd32;

  LED_C<=16'd128;

 end

8'h58:

 begin

  LED_R<=16'd32;

  LED_C<=16'd256;

 end

8'h59:

 begin

  LED_R<=16'd32;

  LED_C<=16'd512;

 end

8'h5a:

 begin

  LED_R<=16'd32;

  LED_C<=16'd1024;

 end

8'h5b:

 begin

  LED_R<=16'd32;

  LED_C<=16'd2048;

 end

8'h5c:

 begin

  LED_R<=16'd32;

  LED_C<=16'd4096;

 end

8'h5d:

 begin

  LED_R<=16'd32;

  LED_C<=16'd8192;

 end

8'h5e:

 begin

  LED_R<=16'd32;

  LED_C<=16'd16384;

 end

8'h5f:

 begin

  LED_R<=16'd32;

  LED_C<=16'd32768;

 end

8'h60:

 begin

  LED_R<=16'd64;

  LED_C<=16'd1;

 end

8'h61:

 begin

  LED_R<=16'd64;

  LED_C<=16'd2;

 end

8'h62:

 begin

  LED_R<=16'd64;

  LED_C<=16'd4;

 end

8'h63:

 begin

  LED_R<=16'd64;

  LED_C<=16'd8;

 end

8'h64:

 begin

  LED_R<=16'd64;

  LED_C<=16'd16;

 end

8'h65:

 begin

  LED_R<=16'd64;

  LED_C<=16'd32;

 end

8'h66:

 begin

  LED_R<=16'd64;

  LED_C<=16'd64;

 end

8'h67:

 begin

  LED_R<=16'd64;

  LED_C<=16'd128;

 end

8'h68:

 begin

  LED_R<=16'd64;

  LED_C<=16'd256;

 end

8'h69:

 begin

  LED_R<=16'd64;

  LED_C<=16'd512;

 end

8'h6a:

 begin

  LED_R<=16'd64;

  LED_C<=16'd1024;

 end

8'h6b:

 begin

  LED_R<=16'd64;

  LED_C<=16'd2048;

 end

8'h6c:

 begin

  LED_R<=16'd64;

  LED_C<=16'd4096;

 end

8'h6d:

 begin

  LED_R<=16'd64;

  LED_C<=16'd8192;

 end

8'h6e:

 begin

  LED_R<=16'd64;

  LED_C<=16'd16384;

 end

8'h6f:

 begin

  LED_R<=16'd64;

  LED_C<=16'd32768;

 end

8'h70:

 begin

  LED_R<=16'd128;

  LED_C<=16'd1;

 end

8'h71:

 begin

  LED_R<=16'd128;

  LED_C<=16'd2;

 end

8'h72:

 begin

  LED_R<=16'd128;

  LED_C<=16'd4;

 end

8'h73:

 begin

  LED_R<=16'd128;

  LED_C<=16'd8;

 end

8'h74:

 begin

  LED_R<=16'd128;

  LED_C<=16'd16;

 end

8'h75:

 begin

  LED_R<=16'd128;

  LED_C<=16'd32;

 end

8'h76:

 begin

  LED_R<=16'd128;

  LED_C<=16'd64;

 end

8'h77:

 begin

  LED_R<=16'd128;

  LED_C<=16'd128;

 end

8'h78:

 begin

  LED_R<=16'd128;

  LED_C<=16'd256;

 end

8'h79:

 begin

  LED_R<=16'd128;

  LED_C<=16'd512;

 end

8'h7a:

 begin

  LED_R<=16'd128;

  LED_C<=16'd1024;

 end

8'h7b:

 begin

  LED_R<=16'd128;

  LED_C<=16'd2048;

 end

8'h7c:

 begin

  LED_R<=16'd128;

  LED_C<=16'd4096;

 end

8'h7d:

 begin

  LED_R<=16'd128;

  LED_C<=16'd8192;

 end

8'h7e:

 begin

  LED_R<=16'd128;

  LED_C<=16'd16384;

 end

8'h7f:

 begin

  LED_R<=16'd128;

  LED_C<=16'd32768;

 end

8'h80:

 begin

  LED_R<=16'd256;

  LED_C<=16'd1;

 end

8'h81:

 begin

  LED_R<=16'd256;

  LED_C<=16'd2;

 end

8'h82:

 begin

  LED_R<=16'd256;

  LED_C<=16'd4;

 end

8'h83:

 begin

  LED_R<=16'd256;

  LED_C<=16'd8;

 end

8'h84:

 begin

  LED_R<=16'd256;

  LED_C<=16'd16;

 end

8'h85:

 begin

  LED_R<=16'd256;

  LED_C<=16'd32;

 end

8'h86:

 begin

  LED_R<=16'd256;

  LED_C<=16'd64;

 end

8'h87:

 begin

  LED_R<=16'd256;

  LED_C<=16'd128;

 end

8'h88:

 begin

  LED_R<=16'd256;

  LED_C<=16'd256;

 end

8'h89:

 begin

  LED_R<=16'd256;

  LED_C<=16'd512;

 end

8'h8a:

 begin

  LED_R<=16'd256;

  LED_C<=16'd1024;

 end

8'h8b:

 begin

  LED_R<=16'd256;

  LED_C<=16'd2048;

 end

8'h8c:

 begin

  LED_R<=16'd256;

  LED_C<=16'd4096;

 end

8'h8d:

 begin

  LED_R<=16'd256;

  LED_C<=16'd8192;

 end

8'h8e:

 begin

  LED_R<=16'd256;

  LED_C<=16'd16384;

 end

8'h8f:

 begin

  LED_R<=16'd256;

  LED_C<=16'd32768;

 end

8'h90:

 begin

  LED_R<=16'd512;

  LED_C<=16'd1;

 end

8'h91:

 begin

  LED_R<=16'd512;

  LED_C<=16'd2;

 end

8'h92:

 begin

  LED_R<=16'd512;

  LED_C<=16'd4;

 end

8'h93:

 begin

  LED_R<=16'd512;

  LED_C<=16'd8;

 end

8'h94:

 begin

  LED_R<=16'd512;

  LED_C<=16'd16;

 end

8'h95:

 begin

  LED_R<=16'd512;

  LED_C<=16'd32;

 end

8'h96:

 begin

  LED_R<=16'd512;

  LED_C<=16'd64;

 end

8'h97:

 begin

  LED_R<=16'd512;

  LED_C<=16'd128;

 end

8'h98:

 begin

  LED_R<=16'd512;

  LED_C<=16'd256;

 end

8'h99:

 begin

  LED_R<=16'd512;

  LED_C<=16'd512;

 end

8'h9a:

 begin

  LED_R<=16'd512;

  LED_C<=16'd1024;

 end

8'h9b:

 begin

  LED_R<=16'd512;

  LED_C<=16'd2048;

 end

8'h9c:

 begin

  LED_R<=16'd512;

  LED_C<=16'd4096;

 end

8'h9d:

 begin

  LED_R<=16'd512;

  LED_C<=16'd8192;

 end

8'h9e:

 begin

  LED_R<=16'd512;

  LED_C<=16'd16384;

 end

8'h9f:

 begin

  LED_R<=16'd512;

  LED_C<=16'd32768;

 end

8'ha0:

 begin

  LED_R<=16'd1024;

  LED_C<=16'd1;

 end

8'ha1:

 begin

  LED_R<=16'd1024;

  LED_C<=16'd2;

 end

8'ha2:

 begin

  LED_R<=16'd1024;

  LED_C<=16'd4;

 end

8'ha3:

 begin

  LED_R<=16'd1024;

  LED_C<=16'd8;

 end

8'ha4:

 begin

  LED_R<=16'd1024;

  LED_C<=16'd16;

 end

8'ha5:

 begin

  LED_R<=16'd1024;

  LED_C<=16'd32;

 end

8'ha6:

 begin

  LED_R<=16'd1024;

  LED_C<=16'd64;

 end

8'ha7:

 begin

  LED_R<=16'd1024;

  LED_C<=16'd128;

 end

8'ha8:

 begin

  LED_R<=16'd1024;

  LED_C<=16'd256;

 end

8'ha9:

 begin

  LED_R<=16'd1024;

  LED_C<=16'd512;

 end

8'haa:

 begin

  LED_R<=16'd1024;

  LED_C<=16'd1024;

 end

8'hab:

 begin

  LED_R<=16'd1024;

  LED_C<=16'd2048;

 end

8'hac:

 begin

  LED_R<=16'd1024;

  LED_C<=16'd4096;

 end

8'had:

 begin

  LED_R<=16'd1024;

  LED_C<=16'd8192;

 end

8'hae:

 begin

  LED_R<=16'd1024;

  LED_C<=16'd16384;

 end

8'haf:

 begin

  LED_R<=16'd1024;

  LED_C<=16'd32768;

 end

8'hb0:

 begin

  LED_R<=16'd2048;

  LED_C<=16'd1;

 end

8'hb1:

 begin

  LED_R<=16'd2048;

  LED_C<=16'd2;

 end

8'hb2:

 begin

  LED_R<=16'd2048;

  LED_C<=16'd4;

 end

8'hb3:

 begin

  LED_R<=16'd2048;

  LED_C<=16'd8;

 end

8'hb4:

 begin

  LED_R<=16'd2048;

  LED_C<=16'd16;

 end

8'hb5:

 begin

  LED_R<=16'd2048;

  LED_C<=16'd32;

 end

8'hb6:

 begin

  LED_R<=16'd2048;

  LED_C<=16'd64;

 end

8'hb7:

 begin

  LED_R<=16'd2048;

  LED_C<=16'd128;

 end

8'hb8:

 begin

  LED_R<=16'd2048;

  LED_C<=16'd256;

 end

8'hb9:

 begin

  LED_R<=16'd2048;

  LED_C<=16'd512;

 end

8'hba:

 begin

  LED_R<=16'd2048;

  LED_C<=16'd1024;

 end

8'hbb:

 begin

  LED_R<=16'd2048;

  LED_C<=16'd2048;

 end

8'hbc:

 begin

  LED_R<=16'd2048;

  LED_C<=16'd4096;

 end

8'hbd:

 begin

  LED_R<=16'd2048;

  LED_C<=16'd8192;

 end

8'hbe:

 begin

  LED_R<=16'd2048;

  LED_C<=16'd16384;

 end

8'hbf:

 begin

  LED_R<=16'd2048;

  LED_C<=16'd32768;

 end

8'hc0:

 begin

  LED_R<=16'd4096;

  LED_C<=16'd1;

 end

8'hc1:

 begin

  LED_R<=16'd4096;

  LED_C<=16'd2;

 end

8'hc2:

 begin

  LED_R<=16'd4096;

  LED_C<=16'd4;

 end

8'hc3:

 begin

  LED_R<=16'd4096;

  LED_C<=16'd8;

 end

8'hc4:

 begin

  LED_R<=16'd4096;

  LED_C<=16'd16;

 end

8'hc5:

 begin

  LED_R<=16'd4096;

  LED_C<=16'd32;

 end

8'hc6:

 begin

  LED_R<=16'd4096;

  LED_C<=16'd64;

 end

8'hc7:

 begin

  LED_R<=16'd4096;

  LED_C<=16'd128;

 end

8'hc8:

 begin

  LED_R<=16'd4096;

  LED_C<=16'd256;

 end

8'hc9:

 begin

  LED_R<=16'd4096;

  LED_C<=16'd512;

 end

8'hca:

 begin

  LED_R<=16'd4096;

  LED_C<=16'd1024;

 end

8'hcb:

 begin

  LED_R<=16'd4096;

  LED_C<=16'd2048;

 end

8'hcc:

 begin

  LED_R<=16'd4096;

  LED_C<=16'd4096;

 end

8'hcd:

 begin

  LED_R<=16'd4096;

  LED_C<=16'd8192;

 end

8'hce:

 begin

  LED_R<=16'd4096;

  LED_C<=16'd16384;

 end

8'hcf:

 begin

  LED_R<=16'd4096;

  LED_C<=16'd32768;

 end

8'hd0:

 begin

  LED_R<=16'd8192;

  LED_C<=16'd1;

 end

8'hd1:

 begin

  LED_R<=16'd8192;

  LED_C<=16'd2;

 end

8'hd2:

 begin

  LED_R<=16'd8192;

  LED_C<=16'd4;

 end

8'hd3:

 begin

  LED_R<=16'd8192;

  LED_C<=16'd8;

 end

8'hd4:

 begin

  LED_R<=16'd8192;

  LED_C<=16'd16;

 end

8'hd5:

 begin

  LED_R<=16'd8192;

  LED_C<=16'd32;

 end

8'hd6:

 begin

  LED_R<=16'd8192;

  LED_C<=16'd64;

 end

8'hd7:

 begin

  LED_R<=16'd8192;

  LED_C<=16'd128;

 end

8'hd8:

 begin

  LED_R<=16'd8192;

  LED_C<=16'd256;

 end

8'hd9:

 begin

  LED_R<=16'd8192;

  LED_C<=16'd512;

 end

8'hda:

 begin

  LED_R<=16'd8192;

  LED_C<=16'd1024;

 end

8'hdb:

 begin

  LED_R<=16'd8192;

  LED_C<=16'd2048;

 end

8'hdc:

 begin

  LED_R<=16'd8192;

  LED_C<=16'd4096;

 end

8'hdd:

 begin

  LED_R<=16'd8192;

  LED_C<=16'd8192;

 end

8'hde:

 begin

  LED_R<=16'd8192;

  LED_C<=16'd16384;

 end

8'hdf:

 begin

  LED_R<=16'd8192;

  LED_C<=16'd32768;

 end

8'he0:

 begin

  LED_R<=16'd16384;

  LED_C<=16'd1;

 end

8'he1:

 begin

  LED_R<=16'd16384;

  LED_C<=16'd2;

 end

8'he2:

 begin

  LED_R<=16'd16384;

  LED_C<=16'd4;

 end

8'he3:

 begin

  LED_R<=16'd16384;

  LED_C<=16'd8;

 end

8'he4:

 begin

  LED_R<=16'd16384;

  LED_C<=16'd16;

 end

8'he5:

 begin

  LED_R<=16'd16384;

  LED_C<=16'd32;

 end

8'he6:

 begin

  LED_R<=16'd16384;

  LED_C<=16'd64;

 end

8'he7:

 begin

  LED_R<=16'd16384;

  LED_C<=16'd128;

 end

8'he8:

 begin

  LED_R<=16'd16384;

  LED_C<=16'd256;

 end

8'he9:

 begin

  LED_R<=16'd16384;

  LED_C<=16'd512;

 end

8'hea:

 begin

  LED_R<=16'd16384;

  LED_C<=16'd1024;

 end

8'heb:

 begin

  LED_R<=16'd16384;

  LED_C<=16'd2048;

 end

8'hec:

 begin

  LED_R<=16'd16384;

  LED_C<=16'd4096;

 end

8'hed:

 begin

  LED_R<=16'd16384;

  LED_C<=16'd8192;

 end

8'hee:

 begin

  LED_R<=16'd16384;

  LED_C<=16'd16384;

 end

8'hef:

 begin

  LED_R<=16'd16384;

  LED_C<=16'd32768;

 end

8'hf0:

 begin

  LED_R<=16'd32768;

  LED_C<=16'd1;

 end

8'hf1:

 begin

  LED_R<=16'd32768;

  LED_C<=16'd2;

 end

8'hf2:

 begin

  LED_R<=16'd32768;

  LED_C<=16'd4;

 end

8'hf3:

 begin

  LED_R<=16'd32768;

  LED_C<=16'd8;

 end

8'hf4:

 begin

  LED_R<=16'd32768;

  LED_C<=16'd16;

 end

8'hf5:

 begin

  LED_R<=16'd32768;

  LED_C<=16'd32;

 end

8'hf6:

 begin

  LED_R<=16'd32768;

  LED_C<=16'd64;

 end

8'hf7:

 begin

  LED_R<=16'd32768;

  LED_C<=16'd128;

 end

8'hf8:

 begin

  LED_R<=16'd32768;

  LED_C<=16'd256;

 end

8'hf9:

 begin

  LED_R<=16'd32768;

  LED_C<=16'd512;

 end

8'hfa:

 begin

  LED_R<=16'd32768;

  LED_C<=16'd1024;

 end

8'hfb:

 begin

  LED_R<=16'd32768;

  LED_C<=16'd2048;

 end

8'hfc:

 begin

  LED_R<=16'd32768;

  LED_C<=16'd4096;

 end

8'hfd:

 begin

  LED_R<=16'd32768;

  LED_C<=16'd8192;

 end

8'hfe:

 begin

  LED_R<=16'd32768;

  LED_C<=16'd16384;

 end

8'hff:

 begin

  LED_R<=16'd32768;

  LED_C<=16'd32768;

 end



	
								default:
								   begin
									   LED_R<=16'b00000000;
									   LED_C<=16'b00000000;
								   end 
						endcase
				    end
			      else if(scan_control==1) //scan_control为1时显示弹板所在的位置
				     begin
					   case(board)
						   4'd0:
						   begin
							   LED_R<=16'b01000000;
							   LED_C<=16'b00111111;
						   end
						   4'd1:
						   begin
							   LED_R<=16'b01000000;
							   LED_C<=16'b01111110;
						   end
						   4'd2:
						   begin
							   LED_R<=16'b01000000;
							   LED_C<=16'b11111100;
						   end
						   4'd3:
						   begin
							   LED_R<=16'b01000000;
							   LED_C<=16'b111111000;
						   end
						   4'd4:
						   begin
							   LED_R<=16'b01000000;
							   LED_C<=16'b1111110000;
						   end
						   4'd5:
						   begin
							   LED_R<=16'b01000000;
							   LED_C<=16'b11111100000;
						   end
						   4'd6:
						   begin
							   LED_R<=16'b01000000;
							   LED_C<=16'b111111000000;
						   end
						   4'd7:
						   begin
							   LED_R<=16'b01000000;
							   LED_C<=16'b1111110000000;
						   end
						   4'd8:
						   begin
							   LED_R<=16'b01000000;
							   LED_C<=16'b11111100_0000_0000;
						   end
						   4'd9:
						   begin
							   LED_R<=16'b01000000;
							   LED_C<=16'b1111110_00000000;
						   end
						   4'd10:
						   begin
							   LED_R<=16'b01000000;
							   LED_C<=16'b11111100_00000000;
						   end
				
						   
						   
						   default:
						   begin
							   LED_R<=16'b00000000;
							   LED_C<=16'b00000000;
						   end
					   endcase
				   end   
				 else   ////scan_control为2时显示目标的状态
					begin
					LED_R <= 16'b00000000_0000_0001;
					LED_C <= object_R0;
					end		
			 end

	always @(*) //球和弹板的位置变化控制。@(*)对其后面语句块中所有输入变量的变化敏感。
		if(GameOver==0)
		    begin
				case({R,C})
				  8'h00:  //左上角反弹位置，它的下一个位置即为（1,1）         
				  begin          
					  R_next=4'd1;          
					  C_next=4'd1;
				  end
				  8'h01,8'h02,8'h03,8'h04,8'h05,8'h06,8'h07,8'h08,8'h09,8'h0a,8'h0b,8'h0c,8'h0d,8'h0e: //最上边的反弹位置
				  begin
					if(v_Horizon==1) //v_Horizon为1 水平速度向左
					  begin
					  R_next=4'd1;
					  C_next=C-4'd1;
					  end           
					else
					begin
					  R_next=4'd1;
					  C_next=C+4'd1;
					  end
				  end
				  8'h0f://右上角反弹位置，它的下一个位置即为（1,15） 
					begin
					R_next=4'd1;
					C_next=4'he;
					end
				  8'hf0,8'hf1,8'hf2,8'hf3,8'hf4,8'hf5,8'hf6,8'hf7,8'hf8,8'hf9,8'hfa,8'hfb,8'hfc,8'hfd,8'hfe,8'hff: //最后一行,下一位置做静止处理
				  begin
					 R_next=R;
					 C_next=C;
				  end       
				  8'h10,8'h20,8'h30,8'h40,8'h50,8'h60,8'h70,8'h80,8'h90,8'ha0,8'hb0,8'hc0,8'hd0,8'he0: //最左边的反弹位置
				  begin
					if(v_Vertical==1) //v_Vertical为1 垂直速度向下
					  begin
					  R_next=R+4'd1;
					  C_next=4'd1;
					  end
					else
					  begin
					  R_next=R-4'd1;
					  C_next=4'd1;
					  end
				  end  
				  8'h1f,8'h2f,8'h3f,8'h4f,8'h5f,8'h6f,8'h7f,8'h8f,8'h9f,8'haf,8'hbf,8'hcf,8'hdf:   //最右边的反弹位置
				  begin
					if(v_Vertical==1)
					  begin
					  R_next=R+4'd1;
					  C_next=4'he;
					  end
					else
					  begin
					  R_next=R-3'd1;
					  C_next=3'he;
					  end
				  end        
				  //球在第15行的特殊处理： 
				  8'he0: //第15行最左边的位置
				  begin
					 if(board==0) //如果碰上弹板，往右上方向反弹
						begin
						   R_next=4'hd;
						   C_next=4'd1;
						 end
					 else
					   begin
						   R_next=R+4'd1;
						   C_next=4'd1;
						end
				  end			  
				  8'he1:
				  begin
					 if(board==0 || board==1) //如果碰上弹板，往右上方向反弹
						begin
						  case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							  begin
								R_next=R-3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R-3'd1;
								C_next=C-3'd1;
								end
						default:
							begin
								R_next=R;
								C_next=C;
							end
					endcase
						 end
					 else
					   begin
						 case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							  begin
								R_next=R+3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R+3'd1;
								C_next=C-3'd1;
								end
							 default:
							  begin
								   R_next=R;
								   C_next=C;
							   end
						 endcase
					  end
					end
				   8'he2:
				   begin
					 if(board==0 || board==1 || board==2) //如果碰上弹板，往右上方向反弹
						begin
						  case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							  begin
								R_next=R-3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R-3'd1;
								C_next=C-3'd1;
								end
						default:
							begin
								R_next=R;
								C_next=C;
							end
					     endcase
						 end
					  else
					   begin
						 case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							  begin
								R_next=R+3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R+3'd1;
								C_next=C-3'd1;
								end
							 default:
							  begin
								   R_next=R;
								   C_next=C;
							   end
						 endcase
					   end
					 end
					8'he3:
					   begin
							if(board==0 ||board==1 || board==2 || board==3) //如果碰上弹板，往右上方向反弹
							  begin
								case({v_Horizon,v_Vertical}) 
									2'b01: //右下
									begin
										R_next=R-3'd1;
										C_next=C+3'd1;
									end
									2'b11: //左下
									begin
										R_next=R-3'd1;
										C_next=C-3'd1;
									end
								default:
									begin
										R_next=R;
										C_next=C;
									end
								endcase
						 end
					 else
					   begin
						 case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							  begin
								R_next=R+3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R+3'd1;
								C_next=C-3'd1;
								end
							 default:
							  begin
								   R_next=R;
								   C_next=C;
							   end
						 endcase
					  end
					end
				  8'he4:
					begin
					 if(board==0 ||board==1 ||board==2 || board==3 || board==4) //如果碰上弹板，往右上方向反弹
						begin
						  case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							  begin
								R_next=R-3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R-3'd1;
								C_next=C-3'd1;
								end
						default:
							begin
								R_next=R;
								C_next=C;
							end
					endcase
						 end
					 else
					   begin
						 case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							  begin
								R_next=R+3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R+3'd1;
								C_next=C-3'd1;
								end
							 default:
							  begin
								   R_next=R;
								   C_next=C;
							   end
						 endcase
					  end
					end
				  8'he5:
					begin
					 if(board==0 ||board==1 ||board==2 ||board==3 || board==4 || board==5) //如果碰上弹板，往右上方向反弹
						begin
						  case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							  begin
								R_next=R-3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R-3'd1;
								C_next=C-3'd1;
								end
						default:
							begin
								R_next=R;
								C_next=C;
							end
					endcase
						 end
					 else
					   begin
						 case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							  begin
								R_next=R+3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R+3'd1;
								C_next=C-3'd1;
								end
							 default:
							  begin
								   R_next=R;
								   C_next=C;
							   end
						 endcase
					  end
					 end
				  8'he6:
				   begin
					 if(board==1 ||board==2 ||board==3 ||board==4 || board==5||board==6) //如果碰上弹板，往右上方向反弹
						begin
						  case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							  begin
								R_next=R-3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R-3'd1;
								C_next=C-3'd1;
								end
						    default:
								begin
									R_next=R;
									C_next=C;
								end
					       endcase
					   end
					 else
					   begin
						 case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							    begin
								R_next=R+3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R+3'd1;
								C_next=C-3'd1;
								end
							 default:
							  begin
								   R_next=R;
								   C_next=C;
							   end
						 endcase
					    end
				   end
				   
				  8'he7:
				  begin
					 if(board==2 ||board==3 ||board==4 || board==5||board==6||board==7) //如果碰上弹板，往右上方向反弹
						begin
						  case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							  begin
								R_next=R-3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R-3'd1;
								C_next=C-3'd1;
								end
						default:
							begin
								R_next=R;
								C_next=C;
							end
					endcase
						 end
					 else
					   begin
						 case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							  begin
								R_next=R+3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R+3'd1;
								C_next=C-3'd1;
								end
							 default:
							  begin
								   R_next=R;
								   C_next=C;
							   end
						 endcase
					  end
					end
				   8'he8:
				   begin
					 if(board==3 ||board==4 || board==5||board==6||board==7||board==8) //如果碰上弹板，往右上方向反弹
						begin
						  case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							  begin
								R_next=R-3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R-3'd1;
								C_next=C-3'd1;
								end
						default:
							begin
								R_next=R;
								C_next=C;
							end
					     endcase
						 end
					  else
					   begin
						 case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							  begin
								R_next=R+3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R+3'd1;
								C_next=C-3'd1;
								end
							 default:
							  begin
								   R_next=R;
								   C_next=C;
							   end
						 endcase
					   end
					 end
					8'he9:
					   begin
							if(board==4 || board==5||board==6||board==7||board==8|| board==9) //如果碰上弹板，往右上方向反弹
							  begin
								case({v_Horizon,v_Vertical}) 
									2'b01: //右下
									begin
										R_next=R-3'd1;
										C_next=C+3'd1;
									end
									2'b11: //左下
									begin
										R_next=R-3'd1;
										C_next=C-3'd1;
									end
								default:
									begin
										R_next=R;
										C_next=C;
									end
								endcase
						 end
					 else
					   begin
						 case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							  begin
								R_next=R+3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R+3'd1;
								C_next=C-3'd1;
								end
							 default:
							  begin
								   R_next=R;
								   C_next=C;
							   end
						 endcase
					  end
					end
				  8'hea:
					begin
					 if(board==5||board==6||board==7||board==8|| board==9|| board==4'ha) //如果碰上弹板，往右上方向反弹
						begin
						  case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							  begin
								R_next=R-3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R-3'd1;
								C_next=C-3'd1;
								end
						default:
							begin
								R_next=R;
								C_next=C;
							end
					endcase
						 end
					 else
					   begin
						 case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							  begin
								R_next=R+3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R+3'd1;
								C_next=C-3'd1;
								end
							 default:
							  begin
								   R_next=R;
								   C_next=C;
							   end
						 endcase
					  end
					end
				  8'heb:
					begin
					 if(board==6||board==7||board==8|| board==9|| board==4'ha|| board==4'hb) //如果碰上弹板，往右上方向反弹
						begin
						  case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							  begin
								R_next=R-3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R-3'd1;
								C_next=C-3'd1;
								end
						default:
							begin
								R_next=R;
								C_next=C;
							end
					endcase
						 end
					 else
					   begin
						 case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							  begin
								R_next=R+3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R+3'd1;
								C_next=C-3'd1;
								end
							 default:
							  begin
								   R_next=R;
								   C_next=C;
							   end
						 endcase
					  end
					 end
				  8'hec:
				   begin
					 if( board==7||board==8|| board==9|| board==4'ha|| board==4'hb|| board==4'hc) //如果碰上弹板，往右上方向反弹
						begin
						  case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							  begin
								R_next=R-3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R-3'd1;
								C_next=C-3'd1;
								end
						    default:
								begin
									R_next=R;
									C_next=C;
								end
					       endcase
					   end
					 else
					   begin
						 case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							    begin
								R_next=R+3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R+3'd1;
								C_next=C-3'd1;
								end
							 default:
							  begin
								   R_next=R;
								   C_next=C;
							   end
						 endcase
					    end
				   end
				   
				   	8'hed:
				   begin
					 if(board==8|| board==9|| board==4'ha|| board==4'hb|| board==4'hc|| board==4'hd) //如果碰上弹板，往右上方向反弹
						begin
						  case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							  begin
								R_next=R-3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R-3'd1;
								C_next=C-3'd1;
								end
						    default:
								begin
									R_next=R;
									C_next=C;
								end
					       endcase
					   end
					 else
					   begin
						 case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							    begin
								R_next=R+3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R+3'd1;
								C_next=C-3'd1;
								end
							 default:
							  begin
								   R_next=R;
								   C_next=C;
							   end
						 endcase
					    end
				   end
				   
				   8'hee:
				   begin
					 if( board==9|| board==4'ha|| board==4'hb|| board==4'hc|| board==4'hd||board==4'he) //如果碰上弹板，往右上方向反弹
						begin
						  case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							  begin
								R_next=R-3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R-3'd1;
								C_next=C-3'd1;
								end
						    default:
								begin
									R_next=R;
									C_next=C;
								end
					       endcase
					   end
					 else
					   begin
						 case({v_Horizon,v_Vertical}) 
							  2'b01: //右下
							    begin
								R_next=R+3'd1;
								C_next=C+3'd1;
								end
							  2'b11: //左下
								begin
								R_next=R+3'd1;
								C_next=C-3'd1;
								end
							 default:
							  begin
								   R_next=R;
								   C_next=C;
							   end
						 endcase
					    end
				   end
				  8'hef:
				  begin
					 if(board==4'ha|| board==4'hb|| board==4'hc|| board==4'hd||board==4'he||board==4'hf) //如果碰上弹板，往右上方向反弹
						begin
						   R_next=4'hd;
						   C_next=4'he;
						 end
					 else
					   begin
						   R_next=R+3'd1;
						   C_next=4'he;
						end
				  end
				8'h11,8'h12,8'h13,8'h14,8'h15,8'h16,8'h17,8'h18,8'h19,8'h1a,8'h1b,8'h1c,8'h1d,8'h1e,

8'h21,8'h22,8'h23,8'h24,8'h25,8'h26,8'h27,8'h28,8'h29,8'h2a,8'h2b,8'h2c,8'h2d,8'h2e,

8'h31,8'h32,8'h33,8'h34,8'h35,8'h36,8'h37,8'h38,8'h39,8'h3a,8'h3b,8'h3c,8'h3d,8'h3e,

8'h41,8'h42,8'h43,8'h44,8'h45,8'h46,8'h47,8'h48,8'h49,8'h4a,8'h4b,8'h4c,8'h4d,8'h4e,

8'h51,8'h52,8'h53,8'h54,8'h55,8'h56,8'h57,8'h58,8'h59,8'h5a,8'h5b,8'h5c,8'h5d,8'h5e,

8'h61,8'h62,8'h63,8'h64,8'h65,8'h66,8'h67,8'h68,8'h69,8'h6a,8'h6b,8'h6c,8'h6d,8'h6e,

8'h71,8'h72,8'h73,8'h74,8'h75,8'h76,8'h77,8'h78,8'h79,8'h7a,8'h7b,8'h7c,8'h7d,8'h7e,

8'h81,8'h82,8'h83,8'h84,8'h85,8'h86,8'h87,8'h88,8'h89,8'h8a,8'h8b,8'h8c,8'h8d,8'h8e,

8'h91,8'h92,8'h93,8'h94,8'h95,8'h96,8'h97,8'h98,8'h99,8'h9a,8'h9b,8'h9c,8'h9d,8'h9e,

8'ha1,8'ha2,8'ha3,8'ha4,8'ha5,8'ha6,8'ha7,8'ha8,8'ha9,8'haa,8'hab,8'hac,8'had,8'hae,

8'hb1,8'hb2,8'hb3,8'hb4,8'hb5,8'hb6,8'hb7,8'hb8,8'hb9,8'hba,8'hbb,8'hbc,8'hbd,8'hbe,

8'hc1,8'hc2,8'hc3,8'hc4,8'hc5,8'hc6,8'hc7,8'hc8,8'hc9,8'hca,8'hcb,8'hcc,8'hcd,8'hce,

8'hd1,8'hd2,8'hd3,8'hd4,8'hd5,8'hd6,8'hd7,8'hd8,8'hd9,8'hda,8'hdb,8'hdc,8'hdd,8'hde
 
				  : //正常运行位置
				  begin
					case({v_Horizon,v_Vertical}) 
					  2'b00: //右上
					  begin
						R_next=R-3'd1;
						C_next=C+3'd1;
					  end
					  2'b01: //右下
					  begin
						R_next=R+3'd1;
						C_next=C+3'd1;
					  end
					  2'b10: //左上
					  begin
						R_next=R-3'd1;
						C_next=C-3'd1;
					  end
					  2'b11:  //左下
					  begin
						R_next=R+3'd1;
						C_next=C-3'd1;
					  end
					  default:
					  begin
						R_next=R;
						C_next=C;
					  end
					endcase
				  end
				  default:
					  begin
						R_next=R;
						C_next=C;
					  end
				 endcase      
		      end
		else if(GameOver==1)  //GameOver后小球再顺势下降到底部，而不是直接停止在弹板那一行
		   begin
		     case({R,C})
			  8'h60:
			  begin
			      R_next=7;
				  C_next=1;
			  end
			  8'h67:
			  begin
			      R_next=7;
				  C_next=6;
			  end
			  default:
			  if(R==4'hf)
			      begin
				     R_next=R;
					 C_next=C;
				   end
			  else
		       begin
		          if(v_Horizon==1) //v_Vertical为1，向左
					  begin
					      R_next=7;
					      C_next=C-3'd1;
					  end
					else  //向右
					   begin
					      R_next=7;
					      C_next=C+3'd1;
					  end
			    end
			  endcase
			end 
			/*	begin
				  R_next=R;
				  C_next=C;
				end  */  

//扫描左右按键
//弹板位置总共有6种（分为0~5个状态）
	always @(*)
		if(rst_n==0)
			board=5;
		else if(GameOver==0)
		  begin
			if(((board==0)&&(left==1)&&(right==0))||((board==4'ha)&&(left==0)&&(right==1))) //如果弹板位置在最左边和最右边，则当左右按键触发后，它的下一个状态保持不变   
			  board_next=board;  
			  else if((left==1)&&(right==0)) 
				board_next=board-3'd1;
				else if((left==0)&&(right==1))          
				board_next=board+3'd1;
			   else //若无按键触发，位置保持不动
				  board_next=board;    
		  end
		else if(GameOver==1)
		  board_next=board;


//球的速度控制，根据球的位置来设置。速度方向：1：左、下。0：右，上
  always @(*)
	if(GameOver==0)
	begin
     case({R,C})
        8'h00:
        begin
         v_Horizon_Next=0;
         v_Vertical_Next=1;
        end
        8'h01,8'h02,8'h03,8'h04,8'h05,8'h06,8'h07,8'h08,8'h09,8'h0a,8'h0b,8'h0c,8'h0d,8'h0e: //第0行处理
        begin
          v_Horizon_Next=v_Horizon;
          v_Vertical_Next=1;
        end
        8'h0f:
        begin
          v_Horizon_Next=1;
          v_Vertical_Next=1;
        end
        8'h10,8'h20,8'h30,8'h40,8'h50,8'h60,8'h70,8'h80,8'h90,8'ha0,8'hb0,8'hc0,8'hd0: //最左边处理
        begin
         v_Horizon_Next=0;
         v_Vertical_Next=v_Vertical;
        end
		8'he0: //第15行最左边特殊处理
		begin
		     if(board==0) //如果碰上弹板，往右上方向反弹
		        begin
		           v_Horizon_Next=0;
                   v_Vertical_Next=0;
				 end
		     else
               begin
                   v_Horizon_Next=0;
                   v_Vertical_Next=1;
                end
          end
		8'hef://第15行最右边的特殊处理
		begin
		     if(board==4'ha) //如果碰上弹板，往左上方向反弹
		        begin
		           v_Horizon_Next=1;
                   v_Vertical_Next=0;
				 end
		     else
               begin
                   v_Horizon_Next=1;
                   v_Vertical_Next=1;
                end
          end
        8'h1e,8'h2e,8'h3e,8'h4e,8'h5e,8'h6e,8'h7e,8'h8e,8'h9e,8'hae,8'hbe,8'hce,8'hde://最右边处理
        begin
          v_Horizon_Next=1;
          v_Vertical_Next=v_Vertical;
        end
	    //第6行的特殊处理
		8'he1:  
		  begin
		     if(board==0 || board==1) 
		        begin
		           v_Horizon_Next=v_Horizon;
                   v_Vertical_Next=0;
				 end
		     else
               begin
                   v_Horizon_Next=v_Horizon;
                   v_Vertical_Next=1;
                end
          end
		8'he2:  
		  begin
		     if(board==0 || board==1|| board==2) 
		        begin
		           v_Horizon_Next=v_Horizon;
                   v_Vertical_Next=0;
				 end
		     else
               begin
                   v_Horizon_Next=v_Horizon;
                   v_Vertical_Next=1;
                end
          end
		8'he3:  
		  begin
		     if(board==0 || board==1|| board==3|| board==2) 
		        begin
		           v_Horizon_Next=v_Horizon;
                   v_Vertical_Next=0;
				 end
		     else
               begin
                   v_Horizon_Next=v_Horizon;
                   v_Vertical_Next=1;
                end
          end
		8'he4:  
		  begin
		     if(board==0 || board==1|| board==3|| board==2|| board==4) 
		        begin
		           v_Horizon_Next=v_Horizon;
                   v_Vertical_Next=0;
				 end
		     else
               begin
                   v_Horizon_Next=v_Horizon;
                   v_Vertical_Next=1;
                end
          end

		 8'he5,8'he6,8'he7,8'he8,8'he9,8'hea:
		  begin
		     if(board==(C-5) || board==(C-4) || board==(C-3)||board==(C-2) || board==(C-1) || board==(C)) 
		        begin
		           v_Horizon_Next=v_Horizon;
                   v_Vertical_Next=0;
				 end
		     else
               begin
                   v_Horizon_Next=v_Horizon;
                   v_Vertical_Next=1;
                end
          end
		 8'heb:
		  begin
		     if(board==(C-5) ||board==(C-4) || board==(C-3)||board==(C-2) || board==(C-1)) 
		        begin
		           v_Horizon_Next=v_Horizon;
                   v_Vertical_Next=0;
				 end
		     else
               begin
                   v_Horizon_Next=v_Horizon;
                   v_Vertical_Next=1;
                end
          end
		 8'hec:
		  begin
		     if(board==(C-5) ||board==(C-4) || board==(C-3)||board==(C-2)) 
		        begin
		           v_Horizon_Next=v_Horizon;
                   v_Vertical_Next=0;
				 end
		     else
               begin
                   v_Horizon_Next=v_Horizon;
                   v_Vertical_Next=1;
                end
          end
		 8'hed:
		  begin
		     if(board==(C-5) ||board==(C-4) || board==(C-3)) 
		        begin
		           v_Horizon_Next=v_Horizon;
                   v_Vertical_Next=0;
				 end
		     else
               begin
                   v_Horizon_Next=v_Horizon;
                   v_Vertical_Next=1;
                end
          end
		 8'hee:
		  begin
		     if(board==(C-5) ||board==(C-4)) 
		        begin
		           v_Horizon_Next=v_Horizon;
                   v_Vertical_Next=0;
				 end
		     else
               begin
                   v_Horizon_Next=v_Horizon;
                   v_Vertical_Next=1;
                end
          end
//Here no need to change..same with default
        8'h70,6'o71,6'o72,6'o73,6'o74,6'o75,6'o76,6'o77, //最后一行
        8'h11,6'o12,6'o13,6'o14,6'o15,6'o16,
		6'o21,6'o22,6'o23,6'o24,6'o25,6'o26,
		6'o31,6'o32,6'o33,6'o34,6'o35,6'o36,
		6'o41,6'o42,6'o43,6'o44,6'o45,6'o46,
		6'o51,6'o52,6'o53,6'o54,6'o55,6'o56: //正常位置
        begin
          v_Horizon_Next=v_Horizon;
          v_Vertical_Next=v_Vertical;
        end
        
        default: 
          begin
          v_Horizon_Next=v_Horizon;
          v_Vertical_Next=v_Vertical;
          end 
		endcase
	end
	else if(GameOver==1)
	  begin
		v_Horizon_Next=v_Horizon;
		v_Vertical_Next=v_Vertical;
	  end


//球到达弹板那一行的处理，判断是否结束游戏
 always @(*)
  if(R==6 || R==7) //在第6和第7行处理
   begin
    if(R==6)
		begin
		  case({C,board})
8h'00,8h'60,8h'70,8h'80,8h'90,8h'a0,8h'b0,8h'c0,8h'd0,8h'e0,8h'f0,

8h'01,8h'11,8h'71,8h'81,8h'91,8h'a1,8h'b1,8h'c1,8h'd1,8h'e1,8h'f1,

8h'02,8h'12,8h'22,8h'82,8h'92,8h'a2,8h'b2,8h'c2,8h'd2,8h'e2,8h'f2,

8h'03,8h'13,8h'23,8h'33,8h'93,8h'a3,8h'b3,8h'c3,8h'd3,8h'e3,8h'f3,

8h'04,8h'14,8h'24,8h'34,8h'44,8h'a4,8h'b4,8h'c4,8h'd4,8h'e4,8h'f4,

8h'05,8h'15,8h'25,8h'35,8h'45,8h'55,8h'b5,8h'c5,8h'd5,8h'e5,8h'f5,

8h'06,8h'16,8h'26,8h'36,8h'46,8h'56,8h'66,8h'c6,8h'd6,8h'e6,8h'f6,

8h'07,8h'17,8h'27,8h'37,8h'47,8h'57,8h'67,8h'77,8h'd7,8h'e7,8h'f7,

8h'08,8h'18,8h'28,8h'38,8h'48,8h'58,8h'68,8h'78,8h'88,8h'e8,8h'f8,

8h'09,8h'19,8h'29,8h'39,8h'49,8h'59,8h'69,8h'79,8h'89,8h'99,8h'f9,

8h'0a,8h'1a,8h'2a,8h'3a,8h'4a,8h'5a,8h'6a,8h'7a,8h'8a,8h'9a,8h'aa: //没有碰上挡板
			GameOver=1;
			6'o00,6'o10,6'o20,
			6'o11,6'o21,6'o31,
			6'o22,6'o32,6'o42,
			6'o33,6'o43,6'o53,
			6'o44,6'o54,6'o64,
			6'o55,6'o65,6'o75: //碰上挡板
			GameOver=0;
			default:
			GameOver=0;
		  endcase
		end
     else
	 GameOver=1;
  end
 else 
      GameOver=1'b0;
	   
	   
	//模64计数器
  always @(posedge clk or negedge rst_n)
	if(rst_n==0)
	   div_cnt <= 6'd0;
	else if(div_cnt==6'd63)
	   div_cnt <= 6'd0;
	else
	   div_cnt<=div_cnt+6'd1;

	//分频器，频率是时钟的1/1216，用于对
  always @(posedge clk or negedge rst_n)
	if(rst_n==0)
	   divid_clk <= 0;
	else if(div_cnt==6'd63)
	   divid_clk <= ~divid_clk;
//暂停键。。
	reg pause_count;
	always @(*)
	begin
		if(rst_n==0)
		pause_count<=0;
		else if(pause==1)
		pause_count=pause_count+1;
		else pause_count=pause_count;
	end
	//分频时钟用来更新球和板的下一状态
  always @(posedge divid_clk or negedge rst_n)
	if(rst_n==0)
	  begin    //球初始的位置设置在(1,4)，速度为向左下方。弹板位于中间。
		R<=3'd1;
		C<=3'd4;
		v_Horizon<=1'b1;
		v_Vertical <=1'b1;
		board <=3'd2;
	  end
	else if(pause_count==1)
		  begin
		R<=R;
		C<=C;
		v_Horizon<=v_Horizon;
		v_Vertical <=v_Vertical;
		board <=board;
		end
	else
	  begin
		R<=R_next;
		C<=C_next;
		v_Horizon<=v_Horizon_Next;
		v_Vertical <=v_Vertical_Next;
		board <=board_next;
	  end
//切记：不要在不同always块中对同一个变量赋值。
endmodule
