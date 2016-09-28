
module system (
	clk_clk,
	pll_0_reconfig_from_pll_reconfig_from_pll,
	pll_0_reconfig_to_pll_reconfig_to_pll,
	pll_reconfig_0_mgmt_avalon_slave_waitrequest,
	pll_reconfig_0_mgmt_avalon_slave_read,
	pll_reconfig_0_mgmt_avalon_slave_write,
	pll_reconfig_0_mgmt_avalon_slave_readdata,
	pll_reconfig_0_mgmt_avalon_slave_address,
	pll_reconfig_0_mgmt_avalon_slave_writedata,
	pll_reconfig_0_reconfig_from_pll_reconfig_from_pll,
	pll_reconfig_0_reconfig_to_pll_reconfig_to_pll,
	reset_reset_n,
	pll_0_outclk0_clk,
	pll_0_phase_en_phase_en,
	pll_0_updn_updn,
	pll_0_cntsel_cntsel,
	pll_0_phase_done_phase_done);	

	input		clk_clk;
	output	[63:0]	pll_0_reconfig_from_pll_reconfig_from_pll;
	input	[63:0]	pll_0_reconfig_to_pll_reconfig_to_pll;
	output		pll_reconfig_0_mgmt_avalon_slave_waitrequest;
	input		pll_reconfig_0_mgmt_avalon_slave_read;
	input		pll_reconfig_0_mgmt_avalon_slave_write;
	output	[31:0]	pll_reconfig_0_mgmt_avalon_slave_readdata;
	input	[5:0]	pll_reconfig_0_mgmt_avalon_slave_address;
	input	[31:0]	pll_reconfig_0_mgmt_avalon_slave_writedata;
	input	[63:0]	pll_reconfig_0_reconfig_from_pll_reconfig_from_pll;
	output	[63:0]	pll_reconfig_0_reconfig_to_pll_reconfig_to_pll;
	input		reset_reset_n;
	output		pll_0_outclk0_clk;
	input		pll_0_phase_en_phase_en;
	input		pll_0_updn_updn;
	input	[4:0]	pll_0_cntsel_cntsel;
	output		pll_0_phase_done_phase_done;
endmodule
