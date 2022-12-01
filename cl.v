/*                                           OBJETIVO 2 PARTE 2.1
                          Implementar una “celda lógica” con el prototipo siguiente:
                           cl(output wire out, input wire a, b, input wire [1:0] S);

               Dicha celda lógica calculará sobre los bits a y b las operaciones lógicas and, or, xor e inversión del bit a
                                   cuando el vector de dos bits s vale 00, 01, 10 y 11 respectivamente.*/



module cl(output wire out, input  wire a, b, input wire [1:0] s);

	wire c00, c01, cxor, cnot; // DECLARANDO CABLES DE SALIDA PARA CADA PUERTA RESPECTIVAMENTE
	and	and1(c00, a, b);       //DECLARANDO PUERTA AND
	or	or1(c01, a, b);        //DECLARANDO PUERTA OR
	xor	puertaxor(cxor, a, b); //DECLARANDO PUERTA XOR
	not 	not1(cnot,a);      // DECLARANDO PUERTA NOT
	
	mux4_1 muliplexor1(out, c00, c01, cxor, cnot, s); //MUX 4:1 QUE RECIBE COMO ENTRADA LAS SALIDAS DE LAS PUERTAS LOGICAS REALIZADAS ANTERIORMENTE
	                                                  //  UNA SENAL S Y UNA OUT QUE VIENE DE LA CL

endmodule