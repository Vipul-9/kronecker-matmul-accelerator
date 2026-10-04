`timescale 1ns / 1ps
// Module: kronecker_product - Computes the Kronecker product of two matrices A and B.
module kronecker_product #(parameter N1 = 2, N2 = 2, M1 = 2, M2 = 2) (
    input signed [(8 * N1 * N2) - 1 : 0] A,   
    input signed [(8 * M1 * M2) - 1 : 0] B,    
    output signed [(16 * N1 * M1 * N2 * M2) - 1 : 0] Product 
);

    genvar i, j, k, l;

    generate
        for (i = 0; i < N1; i = i + 1) begin
            for (j = 0; j < N2; j = j + 1) begin
                for (k = 0; k < M1; k = k + 1) begin
                    for (l = 0; l < M2; l = l + 1) begin
                        // Extract elements from A and B as 8-bit signed slices
                        wire signed [7:0] A_elem = A[(i * N2 + j) * 8 +: 8];
                        wire signed [7:0] B_elem = B[(k * M2 + l) * 8 +: 8];

                        // Calculate the appropriate index for the Product
                        localparam integer product_index = ((i * M1 + k) * (N2 * M2) + (j * M2 + l)) * 16;

                        // Instantiate the multiplier2 module for each element in the Kronecker product
                        multiplier1 m (
                            .a(A_elem),                          // Element from matrix A
                            .b(B_elem),                          // Element from matrix B
                            .sum(Product[product_index +: 16])     // Assign result to correct segment in Product
                        );
                    end
                end
            end
        end
    endgenerate
endmodule