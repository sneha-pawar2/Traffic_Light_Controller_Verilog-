`timescale 1ns/1ps

module traffic_light_tb;

reg clk;
reg reset;
wire [2:0] NS;
wire [2:0] EW;

// Instantiate DUT
traffic_light_controller uut (
    .clk(clk),
    .reset(reset),
    .NS(NS),
    .EW(EW)
);

// Clock Generation
always #5 clk = ~clk;

// Stimulus
initial begin
    clk = 0;
    reset = 1;

    #10;
    reset = 0;

    #100;

    $finish;
end

endmodule