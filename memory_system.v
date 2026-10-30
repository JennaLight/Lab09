module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output reg [7:0] memory
);
    reg in_store0, in_store1, in_store2, in_store3;
    reg [7:0]in_memory0, in_memory1, in_memory2, in_memory3;
    wire [7:0]out_memory0, out_memory1, out_memory2, out_memory3;
    
    byte_memory mem0(
        .data(in_memory0),
        .store(in_store0),
        .memory(out_memory0)
    );
    
    byte_memory mem1(
        .data(in_memory1),
        .store(in_store1),
        .memory(out_memory1)
    );
    
    byte_memory mem2(
        .data(in_memory2),
        .store(in_store2),
        .memory(out_memory2)
    );
    
    byte_memory mem3(
        .data(in_memory3),
        .store(in_store3),
        .memory(out_memory3)
    );
    
    always @(*) begin
        case(addr)
            2'b00: {in_store3, in_store2, in_store1, in_store0} <= {1'b0, 1'b0, 1'b0, store};
            2'b01: {in_store3, in_store2, in_store1, in_store0} <= {1'b0, 1'b0, store, 1'b0};
            2'b10: {in_store3, in_store2, in_store1, in_store0} <= {1'b0, store, 1'b0, 1'b0};
            2'b11: {in_store3, in_store2, in_store1, in_store0} <= {store, 1'b0, 1'b0, 1'b0};
        endcase
    end
    
    always @(*) begin
        case(addr)
            2'b00: {in_memory3, in_memory2, in_memory1, in_memory0} <= {8'b00000000, 8'b00000000, 8'b00000000, data};
            2'b01: {in_memory3, in_memory2, in_memory1, in_memory0} <= {8'b00000000, 8'b00000000, data, 8'b00000000};
            2'b10: {in_memory3, in_memory2, in_memory1, in_memory0} <= {8'b00000000, data, 8'b00000000, 8'b00000000};
            2'b11: {in_memory3, in_memory2, in_memory1, in_memory0} <= {data, 8'b00000000, 8'b00000000, 8'b00000000};
        endcase
    end
    
    always @(*) begin
        case(addr)
            2'b00: memory <= out_memory0;
            2'b01: memory <= out_memory1;
            2'b10: memory <= out_memory2;
            2'b11: memory <= out_memory3;
        endcase
    end
    // This should instantiate 4 instances of
    // byte_memory, and then demultiplex
    // data and store into the one selected by
    // addr

    // It should then multiplex the output of the
    // memory specified by addr into the memory
    // output for display on the LEDs

    // you will need 2 demultiplexers:
    // 1. Demultiplex data -> selected byte
    // 2. Demultiplex store -> selected byte

    // and one multiplexer:
    // 1. Multiplex selected byte -> memory

endmodule