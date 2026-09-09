package fifo_pkg;
    parameter int unsigned FIFO_DEPTH = 16;
    parameter int unsigned A_WIDTH    = $clog2(FIFO_DEPTH);
    parameter int unsigned D_WIDTH    = 8;
endpackage