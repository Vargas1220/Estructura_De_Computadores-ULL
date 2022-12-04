// COMPLETAR LA ALU INTEGRANDO LOS MODULOS ANTERIORMENTE CREADOS






`include "cl.v"
`include "sum4.v"
`include "ul4.v"
`include "compl1.v"
`include "mux4_1.v"
`include "mux2_4.v"
`include "fa.v"




module alu(output wire [3:0] R, output wire zero, carry, sign, input wire [3:0] A, B, input wire [1:0] ALUop, input wire l);

 
    
wire op1_A, op1_B, cpl, cin0;



//CABLEADO DE LOS MULTIPLEXORES

assign op1_A = l | (~ ALUop[1]);
assign op2_B = l | (~ ALUop[1]) | ALUop[0];
assign cpl = (~l) & (~ ALUop[1]) | (~ l) &ALUop[0];
assign cin0 = ALUop[0] | ALUop[1];

assign zero = R == 4'b0000 ? 1'b1 : 1'b0;
assign sign = R[3];

wire [3:0] salidaop1, salida_mux, salidaop2, salidasum4, salidaul4;

//INSTANCIAS DE LOS MULTIPLEXORES Y EL COMPLEMENTADOR


mux2_4 muxA(salidaop1, 4'b0000, A, op1_A);
mux2_4 muxB(salida_mux, A, B, op2_B);
mux2_4 muXC(R,  salidasum4, salidaul4, l);

compl1 complementador(salidaop2, salida_mux, cpl);
ul4 ul10(salidaul4, salidaop1, salidaop2, ALUop);
sum4 sumador(salidaul4, carry, salidaop1, salidaop2,cin0);






endmodule
