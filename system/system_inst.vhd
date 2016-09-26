	component system is
		port (
			clk_clk                                            : in  std_logic                     := 'X';             -- clk
			reset_reset_n                                      : in  std_logic                     := 'X';             -- reset_n
			pll_reconfig_0_reconfig_to_pll_reconfig_to_pll     : out std_logic_vector(63 downto 0);                    -- reconfig_to_pll
			pll_reconfig_0_reconfig_from_pll_reconfig_from_pll : in  std_logic_vector(63 downto 0) := (others => 'X'); -- reconfig_from_pll
			pll_0_reconfig_to_pll_reconfig_to_pll              : in  std_logic_vector(63 downto 0) := (others => 'X'); -- reconfig_to_pll
			pll_0_reconfig_from_pll_reconfig_from_pll          : out std_logic_vector(63 downto 0);                    -- reconfig_from_pll
			pll_0_locked_export                                : out std_logic;                                        -- export
			pll_reconfig_0_mgmt_avalon_slave_waitrequest       : out std_logic;                                        -- waitrequest
			pll_reconfig_0_mgmt_avalon_slave_read              : in  std_logic                     := 'X';             -- read
			pll_reconfig_0_mgmt_avalon_slave_write             : in  std_logic                     := 'X';             -- write
			pll_reconfig_0_mgmt_avalon_slave_readdata          : out std_logic_vector(31 downto 0);                    -- readdata
			pll_reconfig_0_mgmt_avalon_slave_address           : in  std_logic_vector(5 downto 0)  := (others => 'X'); -- address
			pll_reconfig_0_mgmt_avalon_slave_writedata         : in  std_logic_vector(31 downto 0) := (others => 'X')  -- writedata
		);
	end component system;

	u0 : component system
		port map (
			clk_clk                                            => CONNECTED_TO_clk_clk,                                            --                              clk.clk
			reset_reset_n                                      => CONNECTED_TO_reset_reset_n,                                      --                            reset.reset_n
			pll_reconfig_0_reconfig_to_pll_reconfig_to_pll     => CONNECTED_TO_pll_reconfig_0_reconfig_to_pll_reconfig_to_pll,     --   pll_reconfig_0_reconfig_to_pll.reconfig_to_pll
			pll_reconfig_0_reconfig_from_pll_reconfig_from_pll => CONNECTED_TO_pll_reconfig_0_reconfig_from_pll_reconfig_from_pll, -- pll_reconfig_0_reconfig_from_pll.reconfig_from_pll
			pll_0_reconfig_to_pll_reconfig_to_pll              => CONNECTED_TO_pll_0_reconfig_to_pll_reconfig_to_pll,              --            pll_0_reconfig_to_pll.reconfig_to_pll
			pll_0_reconfig_from_pll_reconfig_from_pll          => CONNECTED_TO_pll_0_reconfig_from_pll_reconfig_from_pll,          --          pll_0_reconfig_from_pll.reconfig_from_pll
			pll_0_locked_export                                => CONNECTED_TO_pll_0_locked_export,                                --                     pll_0_locked.export
			pll_reconfig_0_mgmt_avalon_slave_waitrequest       => CONNECTED_TO_pll_reconfig_0_mgmt_avalon_slave_waitrequest,       -- pll_reconfig_0_mgmt_avalon_slave.waitrequest
			pll_reconfig_0_mgmt_avalon_slave_read              => CONNECTED_TO_pll_reconfig_0_mgmt_avalon_slave_read,              --                                 .read
			pll_reconfig_0_mgmt_avalon_slave_write             => CONNECTED_TO_pll_reconfig_0_mgmt_avalon_slave_write,             --                                 .write
			pll_reconfig_0_mgmt_avalon_slave_readdata          => CONNECTED_TO_pll_reconfig_0_mgmt_avalon_slave_readdata,          --                                 .readdata
			pll_reconfig_0_mgmt_avalon_slave_address           => CONNECTED_TO_pll_reconfig_0_mgmt_avalon_slave_address,           --                                 .address
			pll_reconfig_0_mgmt_avalon_slave_writedata         => CONNECTED_TO_pll_reconfig_0_mgmt_avalon_slave_writedata          --                                 .writedata
		);

