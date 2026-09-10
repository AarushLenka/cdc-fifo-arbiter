import fifo_pkg::A_WIDTH;

module dual_ff_sync (
    input  logic clk,
    input  logic rst_n,
    input  logic [A_WIDTH:0] d0,
    output logic [A_WIDTH:0] q
);

    logic [A_WIDTH:0] q0;

    always_ff @(posedge clk or negedge rst_n) begin : sync
        if (!rst_n) begin
            q0 <= '0;
            q  <= '0;
        end else begin
            q0 <= d0;
            q  <= q0;
        end
    end

endmodule
