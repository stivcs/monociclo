module DataMemory_tb;

    // Parámetros del testbench
    parameter CLK_PERIOD = 10; // Periodo de reloj en unidades de tiempo
    parameter MAX_ADDR = 1023; // Dirección máxima de memoria
    parameter NUM_TESTS = 2; // Número de pruebas

    // Señales de entrada
    logic [31:0] Address;
    logic [31:0] DataWr;
    logic DMWr;
    logic [2:0] DMCtrl;

    // Señal de salida
    logic [31:0] DataRd;

    // Señal de reloj
    bit clk;

    // Instancia del módulo DataMemory
    DataMemory uut(
        .Address(Address),
        .DataWr(DataWr),
        .DMWr(DMWr),
        .DMCtrl(DMCtrl),
        .DataRd(DataRd)
    );

    // Testbench
    initial begin
        // Inicialización de variables
        Address = 0;
        DataWr = 0;
        DMWr = 0;
        DMCtrl = 0;
        clk = 0;

        // Abre el archivo VCD
        $dumpfile("simulation2.vcd");
        $dumpvars(0, DataMemory_tb);

        // Test de escritura y lectura
        $display("Comenzando testbench...");
        repeat(NUM_TESTS) begin
            // Genera datos aleatorios para escribir
            DataWr = {{24'b0},{8'b01010111}};
            // Selecciona una dirección aleatoria
            Address = 32'b0;
            // Escritura en memoria
            DMCtrl = 3'b000;
            DMWr = 1;
            #5; // Espera un ciclo de reloj
            DMWr = 0;
            #5; // Espera un ciclo de reloj
            // Lectura de memoria
            Address = {{31'b0}, {1'b1}};
            DMCtrl = 3'b001;
            DataWr = {{16'b0}, {16'b0010101101111111}};
            DMWr = 1;
            #5; // Espera un ciclo de reloj
            DMWr = 0;
            #5; // Espera un ciclo de reloj

        end

        // Finaliza la simulación
        $display("Testbench finalizado.");
        $finish;
    end

    // Generación de clock
    always #((CLK_PERIOD)/2) clk = ~clk;

endmodule
