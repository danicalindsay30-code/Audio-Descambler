// fir_serial.sv  -  YOUR VERSION. Same ports as rtl/fir_serial.sv so the same testbench works.
// Goal: y[n] = sat( (sum_{k=0}^{N-1} h[k] * x[n-k]) >>> (CW-1) ) using ONE multiplier.
module fir_serial #(
    parameter int    N         = 255,
    parameter int    XW        = 12,
    parameter int    CW        = 16,
    parameter int    AW        = 8,            // 2**AW >= N
    parameter        COEF_FILE = "coef.hex"
) (
    input  logic                 clk,
    input  logic                 rst,
    input  logic                 in_valid,     // 1-cycle pulse per sample
    input  logic signed [XW-1:0] x_in,
    output logic                 out_valid,    // 1-cycle pulse when y_out is new
    output logic signed [XW-1:0] y_out
);
    // TODO 1: how wide must the accumulator be? (product width + growth from N additions)
    // localparam int ACCW = ...;

    // TODO 2: sample history buffer (2**AW entries) and coefficient ROM loaded with $readmemh.
    //         Keep the RAM write in its own always_ff with no reset so Quartus infers block RAM.

    // TODO 3: control. On in_valid: write x_in at wr_ptr, set rd_ptr to the newest sample,
    //         start a tap counter k at 0. Each cycle while busy: rd_ptr-- (older sample), k++.

    // TODO 4: pipeline. Stage 1 register xbuf[rd_ptr] and coef[k]; stage 2 register the product;
    //         stage 3 accumulate. Carry a 'valid' and 'last tap' flag down the pipeline with the data.

    // TODO 5: on the last tap: shift right by CW-1, saturate to XW bits, pulse out_valid, clear acc.
endmodule
