`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/24 20:28:01
// Design Name: 
// Module Name: board_top
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


module board_top(
    input           in_clk,
    input           in_rst,

    input   [6:0]  in_floors_data,
    input   [6:0]  in_resistance_data,

    output  [7:0]   o_seg,  //下板用，sim时删去
    output  [7:0]   o_sel,  //下板用，sim时删去
  
    output          result_is_last_broken
    );

    wire    [31:0]  pc;
    wire    [31:0]  instruction; 

    reg     [15:0]  init_floors;
    reg     [15:0]  init_resistance;

    wire    [31:0]  result_attempt_count;
    wire    [31:0]  result_broken_count;
    wire    [31:0]  result_human_cost;
    wire    [31:0]  result_material_cost;
    wire            new_clk;
    
    clk_divider #(1000000) clk_divider_uut(   //下板用，sim时改为较小值
        .in_clk(in_clk),
        .out_clk(new_clk)
    );


    cpu cpu_uut(
        .in_clk(new_clk),
        .in_rst(in_rst),

        .init_floors({ 25'b0, in_floors_data }),
        .init_resistance({ 25'b0, in_resistance_data }),

        .out_pc(pc),
        .out_instruction(instruction),

        .result_attempt_count(result_attempt_count),
        .result_broken_count(result_broken_count),
        .result_human_cost(result_human_cost),
        .result_material_cost(result_material_cost),
        .result_is_last_broken(result_is_last_broken)
    );
//下板用，sim时删去
    seg7x16 seg7(
        .clk(in_clk),
        .reset(in_rst),
        .cs(1'b1),
        .i_data({ result_attempt_count[7:0], result_broken_count[7:0],result_material_cost[7:0],result_human_cost[7:0] }),
        .o_seg(o_seg),
        .o_sel(o_sel)
    );

endmodule