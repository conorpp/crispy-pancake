module clock_glitcher(input clk, output glitch, output [9:0] LEDR, inout [35:0] GPIO_0, input[3:0] KEY);

wire reset;
wire newclk, glitchclk;
wire uart_tx, uart_rx;

assign reset = KEY[0];

assign LEDR[8:1] = 8'h00;

assign LEDR[9] = count_reg[25];

assign LEDR[0] = count_new[25];

assign GPIO_0[0] = clk;
assign GPIO_0[1] = newclk;
assign GPIO_0[2] = 0;
assign GPIO_0[3] = 0;
assign GPIO_0[4] = clk ^ newclk;




wire[63:0] pll_bus_to;
wire[63:0] pll_bus_from;

wire ava_sread, ava_swrite;
wire [31:0] ava_srddata, ava_swrdata;
wire [5:0] ava_saddr;

assign ava_sread = 0;
assign ava_swrite = 0;
assign ava_swrdata = 0;
assign ava_saddr = 0;

system
(
.clk_clk(clk),
.reset_reset_n(reset),
.uart_0_rxd(uart_rx),
.uart_0_txd(uart_tx),
.hps_io_hps_io_uart0_inst_RX(uart_rx),
.hps_io_hps_io_uart0_inst_TX(uart_tx),


.pll_reconfig_0_reconfig_to_pll_reconfig_to_pll(),
.pll_reconfig_0_reconfig_from_pll_reconfig_from_pll(),
.pll_0_reconfig_to_pll_reconfig_to_pll(),
.pll_0_reconfig_from_pll_reconfig_from_pll(),
//.pll_0_locked_export(),
.pll_0_outclk0_clk(newclk),

.pll_reconfig_0_mgmt_avalon_slave_waitrequest(),
.pll_reconfig_0_mgmt_avalon_slave_read(ava_sread),
.pll_reconfig_0_mgmt_avalon_slave_write(ava_swrite),
.pll_reconfig_0_mgmt_avalon_slave_readdata(ava_srddata),
.pll_reconfig_0_mgmt_avalon_slave_address(ava_saddr),
.pll_reconfig_0_mgmt_avalon_slave_writedata(ava_swrdata),

	//.pll_0_phase_en_phase_en(1'b1),
	//.pll_0_updn_updn(1'b1),
	//.pll_0_cntsel_cntsel(0),
	//.pll_0_phase_done_phase_done()
);

reg[31:0] count_reg;
reg[31:0] count_new;

assign glitchclk = clk ^ newclk;

always@(posedge clk)
begin
    if (~reset)
        count_reg <= 0;
    else
        count_reg <= count_reg + 1;
end

always@(posedge glitchclk)
begin
    if (~reset)
        count_new <= 0;
    else
        count_new <= count_new + 1;
end

endmodule
