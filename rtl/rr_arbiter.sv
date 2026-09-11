module rr_arbiter #(
    parameter N = 4;
    parameter PTR_WIDTH = $clog2(N) ;
)(
    input logic clk,
    input logic arst_n,
    //input logic priority,
    input logic [N-1:0] i_req,
    output logic [N-1:0] o_grant
    output logic grant_valid
);
    logic [N-1:0] masked_req, masked_grant, priority_sel_grant, mask_reg; 

    always_ff @( posedge clk or negedge arst_n ) begin : Mask_generation_logic
        if (!arst_n) mask_reg <= '1;
        else begin
            if (o_grant[0]) mask_reg <= 4'b1110;
            if (o_grant[0]) mask_reg <= 4'b1100;
            if (o_grant[0]) mask_reg <= 4'b1000;
            if (o_grant[0]) mask_reg <= 4'b1111;
        end
    end

    assign masked_req = i_req & mask_reg;

    assign o_grant = (|masked_req)?masked_grant:priority_sel_grant;
endmodule