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
