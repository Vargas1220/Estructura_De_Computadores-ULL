// Pablo Hernández Jiménez
// Carlos Eduardo Vargas Torrealba

module microc(output wire [5:0] opcode, output wire zero, carry, input wire clk, reset, s_skip, s_inc, s_inm, we, input wire [2:0] ALUOp);

  wire[9:0] pc_output, mux_inc_output, mux_skip_output, sum_output;
  wire[15:0] memprog_output;
  wire[7:0] RD1, RD2, WD3, ALU_output;

  registro #(10) PC(pc_output, clk, reset, sum_output);
  memprog memprog_1(memprog_output, clk, pc_output);
  mux2 #(10) mux_skip(mux_skip_output, 10'b0000000001, 10'b0000000010, s_skip);
  mux2 #(10) mux_inc(mux_inc_output, memprog_output[9:0], mux_skip_output, s_inc);
  mux2 #(8) mux_inm(WD3, ALU_output, memprog_output[11:4], s_inm);
  sum sum_1(sum_output, pc_output, mux_inc_output);
  regfile regfile_1(RD1, RD2, clk, we, memprog_output[3:0], memprog_output[7:4], memprog_output[11:8], WD3);
  alu alu_1(ALU_output, zero, carry, RD1, RD2, ALUOp);

  assign opcode = memprog_output[15:10];

endmodule
