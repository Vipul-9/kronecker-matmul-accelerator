`timescale 1ns / 1ps

module matrix_mul_tb;

    // Parameters for the matrix sizes
    parameter E1 = 4;
    parameter E2 = 4;
    parameter F2 = 3;

    // Testbench signals
    reg signed [8 * E1 * E2 - 1 : 0] A;  // Flattened input matrix A
    reg signed [8 * E2 * F2 - 1 : 0] B;  // Flattened input matrix B
    wire signed [16 * E1 * F2 - 1 : 0] Y; // Flattened output matrix Y

    // Instantiate the matrix_mul module
    matrix_mul #(E1, E2, F2) uut (
        .A(A),
        .B(B),
        .Y(Y)
    );

    integer i, j, k;
    integer A_index, B_index, Y_index;
    reg signed [7:0] A_elem;
    reg signed [7:0] B_elem;
    reg signed [15:0] Y_elem;

    initial begin
        // Initialize matrices A and B with a mix of positive and negative values
        A = {8'sd3, -8'sd2, -8'sd1, 8'sd4,8'sd3, -8'sd2, -8'sd1, 8'sd4,8'sd3, -8'sd2, -8'sd1, 8'sd4,8'sd3, -8'sd2, -8'sd1, 8'sd4}; // A = [3 -2; -1 4]
        B = {-8'sd5, 8'sd6, 8'sd2, -8'sd3,-8'sd5, 8'sd6, 8'sd2, -8'sd3,-8'sd5, 8'sd6, 8'sd2, -8'sd3}; // B = [-5 6; 2 -3]

        #10; // Wait for calculations to complete

        // Display matrix A in row-column format
        $display("Matrix A:");
        for (i = 0; i < E1; i = i + 1) begin
            for (j = 0; j < E2; j = j + 1) begin
                A_index = (i * E2 + j) * 8;
                A_elem = A[A_index +: 8];
                $write("%0d\t", A_elem);  // Print A element in matrix format
            end
            $display("");  // Newline after each row
        end

        // Display matrix B in row-column format
        $display("\nMatrix B:");
        for (j = 0; j < E2; j = j + 1) begin
            for (k = 0; k < F2; k = k + 1) begin
                B_index = (j * F2 + k) * 8;
                B_elem = B[B_index +: 8];
                $write("%0d\t", B_elem);  // Print B element in matrix format
            end
            $display("");  // Newline after each row
        end

        // Display matrix Y in row-column format (matrix product result)
        $display("\nMatrix Y (Result):");
        for (i = 0; i < E1; i = i + 1) begin
            for (k = 0; k < F2; k = k + 1) begin
                Y_index = (i * F2 + k) * 16;
                Y_elem = Y[Y_index +: 16];
                $write("%0d\t", Y_elem);  // Print Y element in matrix format
            end
            $display("");  // Newline after each row
        end

        // End simulation



        #50 $finish;
    end

endmodule

