# =============================================================================
# JasperGold FPV Setup Script — Async FIFO (correct Gray-code variant)
# Usage: jaspergold -batch -tcl formal/scripts/fifo_setup.tcl
# =============================================================================

# -----------------------------------------------------------------------------
# 1. Analyze: parse all RTL source files.
#    fifo_pkg must come first — all other modules import from it.
#    dual_ff_sync and pointer handlers before async_fifo (their instantiator).
# -----------------------------------------------------------------------------
analyze -sv \
    rtl/fifo_pkg.sv \
    rtl/dual_ff_sync.sv \
    rtl/wrt_ptr_handler.sv \
    rtl/rd_ptr_handler.sv \
    rtl/async_fifo.sv \
    formal/properties/fifo_properties.sva

# -----------------------------------------------------------------------------
# 2. Elaborate: two-clock design, no parameters needed (set in fifo_pkg).
# -----------------------------------------------------------------------------
elaborate -top async_fifo

# -----------------------------------------------------------------------------
# 3. Clock specification.
#    Two independent asynchronous clocks — this is the CDC-sensitive part.
#    -normalize tells JasperGold to handle the clock domain crossing formally
#    rather than assuming any phase relationship between the two clocks.
# -----------------------------------------------------------------------------
clock wclk
clock rclk -normalize

# -----------------------------------------------------------------------------
# 4. Reset specification.
#    Both resets are active-low. Drive both low simultaneously to initialize
#    the design into a known state before formal exploration begins.
# -----------------------------------------------------------------------------
reset -expression {!wrst_n && !rrst_n}

# -----------------------------------------------------------------------------
# 5. Prove all asserted properties.
# -----------------------------------------------------------------------------
prove -all
report -results -summary
# -----------------------------------------------------------------------------
# 6. Bounded proof fallback.
#    The no-data-loss (ghost counter) property is the hardest to converge.
#    If it comes back inconclusive, use bounded proof and document the depth.
#    A bounded proof to depth 32+ is still a meaningful, honest result.
# -----------------------------------------------------------------------------
# prove -bg -time_limit 600 -all
