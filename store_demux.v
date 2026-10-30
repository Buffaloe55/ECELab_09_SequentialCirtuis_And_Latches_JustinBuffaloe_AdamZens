module store_demux(
    input store,
    input [1:0] sel,
    output reg A, B, C, D
);

    always @(*) begin
        case (sel)
            2'b00: {D, C, B, A} <= {3'b000, store};
            2'b01: {D, C, B, A} <= {2'b00, store, 1'b0};
            2'b10: {D, C, B, A} <= {1'b0, store, 2'b00};
            2'b11: {D, C, B, A} <= {store, 3'b000};
            default: {D, C, B, A} <= 4'b0000;
        endcase
    end

endmodule