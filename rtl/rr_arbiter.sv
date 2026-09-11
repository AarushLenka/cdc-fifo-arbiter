module rr_arbiter #(
    parameter N = 4
)(
    input logic clk,
    input logic arst_n,
    input logic [N-1:0] i_req,
    output logic [N-1:0] o_grant
);
    logic [N-1:0] masked_req, masked_grant, priority_sel_grant, mask_reg, next_mask; 

    integer i;
    always_comb begin : next_mask_logic
        next_mask = '1;
        for (i = 0; i<N-1 ; i=i+1 ) begin
            if (o_grant[i]) next_mask = '1 << (i+1);
        end
        if (o_grant[N-1]) next_mask = '1;
    end

    always_ff @( posedge clk or negedge arst_n ) begin : Mask_generation_logic
        if (!arst_n) mask_reg <= '1;
        else mask_reg <= next_mask;
    end

    arbiter_fx_priority #(.N(N)) u_masked_grant (.i_req(masked_req), .o_grant(masked_grant));
    arbiter_fx_priority #(.N(N)) u_priority_grant (.i_req(i_req), .o_grant(priority_sel_grant));

    assign masked_req = i_req & mask_reg;

    assign o_grant = (|masked_req)?masked_grant:priority_sel_grant;
endmodule