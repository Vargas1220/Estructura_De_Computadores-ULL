
//implementar un modulo que nos permita complementar a voluntad en función de una señal de control cpl 
//de forma que podamos dejar pasar un dato sin modificar o hacer su complemento a uno.

module compl1(output wire [3:0] Out, input wire [3:0] Inp, input wire cpl);
  //si cpl = 1, Out = cpl1(Inp) y cuando cpl = 0 la salida Out = Inp
 assign Out = cpl ? (~Inp) : Inp;

endmodule