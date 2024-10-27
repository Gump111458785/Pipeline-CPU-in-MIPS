`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/24 20:28:01
// Design Name: 
// Module Name: dmem
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


module dmem(
    input           clk,
    input           ena,
    input           wena,
    input   [31:0]  addr,
    input   [1:0]   dmem_type,
    input   [31:0]  data_in,
    output  [31:0]  data_out
);

    reg [31:0] ram[0:2047];

    always @(negedge clk)
    begin
        if(ena && wena)
            if(dmem_type == 2'b10)
                ram[addr][7:0]  <= data_in[7:0];
            else if(dmem_type == 2'b01)
                ram[addr][15:0] <= data_in[15:0];
            else if(dmem_type == 2'b00)
                ram[addr]       <= data_in;
            else
                ram[addr]       <= 32'bz;
        else;
    end

    assign data_out = ena ? ram[addr] : 32'bz;

endmodule
