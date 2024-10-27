`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/24 20:35:40
// Design Name: 
// Module Name: pipeline_wb
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


module pipe_wb(
    input   [4:0]   in_rd_waddr,
    input           in_rd_wena,
    input           in_rd_sel,

    input   [31:0]  in_alu_result,
    input   [31:0]  in_dmem_data,

    output  [4:0]   out_rd_waddr,
    output          out_rd_wena,
    output  [31:0]  out_rd_wdata
    );

    assign out_rd_waddr = in_rd_waddr;
    assign out_rd_wena  = in_rd_wena;
    assign out_rd_wdata = ~in_rd_sel ? in_dmem_data : in_alu_result;

endmodule