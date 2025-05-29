module pwm_generator #(
parameter COUNTER_WIDTH = 8
)(
input clk,
input reset,
input [COUNTER_WIDTH-1:0] duty_cycle,
count
input [COUNTER_WIDTH-1:0] period,
output reg pwm_out
);
  
reg [COUNTER_WIDTH-1:0] counter;
always @(posedge clk or posedge reset) begin
if(reset) begin
counter <= 0;
pwm_out <= 0;
end else begin
if(counter < period)
counter <= counter + 1;
else
counter <= 0;
pwm_out <= (counter < duty_cycle) ? 1'b1 : 1'b0;
end
end
endmodule
