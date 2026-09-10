import fifo_pkg::*;

module wrt_ptr_handler (
    input logic wclk,
    input logic wrst_n,
    input logic w_en,
    input logic [A_WIDTH:0] g_rptr_sync,
    output logic [A_WIDTH:0] g_wptr, 
    output logic [A_WIDTH:0] b_wptr,
    output logic full
);
    logic [A_WIDTH:0] b_wptr_next, g_wptr_next;
    logic wfull;

    assign b_wptr_next = b_wptr + (~wfull && w_en);
    assign g_wptr_next = (b_wptr_next>>1)^b_wptr_next;
    assign wfull = (g_wptr_next=={~g_rptr_sync[A_WIDTH:A_WIDTH-1],g_rptr_sync[A_WIDTH-2:0]});

    always_ff @( posedge wclk or negedge wrst_n ) begin : registers
        if (!wrst_n) begin
            b_wptr <= '0;
            g_wptr <= '0;
            full <= 1'b0;
        end
        else begin
            b_wptr <= b_wptr_next;
            g_wptr <= g_wptr_next;
            full <= wfull;
        end       
    end
endmodule