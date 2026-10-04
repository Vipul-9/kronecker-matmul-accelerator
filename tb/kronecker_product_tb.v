`timescale 1ns / 1ps

module tb_kronecker_product;
    parameter N1 = 2, N2 = 2, M1 = 2, M2 = 2;

    reg signed [8 * N1 * N2 - 1 : 0] A;     // Flattened 8-bit input vector for matrix A
    reg signed [8 * M1 * M2 - 1 : 0] B;     // Flattened 8-bit input vector for matrix B
    wire signed [16 * N1 * M1 * N2 * M2 - 1 : 0] Product; // Flattened 16-bit output vector for Product

    // Instantiate the kronecker_product module
    kronecker_product #(.N1(N1), .N2(N2), .M1(M1), .M2(M2)) uut (
        .A(A),
        .B(B),
        .Product(Product)
    );

    integer i, j, k, l;
    integer A_index, B_index, Product_index;
    reg signed [7:0] A_elem;
    reg signed [7:0] B_elem;
    reg signed [15:0] Product_elem;

    initial begin
        // Initialize matrices A and B with a mix of positive and negative values
        A = {8'sd1, -8'sd2, 8'sd3, -8'sd4};  // Matrix A as flattened vector [1, -2, 3, -4]
        B = {-8'sd50, 8'sd6, -8'sd117, 8'sd8};  // Matrix B as flattened vector [-5, 6, -7, 8]

        #10; // Wait for calculations to complete

        // Display matrix A in row-column format
        $display("Matrix A:");
        for (i = 0; i < N1; i = i + 1) begin
            for (j = 0; j < N2; j = j + 1) begin
                A_index = (i * N2 + j) * 8;
                A_elem = A[A_index +: 8];
                $write("%0d\t", A_elem);  // Print A element in matrix format
            end
            $display("");  // Newline after each row
        end

        // Display matrix B in row-column format
        $display("\nMatrix B:");
        for (k = 0; k < M1; k = k + 1) begin
            for (l = 0; l < M2; l = l + 1) begin
                B_index = (k * M2 + l) * 8;
                B_elem = B[B_index +: 8];
                $write("%0d\t", B_elem);  // Print B element in matrix format
            end
            $display("");  // Newline after each row
        end

        // Display Product matrix in row-column format
        $display("\nKronecker Product Matrix:");
        for (i = 0; i < N1; i = i + 1) begin
            for (k = 0; k < M1; k = k + 1) begin
                for (j = 0; j < N2; j = j + 1) begin
                    for (l = 0; l < M2; l = l + 1) begin
                        Product_index = ((i * M1 + k) * (N2 * M2) + (j * M2 + l)) * 16;
                        Product_elem = Product[Product_index +: 16];
                        $write("%0d\t", Product_elem);  // Print Product element in matrix format
                    end
                end
                $display("");  // Newline after each row in Kronecker Product matrix
            end
        end
    end
endmodule
