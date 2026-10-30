module data_mux(
    input [7:0] A, B, C, D,
    input [1:0] sel,
    output reg [7:0] memory
);

    always @(*) begin
        case (sel)
            2'b00: memory <= A;
            2'b01: memory <= B;
            2'b10: memory <= C;
            2'b11: memory <= D;
            default: memory <= 8'b0;
        endcase
    end

endmodule