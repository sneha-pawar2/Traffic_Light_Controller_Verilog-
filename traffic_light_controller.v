`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 02:44:38
// Design Name: 
// Module Name: traffic_light_controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module traffic_light_controller(
    input clk,
    input reset,
    output reg [2:0] NS,
    output reg [2:0] EW
);

parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter S4 = 3'b100;

reg [2:0] state, next_state;

// State Register
always @(posedge clk or posedge reset)
begin
    if(reset)
        state <= S0;
    else
        state <= next_state;
end

// Next State Logic
always @(*)
begin
    case(state)
        S0: next_state = S1;
        S1: next_state = S2;
        S2: next_state = S3;
        S3: next_state = S4;
        S4: next_state = S0;
        default: next_state = S0;
    endcase
end

// Output Logic
always @(*)
begin
    case(state)

        S0:
        begin
            NS = 3'b001;
            EW = 3'b100;
        end

        S1:
        begin
            NS = 3'b010;
            EW = 3'b100;
        end

        S2:
        begin
            NS = 3'b100;
            EW = 3'b001;
        end

        S3:
        begin
            NS = 3'b100;
            EW = 3'b010;
        end

        S4:
        begin
            NS = 3'b100;
            EW = 3'b100;
        end

        default:
        begin
            NS = 3'b100;
            EW = 3'b100;
        end
    endcase
end

endmodule