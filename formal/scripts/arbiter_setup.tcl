# =============================================================================
# JasperGold FPV Setup Script — Round-Robin Arbiter
# Usage: jaspergold -batch -tcl formal/scripts/arbiter_setup.tcl
# =============================================================================

# -----------------------------------------------------------------------------
# 1. Analyze: parse all RTL source files.
#    Order matters — elaborate dependencies must come before the top.
# -----------------------------------------------------------------------------
analyze -sv \
    rtl/arbiter_fx_priority.sv \
    rtl/rr_arbiter.sv \
    formal/properties/arbiter_properties.sva

# -----------------------------------------------------------------------------
# 2. Elaborate: bind the design to the top-level module.
#    N=4 is the default; change here to try other configurations.
#    The bind in arbiter_properties.sva attaches the checker automatically.
# -----------------------------------------------------------------------------
elaborate -top rr_arbiter

# -----------------------------------------------------------------------------
# 3. Clock specification.
#    Single clock domain — no CDC concerns in this block.
# -----------------------------------------------------------------------------
clock clk

# -----------------------------------------------------------------------------
# 4. Reset specification.
#    arst_n is active-low async reset, so the reset state is !arst_n == 1,
#    i.e., arst_n driven to 0.
# -----------------------------------------------------------------------------
reset -expression {!arst_n}

# -----------------------------------------------------------------------------
# 5. Prove all asserted properties.
#    JasperGold will report each property as:
#      proven       — full inductive proof, valid for all reachable states
#      cex          — counterexample found, check the waveform viewer
#      inconclusive — solver hit resource limits; consider bounded proof
# -----------------------------------------------------------------------------
prove -all
report -results -summary
# -----------------------------------------------------------------------------
# 6. (Optional) If any property is inconclusive, try a bounded proof.
#    Uncomment and set a depth appropriate for your machine.
#    Document "bounded to depth N" in your README if you use this.
# -----------------------------------------------------------------------------
# prove -bg -time_limit 300 -all
