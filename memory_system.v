module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
);

    // Four separate 8-bit data signals
    wire [7:0] byte_data [3:0];

    // One enable bit for each byte
    wire [3:0] byte_store;

    // Four separate 8-bit stored values
    wire [7:0] byte_output [3:0];

    data_demux incoming_data(
        .data(data),
        .sel(addr),
        .A(byte_data[0]),
        .B(byte_data[1]),
        .C(byte_data[2]),
        .D(byte_data[3])
    );

    store_demux incoming_store(
        .store(store),
        .sel(addr),
        .A(byte_store[0]),
        .B(byte_store[1]),
        .C(byte_store[2]),
        .D(byte_store[3])
    );

    // Create four byte_memory blocks
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : bytes
            byte_memory inst(
                .data(byte_data[i]),
                .store(byte_store[i]),
                .memory(byte_output[i])
            );
        end
    endgenerate

    data_mux outgoing_data(
        .A(byte_output[0]),
        .B(byte_output[1]),
        .C(byte_output[2]),
        .D(byte_output[3]),
        .sel(addr),
        .memory(memory)
    );

endmodule