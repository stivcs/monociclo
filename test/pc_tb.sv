module PcCounter_tb;

    // Parámetros del testbench
    parameter CLK_PERIOD = 10; // Periodo de reloj en unidades de tiempo

    // Señales del testbench
    logic clk;
    logic [31:0] pc;
    logic [31:0] pc_out;



    // Instancia del módulo PcCounter
    PcCounter uut(
        .clk(clk),
        .pc(pc),
        .pc_out(pc_out)
    );

    // Generación de clock
    initial begin
        clk = 0; // Inicializa el reloj en bajo
        forever #((CLK_PERIOD)/2) clk = ~clk; // Genera el pulso de reloj cada medio período
    end

    // Testbench
    initial begin

        // Configura el archivo VCD para registrar las señales
        $dumpfile("simulation3.vcd");
        $dumpvars(0, PcCounter_tb);

        // Inicialización de variables
        pc = 32'hABCDE; // Ejemplo de valor para PC

        // Espera un ciclo de reloj
        #5;
        // Espera un ciclo de reloj
        #5;
        // Espera un ciclo de reloj
        #5;

        pc = 32'h12345678;
        // Espera un ciclo de reloj
        #5;
        // Espera un ciclo de reloj
        #5;

        // Finaliza la simulación
        $finish;
    end

endmodule