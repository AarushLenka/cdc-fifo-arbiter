module arbiter_fx_priority #(
    parameter int N = 4
) (
    input logic [N-1:0]i_req,
    output logic [N-1:0] o_grant
);

    always_comb begin : grant
        logic higher_granted;
        higher_granted = 1'b0;
        for (int i = 0; i < N; i++) begin
            o_grant[i]     = i_req[i] & ~higher_granted;
            higher_granted = higher_granted | o_grant[i];
        end
    end
        
    
endmodule