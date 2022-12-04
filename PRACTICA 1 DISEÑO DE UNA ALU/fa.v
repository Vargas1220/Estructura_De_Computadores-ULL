module fa(output wire c_out, sum, input wire a, b, c_in);
    //Se utiliza la concatenacion como se pedia en el guion
    
    assign {c_out, sum} = a + b + c_in;

endmodule