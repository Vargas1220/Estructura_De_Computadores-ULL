// Pablo Hernández Jiménez
// Carlos Eduardo Vargas Torrealba
`timescale 1 ns / 10 ps
module microc_tb;

  wire[5:0] opcode;
  wire zero, carry;
  reg clk, reset, s_skip, s_inc, s_inm, we;
  reg[2:0] alu_op;

  microc microc_test(opcode, zero, carry, clk, reset, s_skip, s_inc, s_inm, we, alu_op);

  initial
  begin
    $dumpfile("microc.vcd");
    $dumpvars;
    $monitor(
      "tiempo=%0d opcode=%b zero=%b carry=%b clk=%b reset=%b s_skip=%b s_inc=%b, s_inm=%b, we=%b, alu_op=%b",
      $time, opcode, zero, carry, clk, reset, s_skip, s_inc, s_inm, we, alu_op
    );
    #280;
    $finish;
  end

  initial
  begin
    reset = 1;
    #5;
    reset = 0;
  end

  initial
  begin
    #10;
    s_inm = 1;
    s_inc = 1;
    s_skip = 0;
    we = 1;
    alu_op = 3'b000;

    #20;
    s_inm = 1;
    s_inc = 1;
    s_skip = 0;
    we = 1;
    alu_op = 3'b000;

    #20;
    s_inm = 1;
    s_inc = 1;
    s_skip = 0;
    we = 1;
    alu_op = 3'b000;

    // SKIPNE
    #20;
    we = 0;
    alu_op = 3'b011;
    s_inm = 0;
    s_inc = 1; 
    s_skip = 1;

    // SKIPGT
    #20;
    alu_op = 3'b011;
    we = 0;
    s_inm = 0;
    s_inc = 1; 
    s_skip = 1;

    // ADD
    #20;
    we = 1;
    s_inm = 0;
    alu_op = 3'b010;
    s_inc = 1;
    s_skip = 0;

    // JR
    #20;
    we = 0;
    s_inc = 0;

    // SKIPNE
    #20;
    alu_op = 3'b011;
    we = 0;
    s_inm = 0;
    s_inc = 1; 
    s_skip = 1;

    // SKIPGT
    #20;
    alu_op = 3'b011;
    we = 0;
    #1;
    s_inc = 1; 
    s_skip = 1;

    // ADD
    #20;
    we = 1;
    s_inm = 0;
    s_inc = 1;
    s_skip = 0;
    alu_op = 3'b010;

    // JR
    #20;
    we = 0;
    s_inc = 0;

    #20;
    alu_op = 3'b011;
    we = 0;
    s_inm = 0;
    s_inc = 1;
    s_skip = 0;

    #20;
    we = 0;
    s_inc = 0;

    #20;
    we = 0;
    s_inc = 0;

  end

  // always @(posedge clk)
  // begin
  //   #10;
  //   // LI
  //   if (opcode[5:2] == 6'b0) begin
  //     s_inm = 1;
  //     s_inc = 1;
  //     s_skip = 0;
  //     we = 1;
  //     alu_op = 3'b000;
  //   end
  //   // SKIPNE
  //   if (opcode[5:2] == 6'b1) begin
  //     alu_op = 3'b011;
  //     we = 0;
  //     s_inm = 0;
  //     #1;
  //     if (zero == 0) begin
  //       s_inc = 1; 
  //       s_skip = 1;
  //     end else begin
  //       s_inc = 0;
  //       s_skip = 0;
  //     end
  //   end
  //   // JR
  //   if (opcode == 6'b100000) begin
  //     s_inc = 0;
  //   end
  //   // SKIPGT
  //   if (opcode[5:2] == 6'b0010) begin
  //     alu_op = 3'b011;
  //     we = 0;
  //     #1;
  //     if (carry == 0 && zero == 0) begin
  //       s_inc = 1; 
  //       s_skip = 1;
  //     end else begin
  //       s_inc = 0;
  //       s_skip = 0;
  //     end
  //   end
  //   if (opcode[5:2] == 6'b0011) begin
  //     s_inm = 0;
  //   end
  //   // ADD
  //   if (opcode[5:2] == 6'b0100) begin
  //     s_inm = 0;
  //     alu_op = 3'b010;
  //   end
  //   
  // end

  always
  begin
    clk = 1'b1;
    #10;
    clk = 1'b0;
    #10;
  end

endmodule
