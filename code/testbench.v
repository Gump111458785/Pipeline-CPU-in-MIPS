`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/24 20:28:01
// Design Name: 
// Module Name: testbench
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


module testbench(
    );
/*
    reg         clk;
    reg         rst;
    reg   [6:0] in_floors_data;
    reg   [6:0] in_resistance_data;
    integer     regfile_output;
    wire        last_broken;

    initial
    begin
        regfile_output = $fopen("regfile_output.txt");
        clk = 0;
        rst = 1;
        #20 
        in_floors_data = 40;
        in_resistance_data = 20;
        #10
        rst = 0;
        #1000  $finish;
 //         rst = 1;   //更多测试数据
 //       in_floors_data = 40;
 //        in_resistance_data = 3;
 //       #20 rst = 0;
 //       #200 $finish;
 //      rst = 1;             
 //       in_floors_data = 20;
 //       in_resistance_data = 9;
 //       #20 rst = 0;
 //       #200 rst = 1;
 //      in_floors_data = 10;
 //       in_resistance_data = 5;
 //       #20 rst = 0;

    end

    always 
    begin
        #1 clk = ~clk;
    end

    wire [31:0] pc          = testbench.board_top_uut.pc;
    wire [31:0] instruction = testbench.board_top_uut.instruction;

    wire [6:0] init_floors             = testbench.board_top_uut.in_floors_data;
    wire [6:0] init_resistance         = testbench.board_top_uut.in_resistance_data;
    wire [31:0] result_attempt_count    = testbench.board_top_uut.result_attempt_count;
    wire [31:0] result_broken_count     = testbench.board_top_uut.result_broken_count;
    wire        result_is_last_broken   = testbench.board_top_uut.result_is_last_broken;
    
    wire [31:0] reg2    = testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[2];   
    wire [31:0] reg3    = testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[3];
    wire [31:0] reg4    = testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[4];
    wire [31:0] reg5    = testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[5];
    wire [31:0] reg15   = testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[15];
    wire [31:0] reg17   = testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[17];
    always @(posedge clk) 
    begin
        if (!rst)
        begin
            $fdisplay(regfile_output, "pc: %h",     testbench.board_top_uut.pc);
            $fdisplay(regfile_output, "instr: %h",  testbench.board_top_uut.instruction);
            $fdisplay(regfile_output, "register0:  %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[0]);
            $fdisplay(regfile_output, "register1:  %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[1]);
            $fdisplay(regfile_output, "register2:  %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[2]);
            $fdisplay(regfile_output, "register3:  %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[3]);
            $fdisplay(regfile_output, "register4:  %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[4]);
            $fdisplay(regfile_output, "register5:  %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[5]);
            $fdisplay(regfile_output, "register6:  %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[6]);
            $fdisplay(regfile_output, "register7:  %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[7]);
            $fdisplay(regfile_output, "register8:  %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[8]);
            $fdisplay(regfile_output, "register9:  %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[9]);
            $fdisplay(regfile_output, "register10: %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[10]);
            $fdisplay(regfile_output, "register11: %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[11]);
            $fdisplay(regfile_output, "register12: %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[12]);
            $fdisplay(regfile_output, "register13: %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[13]);
            $fdisplay(regfile_output, "register14: %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[14]);
            $fdisplay(regfile_output, "register15: %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[15]);
            $fdisplay(regfile_output, "register16: %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[16]);
            $fdisplay(regfile_output, "register17: %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[17]);
            $fdisplay(regfile_output, "register18: %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[18]);
            $fdisplay(regfile_output, "register19: %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[19]);
            $fdisplay(regfile_output, "register20: %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[20]);
            $fdisplay(regfile_output, "register21: %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[21]);
            $fdisplay(regfile_output, "register22: %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[22]);
            $fdisplay(regfile_output, "register23: %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[23]);
            $fdisplay(regfile_output, "register24: %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[24]);
            $fdisplay(regfile_output, "register25: %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[25]);
            $fdisplay(regfile_output, "register26: %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[26]);
            $fdisplay(regfile_output, "register27: %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[27]);
            $fdisplay(regfile_output, "register28: %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[28]);
            $fdisplay(regfile_output, "register29: %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[29]);
            $fdisplay(regfile_output, "register30: %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[30]);
            $fdisplay(regfile_output, "register31: %h", testbench.board_top_uut.cpu_uut.pipe_id_uut.regfile_uut.array_reg[31]);
        end
    end

    board_top board_top_uut(
        .in_clk(clk),
        .in_rst(rst),
        .in_floors_data(in_floors_data),
        .in_resistance_data(in_resistance_data),
        .result_is_last_broken(last_broken)
    );
*/
endmodule
