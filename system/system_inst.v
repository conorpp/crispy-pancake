	system u0 (
		.clk_clk                                            (<connected-to-clk_clk>),                                            //                              clk.clk
		.pll_0_outclk0_clk                                  (<connected-to-pll_0_outclk0_clk>),                                  //                    pll_0_outclk0.clk
		.pll_0_reconfig_from_pll_reconfig_from_pll          (<connected-to-pll_0_reconfig_from_pll_reconfig_from_pll>),          //          pll_0_reconfig_from_pll.reconfig_from_pll
		.pll_0_reconfig_to_pll_reconfig_to_pll              (<connected-to-pll_0_reconfig_to_pll_reconfig_to_pll>),              //            pll_0_reconfig_to_pll.reconfig_to_pll
		.pll_reconfig_0_mgmt_avalon_slave_waitrequest       (<connected-to-pll_reconfig_0_mgmt_avalon_slave_waitrequest>),       // pll_reconfig_0_mgmt_avalon_slave.waitrequest
		.pll_reconfig_0_mgmt_avalon_slave_read              (<connected-to-pll_reconfig_0_mgmt_avalon_slave_read>),              //                                 .read
		.pll_reconfig_0_mgmt_avalon_slave_write             (<connected-to-pll_reconfig_0_mgmt_avalon_slave_write>),             //                                 .write
		.pll_reconfig_0_mgmt_avalon_slave_readdata          (<connected-to-pll_reconfig_0_mgmt_avalon_slave_readdata>),          //                                 .readdata
		.pll_reconfig_0_mgmt_avalon_slave_address           (<connected-to-pll_reconfig_0_mgmt_avalon_slave_address>),           //                                 .address
		.pll_reconfig_0_mgmt_avalon_slave_writedata         (<connected-to-pll_reconfig_0_mgmt_avalon_slave_writedata>),         //                                 .writedata
		.pll_reconfig_0_reconfig_from_pll_reconfig_from_pll (<connected-to-pll_reconfig_0_reconfig_from_pll_reconfig_from_pll>), // pll_reconfig_0_reconfig_from_pll.reconfig_from_pll
		.pll_reconfig_0_reconfig_to_pll_reconfig_to_pll     (<connected-to-pll_reconfig_0_reconfig_to_pll_reconfig_to_pll>)      //   pll_reconfig_0_reconfig_to_pll.reconfig_to_pll
	);

