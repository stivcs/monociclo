module ALU_tb;

    // Parámetros del testbench
    parameter CLK_PERIOD = 10; // Periodo de reloj en unidades de tiempo

    // Señales del testbench
    logic [31:0] A;
    logic [31:0] B;
    logic [3:0] ALUop;
    logic signed [31:0] ALUS;

    // Instancia del módulo ALU
    ALU uut(
        .A(A),
        .B(B),
        .ALUop(ALUop),
        .ALUS(ALUS)
    );

    // Generación de clock
    logic clk;
    initial begin
        clk = 0; // Inicializa el reloj en bajo
        forever #((CLK_PERIOD)/2) clk = ~clk; // Genera el pulso de reloj cada medio período
    end

    // Testbench
    initial begin
        // Configura el archivo VCD para registrar las señales
        $dumpfile("ALU_simulation.vcd");
        $dumpvars(0, ALU_tb);

        // Combinaciones de entrada
        A = 32'h00000001; B = 32'h00000002; ALUop = 4'b0000; #10; // Suma
        A = 32'h00000004; B = 32'h00000002; ALUop = 4'b1000; #10; // Resta
        A = 32'h00000001; B = 32'h00000002; ALUop = 4'b0001; #10; // Shift izquierda
        A = 32'h00000003; B = 32'h00000002; ALUop = 4'b0010; #10; // Menor que (signed)
        A = 32'h00000003; B = 32'h00000002; ALUop = 4'b0011; #10; // Menor que (unsigned)
        A = 32'h00000001; B = 32'h00000003; ALUop = 4'b0100; #10; // XOR
        A = 32'h00000004; B = 32'h00000002; ALUop = 4'b0101; #10; // Shift derecha
        A = 32'h00000020; B = 5; ALUop = 4'b1101; #10; // Shift lógico a la derecha
        A = 32'h00000001; B = 32'h00000002; ALUop = 4'b0110; #10; // OR
        A = 32'h00000001; B = 32'h00000002; ALUop = 4'b0111; #10; // AND
        // Finaliza la simulación
        $finish;
    end

endmodule