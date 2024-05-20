module registerUnit_tb;

    // Parámetros del testbench
    parameter CLK_PERIOD = 10; // Periodo de reloj en unidades de tiempo

    // Señales del testbench
    logic [31:0] RuDataWrite;
    logic [4:0] rd;
    logic [4:0] rs1;
    logic [4:0] rs2;
    logic clk;
    logic Ruwy;
    logic [31:0] Ru1;
    logic [31:0] Ru2;

    // Instancia del módulo registerUnit
    registerUnit uut(
        .RuDataWrite(RuDataWrite),
        .rd(rd),
        .rs1(rs1),
        .rs2(rs2),
        .clk(clk),
        .Ruwy(Ruwy),
        .Ru1(Ru1),
        .Ru2(Ru2)
    );

    // Generación de clock
    initial begin
        clk = 0; // Inicializa el reloj en bajo
        forever #((CLK_PERIOD)/2) clk = ~clk; // Genera el pulso de reloj cada medio período
    end

    // Testbench
    initial begin
        // Configura el archivo VCD para registrar las señales
        $dumpfile("registerUnit_simulation.vcd");
        $dumpvars(0, registerUnit_tb);

        // Combinaciones de entrada
        RuDataWrite = 32'h00000001; rd = 5'b00000; rs1 = 5'b00000; rs2 = 5'b00001; Ruwy = 1; #10; // Escritura en registro rd
        Ruwy = 0; #10; // Sin escritura
        RuDataWrite = 32'h00000002; rd = 5'b00000; rs1 = 5'b00000; rs2 = 5'b00001; Ruwy = 1; #10; // Escritura en registro rd
        Ruwy = 0; #10; // Sin escritura
        RuDataWrite = 32'h00000003; rd = 5'b00001; rs1 = 5'b00000; rs2 = 5'b00001; Ruwy = 1; #10; // Escritura en registro rd
        Ruwy = 0; #10; // Sin escritura
        RuDataWrite = 32'h00000000; rd = 5'b00000; rs1 = 5'b00000; rs2 = 5'b00001; Ruwy = 0; #10; // Sin escritura
        // Finaliza la simulación
        $finish;
    end

endmodule
