module dual_ff_sync (
    input  logic clk,
    input  logic rst_n,
    input  logic d0,
    output logic q
);

    logic q0;

    always_ff @(posedge clk) begin : sync
        if (!rst_n) begin
            q0 <= 1'b0;
            q  <= 1'b0;
        end else begin
            q0 <= d0;
            q  <= q0;
        end
    end

endmodule
