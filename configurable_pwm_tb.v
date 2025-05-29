`timescale 1ns/1ps

module pwm_generator_tb;

    parameter COUNTER_WIDTH = 8;
    reg clk;
    reg reset;
    reg [COUNTER_WIDTH-1:0] duty_cycle;
    reg [COUNTER_WIDTH-1:0] period;
    wire pwm_out;

    pwm_generator #(
        .COUNTER_WIDTH(COUNTER_WIDTH)
    ) uut (
        .clk(clk),
        .reset(reset),
        .duty_cycle(duty_cycle),
        .period(period),
        .pwm_out(pwm_out)
    );


    initial clk = 0;
    always #5 clk = ~clk;


    initial begin
        reset = 1;
        duty_cycle = 0;
        period = 0;

        #20;
        reset = 0;

        period = 8'd100;
        duty_cycle = 8'd50;
        #1000;

        duty_cycle = 8'd25;
        #1000;

        duty_cycle = 8'd75;
        #1000;
      
        period = 8'd200;
        duty_cycle = 8'd180;
        #2000;

        period = 8'd50;
        duty_cycle = 8'd5;
        #1000;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | reset=%b | duty_cycle=%d | period=%d | pwm_out=%b", 
                 $time, reset, duty_cycle, period, pwm_out);
    end

endmodule
