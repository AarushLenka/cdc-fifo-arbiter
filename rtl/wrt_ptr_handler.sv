import fifo_pkg::*;

module wrt_ptr_handler (
    input logic wclk,
    input logic wrst_n, 
    input logic [A_WIDTH:0] g_rptr_sync,
    output logic [A_WIDTH:0] g_wptr, 
    output logic [A_WIDTH:0] b_wptr,
    output logic [A_WIDTH:0] wfull
);
    wire b_wptr_next, g_wptr_next;
    assign b_wptr_next = b_wptr + (!full && w_en);
    assign g_wptr_next = (b_wptr>>1)^b_wptr;
    assign wfull = (g_wptr_next==(~(g_rptr_sync[A_WIDTH:A_WIDTH-2])))
endmodule