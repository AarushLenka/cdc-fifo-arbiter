module arbiter_fx_priority #(
    parameter N
) (
    input logic [N-1:0]i_req,
    output logic [N-1:0] o_grant
);

    integer i;
    always_comb begin : grant
        o_grant[0] = i_req[0];
        for (i = 1 ; i<N; i=i+1 ) begin
            o_grant[i] = i_req[i] & ~(|o_grant[i-1:0]);
        end
    end
        
    
endmodule