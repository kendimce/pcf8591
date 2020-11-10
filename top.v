module top(clk,SCLK,SDA,LED_out_first,LED_out_second);

input clk;
output SCLK;
output [6:0] LED_out_first,LED_out_second;
inout SDA;

wire [7:0] exchange;

result res(.clk(clk),.LED_out_first(LED_out_first),.LED_out_second(LED_out_second), .incoming_data(exchange));
i2c communicate(.clk(clk),.SCLK(SCLK),.SDA(SDA), .DATA_FROM_SENSOR(exchange));

endmodule