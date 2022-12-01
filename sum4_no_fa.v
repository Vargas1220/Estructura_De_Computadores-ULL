module sum4(output wire [3:0] S, output wire c_out, input wire[3:0] A, input wire[3:0] B, input wire c_in);
    
    assign {c_out, S} = A + B + c_in ;


endmodule