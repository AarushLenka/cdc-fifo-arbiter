import fifo_pkg::*;

module rd_ptr_handler (
    input logic rclk,
    input logic rrst_n,
    input logic r_en,
    input logic [A_WIDTH:0] g_wptr_sync,
    output logic empty,
    output logic [A_WIDTH:0] b_rptr,
    output logic [A_WIDTH:0] g_rptr
);
    logic [A_WIDTH:0] g_rptr_next, b_rptr_next;
    logic rempty;

    assign b_rptr_next = b_rptr + (~empty && r_en);
    assign g_rptr_next = (b_rptr_next>>1)^b_rptr_next;
    assign rempty = (g_rptr_next==g_wptr_sync);

    always_ff @( posedge rclk or negedge rrst_n ) begin : read
        if (!rrst_n) begin
            b_rptr <= '0;
            g_rptr <= '0;
            empty <= 1'b1;
        end
        else begin
            b_rptr <= b_rptr_next;
            g_rptr <= g_rptr_next;
            empty <= rempty;
        end      
    end
endmodule