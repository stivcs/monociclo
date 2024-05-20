module ImmGen_Testbench;

    // Inputs
    logic [24:0] Inst;
    logic [2:0] ImmScr;
    
    // Outputs
    logic [31:0] ImmExt;
    
    // Instantiate ImmGen module
    ImmGen uut (
        .Inst(Inst),
        .ImmScr(ImmScr),
        .ImmExt(ImmExt)
    );
    
    // Clock generation
    logic clk;
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Stimulus
    initial begin
        // Open VCD file
        $dumpfile("simulation.vcd");
        $dumpvars(0, ImmGen_Testbench);
        // Test case 1
        Inst = 25'b1110101001010000000000000;
        ImmScr = 3'b000;
        #10;
        
        // Test case 2
        Inst = 25'b0110101001010000000000101;
        ImmScr = 3'b001;
        #10;
        //0110110100110
        // Test case 3
        Inst = 25'b0101101010000000000000111;
        ImmScr = 3'b101;
        #10;
        // Close VCD file and finish simulation
        $dumpoff;
        $finish;
    end

endmodule

