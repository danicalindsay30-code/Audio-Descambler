// mixer7k.sv  -  YOUR VERSION. Same ports as rtl/mixer7k.sv.
// Goal: y = sat( (x * sine[idx]) >>> (XW-1) ), idx steps by 7 modulo 50 on every valid sample.
module mixer7k #(
    parameter int    XW        = 12,
    parameter int    LUT_N     = 50,
    parameter int    STEP      = 7,
    parameter        SINE_FILE = "sine50.hex"
) (
    input  logic                 clk,
    input  logic                 rst,
    input  logic                 in_valid,
    input  logic signed [XW-1:0] x_in,
    output logic                 out_valid,    // = in_valid delayed one cycle
    output logic signed [XW-1:0] y_out
);
    // TODO 1: sine ROM (LUT_N entries, XW bits) loaded with $readmemh.
    //         Why does stepping by 7 through 50 entries give exactly 7 kHz at fs = 50 kHz?
    // TODO 2: 12x12 signed product. How many bits? Why shift by XW-1 = 11?
    // TODO 3: saturate to XW bits, register y_out, advance idx modulo LUT_N.
endmodule
