/*                                                           OBJETIVO 2 2.2
        Implementar una “unidad lógica de 4 bits” de forma estructural, utilizando las celdas lógicas descritas
                                en el objetivo 2.1. El prototipo sería el siguiente:

                ul4(output wire[3:0] Out, input wire[3:0] A, input wire[3:0] B, input wire [1:0] S);
*/

//NO ENTIENDO MUY BIEN COMO IMPLEMENTAR UNA UNIDAD LOGICA


module ul4(output wire[3:0] Out, input wire[3:0] A, input wire[3:0] B, input wire [1:0] S);
        

        cl and1(Out[0], A[0], B[0], S);
        cl or1(Out[1], A[1], B[1], S);
        cl puertaxor(Out[2], A[2], B[2], S);
        cl not1(Out[3], A[3], B[3], S);
        
        
        

endmodule