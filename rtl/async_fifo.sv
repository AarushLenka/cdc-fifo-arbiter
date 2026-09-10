import fifo_pkg::*;

module async_fifo (
    input logic wclk,
    input logic wrst_n,
    input logic rclk, 
    input logic rrst_n, 
    input logic w_en, 
    input logic r_en, 
    input logic [D_WIDTH-1:0] data_in,
    output logic [D_WIDTH-1:0] data_out
);
    logic full, empty;
    logic [A_WIDTH:0] b_wptr, g_wptr, g_rptr_sync, b_rptr, g_rptr, g_wptr_sync;
    logic [D_WIDTH-1:0] fifo [FIFO_DEPTH-1:0];

    //synchronizers
    dual_ff_sync Rsync(rclk, rrst_n, g_wptr, g_wptr_sync);
    dual_ff_sync Wsync(wclk, wrst_n, g_rptr, g_rptr_sync);

    //pointer handlers
    wrt_ptr_handler WP(wclk, wrst_n, w_en, g_rptr_sync, full, b_wptr, g_wptr);
    rd_ptr_handler RP(rclk, rrst_n, r_en, g_wptr_sync, empty, b_rptr, g_rptr);

    //async read, sync write
    assign data_out = fifo[b_rptr[A_WIDTH-1:0]];

    always_ff @( posedge wclk ) begin : sync_write
        if (w_en && ~full) fifo[b_wptr[A_WIDTH-1:0]] <= data_in;
        
    end
endmodule