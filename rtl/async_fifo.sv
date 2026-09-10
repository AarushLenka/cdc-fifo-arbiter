import fifo_pkg::*;

module async_fifo (
    input logic wclk,
    input logic wrst_n,
    input logic rclk, 
    input logic rrst_n, 
    input logic w_en, 
    input logic r_en, 
    input logic full, 
    input logic empty,
    input logic [D_WIDTH-1:0] data_in,
    input logic [D_WIDTH-1:0] data_out
);
    logic [A_WIDTH-1:0] raddr, waddr;
    logic [A_WIDTH:0] b_wptr, g_wptr, g_rptr_sync, b_rptr, g_rptr, g_wptr_sync;
    logic [D_WIDTH-1:0] fifo [FIFO_DEPTH-1:0];
endmodule