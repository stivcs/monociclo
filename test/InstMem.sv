module InstMem_tb;

    // Parámetros del testbench
    parameter CLK_PERIOD = 10; // Periodo de reloj en unidades de tiempo

    // Señales del testbench
    logic [31:0] Address;
    logic [31:0] Inst;

    // Instancia del módulo InstMem
    InstructionMemory uut(
        .Adress(Address),
        .Inst(Inst)
    );

    // File handle para el archivo VCD
    integer file;
    logic clk;
    // Generación de clock
    initial begin
        clk = 0; // Inicializa el reloj en bajo
        forever #((CLK_PERIOD)/2) clk = ~clk; // Genera el pulso de reloj cada medio período
    end

    // Testbench
    initial begin
        // Abre el archivo VCD
        file = $fopen("instmem_simulation.vcd", "w");

        // Configura el archivo VCD para registrar las señales
        $dumpfile("instmem_simulation.vcd");
        $dumpvars(0, InstMem_tb);

        // Inicialización de variables
        Address = 0;

        // Espera un ciclo de reloj
        #10;

        // Realiza lecturas de instrucciones en diferentes direcciones
        repeat (19) begin
            Address = Address + 4; // Avanza de 4 en 4 bytes para leer cada instrucción
            #10; // Espera un ciclo de reloj
        end

        // Cierra el archivo VCD
        $fclose(file);

        // Finaliza la simulación
        $finish;
    end

endmodule