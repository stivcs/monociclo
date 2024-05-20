module branchunit_tb;

    // Señales del testbench
    logic [31:0] A;
    logic [31:0] B;
    logic [4:0] BrOp;
    logic NextPCSrc;

    // Instancia del módulo branchunit
    branchunit uut(
        .A(A),
        .B(B),
        .BrOp(BrOp),
        .NextPCSrc(NextPCSrc)
    );
    // Testbench
    initial begin
        // Configura el archivo VCD para registrar las señales
        $dumpfile("branchunit_simulation.vcd");
        $dumpvars(0, branchunit_tb);

        // Combinaciones de entrada
        A = 32'h00000002; B = 32'h00000001; BrOp = 5'b01000; #10; // A == B
        A = 32'h00000001; B = 32'h00000002; BrOp = 5'b01001; #10; // A != B
        A = 32'h00000001; B = 32'h00000002; BrOp = 5'b01100; #10; // A < B
        A = 32'h00000002; B = 32'h00000001; BrOp = 5'b01101; #10; // A >= B
        A = 32'h00000001; B = 32'h00000002; BrOp = 5'b01110; #10; // $unsigned(A) < $unsigned(B)
        A = 32'h00000002; B = 32'h00000001; BrOp = 5'b01111; #10; // $unsigned(A) >= $unsigned(B)
        // Finaliza la simulación
        $finish;
    end

endmodule
