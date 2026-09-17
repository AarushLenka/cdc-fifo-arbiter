# =============================================================================
# JasperGold CDC App Script — Async FIFO (both correct and buggy variants)
# This is separate from FPV — the CDC app does structural CDC linting, not
# functional property proving.
# Usage: jaspergold -batch -tcl formal/scripts/cdc_check.tcl
# =============================================================================

# -----------------------------------------------------------------------------
# RUN 1: Correct Gray-code FIFO — expect a clean CDC report (zero violations).
# -----------------------------------------------------------------------------
puts "======================================================="
puts " CDC CHECK — Correct Gray-code FIFO (async_fifo.sv)"
puts "======================================================="

analyze -sv \
    rtl/fifo_pkg.sv \
    rtl/dual_ff_sync.sv \
    rtl/wrt_ptr_handler.sv \
    rtl/rd_ptr_handler.sv \
    rtl/async_fifo.sv

elaborate -top async_fifo

# Declare both clock domains so the CDC app can identify crossings.
clock wclk
clock rclk

reset -expression {!wrst_n && !rrst_n}

# Run CDC structural analysis.
#   - Reports multi-bit signals crossing clock domains without synchronizers.
#   - Flags reconvergent fanout (a signal sampled in multiple domains).
#   - Checks for glitch-prone combinational logic on async paths.
# Expected result: CLEAN — Gray-code pointers change only 1 bit per transition,
# making them CDC-safe even without a handshake.
cdc run
cdc report -detail -file docs/proofs/cdc_correct_fifo.txt
