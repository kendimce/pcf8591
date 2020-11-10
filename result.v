module result(clk,incoming_data,LED_out_first,LED_out_second,LED_out_third,LED_out_fourth);

input clk;
input [7:0] incoming_data;

output reg[6:0] LED_out_first,LED_out_second,LED_out_third,LED_out_fourth; //7 segmentS
reg [3:0] LED_BCD [3:0]; //bcd

always @(posedge clk)
begin

		LED_BCD[0]<=incoming_data[3:0];
		LED_BCD[1]<=incoming_data[7:4];
end

always @(*)
begin
 case(LED_BCD[0])
 4'b0000: LED_out_first = 7'b1000000; // "0"  
 4'b0001: LED_out_first = 7'b1111001; // "1" 
 4'b0010: LED_out_first = 7'b0100100; // "2" 
 4'b0011: LED_out_first = 7'b0110000; // "3" 
 4'b0100: LED_out_first = 7'b0011001; // "4" 
 4'b0101: LED_out_first = 7'b0010010; // "5" 
 4'b0110: LED_out_first = 7'b0000010; // "6" 
 4'b0111: LED_out_first = 7'b1111000; // "7" 
 4'b1000: LED_out_first = 7'b0000000; // "8"  
 4'b1001: LED_out_first = 7'b0010000; // "9" 
 4'b1010: LED_out_first = 7'b0001000; // "A" 
 4'b1011: LED_out_first = 7'b0000011; // "B" 
 4'b1100: LED_out_first = 7'b1000110; // "C" 
 4'b1101: LED_out_first = 7'b0100001; // "D" 
 4'b1110: LED_out_first = 7'b0000110; // "E"
 4'b1111: LED_out_first = 7'b0001110; // "F" 
 default: LED_out_first = 7'b1000000; // "0"
 endcase
end


always @(*)
begin
 case(LED_BCD[1])
 4'b0000: LED_out_second = 7'b1000000; // "0"  
 4'b0001: LED_out_second = 7'b1111001; // "1" 
 4'b0010: LED_out_second = 7'b0100100; // "2" 
 4'b0011: LED_out_second = 7'b0110000; // "3" 
 4'b0100: LED_out_second = 7'b0011001; // "4" 
 4'b0101: LED_out_second = 7'b0010010; // "5" 
 4'b0110: LED_out_second = 7'b0000010; // "6" 
 4'b0111: LED_out_second = 7'b1111000; // "7" 
 4'b1000: LED_out_second = 7'b0000000; // "8"  
 4'b1001: LED_out_second = 7'b0010000; // "9" 
 4'b1010: LED_out_second = 7'b0001000; // "A" 
 4'b1011: LED_out_second = 7'b0000011; // "B" 
 4'b1100: LED_out_second = 7'b1000110; // "C" 
 4'b1101: LED_out_second = 7'b0100001; // "D" 
 4'b1110: LED_out_second = 7'b0000110; // "E"
 4'b1111: LED_out_second = 7'b0001110; // "F" 
 default: LED_out_second = 7'b1000000; // "0"
 endcase
end

always @(*)
begin
 case(LED_BCD[2])
 4'b0000: LED_out_third = 7'b1000000; // "0"  
 4'b0001: LED_out_third = 7'b1111001; // "1" 
 4'b0010: LED_out_third = 7'b0100100; // "2" 
 4'b0011: LED_out_third = 7'b0110000; // "3" 
 4'b0100: LED_out_third = 7'b0011001; // "4" 
 4'b0101: LED_out_third = 7'b0010010; // "5" 
 4'b0110: LED_out_third = 7'b0000010; // "6" 
 4'b0111: LED_out_third = 7'b1111000; // "7" 
 4'b1000: LED_out_third = 7'b0000000; // "8"  
 4'b1001: LED_out_third = 7'b0010000; // "9" 
 4'b1010: LED_out_third = 7'b0001000; // "A" 
 4'b1011: LED_out_third = 7'b0000011; // "B" 
 4'b1100: LED_out_third = 7'b1000110; // "C" 
 4'b1101: LED_out_third = 7'b0100001; // "D" 
 4'b1110: LED_out_third = 7'b0000110; // "E"
 4'b1111: LED_out_third = 7'b0001110; // "F" 
 default: LED_out_third = 7'b1000000; // "0"
 endcase
end

always @(*)
begin
 case(LED_BCD[3])
 4'b0000: LED_out_fourth = 7'b1000000; // "0"  
 4'b0001: LED_out_fourth = 7'b1111001; // "1" 
 4'b0010: LED_out_fourth = 7'b0100100; // "2" 
 4'b0011: LED_out_fourth = 7'b0110000; // "3" 
 4'b0100: LED_out_fourth = 7'b0011001; // "4" 
 4'b0101: LED_out_fourth = 7'b0010010; // "5" 
 4'b0110: LED_out_fourth = 7'b0000010; // "6" 
 4'b0111: LED_out_fourth = 7'b1111000; // "7" 
 4'b1000: LED_out_fourth = 7'b0000000; // "8"  
 4'b1001: LED_out_fourth = 7'b0010000; // "9" 
 4'b1010: LED_out_fourth = 7'b0001000; // "A" 
 4'b1011: LED_out_fourth = 7'b0000011; // "B" 
 4'b1100: LED_out_fourth = 7'b1000110; // "C" 
 4'b1101: LED_out_fourth = 7'b0100001; // "D" 
 4'b1110: LED_out_fourth = 7'b0000110; // "E"
 4'b1111: LED_out_fourth = 7'b0001110; // "F" 
 default: LED_out_fourth = 7'b1000000; // "0"
 
 endcase
end


endmodule