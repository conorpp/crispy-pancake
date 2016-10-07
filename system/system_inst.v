	system u0 (
		.clk_clk                                            (<connected-to-clk_clk>),                                            //                              clk.clk
		.pll_0_outclk0_clk                                  (<connected-to-pll_0_outclk0_clk>),                                  //                    pll_0_outclk0.clk
		.pll_0_reconfig_from_pll_reconfig_from_pll          (<connected-to-pll_0_reconfig_from_pll_reconfig_from_pll>),          //          pll_0_reconfig_from_pll.reconfig_from_pll
		.pll_0_reconfig_to_pll_reconfig_to_pll              (<connected-to-pll_0_reconfig_to_pll_reconfig_to_pll>),              //            pll_0_reconfig_to_pll.reconfig_to_pll
		.pll_reconfig_0_reconfig_from_pll_reconfig_from_pll (<connected-to-pll_reconfig_0_reconfig_from_pll_reconfig_from_pll>), // pll_reconfig_0_reconfig_from_pll.reconfig_from_pll
		.pll_reconfig_0_reconfig_to_pll_reconfig_to_pll     (<connected-to-pll_reconfig_0_reconfig_to_pll_reconfig_to_pll>),     //   pll_reconfig_0_reconfig_to_pll.reconfig_to_pll
		.reset_reset_n                                      (<connected-to-reset_reset_n>),                                      //                            reset.reset_n
		.uart_0_rxd                                         (<connected-to-uart_0_rxd>),                                         //                           uart_0.rxd
		.uart_0_txd                                         (<connected-to-uart_0_txd>),                                         //                                 .txd
		.pll_0_reset_reset                                  (<connected-to-pll_0_reset_reset>),                                  //                      pll_0_reset.reset
		.gpio_pll_export                                    (<connected-to-gpio_pll_export>)                                     //                         gpio_pll.export
	);

