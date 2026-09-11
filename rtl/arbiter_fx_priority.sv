module arbiter_fx_priority #(
    N
) (
    input logic i_req,
    output logic o_grant
);
    assign o_grant[0] = i_req[0];

    always_comb begin : grant
        for (i = 0 ; i<N; i=i+1 ) begin
            o_grant[i] = i_req[i] & ~(|o_grant[i-1:0])
        end
    end
        
    
endmodule