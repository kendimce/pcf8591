module i2c(SCLK,clk,SDA,DATA_FROM_SENSOR);

input clk;

inout reg SDA;
output SCLK;

localparam OP_STAND_BY=0;
localparam OP_START=1;
localparam OP_ADDRESS=2;
localparam OP_CODE=0;				//READ-WRITE
localparam OP_ACK=3;	
localparam OP_REG = 4;
localparam OP_READ_DATA=5;
localparam OP_BEFORE_STOP=8;
localparam OP_STOP=9;

reg [6:0] slave_address;
reg [5:0] state; //3 bit state/.

reg [6:0] ADDR;
reg [7:0] INTERNAL_REG;
output reg [7:0] DATA_FROM_SENSOR;
reg operation;

integer count;
integer clock_counter;		//CLOCK DIVIDER
integer read_enable;

reg clk_enable;
reg sclk_enable;

	initial
	begin

	slave_address<=7'h48;//7'h48
	INTERNAL_REG <=8'h03;
	DATA_FROM_SENSOR<=0;
	
	clock_counter<=0;
	sclk_enable<=0;
	clk_enable<=0;

	state<=OP_STAND_BY;

	read_enable<=0;

	end

	always@(posedge clk)
	begin
			if(clock_counter==124)
			begin

				clk_enable<=~clk_enable;
				clock_counter<=0;
			end

			else
			begin
				clock_counter<=clock_counter+1;

			end
	end

	always @(negedge clk_enable)
	begin
			if((state==OP_START) || (state==OP_STAND_BY) || (state==OP_STOP))
			begin
			sclk_enable<=0;
			end
			
			else
			begin
			
			sclk_enable<=1;
			
			end
	end

	assign SCLK = (sclk_enable==0) ? 1: ~clk_enable;


	always @(posedge clk_enable)
	begin		
			
			case(state)
			
					OP_STAND_BY:		//STAND BY MODE
					begin

							SDA<=1;
							state<=OP_START;
					end
						
					OP_START:		//START CONDITION
					begin
					
							SDA<=0;
							state<= OP_ADDRESS;
							count<=6;
				
					end
			
			
					OP_ADDRESS:
					begin
							if(count>=0 )
							begin
								
								SDA <= slave_address[count];  //SLAVE_ADDRESS
								count<=count-1;
						
							end
			
							else
							begin
									if(read_enable == 1)
									begin
												SDA<=~OP_CODE;  		//READ
												state<=OP_ACK;

									end
									
									else
									begin
												SDA<=OP_CODE;  		//WRITE
												state<= OP_ACK;
									end
							
							end
					end
			

					OP_ACK:
					begin	
							SDA<=1'bz;
							count<=7;
							
							if(read_enable ==1 )
								state<=OP_READ_DATA;
							else
								state<=OP_REG;
							
					end
			
		
					OP_REG:
					begin
							if(count>=0)
							begin
									
									SDA <= INTERNAL_REG[count];  // INTERNAL REGISTER_ADDRESS
									count<=count-1;
						
							end
					
							else
							begin
									SDA<=1'bz;   //ACK
									read_enable <=1;
									state<=OP_STAND_BY;
							
							end
					end
		
			
					OP_READ_DATA:
					begin
						if(count>=0)
						begin
						
								 DATA_FROM_SENSOR[count]<=SDA;
								 count<=count-1;
						end
					
						else
						begin
								//ACK
								SDA<=0;
								state<=OP_STOP;
	  
						end
					end
					
			
					OP_STOP:
					begin		

							state<=OP_STAND_BY;
						
					end
		endcase
	end



	endmodule