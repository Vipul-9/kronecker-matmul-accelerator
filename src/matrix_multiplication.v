`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2024
// Design Name: Flattened Matrix Multiplication
// Module Name: matrix_mul
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Computes the matrix product of matrices A and B, where A and B
//              are provided as flattened vectors, and the result Y is also a flattened vector.
// 
// Dependencies: multiplier1 module
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module matrix_mul #(parameter E1 = 6, E2 = 6, F2 = 6) (
    input signed [8 * E1 * E2 - 1 : 0] A,         // Flattened input vector for matrix A
    input signed [8 * E2 * F2 - 1 : 0] B,         // Flattened input vector for matrix B
    output reg signed [16 * E1 * F2 - 1 : 0] Y    // Flattened output vector for matrix product Y
);

    wire signed [15:0] product[E1 * E2 * F2 - 1:0]; // Array to store intermediate product results
    integer i, j, k;
    genvar m, l, n;

    // Initialize the output Y to zero at the start of the simulation
    initial begin
        for (i = 0; i < E1 * F2; i = i + 1) begin
            Y[i * 16 +: 16] = 0;
        end
    end

    // Matrix multiplication logic with multiplier instances using generate
    generate
        for (m = 0; m < E1; m = m + 1) begin
            for (l = 0; l < F2; l = l + 1) begin
                for (n = 0; n < E2; n = n + 1) begin
                    // Extract elements from A and B
                    wire signed [7:0] A_elem = A[(m * E2 + n) * 8 +: 8];
                    wire signed [7:0] B_elem = B[(n * F2 + l) * 8 +: 8];
                    // Instantiate multiplier1 for each pair of elements
                    multiplier1 mul (
                        .a(A_elem),
                        .b(B_elem),
                        .sum(product[(m * F2 * E2) + (l * E2) + n])  // Store partial products
                    );
                end
            end
        end
    endgenerate

    // Accumulate the results in an always block
    always @* begin
        for (i = 0; i < E1; i = i + 1) begin
            for (j = 0; j < F2; j = j + 1) begin
                // Reset accumulated value for each element of Y
                Y[(i * F2 + j) * 16 +: 16] = 0;
                for (k = 0; k < E2; k = k + 1) begin
                    Y[(i * F2 + j) * 16 +: 16] = Y[(i * F2 + j) * 16 +: 16] + product[(i * F2 * E2) + (j * E2) + k];
                end
            end
        end
    end
endmodule
