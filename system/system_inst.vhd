	component system is
		port (
			clk_clk                                            : in  std_logic                     := 'X';             -- clk
			pll_0_outclk0_clk                                  : out std_logic;                                        -- clk
			pll_0_reconfig_from_pll_reconfig_from_pll          : out std_logic_vector(63 downto 0);                    -- reconfig_from_pll
			pll_0_reconfig_to_pll_reconfig_to_pll              : in  std_logic_vector(63 downto 0) := (others => 'X'); -- reconfig_to_pll
			pll_reconfig_0_reconfig_from_pll_reconfig_from_pll : in  std_logic_vector(63 downto 0) := (others => 'X'); -- reconfig_from_pll
			pll_reconfig_0_reconfig_to_pll_reconfig_to_pll     : out std_logic_vector(63 downto 0);                    -- reconfig_to_pll
			reset_reset_n                                      : in  std_logic                     := 'X';             -- reset_n
			uart_0_rxd                                         : in  std_logic                     := 'X';             -- rxd
			uart_0_txd                                         : out std_logic;                                        -- txd
			pll_0_reset_reset                                  : in  std_logic                     := 'X';             -- reset
			gpio_pll_export                                    : out std_logic_vector(7 downto 0)                      -- export
		);
	end component system;

	u0 : component system
		port map (
			clk_clk                                            => CONNECTED_TO_clk_clk,                                            --                              clk.clk
			pll_0_outclk0_clk                                  => CONNECTED_TO_pll_0_outclk0_clk,                                  --                    pll_0_outclk0.clk
			pll_0_reconfig_from_pll_reconfig_from_pll          => CONNECTED_TO_pll_0_reconfig_from_pll_reconfig_from_pll,          --          pll_0_reconfig_from_pll.reconfig_from_pll
			pll_0_reconfig_to_pll_reconfig_to_pll              => CONNECTED_TO_pll_0_reconfig_to_pll_reconfig_to_pll,              --            pll_0_reconfig_to_pll.reconfig_to_pll
			pll_reconfig_0_reconfig_from_pll_reconfig_from_pll => CONNECTED_TO_pll_reconfig_0_reconfig_from_pll_reconfig_from_pll, -- pll_reconfig_0_reconfig_from_pll.reconfig_from_pll
			pll_reconfig_0_reconfig_to_pll_reconfig_to_pll     => CONNECTED_TO_pll_reconfig_0_reconfig_to_pll_reconfig_to_pll,     --   pll_reconfig_0_reconfig_to_pll.reconfig_to_pll
			reset_reset_n                                      => CONNECTED_TO_reset_reset_n,                                      --                            reset.reset_n
			uart_0_rxd                                         => CONNECTED_TO_uart_0_rxd,                                         --                           uart_0.rxd
			uart_0_txd                                         => CONNECTED_TO_uart_0_txd,                                         --                                 .txd
			pll_0_reset_reset                                  => CONNECTED_TO_pll_0_reset_reset,                                  --                      pll_0_reset.reset
			gpio_pll_export                                    => CONNECTED_TO_gpio_pll_export                                     --                         gpio_pll.export
		);

