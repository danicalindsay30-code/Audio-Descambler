// adc_spi.sv  -  YOUR VERSION. Same ports as rtl/adc_spi.sv.
// ADC128S022 frame: 16 SCLK cycles, SCLK idles high, CS_n low for the whole frame.
// DIN (channel address) changes on SCLK falling edges, 0 = channel 0.
// DOUT gives 4 zeros then data[11..0], one bit per cycle; sample it on SCLK rising edges 4..15.
module adc_spi #(
    parameter int HALF = 10          // half SCLK period in 50 MHz cycles -> 2.5 MHz
) (
    input  logic        clk,
    input  logic        rst,
    input  logic        start,       // 1-cycle pulse at the sample rate
    output logic        adc_cs_n,
    output logic        adc_sclk,
    output logic        adc_din,
    input  logic        adc_dout,
    output logic        valid,       // 1-cycle pulse when sample is ready
    output logic [11:0] sample
);
    // TODO 1: a counter that marks every HALF cycles (one SCLK half period).
    // TODO 2: a phase counter. Phase 0 = CS_n low with SCLK still high (setup),
    //         then alternate SCLK low / high for 16 full cycles.
    // TODO 3: on the rising edges of cycles 4..15, shift adc_dout into a 12-bit register.
    // TODO 4: at the end, raise CS_n, copy the register to 'sample', pulse 'valid'.
    // Question to answer aloud: why is SCLK a register here and not a second clock?
endmodule
