`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/24 20:28:01
// Design Name: 
// Module Name: pipeline_if_id
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


module pipe_if_id(
    input               in_clk,
    input               in_rst,
    input               in_stall,
    input               in_branch,
    input       [31:0]  in_npc,
    input       [31:0]  in_instruction,
    output reg  [31:0]  out_npc,
    output reg  [31:0]  out_instruction
    );

    always @(posedge in_clk or posedge in_rst) 
    begin
        if(in_rst) 
        begin
            out_npc         <= 32'b0;
            out_instruction <= 32'b0;
        end
        else if(~in_stall) 
        begin
            if(in_branch) 
            begin
                out_npc         <= 32'b0;
                out_instruction <= 32'b0;
            end
            else 
            begin
                out_npc         <= in_npc;
                out_instruction <= in_instruction;
            end
        end
        else
        begin
            out_npc         <= out_npc;
            out_instruction <= out_instruction;
        end
    end
    
endmodule
