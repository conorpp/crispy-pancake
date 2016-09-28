module clock_glitcher(input clk, output glitch, output [9:0] LEDR);

wire reset;

assign reset = 0;




/*
module system (
	clk_clk,
	reset_reset_n,
	pll_reconfig_0_reconfig_to_pll_reconfig_to_pll,
	pll_reconfig_0_reconfig_from_pll_reconfig_from_pll,
	pll_0_reconfig_to_pll_reconfig_to_pll,
	pll_0_reconfig_from_pll_reconfig_from_pll,
	pll_0_locked_export,
	pll_reconfig_0_mgmt_avalon_slave_waitrequest,
	pll_reconfig_0_mgmt_avalon_slave_read,
	pll_reconfig_0_mgmt_avalon_slave_write,
	pll_reconfig_0_mgmt_avalon_slave_readdata,
	pll_reconfig_0_mgmt_avalon_slave_address,
	pll_reconfig_0_mgmt_avalon_slave_writedata);	

	input		clk_clk;
	input		reset_reset_n;
	output	[63:0]	pll_reconfig_0_reconfig_to_pll_reconfig_to_pll;
	input	[63:0]	pll_reconfig_0_reconfig_from_pll_reconfig_from_pll;
	input	[63:0]	pll_0_reconfig_to_pll_reconfig_to_pll;
	output	[63:0]	pll_0_reconfig_from_pll_reconfig_from_pll;
	output		pll_0_locked_export;
	
	output		pll_reconfig_0_mgmt_avalon_slave_waitrequest;
	input		pll_reconfig_0_mgmt_avalon_slave_read;
	input		pll_reconfig_0_mgmt_avalon_slave_write;
	output	[31:0]	pll_reconfig_0_mgmt_avalon_slave_readdata;
	input	[5:0]	pll_reconfig_0_mgmt_avalon_slave_address;
	input	[31:0]	pll_reconfig_0_mgmt_avalon_slave_writedata;
endmodule

*/
wire newclk;
wire[63:0] pll_bus_to;
wire[63:0] pll_bus_from;

wire ava_sread, ava_swrite;
wire [31:0] ava_srddata, ava_swrdata;
wire [5:0] ava_saddr;

system
(
.clk_clk(clk),
.reset_reset_n(reset),

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

	.pll_0_phase_en_phase_en(1'b1),
	.pll_0_updn_updn(1'b1),
	.pll_0_cntsel_cntsel(0),
	.pll_0_phase_done_phase_done()
);

assign ava_sread = 0;
assign ava_swrite = 0;
assign ava_swrdata = 0;
assign ava_saddr = 0;


reg[31:0] count_reg;
reg[31:0] count_new;

always@(posedge clk)
begin
    count_reg <= count_reg + 1;
end

always@(posedge newclk)
begin
    count_new <= count_new + 1;
end

assign LEDR[8:1] = 8'h00;

assign LEDR[9] = count_reg[25];

assign LEDR[0] = count_new[25];


endmodule
