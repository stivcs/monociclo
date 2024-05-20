module ControlUnit_tb;

    // Parámetros del testbench
    parameter CLK_PERIOD = 10; // Periodo de reloj en unidades de tiempo

    // Señales del testbench
    logic [6:0] opcode;
    logic [2:0] funct3;
    logic [6:0] funct7;
    logic AluASrc;
    logic AluBSrc;
    logic RuWr;
    logic [2:0] ImmSrc;
    logic [3:0] ALUOp;
    logic [4:0] BrOp;
    logic DMWr;
    logic [2:0] DMCtrl;
    logic [1:0] RUDataWrSrc;

    // Instancia del módulo ControlUnit
    ControlUnit uut(
        .opcode(opcode),
        .funct3(funct3),
        .funct7(funct7),
        .AluASrc(AluASrc),
        .AluBSrc(AluBSrc),
        .RuWr(RuWr),
        .ImmSrc(ImmSrc),
        .ALUOp(ALUOp),
        .BrOp(BrOp),
        .DMWr(DMWr),
        .DMCtrl(DMCtrl),
        .RUDataWrSrc(RUDataWrSrc)
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
        $dumpfile("control_unit_simulation.vcd");
        $dumpvars(0, ControlUnit_tb);

        opcode = 7'b0110011; funct7 = 7'b0000000; funct3 = 3'b000; #10;
        opcode = 7'b0110011; funct7 = 7'b0100000; funct3 = 3'b000; #10;
        opcode = 7'b0110011; funct7 = 7'b0000000; funct3 = 3'b001; #10;
        opcode = 7'b0110011; funct7 = 7'b0000000; funct3 = 3'b010; #10;
        opcode = 7'b0110011; funct7 = 7'b0000000; funct3 = 3'b011; #10;
        opcode = 7'b0110011; funct7 = 7'b0000000; funct3 = 3'b100; #10;
        opcode = 7'b0110011; funct7 = 7'b0000000; funct3 = 3'b101; #10;
        opcode = 7'b0110011; funct7 = 7'b0100000; funct3 = 3'b101; #10;
        opcode = 7'b0110011; funct7 = 7'b0000000; funct3 = 3'b110; #10;
        opcode = 7'b0110011; funct7 = 7'b0000000; funct3 = 3'b111; #10;

        opcode = 7'b0010011; funct7 = 7'b0; funct3 = 3'b000; #10;
        opcode = 7'b0010011; funct7 = 7'b0; funct3 = 3'b001; #10;
        opcode = 7'b0010011; funct7 = 7'b0; funct3 = 3'b010; #10;
        opcode = 7'b0010011; funct7 = 7'b0; funct3 = 3'b011; #10;
        opcode = 7'b0010011; funct7 = 7'b0; funct3 = 3'b100; #10;
        opcode = 7'b0010011; funct7 = 7'b0; funct3 = 3'b101; #10;
        opcode = 7'b0010011; funct7 = 7'b0; funct3 = 3'b110; #10;
        opcode = 7'b0010011; funct7 = 7'b0; funct3 = 3'b111; #10;

        opcode = 7'b0000011; funct7 = 7'b0; funct3 = 3'b000; #10;
        opcode = 7'b0000011; funct7 = 7'b0; funct3 = 3'b001; #10;
        opcode = 7'b0000011; funct7 = 7'b0; funct3 = 3'b010; #10;
        opcode = 7'b0000011; funct7 = 7'b0; funct3 = 3'b100; #10;
        opcode = 7'b0000011; funct7 = 7'b0; funct3 = 3'b101; #10;

        opcode = 7'b0100011; funct7 = 7'b0; funct3 = 3'b000; #10;
        opcode = 7'b0100011; funct7 = 7'b0; funct3 = 3'b001; #10;
        opcode = 7'b0100011; funct7 = 7'b0; funct3 = 3'b010; #10;

        opcode = 7'b1100011; funct7 = 7'b0; funct3 = 3'b000; #10;
        opcode = 7'b1100011; funct7 = 7'b0; funct3 = 3'b001; #10;
        opcode = 7'b1100011; funct7 = 7'b0; funct3 = 3'b100; #10;
        opcode = 7'b1100011; funct7 = 7'b0; funct3 = 3'b101; #10;
        opcode = 7'b1100011; funct7 = 7'b0; funct3 = 3'b110; #10;
        opcode = 7'b1100011; funct7 = 7'b0; funct3 = 3'b111; #10;

        opcode = 7'b1101111; funct7 = 7'b0; funct3 = 3'b0; #10;

        opcode = 7'b1100111; funct7 = 7'b0; funct3 = 3'b000; #10;


        // Finaliza la simulación
        $finish;
    end

endmodule